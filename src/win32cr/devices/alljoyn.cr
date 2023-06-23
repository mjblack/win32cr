require "../foundation.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:msajapi.dll")]
{% else %}
@[Link("msajapi")]
{% end %}
lib LibWin32
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
  ALLJOYN_READ_READY = 1_u32
  ALLJOYN_WRITE_READY = 2_u32
  ALLJOYN_DISCONNECTED = 4_u32
  ALLJOYN_LITTLE_ENDIAN = 108_u8
  ALLJOYN_BIG_ENDIAN = 66_u8
  ALLJOYN_MESSAGE_DEFAULT_TIMEOUT = 25000_u32
  ALLJOYN_CRED_PASSWORD = 1_u16
  ALLJOYN_CRED_USER_NAME = 2_u16
  ALLJOYN_CRED_CERT_CHAIN = 4_u16
  ALLJOYN_CRED_PRIVATE_KEY = 8_u16
  ALLJOYN_CRED_LOGON_ENTRY = 16_u16
  ALLJOYN_CRED_EXPIRATION = 32_u16
  ALLJOYN_CRED_NEW_PASSWORD = 4097_u16
  ALLJOYN_CRED_ONE_TIME_PWD = 8193_u16
  ALLJOYN_PROP_ACCESS_READ = 1_u8
  ALLJOYN_PROP_ACCESS_WRITE = 2_u8
  ALLJOYN_PROP_ACCESS_RW = 3_u8
  ALLJOYN_MEMBER_ANNOTATE_NO_REPLY = 1_u8
  ALLJOYN_MEMBER_ANNOTATE_DEPRECATED = 2_u8
  ALLJOYN_MEMBER_ANNOTATE_SESSIONCAST = 4_u8
  ALLJOYN_MEMBER_ANNOTATE_SESSIONLESS = 8_u8
  ALLJOYN_MEMBER_ANNOTATE_UNICAST = 16_u8
  ALLJOYN_MEMBER_ANNOTATE_GLOBAL_BROADCAST = 32_u8

  type Alljoyn_abouticon_handle = Void
  type Alljoyn_abouticonobj_handle = Void
  type Alljoyn_abouticonproxy_handle = Void

  alias Alljoyn_applicationstatelistener_state_ptr = Proc(Int8*, Int8*, Alljoyn_applicationstate, Void*, Void)
  alias Alljoyn_keystorelistener_loadrequest_ptr = Proc(Void*, Alljoyn_keystorelistener, Alljoyn_keystore, QStatus)
  alias Alljoyn_keystorelistener_storerequest_ptr = Proc(Void*, Alljoyn_keystorelistener, Alljoyn_keystore, QStatus)
  alias Alljoyn_keystorelistener_acquireexclusivelock_ptr = Proc(Void*, Alljoyn_keystorelistener, QStatus)
  alias Alljoyn_keystorelistener_releaseexclusivelock_ptr = Proc(Void*, Alljoyn_keystorelistener, Void)
  alias Alljoyn_authlistener_requestcredentials_ptr = Proc(Void*, PSTR, PSTR, UInt16, PSTR, UInt16, Alljoyn_credentials, Int32)
  alias Alljoyn_authlistener_requestcredentialsasync_ptr = Proc(Void*, Alljoyn_authlistener, PSTR, PSTR, UInt16, PSTR, UInt16, Void*, QStatus)
  alias Alljoyn_authlistener_verifycredentials_ptr = Proc(Void*, PSTR, PSTR, Alljoyn_credentials, Int32)
  alias Alljoyn_authlistener_verifycredentialsasync_ptr = Proc(Void*, Alljoyn_authlistener, PSTR, PSTR, Alljoyn_credentials, Void*, QStatus)
  alias Alljoyn_authlistener_securityviolation_ptr = Proc(Void*, QStatus, Alljoyn_message, Void)
  alias Alljoyn_authlistener_authenticationcomplete_ptr = Proc(Void*, PSTR, PSTR, Int32, Void)
  alias Alljoyn_buslistener_listener_registered_ptr = Proc(Void*, Alljoyn_busattachment, Void)
  alias Alljoyn_buslistener_listener_unregistered_ptr = Proc(Void*, Void)
  alias Alljoyn_buslistener_found_advertised_name_ptr = Proc(Void*, PSTR, UInt16, PSTR, Void)
  alias Alljoyn_buslistener_lost_advertised_name_ptr = Proc(Void*, PSTR, UInt16, PSTR, Void)
  alias Alljoyn_buslistener_name_owner_changed_ptr = Proc(Void*, PSTR, PSTR, PSTR, Void)
  alias Alljoyn_buslistener_bus_stopping_ptr = Proc(Void*, Void)
  alias Alljoyn_buslistener_bus_disconnected_ptr = Proc(Void*, Void)
  alias Alljoyn_buslistener_bus_prop_changed_ptr = Proc(Void*, PSTR, Alljoyn_msgarg, Void)
  alias Alljoyn_interfacedescription_translation_callback_ptr = Proc(PSTR, PSTR, PSTR, PSTR)
  alias Alljoyn_messagereceiver_methodhandler_ptr = Proc(Alljoyn_busobject, Alljoyn_interfacedescription_member*, Alljoyn_message, Void)
  alias Alljoyn_messagereceiver_replyhandler_ptr = Proc(Alljoyn_message, Void*, Void)
  alias Alljoyn_messagereceiver_signalhandler_ptr = Proc(Alljoyn_interfacedescription_member*, PSTR, Alljoyn_message, Void)
  alias Alljoyn_busobject_prop_get_ptr = Proc(Void*, PSTR, PSTR, Alljoyn_msgarg, QStatus)
  alias Alljoyn_busobject_prop_set_ptr = Proc(Void*, PSTR, PSTR, Alljoyn_msgarg, QStatus)
  alias Alljoyn_busobject_object_registration_ptr = Proc(Void*, Void)
  alias Alljoyn_proxybusobject_listener_introspectcb_ptr = Proc(QStatus, Alljoyn_proxybusobject, Void*, Void)
  alias Alljoyn_proxybusobject_listener_getpropertycb_ptr = Proc(QStatus, Alljoyn_proxybusobject, Alljoyn_msgarg, Void*, Void)
  alias Alljoyn_proxybusobject_listener_getallpropertiescb_ptr = Proc(QStatus, Alljoyn_proxybusobject, Alljoyn_msgarg, Void*, Void)
  alias Alljoyn_proxybusobject_listener_setpropertycb_ptr = Proc(QStatus, Alljoyn_proxybusobject, Void*, Void)
  alias Alljoyn_proxybusobject_listener_propertieschanged_ptr = Proc(Alljoyn_proxybusobject, PSTR, Alljoyn_msgarg, Alljoyn_msgarg, Void*, Void)
  alias Alljoyn_permissionconfigurationlistener_factoryreset_ptr = Proc(Void*, QStatus)
  alias Alljoyn_permissionconfigurationlistener_policychanged_ptr = Proc(Void*, Void)
  alias Alljoyn_permissionconfigurationlistener_startmanagement_ptr = Proc(Void*, Void)
  alias Alljoyn_permissionconfigurationlistener_endmanagement_ptr = Proc(Void*, Void)
  alias Alljoyn_sessionlistener_sessionlost_ptr = Proc(Void*, UInt32, Alljoyn_sessionlostreason, Void)
  alias Alljoyn_sessionlistener_sessionmemberadded_ptr = Proc(Void*, UInt32, PSTR, Void)
  alias Alljoyn_sessionlistener_sessionmemberremoved_ptr = Proc(Void*, UInt32, PSTR, Void)
  alias Alljoyn_sessionportlistener_acceptsessionjoiner_ptr = Proc(Void*, UInt16, PSTR, Alljoyn_sessionopts, Int32)
  alias Alljoyn_sessionportlistener_sessionjoined_ptr = Proc(Void*, UInt16, UInt32, PSTR, Void)
  alias Alljoyn_about_announced_ptr = Proc(Void*, PSTR, UInt16, UInt16, Alljoyn_msgarg, Alljoyn_msgarg, Void)
  alias Alljoyn_busattachment_joinsessioncb_ptr = Proc(QStatus, UInt32, Alljoyn_sessionopts, Void*, Void)
  alias Alljoyn_busattachment_setlinktimeoutcb_ptr = Proc(QStatus, UInt32, Void*, Void)
  alias Alljoyn_aboutdatalistener_getaboutdata_ptr = Proc(Void*, Alljoyn_msgarg, PSTR, QStatus)
  alias Alljoyn_aboutdatalistener_getannouncedaboutdata_ptr = Proc(Void*, Alljoyn_msgarg, QStatus)
  alias Alljoyn_autopinger_destination_lost_ptr = Proc(Void*, PSTR, PSTR, Void)
  alias Alljoyn_autopinger_destination_found_ptr = Proc(Void*, PSTR, PSTR, Void)
  alias Alljoyn_observer_object_discovered_ptr = Proc(Void*, Alljoyn_proxybusobject_ref, Void)
  alias Alljoyn_observer_object_lost_ptr = Proc(Void*, Alljoyn_proxybusobject_ref, Void)


  enum Alljoyn_about_announceflag : Int32
    UNANNOUNCED = 0
    ANNOUNCED = 1
  end

  enum QStatus : Int32
    ER_OK = 0
    ER_FAIL = 1
    ER_UTF_CONVERSION_FAILED = 2
    ER_BUFFER_TOO_SMALL = 3
    ER_OS_ERROR = 4
    ER_OUT_OF_MEMORY = 5
    ER_SOCKET_BIND_ERROR = 6
    ER_INIT_FAILED = 7
    ER_WOULDBLOCK = 8
    ER_NOT_IMPLEMENTED = 9
    ER_TIMEOUT = 10
    ER_SOCK_OTHER_END_CLOSED = 11
    ER_BAD_ARG_1 = 12
    ER_BAD_ARG_2 = 13
    ER_BAD_ARG_3 = 14
    ER_BAD_ARG_4 = 15
    ER_BAD_ARG_5 = 16
    ER_BAD_ARG_6 = 17
    ER_BAD_ARG_7 = 18
    ER_BAD_ARG_8 = 19
    ER_INVALID_ADDRESS = 20
    ER_INVALID_DATA = 21
    ER_READ_ERROR = 22
    ER_WRITE_ERROR = 23
    ER_OPEN_FAILED = 24
    ER_PARSE_ERROR = 25
    ER_END_OF_DATA = 26
    ER_CONN_REFUSED = 27
    ER_BAD_ARG_COUNT = 28
    ER_WARNING = 29
    ER_EOF = 30
    ER_DEADLOCK = 31
    ER_COMMON_ERRORS = 4096
    ER_STOPPING_THREAD = 4097
    ER_ALERTED_THREAD = 4098
    ER_XML_MALFORMED = 4099
    ER_AUTH_FAIL = 4100
    ER_AUTH_USER_REJECT = 4101
    ER_NO_SUCH_ALARM = 4102
    ER_TIMER_FALLBEHIND = 4103
    ER_SSL_ERRORS = 4104
    ER_SSL_INIT = 4105
    ER_SSL_CONNECT = 4106
    ER_SSL_VERIFY = 4107
    ER_EXTERNAL_THREAD = 4108
    ER_CRYPTO_ERROR = 4109
    ER_CRYPTO_TRUNCATED = 4110
    ER_CRYPTO_KEY_UNAVAILABLE = 4111
    ER_BAD_HOSTNAME = 4112
    ER_CRYPTO_KEY_UNUSABLE = 4113
    ER_EMPTY_KEY_BLOB = 4114
    ER_CORRUPT_KEYBLOB = 4115
    ER_INVALID_KEY_ENCODING = 4116
    ER_DEAD_THREAD = 4117
    ER_THREAD_RUNNING = 4118
    ER_THREAD_STOPPING = 4119
    ER_BAD_STRING_ENCODING = 4120
    ER_CRYPTO_INSUFFICIENT_SECURITY = 4121
    ER_CRYPTO_ILLEGAL_PARAMETERS = 4122
    ER_CRYPTO_HASH_UNINITIALIZED = 4123
    ER_THREAD_NO_WAIT = 4124
    ER_TIMER_EXITING = 4125
    ER_INVALID_GUID = 4126
    ER_THREADPOOL_EXHAUSTED = 4127
    ER_THREADPOOL_STOPPING = 4128
    ER_INVALID_STREAM = 4129
    ER_TIMER_FULL = 4130
    ER_IODISPATCH_STOPPING = 4131
    ER_SLAP_INVALID_PACKET_LEN = 4132
    ER_SLAP_HDR_CHECKSUM_ERROR = 4133
    ER_SLAP_INVALID_PACKET_TYPE = 4134
    ER_SLAP_LEN_MISMATCH = 4135
    ER_SLAP_PACKET_TYPE_MISMATCH = 4136
    ER_SLAP_CRC_ERROR = 4137
    ER_SLAP_ERROR = 4138
    ER_SLAP_OTHER_END_CLOSED = 4139
    ER_TIMER_NOT_ALLOWED = 4140
    ER_NOT_CONN = 4141
    ER_XML_CONVERTER_ERROR = 8192
    ER_XML_INVALID_RULES_COUNT = 8193
    ER_XML_INTERFACE_MEMBERS_MISSING = 8194
    ER_XML_INVALID_MEMBER_TYPE = 8195
    ER_XML_INVALID_MEMBER_ACTION = 8196
    ER_XML_MEMBER_DENY_ACTION_WITH_OTHER = 8197
    ER_XML_INVALID_ANNOTATIONS_COUNT = 8198
    ER_XML_INVALID_ELEMENT_NAME = 8199
    ER_XML_INVALID_ATTRIBUTE_VALUE = 8200
    ER_XML_INVALID_SECURITY_LEVEL_ANNOTATION_VALUE = 8201
    ER_XML_INVALID_ELEMENT_CHILDREN_COUNT = 8202
    ER_XML_INVALID_POLICY_VERSION = 8203
    ER_XML_INVALID_POLICY_SERIAL_NUMBER = 8204
    ER_XML_INVALID_ACL_PEER_TYPE = 8205
    ER_XML_INVALID_ACL_PEER_CHILDREN_COUNT = 8206
    ER_XML_ACL_ALL_TYPE_PEER_WITH_OTHERS = 8207
    ER_XML_INVALID_ACL_PEER_PUBLIC_KEY = 8208
    ER_XML_ACL_PEER_NOT_UNIQUE = 8209
    ER_XML_ACL_PEER_PUBLIC_KEY_SET = 8210
    ER_XML_ACLS_MISSING = 8211
    ER_XML_ACL_PEERS_MISSING = 8212
    ER_XML_INVALID_OBJECT_PATH = 8213
    ER_XML_INVALID_INTERFACE_NAME = 8214
    ER_XML_INVALID_MEMBER_NAME = 8215
    ER_XML_INVALID_MANIFEST_VERSION = 8216
    ER_XML_INVALID_OID = 8217
    ER_XML_INVALID_BASE64 = 8218
    ER_XML_INTERFACE_NAME_NOT_UNIQUE = 8219
    ER_XML_MEMBER_NAME_NOT_UNIQUE = 8220
    ER_XML_OBJECT_PATH_NOT_UNIQUE = 8221
    ER_XML_ANNOTATION_NOT_UNIQUE = 8222
    ER_NONE = 65535
    ER_BUS_ERRORS = 36864
    ER_BUS_READ_ERROR = 36865
    ER_BUS_WRITE_ERROR = 36866
    ER_BUS_BAD_VALUE_TYPE = 36867
    ER_BUS_BAD_HEADER_FIELD = 36868
    ER_BUS_BAD_SIGNATURE = 36869
    ER_BUS_BAD_OBJ_PATH = 36870
    ER_BUS_BAD_MEMBER_NAME = 36871
    ER_BUS_BAD_INTERFACE_NAME = 36872
    ER_BUS_BAD_ERROR_NAME = 36873
    ER_BUS_BAD_BUS_NAME = 36874
    ER_BUS_NAME_TOO_LONG = 36875
    ER_BUS_BAD_LENGTH = 36876
    ER_BUS_BAD_VALUE = 36877
    ER_BUS_BAD_HDR_FLAGS = 36878
    ER_BUS_BAD_BODY_LEN = 36879
    ER_BUS_BAD_HEADER_LEN = 36880
    ER_BUS_UNKNOWN_SERIAL = 36881
    ER_BUS_UNKNOWN_PATH = 36882
    ER_BUS_UNKNOWN_INTERFACE = 36883
    ER_BUS_ESTABLISH_FAILED = 36884
    ER_BUS_UNEXPECTED_SIGNATURE = 36885
    ER_BUS_INTERFACE_MISSING = 36886
    ER_BUS_PATH_MISSING = 36887
    ER_BUS_MEMBER_MISSING = 36888
    ER_BUS_REPLY_SERIAL_MISSING = 36889
    ER_BUS_ERROR_NAME_MISSING = 36890
    ER_BUS_INTERFACE_NO_SUCH_MEMBER = 36891
    ER_BUS_NO_SUCH_OBJECT = 36892
    ER_BUS_OBJECT_NO_SUCH_MEMBER = 36893
    ER_BUS_OBJECT_NO_SUCH_INTERFACE = 36894
    ER_BUS_NO_SUCH_INTERFACE = 36895
    ER_BUS_MEMBER_NO_SUCH_SIGNATURE = 36896
    ER_BUS_NOT_NUL_TERMINATED = 36897
    ER_BUS_NO_SUCH_PROPERTY = 36898
    ER_BUS_SET_WRONG_SIGNATURE = 36899
    ER_BUS_PROPERTY_VALUE_NOT_SET = 36900
    ER_BUS_PROPERTY_ACCESS_DENIED = 36901
    ER_BUS_NO_TRANSPORTS = 36902
    ER_BUS_BAD_TRANSPORT_ARGS = 36903
    ER_BUS_NO_ROUTE = 36904
    ER_BUS_NO_ENDPOINT = 36905
    ER_BUS_BAD_SEND_PARAMETER = 36906
    ER_BUS_UNMATCHED_REPLY_SERIAL = 36907
    ER_BUS_BAD_SENDER_ID = 36908
    ER_BUS_TRANSPORT_NOT_STARTED = 36909
    ER_BUS_EMPTY_MESSAGE = 36910
    ER_BUS_NOT_OWNER = 36911
    ER_BUS_SET_PROPERTY_REJECTED = 36912
    ER_BUS_CONNECT_FAILED = 36913
    ER_BUS_REPLY_IS_ERROR_MESSAGE = 36914
    ER_BUS_NOT_AUTHENTICATING = 36915
    ER_BUS_NO_LISTENER = 36916
    ER_BUS_NOT_ALLOWED = 36918
    ER_BUS_WRITE_QUEUE_FULL = 36919
    ER_BUS_ENDPOINT_CLOSING = 36920
    ER_BUS_INTERFACE_MISMATCH = 36921
    ER_BUS_MEMBER_ALREADY_EXISTS = 36922
    ER_BUS_PROPERTY_ALREADY_EXISTS = 36923
    ER_BUS_IFACE_ALREADY_EXISTS = 36924
    ER_BUS_ERROR_RESPONSE = 36925
    ER_BUS_BAD_XML = 36926
    ER_BUS_BAD_CHILD_PATH = 36927
    ER_BUS_OBJ_ALREADY_EXISTS = 36928
    ER_BUS_OBJ_NOT_FOUND = 36929
    ER_BUS_CANNOT_EXPAND_MESSAGE = 36930
    ER_BUS_NOT_COMPRESSED = 36931
    ER_BUS_ALREADY_CONNECTED = 36932
    ER_BUS_NOT_CONNECTED = 36933
    ER_BUS_ALREADY_LISTENING = 36934
    ER_BUS_KEY_UNAVAILABLE = 36935
    ER_BUS_TRUNCATED = 36936
    ER_BUS_KEY_STORE_NOT_LOADED = 36937
    ER_BUS_NO_AUTHENTICATION_MECHANISM = 36938
    ER_BUS_BUS_ALREADY_STARTED = 36939
    ER_BUS_BUS_NOT_STARTED = 36940
    ER_BUS_KEYBLOB_OP_INVALID = 36941
    ER_BUS_INVALID_HEADER_CHECKSUM = 36942
    ER_BUS_MESSAGE_NOT_ENCRYPTED = 36943
    ER_BUS_INVALID_HEADER_SERIAL = 36944
    ER_BUS_TIME_TO_LIVE_EXPIRED = 36945
    ER_BUS_HDR_EXPANSION_INVALID = 36946
    ER_BUS_MISSING_COMPRESSION_TOKEN = 36947
    ER_BUS_NO_PEER_GUID = 36948
    ER_BUS_MESSAGE_DECRYPTION_FAILED = 36949
    ER_BUS_SECURITY_FATAL = 36950
    ER_BUS_KEY_EXPIRED = 36951
    ER_BUS_CORRUPT_KEYSTORE = 36952
    ER_BUS_NO_CALL_FOR_REPLY = 36953
    ER_BUS_NOT_A_COMPLETE_TYPE = 36954
    ER_BUS_POLICY_VIOLATION = 36955
    ER_BUS_NO_SUCH_SERVICE = 36956
    ER_BUS_TRANSPORT_NOT_AVAILABLE = 36957
    ER_BUS_INVALID_AUTH_MECHANISM = 36958
    ER_BUS_KEYSTORE_VERSION_MISMATCH = 36959
    ER_BUS_BLOCKING_CALL_NOT_ALLOWED = 36960
    ER_BUS_SIGNATURE_MISMATCH = 36961
    ER_BUS_STOPPING = 36962
    ER_BUS_METHOD_CALL_ABORTED = 36963
    ER_BUS_CANNOT_ADD_INTERFACE = 36964
    ER_BUS_CANNOT_ADD_HANDLER = 36965
    ER_BUS_KEYSTORE_NOT_LOADED = 36966
    ER_BUS_NO_SUCH_HANDLE = 36971
    ER_BUS_HANDLES_NOT_ENABLED = 36972
    ER_BUS_HANDLES_MISMATCH = 36973
    ER_BUS_NO_SESSION = 36975
    ER_BUS_ELEMENT_NOT_FOUND = 36976
    ER_BUS_NOT_A_DICTIONARY = 36977
    ER_BUS_WAIT_FAILED = 36978
    ER_BUS_BAD_SESSION_OPTS = 36980
    ER_BUS_CONNECTION_REJECTED = 36981
    ER_DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER = 36982
    ER_DBUS_REQUEST_NAME_REPLY_IN_QUEUE = 36983
    ER_DBUS_REQUEST_NAME_REPLY_EXISTS = 36984
    ER_DBUS_REQUEST_NAME_REPLY_ALREADY_OWNER = 36985
    ER_DBUS_RELEASE_NAME_REPLY_RELEASED = 36986
    ER_DBUS_RELEASE_NAME_REPLY_NON_EXISTENT = 36987
    ER_DBUS_RELEASE_NAME_REPLY_NOT_OWNER = 36988
    ER_DBUS_START_REPLY_ALREADY_RUNNING = 36990
    ER_ALLJOYN_BINDSESSIONPORT_REPLY_ALREADY_EXISTS = 36992
    ER_ALLJOYN_BINDSESSIONPORT_REPLY_FAILED = 36993
    ER_ALLJOYN_JOINSESSION_REPLY_NO_SESSION = 36995
    ER_ALLJOYN_JOINSESSION_REPLY_UNREACHABLE = 36996
    ER_ALLJOYN_JOINSESSION_REPLY_CONNECT_FAILED = 36997
    ER_ALLJOYN_JOINSESSION_REPLY_REJECTED = 36998
    ER_ALLJOYN_JOINSESSION_REPLY_BAD_SESSION_OPTS = 36999
    ER_ALLJOYN_JOINSESSION_REPLY_FAILED = 37000
    ER_ALLJOYN_LEAVESESSION_REPLY_NO_SESSION = 37002
    ER_ALLJOYN_LEAVESESSION_REPLY_FAILED = 37003
    ER_ALLJOYN_ADVERTISENAME_REPLY_TRANSPORT_NOT_AVAILABLE = 37004
    ER_ALLJOYN_ADVERTISENAME_REPLY_ALREADY_ADVERTISING = 37005
    ER_ALLJOYN_ADVERTISENAME_REPLY_FAILED = 37006
    ER_ALLJOYN_CANCELADVERTISENAME_REPLY_FAILED = 37008
    ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_TRANSPORT_NOT_AVAILABLE = 37009
    ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_ALREADY_DISCOVERING = 37010
    ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_FAILED = 37011
    ER_ALLJOYN_CANCELFINDADVERTISEDNAME_REPLY_FAILED = 37013
    ER_BUS_UNEXPECTED_DISPOSITION = 37014
    ER_BUS_INTERFACE_ACTIVATED = 37015
    ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_BAD_PORT = 37016
    ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_FAILED = 37017
    ER_ALLJOYN_BINDSESSIONPORT_REPLY_INVALID_OPTS = 37018
    ER_ALLJOYN_JOINSESSION_REPLY_ALREADY_JOINED = 37019
    ER_BUS_SELF_CONNECT = 37020
    ER_BUS_SECURITY_NOT_ENABLED = 37021
    ER_BUS_LISTENER_ALREADY_SET = 37022
    ER_BUS_PEER_AUTH_VERSION_MISMATCH = 37023
    ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NOT_SUPPORTED = 37024
    ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NO_DEST_SUPPORT = 37025
    ER_ALLJOYN_SETLINKTIMEOUT_REPLY_FAILED = 37026
    ER_ALLJOYN_ACCESS_PERMISSION_WARNING = 37027
    ER_ALLJOYN_ACCESS_PERMISSION_ERROR = 37028
    ER_BUS_DESTINATION_NOT_AUTHENTICATED = 37029
    ER_BUS_ENDPOINT_REDIRECTED = 37030
    ER_BUS_AUTHENTICATION_PENDING = 37031
    ER_BUS_NOT_AUTHORIZED = 37032
    ER_PACKET_BUS_NO_SUCH_CHANNEL = 37033
    ER_PACKET_BAD_FORMAT = 37034
    ER_PACKET_CONNECT_TIMEOUT = 37035
    ER_PACKET_CHANNEL_FAIL = 37036
    ER_PACKET_TOO_LARGE = 37037
    ER_PACKET_BAD_PARAMETER = 37038
    ER_PACKET_BAD_CRC = 37039
    ER_RENDEZVOUS_SERVER_DEACTIVATED_USER = 37067
    ER_RENDEZVOUS_SERVER_UNKNOWN_USER = 37068
    ER_UNABLE_TO_CONNECT_TO_RENDEZVOUS_SERVER = 37069
    ER_NOT_CONNECTED_TO_RENDEZVOUS_SERVER = 37070
    ER_UNABLE_TO_SEND_MESSAGE_TO_RENDEZVOUS_SERVER = 37071
    ER_INVALID_RENDEZVOUS_SERVER_INTERFACE_MESSAGE = 37072
    ER_INVALID_PERSISTENT_CONNECTION_MESSAGE_RESPONSE = 37073
    ER_INVALID_ON_DEMAND_CONNECTION_MESSAGE_RESPONSE = 37074
    ER_INVALID_HTTP_METHOD_USED_FOR_RENDEZVOUS_SERVER_INTERFACE_MESSAGE = 37075
    ER_RENDEZVOUS_SERVER_ERR500_INTERNAL_ERROR = 37076
    ER_RENDEZVOUS_SERVER_ERR503_STATUS_UNAVAILABLE = 37077
    ER_RENDEZVOUS_SERVER_ERR401_UNAUTHORIZED_REQUEST = 37078
    ER_RENDEZVOUS_SERVER_UNRECOVERABLE_ERROR = 37079
    ER_RENDEZVOUS_SERVER_ROOT_CERTIFICATE_UNINITIALIZED = 37080
    ER_BUS_NO_SUCH_ANNOTATION = 37081
    ER_BUS_ANNOTATION_ALREADY_EXISTS = 37082
    ER_SOCK_CLOSING = 37083
    ER_NO_SUCH_DEVICE = 37084
    ER_P2P = 37085
    ER_P2P_TIMEOUT = 37086
    ER_P2P_NOT_CONNECTED = 37087
    ER_BAD_TRANSPORT_MASK = 37088
    ER_PROXIMITY_CONNECTION_ESTABLISH_FAIL = 37089
    ER_PROXIMITY_NO_PEERS_FOUND = 37090
    ER_BUS_OBJECT_NOT_REGISTERED = 37091
    ER_P2P_DISABLED = 37092
    ER_P2P_BUSY = 37093
    ER_BUS_INCOMPATIBLE_DAEMON = 37094
    ER_P2P_NO_GO = 37095
    ER_P2P_NO_STA = 37096
    ER_P2P_FORBIDDEN = 37097
    ER_ALLJOYN_ONAPPSUSPEND_REPLY_FAILED = 37098
    ER_ALLJOYN_ONAPPSUSPEND_REPLY_UNSUPPORTED = 37099
    ER_ALLJOYN_ONAPPRESUME_REPLY_FAILED = 37100
    ER_ALLJOYN_ONAPPRESUME_REPLY_UNSUPPORTED = 37101
    ER_BUS_NO_SUCH_MESSAGE = 37102
    ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_NO_SESSION = 37103
    ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_BINDER = 37104
    ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_MULTIPOINT = 37105
    ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_FOUND = 37106
    ER_ALLJOYN_REMOVESESSIONMEMBER_INCOMPATIBLE_REMOTE_DAEMON = 37107
    ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_FAILED = 37108
    ER_BUS_REMOVED_BY_BINDER = 37109
    ER_BUS_MATCH_RULE_NOT_FOUND = 37110
    ER_ALLJOYN_PING_FAILED = 37111
    ER_ALLJOYN_PING_REPLY_UNREACHABLE = 37112
    ER_UDP_MSG_TOO_LONG = 37113
    ER_UDP_DEMUX_NO_ENDPOINT = 37114
    ER_UDP_NO_NETWORK = 37115
    ER_UDP_UNEXPECTED_LENGTH = 37116
    ER_UDP_UNEXPECTED_FLOW = 37117
    ER_UDP_DISCONNECT = 37118
    ER_UDP_NOT_IMPLEMENTED = 37119
    ER_UDP_NO_LISTENER = 37120
    ER_UDP_STOPPING = 37121
    ER_ARDP_BACKPRESSURE = 37122
    ER_UDP_BACKPRESSURE = 37123
    ER_ARDP_INVALID_STATE = 37124
    ER_ARDP_TTL_EXPIRED = 37125
    ER_ARDP_PERSIST_TIMEOUT = 37126
    ER_ARDP_PROBE_TIMEOUT = 37127
    ER_ARDP_REMOTE_CONNECTION_RESET = 37128
    ER_UDP_BUSHELLO = 37129
    ER_UDP_MESSAGE = 37130
    ER_UDP_INVALID = 37131
    ER_UDP_UNSUPPORTED = 37132
    ER_UDP_ENDPOINT_STALLED = 37133
    ER_ARDP_INVALID_RESPONSE = 37134
    ER_ARDP_INVALID_CONNECTION = 37135
    ER_UDP_LOCAL_DISCONNECT = 37136
    ER_UDP_EARLY_EXIT = 37137
    ER_UDP_LOCAL_DISCONNECT_FAIL = 37138
    ER_ARDP_DISCONNECTING = 37139
    ER_ALLJOYN_PING_REPLY_INCOMPATIBLE_REMOTE_ROUTING_NODE = 37140
    ER_ALLJOYN_PING_REPLY_TIMEOUT = 37141
    ER_ALLJOYN_PING_REPLY_UNKNOWN_NAME = 37142
    ER_ALLJOYN_PING_REPLY_FAILED = 37143
    ER_TCP_MAX_UNTRUSTED = 37144
    ER_ALLJOYN_PING_REPLY_IN_PROGRESS = 37145
    ER_LANGUAGE_NOT_SUPPORTED = 37146
    ER_ABOUT_FIELD_ALREADY_SPECIFIED = 37147
    ER_UDP_NOT_DISCONNECTED = 37148
    ER_UDP_ENDPOINT_NOT_STARTED = 37149
    ER_UDP_ENDPOINT_REMOVED = 37150
    ER_ARDP_VERSION_NOT_SUPPORTED = 37151
    ER_CONNECTION_LIMIT_EXCEEDED = 37152
    ER_ARDP_WRITE_BLOCKED = 37153
    ER_PERMISSION_DENIED = 37154
    ER_ABOUT_DEFAULT_LANGUAGE_NOT_SPECIFIED = 37155
    ER_ABOUT_SESSIONPORT_NOT_BOUND = 37156
    ER_ABOUT_ABOUTDATA_MISSING_REQUIRED_FIELD = 37157
    ER_ABOUT_INVALID_ABOUTDATA_LISTENER = 37158
    ER_BUS_PING_GROUP_NOT_FOUND = 37159
    ER_BUS_REMOVED_BY_BINDER_SELF = 37160
    ER_INVALID_CONFIG = 37161
    ER_ABOUT_INVALID_ABOUTDATA_FIELD_VALUE = 37162
    ER_ABOUT_INVALID_ABOUTDATA_FIELD_APPID_SIZE = 37163
    ER_BUS_TRANSPORT_ACCESS_DENIED = 37164
    ER_INVALID_CERTIFICATE = 37165
    ER_CERTIFICATE_NOT_FOUND = 37166
    ER_DUPLICATE_CERTIFICATE = 37167
    ER_UNKNOWN_CERTIFICATE = 37168
    ER_MISSING_DIGEST_IN_CERTIFICATE = 37169
    ER_DIGEST_MISMATCH = 37170
    ER_DUPLICATE_KEY = 37171
    ER_NO_COMMON_TRUST = 37172
    ER_MANIFEST_NOT_FOUND = 37173
    ER_INVALID_CERT_CHAIN = 37174
    ER_NO_TRUST_ANCHOR = 37175
    ER_INVALID_APPLICATION_STATE = 37176
    ER_FEATURE_NOT_AVAILABLE = 37177
    ER_KEY_STORE_ALREADY_INITIALIZED = 37178
    ER_KEY_STORE_ID_NOT_YET_SET = 37179
    ER_POLICY_NOT_NEWER = 37180
    ER_MANIFEST_REJECTED = 37181
    ER_INVALID_CERTIFICATE_USAGE = 37182
    ER_INVALID_SIGNAL_EMISSION_TYPE = 37183
    ER_APPLICATION_STATE_LISTENER_ALREADY_EXISTS = 37184
    ER_APPLICATION_STATE_LISTENER_NO_SUCH_LISTENER = 37185
    ER_MANAGEMENT_ALREADY_STARTED = 37186
    ER_MANAGEMENT_NOT_STARTED = 37187
    ER_BUS_DESCRIPTION_ALREADY_EXISTS = 37188
  end

  enum Alljoyn_typeid : Int32
    ALLJOYN_INVALID = 0
    ALLJOYN_ARRAY = 97
    ALLJOYN_BOOLEAN = 98
    ALLJOYN_DOUBLE = 100
    ALLJOYN_DICT_ENTRY = 101
    ALLJOYN_SIGNATURE = 103
    ALLJOYN_HANDLE = 104
    ALLJOYN_INT32 = 105
    ALLJOYN_INT16 = 110
    ALLJOYN_OBJECT_PATH = 111
    ALLJOYN_UINT16 = 113
    ALLJOYN_STRUCT = 114
    ALLJOYN_STRING = 115
    ALLJOYN_UINT64 = 116
    ALLJOYN_UINT32 = 117
    ALLJOYN_VARIANT = 118
    ALLJOYN_INT64 = 120
    ALLJOYN_BYTE = 121
    ALLJOYN_STRUCT_OPEN = 40
    ALLJOYN_STRUCT_CLOSE = 41
    ALLJOYN_DICT_ENTRY_OPEN = 123
    ALLJOYN_DICT_ENTRY_CLOSE = 125
    ALLJOYN_BOOLEAN_ARRAY = 25185
    ALLJOYN_DOUBLE_ARRAY = 25697
    ALLJOYN_INT32_ARRAY = 26977
    ALLJOYN_INT16_ARRAY = 28257
    ALLJOYN_UINT16_ARRAY = 29025
    ALLJOYN_UINT64_ARRAY = 29793
    ALLJOYN_UINT32_ARRAY = 30049
    ALLJOYN_INT64_ARRAY = 30817
    ALLJOYN_BYTE_ARRAY = 31073
    ALLJOYN_WILDCARD = 42
  end

  enum Alljoyn_applicationstate : Int32
    NOT_CLAIMABLE = 0
    CLAIMABLE = 1
    CLAIMED = 2
    NEED_UPDATE = 3
  end

  enum Alljoyn_claimcapability_masks : Int32
    CAPABLE_ECDHE_NULL = 1
    CAPABLE_ECDHE_ECDSA = 4
    CAPABLE_ECDHE_SPEKE = 8
  end

  enum Alljoyn_claimcapabilityadditionalinfo_masks : Int32
    PASSWORD_GENERATED_BY_SECURITY_MANAGER = 1
    PASSWORD_GENERATED_BY_APPLICATION = 2
  end

  enum Alljoyn_messagetype : Int32
    ALLJOYN_MESSAGE_INVALID = 0
    ALLJOYN_MESSAGE_METHOD_CALL = 1
    ALLJOYN_MESSAGE_METHOD_RET = 2
    ALLJOYN_MESSAGE_ERROR = 3
    ALLJOYN_MESSAGE_SIGNAL = 4
  end

  enum Alljoyn_interfacedescription_securitypolicy : Int32
    AJ_IFC_SECURITY_INHERIT = 0
    AJ_IFC_SECURITY_REQUIRED = 1
    AJ_IFC_SECURITY_OFF = 2
  end

  enum Alljoyn_sessionlostreason : Int32
    ALLJOYN_SESSIONLOST_INVALID = 0
    ALLJOYN_SESSIONLOST_REMOTE_END_LEFT_SESSION = 1
    ALLJOYN_SESSIONLOST_REMOTE_END_CLOSED_ABRUPTLY = 2
    ALLJOYN_SESSIONLOST_REMOVED_BY_BINDER = 3
    ALLJOYN_SESSIONLOST_LINK_TIMEOUT = 4
    ALLJOYN_SESSIONLOST_REASON_OTHER = 5
  end

  struct Alljoyn_certificateid
    serial : UInt8*
    serial_len : LibC::UINT_PTR
    issuer_public_key : Int8*
    issuer_aki : UInt8*
    issuer_aki_len : LibC::UINT_PTR
  end
  struct Alljoyn_certificateidarray
    count : LibC::UINT_PTR
    ids : Alljoyn_certificateid*
  end
  struct Alljoyn_manifestarray
    count : LibC::UINT_PTR
    xmls : Int8**
  end
  struct Alljoyn_applicationstatelistener_callbacks
    state : Alljoyn_applicationstatelistener_state_ptr
  end
  struct Alljoyn_keystorelistener_callbacks
    load_request : Alljoyn_keystorelistener_loadrequest_ptr
    store_request : Alljoyn_keystorelistener_storerequest_ptr
  end
  struct Alljoyn_keystorelistener_with_synchronization_callbacks
    load_request : Alljoyn_keystorelistener_loadrequest_ptr
    store_request : Alljoyn_keystorelistener_storerequest_ptr
    acquire_exclusive_lock : Alljoyn_keystorelistener_acquireexclusivelock_ptr
    release_exclusive_lock : Alljoyn_keystorelistener_releaseexclusivelock_ptr
  end
  struct Alljoyn_authlistener_callbacks
    request_credentials : Alljoyn_authlistener_requestcredentials_ptr
    verify_credentials : Alljoyn_authlistener_verifycredentials_ptr
    security_violation : Alljoyn_authlistener_securityviolation_ptr
    authentication_complete : Alljoyn_authlistener_authenticationcomplete_ptr
  end
  struct Alljoyn_authlistenerasync_callbacks
    request_credentials : Alljoyn_authlistener_requestcredentialsasync_ptr
    verify_credentials : Alljoyn_authlistener_verifycredentialsasync_ptr
    security_violation : Alljoyn_authlistener_securityviolation_ptr
    authentication_complete : Alljoyn_authlistener_authenticationcomplete_ptr
  end
  struct Alljoyn_buslistener_callbacks
    listener_registered : Alljoyn_buslistener_listener_registered_ptr
    listener_unregistered : Alljoyn_buslistener_listener_unregistered_ptr
    found_advertised_name : Alljoyn_buslistener_found_advertised_name_ptr
    lost_advertised_name : Alljoyn_buslistener_lost_advertised_name_ptr
    name_owner_changed : Alljoyn_buslistener_name_owner_changed_ptr
    bus_stopping : Alljoyn_buslistener_bus_stopping_ptr
    bus_disconnected : Alljoyn_buslistener_bus_disconnected_ptr
    property_changed : Alljoyn_buslistener_bus_prop_changed_ptr
  end
  struct Alljoyn_interfacedescription_member
    iface : Alljoyn_interfacedescription
    member_type : Alljoyn_messagetype
    name : PSTR
    signature : PSTR
    return_signature : PSTR
    arg_names : PSTR
    internal_member : Void*
  end
  struct Alljoyn_interfacedescription_property
    name : PSTR
    signature : PSTR
    access : UInt8
    internal_property : Void*
  end
  struct Alljoyn_busobject_callbacks
    property_get : Alljoyn_busobject_prop_get_ptr
    property_set : Alljoyn_busobject_prop_set_ptr
    object_registered : Alljoyn_busobject_object_registration_ptr
    object_unregistered : Alljoyn_busobject_object_registration_ptr
  end
  struct Alljoyn_busobject_methodentry
    member : Alljoyn_interfacedescription_member*
    method_handler : Alljoyn_messagereceiver_methodhandler_ptr
  end
  struct Alljoyn_permissionconfigurationlistener_callbacks
    factory_reset : Alljoyn_permissionconfigurationlistener_factoryreset_ptr
    policy_changed : Alljoyn_permissionconfigurationlistener_policychanged_ptr
    start_management : Alljoyn_permissionconfigurationlistener_startmanagement_ptr
    end_management : Alljoyn_permissionconfigurationlistener_endmanagement_ptr
  end
  struct Alljoyn_sessionlistener_callbacks
    session_lost : Alljoyn_sessionlistener_sessionlost_ptr
    session_member_added : Alljoyn_sessionlistener_sessionmemberadded_ptr
    session_member_removed : Alljoyn_sessionlistener_sessionmemberremoved_ptr
  end
  struct Alljoyn_sessionportlistener_callbacks
    accept_session_joiner : Alljoyn_sessionportlistener_acceptsessionjoiner_ptr
    session_joined : Alljoyn_sessionportlistener_sessionjoined_ptr
  end
  struct Alljoyn_aboutlistener_callback
    about_listener_announced : Alljoyn_about_announced_ptr
  end
  struct Alljoyn_aboutdatalistener_callbacks
    about_datalistener_getaboutdata : Alljoyn_aboutdatalistener_getaboutdata_ptr
    about_datalistener_getannouncedaboutdata : Alljoyn_aboutdatalistener_getannouncedaboutdata_ptr
  end
  struct Alljoyn_pinglistener_callback
    destination_found : Alljoyn_autopinger_destination_found_ptr
    destination_lost : Alljoyn_autopinger_destination_lost_ptr
  end
  struct Alljoyn_observerlistener_callback
    object_discovered : Alljoyn_observer_object_discovered_ptr
    object_lost : Alljoyn_observer_object_lost_ptr
  end


  # Params # connectionspec : LibC::LPWSTR [In]
  fun AllJoynConnectToBus(connectionspec : LibC::LPWSTR) : LibC::HANDLE

  # Params # bushandle : LibC::HANDLE [In]
  fun AllJoynCloseBusHandle(bushandle : LibC::HANDLE) : LibC::BOOL

  # Params # connectedbushandle : LibC::HANDLE [In],buffer : Void* [In],bytestowrite : UInt32 [In],bytestransferred : UInt32* [In],reserved : Void* [In]
  fun AllJoynSendToBus(connectedbushandle : LibC::HANDLE, buffer : Void*, bytestowrite : UInt32, bytestransferred : UInt32*, reserved : Void*) : LibC::BOOL

  # Params # connectedbushandle : LibC::HANDLE [In],buffer : Void* [In],bytestoread : UInt32 [In],bytestransferred : UInt32* [In],reserved : Void* [In]
  fun AllJoynReceiveFromBus(connectedbushandle : LibC::HANDLE, buffer : Void*, bytestoread : UInt32, bytestransferred : UInt32*, reserved : Void*) : LibC::BOOL

  # Params # connectedbushandle : LibC::HANDLE [In],eventhandle : LibC::HANDLE [In],eventtypes : UInt32 [In]
  fun AllJoynEventSelect(connectedbushandle : LibC::HANDLE, eventhandle : LibC::HANDLE, eventtypes : UInt32) : LibC::BOOL

  # Params # connectedbushandle : LibC::HANDLE [In],eventtoreset : LibC::HANDLE [In],eventtypes : UInt32* [In]
  fun AllJoynEnumEvents(connectedbushandle : LibC::HANDLE, eventtoreset : LibC::HANDLE, eventtypes : UInt32*) : LibC::BOOL

  # Params # outbuffersize : UInt32 [In],inbuffersize : UInt32 [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In]
  fun AllJoynCreateBus(outbuffersize : UInt32, inbuffersize : UInt32, lpsecurityattributes : SECURITY_ATTRIBUTES*) : LibC::HANDLE

  # Params # serverbushandle : LibC::HANDLE [In],abortevent : LibC::HANDLE [In]
  fun AllJoynAcceptBusConnection(serverbushandle : LibC::HANDLE, abortevent : LibC::HANDLE) : UInt32

  # Params # 
  fun alljoyn_unity_deferred_callbacks_process : Int32

  # Params # mainthread_only : Int32 [In]
  fun alljoyn_unity_set_deferred_callback_mainthread_only(mainthread_only : Int32) : Void

  # Params # status : QStatus [In]
  fun QCC_StatusText(status : QStatus) : PSTR

  # Params # 
  fun alljoyn_msgarg_create : Alljoyn_msgarg

  # Params # signature : PSTR [In]
  fun alljoyn_msgarg_create_and_set(signature : PSTR) : Alljoyn_msgarg

  # Params # arg : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_destroy(arg : Alljoyn_msgarg) : Void

  # Params # size : LibC::UINT_PTR [In]
  fun alljoyn_msgarg_array_create(size : LibC::UINT_PTR) : Alljoyn_msgarg

  # Params # arg : Alljoyn_msgarg [In],index : LibC::UINT_PTR [In]
  fun alljoyn_msgarg_array_element(arg : Alljoyn_msgarg, index : LibC::UINT_PTR) : Alljoyn_msgarg

  # Params # arg : Alljoyn_msgarg [In],signature : PSTR [In]
  fun alljoyn_msgarg_set(arg : Alljoyn_msgarg, signature : PSTR) : QStatus

  # Params # arg : Alljoyn_msgarg [In],signature : PSTR [In]
  fun alljoyn_msgarg_get(arg : Alljoyn_msgarg, signature : PSTR) : QStatus

  # Params # source : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_copy(source : Alljoyn_msgarg) : Alljoyn_msgarg

  # Params # destination : Alljoyn_msgarg [In],source : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_clone(destination : Alljoyn_msgarg, source : Alljoyn_msgarg) : Void

  # Params # lhv : Alljoyn_msgarg [In],rhv : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_equal(lhv : Alljoyn_msgarg, rhv : Alljoyn_msgarg) : Int32

  # Params # args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR* [In],signature : PSTR [In]
  fun alljoyn_msgarg_array_set(args : Alljoyn_msgarg, numargs : LibC::UINT_PTR*, signature : PSTR) : QStatus

  # Params # args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In],signature : PSTR [In]
  fun alljoyn_msgarg_array_get(args : Alljoyn_msgarg, numargs : LibC::UINT_PTR, signature : PSTR) : QStatus

  # Params # arg : Alljoyn_msgarg [In],str : PSTR [In],buf : LibC::UINT_PTR [In],indent : LibC::UINT_PTR [In]
  fun alljoyn_msgarg_tostring(arg : Alljoyn_msgarg, str : PSTR, buf : LibC::UINT_PTR, indent : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In],str : PSTR [In],buf : LibC::UINT_PTR [In],indent : LibC::UINT_PTR [In]
  fun alljoyn_msgarg_array_tostring(args : Alljoyn_msgarg, numargs : LibC::UINT_PTR, str : PSTR, buf : LibC::UINT_PTR, indent : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # arg : Alljoyn_msgarg [In],str : PSTR [In],buf : LibC::UINT_PTR [In]
  fun alljoyn_msgarg_signature(arg : Alljoyn_msgarg, str : PSTR, buf : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # values : Alljoyn_msgarg [In],numvalues : LibC::UINT_PTR [In],str : PSTR [In],buf : LibC::UINT_PTR [In]
  fun alljoyn_msgarg_array_signature(values : Alljoyn_msgarg, numvalues : LibC::UINT_PTR, str : PSTR, buf : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # arg : Alljoyn_msgarg [In],signature : PSTR [In]
  fun alljoyn_msgarg_hassignature(arg : Alljoyn_msgarg, signature : PSTR) : Int32

  # Params # arg : Alljoyn_msgarg [In],elemsig : PSTR [In]
  fun alljoyn_msgarg_getdictelement(arg : Alljoyn_msgarg, elemsig : PSTR) : QStatus

  # Params # arg : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_gettype(arg : Alljoyn_msgarg) : Alljoyn_typeid

  # Params # arg : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_clear(arg : Alljoyn_msgarg) : Void

  # Params # arg : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_stabilize(arg : Alljoyn_msgarg) : Void

  # Params # args : Alljoyn_msgarg [In],argoffset : LibC::UINT_PTR [In],numargs : LibC::UINT_PTR* [In],signature : PSTR [In]
  fun alljoyn_msgarg_array_set_offset(args : Alljoyn_msgarg, argoffset : LibC::UINT_PTR, numargs : LibC::UINT_PTR*, signature : PSTR) : QStatus

  # Params # arg : Alljoyn_msgarg [In],signature : PSTR [In]
  fun alljoyn_msgarg_set_and_stabilize(arg : Alljoyn_msgarg, signature : PSTR) : QStatus

  # Params # arg : Alljoyn_msgarg [In],y : UInt8 [In]
  fun alljoyn_msgarg_set_uint8(arg : Alljoyn_msgarg, y : UInt8) : QStatus

  # Params # arg : Alljoyn_msgarg [In],b : Int32 [In]
  fun alljoyn_msgarg_set_bool(arg : Alljoyn_msgarg, b : Int32) : QStatus

  # Params # arg : Alljoyn_msgarg [In],n : Int16 [In]
  fun alljoyn_msgarg_set_int16(arg : Alljoyn_msgarg, n : Int16) : QStatus

  # Params # arg : Alljoyn_msgarg [In],q : UInt16 [In]
  fun alljoyn_msgarg_set_uint16(arg : Alljoyn_msgarg, q : UInt16) : QStatus

  # Params # arg : Alljoyn_msgarg [In],i : Int32 [In]
  fun alljoyn_msgarg_set_int32(arg : Alljoyn_msgarg, i : Int32) : QStatus

  # Params # arg : Alljoyn_msgarg [In],u : UInt32 [In]
  fun alljoyn_msgarg_set_uint32(arg : Alljoyn_msgarg, u : UInt32) : QStatus

  # Params # arg : Alljoyn_msgarg [In],x : Int64 [In]
  fun alljoyn_msgarg_set_int64(arg : Alljoyn_msgarg, x : Int64) : QStatus

  # Params # arg : Alljoyn_msgarg [In],t : UInt64 [In]
  fun alljoyn_msgarg_set_uint64(arg : Alljoyn_msgarg, t : UInt64) : QStatus

  # Params # arg : Alljoyn_msgarg [In],d : Float64 [In]
  fun alljoyn_msgarg_set_double(arg : Alljoyn_msgarg, d : Float64) : QStatus

  # Params # arg : Alljoyn_msgarg [In],s : PSTR [In]
  fun alljoyn_msgarg_set_string(arg : Alljoyn_msgarg, s : PSTR) : QStatus

  # Params # arg : Alljoyn_msgarg [In],o : PSTR [In]
  fun alljoyn_msgarg_set_objectpath(arg : Alljoyn_msgarg, o : PSTR) : QStatus

  # Params # arg : Alljoyn_msgarg [In],g : PSTR [In]
  fun alljoyn_msgarg_set_signature(arg : Alljoyn_msgarg, g : PSTR) : QStatus

  # Params # arg : Alljoyn_msgarg [In],y : UInt8* [In]
  fun alljoyn_msgarg_get_uint8(arg : Alljoyn_msgarg, y : UInt8*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],b : Int32* [In]
  fun alljoyn_msgarg_get_bool(arg : Alljoyn_msgarg, b : Int32*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],n : Int16* [In]
  fun alljoyn_msgarg_get_int16(arg : Alljoyn_msgarg, n : Int16*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],q : UInt16* [In]
  fun alljoyn_msgarg_get_uint16(arg : Alljoyn_msgarg, q : UInt16*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],i : Int32* [In]
  fun alljoyn_msgarg_get_int32(arg : Alljoyn_msgarg, i : Int32*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],u : UInt32* [In]
  fun alljoyn_msgarg_get_uint32(arg : Alljoyn_msgarg, u : UInt32*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],x : Int64* [In]
  fun alljoyn_msgarg_get_int64(arg : Alljoyn_msgarg, x : Int64*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],t : UInt64* [In]
  fun alljoyn_msgarg_get_uint64(arg : Alljoyn_msgarg, t : UInt64*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],d : Float64* [In]
  fun alljoyn_msgarg_get_double(arg : Alljoyn_msgarg, d : Float64*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],s : Int8** [In]
  fun alljoyn_msgarg_get_string(arg : Alljoyn_msgarg, s : Int8**) : QStatus

  # Params # arg : Alljoyn_msgarg [In],o : Int8** [In]
  fun alljoyn_msgarg_get_objectpath(arg : Alljoyn_msgarg, o : Int8**) : QStatus

  # Params # arg : Alljoyn_msgarg [In],g : Int8** [In]
  fun alljoyn_msgarg_get_signature(arg : Alljoyn_msgarg, g : Int8**) : QStatus

  # Params # arg : Alljoyn_msgarg [In],v : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_get_variant(arg : Alljoyn_msgarg, v : Alljoyn_msgarg) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],ay : UInt8* [In]
  fun alljoyn_msgarg_set_uint8_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, ay : UInt8*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],ab : Int32* [In]
  fun alljoyn_msgarg_set_bool_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, ab : Int32*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],an : Int16* [In]
  fun alljoyn_msgarg_set_int16_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, an : Int16*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],aq : UInt16* [In]
  fun alljoyn_msgarg_set_uint16_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, aq : UInt16*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],ai : Int32* [In]
  fun alljoyn_msgarg_set_int32_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, ai : Int32*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],au : UInt32* [In]
  fun alljoyn_msgarg_set_uint32_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, au : UInt32*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],ax : Int64* [In]
  fun alljoyn_msgarg_set_int64_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, ax : Int64*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],at : UInt64* [In]
  fun alljoyn_msgarg_set_uint64_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, at : UInt64*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],ad : Float64* [In]
  fun alljoyn_msgarg_set_double_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, ad : Float64*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],as : Int8** [In]
  fun alljoyn_msgarg_set_string_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, as : Int8**) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],ao : Int8** [In]
  fun alljoyn_msgarg_set_objectpath_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, ao : Int8**) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR [In],ag : Int8** [In]
  fun alljoyn_msgarg_set_signature_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR, ag : Int8**) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR* [In],ay : UInt8* [In]
  fun alljoyn_msgarg_get_uint8_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR*, ay : UInt8*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR* [In],ab : Int32* [In]
  fun alljoyn_msgarg_get_bool_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR*, ab : Int32*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR* [In],an : Int16* [In]
  fun alljoyn_msgarg_get_int16_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR*, an : Int16*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR* [In],aq : UInt16* [In]
  fun alljoyn_msgarg_get_uint16_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR*, aq : UInt16*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR* [In],ai : Int32* [In]
  fun alljoyn_msgarg_get_int32_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR*, ai : Int32*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR* [In],au : UInt32* [In]
  fun alljoyn_msgarg_get_uint32_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR*, au : UInt32*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR* [In],ax : Int64* [In]
  fun alljoyn_msgarg_get_int64_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR*, ax : Int64*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR* [In],at : UInt64* [In]
  fun alljoyn_msgarg_get_uint64_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR*, at : UInt64*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],length : LibC::UINT_PTR* [In],ad : Float64* [In]
  fun alljoyn_msgarg_get_double_array(arg : Alljoyn_msgarg, length : LibC::UINT_PTR*, ad : Float64*) : QStatus

  # Params # arg : Alljoyn_msgarg [In],signature : PSTR [In],length : LibC::UINT_PTR* [In],av : Alljoyn_msgarg* [In]
  fun alljoyn_msgarg_get_variant_array(arg : Alljoyn_msgarg, signature : PSTR, length : LibC::UINT_PTR*, av : Alljoyn_msgarg*) : QStatus

  # Params # arg : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_get_array_numberofelements(arg : Alljoyn_msgarg) : LibC::UINT_PTR

  # Params # arg : Alljoyn_msgarg [In],index : LibC::UINT_PTR [In],element : Alljoyn_msgarg* [In]
  fun alljoyn_msgarg_get_array_element(arg : Alljoyn_msgarg, index : LibC::UINT_PTR, element : Alljoyn_msgarg*) : Void

  # Params # arg : Alljoyn_msgarg [In],index : LibC::UINT_PTR [In]
  fun alljoyn_msgarg_get_array_elementsignature(arg : Alljoyn_msgarg, index : LibC::UINT_PTR) : PSTR

  # Params # arg : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_getkey(arg : Alljoyn_msgarg) : Alljoyn_msgarg

  # Params # arg : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_getvalue(arg : Alljoyn_msgarg) : Alljoyn_msgarg

  # Params # arg : Alljoyn_msgarg [In],key : Alljoyn_msgarg [In],value : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_setdictentry(arg : Alljoyn_msgarg, key : Alljoyn_msgarg, value : Alljoyn_msgarg) : QStatus

  # Params # arg : Alljoyn_msgarg [In],struct_members : Alljoyn_msgarg [In],num_members : LibC::UINT_PTR [In]
  fun alljoyn_msgarg_setstruct(arg : Alljoyn_msgarg, struct_members : Alljoyn_msgarg, num_members : LibC::UINT_PTR) : QStatus

  # Params # arg : Alljoyn_msgarg [In]
  fun alljoyn_msgarg_getnummembers(arg : Alljoyn_msgarg) : LibC::UINT_PTR

  # Params # arg : Alljoyn_msgarg [In],index : LibC::UINT_PTR [In]
  fun alljoyn_msgarg_getmember(arg : Alljoyn_msgarg, index : LibC::UINT_PTR) : Alljoyn_msgarg

  # Params # 
  fun alljoyn_aboutdata_create_empty : Alljoyn_aboutdata

  # Params # defaultlanguage : PSTR [In]
  fun alljoyn_aboutdata_create(defaultlanguage : PSTR) : Alljoyn_aboutdata

  # Params # arg : Alljoyn_msgarg [In],language : PSTR [In]
  fun alljoyn_aboutdata_create_full(arg : Alljoyn_msgarg, language : PSTR) : Alljoyn_aboutdata

  # Params # data : Alljoyn_aboutdata [In]
  fun alljoyn_aboutdata_destroy(data : Alljoyn_aboutdata) : Void

  # Params # data : Alljoyn_aboutdata [In],aboutdataxml : PSTR [In]
  fun alljoyn_aboutdata_createfromxml(data : Alljoyn_aboutdata, aboutdataxml : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],language : PSTR [In]
  fun alljoyn_aboutdata_isvalid(data : Alljoyn_aboutdata, language : PSTR) : UInt8

  # Params # data : Alljoyn_aboutdata [In],arg : Alljoyn_msgarg [In],language : PSTR [In]
  fun alljoyn_aboutdata_createfrommsgarg(data : Alljoyn_aboutdata, arg : Alljoyn_msgarg, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],appid : UInt8* [In],num : LibC::UINT_PTR [In]
  fun alljoyn_aboutdata_setappid(data : Alljoyn_aboutdata, appid : UInt8*, num : LibC::UINT_PTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],appid : PSTR [In]
  fun alljoyn_aboutdata_setappid_fromstring(data : Alljoyn_aboutdata, appid : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],appid : UInt8** [In],num : LibC::UINT_PTR* [In]
  fun alljoyn_aboutdata_getappid(data : Alljoyn_aboutdata, appid : UInt8**, num : LibC::UINT_PTR*) : QStatus

  # Params # data : Alljoyn_aboutdata [In],defaultlanguage : PSTR [In]
  fun alljoyn_aboutdata_setdefaultlanguage(data : Alljoyn_aboutdata, defaultlanguage : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],defaultlanguage : Int8** [In]
  fun alljoyn_aboutdata_getdefaultlanguage(data : Alljoyn_aboutdata, defaultlanguage : Int8**) : QStatus

  # Params # data : Alljoyn_aboutdata [In],devicename : PSTR [In],language : PSTR [In]
  fun alljoyn_aboutdata_setdevicename(data : Alljoyn_aboutdata, devicename : PSTR, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],devicename : Int8** [In],language : PSTR [In]
  fun alljoyn_aboutdata_getdevicename(data : Alljoyn_aboutdata, devicename : Int8**, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],deviceid : PSTR [In]
  fun alljoyn_aboutdata_setdeviceid(data : Alljoyn_aboutdata, deviceid : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],deviceid : Int8** [In]
  fun alljoyn_aboutdata_getdeviceid(data : Alljoyn_aboutdata, deviceid : Int8**) : QStatus

  # Params # data : Alljoyn_aboutdata [In],appname : PSTR [In],language : PSTR [In]
  fun alljoyn_aboutdata_setappname(data : Alljoyn_aboutdata, appname : PSTR, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],appname : Int8** [In],language : PSTR [In]
  fun alljoyn_aboutdata_getappname(data : Alljoyn_aboutdata, appname : Int8**, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],manufacturer : PSTR [In],language : PSTR [In]
  fun alljoyn_aboutdata_setmanufacturer(data : Alljoyn_aboutdata, manufacturer : PSTR, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],manufacturer : Int8** [In],language : PSTR [In]
  fun alljoyn_aboutdata_getmanufacturer(data : Alljoyn_aboutdata, manufacturer : Int8**, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],modelnumber : PSTR [In]
  fun alljoyn_aboutdata_setmodelnumber(data : Alljoyn_aboutdata, modelnumber : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],modelnumber : Int8** [In]
  fun alljoyn_aboutdata_getmodelnumber(data : Alljoyn_aboutdata, modelnumber : Int8**) : QStatus

  # Params # data : Alljoyn_aboutdata [In],language : PSTR [In]
  fun alljoyn_aboutdata_setsupportedlanguage(data : Alljoyn_aboutdata, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],languagetags : Int8** [In],num : LibC::UINT_PTR [In]
  fun alljoyn_aboutdata_getsupportedlanguages(data : Alljoyn_aboutdata, languagetags : Int8**, num : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # data : Alljoyn_aboutdata [In],description : PSTR [In],language : PSTR [In]
  fun alljoyn_aboutdata_setdescription(data : Alljoyn_aboutdata, description : PSTR, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],description : Int8** [In],language : PSTR [In]
  fun alljoyn_aboutdata_getdescription(data : Alljoyn_aboutdata, description : Int8**, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],dateofmanufacture : PSTR [In]
  fun alljoyn_aboutdata_setdateofmanufacture(data : Alljoyn_aboutdata, dateofmanufacture : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],dateofmanufacture : Int8** [In]
  fun alljoyn_aboutdata_getdateofmanufacture(data : Alljoyn_aboutdata, dateofmanufacture : Int8**) : QStatus

  # Params # data : Alljoyn_aboutdata [In],softwareversion : PSTR [In]
  fun alljoyn_aboutdata_setsoftwareversion(data : Alljoyn_aboutdata, softwareversion : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],softwareversion : Int8** [In]
  fun alljoyn_aboutdata_getsoftwareversion(data : Alljoyn_aboutdata, softwareversion : Int8**) : QStatus

  # Params # data : Alljoyn_aboutdata [In],ajsoftwareversion : Int8** [In]
  fun alljoyn_aboutdata_getajsoftwareversion(data : Alljoyn_aboutdata, ajsoftwareversion : Int8**) : QStatus

  # Params # data : Alljoyn_aboutdata [In],hardwareversion : PSTR [In]
  fun alljoyn_aboutdata_sethardwareversion(data : Alljoyn_aboutdata, hardwareversion : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],hardwareversion : Int8** [In]
  fun alljoyn_aboutdata_gethardwareversion(data : Alljoyn_aboutdata, hardwareversion : Int8**) : QStatus

  # Params # data : Alljoyn_aboutdata [In],supporturl : PSTR [In]
  fun alljoyn_aboutdata_setsupporturl(data : Alljoyn_aboutdata, supporturl : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],supporturl : Int8** [In]
  fun alljoyn_aboutdata_getsupporturl(data : Alljoyn_aboutdata, supporturl : Int8**) : QStatus

  # Params # data : Alljoyn_aboutdata [In],name : PSTR [In],value : Alljoyn_msgarg [In],language : PSTR [In]
  fun alljoyn_aboutdata_setfield(data : Alljoyn_aboutdata, name : PSTR, value : Alljoyn_msgarg, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],name : PSTR [In],value : Alljoyn_msgarg* [In],language : PSTR [In]
  fun alljoyn_aboutdata_getfield(data : Alljoyn_aboutdata, name : PSTR, value : Alljoyn_msgarg*, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],fields : Int8** [In],num_fields : LibC::UINT_PTR [In]
  fun alljoyn_aboutdata_getfields(data : Alljoyn_aboutdata, fields : Int8**, num_fields : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # data : Alljoyn_aboutdata [In],msgarg : Alljoyn_msgarg [In],language : PSTR [In]
  fun alljoyn_aboutdata_getaboutdata(data : Alljoyn_aboutdata, msgarg : Alljoyn_msgarg, language : PSTR) : QStatus

  # Params # data : Alljoyn_aboutdata [In],msgarg : Alljoyn_msgarg [In]
  fun alljoyn_aboutdata_getannouncedaboutdata(data : Alljoyn_aboutdata, msgarg : Alljoyn_msgarg) : QStatus

  # Params # data : Alljoyn_aboutdata [In],fieldname : PSTR [In]
  fun alljoyn_aboutdata_isfieldrequired(data : Alljoyn_aboutdata, fieldname : PSTR) : UInt8

  # Params # data : Alljoyn_aboutdata [In],fieldname : PSTR [In]
  fun alljoyn_aboutdata_isfieldannounced(data : Alljoyn_aboutdata, fieldname : PSTR) : UInt8

  # Params # data : Alljoyn_aboutdata [In],fieldname : PSTR [In]
  fun alljoyn_aboutdata_isfieldlocalized(data : Alljoyn_aboutdata, fieldname : PSTR) : UInt8

  # Params # data : Alljoyn_aboutdata [In],fieldname : PSTR [In]
  fun alljoyn_aboutdata_getfieldsignature(data : Alljoyn_aboutdata, fieldname : PSTR) : PSTR

  # Params # 
  fun alljoyn_abouticon_create : Alljoyn_abouticon_handle*

  # Params # icon : Alljoyn_abouticon_handle* [In]
  fun alljoyn_abouticon_destroy(icon : Alljoyn_abouticon_handle*) : Void

  # Params # icon : Alljoyn_abouticon_handle* [In],data : UInt8** [In],size : LibC::UINT_PTR* [In]
  fun alljoyn_abouticon_getcontent(icon : Alljoyn_abouticon_handle*, data : UInt8**, size : LibC::UINT_PTR*) : Void

  # Params # icon : Alljoyn_abouticon_handle* [In],type : PSTR [In],data : UInt8* [In],csize : LibC::UINT_PTR [In],ownsdata : UInt8 [In]
  fun alljoyn_abouticon_setcontent(icon : Alljoyn_abouticon_handle*, type : PSTR, data : UInt8*, csize : LibC::UINT_PTR, ownsdata : UInt8) : QStatus

  # Params # icon : Alljoyn_abouticon_handle* [In],type : Int8** [In],url : Int8** [In]
  fun alljoyn_abouticon_geturl(icon : Alljoyn_abouticon_handle*, type : Int8**, url : Int8**) : Void

  # Params # icon : Alljoyn_abouticon_handle* [In],type : PSTR [In],url : PSTR [In]
  fun alljoyn_abouticon_seturl(icon : Alljoyn_abouticon_handle*, type : PSTR, url : PSTR) : QStatus

  # Params # icon : Alljoyn_abouticon_handle* [In]
  fun alljoyn_abouticon_clear(icon : Alljoyn_abouticon_handle*) : Void

  # Params # icon : Alljoyn_abouticon_handle* [In],arg : Alljoyn_msgarg [In]
  fun alljoyn_abouticon_setcontent_frommsgarg(icon : Alljoyn_abouticon_handle*, arg : Alljoyn_msgarg) : QStatus

  # Params # 
  fun alljoyn_permissionconfigurator_getdefaultclaimcapabilities : UInt16

  # Params # configurator : Alljoyn_permissionconfigurator [In],state : Alljoyn_applicationstate* [In]
  fun alljoyn_permissionconfigurator_getapplicationstate(configurator : Alljoyn_permissionconfigurator, state : Alljoyn_applicationstate*) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],state : Alljoyn_applicationstate [In]
  fun alljoyn_permissionconfigurator_setapplicationstate(configurator : Alljoyn_permissionconfigurator, state : Alljoyn_applicationstate) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],publickey : Int8** [In]
  fun alljoyn_permissionconfigurator_getpublickey(configurator : Alljoyn_permissionconfigurator, publickey : Int8**) : QStatus

  # Params # publickey : Int8* [In]
  fun alljoyn_permissionconfigurator_publickey_destroy(publickey : Int8*) : Void

  # Params # configurator : Alljoyn_permissionconfigurator [In],manifesttemplatexml : Int8** [In]
  fun alljoyn_permissionconfigurator_getmanifesttemplate(configurator : Alljoyn_permissionconfigurator, manifesttemplatexml : Int8**) : QStatus

  # Params # manifesttemplatexml : Int8* [In]
  fun alljoyn_permissionconfigurator_manifesttemplate_destroy(manifesttemplatexml : Int8*) : Void

  # Params # configurator : Alljoyn_permissionconfigurator [In],manifesttemplatexml : Int8* [In]
  fun alljoyn_permissionconfigurator_setmanifesttemplatefromxml(configurator : Alljoyn_permissionconfigurator, manifesttemplatexml : Int8*) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],claimcapabilities : UInt16* [In]
  fun alljoyn_permissionconfigurator_getclaimcapabilities(configurator : Alljoyn_permissionconfigurator, claimcapabilities : UInt16*) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],claimcapabilities : UInt16 [In]
  fun alljoyn_permissionconfigurator_setclaimcapabilities(configurator : Alljoyn_permissionconfigurator, claimcapabilities : UInt16) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],additionalinfo : UInt16* [In]
  fun alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo(configurator : Alljoyn_permissionconfigurator, additionalinfo : UInt16*) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],additionalinfo : UInt16 [In]
  fun alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo(configurator : Alljoyn_permissionconfigurator, additionalinfo : UInt16) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In]
  fun alljoyn_permissionconfigurator_reset(configurator : Alljoyn_permissionconfigurator) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],cakey : Int8* [In],identitycertificatechain : Int8* [In],groupid : UInt8* [In],groupsize : LibC::UINT_PTR [In],groupauthority : Int8* [In],manifestsxmls : Int8** [In],manifestscount : LibC::UINT_PTR [In]
  fun alljoyn_permissionconfigurator_claim(configurator : Alljoyn_permissionconfigurator, cakey : Int8*, identitycertificatechain : Int8*, groupid : UInt8*, groupsize : LibC::UINT_PTR, groupauthority : Int8*, manifestsxmls : Int8**, manifestscount : LibC::UINT_PTR) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],identitycertificatechain : Int8* [In],manifestsxmls : Int8** [In],manifestscount : LibC::UINT_PTR [In]
  fun alljoyn_permissionconfigurator_updateidentity(configurator : Alljoyn_permissionconfigurator, identitycertificatechain : Int8*, manifestsxmls : Int8**, manifestscount : LibC::UINT_PTR) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],identitycertificatechain : Int8** [In]
  fun alljoyn_permissionconfigurator_getidentity(configurator : Alljoyn_permissionconfigurator, identitycertificatechain : Int8**) : QStatus

  # Params # certificatechain : Int8* [In]
  fun alljoyn_permissionconfigurator_certificatechain_destroy(certificatechain : Int8*) : Void

  # Params # configurator : Alljoyn_permissionconfigurator [In],manifestarray : Alljoyn_manifestarray* [In]
  fun alljoyn_permissionconfigurator_getmanifests(configurator : Alljoyn_permissionconfigurator, manifestarray : Alljoyn_manifestarray*) : QStatus

  # Params # manifestarray : Alljoyn_manifestarray* [In]
  fun alljoyn_permissionconfigurator_manifestarray_cleanup(manifestarray : Alljoyn_manifestarray*) : Void

  # Params # configurator : Alljoyn_permissionconfigurator [In],manifestsxmls : Int8** [In],manifestscount : LibC::UINT_PTR [In],append : Int32 [In]
  fun alljoyn_permissionconfigurator_installmanifests(configurator : Alljoyn_permissionconfigurator, manifestsxmls : Int8**, manifestscount : LibC::UINT_PTR, append : Int32) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],certificateid : Alljoyn_certificateid* [In]
  fun alljoyn_permissionconfigurator_getidentitycertificateid(configurator : Alljoyn_permissionconfigurator, certificateid : Alljoyn_certificateid*) : QStatus

  # Params # certificateid : Alljoyn_certificateid* [In]
  fun alljoyn_permissionconfigurator_certificateid_cleanup(certificateid : Alljoyn_certificateid*) : Void

  # Params # configurator : Alljoyn_permissionconfigurator [In],policyxml : Int8* [In]
  fun alljoyn_permissionconfigurator_updatepolicy(configurator : Alljoyn_permissionconfigurator, policyxml : Int8*) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],policyxml : Int8** [In]
  fun alljoyn_permissionconfigurator_getpolicy(configurator : Alljoyn_permissionconfigurator, policyxml : Int8**) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],policyxml : Int8** [In]
  fun alljoyn_permissionconfigurator_getdefaultpolicy(configurator : Alljoyn_permissionconfigurator, policyxml : Int8**) : QStatus

  # Params # policyxml : Int8* [In]
  fun alljoyn_permissionconfigurator_policy_destroy(policyxml : Int8*) : Void

  # Params # configurator : Alljoyn_permissionconfigurator [In]
  fun alljoyn_permissionconfigurator_resetpolicy(configurator : Alljoyn_permissionconfigurator) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],certificateids : Alljoyn_certificateidarray* [In]
  fun alljoyn_permissionconfigurator_getmembershipsummaries(configurator : Alljoyn_permissionconfigurator, certificateids : Alljoyn_certificateidarray*) : QStatus

  # Params # certificateidarray : Alljoyn_certificateidarray* [In]
  fun alljoyn_permissionconfigurator_certificateidarray_cleanup(certificateidarray : Alljoyn_certificateidarray*) : Void

  # Params # configurator : Alljoyn_permissionconfigurator [In],membershipcertificatechain : Int8* [In]
  fun alljoyn_permissionconfigurator_installmembership(configurator : Alljoyn_permissionconfigurator, membershipcertificatechain : Int8*) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In],serial : UInt8* [In],seriallen : LibC::UINT_PTR [In],issuerpublickey : Int8* [In],issueraki : UInt8* [In],issuerakilen : LibC::UINT_PTR [In]
  fun alljoyn_permissionconfigurator_removemembership(configurator : Alljoyn_permissionconfigurator, serial : UInt8*, seriallen : LibC::UINT_PTR, issuerpublickey : Int8*, issueraki : UInt8*, issuerakilen : LibC::UINT_PTR) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In]
  fun alljoyn_permissionconfigurator_startmanagement(configurator : Alljoyn_permissionconfigurator) : QStatus

  # Params # configurator : Alljoyn_permissionconfigurator [In]
  fun alljoyn_permissionconfigurator_endmanagement(configurator : Alljoyn_permissionconfigurator) : QStatus

  # Params # callbacks : Alljoyn_applicationstatelistener_callbacks* [In],context : Void* [In]
  fun alljoyn_applicationstatelistener_create(callbacks : Alljoyn_applicationstatelistener_callbacks*, context : Void*) : Alljoyn_applicationstatelistener

  # Params # listener : Alljoyn_applicationstatelistener [In]
  fun alljoyn_applicationstatelistener_destroy(listener : Alljoyn_applicationstatelistener) : Void

  # Params # callbacks : Alljoyn_keystorelistener_callbacks* [In],context : Void* [In]
  fun alljoyn_keystorelistener_create(callbacks : Alljoyn_keystorelistener_callbacks*, context : Void*) : Alljoyn_keystorelistener

  # Params # callbacks : Alljoyn_keystorelistener_with_synchronization_callbacks* [In],context : Void* [In]
  fun alljoyn_keystorelistener_with_synchronization_create(callbacks : Alljoyn_keystorelistener_with_synchronization_callbacks*, context : Void*) : Alljoyn_keystorelistener

  # Params # listener : Alljoyn_keystorelistener [In]
  fun alljoyn_keystorelistener_destroy(listener : Alljoyn_keystorelistener) : Void

  # Params # listener : Alljoyn_keystorelistener [In],keystore : Alljoyn_keystore [In],source : PSTR [In],password : PSTR [In]
  fun alljoyn_keystorelistener_putkeys(listener : Alljoyn_keystorelistener, keystore : Alljoyn_keystore, source : PSTR, password : PSTR) : QStatus

  # Params # listener : Alljoyn_keystorelistener [In],keystore : Alljoyn_keystore [In],sink : PSTR [In],sink_sz : LibC::UINT_PTR* [In]
  fun alljoyn_keystorelistener_getkeys(listener : Alljoyn_keystorelistener, keystore : Alljoyn_keystore, sink : PSTR, sink_sz : LibC::UINT_PTR*) : QStatus

  # Params # traffic : UInt8 [In],ismultipoint : Int32 [In],proximity : UInt8 [In],transports : UInt16 [In]
  fun alljoyn_sessionopts_create(traffic : UInt8, ismultipoint : Int32, proximity : UInt8, transports : UInt16) : Alljoyn_sessionopts

  # Params # opts : Alljoyn_sessionopts [In]
  fun alljoyn_sessionopts_destroy(opts : Alljoyn_sessionopts) : Void

  # Params # opts : Alljoyn_sessionopts [In]
  fun alljoyn_sessionopts_get_traffic(opts : Alljoyn_sessionopts) : UInt8

  # Params # opts : Alljoyn_sessionopts [In],traffic : UInt8 [In]
  fun alljoyn_sessionopts_set_traffic(opts : Alljoyn_sessionopts, traffic : UInt8) : Void

  # Params # opts : Alljoyn_sessionopts [In]
  fun alljoyn_sessionopts_get_multipoint(opts : Alljoyn_sessionopts) : Int32

  # Params # opts : Alljoyn_sessionopts [In],ismultipoint : Int32 [In]
  fun alljoyn_sessionopts_set_multipoint(opts : Alljoyn_sessionopts, ismultipoint : Int32) : Void

  # Params # opts : Alljoyn_sessionopts [In]
  fun alljoyn_sessionopts_get_proximity(opts : Alljoyn_sessionopts) : UInt8

  # Params # opts : Alljoyn_sessionopts [In],proximity : UInt8 [In]
  fun alljoyn_sessionopts_set_proximity(opts : Alljoyn_sessionopts, proximity : UInt8) : Void

  # Params # opts : Alljoyn_sessionopts [In]
  fun alljoyn_sessionopts_get_transports(opts : Alljoyn_sessionopts) : UInt16

  # Params # opts : Alljoyn_sessionopts [In],transports : UInt16 [In]
  fun alljoyn_sessionopts_set_transports(opts : Alljoyn_sessionopts, transports : UInt16) : Void

  # Params # one : Alljoyn_sessionopts [In],other : Alljoyn_sessionopts [In]
  fun alljoyn_sessionopts_iscompatible(one : Alljoyn_sessionopts, other : Alljoyn_sessionopts) : Int32

  # Params # one : Alljoyn_sessionopts [In],other : Alljoyn_sessionopts [In]
  fun alljoyn_sessionopts_cmp(one : Alljoyn_sessionopts, other : Alljoyn_sessionopts) : Int32

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_message_create(bus : Alljoyn_busattachment) : Alljoyn_message

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_destroy(msg : Alljoyn_message) : Void

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_isbroadcastsignal(msg : Alljoyn_message) : Int32

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_isglobalbroadcast(msg : Alljoyn_message) : Int32

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_issessionless(msg : Alljoyn_message) : Int32

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getflags(msg : Alljoyn_message) : UInt8

  # Params # msg : Alljoyn_message [In],tillexpirems : UInt32* [In]
  fun alljoyn_message_isexpired(msg : Alljoyn_message, tillexpirems : UInt32*) : Int32

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_isunreliable(msg : Alljoyn_message) : Int32

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_isencrypted(msg : Alljoyn_message) : Int32

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getauthmechanism(msg : Alljoyn_message) : PSTR

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_gettype(msg : Alljoyn_message) : Alljoyn_messagetype

  # Params # msg : Alljoyn_message [In],numargs : LibC::UINT_PTR* [In],args : Alljoyn_msgarg* [In]
  fun alljoyn_message_getargs(msg : Alljoyn_message, numargs : LibC::UINT_PTR*, args : Alljoyn_msgarg*) : Void

  # Params # msg : Alljoyn_message [In],argn : LibC::UINT_PTR [In]
  fun alljoyn_message_getarg(msg : Alljoyn_message, argn : LibC::UINT_PTR) : Alljoyn_msgarg

  # Params # msg : Alljoyn_message [In],signature : PSTR [In]
  fun alljoyn_message_parseargs(msg : Alljoyn_message, signature : PSTR) : QStatus

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getcallserial(msg : Alljoyn_message) : UInt32

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getsignature(msg : Alljoyn_message) : PSTR

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getobjectpath(msg : Alljoyn_message) : PSTR

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getinterface(msg : Alljoyn_message) : PSTR

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getmembername(msg : Alljoyn_message) : PSTR

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getreplyserial(msg : Alljoyn_message) : UInt32

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getsender(msg : Alljoyn_message) : PSTR

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getreceiveendpointname(msg : Alljoyn_message) : PSTR

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getdestination(msg : Alljoyn_message) : PSTR

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getcompressiontoken(msg : Alljoyn_message) : UInt32

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_getsessionid(msg : Alljoyn_message) : UInt32

  # Params # msg : Alljoyn_message [In],errormessage : PSTR [In],errormessage_size : LibC::UINT_PTR* [In]
  fun alljoyn_message_geterrorname(msg : Alljoyn_message, errormessage : PSTR, errormessage_size : LibC::UINT_PTR*) : PSTR

  # Params # msg : Alljoyn_message [In],str : PSTR [In],buf : LibC::UINT_PTR [In]
  fun alljoyn_message_tostring(msg : Alljoyn_message, str : PSTR, buf : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # msg : Alljoyn_message [In],str : PSTR [In],buf : LibC::UINT_PTR [In]
  fun alljoyn_message_description(msg : Alljoyn_message, str : PSTR, buf : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # msg : Alljoyn_message [In]
  fun alljoyn_message_gettimestamp(msg : Alljoyn_message) : UInt32

  # Params # one : Alljoyn_message [In],other : Alljoyn_message [In]
  fun alljoyn_message_eql(one : Alljoyn_message, other : Alljoyn_message) : Int32

  # Params # endian : Int8 [In]
  fun alljoyn_message_setendianess(endian : Int8) : Void

  # Params # listener : Alljoyn_authlistener [In],authcontext : Void* [In],accept : Int32 [In],credentials : Alljoyn_credentials [In]
  fun alljoyn_authlistener_requestcredentialsresponse(listener : Alljoyn_authlistener, authcontext : Void*, accept : Int32, credentials : Alljoyn_credentials) : QStatus

  # Params # listener : Alljoyn_authlistener [In],authcontext : Void* [In],accept : Int32 [In]
  fun alljoyn_authlistener_verifycredentialsresponse(listener : Alljoyn_authlistener, authcontext : Void*, accept : Int32) : QStatus

  # Params # callbacks : Alljoyn_authlistener_callbacks* [In],context : Void* [In]
  fun alljoyn_authlistener_create(callbacks : Alljoyn_authlistener_callbacks*, context : Void*) : Alljoyn_authlistener

  # Params # callbacks : Alljoyn_authlistenerasync_callbacks* [In],context : Void* [In]
  fun alljoyn_authlistenerasync_create(callbacks : Alljoyn_authlistenerasync_callbacks*, context : Void*) : Alljoyn_authlistener

  # Params # listener : Alljoyn_authlistener [In]
  fun alljoyn_authlistener_destroy(listener : Alljoyn_authlistener) : Void

  # Params # listener : Alljoyn_authlistener [In]
  fun alljoyn_authlistenerasync_destroy(listener : Alljoyn_authlistener) : Void

  # Params # listener : Alljoyn_authlistener [In],sharedsecret : UInt8* [In],sharedsecretsize : LibC::UINT_PTR [In]
  fun alljoyn_authlistener_setsharedsecret(listener : Alljoyn_authlistener, sharedsecret : UInt8*, sharedsecretsize : LibC::UINT_PTR) : QStatus

  # Params # 
  fun alljoyn_credentials_create : Alljoyn_credentials

  # Params # cred : Alljoyn_credentials [In]
  fun alljoyn_credentials_destroy(cred : Alljoyn_credentials) : Void

  # Params # cred : Alljoyn_credentials [In],creds : UInt16 [In]
  fun alljoyn_credentials_isset(cred : Alljoyn_credentials, creds : UInt16) : Int32

  # Params # cred : Alljoyn_credentials [In],pwd : PSTR [In]
  fun alljoyn_credentials_setpassword(cred : Alljoyn_credentials, pwd : PSTR) : Void

  # Params # cred : Alljoyn_credentials [In],username : PSTR [In]
  fun alljoyn_credentials_setusername(cred : Alljoyn_credentials, username : PSTR) : Void

  # Params # cred : Alljoyn_credentials [In],certchain : PSTR [In]
  fun alljoyn_credentials_setcertchain(cred : Alljoyn_credentials, certchain : PSTR) : Void

  # Params # cred : Alljoyn_credentials [In],pk : PSTR [In]
  fun alljoyn_credentials_setprivatekey(cred : Alljoyn_credentials, pk : PSTR) : Void

  # Params # cred : Alljoyn_credentials [In],logonentry : PSTR [In]
  fun alljoyn_credentials_setlogonentry(cred : Alljoyn_credentials, logonentry : PSTR) : Void

  # Params # cred : Alljoyn_credentials [In],expiration : UInt32 [In]
  fun alljoyn_credentials_setexpiration(cred : Alljoyn_credentials, expiration : UInt32) : Void

  # Params # cred : Alljoyn_credentials [In]
  fun alljoyn_credentials_getpassword(cred : Alljoyn_credentials) : PSTR

  # Params # cred : Alljoyn_credentials [In]
  fun alljoyn_credentials_getusername(cred : Alljoyn_credentials) : PSTR

  # Params # cred : Alljoyn_credentials [In]
  fun alljoyn_credentials_getcertchain(cred : Alljoyn_credentials) : PSTR

  # Params # cred : Alljoyn_credentials [In]
  fun alljoyn_credentials_getprivateKey(cred : Alljoyn_credentials) : PSTR

  # Params # cred : Alljoyn_credentials [In]
  fun alljoyn_credentials_getlogonentry(cred : Alljoyn_credentials) : PSTR

  # Params # cred : Alljoyn_credentials [In]
  fun alljoyn_credentials_getexpiration(cred : Alljoyn_credentials) : UInt32

  # Params # cred : Alljoyn_credentials [In]
  fun alljoyn_credentials_clear(cred : Alljoyn_credentials) : Void

  # Params # callbacks : Alljoyn_buslistener_callbacks* [In],context : Void* [In]
  fun alljoyn_buslistener_create(callbacks : Alljoyn_buslistener_callbacks*, context : Void*) : Alljoyn_buslistener

  # Params # listener : Alljoyn_buslistener [In]
  fun alljoyn_buslistener_destroy(listener : Alljoyn_buslistener) : Void

  # Params # member : Alljoyn_interfacedescription_member [In]
  fun alljoyn_interfacedescription_member_getannotationscount(member : Alljoyn_interfacedescription_member) : LibC::UINT_PTR

  # Params # member : Alljoyn_interfacedescription_member [In],index : LibC::UINT_PTR [In],name : PSTR [In],name_size : LibC::UINT_PTR* [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_member_getannotationatindex(member : Alljoyn_interfacedescription_member, index : LibC::UINT_PTR, name : PSTR, name_size : LibC::UINT_PTR*, value : PSTR, value_size : LibC::UINT_PTR*) : Void

  # Params # member : Alljoyn_interfacedescription_member [In],name : PSTR [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_member_getannotation(member : Alljoyn_interfacedescription_member, name : PSTR, value : PSTR, value_size : LibC::UINT_PTR*) : Int32

  # Params # member : Alljoyn_interfacedescription_member [In],argname : PSTR [In]
  fun alljoyn_interfacedescription_member_getargannotationscount(member : Alljoyn_interfacedescription_member, argname : PSTR) : LibC::UINT_PTR

  # Params # member : Alljoyn_interfacedescription_member [In],argname : PSTR [In],index : LibC::UINT_PTR [In],name : PSTR [In],name_size : LibC::UINT_PTR* [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_member_getargannotationatindex(member : Alljoyn_interfacedescription_member, argname : PSTR, index : LibC::UINT_PTR, name : PSTR, name_size : LibC::UINT_PTR*, value : PSTR, value_size : LibC::UINT_PTR*) : Void

  # Params # member : Alljoyn_interfacedescription_member [In],argname : PSTR [In],name : PSTR [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_member_getargannotation(member : Alljoyn_interfacedescription_member, argname : PSTR, name : PSTR, value : PSTR, value_size : LibC::UINT_PTR*) : Int32

  # Params # property : Alljoyn_interfacedescription_property [In]
  fun alljoyn_interfacedescription_property_getannotationscount(property : Alljoyn_interfacedescription_property) : LibC::UINT_PTR

  # Params # property : Alljoyn_interfacedescription_property [In],index : LibC::UINT_PTR [In],name : PSTR [In],name_size : LibC::UINT_PTR* [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_property_getannotationatindex(property : Alljoyn_interfacedescription_property, index : LibC::UINT_PTR, name : PSTR, name_size : LibC::UINT_PTR*, value : PSTR, value_size : LibC::UINT_PTR*) : Void

  # Params # property : Alljoyn_interfacedescription_property [In],name : PSTR [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_property_getannotation(property : Alljoyn_interfacedescription_property, name : PSTR, value : PSTR, value_size : LibC::UINT_PTR*) : Int32

  # Params # iface : Alljoyn_interfacedescription [In]
  fun alljoyn_interfacedescription_activate(iface : Alljoyn_interfacedescription) : Void

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],value : PSTR [In]
  fun alljoyn_interfacedescription_addannotation(iface : Alljoyn_interfacedescription, name : PSTR, value : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_getannotation(iface : Alljoyn_interfacedescription, name : PSTR, value : PSTR, value_size : LibC::UINT_PTR*) : Int32

  # Params # iface : Alljoyn_interfacedescription [In]
  fun alljoyn_interfacedescription_getannotationscount(iface : Alljoyn_interfacedescription) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In],index : LibC::UINT_PTR [In],name : PSTR [In],name_size : LibC::UINT_PTR* [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_getannotationatindex(iface : Alljoyn_interfacedescription, index : LibC::UINT_PTR, name : PSTR, name_size : LibC::UINT_PTR*, value : PSTR, value_size : LibC::UINT_PTR*) : Void

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],member : Alljoyn_interfacedescription_member* [In]
  fun alljoyn_interfacedescription_getmember(iface : Alljoyn_interfacedescription, name : PSTR, member : Alljoyn_interfacedescription_member*) : Int32

  # Params # iface : Alljoyn_interfacedescription [In],type : Alljoyn_messagetype [In],name : PSTR [In],inputsig : PSTR [In],outsig : PSTR [In],argnames : PSTR [In],annotation : UInt8 [In]
  fun alljoyn_interfacedescription_addmember(iface : Alljoyn_interfacedescription, type : Alljoyn_messagetype, name : PSTR, inputsig : PSTR, outsig : PSTR, argnames : PSTR, annotation : UInt8) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],name : PSTR [In],value : PSTR [In]
  fun alljoyn_interfacedescription_addmemberannotation(iface : Alljoyn_interfacedescription, member : PSTR, name : PSTR, value : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],name : PSTR [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_getmemberannotation(iface : Alljoyn_interfacedescription, member : PSTR, name : PSTR, value : PSTR, value_size : LibC::UINT_PTR*) : Int32

  # Params # iface : Alljoyn_interfacedescription [In],members : Alljoyn_interfacedescription_member* [In],nummembers : LibC::UINT_PTR [In]
  fun alljoyn_interfacedescription_getmembers(iface : Alljoyn_interfacedescription, members : Alljoyn_interfacedescription_member*, nummembers : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],insig : PSTR [In],outsig : PSTR [In]
  fun alljoyn_interfacedescription_hasmember(iface : Alljoyn_interfacedescription, name : PSTR, insig : PSTR, outsig : PSTR) : Int32

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],inputsig : PSTR [In],outsig : PSTR [In],argnames : PSTR [In],annotation : UInt8 [In],accessperms : PSTR [In]
  fun alljoyn_interfacedescription_addmethod(iface : Alljoyn_interfacedescription, name : PSTR, inputsig : PSTR, outsig : PSTR, argnames : PSTR, annotation : UInt8, accessperms : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],member : Alljoyn_interfacedescription_member* [In]
  fun alljoyn_interfacedescription_getmethod(iface : Alljoyn_interfacedescription, name : PSTR, member : Alljoyn_interfacedescription_member*) : Int32

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],sig : PSTR [In],argnames : PSTR [In],annotation : UInt8 [In],accessperms : PSTR [In]
  fun alljoyn_interfacedescription_addsignal(iface : Alljoyn_interfacedescription, name : PSTR, sig : PSTR, argnames : PSTR, annotation : UInt8, accessperms : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],member : Alljoyn_interfacedescription_member* [In]
  fun alljoyn_interfacedescription_getsignal(iface : Alljoyn_interfacedescription, name : PSTR, member : Alljoyn_interfacedescription_member*) : Int32

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],property : Alljoyn_interfacedescription_property* [In]
  fun alljoyn_interfacedescription_getproperty(iface : Alljoyn_interfacedescription, name : PSTR, property : Alljoyn_interfacedescription_property*) : Int32

  # Params # iface : Alljoyn_interfacedescription [In],props : Alljoyn_interfacedescription_property* [In],numprops : LibC::UINT_PTR [In]
  fun alljoyn_interfacedescription_getproperties(iface : Alljoyn_interfacedescription, props : Alljoyn_interfacedescription_property*, numprops : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],signature : PSTR [In],access : UInt8 [In]
  fun alljoyn_interfacedescription_addproperty(iface : Alljoyn_interfacedescription, name : PSTR, signature : PSTR, access : UInt8) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],property : PSTR [In],name : PSTR [In],value : PSTR [In]
  fun alljoyn_interfacedescription_addpropertyannotation(iface : Alljoyn_interfacedescription, property : PSTR, name : PSTR, value : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],property : PSTR [In],name : PSTR [In],value : PSTR [In],str_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_getpropertyannotation(iface : Alljoyn_interfacedescription, property : PSTR, name : PSTR, value : PSTR, str_size : LibC::UINT_PTR*) : Int32

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In]
  fun alljoyn_interfacedescription_hasproperty(iface : Alljoyn_interfacedescription, name : PSTR) : Int32

  # Params # iface : Alljoyn_interfacedescription [In]
  fun alljoyn_interfacedescription_hasproperties(iface : Alljoyn_interfacedescription) : Int32

  # Params # iface : Alljoyn_interfacedescription [In]
  fun alljoyn_interfacedescription_getname(iface : Alljoyn_interfacedescription) : PSTR

  # Params # iface : Alljoyn_interfacedescription [In],str : PSTR [In],buf : LibC::UINT_PTR [In],indent : LibC::UINT_PTR [In]
  fun alljoyn_interfacedescription_introspect(iface : Alljoyn_interfacedescription, str : PSTR, buf : LibC::UINT_PTR, indent : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In]
  fun alljoyn_interfacedescription_issecure(iface : Alljoyn_interfacedescription) : Int32

  # Params # iface : Alljoyn_interfacedescription [In]
  fun alljoyn_interfacedescription_getsecuritypolicy(iface : Alljoyn_interfacedescription) : Alljoyn_interfacedescription_securitypolicy

  # Params # iface : Alljoyn_interfacedescription [In],language : PSTR [In]
  fun alljoyn_interfacedescription_setdescriptionlanguage(iface : Alljoyn_interfacedescription, language : PSTR) : Void

  # Params # iface : Alljoyn_interfacedescription [In],languages : Int8** [In],size : LibC::UINT_PTR [In]
  fun alljoyn_interfacedescription_getdescriptionlanguages(iface : Alljoyn_interfacedescription, languages : Int8**, size : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In],languages : PSTR [In],languagessize : LibC::UINT_PTR [In]
  fun alljoyn_interfacedescription_getdescriptionlanguages2(iface : Alljoyn_interfacedescription, languages : PSTR, languagessize : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In],description : PSTR [In]
  fun alljoyn_interfacedescription_setdescription(iface : Alljoyn_interfacedescription, description : PSTR) : Void

  # Params # iface : Alljoyn_interfacedescription [In],description : PSTR [In],languagetag : PSTR [In]
  fun alljoyn_interfacedescription_setdescriptionforlanguage(iface : Alljoyn_interfacedescription, description : PSTR, languagetag : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],description : PSTR [In],maxlanguagelength : LibC::UINT_PTR [In],languagetag : PSTR [In]
  fun alljoyn_interfacedescription_getdescriptionforlanguage(iface : Alljoyn_interfacedescription, description : PSTR, maxlanguagelength : LibC::UINT_PTR, languagetag : PSTR) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],description : PSTR [In]
  fun alljoyn_interfacedescription_setmemberdescription(iface : Alljoyn_interfacedescription, member : PSTR, description : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],description : PSTR [In],languagetag : PSTR [In]
  fun alljoyn_interfacedescription_setmemberdescriptionforlanguage(iface : Alljoyn_interfacedescription, member : PSTR, description : PSTR, languagetag : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],description : PSTR [In],maxlanguagelength : LibC::UINT_PTR [In],languagetag : PSTR [In]
  fun alljoyn_interfacedescription_getmemberdescriptionforlanguage(iface : Alljoyn_interfacedescription, member : PSTR, description : PSTR, maxlanguagelength : LibC::UINT_PTR, languagetag : PSTR) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],argname : PSTR [In],description : PSTR [In]
  fun alljoyn_interfacedescription_setargdescription(iface : Alljoyn_interfacedescription, member : PSTR, argname : PSTR, description : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],arg : PSTR [In],description : PSTR [In],languagetag : PSTR [In]
  fun alljoyn_interfacedescription_setargdescriptionforlanguage(iface : Alljoyn_interfacedescription, member : PSTR, arg : PSTR, description : PSTR, languagetag : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],arg : PSTR [In],description : PSTR [In],maxlanguagelength : LibC::UINT_PTR [In],languagetag : PSTR [In]
  fun alljoyn_interfacedescription_getargdescriptionforlanguage(iface : Alljoyn_interfacedescription, member : PSTR, arg : PSTR, description : PSTR, maxlanguagelength : LibC::UINT_PTR, languagetag : PSTR) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],description : PSTR [In]
  fun alljoyn_interfacedescription_setpropertydescription(iface : Alljoyn_interfacedescription, name : PSTR, description : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],name : PSTR [In],description : PSTR [In],languagetag : PSTR [In]
  fun alljoyn_interfacedescription_setpropertydescriptionforlanguage(iface : Alljoyn_interfacedescription, name : PSTR, description : PSTR, languagetag : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],property : PSTR [In],description : PSTR [In],maxlanguagelength : LibC::UINT_PTR [In],languagetag : PSTR [In]
  fun alljoyn_interfacedescription_getpropertydescriptionforlanguage(iface : Alljoyn_interfacedescription, property : PSTR, description : PSTR, maxlanguagelength : LibC::UINT_PTR, languagetag : PSTR) : LibC::UINT_PTR

  # Params # iface : Alljoyn_interfacedescription [In],translationcallback : Alljoyn_interfacedescription_translation_callback_ptr [In]
  fun alljoyn_interfacedescription_setdescriptiontranslationcallback(iface : Alljoyn_interfacedescription, translationcallback : Alljoyn_interfacedescription_translation_callback_ptr) : Void

  # Params # iface : Alljoyn_interfacedescription [In]
  fun alljoyn_interfacedescription_getdescriptiontranslationcallback(iface : Alljoyn_interfacedescription) : Alljoyn_interfacedescription_translation_callback_ptr

  # Params # iface : Alljoyn_interfacedescription [In]
  fun alljoyn_interfacedescription_hasdescription(iface : Alljoyn_interfacedescription) : Int32

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],argname : PSTR [In],name : PSTR [In],value : PSTR [In]
  fun alljoyn_interfacedescription_addargannotation(iface : Alljoyn_interfacedescription, member : PSTR, argname : PSTR, name : PSTR, value : PSTR) : QStatus

  # Params # iface : Alljoyn_interfacedescription [In],member : PSTR [In],argname : PSTR [In],name : PSTR [In],value : PSTR [In],value_size : LibC::UINT_PTR* [In]
  fun alljoyn_interfacedescription_getmemberargannotation(iface : Alljoyn_interfacedescription, member : PSTR, argname : PSTR, name : PSTR, value : PSTR, value_size : LibC::UINT_PTR*) : Int32

  # Params # one : Alljoyn_interfacedescription [In],other : Alljoyn_interfacedescription [In]
  fun alljoyn_interfacedescription_eql(one : Alljoyn_interfacedescription, other : Alljoyn_interfacedescription) : Int32

  # Params # one : Alljoyn_interfacedescription_member [In],other : Alljoyn_interfacedescription_member [In]
  fun alljoyn_interfacedescription_member_eql(one : Alljoyn_interfacedescription_member, other : Alljoyn_interfacedescription_member) : Int32

  # Params # one : Alljoyn_interfacedescription_property [In],other : Alljoyn_interfacedescription_property [In]
  fun alljoyn_interfacedescription_property_eql(one : Alljoyn_interfacedescription_property, other : Alljoyn_interfacedescription_property) : Int32

  # Params # path : PSTR [In],isplaceholder : Int32 [In],callbacks_in : Alljoyn_busobject_callbacks* [In],context_in : Void* [In]
  fun alljoyn_busobject_create(path : PSTR, isplaceholder : Int32, callbacks_in : Alljoyn_busobject_callbacks*, context_in : Void*) : Alljoyn_busobject

  # Params # bus : Alljoyn_busobject [In]
  fun alljoyn_busobject_destroy(bus : Alljoyn_busobject) : Void

  # Params # bus : Alljoyn_busobject [In]
  fun alljoyn_busobject_getpath(bus : Alljoyn_busobject) : PSTR

  # Params # bus : Alljoyn_busobject [In],ifcname : PSTR [In],propname : PSTR [In],val : Alljoyn_msgarg [In],id : UInt32 [In]
  fun alljoyn_busobject_emitpropertychanged(bus : Alljoyn_busobject, ifcname : PSTR, propname : PSTR, val : Alljoyn_msgarg, id : UInt32) : Void

  # Params # bus : Alljoyn_busobject [In],ifcname : PSTR [In],propnames : Int8** [In],numprops : LibC::UINT_PTR [In],id : UInt32 [In]
  fun alljoyn_busobject_emitpropertieschanged(bus : Alljoyn_busobject, ifcname : PSTR, propnames : Int8**, numprops : LibC::UINT_PTR, id : UInt32) : Void

  # Params # bus : Alljoyn_busobject [In],buffer : PSTR [In],buffersz : LibC::UINT_PTR [In]
  fun alljoyn_busobject_getname(bus : Alljoyn_busobject, buffer : PSTR, buffersz : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # bus : Alljoyn_busobject [In],iface : Alljoyn_interfacedescription [In]
  fun alljoyn_busobject_addinterface(bus : Alljoyn_busobject, iface : Alljoyn_interfacedescription) : QStatus

  # Params # bus : Alljoyn_busobject [In],member : Alljoyn_interfacedescription_member [In],handler : Alljoyn_messagereceiver_methodhandler_ptr [In],context : Void* [In]
  fun alljoyn_busobject_addmethodhandler(bus : Alljoyn_busobject, member : Alljoyn_interfacedescription_member, handler : Alljoyn_messagereceiver_methodhandler_ptr, context : Void*) : QStatus

  # Params # bus : Alljoyn_busobject [In],entries : Alljoyn_busobject_methodentry* [In],numentries : LibC::UINT_PTR [In]
  fun alljoyn_busobject_addmethodhandlers(bus : Alljoyn_busobject, entries : Alljoyn_busobject_methodentry*, numentries : LibC::UINT_PTR) : QStatus

  # Params # bus : Alljoyn_busobject [In],msg : Alljoyn_message [In],args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In]
  fun alljoyn_busobject_methodreply_args(bus : Alljoyn_busobject, msg : Alljoyn_message, args : Alljoyn_msgarg, numargs : LibC::UINT_PTR) : QStatus

  # Params # bus : Alljoyn_busobject [In],msg : Alljoyn_message [In],error : PSTR [In],errormessage : PSTR [In]
  fun alljoyn_busobject_methodreply_err(bus : Alljoyn_busobject, msg : Alljoyn_message, error : PSTR, errormessage : PSTR) : QStatus

  # Params # bus : Alljoyn_busobject [In],msg : Alljoyn_message [In],status : QStatus [In]
  fun alljoyn_busobject_methodreply_status(bus : Alljoyn_busobject, msg : Alljoyn_message, status : QStatus) : QStatus

  # Params # bus : Alljoyn_busobject [In]
  fun alljoyn_busobject_getbusattachment(bus : Alljoyn_busobject) : Alljoyn_busattachment

  # Params # bus : Alljoyn_busobject [In],destination : PSTR [In],sessionid : UInt32 [In],signal : Alljoyn_interfacedescription_member [In],args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In],timetolive : UInt16 [In],flags : UInt8 [In],msg : Alljoyn_message [In]
  fun alljoyn_busobject_signal(bus : Alljoyn_busobject, destination : PSTR, sessionid : UInt32, signal : Alljoyn_interfacedescription_member, args : Alljoyn_msgarg, numargs : LibC::UINT_PTR, timetolive : UInt16, flags : UInt8, msg : Alljoyn_message) : QStatus

  # Params # bus : Alljoyn_busobject [In],serialnumber : UInt32 [In]
  fun alljoyn_busobject_cancelsessionlessmessage_serial(bus : Alljoyn_busobject, serialnumber : UInt32) : QStatus

  # Params # bus : Alljoyn_busobject [In],msg : Alljoyn_message [In]
  fun alljoyn_busobject_cancelsessionlessmessage(bus : Alljoyn_busobject, msg : Alljoyn_message) : QStatus

  # Params # bus : Alljoyn_busobject [In]
  fun alljoyn_busobject_issecure(bus : Alljoyn_busobject) : Int32

  # Params # bus : Alljoyn_busobject [In],interfaces : Int8** [In],numinterfaces : LibC::UINT_PTR [In]
  fun alljoyn_busobject_getannouncedinterfacenames(bus : Alljoyn_busobject, interfaces : Int8**, numinterfaces : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # bus : Alljoyn_busobject [In],iface : Alljoyn_interfacedescription [In],isannounced : Alljoyn_about_announceflag [In]
  fun alljoyn_busobject_setannounceflag(bus : Alljoyn_busobject, iface : Alljoyn_interfacedescription, isannounced : Alljoyn_about_announceflag) : QStatus

  # Params # bus : Alljoyn_busobject [In],iface : Alljoyn_interfacedescription [In]
  fun alljoyn_busobject_addinterface_announced(bus : Alljoyn_busobject, iface : Alljoyn_interfacedescription) : QStatus

  # Params # bus : Alljoyn_busattachment [In],service : PSTR [In],path : PSTR [In],sessionid : UInt32 [In]
  fun alljoyn_proxybusobject_create(bus : Alljoyn_busattachment, service : PSTR, path : PSTR, sessionid : UInt32) : Alljoyn_proxybusobject

  # Params # bus : Alljoyn_busattachment [In],service : PSTR [In],path : PSTR [In],sessionid : UInt32 [In]
  fun alljoyn_proxybusobject_create_secure(bus : Alljoyn_busattachment, service : PSTR, path : PSTR, sessionid : UInt32) : Alljoyn_proxybusobject

  # Params # proxyobj : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_destroy(proxyobj : Alljoyn_proxybusobject) : Void

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : Alljoyn_interfacedescription [In]
  fun alljoyn_proxybusobject_addinterface(proxyobj : Alljoyn_proxybusobject, iface : Alljoyn_interfacedescription) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],name : PSTR [In]
  fun alljoyn_proxybusobject_addinterface_by_name(proxyobj : Alljoyn_proxybusobject, name : PSTR) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],children : Alljoyn_proxybusobject* [In],numchildren : LibC::UINT_PTR [In]
  fun alljoyn_proxybusobject_getchildren(proxyobj : Alljoyn_proxybusobject, children : Alljoyn_proxybusobject*, numchildren : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # proxyobj : Alljoyn_proxybusobject [In],path : PSTR [In]
  fun alljoyn_proxybusobject_getchild(proxyobj : Alljoyn_proxybusobject, path : PSTR) : Alljoyn_proxybusobject

  # Params # proxyobj : Alljoyn_proxybusobject [In],child : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_addchild(proxyobj : Alljoyn_proxybusobject, child : Alljoyn_proxybusobject) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],path : PSTR [In]
  fun alljoyn_proxybusobject_removechild(proxyobj : Alljoyn_proxybusobject, path : PSTR) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_introspectremoteobject(proxyobj : Alljoyn_proxybusobject) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],callback : Alljoyn_proxybusobject_listener_introspectcb_ptr [In],context : Void* [In]
  fun alljoyn_proxybusobject_introspectremoteobjectasync(proxyobj : Alljoyn_proxybusobject, callback : Alljoyn_proxybusobject_listener_introspectcb_ptr, context : Void*) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In],property : PSTR [In],value : Alljoyn_msgarg [In]
  fun alljoyn_proxybusobject_getproperty(proxyobj : Alljoyn_proxybusobject, iface : PSTR, property : PSTR, value : Alljoyn_msgarg) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In],property : PSTR [In],callback : Alljoyn_proxybusobject_listener_getpropertycb_ptr [In],timeout : UInt32 [In],context : Void* [In]
  fun alljoyn_proxybusobject_getpropertyasync(proxyobj : Alljoyn_proxybusobject, iface : PSTR, property : PSTR, callback : Alljoyn_proxybusobject_listener_getpropertycb_ptr, timeout : UInt32, context : Void*) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In],values : Alljoyn_msgarg [In]
  fun alljoyn_proxybusobject_getallproperties(proxyobj : Alljoyn_proxybusobject, iface : PSTR, values : Alljoyn_msgarg) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In],callback : Alljoyn_proxybusobject_listener_getallpropertiescb_ptr [In],timeout : UInt32 [In],context : Void* [In]
  fun alljoyn_proxybusobject_getallpropertiesasync(proxyobj : Alljoyn_proxybusobject, iface : PSTR, callback : Alljoyn_proxybusobject_listener_getallpropertiescb_ptr, timeout : UInt32, context : Void*) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In],property : PSTR [In],value : Alljoyn_msgarg [In]
  fun alljoyn_proxybusobject_setproperty(proxyobj : Alljoyn_proxybusobject, iface : PSTR, property : PSTR, value : Alljoyn_msgarg) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In],properties : Int8** [In],numproperties : LibC::UINT_PTR [In],callback : Alljoyn_proxybusobject_listener_propertieschanged_ptr [In],context : Void* [In]
  fun alljoyn_proxybusobject_registerpropertieschangedlistener(proxyobj : Alljoyn_proxybusobject, iface : PSTR, properties : Int8**, numproperties : LibC::UINT_PTR, callback : Alljoyn_proxybusobject_listener_propertieschanged_ptr, context : Void*) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In],callback : Alljoyn_proxybusobject_listener_propertieschanged_ptr [In]
  fun alljoyn_proxybusobject_unregisterpropertieschangedlistener(proxyobj : Alljoyn_proxybusobject, iface : PSTR, callback : Alljoyn_proxybusobject_listener_propertieschanged_ptr) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In],property : PSTR [In],value : Alljoyn_msgarg [In],callback : Alljoyn_proxybusobject_listener_setpropertycb_ptr [In],timeout : UInt32 [In],context : Void* [In]
  fun alljoyn_proxybusobject_setpropertyasync(proxyobj : Alljoyn_proxybusobject, iface : PSTR, property : PSTR, value : Alljoyn_msgarg, callback : Alljoyn_proxybusobject_listener_setpropertycb_ptr, timeout : UInt32, context : Void*) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],ifacename : PSTR [In],methodname : PSTR [In],args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In],replymsg : Alljoyn_message [In],timeout : UInt32 [In],flags : UInt8 [In]
  fun alljoyn_proxybusobject_methodcall(proxyobj : Alljoyn_proxybusobject, ifacename : PSTR, methodname : PSTR, args : Alljoyn_msgarg, numargs : LibC::UINT_PTR, replymsg : Alljoyn_message, timeout : UInt32, flags : UInt8) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],method : Alljoyn_interfacedescription_member [In],args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In],replymsg : Alljoyn_message [In],timeout : UInt32 [In],flags : UInt8 [In]
  fun alljoyn_proxybusobject_methodcall_member(proxyobj : Alljoyn_proxybusobject, method : Alljoyn_interfacedescription_member, args : Alljoyn_msgarg, numargs : LibC::UINT_PTR, replymsg : Alljoyn_message, timeout : UInt32, flags : UInt8) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],ifacename : PSTR [In],methodname : PSTR [In],args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In],flags : UInt8 [In]
  fun alljoyn_proxybusobject_methodcall_noreply(proxyobj : Alljoyn_proxybusobject, ifacename : PSTR, methodname : PSTR, args : Alljoyn_msgarg, numargs : LibC::UINT_PTR, flags : UInt8) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],method : Alljoyn_interfacedescription_member [In],args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In],flags : UInt8 [In]
  fun alljoyn_proxybusobject_methodcall_member_noreply(proxyobj : Alljoyn_proxybusobject, method : Alljoyn_interfacedescription_member, args : Alljoyn_msgarg, numargs : LibC::UINT_PTR, flags : UInt8) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],ifacename : PSTR [In],methodname : PSTR [In],replyfunc : Alljoyn_messagereceiver_replyhandler_ptr [In],args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In],context : Void* [In],timeout : UInt32 [In],flags : UInt8 [In]
  fun alljoyn_proxybusobject_methodcallasync(proxyobj : Alljoyn_proxybusobject, ifacename : PSTR, methodname : PSTR, replyfunc : Alljoyn_messagereceiver_replyhandler_ptr, args : Alljoyn_msgarg, numargs : LibC::UINT_PTR, context : Void*, timeout : UInt32, flags : UInt8) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],method : Alljoyn_interfacedescription_member [In],replyfunc : Alljoyn_messagereceiver_replyhandler_ptr [In],args : Alljoyn_msgarg [In],numargs : LibC::UINT_PTR [In],context : Void* [In],timeout : UInt32 [In],flags : UInt8 [In]
  fun alljoyn_proxybusobject_methodcallasync_member(proxyobj : Alljoyn_proxybusobject, method : Alljoyn_interfacedescription_member, replyfunc : Alljoyn_messagereceiver_replyhandler_ptr, args : Alljoyn_msgarg, numargs : LibC::UINT_PTR, context : Void*, timeout : UInt32, flags : UInt8) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],xml : PSTR [In],identifier : PSTR [In]
  fun alljoyn_proxybusobject_parsexml(proxyobj : Alljoyn_proxybusobject, xml : PSTR, identifier : PSTR) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],forceauth : Int32 [In]
  fun alljoyn_proxybusobject_secureconnection(proxyobj : Alljoyn_proxybusobject, forceauth : Int32) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],forceauth : Int32 [In]
  fun alljoyn_proxybusobject_secureconnectionasync(proxyobj : Alljoyn_proxybusobject, forceauth : Int32) : QStatus

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In]
  fun alljoyn_proxybusobject_getinterface(proxyobj : Alljoyn_proxybusobject, iface : PSTR) : Alljoyn_interfacedescription

  # Params # proxyobj : Alljoyn_proxybusobject [In],ifaces : Alljoyn_interfacedescription* [In],numifaces : LibC::UINT_PTR [In]
  fun alljoyn_proxybusobject_getinterfaces(proxyobj : Alljoyn_proxybusobject, ifaces : Alljoyn_interfacedescription*, numifaces : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # proxyobj : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_getpath(proxyobj : Alljoyn_proxybusobject) : PSTR

  # Params # proxyobj : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_getservicename(proxyobj : Alljoyn_proxybusobject) : PSTR

  # Params # proxyobj : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_getuniquename(proxyobj : Alljoyn_proxybusobject) : PSTR

  # Params # proxyobj : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_getsessionid(proxyobj : Alljoyn_proxybusobject) : UInt32

  # Params # proxyobj : Alljoyn_proxybusobject [In],iface : PSTR [In]
  fun alljoyn_proxybusobject_implementsinterface(proxyobj : Alljoyn_proxybusobject, iface : PSTR) : Int32

  # Params # source : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_copy(source : Alljoyn_proxybusobject) : Alljoyn_proxybusobject

  # Params # proxyobj : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_isvalid(proxyobj : Alljoyn_proxybusobject) : Int32

  # Params # proxyobj : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_issecure(proxyobj : Alljoyn_proxybusobject) : Int32

  # Params # proxyobj : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_enablepropertycaching(proxyobj : Alljoyn_proxybusobject) : Void

  # Params # callbacks : Alljoyn_permissionconfigurationlistener_callbacks* [In],context : Void* [In]
  fun alljoyn_permissionconfigurationlistener_create(callbacks : Alljoyn_permissionconfigurationlistener_callbacks*, context : Void*) : Alljoyn_permissionconfigurationlistener

  # Params # listener : Alljoyn_permissionconfigurationlistener [In]
  fun alljoyn_permissionconfigurationlistener_destroy(listener : Alljoyn_permissionconfigurationlistener) : Void

  # Params # callbacks : Alljoyn_sessionlistener_callbacks* [In],context : Void* [In]
  fun alljoyn_sessionlistener_create(callbacks : Alljoyn_sessionlistener_callbacks*, context : Void*) : Alljoyn_sessionlistener

  # Params # listener : Alljoyn_sessionlistener [In]
  fun alljoyn_sessionlistener_destroy(listener : Alljoyn_sessionlistener) : Void

  # Params # callbacks : Alljoyn_sessionportlistener_callbacks* [In],context : Void* [In]
  fun alljoyn_sessionportlistener_create(callbacks : Alljoyn_sessionportlistener_callbacks*, context : Void*) : Alljoyn_sessionportlistener

  # Params # listener : Alljoyn_sessionportlistener [In]
  fun alljoyn_sessionportlistener_destroy(listener : Alljoyn_sessionportlistener) : Void

  # Params # callback : Alljoyn_aboutlistener_callback* [In],context : Void* [In]
  fun alljoyn_aboutlistener_create(callback : Alljoyn_aboutlistener_callback*, context : Void*) : Alljoyn_aboutlistener

  # Params # listener : Alljoyn_aboutlistener [In]
  fun alljoyn_aboutlistener_destroy(listener : Alljoyn_aboutlistener) : Void

  # Params # applicationname : PSTR [In],allowremotemessages : Int32 [In]
  fun alljoyn_busattachment_create(applicationname : PSTR, allowremotemessages : Int32) : Alljoyn_busattachment

  # Params # applicationname : PSTR [In],allowremotemessages : Int32 [In],concurrency : UInt32 [In]
  fun alljoyn_busattachment_create_concurrency(applicationname : PSTR, allowremotemessages : Int32, concurrency : UInt32) : Alljoyn_busattachment

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_destroy(bus : Alljoyn_busattachment) : Void

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_start(bus : Alljoyn_busattachment) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_stop(bus : Alljoyn_busattachment) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_join(bus : Alljoyn_busattachment) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_getconcurrency(bus : Alljoyn_busattachment) : UInt32

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_getconnectspec(bus : Alljoyn_busattachment) : PSTR

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_enableconcurrentcallbacks(bus : Alljoyn_busattachment) : Void

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In],iface : Alljoyn_interfacedescription* [In]
  fun alljoyn_busattachment_createinterface(bus : Alljoyn_busattachment, name : PSTR, iface : Alljoyn_interfacedescription*) : QStatus

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In],iface : Alljoyn_interfacedescription* [In],secpolicy : Alljoyn_interfacedescription_securitypolicy [In]
  fun alljoyn_busattachment_createinterface_secure(bus : Alljoyn_busattachment, name : PSTR, iface : Alljoyn_interfacedescription*, secpolicy : Alljoyn_interfacedescription_securitypolicy) : QStatus

  # Params # bus : Alljoyn_busattachment [In],connectspec : PSTR [In]
  fun alljoyn_busattachment_connect(bus : Alljoyn_busattachment, connectspec : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],listener : Alljoyn_buslistener [In]
  fun alljoyn_busattachment_registerbuslistener(bus : Alljoyn_busattachment, listener : Alljoyn_buslistener) : Void

  # Params # bus : Alljoyn_busattachment [In],listener : Alljoyn_buslistener [In]
  fun alljoyn_busattachment_unregisterbuslistener(bus : Alljoyn_busattachment, listener : Alljoyn_buslistener) : Void

  # Params # bus : Alljoyn_busattachment [In],nameprefix : PSTR [In]
  fun alljoyn_busattachment_findadvertisedname(bus : Alljoyn_busattachment, nameprefix : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],nameprefix : PSTR [In],transports : UInt16 [In]
  fun alljoyn_busattachment_findadvertisednamebytransport(bus : Alljoyn_busattachment, nameprefix : PSTR, transports : UInt16) : QStatus

  # Params # bus : Alljoyn_busattachment [In],nameprefix : PSTR [In]
  fun alljoyn_busattachment_cancelfindadvertisedname(bus : Alljoyn_busattachment, nameprefix : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],nameprefix : PSTR [In],transports : UInt16 [In]
  fun alljoyn_busattachment_cancelfindadvertisednamebytransport(bus : Alljoyn_busattachment, nameprefix : PSTR, transports : UInt16) : QStatus

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In],transports : UInt16 [In]
  fun alljoyn_busattachment_advertisename(bus : Alljoyn_busattachment, name : PSTR, transports : UInt16) : QStatus

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In],transports : UInt16 [In]
  fun alljoyn_busattachment_canceladvertisename(bus : Alljoyn_busattachment, name : PSTR, transports : UInt16) : QStatus

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In]
  fun alljoyn_busattachment_getinterface(bus : Alljoyn_busattachment, name : PSTR) : Alljoyn_interfacedescription

  # Params # bus : Alljoyn_busattachment [In],sessionhost : PSTR [In],sessionport : UInt16 [In],listener : Alljoyn_sessionlistener [In],sessionid : UInt32* [In],opts : Alljoyn_sessionopts [In]
  fun alljoyn_busattachment_joinsession(bus : Alljoyn_busattachment, sessionhost : PSTR, sessionport : UInt16, listener : Alljoyn_sessionlistener, sessionid : UInt32*, opts : Alljoyn_sessionopts) : QStatus

  # Params # bus : Alljoyn_busattachment [In],sessionhost : PSTR [In],sessionport : UInt16 [In],listener : Alljoyn_sessionlistener [In],opts : Alljoyn_sessionopts [In],callback : Alljoyn_busattachment_joinsessioncb_ptr [In],context : Void* [In]
  fun alljoyn_busattachment_joinsessionasync(bus : Alljoyn_busattachment, sessionhost : PSTR, sessionport : UInt16, listener : Alljoyn_sessionlistener, opts : Alljoyn_sessionopts, callback : Alljoyn_busattachment_joinsessioncb_ptr, context : Void*) : QStatus

  # Params # bus : Alljoyn_busattachment [In],obj : Alljoyn_busobject [In]
  fun alljoyn_busattachment_registerbusobject(bus : Alljoyn_busattachment, obj : Alljoyn_busobject) : QStatus

  # Params # bus : Alljoyn_busattachment [In],obj : Alljoyn_busobject [In]
  fun alljoyn_busattachment_registerbusobject_secure(bus : Alljoyn_busattachment, obj : Alljoyn_busobject) : QStatus

  # Params # bus : Alljoyn_busattachment [In],object : Alljoyn_busobject [In]
  fun alljoyn_busattachment_unregisterbusobject(bus : Alljoyn_busattachment, object : Alljoyn_busobject) : Void

  # Params # bus : Alljoyn_busattachment [In],requestedname : PSTR [In],flags : UInt32 [In]
  fun alljoyn_busattachment_requestname(bus : Alljoyn_busattachment, requestedname : PSTR, flags : UInt32) : QStatus

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In]
  fun alljoyn_busattachment_releasename(bus : Alljoyn_busattachment, name : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],sessionport : UInt16* [In],opts : Alljoyn_sessionopts [In],listener : Alljoyn_sessionportlistener [In]
  fun alljoyn_busattachment_bindsessionport(bus : Alljoyn_busattachment, sessionport : UInt16*, opts : Alljoyn_sessionopts, listener : Alljoyn_sessionportlistener) : QStatus

  # Params # bus : Alljoyn_busattachment [In],sessionport : UInt16 [In]
  fun alljoyn_busattachment_unbindsessionport(bus : Alljoyn_busattachment, sessionport : UInt16) : QStatus

  # Params # bus : Alljoyn_busattachment [In],authmechanisms : PSTR [In],listener : Alljoyn_authlistener [In],keystorefilename : PSTR [In],isshared : Int32 [In]
  fun alljoyn_busattachment_enablepeersecurity(bus : Alljoyn_busattachment, authmechanisms : PSTR, listener : Alljoyn_authlistener, keystorefilename : PSTR, isshared : Int32) : QStatus

  # Params # bus : Alljoyn_busattachment [In],authmechanisms : PSTR [In],authlistener : Alljoyn_authlistener [In],keystorefilename : PSTR [In],isshared : Int32 [In],permissionconfigurationlistener : Alljoyn_permissionconfigurationlistener [In]
  fun alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener(bus : Alljoyn_busattachment, authmechanisms : PSTR, authlistener : Alljoyn_authlistener, keystorefilename : PSTR, isshared : Int32, permissionconfigurationlistener : Alljoyn_permissionconfigurationlistener) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_ispeersecurityenabled(bus : Alljoyn_busattachment) : Int32

  # Params # bus : Alljoyn_busattachment [In],xml : PSTR [In]
  fun alljoyn_busattachment_createinterfacesfromxml(bus : Alljoyn_busattachment, xml : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],ifaces : Alljoyn_interfacedescription* [In],numifaces : LibC::UINT_PTR [In]
  fun alljoyn_busattachment_getinterfaces(bus : Alljoyn_busattachment, ifaces : Alljoyn_interfacedescription*, numifaces : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # bus : Alljoyn_busattachment [In],iface : Alljoyn_interfacedescription [In]
  fun alljoyn_busattachment_deleteinterface(bus : Alljoyn_busattachment, iface : Alljoyn_interfacedescription) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_isstarted(bus : Alljoyn_busattachment) : Int32

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_isstopping(bus : Alljoyn_busattachment) : Int32

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_isconnected(bus : Alljoyn_busattachment) : Int32

  # Params # bus : Alljoyn_busattachment [In],unused : PSTR [In]
  fun alljoyn_busattachment_disconnect(bus : Alljoyn_busattachment, unused : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_getdbusproxyobj(bus : Alljoyn_busattachment) : Alljoyn_proxybusobject

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_getalljoynproxyobj(bus : Alljoyn_busattachment) : Alljoyn_proxybusobject

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_getalljoyndebugobj(bus : Alljoyn_busattachment) : Alljoyn_proxybusobject

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_getuniquename(bus : Alljoyn_busattachment) : PSTR

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_getglobalguidstring(bus : Alljoyn_busattachment) : PSTR

  # Params # bus : Alljoyn_busattachment [In],signal_handler : Alljoyn_messagereceiver_signalhandler_ptr [In],member : Alljoyn_interfacedescription_member [In],srcpath : PSTR [In]
  fun alljoyn_busattachment_registersignalhandler(bus : Alljoyn_busattachment, signal_handler : Alljoyn_messagereceiver_signalhandler_ptr, member : Alljoyn_interfacedescription_member, srcpath : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],signal_handler : Alljoyn_messagereceiver_signalhandler_ptr [In],member : Alljoyn_interfacedescription_member [In],matchrule : PSTR [In]
  fun alljoyn_busattachment_registersignalhandlerwithrule(bus : Alljoyn_busattachment, signal_handler : Alljoyn_messagereceiver_signalhandler_ptr, member : Alljoyn_interfacedescription_member, matchrule : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],signal_handler : Alljoyn_messagereceiver_signalhandler_ptr [In],member : Alljoyn_interfacedescription_member [In],srcpath : PSTR [In]
  fun alljoyn_busattachment_unregistersignalhandler(bus : Alljoyn_busattachment, signal_handler : Alljoyn_messagereceiver_signalhandler_ptr, member : Alljoyn_interfacedescription_member, srcpath : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],signal_handler : Alljoyn_messagereceiver_signalhandler_ptr [In],member : Alljoyn_interfacedescription_member [In],matchrule : PSTR [In]
  fun alljoyn_busattachment_unregistersignalhandlerwithrule(bus : Alljoyn_busattachment, signal_handler : Alljoyn_messagereceiver_signalhandler_ptr, member : Alljoyn_interfacedescription_member, matchrule : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_unregisterallhandlers(bus : Alljoyn_busattachment) : QStatus

  # Params # bus : Alljoyn_busattachment [In],listener : Alljoyn_keystorelistener [In]
  fun alljoyn_busattachment_registerkeystorelistener(bus : Alljoyn_busattachment, listener : Alljoyn_keystorelistener) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_reloadkeystore(bus : Alljoyn_busattachment) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_clearkeystore(bus : Alljoyn_busattachment) : Void

  # Params # bus : Alljoyn_busattachment [In],guid : PSTR [In]
  fun alljoyn_busattachment_clearkeys(bus : Alljoyn_busattachment, guid : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],guid : PSTR [In],timeout : UInt32 [In]
  fun alljoyn_busattachment_setkeyexpiration(bus : Alljoyn_busattachment, guid : PSTR, timeout : UInt32) : QStatus

  # Params # bus : Alljoyn_busattachment [In],guid : PSTR [In],timeout : UInt32* [In]
  fun alljoyn_busattachment_getkeyexpiration(bus : Alljoyn_busattachment, guid : PSTR, timeout : UInt32*) : QStatus

  # Params # bus : Alljoyn_busattachment [In],authmechanism : PSTR [In],username : PSTR [In],password : PSTR [In]
  fun alljoyn_busattachment_addlogonentry(bus : Alljoyn_busattachment, authmechanism : PSTR, username : PSTR, password : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],rule : PSTR [In]
  fun alljoyn_busattachment_addmatch(bus : Alljoyn_busattachment, rule : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],rule : PSTR [In]
  fun alljoyn_busattachment_removematch(bus : Alljoyn_busattachment, rule : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],sessionid : UInt32 [In],listener : Alljoyn_sessionlistener [In]
  fun alljoyn_busattachment_setsessionlistener(bus : Alljoyn_busattachment, sessionid : UInt32, listener : Alljoyn_sessionlistener) : QStatus

  # Params # bus : Alljoyn_busattachment [In],sessionid : UInt32 [In]
  fun alljoyn_busattachment_leavesession(bus : Alljoyn_busattachment, sessionid : UInt32) : QStatus

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In],forceauth : Int32 [In]
  fun alljoyn_busattachment_secureconnection(bus : Alljoyn_busattachment, name : PSTR, forceauth : Int32) : QStatus

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In],forceauth : Int32 [In]
  fun alljoyn_busattachment_secureconnectionasync(bus : Alljoyn_busattachment, name : PSTR, forceauth : Int32) : QStatus

  # Params # bus : Alljoyn_busattachment [In],sessionid : UInt32 [In],membername : PSTR [In]
  fun alljoyn_busattachment_removesessionmember(bus : Alljoyn_busattachment, sessionid : UInt32, membername : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],sessionid : UInt32 [In],linktimeout : UInt32* [In]
  fun alljoyn_busattachment_setlinktimeout(bus : Alljoyn_busattachment, sessionid : UInt32, linktimeout : UInt32*) : QStatus

  # Params # bus : Alljoyn_busattachment [In],sessionid : UInt32 [In],linktimeout : UInt32 [In],callback : Alljoyn_busattachment_setlinktimeoutcb_ptr [In],context : Void* [In]
  fun alljoyn_busattachment_setlinktimeoutasync(bus : Alljoyn_busattachment, sessionid : UInt32, linktimeout : UInt32, callback : Alljoyn_busattachment_setlinktimeoutcb_ptr, context : Void*) : QStatus

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In],hasowner : Int32* [In]
  fun alljoyn_busattachment_namehasowner(bus : Alljoyn_busattachment, name : PSTR, hasowner : Int32*) : QStatus

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In],guid : PSTR [In],guidsz : LibC::UINT_PTR* [In]
  fun alljoyn_busattachment_getpeerguid(bus : Alljoyn_busattachment, name : PSTR, guid : PSTR, guidsz : LibC::UINT_PTR*) : QStatus

  # Params # bus : Alljoyn_busattachment [In],module : PSTR [In],level : UInt32 [In]
  fun alljoyn_busattachment_setdaemondebug(bus : Alljoyn_busattachment, module : PSTR, level : UInt32) : QStatus

  # Params # 
  fun alljoyn_busattachment_gettimestamp : UInt32

  # Params # bus : Alljoyn_busattachment [In],name : PSTR [In],timeout : UInt32 [In]
  fun alljoyn_busattachment_ping(bus : Alljoyn_busattachment, name : PSTR, timeout : UInt32) : QStatus

  # Params # bus : Alljoyn_busattachment [In],aboutlistener : Alljoyn_aboutlistener [In]
  fun alljoyn_busattachment_registeraboutlistener(bus : Alljoyn_busattachment, aboutlistener : Alljoyn_aboutlistener) : Void

  # Params # bus : Alljoyn_busattachment [In],aboutlistener : Alljoyn_aboutlistener [In]
  fun alljoyn_busattachment_unregisteraboutlistener(bus : Alljoyn_busattachment, aboutlistener : Alljoyn_aboutlistener) : Void

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_unregisterallaboutlisteners(bus : Alljoyn_busattachment) : Void

  # Params # bus : Alljoyn_busattachment [In],implementsinterfaces : Int8** [In],numberinterfaces : LibC::UINT_PTR [In]
  fun alljoyn_busattachment_whoimplements_interfaces(bus : Alljoyn_busattachment, implementsinterfaces : Int8**, numberinterfaces : LibC::UINT_PTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],implementsinterface : PSTR [In]
  fun alljoyn_busattachment_whoimplements_interface(bus : Alljoyn_busattachment, implementsinterface : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],implementsinterfaces : Int8** [In],numberinterfaces : LibC::UINT_PTR [In]
  fun alljoyn_busattachment_cancelwhoimplements_interfaces(bus : Alljoyn_busattachment, implementsinterfaces : Int8**, numberinterfaces : LibC::UINT_PTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],implementsinterface : PSTR [In]
  fun alljoyn_busattachment_cancelwhoimplements_interface(bus : Alljoyn_busattachment, implementsinterface : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_busattachment_getpermissionconfigurator(bus : Alljoyn_busattachment) : Alljoyn_permissionconfigurator

  # Params # bus : Alljoyn_busattachment [In],listener : Alljoyn_applicationstatelistener [In]
  fun alljoyn_busattachment_registerapplicationstatelistener(bus : Alljoyn_busattachment, listener : Alljoyn_applicationstatelistener) : QStatus

  # Params # bus : Alljoyn_busattachment [In],listener : Alljoyn_applicationstatelistener [In]
  fun alljoyn_busattachment_unregisterapplicationstatelistener(bus : Alljoyn_busattachment, listener : Alljoyn_applicationstatelistener) : QStatus

  # Params # applicationname : PSTR [In]
  fun alljoyn_busattachment_deletedefaultkeystore(applicationname : PSTR) : QStatus

  # Params # bus : Alljoyn_busattachment [In],icon : Alljoyn_abouticon_handle* [In]
  fun alljoyn_abouticonobj_create(bus : Alljoyn_busattachment, icon : Alljoyn_abouticon_handle*) : Alljoyn_abouticonobj_handle*

  # Params # icon : Alljoyn_abouticonobj_handle* [In]
  fun alljoyn_abouticonobj_destroy(icon : Alljoyn_abouticonobj_handle*) : Void

  # Params # bus : Alljoyn_busattachment [In],busname : PSTR [In],sessionid : UInt32 [In]
  fun alljoyn_abouticonproxy_create(bus : Alljoyn_busattachment, busname : PSTR, sessionid : UInt32) : Alljoyn_abouticonproxy_handle*

  # Params # proxy : Alljoyn_abouticonproxy_handle* [In]
  fun alljoyn_abouticonproxy_destroy(proxy : Alljoyn_abouticonproxy_handle*) : Void

  # Params # proxy : Alljoyn_abouticonproxy_handle* [In],icon : Alljoyn_abouticon_handle* [In]
  fun alljoyn_abouticonproxy_geticon(proxy : Alljoyn_abouticonproxy_handle*, icon : Alljoyn_abouticon_handle*) : QStatus

  # Params # proxy : Alljoyn_abouticonproxy_handle* [In],version : UInt16* [In]
  fun alljoyn_abouticonproxy_getversion(proxy : Alljoyn_abouticonproxy_handle*, version : UInt16*) : QStatus

  # Params # callbacks : Alljoyn_aboutdatalistener_callbacks* [In],context : Void* [In]
  fun alljoyn_aboutdatalistener_create(callbacks : Alljoyn_aboutdatalistener_callbacks*, context : Void*) : Alljoyn_aboutdatalistener

  # Params # listener : Alljoyn_aboutdatalistener [In]
  fun alljoyn_aboutdatalistener_destroy(listener : Alljoyn_aboutdatalistener) : Void

  # Params # bus : Alljoyn_busattachment [In],isannounced : Alljoyn_about_announceflag [In]
  fun alljoyn_aboutobj_create(bus : Alljoyn_busattachment, isannounced : Alljoyn_about_announceflag) : Alljoyn_aboutobj

  # Params # obj : Alljoyn_aboutobj [In]
  fun alljoyn_aboutobj_destroy(obj : Alljoyn_aboutobj) : Void

  # Params # obj : Alljoyn_aboutobj [In],sessionport : UInt16 [In],aboutdata : Alljoyn_aboutdata [In]
  fun alljoyn_aboutobj_announce(obj : Alljoyn_aboutobj, sessionport : UInt16, aboutdata : Alljoyn_aboutdata) : QStatus

  # Params # obj : Alljoyn_aboutobj [In],sessionport : UInt16 [In],aboutlistener : Alljoyn_aboutdatalistener [In]
  fun alljoyn_aboutobj_announce_using_datalistener(obj : Alljoyn_aboutobj, sessionport : UInt16, aboutlistener : Alljoyn_aboutdatalistener) : QStatus

  # Params # obj : Alljoyn_aboutobj [In]
  fun alljoyn_aboutobj_unannounce(obj : Alljoyn_aboutobj) : QStatus

  # Params # 
  fun alljoyn_aboutobjectdescription_create : Alljoyn_aboutobjectdescription

  # Params # arg : Alljoyn_msgarg [In]
  fun alljoyn_aboutobjectdescription_create_full(arg : Alljoyn_msgarg) : Alljoyn_aboutobjectdescription

  # Params # description : Alljoyn_aboutobjectdescription [In],arg : Alljoyn_msgarg [In]
  fun alljoyn_aboutobjectdescription_createfrommsgarg(description : Alljoyn_aboutobjectdescription, arg : Alljoyn_msgarg) : QStatus

  # Params # description : Alljoyn_aboutobjectdescription [In]
  fun alljoyn_aboutobjectdescription_destroy(description : Alljoyn_aboutobjectdescription) : Void

  # Params # description : Alljoyn_aboutobjectdescription [In],paths : Int8** [In],numpaths : LibC::UINT_PTR [In]
  fun alljoyn_aboutobjectdescription_getpaths(description : Alljoyn_aboutobjectdescription, paths : Int8**, numpaths : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # description : Alljoyn_aboutobjectdescription [In],path : PSTR [In],interfaces : Int8** [In],numinterfaces : LibC::UINT_PTR [In]
  fun alljoyn_aboutobjectdescription_getinterfaces(description : Alljoyn_aboutobjectdescription, path : PSTR, interfaces : Int8**, numinterfaces : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # description : Alljoyn_aboutobjectdescription [In],interfacename : PSTR [In],paths : Int8** [In],numpaths : LibC::UINT_PTR [In]
  fun alljoyn_aboutobjectdescription_getinterfacepaths(description : Alljoyn_aboutobjectdescription, interfacename : PSTR, paths : Int8**, numpaths : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # description : Alljoyn_aboutobjectdescription [In]
  fun alljoyn_aboutobjectdescription_clear(description : Alljoyn_aboutobjectdescription) : Void

  # Params # description : Alljoyn_aboutobjectdescription [In],path : PSTR [In]
  fun alljoyn_aboutobjectdescription_haspath(description : Alljoyn_aboutobjectdescription, path : PSTR) : UInt8

  # Params # description : Alljoyn_aboutobjectdescription [In],interfacename : PSTR [In]
  fun alljoyn_aboutobjectdescription_hasinterface(description : Alljoyn_aboutobjectdescription, interfacename : PSTR) : UInt8

  # Params # description : Alljoyn_aboutobjectdescription [In],path : PSTR [In],interfacename : PSTR [In]
  fun alljoyn_aboutobjectdescription_hasinterfaceatpath(description : Alljoyn_aboutobjectdescription, path : PSTR, interfacename : PSTR) : UInt8

  # Params # description : Alljoyn_aboutobjectdescription [In],msgarg : Alljoyn_msgarg [In]
  fun alljoyn_aboutobjectdescription_getmsgarg(description : Alljoyn_aboutobjectdescription, msgarg : Alljoyn_msgarg) : QStatus

  # Params # bus : Alljoyn_busattachment [In],busname : PSTR [In],sessionid : UInt32 [In]
  fun alljoyn_aboutproxy_create(bus : Alljoyn_busattachment, busname : PSTR, sessionid : UInt32) : Alljoyn_aboutproxy

  # Params # proxy : Alljoyn_aboutproxy [In]
  fun alljoyn_aboutproxy_destroy(proxy : Alljoyn_aboutproxy) : Void

  # Params # proxy : Alljoyn_aboutproxy [In],objectdesc : Alljoyn_msgarg [In]
  fun alljoyn_aboutproxy_getobjectdescription(proxy : Alljoyn_aboutproxy, objectdesc : Alljoyn_msgarg) : QStatus

  # Params # proxy : Alljoyn_aboutproxy [In],language : PSTR [In],data : Alljoyn_msgarg [In]
  fun alljoyn_aboutproxy_getaboutdata(proxy : Alljoyn_aboutproxy, language : PSTR, data : Alljoyn_msgarg) : QStatus

  # Params # proxy : Alljoyn_aboutproxy [In],version : UInt16* [In]
  fun alljoyn_aboutproxy_getversion(proxy : Alljoyn_aboutproxy, version : UInt16*) : QStatus

  # Params # callback : Alljoyn_pinglistener_callback* [In],context : Void* [In]
  fun alljoyn_pinglistener_create(callback : Alljoyn_pinglistener_callback*, context : Void*) : Alljoyn_pinglistener

  # Params # listener : Alljoyn_pinglistener [In]
  fun alljoyn_pinglistener_destroy(listener : Alljoyn_pinglistener) : Void

  # Params # bus : Alljoyn_busattachment [In]
  fun alljoyn_autopinger_create(bus : Alljoyn_busattachment) : Alljoyn_autopinger

  # Params # autopinger : Alljoyn_autopinger [In]
  fun alljoyn_autopinger_destroy(autopinger : Alljoyn_autopinger) : Void

  # Params # autopinger : Alljoyn_autopinger [In]
  fun alljoyn_autopinger_pause(autopinger : Alljoyn_autopinger) : Void

  # Params # autopinger : Alljoyn_autopinger [In]
  fun alljoyn_autopinger_resume(autopinger : Alljoyn_autopinger) : Void

  # Params # autopinger : Alljoyn_autopinger [In],group : PSTR [In],listener : Alljoyn_pinglistener [In],pinginterval : UInt32 [In]
  fun alljoyn_autopinger_addpinggroup(autopinger : Alljoyn_autopinger, group : PSTR, listener : Alljoyn_pinglistener, pinginterval : UInt32) : Void

  # Params # autopinger : Alljoyn_autopinger [In],group : PSTR [In]
  fun alljoyn_autopinger_removepinggroup(autopinger : Alljoyn_autopinger, group : PSTR) : Void

  # Params # autopinger : Alljoyn_autopinger [In],group : PSTR [In],pinginterval : UInt32 [In]
  fun alljoyn_autopinger_setpinginterval(autopinger : Alljoyn_autopinger, group : PSTR, pinginterval : UInt32) : QStatus

  # Params # autopinger : Alljoyn_autopinger [In],group : PSTR [In],destination : PSTR [In]
  fun alljoyn_autopinger_adddestination(autopinger : Alljoyn_autopinger, group : PSTR, destination : PSTR) : QStatus

  # Params # autopinger : Alljoyn_autopinger [In],group : PSTR [In],destination : PSTR [In],removeall : Int32 [In]
  fun alljoyn_autopinger_removedestination(autopinger : Alljoyn_autopinger, group : PSTR, destination : PSTR, removeall : Int32) : QStatus

  # Params # 
  fun alljoyn_getversion : PSTR

  # Params # 
  fun alljoyn_getbuildinfo : PSTR

  # Params # 
  fun alljoyn_getnumericversion : UInt32

  # Params # 
  fun alljoyn_init : QStatus

  # Params # 
  fun alljoyn_shutdown : QStatus

  # Params # 
  fun alljoyn_routerinit : QStatus

  # Params # configxml : Int8* [In]
  fun alljoyn_routerinitwithconfig(configxml : Int8*) : QStatus

  # Params # 
  fun alljoyn_routershutdown : QStatus

  # Params # proxy : Alljoyn_proxybusobject [In]
  fun alljoyn_proxybusobject_ref_create(proxy : Alljoyn_proxybusobject) : Alljoyn_proxybusobject_ref

  # Params # ref : Alljoyn_proxybusobject_ref [In]
  fun alljoyn_proxybusobject_ref_get(ref : Alljoyn_proxybusobject_ref) : Alljoyn_proxybusobject

  # Params # ref : Alljoyn_proxybusobject_ref [In]
  fun alljoyn_proxybusobject_ref_incref(ref : Alljoyn_proxybusobject_ref) : Void

  # Params # ref : Alljoyn_proxybusobject_ref [In]
  fun alljoyn_proxybusobject_ref_decref(ref : Alljoyn_proxybusobject_ref) : Void

  # Params # callback : Alljoyn_observerlistener_callback* [In],context : Void* [In]
  fun alljoyn_observerlistener_create(callback : Alljoyn_observerlistener_callback*, context : Void*) : Alljoyn_observerlistener

  # Params # listener : Alljoyn_observerlistener [In]
  fun alljoyn_observerlistener_destroy(listener : Alljoyn_observerlistener) : Void

  # Params # bus : Alljoyn_busattachment [In],mandatoryinterfaces : Int8** [In],nummandatoryinterfaces : LibC::UINT_PTR [In]
  fun alljoyn_observer_create(bus : Alljoyn_busattachment, mandatoryinterfaces : Int8**, nummandatoryinterfaces : LibC::UINT_PTR) : Alljoyn_observer

  # Params # observer : Alljoyn_observer [In]
  fun alljoyn_observer_destroy(observer : Alljoyn_observer) : Void

  # Params # observer : Alljoyn_observer [In],listener : Alljoyn_observerlistener [In],triggeronexisting : Int32 [In]
  fun alljoyn_observer_registerlistener(observer : Alljoyn_observer, listener : Alljoyn_observerlistener, triggeronexisting : Int32) : Void

  # Params # observer : Alljoyn_observer [In],listener : Alljoyn_observerlistener [In]
  fun alljoyn_observer_unregisterlistener(observer : Alljoyn_observer, listener : Alljoyn_observerlistener) : Void

  # Params # observer : Alljoyn_observer [In]
  fun alljoyn_observer_unregisteralllisteners(observer : Alljoyn_observer) : Void

  # Params # observer : Alljoyn_observer [In],uniquebusname : PSTR [In],objectpath : PSTR [In]
  fun alljoyn_observer_get(observer : Alljoyn_observer, uniquebusname : PSTR, objectpath : PSTR) : Alljoyn_proxybusobject_ref

  # Params # observer : Alljoyn_observer [In]
  fun alljoyn_observer_getfirst(observer : Alljoyn_observer) : Alljoyn_proxybusobject_ref

  # Params # observer : Alljoyn_observer [In],proxyref : Alljoyn_proxybusobject_ref [In]
  fun alljoyn_observer_getnext(observer : Alljoyn_observer, proxyref : Alljoyn_proxybusobject_ref) : Alljoyn_proxybusobject_ref

  # Params # authmechanism : PSTR [In],password : PSTR [In]
  fun alljoyn_passwordmanager_setcredentials(authmechanism : PSTR, password : PSTR) : QStatus

  # Params # 
  fun alljoyn_securityapplicationproxy_getpermissionmanagementsessionport : UInt16

  # Params # bus : Alljoyn_busattachment [In],appbusname : Int8* [In],sessionid : UInt32 [In]
  fun alljoyn_securityapplicationproxy_create(bus : Alljoyn_busattachment, appbusname : Int8*, sessionid : UInt32) : Alljoyn_securityapplicationproxy

  # Params # proxy : Alljoyn_securityapplicationproxy [In]
  fun alljoyn_securityapplicationproxy_destroy(proxy : Alljoyn_securityapplicationproxy) : Void

  # Params # proxy : Alljoyn_securityapplicationproxy [In],cakey : Int8* [In],identitycertificatechain : Int8* [In],groupid : UInt8* [In],groupsize : LibC::UINT_PTR [In],groupauthority : Int8* [In],manifestsxmls : Int8** [In],manifestscount : LibC::UINT_PTR [In]
  fun alljoyn_securityapplicationproxy_claim(proxy : Alljoyn_securityapplicationproxy, cakey : Int8*, identitycertificatechain : Int8*, groupid : UInt8*, groupsize : LibC::UINT_PTR, groupauthority : Int8*, manifestsxmls : Int8**, manifestscount : LibC::UINT_PTR) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In],manifesttemplatexml : Int8** [In]
  fun alljoyn_securityapplicationproxy_getmanifesttemplate(proxy : Alljoyn_securityapplicationproxy, manifesttemplatexml : Int8**) : QStatus

  # Params # manifesttemplatexml : Int8* [In]
  fun alljoyn_securityapplicationproxy_manifesttemplate_destroy(manifesttemplatexml : Int8*) : Void

  # Params # proxy : Alljoyn_securityapplicationproxy [In],applicationstate : Alljoyn_applicationstate* [In]
  fun alljoyn_securityapplicationproxy_getapplicationstate(proxy : Alljoyn_securityapplicationproxy, applicationstate : Alljoyn_applicationstate*) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In],capabilities : UInt16* [In]
  fun alljoyn_securityapplicationproxy_getclaimcapabilities(proxy : Alljoyn_securityapplicationproxy, capabilities : UInt16*) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In],additionalinfo : UInt16* [In]
  fun alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo(proxy : Alljoyn_securityapplicationproxy, additionalinfo : UInt16*) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In],policyxml : Int8** [In]
  fun alljoyn_securityapplicationproxy_getpolicy(proxy : Alljoyn_securityapplicationproxy, policyxml : Int8**) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In],policyxml : Int8** [In]
  fun alljoyn_securityapplicationproxy_getdefaultpolicy(proxy : Alljoyn_securityapplicationproxy, policyxml : Int8**) : QStatus

  # Params # policyxml : Int8* [In]
  fun alljoyn_securityapplicationproxy_policy_destroy(policyxml : Int8*) : Void

  # Params # proxy : Alljoyn_securityapplicationproxy [In],policyxml : Int8* [In]
  fun alljoyn_securityapplicationproxy_updatepolicy(proxy : Alljoyn_securityapplicationproxy, policyxml : Int8*) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In],identitycertificatechain : Int8* [In],manifestsxmls : Int8** [In],manifestscount : LibC::UINT_PTR [In]
  fun alljoyn_securityapplicationproxy_updateidentity(proxy : Alljoyn_securityapplicationproxy, identitycertificatechain : Int8*, manifestsxmls : Int8**, manifestscount : LibC::UINT_PTR) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In],membershipcertificatechain : Int8* [In]
  fun alljoyn_securityapplicationproxy_installmembership(proxy : Alljoyn_securityapplicationproxy, membershipcertificatechain : Int8*) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In]
  fun alljoyn_securityapplicationproxy_reset(proxy : Alljoyn_securityapplicationproxy) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In]
  fun alljoyn_securityapplicationproxy_resetpolicy(proxy : Alljoyn_securityapplicationproxy) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In]
  fun alljoyn_securityapplicationproxy_startmanagement(proxy : Alljoyn_securityapplicationproxy) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In]
  fun alljoyn_securityapplicationproxy_endmanagement(proxy : Alljoyn_securityapplicationproxy) : QStatus

  # Params # proxy : Alljoyn_securityapplicationproxy [In],eccpublickey : Int8** [In]
  fun alljoyn_securityapplicationproxy_geteccpublickey(proxy : Alljoyn_securityapplicationproxy, eccpublickey : Int8**) : QStatus

  # Params # eccpublickey : Int8* [In]
  fun alljoyn_securityapplicationproxy_eccpublickey_destroy(eccpublickey : Int8*) : Void

  # Params # unsignedmanifestxml : Int8* [In],identitycertificatepem : Int8* [In],signingprivatekeypem : Int8* [In],signedmanifestxml : Int8** [In]
  fun alljoyn_securityapplicationproxy_signmanifest(unsignedmanifestxml : Int8*, identitycertificatepem : Int8*, signingprivatekeypem : Int8*, signedmanifestxml : Int8**) : QStatus

  # Params # signedmanifestxml : Int8* [In]
  fun alljoyn_securityapplicationproxy_manifest_destroy(signedmanifestxml : Int8*) : Void

  # Params # unsignedmanifestxml : Int8* [In],identitycertificatepem : Int8* [In],digest : UInt8** [In],digestsize : LibC::UINT_PTR* [In]
  fun alljoyn_securityapplicationproxy_computemanifestdigest(unsignedmanifestxml : Int8*, identitycertificatepem : Int8*, digest : UInt8**, digestsize : LibC::UINT_PTR*) : QStatus

  # Params # digest : UInt8* [In]
  fun alljoyn_securityapplicationproxy_digest_destroy(digest : UInt8*) : Void

  # Params # unsignedmanifestxml : Int8* [In],identitycertificatepem : Int8* [In],signature : UInt8* [In],signaturesize : LibC::UINT_PTR [In],signedmanifestxml : Int8** [In]
  fun alljoyn_securityapplicationproxy_setmanifestsignature(unsignedmanifestxml : Int8*, identitycertificatepem : Int8*, signature : UInt8*, signaturesize : LibC::UINT_PTR, signedmanifestxml : Int8**) : QStatus
end
