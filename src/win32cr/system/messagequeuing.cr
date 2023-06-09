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
    query_interface : Proc(IMSMQQuery*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMSMQQuery*, UInt32)
    release : Proc(IMSMQQuery*, UInt32)
    get_type_info_count : Proc(IMSMQQuery*, UInt32*, HRESULT)
    get_type_info : Proc(IMSMQQuery*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMSMQQuery*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMSMQQuery*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    lookup_queue : Proc(IMSMQQuery*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IMSMQQueueInfos*, HRESULT)
  end

  IMSMQQuery_GUID = "d7d6e072-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQQuery = LibC::GUID.new(0xd7d6e072_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQQueueInfo_GUID = "d7d6e07b-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQQueueInfo = LibC::GUID.new(0xd7d6e07b_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQQueueInfo2_GUID = "fd174a80-89cf-11d2-b0f2-00e02c074f6b"
  IID_IMSMQQueueInfo2 = LibC::GUID.new(0xfd174a80_u32, 0x89cf_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xf2_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQQueueInfo3_GUID = "eba96b1d-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfo3 = LibC::GUID.new(0xeba96b1d_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQQueueInfo4_GUID = "eba96b21-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfo4 = LibC::GUID.new(0xeba96b21_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQQueue_GUID = "d7d6e076-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQQueue = LibC::GUID.new(0xd7d6e076_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQQueue2_GUID = "ef0574e0-06d8-11d3-b100-00e02c074f6b"
  IID_IMSMQQueue2 = LibC::GUID.new(0xef0574e0_u32, 0x6d8_u16, 0x11d3_u16, StaticArray[0xb1_u8, 0x0_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQQueue3_GUID = "eba96b1b-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueue3 = LibC::GUID.new(0xeba96b1b_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQQueue4_GUID = "eba96b20-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueue4 = LibC::GUID.new(0xeba96b20_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQMessage_GUID = "d7d6e074-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQMessage = LibC::GUID.new(0xd7d6e074_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQQueueInfos_GUID = "d7d6e07d-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQQueueInfos = LibC::GUID.new(0xd7d6e07d_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQQueueInfos2_GUID = "eba96b0f-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfos2 = LibC::GUID.new(0xeba96b0f_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQQueueInfos3_GUID = "eba96b1e-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfos3 = LibC::GUID.new(0xeba96b1e_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQQueueInfos4_GUID = "eba96b22-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQueueInfos4 = LibC::GUID.new(0xeba96b22_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQEvent_GUID = "d7d6e077-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQEvent = LibC::GUID.new(0xd7d6e077_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQEvent2_GUID = "eba96b12-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQEvent2 = LibC::GUID.new(0xeba96b12_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQEvent3_GUID = "eba96b1c-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQEvent3 = LibC::GUID.new(0xeba96b1c_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQTransaction_GUID = "d7d6e07f-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQTransaction = LibC::GUID.new(0xd7d6e07f_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQCoordinatedTransactionDispenser_GUID = "d7d6e081-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQCoordinatedTransactionDispenser = LibC::GUID.new(0xd7d6e081_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQTransactionDispenser_GUID = "d7d6e083-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQTransactionDispenser = LibC::GUID.new(0xd7d6e083_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQQuery2_GUID = "eba96b0e-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQuery2 = LibC::GUID.new(0xeba96b0e_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQQuery3_GUID = "eba96b19-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQuery3 = LibC::GUID.new(0xeba96b19_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQQuery4_GUID = "eba96b24-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQQuery4 = LibC::GUID.new(0xeba96b24_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQMessage2_GUID = "d9933be0-a567-11d2-b0f3-00e02c074f6b"
  IID_IMSMQMessage2 = LibC::GUID.new(0xd9933be0_u32, 0xa567_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xf3_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQMessage3_GUID = "eba96b1a-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQMessage3 = LibC::GUID.new(0xeba96b1a_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQMessage4_GUID = "eba96b23-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQMessage4 = LibC::GUID.new(0xeba96b23_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQPrivateEvent_GUID = "d7ab3341-c9d3-11d1-bb47-0080c7c5a2c0"
  IID_IMSMQPrivateEvent = LibC::GUID.new(0xd7ab3341_u32, 0xc9d3_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0x47_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xc5_u8, 0xa2_u8, 0xc0_u8])
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

  IDMSMQEventEvents_GUID = "d7d6e078-dccd-11d0-aa4b-0060970debae"
  IID_IDMSMQEventEvents = LibC::GUID.new(0xd7d6e078_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQTransaction2_GUID = "2ce0c5b0-6e67-11d2-b0e6-00e02c074f6b"
  IID_IMSMQTransaction2 = LibC::GUID.new(0x2ce0c5b0_u32, 0x6e67_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xe6_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQTransaction3_GUID = "eba96b13-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQTransaction3 = LibC::GUID.new(0xeba96b13_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQCoordinatedTransactionDispenser2_GUID = "eba96b10-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQCoordinatedTransactionDispenser2 = LibC::GUID.new(0xeba96b10_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQCoordinatedTransactionDispenser3_GUID = "eba96b14-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQCoordinatedTransactionDispenser3 = LibC::GUID.new(0xeba96b14_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQTransactionDispenser2_GUID = "eba96b11-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQTransactionDispenser2 = LibC::GUID.new(0xeba96b11_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQTransactionDispenser3_GUID = "eba96b15-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQTransactionDispenser3 = LibC::GUID.new(0xeba96b15_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQApplication_GUID = "d7d6e085-dccd-11d0-aa4b-0060970debae"
  IID_IMSMQApplication = LibC::GUID.new(0xd7d6e085_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
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

  IMSMQApplication2_GUID = "12a30900-7300-11d2-b0e6-00e02c074f6b"
  IID_IMSMQApplication2 = LibC::GUID.new(0x12a30900_u32, 0x7300_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xe6_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQApplication3_GUID = "eba96b1f-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQApplication3 = LibC::GUID.new(0xeba96b1f_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQDestination_GUID = "eba96b16-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQDestination = LibC::GUID.new(0xeba96b16_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQPrivateDestination_GUID = "eba96b17-2168-11d3-898c-00e02c074f6b"
  IID_IMSMQPrivateDestination = LibC::GUID.new(0xeba96b17_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
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

  IMSMQCollection_GUID = "0188ac2f-ecb3-4173-9779-635ca2039c72"
  IID_IMSMQCollection = LibC::GUID.new(0x188ac2f_u32, 0xecb3_u16, 0x4173_u16, StaticArray[0x97_u8, 0x79_u8, 0x63_u8, 0x5c_u8, 0xa2_u8, 0x3_u8, 0x9c_u8, 0x72_u8])
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

  IMSMQManagement_GUID = "be5f0241-e489-4957-8cc4-a452fcf3e23e"
  IID_IMSMQManagement = LibC::GUID.new(0xbe5f0241_u32, 0xe489_u16, 0x4957_u16, StaticArray[0x8c_u8, 0xc4_u8, 0xa4_u8, 0x52_u8, 0xfc_u8, 0xf3_u8, 0xe2_u8, 0x3e_u8])
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

  IMSMQOutgoingQueueManagement_GUID = "64c478fb-f9b0-4695-8a7f-439ac94326d3"
  IID_IMSMQOutgoingQueueManagement = LibC::GUID.new(0x64c478fb_u32, 0xf9b0_u16, 0x4695_u16, StaticArray[0x8a_u8, 0x7f_u8, 0x43_u8, 0x9a_u8, 0xc9_u8, 0x43_u8, 0x26_u8, 0xd3_u8])
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

  IMSMQQueueManagement_GUID = "7fbe7759-5760-444d-b8a5-5e7ab9a84cce"
  IID_IMSMQQueueManagement = LibC::GUID.new(0x7fbe7759_u32, 0x5760_u16, 0x444d_u16, StaticArray[0xb8_u8, 0xa5_u8, 0x5e_u8, 0x7a_u8, 0xb9_u8, 0xa8_u8, 0x4c_u8, 0xce_u8])
  struct IMSMQQueueManagement
    lpVtbl : IMSMQQueueManagementVTbl*
  end

end
struct LibWin32::IMSMQQuery
  def query_interface(this : IMSMQQuery*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQuery*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQuery*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQuery*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQuery*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQuery*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQuery*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def lookup_queue(this : IMSMQQuery*, queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, ppqinfos : IMSMQQueueInfos*) : HRESULT
    @lpVtbl.value.lookup_queue.call(this, queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, ppqinfos)
  end
end
struct LibWin32::IMSMQQueueInfo
  def query_interface(this : IMSMQQueueInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueueInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueueInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueueInfo*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueueInfo*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueueInfo*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueueInfo*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_queue_guid(this : IMSMQQueueInfo*, pbstrguidqueue : UInt8**) : HRESULT
    @lpVtbl.value.get_queue_guid.call(this, pbstrguidqueue)
  end
  def get_service_type_guid(this : IMSMQQueueInfo*, pbstrguidservicetype : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_guid.call(this, pbstrguidservicetype)
  end
  def put_service_type_guid(this : IMSMQQueueInfo*, bstrguidservicetype : UInt8*) : HRESULT
    @lpVtbl.value.put_service_type_guid.call(this, bstrguidservicetype)
  end
  def get_label(this : IMSMQQueueInfo*, pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.call(this, pbstrlabel)
  end
  def put_label(this : IMSMQQueueInfo*, bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.call(this, bstrlabel)
  end
  def get_path_name(this : IMSMQQueueInfo*, pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.call(this, pbstrpathname)
  end
  def put_path_name(this : IMSMQQueueInfo*, bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.call(this, bstrpathname)
  end
  def get_format_name(this : IMSMQQueueInfo*, pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.call(this, pbstrformatname)
  end
  def put_format_name(this : IMSMQQueueInfo*, bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.call(this, bstrformatname)
  end
  def get_is_transactional(this : IMSMQQueueInfo*, pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional.call(this, pistransactional)
  end
  def get_priv_level(this : IMSMQQueueInfo*, plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.call(this, plprivlevel)
  end
  def put_priv_level(this : IMSMQQueueInfo*, lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.call(this, lprivlevel)
  end
  def get_journal(this : IMSMQQueueInfo*, pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.call(this, pljournal)
  end
  def put_journal(this : IMSMQQueueInfo*, ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.call(this, ljournal)
  end
  def get_quota(this : IMSMQQueueInfo*, plquota : Int32*) : HRESULT
    @lpVtbl.value.get_quota.call(this, plquota)
  end
  def put_quota(this : IMSMQQueueInfo*, lquota : Int32) : HRESULT
    @lpVtbl.value.put_quota.call(this, lquota)
  end
  def get_base_priority(this : IMSMQQueueInfo*, plbasepriority : Int32*) : HRESULT
    @lpVtbl.value.get_base_priority.call(this, plbasepriority)
  end
  def put_base_priority(this : IMSMQQueueInfo*, lbasepriority : Int32) : HRESULT
    @lpVtbl.value.put_base_priority.call(this, lbasepriority)
  end
  def get_create_time(this : IMSMQQueueInfo*, pvarcreatetime : VARIANT*) : HRESULT
    @lpVtbl.value.get_create_time.call(this, pvarcreatetime)
  end
  def get_modify_time(this : IMSMQQueueInfo*, pvarmodifytime : VARIANT*) : HRESULT
    @lpVtbl.value.get_modify_time.call(this, pvarmodifytime)
  end
  def get_authenticate(this : IMSMQQueueInfo*, plauthenticate : Int32*) : HRESULT
    @lpVtbl.value.get_authenticate.call(this, plauthenticate)
  end
  def put_authenticate(this : IMSMQQueueInfo*, lauthenticate : Int32) : HRESULT
    @lpVtbl.value.put_authenticate.call(this, lauthenticate)
  end
  def get_journal_quota(this : IMSMQQueueInfo*, pljournalquota : Int32*) : HRESULT
    @lpVtbl.value.get_journal_quota.call(this, pljournalquota)
  end
  def put_journal_quota(this : IMSMQQueueInfo*, ljournalquota : Int32) : HRESULT
    @lpVtbl.value.put_journal_quota.call(this, ljournalquota)
  end
  def get_is_world_readable(this : IMSMQQueueInfo*, pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable.call(this, pisworldreadable)
  end
  def create(this : IMSMQQueueInfo*, istransactional : VARIANT*, isworldreadable : VARIANT*) : HRESULT
    @lpVtbl.value.create.call(this, istransactional, isworldreadable)
  end
  def delete(this : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def open(this : IMSMQQueueInfo*, access : Int32, sharemode : Int32, ppq : IMSMQQueue*) : HRESULT
    @lpVtbl.value.open.call(this, access, sharemode, ppq)
  end
  def refresh(this : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def update(this : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.update.call(this)
  end
end
struct LibWin32::IMSMQQueueInfo2
  def query_interface(this : IMSMQQueueInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueueInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueueInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueueInfo2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueueInfo2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueueInfo2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueueInfo2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_queue_guid(this : IMSMQQueueInfo2*, pbstrguidqueue : UInt8**) : HRESULT
    @lpVtbl.value.get_queue_guid.call(this, pbstrguidqueue)
  end
  def get_service_type_guid(this : IMSMQQueueInfo2*, pbstrguidservicetype : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_guid.call(this, pbstrguidservicetype)
  end
  def put_service_type_guid(this : IMSMQQueueInfo2*, bstrguidservicetype : UInt8*) : HRESULT
    @lpVtbl.value.put_service_type_guid.call(this, bstrguidservicetype)
  end
  def get_label(this : IMSMQQueueInfo2*, pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.call(this, pbstrlabel)
  end
  def put_label(this : IMSMQQueueInfo2*, bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.call(this, bstrlabel)
  end
  def get_path_name(this : IMSMQQueueInfo2*, pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.call(this, pbstrpathname)
  end
  def put_path_name(this : IMSMQQueueInfo2*, bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.call(this, bstrpathname)
  end
  def get_format_name(this : IMSMQQueueInfo2*, pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.call(this, pbstrformatname)
  end
  def put_format_name(this : IMSMQQueueInfo2*, bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.call(this, bstrformatname)
  end
  def get_is_transactional(this : IMSMQQueueInfo2*, pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional.call(this, pistransactional)
  end
  def get_priv_level(this : IMSMQQueueInfo2*, plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.call(this, plprivlevel)
  end
  def put_priv_level(this : IMSMQQueueInfo2*, lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.call(this, lprivlevel)
  end
  def get_journal(this : IMSMQQueueInfo2*, pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.call(this, pljournal)
  end
  def put_journal(this : IMSMQQueueInfo2*, ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.call(this, ljournal)
  end
  def get_quota(this : IMSMQQueueInfo2*, plquota : Int32*) : HRESULT
    @lpVtbl.value.get_quota.call(this, plquota)
  end
  def put_quota(this : IMSMQQueueInfo2*, lquota : Int32) : HRESULT
    @lpVtbl.value.put_quota.call(this, lquota)
  end
  def get_base_priority(this : IMSMQQueueInfo2*, plbasepriority : Int32*) : HRESULT
    @lpVtbl.value.get_base_priority.call(this, plbasepriority)
  end
  def put_base_priority(this : IMSMQQueueInfo2*, lbasepriority : Int32) : HRESULT
    @lpVtbl.value.put_base_priority.call(this, lbasepriority)
  end
  def get_create_time(this : IMSMQQueueInfo2*, pvarcreatetime : VARIANT*) : HRESULT
    @lpVtbl.value.get_create_time.call(this, pvarcreatetime)
  end
  def get_modify_time(this : IMSMQQueueInfo2*, pvarmodifytime : VARIANT*) : HRESULT
    @lpVtbl.value.get_modify_time.call(this, pvarmodifytime)
  end
  def get_authenticate(this : IMSMQQueueInfo2*, plauthenticate : Int32*) : HRESULT
    @lpVtbl.value.get_authenticate.call(this, plauthenticate)
  end
  def put_authenticate(this : IMSMQQueueInfo2*, lauthenticate : Int32) : HRESULT
    @lpVtbl.value.put_authenticate.call(this, lauthenticate)
  end
  def get_journal_quota(this : IMSMQQueueInfo2*, pljournalquota : Int32*) : HRESULT
    @lpVtbl.value.get_journal_quota.call(this, pljournalquota)
  end
  def put_journal_quota(this : IMSMQQueueInfo2*, ljournalquota : Int32) : HRESULT
    @lpVtbl.value.put_journal_quota.call(this, ljournalquota)
  end
  def get_is_world_readable(this : IMSMQQueueInfo2*, pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable.call(this, pisworldreadable)
  end
  def create(this : IMSMQQueueInfo2*, istransactional : VARIANT*, isworldreadable : VARIANT*) : HRESULT
    @lpVtbl.value.create.call(this, istransactional, isworldreadable)
  end
  def delete(this : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def open(this : IMSMQQueueInfo2*, access : Int32, sharemode : Int32, ppq : IMSMQQueue2*) : HRESULT
    @lpVtbl.value.open.call(this, access, sharemode, ppq)
  end
  def refresh(this : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def update(this : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.update.call(this)
  end
  def get_path_name_dns(this : IMSMQQueueInfo2*, pbstrpathnamedns : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name_dns.call(this, pbstrpathnamedns)
  end
  def get_properties(this : IMSMQQueueInfo2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_security(this : IMSMQQueueInfo2*, pvarsecurity : VARIANT*) : HRESULT
    @lpVtbl.value.get_security.call(this, pvarsecurity)
  end
  def put_security(this : IMSMQQueueInfo2*, varsecurity : VARIANT) : HRESULT
    @lpVtbl.value.put_security.call(this, varsecurity)
  end
end
struct LibWin32::IMSMQQueueInfo3
  def query_interface(this : IMSMQQueueInfo3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueueInfo3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueueInfo3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueueInfo3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueueInfo3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueueInfo3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueueInfo3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_queue_guid(this : IMSMQQueueInfo3*, pbstrguidqueue : UInt8**) : HRESULT
    @lpVtbl.value.get_queue_guid.call(this, pbstrguidqueue)
  end
  def get_service_type_guid(this : IMSMQQueueInfo3*, pbstrguidservicetype : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_guid.call(this, pbstrguidservicetype)
  end
  def put_service_type_guid(this : IMSMQQueueInfo3*, bstrguidservicetype : UInt8*) : HRESULT
    @lpVtbl.value.put_service_type_guid.call(this, bstrguidservicetype)
  end
  def get_label(this : IMSMQQueueInfo3*, pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.call(this, pbstrlabel)
  end
  def put_label(this : IMSMQQueueInfo3*, bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.call(this, bstrlabel)
  end
  def get_path_name(this : IMSMQQueueInfo3*, pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.call(this, pbstrpathname)
  end
  def put_path_name(this : IMSMQQueueInfo3*, bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.call(this, bstrpathname)
  end
  def get_format_name(this : IMSMQQueueInfo3*, pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.call(this, pbstrformatname)
  end
  def put_format_name(this : IMSMQQueueInfo3*, bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.call(this, bstrformatname)
  end
  def get_is_transactional(this : IMSMQQueueInfo3*, pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional.call(this, pistransactional)
  end
  def get_priv_level(this : IMSMQQueueInfo3*, plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.call(this, plprivlevel)
  end
  def put_priv_level(this : IMSMQQueueInfo3*, lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.call(this, lprivlevel)
  end
  def get_journal(this : IMSMQQueueInfo3*, pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.call(this, pljournal)
  end
  def put_journal(this : IMSMQQueueInfo3*, ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.call(this, ljournal)
  end
  def get_quota(this : IMSMQQueueInfo3*, plquota : Int32*) : HRESULT
    @lpVtbl.value.get_quota.call(this, plquota)
  end
  def put_quota(this : IMSMQQueueInfo3*, lquota : Int32) : HRESULT
    @lpVtbl.value.put_quota.call(this, lquota)
  end
  def get_base_priority(this : IMSMQQueueInfo3*, plbasepriority : Int32*) : HRESULT
    @lpVtbl.value.get_base_priority.call(this, plbasepriority)
  end
  def put_base_priority(this : IMSMQQueueInfo3*, lbasepriority : Int32) : HRESULT
    @lpVtbl.value.put_base_priority.call(this, lbasepriority)
  end
  def get_create_time(this : IMSMQQueueInfo3*, pvarcreatetime : VARIANT*) : HRESULT
    @lpVtbl.value.get_create_time.call(this, pvarcreatetime)
  end
  def get_modify_time(this : IMSMQQueueInfo3*, pvarmodifytime : VARIANT*) : HRESULT
    @lpVtbl.value.get_modify_time.call(this, pvarmodifytime)
  end
  def get_authenticate(this : IMSMQQueueInfo3*, plauthenticate : Int32*) : HRESULT
    @lpVtbl.value.get_authenticate.call(this, plauthenticate)
  end
  def put_authenticate(this : IMSMQQueueInfo3*, lauthenticate : Int32) : HRESULT
    @lpVtbl.value.put_authenticate.call(this, lauthenticate)
  end
  def get_journal_quota(this : IMSMQQueueInfo3*, pljournalquota : Int32*) : HRESULT
    @lpVtbl.value.get_journal_quota.call(this, pljournalquota)
  end
  def put_journal_quota(this : IMSMQQueueInfo3*, ljournalquota : Int32) : HRESULT
    @lpVtbl.value.put_journal_quota.call(this, ljournalquota)
  end
  def get_is_world_readable(this : IMSMQQueueInfo3*, pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable.call(this, pisworldreadable)
  end
  def create(this : IMSMQQueueInfo3*, istransactional : VARIANT*, isworldreadable : VARIANT*) : HRESULT
    @lpVtbl.value.create.call(this, istransactional, isworldreadable)
  end
  def delete(this : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def open(this : IMSMQQueueInfo3*, access : Int32, sharemode : Int32, ppq : IMSMQQueue3*) : HRESULT
    @lpVtbl.value.open.call(this, access, sharemode, ppq)
  end
  def refresh(this : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def update(this : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.update.call(this)
  end
  def get_path_name_dns(this : IMSMQQueueInfo3*, pbstrpathnamedns : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name_dns.call(this, pbstrpathnamedns)
  end
  def get_properties(this : IMSMQQueueInfo3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_security(this : IMSMQQueueInfo3*, pvarsecurity : VARIANT*) : HRESULT
    @lpVtbl.value.get_security.call(this, pvarsecurity)
  end
  def put_security(this : IMSMQQueueInfo3*, varsecurity : VARIANT) : HRESULT
    @lpVtbl.value.put_security.call(this, varsecurity)
  end
  def get_is_transactional2(this : IMSMQQueueInfo3*, pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional2.call(this, pistransactional)
  end
  def get_is_world_readable2(this : IMSMQQueueInfo3*, pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable2.call(this, pisworldreadable)
  end
  def get_multicast_address(this : IMSMQQueueInfo3*, pbstrmulticastaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_multicast_address.call(this, pbstrmulticastaddress)
  end
  def put_multicast_address(this : IMSMQQueueInfo3*, bstrmulticastaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_multicast_address.call(this, bstrmulticastaddress)
  end
  def get_a_ds_path(this : IMSMQQueueInfo3*, pbstradspath : UInt8**) : HRESULT
    @lpVtbl.value.get_a_ds_path.call(this, pbstradspath)
  end
end
struct LibWin32::IMSMQQueueInfo4
  def query_interface(this : IMSMQQueueInfo4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueueInfo4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueueInfo4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueueInfo4*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueueInfo4*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueueInfo4*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueueInfo4*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_queue_guid(this : IMSMQQueueInfo4*, pbstrguidqueue : UInt8**) : HRESULT
    @lpVtbl.value.get_queue_guid.call(this, pbstrguidqueue)
  end
  def get_service_type_guid(this : IMSMQQueueInfo4*, pbstrguidservicetype : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_guid.call(this, pbstrguidservicetype)
  end
  def put_service_type_guid(this : IMSMQQueueInfo4*, bstrguidservicetype : UInt8*) : HRESULT
    @lpVtbl.value.put_service_type_guid.call(this, bstrguidservicetype)
  end
  def get_label(this : IMSMQQueueInfo4*, pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.call(this, pbstrlabel)
  end
  def put_label(this : IMSMQQueueInfo4*, bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.call(this, bstrlabel)
  end
  def get_path_name(this : IMSMQQueueInfo4*, pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.call(this, pbstrpathname)
  end
  def put_path_name(this : IMSMQQueueInfo4*, bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.call(this, bstrpathname)
  end
  def get_format_name(this : IMSMQQueueInfo4*, pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.call(this, pbstrformatname)
  end
  def put_format_name(this : IMSMQQueueInfo4*, bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.call(this, bstrformatname)
  end
  def get_is_transactional(this : IMSMQQueueInfo4*, pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional.call(this, pistransactional)
  end
  def get_priv_level(this : IMSMQQueueInfo4*, plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.call(this, plprivlevel)
  end
  def put_priv_level(this : IMSMQQueueInfo4*, lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.call(this, lprivlevel)
  end
  def get_journal(this : IMSMQQueueInfo4*, pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.call(this, pljournal)
  end
  def put_journal(this : IMSMQQueueInfo4*, ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.call(this, ljournal)
  end
  def get_quota(this : IMSMQQueueInfo4*, plquota : Int32*) : HRESULT
    @lpVtbl.value.get_quota.call(this, plquota)
  end
  def put_quota(this : IMSMQQueueInfo4*, lquota : Int32) : HRESULT
    @lpVtbl.value.put_quota.call(this, lquota)
  end
  def get_base_priority(this : IMSMQQueueInfo4*, plbasepriority : Int32*) : HRESULT
    @lpVtbl.value.get_base_priority.call(this, plbasepriority)
  end
  def put_base_priority(this : IMSMQQueueInfo4*, lbasepriority : Int32) : HRESULT
    @lpVtbl.value.put_base_priority.call(this, lbasepriority)
  end
  def get_create_time(this : IMSMQQueueInfo4*, pvarcreatetime : VARIANT*) : HRESULT
    @lpVtbl.value.get_create_time.call(this, pvarcreatetime)
  end
  def get_modify_time(this : IMSMQQueueInfo4*, pvarmodifytime : VARIANT*) : HRESULT
    @lpVtbl.value.get_modify_time.call(this, pvarmodifytime)
  end
  def get_authenticate(this : IMSMQQueueInfo4*, plauthenticate : Int32*) : HRESULT
    @lpVtbl.value.get_authenticate.call(this, plauthenticate)
  end
  def put_authenticate(this : IMSMQQueueInfo4*, lauthenticate : Int32) : HRESULT
    @lpVtbl.value.put_authenticate.call(this, lauthenticate)
  end
  def get_journal_quota(this : IMSMQQueueInfo4*, pljournalquota : Int32*) : HRESULT
    @lpVtbl.value.get_journal_quota.call(this, pljournalquota)
  end
  def put_journal_quota(this : IMSMQQueueInfo4*, ljournalquota : Int32) : HRESULT
    @lpVtbl.value.put_journal_quota.call(this, ljournalquota)
  end
  def get_is_world_readable(this : IMSMQQueueInfo4*, pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable.call(this, pisworldreadable)
  end
  def create(this : IMSMQQueueInfo4*, istransactional : VARIANT*, isworldreadable : VARIANT*) : HRESULT
    @lpVtbl.value.create.call(this, istransactional, isworldreadable)
  end
  def delete(this : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def open(this : IMSMQQueueInfo4*, access : Int32, sharemode : Int32, ppq : IMSMQQueue4*) : HRESULT
    @lpVtbl.value.open.call(this, access, sharemode, ppq)
  end
  def refresh(this : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def update(this : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.update.call(this)
  end
  def get_path_name_dns(this : IMSMQQueueInfo4*, pbstrpathnamedns : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name_dns.call(this, pbstrpathnamedns)
  end
  def get_properties(this : IMSMQQueueInfo4*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_security(this : IMSMQQueueInfo4*, pvarsecurity : VARIANT*) : HRESULT
    @lpVtbl.value.get_security.call(this, pvarsecurity)
  end
  def put_security(this : IMSMQQueueInfo4*, varsecurity : VARIANT) : HRESULT
    @lpVtbl.value.put_security.call(this, varsecurity)
  end
  def get_is_transactional2(this : IMSMQQueueInfo4*, pistransactional : Int16*) : HRESULT
    @lpVtbl.value.get_is_transactional2.call(this, pistransactional)
  end
  def get_is_world_readable2(this : IMSMQQueueInfo4*, pisworldreadable : Int16*) : HRESULT
    @lpVtbl.value.get_is_world_readable2.call(this, pisworldreadable)
  end
  def get_multicast_address(this : IMSMQQueueInfo4*, pbstrmulticastaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_multicast_address.call(this, pbstrmulticastaddress)
  end
  def put_multicast_address(this : IMSMQQueueInfo4*, bstrmulticastaddress : UInt8*) : HRESULT
    @lpVtbl.value.put_multicast_address.call(this, bstrmulticastaddress)
  end
  def get_a_ds_path(this : IMSMQQueueInfo4*, pbstradspath : UInt8**) : HRESULT
    @lpVtbl.value.get_a_ds_path.call(this, pbstradspath)
  end
end
struct LibWin32::IMSMQQueue
  def query_interface(this : IMSMQQueue*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueue*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueue*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueue*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueue*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueue*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueue*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_access(this : IMSMQQueue*, placcess : Int32*) : HRESULT
    @lpVtbl.value.get_access.call(this, placcess)
  end
  def get_share_mode(this : IMSMQQueue*, plsharemode : Int32*) : HRESULT
    @lpVtbl.value.get_share_mode.call(this, plsharemode)
  end
  def get_queue_info(this : IMSMQQueue*, ppqinfo : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_queue_info.call(this, ppqinfo)
  end
  def get_handle(this : IMSMQQueue*, plhandle : Int32*) : HRESULT
    @lpVtbl.value.get_handle.call(this, plhandle)
  end
  def get_is_open(this : IMSMQQueue*, pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.call(this, pisopen)
  end
  def close(this : IMSMQQueue*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def receive(this : IMSMQQueue*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek(this : IMSMQQueue*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def enable_notification(this : IMSMQQueue*, event : IMSMQEvent, cursor : VARIANT*, receivetimeout : VARIANT*) : HRESULT
    @lpVtbl.value.enable_notification.call(this, event, cursor, receivetimeout)
  end
  def reset(this : IMSMQQueue*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def receive_current(this : IMSMQQueue*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_current.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_next(this : IMSMQQueue*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_next.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_current(this : IMSMQQueue*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_current.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
end
struct LibWin32::IMSMQQueue2
  def query_interface(this : IMSMQQueue2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueue2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueue2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueue2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueue2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueue2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueue2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_access(this : IMSMQQueue2*, placcess : Int32*) : HRESULT
    @lpVtbl.value.get_access.call(this, placcess)
  end
  def get_share_mode(this : IMSMQQueue2*, plsharemode : Int32*) : HRESULT
    @lpVtbl.value.get_share_mode.call(this, plsharemode)
  end
  def get_queue_info(this : IMSMQQueue2*, ppqinfo : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_queue_info.call(this, ppqinfo)
  end
  def get_handle(this : IMSMQQueue2*, plhandle : Int32*) : HRESULT
    @lpVtbl.value.get_handle.call(this, plhandle)
  end
  def get_is_open(this : IMSMQQueue2*, pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.call(this, pisopen)
  end
  def close(this : IMSMQQueue2*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def receive_v1(this : IMSMQQueue2*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_v1.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_v1(this : IMSMQQueue2*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_v1.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def enable_notification(this : IMSMQQueue2*, event : IMSMQEvent2, cursor : VARIANT*, receivetimeout : VARIANT*) : HRESULT
    @lpVtbl.value.enable_notification.call(this, event, cursor, receivetimeout)
  end
  def reset(this : IMSMQQueue2*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def receive_current_v1(this : IMSMQQueue2*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_current_v1.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_next_v1(this : IMSMQQueue2*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_next_v1.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_current_v1(this : IMSMQQueue2*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_current_v1.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def receive(this : IMSMQQueue2*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.receive.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek(this : IMSMQQueue2*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.peek.call(this, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def receive_current(this : IMSMQQueue2*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.receive_current.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_next(this : IMSMQQueue2*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.peek_next.call(this, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_current(this : IMSMQQueue2*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.peek_current.call(this, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def get_properties(this : IMSMQQueue2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQQueue3
  def query_interface(this : IMSMQQueue3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueue3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueue3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueue3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueue3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueue3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueue3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_access(this : IMSMQQueue3*, placcess : Int32*) : HRESULT
    @lpVtbl.value.get_access.call(this, placcess)
  end
  def get_share_mode(this : IMSMQQueue3*, plsharemode : Int32*) : HRESULT
    @lpVtbl.value.get_share_mode.call(this, plsharemode)
  end
  def get_queue_info(this : IMSMQQueue3*, ppqinfo : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_queue_info.call(this, ppqinfo)
  end
  def get_handle(this : IMSMQQueue3*, plhandle : Int32*) : HRESULT
    @lpVtbl.value.get_handle.call(this, plhandle)
  end
  def get_is_open(this : IMSMQQueue3*, pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.call(this, pisopen)
  end
  def close(this : IMSMQQueue3*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def receive_v1(this : IMSMQQueue3*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_v1.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_v1(this : IMSMQQueue3*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_v1.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def enable_notification(this : IMSMQQueue3*, event : IMSMQEvent3, cursor : VARIANT*, receivetimeout : VARIANT*) : HRESULT
    @lpVtbl.value.enable_notification.call(this, event, cursor, receivetimeout)
  end
  def reset(this : IMSMQQueue3*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def receive_current_v1(this : IMSMQQueue3*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_current_v1.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_next_v1(this : IMSMQQueue3*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_next_v1.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_current_v1(this : IMSMQQueue3*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_current_v1.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def receive(this : IMSMQQueue3*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek(this : IMSMQQueue3*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek.call(this, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def receive_current(this : IMSMQQueue3*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_current.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_next(this : IMSMQQueue3*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_next.call(this, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_current(this : IMSMQQueue3*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_current.call(this, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def get_properties(this : IMSMQQueue3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_handle2(this : IMSMQQueue3*, pvarhandle : VARIANT*) : HRESULT
    @lpVtbl.value.get_handle2.call(this, pvarhandle)
  end
  def receive_by_lookup_id(this : IMSMQQueue3*, lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_by_lookup_id.call(this, lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_next_by_lookup_id(this : IMSMQQueue3*, lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_next_by_lookup_id.call(this, lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_previous_by_lookup_id(this : IMSMQQueue3*, lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_previous_by_lookup_id.call(this, lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_first_by_lookup_id(this : IMSMQQueue3*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_first_by_lookup_id.call(this, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_last_by_lookup_id(this : IMSMQQueue3*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.receive_last_by_lookup_id.call(this, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_by_lookup_id(this : IMSMQQueue3*, lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_by_lookup_id.call(this, lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_next_by_lookup_id(this : IMSMQQueue3*, lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_next_by_lookup_id.call(this, lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_previous_by_lookup_id(this : IMSMQQueue3*, lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_previous_by_lookup_id.call(this, lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_first_by_lookup_id(this : IMSMQQueue3*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_first_by_lookup_id.call(this, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_last_by_lookup_id(this : IMSMQQueue3*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.peek_last_by_lookup_id.call(this, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def purge(this : IMSMQQueue3*) : HRESULT
    @lpVtbl.value.purge.call(this)
  end
  def get_is_open2(this : IMSMQQueue3*, pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open2.call(this, pisopen)
  end
end
struct LibWin32::IMSMQQueue4
  def query_interface(this : IMSMQQueue4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueue4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueue4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueue4*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueue4*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueue4*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueue4*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_access(this : IMSMQQueue4*, placcess : Int32*) : HRESULT
    @lpVtbl.value.get_access.call(this, placcess)
  end
  def get_share_mode(this : IMSMQQueue4*, plsharemode : Int32*) : HRESULT
    @lpVtbl.value.get_share_mode.call(this, plsharemode)
  end
  def get_queue_info(this : IMSMQQueue4*, ppqinfo : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_queue_info.call(this, ppqinfo)
  end
  def get_handle(this : IMSMQQueue4*, plhandle : Int32*) : HRESULT
    @lpVtbl.value.get_handle.call(this, plhandle)
  end
  def get_is_open(this : IMSMQQueue4*, pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.call(this, pisopen)
  end
  def close(this : IMSMQQueue4*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def receive_v1(this : IMSMQQueue4*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_v1.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_v1(this : IMSMQQueue4*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_v1.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def enable_notification(this : IMSMQQueue4*, event : IMSMQEvent3, cursor : VARIANT*, receivetimeout : VARIANT*) : HRESULT
    @lpVtbl.value.enable_notification.call(this, event, cursor, receivetimeout)
  end
  def reset(this : IMSMQQueue4*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def receive_current_v1(this : IMSMQQueue4*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.receive_current_v1.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_next_v1(this : IMSMQQueue4*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_next_v1.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def peek_current_v1(this : IMSMQQueue4*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, ppmsg : IMSMQMessage*) : HRESULT
    @lpVtbl.value.peek_current_v1.call(this, wantdestinationqueue, wantbody, receivetimeout, ppmsg)
  end
  def receive(this : IMSMQQueue4*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek(this : IMSMQQueue4*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek.call(this, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def receive_current(this : IMSMQQueue4*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_current.call(this, transaction, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_next(this : IMSMQQueue4*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_next.call(this, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def peek_current(this : IMSMQQueue4*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, receivetimeout : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_current.call(this, wantdestinationqueue, wantbody, receivetimeout, wantconnectortype, ppmsg)
  end
  def get_properties(this : IMSMQQueue4*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_handle2(this : IMSMQQueue4*, pvarhandle : VARIANT*) : HRESULT
    @lpVtbl.value.get_handle2.call(this, pvarhandle)
  end
  def receive_by_lookup_id(this : IMSMQQueue4*, lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_by_lookup_id.call(this, lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_next_by_lookup_id(this : IMSMQQueue4*, lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_next_by_lookup_id.call(this, lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_previous_by_lookup_id(this : IMSMQQueue4*, lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_previous_by_lookup_id.call(this, lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_first_by_lookup_id(this : IMSMQQueue4*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_first_by_lookup_id.call(this, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def receive_last_by_lookup_id(this : IMSMQQueue4*, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_last_by_lookup_id.call(this, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_by_lookup_id(this : IMSMQQueue4*, lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_by_lookup_id.call(this, lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_next_by_lookup_id(this : IMSMQQueue4*, lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_next_by_lookup_id.call(this, lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_previous_by_lookup_id(this : IMSMQQueue4*, lookupid : VARIANT, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_previous_by_lookup_id.call(this, lookupid, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_first_by_lookup_id(this : IMSMQQueue4*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_first_by_lookup_id.call(this, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def peek_last_by_lookup_id(this : IMSMQQueue4*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.peek_last_by_lookup_id.call(this, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
  def purge(this : IMSMQQueue4*) : HRESULT
    @lpVtbl.value.purge.call(this)
  end
  def get_is_open2(this : IMSMQQueue4*, pisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open2.call(this, pisopen)
  end
  def receive_by_lookup_id_allow_peek(this : IMSMQQueue4*, lookupid : VARIANT, transaction : VARIANT*, wantdestinationqueue : VARIANT*, wantbody : VARIANT*, wantconnectortype : VARIANT*, ppmsg : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.receive_by_lookup_id_allow_peek.call(this, lookupid, transaction, wantdestinationqueue, wantbody, wantconnectortype, ppmsg)
  end
end
struct LibWin32::IMSMQMessage
  def query_interface(this : IMSMQMessage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQMessage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQMessage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQMessage*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQMessage*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQMessage*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQMessage*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_class(this : IMSMQMessage*, plclass : Int32*) : HRESULT
    @lpVtbl.value.get_class.call(this, plclass)
  end
  def get_priv_level(this : IMSMQMessage*, plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.call(this, plprivlevel)
  end
  def put_priv_level(this : IMSMQMessage*, lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.call(this, lprivlevel)
  end
  def get_auth_level(this : IMSMQMessage*, plauthlevel : Int32*) : HRESULT
    @lpVtbl.value.get_auth_level.call(this, plauthlevel)
  end
  def put_auth_level(this : IMSMQMessage*, lauthlevel : Int32) : HRESULT
    @lpVtbl.value.put_auth_level.call(this, lauthlevel)
  end
  def get_is_authenticated(this : IMSMQMessage*, pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated.call(this, pisauthenticated)
  end
  def get_delivery(this : IMSMQMessage*, pldelivery : Int32*) : HRESULT
    @lpVtbl.value.get_delivery.call(this, pldelivery)
  end
  def put_delivery(this : IMSMQMessage*, ldelivery : Int32) : HRESULT
    @lpVtbl.value.put_delivery.call(this, ldelivery)
  end
  def get_trace(this : IMSMQMessage*, pltrace : Int32*) : HRESULT
    @lpVtbl.value.get_trace.call(this, pltrace)
  end
  def put_trace(this : IMSMQMessage*, ltrace : Int32) : HRESULT
    @lpVtbl.value.put_trace.call(this, ltrace)
  end
  def get_priority(this : IMSMQMessage*, plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, plpriority)
  end
  def put_priority(this : IMSMQMessage*, lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.call(this, lpriority)
  end
  def get_journal(this : IMSMQMessage*, pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.call(this, pljournal)
  end
  def put_journal(this : IMSMQMessage*, ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.call(this, ljournal)
  end
  def get_response_queue_info(this : IMSMQMessage*, ppqinforesponse : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_response_queue_info.call(this, ppqinforesponse)
  end
  def putref_response_queue_info(this : IMSMQMessage*, pqinforesponse : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_response_queue_info.call(this, pqinforesponse)
  end
  def get_app_specific(this : IMSMQMessage*, plappspecific : Int32*) : HRESULT
    @lpVtbl.value.get_app_specific.call(this, plappspecific)
  end
  def put_app_specific(this : IMSMQMessage*, lappspecific : Int32) : HRESULT
    @lpVtbl.value.put_app_specific.call(this, lappspecific)
  end
  def get_source_machine_guid(this : IMSMQMessage*, pbstrguidsrcmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_source_machine_guid.call(this, pbstrguidsrcmachine)
  end
  def get_body_length(this : IMSMQMessage*, pcbbody : Int32*) : HRESULT
    @lpVtbl.value.get_body_length.call(this, pcbbody)
  end
  def get_body(this : IMSMQMessage*, pvarbody : VARIANT*) : HRESULT
    @lpVtbl.value.get_body.call(this, pvarbody)
  end
  def put_body(this : IMSMQMessage*, varbody : VARIANT) : HRESULT
    @lpVtbl.value.put_body.call(this, varbody)
  end
  def get_admin_queue_info(this : IMSMQMessage*, ppqinfoadmin : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_admin_queue_info.call(this, ppqinfoadmin)
  end
  def putref_admin_queue_info(this : IMSMQMessage*, pqinfoadmin : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_admin_queue_info.call(this, pqinfoadmin)
  end
  def get_id(this : IMSMQMessage*, pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_id.call(this, pvarmsgid)
  end
  def get_correlation_id(this : IMSMQMessage*, pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_correlation_id.call(this, pvarmsgid)
  end
  def put_correlation_id(this : IMSMQMessage*, varmsgid : VARIANT) : HRESULT
    @lpVtbl.value.put_correlation_id.call(this, varmsgid)
  end
  def get_ack(this : IMSMQMessage*, plack : Int32*) : HRESULT
    @lpVtbl.value.get_ack.call(this, plack)
  end
  def put_ack(this : IMSMQMessage*, lack : Int32) : HRESULT
    @lpVtbl.value.put_ack.call(this, lack)
  end
  def get_label(this : IMSMQMessage*, pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.call(this, pbstrlabel)
  end
  def put_label(this : IMSMQMessage*, bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.call(this, bstrlabel)
  end
  def get_max_time_to_reach_queue(this : IMSMQMessage*, plmaxtimetoreachqueue : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_reach_queue.call(this, plmaxtimetoreachqueue)
  end
  def put_max_time_to_reach_queue(this : IMSMQMessage*, lmaxtimetoreachqueue : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_reach_queue.call(this, lmaxtimetoreachqueue)
  end
  def get_max_time_to_receive(this : IMSMQMessage*, plmaxtimetoreceive : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_receive.call(this, plmaxtimetoreceive)
  end
  def put_max_time_to_receive(this : IMSMQMessage*, lmaxtimetoreceive : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_receive.call(this, lmaxtimetoreceive)
  end
  def get_hash_algorithm(this : IMSMQMessage*, plhashalg : Int32*) : HRESULT
    @lpVtbl.value.get_hash_algorithm.call(this, plhashalg)
  end
  def put_hash_algorithm(this : IMSMQMessage*, lhashalg : Int32) : HRESULT
    @lpVtbl.value.put_hash_algorithm.call(this, lhashalg)
  end
  def get_encrypt_algorithm(this : IMSMQMessage*, plencryptalg : Int32*) : HRESULT
    @lpVtbl.value.get_encrypt_algorithm.call(this, plencryptalg)
  end
  def put_encrypt_algorithm(this : IMSMQMessage*, lencryptalg : Int32) : HRESULT
    @lpVtbl.value.put_encrypt_algorithm.call(this, lencryptalg)
  end
  def get_sent_time(this : IMSMQMessage*, pvarsenttime : VARIANT*) : HRESULT
    @lpVtbl.value.get_sent_time.call(this, pvarsenttime)
  end
  def get_arrived_time(this : IMSMQMessage*, plarrivedtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_arrived_time.call(this, plarrivedtime)
  end
  def get_destination_queue_info(this : IMSMQMessage*, ppqinfodest : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_destination_queue_info.call(this, ppqinfodest)
  end
  def get_sender_certificate(this : IMSMQMessage*, pvarsendercert : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_certificate.call(this, pvarsendercert)
  end
  def put_sender_certificate(this : IMSMQMessage*, varsendercert : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_certificate.call(this, varsendercert)
  end
  def get_sender_id(this : IMSMQMessage*, pvarsenderid : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_id.call(this, pvarsenderid)
  end
  def get_sender_id_type(this : IMSMQMessage*, plsenderidtype : Int32*) : HRESULT
    @lpVtbl.value.get_sender_id_type.call(this, plsenderidtype)
  end
  def put_sender_id_type(this : IMSMQMessage*, lsenderidtype : Int32) : HRESULT
    @lpVtbl.value.put_sender_id_type.call(this, lsenderidtype)
  end
  def send(this : IMSMQMessage*, destinationqueue : IMSMQQueue, transaction : VARIANT*) : HRESULT
    @lpVtbl.value.send.call(this, destinationqueue, transaction)
  end
  def attach_current_security_context(this : IMSMQMessage*) : HRESULT
    @lpVtbl.value.attach_current_security_context.call(this)
  end
end
struct LibWin32::IMSMQQueueInfos
  def query_interface(this : IMSMQQueueInfos*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueueInfos*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueueInfos*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueueInfos*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueueInfos*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueueInfos*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueueInfos*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def reset(this : IMSMQQueueInfos*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def next(this : IMSMQQueueInfos*, ppqinfonext : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.next.call(this, ppqinfonext)
  end
end
struct LibWin32::IMSMQQueueInfos2
  def query_interface(this : IMSMQQueueInfos2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueueInfos2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueueInfos2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueueInfos2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueueInfos2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueueInfos2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueueInfos2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def reset(this : IMSMQQueueInfos2*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def next(this : IMSMQQueueInfos2*, ppqinfonext : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.next.call(this, ppqinfonext)
  end
  def get_properties(this : IMSMQQueueInfos2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQQueueInfos3
  def query_interface(this : IMSMQQueueInfos3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueueInfos3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueueInfos3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueueInfos3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueueInfos3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueueInfos3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueueInfos3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def reset(this : IMSMQQueueInfos3*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def next(this : IMSMQQueueInfos3*, ppqinfonext : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.next.call(this, ppqinfonext)
  end
  def get_properties(this : IMSMQQueueInfos3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQQueueInfos4
  def query_interface(this : IMSMQQueueInfos4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueueInfos4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueueInfos4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueueInfos4*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueueInfos4*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueueInfos4*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueueInfos4*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def reset(this : IMSMQQueueInfos4*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def next(this : IMSMQQueueInfos4*, ppqinfonext : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.next.call(this, ppqinfonext)
  end
  def get_properties(this : IMSMQQueueInfos4*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQEvent
  def query_interface(this : IMSMQEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IMSMQEvent2
  def query_interface(this : IMSMQEvent2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQEvent2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQEvent2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQEvent2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQEvent2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQEvent2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQEvent2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_properties(this : IMSMQEvent2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQEvent3
  def query_interface(this : IMSMQEvent3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQEvent3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQEvent3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQEvent3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQEvent3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQEvent3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQEvent3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_properties(this : IMSMQEvent3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQTransaction
  def query_interface(this : IMSMQTransaction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQTransaction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQTransaction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQTransaction*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQTransaction*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQTransaction*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQTransaction*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_transaction(this : IMSMQTransaction*, pltransaction : Int32*) : HRESULT
    @lpVtbl.value.get_transaction.call(this, pltransaction)
  end
  def commit(this : IMSMQTransaction*, fretaining : VARIANT*, grftc : VARIANT*, grfrm : VARIANT*) : HRESULT
    @lpVtbl.value.commit.call(this, fretaining, grftc, grfrm)
  end
  def abort(this : IMSMQTransaction*, fretaining : VARIANT*, fasync : VARIANT*) : HRESULT
    @lpVtbl.value.abort.call(this, fretaining, fasync)
  end
end
struct LibWin32::IMSMQCoordinatedTransactionDispenser
  def query_interface(this : IMSMQCoordinatedTransactionDispenser*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQCoordinatedTransactionDispenser*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQCoordinatedTransactionDispenser*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQCoordinatedTransactionDispenser*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQCoordinatedTransactionDispenser*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQCoordinatedTransactionDispenser*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQCoordinatedTransactionDispenser*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def begin_transaction(this : IMSMQCoordinatedTransactionDispenser*, ptransaction : IMSMQTransaction*) : HRESULT
    @lpVtbl.value.begin_transaction.call(this, ptransaction)
  end
end
struct LibWin32::IMSMQTransactionDispenser
  def query_interface(this : IMSMQTransactionDispenser*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQTransactionDispenser*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQTransactionDispenser*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQTransactionDispenser*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQTransactionDispenser*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQTransactionDispenser*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQTransactionDispenser*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def begin_transaction(this : IMSMQTransactionDispenser*, ptransaction : IMSMQTransaction*) : HRESULT
    @lpVtbl.value.begin_transaction.call(this, ptransaction)
  end
end
struct LibWin32::IMSMQQuery2
  def query_interface(this : IMSMQQuery2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQuery2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQuery2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQuery2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQuery2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQuery2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQuery2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def lookup_queue(this : IMSMQQuery2*, queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, ppqinfos : IMSMQQueueInfos2*) : HRESULT
    @lpVtbl.value.lookup_queue.call(this, queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, ppqinfos)
  end
  def get_properties(this : IMSMQQuery2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQQuery3
  def query_interface(this : IMSMQQuery3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQuery3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQuery3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQuery3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQuery3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQuery3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQuery3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def lookup_queue_v2(this : IMSMQQuery3*, queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, ppqinfos : IMSMQQueueInfos3*) : HRESULT
    @lpVtbl.value.lookup_queue_v2.call(this, queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, ppqinfos)
  end
  def get_properties(this : IMSMQQuery3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def lookup_queue(this : IMSMQQuery3*, queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, multicastaddress : VARIANT*, relmulticastaddress : VARIANT*, ppqinfos : IMSMQQueueInfos3*) : HRESULT
    @lpVtbl.value.lookup_queue.call(this, queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, multicastaddress, relmulticastaddress, ppqinfos)
  end
end
struct LibWin32::IMSMQQuery4
  def query_interface(this : IMSMQQuery4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQuery4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQuery4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQuery4*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQuery4*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQuery4*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQuery4*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def lookup_queue_v2(this : IMSMQQuery4*, queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, ppqinfos : IMSMQQueueInfos4*) : HRESULT
    @lpVtbl.value.lookup_queue_v2.call(this, queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, ppqinfos)
  end
  def get_properties(this : IMSMQQuery4*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def lookup_queue(this : IMSMQQuery4*, queueguid : VARIANT*, servicetypeguid : VARIANT*, label : VARIANT*, createtime : VARIANT*, modifytime : VARIANT*, relservicetype : VARIANT*, rellabel : VARIANT*, relcreatetime : VARIANT*, relmodifytime : VARIANT*, multicastaddress : VARIANT*, relmulticastaddress : VARIANT*, ppqinfos : IMSMQQueueInfos4*) : HRESULT
    @lpVtbl.value.lookup_queue.call(this, queueguid, servicetypeguid, label, createtime, modifytime, relservicetype, rellabel, relcreatetime, relmodifytime, multicastaddress, relmulticastaddress, ppqinfos)
  end
end
struct LibWin32::IMSMQMessage2
  def query_interface(this : IMSMQMessage2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQMessage2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQMessage2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQMessage2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQMessage2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQMessage2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQMessage2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_class(this : IMSMQMessage2*, plclass : Int32*) : HRESULT
    @lpVtbl.value.get_class.call(this, plclass)
  end
  def get_priv_level(this : IMSMQMessage2*, plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.call(this, plprivlevel)
  end
  def put_priv_level(this : IMSMQMessage2*, lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.call(this, lprivlevel)
  end
  def get_auth_level(this : IMSMQMessage2*, plauthlevel : Int32*) : HRESULT
    @lpVtbl.value.get_auth_level.call(this, plauthlevel)
  end
  def put_auth_level(this : IMSMQMessage2*, lauthlevel : Int32) : HRESULT
    @lpVtbl.value.put_auth_level.call(this, lauthlevel)
  end
  def get_is_authenticated(this : IMSMQMessage2*, pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated.call(this, pisauthenticated)
  end
  def get_delivery(this : IMSMQMessage2*, pldelivery : Int32*) : HRESULT
    @lpVtbl.value.get_delivery.call(this, pldelivery)
  end
  def put_delivery(this : IMSMQMessage2*, ldelivery : Int32) : HRESULT
    @lpVtbl.value.put_delivery.call(this, ldelivery)
  end
  def get_trace(this : IMSMQMessage2*, pltrace : Int32*) : HRESULT
    @lpVtbl.value.get_trace.call(this, pltrace)
  end
  def put_trace(this : IMSMQMessage2*, ltrace : Int32) : HRESULT
    @lpVtbl.value.put_trace.call(this, ltrace)
  end
  def get_priority(this : IMSMQMessage2*, plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, plpriority)
  end
  def put_priority(this : IMSMQMessage2*, lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.call(this, lpriority)
  end
  def get_journal(this : IMSMQMessage2*, pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.call(this, pljournal)
  end
  def put_journal(this : IMSMQMessage2*, ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.call(this, ljournal)
  end
  def get_response_queue_info_v1(this : IMSMQMessage2*, ppqinforesponse : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v1.call(this, ppqinforesponse)
  end
  def putref_response_queue_info_v1(this : IMSMQMessage2*, pqinforesponse : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v1.call(this, pqinforesponse)
  end
  def get_app_specific(this : IMSMQMessage2*, plappspecific : Int32*) : HRESULT
    @lpVtbl.value.get_app_specific.call(this, plappspecific)
  end
  def put_app_specific(this : IMSMQMessage2*, lappspecific : Int32) : HRESULT
    @lpVtbl.value.put_app_specific.call(this, lappspecific)
  end
  def get_source_machine_guid(this : IMSMQMessage2*, pbstrguidsrcmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_source_machine_guid.call(this, pbstrguidsrcmachine)
  end
  def get_body_length(this : IMSMQMessage2*, pcbbody : Int32*) : HRESULT
    @lpVtbl.value.get_body_length.call(this, pcbbody)
  end
  def get_body(this : IMSMQMessage2*, pvarbody : VARIANT*) : HRESULT
    @lpVtbl.value.get_body.call(this, pvarbody)
  end
  def put_body(this : IMSMQMessage2*, varbody : VARIANT) : HRESULT
    @lpVtbl.value.put_body.call(this, varbody)
  end
  def get_admin_queue_info_v1(this : IMSMQMessage2*, ppqinfoadmin : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v1.call(this, ppqinfoadmin)
  end
  def putref_admin_queue_info_v1(this : IMSMQMessage2*, pqinfoadmin : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v1.call(this, pqinfoadmin)
  end
  def get_id(this : IMSMQMessage2*, pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_id.call(this, pvarmsgid)
  end
  def get_correlation_id(this : IMSMQMessage2*, pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_correlation_id.call(this, pvarmsgid)
  end
  def put_correlation_id(this : IMSMQMessage2*, varmsgid : VARIANT) : HRESULT
    @lpVtbl.value.put_correlation_id.call(this, varmsgid)
  end
  def get_ack(this : IMSMQMessage2*, plack : Int32*) : HRESULT
    @lpVtbl.value.get_ack.call(this, plack)
  end
  def put_ack(this : IMSMQMessage2*, lack : Int32) : HRESULT
    @lpVtbl.value.put_ack.call(this, lack)
  end
  def get_label(this : IMSMQMessage2*, pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.call(this, pbstrlabel)
  end
  def put_label(this : IMSMQMessage2*, bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.call(this, bstrlabel)
  end
  def get_max_time_to_reach_queue(this : IMSMQMessage2*, plmaxtimetoreachqueue : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_reach_queue.call(this, plmaxtimetoreachqueue)
  end
  def put_max_time_to_reach_queue(this : IMSMQMessage2*, lmaxtimetoreachqueue : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_reach_queue.call(this, lmaxtimetoreachqueue)
  end
  def get_max_time_to_receive(this : IMSMQMessage2*, plmaxtimetoreceive : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_receive.call(this, plmaxtimetoreceive)
  end
  def put_max_time_to_receive(this : IMSMQMessage2*, lmaxtimetoreceive : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_receive.call(this, lmaxtimetoreceive)
  end
  def get_hash_algorithm(this : IMSMQMessage2*, plhashalg : Int32*) : HRESULT
    @lpVtbl.value.get_hash_algorithm.call(this, plhashalg)
  end
  def put_hash_algorithm(this : IMSMQMessage2*, lhashalg : Int32) : HRESULT
    @lpVtbl.value.put_hash_algorithm.call(this, lhashalg)
  end
  def get_encrypt_algorithm(this : IMSMQMessage2*, plencryptalg : Int32*) : HRESULT
    @lpVtbl.value.get_encrypt_algorithm.call(this, plencryptalg)
  end
  def put_encrypt_algorithm(this : IMSMQMessage2*, lencryptalg : Int32) : HRESULT
    @lpVtbl.value.put_encrypt_algorithm.call(this, lencryptalg)
  end
  def get_sent_time(this : IMSMQMessage2*, pvarsenttime : VARIANT*) : HRESULT
    @lpVtbl.value.get_sent_time.call(this, pvarsenttime)
  end
  def get_arrived_time(this : IMSMQMessage2*, plarrivedtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_arrived_time.call(this, plarrivedtime)
  end
  def get_destination_queue_info(this : IMSMQMessage2*, ppqinfodest : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_destination_queue_info.call(this, ppqinfodest)
  end
  def get_sender_certificate(this : IMSMQMessage2*, pvarsendercert : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_certificate.call(this, pvarsendercert)
  end
  def put_sender_certificate(this : IMSMQMessage2*, varsendercert : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_certificate.call(this, varsendercert)
  end
  def get_sender_id(this : IMSMQMessage2*, pvarsenderid : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_id.call(this, pvarsenderid)
  end
  def get_sender_id_type(this : IMSMQMessage2*, plsenderidtype : Int32*) : HRESULT
    @lpVtbl.value.get_sender_id_type.call(this, plsenderidtype)
  end
  def put_sender_id_type(this : IMSMQMessage2*, lsenderidtype : Int32) : HRESULT
    @lpVtbl.value.put_sender_id_type.call(this, lsenderidtype)
  end
  def send(this : IMSMQMessage2*, destinationqueue : IMSMQQueue2, transaction : VARIANT*) : HRESULT
    @lpVtbl.value.send.call(this, destinationqueue, transaction)
  end
  def attach_current_security_context(this : IMSMQMessage2*) : HRESULT
    @lpVtbl.value.attach_current_security_context.call(this)
  end
  def get_sender_version(this : IMSMQMessage2*, plsenderversion : Int32*) : HRESULT
    @lpVtbl.value.get_sender_version.call(this, plsenderversion)
  end
  def get_extension(this : IMSMQMessage2*, pvarextension : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension.call(this, pvarextension)
  end
  def put_extension(this : IMSMQMessage2*, varextension : VARIANT) : HRESULT
    @lpVtbl.value.put_extension.call(this, varextension)
  end
  def get_connector_type_guid(this : IMSMQMessage2*, pbstrguidconnectortype : UInt8**) : HRESULT
    @lpVtbl.value.get_connector_type_guid.call(this, pbstrguidconnectortype)
  end
  def put_connector_type_guid(this : IMSMQMessage2*, bstrguidconnectortype : UInt8*) : HRESULT
    @lpVtbl.value.put_connector_type_guid.call(this, bstrguidconnectortype)
  end
  def get_transaction_status_queue_info(this : IMSMQMessage2*, ppqinfoxactstatus : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_transaction_status_queue_info.call(this, ppqinfoxactstatus)
  end
  def get_destination_symmetric_key(this : IMSMQMessage2*, pvardestsymmkey : VARIANT*) : HRESULT
    @lpVtbl.value.get_destination_symmetric_key.call(this, pvardestsymmkey)
  end
  def put_destination_symmetric_key(this : IMSMQMessage2*, vardestsymmkey : VARIANT) : HRESULT
    @lpVtbl.value.put_destination_symmetric_key.call(this, vardestsymmkey)
  end
  def get_signature(this : IMSMQMessage2*, pvarsignature : VARIANT*) : HRESULT
    @lpVtbl.value.get_signature.call(this, pvarsignature)
  end
  def put_signature(this : IMSMQMessage2*, varsignature : VARIANT) : HRESULT
    @lpVtbl.value.put_signature.call(this, varsignature)
  end
  def get_authentication_provider_type(this : IMSMQMessage2*, plauthprovtype : Int32*) : HRESULT
    @lpVtbl.value.get_authentication_provider_type.call(this, plauthprovtype)
  end
  def put_authentication_provider_type(this : IMSMQMessage2*, lauthprovtype : Int32) : HRESULT
    @lpVtbl.value.put_authentication_provider_type.call(this, lauthprovtype)
  end
  def get_authentication_provider_name(this : IMSMQMessage2*, pbstrauthprovname : UInt8**) : HRESULT
    @lpVtbl.value.get_authentication_provider_name.call(this, pbstrauthprovname)
  end
  def put_authentication_provider_name(this : IMSMQMessage2*, bstrauthprovname : UInt8*) : HRESULT
    @lpVtbl.value.put_authentication_provider_name.call(this, bstrauthprovname)
  end
  def put_sender_id(this : IMSMQMessage2*, varsenderid : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_id.call(this, varsenderid)
  end
  def get_msg_class(this : IMSMQMessage2*, plmsgclass : Int32*) : HRESULT
    @lpVtbl.value.get_msg_class.call(this, plmsgclass)
  end
  def put_msg_class(this : IMSMQMessage2*, lmsgclass : Int32) : HRESULT
    @lpVtbl.value.put_msg_class.call(this, lmsgclass)
  end
  def get_properties(this : IMSMQMessage2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_transaction_id(this : IMSMQMessage2*, pvarxactid : VARIANT*) : HRESULT
    @lpVtbl.value.get_transaction_id.call(this, pvarxactid)
  end
  def get_is_first_in_transaction(this : IMSMQMessage2*, pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction.call(this, pisfirstinxact)
  end
  def get_is_last_in_transaction(this : IMSMQMessage2*, pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction.call(this, pislastinxact)
  end
  def get_response_queue_info(this : IMSMQMessage2*, ppqinforesponse : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_response_queue_info.call(this, ppqinforesponse)
  end
  def putref_response_queue_info(this : IMSMQMessage2*, pqinforesponse : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_response_queue_info.call(this, pqinforesponse)
  end
  def get_admin_queue_info(this : IMSMQMessage2*, ppqinfoadmin : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_admin_queue_info.call(this, ppqinfoadmin)
  end
  def putref_admin_queue_info(this : IMSMQMessage2*, pqinfoadmin : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_admin_queue_info.call(this, pqinfoadmin)
  end
  def get_received_authentication_level(this : IMSMQMessage2*, psreceivedauthenticationlevel : Int16*) : HRESULT
    @lpVtbl.value.get_received_authentication_level.call(this, psreceivedauthenticationlevel)
  end
end
struct LibWin32::IMSMQMessage3
  def query_interface(this : IMSMQMessage3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQMessage3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQMessage3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQMessage3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQMessage3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQMessage3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQMessage3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_class(this : IMSMQMessage3*, plclass : Int32*) : HRESULT
    @lpVtbl.value.get_class.call(this, plclass)
  end
  def get_priv_level(this : IMSMQMessage3*, plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.call(this, plprivlevel)
  end
  def put_priv_level(this : IMSMQMessage3*, lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.call(this, lprivlevel)
  end
  def get_auth_level(this : IMSMQMessage3*, plauthlevel : Int32*) : HRESULT
    @lpVtbl.value.get_auth_level.call(this, plauthlevel)
  end
  def put_auth_level(this : IMSMQMessage3*, lauthlevel : Int32) : HRESULT
    @lpVtbl.value.put_auth_level.call(this, lauthlevel)
  end
  def get_is_authenticated(this : IMSMQMessage3*, pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated.call(this, pisauthenticated)
  end
  def get_delivery(this : IMSMQMessage3*, pldelivery : Int32*) : HRESULT
    @lpVtbl.value.get_delivery.call(this, pldelivery)
  end
  def put_delivery(this : IMSMQMessage3*, ldelivery : Int32) : HRESULT
    @lpVtbl.value.put_delivery.call(this, ldelivery)
  end
  def get_trace(this : IMSMQMessage3*, pltrace : Int32*) : HRESULT
    @lpVtbl.value.get_trace.call(this, pltrace)
  end
  def put_trace(this : IMSMQMessage3*, ltrace : Int32) : HRESULT
    @lpVtbl.value.put_trace.call(this, ltrace)
  end
  def get_priority(this : IMSMQMessage3*, plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, plpriority)
  end
  def put_priority(this : IMSMQMessage3*, lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.call(this, lpriority)
  end
  def get_journal(this : IMSMQMessage3*, pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.call(this, pljournal)
  end
  def put_journal(this : IMSMQMessage3*, ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.call(this, ljournal)
  end
  def get_response_queue_info_v1(this : IMSMQMessage3*, ppqinforesponse : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v1.call(this, ppqinforesponse)
  end
  def putref_response_queue_info_v1(this : IMSMQMessage3*, pqinforesponse : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v1.call(this, pqinforesponse)
  end
  def get_app_specific(this : IMSMQMessage3*, plappspecific : Int32*) : HRESULT
    @lpVtbl.value.get_app_specific.call(this, plappspecific)
  end
  def put_app_specific(this : IMSMQMessage3*, lappspecific : Int32) : HRESULT
    @lpVtbl.value.put_app_specific.call(this, lappspecific)
  end
  def get_source_machine_guid(this : IMSMQMessage3*, pbstrguidsrcmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_source_machine_guid.call(this, pbstrguidsrcmachine)
  end
  def get_body_length(this : IMSMQMessage3*, pcbbody : Int32*) : HRESULT
    @lpVtbl.value.get_body_length.call(this, pcbbody)
  end
  def get_body(this : IMSMQMessage3*, pvarbody : VARIANT*) : HRESULT
    @lpVtbl.value.get_body.call(this, pvarbody)
  end
  def put_body(this : IMSMQMessage3*, varbody : VARIANT) : HRESULT
    @lpVtbl.value.put_body.call(this, varbody)
  end
  def get_admin_queue_info_v1(this : IMSMQMessage3*, ppqinfoadmin : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v1.call(this, ppqinfoadmin)
  end
  def putref_admin_queue_info_v1(this : IMSMQMessage3*, pqinfoadmin : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v1.call(this, pqinfoadmin)
  end
  def get_id(this : IMSMQMessage3*, pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_id.call(this, pvarmsgid)
  end
  def get_correlation_id(this : IMSMQMessage3*, pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_correlation_id.call(this, pvarmsgid)
  end
  def put_correlation_id(this : IMSMQMessage3*, varmsgid : VARIANT) : HRESULT
    @lpVtbl.value.put_correlation_id.call(this, varmsgid)
  end
  def get_ack(this : IMSMQMessage3*, plack : Int32*) : HRESULT
    @lpVtbl.value.get_ack.call(this, plack)
  end
  def put_ack(this : IMSMQMessage3*, lack : Int32) : HRESULT
    @lpVtbl.value.put_ack.call(this, lack)
  end
  def get_label(this : IMSMQMessage3*, pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.call(this, pbstrlabel)
  end
  def put_label(this : IMSMQMessage3*, bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.call(this, bstrlabel)
  end
  def get_max_time_to_reach_queue(this : IMSMQMessage3*, plmaxtimetoreachqueue : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_reach_queue.call(this, plmaxtimetoreachqueue)
  end
  def put_max_time_to_reach_queue(this : IMSMQMessage3*, lmaxtimetoreachqueue : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_reach_queue.call(this, lmaxtimetoreachqueue)
  end
  def get_max_time_to_receive(this : IMSMQMessage3*, plmaxtimetoreceive : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_receive.call(this, plmaxtimetoreceive)
  end
  def put_max_time_to_receive(this : IMSMQMessage3*, lmaxtimetoreceive : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_receive.call(this, lmaxtimetoreceive)
  end
  def get_hash_algorithm(this : IMSMQMessage3*, plhashalg : Int32*) : HRESULT
    @lpVtbl.value.get_hash_algorithm.call(this, plhashalg)
  end
  def put_hash_algorithm(this : IMSMQMessage3*, lhashalg : Int32) : HRESULT
    @lpVtbl.value.put_hash_algorithm.call(this, lhashalg)
  end
  def get_encrypt_algorithm(this : IMSMQMessage3*, plencryptalg : Int32*) : HRESULT
    @lpVtbl.value.get_encrypt_algorithm.call(this, plencryptalg)
  end
  def put_encrypt_algorithm(this : IMSMQMessage3*, lencryptalg : Int32) : HRESULT
    @lpVtbl.value.put_encrypt_algorithm.call(this, lencryptalg)
  end
  def get_sent_time(this : IMSMQMessage3*, pvarsenttime : VARIANT*) : HRESULT
    @lpVtbl.value.get_sent_time.call(this, pvarsenttime)
  end
  def get_arrived_time(this : IMSMQMessage3*, plarrivedtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_arrived_time.call(this, plarrivedtime)
  end
  def get_destination_queue_info(this : IMSMQMessage3*, ppqinfodest : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_destination_queue_info.call(this, ppqinfodest)
  end
  def get_sender_certificate(this : IMSMQMessage3*, pvarsendercert : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_certificate.call(this, pvarsendercert)
  end
  def put_sender_certificate(this : IMSMQMessage3*, varsendercert : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_certificate.call(this, varsendercert)
  end
  def get_sender_id(this : IMSMQMessage3*, pvarsenderid : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_id.call(this, pvarsenderid)
  end
  def get_sender_id_type(this : IMSMQMessage3*, plsenderidtype : Int32*) : HRESULT
    @lpVtbl.value.get_sender_id_type.call(this, plsenderidtype)
  end
  def put_sender_id_type(this : IMSMQMessage3*, lsenderidtype : Int32) : HRESULT
    @lpVtbl.value.put_sender_id_type.call(this, lsenderidtype)
  end
  def send(this : IMSMQMessage3*, destinationqueue : IDispatch, transaction : VARIANT*) : HRESULT
    @lpVtbl.value.send.call(this, destinationqueue, transaction)
  end
  def attach_current_security_context(this : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.attach_current_security_context.call(this)
  end
  def get_sender_version(this : IMSMQMessage3*, plsenderversion : Int32*) : HRESULT
    @lpVtbl.value.get_sender_version.call(this, plsenderversion)
  end
  def get_extension(this : IMSMQMessage3*, pvarextension : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension.call(this, pvarextension)
  end
  def put_extension(this : IMSMQMessage3*, varextension : VARIANT) : HRESULT
    @lpVtbl.value.put_extension.call(this, varextension)
  end
  def get_connector_type_guid(this : IMSMQMessage3*, pbstrguidconnectortype : UInt8**) : HRESULT
    @lpVtbl.value.get_connector_type_guid.call(this, pbstrguidconnectortype)
  end
  def put_connector_type_guid(this : IMSMQMessage3*, bstrguidconnectortype : UInt8*) : HRESULT
    @lpVtbl.value.put_connector_type_guid.call(this, bstrguidconnectortype)
  end
  def get_transaction_status_queue_info(this : IMSMQMessage3*, ppqinfoxactstatus : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_transaction_status_queue_info.call(this, ppqinfoxactstatus)
  end
  def get_destination_symmetric_key(this : IMSMQMessage3*, pvardestsymmkey : VARIANT*) : HRESULT
    @lpVtbl.value.get_destination_symmetric_key.call(this, pvardestsymmkey)
  end
  def put_destination_symmetric_key(this : IMSMQMessage3*, vardestsymmkey : VARIANT) : HRESULT
    @lpVtbl.value.put_destination_symmetric_key.call(this, vardestsymmkey)
  end
  def get_signature(this : IMSMQMessage3*, pvarsignature : VARIANT*) : HRESULT
    @lpVtbl.value.get_signature.call(this, pvarsignature)
  end
  def put_signature(this : IMSMQMessage3*, varsignature : VARIANT) : HRESULT
    @lpVtbl.value.put_signature.call(this, varsignature)
  end
  def get_authentication_provider_type(this : IMSMQMessage3*, plauthprovtype : Int32*) : HRESULT
    @lpVtbl.value.get_authentication_provider_type.call(this, plauthprovtype)
  end
  def put_authentication_provider_type(this : IMSMQMessage3*, lauthprovtype : Int32) : HRESULT
    @lpVtbl.value.put_authentication_provider_type.call(this, lauthprovtype)
  end
  def get_authentication_provider_name(this : IMSMQMessage3*, pbstrauthprovname : UInt8**) : HRESULT
    @lpVtbl.value.get_authentication_provider_name.call(this, pbstrauthprovname)
  end
  def put_authentication_provider_name(this : IMSMQMessage3*, bstrauthprovname : UInt8*) : HRESULT
    @lpVtbl.value.put_authentication_provider_name.call(this, bstrauthprovname)
  end
  def put_sender_id(this : IMSMQMessage3*, varsenderid : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_id.call(this, varsenderid)
  end
  def get_msg_class(this : IMSMQMessage3*, plmsgclass : Int32*) : HRESULT
    @lpVtbl.value.get_msg_class.call(this, plmsgclass)
  end
  def put_msg_class(this : IMSMQMessage3*, lmsgclass : Int32) : HRESULT
    @lpVtbl.value.put_msg_class.call(this, lmsgclass)
  end
  def get_properties(this : IMSMQMessage3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_transaction_id(this : IMSMQMessage3*, pvarxactid : VARIANT*) : HRESULT
    @lpVtbl.value.get_transaction_id.call(this, pvarxactid)
  end
  def get_is_first_in_transaction(this : IMSMQMessage3*, pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction.call(this, pisfirstinxact)
  end
  def get_is_last_in_transaction(this : IMSMQMessage3*, pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction.call(this, pislastinxact)
  end
  def get_response_queue_info_v2(this : IMSMQMessage3*, ppqinforesponse : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v2.call(this, ppqinforesponse)
  end
  def putref_response_queue_info_v2(this : IMSMQMessage3*, pqinforesponse : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v2.call(this, pqinforesponse)
  end
  def get_admin_queue_info_v2(this : IMSMQMessage3*, ppqinfoadmin : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v2.call(this, ppqinfoadmin)
  end
  def putref_admin_queue_info_v2(this : IMSMQMessage3*, pqinfoadmin : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v2.call(this, pqinfoadmin)
  end
  def get_received_authentication_level(this : IMSMQMessage3*, psreceivedauthenticationlevel : Int16*) : HRESULT
    @lpVtbl.value.get_received_authentication_level.call(this, psreceivedauthenticationlevel)
  end
  def get_response_queue_info(this : IMSMQMessage3*, ppqinforesponse : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_response_queue_info.call(this, ppqinforesponse)
  end
  def putref_response_queue_info(this : IMSMQMessage3*, pqinforesponse : IMSMQQueueInfo3) : HRESULT
    @lpVtbl.value.putref_response_queue_info.call(this, pqinforesponse)
  end
  def get_admin_queue_info(this : IMSMQMessage3*, ppqinfoadmin : IMSMQQueueInfo3*) : HRESULT
    @lpVtbl.value.get_admin_queue_info.call(this, ppqinfoadmin)
  end
  def putref_admin_queue_info(this : IMSMQMessage3*, pqinfoadmin : IMSMQQueueInfo3) : HRESULT
    @lpVtbl.value.putref_admin_queue_info.call(this, pqinfoadmin)
  end
  def get_response_destination(this : IMSMQMessage3*, ppdestresponse : IDispatch*) : HRESULT
    @lpVtbl.value.get_response_destination.call(this, ppdestresponse)
  end
  def putref_response_destination(this : IMSMQMessage3*, pdestresponse : IDispatch) : HRESULT
    @lpVtbl.value.putref_response_destination.call(this, pdestresponse)
  end
  def get_destination(this : IMSMQMessage3*, ppdestdestination : IDispatch*) : HRESULT
    @lpVtbl.value.get_destination.call(this, ppdestdestination)
  end
  def get_lookup_id(this : IMSMQMessage3*, pvarlookupid : VARIANT*) : HRESULT
    @lpVtbl.value.get_lookup_id.call(this, pvarlookupid)
  end
  def get_is_authenticated2(this : IMSMQMessage3*, pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated2.call(this, pisauthenticated)
  end
  def get_is_first_in_transaction2(this : IMSMQMessage3*, pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction2.call(this, pisfirstinxact)
  end
  def get_is_last_in_transaction2(this : IMSMQMessage3*, pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction2.call(this, pislastinxact)
  end
  def attach_current_security_context2(this : IMSMQMessage3*) : HRESULT
    @lpVtbl.value.attach_current_security_context2.call(this)
  end
  def get_soap_envelope(this : IMSMQMessage3*, pbstrsoapenvelope : UInt8**) : HRESULT
    @lpVtbl.value.get_soap_envelope.call(this, pbstrsoapenvelope)
  end
  def get_compound_message(this : IMSMQMessage3*, pvarcompoundmessage : VARIANT*) : HRESULT
    @lpVtbl.value.get_compound_message.call(this, pvarcompoundmessage)
  end
  def put_soap_header(this : IMSMQMessage3*, bstrsoapheader : UInt8*) : HRESULT
    @lpVtbl.value.put_soap_header.call(this, bstrsoapheader)
  end
  def put_soap_body(this : IMSMQMessage3*, bstrsoapbody : UInt8*) : HRESULT
    @lpVtbl.value.put_soap_body.call(this, bstrsoapbody)
  end
end
struct LibWin32::IMSMQMessage4
  def query_interface(this : IMSMQMessage4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQMessage4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQMessage4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQMessage4*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQMessage4*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQMessage4*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQMessage4*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_class(this : IMSMQMessage4*, plclass : Int32*) : HRESULT
    @lpVtbl.value.get_class.call(this, plclass)
  end
  def get_priv_level(this : IMSMQMessage4*, plprivlevel : Int32*) : HRESULT
    @lpVtbl.value.get_priv_level.call(this, plprivlevel)
  end
  def put_priv_level(this : IMSMQMessage4*, lprivlevel : Int32) : HRESULT
    @lpVtbl.value.put_priv_level.call(this, lprivlevel)
  end
  def get_auth_level(this : IMSMQMessage4*, plauthlevel : Int32*) : HRESULT
    @lpVtbl.value.get_auth_level.call(this, plauthlevel)
  end
  def put_auth_level(this : IMSMQMessage4*, lauthlevel : Int32) : HRESULT
    @lpVtbl.value.put_auth_level.call(this, lauthlevel)
  end
  def get_is_authenticated(this : IMSMQMessage4*, pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated.call(this, pisauthenticated)
  end
  def get_delivery(this : IMSMQMessage4*, pldelivery : Int32*) : HRESULT
    @lpVtbl.value.get_delivery.call(this, pldelivery)
  end
  def put_delivery(this : IMSMQMessage4*, ldelivery : Int32) : HRESULT
    @lpVtbl.value.put_delivery.call(this, ldelivery)
  end
  def get_trace(this : IMSMQMessage4*, pltrace : Int32*) : HRESULT
    @lpVtbl.value.get_trace.call(this, pltrace)
  end
  def put_trace(this : IMSMQMessage4*, ltrace : Int32) : HRESULT
    @lpVtbl.value.put_trace.call(this, ltrace)
  end
  def get_priority(this : IMSMQMessage4*, plpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, plpriority)
  end
  def put_priority(this : IMSMQMessage4*, lpriority : Int32) : HRESULT
    @lpVtbl.value.put_priority.call(this, lpriority)
  end
  def get_journal(this : IMSMQMessage4*, pljournal : Int32*) : HRESULT
    @lpVtbl.value.get_journal.call(this, pljournal)
  end
  def put_journal(this : IMSMQMessage4*, ljournal : Int32) : HRESULT
    @lpVtbl.value.put_journal.call(this, ljournal)
  end
  def get_response_queue_info_v1(this : IMSMQMessage4*, ppqinforesponse : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v1.call(this, ppqinforesponse)
  end
  def putref_response_queue_info_v1(this : IMSMQMessage4*, pqinforesponse : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v1.call(this, pqinforesponse)
  end
  def get_app_specific(this : IMSMQMessage4*, plappspecific : Int32*) : HRESULT
    @lpVtbl.value.get_app_specific.call(this, plappspecific)
  end
  def put_app_specific(this : IMSMQMessage4*, lappspecific : Int32) : HRESULT
    @lpVtbl.value.put_app_specific.call(this, lappspecific)
  end
  def get_source_machine_guid(this : IMSMQMessage4*, pbstrguidsrcmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_source_machine_guid.call(this, pbstrguidsrcmachine)
  end
  def get_body_length(this : IMSMQMessage4*, pcbbody : Int32*) : HRESULT
    @lpVtbl.value.get_body_length.call(this, pcbbody)
  end
  def get_body(this : IMSMQMessage4*, pvarbody : VARIANT*) : HRESULT
    @lpVtbl.value.get_body.call(this, pvarbody)
  end
  def put_body(this : IMSMQMessage4*, varbody : VARIANT) : HRESULT
    @lpVtbl.value.put_body.call(this, varbody)
  end
  def get_admin_queue_info_v1(this : IMSMQMessage4*, ppqinfoadmin : IMSMQQueueInfo*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v1.call(this, ppqinfoadmin)
  end
  def putref_admin_queue_info_v1(this : IMSMQMessage4*, pqinfoadmin : IMSMQQueueInfo) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v1.call(this, pqinfoadmin)
  end
  def get_id(this : IMSMQMessage4*, pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_id.call(this, pvarmsgid)
  end
  def get_correlation_id(this : IMSMQMessage4*, pvarmsgid : VARIANT*) : HRESULT
    @lpVtbl.value.get_correlation_id.call(this, pvarmsgid)
  end
  def put_correlation_id(this : IMSMQMessage4*, varmsgid : VARIANT) : HRESULT
    @lpVtbl.value.put_correlation_id.call(this, varmsgid)
  end
  def get_ack(this : IMSMQMessage4*, plack : Int32*) : HRESULT
    @lpVtbl.value.get_ack.call(this, plack)
  end
  def put_ack(this : IMSMQMessage4*, lack : Int32) : HRESULT
    @lpVtbl.value.put_ack.call(this, lack)
  end
  def get_label(this : IMSMQMessage4*, pbstrlabel : UInt8**) : HRESULT
    @lpVtbl.value.get_label.call(this, pbstrlabel)
  end
  def put_label(this : IMSMQMessage4*, bstrlabel : UInt8*) : HRESULT
    @lpVtbl.value.put_label.call(this, bstrlabel)
  end
  def get_max_time_to_reach_queue(this : IMSMQMessage4*, plmaxtimetoreachqueue : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_reach_queue.call(this, plmaxtimetoreachqueue)
  end
  def put_max_time_to_reach_queue(this : IMSMQMessage4*, lmaxtimetoreachqueue : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_reach_queue.call(this, lmaxtimetoreachqueue)
  end
  def get_max_time_to_receive(this : IMSMQMessage4*, plmaxtimetoreceive : Int32*) : HRESULT
    @lpVtbl.value.get_max_time_to_receive.call(this, plmaxtimetoreceive)
  end
  def put_max_time_to_receive(this : IMSMQMessage4*, lmaxtimetoreceive : Int32) : HRESULT
    @lpVtbl.value.put_max_time_to_receive.call(this, lmaxtimetoreceive)
  end
  def get_hash_algorithm(this : IMSMQMessage4*, plhashalg : Int32*) : HRESULT
    @lpVtbl.value.get_hash_algorithm.call(this, plhashalg)
  end
  def put_hash_algorithm(this : IMSMQMessage4*, lhashalg : Int32) : HRESULT
    @lpVtbl.value.put_hash_algorithm.call(this, lhashalg)
  end
  def get_encrypt_algorithm(this : IMSMQMessage4*, plencryptalg : Int32*) : HRESULT
    @lpVtbl.value.get_encrypt_algorithm.call(this, plencryptalg)
  end
  def put_encrypt_algorithm(this : IMSMQMessage4*, lencryptalg : Int32) : HRESULT
    @lpVtbl.value.put_encrypt_algorithm.call(this, lencryptalg)
  end
  def get_sent_time(this : IMSMQMessage4*, pvarsenttime : VARIANT*) : HRESULT
    @lpVtbl.value.get_sent_time.call(this, pvarsenttime)
  end
  def get_arrived_time(this : IMSMQMessage4*, plarrivedtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_arrived_time.call(this, plarrivedtime)
  end
  def get_destination_queue_info(this : IMSMQMessage4*, ppqinfodest : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_destination_queue_info.call(this, ppqinfodest)
  end
  def get_sender_certificate(this : IMSMQMessage4*, pvarsendercert : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_certificate.call(this, pvarsendercert)
  end
  def put_sender_certificate(this : IMSMQMessage4*, varsendercert : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_certificate.call(this, varsendercert)
  end
  def get_sender_id(this : IMSMQMessage4*, pvarsenderid : VARIANT*) : HRESULT
    @lpVtbl.value.get_sender_id.call(this, pvarsenderid)
  end
  def get_sender_id_type(this : IMSMQMessage4*, plsenderidtype : Int32*) : HRESULT
    @lpVtbl.value.get_sender_id_type.call(this, plsenderidtype)
  end
  def put_sender_id_type(this : IMSMQMessage4*, lsenderidtype : Int32) : HRESULT
    @lpVtbl.value.put_sender_id_type.call(this, lsenderidtype)
  end
  def send(this : IMSMQMessage4*, destinationqueue : IDispatch, transaction : VARIANT*) : HRESULT
    @lpVtbl.value.send.call(this, destinationqueue, transaction)
  end
  def attach_current_security_context(this : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.attach_current_security_context.call(this)
  end
  def get_sender_version(this : IMSMQMessage4*, plsenderversion : Int32*) : HRESULT
    @lpVtbl.value.get_sender_version.call(this, plsenderversion)
  end
  def get_extension(this : IMSMQMessage4*, pvarextension : VARIANT*) : HRESULT
    @lpVtbl.value.get_extension.call(this, pvarextension)
  end
  def put_extension(this : IMSMQMessage4*, varextension : VARIANT) : HRESULT
    @lpVtbl.value.put_extension.call(this, varextension)
  end
  def get_connector_type_guid(this : IMSMQMessage4*, pbstrguidconnectortype : UInt8**) : HRESULT
    @lpVtbl.value.get_connector_type_guid.call(this, pbstrguidconnectortype)
  end
  def put_connector_type_guid(this : IMSMQMessage4*, bstrguidconnectortype : UInt8*) : HRESULT
    @lpVtbl.value.put_connector_type_guid.call(this, bstrguidconnectortype)
  end
  def get_transaction_status_queue_info(this : IMSMQMessage4*, ppqinfoxactstatus : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_transaction_status_queue_info.call(this, ppqinfoxactstatus)
  end
  def get_destination_symmetric_key(this : IMSMQMessage4*, pvardestsymmkey : VARIANT*) : HRESULT
    @lpVtbl.value.get_destination_symmetric_key.call(this, pvardestsymmkey)
  end
  def put_destination_symmetric_key(this : IMSMQMessage4*, vardestsymmkey : VARIANT) : HRESULT
    @lpVtbl.value.put_destination_symmetric_key.call(this, vardestsymmkey)
  end
  def get_signature(this : IMSMQMessage4*, pvarsignature : VARIANT*) : HRESULT
    @lpVtbl.value.get_signature.call(this, pvarsignature)
  end
  def put_signature(this : IMSMQMessage4*, varsignature : VARIANT) : HRESULT
    @lpVtbl.value.put_signature.call(this, varsignature)
  end
  def get_authentication_provider_type(this : IMSMQMessage4*, plauthprovtype : Int32*) : HRESULT
    @lpVtbl.value.get_authentication_provider_type.call(this, plauthprovtype)
  end
  def put_authentication_provider_type(this : IMSMQMessage4*, lauthprovtype : Int32) : HRESULT
    @lpVtbl.value.put_authentication_provider_type.call(this, lauthprovtype)
  end
  def get_authentication_provider_name(this : IMSMQMessage4*, pbstrauthprovname : UInt8**) : HRESULT
    @lpVtbl.value.get_authentication_provider_name.call(this, pbstrauthprovname)
  end
  def put_authentication_provider_name(this : IMSMQMessage4*, bstrauthprovname : UInt8*) : HRESULT
    @lpVtbl.value.put_authentication_provider_name.call(this, bstrauthprovname)
  end
  def put_sender_id(this : IMSMQMessage4*, varsenderid : VARIANT) : HRESULT
    @lpVtbl.value.put_sender_id.call(this, varsenderid)
  end
  def get_msg_class(this : IMSMQMessage4*, plmsgclass : Int32*) : HRESULT
    @lpVtbl.value.get_msg_class.call(this, plmsgclass)
  end
  def put_msg_class(this : IMSMQMessage4*, lmsgclass : Int32) : HRESULT
    @lpVtbl.value.put_msg_class.call(this, lmsgclass)
  end
  def get_properties(this : IMSMQMessage4*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_transaction_id(this : IMSMQMessage4*, pvarxactid : VARIANT*) : HRESULT
    @lpVtbl.value.get_transaction_id.call(this, pvarxactid)
  end
  def get_is_first_in_transaction(this : IMSMQMessage4*, pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction.call(this, pisfirstinxact)
  end
  def get_is_last_in_transaction(this : IMSMQMessage4*, pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction.call(this, pislastinxact)
  end
  def get_response_queue_info_v2(this : IMSMQMessage4*, ppqinforesponse : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_response_queue_info_v2.call(this, ppqinforesponse)
  end
  def putref_response_queue_info_v2(this : IMSMQMessage4*, pqinforesponse : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_response_queue_info_v2.call(this, pqinforesponse)
  end
  def get_admin_queue_info_v2(this : IMSMQMessage4*, ppqinfoadmin : IMSMQQueueInfo2*) : HRESULT
    @lpVtbl.value.get_admin_queue_info_v2.call(this, ppqinfoadmin)
  end
  def putref_admin_queue_info_v2(this : IMSMQMessage4*, pqinfoadmin : IMSMQQueueInfo2) : HRESULT
    @lpVtbl.value.putref_admin_queue_info_v2.call(this, pqinfoadmin)
  end
  def get_received_authentication_level(this : IMSMQMessage4*, psreceivedauthenticationlevel : Int16*) : HRESULT
    @lpVtbl.value.get_received_authentication_level.call(this, psreceivedauthenticationlevel)
  end
  def get_response_queue_info(this : IMSMQMessage4*, ppqinforesponse : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_response_queue_info.call(this, ppqinforesponse)
  end
  def putref_response_queue_info(this : IMSMQMessage4*, pqinforesponse : IMSMQQueueInfo4) : HRESULT
    @lpVtbl.value.putref_response_queue_info.call(this, pqinforesponse)
  end
  def get_admin_queue_info(this : IMSMQMessage4*, ppqinfoadmin : IMSMQQueueInfo4*) : HRESULT
    @lpVtbl.value.get_admin_queue_info.call(this, ppqinfoadmin)
  end
  def putref_admin_queue_info(this : IMSMQMessage4*, pqinfoadmin : IMSMQQueueInfo4) : HRESULT
    @lpVtbl.value.putref_admin_queue_info.call(this, pqinfoadmin)
  end
  def get_response_destination(this : IMSMQMessage4*, ppdestresponse : IDispatch*) : HRESULT
    @lpVtbl.value.get_response_destination.call(this, ppdestresponse)
  end
  def putref_response_destination(this : IMSMQMessage4*, pdestresponse : IDispatch) : HRESULT
    @lpVtbl.value.putref_response_destination.call(this, pdestresponse)
  end
  def get_destination(this : IMSMQMessage4*, ppdestdestination : IDispatch*) : HRESULT
    @lpVtbl.value.get_destination.call(this, ppdestdestination)
  end
  def get_lookup_id(this : IMSMQMessage4*, pvarlookupid : VARIANT*) : HRESULT
    @lpVtbl.value.get_lookup_id.call(this, pvarlookupid)
  end
  def get_is_authenticated2(this : IMSMQMessage4*, pisauthenticated : Int16*) : HRESULT
    @lpVtbl.value.get_is_authenticated2.call(this, pisauthenticated)
  end
  def get_is_first_in_transaction2(this : IMSMQMessage4*, pisfirstinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_first_in_transaction2.call(this, pisfirstinxact)
  end
  def get_is_last_in_transaction2(this : IMSMQMessage4*, pislastinxact : Int16*) : HRESULT
    @lpVtbl.value.get_is_last_in_transaction2.call(this, pislastinxact)
  end
  def attach_current_security_context2(this : IMSMQMessage4*) : HRESULT
    @lpVtbl.value.attach_current_security_context2.call(this)
  end
  def get_soap_envelope(this : IMSMQMessage4*, pbstrsoapenvelope : UInt8**) : HRESULT
    @lpVtbl.value.get_soap_envelope.call(this, pbstrsoapenvelope)
  end
  def get_compound_message(this : IMSMQMessage4*, pvarcompoundmessage : VARIANT*) : HRESULT
    @lpVtbl.value.get_compound_message.call(this, pvarcompoundmessage)
  end
  def put_soap_header(this : IMSMQMessage4*, bstrsoapheader : UInt8*) : HRESULT
    @lpVtbl.value.put_soap_header.call(this, bstrsoapheader)
  end
  def put_soap_body(this : IMSMQMessage4*, bstrsoapbody : UInt8*) : HRESULT
    @lpVtbl.value.put_soap_body.call(this, bstrsoapbody)
  end
end
struct LibWin32::IMSMQPrivateEvent
  def query_interface(this : IMSMQPrivateEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQPrivateEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQPrivateEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQPrivateEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQPrivateEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQPrivateEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQPrivateEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_hwnd(this : IMSMQPrivateEvent*, phwnd : Int32*) : HRESULT
    @lpVtbl.value.get_hwnd.call(this, phwnd)
  end
  def fire_arrived_event(this : IMSMQPrivateEvent*, pq : IMSMQQueue, msgcursor : Int32) : HRESULT
    @lpVtbl.value.fire_arrived_event.call(this, pq, msgcursor)
  end
  def fire_arrived_error_event(this : IMSMQPrivateEvent*, pq : IMSMQQueue, hrstatus : HRESULT, msgcursor : Int32) : HRESULT
    @lpVtbl.value.fire_arrived_error_event.call(this, pq, hrstatus, msgcursor)
  end
end
struct LibWin32::IDMSMQEventEvents
  def query_interface(this : IDMSMQEventEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDMSMQEventEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDMSMQEventEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IDMSMQEventEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IDMSMQEventEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IDMSMQEventEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IDMSMQEventEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IMSMQTransaction2
  def query_interface(this : IMSMQTransaction2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQTransaction2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQTransaction2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQTransaction2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQTransaction2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQTransaction2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQTransaction2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_transaction(this : IMSMQTransaction2*, pltransaction : Int32*) : HRESULT
    @lpVtbl.value.get_transaction.call(this, pltransaction)
  end
  def commit(this : IMSMQTransaction2*, fretaining : VARIANT*, grftc : VARIANT*, grfrm : VARIANT*) : HRESULT
    @lpVtbl.value.commit.call(this, fretaining, grftc, grfrm)
  end
  def abort(this : IMSMQTransaction2*, fretaining : VARIANT*, fasync : VARIANT*) : HRESULT
    @lpVtbl.value.abort.call(this, fretaining, fasync)
  end
  def init_new(this : IMSMQTransaction2*, vartransaction : VARIANT) : HRESULT
    @lpVtbl.value.init_new.call(this, vartransaction)
  end
  def get_properties(this : IMSMQTransaction2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQTransaction3
  def query_interface(this : IMSMQTransaction3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQTransaction3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQTransaction3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQTransaction3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQTransaction3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQTransaction3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQTransaction3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_transaction(this : IMSMQTransaction3*, pltransaction : Int32*) : HRESULT
    @lpVtbl.value.get_transaction.call(this, pltransaction)
  end
  def commit(this : IMSMQTransaction3*, fretaining : VARIANT*, grftc : VARIANT*, grfrm : VARIANT*) : HRESULT
    @lpVtbl.value.commit.call(this, fretaining, grftc, grfrm)
  end
  def abort(this : IMSMQTransaction3*, fretaining : VARIANT*, fasync : VARIANT*) : HRESULT
    @lpVtbl.value.abort.call(this, fretaining, fasync)
  end
  def init_new(this : IMSMQTransaction3*, vartransaction : VARIANT) : HRESULT
    @lpVtbl.value.init_new.call(this, vartransaction)
  end
  def get_properties(this : IMSMQTransaction3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_i_transaction(this : IMSMQTransaction3*, pvaritransaction : VARIANT*) : HRESULT
    @lpVtbl.value.get_i_transaction.call(this, pvaritransaction)
  end
end
struct LibWin32::IMSMQCoordinatedTransactionDispenser2
  def query_interface(this : IMSMQCoordinatedTransactionDispenser2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQCoordinatedTransactionDispenser2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQCoordinatedTransactionDispenser2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQCoordinatedTransactionDispenser2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQCoordinatedTransactionDispenser2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQCoordinatedTransactionDispenser2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQCoordinatedTransactionDispenser2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def begin_transaction(this : IMSMQCoordinatedTransactionDispenser2*, ptransaction : IMSMQTransaction2*) : HRESULT
    @lpVtbl.value.begin_transaction.call(this, ptransaction)
  end
  def get_properties(this : IMSMQCoordinatedTransactionDispenser2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQCoordinatedTransactionDispenser3
  def query_interface(this : IMSMQCoordinatedTransactionDispenser3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQCoordinatedTransactionDispenser3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQCoordinatedTransactionDispenser3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQCoordinatedTransactionDispenser3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQCoordinatedTransactionDispenser3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQCoordinatedTransactionDispenser3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQCoordinatedTransactionDispenser3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def begin_transaction(this : IMSMQCoordinatedTransactionDispenser3*, ptransaction : IMSMQTransaction3*) : HRESULT
    @lpVtbl.value.begin_transaction.call(this, ptransaction)
  end
  def get_properties(this : IMSMQCoordinatedTransactionDispenser3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQTransactionDispenser2
  def query_interface(this : IMSMQTransactionDispenser2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQTransactionDispenser2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQTransactionDispenser2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQTransactionDispenser2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQTransactionDispenser2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQTransactionDispenser2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQTransactionDispenser2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def begin_transaction(this : IMSMQTransactionDispenser2*, ptransaction : IMSMQTransaction2*) : HRESULT
    @lpVtbl.value.begin_transaction.call(this, ptransaction)
  end
  def get_properties(this : IMSMQTransactionDispenser2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQTransactionDispenser3
  def query_interface(this : IMSMQTransactionDispenser3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQTransactionDispenser3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQTransactionDispenser3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQTransactionDispenser3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQTransactionDispenser3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQTransactionDispenser3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQTransactionDispenser3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def begin_transaction(this : IMSMQTransactionDispenser3*, ptransaction : IMSMQTransaction3*) : HRESULT
    @lpVtbl.value.begin_transaction.call(this, ptransaction)
  end
  def get_properties(this : IMSMQTransactionDispenser3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQApplication
  def query_interface(this : IMSMQApplication*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQApplication*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQApplication*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQApplication*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQApplication*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQApplication*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQApplication*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def machine_id_of_machine_name(this : IMSMQApplication*, machinename : UInt8*, pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.machine_id_of_machine_name.call(this, machinename, pbstrguid)
  end
end
struct LibWin32::IMSMQApplication2
  def query_interface(this : IMSMQApplication2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQApplication2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQApplication2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQApplication2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQApplication2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQApplication2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQApplication2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def machine_id_of_machine_name(this : IMSMQApplication2*, machinename : UInt8*, pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.machine_id_of_machine_name.call(this, machinename, pbstrguid)
  end
  def register_certificate(this : IMSMQApplication2*, flags : VARIANT*, externalcertificate : VARIANT*) : HRESULT
    @lpVtbl.value.register_certificate.call(this, flags, externalcertificate)
  end
  def machine_name_of_machine_id(this : IMSMQApplication2*, bstrguid : UInt8*, pbstrmachinename : UInt8**) : HRESULT
    @lpVtbl.value.machine_name_of_machine_id.call(this, bstrguid, pbstrmachinename)
  end
  def get_msmq_version_major(this : IMSMQApplication2*, psmsmqversionmajor : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_major.call(this, psmsmqversionmajor)
  end
  def get_msmq_version_minor(this : IMSMQApplication2*, psmsmqversionminor : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_minor.call(this, psmsmqversionminor)
  end
  def get_msmq_version_build(this : IMSMQApplication2*, psmsmqversionbuild : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_build.call(this, psmsmqversionbuild)
  end
  def get_is_ds_enabled(this : IMSMQApplication2*, pfisdsenabled : Int16*) : HRESULT
    @lpVtbl.value.get_is_ds_enabled.call(this, pfisdsenabled)
  end
  def get_properties(this : IMSMQApplication2*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQApplication3
  def query_interface(this : IMSMQApplication3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQApplication3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQApplication3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQApplication3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQApplication3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQApplication3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQApplication3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def machine_id_of_machine_name(this : IMSMQApplication3*, machinename : UInt8*, pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.machine_id_of_machine_name.call(this, machinename, pbstrguid)
  end
  def register_certificate(this : IMSMQApplication3*, flags : VARIANT*, externalcertificate : VARIANT*) : HRESULT
    @lpVtbl.value.register_certificate.call(this, flags, externalcertificate)
  end
  def machine_name_of_machine_id(this : IMSMQApplication3*, bstrguid : UInt8*, pbstrmachinename : UInt8**) : HRESULT
    @lpVtbl.value.machine_name_of_machine_id.call(this, bstrguid, pbstrmachinename)
  end
  def get_msmq_version_major(this : IMSMQApplication3*, psmsmqversionmajor : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_major.call(this, psmsmqversionmajor)
  end
  def get_msmq_version_minor(this : IMSMQApplication3*, psmsmqversionminor : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_minor.call(this, psmsmqversionminor)
  end
  def get_msmq_version_build(this : IMSMQApplication3*, psmsmqversionbuild : Int16*) : HRESULT
    @lpVtbl.value.get_msmq_version_build.call(this, psmsmqversionbuild)
  end
  def get_is_ds_enabled(this : IMSMQApplication3*, pfisdsenabled : Int16*) : HRESULT
    @lpVtbl.value.get_is_ds_enabled.call(this, pfisdsenabled)
  end
  def get_properties(this : IMSMQApplication3*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
  def get_active_queues(this : IMSMQApplication3*, pvactivequeues : VARIANT*) : HRESULT
    @lpVtbl.value.get_active_queues.call(this, pvactivequeues)
  end
  def get_private_queues(this : IMSMQApplication3*, pvprivatequeues : VARIANT*) : HRESULT
    @lpVtbl.value.get_private_queues.call(this, pvprivatequeues)
  end
  def get_directory_service_server(this : IMSMQApplication3*, pbstrdirectoryserviceserver : UInt8**) : HRESULT
    @lpVtbl.value.get_directory_service_server.call(this, pbstrdirectoryserviceserver)
  end
  def get_is_connected(this : IMSMQApplication3*, pfisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected.call(this, pfisconnected)
  end
  def get_bytes_in_all_queues(this : IMSMQApplication3*, pvbytesinallqueues : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_all_queues.call(this, pvbytesinallqueues)
  end
  def put_machine(this : IMSMQApplication3*, bstrmachine : UInt8*) : HRESULT
    @lpVtbl.value.put_machine.call(this, bstrmachine)
  end
  def get_machine(this : IMSMQApplication3*, pbstrmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_machine.call(this, pbstrmachine)
  end
  def connect(this : IMSMQApplication3*) : HRESULT
    @lpVtbl.value.connect.call(this)
  end
  def disconnect(this : IMSMQApplication3*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
  def tidy(this : IMSMQApplication3*) : HRESULT
    @lpVtbl.value.tidy.call(this)
  end
end
struct LibWin32::IMSMQDestination
  def query_interface(this : IMSMQDestination*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQDestination*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQDestination*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQDestination*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQDestination*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQDestination*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQDestination*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def open(this : IMSMQDestination*) : HRESULT
    @lpVtbl.value.open.call(this)
  end
  def close(this : IMSMQDestination*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def get_is_open(this : IMSMQDestination*, pfisopen : Int16*) : HRESULT
    @lpVtbl.value.get_is_open.call(this, pfisopen)
  end
  def get_ia_ds(this : IMSMQDestination*, ppiads : IDispatch*) : HRESULT
    @lpVtbl.value.get_ia_ds.call(this, ppiads)
  end
  def putref_ia_ds(this : IMSMQDestination*, piads : IDispatch) : HRESULT
    @lpVtbl.value.putref_ia_ds.call(this, piads)
  end
  def get_a_ds_path(this : IMSMQDestination*, pbstradspath : UInt8**) : HRESULT
    @lpVtbl.value.get_a_ds_path.call(this, pbstradspath)
  end
  def put_a_ds_path(this : IMSMQDestination*, bstradspath : UInt8*) : HRESULT
    @lpVtbl.value.put_a_ds_path.call(this, bstradspath)
  end
  def get_path_name(this : IMSMQDestination*, pbstrpathname : UInt8**) : HRESULT
    @lpVtbl.value.get_path_name.call(this, pbstrpathname)
  end
  def put_path_name(this : IMSMQDestination*, bstrpathname : UInt8*) : HRESULT
    @lpVtbl.value.put_path_name.call(this, bstrpathname)
  end
  def get_format_name(this : IMSMQDestination*, pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.call(this, pbstrformatname)
  end
  def put_format_name(this : IMSMQDestination*, bstrformatname : UInt8*) : HRESULT
    @lpVtbl.value.put_format_name.call(this, bstrformatname)
  end
  def get_destinations(this : IMSMQDestination*, ppdestinations : IDispatch*) : HRESULT
    @lpVtbl.value.get_destinations.call(this, ppdestinations)
  end
  def putref_destinations(this : IMSMQDestination*, pdestinations : IDispatch) : HRESULT
    @lpVtbl.value.putref_destinations.call(this, pdestinations)
  end
  def get_properties(this : IMSMQDestination*, ppcolproperties : IDispatch*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppcolproperties)
  end
end
struct LibWin32::IMSMQPrivateDestination
  def query_interface(this : IMSMQPrivateDestination*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQPrivateDestination*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQPrivateDestination*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQPrivateDestination*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQPrivateDestination*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQPrivateDestination*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQPrivateDestination*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_handle(this : IMSMQPrivateDestination*, pvarhandle : VARIANT*) : HRESULT
    @lpVtbl.value.get_handle.call(this, pvarhandle)
  end
  def put_handle(this : IMSMQPrivateDestination*, varhandle : VARIANT) : HRESULT
    @lpVtbl.value.put_handle.call(this, varhandle)
  end
end
struct LibWin32::IMSMQCollection
  def query_interface(this : IMSMQCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def item(this : IMSMQCollection*, index : VARIANT*, pvarret : VARIANT*) : HRESULT
    @lpVtbl.value.item.call(this, index, pvarret)
  end
  def get_count(this : IMSMQCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def _new_enum(this : IMSMQCollection*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value._new_enum.call(this, ppunk)
  end
end
struct LibWin32::IMSMQManagement
  def query_interface(this : IMSMQManagement*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQManagement*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQManagement*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQManagement*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQManagement*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQManagement*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQManagement*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def init(this : IMSMQManagement*, machine : VARIANT*, pathname : VARIANT*, formatname : VARIANT*) : HRESULT
    @lpVtbl.value.init.call(this, machine, pathname, formatname)
  end
  def get_format_name(this : IMSMQManagement*, pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.call(this, pbstrformatname)
  end
  def get_machine(this : IMSMQManagement*, pbstrmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_machine.call(this, pbstrmachine)
  end
  def get_message_count(this : IMSMQManagement*, plmessagecount : Int32*) : HRESULT
    @lpVtbl.value.get_message_count.call(this, plmessagecount)
  end
  def get_foreign_status(this : IMSMQManagement*, plforeignstatus : Int32*) : HRESULT
    @lpVtbl.value.get_foreign_status.call(this, plforeignstatus)
  end
  def get_queue_type(this : IMSMQManagement*, plqueuetype : Int32*) : HRESULT
    @lpVtbl.value.get_queue_type.call(this, plqueuetype)
  end
  def get_is_local(this : IMSMQManagement*, pfislocal : Int16*) : HRESULT
    @lpVtbl.value.get_is_local.call(this, pfislocal)
  end
  def get_transactional_status(this : IMSMQManagement*, pltransactionalstatus : Int32*) : HRESULT
    @lpVtbl.value.get_transactional_status.call(this, pltransactionalstatus)
  end
  def get_bytes_in_queue(this : IMSMQManagement*, pvbytesinqueue : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_queue.call(this, pvbytesinqueue)
  end
end
struct LibWin32::IMSMQOutgoingQueueManagement
  def query_interface(this : IMSMQOutgoingQueueManagement*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQOutgoingQueueManagement*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQOutgoingQueueManagement*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQOutgoingQueueManagement*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQOutgoingQueueManagement*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQOutgoingQueueManagement*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQOutgoingQueueManagement*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def init(this : IMSMQOutgoingQueueManagement*, machine : VARIANT*, pathname : VARIANT*, formatname : VARIANT*) : HRESULT
    @lpVtbl.value.init.call(this, machine, pathname, formatname)
  end
  def get_format_name(this : IMSMQOutgoingQueueManagement*, pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.call(this, pbstrformatname)
  end
  def get_machine(this : IMSMQOutgoingQueueManagement*, pbstrmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_machine.call(this, pbstrmachine)
  end
  def get_message_count(this : IMSMQOutgoingQueueManagement*, plmessagecount : Int32*) : HRESULT
    @lpVtbl.value.get_message_count.call(this, plmessagecount)
  end
  def get_foreign_status(this : IMSMQOutgoingQueueManagement*, plforeignstatus : Int32*) : HRESULT
    @lpVtbl.value.get_foreign_status.call(this, plforeignstatus)
  end
  def get_queue_type(this : IMSMQOutgoingQueueManagement*, plqueuetype : Int32*) : HRESULT
    @lpVtbl.value.get_queue_type.call(this, plqueuetype)
  end
  def get_is_local(this : IMSMQOutgoingQueueManagement*, pfislocal : Int16*) : HRESULT
    @lpVtbl.value.get_is_local.call(this, pfislocal)
  end
  def get_transactional_status(this : IMSMQOutgoingQueueManagement*, pltransactionalstatus : Int32*) : HRESULT
    @lpVtbl.value.get_transactional_status.call(this, pltransactionalstatus)
  end
  def get_bytes_in_queue(this : IMSMQOutgoingQueueManagement*, pvbytesinqueue : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_queue.call(this, pvbytesinqueue)
  end
  def get_state(this : IMSMQOutgoingQueueManagement*, plstate : Int32*) : HRESULT
    @lpVtbl.value.get_state.call(this, plstate)
  end
  def get_next_hops(this : IMSMQOutgoingQueueManagement*, pvnexthops : VARIANT*) : HRESULT
    @lpVtbl.value.get_next_hops.call(this, pvnexthops)
  end
  def eod_get_send_info(this : IMSMQOutgoingQueueManagement*, ppcollection : IMSMQCollection*) : HRESULT
    @lpVtbl.value.eod_get_send_info.call(this, ppcollection)
  end
  def resume(this : IMSMQOutgoingQueueManagement*) : HRESULT
    @lpVtbl.value.resume.call(this)
  end
  def pause(this : IMSMQOutgoingQueueManagement*) : HRESULT
    @lpVtbl.value.pause.call(this)
  end
  def eod_resend(this : IMSMQOutgoingQueueManagement*) : HRESULT
    @lpVtbl.value.eod_resend.call(this)
  end
end
struct LibWin32::IMSMQQueueManagement
  def query_interface(this : IMSMQQueueManagement*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMSMQQueueManagement*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMSMQQueueManagement*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMSMQQueueManagement*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMSMQQueueManagement*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMSMQQueueManagement*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMSMQQueueManagement*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def init(this : IMSMQQueueManagement*, machine : VARIANT*, pathname : VARIANT*, formatname : VARIANT*) : HRESULT
    @lpVtbl.value.init.call(this, machine, pathname, formatname)
  end
  def get_format_name(this : IMSMQQueueManagement*, pbstrformatname : UInt8**) : HRESULT
    @lpVtbl.value.get_format_name.call(this, pbstrformatname)
  end
  def get_machine(this : IMSMQQueueManagement*, pbstrmachine : UInt8**) : HRESULT
    @lpVtbl.value.get_machine.call(this, pbstrmachine)
  end
  def get_message_count(this : IMSMQQueueManagement*, plmessagecount : Int32*) : HRESULT
    @lpVtbl.value.get_message_count.call(this, plmessagecount)
  end
  def get_foreign_status(this : IMSMQQueueManagement*, plforeignstatus : Int32*) : HRESULT
    @lpVtbl.value.get_foreign_status.call(this, plforeignstatus)
  end
  def get_queue_type(this : IMSMQQueueManagement*, plqueuetype : Int32*) : HRESULT
    @lpVtbl.value.get_queue_type.call(this, plqueuetype)
  end
  def get_is_local(this : IMSMQQueueManagement*, pfislocal : Int16*) : HRESULT
    @lpVtbl.value.get_is_local.call(this, pfislocal)
  end
  def get_transactional_status(this : IMSMQQueueManagement*, pltransactionalstatus : Int32*) : HRESULT
    @lpVtbl.value.get_transactional_status.call(this, pltransactionalstatus)
  end
  def get_bytes_in_queue(this : IMSMQQueueManagement*, pvbytesinqueue : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_queue.call(this, pvbytesinqueue)
  end
  def get_journal_message_count(this : IMSMQQueueManagement*, pljournalmessagecount : Int32*) : HRESULT
    @lpVtbl.value.get_journal_message_count.call(this, pljournalmessagecount)
  end
  def get_bytes_in_journal(this : IMSMQQueueManagement*, pvbytesinjournal : VARIANT*) : HRESULT
    @lpVtbl.value.get_bytes_in_journal.call(this, pvbytesinjournal)
  end
  def eod_get_receive_info(this : IMSMQQueueManagement*, pvcollection : VARIANT*) : HRESULT
    @lpVtbl.value.eod_get_receive_info.call(this, pvcollection)
  end
end
