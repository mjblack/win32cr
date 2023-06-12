require "../system/com.cr"
require "../foundation.cr"

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
  PRLT = 0_u32
  PRLE = 1_u32
  PRGT = 2_u32
  PRGE = 3_u32
  PREQ = 4_u32
  PRNE = 5_u32
  QUERY_SORTASCEND = 0_u32
  QUERY_SORTDESCEND = 1_u32
  MQ_MOVE_ACCESS = 4_u32
  MQ_ACTION_RECEIVE = 0_u32
  MQ_ACTION_PEEK_CURRENT = 2147483648_u32
  MQ_ACTION_PEEK_NEXT = 2147483649_u32
  MQ_LOOKUP_PEEK_CURRENT = 1073741840_u32
  MQ_LOOKUP_PEEK_NEXT = 1073741841_u32
  MQ_LOOKUP_PEEK_PREV = 1073741842_u32
  MQ_LOOKUP_PEEK_FIRST = 1073741844_u32
  MQ_LOOKUP_PEEK_LAST = 1073741848_u32
  MQ_LOOKUP_RECEIVE_CURRENT = 1073741856_u32
  MQ_LOOKUP_RECEIVE_NEXT = 1073741857_u32
  MQ_LOOKUP_RECEIVE_PREV = 1073741858_u32
  MQ_LOOKUP_RECEIVE_FIRST = 1073741860_u32
  MQ_LOOKUP_RECEIVE_LAST = 1073741864_u32
  MQ_LOOKUP_RECEIVE_ALLOW_PEEK = 1073742112_u32
  PROPID_M_BASE = 0_u32
  PROPID_M_CLASS = 1_u32
  PROPID_M_MSGID = 2_u32
  PROPID_M_CORRELATIONID = 3_u32
  PROPID_M_PRIORITY = 4_u32
  PROPID_M_DELIVERY = 5_u32
  PROPID_M_ACKNOWLEDGE = 6_u32
  PROPID_M_JOURNAL = 7_u32
  PROPID_M_APPSPECIFIC = 8_u32
  PROPID_M_BODY = 9_u32
  PROPID_M_BODY_SIZE = 10_u32
  PROPID_M_LABEL = 11_u32
  PROPID_M_LABEL_LEN = 12_u32
  PROPID_M_TIME_TO_REACH_QUEUE = 13_u32
  PROPID_M_TIME_TO_BE_RECEIVED = 14_u32
  PROPID_M_RESP_QUEUE = 15_u32
  PROPID_M_RESP_QUEUE_LEN = 16_u32
  PROPID_M_ADMIN_QUEUE = 17_u32
  PROPID_M_ADMIN_QUEUE_LEN = 18_u32
  PROPID_M_VERSION = 19_u32
  PROPID_M_SENDERID = 20_u32
  PROPID_M_SENDERID_LEN = 21_u32
  PROPID_M_SENDERID_TYPE = 22_u32
  PROPID_M_PRIV_LEVEL = 23_u32
  PROPID_M_AUTH_LEVEL = 24_u32
  PROPID_M_AUTHENTICATED = 25_u32
  PROPID_M_HASH_ALG = 26_u32
  PROPID_M_ENCRYPTION_ALG = 27_u32
  PROPID_M_SENDER_CERT = 28_u32
  PROPID_M_SENDER_CERT_LEN = 29_u32
  PROPID_M_SRC_MACHINE_ID = 30_u32
  PROPID_M_SENTTIME = 31_u32
  PROPID_M_ARRIVEDTIME = 32_u32
  PROPID_M_DEST_QUEUE = 33_u32
  PROPID_M_DEST_QUEUE_LEN = 34_u32
  PROPID_M_EXTENSION = 35_u32
  PROPID_M_EXTENSION_LEN = 36_u32
  PROPID_M_SECURITY_CONTEXT = 37_u32
  PROPID_M_CONNECTOR_TYPE = 38_u32
  PROPID_M_XACT_STATUS_QUEUE = 39_u32
  PROPID_M_XACT_STATUS_QUEUE_LEN = 40_u32
  PROPID_M_TRACE = 41_u32
  PROPID_M_BODY_TYPE = 42_u32
  PROPID_M_DEST_SYMM_KEY = 43_u32
  PROPID_M_DEST_SYMM_KEY_LEN = 44_u32
  PROPID_M_SIGNATURE = 45_u32
  PROPID_M_SIGNATURE_LEN = 46_u32
  PROPID_M_PROV_TYPE = 47_u32
  PROPID_M_PROV_NAME = 48_u32
  PROPID_M_PROV_NAME_LEN = 49_u32
  PROPID_M_FIRST_IN_XACT = 50_u32
  PROPID_M_LAST_IN_XACT = 51_u32
  PROPID_M_XACTID = 52_u32
  PROPID_M_AUTHENTICATED_EX = 53_u32
  PROPID_M_RESP_FORMAT_NAME = 54_u32
  PROPID_M_RESP_FORMAT_NAME_LEN = 55_u32
  PROPID_M_DEST_FORMAT_NAME = 58_u32
  PROPID_M_DEST_FORMAT_NAME_LEN = 59_u32
  PROPID_M_LOOKUPID = 60_u32
  PROPID_M_SOAP_ENVELOPE = 61_u32
  PROPID_M_SOAP_ENVELOPE_LEN = 62_u32
  PROPID_M_COMPOUND_MESSAGE = 63_u32
  PROPID_M_COMPOUND_MESSAGE_SIZE = 64_u32
  PROPID_M_SOAP_HEADER = 65_u32
  PROPID_M_SOAP_BODY = 66_u32
  PROPID_M_DEADLETTER_QUEUE = 67_u32
  PROPID_M_DEADLETTER_QUEUE_LEN = 68_u32
  PROPID_M_ABORT_COUNT = 69_u32
  PROPID_M_MOVE_COUNT = 70_u32
  PROPID_M_LAST_MOVE_TIME = 75_u32
  PROPID_M_MSGID_SIZE = 20_u32
  PROPID_M_CORRELATIONID_SIZE = 20_u32
  PROPID_M_XACTID_SIZE = 20_u32
  MQMSG_PRIV_LEVEL_BODY_AES = 5_u32
  MQMSG_AUTHENTICATED_QM_MESSAGE = 11_u32
  MQMSG_NOT_FIRST_IN_XACT = 0_u32
  MQMSG_FIRST_IN_XACT = 1_u32
  MQMSG_NOT_LAST_IN_XACT = 0_u32
  MQMSG_LAST_IN_XACT = 1_u32
  PROPID_Q_BASE = 100_u32
  PROPID_Q_INSTANCE = 101_u32
  PROPID_Q_TYPE = 102_u32
  PROPID_Q_PATHNAME = 103_u32
  PROPID_Q_JOURNAL = 104_u32
  PROPID_Q_QUOTA = 105_u32
  PROPID_Q_BASEPRIORITY = 106_u32
  PROPID_Q_JOURNAL_QUOTA = 107_u32
  PROPID_Q_LABEL = 108_u32
  PROPID_Q_CREATE_TIME = 109_u32
  PROPID_Q_MODIFY_TIME = 110_u32
  PROPID_Q_AUTHENTICATE = 111_u32
  PROPID_Q_PRIV_LEVEL = 112_u32
  PROPID_Q_TRANSACTION = 113_u32
  PROPID_Q_PATHNAME_DNS = 124_u32
  PROPID_Q_MULTICAST_ADDRESS = 125_u32
  PROPID_Q_ADS_PATH = 126_u32
  PROPID_QM_BASE = 200_u32
  PROPID_QM_SITE_ID = 201_u32
  PROPID_QM_MACHINE_ID = 202_u32
  PROPID_QM_PATHNAME = 203_u32
  PROPID_QM_CONNECTION = 204_u32
  PROPID_QM_ENCRYPTION_PK = 205_u32
  PROPID_QM_ENCRYPTION_PK_BASE = 231_u32
  PROPID_QM_ENCRYPTION_PK_ENHANCED = 232_u32
  PROPID_QM_PATHNAME_DNS = 233_u32
  PROPID_QM_ENCRYPTION_PK_AES = 244_u32
  PROPID_PC_BASE = 5800_u32
  PROPID_PC_VERSION = 5801_u32
  PROPID_PC_DS_ENABLED = 5802_u32
  PROPID_MGMT_MSMQ_BASE = 0_u32
  PROPID_MGMT_MSMQ_ACTIVEQUEUES = 1_u32
  PROPID_MGMT_MSMQ_PRIVATEQ = 2_u32
  PROPID_MGMT_MSMQ_DSSERVER = 3_u32
  PROPID_MGMT_MSMQ_CONNECTED = 4_u32
  PROPID_MGMT_MSMQ_TYPE = 5_u32
  PROPID_MGMT_MSMQ_BYTES_IN_ALL_QUEUES = 6_u32
  PROPID_MGMT_QUEUE_BASE = 0_u32
  PROPID_MGMT_QUEUE_PATHNAME = 1_u32
  PROPID_MGMT_QUEUE_FORMATNAME = 2_u32
  PROPID_MGMT_QUEUE_TYPE = 3_u32
  PROPID_MGMT_QUEUE_LOCATION = 4_u32
  PROPID_MGMT_QUEUE_XACT = 5_u32
  PROPID_MGMT_QUEUE_FOREIGN = 6_u32
  PROPID_MGMT_QUEUE_MESSAGE_COUNT = 7_u32
  PROPID_MGMT_QUEUE_BYTES_IN_QUEUE = 8_u32
  PROPID_MGMT_QUEUE_JOURNAL_MESSAGE_COUNT = 9_u32
  PROPID_MGMT_QUEUE_BYTES_IN_JOURNAL = 10_u32
  PROPID_MGMT_QUEUE_STATE = 11_u32
  PROPID_MGMT_QUEUE_NEXTHOPS = 12_u32
  PROPID_MGMT_QUEUE_EOD_LAST_ACK = 13_u32
  PROPID_MGMT_QUEUE_EOD_LAST_ACK_TIME = 14_u32
  PROPID_MGMT_QUEUE_EOD_LAST_ACK_COUNT = 15_u32
  PROPID_MGMT_QUEUE_EOD_FIRST_NON_ACK = 16_u32
  PROPID_MGMT_QUEUE_EOD_LAST_NON_ACK = 17_u32
  PROPID_MGMT_QUEUE_EOD_NEXT_SEQ = 18_u32
  PROPID_MGMT_QUEUE_EOD_NO_READ_COUNT = 19_u32
  PROPID_MGMT_QUEUE_EOD_NO_ACK_COUNT = 20_u32
  PROPID_MGMT_QUEUE_EOD_RESEND_TIME = 21_u32
  PROPID_MGMT_QUEUE_EOD_RESEND_INTERVAL = 22_u32
  PROPID_MGMT_QUEUE_EOD_RESEND_COUNT = 23_u32
  PROPID_MGMT_QUEUE_EOD_SOURCE_INFO = 24_u32
  PROPID_MGMT_QUEUE_CONNECTION_HISTORY = 25_u32
  PROPID_MGMT_QUEUE_SUBQUEUE_COUNT = 26_u32
  PROPID_MGMT_QUEUE_SUBQUEUE_NAMES = 27_u32
  PROPID_MGMT_QUEUE_USED_QUOTA = 8_u32
  PROPID_MGMT_QUEUE_JOURNAL_USED_QUOTA = 10_u32
  LONG_LIVED = 4294967294_u32
  MQSEC_DELETE_MESSAGE = 1_u32
  MQSEC_PEEK_MESSAGE = 2_u32
  MQSEC_WRITE_MESSAGE = 4_u32
  MQSEC_DELETE_JOURNAL_MESSAGE = 8_u32
  MQSEC_SET_QUEUE_PROPERTIES = 16_u32
  MQSEC_GET_QUEUE_PROPERTIES = 32_u32
  MQSEC_DELETE_QUEUE = 65536_u32
  MQSEC_CHANGE_QUEUE_PERMISSIONS = 262144_u32
  MQSEC_TAKE_QUEUE_OWNERSHIP = 524288_u32
  MQSEC_QUEUE_GENERIC_EXECUTE = 0_u32
  MQ_OK = 0_i32
  MQ_ERROR_RESOLVE_ADDRESS = -1072824167_i32
  MQ_ERROR_TOO_MANY_PROPERTIES = -1072824166_i32
  MQ_ERROR_MESSAGE_NOT_AUTHENTICATED = -1072824165_i32
  MQ_ERROR_MESSAGE_LOCKED_UNDER_TRANSACTION = -1072824164_i32
  MSMQQuery = LibC::GUID.new(0xd7d6e073_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQMessage = LibC::GUID.new(0xd7d6e075_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQQueue = LibC::GUID.new(0xd7d6e079_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQEvent = LibC::GUID.new(0xd7d6e07a_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQQueueInfo = LibC::GUID.new(0xd7d6e07c_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQQueueInfos = LibC::GUID.new(0xd7d6e07e_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQTransaction = LibC::GUID.new(0xd7d6e080_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQCoordinatedTransactionDispenser = LibC::GUID.new(0xd7d6e082_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQTransactionDispenser = LibC::GUID.new(0xd7d6e084_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQApplication = LibC::GUID.new(0xd7d6e086_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  MSMQDestination = LibC::GUID.new(0xeba96b18_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  MSMQCollection = LibC::GUID.new(0xf72b9031_u32, 0x2f0c_u16, 0x43e8_u16, StaticArray[0x92_u8, 0x4e_u8, 0xe6_u8, 0x5_u8, 0x2c_u8, 0xdc_u8, 0x49_u8, 0x3f_u8])
  MSMQManagement = LibC::GUID.new(0x39ce96fe_u32, 0xf4c5_u16, 0x4484_u16, StaticArray[0xa1_u8, 0x43_u8, 0x4c_u8, 0x2d_u8, 0x5d_u8, 0x32_u8, 0x42_u8, 0x29_u8])
  MSMQOutgoingQueueManagement = LibC::GUID.new(0x188401c_u32, 0x247a_u16, 0x4fed_u16, StaticArray[0x99_u8, 0xc6_u8, 0xbf_u8, 0x14_u8, 0x11_u8, 0x9d_u8, 0x70_u8, 0x55_u8])
  MSMQQueueManagement = LibC::GUID.new(0x33b6d07e_u32, 0xf27d_u16, 0x42fa_u16, StaticArray[0xb2_u8, 0xd7_u8, 0xbf_u8, 0x82_u8, 0xe1_u8, 0x1e_u8, 0x93_u8, 0x74_u8])


  enum MQCALG : Int32
    MQMSG_CALG_MD2 = 32769
    MQMSG_CALG_MD4 = 32770
    MQMSG_CALG_MD5 = 32771
    MQMSG_CALG_SHA = 32772
    MQMSG_CALG_SHA1 = 32772
    MQMSG_CALG_MAC = 32773
    MQMSG_CALG_RSA_SIGN = 9216
    MQMSG_CALG_DSS_SIGN = 8704
    MQMSG_CALG_RSA_KEYX = 41984
    MQMSG_CALG_DES = 26113
    MQMSG_CALG_RC2 = 26114
    MQMSG_CALG_RC4 = 26625
    MQMSG_CALG_SEAL = 26626
  end

  enum MQTRANSACTION : Int32
    MQ_NO_TRANSACTION = 0
    MQ_MTS_TRANSACTION = 1
    MQ_XA_TRANSACTION = 2
    MQ_SINGLE_MESSAGE = 3
  end

  enum RELOPS : Int32
    REL_NOP = 0
    REL_EQ = 1
    REL_NEQ = 2
    REL_LT = 3
    REL_GT = 4
    REL_LE = 5
    REL_GE = 6
  end

  enum MQCERT_REGISTER : Int32
    MQCERT_REGISTER_ALWAYS = 1
    MQCERT_REGISTER_IF_NOT_EXIST = 2
  end

  enum MQMSGCURSOR : Int32
    MQMSG_FIRST = 0
    MQMSG_CURRENT = 1
    MQMSG_NEXT = 2
  end

  enum MQMSGCLASS : Int32
    MQMSG_CLASS_NORMAL = 0
    MQMSG_CLASS_REPORT = 1
    MQMSG_CLASS_ACK_REACH_QUEUE = 2
    MQMSG_CLASS_ACK_RECEIVE = 16384
    MQMSG_CLASS_NACK_BAD_DST_Q = 32768
    MQMSG_CLASS_NACK_PURGED = 32769
    MQMSG_CLASS_NACK_REACH_QUEUE_TIMEOUT = 32770
    MQMSG_CLASS_NACK_Q_EXCEED_QUOTA = 32771
    MQMSG_CLASS_NACK_ACCESS_DENIED = 32772
    MQMSG_CLASS_NACK_HOP_COUNT_EXCEEDED = 32773
    MQMSG_CLASS_NACK_BAD_SIGNATURE = 32774
    MQMSG_CLASS_NACK_BAD_ENCRYPTION = 32775
    MQMSG_CLASS_NACK_COULD_NOT_ENCRYPT = 32776
    MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_Q = 32777
    MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_MSG = 32778
    MQMSG_CLASS_NACK_UNSUPPORTED_CRYPTO_PROVIDER = 32779
    MQMSG_CLASS_NACK_SOURCE_COMPUTER_GUID_CHANGED = 32780
    MQMSG_CLASS_NACK_Q_DELETED = 49152
    MQMSG_CLASS_NACK_Q_PURGED = 49153
    MQMSG_CLASS_NACK_RECEIVE_TIMEOUT = 49154
    MQMSG_CLASS_NACK_RECEIVE_TIMEOUT_AT_SENDER = 49155
  end

  enum MQMSGDELIVERY : Int32
    MQMSG_DELIVERY_EXPRESS = 0
    MQMSG_DELIVERY_RECOVERABLE = 1
  end

  enum MQMSGACKNOWLEDGEMENT : Int32
    MQMSG_ACKNOWLEDGMENT_NONE = 0
    MQMSG_ACKNOWLEDGMENT_POS_ARRIVAL = 1
    MQMSG_ACKNOWLEDGMENT_POS_RECEIVE = 2
    MQMSG_ACKNOWLEDGMENT_NEG_ARRIVAL = 4
    MQMSG_ACKNOWLEDGMENT_NEG_RECEIVE = 8
    MQMSG_ACKNOWLEDGMENT_NACK_REACH_QUEUE = 4
    MQMSG_ACKNOWLEDGMENT_FULL_REACH_QUEUE = 5
    MQMSG_ACKNOWLEDGMENT_NACK_RECEIVE = 12
    MQMSG_ACKNOWLEDGMENT_FULL_RECEIVE = 14
  end

  enum MQMSGJOURNAL : Int32
    MQMSG_JOURNAL_NONE = 0
    MQMSG_DEADLETTER = 1
    MQMSG_JOURNAL = 2
  end

  enum MQMSGTRACE : Int32
    MQMSG_TRACE_NONE = 0
    MQMSG_SEND_ROUTE_TO_REPORT_QUEUE = 1
  end

  enum MQMSGSENDERIDTYPE : Int32
    MQMSG_SENDERID_TYPE_NONE = 0
    MQMSG_SENDERID_TYPE_SID = 1
  end

  enum MQMSGPRIVLEVEL : Int32
    MQMSG_PRIV_LEVEL_NONE = 0
    MQMSG_PRIV_LEVEL_BODY_BASE = 1
    MQMSG_PRIV_LEVEL_BODY_ENHANCED = 3
  end

  enum MQMSGAUTHLEVEL : Int32
    MQMSG_AUTH_LEVEL_NONE = 0
    MQMSG_AUTH_LEVEL_ALWAYS = 1
    MQMSG_AUTH_LEVEL_MSMQ10 = 2
    MQMSG_AUTH_LEVEL_SIG10 = 2
    MQMSG_AUTH_LEVEL_MSMQ20 = 4
    MQMSG_AUTH_LEVEL_SIG20 = 4
    MQMSG_AUTH_LEVEL_SIG30 = 8
  end

  enum MQMSGIDSIZE : Int32
    MQMSG_MSGID_SIZE = 20
    MQMSG_CORRELATIONID_SIZE = 20
    MQMSG_XACTID_SIZE = 20
  end

  enum MQMSGMAX : Int32
    MQ_MAX_MSG_LABEL_LEN = 249
  end

  enum MQMSGAUTHENTICATION : Int32
    MQMSG_AUTHENTICATION_NOT_REQUESTED = 0
    MQMSG_AUTHENTICATION_REQUESTED = 1
    MQMSG_AUTHENTICATED_SIG10 = 1
    MQMSG_AUTHENTICATION_REQUESTED_EX = 3
    MQMSG_AUTHENTICATED_SIG20 = 3
    MQMSG_AUTHENTICATED_SIG30 = 5
    MQMSG_AUTHENTICATED_SIGXML = 9
  end

  enum MQSHARE : Int32
    MQ_DENY_NONE = 0
    MQ_DENY_RECEIVE_SHARE = 1
  end

  enum MQACCESS : Int32
    MQ_RECEIVE_ACCESS = 1
    MQ_SEND_ACCESS = 2
    MQ_PEEK_ACCESS = 32
    MQ_ADMIN_ACCESS = 128
  end

  enum MQJOURNAL : Int32
    MQ_JOURNAL_NONE = 0
    MQ_JOURNAL = 1
  end

  enum MQTRANSACTIONAL : Int32
    MQ_TRANSACTIONAL_NONE = 0
    MQ_TRANSACTIONAL = 1
  end

  enum MQAUTHENTICATE : Int32
    MQ_AUTHENTICATE_NONE = 0
    MQ_AUTHENTICATE = 1
  end

  enum MQPRIVLEVEL : Int32
    MQ_PRIV_LEVEL_NONE = 0
    MQ_PRIV_LEVEL_OPTIONAL = 1
    MQ_PRIV_LEVEL_BODY = 2
  end

  enum MQPRIORITY : Int32
    MQ_MIN_PRIORITY = 0
    MQ_MAX_PRIORITY = 7
  end

  enum MQMAX : Int32
    MQ_MAX_Q_NAME_LEN = 124
    MQ_MAX_Q_LABEL_LEN = 124
  end

  enum QUEUE_TYPE : Int32
    MQ_TYPE_PUBLIC = 0
    MQ_TYPE_PRIVATE = 1
    MQ_TYPE_MACHINE = 2
    MQ_TYPE_CONNECTOR = 3
    MQ_TYPE_MULTICAST = 4
  end

  enum FOREIGN_STATUS : Int32
    MQ_STATUS_FOREIGN = 0
    MQ_STATUS_NOT_FOREIGN = 1
    MQ_STATUS_UNKNOWN = 2
  end

  enum XACT_STATUS : Int32
    MQ_XACT_STATUS_XACT = 0
    MQ_XACT_STATUS_NOT_XACT = 1
    MQ_XACT_STATUS_UNKNOWN = 2
  end

  enum QUEUE_STATE : Int32
    MQ_QUEUE_STATE_LOCAL_CONNECTION = 0
    MQ_QUEUE_STATE_DISCONNECTED = 1
    MQ_QUEUE_STATE_WAITING = 2
    MQ_QUEUE_STATE_NEEDVALIDATE = 3
    MQ_QUEUE_STATE_ONHOLD = 4
    MQ_QUEUE_STATE_NONACTIVE = 5
    MQ_QUEUE_STATE_CONNECTED = 6
    MQ_QUEUE_STATE_DISCONNECTING = 7
    MQ_QUEUE_STATE_LOCKED = 8
  end

  enum MQDEFAULT : Int32
    DEFAULT_M_PRIORITY = 3
    DEFAULT_M_DELIVERY = 0
    DEFAULT_M_ACKNOWLEDGE = 0
    DEFAULT_M_JOURNAL = 0
    DEFAULT_M_APPSPECIFIC = 0
    DEFAULT_M_PRIV_LEVEL = 0
    DEFAULT_M_AUTH_LEVEL = 0
    DEFAULT_M_SENDERID_TYPE = 1
    DEFAULT_Q_JOURNAL = 0
    DEFAULT_Q_BASEPRIORITY = 0
    DEFAULT_Q_QUOTA = -1
    DEFAULT_Q_JOURNAL_QUOTA = -1
    DEFAULT_Q_TRANSACTION = 0
    DEFAULT_Q_AUTHENTICATE = 0
    DEFAULT_Q_PRIV_LEVEL = 1
    DEFAULT_M_LOOKUPID = 0
  end

  enum MQERROR : Int32
    MQ_ERROR = -1072824319
    MQ_ERROR_PROPERTY = -1072824318
    MQ_ERROR_QUEUE_NOT_FOUND = -1072824317
    MQ_ERROR_QUEUE_NOT_ACTIVE = -1072824316
    MQ_ERROR_QUEUE_EXISTS = -1072824315
    MQ_ERROR_INVALID_PARAMETER = -1072824314
    MQ_ERROR_INVALID_HANDLE = -1072824313
    MQ_ERROR_OPERATION_CANCELLED = -1072824312
    MQ_ERROR_SHARING_VIOLATION = -1072824311
    MQ_ERROR_SERVICE_NOT_AVAILABLE = -1072824309
    MQ_ERROR_MACHINE_NOT_FOUND = -1072824307
    MQ_ERROR_ILLEGAL_SORT = -1072824304
    MQ_ERROR_ILLEGAL_USER = -1072824303
    MQ_ERROR_NO_DS = -1072824301
    MQ_ERROR_ILLEGAL_QUEUE_PATHNAME = -1072824300
    MQ_ERROR_ILLEGAL_PROPERTY_VALUE = -1072824296
    MQ_ERROR_ILLEGAL_PROPERTY_VT = -1072824295
    MQ_ERROR_BUFFER_OVERFLOW = -1072824294
    MQ_ERROR_IO_TIMEOUT = -1072824293
    MQ_ERROR_ILLEGAL_CURSOR_ACTION = -1072824292
    MQ_ERROR_MESSAGE_ALREADY_RECEIVED = -1072824291
    MQ_ERROR_ILLEGAL_FORMATNAME = -1072824290
    MQ_ERROR_FORMATNAME_BUFFER_TOO_SMALL = -1072824289
    MQ_ERROR_UNSUPPORTED_FORMATNAME_OPERATION = -1072824288
    MQ_ERROR_ILLEGAL_SECURITY_DESCRIPTOR = -1072824287
    MQ_ERROR_SENDERID_BUFFER_TOO_SMALL = -1072824286
    MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL = -1072824285
    MQ_ERROR_CANNOT_IMPERSONATE_CLIENT = -1072824284
    MQ_ERROR_ACCESS_DENIED = -1072824283
    MQ_ERROR_PRIVILEGE_NOT_HELD = -1072824282
    MQ_ERROR_INSUFFICIENT_RESOURCES = -1072824281
    MQ_ERROR_USER_BUFFER_TOO_SMALL = -1072824280
    MQ_ERROR_MESSAGE_STORAGE_FAILED = -1072824278
    MQ_ERROR_SENDER_CERT_BUFFER_TOO_SMALL = -1072824277
    MQ_ERROR_INVALID_CERTIFICATE = -1072824276
    MQ_ERROR_CORRUPTED_INTERNAL_CERTIFICATE = -1072824275
    MQ_ERROR_INTERNAL_USER_CERT_EXIST = -1072824274
    MQ_ERROR_NO_INTERNAL_USER_CERT = -1072824273
    MQ_ERROR_CORRUPTED_SECURITY_DATA = -1072824272
    MQ_ERROR_CORRUPTED_PERSONAL_CERT_STORE = -1072824271
    MQ_ERROR_COMPUTER_DOES_NOT_SUPPORT_ENCRYPTION = -1072824269
    MQ_ERROR_BAD_SECURITY_CONTEXT = -1072824267
    MQ_ERROR_COULD_NOT_GET_USER_SID = -1072824266
    MQ_ERROR_COULD_NOT_GET_ACCOUNT_INFO = -1072824265
    MQ_ERROR_ILLEGAL_MQCOLUMNS = -1072824264
    MQ_ERROR_ILLEGAL_PROPID = -1072824263
    MQ_ERROR_ILLEGAL_RELATION = -1072824262
    MQ_ERROR_ILLEGAL_PROPERTY_SIZE = -1072824261
    MQ_ERROR_ILLEGAL_RESTRICTION_PROPID = -1072824260
    MQ_ERROR_ILLEGAL_MQQUEUEPROPS = -1072824259
    MQ_ERROR_PROPERTY_NOTALLOWED = -1072824258
    MQ_ERROR_INSUFFICIENT_PROPERTIES = -1072824257
    MQ_ERROR_MACHINE_EXISTS = -1072824256
    MQ_ERROR_ILLEGAL_MQQMPROPS = -1072824255
    MQ_ERROR_DS_IS_FULL = -1072824254
    MQ_ERROR_DS_ERROR = -1072824253
    MQ_ERROR_INVALID_OWNER = -1072824252
    MQ_ERROR_UNSUPPORTED_ACCESS_MODE = -1072824251
    MQ_ERROR_RESULT_BUFFER_TOO_SMALL = -1072824250
    MQ_ERROR_DELETE_CN_IN_USE = -1072824248
    MQ_ERROR_NO_RESPONSE_FROM_OBJECT_SERVER = -1072824247
    MQ_ERROR_OBJECT_SERVER_NOT_AVAILABLE = -1072824246
    MQ_ERROR_QUEUE_NOT_AVAILABLE = -1072824245
    MQ_ERROR_DTC_CONNECT = -1072824244
    MQ_ERROR_TRANSACTION_IMPORT = -1072824242
    MQ_ERROR_TRANSACTION_USAGE = -1072824240
    MQ_ERROR_TRANSACTION_SEQUENCE = -1072824239
    MQ_ERROR_MISSING_CONNECTOR_TYPE = -1072824235
    MQ_ERROR_STALE_HANDLE = -1072824234
    MQ_ERROR_TRANSACTION_ENLIST = -1072824232
    MQ_ERROR_QUEUE_DELETED = -1072824230
    MQ_ERROR_ILLEGAL_CONTEXT = -1072824229
    MQ_ERROR_ILLEGAL_SORT_PROPID = -1072824228
    MQ_ERROR_LABEL_TOO_LONG = -1072824227
    MQ_ERROR_LABEL_BUFFER_TOO_SMALL = -1072824226
    MQ_ERROR_MQIS_SERVER_EMPTY = -1072824225
    MQ_ERROR_MQIS_READONLY_MODE = -1072824224
    MQ_ERROR_SYMM_KEY_BUFFER_TOO_SMALL = -1072824223
    MQ_ERROR_SIGNATURE_BUFFER_TOO_SMALL = -1072824222
    MQ_ERROR_PROV_NAME_BUFFER_TOO_SMALL = -1072824221
    MQ_ERROR_ILLEGAL_OPERATION = -1072824220
    MQ_ERROR_WRITE_NOT_ALLOWED = -1072824219
    MQ_ERROR_WKS_CANT_SERVE_CLIENT = -1072824218
    MQ_ERROR_DEPEND_WKS_LICENSE_OVERFLOW = -1072824217
    MQ_CORRUPTED_QUEUE_WAS_DELETED = -1072824216
    MQ_ERROR_REMOTE_MACHINE_NOT_AVAILABLE = -1072824215
    MQ_ERROR_UNSUPPORTED_OPERATION = -1072824214
    MQ_ERROR_ENCRYPTION_PROVIDER_NOT_SUPPORTED = -1072824213
    MQ_ERROR_CANNOT_SET_CRYPTO_SEC_DESCR = -1072824212
    MQ_ERROR_CERTIFICATE_NOT_PROVIDED = -1072824211
    MQ_ERROR_Q_DNS_PROPERTY_NOT_SUPPORTED = -1072824210
    MQ_ERROR_CANT_CREATE_CERT_STORE = -1072824209
    MQ_ERROR_CANNOT_CREATE_CERT_STORE = -1072824209
    MQ_ERROR_CANT_OPEN_CERT_STORE = -1072824208
    MQ_ERROR_CANNOT_OPEN_CERT_STORE = -1072824208
    MQ_ERROR_ILLEGAL_ENTERPRISE_OPERATION = -1072824207
    MQ_ERROR_CANNOT_GRANT_ADD_GUID = -1072824206
    MQ_ERROR_CANNOT_LOAD_MSMQOCM = -1072824205
    MQ_ERROR_NO_ENTRY_POINT_MSMQOCM = -1072824204
    MQ_ERROR_NO_MSMQ_SERVERS_ON_DC = -1072824203
    MQ_ERROR_CANNOT_JOIN_DOMAIN = -1072824202
    MQ_ERROR_CANNOT_CREATE_ON_GC = -1072824201
    MQ_ERROR_GUID_NOT_MATCHING = -1072824200
    MQ_ERROR_PUBLIC_KEY_NOT_FOUND = -1072824199
    MQ_ERROR_PUBLIC_KEY_DOES_NOT_EXIST = -1072824198
    MQ_ERROR_ILLEGAL_MQPRIVATEPROPS = -1072824197
    MQ_ERROR_NO_GC_IN_DOMAIN = -1072824196
    MQ_ERROR_NO_MSMQ_SERVERS_ON_GC = -1072824195
    MQ_ERROR_CANNOT_GET_DN = -1072824194
    MQ_ERROR_CANNOT_HASH_DATA_EX = -1072824193
    MQ_ERROR_CANNOT_SIGN_DATA_EX = -1072824192
    MQ_ERROR_CANNOT_CREATE_HASH_EX = -1072824191
    MQ_ERROR_FAIL_VERIFY_SIGNATURE_EX = -1072824190
    MQ_ERROR_CANNOT_DELETE_PSC_OBJECTS = -1072824189
    MQ_ERROR_NO_MQUSER_OU = -1072824188
    MQ_ERROR_CANNOT_LOAD_MQAD = -1072824187
    MQ_ERROR_CANNOT_LOAD_MQDSSRV = -1072824186
    MQ_ERROR_PROPERTIES_CONFLICT = -1072824185
    MQ_ERROR_MESSAGE_NOT_FOUND = -1072824184
    MQ_ERROR_CANT_RESOLVE_SITES = -1072824183
    MQ_ERROR_NOT_SUPPORTED_BY_DEPENDENT_CLIENTS = -1072824182
    MQ_ERROR_OPERATION_NOT_SUPPORTED_BY_REMOTE_COMPUTER = -1072824181
    MQ_ERROR_NOT_A_CORRECT_OBJECT_CLASS = -1072824180
    MQ_ERROR_MULTI_SORT_KEYS = -1072824179
    MQ_ERROR_GC_NEEDED = -1072824178
    MQ_ERROR_DS_BIND_ROOT_FOREST = -1072824177
    MQ_ERROR_DS_LOCAL_USER = -1072824176
    MQ_ERROR_Q_ADS_PROPERTY_NOT_SUPPORTED = -1072824175
    MQ_ERROR_BAD_XML_FORMAT = -1072824174
    MQ_ERROR_UNSUPPORTED_CLASS = -1072824173
    MQ_ERROR_UNINITIALIZED_OBJECT = -1072824172
    MQ_ERROR_CANNOT_CREATE_PSC_OBJECTS = -1072824171
    MQ_ERROR_CANNOT_UPDATE_PSC_OBJECTS = -1072824170
  end

  enum MQWARNING : Int32
    MQ_INFORMATION_PROPERTY = 1074659329
    MQ_INFORMATION_ILLEGAL_PROPERTY = 1074659330
    MQ_INFORMATION_PROPERTY_IGNORED = 1074659331
    MQ_INFORMATION_UNSUPPORTED_PROPERTY = 1074659332
    MQ_INFORMATION_DUPLICATE_PROPERTY = 1074659333
    MQ_INFORMATION_OPERATION_PENDING = 1074659334
    MQ_INFORMATION_FORMATNAME_BUFFER_TOO_SMALL = 1074659337
    MQ_INFORMATION_INTERNAL_USER_CERT_EXIST = 1074659338
    MQ_INFORMATION_OWNER_IGNORED = 1074659339
  end


  struct IMSMQQueryVTbl
    query_interface : Proc(IMSMQQuery*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQuery*, UInt32)
    release : Proc(IMSMQQuery*, UInt32)
    get_type_info_count : Proc(IMSMQQuery*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQuery*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQuery*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQuery*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    lookup_queue : Proc(IMSMQQuery*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos*, HRESULT)
  end

  IMSMQQuery_GUID = LibC::GUID.new("d7d6e072-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQQuery = "d7d6e072-dccd-11d0-aa4b-0060970debae"
  struct IMSMQQuery
    lpVtbl : IMSMQQueryVTbl*
  end

  struct IMSMQQueueInfoVTbl
    query_interface : Proc(IMSMQQueueInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueueInfo*, UInt32)
    release : Proc(IMSMQQueueInfo*, UInt32)
    get_type_info_count : Proc(IMSMQQueueInfo*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueueInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueueInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueueInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_queue_guid : Proc(IMSMQQueueInfo*, UInt8**, HRESULT)
    get_service_type_guid : Proc(IMSMQQueueInfo*, UInt8**, HRESULT)
    put_service_type_guid : Proc(IMSMQQueueInfo*, UInt8*, HRESULT)
    get_label : Proc(IMSMQQueueInfo*, UInt8**, HRESULT)
    put_label : Proc(IMSMQQueueInfo*, UInt8*, HRESULT)
    get_path_name : Proc(IMSMQQueueInfo*, UInt8**, HRESULT)
    put_path_name : Proc(IMSMQQueueInfo*, UInt8*, HRESULT)
    get_format_name : Proc(IMSMQQueueInfo*, UInt8**, HRESULT)
    put_format_name : Proc(IMSMQQueueInfo*, UInt8*, HRESULT)
    get_is_transactional : Proc(IMSMQQueueInfo*, Int16*, HRESULT)
    get_priv_level : Proc(IMSMQQueueInfo*, Int32*, HRESULT)
    put_priv_level : Proc(IMSMQQueueInfo*, Int32, HRESULT)
    get_journal : Proc(IMSMQQueueInfo*, Int32*, HRESULT)
    put_journal : Proc(IMSMQQueueInfo*, Int32, HRESULT)
    get_quota : Proc(IMSMQQueueInfo*, Int32*, HRESULT)
    put_quota : Proc(IMSMQQueueInfo*, Int32, HRESULT)
    get_base_priority : Proc(IMSMQQueueInfo*, Int32*, HRESULT)
    put_base_priority : Proc(IMSMQQueueInfo*, Int32, HRESULT)
    get_create_time : Proc(IMSMQQueueInfo*, VARIANT*, HRESULT)
    get_modify_time : Proc(IMSMQQueueInfo*, VARIANT*, HRESULT)
    get_authenticate : Proc(IMSMQQueueInfo*, Int32*, HRESULT)
    put_authenticate : Proc(IMSMQQueueInfo*, Int32, HRESULT)
    get_journal_quota : Proc(IMSMQQueueInfo*, Int32*, HRESULT)
    put_journal_quota : Proc(IMSMQQueueInfo*, Int32, HRESULT)
    get_is_world_readable : Proc(IMSMQQueueInfo*, Int16*, HRESULT)
    create : Proc(IMSMQQueueInfo*, VARIANT*, VARIANT*, HRESULT)
    delete : Proc(IMSMQQueueInfo*, HRESULT)
    open : Proc(IMSMQQueueInfo*, Int32, Int32, IMSMQQueue*, HRESULT)
    refresh : Proc(IMSMQQueueInfo*, HRESULT)
    update : Proc(IMSMQQueueInfo*, HRESULT)
  end

  IMSMQQueueInfo_GUID = LibC::GUID.new("d7d6e07b-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQQueueInfo = "d7d6e07b-dccd-11d0-aa4b-0060970debae"
  struct IMSMQQueueInfo
    lpVtbl : IMSMQQueueInfoVTbl*
  end

  struct IMSMQQueueInfo2VTbl
    query_interface : Proc(IMSMQQueueInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueueInfo2*, UInt32)
    release : Proc(IMSMQQueueInfo2*, UInt32)
    get_type_info_count : Proc(IMSMQQueueInfo2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueueInfo2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueueInfo2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueueInfo2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_queue_guid : Proc(IMSMQQueueInfo2*, UInt8**, HRESULT)
    get_service_type_guid : Proc(IMSMQQueueInfo2*, UInt8**, HRESULT)
    put_service_type_guid : Proc(IMSMQQueueInfo2*, UInt8*, HRESULT)
    get_label : Proc(IMSMQQueueInfo2*, UInt8**, HRESULT)
    put_label : Proc(IMSMQQueueInfo2*, UInt8*, HRESULT)
    get_path_name : Proc(IMSMQQueueInfo2*, UInt8**, HRESULT)
    put_path_name : Proc(IMSMQQueueInfo2*, UInt8*, HRESULT)
    get_format_name : Proc(IMSMQQueueInfo2*, UInt8**, HRESULT)
    put_format_name : Proc(IMSMQQueueInfo2*, UInt8*, HRESULT)
    get_is_transactional : Proc(IMSMQQueueInfo2*, Int16*, HRESULT)
    get_priv_level : Proc(IMSMQQueueInfo2*, Int32*, HRESULT)
    put_priv_level : Proc(IMSMQQueueInfo2*, Int32, HRESULT)
    get_journal : Proc(IMSMQQueueInfo2*, Int32*, HRESULT)
    put_journal : Proc(IMSMQQueueInfo2*, Int32, HRESULT)
    get_quota : Proc(IMSMQQueueInfo2*, Int32*, HRESULT)
    put_quota : Proc(IMSMQQueueInfo2*, Int32, HRESULT)
    get_base_priority : Proc(IMSMQQueueInfo2*, Int32*, HRESULT)
    put_base_priority : Proc(IMSMQQueueInfo2*, Int32, HRESULT)
    get_create_time : Proc(IMSMQQueueInfo2*, VARIANT*, HRESULT)
    get_modify_time : Proc(IMSMQQueueInfo2*, VARIANT*, HRESULT)
    get_authenticate : Proc(IMSMQQueueInfo2*, Int32*, HRESULT)
    put_authenticate : Proc(IMSMQQueueInfo2*, Int32, HRESULT)
    get_journal_quota : Proc(IMSMQQueueInfo2*, Int32*, HRESULT)
    put_journal_quota : Proc(IMSMQQueueInfo2*, Int32, HRESULT)
    get_is_world_readable : Proc(IMSMQQueueInfo2*, Int16*, HRESULT)
    create : Proc(IMSMQQueueInfo2*, VARIANT*, VARIANT*, HRESULT)
    delete : Proc(IMSMQQueueInfo2*, HRESULT)
    open : Proc(IMSMQQueueInfo2*, Int32, Int32, IMSMQQueue2*, HRESULT)
    refresh : Proc(IMSMQQueueInfo2*, HRESULT)
    update : Proc(IMSMQQueueInfo2*, HRESULT)
    get_path_name_dns : Proc(IMSMQQueueInfo2*, UInt8**, HRESULT)
    get_properties : Proc(IMSMQQueueInfo2*, IDispatch*, HRESULT)
    get_security : Proc(IMSMQQueueInfo2*, VARIANT*, HRESULT)
    put_security : Proc(IMSMQQueueInfo2*, VARIANT, HRESULT)
  end

  IMSMQQueueInfo2_GUID = LibC::GUID.new("fd174a80-89cf-11d2-b0f2-00e02c074f6b")
  CLSID_IMSMQQueueInfo2 = "fd174a80-89cf-11d2-b0f2-00e02c074f6b"
  struct IMSMQQueueInfo2
    lpVtbl : IMSMQQueueInfo2VTbl*
  end

  struct IMSMQQueueInfo3VTbl
    query_interface : Proc(IMSMQQueueInfo3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueueInfo3*, UInt32)
    release : Proc(IMSMQQueueInfo3*, UInt32)
    get_type_info_count : Proc(IMSMQQueueInfo3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueueInfo3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueueInfo3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueueInfo3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_queue_guid : Proc(IMSMQQueueInfo3*, UInt8**, HRESULT)
    get_service_type_guid : Proc(IMSMQQueueInfo3*, UInt8**, HRESULT)
    put_service_type_guid : Proc(IMSMQQueueInfo3*, UInt8*, HRESULT)
    get_label : Proc(IMSMQQueueInfo3*, UInt8**, HRESULT)
    put_label : Proc(IMSMQQueueInfo3*, UInt8*, HRESULT)
    get_path_name : Proc(IMSMQQueueInfo3*, UInt8**, HRESULT)
    put_path_name : Proc(IMSMQQueueInfo3*, UInt8*, HRESULT)
    get_format_name : Proc(IMSMQQueueInfo3*, UInt8**, HRESULT)
    put_format_name : Proc(IMSMQQueueInfo3*, UInt8*, HRESULT)
    get_is_transactional : Proc(IMSMQQueueInfo3*, Int16*, HRESULT)
    get_priv_level : Proc(IMSMQQueueInfo3*, Int32*, HRESULT)
    put_priv_level : Proc(IMSMQQueueInfo3*, Int32, HRESULT)
    get_journal : Proc(IMSMQQueueInfo3*, Int32*, HRESULT)
    put_journal : Proc(IMSMQQueueInfo3*, Int32, HRESULT)
    get_quota : Proc(IMSMQQueueInfo3*, Int32*, HRESULT)
    put_quota : Proc(IMSMQQueueInfo3*, Int32, HRESULT)
    get_base_priority : Proc(IMSMQQueueInfo3*, Int32*, HRESULT)
    put_base_priority : Proc(IMSMQQueueInfo3*, Int32, HRESULT)
    get_create_time : Proc(IMSMQQueueInfo3*, VARIANT*, HRESULT)
    get_modify_time : Proc(IMSMQQueueInfo3*, VARIANT*, HRESULT)
    get_authenticate : Proc(IMSMQQueueInfo3*, Int32*, HRESULT)
    put_authenticate : Proc(IMSMQQueueInfo3*, Int32, HRESULT)
    get_journal_quota : Proc(IMSMQQueueInfo3*, Int32*, HRESULT)
    put_journal_quota : Proc(IMSMQQueueInfo3*, Int32, HRESULT)
    get_is_world_readable : Proc(IMSMQQueueInfo3*, Int16*, HRESULT)
    create : Proc(IMSMQQueueInfo3*, VARIANT*, VARIANT*, HRESULT)
    delete : Proc(IMSMQQueueInfo3*, HRESULT)
    open : Proc(IMSMQQueueInfo3*, Int32, Int32, IMSMQQueue3*, HRESULT)
    refresh : Proc(IMSMQQueueInfo3*, HRESULT)
    update : Proc(IMSMQQueueInfo3*, HRESULT)
    get_path_name_dns : Proc(IMSMQQueueInfo3*, UInt8**, HRESULT)
    get_properties : Proc(IMSMQQueueInfo3*, IDispatch*, HRESULT)
    get_security : Proc(IMSMQQueueInfo3*, VARIANT*, HRESULT)
    put_security : Proc(IMSMQQueueInfo3*, VARIANT, HRESULT)
    get_is_transactional2 : Proc(IMSMQQueueInfo3*, Int16*, HRESULT)
    get_is_world_readable2 : Proc(IMSMQQueueInfo3*, Int16*, HRESULT)
    get_multicast_address : Proc(IMSMQQueueInfo3*, UInt8**, HRESULT)
    put_multicast_address : Proc(IMSMQQueueInfo3*, UInt8*, HRESULT)
    get_a_ds_path : Proc(IMSMQQueueInfo3*, UInt8**, HRESULT)
  end

  IMSMQQueueInfo3_GUID = LibC::GUID.new("eba96b1d-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQueueInfo3 = "eba96b1d-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQueueInfo3
    lpVtbl : IMSMQQueueInfo3VTbl*
  end

  struct IMSMQQueueInfo4VTbl
    query_interface : Proc(IMSMQQueueInfo4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueueInfo4*, UInt32)
    release : Proc(IMSMQQueueInfo4*, UInt32)
    get_type_info_count : Proc(IMSMQQueueInfo4*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueueInfo4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueueInfo4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueueInfo4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_queue_guid : Proc(IMSMQQueueInfo4*, UInt8**, HRESULT)
    get_service_type_guid : Proc(IMSMQQueueInfo4*, UInt8**, HRESULT)
    put_service_type_guid : Proc(IMSMQQueueInfo4*, UInt8*, HRESULT)
    get_label : Proc(IMSMQQueueInfo4*, UInt8**, HRESULT)
    put_label : Proc(IMSMQQueueInfo4*, UInt8*, HRESULT)
    get_path_name : Proc(IMSMQQueueInfo4*, UInt8**, HRESULT)
    put_path_name : Proc(IMSMQQueueInfo4*, UInt8*, HRESULT)
    get_format_name : Proc(IMSMQQueueInfo4*, UInt8**, HRESULT)
    put_format_name : Proc(IMSMQQueueInfo4*, UInt8*, HRESULT)
    get_is_transactional : Proc(IMSMQQueueInfo4*, Int16*, HRESULT)
    get_priv_level : Proc(IMSMQQueueInfo4*, Int32*, HRESULT)
    put_priv_level : Proc(IMSMQQueueInfo4*, Int32, HRESULT)
    get_journal : Proc(IMSMQQueueInfo4*, Int32*, HRESULT)
    put_journal : Proc(IMSMQQueueInfo4*, Int32, HRESULT)
    get_quota : Proc(IMSMQQueueInfo4*, Int32*, HRESULT)
    put_quota : Proc(IMSMQQueueInfo4*, Int32, HRESULT)
    get_base_priority : Proc(IMSMQQueueInfo4*, Int32*, HRESULT)
    put_base_priority : Proc(IMSMQQueueInfo4*, Int32, HRESULT)
    get_create_time : Proc(IMSMQQueueInfo4*, VARIANT*, HRESULT)
    get_modify_time : Proc(IMSMQQueueInfo4*, VARIANT*, HRESULT)
    get_authenticate : Proc(IMSMQQueueInfo4*, Int32*, HRESULT)
    put_authenticate : Proc(IMSMQQueueInfo4*, Int32, HRESULT)
    get_journal_quota : Proc(IMSMQQueueInfo4*, Int32*, HRESULT)
    put_journal_quota : Proc(IMSMQQueueInfo4*, Int32, HRESULT)
    get_is_world_readable : Proc(IMSMQQueueInfo4*, Int16*, HRESULT)
    create : Proc(IMSMQQueueInfo4*, VARIANT*, VARIANT*, HRESULT)
    delete : Proc(IMSMQQueueInfo4*, HRESULT)
    open : Proc(IMSMQQueueInfo4*, Int32, Int32, IMSMQQueue4*, HRESULT)
    refresh : Proc(IMSMQQueueInfo4*, HRESULT)
    update : Proc(IMSMQQueueInfo4*, HRESULT)
    get_path_name_dns : Proc(IMSMQQueueInfo4*, UInt8**, HRESULT)
    get_properties : Proc(IMSMQQueueInfo4*, IDispatch*, HRESULT)
    get_security : Proc(IMSMQQueueInfo4*, VARIANT*, HRESULT)
    put_security : Proc(IMSMQQueueInfo4*, VARIANT, HRESULT)
    get_is_transactional2 : Proc(IMSMQQueueInfo4*, Int16*, HRESULT)
    get_is_world_readable2 : Proc(IMSMQQueueInfo4*, Int16*, HRESULT)
    get_multicast_address : Proc(IMSMQQueueInfo4*, UInt8**, HRESULT)
    put_multicast_address : Proc(IMSMQQueueInfo4*, UInt8*, HRESULT)
    get_a_ds_path : Proc(IMSMQQueueInfo4*, UInt8**, HRESULT)
  end

  IMSMQQueueInfo4_GUID = LibC::GUID.new("eba96b21-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQueueInfo4 = "eba96b21-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQueueInfo4
    lpVtbl : IMSMQQueueInfo4VTbl*
  end

  struct IMSMQQueueVTbl
    query_interface : Proc(IMSMQQueue*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueue*, UInt32)
    release : Proc(IMSMQQueue*, UInt32)
    get_type_info_count : Proc(IMSMQQueue*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueue*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueue*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueue*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_access : Proc(IMSMQQueue*, Int32*, HRESULT)
    get_share_mode : Proc(IMSMQQueue*, Int32*, HRESULT)
    get_queue_info : Proc(IMSMQQueue*, IMSMQQueueInfo*, HRESULT)
    get_handle : Proc(IMSMQQueue*, Int32*, HRESULT)
    get_is_open : Proc(IMSMQQueue*, Int16*, HRESULT)
    close : Proc(IMSMQQueue*, HRESULT)
    receive : Proc(IMSMQQueue*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek : Proc(IMSMQQueue*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    enable_notification : Proc(IMSMQQueue*, IMSMQEvent, VARIANT*, VARIANT*, HRESULT)
    reset : Proc(IMSMQQueue*, HRESULT)
    receive_current : Proc(IMSMQQueue*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_next : Proc(IMSMQQueue*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_current : Proc(IMSMQQueue*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
  end

  IMSMQQueue_GUID = LibC::GUID.new("d7d6e076-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQQueue = "d7d6e076-dccd-11d0-aa4b-0060970debae"
  struct IMSMQQueue
    lpVtbl : IMSMQQueueVTbl*
  end

  struct IMSMQQueue2VTbl
    query_interface : Proc(IMSMQQueue2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueue2*, UInt32)
    release : Proc(IMSMQQueue2*, UInt32)
    get_type_info_count : Proc(IMSMQQueue2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueue2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueue2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueue2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_access : Proc(IMSMQQueue2*, Int32*, HRESULT)
    get_share_mode : Proc(IMSMQQueue2*, Int32*, HRESULT)
    get_queue_info : Proc(IMSMQQueue2*, IMSMQQueueInfo2*, HRESULT)
    get_handle : Proc(IMSMQQueue2*, Int32*, HRESULT)
    get_is_open : Proc(IMSMQQueue2*, Int16*, HRESULT)
    close : Proc(IMSMQQueue2*, HRESULT)
    receive_v1 : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_v1 : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    enable_notification : Proc(IMSMQQueue2*, IMSMQEvent2, VARIANT*, VARIANT*, HRESULT)
    reset : Proc(IMSMQQueue2*, HRESULT)
    receive_current_v1 : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_next_v1 : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_current_v1 : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    receive : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)
    peek : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)
    receive_current : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)
    peek_next : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)
    peek_current : Proc(IMSMQQueue2*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)
    get_properties : Proc(IMSMQQueue2*, IDispatch*, HRESULT)
  end

  IMSMQQueue2_GUID = LibC::GUID.new("ef0574e0-06d8-11d3-b100-00e02c074f6b")
  CLSID_IMSMQQueue2 = "ef0574e0-06d8-11d3-b100-00e02c074f6b"
  struct IMSMQQueue2
    lpVtbl : IMSMQQueue2VTbl*
  end

  struct IMSMQQueue3VTbl
    query_interface : Proc(IMSMQQueue3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueue3*, UInt32)
    release : Proc(IMSMQQueue3*, UInt32)
    get_type_info_count : Proc(IMSMQQueue3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueue3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueue3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueue3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_access : Proc(IMSMQQueue3*, Int32*, HRESULT)
    get_share_mode : Proc(IMSMQQueue3*, Int32*, HRESULT)
    get_queue_info : Proc(IMSMQQueue3*, IMSMQQueueInfo3*, HRESULT)
    get_handle : Proc(IMSMQQueue3*, Int32*, HRESULT)
    get_is_open : Proc(IMSMQQueue3*, Int16*, HRESULT)
    close : Proc(IMSMQQueue3*, HRESULT)
    receive_v1 : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_v1 : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    enable_notification : Proc(IMSMQQueue3*, IMSMQEvent3, VARIANT*, VARIANT*, HRESULT)
    reset : Proc(IMSMQQueue3*, HRESULT)
    receive_current_v1 : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_next_v1 : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_current_v1 : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    receive : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    peek : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    receive_current : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    peek_next : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    peek_current : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    get_properties : Proc(IMSMQQueue3*, IDispatch*, HRESULT)
    get_handle2 : Proc(IMSMQQueue3*, VARIANT*, HRESULT)
    receive_by_lookup_id : Proc(IMSMQQueue3*, VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    receive_next_by_lookup_id : Proc(IMSMQQueue3*, VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    receive_previous_by_lookup_id : Proc(IMSMQQueue3*, VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    receive_first_by_lookup_id : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    receive_last_by_lookup_id : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    peek_by_lookup_id : Proc(IMSMQQueue3*, VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    peek_next_by_lookup_id : Proc(IMSMQQueue3*, VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    peek_previous_by_lookup_id : Proc(IMSMQQueue3*, VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    peek_first_by_lookup_id : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    peek_last_by_lookup_id : Proc(IMSMQQueue3*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)
    purge : Proc(IMSMQQueue3*, HRESULT)
    get_is_open2 : Proc(IMSMQQueue3*, Int16*, HRESULT)
  end

  IMSMQQueue3_GUID = LibC::GUID.new("eba96b1b-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQueue3 = "eba96b1b-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQueue3
    lpVtbl : IMSMQQueue3VTbl*
  end

  struct IMSMQQueue4VTbl
    query_interface : Proc(IMSMQQueue4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueue4*, UInt32)
    release : Proc(IMSMQQueue4*, UInt32)
    get_type_info_count : Proc(IMSMQQueue4*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueue4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueue4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueue4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_access : Proc(IMSMQQueue4*, Int32*, HRESULT)
    get_share_mode : Proc(IMSMQQueue4*, Int32*, HRESULT)
    get_queue_info : Proc(IMSMQQueue4*, IMSMQQueueInfo4*, HRESULT)
    get_handle : Proc(IMSMQQueue4*, Int32*, HRESULT)
    get_is_open : Proc(IMSMQQueue4*, Int16*, HRESULT)
    close : Proc(IMSMQQueue4*, HRESULT)
    receive_v1 : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_v1 : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    enable_notification : Proc(IMSMQQueue4*, IMSMQEvent3, VARIANT*, VARIANT*, HRESULT)
    reset : Proc(IMSMQQueue4*, HRESULT)
    receive_current_v1 : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_next_v1 : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    peek_current_v1 : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)
    receive : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    peek : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    receive_current : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    peek_next : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    peek_current : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    get_properties : Proc(IMSMQQueue4*, IDispatch*, HRESULT)
    get_handle2 : Proc(IMSMQQueue4*, VARIANT*, HRESULT)
    receive_by_lookup_id : Proc(IMSMQQueue4*, VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    receive_next_by_lookup_id : Proc(IMSMQQueue4*, VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    receive_previous_by_lookup_id : Proc(IMSMQQueue4*, VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    receive_first_by_lookup_id : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    receive_last_by_lookup_id : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    peek_by_lookup_id : Proc(IMSMQQueue4*, VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    peek_next_by_lookup_id : Proc(IMSMQQueue4*, VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    peek_previous_by_lookup_id : Proc(IMSMQQueue4*, VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    peek_first_by_lookup_id : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    peek_last_by_lookup_id : Proc(IMSMQQueue4*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
    purge : Proc(IMSMQQueue4*, HRESULT)
    get_is_open2 : Proc(IMSMQQueue4*, Int16*, HRESULT)
    receive_by_lookup_id_allow_peek : Proc(IMSMQQueue4*, VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)
  end

  IMSMQQueue4_GUID = LibC::GUID.new("eba96b20-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQueue4 = "eba96b20-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQueue4
    lpVtbl : IMSMQQueue4VTbl*
  end

  struct IMSMQMessageVTbl
    query_interface : Proc(IMSMQMessage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQMessage*, UInt32)
    release : Proc(IMSMQMessage*, UInt32)
    get_type_info_count : Proc(IMSMQMessage*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQMessage*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQMessage*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQMessage*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_class : Proc(IMSMQMessage*, Int32*, HRESULT)
    get_priv_level : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_priv_level : Proc(IMSMQMessage*, Int32, HRESULT)
    get_auth_level : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_auth_level : Proc(IMSMQMessage*, Int32, HRESULT)
    get_is_authenticated : Proc(IMSMQMessage*, Int16*, HRESULT)
    get_delivery : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_delivery : Proc(IMSMQMessage*, Int32, HRESULT)
    get_trace : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_trace : Proc(IMSMQMessage*, Int32, HRESULT)
    get_priority : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_priority : Proc(IMSMQMessage*, Int32, HRESULT)
    get_journal : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_journal : Proc(IMSMQMessage*, Int32, HRESULT)
    get_response_queue_info : Proc(IMSMQMessage*, IMSMQQueueInfo*, HRESULT)
    putref_response_queue_info : Proc(IMSMQMessage*, IMSMQQueueInfo, HRESULT)
    get_app_specific : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_app_specific : Proc(IMSMQMessage*, Int32, HRESULT)
    get_source_machine_guid : Proc(IMSMQMessage*, UInt8**, HRESULT)
    get_body_length : Proc(IMSMQMessage*, Int32*, HRESULT)
    get_body : Proc(IMSMQMessage*, VARIANT*, HRESULT)
    put_body : Proc(IMSMQMessage*, VARIANT, HRESULT)
    get_admin_queue_info : Proc(IMSMQMessage*, IMSMQQueueInfo*, HRESULT)
    putref_admin_queue_info : Proc(IMSMQMessage*, IMSMQQueueInfo, HRESULT)
    get_id : Proc(IMSMQMessage*, VARIANT*, HRESULT)
    get_correlation_id : Proc(IMSMQMessage*, VARIANT*, HRESULT)
    put_correlation_id : Proc(IMSMQMessage*, VARIANT, HRESULT)
    get_ack : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_ack : Proc(IMSMQMessage*, Int32, HRESULT)
    get_label : Proc(IMSMQMessage*, UInt8**, HRESULT)
    put_label : Proc(IMSMQMessage*, UInt8*, HRESULT)
    get_max_time_to_reach_queue : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_max_time_to_reach_queue : Proc(IMSMQMessage*, Int32, HRESULT)
    get_max_time_to_receive : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_max_time_to_receive : Proc(IMSMQMessage*, Int32, HRESULT)
    get_hash_algorithm : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_hash_algorithm : Proc(IMSMQMessage*, Int32, HRESULT)
    get_encrypt_algorithm : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_encrypt_algorithm : Proc(IMSMQMessage*, Int32, HRESULT)
    get_sent_time : Proc(IMSMQMessage*, VARIANT*, HRESULT)
    get_arrived_time : Proc(IMSMQMessage*, VARIANT*, HRESULT)
    get_destination_queue_info : Proc(IMSMQMessage*, IMSMQQueueInfo*, HRESULT)
    get_sender_certificate : Proc(IMSMQMessage*, VARIANT*, HRESULT)
    put_sender_certificate : Proc(IMSMQMessage*, VARIANT, HRESULT)
    get_sender_id : Proc(IMSMQMessage*, VARIANT*, HRESULT)
    get_sender_id_type : Proc(IMSMQMessage*, Int32*, HRESULT)
    put_sender_id_type : Proc(IMSMQMessage*, Int32, HRESULT)
    send : Proc(IMSMQMessage*, IMSMQQueue, VARIANT*, HRESULT)
    attach_current_security_context : Proc(IMSMQMessage*, HRESULT)
  end

  IMSMQMessage_GUID = LibC::GUID.new("d7d6e074-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQMessage = "d7d6e074-dccd-11d0-aa4b-0060970debae"
  struct IMSMQMessage
    lpVtbl : IMSMQMessageVTbl*
  end

  struct IMSMQQueueInfosVTbl
    query_interface : Proc(IMSMQQueueInfos*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueueInfos*, UInt32)
    release : Proc(IMSMQQueueInfos*, UInt32)
    get_type_info_count : Proc(IMSMQQueueInfos*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueueInfos*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueueInfos*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueueInfos*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    reset : Proc(IMSMQQueueInfos*, HRESULT)
    next : Proc(IMSMQQueueInfos*, IMSMQQueueInfo*, HRESULT)
  end

  IMSMQQueueInfos_GUID = LibC::GUID.new("d7d6e07d-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQQueueInfos = "d7d6e07d-dccd-11d0-aa4b-0060970debae"
  struct IMSMQQueueInfos
    lpVtbl : IMSMQQueueInfosVTbl*
  end

  struct IMSMQQueueInfos2VTbl
    query_interface : Proc(IMSMQQueueInfos2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueueInfos2*, UInt32)
    release : Proc(IMSMQQueueInfos2*, UInt32)
    get_type_info_count : Proc(IMSMQQueueInfos2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueueInfos2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueueInfos2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueueInfos2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    reset : Proc(IMSMQQueueInfos2*, HRESULT)
    next : Proc(IMSMQQueueInfos2*, IMSMQQueueInfo2*, HRESULT)
    get_properties : Proc(IMSMQQueueInfos2*, IDispatch*, HRESULT)
  end

  IMSMQQueueInfos2_GUID = LibC::GUID.new("eba96b0f-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQueueInfos2 = "eba96b0f-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQueueInfos2
    lpVtbl : IMSMQQueueInfos2VTbl*
  end

  struct IMSMQQueueInfos3VTbl
    query_interface : Proc(IMSMQQueueInfos3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueueInfos3*, UInt32)
    release : Proc(IMSMQQueueInfos3*, UInt32)
    get_type_info_count : Proc(IMSMQQueueInfos3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueueInfos3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueueInfos3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueueInfos3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    reset : Proc(IMSMQQueueInfos3*, HRESULT)
    next : Proc(IMSMQQueueInfos3*, IMSMQQueueInfo3*, HRESULT)
    get_properties : Proc(IMSMQQueueInfos3*, IDispatch*, HRESULT)
  end

  IMSMQQueueInfos3_GUID = LibC::GUID.new("eba96b1e-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQueueInfos3 = "eba96b1e-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQueueInfos3
    lpVtbl : IMSMQQueueInfos3VTbl*
  end

  struct IMSMQQueueInfos4VTbl
    query_interface : Proc(IMSMQQueueInfos4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueueInfos4*, UInt32)
    release : Proc(IMSMQQueueInfos4*, UInt32)
    get_type_info_count : Proc(IMSMQQueueInfos4*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueueInfos4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueueInfos4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueueInfos4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    reset : Proc(IMSMQQueueInfos4*, HRESULT)
    next : Proc(IMSMQQueueInfos4*, IMSMQQueueInfo4*, HRESULT)
    get_properties : Proc(IMSMQQueueInfos4*, IDispatch*, HRESULT)
  end

  IMSMQQueueInfos4_GUID = LibC::GUID.new("eba96b22-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQueueInfos4 = "eba96b22-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQueueInfos4
    lpVtbl : IMSMQQueueInfos4VTbl*
  end

  struct IMSMQEventVTbl
    query_interface : Proc(IMSMQEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQEvent*, UInt32)
    release : Proc(IMSMQEvent*, UInt32)
    get_type_info_count : Proc(IMSMQEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IMSMQEvent_GUID = LibC::GUID.new("d7d6e077-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQEvent = "d7d6e077-dccd-11d0-aa4b-0060970debae"
  struct IMSMQEvent
    lpVtbl : IMSMQEventVTbl*
  end

  struct IMSMQEvent2VTbl
    query_interface : Proc(IMSMQEvent2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQEvent2*, UInt32)
    release : Proc(IMSMQEvent2*, UInt32)
    get_type_info_count : Proc(IMSMQEvent2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQEvent2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQEvent2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQEvent2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_properties : Proc(IMSMQEvent2*, IDispatch*, HRESULT)
  end

  IMSMQEvent2_GUID = LibC::GUID.new("eba96b12-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQEvent2 = "eba96b12-2168-11d3-898c-00e02c074f6b"
  struct IMSMQEvent2
    lpVtbl : IMSMQEvent2VTbl*
  end

  struct IMSMQEvent3VTbl
    query_interface : Proc(IMSMQEvent3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQEvent3*, UInt32)
    release : Proc(IMSMQEvent3*, UInt32)
    get_type_info_count : Proc(IMSMQEvent3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQEvent3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQEvent3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQEvent3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_properties : Proc(IMSMQEvent3*, IDispatch*, HRESULT)
  end

  IMSMQEvent3_GUID = LibC::GUID.new("eba96b1c-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQEvent3 = "eba96b1c-2168-11d3-898c-00e02c074f6b"
  struct IMSMQEvent3
    lpVtbl : IMSMQEvent3VTbl*
  end

  struct IMSMQTransactionVTbl
    query_interface : Proc(IMSMQTransaction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQTransaction*, UInt32)
    release : Proc(IMSMQTransaction*, UInt32)
    get_type_info_count : Proc(IMSMQTransaction*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQTransaction*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQTransaction*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQTransaction*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_transaction : Proc(IMSMQTransaction*, Int32*, HRESULT)
    commit : Proc(IMSMQTransaction*, VARIANT*, VARIANT*, VARIANT*, HRESULT)
    abort : Proc(IMSMQTransaction*, VARIANT*, VARIANT*, HRESULT)
  end

  IMSMQTransaction_GUID = LibC::GUID.new("d7d6e07f-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQTransaction = "d7d6e07f-dccd-11d0-aa4b-0060970debae"
  struct IMSMQTransaction
    lpVtbl : IMSMQTransactionVTbl*
  end

  struct IMSMQCoordinatedTransactionDispenserVTbl
    query_interface : Proc(IMSMQCoordinatedTransactionDispenser*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQCoordinatedTransactionDispenser*, UInt32)
    release : Proc(IMSMQCoordinatedTransactionDispenser*, UInt32)
    get_type_info_count : Proc(IMSMQCoordinatedTransactionDispenser*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQCoordinatedTransactionDispenser*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQCoordinatedTransactionDispenser*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQCoordinatedTransactionDispenser*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    begin_transaction : Proc(IMSMQCoordinatedTransactionDispenser*, IMSMQTransaction*, HRESULT)
  end

  IMSMQCoordinatedTransactionDispenser_GUID = LibC::GUID.new("d7d6e081-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQCoordinatedTransactionDispenser = "d7d6e081-dccd-11d0-aa4b-0060970debae"
  struct IMSMQCoordinatedTransactionDispenser
    lpVtbl : IMSMQCoordinatedTransactionDispenserVTbl*
  end

  struct IMSMQTransactionDispenserVTbl
    query_interface : Proc(IMSMQTransactionDispenser*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQTransactionDispenser*, UInt32)
    release : Proc(IMSMQTransactionDispenser*, UInt32)
    get_type_info_count : Proc(IMSMQTransactionDispenser*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQTransactionDispenser*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQTransactionDispenser*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQTransactionDispenser*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    begin_transaction : Proc(IMSMQTransactionDispenser*, IMSMQTransaction*, HRESULT)
  end

  IMSMQTransactionDispenser_GUID = LibC::GUID.new("d7d6e083-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQTransactionDispenser = "d7d6e083-dccd-11d0-aa4b-0060970debae"
  struct IMSMQTransactionDispenser
    lpVtbl : IMSMQTransactionDispenserVTbl*
  end

  struct IMSMQQuery2VTbl
    query_interface : Proc(IMSMQQuery2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQuery2*, UInt32)
    release : Proc(IMSMQQuery2*, UInt32)
    get_type_info_count : Proc(IMSMQQuery2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQuery2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQuery2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQuery2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    lookup_queue : Proc(IMSMQQuery2*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos2*, HRESULT)
    get_properties : Proc(IMSMQQuery2*, IDispatch*, HRESULT)
  end

  IMSMQQuery2_GUID = LibC::GUID.new("eba96b0e-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQuery2 = "eba96b0e-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQuery2
    lpVtbl : IMSMQQuery2VTbl*
  end

  struct IMSMQQuery3VTbl
    query_interface : Proc(IMSMQQuery3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQuery3*, UInt32)
    release : Proc(IMSMQQuery3*, UInt32)
    get_type_info_count : Proc(IMSMQQuery3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQuery3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQuery3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQuery3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    lookup_queue_v2 : Proc(IMSMQQuery3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos3*, HRESULT)
    get_properties : Proc(IMSMQQuery3*, IDispatch*, HRESULT)
    lookup_queue : Proc(IMSMQQuery3*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos3*, HRESULT)
  end

  IMSMQQuery3_GUID = LibC::GUID.new("eba96b19-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQuery3 = "eba96b19-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQuery3
    lpVtbl : IMSMQQuery3VTbl*
  end

  struct IMSMQQuery4VTbl
    query_interface : Proc(IMSMQQuery4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQuery4*, UInt32)
    release : Proc(IMSMQQuery4*, UInt32)
    get_type_info_count : Proc(IMSMQQuery4*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQuery4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQuery4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQuery4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    lookup_queue_v2 : Proc(IMSMQQuery4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos4*, HRESULT)
    get_properties : Proc(IMSMQQuery4*, IDispatch*, HRESULT)
    lookup_queue : Proc(IMSMQQuery4*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos4*, HRESULT)
  end

  IMSMQQuery4_GUID = LibC::GUID.new("eba96b24-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQQuery4 = "eba96b24-2168-11d3-898c-00e02c074f6b"
  struct IMSMQQuery4
    lpVtbl : IMSMQQuery4VTbl*
  end

  struct IMSMQMessage2VTbl
    query_interface : Proc(IMSMQMessage2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQMessage2*, UInt32)
    release : Proc(IMSMQMessage2*, UInt32)
    get_type_info_count : Proc(IMSMQMessage2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQMessage2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQMessage2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQMessage2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_class : Proc(IMSMQMessage2*, Int32*, HRESULT)
    get_priv_level : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_priv_level : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_auth_level : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_auth_level : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_is_authenticated : Proc(IMSMQMessage2*, Int16*, HRESULT)
    get_delivery : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_delivery : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_trace : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_trace : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_priority : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_priority : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_journal : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_journal : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_response_queue_info_v1 : Proc(IMSMQMessage2*, IMSMQQueueInfo*, HRESULT)
    putref_response_queue_info_v1 : Proc(IMSMQMessage2*, IMSMQQueueInfo, HRESULT)
    get_app_specific : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_app_specific : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_source_machine_guid : Proc(IMSMQMessage2*, UInt8**, HRESULT)
    get_body_length : Proc(IMSMQMessage2*, Int32*, HRESULT)
    get_body : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    put_body : Proc(IMSMQMessage2*, VARIANT, HRESULT)
    get_admin_queue_info_v1 : Proc(IMSMQMessage2*, IMSMQQueueInfo*, HRESULT)
    putref_admin_queue_info_v1 : Proc(IMSMQMessage2*, IMSMQQueueInfo, HRESULT)
    get_id : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    get_correlation_id : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    put_correlation_id : Proc(IMSMQMessage2*, VARIANT, HRESULT)
    get_ack : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_ack : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_label : Proc(IMSMQMessage2*, UInt8**, HRESULT)
    put_label : Proc(IMSMQMessage2*, UInt8*, HRESULT)
    get_max_time_to_reach_queue : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_max_time_to_reach_queue : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_max_time_to_receive : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_max_time_to_receive : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_hash_algorithm : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_hash_algorithm : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_encrypt_algorithm : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_encrypt_algorithm : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_sent_time : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    get_arrived_time : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    get_destination_queue_info : Proc(IMSMQMessage2*, IMSMQQueueInfo2*, HRESULT)
    get_sender_certificate : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    put_sender_certificate : Proc(IMSMQMessage2*, VARIANT, HRESULT)
    get_sender_id : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    get_sender_id_type : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_sender_id_type : Proc(IMSMQMessage2*, Int32, HRESULT)
    send : Proc(IMSMQMessage2*, IMSMQQueue2, VARIANT*, HRESULT)
    attach_current_security_context : Proc(IMSMQMessage2*, HRESULT)
    get_sender_version : Proc(IMSMQMessage2*, Int32*, HRESULT)
    get_extension : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    put_extension : Proc(IMSMQMessage2*, VARIANT, HRESULT)
    get_connector_type_guid : Proc(IMSMQMessage2*, UInt8**, HRESULT)
    put_connector_type_guid : Proc(IMSMQMessage2*, UInt8*, HRESULT)
    get_transaction_status_queue_info : Proc(IMSMQMessage2*, IMSMQQueueInfo2*, HRESULT)
    get_destination_symmetric_key : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    put_destination_symmetric_key : Proc(IMSMQMessage2*, VARIANT, HRESULT)
    get_signature : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    put_signature : Proc(IMSMQMessage2*, VARIANT, HRESULT)
    get_authentication_provider_type : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_authentication_provider_type : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_authentication_provider_name : Proc(IMSMQMessage2*, UInt8**, HRESULT)
    put_authentication_provider_name : Proc(IMSMQMessage2*, UInt8*, HRESULT)
    put_sender_id : Proc(IMSMQMessage2*, VARIANT, HRESULT)
    get_msg_class : Proc(IMSMQMessage2*, Int32*, HRESULT)
    put_msg_class : Proc(IMSMQMessage2*, Int32, HRESULT)
    get_properties : Proc(IMSMQMessage2*, IDispatch*, HRESULT)
    get_transaction_id : Proc(IMSMQMessage2*, VARIANT*, HRESULT)
    get_is_first_in_transaction : Proc(IMSMQMessage2*, Int16*, HRESULT)
    get_is_last_in_transaction : Proc(IMSMQMessage2*, Int16*, HRESULT)
    get_response_queue_info : Proc(IMSMQMessage2*, IMSMQQueueInfo2*, HRESULT)
    putref_response_queue_info : Proc(IMSMQMessage2*, IMSMQQueueInfo2, HRESULT)
    get_admin_queue_info : Proc(IMSMQMessage2*, IMSMQQueueInfo2*, HRESULT)
    putref_admin_queue_info : Proc(IMSMQMessage2*, IMSMQQueueInfo2, HRESULT)
    get_received_authentication_level : Proc(IMSMQMessage2*, Int16*, HRESULT)
  end

  IMSMQMessage2_GUID = LibC::GUID.new("d9933be0-a567-11d2-b0f3-00e02c074f6b")
  CLSID_IMSMQMessage2 = "d9933be0-a567-11d2-b0f3-00e02c074f6b"
  struct IMSMQMessage2
    lpVtbl : IMSMQMessage2VTbl*
  end

  struct IMSMQMessage3VTbl
    query_interface : Proc(IMSMQMessage3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQMessage3*, UInt32)
    release : Proc(IMSMQMessage3*, UInt32)
    get_type_info_count : Proc(IMSMQMessage3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQMessage3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQMessage3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQMessage3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_class : Proc(IMSMQMessage3*, Int32*, HRESULT)
    get_priv_level : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_priv_level : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_auth_level : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_auth_level : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_is_authenticated : Proc(IMSMQMessage3*, Int16*, HRESULT)
    get_delivery : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_delivery : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_trace : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_trace : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_priority : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_priority : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_journal : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_journal : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_response_queue_info_v1 : Proc(IMSMQMessage3*, IMSMQQueueInfo*, HRESULT)
    putref_response_queue_info_v1 : Proc(IMSMQMessage3*, IMSMQQueueInfo, HRESULT)
    get_app_specific : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_app_specific : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_source_machine_guid : Proc(IMSMQMessage3*, UInt8**, HRESULT)
    get_body_length : Proc(IMSMQMessage3*, Int32*, HRESULT)
    get_body : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    put_body : Proc(IMSMQMessage3*, VARIANT, HRESULT)
    get_admin_queue_info_v1 : Proc(IMSMQMessage3*, IMSMQQueueInfo*, HRESULT)
    putref_admin_queue_info_v1 : Proc(IMSMQMessage3*, IMSMQQueueInfo, HRESULT)
    get_id : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    get_correlation_id : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    put_correlation_id : Proc(IMSMQMessage3*, VARIANT, HRESULT)
    get_ack : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_ack : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_label : Proc(IMSMQMessage3*, UInt8**, HRESULT)
    put_label : Proc(IMSMQMessage3*, UInt8*, HRESULT)
    get_max_time_to_reach_queue : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_max_time_to_reach_queue : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_max_time_to_receive : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_max_time_to_receive : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_hash_algorithm : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_hash_algorithm : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_encrypt_algorithm : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_encrypt_algorithm : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_sent_time : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    get_arrived_time : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    get_destination_queue_info : Proc(IMSMQMessage3*, IMSMQQueueInfo3*, HRESULT)
    get_sender_certificate : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    put_sender_certificate : Proc(IMSMQMessage3*, VARIANT, HRESULT)
    get_sender_id : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    get_sender_id_type : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_sender_id_type : Proc(IMSMQMessage3*, Int32, HRESULT)
    send : Proc(IMSMQMessage3*, IDispatch, VARIANT*, HRESULT)
    attach_current_security_context : Proc(IMSMQMessage3*, HRESULT)
    get_sender_version : Proc(IMSMQMessage3*, Int32*, HRESULT)
    get_extension : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    put_extension : Proc(IMSMQMessage3*, VARIANT, HRESULT)
    get_connector_type_guid : Proc(IMSMQMessage3*, UInt8**, HRESULT)
    put_connector_type_guid : Proc(IMSMQMessage3*, UInt8*, HRESULT)
    get_transaction_status_queue_info : Proc(IMSMQMessage3*, IMSMQQueueInfo3*, HRESULT)
    get_destination_symmetric_key : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    put_destination_symmetric_key : Proc(IMSMQMessage3*, VARIANT, HRESULT)
    get_signature : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    put_signature : Proc(IMSMQMessage3*, VARIANT, HRESULT)
    get_authentication_provider_type : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_authentication_provider_type : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_authentication_provider_name : Proc(IMSMQMessage3*, UInt8**, HRESULT)
    put_authentication_provider_name : Proc(IMSMQMessage3*, UInt8*, HRESULT)
    put_sender_id : Proc(IMSMQMessage3*, VARIANT, HRESULT)
    get_msg_class : Proc(IMSMQMessage3*, Int32*, HRESULT)
    put_msg_class : Proc(IMSMQMessage3*, Int32, HRESULT)
    get_properties : Proc(IMSMQMessage3*, IDispatch*, HRESULT)
    get_transaction_id : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    get_is_first_in_transaction : Proc(IMSMQMessage3*, Int16*, HRESULT)
    get_is_last_in_transaction : Proc(IMSMQMessage3*, Int16*, HRESULT)
    get_response_queue_info_v2 : Proc(IMSMQMessage3*, IMSMQQueueInfo2*, HRESULT)
    putref_response_queue_info_v2 : Proc(IMSMQMessage3*, IMSMQQueueInfo2, HRESULT)
    get_admin_queue_info_v2 : Proc(IMSMQMessage3*, IMSMQQueueInfo2*, HRESULT)
    putref_admin_queue_info_v2 : Proc(IMSMQMessage3*, IMSMQQueueInfo2, HRESULT)
    get_received_authentication_level : Proc(IMSMQMessage3*, Int16*, HRESULT)
    get_response_queue_info : Proc(IMSMQMessage3*, IMSMQQueueInfo3*, HRESULT)
    putref_response_queue_info : Proc(IMSMQMessage3*, IMSMQQueueInfo3, HRESULT)
    get_admin_queue_info : Proc(IMSMQMessage3*, IMSMQQueueInfo3*, HRESULT)
    putref_admin_queue_info : Proc(IMSMQMessage3*, IMSMQQueueInfo3, HRESULT)
    get_response_destination : Proc(IMSMQMessage3*, IDispatch*, HRESULT)
    putref_response_destination : Proc(IMSMQMessage3*, IDispatch, HRESULT)
    get_destination : Proc(IMSMQMessage3*, IDispatch*, HRESULT)
    get_lookup_id : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    get_is_authenticated2 : Proc(IMSMQMessage3*, Int16*, HRESULT)
    get_is_first_in_transaction2 : Proc(IMSMQMessage3*, Int16*, HRESULT)
    get_is_last_in_transaction2 : Proc(IMSMQMessage3*, Int16*, HRESULT)
    attach_current_security_context2 : Proc(IMSMQMessage3*, HRESULT)
    get_soap_envelope : Proc(IMSMQMessage3*, UInt8**, HRESULT)
    get_compound_message : Proc(IMSMQMessage3*, VARIANT*, HRESULT)
    put_soap_header : Proc(IMSMQMessage3*, UInt8*, HRESULT)
    put_soap_body : Proc(IMSMQMessage3*, UInt8*, HRESULT)
  end

  IMSMQMessage3_GUID = LibC::GUID.new("eba96b1a-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQMessage3 = "eba96b1a-2168-11d3-898c-00e02c074f6b"
  struct IMSMQMessage3
    lpVtbl : IMSMQMessage3VTbl*
  end

  struct IMSMQMessage4VTbl
    query_interface : Proc(IMSMQMessage4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQMessage4*, UInt32)
    release : Proc(IMSMQMessage4*, UInt32)
    get_type_info_count : Proc(IMSMQMessage4*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQMessage4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQMessage4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQMessage4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_class : Proc(IMSMQMessage4*, Int32*, HRESULT)
    get_priv_level : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_priv_level : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_auth_level : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_auth_level : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_is_authenticated : Proc(IMSMQMessage4*, Int16*, HRESULT)
    get_delivery : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_delivery : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_trace : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_trace : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_priority : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_priority : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_journal : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_journal : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_response_queue_info_v1 : Proc(IMSMQMessage4*, IMSMQQueueInfo*, HRESULT)
    putref_response_queue_info_v1 : Proc(IMSMQMessage4*, IMSMQQueueInfo, HRESULT)
    get_app_specific : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_app_specific : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_source_machine_guid : Proc(IMSMQMessage4*, UInt8**, HRESULT)
    get_body_length : Proc(IMSMQMessage4*, Int32*, HRESULT)
    get_body : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    put_body : Proc(IMSMQMessage4*, VARIANT, HRESULT)
    get_admin_queue_info_v1 : Proc(IMSMQMessage4*, IMSMQQueueInfo*, HRESULT)
    putref_admin_queue_info_v1 : Proc(IMSMQMessage4*, IMSMQQueueInfo, HRESULT)
    get_id : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    get_correlation_id : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    put_correlation_id : Proc(IMSMQMessage4*, VARIANT, HRESULT)
    get_ack : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_ack : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_label : Proc(IMSMQMessage4*, UInt8**, HRESULT)
    put_label : Proc(IMSMQMessage4*, UInt8*, HRESULT)
    get_max_time_to_reach_queue : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_max_time_to_reach_queue : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_max_time_to_receive : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_max_time_to_receive : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_hash_algorithm : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_hash_algorithm : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_encrypt_algorithm : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_encrypt_algorithm : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_sent_time : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    get_arrived_time : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    get_destination_queue_info : Proc(IMSMQMessage4*, IMSMQQueueInfo4*, HRESULT)
    get_sender_certificate : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    put_sender_certificate : Proc(IMSMQMessage4*, VARIANT, HRESULT)
    get_sender_id : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    get_sender_id_type : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_sender_id_type : Proc(IMSMQMessage4*, Int32, HRESULT)
    send : Proc(IMSMQMessage4*, IDispatch, VARIANT*, HRESULT)
    attach_current_security_context : Proc(IMSMQMessage4*, HRESULT)
    get_sender_version : Proc(IMSMQMessage4*, Int32*, HRESULT)
    get_extension : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    put_extension : Proc(IMSMQMessage4*, VARIANT, HRESULT)
    get_connector_type_guid : Proc(IMSMQMessage4*, UInt8**, HRESULT)
    put_connector_type_guid : Proc(IMSMQMessage4*, UInt8*, HRESULT)
    get_transaction_status_queue_info : Proc(IMSMQMessage4*, IMSMQQueueInfo4*, HRESULT)
    get_destination_symmetric_key : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    put_destination_symmetric_key : Proc(IMSMQMessage4*, VARIANT, HRESULT)
    get_signature : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    put_signature : Proc(IMSMQMessage4*, VARIANT, HRESULT)
    get_authentication_provider_type : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_authentication_provider_type : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_authentication_provider_name : Proc(IMSMQMessage4*, UInt8**, HRESULT)
    put_authentication_provider_name : Proc(IMSMQMessage4*, UInt8*, HRESULT)
    put_sender_id : Proc(IMSMQMessage4*, VARIANT, HRESULT)
    get_msg_class : Proc(IMSMQMessage4*, Int32*, HRESULT)
    put_msg_class : Proc(IMSMQMessage4*, Int32, HRESULT)
    get_properties : Proc(IMSMQMessage4*, IDispatch*, HRESULT)
    get_transaction_id : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    get_is_first_in_transaction : Proc(IMSMQMessage4*, Int16*, HRESULT)
    get_is_last_in_transaction : Proc(IMSMQMessage4*, Int16*, HRESULT)
    get_response_queue_info_v2 : Proc(IMSMQMessage4*, IMSMQQueueInfo2*, HRESULT)
    putref_response_queue_info_v2 : Proc(IMSMQMessage4*, IMSMQQueueInfo2, HRESULT)
    get_admin_queue_info_v2 : Proc(IMSMQMessage4*, IMSMQQueueInfo2*, HRESULT)
    putref_admin_queue_info_v2 : Proc(IMSMQMessage4*, IMSMQQueueInfo2, HRESULT)
    get_received_authentication_level : Proc(IMSMQMessage4*, Int16*, HRESULT)
    get_response_queue_info : Proc(IMSMQMessage4*, IMSMQQueueInfo4*, HRESULT)
    putref_response_queue_info : Proc(IMSMQMessage4*, IMSMQQueueInfo4, HRESULT)
    get_admin_queue_info : Proc(IMSMQMessage4*, IMSMQQueueInfo4*, HRESULT)
    putref_admin_queue_info : Proc(IMSMQMessage4*, IMSMQQueueInfo4, HRESULT)
    get_response_destination : Proc(IMSMQMessage4*, IDispatch*, HRESULT)
    putref_response_destination : Proc(IMSMQMessage4*, IDispatch, HRESULT)
    get_destination : Proc(IMSMQMessage4*, IDispatch*, HRESULT)
    get_lookup_id : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    get_is_authenticated2 : Proc(IMSMQMessage4*, Int16*, HRESULT)
    get_is_first_in_transaction2 : Proc(IMSMQMessage4*, Int16*, HRESULT)
    get_is_last_in_transaction2 : Proc(IMSMQMessage4*, Int16*, HRESULT)
    attach_current_security_context2 : Proc(IMSMQMessage4*, HRESULT)
    get_soap_envelope : Proc(IMSMQMessage4*, UInt8**, HRESULT)
    get_compound_message : Proc(IMSMQMessage4*, VARIANT*, HRESULT)
    put_soap_header : Proc(IMSMQMessage4*, UInt8*, HRESULT)
    put_soap_body : Proc(IMSMQMessage4*, UInt8*, HRESULT)
  end

  IMSMQMessage4_GUID = LibC::GUID.new("eba96b23-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQMessage4 = "eba96b23-2168-11d3-898c-00e02c074f6b"
  struct IMSMQMessage4
    lpVtbl : IMSMQMessage4VTbl*
  end

  struct IMSMQPrivateEventVTbl
    query_interface : Proc(IMSMQPrivateEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQPrivateEvent*, UInt32)
    release : Proc(IMSMQPrivateEvent*, UInt32)
    get_type_info_count : Proc(IMSMQPrivateEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQPrivateEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQPrivateEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQPrivateEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_hwnd : Proc(IMSMQPrivateEvent*, Int32*, HRESULT)
    fire_arrived_event : Proc(IMSMQPrivateEvent*, IMSMQQueue, Int32, HRESULT)
    fire_arrived_error_event : Proc(IMSMQPrivateEvent*, IMSMQQueue, HRESULT, Int32, HRESULT)
  end

  IMSMQPrivateEvent_GUID = LibC::GUID.new("d7ab3341-c9d3-11d1-bb47-0080c7c5a2c0")
  CLSID_IMSMQPrivateEvent = "d7ab3341-c9d3-11d1-bb47-0080c7c5a2c0"
  struct IMSMQPrivateEvent
    lpVtbl : IMSMQPrivateEventVTbl*
  end

  struct IDMSMQEventEventsVTbl
    query_interface : Proc(IDMSMQEventEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDMSMQEventEvents*, UInt32)
    release : Proc(IDMSMQEventEvents*, UInt32)
    get_type_info_count : Proc(IDMSMQEventEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IDMSMQEventEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDMSMQEventEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDMSMQEventEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IDMSMQEventEvents_GUID = LibC::GUID.new("d7d6e078-dccd-11d0-aa4b-0060970debae")
  CLSID_IDMSMQEventEvents = "d7d6e078-dccd-11d0-aa4b-0060970debae"
  struct IDMSMQEventEvents
    lpVtbl : IDMSMQEventEventsVTbl*
  end

  struct IMSMQTransaction2VTbl
    query_interface : Proc(IMSMQTransaction2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQTransaction2*, UInt32)
    release : Proc(IMSMQTransaction2*, UInt32)
    get_type_info_count : Proc(IMSMQTransaction2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQTransaction2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQTransaction2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQTransaction2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_transaction : Proc(IMSMQTransaction2*, Int32*, HRESULT)
    commit : Proc(IMSMQTransaction2*, VARIANT*, VARIANT*, VARIANT*, HRESULT)
    abort : Proc(IMSMQTransaction2*, VARIANT*, VARIANT*, HRESULT)
    init_new : Proc(IMSMQTransaction2*, VARIANT, HRESULT)
    get_properties : Proc(IMSMQTransaction2*, IDispatch*, HRESULT)
  end

  IMSMQTransaction2_GUID = LibC::GUID.new("2ce0c5b0-6e67-11d2-b0e6-00e02c074f6b")
  CLSID_IMSMQTransaction2 = "2ce0c5b0-6e67-11d2-b0e6-00e02c074f6b"
  struct IMSMQTransaction2
    lpVtbl : IMSMQTransaction2VTbl*
  end

  struct IMSMQTransaction3VTbl
    query_interface : Proc(IMSMQTransaction3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQTransaction3*, UInt32)
    release : Proc(IMSMQTransaction3*, UInt32)
    get_type_info_count : Proc(IMSMQTransaction3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQTransaction3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQTransaction3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQTransaction3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_transaction : Proc(IMSMQTransaction3*, Int32*, HRESULT)
    commit : Proc(IMSMQTransaction3*, VARIANT*, VARIANT*, VARIANT*, HRESULT)
    abort : Proc(IMSMQTransaction3*, VARIANT*, VARIANT*, HRESULT)
    init_new : Proc(IMSMQTransaction3*, VARIANT, HRESULT)
    get_properties : Proc(IMSMQTransaction3*, IDispatch*, HRESULT)
    get_i_transaction : Proc(IMSMQTransaction3*, VARIANT*, HRESULT)
  end

  IMSMQTransaction3_GUID = LibC::GUID.new("eba96b13-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQTransaction3 = "eba96b13-2168-11d3-898c-00e02c074f6b"
  struct IMSMQTransaction3
    lpVtbl : IMSMQTransaction3VTbl*
  end

  struct IMSMQCoordinatedTransactionDispenser2VTbl
    query_interface : Proc(IMSMQCoordinatedTransactionDispenser2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQCoordinatedTransactionDispenser2*, UInt32)
    release : Proc(IMSMQCoordinatedTransactionDispenser2*, UInt32)
    get_type_info_count : Proc(IMSMQCoordinatedTransactionDispenser2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQCoordinatedTransactionDispenser2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQCoordinatedTransactionDispenser2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQCoordinatedTransactionDispenser2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    begin_transaction : Proc(IMSMQCoordinatedTransactionDispenser2*, IMSMQTransaction2*, HRESULT)
    get_properties : Proc(IMSMQCoordinatedTransactionDispenser2*, IDispatch*, HRESULT)
  end

  IMSMQCoordinatedTransactionDispenser2_GUID = LibC::GUID.new("eba96b10-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQCoordinatedTransactionDispenser2 = "eba96b10-2168-11d3-898c-00e02c074f6b"
  struct IMSMQCoordinatedTransactionDispenser2
    lpVtbl : IMSMQCoordinatedTransactionDispenser2VTbl*
  end

  struct IMSMQCoordinatedTransactionDispenser3VTbl
    query_interface : Proc(IMSMQCoordinatedTransactionDispenser3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQCoordinatedTransactionDispenser3*, UInt32)
    release : Proc(IMSMQCoordinatedTransactionDispenser3*, UInt32)
    get_type_info_count : Proc(IMSMQCoordinatedTransactionDispenser3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQCoordinatedTransactionDispenser3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQCoordinatedTransactionDispenser3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQCoordinatedTransactionDispenser3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    begin_transaction : Proc(IMSMQCoordinatedTransactionDispenser3*, IMSMQTransaction3*, HRESULT)
    get_properties : Proc(IMSMQCoordinatedTransactionDispenser3*, IDispatch*, HRESULT)
  end

  IMSMQCoordinatedTransactionDispenser3_GUID = LibC::GUID.new("eba96b14-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQCoordinatedTransactionDispenser3 = "eba96b14-2168-11d3-898c-00e02c074f6b"
  struct IMSMQCoordinatedTransactionDispenser3
    lpVtbl : IMSMQCoordinatedTransactionDispenser3VTbl*
  end

  struct IMSMQTransactionDispenser2VTbl
    query_interface : Proc(IMSMQTransactionDispenser2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQTransactionDispenser2*, UInt32)
    release : Proc(IMSMQTransactionDispenser2*, UInt32)
    get_type_info_count : Proc(IMSMQTransactionDispenser2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQTransactionDispenser2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQTransactionDispenser2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQTransactionDispenser2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    begin_transaction : Proc(IMSMQTransactionDispenser2*, IMSMQTransaction2*, HRESULT)
    get_properties : Proc(IMSMQTransactionDispenser2*, IDispatch*, HRESULT)
  end

  IMSMQTransactionDispenser2_GUID = LibC::GUID.new("eba96b11-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQTransactionDispenser2 = "eba96b11-2168-11d3-898c-00e02c074f6b"
  struct IMSMQTransactionDispenser2
    lpVtbl : IMSMQTransactionDispenser2VTbl*
  end

  struct IMSMQTransactionDispenser3VTbl
    query_interface : Proc(IMSMQTransactionDispenser3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQTransactionDispenser3*, UInt32)
    release : Proc(IMSMQTransactionDispenser3*, UInt32)
    get_type_info_count : Proc(IMSMQTransactionDispenser3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQTransactionDispenser3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQTransactionDispenser3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQTransactionDispenser3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    begin_transaction : Proc(IMSMQTransactionDispenser3*, IMSMQTransaction3*, HRESULT)
    get_properties : Proc(IMSMQTransactionDispenser3*, IDispatch*, HRESULT)
  end

  IMSMQTransactionDispenser3_GUID = LibC::GUID.new("eba96b15-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQTransactionDispenser3 = "eba96b15-2168-11d3-898c-00e02c074f6b"
  struct IMSMQTransactionDispenser3
    lpVtbl : IMSMQTransactionDispenser3VTbl*
  end

  struct IMSMQApplicationVTbl
    query_interface : Proc(IMSMQApplication*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQApplication*, UInt32)
    release : Proc(IMSMQApplication*, UInt32)
    get_type_info_count : Proc(IMSMQApplication*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQApplication*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQApplication*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQApplication*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    machine_id_of_machine_name : Proc(IMSMQApplication*, UInt8*, UInt8**, HRESULT)
  end

  IMSMQApplication_GUID = LibC::GUID.new("d7d6e085-dccd-11d0-aa4b-0060970debae")
  CLSID_IMSMQApplication = "d7d6e085-dccd-11d0-aa4b-0060970debae"
  struct IMSMQApplication
    lpVtbl : IMSMQApplicationVTbl*
  end

  struct IMSMQApplication2VTbl
    query_interface : Proc(IMSMQApplication2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQApplication2*, UInt32)
    release : Proc(IMSMQApplication2*, UInt32)
    get_type_info_count : Proc(IMSMQApplication2*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQApplication2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQApplication2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQApplication2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    machine_id_of_machine_name : Proc(IMSMQApplication2*, UInt8*, UInt8**, HRESULT)
    register_certificate : Proc(IMSMQApplication2*, VARIANT*, VARIANT*, HRESULT)
    machine_name_of_machine_id : Proc(IMSMQApplication2*, UInt8*, UInt8**, HRESULT)
    get_msmq_version_major : Proc(IMSMQApplication2*, Int16*, HRESULT)
    get_msmq_version_minor : Proc(IMSMQApplication2*, Int16*, HRESULT)
    get_msmq_version_build : Proc(IMSMQApplication2*, Int16*, HRESULT)
    get_is_ds_enabled : Proc(IMSMQApplication2*, Int16*, HRESULT)
    get_properties : Proc(IMSMQApplication2*, IDispatch*, HRESULT)
  end

  IMSMQApplication2_GUID = LibC::GUID.new("12a30900-7300-11d2-b0e6-00e02c074f6b")
  CLSID_IMSMQApplication2 = "12a30900-7300-11d2-b0e6-00e02c074f6b"
  struct IMSMQApplication2
    lpVtbl : IMSMQApplication2VTbl*
  end

  struct IMSMQApplication3VTbl
    query_interface : Proc(IMSMQApplication3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQApplication3*, UInt32)
    release : Proc(IMSMQApplication3*, UInt32)
    get_type_info_count : Proc(IMSMQApplication3*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQApplication3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQApplication3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQApplication3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    machine_id_of_machine_name : Proc(IMSMQApplication3*, UInt8*, UInt8**, HRESULT)
    register_certificate : Proc(IMSMQApplication3*, VARIANT*, VARIANT*, HRESULT)
    machine_name_of_machine_id : Proc(IMSMQApplication3*, UInt8*, UInt8**, HRESULT)
    get_msmq_version_major : Proc(IMSMQApplication3*, Int16*, HRESULT)
    get_msmq_version_minor : Proc(IMSMQApplication3*, Int16*, HRESULT)
    get_msmq_version_build : Proc(IMSMQApplication3*, Int16*, HRESULT)
    get_is_ds_enabled : Proc(IMSMQApplication3*, Int16*, HRESULT)
    get_properties : Proc(IMSMQApplication3*, IDispatch*, HRESULT)
    get_active_queues : Proc(IMSMQApplication3*, VARIANT*, HRESULT)
    get_private_queues : Proc(IMSMQApplication3*, VARIANT*, HRESULT)
    get_directory_service_server : Proc(IMSMQApplication3*, UInt8**, HRESULT)
    get_is_connected : Proc(IMSMQApplication3*, Int16*, HRESULT)
    get_bytes_in_all_queues : Proc(IMSMQApplication3*, VARIANT*, HRESULT)
    put_machine : Proc(IMSMQApplication3*, UInt8*, HRESULT)
    get_machine : Proc(IMSMQApplication3*, UInt8**, HRESULT)
    connect : Proc(IMSMQApplication3*, HRESULT)
    disconnect : Proc(IMSMQApplication3*, HRESULT)
    tidy : Proc(IMSMQApplication3*, HRESULT)
  end

  IMSMQApplication3_GUID = LibC::GUID.new("eba96b1f-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQApplication3 = "eba96b1f-2168-11d3-898c-00e02c074f6b"
  struct IMSMQApplication3
    lpVtbl : IMSMQApplication3VTbl*
  end

  struct IMSMQDestinationVTbl
    query_interface : Proc(IMSMQDestination*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQDestination*, UInt32)
    release : Proc(IMSMQDestination*, UInt32)
    get_type_info_count : Proc(IMSMQDestination*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQDestination*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQDestination*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQDestination*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    open : Proc(IMSMQDestination*, HRESULT)
    close : Proc(IMSMQDestination*, HRESULT)
    get_is_open : Proc(IMSMQDestination*, Int16*, HRESULT)
    get_ia_ds : Proc(IMSMQDestination*, IDispatch*, HRESULT)
    putref_ia_ds : Proc(IMSMQDestination*, IDispatch, HRESULT)
    get_a_ds_path : Proc(IMSMQDestination*, UInt8**, HRESULT)
    put_a_ds_path : Proc(IMSMQDestination*, UInt8*, HRESULT)
    get_path_name : Proc(IMSMQDestination*, UInt8**, HRESULT)
    put_path_name : Proc(IMSMQDestination*, UInt8*, HRESULT)
    get_format_name : Proc(IMSMQDestination*, UInt8**, HRESULT)
    put_format_name : Proc(IMSMQDestination*, UInt8*, HRESULT)
    get_destinations : Proc(IMSMQDestination*, IDispatch*, HRESULT)
    putref_destinations : Proc(IMSMQDestination*, IDispatch, HRESULT)
    get_properties : Proc(IMSMQDestination*, IDispatch*, HRESULT)
  end

  IMSMQDestination_GUID = LibC::GUID.new("eba96b16-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQDestination = "eba96b16-2168-11d3-898c-00e02c074f6b"
  struct IMSMQDestination
    lpVtbl : IMSMQDestinationVTbl*
  end

  struct IMSMQPrivateDestinationVTbl
    query_interface : Proc(IMSMQPrivateDestination*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQPrivateDestination*, UInt32)
    release : Proc(IMSMQPrivateDestination*, UInt32)
    get_type_info_count : Proc(IMSMQPrivateDestination*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQPrivateDestination*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQPrivateDestination*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQPrivateDestination*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_handle : Proc(IMSMQPrivateDestination*, VARIANT*, HRESULT)
    put_handle : Proc(IMSMQPrivateDestination*, VARIANT, HRESULT)
  end

  IMSMQPrivateDestination_GUID = LibC::GUID.new("eba96b17-2168-11d3-898c-00e02c074f6b")
  CLSID_IMSMQPrivateDestination = "eba96b17-2168-11d3-898c-00e02c074f6b"
  struct IMSMQPrivateDestination
    lpVtbl : IMSMQPrivateDestinationVTbl*
  end

  struct IMSMQCollectionVTbl
    query_interface : Proc(IMSMQCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQCollection*, UInt32)
    release : Proc(IMSMQCollection*, UInt32)
    get_type_info_count : Proc(IMSMQCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    item : Proc(IMSMQCollection*, VARIANT*, VARIANT*, HRESULT)
    get_count : Proc(IMSMQCollection*, Int32*, HRESULT)
    _new_enum : Proc(IMSMQCollection*, IUnknown*, HRESULT)
  end

  IMSMQCollection_GUID = LibC::GUID.new("0188ac2f-ecb3-4173-9779-635ca2039c72")
  CLSID_IMSMQCollection = "0188ac2f-ecb3-4173-9779-635ca2039c72"
  struct IMSMQCollection
    lpVtbl : IMSMQCollectionVTbl*
  end

  struct IMSMQManagementVTbl
    query_interface : Proc(IMSMQManagement*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQManagement*, UInt32)
    release : Proc(IMSMQManagement*, UInt32)
    get_type_info_count : Proc(IMSMQManagement*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQManagement*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQManagement*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQManagement*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    init : Proc(IMSMQManagement*, VARIANT*, VARIANT*, VARIANT*, HRESULT)
    get_format_name : Proc(IMSMQManagement*, UInt8**, HRESULT)
    get_machine : Proc(IMSMQManagement*, UInt8**, HRESULT)
    get_message_count : Proc(IMSMQManagement*, Int32*, HRESULT)
    get_foreign_status : Proc(IMSMQManagement*, Int32*, HRESULT)
    get_queue_type : Proc(IMSMQManagement*, Int32*, HRESULT)
    get_is_local : Proc(IMSMQManagement*, Int16*, HRESULT)
    get_transactional_status : Proc(IMSMQManagement*, Int32*, HRESULT)
    get_bytes_in_queue : Proc(IMSMQManagement*, VARIANT*, HRESULT)
  end

  IMSMQManagement_GUID = LibC::GUID.new("be5f0241-e489-4957-8cc4-a452fcf3e23e")
  CLSID_IMSMQManagement = "be5f0241-e489-4957-8cc4-a452fcf3e23e"
  struct IMSMQManagement
    lpVtbl : IMSMQManagementVTbl*
  end

  struct IMSMQOutgoingQueueManagementVTbl
    query_interface : Proc(IMSMQOutgoingQueueManagement*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQOutgoingQueueManagement*, UInt32)
    release : Proc(IMSMQOutgoingQueueManagement*, UInt32)
    get_type_info_count : Proc(IMSMQOutgoingQueueManagement*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQOutgoingQueueManagement*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQOutgoingQueueManagement*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQOutgoingQueueManagement*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    init : Proc(IMSMQOutgoingQueueManagement*, VARIANT*, VARIANT*, VARIANT*, HRESULT)
    get_format_name : Proc(IMSMQOutgoingQueueManagement*, UInt8**, HRESULT)
    get_machine : Proc(IMSMQOutgoingQueueManagement*, UInt8**, HRESULT)
    get_message_count : Proc(IMSMQOutgoingQueueManagement*, Int32*, HRESULT)
    get_foreign_status : Proc(IMSMQOutgoingQueueManagement*, Int32*, HRESULT)
    get_queue_type : Proc(IMSMQOutgoingQueueManagement*, Int32*, HRESULT)
    get_is_local : Proc(IMSMQOutgoingQueueManagement*, Int16*, HRESULT)
    get_transactional_status : Proc(IMSMQOutgoingQueueManagement*, Int32*, HRESULT)
    get_bytes_in_queue : Proc(IMSMQOutgoingQueueManagement*, VARIANT*, HRESULT)
    get_state : Proc(IMSMQOutgoingQueueManagement*, Int32*, HRESULT)
    get_next_hops : Proc(IMSMQOutgoingQueueManagement*, VARIANT*, HRESULT)
    eod_get_send_info : Proc(IMSMQOutgoingQueueManagement*, IMSMQCollection*, HRESULT)
    resume : Proc(IMSMQOutgoingQueueManagement*, HRESULT)
    pause : Proc(IMSMQOutgoingQueueManagement*, HRESULT)
    eod_resend : Proc(IMSMQOutgoingQueueManagement*, HRESULT)
  end

  IMSMQOutgoingQueueManagement_GUID = LibC::GUID.new("64c478fb-f9b0-4695-8a7f-439ac94326d3")
  CLSID_IMSMQOutgoingQueueManagement = "64c478fb-f9b0-4695-8a7f-439ac94326d3"
  struct IMSMQOutgoingQueueManagement
    lpVtbl : IMSMQOutgoingQueueManagementVTbl*
  end

  struct IMSMQQueueManagementVTbl
    query_interface : Proc(IMSMQQueueManagement*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQueueManagement*, UInt32)
    release : Proc(IMSMQQueueManagement*, UInt32)
    get_type_info_count : Proc(IMSMQQueueManagement*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQueueManagement*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQueueManagement*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQueueManagement*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    init : Proc(IMSMQQueueManagement*, VARIANT*, VARIANT*, VARIANT*, HRESULT)
    get_format_name : Proc(IMSMQQueueManagement*, UInt8**, HRESULT)
    get_machine : Proc(IMSMQQueueManagement*, UInt8**, HRESULT)
    get_message_count : Proc(IMSMQQueueManagement*, Int32*, HRESULT)
    get_foreign_status : Proc(IMSMQQueueManagement*, Int32*, HRESULT)
    get_queue_type : Proc(IMSMQQueueManagement*, Int32*, HRESULT)
    get_is_local : Proc(IMSMQQueueManagement*, Int16*, HRESULT)
    get_transactional_status : Proc(IMSMQQueueManagement*, Int32*, HRESULT)
    get_bytes_in_queue : Proc(IMSMQQueueManagement*, VARIANT*, HRESULT)
    get_journal_message_count : Proc(IMSMQQueueManagement*, Int32*, HRESULT)
    get_bytes_in_journal : Proc(IMSMQQueueManagement*, VARIANT*, HRESULT)
    eod_get_receive_info : Proc(IMSMQQueueManagement*, VARIANT*, HRESULT)
  end

  IMSMQQueueManagement_GUID = LibC::GUID.new("7fbe7759-5760-444d-b8a5-5e7ab9a84cce")
  CLSID_IMSMQQueueManagement = "7fbe7759-5760-444d-b8a5-5e7ab9a84cce"
  struct IMSMQQueueManagement
    lpVtbl : IMSMQQueueManagementVTbl*
  end

end
