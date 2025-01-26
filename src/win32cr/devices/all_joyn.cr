require "./../foundation.cr"
require "./../security.cr"

module Win32cr::Devices::AllJoyn
  alias Alljoyn_aboutdata = LibC::IntPtrT
  alias Alljoyn_aboutdatalistener = LibC::IntPtrT
  alias Alljoyn_aboutlistener = LibC::IntPtrT
  alias Alljoyn_aboutobj = LibC::IntPtrT
  alias Alljoyn_aboutobjectdescription = LibC::IntPtrT
  alias Alljoyn_aboutproxy = LibC::IntPtrT
  alias Alljoyn_applicationstatelistener = LibC::IntPtrT
  alias Alljoyn_authlistener = LibC::IntPtrT
  alias Alljoyn_autopinger = LibC::IntPtrT
  alias Alljoyn_busattachment = LibC::IntPtrT
  alias Alljoyn_buslistener = LibC::IntPtrT
  alias Alljoyn_busobject = LibC::IntPtrT
  alias Alljoyn_credentials = LibC::IntPtrT
  alias Alljoyn_interfacedescription = LibC::IntPtrT
  alias Alljoyn_keystore = LibC::IntPtrT
  alias Alljoyn_keystorelistener = LibC::IntPtrT
  alias Alljoyn_message = LibC::IntPtrT
  alias Alljoyn_msgarg = LibC::IntPtrT
  alias Alljoyn_observer = LibC::IntPtrT
  alias Alljoyn_observerlistener = LibC::IntPtrT
  alias Alljoyn_permissionconfigurationlistener = LibC::IntPtrT
  alias Alljoyn_permissionconfigurator = LibC::IntPtrT
  alias Alljoyn_pinglistener = LibC::IntPtrT
  alias Alljoyn_proxybusobject = LibC::IntPtrT
  alias Alljoyn_proxybusobject_ref = LibC::IntPtrT
  alias Alljoyn_securityapplicationproxy = LibC::IntPtrT
  alias Alljoyn_sessionlistener = LibC::IntPtrT
  alias Alljoyn_sessionopts = LibC::IntPtrT
  alias Alljoyn_sessionportlistener = LibC::IntPtrT
  alias Alljoyn_applicationstatelistener_state_ptr = Proc(Int8*, Int8*, Win32cr::Devices::AllJoyn::Alljoyn_applicationstate, Void*, Void)

  alias Alljoyn_keystorelistener_loadrequest_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener, Win32cr::Devices::AllJoyn::Alljoyn_keystore, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_keystorelistener_storerequest_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener, Win32cr::Devices::AllJoyn::Alljoyn_keystore, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_keystorelistener_acquireexclusivelock_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_keystorelistener_releaseexclusivelock_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener, Void)

  alias Alljoyn_authlistener_requestcredentials_ptr = Proc(Void*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt16, Win32cr::Foundation::PSTR, UInt16, Win32cr::Devices::AllJoyn::Alljoyn_credentials, Int32)

  alias Alljoyn_authlistener_requestcredentialsasync_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_authlistener, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt16, Win32cr::Foundation::PSTR, UInt16, Void*, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_authlistener_verifycredentials_ptr = Proc(Void*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Devices::AllJoyn::Alljoyn_credentials, Int32)

  alias Alljoyn_authlistener_verifycredentialsasync_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_authlistener, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Devices::AllJoyn::Alljoyn_credentials, Void*, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_authlistener_securityviolation_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::QStatus, Win32cr::Devices::AllJoyn::Alljoyn_message, Void)

  alias Alljoyn_authlistener_authenticationcomplete_ptr = Proc(Void*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Int32, Void)

  alias Alljoyn_buslistener_listener_registered_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_busattachment, Void)

  alias Alljoyn_buslistener_listener_unregistered_ptr = Proc(Void*, Void)

  alias Alljoyn_buslistener_found_advertised_name_ptr = Proc(Void*, Win32cr::Foundation::PSTR, UInt16, Win32cr::Foundation::PSTR, Void)

  alias Alljoyn_buslistener_lost_advertised_name_ptr = Proc(Void*, Win32cr::Foundation::PSTR, UInt16, Win32cr::Foundation::PSTR, Void)

  alias Alljoyn_buslistener_name_owner_changed_ptr = Proc(Void*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Void)

  alias Alljoyn_buslistener_bus_stopping_ptr = Proc(Void*, Void)

  alias Alljoyn_buslistener_bus_disconnected_ptr = Proc(Void*, Void)

  alias Alljoyn_buslistener_bus_prop_changed_ptr = Proc(Void*, Win32cr::Foundation::PSTR, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Void)

  alias Alljoyn_interfacedescription_translation_callback_ptr = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR)

  alias Alljoyn_messagereceiver_methodhandler_ptr = Proc(Win32cr::Devices::AllJoyn::Alljoyn_busobject, Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member*, Win32cr::Devices::AllJoyn::Alljoyn_message, Void)

  alias Alljoyn_messagereceiver_replyhandler_ptr = Proc(Win32cr::Devices::AllJoyn::Alljoyn_message, Void*, Void)

  alias Alljoyn_messagereceiver_signalhandler_ptr = Proc(Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member*, Win32cr::Foundation::PSTR, Win32cr::Devices::AllJoyn::Alljoyn_message, Void)

  alias Alljoyn_busobject_prop_get_ptr = Proc(Void*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_busobject_prop_set_ptr = Proc(Void*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_busobject_object_registration_ptr = Proc(Void*, Void)

  alias Alljoyn_proxybusobject_listener_introspectcb_ptr = Proc(Win32cr::Devices::AllJoyn::QStatus, Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, Void*, Void)

  alias Alljoyn_proxybusobject_listener_getpropertycb_ptr = Proc(Win32cr::Devices::AllJoyn::QStatus, Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Void*, Void)

  alias Alljoyn_proxybusobject_listener_getallpropertiescb_ptr = Proc(Win32cr::Devices::AllJoyn::QStatus, Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Void*, Void)

  alias Alljoyn_proxybusobject_listener_setpropertycb_ptr = Proc(Win32cr::Devices::AllJoyn::QStatus, Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, Void*, Void)

  alias Alljoyn_proxybusobject_listener_propertieschanged_ptr = Proc(Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, Win32cr::Foundation::PSTR, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Void*, Void)

  alias Alljoyn_permissionconfigurationlistener_factoryreset_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_permissionconfigurationlistener_policychanged_ptr = Proc(Void*, Void)

  alias Alljoyn_permissionconfigurationlistener_startmanagement_ptr = Proc(Void*, Void)

  alias Alljoyn_permissionconfigurationlistener_endmanagement_ptr = Proc(Void*, Void)

  alias Alljoyn_sessionlistener_sessionlost_ptr = Proc(Void*, UInt32, Win32cr::Devices::AllJoyn::Alljoyn_sessionlostreason, Void)

  alias Alljoyn_sessionlistener_sessionmemberadded_ptr = Proc(Void*, UInt32, Win32cr::Foundation::PSTR, Void)

  alias Alljoyn_sessionlistener_sessionmemberremoved_ptr = Proc(Void*, UInt32, Win32cr::Foundation::PSTR, Void)

  alias Alljoyn_sessionportlistener_acceptsessionjoiner_ptr = Proc(Void*, UInt16, Win32cr::Foundation::PSTR, Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, Int32)

  alias Alljoyn_sessionportlistener_sessionjoined_ptr = Proc(Void*, UInt16, UInt32, Win32cr::Foundation::PSTR, Void)

  alias Alljoyn_about_announced_ptr = Proc(Void*, Win32cr::Foundation::PSTR, UInt16, UInt16, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Void)

  alias Alljoyn_busattachment_joinsessioncb_ptr = Proc(Win32cr::Devices::AllJoyn::QStatus, UInt32, Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, Void*, Void)

  alias Alljoyn_busattachment_setlinktimeoutcb_ptr = Proc(Win32cr::Devices::AllJoyn::QStatus, UInt32, Void*, Void)

  alias Alljoyn_aboutdatalistener_getaboutdata_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Win32cr::Foundation::PSTR, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_aboutdatalistener_getannouncedaboutdata_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_msgarg, Win32cr::Devices::AllJoyn::QStatus)

  alias Alljoyn_autopinger_destination_lost_ptr = Proc(Void*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Void)

  alias Alljoyn_autopinger_destination_found_ptr = Proc(Void*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Void)

  alias Alljoyn_observer_object_discovered_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref, Void)

  alias Alljoyn_observer_object_lost_ptr = Proc(Void*, Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref, Void)

  QCC_TRUE = 1_u32
  QCC_FALSE = 0_u32
  ALLJOYN_MESSAGE_FLAG_NO_REPLY_EXPECTED = 1_u32
  ALLJOYN_MESSAGE_FLAG_AUTO_START = 2_u32
  ALLJOYN_MESSAGE_FLAG_ALLOW_REMOTE_MSG = 4_u32
  ALLJOYN_MESSAGE_FLAG_SESSIONLESS = 16_u32
  ALLJOYN_MESSAGE_FLAG_GLOBAL_BROADCAST = 32_u32
  ALLJOYN_MESSAGE_FLAG_ENCRYPTED = 128_u32
  ALLJOYN_TRAFFIC_TYPE_MESSAGES = 1_u32
  ALLJOYN_TRAFFIC_TYPE_RAW_UNRELIABLE = 2_u32
  ALLJOYN_TRAFFIC_TYPE_RAW_RELIABLE = 4_u32
  ALLJOYN_PROXIMITY_ANY = 255_u32
  ALLJOYN_PROXIMITY_PHYSICAL = 1_u32
  ALLJOYN_PROXIMITY_NETWORK = 2_u32
  ALLJOYN_NAMED_PIPE_CONNECT_SPEC = "npipe:"
  ALLJOYN_READ_READY = 1_u32
  ALLJOYN_WRITE_READY = 2_u32
  ALLJOYN_DISCONNECTED = 4_u32
  ALLJOYN_LITTLE_ENDIAN = 108
  ALLJOYN_BIG_ENDIAN = 66
  ALLJOYN_MESSAGE_DEFAULT_TIMEOUT = 25000_u32
  ALLJOYN_CRED_PASSWORD = 1_u16
  ALLJOYN_CRED_USER_NAME = 2_u16
  ALLJOYN_CRED_CERT_CHAIN = 4_u16
  ALLJOYN_CRED_PRIVATE_KEY = 8_u16
  ALLJOYN_CRED_LOGON_ENTRY = 16_u16
  ALLJOYN_CRED_EXPIRATION = 32_u16
  ALLJOYN_CRED_NEW_PASSWORD = 4097_u16
  ALLJOYN_CRED_ONE_TIME_PWD = 8193_u16
  ALLJOYN_PROP_ACCESS_READ = 1
  ALLJOYN_PROP_ACCESS_WRITE = 2
  ALLJOYN_PROP_ACCESS_RW = 3
  ALLJOYN_MEMBER_ANNOTATE_NO_REPLY = 1
  ALLJOYN_MEMBER_ANNOTATE_DEPRECATED = 2
  ALLJOYN_MEMBER_ANNOTATE_SESSIONCAST = 4
  ALLJOYN_MEMBER_ANNOTATE_SESSIONLESS = 8
  ALLJOYN_MEMBER_ANNOTATE_UNICAST = 16
  ALLJOYN_MEMBER_ANNOTATE_GLOBAL_BROADCAST = 32

  enum Alljoyn_about_announceflag
    UNANNOUNCED = 0_i32
    ANNOUNCED = 1_i32
  end
  enum QStatus
    ER_OK = 0_i32
    ER_FAIL = 1_i32
    ER_UTF_CONVERSION_FAILED = 2_i32
    ER_BUFFER_TOO_SMALL = 3_i32
    ER_OS_ERROR = 4_i32
    ER_OUT_OF_MEMORY = 5_i32
    ER_SOCKET_BIND_ERROR = 6_i32
    ER_INIT_FAILED = 7_i32
    ER_WOULDBLOCK = 8_i32
    ER_NOT_IMPLEMENTED = 9_i32
    ER_TIMEOUT = 10_i32
    ER_SOCK_OTHER_END_CLOSED = 11_i32
    ER_BAD_ARG_1 = 12_i32
    ER_BAD_ARG_2 = 13_i32
    ER_BAD_ARG_3 = 14_i32
    ER_BAD_ARG_4 = 15_i32
    ER_BAD_ARG_5 = 16_i32
    ER_BAD_ARG_6 = 17_i32
    ER_BAD_ARG_7 = 18_i32
    ER_BAD_ARG_8 = 19_i32
    ER_INVALID_ADDRESS = 20_i32
    ER_INVALID_DATA = 21_i32
    ER_READ_ERROR = 22_i32
    ER_WRITE_ERROR = 23_i32
    ER_OPEN_FAILED = 24_i32
    ER_PARSE_ERROR = 25_i32
    ER_END_OF_DATA = 26_i32
    ER_CONN_REFUSED = 27_i32
    ER_BAD_ARG_COUNT = 28_i32
    ER_WARNING = 29_i32
    ER_EOF = 30_i32
    ER_DEADLOCK = 31_i32
    ER_COMMON_ERRORS = 4096_i32
    ER_STOPPING_THREAD = 4097_i32
    ER_ALERTED_THREAD = 4098_i32
    ER_XML_MALFORMED = 4099_i32
    ER_AUTH_FAIL = 4100_i32
    ER_AUTH_USER_REJECT = 4101_i32
    ER_NO_SUCH_ALARM = 4102_i32
    ER_TIMER_FALLBEHIND = 4103_i32
    ER_SSL_ERRORS = 4104_i32
    ER_SSL_INIT = 4105_i32
    ER_SSL_CONNECT = 4106_i32
    ER_SSL_VERIFY = 4107_i32
    ER_EXTERNAL_THREAD = 4108_i32
    ER_CRYPTO_ERROR = 4109_i32
    ER_CRYPTO_TRUNCATED = 4110_i32
    ER_CRYPTO_KEY_UNAVAILABLE = 4111_i32
    ER_BAD_HOSTNAME = 4112_i32
    ER_CRYPTO_KEY_UNUSABLE = 4113_i32
    ER_EMPTY_KEY_BLOB = 4114_i32
    ER_CORRUPT_KEYBLOB = 4115_i32
    ER_INVALID_KEY_ENCODING = 4116_i32
    ER_DEAD_THREAD = 4117_i32
    ER_THREAD_RUNNING = 4118_i32
    ER_THREAD_STOPPING = 4119_i32
    ER_BAD_STRING_ENCODING = 4120_i32
    ER_CRYPTO_INSUFFICIENT_SECURITY = 4121_i32
    ER_CRYPTO_ILLEGAL_PARAMETERS = 4122_i32
    ER_CRYPTO_HASH_UNINITIALIZED = 4123_i32
    ER_THREAD_NO_WAIT = 4124_i32
    ER_TIMER_EXITING = 4125_i32
    ER_INVALID_GUID = 4126_i32
    ER_THREADPOOL_EXHAUSTED = 4127_i32
    ER_THREADPOOL_STOPPING = 4128_i32
    ER_INVALID_STREAM = 4129_i32
    ER_TIMER_FULL = 4130_i32
    ER_IODISPATCH_STOPPING = 4131_i32
    ER_SLAP_INVALID_PACKET_LEN = 4132_i32
    ER_SLAP_HDR_CHECKSUM_ERROR = 4133_i32
    ER_SLAP_INVALID_PACKET_TYPE = 4134_i32
    ER_SLAP_LEN_MISMATCH = 4135_i32
    ER_SLAP_PACKET_TYPE_MISMATCH = 4136_i32
    ER_SLAP_CRC_ERROR = 4137_i32
    ER_SLAP_ERROR = 4138_i32
    ER_SLAP_OTHER_END_CLOSED = 4139_i32
    ER_TIMER_NOT_ALLOWED = 4140_i32
    ER_NOT_CONN = 4141_i32
    ER_XML_CONVERTER_ERROR = 8192_i32
    ER_XML_INVALID_RULES_COUNT = 8193_i32
    ER_XML_INTERFACE_MEMBERS_MISSING = 8194_i32
    ER_XML_INVALID_MEMBER_TYPE = 8195_i32
    ER_XML_INVALID_MEMBER_ACTION = 8196_i32
    ER_XML_MEMBER_DENY_ACTION_WITH_OTHER = 8197_i32
    ER_XML_INVALID_ANNOTATIONS_COUNT = 8198_i32
    ER_XML_INVALID_ELEMENT_NAME = 8199_i32
    ER_XML_INVALID_ATTRIBUTE_VALUE = 8200_i32
    ER_XML_INVALID_SECURITY_LEVEL_ANNOTATION_VALUE = 8201_i32
    ER_XML_INVALID_ELEMENT_CHILDREN_COUNT = 8202_i32
    ER_XML_INVALID_POLICY_VERSION = 8203_i32
    ER_XML_INVALID_POLICY_SERIAL_NUMBER = 8204_i32
    ER_XML_INVALID_ACL_PEER_TYPE = 8205_i32
    ER_XML_INVALID_ACL_PEER_CHILDREN_COUNT = 8206_i32
    ER_XML_ACL_ALL_TYPE_PEER_WITH_OTHERS = 8207_i32
    ER_XML_INVALID_ACL_PEER_PUBLIC_KEY = 8208_i32
    ER_XML_ACL_PEER_NOT_UNIQUE = 8209_i32
    ER_XML_ACL_PEER_PUBLIC_KEY_SET = 8210_i32
    ER_XML_ACLS_MISSING = 8211_i32
    ER_XML_ACL_PEERS_MISSING = 8212_i32
    ER_XML_INVALID_OBJECT_PATH = 8213_i32
    ER_XML_INVALID_INTERFACE_NAME = 8214_i32
    ER_XML_INVALID_MEMBER_NAME = 8215_i32
    ER_XML_INVALID_MANIFEST_VERSION = 8216_i32
    ER_XML_INVALID_OID = 8217_i32
    ER_XML_INVALID_BASE64 = 8218_i32
    ER_XML_INTERFACE_NAME_NOT_UNIQUE = 8219_i32
    ER_XML_MEMBER_NAME_NOT_UNIQUE = 8220_i32
    ER_XML_OBJECT_PATH_NOT_UNIQUE = 8221_i32
    ER_XML_ANNOTATION_NOT_UNIQUE = 8222_i32
    ER_NONE = 65535_i32
    ER_BUS_ERRORS = 36864_i32
    ER_BUS_READ_ERROR = 36865_i32
    ER_BUS_WRITE_ERROR = 36866_i32
    ER_BUS_BAD_VALUE_TYPE = 36867_i32
    ER_BUS_BAD_HEADER_FIELD = 36868_i32
    ER_BUS_BAD_SIGNATURE = 36869_i32
    ER_BUS_BAD_OBJ_PATH = 36870_i32
    ER_BUS_BAD_MEMBER_NAME = 36871_i32
    ER_BUS_BAD_INTERFACE_NAME = 36872_i32
    ER_BUS_BAD_ERROR_NAME = 36873_i32
    ER_BUS_BAD_BUS_NAME = 36874_i32
    ER_BUS_NAME_TOO_LONG = 36875_i32
    ER_BUS_BAD_LENGTH = 36876_i32
    ER_BUS_BAD_VALUE = 36877_i32
    ER_BUS_BAD_HDR_FLAGS = 36878_i32
    ER_BUS_BAD_BODY_LEN = 36879_i32
    ER_BUS_BAD_HEADER_LEN = 36880_i32
    ER_BUS_UNKNOWN_SERIAL = 36881_i32
    ER_BUS_UNKNOWN_PATH = 36882_i32
    ER_BUS_UNKNOWN_INTERFACE = 36883_i32
    ER_BUS_ESTABLISH_FAILED = 36884_i32
    ER_BUS_UNEXPECTED_SIGNATURE = 36885_i32
    ER_BUS_INTERFACE_MISSING = 36886_i32
    ER_BUS_PATH_MISSING = 36887_i32
    ER_BUS_MEMBER_MISSING = 36888_i32
    ER_BUS_REPLY_SERIAL_MISSING = 36889_i32
    ER_BUS_ERROR_NAME_MISSING = 36890_i32
    ER_BUS_INTERFACE_NO_SUCH_MEMBER = 36891_i32
    ER_BUS_NO_SUCH_OBJECT = 36892_i32
    ER_BUS_OBJECT_NO_SUCH_MEMBER = 36893_i32
    ER_BUS_OBJECT_NO_SUCH_INTERFACE = 36894_i32
    ER_BUS_NO_SUCH_INTERFACE = 36895_i32
    ER_BUS_MEMBER_NO_SUCH_SIGNATURE = 36896_i32
    ER_BUS_NOT_NUL_TERMINATED = 36897_i32
    ER_BUS_NO_SUCH_PROPERTY = 36898_i32
    ER_BUS_SET_WRONG_SIGNATURE = 36899_i32
    ER_BUS_PROPERTY_VALUE_NOT_SET = 36900_i32
    ER_BUS_PROPERTY_ACCESS_DENIED = 36901_i32
    ER_BUS_NO_TRANSPORTS = 36902_i32
    ER_BUS_BAD_TRANSPORT_ARGS = 36903_i32
    ER_BUS_NO_ROUTE = 36904_i32
    ER_BUS_NO_ENDPOINT = 36905_i32
    ER_BUS_BAD_SEND_PARAMETER = 36906_i32
    ER_BUS_UNMATCHED_REPLY_SERIAL = 36907_i32
    ER_BUS_BAD_SENDER_ID = 36908_i32
    ER_BUS_TRANSPORT_NOT_STARTED = 36909_i32
    ER_BUS_EMPTY_MESSAGE = 36910_i32
    ER_BUS_NOT_OWNER = 36911_i32
    ER_BUS_SET_PROPERTY_REJECTED = 36912_i32
    ER_BUS_CONNECT_FAILED = 36913_i32
    ER_BUS_REPLY_IS_ERROR_MESSAGE = 36914_i32
    ER_BUS_NOT_AUTHENTICATING = 36915_i32
    ER_BUS_NO_LISTENER = 36916_i32
    ER_BUS_NOT_ALLOWED = 36918_i32
    ER_BUS_WRITE_QUEUE_FULL = 36919_i32
    ER_BUS_ENDPOINT_CLOSING = 36920_i32
    ER_BUS_INTERFACE_MISMATCH = 36921_i32
    ER_BUS_MEMBER_ALREADY_EXISTS = 36922_i32
    ER_BUS_PROPERTY_ALREADY_EXISTS = 36923_i32
    ER_BUS_IFACE_ALREADY_EXISTS = 36924_i32
    ER_BUS_ERROR_RESPONSE = 36925_i32
    ER_BUS_BAD_XML = 36926_i32
    ER_BUS_BAD_CHILD_PATH = 36927_i32
    ER_BUS_OBJ_ALREADY_EXISTS = 36928_i32
    ER_BUS_OBJ_NOT_FOUND = 36929_i32
    ER_BUS_CANNOT_EXPAND_MESSAGE = 36930_i32
    ER_BUS_NOT_COMPRESSED = 36931_i32
    ER_BUS_ALREADY_CONNECTED = 36932_i32
    ER_BUS_NOT_CONNECTED = 36933_i32
    ER_BUS_ALREADY_LISTENING = 36934_i32
    ER_BUS_KEY_UNAVAILABLE = 36935_i32
    ER_BUS_TRUNCATED = 36936_i32
    ER_BUS_KEY_STORE_NOT_LOADED = 36937_i32
    ER_BUS_NO_AUTHENTICATION_MECHANISM = 36938_i32
    ER_BUS_BUS_ALREADY_STARTED = 36939_i32
    ER_BUS_BUS_NOT_STARTED = 36940_i32
    ER_BUS_KEYBLOB_OP_INVALID = 36941_i32
    ER_BUS_INVALID_HEADER_CHECKSUM = 36942_i32
    ER_BUS_MESSAGE_NOT_ENCRYPTED = 36943_i32
    ER_BUS_INVALID_HEADER_SERIAL = 36944_i32
    ER_BUS_TIME_TO_LIVE_EXPIRED = 36945_i32
    ER_BUS_HDR_EXPANSION_INVALID = 36946_i32
    ER_BUS_MISSING_COMPRESSION_TOKEN = 36947_i32
    ER_BUS_NO_PEER_GUID = 36948_i32
    ER_BUS_MESSAGE_DECRYPTION_FAILED = 36949_i32
    ER_BUS_SECURITY_FATAL = 36950_i32
    ER_BUS_KEY_EXPIRED = 36951_i32
    ER_BUS_CORRUPT_KEYSTORE = 36952_i32
    ER_BUS_NO_CALL_FOR_REPLY = 36953_i32
    ER_BUS_NOT_A_COMPLETE_TYPE = 36954_i32
    ER_BUS_POLICY_VIOLATION = 36955_i32
    ER_BUS_NO_SUCH_SERVICE = 36956_i32
    ER_BUS_TRANSPORT_NOT_AVAILABLE = 36957_i32
    ER_BUS_INVALID_AUTH_MECHANISM = 36958_i32
    ER_BUS_KEYSTORE_VERSION_MISMATCH = 36959_i32
    ER_BUS_BLOCKING_CALL_NOT_ALLOWED = 36960_i32
    ER_BUS_SIGNATURE_MISMATCH = 36961_i32
    ER_BUS_STOPPING = 36962_i32
    ER_BUS_METHOD_CALL_ABORTED = 36963_i32
    ER_BUS_CANNOT_ADD_INTERFACE = 36964_i32
    ER_BUS_CANNOT_ADD_HANDLER = 36965_i32
    ER_BUS_KEYSTORE_NOT_LOADED = 36966_i32
    ER_BUS_NO_SUCH_HANDLE = 36971_i32
    ER_BUS_HANDLES_NOT_ENABLED = 36972_i32
    ER_BUS_HANDLES_MISMATCH = 36973_i32
    ER_BUS_NO_SESSION = 36975_i32
    ER_BUS_ELEMENT_NOT_FOUND = 36976_i32
    ER_BUS_NOT_A_DICTIONARY = 36977_i32
    ER_BUS_WAIT_FAILED = 36978_i32
    ER_BUS_BAD_SESSION_OPTS = 36980_i32
    ER_BUS_CONNECTION_REJECTED = 36981_i32
    ER_DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER = 36982_i32
    ER_DBUS_REQUEST_NAME_REPLY_IN_QUEUE = 36983_i32
    ER_DBUS_REQUEST_NAME_REPLY_EXISTS = 36984_i32
    ER_DBUS_REQUEST_NAME_REPLY_ALREADY_OWNER = 36985_i32
    ER_DBUS_RELEASE_NAME_REPLY_RELEASED = 36986_i32
    ER_DBUS_RELEASE_NAME_REPLY_NON_EXISTENT = 36987_i32
    ER_DBUS_RELEASE_NAME_REPLY_NOT_OWNER = 36988_i32
    ER_DBUS_START_REPLY_ALREADY_RUNNING = 36990_i32
    ER_ALLJOYN_BINDSESSIONPORT_REPLY_ALREADY_EXISTS = 36992_i32
    ER_ALLJOYN_BINDSESSIONPORT_REPLY_FAILED = 36993_i32
    ER_ALLJOYN_JOINSESSION_REPLY_NO_SESSION = 36995_i32
    ER_ALLJOYN_JOINSESSION_REPLY_UNREACHABLE = 36996_i32
    ER_ALLJOYN_JOINSESSION_REPLY_CONNECT_FAILED = 36997_i32
    ER_ALLJOYN_JOINSESSION_REPLY_REJECTED = 36998_i32
    ER_ALLJOYN_JOINSESSION_REPLY_BAD_SESSION_OPTS = 36999_i32
    ER_ALLJOYN_JOINSESSION_REPLY_FAILED = 37000_i32
    ER_ALLJOYN_LEAVESESSION_REPLY_NO_SESSION = 37002_i32
    ER_ALLJOYN_LEAVESESSION_REPLY_FAILED = 37003_i32
    ER_ALLJOYN_ADVERTISENAME_REPLY_TRANSPORT_NOT_AVAILABLE = 37004_i32
    ER_ALLJOYN_ADVERTISENAME_REPLY_ALREADY_ADVERTISING = 37005_i32
    ER_ALLJOYN_ADVERTISENAME_REPLY_FAILED = 37006_i32
    ER_ALLJOYN_CANCELADVERTISENAME_REPLY_FAILED = 37008_i32
    ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_TRANSPORT_NOT_AVAILABLE = 37009_i32
    ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_ALREADY_DISCOVERING = 37010_i32
    ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_FAILED = 37011_i32
    ER_ALLJOYN_CANCELFINDADVERTISEDNAME_REPLY_FAILED = 37013_i32
    ER_BUS_UNEXPECTED_DISPOSITION = 37014_i32
    ER_BUS_INTERFACE_ACTIVATED = 37015_i32
    ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_BAD_PORT = 37016_i32
    ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_FAILED = 37017_i32
    ER_ALLJOYN_BINDSESSIONPORT_REPLY_INVALID_OPTS = 37018_i32
    ER_ALLJOYN_JOINSESSION_REPLY_ALREADY_JOINED = 37019_i32
    ER_BUS_SELF_CONNECT = 37020_i32
    ER_BUS_SECURITY_NOT_ENABLED = 37021_i32
    ER_BUS_LISTENER_ALREADY_SET = 37022_i32
    ER_BUS_PEER_AUTH_VERSION_MISMATCH = 37023_i32
    ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NOT_SUPPORTED = 37024_i32
    ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NO_DEST_SUPPORT = 37025_i32
    ER_ALLJOYN_SETLINKTIMEOUT_REPLY_FAILED = 37026_i32
    ER_ALLJOYN_ACCESS_PERMISSION_WARNING = 37027_i32
    ER_ALLJOYN_ACCESS_PERMISSION_ERROR = 37028_i32
    ER_BUS_DESTINATION_NOT_AUTHENTICATED = 37029_i32
    ER_BUS_ENDPOINT_REDIRECTED = 37030_i32
    ER_BUS_AUTHENTICATION_PENDING = 37031_i32
    ER_BUS_NOT_AUTHORIZED = 37032_i32
    ER_PACKET_BUS_NO_SUCH_CHANNEL = 37033_i32
    ER_PACKET_BAD_FORMAT = 37034_i32
    ER_PACKET_CONNECT_TIMEOUT = 37035_i32
    ER_PACKET_CHANNEL_FAIL = 37036_i32
    ER_PACKET_TOO_LARGE = 37037_i32
    ER_PACKET_BAD_PARAMETER = 37038_i32
    ER_PACKET_BAD_CRC = 37039_i32
    ER_RENDEZVOUS_SERVER_DEACTIVATED_USER = 37067_i32
    ER_RENDEZVOUS_SERVER_UNKNOWN_USER = 37068_i32
    ER_UNABLE_TO_CONNECT_TO_RENDEZVOUS_SERVER = 37069_i32
    ER_NOT_CONNECTED_TO_RENDEZVOUS_SERVER = 37070_i32
    ER_UNABLE_TO_SEND_MESSAGE_TO_RENDEZVOUS_SERVER = 37071_i32
    ER_INVALID_RENDEZVOUS_SERVER_INTERFACE_MESSAGE = 37072_i32
    ER_INVALID_PERSISTENT_CONNECTION_MESSAGE_RESPONSE = 37073_i32
    ER_INVALID_ON_DEMAND_CONNECTION_MESSAGE_RESPONSE = 37074_i32
    ER_INVALID_HTTP_METHOD_USED_FOR_RENDEZVOUS_SERVER_INTERFACE_MESSAGE = 37075_i32
    ER_RENDEZVOUS_SERVER_ERR500_INTERNAL_ERROR = 37076_i32
    ER_RENDEZVOUS_SERVER_ERR503_STATUS_UNAVAILABLE = 37077_i32
    ER_RENDEZVOUS_SERVER_ERR401_UNAUTHORIZED_REQUEST = 37078_i32
    ER_RENDEZVOUS_SERVER_UNRECOVERABLE_ERROR = 37079_i32
    ER_RENDEZVOUS_SERVER_ROOT_CERTIFICATE_UNINITIALIZED = 37080_i32
    ER_BUS_NO_SUCH_ANNOTATION = 37081_i32
    ER_BUS_ANNOTATION_ALREADY_EXISTS = 37082_i32
    ER_SOCK_CLOSING = 37083_i32
    ER_NO_SUCH_DEVICE = 37084_i32
    ER_P2P = 37085_i32
    ER_P2P_TIMEOUT = 37086_i32
    ER_P2P_NOT_CONNECTED = 37087_i32
    ER_BAD_TRANSPORT_MASK = 37088_i32
    ER_PROXIMITY_CONNECTION_ESTABLISH_FAIL = 37089_i32
    ER_PROXIMITY_NO_PEERS_FOUND = 37090_i32
    ER_BUS_OBJECT_NOT_REGISTERED = 37091_i32
    ER_P2P_DISABLED = 37092_i32
    ER_P2P_BUSY = 37093_i32
    ER_BUS_INCOMPATIBLE_DAEMON = 37094_i32
    ER_P2P_NO_GO = 37095_i32
    ER_P2P_NO_STA = 37096_i32
    ER_P2P_FORBIDDEN = 37097_i32
    ER_ALLJOYN_ONAPPSUSPEND_REPLY_FAILED = 37098_i32
    ER_ALLJOYN_ONAPPSUSPEND_REPLY_UNSUPPORTED = 37099_i32
    ER_ALLJOYN_ONAPPRESUME_REPLY_FAILED = 37100_i32
    ER_ALLJOYN_ONAPPRESUME_REPLY_UNSUPPORTED = 37101_i32
    ER_BUS_NO_SUCH_MESSAGE = 37102_i32
    ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_NO_SESSION = 37103_i32
    ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_BINDER = 37104_i32
    ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_MULTIPOINT = 37105_i32
    ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_FOUND = 37106_i32
    ER_ALLJOYN_REMOVESESSIONMEMBER_INCOMPATIBLE_REMOTE_DAEMON = 37107_i32
    ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_FAILED = 37108_i32
    ER_BUS_REMOVED_BY_BINDER = 37109_i32
    ER_BUS_MATCH_RULE_NOT_FOUND = 37110_i32
    ER_ALLJOYN_PING_FAILED = 37111_i32
    ER_ALLJOYN_PING_REPLY_UNREACHABLE = 37112_i32
    ER_UDP_MSG_TOO_LONG = 37113_i32
    ER_UDP_DEMUX_NO_ENDPOINT = 37114_i32
    ER_UDP_NO_NETWORK = 37115_i32
    ER_UDP_UNEXPECTED_LENGTH = 37116_i32
    ER_UDP_UNEXPECTED_FLOW = 37117_i32
    ER_UDP_DISCONNECT = 37118_i32
    ER_UDP_NOT_IMPLEMENTED = 37119_i32
    ER_UDP_NO_LISTENER = 37120_i32
    ER_UDP_STOPPING = 37121_i32
    ER_ARDP_BACKPRESSURE = 37122_i32
    ER_UDP_BACKPRESSURE = 37123_i32
    ER_ARDP_INVALID_STATE = 37124_i32
    ER_ARDP_TTL_EXPIRED = 37125_i32
    ER_ARDP_PERSIST_TIMEOUT = 37126_i32
    ER_ARDP_PROBE_TIMEOUT = 37127_i32
    ER_ARDP_REMOTE_CONNECTION_RESET = 37128_i32
    ER_UDP_BUSHELLO = 37129_i32
    ER_UDP_MESSAGE = 37130_i32
    ER_UDP_INVALID = 37131_i32
    ER_UDP_UNSUPPORTED = 37132_i32
    ER_UDP_ENDPOINT_STALLED = 37133_i32
    ER_ARDP_INVALID_RESPONSE = 37134_i32
    ER_ARDP_INVALID_CONNECTION = 37135_i32
    ER_UDP_LOCAL_DISCONNECT = 37136_i32
    ER_UDP_EARLY_EXIT = 37137_i32
    ER_UDP_LOCAL_DISCONNECT_FAIL = 37138_i32
    ER_ARDP_DISCONNECTING = 37139_i32
    ER_ALLJOYN_PING_REPLY_INCOMPATIBLE_REMOTE_ROUTING_NODE = 37140_i32
    ER_ALLJOYN_PING_REPLY_TIMEOUT = 37141_i32
    ER_ALLJOYN_PING_REPLY_UNKNOWN_NAME = 37142_i32
    ER_ALLJOYN_PING_REPLY_FAILED = 37143_i32
    ER_TCP_MAX_UNTRUSTED = 37144_i32
    ER_ALLJOYN_PING_REPLY_IN_PROGRESS = 37145_i32
    ER_LANGUAGE_NOT_SUPPORTED = 37146_i32
    ER_ABOUT_FIELD_ALREADY_SPECIFIED = 37147_i32
    ER_UDP_NOT_DISCONNECTED = 37148_i32
    ER_UDP_ENDPOINT_NOT_STARTED = 37149_i32
    ER_UDP_ENDPOINT_REMOVED = 37150_i32
    ER_ARDP_VERSION_NOT_SUPPORTED = 37151_i32
    ER_CONNECTION_LIMIT_EXCEEDED = 37152_i32
    ER_ARDP_WRITE_BLOCKED = 37153_i32
    ER_PERMISSION_DENIED = 37154_i32
    ER_ABOUT_DEFAULT_LANGUAGE_NOT_SPECIFIED = 37155_i32
    ER_ABOUT_SESSIONPORT_NOT_BOUND = 37156_i32
    ER_ABOUT_ABOUTDATA_MISSING_REQUIRED_FIELD = 37157_i32
    ER_ABOUT_INVALID_ABOUTDATA_LISTENER = 37158_i32
    ER_BUS_PING_GROUP_NOT_FOUND = 37159_i32
    ER_BUS_REMOVED_BY_BINDER_SELF = 37160_i32
    ER_INVALID_CONFIG = 37161_i32
    ER_ABOUT_INVALID_ABOUTDATA_FIELD_VALUE = 37162_i32
    ER_ABOUT_INVALID_ABOUTDATA_FIELD_APPID_SIZE = 37163_i32
    ER_BUS_TRANSPORT_ACCESS_DENIED = 37164_i32
    ER_INVALID_CERTIFICATE = 37165_i32
    ER_CERTIFICATE_NOT_FOUND = 37166_i32
    ER_DUPLICATE_CERTIFICATE = 37167_i32
    ER_UNKNOWN_CERTIFICATE = 37168_i32
    ER_MISSING_DIGEST_IN_CERTIFICATE = 37169_i32
    ER_DIGEST_MISMATCH = 37170_i32
    ER_DUPLICATE_KEY = 37171_i32
    ER_NO_COMMON_TRUST = 37172_i32
    ER_MANIFEST_NOT_FOUND = 37173_i32
    ER_INVALID_CERT_CHAIN = 37174_i32
    ER_NO_TRUST_ANCHOR = 37175_i32
    ER_INVALID_APPLICATION_STATE = 37176_i32
    ER_FEATURE_NOT_AVAILABLE = 37177_i32
    ER_KEY_STORE_ALREADY_INITIALIZED = 37178_i32
    ER_KEY_STORE_ID_NOT_YET_SET = 37179_i32
    ER_POLICY_NOT_NEWER = 37180_i32
    ER_MANIFEST_REJECTED = 37181_i32
    ER_INVALID_CERTIFICATE_USAGE = 37182_i32
    ER_INVALID_SIGNAL_EMISSION_TYPE = 37183_i32
    ER_APPLICATION_STATE_LISTENER_ALREADY_EXISTS = 37184_i32
    ER_APPLICATION_STATE_LISTENER_NO_SUCH_LISTENER = 37185_i32
    ER_MANAGEMENT_ALREADY_STARTED = 37186_i32
    ER_MANAGEMENT_NOT_STARTED = 37187_i32
    ER_BUS_DESCRIPTION_ALREADY_EXISTS = 37188_i32
  end
  enum Alljoyn_typeid
    ALLJOYN_INVALID = 0_i32
    ALLJOYN_ARRAY = 97_i32
    ALLJOYN_BOOLEAN = 98_i32
    ALLJOYN_DOUBLE = 100_i32
    ALLJOYN_DICT_ENTRY = 101_i32
    ALLJOYN_SIGNATURE = 103_i32
    ALLJOYN_HANDLE = 104_i32
    ALLJOYN_INT32 = 105_i32
    ALLJOYN_INT16 = 110_i32
    ALLJOYN_OBJECT_PATH = 111_i32
    ALLJOYN_UINT16 = 113_i32
    ALLJOYN_STRUCT = 114_i32
    ALLJOYN_STRING = 115_i32
    ALLJOYN_UINT64 = 116_i32
    ALLJOYN_UINT32 = 117_i32
    ALLJOYN_VARIANT = 118_i32
    ALLJOYN_INT64 = 120_i32
    ALLJOYN_BYTE = 121_i32
    ALLJOYN_STRUCT_OPEN = 40_i32
    ALLJOYN_STRUCT_CLOSE = 41_i32
    ALLJOYN_DICT_ENTRY_OPEN = 123_i32
    ALLJOYN_DICT_ENTRY_CLOSE = 125_i32
    ALLJOYN_BOOLEAN_ARRAY = 25185_i32
    ALLJOYN_DOUBLE_ARRAY = 25697_i32
    ALLJOYN_INT32_ARRAY = 26977_i32
    ALLJOYN_INT16_ARRAY = 28257_i32
    ALLJOYN_UINT16_ARRAY = 29025_i32
    ALLJOYN_UINT64_ARRAY = 29793_i32
    ALLJOYN_UINT32_ARRAY = 30049_i32
    ALLJOYN_INT64_ARRAY = 30817_i32
    ALLJOYN_BYTE_ARRAY = 31073_i32
    ALLJOYN_WILDCARD = 42_i32
  end
  enum Alljoyn_applicationstate
    NOT_CLAIMABLE = 0_i32
    CLAIMABLE = 1_i32
    CLAIMED = 2_i32
    NEED_UPDATE = 3_i32
  end
  enum Alljoyn_claimcapability_masks
    CAPABLE_ECDHE_NULL = 1_i32
    CAPABLE_ECDHE_ECDSA = 4_i32
    CAPABLE_ECDHE_SPEKE = 8_i32
  end
  enum Alljoyn_claimcapabilityadditionalinfo_masks
    PASSWORD_GENERATED_BY_SECURITY_MANAGER = 1_i32
    PASSWORD_GENERATED_BY_APPLICATION = 2_i32
  end
  enum Alljoyn_messagetype
    ALLJOYN_MESSAGE_INVALID = 0_i32
    ALLJOYN_MESSAGE_METHOD_CALL = 1_i32
    ALLJOYN_MESSAGE_METHOD_RET = 2_i32
    ALLJOYN_MESSAGE_ERROR = 3_i32
    ALLJOYN_MESSAGE_SIGNAL = 4_i32
  end
  enum Alljoyn_interfacedescription_securitypolicy
    AJ_IFC_SECURITY_INHERIT = 0_i32
    AJ_IFC_SECURITY_REQUIRED = 1_i32
    AJ_IFC_SECURITY_OFF = 2_i32
  end
  enum Alljoyn_sessionlostreason
    ALLJOYN_SESSIONLOST_INVALID = 0_i32
    ALLJOYN_SESSIONLOST_REMOTE_END_LEFT_SESSION = 1_i32
    ALLJOYN_SESSIONLOST_REMOTE_END_CLOSED_ABRUPTLY = 2_i32
    ALLJOYN_SESSIONLOST_REMOVED_BY_BINDER = 3_i32
    ALLJOYN_SESSIONLOST_LINK_TIMEOUT = 4_i32
    ALLJOYN_SESSIONLOST_REASON_OTHER = 5_i32
  end

  @[Extern]
  struct Alljoyn_abouticon_handle_
    def initialize()
    end
  end

  @[Extern]
  struct Alljoyn_certificateid
    property serial : UInt8*
    property serialLen : LibC::UIntPtrT
    property issuerPublicKey : Int8*
    property issuerAki : UInt8*
    property issuerAkiLen : LibC::UIntPtrT
    def initialize(@serial : UInt8*, @serialLen : LibC::UIntPtrT, @issuerPublicKey : Int8*, @issuerAki : UInt8*, @issuerAkiLen : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct Alljoyn_certificateidarray
    property count : LibC::UIntPtrT
    property ids : Win32cr::Devices::AllJoyn::Alljoyn_certificateid*
    def initialize(@count : LibC::UIntPtrT, @ids : Win32cr::Devices::AllJoyn::Alljoyn_certificateid*)
    end
  end

  @[Extern]
  struct Alljoyn_manifestarray
    property count : LibC::UIntPtrT
    property xmls : Int8**
    def initialize(@count : LibC::UIntPtrT, @xmls : Int8**)
    end
  end

  @[Extern]
  struct Alljoyn_applicationstatelistener_callbacks
    property state : Win32cr::Devices::AllJoyn::Alljoyn_applicationstatelistener_state_ptr
    def initialize(@state : Win32cr::Devices::AllJoyn::Alljoyn_applicationstatelistener_state_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_keystorelistener_callbacks
    property load_request : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_loadrequest_ptr
    property store_request : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_storerequest_ptr
    def initialize(@load_request : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_loadrequest_ptr, @store_request : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_storerequest_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_keystorelistener_with_synchronization_callbacks
    property load_request : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_loadrequest_ptr
    property store_request : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_storerequest_ptr
    property acquire_exclusive_lock : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_acquireexclusivelock_ptr
    property release_exclusive_lock : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_releaseexclusivelock_ptr
    def initialize(@load_request : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_loadrequest_ptr, @store_request : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_storerequest_ptr, @acquire_exclusive_lock : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_acquireexclusivelock_ptr, @release_exclusive_lock : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_releaseexclusivelock_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_authlistener_callbacks
    property request_credentials : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_requestcredentials_ptr
    property verify_credentials : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_verifycredentials_ptr
    property security_violation : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_securityviolation_ptr
    property authentication_complete : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_authenticationcomplete_ptr
    def initialize(@request_credentials : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_requestcredentials_ptr, @verify_credentials : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_verifycredentials_ptr, @security_violation : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_securityviolation_ptr, @authentication_complete : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_authenticationcomplete_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_authlistenerasync_callbacks
    property request_credentials : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_requestcredentialsasync_ptr
    property verify_credentials : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_verifycredentialsasync_ptr
    property security_violation : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_securityviolation_ptr
    property authentication_complete : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_authenticationcomplete_ptr
    def initialize(@request_credentials : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_requestcredentialsasync_ptr, @verify_credentials : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_verifycredentialsasync_ptr, @security_violation : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_securityviolation_ptr, @authentication_complete : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_authenticationcomplete_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_buslistener_callbacks
    property listener_registered : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_listener_registered_ptr
    property listener_unregistered : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_listener_unregistered_ptr
    property found_advertised_name : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_found_advertised_name_ptr
    property lost_advertised_name : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_lost_advertised_name_ptr
    property name_owner_changed : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_name_owner_changed_ptr
    property bus_stopping : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_bus_stopping_ptr
    property bus_disconnected : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_bus_disconnected_ptr
    property property_changed : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_bus_prop_changed_ptr
    def initialize(@listener_registered : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_listener_registered_ptr, @listener_unregistered : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_listener_unregistered_ptr, @found_advertised_name : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_found_advertised_name_ptr, @lost_advertised_name : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_lost_advertised_name_ptr, @name_owner_changed : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_name_owner_changed_ptr, @bus_stopping : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_bus_stopping_ptr, @bus_disconnected : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_bus_disconnected_ptr, @property_changed : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_bus_prop_changed_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_interfacedescription_member
    property iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription
    property memberType : Win32cr::Devices::AllJoyn::Alljoyn_messagetype
    property name : Win32cr::Foundation::PSTR
    property signature : Win32cr::Foundation::PSTR
    property returnSignature : Win32cr::Foundation::PSTR
    property argNames : Win32cr::Foundation::PSTR
    property internal_member : Void*
    def initialize(@iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, @memberType : Win32cr::Devices::AllJoyn::Alljoyn_messagetype, @name : Win32cr::Foundation::PSTR, @signature : Win32cr::Foundation::PSTR, @returnSignature : Win32cr::Foundation::PSTR, @argNames : Win32cr::Foundation::PSTR, @internal_member : Void*)
    end
  end

  @[Extern]
  struct Alljoyn_interfacedescription_property
    property name : Win32cr::Foundation::PSTR
    property signature : Win32cr::Foundation::PSTR
    property access : UInt8
    property internal_property : Void*
    def initialize(@name : Win32cr::Foundation::PSTR, @signature : Win32cr::Foundation::PSTR, @access : UInt8, @internal_property : Void*)
    end
  end

  @[Extern]
  struct Alljoyn_busobject_callbacks
    property property_get : Win32cr::Devices::AllJoyn::Alljoyn_busobject_prop_get_ptr
    property property_set : Win32cr::Devices::AllJoyn::Alljoyn_busobject_prop_set_ptr
    property object_registered : Win32cr::Devices::AllJoyn::Alljoyn_busobject_object_registration_ptr
    property object_unregistered : Win32cr::Devices::AllJoyn::Alljoyn_busobject_object_registration_ptr
    def initialize(@property_get : Win32cr::Devices::AllJoyn::Alljoyn_busobject_prop_get_ptr, @property_set : Win32cr::Devices::AllJoyn::Alljoyn_busobject_prop_set_ptr, @object_registered : Win32cr::Devices::AllJoyn::Alljoyn_busobject_object_registration_ptr, @object_unregistered : Win32cr::Devices::AllJoyn::Alljoyn_busobject_object_registration_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_busobject_methodentry
    property member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member*
    property method_handler : Win32cr::Devices::AllJoyn::Alljoyn_messagereceiver_methodhandler_ptr
    def initialize(@member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member*, @method_handler : Win32cr::Devices::AllJoyn::Alljoyn_messagereceiver_methodhandler_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_permissionconfigurationlistener_callbacks
    property factory_reset : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener_factoryreset_ptr
    property policy_changed : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener_policychanged_ptr
    property start_management : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener_startmanagement_ptr
    property end_management : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener_endmanagement_ptr
    def initialize(@factory_reset : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener_factoryreset_ptr, @policy_changed : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener_policychanged_ptr, @start_management : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener_startmanagement_ptr, @end_management : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener_endmanagement_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_sessionlistener_callbacks
    property session_lost : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener_sessionlost_ptr
    property session_member_added : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener_sessionmemberadded_ptr
    property session_member_removed : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener_sessionmemberremoved_ptr
    def initialize(@session_lost : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener_sessionlost_ptr, @session_member_added : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener_sessionmemberadded_ptr, @session_member_removed : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener_sessionmemberremoved_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_sessionportlistener_callbacks
    property accept_session_joiner : Win32cr::Devices::AllJoyn::Alljoyn_sessionportlistener_acceptsessionjoiner_ptr
    property session_joined : Win32cr::Devices::AllJoyn::Alljoyn_sessionportlistener_sessionjoined_ptr
    def initialize(@accept_session_joiner : Win32cr::Devices::AllJoyn::Alljoyn_sessionportlistener_acceptsessionjoiner_ptr, @session_joined : Win32cr::Devices::AllJoyn::Alljoyn_sessionportlistener_sessionjoined_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_aboutlistener_callback
    property about_listener_announced : Win32cr::Devices::AllJoyn::Alljoyn_about_announced_ptr
    def initialize(@about_listener_announced : Win32cr::Devices::AllJoyn::Alljoyn_about_announced_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_abouticonobj_handle_
    def initialize()
    end
  end

  @[Extern]
  struct Alljoyn_abouticonproxy_handle_
    def initialize()
    end
  end

  @[Extern]
  struct Alljoyn_aboutdatalistener_callbacks
    property about_datalistener_getaboutdata : Win32cr::Devices::AllJoyn::Alljoyn_aboutdatalistener_getaboutdata_ptr
    property about_datalistener_getannouncedaboutdata : Win32cr::Devices::AllJoyn::Alljoyn_aboutdatalistener_getannouncedaboutdata_ptr
    def initialize(@about_datalistener_getaboutdata : Win32cr::Devices::AllJoyn::Alljoyn_aboutdatalistener_getaboutdata_ptr, @about_datalistener_getannouncedaboutdata : Win32cr::Devices::AllJoyn::Alljoyn_aboutdatalistener_getannouncedaboutdata_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_pinglistener_callback
    property destination_found : Win32cr::Devices::AllJoyn::Alljoyn_autopinger_destination_found_ptr
    property destination_lost : Win32cr::Devices::AllJoyn::Alljoyn_autopinger_destination_lost_ptr
    def initialize(@destination_found : Win32cr::Devices::AllJoyn::Alljoyn_autopinger_destination_found_ptr, @destination_lost : Win32cr::Devices::AllJoyn::Alljoyn_autopinger_destination_lost_ptr)
    end
  end

  @[Extern]
  struct Alljoyn_observerlistener_callback
    property object_discovered : Win32cr::Devices::AllJoyn::Alljoyn_observer_object_discovered_ptr
    property object_lost : Win32cr::Devices::AllJoyn::Alljoyn_observer_object_lost_ptr
    def initialize(@object_discovered : Win32cr::Devices::AllJoyn::Alljoyn_observer_object_discovered_ptr, @object_lost : Win32cr::Devices::AllJoyn::Alljoyn_observer_object_lost_ptr)
    end
  end

  @[Link("msajapi")]
  lib C
    fun AllJoynConnectToBus(connectionSpec : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun AllJoynCloseBusHandle(busHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun AllJoynSendToBus(connectedBusHandle : Win32cr::Foundation::HANDLE, buffer : Void*, bytesToWrite : UInt32, bytesTransferred : UInt32*, reserved : Void*) : Win32cr::Foundation::BOOL

    fun AllJoynReceiveFromBus(connectedBusHandle : Win32cr::Foundation::HANDLE, buffer : Void*, bytesToRead : UInt32, bytesTransferred : UInt32*, reserved : Void*) : Win32cr::Foundation::BOOL

    fun AllJoynEventSelect(connectedBusHandle : Win32cr::Foundation::HANDLE, eventHandle : Win32cr::Foundation::HANDLE, eventTypes : UInt32) : Win32cr::Foundation::BOOL

    fun AllJoynEnumEvents(connectedBusHandle : Win32cr::Foundation::HANDLE, eventToReset : Win32cr::Foundation::HANDLE, eventTypes : UInt32*) : Win32cr::Foundation::BOOL

    fun AllJoynCreateBus(outBufferSize : UInt32, inBufferSize : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE

    fun AllJoynAcceptBusConnection(serverBusHandle : Win32cr::Foundation::HANDLE, abortEvent : Win32cr::Foundation::HANDLE) : UInt32

    fun alljoyn_unity_deferred_callbacks_process : Int32

    fun alljoyn_unity_set_deferred_callback_mainthread_only(mainthread_only : Int32) : Void

    fun QCC_StatusText(status : Win32cr::Devices::AllJoyn::QStatus) : Win32cr::Foundation::PSTR

    fun alljoyn_msgarg_create : Win32cr::Devices::AllJoyn::Alljoyn_msgarg

    fun alljoyn_msgarg_create_and_set(signature : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::Alljoyn_msgarg

    fun alljoyn_msgarg_destroy(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Void

    fun alljoyn_msgarg_array_create(size : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::Alljoyn_msgarg

    fun alljoyn_msgarg_array_element(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, index : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::Alljoyn_msgarg

    fun alljoyn_msgarg_set(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, signature : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, signature : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_copy(source : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::Alljoyn_msgarg

    fun alljoyn_msgarg_clone(destination : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, source : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Void

    fun alljoyn_msgarg_equal(lhv : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, rhv : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Int32

    fun alljoyn_msgarg_array_set(args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT*, signature : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_array_get(args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT, signature : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_tostring(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, str : Win32cr::Foundation::PSTR, buf : LibC::UIntPtrT, indent : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_msgarg_array_tostring(args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT, str : Win32cr::Foundation::PSTR, buf : LibC::UIntPtrT, indent : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_msgarg_signature(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, str : Win32cr::Foundation::PSTR, buf : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_msgarg_array_signature(values : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numValues : LibC::UIntPtrT, str : Win32cr::Foundation::PSTR, buf : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_msgarg_hassignature(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, signature : Win32cr::Foundation::PSTR) : Int32

    fun alljoyn_msgarg_getdictelement(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, elemSig : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_gettype(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::Alljoyn_typeid

    fun alljoyn_msgarg_clear(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Void

    fun alljoyn_msgarg_stabilize(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Void

    fun alljoyn_msgarg_array_set_offset(args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, argOffset : LibC::UIntPtrT, numArgs : LibC::UIntPtrT*, signature : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_and_stabilize(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, signature : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_uint8(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, y : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_bool(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, b : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_int16(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, n : Int16) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_uint16(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, q : UInt16) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_int32(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, i : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_uint32(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, u : UInt32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_int64(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, x : Int64) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_uint64(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, t : UInt64) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_double(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, d : Float64) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_string(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, s : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_objectpath(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, o : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_signature(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, g : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_uint8(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, y : UInt8*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_bool(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, b : Int32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_int16(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, n : Int16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_uint16(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, q : UInt16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_int32(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, i : Int32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_uint32(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, u : UInt32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_int64(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, x : Int64*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_uint64(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, t : UInt64*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_double(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, d : Float64*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_string(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, s : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_objectpath(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, o : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_signature(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, g : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_variant(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, v : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_uint8_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, ay : UInt8*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_bool_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, ab : Int32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_int16_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, an : Int16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_uint16_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, aq : UInt16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_int32_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, ai : Int32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_uint32_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, au : UInt32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_int64_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, ax : Int64*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_uint64_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, at : UInt64*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_double_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, ad : Float64*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_string_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, as__ : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_objectpath_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, ao : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_set_signature_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT, ag : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_uint8_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT*, ay : UInt8*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_bool_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT*, ab : Int32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_int16_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT*, an : Int16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_uint16_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT*, aq : UInt16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_int32_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT*, ai : Int32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_uint32_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT*, au : UInt32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_int64_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT*, ax : Int64*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_uint64_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT*, at : UInt64*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_double_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, length : LibC::UIntPtrT*, ad : Float64*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_variant_array(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, signature : Win32cr::Foundation::PSTR, length : LibC::UIntPtrT*, av : Win32cr::Devices::AllJoyn::Alljoyn_msgarg*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_get_array_numberofelements(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : LibC::UIntPtrT

    fun alljoyn_msgarg_get_array_element(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, index : LibC::UIntPtrT, element : Win32cr::Devices::AllJoyn::Alljoyn_msgarg*) : Void

    fun alljoyn_msgarg_get_array_elementsignature(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, index : LibC::UIntPtrT) : Win32cr::Foundation::PSTR

    fun alljoyn_msgarg_getkey(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::Alljoyn_msgarg

    fun alljoyn_msgarg_getvalue(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::Alljoyn_msgarg

    fun alljoyn_msgarg_setdictentry(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, key : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, value : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_setstruct(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, struct_members : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, num_members : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_msgarg_getnummembers(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : LibC::UIntPtrT

    fun alljoyn_msgarg_getmember(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, index : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::Alljoyn_msgarg

    fun alljoyn_aboutdata_create_empty : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata

    fun alljoyn_aboutdata_create(defaultLanguage : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata

    fun alljoyn_aboutdata_create_full(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata

    fun alljoyn_aboutdata_destroy(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata) : Void

    fun alljoyn_aboutdata_createfromxml(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, aboutDataXml : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_isvalid(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, language : Win32cr::Foundation::PSTR) : UInt8

    fun alljoyn_aboutdata_createfrommsgarg(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setappid(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, appId : UInt8*, num : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setappid_fromstring(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, appId : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getappid(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, appId : UInt8**, num : LibC::UIntPtrT*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setdefaultlanguage(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, defaultLanguage : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getdefaultlanguage(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, defaultLanguage : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setdevicename(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, deviceName : Win32cr::Foundation::PSTR, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getdevicename(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, deviceName : Int8**, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setdeviceid(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, deviceId : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getdeviceid(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, deviceId : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setappname(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, appName : Win32cr::Foundation::PSTR, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getappname(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, appName : Int8**, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setmanufacturer(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, manufacturer : Win32cr::Foundation::PSTR, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getmanufacturer(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, manufacturer : Int8**, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setmodelnumber(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, modelNumber : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getmodelnumber(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, modelNumber : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setsupportedlanguage(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getsupportedlanguages(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, languageTags : Int8**, num : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_aboutdata_setdescription(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, description : Win32cr::Foundation::PSTR, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getdescription(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, description : Int8**, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setdateofmanufacture(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, dateOfManufacture : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getdateofmanufacture(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, dateOfManufacture : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setsoftwareversion(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, softwareVersion : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getsoftwareversion(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, softwareVersion : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getajsoftwareversion(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, ajSoftwareVersion : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_sethardwareversion(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, hardwareVersion : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_gethardwareversion(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, hardwareVersion : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setsupporturl(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, supportUrl : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getsupporturl(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, supportUrl : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_setfield(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, name : Win32cr::Foundation::PSTR, value : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getfield(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, name : Win32cr::Foundation::PSTR, value : Win32cr::Devices::AllJoyn::Alljoyn_msgarg*, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getfields(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, fields : Int8**, num_fields : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_aboutdata_getaboutdata(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, msgArg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, language : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_getannouncedaboutdata(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, msgArg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdata_isfieldrequired(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, fieldName : Win32cr::Foundation::PSTR) : UInt8

    fun alljoyn_aboutdata_isfieldannounced(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, fieldName : Win32cr::Foundation::PSTR) : UInt8

    fun alljoyn_aboutdata_isfieldlocalized(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, fieldName : Win32cr::Foundation::PSTR) : UInt8

    fun alljoyn_aboutdata_getfieldsignature(data : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata, fieldName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::PSTR

    fun alljoyn_abouticon_create : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*

    fun alljoyn_abouticon_destroy(icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*) : Void

    fun alljoyn_abouticon_getcontent(icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*, data : UInt8**, size : LibC::UIntPtrT*) : Void

    fun alljoyn_abouticon_setcontent(icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*, type__ : Win32cr::Foundation::PSTR, data : UInt8*, csize : LibC::UIntPtrT, ownsData : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_abouticon_geturl(icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*, type__ : Int8**, url : Int8**) : Void

    fun alljoyn_abouticon_seturl(icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*, type__ : Win32cr::Foundation::PSTR, url : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_abouticon_clear(icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*) : Void

    fun alljoyn_abouticon_setcontent_frommsgarg(icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*, arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_getdefaultclaimcapabilities : UInt16

    fun alljoyn_permissionconfigurator_getapplicationstate(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, state : Win32cr::Devices::AllJoyn::Alljoyn_applicationstate*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_setapplicationstate(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, state : Win32cr::Devices::AllJoyn::Alljoyn_applicationstate) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_getpublickey(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, publicKey : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_publickey_destroy(publicKey : Int8*) : Void

    fun alljoyn_permissionconfigurator_getmanifesttemplate(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, manifestTemplateXml : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_manifesttemplate_destroy(manifestTemplateXml : Int8*) : Void

    fun alljoyn_permissionconfigurator_setmanifesttemplatefromxml(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, manifestTemplateXml : Int8*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_getclaimcapabilities(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, claimCapabilities : UInt16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_setclaimcapabilities(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, claimCapabilities : UInt16) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, additionalInfo : UInt16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, additionalInfo : UInt16) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_reset(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_claim(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, caKey : Int8*, identityCertificateChain : Int8*, groupId : UInt8*, groupSize : LibC::UIntPtrT, groupAuthority : Int8*, manifestsXmls : Int8**, manifestsCount : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_updateidentity(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, identityCertificateChain : Int8*, manifestsXmls : Int8**, manifestsCount : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_getidentity(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, identityCertificateChain : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_certificatechain_destroy(certificateChain : Int8*) : Void

    fun alljoyn_permissionconfigurator_getmanifests(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, manifestArray : Win32cr::Devices::AllJoyn::Alljoyn_manifestarray*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_manifestarray_cleanup(manifestArray : Win32cr::Devices::AllJoyn::Alljoyn_manifestarray*) : Void

    fun alljoyn_permissionconfigurator_installmanifests(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, manifestsXmls : Int8**, manifestsCount : LibC::UIntPtrT, append : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_getidentitycertificateid(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, certificateId : Win32cr::Devices::AllJoyn::Alljoyn_certificateid*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_certificateid_cleanup(certificateId : Win32cr::Devices::AllJoyn::Alljoyn_certificateid*) : Void

    fun alljoyn_permissionconfigurator_updatepolicy(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, policyXml : Int8*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_getpolicy(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, policyXml : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_getdefaultpolicy(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, policyXml : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_policy_destroy(policyXml : Int8*) : Void

    fun alljoyn_permissionconfigurator_resetpolicy(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_getmembershipsummaries(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, certificateIds : Win32cr::Devices::AllJoyn::Alljoyn_certificateidarray*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_certificateidarray_cleanup(certificateIdArray : Win32cr::Devices::AllJoyn::Alljoyn_certificateidarray*) : Void

    fun alljoyn_permissionconfigurator_installmembership(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, membershipCertificateChain : Int8*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_removemembership(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator, serial : UInt8*, serialLen : LibC::UIntPtrT, issuerPublicKey : Int8*, issuerAki : UInt8*, issuerAkiLen : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_startmanagement(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_permissionconfigurator_endmanagement(configurator : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_applicationstatelistener_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_applicationstatelistener_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_applicationstatelistener

    fun alljoyn_applicationstatelistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_applicationstatelistener) : Void

    fun alljoyn_keystorelistener_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener

    fun alljoyn_keystorelistener_with_synchronization_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener_with_synchronization_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener

    fun alljoyn_keystorelistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener) : Void

    fun alljoyn_keystorelistener_putkeys(listener : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener, keyStore : Win32cr::Devices::AllJoyn::Alljoyn_keystore, source : Win32cr::Foundation::PSTR, password : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_keystorelistener_getkeys(listener : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener, keyStore : Win32cr::Devices::AllJoyn::Alljoyn_keystore, sink : Win32cr::Foundation::PSTR, sink_sz : LibC::UIntPtrT*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_sessionopts_create(traffic : UInt8, isMultipoint : Int32, proximity : UInt8, transports : UInt16) : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts

    fun alljoyn_sessionopts_destroy(opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts) : Void

    fun alljoyn_sessionopts_get_traffic(opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts) : UInt8

    fun alljoyn_sessionopts_set_traffic(opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, traffic : UInt8) : Void

    fun alljoyn_sessionopts_get_multipoint(opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts) : Int32

    fun alljoyn_sessionopts_set_multipoint(opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, isMultipoint : Int32) : Void

    fun alljoyn_sessionopts_get_proximity(opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts) : UInt8

    fun alljoyn_sessionopts_set_proximity(opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, proximity : UInt8) : Void

    fun alljoyn_sessionopts_get_transports(opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts) : UInt16

    fun alljoyn_sessionopts_set_transports(opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, transports : UInt16) : Void

    fun alljoyn_sessionopts_iscompatible(one : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, other : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts) : Int32

    fun alljoyn_sessionopts_cmp(one : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, other : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts) : Int32

    fun alljoyn_message_create(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::Alljoyn_message

    fun alljoyn_message_destroy(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Void

    fun alljoyn_message_isbroadcastsignal(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Int32

    fun alljoyn_message_isglobalbroadcast(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Int32

    fun alljoyn_message_issessionless(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Int32

    fun alljoyn_message_getflags(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : UInt8

    fun alljoyn_message_isexpired(msg : Win32cr::Devices::AllJoyn::Alljoyn_message, tillExpireMS : UInt32*) : Int32

    fun alljoyn_message_isunreliable(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Int32

    fun alljoyn_message_isencrypted(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Int32

    fun alljoyn_message_getauthmechanism(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Foundation::PSTR

    fun alljoyn_message_gettype(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Devices::AllJoyn::Alljoyn_messagetype

    fun alljoyn_message_getargs(msg : Win32cr::Devices::AllJoyn::Alljoyn_message, numArgs : LibC::UIntPtrT*, args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg*) : Void

    fun alljoyn_message_getarg(msg : Win32cr::Devices::AllJoyn::Alljoyn_message, argN : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::Alljoyn_msgarg

    fun alljoyn_message_parseargs(msg : Win32cr::Devices::AllJoyn::Alljoyn_message, signature : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_message_getcallserial(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : UInt32

    fun alljoyn_message_getsignature(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Foundation::PSTR

    fun alljoyn_message_getobjectpath(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Foundation::PSTR

    fun alljoyn_message_getinterface(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Foundation::PSTR

    fun alljoyn_message_getmembername(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Foundation::PSTR

    fun alljoyn_message_getreplyserial(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : UInt32

    fun alljoyn_message_getsender(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Foundation::PSTR

    fun alljoyn_message_getreceiveendpointname(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Foundation::PSTR

    fun alljoyn_message_getdestination(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Foundation::PSTR

    fun alljoyn_message_getcompressiontoken(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : UInt32

    fun alljoyn_message_getsessionid(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : UInt32

    fun alljoyn_message_geterrorname(msg : Win32cr::Devices::AllJoyn::Alljoyn_message, errorMessage : Win32cr::Foundation::PSTR, errorMessage_size : LibC::UIntPtrT*) : Win32cr::Foundation::PSTR

    fun alljoyn_message_tostring(msg : Win32cr::Devices::AllJoyn::Alljoyn_message, str : Win32cr::Foundation::PSTR, buf : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_message_description(msg : Win32cr::Devices::AllJoyn::Alljoyn_message, str : Win32cr::Foundation::PSTR, buf : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_message_gettimestamp(msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : UInt32

    fun alljoyn_message_eql(one : Win32cr::Devices::AllJoyn::Alljoyn_message, other : Win32cr::Devices::AllJoyn::Alljoyn_message) : Int32

    fun alljoyn_message_setendianess(endian : Int8) : Void

    fun alljoyn_authlistener_requestcredentialsresponse(listener : Win32cr::Devices::AllJoyn::Alljoyn_authlistener, authContext : Void*, accept : Int32, credentials : Win32cr::Devices::AllJoyn::Alljoyn_credentials) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_authlistener_verifycredentialsresponse(listener : Win32cr::Devices::AllJoyn::Alljoyn_authlistener, authContext : Void*, accept : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_authlistener_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_authlistener_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_authlistener

    fun alljoyn_authlistenerasync_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_authlistenerasync_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_authlistener

    fun alljoyn_authlistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_authlistener) : Void

    fun alljoyn_authlistenerasync_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_authlistener) : Void

    fun alljoyn_authlistener_setsharedsecret(listener : Win32cr::Devices::AllJoyn::Alljoyn_authlistener, sharedSecret : UInt8*, sharedSecretSize : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_credentials_create : Win32cr::Devices::AllJoyn::Alljoyn_credentials

    fun alljoyn_credentials_destroy(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials) : Void

    fun alljoyn_credentials_isset(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials, creds : UInt16) : Int32

    fun alljoyn_credentials_setpassword(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials, pwd : Win32cr::Foundation::PSTR) : Void

    fun alljoyn_credentials_setusername(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials, userName : Win32cr::Foundation::PSTR) : Void

    fun alljoyn_credentials_setcertchain(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials, certChain : Win32cr::Foundation::PSTR) : Void

    fun alljoyn_credentials_setprivatekey(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials, pk : Win32cr::Foundation::PSTR) : Void

    fun alljoyn_credentials_setlogonentry(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials, logonEntry : Win32cr::Foundation::PSTR) : Void

    fun alljoyn_credentials_setexpiration(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials, expiration : UInt32) : Void

    fun alljoyn_credentials_getpassword(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials) : Win32cr::Foundation::PSTR

    fun alljoyn_credentials_getusername(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials) : Win32cr::Foundation::PSTR

    fun alljoyn_credentials_getcertchain(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials) : Win32cr::Foundation::PSTR

    fun alljoyn_credentials_getprivateKey(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials) : Win32cr::Foundation::PSTR

    fun alljoyn_credentials_getlogonentry(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials) : Win32cr::Foundation::PSTR

    fun alljoyn_credentials_getexpiration(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials) : UInt32

    fun alljoyn_credentials_clear(cred : Win32cr::Devices::AllJoyn::Alljoyn_credentials) : Void

    fun alljoyn_buslistener_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_buslistener_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_buslistener

    fun alljoyn_buslistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_buslistener) : Void

    fun alljoyn_interfacedescription_member_getannotationscount(member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_member_getannotationatindex(member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, index : LibC::UIntPtrT, name : Win32cr::Foundation::PSTR, name_size : LibC::UIntPtrT*, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Void

    fun alljoyn_interfacedescription_member_getannotation(member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Int32

    fun alljoyn_interfacedescription_member_getargannotationscount(member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, argName : Win32cr::Foundation::PSTR) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_member_getargannotationatindex(member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, argName : Win32cr::Foundation::PSTR, index : LibC::UIntPtrT, name : Win32cr::Foundation::PSTR, name_size : LibC::UIntPtrT*, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Void

    fun alljoyn_interfacedescription_member_getargannotation(member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, argName : Win32cr::Foundation::PSTR, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Int32

    fun alljoyn_interfacedescription_property_getannotationscount(property : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_property) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_property_getannotationatindex(property : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_property, index : LibC::UIntPtrT, name : Win32cr::Foundation::PSTR, name_size : LibC::UIntPtrT*, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Void

    fun alljoyn_interfacedescription_property_getannotation(property : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_property, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Int32

    fun alljoyn_interfacedescription_activate(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Void

    fun alljoyn_interfacedescription_addannotation(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getannotation(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Int32

    fun alljoyn_interfacedescription_getannotationscount(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_getannotationatindex(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, index : LibC::UIntPtrT, name : Win32cr::Foundation::PSTR, name_size : LibC::UIntPtrT*, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Void

    fun alljoyn_interfacedescription_getmember(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member*) : Int32

    fun alljoyn_interfacedescription_addmember(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, type__ : Win32cr::Devices::AllJoyn::Alljoyn_messagetype, name : Win32cr::Foundation::PSTR, inputSig : Win32cr::Foundation::PSTR, outSig : Win32cr::Foundation::PSTR, argNames : Win32cr::Foundation::PSTR, annotation__ : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_addmemberannotation(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getmemberannotation(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Int32

    fun alljoyn_interfacedescription_getmembers(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, members : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member*, numMembers : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_hasmember(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, inSig : Win32cr::Foundation::PSTR, outSig : Win32cr::Foundation::PSTR) : Int32

    fun alljoyn_interfacedescription_addmethod(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, inputSig : Win32cr::Foundation::PSTR, outSig : Win32cr::Foundation::PSTR, argNames : Win32cr::Foundation::PSTR, annotation__ : UInt8, accessPerms : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getmethod(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member*) : Int32

    fun alljoyn_interfacedescription_addsignal(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, sig : Win32cr::Foundation::PSTR, argNames : Win32cr::Foundation::PSTR, annotation__ : UInt8, accessPerms : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getsignal(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member*) : Int32

    fun alljoyn_interfacedescription_getproperty(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, property : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_property*) : Int32

    fun alljoyn_interfacedescription_getproperties(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, props : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_property*, numProps : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_addproperty(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, signature : Win32cr::Foundation::PSTR, access : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_addpropertyannotation(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, property : Win32cr::Foundation::PSTR, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getpropertyannotation(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, property : Win32cr::Foundation::PSTR, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, str_size : LibC::UIntPtrT*) : Int32

    fun alljoyn_interfacedescription_hasproperty(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR) : Int32

    fun alljoyn_interfacedescription_hasproperties(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Int32

    fun alljoyn_interfacedescription_getname(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Win32cr::Foundation::PSTR

    fun alljoyn_interfacedescription_introspect(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, str : Win32cr::Foundation::PSTR, buf : LibC::UIntPtrT, indent : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_issecure(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Int32

    fun alljoyn_interfacedescription_getsecuritypolicy(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_securitypolicy

    fun alljoyn_interfacedescription_setdescriptionlanguage(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, language : Win32cr::Foundation::PSTR) : Void

    fun alljoyn_interfacedescription_getdescriptionlanguages(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, languages : Int8**, size : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_getdescriptionlanguages2(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, languages : Win32cr::Foundation::PSTR, languagesSize : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_setdescription(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, description : Win32cr::Foundation::PSTR) : Void

    fun alljoyn_interfacedescription_setdescriptionforlanguage(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, description : Win32cr::Foundation::PSTR, languageTag : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getdescriptionforlanguage(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, description : Win32cr::Foundation::PSTR, maxLanguageLength : LibC::UIntPtrT, languageTag : Win32cr::Foundation::PSTR) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_setmemberdescription(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, description : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_setmemberdescriptionforlanguage(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, description : Win32cr::Foundation::PSTR, languageTag : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getmemberdescriptionforlanguage(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, description : Win32cr::Foundation::PSTR, maxLanguageLength : LibC::UIntPtrT, languageTag : Win32cr::Foundation::PSTR) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_setargdescription(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, argName : Win32cr::Foundation::PSTR, description : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_setargdescriptionforlanguage(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, arg : Win32cr::Foundation::PSTR, description : Win32cr::Foundation::PSTR, languageTag : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getargdescriptionforlanguage(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, arg : Win32cr::Foundation::PSTR, description : Win32cr::Foundation::PSTR, maxLanguageLength : LibC::UIntPtrT, languageTag : Win32cr::Foundation::PSTR) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_setpropertydescription(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, description : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_setpropertydescriptionforlanguage(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, name : Win32cr::Foundation::PSTR, description : Win32cr::Foundation::PSTR, languageTag : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getpropertydescriptionforlanguage(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, property : Win32cr::Foundation::PSTR, description : Win32cr::Foundation::PSTR, maxLanguageLength : LibC::UIntPtrT, languageTag : Win32cr::Foundation::PSTR) : LibC::UIntPtrT

    fun alljoyn_interfacedescription_setdescriptiontranslationcallback(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, translationCallback : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_translation_callback_ptr) : Void

    fun alljoyn_interfacedescription_getdescriptiontranslationcallback(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_translation_callback_ptr

    fun alljoyn_interfacedescription_hasdescription(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Int32

    fun alljoyn_interfacedescription_addargannotation(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, argName : Win32cr::Foundation::PSTR, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_interfacedescription_getmemberargannotation(iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, member : Win32cr::Foundation::PSTR, argName : Win32cr::Foundation::PSTR, name : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, value_size : LibC::UIntPtrT*) : Int32

    fun alljoyn_interfacedescription_eql(one : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, other : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Int32

    fun alljoyn_interfacedescription_member_eql(one : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, other : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member) : Int32

    fun alljoyn_interfacedescription_property_eql(one : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_property, other : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_property) : Int32

    fun alljoyn_busobject_create(path : Win32cr::Foundation::PSTR, isPlaceholder : Int32, callbacks_in : Win32cr::Devices::AllJoyn::Alljoyn_busobject_callbacks*, context_in : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_busobject

    fun alljoyn_busobject_destroy(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject) : Void

    fun alljoyn_busobject_getpath(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject) : Win32cr::Foundation::PSTR

    fun alljoyn_busobject_emitpropertychanged(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, ifcName : Win32cr::Foundation::PSTR, propName : Win32cr::Foundation::PSTR, val : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, id : UInt32) : Void

    fun alljoyn_busobject_emitpropertieschanged(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, ifcName : Win32cr::Foundation::PSTR, propNames : Int8**, numProps : LibC::UIntPtrT, id : UInt32) : Void

    fun alljoyn_busobject_getname(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, buffer : Win32cr::Foundation::PSTR, bufferSz : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_busobject_addinterface(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_addmethodhandler(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, handler : Win32cr::Devices::AllJoyn::Alljoyn_messagereceiver_methodhandler_ptr, context : Void*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_addmethodhandlers(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, entries : Win32cr::Devices::AllJoyn::Alljoyn_busobject_methodentry*, numEntries : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_methodreply_args(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, msg : Win32cr::Devices::AllJoyn::Alljoyn_message, args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_methodreply_err(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, msg : Win32cr::Devices::AllJoyn::Alljoyn_message, error : Win32cr::Foundation::PSTR, errorMessage : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_methodreply_status(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, msg : Win32cr::Devices::AllJoyn::Alljoyn_message, status : Win32cr::Devices::AllJoyn::QStatus) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_getbusattachment(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject) : Win32cr::Devices::AllJoyn::Alljoyn_busattachment

    fun alljoyn_busobject_signal(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, destination : Win32cr::Foundation::PSTR, sessionId : UInt32, signal : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT, timeToLive : UInt16, flags : UInt8, msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_cancelsessionlessmessage_serial(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, serialNumber : UInt32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_cancelsessionlessmessage(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, msg : Win32cr::Devices::AllJoyn::Alljoyn_message) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_issecure(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject) : Int32

    fun alljoyn_busobject_getannouncedinterfacenames(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, interfaces : Int8**, numInterfaces : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_busobject_setannounceflag(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription, isAnnounced : Win32cr::Devices::AllJoyn::Alljoyn_about_announceflag) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busobject_addinterface_announced(bus : Win32cr::Devices::AllJoyn::Alljoyn_busobject, iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_create(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, service : Win32cr::Foundation::PSTR, path : Win32cr::Foundation::PSTR, sessionId : UInt32) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject

    fun alljoyn_proxybusobject_create_secure(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, service : Win32cr::Foundation::PSTR, path : Win32cr::Foundation::PSTR, sessionId : UInt32) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject

    fun alljoyn_proxybusobject_destroy(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Void

    fun alljoyn_proxybusobject_addinterface(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_addinterface_by_name(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, name : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_getchildren(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, children : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject*, numChildren : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_proxybusobject_getchild(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, path : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject

    fun alljoyn_proxybusobject_addchild(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, child : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_removechild(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, path : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_introspectremoteobject(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_introspectremoteobjectasync(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, callback : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_listener_introspectcb_ptr, context : Void*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_getproperty(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR, property : Win32cr::Foundation::PSTR, value : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_getpropertyasync(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR, property : Win32cr::Foundation::PSTR, callback : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_listener_getpropertycb_ptr, timeout : UInt32, context : Void*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_getallproperties(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR, values : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_getallpropertiesasync(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR, callback : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_listener_getallpropertiescb_ptr, timeout : UInt32, context : Void*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_setproperty(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR, property : Win32cr::Foundation::PSTR, value : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_registerpropertieschangedlistener(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR, properties : Int8**, numProperties : LibC::UIntPtrT, callback : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_listener_propertieschanged_ptr, context : Void*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_unregisterpropertieschangedlistener(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR, callback : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_listener_propertieschanged_ptr) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_setpropertyasync(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR, property : Win32cr::Foundation::PSTR, value : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, callback : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_listener_setpropertycb_ptr, timeout : UInt32, context : Void*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_methodcall(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, ifaceName : Win32cr::Foundation::PSTR, methodName : Win32cr::Foundation::PSTR, args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT, replyMsg : Win32cr::Devices::AllJoyn::Alljoyn_message, timeout : UInt32, flags : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_methodcall_member(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, method : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT, replyMsg : Win32cr::Devices::AllJoyn::Alljoyn_message, timeout : UInt32, flags : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_methodcall_noreply(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, ifaceName : Win32cr::Foundation::PSTR, methodName : Win32cr::Foundation::PSTR, args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT, flags : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_methodcall_member_noreply(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, method : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT, flags : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_methodcallasync(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, ifaceName : Win32cr::Foundation::PSTR, methodName : Win32cr::Foundation::PSTR, replyFunc : Win32cr::Devices::AllJoyn::Alljoyn_messagereceiver_replyhandler_ptr, args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT, context : Void*, timeout : UInt32, flags : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_methodcallasync_member(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, method : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, replyFunc : Win32cr::Devices::AllJoyn::Alljoyn_messagereceiver_replyhandler_ptr, args : Win32cr::Devices::AllJoyn::Alljoyn_msgarg, numArgs : LibC::UIntPtrT, context : Void*, timeout : UInt32, flags : UInt8) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_parsexml(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, xml : Win32cr::Foundation::PSTR, identifier : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_secureconnection(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, forceAuth : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_secureconnectionasync(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, forceAuth : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_getinterface(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription

    fun alljoyn_proxybusobject_getinterfaces(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, ifaces : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription*, numIfaces : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_proxybusobject_getpath(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Win32cr::Foundation::PSTR

    fun alljoyn_proxybusobject_getservicename(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Win32cr::Foundation::PSTR

    fun alljoyn_proxybusobject_getuniquename(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Win32cr::Foundation::PSTR

    fun alljoyn_proxybusobject_getsessionid(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : UInt32

    fun alljoyn_proxybusobject_implementsinterface(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject, iface : Win32cr::Foundation::PSTR) : Int32

    fun alljoyn_proxybusobject_copy(source : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject

    fun alljoyn_proxybusobject_isvalid(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Int32

    fun alljoyn_proxybusobject_issecure(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Int32

    fun alljoyn_proxybusobject_enablepropertycaching(proxyObj : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Void

    fun alljoyn_permissionconfigurationlistener_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener

    fun alljoyn_permissionconfigurationlistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener) : Void

    fun alljoyn_sessionlistener_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener

    fun alljoyn_sessionlistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener) : Void

    fun alljoyn_sessionportlistener_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_sessionportlistener_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_sessionportlistener

    fun alljoyn_sessionportlistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_sessionportlistener) : Void

    fun alljoyn_aboutlistener_create(callback : Win32cr::Devices::AllJoyn::Alljoyn_aboutlistener_callback*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_aboutlistener

    fun alljoyn_aboutlistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_aboutlistener) : Void

    fun alljoyn_busattachment_create(applicationName : Win32cr::Foundation::PSTR, allowRemoteMessages : Int32) : Win32cr::Devices::AllJoyn::Alljoyn_busattachment

    fun alljoyn_busattachment_create_concurrency(applicationName : Win32cr::Foundation::PSTR, allowRemoteMessages : Int32, concurrency : UInt32) : Win32cr::Devices::AllJoyn::Alljoyn_busattachment

    fun alljoyn_busattachment_destroy(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Void

    fun alljoyn_busattachment_start(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_stop(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_join(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_getconcurrency(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : UInt32

    fun alljoyn_busattachment_getconnectspec(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Foundation::PSTR

    fun alljoyn_busattachment_enableconcurrentcallbacks(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Void

    fun alljoyn_busattachment_createinterface(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR, iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_createinterface_secure(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR, iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription*, secPolicy : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_securitypolicy) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_connect(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, connectSpec : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_registerbuslistener(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, listener : Win32cr::Devices::AllJoyn::Alljoyn_buslistener) : Void

    fun alljoyn_busattachment_unregisterbuslistener(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, listener : Win32cr::Devices::AllJoyn::Alljoyn_buslistener) : Void

    fun alljoyn_busattachment_findadvertisedname(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, namePrefix : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_findadvertisednamebytransport(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, namePrefix : Win32cr::Foundation::PSTR, transports : UInt16) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_cancelfindadvertisedname(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, namePrefix : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_cancelfindadvertisednamebytransport(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, namePrefix : Win32cr::Foundation::PSTR, transports : UInt16) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_advertisename(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR, transports : UInt16) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_canceladvertisename(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR, transports : UInt16) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_getinterface(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription

    fun alljoyn_busattachment_joinsession(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, sessionHost : Win32cr::Foundation::PSTR, sessionPort : UInt16, listener : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener, sessionId : UInt32*, opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_joinsessionasync(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, sessionHost : Win32cr::Foundation::PSTR, sessionPort : UInt16, listener : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener, opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, callback : Win32cr::Devices::AllJoyn::Alljoyn_busattachment_joinsessioncb_ptr, context : Void*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_registerbusobject(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, obj : Win32cr::Devices::AllJoyn::Alljoyn_busobject) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_registerbusobject_secure(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, obj : Win32cr::Devices::AllJoyn::Alljoyn_busobject) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_unregisterbusobject(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, object : Win32cr::Devices::AllJoyn::Alljoyn_busobject) : Void

    fun alljoyn_busattachment_requestname(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, requestedName : Win32cr::Foundation::PSTR, flags : UInt32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_releasename(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_bindsessionport(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, sessionPort : UInt16*, opts : Win32cr::Devices::AllJoyn::Alljoyn_sessionopts, listener : Win32cr::Devices::AllJoyn::Alljoyn_sessionportlistener) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_unbindsessionport(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, sessionPort : UInt16) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_enablepeersecurity(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, authMechanisms : Win32cr::Foundation::PSTR, listener : Win32cr::Devices::AllJoyn::Alljoyn_authlistener, keyStoreFileName : Win32cr::Foundation::PSTR, isShared : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, authMechanisms : Win32cr::Foundation::PSTR, authListener : Win32cr::Devices::AllJoyn::Alljoyn_authlistener, keyStoreFileName : Win32cr::Foundation::PSTR, isShared : Int32, permissionConfigurationListener : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurationlistener) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_ispeersecurityenabled(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Int32

    fun alljoyn_busattachment_createinterfacesfromxml(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, xml : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_getinterfaces(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, ifaces : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription*, numIfaces : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_busattachment_deleteinterface(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, iface : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_isstarted(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Int32

    fun alljoyn_busattachment_isstopping(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Int32

    fun alljoyn_busattachment_isconnected(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Int32

    fun alljoyn_busattachment_disconnect(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, unused : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_getdbusproxyobj(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject

    fun alljoyn_busattachment_getalljoynproxyobj(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject

    fun alljoyn_busattachment_getalljoyndebugobj(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject

    fun alljoyn_busattachment_getuniquename(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Foundation::PSTR

    fun alljoyn_busattachment_getglobalguidstring(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Foundation::PSTR

    fun alljoyn_busattachment_registersignalhandler(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, signal_handler : Win32cr::Devices::AllJoyn::Alljoyn_messagereceiver_signalhandler_ptr, member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, srcPath : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_registersignalhandlerwithrule(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, signal_handler : Win32cr::Devices::AllJoyn::Alljoyn_messagereceiver_signalhandler_ptr, member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, matchRule : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_unregistersignalhandler(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, signal_handler : Win32cr::Devices::AllJoyn::Alljoyn_messagereceiver_signalhandler_ptr, member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, srcPath : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_unregistersignalhandlerwithrule(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, signal_handler : Win32cr::Devices::AllJoyn::Alljoyn_messagereceiver_signalhandler_ptr, member : Win32cr::Devices::AllJoyn::Alljoyn_interfacedescription_member, matchRule : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_unregisterallhandlers(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_registerkeystorelistener(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, listener : Win32cr::Devices::AllJoyn::Alljoyn_keystorelistener) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_reloadkeystore(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_clearkeystore(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Void

    fun alljoyn_busattachment_clearkeys(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, guid : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_setkeyexpiration(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, guid : Win32cr::Foundation::PSTR, timeout : UInt32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_getkeyexpiration(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, guid : Win32cr::Foundation::PSTR, timeout : UInt32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_addlogonentry(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, authMechanism : Win32cr::Foundation::PSTR, userName : Win32cr::Foundation::PSTR, password : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_addmatch(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, rule : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_removematch(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, rule : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_setsessionlistener(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, sessionId : UInt32, listener : Win32cr::Devices::AllJoyn::Alljoyn_sessionlistener) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_leavesession(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, sessionId : UInt32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_secureconnection(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR, forceAuth : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_secureconnectionasync(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR, forceAuth : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_removesessionmember(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, sessionId : UInt32, memberName : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_setlinktimeout(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, sessionid : UInt32, linkTimeout : UInt32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_setlinktimeoutasync(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, sessionid : UInt32, linkTimeout : UInt32, callback : Win32cr::Devices::AllJoyn::Alljoyn_busattachment_setlinktimeoutcb_ptr, context : Void*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_namehasowner(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR, hasOwner : Int32*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_getpeerguid(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR, guid : Win32cr::Foundation::PSTR, guidSz : LibC::UIntPtrT*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_setdaemondebug(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, module__ : Win32cr::Foundation::PSTR, level : UInt32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_gettimestamp : UInt32

    fun alljoyn_busattachment_ping(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, name : Win32cr::Foundation::PSTR, timeout : UInt32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_registeraboutlistener(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, aboutListener : Win32cr::Devices::AllJoyn::Alljoyn_aboutlistener) : Void

    fun alljoyn_busattachment_unregisteraboutlistener(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, aboutListener : Win32cr::Devices::AllJoyn::Alljoyn_aboutlistener) : Void

    fun alljoyn_busattachment_unregisterallaboutlisteners(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Void

    fun alljoyn_busattachment_whoimplements_interfaces(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, implementsInterfaces : Int8**, numberInterfaces : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_whoimplements_interface(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, implementsInterface : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_cancelwhoimplements_interfaces(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, implementsInterfaces : Int8**, numberInterfaces : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_cancelwhoimplements_interface(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, implementsInterface : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_getpermissionconfigurator(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::Alljoyn_permissionconfigurator

    fun alljoyn_busattachment_registerapplicationstatelistener(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, listener : Win32cr::Devices::AllJoyn::Alljoyn_applicationstatelistener) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_unregisterapplicationstatelistener(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, listener : Win32cr::Devices::AllJoyn::Alljoyn_applicationstatelistener) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_busattachment_deletedefaultkeystore(applicationName : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_abouticonobj_create(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*) : Win32cr::Devices::AllJoyn::Alljoyn_abouticonobj_handle_*

    fun alljoyn_abouticonobj_destroy(icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticonobj_handle_*) : Void

    fun alljoyn_abouticonproxy_create(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, busName : Win32cr::Foundation::PSTR, sessionId : UInt32) : Win32cr::Devices::AllJoyn::Alljoyn_abouticonproxy_handle_*

    fun alljoyn_abouticonproxy_destroy(proxy : Win32cr::Devices::AllJoyn::Alljoyn_abouticonproxy_handle_*) : Void

    fun alljoyn_abouticonproxy_geticon(proxy : Win32cr::Devices::AllJoyn::Alljoyn_abouticonproxy_handle_*, icon : Win32cr::Devices::AllJoyn::Alljoyn_abouticon_handle_*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_abouticonproxy_getversion(proxy : Win32cr::Devices::AllJoyn::Alljoyn_abouticonproxy_handle_*, version : UInt16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutdatalistener_create(callbacks : Win32cr::Devices::AllJoyn::Alljoyn_aboutdatalistener_callbacks*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_aboutdatalistener

    fun alljoyn_aboutdatalistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_aboutdatalistener) : Void

    fun alljoyn_aboutobj_create(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, isAnnounced : Win32cr::Devices::AllJoyn::Alljoyn_about_announceflag) : Win32cr::Devices::AllJoyn::Alljoyn_aboutobj

    fun alljoyn_aboutobj_destroy(obj : Win32cr::Devices::AllJoyn::Alljoyn_aboutobj) : Void

    fun alljoyn_aboutobj_announce(obj : Win32cr::Devices::AllJoyn::Alljoyn_aboutobj, sessionPort : UInt16, aboutData : Win32cr::Devices::AllJoyn::Alljoyn_aboutdata) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutobj_announce_using_datalistener(obj : Win32cr::Devices::AllJoyn::Alljoyn_aboutobj, sessionPort : UInt16, aboutListener : Win32cr::Devices::AllJoyn::Alljoyn_aboutdatalistener) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutobj_unannounce(obj : Win32cr::Devices::AllJoyn::Alljoyn_aboutobj) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutobjectdescription_create : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription

    fun alljoyn_aboutobjectdescription_create_full(arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription

    fun alljoyn_aboutobjectdescription_createfrommsgarg(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription, arg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutobjectdescription_destroy(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription) : Void

    fun alljoyn_aboutobjectdescription_getpaths(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription, paths : Int8**, numPaths : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_aboutobjectdescription_getinterfaces(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription, path : Win32cr::Foundation::PSTR, interfaces : Int8**, numInterfaces : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_aboutobjectdescription_getinterfacepaths(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription, interfaceName : Win32cr::Foundation::PSTR, paths : Int8**, numPaths : LibC::UIntPtrT) : LibC::UIntPtrT

    fun alljoyn_aboutobjectdescription_clear(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription) : Void

    fun alljoyn_aboutobjectdescription_haspath(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription, path : Win32cr::Foundation::PSTR) : UInt8

    fun alljoyn_aboutobjectdescription_hasinterface(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription, interfaceName : Win32cr::Foundation::PSTR) : UInt8

    fun alljoyn_aboutobjectdescription_hasinterfaceatpath(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription, path : Win32cr::Foundation::PSTR, interfaceName : Win32cr::Foundation::PSTR) : UInt8

    fun alljoyn_aboutobjectdescription_getmsgarg(description : Win32cr::Devices::AllJoyn::Alljoyn_aboutobjectdescription, msgArg : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutproxy_create(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, busName : Win32cr::Foundation::PSTR, sessionId : UInt32) : Win32cr::Devices::AllJoyn::Alljoyn_aboutproxy

    fun alljoyn_aboutproxy_destroy(proxy : Win32cr::Devices::AllJoyn::Alljoyn_aboutproxy) : Void

    fun alljoyn_aboutproxy_getobjectdescription(proxy : Win32cr::Devices::AllJoyn::Alljoyn_aboutproxy, objectDesc : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutproxy_getaboutdata(proxy : Win32cr::Devices::AllJoyn::Alljoyn_aboutproxy, language : Win32cr::Foundation::PSTR, data : Win32cr::Devices::AllJoyn::Alljoyn_msgarg) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_aboutproxy_getversion(proxy : Win32cr::Devices::AllJoyn::Alljoyn_aboutproxy, version : UInt16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_pinglistener_create(callback : Win32cr::Devices::AllJoyn::Alljoyn_pinglistener_callback*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_pinglistener

    fun alljoyn_pinglistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_pinglistener) : Void

    fun alljoyn_autopinger_create(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment) : Win32cr::Devices::AllJoyn::Alljoyn_autopinger

    fun alljoyn_autopinger_destroy(autopinger : Win32cr::Devices::AllJoyn::Alljoyn_autopinger) : Void

    fun alljoyn_autopinger_pause(autopinger : Win32cr::Devices::AllJoyn::Alljoyn_autopinger) : Void

    fun alljoyn_autopinger_resume(autopinger : Win32cr::Devices::AllJoyn::Alljoyn_autopinger) : Void

    fun alljoyn_autopinger_addpinggroup(autopinger : Win32cr::Devices::AllJoyn::Alljoyn_autopinger, group : Win32cr::Foundation::PSTR, listener : Win32cr::Devices::AllJoyn::Alljoyn_pinglistener, pinginterval : UInt32) : Void

    fun alljoyn_autopinger_removepinggroup(autopinger : Win32cr::Devices::AllJoyn::Alljoyn_autopinger, group : Win32cr::Foundation::PSTR) : Void

    fun alljoyn_autopinger_setpinginterval(autopinger : Win32cr::Devices::AllJoyn::Alljoyn_autopinger, group : Win32cr::Foundation::PSTR, pinginterval : UInt32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_autopinger_adddestination(autopinger : Win32cr::Devices::AllJoyn::Alljoyn_autopinger, group : Win32cr::Foundation::PSTR, destination : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_autopinger_removedestination(autopinger : Win32cr::Devices::AllJoyn::Alljoyn_autopinger, group : Win32cr::Foundation::PSTR, destination : Win32cr::Foundation::PSTR, removeall : Int32) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_getversion : Win32cr::Foundation::PSTR

    fun alljoyn_getbuildinfo : Win32cr::Foundation::PSTR

    fun alljoyn_getnumericversion : UInt32

    fun alljoyn_init : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_shutdown : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_routerinit : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_routerinitwithconfig(configXml : Int8*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_routershutdown : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_proxybusobject_ref_create(proxy : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref

    fun alljoyn_proxybusobject_ref_get(ref : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject

    fun alljoyn_proxybusobject_ref_incref(ref : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref) : Void

    fun alljoyn_proxybusobject_ref_decref(ref : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref) : Void

    fun alljoyn_observerlistener_create(callback : Win32cr::Devices::AllJoyn::Alljoyn_observerlistener_callback*, context : Void*) : Win32cr::Devices::AllJoyn::Alljoyn_observerlistener

    fun alljoyn_observerlistener_destroy(listener : Win32cr::Devices::AllJoyn::Alljoyn_observerlistener) : Void

    fun alljoyn_observer_create(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, mandatoryInterfaces : Int8**, numMandatoryInterfaces : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::Alljoyn_observer

    fun alljoyn_observer_destroy(observer : Win32cr::Devices::AllJoyn::Alljoyn_observer) : Void

    fun alljoyn_observer_registerlistener(observer : Win32cr::Devices::AllJoyn::Alljoyn_observer, listener : Win32cr::Devices::AllJoyn::Alljoyn_observerlistener, triggerOnExisting : Int32) : Void

    fun alljoyn_observer_unregisterlistener(observer : Win32cr::Devices::AllJoyn::Alljoyn_observer, listener : Win32cr::Devices::AllJoyn::Alljoyn_observerlistener) : Void

    fun alljoyn_observer_unregisteralllisteners(observer : Win32cr::Devices::AllJoyn::Alljoyn_observer) : Void

    fun alljoyn_observer_get(observer : Win32cr::Devices::AllJoyn::Alljoyn_observer, uniqueBusName : Win32cr::Foundation::PSTR, objectPath : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref

    fun alljoyn_observer_getfirst(observer : Win32cr::Devices::AllJoyn::Alljoyn_observer) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref

    fun alljoyn_observer_getnext(observer : Win32cr::Devices::AllJoyn::Alljoyn_observer, proxyref : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref) : Win32cr::Devices::AllJoyn::Alljoyn_proxybusobject_ref

    fun alljoyn_passwordmanager_setcredentials(authMechanism : Win32cr::Foundation::PSTR, password : Win32cr::Foundation::PSTR) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_getpermissionmanagementsessionport : UInt16

    fun alljoyn_securityapplicationproxy_create(bus : Win32cr::Devices::AllJoyn::Alljoyn_busattachment, appBusName : Int8*, sessionId : UInt32) : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy

    fun alljoyn_securityapplicationproxy_destroy(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy) : Void

    fun alljoyn_securityapplicationproxy_claim(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, caKey : Int8*, identityCertificateChain : Int8*, groupId : UInt8*, groupSize : LibC::UIntPtrT, groupAuthority : Int8*, manifestsXmls : Int8**, manifestsCount : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_getmanifesttemplate(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, manifestTemplateXml : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_manifesttemplate_destroy(manifestTemplateXml : Int8*) : Void

    fun alljoyn_securityapplicationproxy_getapplicationstate(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, applicationState : Win32cr::Devices::AllJoyn::Alljoyn_applicationstate*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_getclaimcapabilities(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, capabilities : UInt16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, additionalInfo : UInt16*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_getpolicy(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, policyXml : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_getdefaultpolicy(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, policyXml : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_policy_destroy(policyXml : Int8*) : Void

    fun alljoyn_securityapplicationproxy_updatepolicy(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, policyXml : Int8*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_updateidentity(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, identityCertificateChain : Int8*, manifestsXmls : Int8**, manifestsCount : LibC::UIntPtrT) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_installmembership(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, membershipCertificateChain : Int8*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_reset(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_resetpolicy(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_startmanagement(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_endmanagement(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_geteccpublickey(proxy : Win32cr::Devices::AllJoyn::Alljoyn_securityapplicationproxy, eccPublicKey : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_eccpublickey_destroy(eccPublicKey : Int8*) : Void

    fun alljoyn_securityapplicationproxy_signmanifest(unsignedManifestXml : Int8*, identityCertificatePem : Int8*, signingPrivateKeyPem : Int8*, signedManifestXml : Int8**) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_manifest_destroy(signedManifestXml : Int8*) : Void

    fun alljoyn_securityapplicationproxy_computemanifestdigest(unsignedManifestXml : Int8*, identityCertificatePem : Int8*, digest : UInt8**, digestSize : LibC::UIntPtrT*) : Win32cr::Devices::AllJoyn::QStatus

    fun alljoyn_securityapplicationproxy_digest_destroy(digest : UInt8*) : Void

    fun alljoyn_securityapplicationproxy_setmanifestsignature(unsignedManifestXml : Int8*, identityCertificatePem : Int8*, signature : UInt8*, signatureSize : LibC::UIntPtrT, signedManifestXml : Int8**) : Win32cr::Devices::AllJoyn::QStatus

  end
end