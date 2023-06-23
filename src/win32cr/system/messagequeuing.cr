require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
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
  CLSID_MSMQQuery = LibC::GUID.new(0xd7d6e073_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQMessage = LibC::GUID.new(0xd7d6e075_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQQueue = LibC::GUID.new(0xd7d6e079_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQEvent = LibC::GUID.new(0xd7d6e07a_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQQueueInfo = LibC::GUID.new(0xd7d6e07c_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQQueueInfos = LibC::GUID.new(0xd7d6e07e_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQTransaction = LibC::GUID.new(0xd7d6e080_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQCoordinatedTransactionDispenser = LibC::GUID.new(0xd7d6e082_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQTransactionDispenser = LibC::GUID.new(0xd7d6e084_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQApplication = LibC::GUID.new(0xd7d6e086_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  CLSID_MSMQDestination = LibC::GUID.new(0xeba96b18_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  CLSID_MSMQCollection = LibC::GUID.new(0xf72b9031_u32, 0x2f0c_u16, 0x43e8_u16, StaticArray[0x92_u8, 0x4e_u8, 0xe6_u8, 0x5_u8, 0x2c_u8, 0xdc_u8, 0x49_u8, 0x3f_u8])
  CLSID_MSMQManagement = LibC::GUID.new(0x39ce96fe_u32, 0xf4c5_u16, 0x4484_u16, StaticArray[0xa1_u8, 0x43_u8, 0x4c_u8, 0x2d_u8, 0x5d_u8, 0x32_u8, 0x42_u8, 0x29_u8])
  CLSID_MSMQOutgoingQueueManagement = LibC::GUID.new(0x188401c_u32, 0x247a_u16, 0x4fed_u16, StaticArray[0x99_u8, 0xc6_u8, 0xbf_u8, 0x14_u8, 0x11_u8, 0x9d_u8, 0x70_u8, 0x55_u8])
  CLSID_MSMQQueueManagement = LibC::GUID.new(0x33b6d07e_u32, 0xf27d_u16, 0x42fa_u16, StaticArray[0xb2_u8, 0xd7_u8, 0xbf_u8, 0x82_u8, 0xe1_u8, 0x1e_u8, 0x93_u8, 0x74_u8])


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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    lookup_queue : UInt64
  end

  IMSMQQuery_GUID = "d7d6e072-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQQuery = LibC::GUID.new(0xd7d6e072_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQQuery
    lpVtbl : IMSMQQueryVTbl*
  end

  struct IMSMQQueueInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_queue_guid : UInt64
    get_service_type_guid : UInt64
    put_service_type_guid : UInt64
    get_label : UInt64
    put_label : UInt64
    get_path_name : UInt64
    put_path_name : UInt64
    get_format_name : UInt64
    put_format_name : UInt64
    get_is_transactional : UInt64
    get_priv_level : UInt64
    put_priv_level : UInt64
    get_journal : UInt64
    put_journal : UInt64
    get_quota : UInt64
    put_quota : UInt64
    get_base_priority : UInt64
    put_base_priority : UInt64
    get_create_time : UInt64
    get_modify_time : UInt64
    get_authenticate : UInt64
    put_authenticate : UInt64
    get_journal_quota : UInt64
    put_journal_quota : UInt64
    get_is_world_readable : UInt64
    create : UInt64
    delete : UInt64
    open : UInt64
    refresh : UInt64
    update : UInt64
  end

  IMSMQQueueInfo_GUID = "d7d6e07b-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQQueueInfo = LibC::GUID.new(0xd7d6e07b_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQQueueInfo
    lpVtbl : IMSMQQueueInfoVTbl*
  end

  struct IMSMQQueueInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_queue_guid : UInt64
    get_service_type_guid : UInt64
    put_service_type_guid : UInt64
    get_label : UInt64
    put_label : UInt64
    get_path_name : UInt64
    put_path_name : UInt64
    get_format_name : UInt64
    put_format_name : UInt64
    get_is_transactional : UInt64
    get_priv_level : UInt64
    put_priv_level : UInt64
    get_journal : UInt64
    put_journal : UInt64
    get_quota : UInt64
    put_quota : UInt64
    get_base_priority : UInt64
    put_base_priority : UInt64
    get_create_time : UInt64
    get_modify_time : UInt64
    get_authenticate : UInt64
    put_authenticate : UInt64
    get_journal_quota : UInt64
    put_journal_quota : UInt64
    get_is_world_readable : UInt64
    create : UInt64
    delete : UInt64
    open : UInt64
    refresh : UInt64
    update : UInt64
    get_path_name_dns : UInt64
    get_properties : UInt64
    get_security : UInt64
    put_security : UInt64
  end

  IMSMQQueueInfo2_GUID = "fd174a80-89cf-11d2-b0f2-00e02c074f6b"
  IID_IMSMQQueueInfo2 = LibC::GUID.new(0xfd174a80_u32, 0x89cf_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xf2_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQueueInfo2
    lpVtbl : IMSMQQueueInfo2VTbl*
  end

  struct IMSMQQueueInfo3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_queue_guid : UInt64
    get_service_type_guid : UInt64
    put_service_type_guid : UInt64
    get_label : UInt64
    put_label : UInt64
    get_path_name : UInt64
    put_path_name : UInt64
    get_format_name : UInt64
    put_format_name : UInt64
    get_is_transactional : UInt64
    get_priv_level : UInt64
    put_priv_level : UInt64
    get_journal : UInt64
    put_journal : UInt64
    get_quota : UInt64
    put_quota : UInt64
    get_base_priority : UInt64
    put_base_priority : UInt64
    get_create_time : UInt64
    get_modify_time : UInt64
    get_authenticate : UInt64
    put_authenticate : UInt64
    get_journal_quota : UInt64
    put_journal_quota : UInt64
    get_is_world_readable : UInt64
    create : UInt64
    delete : UInt64
    open : UInt64
    refresh : UInt64
    update : UInt64
    get_path_name_dns : UInt64
    get_properties : UInt64
    get_security : UInt64
    put_security : UInt64
    get_is_transactional2 : UInt64
    get_is_world_readable2 : UInt64
    get_multicast_address : UInt64
    put_multicast_address : UInt64
    get_a_ds_path : UInt64
  end

  IMSMQQueueInfo3_GUID = "eba96b1d-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfo3 = LibC::GUID.new(0xeba96b1d_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQueueInfo3
    lpVtbl : IMSMQQueueInfo3VTbl*
  end

  struct IMSMQQueueInfo4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_queue_guid : UInt64
    get_service_type_guid : UInt64
    put_service_type_guid : UInt64
    get_label : UInt64
    put_label : UInt64
    get_path_name : UInt64
    put_path_name : UInt64
    get_format_name : UInt64
    put_format_name : UInt64
    get_is_transactional : UInt64
    get_priv_level : UInt64
    put_priv_level : UInt64
    get_journal : UInt64
    put_journal : UInt64
    get_quota : UInt64
    put_quota : UInt64
    get_base_priority : UInt64
    put_base_priority : UInt64
    get_create_time : UInt64
    get_modify_time : UInt64
    get_authenticate : UInt64
    put_authenticate : UInt64
    get_journal_quota : UInt64
    put_journal_quota : UInt64
    get_is_world_readable : UInt64
    create : UInt64
    delete : UInt64
    open : UInt64
    refresh : UInt64
    update : UInt64
    get_path_name_dns : UInt64
    get_properties : UInt64
    get_security : UInt64
    put_security : UInt64
    get_is_transactional2 : UInt64
    get_is_world_readable2 : UInt64
    get_multicast_address : UInt64
    put_multicast_address : UInt64
    get_a_ds_path : UInt64
  end

  IMSMQQueueInfo4_GUID = "eba96b21-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfo4 = LibC::GUID.new(0xeba96b21_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQueueInfo4
    lpVtbl : IMSMQQueueInfo4VTbl*
  end

  struct IMSMQQueueVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_access : UInt64
    get_share_mode : UInt64
    get_queue_info : UInt64
    get_handle : UInt64
    get_is_open : UInt64
    close : UInt64
    receive : UInt64
    peek : UInt64
    enable_notification : UInt64
    reset : UInt64
    receive_current : UInt64
    peek_next : UInt64
    peek_current : UInt64
  end

  IMSMQQueue_GUID = "d7d6e076-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQQueue = LibC::GUID.new(0xd7d6e076_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQQueue
    lpVtbl : IMSMQQueueVTbl*
  end

  struct IMSMQQueue2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_access : UInt64
    get_share_mode : UInt64
    get_queue_info : UInt64
    get_handle : UInt64
    get_is_open : UInt64
    close : UInt64
    receive_v1 : UInt64
    peek_v1 : UInt64
    enable_notification : UInt64
    reset : UInt64
    receive_current_v1 : UInt64
    peek_next_v1 : UInt64
    peek_current_v1 : UInt64
    receive : UInt64
    peek : UInt64
    receive_current : UInt64
    peek_next : UInt64
    peek_current : UInt64
    get_properties : UInt64
  end

  IMSMQQueue2_GUID = "ef0574e0-06d8-11d3-b100-00e02c074f6b"
  IID_IMSMQQueue2 = LibC::GUID.new(0xef0574e0_u32, 0x6d8_u16, 0x11d3_u16, StaticArray[0xb1_u8, 0x0_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQueue2
    lpVtbl : IMSMQQueue2VTbl*
  end

  struct IMSMQQueue3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_access : UInt64
    get_share_mode : UInt64
    get_queue_info : UInt64
    get_handle : UInt64
    get_is_open : UInt64
    close : UInt64
    receive_v1 : UInt64
    peek_v1 : UInt64
    enable_notification : UInt64
    reset : UInt64
    receive_current_v1 : UInt64
    peek_next_v1 : UInt64
    peek_current_v1 : UInt64
    receive : UInt64
    peek : UInt64
    receive_current : UInt64
    peek_next : UInt64
    peek_current : UInt64
    get_properties : UInt64
    get_handle2 : UInt64
    receive_by_lookup_id : UInt64
    receive_next_by_lookup_id : UInt64
    receive_previous_by_lookup_id : UInt64
    receive_first_by_lookup_id : UInt64
    receive_last_by_lookup_id : UInt64
    peek_by_lookup_id : UInt64
    peek_next_by_lookup_id : UInt64
    peek_previous_by_lookup_id : UInt64
    peek_first_by_lookup_id : UInt64
    peek_last_by_lookup_id : UInt64
    purge : UInt64
    get_is_open2 : UInt64
  end

  IMSMQQueue3_GUID = "eba96b1b-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueue3 = LibC::GUID.new(0xeba96b1b_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQueue3
    lpVtbl : IMSMQQueue3VTbl*
  end

  struct IMSMQQueue4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_access : UInt64
    get_share_mode : UInt64
    get_queue_info : UInt64
    get_handle : UInt64
    get_is_open : UInt64
    close : UInt64
    receive_v1 : UInt64
    peek_v1 : UInt64
    enable_notification : UInt64
    reset : UInt64
    receive_current_v1 : UInt64
    peek_next_v1 : UInt64
    peek_current_v1 : UInt64
    receive : UInt64
    peek : UInt64
    receive_current : UInt64
    peek_next : UInt64
    peek_current : UInt64
    get_properties : UInt64
    get_handle2 : UInt64
    receive_by_lookup_id : UInt64
    receive_next_by_lookup_id : UInt64
    receive_previous_by_lookup_id : UInt64
    receive_first_by_lookup_id : UInt64
    receive_last_by_lookup_id : UInt64
    peek_by_lookup_id : UInt64
    peek_next_by_lookup_id : UInt64
    peek_previous_by_lookup_id : UInt64
    peek_first_by_lookup_id : UInt64
    peek_last_by_lookup_id : UInt64
    purge : UInt64
    get_is_open2 : UInt64
    receive_by_lookup_id_allow_peek : UInt64
  end

  IMSMQQueue4_GUID = "eba96b20-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueue4 = LibC::GUID.new(0xeba96b20_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQueue4
    lpVtbl : IMSMQQueue4VTbl*
  end

  struct IMSMQMessageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_class : UInt64
    get_priv_level : UInt64
    put_priv_level : UInt64
    get_auth_level : UInt64
    put_auth_level : UInt64
    get_is_authenticated : UInt64
    get_delivery : UInt64
    put_delivery : UInt64
    get_trace : UInt64
    put_trace : UInt64
    get_priority : UInt64
    put_priority : UInt64
    get_journal : UInt64
    put_journal : UInt64
    get_response_queue_info : UInt64
    putref_response_queue_info : UInt64
    get_app_specific : UInt64
    put_app_specific : UInt64
    get_source_machine_guid : UInt64
    get_body_length : UInt64
    get_body : UInt64
    put_body : UInt64
    get_admin_queue_info : UInt64
    putref_admin_queue_info : UInt64
    get_id : UInt64
    get_correlation_id : UInt64
    put_correlation_id : UInt64
    get_ack : UInt64
    put_ack : UInt64
    get_label : UInt64
    put_label : UInt64
    get_max_time_to_reach_queue : UInt64
    put_max_time_to_reach_queue : UInt64
    get_max_time_to_receive : UInt64
    put_max_time_to_receive : UInt64
    get_hash_algorithm : UInt64
    put_hash_algorithm : UInt64
    get_encrypt_algorithm : UInt64
    put_encrypt_algorithm : UInt64
    get_sent_time : UInt64
    get_arrived_time : UInt64
    get_destination_queue_info : UInt64
    get_sender_certificate : UInt64
    put_sender_certificate : UInt64
    get_sender_id : UInt64
    get_sender_id_type : UInt64
    put_sender_id_type : UInt64
    send : UInt64
    attach_current_security_context : UInt64
  end

  IMSMQMessage_GUID = "d7d6e074-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQMessage = LibC::GUID.new(0xd7d6e074_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQMessage
    lpVtbl : IMSMQMessageVTbl*
  end

  struct IMSMQQueueInfosVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    reset : UInt64
    next : UInt64
  end

  IMSMQQueueInfos_GUID = "d7d6e07d-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQQueueInfos = LibC::GUID.new(0xd7d6e07d_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQQueueInfos
    lpVtbl : IMSMQQueueInfosVTbl*
  end

  struct IMSMQQueueInfos2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    reset : UInt64
    next : UInt64
    get_properties : UInt64
  end

  IMSMQQueueInfos2_GUID = "eba96b0f-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfos2 = LibC::GUID.new(0xeba96b0f_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQueueInfos2
    lpVtbl : IMSMQQueueInfos2VTbl*
  end

  struct IMSMQQueueInfos3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    reset : UInt64
    next : UInt64
    get_properties : UInt64
  end

  IMSMQQueueInfos3_GUID = "eba96b1e-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfos3 = LibC::GUID.new(0xeba96b1e_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQueueInfos3
    lpVtbl : IMSMQQueueInfos3VTbl*
  end

  struct IMSMQQueueInfos4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    reset : UInt64
    next : UInt64
    get_properties : UInt64
  end

  IMSMQQueueInfos4_GUID = "eba96b22-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfos4 = LibC::GUID.new(0xeba96b22_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQueueInfos4
    lpVtbl : IMSMQQueueInfos4VTbl*
  end

  struct IMSMQEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IMSMQEvent_GUID = "d7d6e077-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQEvent = LibC::GUID.new(0xd7d6e077_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQEvent
    lpVtbl : IMSMQEventVTbl*
  end

  struct IMSMQEvent2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_properties : UInt64
  end

  IMSMQEvent2_GUID = "eba96b12-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQEvent2 = LibC::GUID.new(0xeba96b12_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQEvent2
    lpVtbl : IMSMQEvent2VTbl*
  end

  struct IMSMQEvent3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_properties : UInt64
  end

  IMSMQEvent3_GUID = "eba96b1c-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQEvent3 = LibC::GUID.new(0xeba96b1c_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQEvent3
    lpVtbl : IMSMQEvent3VTbl*
  end

  struct IMSMQTransactionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_transaction : UInt64
    commit : UInt64
    abort : UInt64
  end

  IMSMQTransaction_GUID = "d7d6e07f-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQTransaction = LibC::GUID.new(0xd7d6e07f_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQTransaction
    lpVtbl : IMSMQTransactionVTbl*
  end

  struct IMSMQCoordinatedTransactionDispenserVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    begin_transaction : UInt64
  end

  IMSMQCoordinatedTransactionDispenser_GUID = "d7d6e081-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQCoordinatedTransactionDispenser = LibC::GUID.new(0xd7d6e081_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQCoordinatedTransactionDispenser
    lpVtbl : IMSMQCoordinatedTransactionDispenserVTbl*
  end

  struct IMSMQTransactionDispenserVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    begin_transaction : UInt64
  end

  IMSMQTransactionDispenser_GUID = "d7d6e083-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQTransactionDispenser = LibC::GUID.new(0xd7d6e083_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQTransactionDispenser
    lpVtbl : IMSMQTransactionDispenserVTbl*
  end

  struct IMSMQQuery2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    lookup_queue : UInt64
    get_properties : UInt64
  end

  IMSMQQuery2_GUID = "eba96b0e-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQuery2 = LibC::GUID.new(0xeba96b0e_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQuery2
    lpVtbl : IMSMQQuery2VTbl*
  end

  struct IMSMQQuery3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    lookup_queue_v2 : UInt64
    get_properties : UInt64
    lookup_queue : UInt64
  end

  IMSMQQuery3_GUID = "eba96b19-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQuery3 = LibC::GUID.new(0xeba96b19_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQuery3
    lpVtbl : IMSMQQuery3VTbl*
  end

  struct IMSMQQuery4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    lookup_queue_v2 : UInt64
    get_properties : UInt64
    lookup_queue : UInt64
  end

  IMSMQQuery4_GUID = "eba96b24-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQuery4 = LibC::GUID.new(0xeba96b24_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQQuery4
    lpVtbl : IMSMQQuery4VTbl*
  end

  struct IMSMQMessage2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_class : UInt64
    get_priv_level : UInt64
    put_priv_level : UInt64
    get_auth_level : UInt64
    put_auth_level : UInt64
    get_is_authenticated : UInt64
    get_delivery : UInt64
    put_delivery : UInt64
    get_trace : UInt64
    put_trace : UInt64
    get_priority : UInt64
    put_priority : UInt64
    get_journal : UInt64
    put_journal : UInt64
    get_response_queue_info_v1 : UInt64
    putref_response_queue_info_v1 : UInt64
    get_app_specific : UInt64
    put_app_specific : UInt64
    get_source_machine_guid : UInt64
    get_body_length : UInt64
    get_body : UInt64
    put_body : UInt64
    get_admin_queue_info_v1 : UInt64
    putref_admin_queue_info_v1 : UInt64
    get_id : UInt64
    get_correlation_id : UInt64
    put_correlation_id : UInt64
    get_ack : UInt64
    put_ack : UInt64
    get_label : UInt64
    put_label : UInt64
    get_max_time_to_reach_queue : UInt64
    put_max_time_to_reach_queue : UInt64
    get_max_time_to_receive : UInt64
    put_max_time_to_receive : UInt64
    get_hash_algorithm : UInt64
    put_hash_algorithm : UInt64
    get_encrypt_algorithm : UInt64
    put_encrypt_algorithm : UInt64
    get_sent_time : UInt64
    get_arrived_time : UInt64
    get_destination_queue_info : UInt64
    get_sender_certificate : UInt64
    put_sender_certificate : UInt64
    get_sender_id : UInt64
    get_sender_id_type : UInt64
    put_sender_id_type : UInt64
    send : UInt64
    attach_current_security_context : UInt64
    get_sender_version : UInt64
    get_extension : UInt64
    put_extension : UInt64
    get_connector_type_guid : UInt64
    put_connector_type_guid : UInt64
    get_transaction_status_queue_info : UInt64
    get_destination_symmetric_key : UInt64
    put_destination_symmetric_key : UInt64
    get_signature : UInt64
    put_signature : UInt64
    get_authentication_provider_type : UInt64
    put_authentication_provider_type : UInt64
    get_authentication_provider_name : UInt64
    put_authentication_provider_name : UInt64
    put_sender_id : UInt64
    get_msg_class : UInt64
    put_msg_class : UInt64
    get_properties : UInt64
    get_transaction_id : UInt64
    get_is_first_in_transaction : UInt64
    get_is_last_in_transaction : UInt64
    get_response_queue_info : UInt64
    putref_response_queue_info : UInt64
    get_admin_queue_info : UInt64
    putref_admin_queue_info : UInt64
    get_received_authentication_level : UInt64
  end

  IMSMQMessage2_GUID = "d9933be0-a567-11d2-b0f3-00e02c074f6b"
  IID_IMSMQMessage2 = LibC::GUID.new(0xd9933be0_u32, 0xa567_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xf3_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQMessage2
    lpVtbl : IMSMQMessage2VTbl*
  end

  struct IMSMQMessage3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_class : UInt64
    get_priv_level : UInt64
    put_priv_level : UInt64
    get_auth_level : UInt64
    put_auth_level : UInt64
    get_is_authenticated : UInt64
    get_delivery : UInt64
    put_delivery : UInt64
    get_trace : UInt64
    put_trace : UInt64
    get_priority : UInt64
    put_priority : UInt64
    get_journal : UInt64
    put_journal : UInt64
    get_response_queue_info_v1 : UInt64
    putref_response_queue_info_v1 : UInt64
    get_app_specific : UInt64
    put_app_specific : UInt64
    get_source_machine_guid : UInt64
    get_body_length : UInt64
    get_body : UInt64
    put_body : UInt64
    get_admin_queue_info_v1 : UInt64
    putref_admin_queue_info_v1 : UInt64
    get_id : UInt64
    get_correlation_id : UInt64
    put_correlation_id : UInt64
    get_ack : UInt64
    put_ack : UInt64
    get_label : UInt64
    put_label : UInt64
    get_max_time_to_reach_queue : UInt64
    put_max_time_to_reach_queue : UInt64
    get_max_time_to_receive : UInt64
    put_max_time_to_receive : UInt64
    get_hash_algorithm : UInt64
    put_hash_algorithm : UInt64
    get_encrypt_algorithm : UInt64
    put_encrypt_algorithm : UInt64
    get_sent_time : UInt64
    get_arrived_time : UInt64
    get_destination_queue_info : UInt64
    get_sender_certificate : UInt64
    put_sender_certificate : UInt64
    get_sender_id : UInt64
    get_sender_id_type : UInt64
    put_sender_id_type : UInt64
    send : UInt64
    attach_current_security_context : UInt64
    get_sender_version : UInt64
    get_extension : UInt64
    put_extension : UInt64
    get_connector_type_guid : UInt64
    put_connector_type_guid : UInt64
    get_transaction_status_queue_info : UInt64
    get_destination_symmetric_key : UInt64
    put_destination_symmetric_key : UInt64
    get_signature : UInt64
    put_signature : UInt64
    get_authentication_provider_type : UInt64
    put_authentication_provider_type : UInt64
    get_authentication_provider_name : UInt64
    put_authentication_provider_name : UInt64
    put_sender_id : UInt64
    get_msg_class : UInt64
    put_msg_class : UInt64
    get_properties : UInt64
    get_transaction_id : UInt64
    get_is_first_in_transaction : UInt64
    get_is_last_in_transaction : UInt64
    get_response_queue_info_v2 : UInt64
    putref_response_queue_info_v2 : UInt64
    get_admin_queue_info_v2 : UInt64
    putref_admin_queue_info_v2 : UInt64
    get_received_authentication_level : UInt64
    get_response_queue_info : UInt64
    putref_response_queue_info : UInt64
    get_admin_queue_info : UInt64
    putref_admin_queue_info : UInt64
    get_response_destination : UInt64
    putref_response_destination : UInt64
    get_destination : UInt64
    get_lookup_id : UInt64
    get_is_authenticated2 : UInt64
    get_is_first_in_transaction2 : UInt64
    get_is_last_in_transaction2 : UInt64
    attach_current_security_context2 : UInt64
    get_soap_envelope : UInt64
    get_compound_message : UInt64
    put_soap_header : UInt64
    put_soap_body : UInt64
  end

  IMSMQMessage3_GUID = "eba96b1a-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQMessage3 = LibC::GUID.new(0xeba96b1a_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQMessage3
    lpVtbl : IMSMQMessage3VTbl*
  end

  struct IMSMQMessage4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_class : UInt64
    get_priv_level : UInt64
    put_priv_level : UInt64
    get_auth_level : UInt64
    put_auth_level : UInt64
    get_is_authenticated : UInt64
    get_delivery : UInt64
    put_delivery : UInt64
    get_trace : UInt64
    put_trace : UInt64
    get_priority : UInt64
    put_priority : UInt64
    get_journal : UInt64
    put_journal : UInt64
    get_response_queue_info_v1 : UInt64
    putref_response_queue_info_v1 : UInt64
    get_app_specific : UInt64
    put_app_specific : UInt64
    get_source_machine_guid : UInt64
    get_body_length : UInt64
    get_body : UInt64
    put_body : UInt64
    get_admin_queue_info_v1 : UInt64
    putref_admin_queue_info_v1 : UInt64
    get_id : UInt64
    get_correlation_id : UInt64
    put_correlation_id : UInt64
    get_ack : UInt64
    put_ack : UInt64
    get_label : UInt64
    put_label : UInt64
    get_max_time_to_reach_queue : UInt64
    put_max_time_to_reach_queue : UInt64
    get_max_time_to_receive : UInt64
    put_max_time_to_receive : UInt64
    get_hash_algorithm : UInt64
    put_hash_algorithm : UInt64
    get_encrypt_algorithm : UInt64
    put_encrypt_algorithm : UInt64
    get_sent_time : UInt64
    get_arrived_time : UInt64
    get_destination_queue_info : UInt64
    get_sender_certificate : UInt64
    put_sender_certificate : UInt64
    get_sender_id : UInt64
    get_sender_id_type : UInt64
    put_sender_id_type : UInt64
    send : UInt64
    attach_current_security_context : UInt64
    get_sender_version : UInt64
    get_extension : UInt64
    put_extension : UInt64
    get_connector_type_guid : UInt64
    put_connector_type_guid : UInt64
    get_transaction_status_queue_info : UInt64
    get_destination_symmetric_key : UInt64
    put_destination_symmetric_key : UInt64
    get_signature : UInt64
    put_signature : UInt64
    get_authentication_provider_type : UInt64
    put_authentication_provider_type : UInt64
    get_authentication_provider_name : UInt64
    put_authentication_provider_name : UInt64
    put_sender_id : UInt64
    get_msg_class : UInt64
    put_msg_class : UInt64
    get_properties : UInt64
    get_transaction_id : UInt64
    get_is_first_in_transaction : UInt64
    get_is_last_in_transaction : UInt64
    get_response_queue_info_v2 : UInt64
    putref_response_queue_info_v2 : UInt64
    get_admin_queue_info_v2 : UInt64
    putref_admin_queue_info_v2 : UInt64
    get_received_authentication_level : UInt64
    get_response_queue_info : UInt64
    putref_response_queue_info : UInt64
    get_admin_queue_info : UInt64
    putref_admin_queue_info : UInt64
    get_response_destination : UInt64
    putref_response_destination : UInt64
    get_destination : UInt64
    get_lookup_id : UInt64
    get_is_authenticated2 : UInt64
    get_is_first_in_transaction2 : UInt64
    get_is_last_in_transaction2 : UInt64
    attach_current_security_context2 : UInt64
    get_soap_envelope : UInt64
    get_compound_message : UInt64
    put_soap_header : UInt64
    put_soap_body : UInt64
  end

  IMSMQMessage4_GUID = "eba96b23-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQMessage4 = LibC::GUID.new(0xeba96b23_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQMessage4
    lpVtbl : IMSMQMessage4VTbl*
  end

  struct IMSMQPrivateEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_hwnd : UInt64
    fire_arrived_event : UInt64
    fire_arrived_error_event : UInt64
  end

  IMSMQPrivateEvent_GUID = "d7ab3341-c9d3-11d1-bb47-0080c7c5a2c0"
  IID_IMSMQPrivateEvent = LibC::GUID.new(0xd7ab3341_u32, 0xc9d3_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0x47_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xc5_u8, 0xa2_u8, 0xc0_u8])
  struct IMSMQPrivateEvent
    lpVtbl : IMSMQPrivateEventVTbl*
  end

  struct IDMSMQEventEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IDMSMQEventEvents_GUID = "d7d6e078-dccd-11d0-aa4b-0060970debae"
  IID_IDMSMQEventEvents = LibC::GUID.new(0xd7d6e078_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IDMSMQEventEvents
    lpVtbl : IDMSMQEventEventsVTbl*
  end

  struct IMSMQTransaction2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_transaction : UInt64
    commit : UInt64
    abort : UInt64
    init_new : UInt64
    get_properties : UInt64
  end

  IMSMQTransaction2_GUID = "2ce0c5b0-6e67-11d2-b0e6-00e02c074f6b"
  IID_IMSMQTransaction2 = LibC::GUID.new(0x2ce0c5b0_u32, 0x6e67_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xe6_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQTransaction2
    lpVtbl : IMSMQTransaction2VTbl*
  end

  struct IMSMQTransaction3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_transaction : UInt64
    commit : UInt64
    abort : UInt64
    init_new : UInt64
    get_properties : UInt64
    get_i_transaction : UInt64
  end

  IMSMQTransaction3_GUID = "eba96b13-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQTransaction3 = LibC::GUID.new(0xeba96b13_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQTransaction3
    lpVtbl : IMSMQTransaction3VTbl*
  end

  struct IMSMQCoordinatedTransactionDispenser2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    begin_transaction : UInt64
    get_properties : UInt64
  end

  IMSMQCoordinatedTransactionDispenser2_GUID = "eba96b10-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQCoordinatedTransactionDispenser2 = LibC::GUID.new(0xeba96b10_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQCoordinatedTransactionDispenser2
    lpVtbl : IMSMQCoordinatedTransactionDispenser2VTbl*
  end

  struct IMSMQCoordinatedTransactionDispenser3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    begin_transaction : UInt64
    get_properties : UInt64
  end

  IMSMQCoordinatedTransactionDispenser3_GUID = "eba96b14-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQCoordinatedTransactionDispenser3 = LibC::GUID.new(0xeba96b14_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQCoordinatedTransactionDispenser3
    lpVtbl : IMSMQCoordinatedTransactionDispenser3VTbl*
  end

  struct IMSMQTransactionDispenser2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    begin_transaction : UInt64
    get_properties : UInt64
  end

  IMSMQTransactionDispenser2_GUID = "eba96b11-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQTransactionDispenser2 = LibC::GUID.new(0xeba96b11_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQTransactionDispenser2
    lpVtbl : IMSMQTransactionDispenser2VTbl*
  end

  struct IMSMQTransactionDispenser3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    begin_transaction : UInt64
    get_properties : UInt64
  end

  IMSMQTransactionDispenser3_GUID = "eba96b15-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQTransactionDispenser3 = LibC::GUID.new(0xeba96b15_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQTransactionDispenser3
    lpVtbl : IMSMQTransactionDispenser3VTbl*
  end

  struct IMSMQApplicationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    machine_id_of_machine_name : UInt64
  end

  IMSMQApplication_GUID = "d7d6e085-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQApplication = LibC::GUID.new(0xd7d6e085_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
  struct IMSMQApplication
    lpVtbl : IMSMQApplicationVTbl*
  end

  struct IMSMQApplication2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    machine_id_of_machine_name : UInt64
    register_certificate : UInt64
    machine_name_of_machine_id : UInt64
    get_msmq_version_major : UInt64
    get_msmq_version_minor : UInt64
    get_msmq_version_build : UInt64
    get_is_ds_enabled : UInt64
    get_properties : UInt64
  end

  IMSMQApplication2_GUID = "12a30900-7300-11d2-b0e6-00e02c074f6b"
  IID_IMSMQApplication2 = LibC::GUID.new(0x12a30900_u32, 0x7300_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xe6_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQApplication2
    lpVtbl : IMSMQApplication2VTbl*
  end

  struct IMSMQApplication3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    machine_id_of_machine_name : UInt64
    register_certificate : UInt64
    machine_name_of_machine_id : UInt64
    get_msmq_version_major : UInt64
    get_msmq_version_minor : UInt64
    get_msmq_version_build : UInt64
    get_is_ds_enabled : UInt64
    get_properties : UInt64
    get_active_queues : UInt64
    get_private_queues : UInt64
    get_directory_service_server : UInt64
    get_is_connected : UInt64
    get_bytes_in_all_queues : UInt64
    put_machine : UInt64
    get_machine : UInt64
    connect : UInt64
    disconnect : UInt64
    tidy : UInt64
  end

  IMSMQApplication3_GUID = "eba96b1f-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQApplication3 = LibC::GUID.new(0xeba96b1f_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQApplication3
    lpVtbl : IMSMQApplication3VTbl*
  end

  struct IMSMQDestinationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    open : UInt64
    close : UInt64
    get_is_open : UInt64
    get_ia_ds : UInt64
    putref_ia_ds : UInt64
    get_a_ds_path : UInt64
    put_a_ds_path : UInt64
    get_path_name : UInt64
    put_path_name : UInt64
    get_format_name : UInt64
    put_format_name : UInt64
    get_destinations : UInt64
    putref_destinations : UInt64
    get_properties : UInt64
  end

  IMSMQDestination_GUID = "eba96b16-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQDestination = LibC::GUID.new(0xeba96b16_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQDestination
    lpVtbl : IMSMQDestinationVTbl*
  end

  struct IMSMQPrivateDestinationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_handle : UInt64
    put_handle : UInt64
  end

  IMSMQPrivateDestination_GUID = "eba96b17-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQPrivateDestination = LibC::GUID.new(0xeba96b17_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
  struct IMSMQPrivateDestination
    lpVtbl : IMSMQPrivateDestinationVTbl*
  end

  struct IMSMQCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    item : UInt64
    get_count : UInt64
    _new_enum : UInt64
  end

  IMSMQCollection_GUID = "0188ac2f-ecb3-4173-9779-635ca2039c72"
  IID_IMSMQCollection = LibC::GUID.new(0x188ac2f_u32, 0xecb3_u16, 0x4173_u16, StaticArray[0x97_u8, 0x79_u8, 0x63_u8, 0x5c_u8, 0xa2_u8, 0x3_u8, 0x9c_u8, 0x72_u8])
  struct IMSMQCollection
    lpVtbl : IMSMQCollectionVTbl*
  end

  struct IMSMQManagementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    init : UInt64
    get_format_name : UInt64
    get_machine : UInt64
    get_message_count : UInt64
    get_foreign_status : UInt64
    get_queue_type : UInt64
    get_is_local : UInt64
    get_transactional_status : UInt64
    get_bytes_in_queue : UInt64
  end

  IMSMQManagement_GUID = "be5f0241-e489-4957-8cc4-a452fcf3e23e"
  IID_IMSMQManagement = LibC::GUID.new(0xbe5f0241_u32, 0xe489_u16, 0x4957_u16, StaticArray[0x8c_u8, 0xc4_u8, 0xa4_u8, 0x52_u8, 0xfc_u8, 0xf3_u8, 0xe2_u8, 0x3e_u8])
  struct IMSMQManagement
    lpVtbl : IMSMQManagementVTbl*
  end

  struct IMSMQOutgoingQueueManagementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    init : UInt64
    get_format_name : UInt64
    get_machine : UInt64
    get_message_count : UInt64
    get_foreign_status : UInt64
    get_queue_type : UInt64
    get_is_local : UInt64
    get_transactional_status : UInt64
    get_bytes_in_queue : UInt64
    get_state : UInt64
    get_next_hops : UInt64
    eod_get_send_info : UInt64
    resume : UInt64
    pause : UInt64
    eod_resend : UInt64
  end

  IMSMQOutgoingQueueManagement_GUID = "64c478fb-f9b0-4695-8a7f-439ac94326d3"
  IID_IMSMQOutgoingQueueManagement = LibC::GUID.new(0x64c478fb_u32, 0xf9b0_u16, 0x4695_u16, StaticArray[0x8a_u8, 0x7f_u8, 0x43_u8, 0x9a_u8, 0xc9_u8, 0x43_u8, 0x26_u8, 0xd3_u8])
  struct IMSMQOutgoingQueueManagement
    lpVtbl : IMSMQOutgoingQueueManagementVTbl*
  end

  struct IMSMQQueueManagementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    init : UInt64
    get_format_name : UInt64
    get_machine : UInt64
    get_message_count : UInt64
    get_foreign_status : UInt64
    get_queue_type : UInt64
    get_is_local : UInt64
    get_transactional_status : UInt64
    get_bytes_in_queue : UInt64
    get_journal_message_count : UInt64
    get_bytes_in_journal : UInt64
    eod_get_receive_info : UInt64
  end

  IMSMQQueueManagement_GUID = "7fbe7759-5760-444d-b8a5-5e7ab9a84cce"
  IID_IMSMQQueueManagement = LibC::GUID.new(0x7fbe7759_u32, 0x5760_u16, 0x444d_u16, StaticArray[0xb8_u8, 0xa5_u8, 0x5e_u8, 0x7a_u8, 0xb9_u8, 0xa8_u8, 0x4c_u8, 0xce_u8])
  struct IMSMQQueueManagement
    lpVtbl : IMSMQQueueManagementVTbl*
  end

end
struct LibWin32::IMSMQQuery
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
  def lookup_queue(queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, ppqinfos : IMSMQQueueInfos*) : HRESULT
    @lpVtbl.value.lookup_queue.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos*, HRESULT)).call(queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, ppqinfos)
  end
end
struct LibWin32::IMSMQQueueInfo
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
  def get_queue_guid(pbstrguidqueue : UInt8**) : HRESULT
    @lpVtbl.value.get_queue_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidqueue)
  end
  def get_service_type_guid(pbstrguidservicetype : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidservicetype)
  end
  def put_service_type_guid(bstrguidservicetype : UInt8*) : HRESULT
    @lpVtbl.value.put_service_type_guid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrguidservicetype)
  end
  def get_label(pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrlabel)
  end
  def put_label(bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrlabel)
  end
  def get_path_name(pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathname)
  end
  def put_path_name(bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpathname)
  end
  def get_format_name(pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrformatname)
  end
  def put_format_name(bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrformatname)
  end
  def get_is_transactional(pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional.unsafe_as(Proc(Int16*, HRESULT)).call(pistransactional)
  end
  def get_priv_level(plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.unsafe_as(Proc(Int32*, HRESULT)).call(plprivlevel)
  end
  def put_priv_level(lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.unsafe_as(Proc(Int32, HRESULT)).call(lprivlevel)
  end
  def get_journal(pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.unsafe_as(Proc(Int32*, HRESULT)).call(pljournal)
  end
  def put_journal(ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.unsafe_as(Proc(Int32, HRESULT)).call(ljournal)
  end
  def get_quota(plquota : Int32*) : HRESULT
    @lpVtbl.value.get_quota.unsafe_as(Proc(Int32*, HRESULT)).call(plquota)
  end
  def put_quota(lquota : Int32) : HRESULT
    @lpVtbl.value.put_quota.unsafe_as(Proc(Int32, HRESULT)).call(lquota)
  end
  def get_base_priority(plbasepriority : Int32*) : HRESULT
    @lpVtbl.value.get_base_priority.unsafe_as(Proc(Int32*, HRESULT)).call(plbasepriority)
  end
  def put_base_priority(lbasepriority : Int32) : HRESULT
    @lpVtbl.value.put_base_priority.unsafe_as(Proc(Int32, HRESULT)).call(lbasepriority)
  end
  def get_create_time(pvarcreatetime : VARIANT*) : HRESULT
    @lpVtbl.value.get_create_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarcreatetime)
  end
  def get_modify_time(pvarmodifytime : VARIANT*) : HRESULT
    @lpVtbl.value.get_modify_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmodifytime)
  end
  def get_authenticate(plauthenticate : Int32*) : HRESULT
    @lpVtbl.value.get_authenticate.unsafe_as(Proc(Int32*, HRESULT)).call(plauthenticate)
  end
  def put_authenticate(lauthenticate : Int32) : HRESULT
    @lpVtbl.value.put_authenticate.unsafe_as(Proc(Int32, HRESULT)).call(lauthenticate)
  end
  def get_journal_quota(pljournalquota : Int32*) : HRESULT
    @lpVtbl.value.get_journal_quota.unsafe_as(Proc(Int32*, HRESULT)).call(pljournalquota)
  end
  def put_journal_quota(ljournalquota : Int32) : HRESULT
    @lpVtbl.value.put_journal_quota.unsafe_as(Proc(Int32, HRESULT)).call(ljournalquota)
  end
  def get_is_world_readable(pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable.unsafe_as(Proc(Int16*, HRESULT)).call(pisworldreadable)
  end
  def create(istransactional : VARIANT*, isworldreadable : VARIANT*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(istransactional, isworldreadable)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def open(access : Int32, sharemode : Int32, ppq : IMSMQQueue*) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(Int32, Int32, IMSMQQueue*, HRESULT)).call(access, sharemode, ppq)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def update : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IMSMQQueueInfo2
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
  def get_queue_guid(pbstrguidqueue : UInt8**) : HRESULT
    @lpVtbl.value.get_queue_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidqueue)
  end
  def get_service_type_guid(pbstrguidservicetype : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidservicetype)
  end
  def put_service_type_guid(bstrguidservicetype : UInt8*) : HRESULT
    @lpVtbl.value.put_service_type_guid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrguidservicetype)
  end
  def get_label(pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrlabel)
  end
  def put_label(bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrlabel)
  end
  def get_path_name(pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathname)
  end
  def put_path_name(bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpathname)
  end
  def get_format_name(pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrformatname)
  end
  def put_format_name(bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrformatname)
  end
  def get_is_transactional(pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional.unsafe_as(Proc(Int16*, HRESULT)).call(pistransactional)
  end
  def get_priv_level(plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.unsafe_as(Proc(Int32*, HRESULT)).call(plprivlevel)
  end
  def put_priv_level(lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.unsafe_as(Proc(Int32, HRESULT)).call(lprivlevel)
  end
  def get_journal(pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.unsafe_as(Proc(Int32*, HRESULT)).call(pljournal)
  end
  def put_journal(ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.unsafe_as(Proc(Int32, HRESULT)).call(ljournal)
  end
  def get_quota(plquota : Int32*) : HRESULT
    @lpVtbl.value.get_quota.unsafe_as(Proc(Int32*, HRESULT)).call(plquota)
  end
  def put_quota(lquota : Int32) : HRESULT
    @lpVtbl.value.put_quota.unsafe_as(Proc(Int32, HRESULT)).call(lquota)
  end
  def get_base_priority(plbasepriority : Int32*) : HRESULT
    @lpVtbl.value.get_base_priority.unsafe_as(Proc(Int32*, HRESULT)).call(plbasepriority)
  end
  def put_base_priority(lbasepriority : Int32) : HRESULT
    @lpVtbl.value.put_base_priority.unsafe_as(Proc(Int32, HRESULT)).call(lbasepriority)
  end
  def get_create_time(pvarcreatetime : VARIANT*) : HRESULT
    @lpVtbl.value.get_create_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarcreatetime)
  end
  def get_modify_time(pvarmodifytime : VARIANT*) : HRESULT
    @lpVtbl.value.get_modify_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmodifytime)
  end
  def get_authenticate(plauthenticate : Int32*) : HRESULT
    @lpVtbl.value.get_authenticate.unsafe_as(Proc(Int32*, HRESULT)).call(plauthenticate)
  end
  def put_authenticate(lauthenticate : Int32) : HRESULT
    @lpVtbl.value.put_authenticate.unsafe_as(Proc(Int32, HRESULT)).call(lauthenticate)
  end
  def get_journal_quota(pljournalquota : Int32*) : HRESULT
    @lpVtbl.value.get_journal_quota.unsafe_as(Proc(Int32*, HRESULT)).call(pljournalquota)
  end
  def put_journal_quota(ljournalquota : Int32) : HRESULT
    @lpVtbl.value.put_journal_quota.unsafe_as(Proc(Int32, HRESULT)).call(ljournalquota)
  end
  def get_is_world_readable(pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable.unsafe_as(Proc(Int16*, HRESULT)).call(pisworldreadable)
  end
  def create(istransactional : VARIANT*, isworldreadable : VARIANT*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(istransactional, isworldreadable)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def open(access : Int32, sharemode : Int32, ppq : IMSMQQueue2*) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(Int32, Int32, IMSMQQueue2*, HRESULT)).call(access, sharemode, ppq)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def update : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(HRESULT)).call
  end
  def get_path_name_dns(pbstrpathnamedns : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name_dns.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathnamedns)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_security(pvarsecurity : VARIANT*) : HRESULT
    @lpVtbl.value.get_security.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsecurity)
  end
  def put_security(varsecurity : VARIANT) : HRESULT
    @lpVtbl.value.put_security.unsafe_as(Proc(VARIANT, HRESULT)).call(varsecurity)
  end
end
struct LibWin32::IMSMQQueueInfo3
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
  def get_queue_guid(pbstrguidqueue : UInt8**) : HRESULT
    @lpVtbl.value.get_queue_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidqueue)
  end
  def get_service_type_guid(pbstrguidservicetype : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidservicetype)
  end
  def put_service_type_guid(bstrguidservicetype : UInt8*) : HRESULT
    @lpVtbl.value.put_service_type_guid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrguidservicetype)
  end
  def get_label(pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrlabel)
  end
  def put_label(bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrlabel)
  end
  def get_path_name(pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathname)
  end
  def put_path_name(bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpathname)
  end
  def get_format_name(pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrformatname)
  end
  def put_format_name(bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrformatname)
  end
  def get_is_transactional(pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional.unsafe_as(Proc(Int16*, HRESULT)).call(pistransactional)
  end
  def get_priv_level(plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.unsafe_as(Proc(Int32*, HRESULT)).call(plprivlevel)
  end
  def put_priv_level(lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.unsafe_as(Proc(Int32, HRESULT)).call(lprivlevel)
  end
  def get_journal(pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.unsafe_as(Proc(Int32*, HRESULT)).call(pljournal)
  end
  def put_journal(ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.unsafe_as(Proc(Int32, HRESULT)).call(ljournal)
  end
  def get_quota(plquota : Int32*) : HRESULT
    @lpVtbl.value.get_quota.unsafe_as(Proc(Int32*, HRESULT)).call(plquota)
  end
  def put_quota(lquota : Int32) : HRESULT
    @lpVtbl.value.put_quota.unsafe_as(Proc(Int32, HRESULT)).call(lquota)
  end
  def get_base_priority(plbasepriority : Int32*) : HRESULT
    @lpVtbl.value.get_base_priority.unsafe_as(Proc(Int32*, HRESULT)).call(plbasepriority)
  end
  def put_base_priority(lbasepriority : Int32) : HRESULT
    @lpVtbl.value.put_base_priority.unsafe_as(Proc(Int32, HRESULT)).call(lbasepriority)
  end
  def get_create_time(pvarcreatetime : VARIANT*) : HRESULT
    @lpVtbl.value.get_create_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarcreatetime)
  end
  def get_modify_time(pvarmodifytime : VARIANT*) : HRESULT
    @lpVtbl.value.get_modify_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmodifytime)
  end
  def get_authenticate(plauthenticate : Int32*) : HRESULT
    @lpVtbl.value.get_authenticate.unsafe_as(Proc(Int32*, HRESULT)).call(plauthenticate)
  end
  def put_authenticate(lauthenticate : Int32) : HRESULT
    @lpVtbl.value.put_authenticate.unsafe_as(Proc(Int32, HRESULT)).call(lauthenticate)
  end
  def get_journal_quota(pljournalquota : Int32*) : HRESULT
    @lpVtbl.value.get_journal_quota.unsafe_as(Proc(Int32*, HRESULT)).call(pljournalquota)
  end
  def put_journal_quota(ljournalquota : Int32) : HRESULT
    @lpVtbl.value.put_journal_quota.unsafe_as(Proc(Int32, HRESULT)).call(ljournalquota)
  end
  def get_is_world_readable(pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable.unsafe_as(Proc(Int16*, HRESULT)).call(pisworldreadable)
  end
  def create(istransactional : VARIANT*, isworldreadable : VARIANT*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(istransactional, isworldreadable)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def open(access : Int32, sharemode : Int32, ppq : IMSMQQueue3*) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(Int32, Int32, IMSMQQueue3*, HRESULT)).call(access, sharemode, ppq)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def update : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(HRESULT)).call
  end
  def get_path_name_dns(pbstrpathnamedns : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name_dns.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathnamedns)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_security(pvarsecurity : VARIANT*) : HRESULT
    @lpVtbl.value.get_security.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsecurity)
  end
  def put_security(varsecurity : VARIANT) : HRESULT
    @lpVtbl.value.put_security.unsafe_as(Proc(VARIANT, HRESULT)).call(varsecurity)
  end
  def get_is_transactional2(pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional2.unsafe_as(Proc(Int16*, HRESULT)).call(pistransactional)
  end
  def get_is_world_readable2(pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable2.unsafe_as(Proc(Int16*, HRESULT)).call(pisworldreadable)
  end
  def get_multicast_address(pbstrmulticastaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_multicast_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmulticastaddress)
  end
  def put_multicast_address(bstrmulticastaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_multicast_address.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrmulticastaddress)
  end
  def get_a_ds_path(pbstradspath : UInt8**) : HRESULT
    @lpVtbl.value.get_a_ds_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstradspath)
  end
end
struct LibWin32::IMSMQQueueInfo4
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
  def get_queue_guid(pbstrguidqueue : UInt8**) : HRESULT
    @lpVtbl.value.get_queue_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidqueue)
  end
  def get_service_type_guid(pbstrguidservicetype : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidservicetype)
  end
  def put_service_type_guid(bstrguidservicetype : UInt8*) : HRESULT
    @lpVtbl.value.put_service_type_guid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrguidservicetype)
  end
  def get_label(pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrlabel)
  end
  def put_label(bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrlabel)
  end
  def get_path_name(pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathname)
  end
  def put_path_name(bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpathname)
  end
  def get_format_name(pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrformatname)
  end
  def put_format_name(bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrformatname)
  end
  def get_is_transactional(pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional.unsafe_as(Proc(Int16*, HRESULT)).call(pistransactional)
  end
  def get_priv_level(plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.unsafe_as(Proc(Int32*, HRESULT)).call(plprivlevel)
  end
  def put_priv_level(lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.unsafe_as(Proc(Int32, HRESULT)).call(lprivlevel)
  end
  def get_journal(pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.unsafe_as(Proc(Int32*, HRESULT)).call(pljournal)
  end
  def put_journal(ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.unsafe_as(Proc(Int32, HRESULT)).call(ljournal)
  end
  def get_quota(plquota : Int32*) : HRESULT
    @lpVtbl.value.get_quota.unsafe_as(Proc(Int32*, HRESULT)).call(plquota)
  end
  def put_quota(lquota : Int32) : HRESULT
    @lpVtbl.value.put_quota.unsafe_as(Proc(Int32, HRESULT)).call(lquota)
  end
  def get_base_priority(plbasepriority : Int32*) : HRESULT
    @lpVtbl.value.get_base_priority.unsafe_as(Proc(Int32*, HRESULT)).call(plbasepriority)
  end
  def put_base_priority(lbasepriority : Int32) : HRESULT
    @lpVtbl.value.put_base_priority.unsafe_as(Proc(Int32, HRESULT)).call(lbasepriority)
  end
  def get_create_time(pvarcreatetime : VARIANT*) : HRESULT
    @lpVtbl.value.get_create_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarcreatetime)
  end
  def get_modify_time(pvarmodifytime : VARIANT*) : HRESULT
    @lpVtbl.value.get_modify_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmodifytime)
  end
  def get_authenticate(plauthenticate : Int32*) : HRESULT
    @lpVtbl.value.get_authenticate.unsafe_as(Proc(Int32*, HRESULT)).call(plauthenticate)
  end
  def put_authenticate(lauthenticate : Int32) : HRESULT
    @lpVtbl.value.put_authenticate.unsafe_as(Proc(Int32, HRESULT)).call(lauthenticate)
  end
  def get_journal_quota(pljournalquota : Int32*) : HRESULT
    @lpVtbl.value.get_journal_quota.unsafe_as(Proc(Int32*, HRESULT)).call(pljournalquota)
  end
  def put_journal_quota(ljournalquota : Int32) : HRESULT
    @lpVtbl.value.put_journal_quota.unsafe_as(Proc(Int32, HRESULT)).call(ljournalquota)
  end
  def get_is_world_readable(pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable.unsafe_as(Proc(Int16*, HRESULT)).call(pisworldreadable)
  end
  def create(istransactional : VARIANT*, isworldreadable : VARIANT*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(istransactional, isworldreadable)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def open(access : Int32, sharemode : Int32, ppq : IMSMQQueue4*) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(Int32, Int32, IMSMQQueue4*, HRESULT)).call(access, sharemode, ppq)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def update : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(HRESULT)).call
  end
  def get_path_name_dns(pbstrpathnamedns : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name_dns.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathnamedns)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_security(pvarsecurity : VARIANT*) : HRESULT
    @lpVtbl.value.get_security.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsecurity)
  end
  def put_security(varsecurity : VARIANT) : HRESULT
    @lpVtbl.value.put_security.unsafe_as(Proc(VARIANT, HRESULT)).call(varsecurity)
  end
  def get_is_transactional2(pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional2.unsafe_as(Proc(Int16*, HRESULT)).call(pistransactional)
  end
  def get_is_world_readable2(pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable2.unsafe_as(Proc(Int16*, HRESULT)).call(pisworldreadable)
  end
  def get_multicast_address(pbstrmulticastaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_multicast_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmulticastaddress)
  end
  def put_multicast_address(bstrmulticastaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_multicast_address.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrmulticastaddress)
  end
  def get_a_ds_path(pbstradspath : UInt8**) : HRESULT
    @lpVtbl.value.get_a_ds_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstradspath)
  end
end
struct LibWin32::IMSMQQueue
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
  def get_access(placcess : Int32*) : HRESULT
    @lpVtbl.value.get_access.unsafe_as(Proc(Int32*, HRESULT)).call(placcess)
  end
  def get_share_mode(plsharemode : Int32*) : HRESULT
    @lpVtbl.value.get_share_mode.unsafe_as(Proc(Int32*, HRESULT)).call(plsharemode)
  end
  def get_queue_info(ppqinfo : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_queue_info.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinfo)
  end
  def get_handle(plhandle : Int32*) : HRESULT
    @lpVtbl.value.get_handle.unsafe_as(Proc(Int32*, HRESULT)).call(plhandle)
  end
  def get_is_open(pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.unsafe_as(Proc(Int16*, HRESULT)).call(pisopen)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def receive(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def enable_notification(event : IMSMQEvent, cursor : VARIANT*, receivetimeout : VARIANT*) : HRESULT
    @lpVtbl.value.enable_notification.unsafe_as(Proc(IMSMQEvent, VARIANT*, VARIANT*, HRESULT)).call(event, cursor, receivetimeout)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def receive_current(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_current.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_next(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_next.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_current(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_current.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
end
struct LibWin32::IMSMQQueue2
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
  def get_access(placcess : Int32*) : HRESULT
    @lpVtbl.value.get_access.unsafe_as(Proc(Int32*, HRESULT)).call(placcess)
  end
  def get_share_mode(plsharemode : Int32*) : HRESULT
    @lpVtbl.value.get_share_mode.unsafe_as(Proc(Int32*, HRESULT)).call(plsharemode)
  end
  def get_queue_info(ppqinfo : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_queue_info.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinfo)
  end
  def get_handle(plhandle : Int32*) : HRESULT
    @lpVtbl.value.get_handle.unsafe_as(Proc(Int32*, HRESULT)).call(plhandle)
  end
  def get_is_open(pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.unsafe_as(Proc(Int16*, HRESULT)).call(pisopen)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def receive_v1(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_v1(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def enable_notification(event : IMSMQEvent2, cursor : VARIANT*, receivetimeout : VARIANT*) : HRESULT
    @lpVtbl.value.enable_notification.unsafe_as(Proc(IMSMQEvent2, VARIANT*, VARIANT*, HRESULT)).call(event, cursor, receivetimeout)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def receive_current_v1(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_current_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_next_v1(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_next_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_current_v1(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_current_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def receive(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.receive.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.peek.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def receive_current(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.receive_current.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_next(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.peek_next.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_current(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.peek_current.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage2*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQQueue3
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
  def get_access(placcess : Int32*) : HRESULT
    @lpVtbl.value.get_access.unsafe_as(Proc(Int32*, HRESULT)).call(placcess)
  end
  def get_share_mode(plsharemode : Int32*) : HRESULT
    @lpVtbl.value.get_share_mode.unsafe_as(Proc(Int32*, HRESULT)).call(plsharemode)
  end
  def get_queue_info(ppqinfo : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_queue_info.unsafe_as(Proc(IMSMQQueueInfo3*, HRESULT)).call(ppqinfo)
  end
  def get_handle(plhandle : Int32*) : HRESULT
    @lpVtbl.value.get_handle.unsafe_as(Proc(Int32*, HRESULT)).call(plhandle)
  end
  def get_is_open(pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.unsafe_as(Proc(Int16*, HRESULT)).call(pisopen)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def receive_v1(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_v1(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def enable_notification(event : IMSMQEvent3, cursor : VARIANT*, receivetimeout : VARIANT*) : HRESULT
    @lpVtbl.value.enable_notification.unsafe_as(Proc(IMSMQEvent3, VARIANT*, VARIANT*, HRESULT)).call(event, cursor, receivetimeout)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def receive_current_v1(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_current_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_next_v1(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_next_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_current_v1(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_current_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def receive(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def receive_current(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_current.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_next(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_next.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_current(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_current.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_handle2(pvarhandle : VARIANT*) : HRESULT
    @lpVtbl.value.get_handle2.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarhandle)
  end
  def receive_by_lookup_id(lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_next_by_lookup_id(lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_next_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_previous_by_lookup_id(lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_previous_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_first_by_lookup_id(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_first_by_lookup_id.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_last_by_lookup_id(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_last_by_lookup_id.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_by_lookup_id(lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_next_by_lookup_id(lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_next_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_previous_by_lookup_id(lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_previous_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_first_by_lookup_id(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_first_by_lookup_id.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_last_by_lookup_id(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_last_by_lookup_id.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage3*, HRESULT)).call(wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def purge : HRESULT
    @lpVtbl.value.purge.unsafe_as(Proc(HRESULT)).call
  end
  def get_is_open2(pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open2.unsafe_as(Proc(Int16*, HRESULT)).call(pisopen)
  end
end
struct LibWin32::IMSMQQueue4
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
  def get_access(placcess : Int32*) : HRESULT
    @lpVtbl.value.get_access.unsafe_as(Proc(Int32*, HRESULT)).call(placcess)
  end
  def get_share_mode(plsharemode : Int32*) : HRESULT
    @lpVtbl.value.get_share_mode.unsafe_as(Proc(Int32*, HRESULT)).call(plsharemode)
  end
  def get_queue_info(ppqinfo : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_queue_info.unsafe_as(Proc(IMSMQQueueInfo4*, HRESULT)).call(ppqinfo)
  end
  def get_handle(plhandle : Int32*) : HRESULT
    @lpVtbl.value.get_handle.unsafe_as(Proc(Int32*, HRESULT)).call(plhandle)
  end
  def get_is_open(pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.unsafe_as(Proc(Int16*, HRESULT)).call(pisopen)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def receive_v1(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_v1(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def enable_notification(event : IMSMQEvent3, cursor : VARIANT*, receivetimeout : VARIANT*) : HRESULT
    @lpVtbl.value.enable_notification.unsafe_as(Proc(IMSMQEvent3, VARIANT*, VARIANT*, HRESULT)).call(event, cursor, receivetimeout)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def receive_current_v1(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_current_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_next_v1(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_next_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_current_v1(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_current_v1.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def receive(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def receive_current(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_current.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_next(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_next.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_current(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_current.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_handle2(pvarhandle : VARIANT*) : HRESULT
    @lpVtbl.value.get_handle2.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarhandle)
  end
  def receive_by_lookup_id(lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_next_by_lookup_id(lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_next_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_previous_by_lookup_id(lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_previous_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_first_by_lookup_id(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_first_by_lookup_id.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_last_by_lookup_id(transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_last_by_lookup_id.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_by_lookup_id(lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_next_by_lookup_id(lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_next_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_previous_by_lookup_id(lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_previous_by_lookup_id.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_first_by_lookup_id(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_first_by_lookup_id.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_last_by_lookup_id(wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_last_by_lookup_id.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def purge : HRESULT
    @lpVtbl.value.purge.unsafe_as(Proc(HRESULT)).call
  end
  def get_is_open2(pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open2.unsafe_as(Proc(Int16*, HRESULT)).call(pisopen)
  end
  def receive_by_lookup_id_allow_peek(lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_by_lookup_id_allow_peek.unsafe_as(Proc(VARIANT, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQMessage4*, HRESULT)).call(lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
end
struct LibWin32::IMSMQMessage
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
  def get_class(plclass : Int32*) : HRESULT
    @lpVtbl.value.get_class.unsafe_as(Proc(Int32*, HRESULT)).call(plclass)
  end
  def get_priv_level(plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.unsafe_as(Proc(Int32*, HRESULT)).call(plprivlevel)
  end
  def put_priv_level(lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.unsafe_as(Proc(Int32, HRESULT)).call(lprivlevel)
  end
  def get_auth_level(plauthlevel : Int32*) : HRESULT
    @lpVtbl.value.get_auth_level.unsafe_as(Proc(Int32*, HRESULT)).call(plauthlevel)
  end
  def put_auth_level(lauthlevel : Int32) : HRESULT
    @lpVtbl.value.put_auth_level.unsafe_as(Proc(Int32, HRESULT)).call(lauthlevel)
  end
  def get_is_authenticated(pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated.unsafe_as(Proc(Int16*, HRESULT)).call(pisauthenticated)
  end
  def get_delivery(pldelivery : Int32*) : HRESULT
    @lpVtbl.value.get_delivery.unsafe_as(Proc(Int32*, HRESULT)).call(pldelivery)
  end
  def put_delivery(ldelivery : Int32) : HRESULT
    @lpVtbl.value.put_delivery.unsafe_as(Proc(Int32, HRESULT)).call(ldelivery)
  end
  def get_trace(pltrace : Int32*) : HRESULT
    @lpVtbl.value.get_trace.unsafe_as(Proc(Int32*, HRESULT)).call(pltrace)
  end
  def put_trace(ltrace : Int32) : HRESULT
    @lpVtbl.value.put_trace.unsafe_as(Proc(Int32, HRESULT)).call(ltrace)
  end
  def get_priority(plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(plpriority)
  end
  def put_priority(lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(Int32, HRESULT)).call(lpriority)
  end
  def get_journal(pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.unsafe_as(Proc(Int32*, HRESULT)).call(pljournal)
  end
  def put_journal(ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.unsafe_as(Proc(Int32, HRESULT)).call(ljournal)
  end
  def get_response_queue_info(ppqinforesponse : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_response_queue_info.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinforesponse)
  end
  def putref_response_queue_info(pqinforesponse : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_response_queue_info.unsafe_as(Proc(IMSMQQueueInfo, HRESULT)).call(pqinforesponse)
  end
  def get_app_specific(plappspecific : Int32*) : HRESULT
    @lpVtbl.value.get_app_specific.unsafe_as(Proc(Int32*, HRESULT)).call(plappspecific)
  end
  def put_app_specific(lappspecific : Int32) : HRESULT
    @lpVtbl.value.put_app_specific.unsafe_as(Proc(Int32, HRESULT)).call(lappspecific)
  end
  def get_source_machine_guid(pbstrguidsrcmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_source_machine_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidsrcmachine)
  end
  def get_body_length(pcbbody : Int32*) : HRESULT
    @lpVtbl.value.get_body_length.unsafe_as(Proc(Int32*, HRESULT)).call(pcbbody)
  end
  def get_body(pvarbody : VARIANT*) : HRESULT
    @lpVtbl.value.get_body.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarbody)
  end
  def put_body(varbody : VARIANT) : HRESULT
    @lpVtbl.value.put_body.unsafe_as(Proc(VARIANT, HRESULT)).call(varbody)
  end
  def get_admin_queue_info(ppqinfoadmin : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_admin_queue_info.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinfoadmin)
  end
  def putref_admin_queue_info(pqinfoadmin : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_admin_queue_info.unsafe_as(Proc(IMSMQQueueInfo, HRESULT)).call(pqinfoadmin)
  end
  def get_id(pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmsgid)
  end
  def get_correlation_id(pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_correlation_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmsgid)
  end
  def put_correlation_id(varmsgid : VARIANT) : HRESULT
    @lpVtbl.value.put_correlation_id.unsafe_as(Proc(VARIANT, HRESULT)).call(varmsgid)
  end
  def get_ack(plack : Int32*) : HRESULT
    @lpVtbl.value.get_ack.unsafe_as(Proc(Int32*, HRESULT)).call(plack)
  end
  def put_ack(lack : Int32) : HRESULT
    @lpVtbl.value.put_ack.unsafe_as(Proc(Int32, HRESULT)).call(lack)
  end
  def get_label(pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrlabel)
  end
  def put_label(bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrlabel)
  end
  def get_max_time_to_reach_queue(plmaxtimetoreachqueue : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_reach_queue.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxtimetoreachqueue)
  end
  def put_max_time_to_reach_queue(lmaxtimetoreachqueue : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_reach_queue.unsafe_as(Proc(Int32, HRESULT)).call(lmaxtimetoreachqueue)
  end
  def get_max_time_to_receive(plmaxtimetoreceive : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_receive.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxtimetoreceive)
  end
  def put_max_time_to_receive(lmaxtimetoreceive : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_receive.unsafe_as(Proc(Int32, HRESULT)).call(lmaxtimetoreceive)
  end
  def get_hash_algorithm(plhashalg : Int32*) : HRESULT
    @lpVtbl.value.get_hash_algorithm.unsafe_as(Proc(Int32*, HRESULT)).call(plhashalg)
  end
  def put_hash_algorithm(lhashalg : Int32) : HRESULT
    @lpVtbl.value.put_hash_algorithm.unsafe_as(Proc(Int32, HRESULT)).call(lhashalg)
  end
  def get_encrypt_algorithm(plencryptalg : Int32*) : HRESULT
    @lpVtbl.value.get_encrypt_algorithm.unsafe_as(Proc(Int32*, HRESULT)).call(plencryptalg)
  end
  def put_encrypt_algorithm(lencryptalg : Int32) : HRESULT
    @lpVtbl.value.put_encrypt_algorithm.unsafe_as(Proc(Int32, HRESULT)).call(lencryptalg)
  end
  def get_sent_time(pvarsenttime : VARIANT*) : HRESULT
    @lpVtbl.value.get_sent_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsenttime)
  end
  def get_arrived_time(plarrivedtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_arrived_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(plarrivedtime)
  end
  def get_destination_queue_info(ppqinfodest : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_destination_queue_info.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinfodest)
  end
  def get_sender_certificate(pvarsendercert : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_certificate.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsendercert)
  end
  def put_sender_certificate(varsendercert : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_certificate.unsafe_as(Proc(VARIANT, HRESULT)).call(varsendercert)
  end
  def get_sender_id(pvarsenderid : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsenderid)
  end
  def get_sender_id_type(plsenderidtype : Int32*) : HRESULT
    @lpVtbl.value.get_sender_id_type.unsafe_as(Proc(Int32*, HRESULT)).call(plsenderidtype)
  end
  def put_sender_id_type(lsenderidtype : Int32) : HRESULT
    @lpVtbl.value.put_sender_id_type.unsafe_as(Proc(Int32, HRESULT)).call(lsenderidtype)
  end
  def send(destinationqueue : IMSMQQueue, transaction : VARIANT*) : HRESULT
    @lpVtbl.value.send.unsafe_as(Proc(IMSMQQueue, VARIANT*, HRESULT)).call(destinationqueue, transaction)
  end
  def attach_current_security_context : HRESULT
    @lpVtbl.value.attach_current_security_context.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IMSMQQueueInfos
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
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def next(ppqinfonext : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinfonext)
  end
end
struct LibWin32::IMSMQQueueInfos2
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
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def next(ppqinfonext : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinfonext)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQQueueInfos3
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
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def next(ppqinfonext : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(IMSMQQueueInfo3*, HRESULT)).call(ppqinfonext)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQQueueInfos4
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
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def next(ppqinfonext : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(IMSMQQueueInfo4*, HRESULT)).call(ppqinfonext)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQEvent
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
struct LibWin32::IMSMQEvent2
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
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQEvent3
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
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQTransaction
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
  def get_transaction(pltransaction : Int32*) : HRESULT
    @lpVtbl.value.get_transaction.unsafe_as(Proc(Int32*, HRESULT)).call(pltransaction)
  end
  def commit(fretaining : VARIANT*, grftc : VARIANT*, grfrm : VARIANT*) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, HRESULT)).call(fretaining, grftc, grfrm)
  end
  def abort(fretaining : VARIANT*, fasync : VARIANT*) : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(fretaining, fasync)
  end
end
struct LibWin32::IMSMQCoordinatedTransactionDispenser
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
  def begin_transaction(ptransaction : IMSMQTransaction*) : HRESULT
    @lpVtbl.value.begin_transaction.unsafe_as(Proc(IMSMQTransaction*, HRESULT)).call(ptransaction)
  end
end
struct LibWin32::IMSMQTransactionDispenser
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
  def begin_transaction(ptransaction : IMSMQTransaction*) : HRESULT
    @lpVtbl.value.begin_transaction.unsafe_as(Proc(IMSMQTransaction*, HRESULT)).call(ptransaction)
  end
end
struct LibWin32::IMSMQQuery2
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
  def lookup_queue(queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, ppqinfos : IMSMQQueueInfos2*) : HRESULT
    @lpVtbl.value.lookup_queue.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos2*, HRESULT)).call(queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, ppqinfos)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQQuery3
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
  def lookup_queue_v2(queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, ppqinfos : IMSMQQueueInfos3*) : HRESULT
    @lpVtbl.value.lookup_queue_v2.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos3*, HRESULT)).call(queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, ppqinfos)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def lookup_queue(queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, multicastaddress : VARIANT*, relmulticastaddress : VARIANT*, ppqinfos : IMSMQQueueInfos3*) : HRESULT
    @lpVtbl.value.lookup_queue.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos3*, HRESULT)).call(queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, multicastaddress, relmulticastaddress, ppqinfos)
  end
end
struct LibWin32::IMSMQQuery4
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
  def lookup_queue_v2(queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, ppqinfos : IMSMQQueueInfos4*) : HRESULT
    @lpVtbl.value.lookup_queue_v2.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos4*, HRESULT)).call(queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, ppqinfos)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def lookup_queue(queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, multicastaddress : VARIANT*, relmulticastaddress : VARIANT*, ppqinfos : IMSMQQueueInfos4*) : HRESULT
    @lpVtbl.value.lookup_queue.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos4*, HRESULT)).call(queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, multicastaddress, relmulticastaddress, ppqinfos)
  end
end
struct LibWin32::IMSMQMessage2
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
  def get_class(plclass : Int32*) : HRESULT
    @lpVtbl.value.get_class.unsafe_as(Proc(Int32*, HRESULT)).call(plclass)
  end
  def get_priv_level(plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.unsafe_as(Proc(Int32*, HRESULT)).call(plprivlevel)
  end
  def put_priv_level(lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.unsafe_as(Proc(Int32, HRESULT)).call(lprivlevel)
  end
  def get_auth_level(plauthlevel : Int32*) : HRESULT
    @lpVtbl.value.get_auth_level.unsafe_as(Proc(Int32*, HRESULT)).call(plauthlevel)
  end
  def put_auth_level(lauthlevel : Int32) : HRESULT
    @lpVtbl.value.put_auth_level.unsafe_as(Proc(Int32, HRESULT)).call(lauthlevel)
  end
  def get_is_authenticated(pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated.unsafe_as(Proc(Int16*, HRESULT)).call(pisauthenticated)
  end
  def get_delivery(pldelivery : Int32*) : HRESULT
    @lpVtbl.value.get_delivery.unsafe_as(Proc(Int32*, HRESULT)).call(pldelivery)
  end
  def put_delivery(ldelivery : Int32) : HRESULT
    @lpVtbl.value.put_delivery.unsafe_as(Proc(Int32, HRESULT)).call(ldelivery)
  end
  def get_trace(pltrace : Int32*) : HRESULT
    @lpVtbl.value.get_trace.unsafe_as(Proc(Int32*, HRESULT)).call(pltrace)
  end
  def put_trace(ltrace : Int32) : HRESULT
    @lpVtbl.value.put_trace.unsafe_as(Proc(Int32, HRESULT)).call(ltrace)
  end
  def get_priority(plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(plpriority)
  end
  def put_priority(lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(Int32, HRESULT)).call(lpriority)
  end
  def get_journal(pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.unsafe_as(Proc(Int32*, HRESULT)).call(pljournal)
  end
  def put_journal(ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.unsafe_as(Proc(Int32, HRESULT)).call(ljournal)
  end
  def get_response_queue_info_v1(ppqinforesponse : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinforesponse)
  end
  def putref_response_queue_info_v1(pqinforesponse : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo, HRESULT)).call(pqinforesponse)
  end
  def get_app_specific(plappspecific : Int32*) : HRESULT
    @lpVtbl.value.get_app_specific.unsafe_as(Proc(Int32*, HRESULT)).call(plappspecific)
  end
  def put_app_specific(lappspecific : Int32) : HRESULT
    @lpVtbl.value.put_app_specific.unsafe_as(Proc(Int32, HRESULT)).call(lappspecific)
  end
  def get_source_machine_guid(pbstrguidsrcmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_source_machine_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidsrcmachine)
  end
  def get_body_length(pcbbody : Int32*) : HRESULT
    @lpVtbl.value.get_body_length.unsafe_as(Proc(Int32*, HRESULT)).call(pcbbody)
  end
  def get_body(pvarbody : VARIANT*) : HRESULT
    @lpVtbl.value.get_body.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarbody)
  end
  def put_body(varbody : VARIANT) : HRESULT
    @lpVtbl.value.put_body.unsafe_as(Proc(VARIANT, HRESULT)).call(varbody)
  end
  def get_admin_queue_info_v1(ppqinfoadmin : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinfoadmin)
  end
  def putref_admin_queue_info_v1(pqinfoadmin : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo, HRESULT)).call(pqinfoadmin)
  end
  def get_id(pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmsgid)
  end
  def get_correlation_id(pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_correlation_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmsgid)
  end
  def put_correlation_id(varmsgid : VARIANT) : HRESULT
    @lpVtbl.value.put_correlation_id.unsafe_as(Proc(VARIANT, HRESULT)).call(varmsgid)
  end
  def get_ack(plack : Int32*) : HRESULT
    @lpVtbl.value.get_ack.unsafe_as(Proc(Int32*, HRESULT)).call(plack)
  end
  def put_ack(lack : Int32) : HRESULT
    @lpVtbl.value.put_ack.unsafe_as(Proc(Int32, HRESULT)).call(lack)
  end
  def get_label(pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrlabel)
  end
  def put_label(bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrlabel)
  end
  def get_max_time_to_reach_queue(plmaxtimetoreachqueue : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_reach_queue.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxtimetoreachqueue)
  end
  def put_max_time_to_reach_queue(lmaxtimetoreachqueue : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_reach_queue.unsafe_as(Proc(Int32, HRESULT)).call(lmaxtimetoreachqueue)
  end
  def get_max_time_to_receive(plmaxtimetoreceive : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_receive.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxtimetoreceive)
  end
  def put_max_time_to_receive(lmaxtimetoreceive : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_receive.unsafe_as(Proc(Int32, HRESULT)).call(lmaxtimetoreceive)
  end
  def get_hash_algorithm(plhashalg : Int32*) : HRESULT
    @lpVtbl.value.get_hash_algorithm.unsafe_as(Proc(Int32*, HRESULT)).call(plhashalg)
  end
  def put_hash_algorithm(lhashalg : Int32) : HRESULT
    @lpVtbl.value.put_hash_algorithm.unsafe_as(Proc(Int32, HRESULT)).call(lhashalg)
  end
  def get_encrypt_algorithm(plencryptalg : Int32*) : HRESULT
    @lpVtbl.value.get_encrypt_algorithm.unsafe_as(Proc(Int32*, HRESULT)).call(plencryptalg)
  end
  def put_encrypt_algorithm(lencryptalg : Int32) : HRESULT
    @lpVtbl.value.put_encrypt_algorithm.unsafe_as(Proc(Int32, HRESULT)).call(lencryptalg)
  end
  def get_sent_time(pvarsenttime : VARIANT*) : HRESULT
    @lpVtbl.value.get_sent_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsenttime)
  end
  def get_arrived_time(plarrivedtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_arrived_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(plarrivedtime)
  end
  def get_destination_queue_info(ppqinfodest : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_destination_queue_info.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinfodest)
  end
  def get_sender_certificate(pvarsendercert : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_certificate.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsendercert)
  end
  def put_sender_certificate(varsendercert : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_certificate.unsafe_as(Proc(VARIANT, HRESULT)).call(varsendercert)
  end
  def get_sender_id(pvarsenderid : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsenderid)
  end
  def get_sender_id_type(plsenderidtype : Int32*) : HRESULT
    @lpVtbl.value.get_sender_id_type.unsafe_as(Proc(Int32*, HRESULT)).call(plsenderidtype)
  end
  def put_sender_id_type(lsenderidtype : Int32) : HRESULT
    @lpVtbl.value.put_sender_id_type.unsafe_as(Proc(Int32, HRESULT)).call(lsenderidtype)
  end
  def send(destinationqueue : IMSMQQueue2, transaction : VARIANT*) : HRESULT
    @lpVtbl.value.send.unsafe_as(Proc(IMSMQQueue2, VARIANT*, HRESULT)).call(destinationqueue, transaction)
  end
  def attach_current_security_context : HRESULT
    @lpVtbl.value.attach_current_security_context.unsafe_as(Proc(HRESULT)).call
  end
  def get_sender_version(plsenderversion : Int32*) : HRESULT
    @lpVtbl.value.get_sender_version.unsafe_as(Proc(Int32*, HRESULT)).call(plsenderversion)
  end
  def get_extension(pvarextension : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarextension)
  end
  def put_extension(varextension : VARIANT) : HRESULT
    @lpVtbl.value.put_extension.unsafe_as(Proc(VARIANT, HRESULT)).call(varextension)
  end
  def get_connector_type_guid(pbstrguidconnectortype : UInt8**) : HRESULT
    @lpVtbl.value.get_connector_type_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidconnectortype)
  end
  def put_connector_type_guid(bstrguidconnectortype : UInt8*) : HRESULT
    @lpVtbl.value.put_connector_type_guid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrguidconnectortype)
  end
  def get_transaction_status_queue_info(ppqinfoxactstatus : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_transaction_status_queue_info.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinfoxactstatus)
  end
  def get_destination_symmetric_key(pvardestsymmkey : VARIANT*) : HRESULT
    @lpVtbl.value.get_destination_symmetric_key.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvardestsymmkey)
  end
  def put_destination_symmetric_key(vardestsymmkey : VARIANT) : HRESULT
    @lpVtbl.value.put_destination_symmetric_key.unsafe_as(Proc(VARIANT, HRESULT)).call(vardestsymmkey)
  end
  def get_signature(pvarsignature : VARIANT*) : HRESULT
    @lpVtbl.value.get_signature.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsignature)
  end
  def put_signature(varsignature : VARIANT) : HRESULT
    @lpVtbl.value.put_signature.unsafe_as(Proc(VARIANT, HRESULT)).call(varsignature)
  end
  def get_authentication_provider_type(plauthprovtype : Int32*) : HRESULT
    @lpVtbl.value.get_authentication_provider_type.unsafe_as(Proc(Int32*, HRESULT)).call(plauthprovtype)
  end
  def put_authentication_provider_type(lauthprovtype : Int32) : HRESULT
    @lpVtbl.value.put_authentication_provider_type.unsafe_as(Proc(Int32, HRESULT)).call(lauthprovtype)
  end
  def get_authentication_provider_name(pbstrauthprovname : UInt8**) : HRESULT
    @lpVtbl.value.get_authentication_provider_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrauthprovname)
  end
  def put_authentication_provider_name(bstrauthprovname : UInt8*) : HRESULT
    @lpVtbl.value.put_authentication_provider_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrauthprovname)
  end
  def put_sender_id(varsenderid : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_id.unsafe_as(Proc(VARIANT, HRESULT)).call(varsenderid)
  end
  def get_msg_class(plmsgclass : Int32*) : HRESULT
    @lpVtbl.value.get_msg_class.unsafe_as(Proc(Int32*, HRESULT)).call(plmsgclass)
  end
  def put_msg_class(lmsgclass : Int32) : HRESULT
    @lpVtbl.value.put_msg_class.unsafe_as(Proc(Int32, HRESULT)).call(lmsgclass)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_transaction_id(pvarxactid : VARIANT*) : HRESULT
    @lpVtbl.value.get_transaction_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarxactid)
  end
  def get_is_first_in_transaction(pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction.unsafe_as(Proc(Int16*, HRESULT)).call(pisfirstinxact)
  end
  def get_is_last_in_transaction(pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction.unsafe_as(Proc(Int16*, HRESULT)).call(pislastinxact)
  end
  def get_response_queue_info(ppqinforesponse : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_response_queue_info.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinforesponse)
  end
  def putref_response_queue_info(pqinforesponse : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_response_queue_info.unsafe_as(Proc(IMSMQQueueInfo2, HRESULT)).call(pqinforesponse)
  end
  def get_admin_queue_info(ppqinfoadmin : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_admin_queue_info.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinfoadmin)
  end
  def putref_admin_queue_info(pqinfoadmin : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_admin_queue_info.unsafe_as(Proc(IMSMQQueueInfo2, HRESULT)).call(pqinfoadmin)
  end
  def get_received_authentication_level(psreceivedauthenticationlevel : Int16*) : HRESULT
    @lpVtbl.value.get_received_authentication_level.unsafe_as(Proc(Int16*, HRESULT)).call(psreceivedauthenticationlevel)
  end
end
struct LibWin32::IMSMQMessage3
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
  def get_class(plclass : Int32*) : HRESULT
    @lpVtbl.value.get_class.unsafe_as(Proc(Int32*, HRESULT)).call(plclass)
  end
  def get_priv_level(plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.unsafe_as(Proc(Int32*, HRESULT)).call(plprivlevel)
  end
  def put_priv_level(lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.unsafe_as(Proc(Int32, HRESULT)).call(lprivlevel)
  end
  def get_auth_level(plauthlevel : Int32*) : HRESULT
    @lpVtbl.value.get_auth_level.unsafe_as(Proc(Int32*, HRESULT)).call(plauthlevel)
  end
  def put_auth_level(lauthlevel : Int32) : HRESULT
    @lpVtbl.value.put_auth_level.unsafe_as(Proc(Int32, HRESULT)).call(lauthlevel)
  end
  def get_is_authenticated(pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated.unsafe_as(Proc(Int16*, HRESULT)).call(pisauthenticated)
  end
  def get_delivery(pldelivery : Int32*) : HRESULT
    @lpVtbl.value.get_delivery.unsafe_as(Proc(Int32*, HRESULT)).call(pldelivery)
  end
  def put_delivery(ldelivery : Int32) : HRESULT
    @lpVtbl.value.put_delivery.unsafe_as(Proc(Int32, HRESULT)).call(ldelivery)
  end
  def get_trace(pltrace : Int32*) : HRESULT
    @lpVtbl.value.get_trace.unsafe_as(Proc(Int32*, HRESULT)).call(pltrace)
  end
  def put_trace(ltrace : Int32) : HRESULT
    @lpVtbl.value.put_trace.unsafe_as(Proc(Int32, HRESULT)).call(ltrace)
  end
  def get_priority(plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(plpriority)
  end
  def put_priority(lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(Int32, HRESULT)).call(lpriority)
  end
  def get_journal(pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.unsafe_as(Proc(Int32*, HRESULT)).call(pljournal)
  end
  def put_journal(ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.unsafe_as(Proc(Int32, HRESULT)).call(ljournal)
  end
  def get_response_queue_info_v1(ppqinforesponse : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinforesponse)
  end
  def putref_response_queue_info_v1(pqinforesponse : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo, HRESULT)).call(pqinforesponse)
  end
  def get_app_specific(plappspecific : Int32*) : HRESULT
    @lpVtbl.value.get_app_specific.unsafe_as(Proc(Int32*, HRESULT)).call(plappspecific)
  end
  def put_app_specific(lappspecific : Int32) : HRESULT
    @lpVtbl.value.put_app_specific.unsafe_as(Proc(Int32, HRESULT)).call(lappspecific)
  end
  def get_source_machine_guid(pbstrguidsrcmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_source_machine_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidsrcmachine)
  end
  def get_body_length(pcbbody : Int32*) : HRESULT
    @lpVtbl.value.get_body_length.unsafe_as(Proc(Int32*, HRESULT)).call(pcbbody)
  end
  def get_body(pvarbody : VARIANT*) : HRESULT
    @lpVtbl.value.get_body.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarbody)
  end
  def put_body(varbody : VARIANT) : HRESULT
    @lpVtbl.value.put_body.unsafe_as(Proc(VARIANT, HRESULT)).call(varbody)
  end
  def get_admin_queue_info_v1(ppqinfoadmin : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinfoadmin)
  end
  def putref_admin_queue_info_v1(pqinfoadmin : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo, HRESULT)).call(pqinfoadmin)
  end
  def get_id(pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmsgid)
  end
  def get_correlation_id(pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_correlation_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmsgid)
  end
  def put_correlation_id(varmsgid : VARIANT) : HRESULT
    @lpVtbl.value.put_correlation_id.unsafe_as(Proc(VARIANT, HRESULT)).call(varmsgid)
  end
  def get_ack(plack : Int32*) : HRESULT
    @lpVtbl.value.get_ack.unsafe_as(Proc(Int32*, HRESULT)).call(plack)
  end
  def put_ack(lack : Int32) : HRESULT
    @lpVtbl.value.put_ack.unsafe_as(Proc(Int32, HRESULT)).call(lack)
  end
  def get_label(pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrlabel)
  end
  def put_label(bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrlabel)
  end
  def get_max_time_to_reach_queue(plmaxtimetoreachqueue : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_reach_queue.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxtimetoreachqueue)
  end
  def put_max_time_to_reach_queue(lmaxtimetoreachqueue : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_reach_queue.unsafe_as(Proc(Int32, HRESULT)).call(lmaxtimetoreachqueue)
  end
  def get_max_time_to_receive(plmaxtimetoreceive : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_receive.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxtimetoreceive)
  end
  def put_max_time_to_receive(lmaxtimetoreceive : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_receive.unsafe_as(Proc(Int32, HRESULT)).call(lmaxtimetoreceive)
  end
  def get_hash_algorithm(plhashalg : Int32*) : HRESULT
    @lpVtbl.value.get_hash_algorithm.unsafe_as(Proc(Int32*, HRESULT)).call(plhashalg)
  end
  def put_hash_algorithm(lhashalg : Int32) : HRESULT
    @lpVtbl.value.put_hash_algorithm.unsafe_as(Proc(Int32, HRESULT)).call(lhashalg)
  end
  def get_encrypt_algorithm(plencryptalg : Int32*) : HRESULT
    @lpVtbl.value.get_encrypt_algorithm.unsafe_as(Proc(Int32*, HRESULT)).call(plencryptalg)
  end
  def put_encrypt_algorithm(lencryptalg : Int32) : HRESULT
    @lpVtbl.value.put_encrypt_algorithm.unsafe_as(Proc(Int32, HRESULT)).call(lencryptalg)
  end
  def get_sent_time(pvarsenttime : VARIANT*) : HRESULT
    @lpVtbl.value.get_sent_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsenttime)
  end
  def get_arrived_time(plarrivedtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_arrived_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(plarrivedtime)
  end
  def get_destination_queue_info(ppqinfodest : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_destination_queue_info.unsafe_as(Proc(IMSMQQueueInfo3*, HRESULT)).call(ppqinfodest)
  end
  def get_sender_certificate(pvarsendercert : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_certificate.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsendercert)
  end
  def put_sender_certificate(varsendercert : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_certificate.unsafe_as(Proc(VARIANT, HRESULT)).call(varsendercert)
  end
  def get_sender_id(pvarsenderid : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsenderid)
  end
  def get_sender_id_type(plsenderidtype : Int32*) : HRESULT
    @lpVtbl.value.get_sender_id_type.unsafe_as(Proc(Int32*, HRESULT)).call(plsenderidtype)
  end
  def put_sender_id_type(lsenderidtype : Int32) : HRESULT
    @lpVtbl.value.put_sender_id_type.unsafe_as(Proc(Int32, HRESULT)).call(lsenderidtype)
  end
  def send(destinationqueue : IDispatch, transaction : VARIANT*) : HRESULT
    @lpVtbl.value.send.unsafe_as(Proc(IDispatch, VARIANT*, HRESULT)).call(destinationqueue, transaction)
  end
  def attach_current_security_context : HRESULT
    @lpVtbl.value.attach_current_security_context.unsafe_as(Proc(HRESULT)).call
  end
  def get_sender_version(plsenderversion : Int32*) : HRESULT
    @lpVtbl.value.get_sender_version.unsafe_as(Proc(Int32*, HRESULT)).call(plsenderversion)
  end
  def get_extension(pvarextension : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarextension)
  end
  def put_extension(varextension : VARIANT) : HRESULT
    @lpVtbl.value.put_extension.unsafe_as(Proc(VARIANT, HRESULT)).call(varextension)
  end
  def get_connector_type_guid(pbstrguidconnectortype : UInt8**) : HRESULT
    @lpVtbl.value.get_connector_type_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidconnectortype)
  end
  def put_connector_type_guid(bstrguidconnectortype : UInt8*) : HRESULT
    @lpVtbl.value.put_connector_type_guid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrguidconnectortype)
  end
  def get_transaction_status_queue_info(ppqinfoxactstatus : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_transaction_status_queue_info.unsafe_as(Proc(IMSMQQueueInfo3*, HRESULT)).call(ppqinfoxactstatus)
  end
  def get_destination_symmetric_key(pvardestsymmkey : VARIANT*) : HRESULT
    @lpVtbl.value.get_destination_symmetric_key.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvardestsymmkey)
  end
  def put_destination_symmetric_key(vardestsymmkey : VARIANT) : HRESULT
    @lpVtbl.value.put_destination_symmetric_key.unsafe_as(Proc(VARIANT, HRESULT)).call(vardestsymmkey)
  end
  def get_signature(pvarsignature : VARIANT*) : HRESULT
    @lpVtbl.value.get_signature.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsignature)
  end
  def put_signature(varsignature : VARIANT) : HRESULT
    @lpVtbl.value.put_signature.unsafe_as(Proc(VARIANT, HRESULT)).call(varsignature)
  end
  def get_authentication_provider_type(plauthprovtype : Int32*) : HRESULT
    @lpVtbl.value.get_authentication_provider_type.unsafe_as(Proc(Int32*, HRESULT)).call(plauthprovtype)
  end
  def put_authentication_provider_type(lauthprovtype : Int32) : HRESULT
    @lpVtbl.value.put_authentication_provider_type.unsafe_as(Proc(Int32, HRESULT)).call(lauthprovtype)
  end
  def get_authentication_provider_name(pbstrauthprovname : UInt8**) : HRESULT
    @lpVtbl.value.get_authentication_provider_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrauthprovname)
  end
  def put_authentication_provider_name(bstrauthprovname : UInt8*) : HRESULT
    @lpVtbl.value.put_authentication_provider_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrauthprovname)
  end
  def put_sender_id(varsenderid : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_id.unsafe_as(Proc(VARIANT, HRESULT)).call(varsenderid)
  end
  def get_msg_class(plmsgclass : Int32*) : HRESULT
    @lpVtbl.value.get_msg_class.unsafe_as(Proc(Int32*, HRESULT)).call(plmsgclass)
  end
  def put_msg_class(lmsgclass : Int32) : HRESULT
    @lpVtbl.value.put_msg_class.unsafe_as(Proc(Int32, HRESULT)).call(lmsgclass)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_transaction_id(pvarxactid : VARIANT*) : HRESULT
    @lpVtbl.value.get_transaction_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarxactid)
  end
  def get_is_first_in_transaction(pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction.unsafe_as(Proc(Int16*, HRESULT)).call(pisfirstinxact)
  end
  def get_is_last_in_transaction(pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction.unsafe_as(Proc(Int16*, HRESULT)).call(pislastinxact)
  end
  def get_response_queue_info_v2(ppqinforesponse : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v2.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinforesponse)
  end
  def putref_response_queue_info_v2(pqinforesponse : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v2.unsafe_as(Proc(IMSMQQueueInfo2, HRESULT)).call(pqinforesponse)
  end
  def get_admin_queue_info_v2(ppqinfoadmin : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v2.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinfoadmin)
  end
  def putref_admin_queue_info_v2(pqinfoadmin : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v2.unsafe_as(Proc(IMSMQQueueInfo2, HRESULT)).call(pqinfoadmin)
  end
  def get_received_authentication_level(psreceivedauthenticationlevel : Int16*) : HRESULT
    @lpVtbl.value.get_received_authentication_level.unsafe_as(Proc(Int16*, HRESULT)).call(psreceivedauthenticationlevel)
  end
  def get_response_queue_info(ppqinforesponse : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_response_queue_info.unsafe_as(Proc(IMSMQQueueInfo3*, HRESULT)).call(ppqinforesponse)
  end
  def putref_response_queue_info(pqinforesponse : IMSMQQueueInfo3) : HRESULT
    @lpVtbl.value.putref_response_queue_info.unsafe_as(Proc(IMSMQQueueInfo3, HRESULT)).call(pqinforesponse)
  end
  def get_admin_queue_info(ppqinfoadmin : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_admin_queue_info.unsafe_as(Proc(IMSMQQueueInfo3*, HRESULT)).call(ppqinfoadmin)
  end
  def putref_admin_queue_info(pqinfoadmin : IMSMQQueueInfo3) : HRESULT
    @lpVtbl.value.putref_admin_queue_info.unsafe_as(Proc(IMSMQQueueInfo3, HRESULT)).call(pqinfoadmin)
  end
  def get_response_destination(ppdestresponse : IDispatch*) : HRESULT
    @lpVtbl.value.get_response_destination.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppdestresponse)
  end
  def putref_response_destination(pdestresponse : IDispatch) : HRESULT
    @lpVtbl.value.putref_response_destination.unsafe_as(Proc(IDispatch, HRESULT)).call(pdestresponse)
  end
  def get_destination(ppdestdestination : IDispatch*) : HRESULT
    @lpVtbl.value.get_destination.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppdestdestination)
  end
  def get_lookup_id(pvarlookupid : VARIANT*) : HRESULT
    @lpVtbl.value.get_lookup_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarlookupid)
  end
  def get_is_authenticated2(pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated2.unsafe_as(Proc(Int16*, HRESULT)).call(pisauthenticated)
  end
  def get_is_first_in_transaction2(pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction2.unsafe_as(Proc(Int16*, HRESULT)).call(pisfirstinxact)
  end
  def get_is_last_in_transaction2(pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction2.unsafe_as(Proc(Int16*, HRESULT)).call(pislastinxact)
  end
  def attach_current_security_context2 : HRESULT
    @lpVtbl.value.attach_current_security_context2.unsafe_as(Proc(HRESULT)).call
  end
  def get_soap_envelope(pbstrsoapenvelope : UInt8**) : HRESULT
    @lpVtbl.value.get_soap_envelope.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsoapenvelope)
  end
  def get_compound_message(pvarcompoundmessage : VARIANT*) : HRESULT
    @lpVtbl.value.get_compound_message.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarcompoundmessage)
  end
  def put_soap_header(bstrsoapheader : UInt8*) : HRESULT
    @lpVtbl.value.put_soap_header.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsoapheader)
  end
  def put_soap_body(bstrsoapbody : UInt8*) : HRESULT
    @lpVtbl.value.put_soap_body.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsoapbody)
  end
end
struct LibWin32::IMSMQMessage4
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
  def get_class(plclass : Int32*) : HRESULT
    @lpVtbl.value.get_class.unsafe_as(Proc(Int32*, HRESULT)).call(plclass)
  end
  def get_priv_level(plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.unsafe_as(Proc(Int32*, HRESULT)).call(plprivlevel)
  end
  def put_priv_level(lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.unsafe_as(Proc(Int32, HRESULT)).call(lprivlevel)
  end
  def get_auth_level(plauthlevel : Int32*) : HRESULT
    @lpVtbl.value.get_auth_level.unsafe_as(Proc(Int32*, HRESULT)).call(plauthlevel)
  end
  def put_auth_level(lauthlevel : Int32) : HRESULT
    @lpVtbl.value.put_auth_level.unsafe_as(Proc(Int32, HRESULT)).call(lauthlevel)
  end
  def get_is_authenticated(pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated.unsafe_as(Proc(Int16*, HRESULT)).call(pisauthenticated)
  end
  def get_delivery(pldelivery : Int32*) : HRESULT
    @lpVtbl.value.get_delivery.unsafe_as(Proc(Int32*, HRESULT)).call(pldelivery)
  end
  def put_delivery(ldelivery : Int32) : HRESULT
    @lpVtbl.value.put_delivery.unsafe_as(Proc(Int32, HRESULT)).call(ldelivery)
  end
  def get_trace(pltrace : Int32*) : HRESULT
    @lpVtbl.value.get_trace.unsafe_as(Proc(Int32*, HRESULT)).call(pltrace)
  end
  def put_trace(ltrace : Int32) : HRESULT
    @lpVtbl.value.put_trace.unsafe_as(Proc(Int32, HRESULT)).call(ltrace)
  end
  def get_priority(plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(plpriority)
  end
  def put_priority(lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(Int32, HRESULT)).call(lpriority)
  end
  def get_journal(pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.unsafe_as(Proc(Int32*, HRESULT)).call(pljournal)
  end
  def put_journal(ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.unsafe_as(Proc(Int32, HRESULT)).call(ljournal)
  end
  def get_response_queue_info_v1(ppqinforesponse : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinforesponse)
  end
  def putref_response_queue_info_v1(pqinforesponse : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo, HRESULT)).call(pqinforesponse)
  end
  def get_app_specific(plappspecific : Int32*) : HRESULT
    @lpVtbl.value.get_app_specific.unsafe_as(Proc(Int32*, HRESULT)).call(plappspecific)
  end
  def put_app_specific(lappspecific : Int32) : HRESULT
    @lpVtbl.value.put_app_specific.unsafe_as(Proc(Int32, HRESULT)).call(lappspecific)
  end
  def get_source_machine_guid(pbstrguidsrcmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_source_machine_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidsrcmachine)
  end
  def get_body_length(pcbbody : Int32*) : HRESULT
    @lpVtbl.value.get_body_length.unsafe_as(Proc(Int32*, HRESULT)).call(pcbbody)
  end
  def get_body(pvarbody : VARIANT*) : HRESULT
    @lpVtbl.value.get_body.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarbody)
  end
  def put_body(varbody : VARIANT) : HRESULT
    @lpVtbl.value.put_body.unsafe_as(Proc(VARIANT, HRESULT)).call(varbody)
  end
  def get_admin_queue_info_v1(ppqinfoadmin : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo*, HRESULT)).call(ppqinfoadmin)
  end
  def putref_admin_queue_info_v1(pqinfoadmin : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v1.unsafe_as(Proc(IMSMQQueueInfo, HRESULT)).call(pqinfoadmin)
  end
  def get_id(pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmsgid)
  end
  def get_correlation_id(pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_correlation_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarmsgid)
  end
  def put_correlation_id(varmsgid : VARIANT) : HRESULT
    @lpVtbl.value.put_correlation_id.unsafe_as(Proc(VARIANT, HRESULT)).call(varmsgid)
  end
  def get_ack(plack : Int32*) : HRESULT
    @lpVtbl.value.get_ack.unsafe_as(Proc(Int32*, HRESULT)).call(plack)
  end
  def put_ack(lack : Int32) : HRESULT
    @lpVtbl.value.put_ack.unsafe_as(Proc(Int32, HRESULT)).call(lack)
  end
  def get_label(pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrlabel)
  end
  def put_label(bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrlabel)
  end
  def get_max_time_to_reach_queue(plmaxtimetoreachqueue : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_reach_queue.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxtimetoreachqueue)
  end
  def put_max_time_to_reach_queue(lmaxtimetoreachqueue : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_reach_queue.unsafe_as(Proc(Int32, HRESULT)).call(lmaxtimetoreachqueue)
  end
  def get_max_time_to_receive(plmaxtimetoreceive : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_receive.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxtimetoreceive)
  end
  def put_max_time_to_receive(lmaxtimetoreceive : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_receive.unsafe_as(Proc(Int32, HRESULT)).call(lmaxtimetoreceive)
  end
  def get_hash_algorithm(plhashalg : Int32*) : HRESULT
    @lpVtbl.value.get_hash_algorithm.unsafe_as(Proc(Int32*, HRESULT)).call(plhashalg)
  end
  def put_hash_algorithm(lhashalg : Int32) : HRESULT
    @lpVtbl.value.put_hash_algorithm.unsafe_as(Proc(Int32, HRESULT)).call(lhashalg)
  end
  def get_encrypt_algorithm(plencryptalg : Int32*) : HRESULT
    @lpVtbl.value.get_encrypt_algorithm.unsafe_as(Proc(Int32*, HRESULT)).call(plencryptalg)
  end
  def put_encrypt_algorithm(lencryptalg : Int32) : HRESULT
    @lpVtbl.value.put_encrypt_algorithm.unsafe_as(Proc(Int32, HRESULT)).call(lencryptalg)
  end
  def get_sent_time(pvarsenttime : VARIANT*) : HRESULT
    @lpVtbl.value.get_sent_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsenttime)
  end
  def get_arrived_time(plarrivedtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_arrived_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(plarrivedtime)
  end
  def get_destination_queue_info(ppqinfodest : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_destination_queue_info.unsafe_as(Proc(IMSMQQueueInfo4*, HRESULT)).call(ppqinfodest)
  end
  def get_sender_certificate(pvarsendercert : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_certificate.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsendercert)
  end
  def put_sender_certificate(varsendercert : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_certificate.unsafe_as(Proc(VARIANT, HRESULT)).call(varsendercert)
  end
  def get_sender_id(pvarsenderid : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsenderid)
  end
  def get_sender_id_type(plsenderidtype : Int32*) : HRESULT
    @lpVtbl.value.get_sender_id_type.unsafe_as(Proc(Int32*, HRESULT)).call(plsenderidtype)
  end
  def put_sender_id_type(lsenderidtype : Int32) : HRESULT
    @lpVtbl.value.put_sender_id_type.unsafe_as(Proc(Int32, HRESULT)).call(lsenderidtype)
  end
  def send(destinationqueue : IDispatch, transaction : VARIANT*) : HRESULT
    @lpVtbl.value.send.unsafe_as(Proc(IDispatch, VARIANT*, HRESULT)).call(destinationqueue, transaction)
  end
  def attach_current_security_context : HRESULT
    @lpVtbl.value.attach_current_security_context.unsafe_as(Proc(HRESULT)).call
  end
  def get_sender_version(plsenderversion : Int32*) : HRESULT
    @lpVtbl.value.get_sender_version.unsafe_as(Proc(Int32*, HRESULT)).call(plsenderversion)
  end
  def get_extension(pvarextension : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarextension)
  end
  def put_extension(varextension : VARIANT) : HRESULT
    @lpVtbl.value.put_extension.unsafe_as(Proc(VARIANT, HRESULT)).call(varextension)
  end
  def get_connector_type_guid(pbstrguidconnectortype : UInt8**) : HRESULT
    @lpVtbl.value.get_connector_type_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguidconnectortype)
  end
  def put_connector_type_guid(bstrguidconnectortype : UInt8*) : HRESULT
    @lpVtbl.value.put_connector_type_guid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrguidconnectortype)
  end
  def get_transaction_status_queue_info(ppqinfoxactstatus : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_transaction_status_queue_info.unsafe_as(Proc(IMSMQQueueInfo4*, HRESULT)).call(ppqinfoxactstatus)
  end
  def get_destination_symmetric_key(pvardestsymmkey : VARIANT*) : HRESULT
    @lpVtbl.value.get_destination_symmetric_key.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvardestsymmkey)
  end
  def put_destination_symmetric_key(vardestsymmkey : VARIANT) : HRESULT
    @lpVtbl.value.put_destination_symmetric_key.unsafe_as(Proc(VARIANT, HRESULT)).call(vardestsymmkey)
  end
  def get_signature(pvarsignature : VARIANT*) : HRESULT
    @lpVtbl.value.get_signature.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarsignature)
  end
  def put_signature(varsignature : VARIANT) : HRESULT
    @lpVtbl.value.put_signature.unsafe_as(Proc(VARIANT, HRESULT)).call(varsignature)
  end
  def get_authentication_provider_type(plauthprovtype : Int32*) : HRESULT
    @lpVtbl.value.get_authentication_provider_type.unsafe_as(Proc(Int32*, HRESULT)).call(plauthprovtype)
  end
  def put_authentication_provider_type(lauthprovtype : Int32) : HRESULT
    @lpVtbl.value.put_authentication_provider_type.unsafe_as(Proc(Int32, HRESULT)).call(lauthprovtype)
  end
  def get_authentication_provider_name(pbstrauthprovname : UInt8**) : HRESULT
    @lpVtbl.value.get_authentication_provider_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrauthprovname)
  end
  def put_authentication_provider_name(bstrauthprovname : UInt8*) : HRESULT
    @lpVtbl.value.put_authentication_provider_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrauthprovname)
  end
  def put_sender_id(varsenderid : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_id.unsafe_as(Proc(VARIANT, HRESULT)).call(varsenderid)
  end
  def get_msg_class(plmsgclass : Int32*) : HRESULT
    @lpVtbl.value.get_msg_class.unsafe_as(Proc(Int32*, HRESULT)).call(plmsgclass)
  end
  def put_msg_class(lmsgclass : Int32) : HRESULT
    @lpVtbl.value.put_msg_class.unsafe_as(Proc(Int32, HRESULT)).call(lmsgclass)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_transaction_id(pvarxactid : VARIANT*) : HRESULT
    @lpVtbl.value.get_transaction_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarxactid)
  end
  def get_is_first_in_transaction(pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction.unsafe_as(Proc(Int16*, HRESULT)).call(pisfirstinxact)
  end
  def get_is_last_in_transaction(pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction.unsafe_as(Proc(Int16*, HRESULT)).call(pislastinxact)
  end
  def get_response_queue_info_v2(ppqinforesponse : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v2.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinforesponse)
  end
  def putref_response_queue_info_v2(pqinforesponse : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v2.unsafe_as(Proc(IMSMQQueueInfo2, HRESULT)).call(pqinforesponse)
  end
  def get_admin_queue_info_v2(ppqinfoadmin : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v2.unsafe_as(Proc(IMSMQQueueInfo2*, HRESULT)).call(ppqinfoadmin)
  end
  def putref_admin_queue_info_v2(pqinfoadmin : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v2.unsafe_as(Proc(IMSMQQueueInfo2, HRESULT)).call(pqinfoadmin)
  end
  def get_received_authentication_level(psreceivedauthenticationlevel : Int16*) : HRESULT
    @lpVtbl.value.get_received_authentication_level.unsafe_as(Proc(Int16*, HRESULT)).call(psreceivedauthenticationlevel)
  end
  def get_response_queue_info(ppqinforesponse : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_response_queue_info.unsafe_as(Proc(IMSMQQueueInfo4*, HRESULT)).call(ppqinforesponse)
  end
  def putref_response_queue_info(pqinforesponse : IMSMQQueueInfo4) : HRESULT
    @lpVtbl.value.putref_response_queue_info.unsafe_as(Proc(IMSMQQueueInfo4, HRESULT)).call(pqinforesponse)
  end
  def get_admin_queue_info(ppqinfoadmin : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_admin_queue_info.unsafe_as(Proc(IMSMQQueueInfo4*, HRESULT)).call(ppqinfoadmin)
  end
  def putref_admin_queue_info(pqinfoadmin : IMSMQQueueInfo4) : HRESULT
    @lpVtbl.value.putref_admin_queue_info.unsafe_as(Proc(IMSMQQueueInfo4, HRESULT)).call(pqinfoadmin)
  end
  def get_response_destination(ppdestresponse : IDispatch*) : HRESULT
    @lpVtbl.value.get_response_destination.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppdestresponse)
  end
  def putref_response_destination(pdestresponse : IDispatch) : HRESULT
    @lpVtbl.value.putref_response_destination.unsafe_as(Proc(IDispatch, HRESULT)).call(pdestresponse)
  end
  def get_destination(ppdestdestination : IDispatch*) : HRESULT
    @lpVtbl.value.get_destination.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppdestdestination)
  end
  def get_lookup_id(pvarlookupid : VARIANT*) : HRESULT
    @lpVtbl.value.get_lookup_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarlookupid)
  end
  def get_is_authenticated2(pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated2.unsafe_as(Proc(Int16*, HRESULT)).call(pisauthenticated)
  end
  def get_is_first_in_transaction2(pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction2.unsafe_as(Proc(Int16*, HRESULT)).call(pisfirstinxact)
  end
  def get_is_last_in_transaction2(pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction2.unsafe_as(Proc(Int16*, HRESULT)).call(pislastinxact)
  end
  def attach_current_security_context2 : HRESULT
    @lpVtbl.value.attach_current_security_context2.unsafe_as(Proc(HRESULT)).call
  end
  def get_soap_envelope(pbstrsoapenvelope : UInt8**) : HRESULT
    @lpVtbl.value.get_soap_envelope.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsoapenvelope)
  end
  def get_compound_message(pvarcompoundmessage : VARIANT*) : HRESULT
    @lpVtbl.value.get_compound_message.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarcompoundmessage)
  end
  def put_soap_header(bstrsoapheader : UInt8*) : HRESULT
    @lpVtbl.value.put_soap_header.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsoapheader)
  end
  def put_soap_body(bstrsoapbody : UInt8*) : HRESULT
    @lpVtbl.value.put_soap_body.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsoapbody)
  end
end
struct LibWin32::IMSMQPrivateEvent
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
  def get_hwnd(phwnd : Int32*) : HRESULT
    @lpVtbl.value.get_hwnd.unsafe_as(Proc(Int32*, HRESULT)).call(phwnd)
  end
  def fire_arrived_event(pq : IMSMQQueue, msgcursor : Int32) : HRESULT
    @lpVtbl.value.fire_arrived_event.unsafe_as(Proc(IMSMQQueue, Int32, HRESULT)).call(pq, msgcursor)
  end
  def fire_arrived_error_event(pq : IMSMQQueue, hrstatus : HRESULT, msgcursor : Int32) : HRESULT
    @lpVtbl.value.fire_arrived_error_event.unsafe_as(Proc(IMSMQQueue, HRESULT, Int32, HRESULT)).call(pq, hrstatus, msgcursor)
  end
end
struct LibWin32::IDMSMQEventEvents
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
struct LibWin32::IMSMQTransaction2
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
  def get_transaction(pltransaction : Int32*) : HRESULT
    @lpVtbl.value.get_transaction.unsafe_as(Proc(Int32*, HRESULT)).call(pltransaction)
  end
  def commit(fretaining : VARIANT*, grftc : VARIANT*, grfrm : VARIANT*) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, HRESULT)).call(fretaining, grftc, grfrm)
  end
  def abort(fretaining : VARIANT*, fasync : VARIANT*) : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(fretaining, fasync)
  end
  def init_new(vartransaction : VARIANT) : HRESULT
    @lpVtbl.value.init_new.unsafe_as(Proc(VARIANT, HRESULT)).call(vartransaction)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQTransaction3
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
  def get_transaction(pltransaction : Int32*) : HRESULT
    @lpVtbl.value.get_transaction.unsafe_as(Proc(Int32*, HRESULT)).call(pltransaction)
  end
  def commit(fretaining : VARIANT*, grftc : VARIANT*, grfrm : VARIANT*) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, HRESULT)).call(fretaining, grftc, grfrm)
  end
  def abort(fretaining : VARIANT*, fasync : VARIANT*) : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(fretaining, fasync)
  end
  def init_new(vartransaction : VARIANT) : HRESULT
    @lpVtbl.value.init_new.unsafe_as(Proc(VARIANT, HRESULT)).call(vartransaction)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_i_transaction(pvaritransaction : VARIANT*) : HRESULT
    @lpVtbl.value.get_i_transaction.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvaritransaction)
  end
end
struct LibWin32::IMSMQCoordinatedTransactionDispenser2
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
  def begin_transaction(ptransaction : IMSMQTransaction2*) : HRESULT
    @lpVtbl.value.begin_transaction.unsafe_as(Proc(IMSMQTransaction2*, HRESULT)).call(ptransaction)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQCoordinatedTransactionDispenser3
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
  def begin_transaction(ptransaction : IMSMQTransaction3*) : HRESULT
    @lpVtbl.value.begin_transaction.unsafe_as(Proc(IMSMQTransaction3*, HRESULT)).call(ptransaction)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQTransactionDispenser2
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
  def begin_transaction(ptransaction : IMSMQTransaction2*) : HRESULT
    @lpVtbl.value.begin_transaction.unsafe_as(Proc(IMSMQTransaction2*, HRESULT)).call(ptransaction)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQTransactionDispenser3
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
  def begin_transaction(ptransaction : IMSMQTransaction3*) : HRESULT
    @lpVtbl.value.begin_transaction.unsafe_as(Proc(IMSMQTransaction3*, HRESULT)).call(ptransaction)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQApplication
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
  def machine_id_of_machine_name(machinename : UInt8*, pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.machine_id_of_machine_name.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(machinename, pbstrguid)
  end
end
struct LibWin32::IMSMQApplication2
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
  def machine_id_of_machine_name(machinename : UInt8*, pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.machine_id_of_machine_name.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(machinename, pbstrguid)
  end
  def register_certificate(flags : VARIANT*, externalcertificate : VARIANT*) : HRESULT
    @lpVtbl.value.register_certificate.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(flags, externalcertificate)
  end
  def machine_name_of_machine_id(bstrguid : UInt8*, pbstrmachinename : UInt8**) : HRESULT
    @lpVtbl.value.machine_name_of_machine_id.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(bstrguid, pbstrmachinename)
  end
  def get_msmq_version_major(psmsmqversionmajor : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_major.unsafe_as(Proc(Int16*, HRESULT)).call(psmsmqversionmajor)
  end
  def get_msmq_version_minor(psmsmqversionminor : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_minor.unsafe_as(Proc(Int16*, HRESULT)).call(psmsmqversionminor)
  end
  def get_msmq_version_build(psmsmqversionbuild : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_build.unsafe_as(Proc(Int16*, HRESULT)).call(psmsmqversionbuild)
  end
  def get_is_ds_enabled(pfisdsenabled : Int16*) : HRESULT
    @lpVtbl.value.get_is_ds_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pfisdsenabled)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQApplication3
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
  def machine_id_of_machine_name(machinename : UInt8*, pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.machine_id_of_machine_name.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(machinename, pbstrguid)
  end
  def register_certificate(flags : VARIANT*, externalcertificate : VARIANT*) : HRESULT
    @lpVtbl.value.register_certificate.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(flags, externalcertificate)
  end
  def machine_name_of_machine_id(bstrguid : UInt8*, pbstrmachinename : UInt8**) : HRESULT
    @lpVtbl.value.machine_name_of_machine_id.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(bstrguid, pbstrmachinename)
  end
  def get_msmq_version_major(psmsmqversionmajor : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_major.unsafe_as(Proc(Int16*, HRESULT)).call(psmsmqversionmajor)
  end
  def get_msmq_version_minor(psmsmqversionminor : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_minor.unsafe_as(Proc(Int16*, HRESULT)).call(psmsmqversionminor)
  end
  def get_msmq_version_build(psmsmqversionbuild : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_build.unsafe_as(Proc(Int16*, HRESULT)).call(psmsmqversionbuild)
  end
  def get_is_ds_enabled(pfisdsenabled : Int16*) : HRESULT
    @lpVtbl.value.get_is_ds_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pfisdsenabled)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
  def get_active_queues(pvactivequeues : VARIANT*) : HRESULT
    @lpVtbl.value.get_active_queues.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvactivequeues)
  end
  def get_private_queues(pvprivatequeues : VARIANT*) : HRESULT
    @lpVtbl.value.get_private_queues.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvprivatequeues)
  end
  def get_directory_service_server(pbstrdirectoryserviceserver : UInt8**) : HRESULT
    @lpVtbl.value.get_directory_service_server.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdirectoryserviceserver)
  end
  def get_is_connected(pfisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected.unsafe_as(Proc(Int16*, HRESULT)).call(pfisconnected)
  end
  def get_bytes_in_all_queues(pvbytesinallqueues : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_all_queues.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvbytesinallqueues)
  end
  def put_machine(bstrmachine : UInt8*) : HRESULT
    @lpVtbl.value.put_machine.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrmachine)
  end
  def get_machine(pbstrmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_machine.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmachine)
  end
  def connect : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(HRESULT)).call
  end
  def disconnect : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(HRESULT)).call
  end
  def tidy : HRESULT
    @lpVtbl.value.tidy.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IMSMQDestination
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
  def open : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(HRESULT)).call
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def get_is_open(pfisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.unsafe_as(Proc(Int16*, HRESULT)).call(pfisopen)
  end
  def get_ia_ds(ppiads : IDispatch*) : HRESULT
    @lpVtbl.value.get_ia_ds.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppiads)
  end
  def putref_ia_ds(piads : IDispatch) : HRESULT
    @lpVtbl.value.putref_ia_ds.unsafe_as(Proc(IDispatch, HRESULT)).call(piads)
  end
  def get_a_ds_path(pbstradspath : UInt8**) : HRESULT
    @lpVtbl.value.get_a_ds_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstradspath)
  end
  def put_a_ds_path(bstradspath : UInt8*) : HRESULT
    @lpVtbl.value.put_a_ds_path.unsafe_as(Proc(UInt8*, HRESULT)).call(bstradspath)
  end
  def get_path_name(pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathname)
  end
  def put_path_name(bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpathname)
  end
  def get_format_name(pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrformatname)
  end
  def put_format_name(bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrformatname)
  end
  def get_destinations(ppdestinations : IDispatch*) : HRESULT
    @lpVtbl.value.get_destinations.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppdestinations)
  end
  def putref_destinations(pdestinations : IDispatch) : HRESULT
    @lpVtbl.value.putref_destinations.unsafe_as(Proc(IDispatch, HRESULT)).call(pdestinations)
  end
  def get_properties(ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcolproperties)
  end
end
struct LibWin32::IMSMQPrivateDestination
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
  def get_handle(pvarhandle : VARIANT*) : HRESULT
    @lpVtbl.value.get_handle.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarhandle)
  end
  def put_handle(varhandle : VARIANT) : HRESULT
    @lpVtbl.value.put_handle.unsafe_as(Proc(VARIANT, HRESULT)).call(varhandle)
  end
end
struct LibWin32::IMSMQCollection
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
  def item(index : VARIANT*, pvarret : VARIANT*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(VARIANT*, VARIANT*, HRESULT)).call(index, pvarret)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def _new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value._new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
end
struct LibWin32::IMSMQManagement
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
  def init(machine : VARIANT*, pathname : VARIANT*, formatname : VARIANT*) : HRESULT
    @lpVtbl.value.init.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, HRESULT)).call(machine, pathname, formatname)
  end
  def get_format_name(pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrformatname)
  end
  def get_machine(pbstrmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_machine.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmachine)
  end
  def get_message_count(plmessagecount : Int32*) : HRESULT
    @lpVtbl.value.get_message_count.unsafe_as(Proc(Int32*, HRESULT)).call(plmessagecount)
  end
  def get_foreign_status(plforeignstatus : Int32*) : HRESULT
    @lpVtbl.value.get_foreign_status.unsafe_as(Proc(Int32*, HRESULT)).call(plforeignstatus)
  end
  def get_queue_type(plqueuetype : Int32*) : HRESULT
    @lpVtbl.value.get_queue_type.unsafe_as(Proc(Int32*, HRESULT)).call(plqueuetype)
  end
  def get_is_local(pfislocal : Int16*) : HRESULT
    @lpVtbl.value.get_is_local.unsafe_as(Proc(Int16*, HRESULT)).call(pfislocal)
  end
  def get_transactional_status(pltransactionalstatus : Int32*) : HRESULT
    @lpVtbl.value.get_transactional_status.unsafe_as(Proc(Int32*, HRESULT)).call(pltransactionalstatus)
  end
  def get_bytes_in_queue(pvbytesinqueue : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_queue.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvbytesinqueue)
  end
end
struct LibWin32::IMSMQOutgoingQueueManagement
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
  def init(machine : VARIANT*, pathname : VARIANT*, formatname : VARIANT*) : HRESULT
    @lpVtbl.value.init.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, HRESULT)).call(machine, pathname, formatname)
  end
  def get_format_name(pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrformatname)
  end
  def get_machine(pbstrmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_machine.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmachine)
  end
  def get_message_count(plmessagecount : Int32*) : HRESULT
    @lpVtbl.value.get_message_count.unsafe_as(Proc(Int32*, HRESULT)).call(plmessagecount)
  end
  def get_foreign_status(plforeignstatus : Int32*) : HRESULT
    @lpVtbl.value.get_foreign_status.unsafe_as(Proc(Int32*, HRESULT)).call(plforeignstatus)
  end
  def get_queue_type(plqueuetype : Int32*) : HRESULT
    @lpVtbl.value.get_queue_type.unsafe_as(Proc(Int32*, HRESULT)).call(plqueuetype)
  end
  def get_is_local(pfislocal : Int16*) : HRESULT
    @lpVtbl.value.get_is_local.unsafe_as(Proc(Int16*, HRESULT)).call(pfislocal)
  end
  def get_transactional_status(pltransactionalstatus : Int32*) : HRESULT
    @lpVtbl.value.get_transactional_status.unsafe_as(Proc(Int32*, HRESULT)).call(pltransactionalstatus)
  end
  def get_bytes_in_queue(pvbytesinqueue : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_queue.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvbytesinqueue)
  end
  def get_state(plstate : Int32*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(Int32*, HRESULT)).call(plstate)
  end
  def get_next_hops(pvnexthops : VARIANT*) : HRESULT
    @lpVtbl.value.get_next_hops.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvnexthops)
  end
  def eod_get_send_info(ppcollection : IMSMQCollection*) : HRESULT
    @lpVtbl.value.eod_get_send_info.unsafe_as(Proc(IMSMQCollection*, HRESULT)).call(ppcollection)
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def eod_resend : HRESULT
    @lpVtbl.value.eod_resend.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IMSMQQueueManagement
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
  def init(machine : VARIANT*, pathname : VARIANT*, formatname : VARIANT*) : HRESULT
    @lpVtbl.value.init.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, HRESULT)).call(machine, pathname, formatname)
  end
  def get_format_name(pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrformatname)
  end
  def get_machine(pbstrmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_machine.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmachine)
  end
  def get_message_count(plmessagecount : Int32*) : HRESULT
    @lpVtbl.value.get_message_count.unsafe_as(Proc(Int32*, HRESULT)).call(plmessagecount)
  end
  def get_foreign_status(plforeignstatus : Int32*) : HRESULT
    @lpVtbl.value.get_foreign_status.unsafe_as(Proc(Int32*, HRESULT)).call(plforeignstatus)
  end
  def get_queue_type(plqueuetype : Int32*) : HRESULT
    @lpVtbl.value.get_queue_type.unsafe_as(Proc(Int32*, HRESULT)).call(plqueuetype)
  end
  def get_is_local(pfislocal : Int16*) : HRESULT
    @lpVtbl.value.get_is_local.unsafe_as(Proc(Int16*, HRESULT)).call(pfislocal)
  end
  def get_transactional_status(pltransactionalstatus : Int32*) : HRESULT
    @lpVtbl.value.get_transactional_status.unsafe_as(Proc(Int32*, HRESULT)).call(pltransactionalstatus)
  end
  def get_bytes_in_queue(pvbytesinqueue : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_queue.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvbytesinqueue)
  end
  def get_journal_message_count(pljournalmessagecount : Int32*) : HRESULT
    @lpVtbl.value.get_journal_message_count.unsafe_as(Proc(Int32*, HRESULT)).call(pljournalmessagecount)
  end
  def get_bytes_in_journal(pvbytesinjournal : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_journal.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvbytesinjournal)
  end
  def eod_get_receive_info(pvcollection : VARIANT*) : HRESULT
    @lpVtbl.value.eod_get_receive_info.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvcollection)
  end
end
