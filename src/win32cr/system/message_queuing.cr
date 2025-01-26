require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::MessageQueuing
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
  MSMQ_CONNECTED = "CONNECTED"
  MSMQ_DISCONNECTED = "DISCONNECTED"
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
  MGMT_QUEUE_TYPE_PUBLIC = "PUBLIC"
  MGMT_QUEUE_TYPE_PRIVATE = "PRIVATE"
  MGMT_QUEUE_TYPE_MACHINE = "MACHINE"
  MGMT_QUEUE_TYPE_CONNECTOR = "CONNECTOR"
  MGMT_QUEUE_TYPE_MULTICAST = "MULTICAST"
  MGMT_QUEUE_STATE_LOCAL = "LOCAL CONNECTION"
  MGMT_QUEUE_STATE_NONACTIVE = "INACTIVE"
  MGMT_QUEUE_STATE_WAITING = "WAITING"
  MGMT_QUEUE_STATE_NEED_VALIDATE = "NEED VALIDATION"
  MGMT_QUEUE_STATE_ONHOLD = "ONHOLD"
  MGMT_QUEUE_STATE_CONNECTED = "CONNECTED"
  MGMT_QUEUE_STATE_DISCONNECTING = "DISCONNECTING"
  MGMT_QUEUE_STATE_DISCONNECTED = "DISCONNECTED"
  MGMT_QUEUE_STATE_LOCKED = "LOCKED"
  MGMT_QUEUE_LOCAL_LOCATION = "LOCAL"
  MGMT_QUEUE_REMOTE_LOCATION = "REMOTE"
  MGMT_QUEUE_UNKNOWN_TYPE = "UNKNOWN"
  MGMT_QUEUE_CORRECT_TYPE = "YES"
  MGMT_QUEUE_INCORRECT_TYPE = "NO"
  MGMT_QUEUE_TRANSACTIONAL_TYPE = "YES"
  MGMT_QUEUE_NOT_TRANSACTIONAL_TYPE = "NO"
  MGMT_QUEUE_FOREIGN_TYPE = "YES"
  MGMT_QUEUE_NOT_FOREIGN_TYPE = "NO"
  MO_MACHINE_TOKEN = "MACHINE"
  MO_QUEUE_TOKEN = "QUEUE"
  MACHINE_ACTION_CONNECT = "CONNECT"
  MACHINE_ACTION_DISCONNECT = "DISCONNECT"
  MACHINE_ACTION_TIDY = "TIDY"
  QUEUE_ACTION_PAUSE = "PAUSE"
  QUEUE_ACTION_RESUME = "RESUME"
  QUEUE_ACTION_EOD_RESEND = "EOD_RESEND"
  LONG_LIVED = 4294967294_u32
  MQSEC_DELETE_MESSAGE = 1_u32
  MQSEC_PEEK_MESSAGE = 2_u32
  MQSEC_WRITE_MESSAGE = 4_u32
  MQSEC_DELETE_JOURNAL_MESSAGE = 8_u32
  MQSEC_SET_QUEUE_PROPERTIES = 16_u32
  MQSEC_GET_QUEUE_PROPERTIES = 32_u32
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

  enum MQCALG
    MQMSG_CALG_MD2 = 32769_i32
    MQMSG_CALG_MD4 = 32770_i32
    MQMSG_CALG_MD5 = 32771_i32
    MQMSG_CALG_SHA = 32772_i32
    MQMSG_CALG_SHA1 = 32772_i32
    MQMSG_CALG_MAC = 32773_i32
    MQMSG_CALG_RSA_SIGN = 9216_i32
    MQMSG_CALG_DSS_SIGN = 8704_i32
    MQMSG_CALG_RSA_KEYX = 41984_i32
    MQMSG_CALG_DES = 26113_i32
    MQMSG_CALG_RC2 = 26114_i32
    MQMSG_CALG_RC4 = 26625_i32
    MQMSG_CALG_SEAL = 26626_i32
  end
  enum MQTRANSACTION
    MQ_NO_TRANSACTION = 0_i32
    MQ_MTS_TRANSACTION = 1_i32
    MQ_XA_TRANSACTION = 2_i32
    MQ_SINGLE_MESSAGE = 3_i32
  end
  enum RELOPS
    REL_NOP = 0_i32
    REL_EQ = 1_i32
    REL_NEQ = 2_i32
    REL_LT = 3_i32
    REL_GT = 4_i32
    REL_LE = 5_i32
    REL_GE = 6_i32
  end
  enum MQCERT_REGISTER
    MQCERT_REGISTER_ALWAYS = 1_i32
    MQCERT_REGISTER_IF_NOT_EXIST = 2_i32
  end
  enum MQMSGCURSOR
    MQMSG_FIRST = 0_i32
    MQMSG_CURRENT = 1_i32
    MQMSG_NEXT = 2_i32
  end
  enum MQMSGCLASS
    MQMSG_CLASS_NORMAL = 0_i32
    MQMSG_CLASS_REPORT = 1_i32
    MQMSG_CLASS_ACK_REACH_QUEUE = 2_i32
    MQMSG_CLASS_ACK_RECEIVE = 16384_i32
    MQMSG_CLASS_NACK_BAD_DST_Q = 32768_i32
    MQMSG_CLASS_NACK_PURGED = 32769_i32
    MQMSG_CLASS_NACK_REACH_QUEUE_TIMEOUT = 32770_i32
    MQMSG_CLASS_NACK_Q_EXCEED_QUOTA = 32771_i32
    MQMSG_CLASS_NACK_ACCESS_DENIED = 32772_i32
    MQMSG_CLASS_NACK_HOP_COUNT_EXCEEDED = 32773_i32
    MQMSG_CLASS_NACK_BAD_SIGNATURE = 32774_i32
    MQMSG_CLASS_NACK_BAD_ENCRYPTION = 32775_i32
    MQMSG_CLASS_NACK_COULD_NOT_ENCRYPT = 32776_i32
    MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_Q = 32777_i32
    MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_MSG = 32778_i32
    MQMSG_CLASS_NACK_UNSUPPORTED_CRYPTO_PROVIDER = 32779_i32
    MQMSG_CLASS_NACK_SOURCE_COMPUTER_GUID_CHANGED = 32780_i32
    MQMSG_CLASS_NACK_Q_DELETED = 49152_i32
    MQMSG_CLASS_NACK_Q_PURGED = 49153_i32
    MQMSG_CLASS_NACK_RECEIVE_TIMEOUT = 49154_i32
    MQMSG_CLASS_NACK_RECEIVE_TIMEOUT_AT_SENDER = 49155_i32
  end
  enum MQMSGDELIVERY
    MQMSG_DELIVERY_EXPRESS = 0_i32
    MQMSG_DELIVERY_RECOVERABLE = 1_i32
  end
  enum MQMSGACKNOWLEDGEMENT
    MQMSG_ACKNOWLEDGMENT_NONE = 0_i32
    MQMSG_ACKNOWLEDGMENT_POS_ARRIVAL = 1_i32
    MQMSG_ACKNOWLEDGMENT_POS_RECEIVE = 2_i32
    MQMSG_ACKNOWLEDGMENT_NEG_ARRIVAL = 4_i32
    MQMSG_ACKNOWLEDGMENT_NEG_RECEIVE = 8_i32
    MQMSG_ACKNOWLEDGMENT_NACK_REACH_QUEUE = 4_i32
    MQMSG_ACKNOWLEDGMENT_FULL_REACH_QUEUE = 5_i32
    MQMSG_ACKNOWLEDGMENT_NACK_RECEIVE = 12_i32
    MQMSG_ACKNOWLEDGMENT_FULL_RECEIVE = 14_i32
  end
  enum MQMSGJOURNAL
    MQMSG_JOURNAL_NONE = 0_i32
    MQMSG_DEADLETTER = 1_i32
    MQMSG_JOURNAL = 2_i32
  end
  enum MQMSGTRACE
    MQMSG_TRACE_NONE = 0_i32
    MQMSG_SEND_ROUTE_TO_REPORT_QUEUE = 1_i32
  end
  enum MQMSGSENDERIDTYPE
    MQMSG_SENDERID_TYPE_NONE = 0_i32
    MQMSG_SENDERID_TYPE_SID = 1_i32
  end
  enum MQMSGPRIVLEVEL
    MQMSG_PRIV_LEVEL_NONE = 0_i32
    MQMSG_PRIV_LEVEL_BODY_BASE = 1_i32
    MQMSG_PRIV_LEVEL_BODY_ENHANCED = 3_i32
  end
  enum MQMSGAUTHLEVEL
    MQMSG_AUTH_LEVEL_NONE = 0_i32
    MQMSG_AUTH_LEVEL_ALWAYS = 1_i32
    MQMSG_AUTH_LEVEL_MSMQ10 = 2_i32
    MQMSG_AUTH_LEVEL_SIG10 = 2_i32
    MQMSG_AUTH_LEVEL_MSMQ20 = 4_i32
    MQMSG_AUTH_LEVEL_SIG20 = 4_i32
    MQMSG_AUTH_LEVEL_SIG30 = 8_i32
  end
  enum MQMSGIDSIZE
    MQMSG_MSGID_SIZE = 20_i32
    MQMSG_CORRELATIONID_SIZE = 20_i32
    MQMSG_XACTID_SIZE = 20_i32
  end
  enum MQMSGMAX
    MQ_MAX_MSG_LABEL_LEN = 249_i32
  end
  enum MQMSGAUTHENTICATION
    MQMSG_AUTHENTICATION_NOT_REQUESTED = 0_i32
    MQMSG_AUTHENTICATION_REQUESTED = 1_i32
    MQMSG_AUTHENTICATED_SIG10 = 1_i32
    MQMSG_AUTHENTICATION_REQUESTED_EX = 3_i32
    MQMSG_AUTHENTICATED_SIG20 = 3_i32
    MQMSG_AUTHENTICATED_SIG30 = 5_i32
    MQMSG_AUTHENTICATED_SIGXML = 9_i32
  end
  enum MQSHARE
    MQ_DENY_NONE = 0_i32
    MQ_DENY_RECEIVE_SHARE = 1_i32
  end
  enum MQACCESS
    MQ_RECEIVE_ACCESS = 1_i32
    MQ_SEND_ACCESS = 2_i32
    MQ_PEEK_ACCESS = 32_i32
    MQ_ADMIN_ACCESS = 128_i32
  end
  enum MQJOURNAL
    MQ_JOURNAL_NONE = 0_i32
    MQ_JOURNAL = 1_i32
  end
  enum MQTRANSACTIONAL
    MQ_TRANSACTIONAL_NONE = 0_i32
    MQ_TRANSACTIONAL = 1_i32
  end
  enum MQAUTHENTICATE
    MQ_AUTHENTICATE_NONE = 0_i32
    MQ_AUTHENTICATE = 1_i32
  end
  enum MQPRIVLEVEL
    MQ_PRIV_LEVEL_NONE = 0_i32
    MQ_PRIV_LEVEL_OPTIONAL = 1_i32
    MQ_PRIV_LEVEL_BODY = 2_i32
  end
  enum MQPRIORITY
    MQ_MIN_PRIORITY = 0_i32
    MQ_MAX_PRIORITY = 7_i32
  end
  enum MQMAX
    MQ_MAX_Q_NAME_LEN = 124_i32
    MQ_MAX_Q_LABEL_LEN = 124_i32
  end
  enum QUEUE_TYPE
    MQ_TYPE_PUBLIC = 0_i32
    MQ_TYPE_PRIVATE = 1_i32
    MQ_TYPE_MACHINE = 2_i32
    MQ_TYPE_CONNECTOR = 3_i32
    MQ_TYPE_MULTICAST = 4_i32
  end
  enum FOREIGN_STATUS
    MQ_STATUS_FOREIGN = 0_i32
    MQ_STATUS_NOT_FOREIGN = 1_i32
    MQ_STATUS_UNKNOWN = 2_i32
  end
  enum XACT_STATUS
    MQ_XACT_STATUS_XACT = 0_i32
    MQ_XACT_STATUS_NOT_XACT = 1_i32
    MQ_XACT_STATUS_UNKNOWN = 2_i32
  end
  enum QUEUE_STATE
    MQ_QUEUE_STATE_LOCAL_CONNECTION = 0_i32
    MQ_QUEUE_STATE_DISCONNECTED = 1_i32
    MQ_QUEUE_STATE_WAITING = 2_i32
    MQ_QUEUE_STATE_NEEDVALIDATE = 3_i32
    MQ_QUEUE_STATE_ONHOLD = 4_i32
    MQ_QUEUE_STATE_NONACTIVE = 5_i32
    MQ_QUEUE_STATE_CONNECTED = 6_i32
    MQ_QUEUE_STATE_DISCONNECTING = 7_i32
    MQ_QUEUE_STATE_LOCKED = 8_i32
  end
  enum MQDEFAULT
    DEFAULT_M_PRIORITY = 3_i32
    DEFAULT_M_DELIVERY = 0_i32
    DEFAULT_M_ACKNOWLEDGE = 0_i32
    DEFAULT_M_JOURNAL = 0_i32
    DEFAULT_M_APPSPECIFIC = 0_i32
    DEFAULT_M_PRIV_LEVEL = 0_i32
    DEFAULT_M_AUTH_LEVEL = 0_i32
    DEFAULT_M_SENDERID_TYPE = 1_i32
    DEFAULT_Q_JOURNAL = 0_i32
    DEFAULT_Q_BASEPRIORITY = 0_i32
    DEFAULT_Q_QUOTA = -1_i32
    DEFAULT_Q_JOURNAL_QUOTA = -1_i32
    DEFAULT_Q_TRANSACTION = 0_i32
    DEFAULT_Q_AUTHENTICATE = 0_i32
    DEFAULT_Q_PRIV_LEVEL = 1_i32
    DEFAULT_M_LOOKUPID = 0_i32
  end
  enum MQERROR
    MQ_ERROR = -1072824319_i32
    MQ_ERROR_PROPERTY = -1072824318_i32
    MQ_ERROR_QUEUE_NOT_FOUND = -1072824317_i32
    MQ_ERROR_QUEUE_NOT_ACTIVE = -1072824316_i32
    MQ_ERROR_QUEUE_EXISTS = -1072824315_i32
    MQ_ERROR_INVALID_PARAMETER = -1072824314_i32
    MQ_ERROR_INVALID_HANDLE = -1072824313_i32
    MQ_ERROR_OPERATION_CANCELLED = -1072824312_i32
    MQ_ERROR_SHARING_VIOLATION = -1072824311_i32
    MQ_ERROR_SERVICE_NOT_AVAILABLE = -1072824309_i32
    MQ_ERROR_MACHINE_NOT_FOUND = -1072824307_i32
    MQ_ERROR_ILLEGAL_SORT = -1072824304_i32
    MQ_ERROR_ILLEGAL_USER = -1072824303_i32
    MQ_ERROR_NO_DS = -1072824301_i32
    MQ_ERROR_ILLEGAL_QUEUE_PATHNAME = -1072824300_i32
    MQ_ERROR_ILLEGAL_PROPERTY_VALUE = -1072824296_i32
    MQ_ERROR_ILLEGAL_PROPERTY_VT = -1072824295_i32
    MQ_ERROR_BUFFER_OVERFLOW = -1072824294_i32
    MQ_ERROR_IO_TIMEOUT = -1072824293_i32
    MQ_ERROR_ILLEGAL_CURSOR_ACTION = -1072824292_i32
    MQ_ERROR_MESSAGE_ALREADY_RECEIVED = -1072824291_i32
    MQ_ERROR_ILLEGAL_FORMATNAME = -1072824290_i32
    MQ_ERROR_FORMATNAME_BUFFER_TOO_SMALL = -1072824289_i32
    MQ_ERROR_UNSUPPORTED_FORMATNAME_OPERATION = -1072824288_i32
    MQ_ERROR_ILLEGAL_SECURITY_DESCRIPTOR = -1072824287_i32
    MQ_ERROR_SENDERID_BUFFER_TOO_SMALL = -1072824286_i32
    MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL = -1072824285_i32
    MQ_ERROR_CANNOT_IMPERSONATE_CLIENT = -1072824284_i32
    MQ_ERROR_ACCESS_DENIED = -1072824283_i32
    MQ_ERROR_PRIVILEGE_NOT_HELD = -1072824282_i32
    MQ_ERROR_INSUFFICIENT_RESOURCES = -1072824281_i32
    MQ_ERROR_USER_BUFFER_TOO_SMALL = -1072824280_i32
    MQ_ERROR_MESSAGE_STORAGE_FAILED = -1072824278_i32
    MQ_ERROR_SENDER_CERT_BUFFER_TOO_SMALL = -1072824277_i32
    MQ_ERROR_INVALID_CERTIFICATE = -1072824276_i32
    MQ_ERROR_CORRUPTED_INTERNAL_CERTIFICATE = -1072824275_i32
    MQ_ERROR_INTERNAL_USER_CERT_EXIST = -1072824274_i32
    MQ_ERROR_NO_INTERNAL_USER_CERT = -1072824273_i32
    MQ_ERROR_CORRUPTED_SECURITY_DATA = -1072824272_i32
    MQ_ERROR_CORRUPTED_PERSONAL_CERT_STORE = -1072824271_i32
    MQ_ERROR_COMPUTER_DOES_NOT_SUPPORT_ENCRYPTION = -1072824269_i32
    MQ_ERROR_BAD_SECURITY_CONTEXT = -1072824267_i32
    MQ_ERROR_COULD_NOT_GET_USER_SID = -1072824266_i32
    MQ_ERROR_COULD_NOT_GET_ACCOUNT_INFO = -1072824265_i32
    MQ_ERROR_ILLEGAL_MQCOLUMNS = -1072824264_i32
    MQ_ERROR_ILLEGAL_PROPID = -1072824263_i32
    MQ_ERROR_ILLEGAL_RELATION = -1072824262_i32
    MQ_ERROR_ILLEGAL_PROPERTY_SIZE = -1072824261_i32
    MQ_ERROR_ILLEGAL_RESTRICTION_PROPID = -1072824260_i32
    MQ_ERROR_ILLEGAL_MQQUEUEPROPS = -1072824259_i32
    MQ_ERROR_PROPERTY_NOTALLOWED = -1072824258_i32
    MQ_ERROR_INSUFFICIENT_PROPERTIES = -1072824257_i32
    MQ_ERROR_MACHINE_EXISTS = -1072824256_i32
    MQ_ERROR_ILLEGAL_MQQMPROPS = -1072824255_i32
    MQ_ERROR_DS_IS_FULL = -1072824254_i32
    MQ_ERROR_DS_ERROR = -1072824253_i32
    MQ_ERROR_INVALID_OWNER = -1072824252_i32
    MQ_ERROR_UNSUPPORTED_ACCESS_MODE = -1072824251_i32
    MQ_ERROR_RESULT_BUFFER_TOO_SMALL = -1072824250_i32
    MQ_ERROR_DELETE_CN_IN_USE = -1072824248_i32
    MQ_ERROR_NO_RESPONSE_FROM_OBJECT_SERVER = -1072824247_i32
    MQ_ERROR_OBJECT_SERVER_NOT_AVAILABLE = -1072824246_i32
    MQ_ERROR_QUEUE_NOT_AVAILABLE = -1072824245_i32
    MQ_ERROR_DTC_CONNECT = -1072824244_i32
    MQ_ERROR_TRANSACTION_IMPORT = -1072824242_i32
    MQ_ERROR_TRANSACTION_USAGE = -1072824240_i32
    MQ_ERROR_TRANSACTION_SEQUENCE = -1072824239_i32
    MQ_ERROR_MISSING_CONNECTOR_TYPE = -1072824235_i32
    MQ_ERROR_STALE_HANDLE = -1072824234_i32
    MQ_ERROR_TRANSACTION_ENLIST = -1072824232_i32
    MQ_ERROR_QUEUE_DELETED = -1072824230_i32
    MQ_ERROR_ILLEGAL_CONTEXT = -1072824229_i32
    MQ_ERROR_ILLEGAL_SORT_PROPID = -1072824228_i32
    MQ_ERROR_LABEL_TOO_LONG = -1072824227_i32
    MQ_ERROR_LABEL_BUFFER_TOO_SMALL = -1072824226_i32
    MQ_ERROR_MQIS_SERVER_EMPTY = -1072824225_i32
    MQ_ERROR_MQIS_READONLY_MODE = -1072824224_i32
    MQ_ERROR_SYMM_KEY_BUFFER_TOO_SMALL = -1072824223_i32
    MQ_ERROR_SIGNATURE_BUFFER_TOO_SMALL = -1072824222_i32
    MQ_ERROR_PROV_NAME_BUFFER_TOO_SMALL = -1072824221_i32
    MQ_ERROR_ILLEGAL_OPERATION = -1072824220_i32
    MQ_ERROR_WRITE_NOT_ALLOWED = -1072824219_i32
    MQ_ERROR_WKS_CANT_SERVE_CLIENT = -1072824218_i32
    MQ_ERROR_DEPEND_WKS_LICENSE_OVERFLOW = -1072824217_i32
    MQ_CORRUPTED_QUEUE_WAS_DELETED = -1072824216_i32
    MQ_ERROR_REMOTE_MACHINE_NOT_AVAILABLE = -1072824215_i32
    MQ_ERROR_UNSUPPORTED_OPERATION = -1072824214_i32
    MQ_ERROR_ENCRYPTION_PROVIDER_NOT_SUPPORTED = -1072824213_i32
    MQ_ERROR_CANNOT_SET_CRYPTO_SEC_DESCR = -1072824212_i32
    MQ_ERROR_CERTIFICATE_NOT_PROVIDED = -1072824211_i32
    MQ_ERROR_Q_DNS_PROPERTY_NOT_SUPPORTED = -1072824210_i32
    MQ_ERROR_CANT_CREATE_CERT_STORE = -1072824209_i32
    MQ_ERROR_CANNOT_CREATE_CERT_STORE = -1072824209_i32
    MQ_ERROR_CANT_OPEN_CERT_STORE = -1072824208_i32
    MQ_ERROR_CANNOT_OPEN_CERT_STORE = -1072824208_i32
    MQ_ERROR_ILLEGAL_ENTERPRISE_OPERATION = -1072824207_i32
    MQ_ERROR_CANNOT_GRANT_ADD_GUID = -1072824206_i32
    MQ_ERROR_CANNOT_LOAD_MSMQOCM = -1072824205_i32
    MQ_ERROR_NO_ENTRY_POINT_MSMQOCM = -1072824204_i32
    MQ_ERROR_NO_MSMQ_SERVERS_ON_DC = -1072824203_i32
    MQ_ERROR_CANNOT_JOIN_DOMAIN = -1072824202_i32
    MQ_ERROR_CANNOT_CREATE_ON_GC = -1072824201_i32
    MQ_ERROR_GUID_NOT_MATCHING = -1072824200_i32
    MQ_ERROR_PUBLIC_KEY_NOT_FOUND = -1072824199_i32
    MQ_ERROR_PUBLIC_KEY_DOES_NOT_EXIST = -1072824198_i32
    MQ_ERROR_ILLEGAL_MQPRIVATEPROPS = -1072824197_i32
    MQ_ERROR_NO_GC_IN_DOMAIN = -1072824196_i32
    MQ_ERROR_NO_MSMQ_SERVERS_ON_GC = -1072824195_i32
    MQ_ERROR_CANNOT_GET_DN = -1072824194_i32
    MQ_ERROR_CANNOT_HASH_DATA_EX = -1072824193_i32
    MQ_ERROR_CANNOT_SIGN_DATA_EX = -1072824192_i32
    MQ_ERROR_CANNOT_CREATE_HASH_EX = -1072824191_i32
    MQ_ERROR_FAIL_VERIFY_SIGNATURE_EX = -1072824190_i32
    MQ_ERROR_CANNOT_DELETE_PSC_OBJECTS = -1072824189_i32
    MQ_ERROR_NO_MQUSER_OU = -1072824188_i32
    MQ_ERROR_CANNOT_LOAD_MQAD = -1072824187_i32
    MQ_ERROR_CANNOT_LOAD_MQDSSRV = -1072824186_i32
    MQ_ERROR_PROPERTIES_CONFLICT = -1072824185_i32
    MQ_ERROR_MESSAGE_NOT_FOUND = -1072824184_i32
    MQ_ERROR_CANT_RESOLVE_SITES = -1072824183_i32
    MQ_ERROR_NOT_SUPPORTED_BY_DEPENDENT_CLIENTS = -1072824182_i32
    MQ_ERROR_OPERATION_NOT_SUPPORTED_BY_REMOTE_COMPUTER = -1072824181_i32
    MQ_ERROR_NOT_A_CORRECT_OBJECT_CLASS = -1072824180_i32
    MQ_ERROR_MULTI_SORT_KEYS = -1072824179_i32
    MQ_ERROR_GC_NEEDED = -1072824178_i32
    MQ_ERROR_DS_BIND_ROOT_FOREST = -1072824177_i32
    MQ_ERROR_DS_LOCAL_USER = -1072824176_i32
    MQ_ERROR_Q_ADS_PROPERTY_NOT_SUPPORTED = -1072824175_i32
    MQ_ERROR_BAD_XML_FORMAT = -1072824174_i32
    MQ_ERROR_UNSUPPORTED_CLASS = -1072824173_i32
    MQ_ERROR_UNINITIALIZED_OBJECT = -1072824172_i32
    MQ_ERROR_CANNOT_CREATE_PSC_OBJECTS = -1072824171_i32
    MQ_ERROR_CANNOT_UPDATE_PSC_OBJECTS = -1072824170_i32
  end
  enum MQWARNING
    MQ_INFORMATION_PROPERTY = 1074659329_i32
    MQ_INFORMATION_ILLEGAL_PROPERTY = 1074659330_i32
    MQ_INFORMATION_PROPERTY_IGNORED = 1074659331_i32
    MQ_INFORMATION_UNSUPPORTED_PROPERTY = 1074659332_i32
    MQ_INFORMATION_DUPLICATE_PROPERTY = 1074659333_i32
    MQ_INFORMATION_OPERATION_PENDING = 1074659334_i32
    MQ_INFORMATION_FORMATNAME_BUFFER_TOO_SMALL = 1074659337_i32
    MQ_INFORMATION_INTERNAL_USER_CERT_EXIST = 1074659338_i32
    MQ_INFORMATION_OWNER_IGNORED = 1074659339_i32
  end

  @[Extern]
  record IMSMQQueryVtbl,
    query_interface : Proc(IMSMQQuery*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQuery*, UInt32),
    release : Proc(IMSMQQuery*, UInt32),
    get_type_info_count : Proc(IMSMQQuery*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQuery*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQuery*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQuery*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    lookup_queue : Proc(IMSMQQuery*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQuery, lpVtbl : IMSMQQueryVtbl* do
    GUID = LibC::GUID.new(0xd7d6e072_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQQuery*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQuery*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQuery*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQuery*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQuery*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQuery*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQuery*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def lookup_queue(this : IMSMQQuery*, queue_guid : Win32cr::System::Com::VARIANT*, service_type_guid : Win32cr::System::Com::VARIANT*, label : Win32cr::System::Com::VARIANT*, create_time : Win32cr::System::Com::VARIANT*, modify_time : Win32cr::System::Com::VARIANT*, rel_service_type : Win32cr::System::Com::VARIANT*, rel_label : Win32cr::System::Com::VARIANT*, rel_create_time : Win32cr::System::Com::VARIANT*, rel_modify_time : Win32cr::System::Com::VARIANT*, ppqinfos : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_queue.call(this, queue_guid, service_type_guid, label, create_time, modify_time, rel_service_type, rel_label, rel_create_time, rel_modify_time, ppqinfos)
    end

  end

  @[Extern]
  record IMSMQQueueInfoVtbl,
    query_interface : Proc(IMSMQQueueInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueueInfo*, UInt32),
    release : Proc(IMSMQQueueInfo*, UInt32),
    get_type_info_count : Proc(IMSMQQueueInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueueInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueueInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueueInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_QueueGuid : Proc(IMSMQQueueInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ServiceTypeGuid : Proc(IMSMQQueueInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceTypeGuid : Proc(IMSMQQueueInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Label : Proc(IMSMQQueueInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Label : Proc(IMSMQQueueInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PathName : Proc(IMSMQQueueInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PathName : Proc(IMSMQQueueInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FormatName : Proc(IMSMQQueueInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FormatName : Proc(IMSMQQueueInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsTransactional : Proc(IMSMQQueueInfo*, Int16*, Win32cr::Foundation::HRESULT),
    get_PrivLevel : Proc(IMSMQQueueInfo*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrivLevel : Proc(IMSMQQueueInfo*, Int32, Win32cr::Foundation::HRESULT),
    get_Journal : Proc(IMSMQQueueInfo*, Int32*, Win32cr::Foundation::HRESULT),
    put_Journal : Proc(IMSMQQueueInfo*, Int32, Win32cr::Foundation::HRESULT),
    get_Quota : Proc(IMSMQQueueInfo*, Int32*, Win32cr::Foundation::HRESULT),
    put_Quota : Proc(IMSMQQueueInfo*, Int32, Win32cr::Foundation::HRESULT),
    get_BasePriority : Proc(IMSMQQueueInfo*, Int32*, Win32cr::Foundation::HRESULT),
    put_BasePriority : Proc(IMSMQQueueInfo*, Int32, Win32cr::Foundation::HRESULT),
    get_CreateTime : Proc(IMSMQQueueInfo*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ModifyTime : Proc(IMSMQQueueInfo*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Authenticate : Proc(IMSMQQueueInfo*, Int32*, Win32cr::Foundation::HRESULT),
    put_Authenticate : Proc(IMSMQQueueInfo*, Int32, Win32cr::Foundation::HRESULT),
    get_JournalQuota : Proc(IMSMQQueueInfo*, Int32*, Win32cr::Foundation::HRESULT),
    put_JournalQuota : Proc(IMSMQQueueInfo*, Int32, Win32cr::Foundation::HRESULT),
    get_IsWorldReadable : Proc(IMSMQQueueInfo*, Int16*, Win32cr::Foundation::HRESULT),
    create : Proc(IMSMQQueueInfo*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    delete : Proc(IMSMQQueueInfo*, Win32cr::Foundation::HRESULT),
    open : Proc(IMSMQQueueInfo*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IMSMQQueueInfo*, Win32cr::Foundation::HRESULT),
    update : Proc(IMSMQQueueInfo*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueueInfo, lpVtbl : IMSMQQueueInfoVtbl* do
    GUID = LibC::GUID.new(0xd7d6e07b_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQQueueInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueueInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueueInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueueInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueueInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueueInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueueInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_QueueGuid(this : IMSMQQueueInfo*, pbstrGuidQueue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueGuid.call(this, pbstrGuidQueue)
    end
    def get_ServiceTypeGuid(this : IMSMQQueueInfo*, pbstrGuidServiceType : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceTypeGuid.call(this, pbstrGuidServiceType)
    end
    def put_ServiceTypeGuid(this : IMSMQQueueInfo*, bstrGuidServiceType : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceTypeGuid.call(this, bstrGuidServiceType)
    end
    def get_Label(this : IMSMQQueueInfo*, pbstrLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Label.call(this, pbstrLabel)
    end
    def put_Label(this : IMSMQQueueInfo*, bstrLabel : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Label.call(this, bstrLabel)
    end
    def get_PathName(this : IMSMQQueueInfo*, pbstrPathName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathName.call(this, pbstrPathName)
    end
    def put_PathName(this : IMSMQQueueInfo*, bstrPathName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PathName.call(this, bstrPathName)
    end
    def get_FormatName(this : IMSMQQueueInfo*, pbstrFormatName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FormatName.call(this, pbstrFormatName)
    end
    def put_FormatName(this : IMSMQQueueInfo*, bstrFormatName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FormatName.call(this, bstrFormatName)
    end
    def get_IsTransactional(this : IMSMQQueueInfo*, pisTransactional : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTransactional.call(this, pisTransactional)
    end
    def get_PrivLevel(this : IMSMQQueueInfo*, plPrivLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivLevel.call(this, plPrivLevel)
    end
    def put_PrivLevel(this : IMSMQQueueInfo*, lPrivLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivLevel.call(this, lPrivLevel)
    end
    def get_Journal(this : IMSMQQueueInfo*, plJournal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Journal.call(this, plJournal)
    end
    def put_Journal(this : IMSMQQueueInfo*, lJournal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Journal.call(this, lJournal)
    end
    def get_Quota(this : IMSMQQueueInfo*, plQuota : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Quota.call(this, plQuota)
    end
    def put_Quota(this : IMSMQQueueInfo*, lQuota : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Quota.call(this, lQuota)
    end
    def get_BasePriority(this : IMSMQQueueInfo*, plBasePriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BasePriority.call(this, plBasePriority)
    end
    def put_BasePriority(this : IMSMQQueueInfo*, lBasePriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BasePriority.call(this, lBasePriority)
    end
    def get_CreateTime(this : IMSMQQueueInfo*, pvarCreateTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreateTime.call(this, pvarCreateTime)
    end
    def get_ModifyTime(this : IMSMQQueueInfo*, pvarModifyTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModifyTime.call(this, pvarModifyTime)
    end
    def get_Authenticate(this : IMSMQQueueInfo*, plAuthenticate : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Authenticate.call(this, plAuthenticate)
    end
    def put_Authenticate(this : IMSMQQueueInfo*, lAuthenticate : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Authenticate.call(this, lAuthenticate)
    end
    def get_JournalQuota(this : IMSMQQueueInfo*, plJournalQuota : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_JournalQuota.call(this, plJournalQuota)
    end
    def put_JournalQuota(this : IMSMQQueueInfo*, lJournalQuota : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_JournalQuota.call(this, lJournalQuota)
    end
    def get_IsWorldReadable(this : IMSMQQueueInfo*, pisWorldReadable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsWorldReadable.call(this, pisWorldReadable)
    end
    def create(this : IMSMQQueueInfo*, is_transactional : Win32cr::System::Com::VARIANT*, is_world_readable : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, is_transactional, is_world_readable)
    end
    def delete(this : IMSMQQueueInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def open(this : IMSMQQueueInfo*, access : Int32, share_mode : Int32, ppq : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, access, share_mode, ppq)
    end
    def refresh(this : IMSMQQueueInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def update(this : IMSMQQueueInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this)
    end

  end

  @[Extern]
  record IMSMQQueueInfo2Vtbl,
    query_interface : Proc(IMSMQQueueInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueueInfo2*, UInt32),
    release : Proc(IMSMQQueueInfo2*, UInt32),
    get_type_info_count : Proc(IMSMQQueueInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueueInfo2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueueInfo2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueueInfo2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_QueueGuid : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ServiceTypeGuid : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceTypeGuid : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Label : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Label : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PathName : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PathName : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FormatName : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FormatName : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsTransactional : Proc(IMSMQQueueInfo2*, Int16*, Win32cr::Foundation::HRESULT),
    get_PrivLevel : Proc(IMSMQQueueInfo2*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrivLevel : Proc(IMSMQQueueInfo2*, Int32, Win32cr::Foundation::HRESULT),
    get_Journal : Proc(IMSMQQueueInfo2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Journal : Proc(IMSMQQueueInfo2*, Int32, Win32cr::Foundation::HRESULT),
    get_Quota : Proc(IMSMQQueueInfo2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Quota : Proc(IMSMQQueueInfo2*, Int32, Win32cr::Foundation::HRESULT),
    get_BasePriority : Proc(IMSMQQueueInfo2*, Int32*, Win32cr::Foundation::HRESULT),
    put_BasePriority : Proc(IMSMQQueueInfo2*, Int32, Win32cr::Foundation::HRESULT),
    get_CreateTime : Proc(IMSMQQueueInfo2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ModifyTime : Proc(IMSMQQueueInfo2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Authenticate : Proc(IMSMQQueueInfo2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Authenticate : Proc(IMSMQQueueInfo2*, Int32, Win32cr::Foundation::HRESULT),
    get_JournalQuota : Proc(IMSMQQueueInfo2*, Int32*, Win32cr::Foundation::HRESULT),
    put_JournalQuota : Proc(IMSMQQueueInfo2*, Int32, Win32cr::Foundation::HRESULT),
    get_IsWorldReadable : Proc(IMSMQQueueInfo2*, Int16*, Win32cr::Foundation::HRESULT),
    create : Proc(IMSMQQueueInfo2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    delete : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::HRESULT),
    open : Proc(IMSMQQueueInfo2*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::HRESULT),
    update : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::HRESULT),
    get_PathNameDNS : Proc(IMSMQQueueInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQueueInfo2*, Void**, Win32cr::Foundation::HRESULT),
    get_Security : Proc(IMSMQQueueInfo2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Security : Proc(IMSMQQueueInfo2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueueInfo2, lpVtbl : IMSMQQueueInfo2Vtbl* do
    GUID = LibC::GUID.new(0xfd174a80_u32, 0x89cf_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xf2_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQueueInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueueInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueueInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueueInfo2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueueInfo2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueueInfo2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueueInfo2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_QueueGuid(this : IMSMQQueueInfo2*, pbstrGuidQueue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueGuid.call(this, pbstrGuidQueue)
    end
    def get_ServiceTypeGuid(this : IMSMQQueueInfo2*, pbstrGuidServiceType : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceTypeGuid.call(this, pbstrGuidServiceType)
    end
    def put_ServiceTypeGuid(this : IMSMQQueueInfo2*, bstrGuidServiceType : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceTypeGuid.call(this, bstrGuidServiceType)
    end
    def get_Label(this : IMSMQQueueInfo2*, pbstrLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Label.call(this, pbstrLabel)
    end
    def put_Label(this : IMSMQQueueInfo2*, bstrLabel : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Label.call(this, bstrLabel)
    end
    def get_PathName(this : IMSMQQueueInfo2*, pbstrPathName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathName.call(this, pbstrPathName)
    end
    def put_PathName(this : IMSMQQueueInfo2*, bstrPathName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PathName.call(this, bstrPathName)
    end
    def get_FormatName(this : IMSMQQueueInfo2*, pbstrFormatName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FormatName.call(this, pbstrFormatName)
    end
    def put_FormatName(this : IMSMQQueueInfo2*, bstrFormatName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FormatName.call(this, bstrFormatName)
    end
    def get_IsTransactional(this : IMSMQQueueInfo2*, pisTransactional : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTransactional.call(this, pisTransactional)
    end
    def get_PrivLevel(this : IMSMQQueueInfo2*, plPrivLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivLevel.call(this, plPrivLevel)
    end
    def put_PrivLevel(this : IMSMQQueueInfo2*, lPrivLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivLevel.call(this, lPrivLevel)
    end
    def get_Journal(this : IMSMQQueueInfo2*, plJournal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Journal.call(this, plJournal)
    end
    def put_Journal(this : IMSMQQueueInfo2*, lJournal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Journal.call(this, lJournal)
    end
    def get_Quota(this : IMSMQQueueInfo2*, plQuota : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Quota.call(this, plQuota)
    end
    def put_Quota(this : IMSMQQueueInfo2*, lQuota : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Quota.call(this, lQuota)
    end
    def get_BasePriority(this : IMSMQQueueInfo2*, plBasePriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BasePriority.call(this, plBasePriority)
    end
    def put_BasePriority(this : IMSMQQueueInfo2*, lBasePriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BasePriority.call(this, lBasePriority)
    end
    def get_CreateTime(this : IMSMQQueueInfo2*, pvarCreateTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreateTime.call(this, pvarCreateTime)
    end
    def get_ModifyTime(this : IMSMQQueueInfo2*, pvarModifyTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModifyTime.call(this, pvarModifyTime)
    end
    def get_Authenticate(this : IMSMQQueueInfo2*, plAuthenticate : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Authenticate.call(this, plAuthenticate)
    end
    def put_Authenticate(this : IMSMQQueueInfo2*, lAuthenticate : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Authenticate.call(this, lAuthenticate)
    end
    def get_JournalQuota(this : IMSMQQueueInfo2*, plJournalQuota : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_JournalQuota.call(this, plJournalQuota)
    end
    def put_JournalQuota(this : IMSMQQueueInfo2*, lJournalQuota : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_JournalQuota.call(this, lJournalQuota)
    end
    def get_IsWorldReadable(this : IMSMQQueueInfo2*, pisWorldReadable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsWorldReadable.call(this, pisWorldReadable)
    end
    def create(this : IMSMQQueueInfo2*, is_transactional : Win32cr::System::Com::VARIANT*, is_world_readable : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, is_transactional, is_world_readable)
    end
    def delete(this : IMSMQQueueInfo2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def open(this : IMSMQQueueInfo2*, access : Int32, share_mode : Int32, ppq : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, access, share_mode, ppq)
    end
    def refresh(this : IMSMQQueueInfo2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def update(this : IMSMQQueueInfo2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this)
    end
    def get_PathNameDNS(this : IMSMQQueueInfo2*, pbstrPathNameDNS : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathNameDNS.call(this, pbstrPathNameDNS)
    end
    def get_Properties(this : IMSMQQueueInfo2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_Security(this : IMSMQQueueInfo2*, pvarSecurity : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Security.call(this, pvarSecurity)
    end
    def put_Security(this : IMSMQQueueInfo2*, varSecurity : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Security.call(this, varSecurity)
    end

  end

  @[Extern]
  record IMSMQQueueInfo3Vtbl,
    query_interface : Proc(IMSMQQueueInfo3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueueInfo3*, UInt32),
    release : Proc(IMSMQQueueInfo3*, UInt32),
    get_type_info_count : Proc(IMSMQQueueInfo3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueueInfo3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueueInfo3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueueInfo3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_QueueGuid : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ServiceTypeGuid : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceTypeGuid : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Label : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Label : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PathName : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PathName : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FormatName : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FormatName : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsTransactional : Proc(IMSMQQueueInfo3*, Int16*, Win32cr::Foundation::HRESULT),
    get_PrivLevel : Proc(IMSMQQueueInfo3*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrivLevel : Proc(IMSMQQueueInfo3*, Int32, Win32cr::Foundation::HRESULT),
    get_Journal : Proc(IMSMQQueueInfo3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Journal : Proc(IMSMQQueueInfo3*, Int32, Win32cr::Foundation::HRESULT),
    get_Quota : Proc(IMSMQQueueInfo3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Quota : Proc(IMSMQQueueInfo3*, Int32, Win32cr::Foundation::HRESULT),
    get_BasePriority : Proc(IMSMQQueueInfo3*, Int32*, Win32cr::Foundation::HRESULT),
    put_BasePriority : Proc(IMSMQQueueInfo3*, Int32, Win32cr::Foundation::HRESULT),
    get_CreateTime : Proc(IMSMQQueueInfo3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ModifyTime : Proc(IMSMQQueueInfo3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Authenticate : Proc(IMSMQQueueInfo3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Authenticate : Proc(IMSMQQueueInfo3*, Int32, Win32cr::Foundation::HRESULT),
    get_JournalQuota : Proc(IMSMQQueueInfo3*, Int32*, Win32cr::Foundation::HRESULT),
    put_JournalQuota : Proc(IMSMQQueueInfo3*, Int32, Win32cr::Foundation::HRESULT),
    get_IsWorldReadable : Proc(IMSMQQueueInfo3*, Int16*, Win32cr::Foundation::HRESULT),
    create : Proc(IMSMQQueueInfo3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    delete : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::HRESULT),
    open : Proc(IMSMQQueueInfo3*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::HRESULT),
    update : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::HRESULT),
    get_PathNameDNS : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQueueInfo3*, Void**, Win32cr::Foundation::HRESULT),
    get_Security : Proc(IMSMQQueueInfo3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Security : Proc(IMSMQQueueInfo3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_IsTransactional2 : Proc(IMSMQQueueInfo3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsWorldReadable2 : Proc(IMSMQQueueInfo3*, Int16*, Win32cr::Foundation::HRESULT),
    get_MulticastAddress : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MulticastAddress : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ADsPath : Proc(IMSMQQueueInfo3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueueInfo3, lpVtbl : IMSMQQueueInfo3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b1d_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQueueInfo3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueueInfo3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueueInfo3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueueInfo3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueueInfo3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueueInfo3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueueInfo3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_QueueGuid(this : IMSMQQueueInfo3*, pbstrGuidQueue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueGuid.call(this, pbstrGuidQueue)
    end
    def get_ServiceTypeGuid(this : IMSMQQueueInfo3*, pbstrGuidServiceType : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceTypeGuid.call(this, pbstrGuidServiceType)
    end
    def put_ServiceTypeGuid(this : IMSMQQueueInfo3*, bstrGuidServiceType : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceTypeGuid.call(this, bstrGuidServiceType)
    end
    def get_Label(this : IMSMQQueueInfo3*, pbstrLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Label.call(this, pbstrLabel)
    end
    def put_Label(this : IMSMQQueueInfo3*, bstrLabel : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Label.call(this, bstrLabel)
    end
    def get_PathName(this : IMSMQQueueInfo3*, pbstrPathName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathName.call(this, pbstrPathName)
    end
    def put_PathName(this : IMSMQQueueInfo3*, bstrPathName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PathName.call(this, bstrPathName)
    end
    def get_FormatName(this : IMSMQQueueInfo3*, pbstrFormatName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FormatName.call(this, pbstrFormatName)
    end
    def put_FormatName(this : IMSMQQueueInfo3*, bstrFormatName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FormatName.call(this, bstrFormatName)
    end
    def get_IsTransactional(this : IMSMQQueueInfo3*, pisTransactional : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTransactional.call(this, pisTransactional)
    end
    def get_PrivLevel(this : IMSMQQueueInfo3*, plPrivLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivLevel.call(this, plPrivLevel)
    end
    def put_PrivLevel(this : IMSMQQueueInfo3*, lPrivLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivLevel.call(this, lPrivLevel)
    end
    def get_Journal(this : IMSMQQueueInfo3*, plJournal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Journal.call(this, plJournal)
    end
    def put_Journal(this : IMSMQQueueInfo3*, lJournal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Journal.call(this, lJournal)
    end
    def get_Quota(this : IMSMQQueueInfo3*, plQuota : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Quota.call(this, plQuota)
    end
    def put_Quota(this : IMSMQQueueInfo3*, lQuota : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Quota.call(this, lQuota)
    end
    def get_BasePriority(this : IMSMQQueueInfo3*, plBasePriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BasePriority.call(this, plBasePriority)
    end
    def put_BasePriority(this : IMSMQQueueInfo3*, lBasePriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BasePriority.call(this, lBasePriority)
    end
    def get_CreateTime(this : IMSMQQueueInfo3*, pvarCreateTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreateTime.call(this, pvarCreateTime)
    end
    def get_ModifyTime(this : IMSMQQueueInfo3*, pvarModifyTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModifyTime.call(this, pvarModifyTime)
    end
    def get_Authenticate(this : IMSMQQueueInfo3*, plAuthenticate : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Authenticate.call(this, plAuthenticate)
    end
    def put_Authenticate(this : IMSMQQueueInfo3*, lAuthenticate : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Authenticate.call(this, lAuthenticate)
    end
    def get_JournalQuota(this : IMSMQQueueInfo3*, plJournalQuota : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_JournalQuota.call(this, plJournalQuota)
    end
    def put_JournalQuota(this : IMSMQQueueInfo3*, lJournalQuota : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_JournalQuota.call(this, lJournalQuota)
    end
    def get_IsWorldReadable(this : IMSMQQueueInfo3*, pisWorldReadable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsWorldReadable.call(this, pisWorldReadable)
    end
    def create(this : IMSMQQueueInfo3*, is_transactional : Win32cr::System::Com::VARIANT*, is_world_readable : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, is_transactional, is_world_readable)
    end
    def delete(this : IMSMQQueueInfo3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def open(this : IMSMQQueueInfo3*, access : Int32, share_mode : Int32, ppq : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, access, share_mode, ppq)
    end
    def refresh(this : IMSMQQueueInfo3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def update(this : IMSMQQueueInfo3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this)
    end
    def get_PathNameDNS(this : IMSMQQueueInfo3*, pbstrPathNameDNS : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathNameDNS.call(this, pbstrPathNameDNS)
    end
    def get_Properties(this : IMSMQQueueInfo3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_Security(this : IMSMQQueueInfo3*, pvarSecurity : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Security.call(this, pvarSecurity)
    end
    def put_Security(this : IMSMQQueueInfo3*, varSecurity : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Security.call(this, varSecurity)
    end
    def get_IsTransactional2(this : IMSMQQueueInfo3*, pisTransactional : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTransactional2.call(this, pisTransactional)
    end
    def get_IsWorldReadable2(this : IMSMQQueueInfo3*, pisWorldReadable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsWorldReadable2.call(this, pisWorldReadable)
    end
    def get_MulticastAddress(this : IMSMQQueueInfo3*, pbstrMulticastAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MulticastAddress.call(this, pbstrMulticastAddress)
    end
    def put_MulticastAddress(this : IMSMQQueueInfo3*, bstrMulticastAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MulticastAddress.call(this, bstrMulticastAddress)
    end
    def get_ADsPath(this : IMSMQQueueInfo3*, pbstrADsPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ADsPath.call(this, pbstrADsPath)
    end

  end

  @[Extern]
  record IMSMQQueueInfo4Vtbl,
    query_interface : Proc(IMSMQQueueInfo4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueueInfo4*, UInt32),
    release : Proc(IMSMQQueueInfo4*, UInt32),
    get_type_info_count : Proc(IMSMQQueueInfo4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueueInfo4*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueueInfo4*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueueInfo4*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_QueueGuid : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ServiceTypeGuid : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceTypeGuid : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Label : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Label : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PathName : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PathName : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FormatName : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FormatName : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsTransactional : Proc(IMSMQQueueInfo4*, Int16*, Win32cr::Foundation::HRESULT),
    get_PrivLevel : Proc(IMSMQQueueInfo4*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrivLevel : Proc(IMSMQQueueInfo4*, Int32, Win32cr::Foundation::HRESULT),
    get_Journal : Proc(IMSMQQueueInfo4*, Int32*, Win32cr::Foundation::HRESULT),
    put_Journal : Proc(IMSMQQueueInfo4*, Int32, Win32cr::Foundation::HRESULT),
    get_Quota : Proc(IMSMQQueueInfo4*, Int32*, Win32cr::Foundation::HRESULT),
    put_Quota : Proc(IMSMQQueueInfo4*, Int32, Win32cr::Foundation::HRESULT),
    get_BasePriority : Proc(IMSMQQueueInfo4*, Int32*, Win32cr::Foundation::HRESULT),
    put_BasePriority : Proc(IMSMQQueueInfo4*, Int32, Win32cr::Foundation::HRESULT),
    get_CreateTime : Proc(IMSMQQueueInfo4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ModifyTime : Proc(IMSMQQueueInfo4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Authenticate : Proc(IMSMQQueueInfo4*, Int32*, Win32cr::Foundation::HRESULT),
    put_Authenticate : Proc(IMSMQQueueInfo4*, Int32, Win32cr::Foundation::HRESULT),
    get_JournalQuota : Proc(IMSMQQueueInfo4*, Int32*, Win32cr::Foundation::HRESULT),
    put_JournalQuota : Proc(IMSMQQueueInfo4*, Int32, Win32cr::Foundation::HRESULT),
    get_IsWorldReadable : Proc(IMSMQQueueInfo4*, Int16*, Win32cr::Foundation::HRESULT),
    create : Proc(IMSMQQueueInfo4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    delete : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::HRESULT),
    open : Proc(IMSMQQueueInfo4*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::HRESULT),
    update : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::HRESULT),
    get_PathNameDNS : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQueueInfo4*, Void**, Win32cr::Foundation::HRESULT),
    get_Security : Proc(IMSMQQueueInfo4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Security : Proc(IMSMQQueueInfo4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_IsTransactional2 : Proc(IMSMQQueueInfo4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsWorldReadable2 : Proc(IMSMQQueueInfo4*, Int16*, Win32cr::Foundation::HRESULT),
    get_MulticastAddress : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MulticastAddress : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ADsPath : Proc(IMSMQQueueInfo4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueueInfo4, lpVtbl : IMSMQQueueInfo4Vtbl* do
    GUID = LibC::GUID.new(0xeba96b21_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQueueInfo4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueueInfo4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueueInfo4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueueInfo4*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueueInfo4*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueueInfo4*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueueInfo4*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_QueueGuid(this : IMSMQQueueInfo4*, pbstrGuidQueue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueGuid.call(this, pbstrGuidQueue)
    end
    def get_ServiceTypeGuid(this : IMSMQQueueInfo4*, pbstrGuidServiceType : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceTypeGuid.call(this, pbstrGuidServiceType)
    end
    def put_ServiceTypeGuid(this : IMSMQQueueInfo4*, bstrGuidServiceType : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceTypeGuid.call(this, bstrGuidServiceType)
    end
    def get_Label(this : IMSMQQueueInfo4*, pbstrLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Label.call(this, pbstrLabel)
    end
    def put_Label(this : IMSMQQueueInfo4*, bstrLabel : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Label.call(this, bstrLabel)
    end
    def get_PathName(this : IMSMQQueueInfo4*, pbstrPathName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathName.call(this, pbstrPathName)
    end
    def put_PathName(this : IMSMQQueueInfo4*, bstrPathName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PathName.call(this, bstrPathName)
    end
    def get_FormatName(this : IMSMQQueueInfo4*, pbstrFormatName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FormatName.call(this, pbstrFormatName)
    end
    def put_FormatName(this : IMSMQQueueInfo4*, bstrFormatName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FormatName.call(this, bstrFormatName)
    end
    def get_IsTransactional(this : IMSMQQueueInfo4*, pisTransactional : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTransactional.call(this, pisTransactional)
    end
    def get_PrivLevel(this : IMSMQQueueInfo4*, plPrivLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivLevel.call(this, plPrivLevel)
    end
    def put_PrivLevel(this : IMSMQQueueInfo4*, lPrivLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivLevel.call(this, lPrivLevel)
    end
    def get_Journal(this : IMSMQQueueInfo4*, plJournal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Journal.call(this, plJournal)
    end
    def put_Journal(this : IMSMQQueueInfo4*, lJournal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Journal.call(this, lJournal)
    end
    def get_Quota(this : IMSMQQueueInfo4*, plQuota : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Quota.call(this, plQuota)
    end
    def put_Quota(this : IMSMQQueueInfo4*, lQuota : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Quota.call(this, lQuota)
    end
    def get_BasePriority(this : IMSMQQueueInfo4*, plBasePriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BasePriority.call(this, plBasePriority)
    end
    def put_BasePriority(this : IMSMQQueueInfo4*, lBasePriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BasePriority.call(this, lBasePriority)
    end
    def get_CreateTime(this : IMSMQQueueInfo4*, pvarCreateTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreateTime.call(this, pvarCreateTime)
    end
    def get_ModifyTime(this : IMSMQQueueInfo4*, pvarModifyTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModifyTime.call(this, pvarModifyTime)
    end
    def get_Authenticate(this : IMSMQQueueInfo4*, plAuthenticate : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Authenticate.call(this, plAuthenticate)
    end
    def put_Authenticate(this : IMSMQQueueInfo4*, lAuthenticate : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Authenticate.call(this, lAuthenticate)
    end
    def get_JournalQuota(this : IMSMQQueueInfo4*, plJournalQuota : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_JournalQuota.call(this, plJournalQuota)
    end
    def put_JournalQuota(this : IMSMQQueueInfo4*, lJournalQuota : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_JournalQuota.call(this, lJournalQuota)
    end
    def get_IsWorldReadable(this : IMSMQQueueInfo4*, pisWorldReadable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsWorldReadable.call(this, pisWorldReadable)
    end
    def create(this : IMSMQQueueInfo4*, is_transactional : Win32cr::System::Com::VARIANT*, is_world_readable : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, is_transactional, is_world_readable)
    end
    def delete(this : IMSMQQueueInfo4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def open(this : IMSMQQueueInfo4*, access : Int32, share_mode : Int32, ppq : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, access, share_mode, ppq)
    end
    def refresh(this : IMSMQQueueInfo4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def update(this : IMSMQQueueInfo4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this)
    end
    def get_PathNameDNS(this : IMSMQQueueInfo4*, pbstrPathNameDNS : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathNameDNS.call(this, pbstrPathNameDNS)
    end
    def get_Properties(this : IMSMQQueueInfo4*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_Security(this : IMSMQQueueInfo4*, pvarSecurity : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Security.call(this, pvarSecurity)
    end
    def put_Security(this : IMSMQQueueInfo4*, varSecurity : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Security.call(this, varSecurity)
    end
    def get_IsTransactional2(this : IMSMQQueueInfo4*, pisTransactional : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTransactional2.call(this, pisTransactional)
    end
    def get_IsWorldReadable2(this : IMSMQQueueInfo4*, pisWorldReadable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsWorldReadable2.call(this, pisWorldReadable)
    end
    def get_MulticastAddress(this : IMSMQQueueInfo4*, pbstrMulticastAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MulticastAddress.call(this, pbstrMulticastAddress)
    end
    def put_MulticastAddress(this : IMSMQQueueInfo4*, bstrMulticastAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MulticastAddress.call(this, bstrMulticastAddress)
    end
    def get_ADsPath(this : IMSMQQueueInfo4*, pbstrADsPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ADsPath.call(this, pbstrADsPath)
    end

  end

  @[Extern]
  record IMSMQQueueVtbl,
    query_interface : Proc(IMSMQQueue*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueue*, UInt32),
    release : Proc(IMSMQQueue*, UInt32),
    get_type_info_count : Proc(IMSMQQueue*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueue*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueue*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueue*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Access : Proc(IMSMQQueue*, Int32*, Win32cr::Foundation::HRESULT),
    get_ShareMode : Proc(IMSMQQueue*, Int32*, Win32cr::Foundation::HRESULT),
    get_QueueInfo : Proc(IMSMQQueue*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(IMSMQQueue*, Int32*, Win32cr::Foundation::HRESULT),
    get_IsOpen : Proc(IMSMQQueue*, Int16*, Win32cr::Foundation::HRESULT),
    close : Proc(IMSMQQueue*, Win32cr::Foundation::HRESULT),
    receive : Proc(IMSMQQueue*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek : Proc(IMSMQQueue*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    enable_notification : Proc(IMSMQQueue*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMSMQQueue*, Win32cr::Foundation::HRESULT),
    receive_current : Proc(IMSMQQueue*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_next : Proc(IMSMQQueue*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_current : Proc(IMSMQQueue*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueue, lpVtbl : IMSMQQueueVtbl* do
    GUID = LibC::GUID.new(0xd7d6e076_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQQueue*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueue*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueue*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueue*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueue*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueue*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueue*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Access(this : IMSMQQueue*, plAccess : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Access.call(this, plAccess)
    end
    def get_ShareMode(this : IMSMQQueue*, plShareMode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShareMode.call(this, plShareMode)
    end
    def get_QueueInfo(this : IMSMQQueue*, ppqinfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueInfo.call(this, ppqinfo)
    end
    def get_Handle(this : IMSMQQueue*, plHandle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, plHandle)
    end
    def get_IsOpen(this : IMSMQQueue*, pisOpen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsOpen.call(this, pisOpen)
    end
    def close(this : IMSMQQueue*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def receive(this : IMSMQQueue*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive.call(this, transaction, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek(this : IMSMQQueue*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def enable_notification(this : IMSMQQueue*, event : Void*, cursor : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_notification.call(this, event, cursor, receive_timeout)
    end
    def reset(this : IMSMQQueue*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def receive_current(this : IMSMQQueue*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_current.call(this, transaction, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_next(this : IMSMQQueue*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_next.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_current(this : IMSMQQueue*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_current.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end

  end

  @[Extern]
  record IMSMQQueue2Vtbl,
    query_interface : Proc(IMSMQQueue2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueue2*, UInt32),
    release : Proc(IMSMQQueue2*, UInt32),
    get_type_info_count : Proc(IMSMQQueue2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueue2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueue2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueue2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Access : Proc(IMSMQQueue2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ShareMode : Proc(IMSMQQueue2*, Int32*, Win32cr::Foundation::HRESULT),
    get_QueueInfo : Proc(IMSMQQueue2*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(IMSMQQueue2*, Int32*, Win32cr::Foundation::HRESULT),
    get_IsOpen : Proc(IMSMQQueue2*, Int16*, Win32cr::Foundation::HRESULT),
    close : Proc(IMSMQQueue2*, Win32cr::Foundation::HRESULT),
    receive_v1 : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_v1 : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    enable_notification : Proc(IMSMQQueue2*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMSMQQueue2*, Win32cr::Foundation::HRESULT),
    receive_current_v1 : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_next_v1 : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_current_v1 : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_current : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_next : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_current : Proc(IMSMQQueue2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQueue2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueue2, lpVtbl : IMSMQQueue2Vtbl* do
    GUID = LibC::GUID.new(0xef0574e0_u32, 0x6d8_u16, 0x11d3_u16, StaticArray[0xb1_u8, 0x0_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQueue2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueue2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueue2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueue2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueue2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueue2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueue2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Access(this : IMSMQQueue2*, plAccess : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Access.call(this, plAccess)
    end
    def get_ShareMode(this : IMSMQQueue2*, plShareMode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShareMode.call(this, plShareMode)
    end
    def get_QueueInfo(this : IMSMQQueue2*, ppqinfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueInfo.call(this, ppqinfo)
    end
    def get_Handle(this : IMSMQQueue2*, plHandle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, plHandle)
    end
    def get_IsOpen(this : IMSMQQueue2*, pisOpen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsOpen.call(this, pisOpen)
    end
    def close(this : IMSMQQueue2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def receive_v1(this : IMSMQQueue2*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_v1.call(this, transaction, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_v1(this : IMSMQQueue2*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_v1.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def enable_notification(this : IMSMQQueue2*, event : Void*, cursor : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_notification.call(this, event, cursor, receive_timeout)
    end
    def reset(this : IMSMQQueue2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def receive_current_v1(this : IMSMQQueue2*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_current_v1.call(this, transaction, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_next_v1(this : IMSMQQueue2*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_next_v1.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_current_v1(this : IMSMQQueue2*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_current_v1.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def receive(this : IMSMQQueue2*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive.call(this, transaction, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def peek(this : IMSMQQueue2*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek.call(this, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def receive_current(this : IMSMQQueue2*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_current.call(this, transaction, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def peek_next(this : IMSMQQueue2*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_next.call(this, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def peek_current(this : IMSMQQueue2*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_current.call(this, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def get_Properties(this : IMSMQQueue2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQQueue3Vtbl,
    query_interface : Proc(IMSMQQueue3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueue3*, UInt32),
    release : Proc(IMSMQQueue3*, UInt32),
    get_type_info_count : Proc(IMSMQQueue3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueue3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueue3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueue3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Access : Proc(IMSMQQueue3*, Int32*, Win32cr::Foundation::HRESULT),
    get_ShareMode : Proc(IMSMQQueue3*, Int32*, Win32cr::Foundation::HRESULT),
    get_QueueInfo : Proc(IMSMQQueue3*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(IMSMQQueue3*, Int32*, Win32cr::Foundation::HRESULT),
    get_IsOpen : Proc(IMSMQQueue3*, Int16*, Win32cr::Foundation::HRESULT),
    close : Proc(IMSMQQueue3*, Win32cr::Foundation::HRESULT),
    receive_v1 : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_v1 : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    enable_notification : Proc(IMSMQQueue3*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMSMQQueue3*, Win32cr::Foundation::HRESULT),
    receive_current_v1 : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_next_v1 : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_current_v1 : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_current : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_next : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_current : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQueue3*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle2 : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    receive_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_next_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_previous_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_first_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_last_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_next_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_previous_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_first_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_last_by_lookup_id : Proc(IMSMQQueue3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    purge : Proc(IMSMQQueue3*, Win32cr::Foundation::HRESULT),
    get_IsOpen2 : Proc(IMSMQQueue3*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueue3, lpVtbl : IMSMQQueue3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b1b_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQueue3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueue3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueue3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueue3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueue3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueue3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueue3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Access(this : IMSMQQueue3*, plAccess : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Access.call(this, plAccess)
    end
    def get_ShareMode(this : IMSMQQueue3*, plShareMode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShareMode.call(this, plShareMode)
    end
    def get_QueueInfo(this : IMSMQQueue3*, ppqinfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueInfo.call(this, ppqinfo)
    end
    def get_Handle(this : IMSMQQueue3*, plHandle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, plHandle)
    end
    def get_IsOpen(this : IMSMQQueue3*, pisOpen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsOpen.call(this, pisOpen)
    end
    def close(this : IMSMQQueue3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def receive_v1(this : IMSMQQueue3*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_v1.call(this, transaction, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_v1(this : IMSMQQueue3*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_v1.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def enable_notification(this : IMSMQQueue3*, event : Void*, cursor : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_notification.call(this, event, cursor, receive_timeout)
    end
    def reset(this : IMSMQQueue3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def receive_current_v1(this : IMSMQQueue3*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_current_v1.call(this, transaction, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_next_v1(this : IMSMQQueue3*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_next_v1.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_current_v1(this : IMSMQQueue3*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_current_v1.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def receive(this : IMSMQQueue3*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive.call(this, transaction, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def peek(this : IMSMQQueue3*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek.call(this, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def receive_current(this : IMSMQQueue3*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_current.call(this, transaction, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def peek_next(this : IMSMQQueue3*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_next.call(this, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def peek_current(this : IMSMQQueue3*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_current.call(this, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def get_Properties(this : IMSMQQueue3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_Handle2(this : IMSMQQueue3*, pvarHandle : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle2.call(this, pvarHandle)
    end
    def receive_by_lookup_id(this : IMSMQQueue3*, lookup_id : Win32cr::System::Com::VARIANT, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_by_lookup_id.call(this, lookup_id, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def receive_next_by_lookup_id(this : IMSMQQueue3*, lookup_id : Win32cr::System::Com::VARIANT, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_next_by_lookup_id.call(this, lookup_id, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def receive_previous_by_lookup_id(this : IMSMQQueue3*, lookup_id : Win32cr::System::Com::VARIANT, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_previous_by_lookup_id.call(this, lookup_id, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def receive_first_by_lookup_id(this : IMSMQQueue3*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_first_by_lookup_id.call(this, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def receive_last_by_lookup_id(this : IMSMQQueue3*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_last_by_lookup_id.call(this, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_by_lookup_id(this : IMSMQQueue3*, lookup_id : Win32cr::System::Com::VARIANT, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_by_lookup_id.call(this, lookup_id, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_next_by_lookup_id(this : IMSMQQueue3*, lookup_id : Win32cr::System::Com::VARIANT, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_next_by_lookup_id.call(this, lookup_id, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_previous_by_lookup_id(this : IMSMQQueue3*, lookup_id : Win32cr::System::Com::VARIANT, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_previous_by_lookup_id.call(this, lookup_id, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_first_by_lookup_id(this : IMSMQQueue3*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_first_by_lookup_id.call(this, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_last_by_lookup_id(this : IMSMQQueue3*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_last_by_lookup_id.call(this, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def purge(this : IMSMQQueue3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.purge.call(this)
    end
    def get_IsOpen2(this : IMSMQQueue3*, pisOpen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsOpen2.call(this, pisOpen)
    end

  end

  @[Extern]
  record IMSMQQueue4Vtbl,
    query_interface : Proc(IMSMQQueue4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueue4*, UInt32),
    release : Proc(IMSMQQueue4*, UInt32),
    get_type_info_count : Proc(IMSMQQueue4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueue4*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueue4*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueue4*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Access : Proc(IMSMQQueue4*, Int32*, Win32cr::Foundation::HRESULT),
    get_ShareMode : Proc(IMSMQQueue4*, Int32*, Win32cr::Foundation::HRESULT),
    get_QueueInfo : Proc(IMSMQQueue4*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(IMSMQQueue4*, Int32*, Win32cr::Foundation::HRESULT),
    get_IsOpen : Proc(IMSMQQueue4*, Int16*, Win32cr::Foundation::HRESULT),
    close : Proc(IMSMQQueue4*, Win32cr::Foundation::HRESULT),
    receive_v1 : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_v1 : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    enable_notification : Proc(IMSMQQueue4*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMSMQQueue4*, Win32cr::Foundation::HRESULT),
    receive_current_v1 : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_next_v1 : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_current_v1 : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_current : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_next : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_current : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQueue4*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle2 : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    receive_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_next_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_previous_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_first_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    receive_last_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_next_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_previous_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_first_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    peek_last_by_lookup_id : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    purge : Proc(IMSMQQueue4*, Win32cr::Foundation::HRESULT),
    get_IsOpen2 : Proc(IMSMQQueue4*, Int16*, Win32cr::Foundation::HRESULT),
    receive_by_lookup_id_allow_peek : Proc(IMSMQQueue4*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueue4, lpVtbl : IMSMQQueue4Vtbl* do
    GUID = LibC::GUID.new(0xeba96b20_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQueue4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueue4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueue4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueue4*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueue4*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueue4*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueue4*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Access(this : IMSMQQueue4*, plAccess : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Access.call(this, plAccess)
    end
    def get_ShareMode(this : IMSMQQueue4*, plShareMode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShareMode.call(this, plShareMode)
    end
    def get_QueueInfo(this : IMSMQQueue4*, ppqinfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueInfo.call(this, ppqinfo)
    end
    def get_Handle(this : IMSMQQueue4*, plHandle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, plHandle)
    end
    def get_IsOpen(this : IMSMQQueue4*, pisOpen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsOpen.call(this, pisOpen)
    end
    def close(this : IMSMQQueue4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def receive_v1(this : IMSMQQueue4*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_v1.call(this, transaction, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_v1(this : IMSMQQueue4*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_v1.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def enable_notification(this : IMSMQQueue4*, event : Void*, cursor : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_notification.call(this, event, cursor, receive_timeout)
    end
    def reset(this : IMSMQQueue4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def receive_current_v1(this : IMSMQQueue4*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_current_v1.call(this, transaction, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_next_v1(this : IMSMQQueue4*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_next_v1.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def peek_current_v1(this : IMSMQQueue4*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_current_v1.call(this, want_destination_queue, want_body, receive_timeout, ppmsg)
    end
    def receive(this : IMSMQQueue4*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive.call(this, transaction, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def peek(this : IMSMQQueue4*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek.call(this, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def receive_current(this : IMSMQQueue4*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_current.call(this, transaction, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def peek_next(this : IMSMQQueue4*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_next.call(this, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def peek_current(this : IMSMQQueue4*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, receive_timeout : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_current.call(this, want_destination_queue, want_body, receive_timeout, want_connector_type, ppmsg)
    end
    def get_Properties(this : IMSMQQueue4*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_Handle2(this : IMSMQQueue4*, pvarHandle : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle2.call(this, pvarHandle)
    end
    def receive_by_lookup_id(this : IMSMQQueue4*, lookup_id : Win32cr::System::Com::VARIANT, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_by_lookup_id.call(this, lookup_id, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def receive_next_by_lookup_id(this : IMSMQQueue4*, lookup_id : Win32cr::System::Com::VARIANT, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_next_by_lookup_id.call(this, lookup_id, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def receive_previous_by_lookup_id(this : IMSMQQueue4*, lookup_id : Win32cr::System::Com::VARIANT, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_previous_by_lookup_id.call(this, lookup_id, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def receive_first_by_lookup_id(this : IMSMQQueue4*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_first_by_lookup_id.call(this, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def receive_last_by_lookup_id(this : IMSMQQueue4*, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_last_by_lookup_id.call(this, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_by_lookup_id(this : IMSMQQueue4*, lookup_id : Win32cr::System::Com::VARIANT, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_by_lookup_id.call(this, lookup_id, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_next_by_lookup_id(this : IMSMQQueue4*, lookup_id : Win32cr::System::Com::VARIANT, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_next_by_lookup_id.call(this, lookup_id, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_previous_by_lookup_id(this : IMSMQQueue4*, lookup_id : Win32cr::System::Com::VARIANT, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_previous_by_lookup_id.call(this, lookup_id, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_first_by_lookup_id(this : IMSMQQueue4*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_first_by_lookup_id.call(this, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def peek_last_by_lookup_id(this : IMSMQQueue4*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_last_by_lookup_id.call(this, want_destination_queue, want_body, want_connector_type, ppmsg)
    end
    def purge(this : IMSMQQueue4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.purge.call(this)
    end
    def get_IsOpen2(this : IMSMQQueue4*, pisOpen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsOpen2.call(this, pisOpen)
    end
    def receive_by_lookup_id_allow_peek(this : IMSMQQueue4*, lookup_id : Win32cr::System::Com::VARIANT, transaction : Win32cr::System::Com::VARIANT*, want_destination_queue : Win32cr::System::Com::VARIANT*, want_body : Win32cr::System::Com::VARIANT*, want_connector_type : Win32cr::System::Com::VARIANT*, ppmsg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive_by_lookup_id_allow_peek.call(this, lookup_id, transaction, want_destination_queue, want_body, want_connector_type, ppmsg)
    end

  end

  @[Extern]
  record IMSMQMessageVtbl,
    query_interface : Proc(IMSMQMessage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQMessage*, UInt32),
    release : Proc(IMSMQMessage*, UInt32),
    get_type_info_count : Proc(IMSMQMessage*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQMessage*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQMessage*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQMessage*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Class : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    get_PrivLevel : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrivLevel : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_AuthLevel : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_AuthLevel : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_IsAuthenticated : Proc(IMSMQMessage*, Int16*, Win32cr::Foundation::HRESULT),
    get_Delivery : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_Delivery : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_Trace : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_Trace : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_Journal : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_Journal : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_ResponseQueueInfo : Proc(IMSMQMessage*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseQueueInfo : Proc(IMSMQMessage*, Void*, Win32cr::Foundation::HRESULT),
    get_AppSpecific : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_AppSpecific : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_SourceMachineGuid : Proc(IMSMQMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_BodyLength : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    get_Body : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Body : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_AdminQueueInfo : Proc(IMSMQMessage*, Void**, Win32cr::Foundation::HRESULT),
    putref_AdminQueueInfo : Proc(IMSMQMessage*, Void*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CorrelationId : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_CorrelationId : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Ack : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_Ack : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_Label : Proc(IMSMQMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Label : Proc(IMSMQMessage*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MaxTimeToReachQueue : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxTimeToReachQueue : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxTimeToReceive : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxTimeToReceive : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_HashAlgorithm : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_HashAlgorithm : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_EncryptAlgorithm : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_EncryptAlgorithm : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    get_SentTime : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ArrivedTime : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DestinationQueueInfo : Proc(IMSMQMessage*, Void**, Win32cr::Foundation::HRESULT),
    get_SenderCertificate : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SenderCertificate : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SenderId : Proc(IMSMQMessage*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_SenderIdType : Proc(IMSMQMessage*, Int32*, Win32cr::Foundation::HRESULT),
    put_SenderIdType : Proc(IMSMQMessage*, Int32, Win32cr::Foundation::HRESULT),
    send : Proc(IMSMQMessage*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    attach_current_security_context : Proc(IMSMQMessage*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQMessage, lpVtbl : IMSMQMessageVtbl* do
    GUID = LibC::GUID.new(0xd7d6e074_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQMessage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQMessage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQMessage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQMessage*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQMessage*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQMessage*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQMessage*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Class(this : IMSMQMessage*, plClass : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Class.call(this, plClass)
    end
    def get_PrivLevel(this : IMSMQMessage*, plPrivLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivLevel.call(this, plPrivLevel)
    end
    def put_PrivLevel(this : IMSMQMessage*, lPrivLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivLevel.call(this, lPrivLevel)
    end
    def get_AuthLevel(this : IMSMQMessage*, plAuthLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthLevel.call(this, plAuthLevel)
    end
    def put_AuthLevel(this : IMSMQMessage*, lAuthLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthLevel.call(this, lAuthLevel)
    end
    def get_IsAuthenticated(this : IMSMQMessage*, pisAuthenticated : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsAuthenticated.call(this, pisAuthenticated)
    end
    def get_Delivery(this : IMSMQMessage*, plDelivery : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Delivery.call(this, plDelivery)
    end
    def put_Delivery(this : IMSMQMessage*, lDelivery : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Delivery.call(this, lDelivery)
    end
    def get_Trace(this : IMSMQMessage*, plTrace : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Trace.call(this, plTrace)
    end
    def put_Trace(this : IMSMQMessage*, lTrace : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Trace.call(this, lTrace)
    end
    def get_Priority(this : IMSMQMessage*, plPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, plPriority)
    end
    def put_Priority(this : IMSMQMessage*, lPriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, lPriority)
    end
    def get_Journal(this : IMSMQMessage*, plJournal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Journal.call(this, plJournal)
    end
    def put_Journal(this : IMSMQMessage*, lJournal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Journal.call(this, lJournal)
    end
    def get_ResponseQueueInfo(this : IMSMQMessage*, ppqinfoResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseQueueInfo.call(this, ppqinfoResponse)
    end
    def putref_ResponseQueueInfo(this : IMSMQMessage*, pqinfoResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseQueueInfo.call(this, pqinfoResponse)
    end
    def get_AppSpecific(this : IMSMQMessage*, plAppSpecific : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppSpecific.call(this, plAppSpecific)
    end
    def put_AppSpecific(this : IMSMQMessage*, lAppSpecific : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AppSpecific.call(this, lAppSpecific)
    end
    def get_SourceMachineGuid(this : IMSMQMessage*, pbstrGuidSrcMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SourceMachineGuid.call(this, pbstrGuidSrcMachine)
    end
    def get_BodyLength(this : IMSMQMessage*, pcbBody : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BodyLength.call(this, pcbBody)
    end
    def get_Body(this : IMSMQMessage*, pvarBody : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Body.call(this, pvarBody)
    end
    def put_Body(this : IMSMQMessage*, varBody : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Body.call(this, varBody)
    end
    def get_AdminQueueInfo(this : IMSMQMessage*, ppqinfoAdmin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminQueueInfo.call(this, ppqinfoAdmin)
    end
    def putref_AdminQueueInfo(this : IMSMQMessage*, pqinfoAdmin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AdminQueueInfo.call(this, pqinfoAdmin)
    end
    def get_Id(this : IMSMQMessage*, pvarMsgId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pvarMsgId)
    end
    def get_CorrelationId(this : IMSMQMessage*, pvarMsgId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CorrelationId.call(this, pvarMsgId)
    end
    def put_CorrelationId(this : IMSMQMessage*, varMsgId : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CorrelationId.call(this, varMsgId)
    end
    def get_Ack(this : IMSMQMessage*, plAck : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ack.call(this, plAck)
    end
    def put_Ack(this : IMSMQMessage*, lAck : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Ack.call(this, lAck)
    end
    def get_Label(this : IMSMQMessage*, pbstrLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Label.call(this, pbstrLabel)
    end
    def put_Label(this : IMSMQMessage*, bstrLabel : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Label.call(this, bstrLabel)
    end
    def get_MaxTimeToReachQueue(this : IMSMQMessage*, plMaxTimeToReachQueue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxTimeToReachQueue.call(this, plMaxTimeToReachQueue)
    end
    def put_MaxTimeToReachQueue(this : IMSMQMessage*, lMaxTimeToReachQueue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxTimeToReachQueue.call(this, lMaxTimeToReachQueue)
    end
    def get_MaxTimeToReceive(this : IMSMQMessage*, plMaxTimeToReceive : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxTimeToReceive.call(this, plMaxTimeToReceive)
    end
    def put_MaxTimeToReceive(this : IMSMQMessage*, lMaxTimeToReceive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxTimeToReceive.call(this, lMaxTimeToReceive)
    end
    def get_HashAlgorithm(this : IMSMQMessage*, plHashAlg : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HashAlgorithm.call(this, plHashAlg)
    end
    def put_HashAlgorithm(this : IMSMQMessage*, lHashAlg : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HashAlgorithm.call(this, lHashAlg)
    end
    def get_EncryptAlgorithm(this : IMSMQMessage*, plEncryptAlg : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EncryptAlgorithm.call(this, plEncryptAlg)
    end
    def put_EncryptAlgorithm(this : IMSMQMessage*, lEncryptAlg : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EncryptAlgorithm.call(this, lEncryptAlg)
    end
    def get_SentTime(this : IMSMQMessage*, pvarSentTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SentTime.call(this, pvarSentTime)
    end
    def get_ArrivedTime(this : IMSMQMessage*, plArrivedTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArrivedTime.call(this, plArrivedTime)
    end
    def get_DestinationQueueInfo(this : IMSMQMessage*, ppqinfoDest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationQueueInfo.call(this, ppqinfoDest)
    end
    def get_SenderCertificate(this : IMSMQMessage*, pvarSenderCert : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderCertificate.call(this, pvarSenderCert)
    end
    def put_SenderCertificate(this : IMSMQMessage*, varSenderCert : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderCertificate.call(this, varSenderCert)
    end
    def get_SenderId(this : IMSMQMessage*, pvarSenderId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderId.call(this, pvarSenderId)
    end
    def get_SenderIdType(this : IMSMQMessage*, plSenderIdType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderIdType.call(this, plSenderIdType)
    end
    def put_SenderIdType(this : IMSMQMessage*, lSenderIdType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderIdType.call(this, lSenderIdType)
    end
    def send(this : IMSMQMessage*, destination_queue : Void*, transaction : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send.call(this, destination_queue, transaction)
    end
    def attach_current_security_context(this : IMSMQMessage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_current_security_context.call(this)
    end

  end

  @[Extern]
  record IMSMQQueueInfosVtbl,
    query_interface : Proc(IMSMQQueueInfos*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueueInfos*, UInt32),
    release : Proc(IMSMQQueueInfos*, UInt32),
    get_type_info_count : Proc(IMSMQQueueInfos*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueueInfos*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueueInfos*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueueInfos*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMSMQQueueInfos*, Win32cr::Foundation::HRESULT),
    next__ : Proc(IMSMQQueueInfos*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueueInfos, lpVtbl : IMSMQQueueInfosVtbl* do
    GUID = LibC::GUID.new(0xd7d6e07d_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQQueueInfos*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueueInfos*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueueInfos*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueueInfos*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueueInfos*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueueInfos*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueueInfos*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def reset(this : IMSMQQueueInfos*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def next__(this : IMSMQQueueInfos*, ppqinfoNext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ppqinfoNext)
    end

  end

  @[Extern]
  record IMSMQQueueInfos2Vtbl,
    query_interface : Proc(IMSMQQueueInfos2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueueInfos2*, UInt32),
    release : Proc(IMSMQQueueInfos2*, UInt32),
    get_type_info_count : Proc(IMSMQQueueInfos2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueueInfos2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueueInfos2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueueInfos2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMSMQQueueInfos2*, Win32cr::Foundation::HRESULT),
    next__ : Proc(IMSMQQueueInfos2*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQueueInfos2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueueInfos2, lpVtbl : IMSMQQueueInfos2Vtbl* do
    GUID = LibC::GUID.new(0xeba96b0f_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQueueInfos2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueueInfos2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueueInfos2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueueInfos2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueueInfos2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueueInfos2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueueInfos2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def reset(this : IMSMQQueueInfos2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def next__(this : IMSMQQueueInfos2*, ppqinfoNext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ppqinfoNext)
    end
    def get_Properties(this : IMSMQQueueInfos2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQQueueInfos3Vtbl,
    query_interface : Proc(IMSMQQueueInfos3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueueInfos3*, UInt32),
    release : Proc(IMSMQQueueInfos3*, UInt32),
    get_type_info_count : Proc(IMSMQQueueInfos3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueueInfos3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueueInfos3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueueInfos3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMSMQQueueInfos3*, Win32cr::Foundation::HRESULT),
    next__ : Proc(IMSMQQueueInfos3*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQueueInfos3*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueueInfos3, lpVtbl : IMSMQQueueInfos3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b1e_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQueueInfos3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueueInfos3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueueInfos3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueueInfos3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueueInfos3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueueInfos3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueueInfos3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def reset(this : IMSMQQueueInfos3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def next__(this : IMSMQQueueInfos3*, ppqinfoNext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ppqinfoNext)
    end
    def get_Properties(this : IMSMQQueueInfos3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQQueueInfos4Vtbl,
    query_interface : Proc(IMSMQQueueInfos4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueueInfos4*, UInt32),
    release : Proc(IMSMQQueueInfos4*, UInt32),
    get_type_info_count : Proc(IMSMQQueueInfos4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueueInfos4*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueueInfos4*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueueInfos4*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMSMQQueueInfos4*, Win32cr::Foundation::HRESULT),
    next__ : Proc(IMSMQQueueInfos4*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQueueInfos4*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueueInfos4, lpVtbl : IMSMQQueueInfos4Vtbl* do
    GUID = LibC::GUID.new(0xeba96b22_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQueueInfos4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueueInfos4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueueInfos4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueueInfos4*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueueInfos4*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueueInfos4*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueueInfos4*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def reset(this : IMSMQQueueInfos4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def next__(this : IMSMQQueueInfos4*, ppqinfoNext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ppqinfoNext)
    end
    def get_Properties(this : IMSMQQueueInfos4*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQEventVtbl,
    query_interface : Proc(IMSMQEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQEvent*, UInt32),
    release : Proc(IMSMQEvent*, UInt32),
    get_type_info_count : Proc(IMSMQEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQEvent, lpVtbl : IMSMQEventVtbl* do
    GUID = LibC::GUID.new(0xd7d6e077_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IMSMQEvent2Vtbl,
    query_interface : Proc(IMSMQEvent2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQEvent2*, UInt32),
    release : Proc(IMSMQEvent2*, UInt32),
    get_type_info_count : Proc(IMSMQEvent2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQEvent2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQEvent2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQEvent2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQEvent2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQEvent2, lpVtbl : IMSMQEvent2Vtbl* do
    GUID = LibC::GUID.new(0xeba96b12_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQEvent2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQEvent2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQEvent2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQEvent2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQEvent2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQEvent2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQEvent2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Properties(this : IMSMQEvent2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQEvent3Vtbl,
    query_interface : Proc(IMSMQEvent3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQEvent3*, UInt32),
    release : Proc(IMSMQEvent3*, UInt32),
    get_type_info_count : Proc(IMSMQEvent3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQEvent3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQEvent3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQEvent3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQEvent3*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQEvent3, lpVtbl : IMSMQEvent3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b1c_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQEvent3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQEvent3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQEvent3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQEvent3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQEvent3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQEvent3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQEvent3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Properties(this : IMSMQEvent3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQTransactionVtbl,
    query_interface : Proc(IMSMQTransaction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQTransaction*, UInt32),
    release : Proc(IMSMQTransaction*, UInt32),
    get_type_info_count : Proc(IMSMQTransaction*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQTransaction*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQTransaction*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQTransaction*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Transaction : Proc(IMSMQTransaction*, Int32*, Win32cr::Foundation::HRESULT),
    commit : Proc(IMSMQTransaction*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    abort : Proc(IMSMQTransaction*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQTransaction, lpVtbl : IMSMQTransactionVtbl* do
    GUID = LibC::GUID.new(0xd7d6e07f_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQTransaction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQTransaction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQTransaction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQTransaction*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQTransaction*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQTransaction*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQTransaction*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Transaction(this : IMSMQTransaction*, plTransaction : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Transaction.call(this, plTransaction)
    end
    def commit(this : IMSMQTransaction*, fRetaining : Win32cr::System::Com::VARIANT*, grfTC : Win32cr::System::Com::VARIANT*, grfRM : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, fRetaining, grfTC, grfRM)
    end
    def abort(this : IMSMQTransaction*, fRetaining : Win32cr::System::Com::VARIANT*, fAsync : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this, fRetaining, fAsync)
    end

  end

  @[Extern]
  record IMSMQCoordinatedTransactionDispenserVtbl,
    query_interface : Proc(IMSMQCoordinatedTransactionDispenser*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQCoordinatedTransactionDispenser*, UInt32),
    release : Proc(IMSMQCoordinatedTransactionDispenser*, UInt32),
    get_type_info_count : Proc(IMSMQCoordinatedTransactionDispenser*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQCoordinatedTransactionDispenser*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQCoordinatedTransactionDispenser*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQCoordinatedTransactionDispenser*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_transaction : Proc(IMSMQCoordinatedTransactionDispenser*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQCoordinatedTransactionDispenser, lpVtbl : IMSMQCoordinatedTransactionDispenserVtbl* do
    GUID = LibC::GUID.new(0xd7d6e081_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQCoordinatedTransactionDispenser*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQCoordinatedTransactionDispenser*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQCoordinatedTransactionDispenser*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQCoordinatedTransactionDispenser*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQCoordinatedTransactionDispenser*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQCoordinatedTransactionDispenser*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQCoordinatedTransactionDispenser*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def begin_transaction(this : IMSMQCoordinatedTransactionDispenser*, ptransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_transaction.call(this, ptransaction)
    end

  end

  @[Extern]
  record IMSMQTransactionDispenserVtbl,
    query_interface : Proc(IMSMQTransactionDispenser*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQTransactionDispenser*, UInt32),
    release : Proc(IMSMQTransactionDispenser*, UInt32),
    get_type_info_count : Proc(IMSMQTransactionDispenser*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQTransactionDispenser*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQTransactionDispenser*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQTransactionDispenser*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_transaction : Proc(IMSMQTransactionDispenser*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQTransactionDispenser, lpVtbl : IMSMQTransactionDispenserVtbl* do
    GUID = LibC::GUID.new(0xd7d6e083_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQTransactionDispenser*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQTransactionDispenser*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQTransactionDispenser*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQTransactionDispenser*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQTransactionDispenser*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQTransactionDispenser*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQTransactionDispenser*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def begin_transaction(this : IMSMQTransactionDispenser*, ptransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_transaction.call(this, ptransaction)
    end

  end

  @[Extern]
  record IMSMQQuery2Vtbl,
    query_interface : Proc(IMSMQQuery2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQuery2*, UInt32),
    release : Proc(IMSMQQuery2*, UInt32),
    get_type_info_count : Proc(IMSMQQuery2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQuery2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQuery2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQuery2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    lookup_queue : Proc(IMSMQQuery2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQuery2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQuery2, lpVtbl : IMSMQQuery2Vtbl* do
    GUID = LibC::GUID.new(0xeba96b0e_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQuery2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQuery2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQuery2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQuery2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQuery2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQuery2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQuery2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def lookup_queue(this : IMSMQQuery2*, queue_guid : Win32cr::System::Com::VARIANT*, service_type_guid : Win32cr::System::Com::VARIANT*, label : Win32cr::System::Com::VARIANT*, create_time : Win32cr::System::Com::VARIANT*, modify_time : Win32cr::System::Com::VARIANT*, rel_service_type : Win32cr::System::Com::VARIANT*, rel_label : Win32cr::System::Com::VARIANT*, rel_create_time : Win32cr::System::Com::VARIANT*, rel_modify_time : Win32cr::System::Com::VARIANT*, ppqinfos : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_queue.call(this, queue_guid, service_type_guid, label, create_time, modify_time, rel_service_type, rel_label, rel_create_time, rel_modify_time, ppqinfos)
    end
    def get_Properties(this : IMSMQQuery2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQQuery3Vtbl,
    query_interface : Proc(IMSMQQuery3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQuery3*, UInt32),
    release : Proc(IMSMQQuery3*, UInt32),
    get_type_info_count : Proc(IMSMQQuery3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQuery3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQuery3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQuery3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    lookup_queue_v2 : Proc(IMSMQQuery3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQuery3*, Void**, Win32cr::Foundation::HRESULT),
    lookup_queue : Proc(IMSMQQuery3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQuery3, lpVtbl : IMSMQQuery3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b19_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQuery3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQuery3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQuery3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQuery3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQuery3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQuery3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQuery3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def lookup_queue_v2(this : IMSMQQuery3*, queue_guid : Win32cr::System::Com::VARIANT*, service_type_guid : Win32cr::System::Com::VARIANT*, label : Win32cr::System::Com::VARIANT*, create_time : Win32cr::System::Com::VARIANT*, modify_time : Win32cr::System::Com::VARIANT*, rel_service_type : Win32cr::System::Com::VARIANT*, rel_label : Win32cr::System::Com::VARIANT*, rel_create_time : Win32cr::System::Com::VARIANT*, rel_modify_time : Win32cr::System::Com::VARIANT*, ppqinfos : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_queue_v2.call(this, queue_guid, service_type_guid, label, create_time, modify_time, rel_service_type, rel_label, rel_create_time, rel_modify_time, ppqinfos)
    end
    def get_Properties(this : IMSMQQuery3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def lookup_queue(this : IMSMQQuery3*, queue_guid : Win32cr::System::Com::VARIANT*, service_type_guid : Win32cr::System::Com::VARIANT*, label : Win32cr::System::Com::VARIANT*, create_time : Win32cr::System::Com::VARIANT*, modify_time : Win32cr::System::Com::VARIANT*, rel_service_type : Win32cr::System::Com::VARIANT*, rel_label : Win32cr::System::Com::VARIANT*, rel_create_time : Win32cr::System::Com::VARIANT*, rel_modify_time : Win32cr::System::Com::VARIANT*, multicast_address : Win32cr::System::Com::VARIANT*, rel_multicast_address : Win32cr::System::Com::VARIANT*, ppqinfos : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_queue.call(this, queue_guid, service_type_guid, label, create_time, modify_time, rel_service_type, rel_label, rel_create_time, rel_modify_time, multicast_address, rel_multicast_address, ppqinfos)
    end

  end

  @[Extern]
  record IMSMQQuery4Vtbl,
    query_interface : Proc(IMSMQQuery4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQuery4*, UInt32),
    release : Proc(IMSMQQuery4*, UInt32),
    get_type_info_count : Proc(IMSMQQuery4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQuery4*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQuery4*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQuery4*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    lookup_queue_v2 : Proc(IMSMQQuery4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQQuery4*, Void**, Win32cr::Foundation::HRESULT),
    lookup_queue : Proc(IMSMQQuery4*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQuery4, lpVtbl : IMSMQQuery4Vtbl* do
    GUID = LibC::GUID.new(0xeba96b24_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQQuery4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQuery4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQuery4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQuery4*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQuery4*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQuery4*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQuery4*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def lookup_queue_v2(this : IMSMQQuery4*, queue_guid : Win32cr::System::Com::VARIANT*, service_type_guid : Win32cr::System::Com::VARIANT*, label : Win32cr::System::Com::VARIANT*, create_time : Win32cr::System::Com::VARIANT*, modify_time : Win32cr::System::Com::VARIANT*, rel_service_type : Win32cr::System::Com::VARIANT*, rel_label : Win32cr::System::Com::VARIANT*, rel_create_time : Win32cr::System::Com::VARIANT*, rel_modify_time : Win32cr::System::Com::VARIANT*, ppqinfos : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_queue_v2.call(this, queue_guid, service_type_guid, label, create_time, modify_time, rel_service_type, rel_label, rel_create_time, rel_modify_time, ppqinfos)
    end
    def get_Properties(this : IMSMQQuery4*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def lookup_queue(this : IMSMQQuery4*, queue_guid : Win32cr::System::Com::VARIANT*, service_type_guid : Win32cr::System::Com::VARIANT*, label : Win32cr::System::Com::VARIANT*, create_time : Win32cr::System::Com::VARIANT*, modify_time : Win32cr::System::Com::VARIANT*, rel_service_type : Win32cr::System::Com::VARIANT*, rel_label : Win32cr::System::Com::VARIANT*, rel_create_time : Win32cr::System::Com::VARIANT*, rel_modify_time : Win32cr::System::Com::VARIANT*, multicast_address : Win32cr::System::Com::VARIANT*, rel_multicast_address : Win32cr::System::Com::VARIANT*, ppqinfos : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_queue.call(this, queue_guid, service_type_guid, label, create_time, modify_time, rel_service_type, rel_label, rel_create_time, rel_modify_time, multicast_address, rel_multicast_address, ppqinfos)
    end

  end

  @[Extern]
  record IMSMQMessage2Vtbl,
    query_interface : Proc(IMSMQMessage2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQMessage2*, UInt32),
    release : Proc(IMSMQMessage2*, UInt32),
    get_type_info_count : Proc(IMSMQMessage2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQMessage2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQMessage2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQMessage2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Class : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    get_PrivLevel : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrivLevel : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_AuthLevel : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_AuthLevel : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_IsAuthenticated : Proc(IMSMQMessage2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Delivery : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Delivery : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_Trace : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Trace : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_Journal : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Journal : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_ResponseQueueInfo_v1 : Proc(IMSMQMessage2*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseQueueInfo_v1 : Proc(IMSMQMessage2*, Void*, Win32cr::Foundation::HRESULT),
    get_AppSpecific : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_AppSpecific : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_SourceMachineGuid : Proc(IMSMQMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_BodyLength : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Body : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Body : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_AdminQueueInfo_v1 : Proc(IMSMQMessage2*, Void**, Win32cr::Foundation::HRESULT),
    putref_AdminQueueInfo_v1 : Proc(IMSMQMessage2*, Void*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CorrelationId : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_CorrelationId : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Ack : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Ack : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_Label : Proc(IMSMQMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Label : Proc(IMSMQMessage2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MaxTimeToReachQueue : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxTimeToReachQueue : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxTimeToReceive : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxTimeToReceive : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_HashAlgorithm : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_HashAlgorithm : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_EncryptAlgorithm : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_EncryptAlgorithm : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_SentTime : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ArrivedTime : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DestinationQueueInfo : Proc(IMSMQMessage2*, Void**, Win32cr::Foundation::HRESULT),
    get_SenderCertificate : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SenderCertificate : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SenderId : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_SenderIdType : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_SenderIdType : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    send : Proc(IMSMQMessage2*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    attach_current_security_context : Proc(IMSMQMessage2*, Win32cr::Foundation::HRESULT),
    get_SenderVersion : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Extension : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Extension : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ConnectorTypeGuid : Proc(IMSMQMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ConnectorTypeGuid : Proc(IMSMQMessage2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TransactionStatusQueueInfo : Proc(IMSMQMessage2*, Void**, Win32cr::Foundation::HRESULT),
    get_DestinationSymmetricKey : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_DestinationSymmetricKey : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Signature : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Signature : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_AuthenticationProviderType : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_AuthenticationProviderType : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_AuthenticationProviderName : Proc(IMSMQMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_AuthenticationProviderName : Proc(IMSMQMessage2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_SenderId : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MsgClass : Proc(IMSMQMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    put_MsgClass : Proc(IMSMQMessage2*, Int32, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQMessage2*, Void**, Win32cr::Foundation::HRESULT),
    get_TransactionId : Proc(IMSMQMessage2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_IsFirstInTransaction : Proc(IMSMQMessage2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsLastInTransaction : Proc(IMSMQMessage2*, Int16*, Win32cr::Foundation::HRESULT),
    get_ResponseQueueInfo : Proc(IMSMQMessage2*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseQueueInfo : Proc(IMSMQMessage2*, Void*, Win32cr::Foundation::HRESULT),
    get_AdminQueueInfo : Proc(IMSMQMessage2*, Void**, Win32cr::Foundation::HRESULT),
    putref_AdminQueueInfo : Proc(IMSMQMessage2*, Void*, Win32cr::Foundation::HRESULT),
    get_ReceivedAuthenticationLevel : Proc(IMSMQMessage2*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQMessage2, lpVtbl : IMSMQMessage2Vtbl* do
    GUID = LibC::GUID.new(0xd9933be0_u32, 0xa567_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xf3_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQMessage2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQMessage2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQMessage2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQMessage2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQMessage2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQMessage2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQMessage2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Class(this : IMSMQMessage2*, plClass : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Class.call(this, plClass)
    end
    def get_PrivLevel(this : IMSMQMessage2*, plPrivLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivLevel.call(this, plPrivLevel)
    end
    def put_PrivLevel(this : IMSMQMessage2*, lPrivLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivLevel.call(this, lPrivLevel)
    end
    def get_AuthLevel(this : IMSMQMessage2*, plAuthLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthLevel.call(this, plAuthLevel)
    end
    def put_AuthLevel(this : IMSMQMessage2*, lAuthLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthLevel.call(this, lAuthLevel)
    end
    def get_IsAuthenticated(this : IMSMQMessage2*, pisAuthenticated : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsAuthenticated.call(this, pisAuthenticated)
    end
    def get_Delivery(this : IMSMQMessage2*, plDelivery : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Delivery.call(this, plDelivery)
    end
    def put_Delivery(this : IMSMQMessage2*, lDelivery : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Delivery.call(this, lDelivery)
    end
    def get_Trace(this : IMSMQMessage2*, plTrace : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Trace.call(this, plTrace)
    end
    def put_Trace(this : IMSMQMessage2*, lTrace : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Trace.call(this, lTrace)
    end
    def get_Priority(this : IMSMQMessage2*, plPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, plPriority)
    end
    def put_Priority(this : IMSMQMessage2*, lPriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, lPriority)
    end
    def get_Journal(this : IMSMQMessage2*, plJournal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Journal.call(this, plJournal)
    end
    def put_Journal(this : IMSMQMessage2*, lJournal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Journal.call(this, lJournal)
    end
    def get_ResponseQueueInfo_v1(this : IMSMQMessage2*, ppqinfoResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseQueueInfo_v1.call(this, ppqinfoResponse)
    end
    def putref_ResponseQueueInfo_v1(this : IMSMQMessage2*, pqinfoResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseQueueInfo_v1.call(this, pqinfoResponse)
    end
    def get_AppSpecific(this : IMSMQMessage2*, plAppSpecific : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppSpecific.call(this, plAppSpecific)
    end
    def put_AppSpecific(this : IMSMQMessage2*, lAppSpecific : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AppSpecific.call(this, lAppSpecific)
    end
    def get_SourceMachineGuid(this : IMSMQMessage2*, pbstrGuidSrcMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SourceMachineGuid.call(this, pbstrGuidSrcMachine)
    end
    def get_BodyLength(this : IMSMQMessage2*, pcbBody : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BodyLength.call(this, pcbBody)
    end
    def get_Body(this : IMSMQMessage2*, pvarBody : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Body.call(this, pvarBody)
    end
    def put_Body(this : IMSMQMessage2*, varBody : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Body.call(this, varBody)
    end
    def get_AdminQueueInfo_v1(this : IMSMQMessage2*, ppqinfoAdmin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminQueueInfo_v1.call(this, ppqinfoAdmin)
    end
    def putref_AdminQueueInfo_v1(this : IMSMQMessage2*, pqinfoAdmin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AdminQueueInfo_v1.call(this, pqinfoAdmin)
    end
    def get_Id(this : IMSMQMessage2*, pvarMsgId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pvarMsgId)
    end
    def get_CorrelationId(this : IMSMQMessage2*, pvarMsgId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CorrelationId.call(this, pvarMsgId)
    end
    def put_CorrelationId(this : IMSMQMessage2*, varMsgId : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CorrelationId.call(this, varMsgId)
    end
    def get_Ack(this : IMSMQMessage2*, plAck : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ack.call(this, plAck)
    end
    def put_Ack(this : IMSMQMessage2*, lAck : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Ack.call(this, lAck)
    end
    def get_Label(this : IMSMQMessage2*, pbstrLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Label.call(this, pbstrLabel)
    end
    def put_Label(this : IMSMQMessage2*, bstrLabel : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Label.call(this, bstrLabel)
    end
    def get_MaxTimeToReachQueue(this : IMSMQMessage2*, plMaxTimeToReachQueue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxTimeToReachQueue.call(this, plMaxTimeToReachQueue)
    end
    def put_MaxTimeToReachQueue(this : IMSMQMessage2*, lMaxTimeToReachQueue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxTimeToReachQueue.call(this, lMaxTimeToReachQueue)
    end
    def get_MaxTimeToReceive(this : IMSMQMessage2*, plMaxTimeToReceive : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxTimeToReceive.call(this, plMaxTimeToReceive)
    end
    def put_MaxTimeToReceive(this : IMSMQMessage2*, lMaxTimeToReceive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxTimeToReceive.call(this, lMaxTimeToReceive)
    end
    def get_HashAlgorithm(this : IMSMQMessage2*, plHashAlg : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HashAlgorithm.call(this, plHashAlg)
    end
    def put_HashAlgorithm(this : IMSMQMessage2*, lHashAlg : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HashAlgorithm.call(this, lHashAlg)
    end
    def get_EncryptAlgorithm(this : IMSMQMessage2*, plEncryptAlg : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EncryptAlgorithm.call(this, plEncryptAlg)
    end
    def put_EncryptAlgorithm(this : IMSMQMessage2*, lEncryptAlg : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EncryptAlgorithm.call(this, lEncryptAlg)
    end
    def get_SentTime(this : IMSMQMessage2*, pvarSentTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SentTime.call(this, pvarSentTime)
    end
    def get_ArrivedTime(this : IMSMQMessage2*, plArrivedTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArrivedTime.call(this, plArrivedTime)
    end
    def get_DestinationQueueInfo(this : IMSMQMessage2*, ppqinfoDest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationQueueInfo.call(this, ppqinfoDest)
    end
    def get_SenderCertificate(this : IMSMQMessage2*, pvarSenderCert : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderCertificate.call(this, pvarSenderCert)
    end
    def put_SenderCertificate(this : IMSMQMessage2*, varSenderCert : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderCertificate.call(this, varSenderCert)
    end
    def get_SenderId(this : IMSMQMessage2*, pvarSenderId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderId.call(this, pvarSenderId)
    end
    def get_SenderIdType(this : IMSMQMessage2*, plSenderIdType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderIdType.call(this, plSenderIdType)
    end
    def put_SenderIdType(this : IMSMQMessage2*, lSenderIdType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderIdType.call(this, lSenderIdType)
    end
    def send(this : IMSMQMessage2*, destination_queue : Void*, transaction : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send.call(this, destination_queue, transaction)
    end
    def attach_current_security_context(this : IMSMQMessage2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_current_security_context.call(this)
    end
    def get_SenderVersion(this : IMSMQMessage2*, plSenderVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderVersion.call(this, plSenderVersion)
    end
    def get_Extension(this : IMSMQMessage2*, pvarExtension : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Extension.call(this, pvarExtension)
    end
    def put_Extension(this : IMSMQMessage2*, varExtension : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Extension.call(this, varExtension)
    end
    def get_ConnectorTypeGuid(this : IMSMQMessage2*, pbstrGuidConnectorType : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectorTypeGuid.call(this, pbstrGuidConnectorType)
    end
    def put_ConnectorTypeGuid(this : IMSMQMessage2*, bstrGuidConnectorType : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectorTypeGuid.call(this, bstrGuidConnectorType)
    end
    def get_TransactionStatusQueueInfo(this : IMSMQMessage2*, ppqinfoXactStatus : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionStatusQueueInfo.call(this, ppqinfoXactStatus)
    end
    def get_DestinationSymmetricKey(this : IMSMQMessage2*, pvarDestSymmKey : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationSymmetricKey.call(this, pvarDestSymmKey)
    end
    def put_DestinationSymmetricKey(this : IMSMQMessage2*, varDestSymmKey : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DestinationSymmetricKey.call(this, varDestSymmKey)
    end
    def get_Signature(this : IMSMQMessage2*, pvarSignature : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Signature.call(this, pvarSignature)
    end
    def put_Signature(this : IMSMQMessage2*, varSignature : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Signature.call(this, varSignature)
    end
    def get_AuthenticationProviderType(this : IMSMQMessage2*, plAuthProvType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthenticationProviderType.call(this, plAuthProvType)
    end
    def put_AuthenticationProviderType(this : IMSMQMessage2*, lAuthProvType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthenticationProviderType.call(this, lAuthProvType)
    end
    def get_AuthenticationProviderName(this : IMSMQMessage2*, pbstrAuthProvName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthenticationProviderName.call(this, pbstrAuthProvName)
    end
    def put_AuthenticationProviderName(this : IMSMQMessage2*, bstrAuthProvName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthenticationProviderName.call(this, bstrAuthProvName)
    end
    def put_SenderId(this : IMSMQMessage2*, varSenderId : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderId.call(this, varSenderId)
    end
    def get_MsgClass(this : IMSMQMessage2*, plMsgClass : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsgClass.call(this, plMsgClass)
    end
    def put_MsgClass(this : IMSMQMessage2*, lMsgClass : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MsgClass.call(this, lMsgClass)
    end
    def get_Properties(this : IMSMQMessage2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_TransactionId(this : IMSMQMessage2*, pvarXactId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionId.call(this, pvarXactId)
    end
    def get_IsFirstInTransaction(this : IMSMQMessage2*, pisFirstInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsFirstInTransaction.call(this, pisFirstInXact)
    end
    def get_IsLastInTransaction(this : IMSMQMessage2*, pisLastInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsLastInTransaction.call(this, pisLastInXact)
    end
    def get_ResponseQueueInfo(this : IMSMQMessage2*, ppqinfoResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseQueueInfo.call(this, ppqinfoResponse)
    end
    def putref_ResponseQueueInfo(this : IMSMQMessage2*, pqinfoResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseQueueInfo.call(this, pqinfoResponse)
    end
    def get_AdminQueueInfo(this : IMSMQMessage2*, ppqinfoAdmin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminQueueInfo.call(this, ppqinfoAdmin)
    end
    def putref_AdminQueueInfo(this : IMSMQMessage2*, pqinfoAdmin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AdminQueueInfo.call(this, pqinfoAdmin)
    end
    def get_ReceivedAuthenticationLevel(this : IMSMQMessage2*, psReceivedAuthenticationLevel : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceivedAuthenticationLevel.call(this, psReceivedAuthenticationLevel)
    end

  end

  @[Extern]
  record IMSMQMessage3Vtbl,
    query_interface : Proc(IMSMQMessage3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQMessage3*, UInt32),
    release : Proc(IMSMQMessage3*, UInt32),
    get_type_info_count : Proc(IMSMQMessage3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQMessage3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQMessage3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQMessage3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Class : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    get_PrivLevel : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrivLevel : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_AuthLevel : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_AuthLevel : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_IsAuthenticated : Proc(IMSMQMessage3*, Int16*, Win32cr::Foundation::HRESULT),
    get_Delivery : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Delivery : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_Trace : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Trace : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_Journal : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Journal : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_ResponseQueueInfo_v1 : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseQueueInfo_v1 : Proc(IMSMQMessage3*, Void*, Win32cr::Foundation::HRESULT),
    get_AppSpecific : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_AppSpecific : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_SourceMachineGuid : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_BodyLength : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    get_Body : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Body : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_AdminQueueInfo_v1 : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    putref_AdminQueueInfo_v1 : Proc(IMSMQMessage3*, Void*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CorrelationId : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_CorrelationId : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Ack : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Ack : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_Label : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Label : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MaxTimeToReachQueue : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxTimeToReachQueue : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxTimeToReceive : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxTimeToReceive : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_HashAlgorithm : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_HashAlgorithm : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_EncryptAlgorithm : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_EncryptAlgorithm : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_SentTime : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ArrivedTime : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DestinationQueueInfo : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    get_SenderCertificate : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SenderCertificate : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SenderId : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_SenderIdType : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_SenderIdType : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    send : Proc(IMSMQMessage3*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    attach_current_security_context : Proc(IMSMQMessage3*, Win32cr::Foundation::HRESULT),
    get_SenderVersion : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    get_Extension : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Extension : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ConnectorTypeGuid : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ConnectorTypeGuid : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TransactionStatusQueueInfo : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    get_DestinationSymmetricKey : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_DestinationSymmetricKey : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Signature : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Signature : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_AuthenticationProviderType : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_AuthenticationProviderType : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_AuthenticationProviderName : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_AuthenticationProviderName : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_SenderId : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MsgClass : Proc(IMSMQMessage3*, Int32*, Win32cr::Foundation::HRESULT),
    put_MsgClass : Proc(IMSMQMessage3*, Int32, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    get_TransactionId : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_IsFirstInTransaction : Proc(IMSMQMessage3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsLastInTransaction : Proc(IMSMQMessage3*, Int16*, Win32cr::Foundation::HRESULT),
    get_ResponseQueueInfo_v2 : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseQueueInfo_v2 : Proc(IMSMQMessage3*, Void*, Win32cr::Foundation::HRESULT),
    get_AdminQueueInfo_v2 : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    putref_AdminQueueInfo_v2 : Proc(IMSMQMessage3*, Void*, Win32cr::Foundation::HRESULT),
    get_ReceivedAuthenticationLevel : Proc(IMSMQMessage3*, Int16*, Win32cr::Foundation::HRESULT),
    get_ResponseQueueInfo : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseQueueInfo : Proc(IMSMQMessage3*, Void*, Win32cr::Foundation::HRESULT),
    get_AdminQueueInfo : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    putref_AdminQueueInfo : Proc(IMSMQMessage3*, Void*, Win32cr::Foundation::HRESULT),
    get_ResponseDestination : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseDestination : Proc(IMSMQMessage3*, Void*, Win32cr::Foundation::HRESULT),
    get_Destination : Proc(IMSMQMessage3*, Void**, Win32cr::Foundation::HRESULT),
    get_LookupId : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_IsAuthenticated2 : Proc(IMSMQMessage3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsFirstInTransaction2 : Proc(IMSMQMessage3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsLastInTransaction2 : Proc(IMSMQMessage3*, Int16*, Win32cr::Foundation::HRESULT),
    attach_current_security_context2 : Proc(IMSMQMessage3*, Win32cr::Foundation::HRESULT),
    get_SoapEnvelope : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CompoundMessage : Proc(IMSMQMessage3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SoapHeader : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_SoapBody : Proc(IMSMQMessage3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQMessage3, lpVtbl : IMSMQMessage3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b1a_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQMessage3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQMessage3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQMessage3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQMessage3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQMessage3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQMessage3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQMessage3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Class(this : IMSMQMessage3*, plClass : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Class.call(this, plClass)
    end
    def get_PrivLevel(this : IMSMQMessage3*, plPrivLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivLevel.call(this, plPrivLevel)
    end
    def put_PrivLevel(this : IMSMQMessage3*, lPrivLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivLevel.call(this, lPrivLevel)
    end
    def get_AuthLevel(this : IMSMQMessage3*, plAuthLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthLevel.call(this, plAuthLevel)
    end
    def put_AuthLevel(this : IMSMQMessage3*, lAuthLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthLevel.call(this, lAuthLevel)
    end
    def get_IsAuthenticated(this : IMSMQMessage3*, pisAuthenticated : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsAuthenticated.call(this, pisAuthenticated)
    end
    def get_Delivery(this : IMSMQMessage3*, plDelivery : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Delivery.call(this, plDelivery)
    end
    def put_Delivery(this : IMSMQMessage3*, lDelivery : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Delivery.call(this, lDelivery)
    end
    def get_Trace(this : IMSMQMessage3*, plTrace : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Trace.call(this, plTrace)
    end
    def put_Trace(this : IMSMQMessage3*, lTrace : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Trace.call(this, lTrace)
    end
    def get_Priority(this : IMSMQMessage3*, plPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, plPriority)
    end
    def put_Priority(this : IMSMQMessage3*, lPriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, lPriority)
    end
    def get_Journal(this : IMSMQMessage3*, plJournal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Journal.call(this, plJournal)
    end
    def put_Journal(this : IMSMQMessage3*, lJournal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Journal.call(this, lJournal)
    end
    def get_ResponseQueueInfo_v1(this : IMSMQMessage3*, ppqinfoResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseQueueInfo_v1.call(this, ppqinfoResponse)
    end
    def putref_ResponseQueueInfo_v1(this : IMSMQMessage3*, pqinfoResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseQueueInfo_v1.call(this, pqinfoResponse)
    end
    def get_AppSpecific(this : IMSMQMessage3*, plAppSpecific : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppSpecific.call(this, plAppSpecific)
    end
    def put_AppSpecific(this : IMSMQMessage3*, lAppSpecific : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AppSpecific.call(this, lAppSpecific)
    end
    def get_SourceMachineGuid(this : IMSMQMessage3*, pbstrGuidSrcMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SourceMachineGuid.call(this, pbstrGuidSrcMachine)
    end
    def get_BodyLength(this : IMSMQMessage3*, pcbBody : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BodyLength.call(this, pcbBody)
    end
    def get_Body(this : IMSMQMessage3*, pvarBody : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Body.call(this, pvarBody)
    end
    def put_Body(this : IMSMQMessage3*, varBody : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Body.call(this, varBody)
    end
    def get_AdminQueueInfo_v1(this : IMSMQMessage3*, ppqinfoAdmin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminQueueInfo_v1.call(this, ppqinfoAdmin)
    end
    def putref_AdminQueueInfo_v1(this : IMSMQMessage3*, pqinfoAdmin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AdminQueueInfo_v1.call(this, pqinfoAdmin)
    end
    def get_Id(this : IMSMQMessage3*, pvarMsgId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pvarMsgId)
    end
    def get_CorrelationId(this : IMSMQMessage3*, pvarMsgId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CorrelationId.call(this, pvarMsgId)
    end
    def put_CorrelationId(this : IMSMQMessage3*, varMsgId : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CorrelationId.call(this, varMsgId)
    end
    def get_Ack(this : IMSMQMessage3*, plAck : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ack.call(this, plAck)
    end
    def put_Ack(this : IMSMQMessage3*, lAck : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Ack.call(this, lAck)
    end
    def get_Label(this : IMSMQMessage3*, pbstrLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Label.call(this, pbstrLabel)
    end
    def put_Label(this : IMSMQMessage3*, bstrLabel : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Label.call(this, bstrLabel)
    end
    def get_MaxTimeToReachQueue(this : IMSMQMessage3*, plMaxTimeToReachQueue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxTimeToReachQueue.call(this, plMaxTimeToReachQueue)
    end
    def put_MaxTimeToReachQueue(this : IMSMQMessage3*, lMaxTimeToReachQueue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxTimeToReachQueue.call(this, lMaxTimeToReachQueue)
    end
    def get_MaxTimeToReceive(this : IMSMQMessage3*, plMaxTimeToReceive : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxTimeToReceive.call(this, plMaxTimeToReceive)
    end
    def put_MaxTimeToReceive(this : IMSMQMessage3*, lMaxTimeToReceive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxTimeToReceive.call(this, lMaxTimeToReceive)
    end
    def get_HashAlgorithm(this : IMSMQMessage3*, plHashAlg : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HashAlgorithm.call(this, plHashAlg)
    end
    def put_HashAlgorithm(this : IMSMQMessage3*, lHashAlg : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HashAlgorithm.call(this, lHashAlg)
    end
    def get_EncryptAlgorithm(this : IMSMQMessage3*, plEncryptAlg : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EncryptAlgorithm.call(this, plEncryptAlg)
    end
    def put_EncryptAlgorithm(this : IMSMQMessage3*, lEncryptAlg : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EncryptAlgorithm.call(this, lEncryptAlg)
    end
    def get_SentTime(this : IMSMQMessage3*, pvarSentTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SentTime.call(this, pvarSentTime)
    end
    def get_ArrivedTime(this : IMSMQMessage3*, plArrivedTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArrivedTime.call(this, plArrivedTime)
    end
    def get_DestinationQueueInfo(this : IMSMQMessage3*, ppqinfoDest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationQueueInfo.call(this, ppqinfoDest)
    end
    def get_SenderCertificate(this : IMSMQMessage3*, pvarSenderCert : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderCertificate.call(this, pvarSenderCert)
    end
    def put_SenderCertificate(this : IMSMQMessage3*, varSenderCert : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderCertificate.call(this, varSenderCert)
    end
    def get_SenderId(this : IMSMQMessage3*, pvarSenderId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderId.call(this, pvarSenderId)
    end
    def get_SenderIdType(this : IMSMQMessage3*, plSenderIdType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderIdType.call(this, plSenderIdType)
    end
    def put_SenderIdType(this : IMSMQMessage3*, lSenderIdType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderIdType.call(this, lSenderIdType)
    end
    def send(this : IMSMQMessage3*, destination_queue : Void*, transaction : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send.call(this, destination_queue, transaction)
    end
    def attach_current_security_context(this : IMSMQMessage3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_current_security_context.call(this)
    end
    def get_SenderVersion(this : IMSMQMessage3*, plSenderVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderVersion.call(this, plSenderVersion)
    end
    def get_Extension(this : IMSMQMessage3*, pvarExtension : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Extension.call(this, pvarExtension)
    end
    def put_Extension(this : IMSMQMessage3*, varExtension : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Extension.call(this, varExtension)
    end
    def get_ConnectorTypeGuid(this : IMSMQMessage3*, pbstrGuidConnectorType : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectorTypeGuid.call(this, pbstrGuidConnectorType)
    end
    def put_ConnectorTypeGuid(this : IMSMQMessage3*, bstrGuidConnectorType : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectorTypeGuid.call(this, bstrGuidConnectorType)
    end
    def get_TransactionStatusQueueInfo(this : IMSMQMessage3*, ppqinfoXactStatus : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionStatusQueueInfo.call(this, ppqinfoXactStatus)
    end
    def get_DestinationSymmetricKey(this : IMSMQMessage3*, pvarDestSymmKey : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationSymmetricKey.call(this, pvarDestSymmKey)
    end
    def put_DestinationSymmetricKey(this : IMSMQMessage3*, varDestSymmKey : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DestinationSymmetricKey.call(this, varDestSymmKey)
    end
    def get_Signature(this : IMSMQMessage3*, pvarSignature : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Signature.call(this, pvarSignature)
    end
    def put_Signature(this : IMSMQMessage3*, varSignature : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Signature.call(this, varSignature)
    end
    def get_AuthenticationProviderType(this : IMSMQMessage3*, plAuthProvType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthenticationProviderType.call(this, plAuthProvType)
    end
    def put_AuthenticationProviderType(this : IMSMQMessage3*, lAuthProvType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthenticationProviderType.call(this, lAuthProvType)
    end
    def get_AuthenticationProviderName(this : IMSMQMessage3*, pbstrAuthProvName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthenticationProviderName.call(this, pbstrAuthProvName)
    end
    def put_AuthenticationProviderName(this : IMSMQMessage3*, bstrAuthProvName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthenticationProviderName.call(this, bstrAuthProvName)
    end
    def put_SenderId(this : IMSMQMessage3*, varSenderId : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderId.call(this, varSenderId)
    end
    def get_MsgClass(this : IMSMQMessage3*, plMsgClass : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsgClass.call(this, plMsgClass)
    end
    def put_MsgClass(this : IMSMQMessage3*, lMsgClass : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MsgClass.call(this, lMsgClass)
    end
    def get_Properties(this : IMSMQMessage3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_TransactionId(this : IMSMQMessage3*, pvarXactId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionId.call(this, pvarXactId)
    end
    def get_IsFirstInTransaction(this : IMSMQMessage3*, pisFirstInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsFirstInTransaction.call(this, pisFirstInXact)
    end
    def get_IsLastInTransaction(this : IMSMQMessage3*, pisLastInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsLastInTransaction.call(this, pisLastInXact)
    end
    def get_ResponseQueueInfo_v2(this : IMSMQMessage3*, ppqinfoResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseQueueInfo_v2.call(this, ppqinfoResponse)
    end
    def putref_ResponseQueueInfo_v2(this : IMSMQMessage3*, pqinfoResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseQueueInfo_v2.call(this, pqinfoResponse)
    end
    def get_AdminQueueInfo_v2(this : IMSMQMessage3*, ppqinfoAdmin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminQueueInfo_v2.call(this, ppqinfoAdmin)
    end
    def putref_AdminQueueInfo_v2(this : IMSMQMessage3*, pqinfoAdmin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AdminQueueInfo_v2.call(this, pqinfoAdmin)
    end
    def get_ReceivedAuthenticationLevel(this : IMSMQMessage3*, psReceivedAuthenticationLevel : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceivedAuthenticationLevel.call(this, psReceivedAuthenticationLevel)
    end
    def get_ResponseQueueInfo(this : IMSMQMessage3*, ppqinfoResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseQueueInfo.call(this, ppqinfoResponse)
    end
    def putref_ResponseQueueInfo(this : IMSMQMessage3*, pqinfoResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseQueueInfo.call(this, pqinfoResponse)
    end
    def get_AdminQueueInfo(this : IMSMQMessage3*, ppqinfoAdmin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminQueueInfo.call(this, ppqinfoAdmin)
    end
    def putref_AdminQueueInfo(this : IMSMQMessage3*, pqinfoAdmin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AdminQueueInfo.call(this, pqinfoAdmin)
    end
    def get_ResponseDestination(this : IMSMQMessage3*, ppdestResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseDestination.call(this, ppdestResponse)
    end
    def putref_ResponseDestination(this : IMSMQMessage3*, pdestResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseDestination.call(this, pdestResponse)
    end
    def get_Destination(this : IMSMQMessage3*, ppdestDestination : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Destination.call(this, ppdestDestination)
    end
    def get_LookupId(this : IMSMQMessage3*, pvarLookupId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LookupId.call(this, pvarLookupId)
    end
    def get_IsAuthenticated2(this : IMSMQMessage3*, pisAuthenticated : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsAuthenticated2.call(this, pisAuthenticated)
    end
    def get_IsFirstInTransaction2(this : IMSMQMessage3*, pisFirstInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsFirstInTransaction2.call(this, pisFirstInXact)
    end
    def get_IsLastInTransaction2(this : IMSMQMessage3*, pisLastInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsLastInTransaction2.call(this, pisLastInXact)
    end
    def attach_current_security_context2(this : IMSMQMessage3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_current_security_context2.call(this)
    end
    def get_SoapEnvelope(this : IMSMQMessage3*, pbstrSoapEnvelope : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SoapEnvelope.call(this, pbstrSoapEnvelope)
    end
    def get_CompoundMessage(this : IMSMQMessage3*, pvarCompoundMessage : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CompoundMessage.call(this, pvarCompoundMessage)
    end
    def put_SoapHeader(this : IMSMQMessage3*, bstrSoapHeader : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SoapHeader.call(this, bstrSoapHeader)
    end
    def put_SoapBody(this : IMSMQMessage3*, bstrSoapBody : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SoapBody.call(this, bstrSoapBody)
    end

  end

  @[Extern]
  record IMSMQMessage4Vtbl,
    query_interface : Proc(IMSMQMessage4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQMessage4*, UInt32),
    release : Proc(IMSMQMessage4*, UInt32),
    get_type_info_count : Proc(IMSMQMessage4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQMessage4*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQMessage4*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQMessage4*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Class : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    get_PrivLevel : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrivLevel : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_AuthLevel : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_AuthLevel : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_IsAuthenticated : Proc(IMSMQMessage4*, Int16*, Win32cr::Foundation::HRESULT),
    get_Delivery : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_Delivery : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_Trace : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_Trace : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_Journal : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_Journal : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_ResponseQueueInfo_v1 : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseQueueInfo_v1 : Proc(IMSMQMessage4*, Void*, Win32cr::Foundation::HRESULT),
    get_AppSpecific : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_AppSpecific : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_SourceMachineGuid : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_BodyLength : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    get_Body : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Body : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_AdminQueueInfo_v1 : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    putref_AdminQueueInfo_v1 : Proc(IMSMQMessage4*, Void*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CorrelationId : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_CorrelationId : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Ack : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_Ack : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_Label : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Label : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MaxTimeToReachQueue : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxTimeToReachQueue : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_MaxTimeToReceive : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_MaxTimeToReceive : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_HashAlgorithm : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_HashAlgorithm : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_EncryptAlgorithm : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_EncryptAlgorithm : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_SentTime : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ArrivedTime : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DestinationQueueInfo : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    get_SenderCertificate : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SenderCertificate : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_SenderId : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_SenderIdType : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_SenderIdType : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    send : Proc(IMSMQMessage4*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    attach_current_security_context : Proc(IMSMQMessage4*, Win32cr::Foundation::HRESULT),
    get_SenderVersion : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    get_Extension : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Extension : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ConnectorTypeGuid : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ConnectorTypeGuid : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TransactionStatusQueueInfo : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    get_DestinationSymmetricKey : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_DestinationSymmetricKey : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Signature : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Signature : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_AuthenticationProviderType : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_AuthenticationProviderType : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_AuthenticationProviderName : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_AuthenticationProviderName : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_SenderId : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_MsgClass : Proc(IMSMQMessage4*, Int32*, Win32cr::Foundation::HRESULT),
    put_MsgClass : Proc(IMSMQMessage4*, Int32, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    get_TransactionId : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_IsFirstInTransaction : Proc(IMSMQMessage4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsLastInTransaction : Proc(IMSMQMessage4*, Int16*, Win32cr::Foundation::HRESULT),
    get_ResponseQueueInfo_v2 : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseQueueInfo_v2 : Proc(IMSMQMessage4*, Void*, Win32cr::Foundation::HRESULT),
    get_AdminQueueInfo_v2 : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    putref_AdminQueueInfo_v2 : Proc(IMSMQMessage4*, Void*, Win32cr::Foundation::HRESULT),
    get_ReceivedAuthenticationLevel : Proc(IMSMQMessage4*, Int16*, Win32cr::Foundation::HRESULT),
    get_ResponseQueueInfo : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseQueueInfo : Proc(IMSMQMessage4*, Void*, Win32cr::Foundation::HRESULT),
    get_AdminQueueInfo : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    putref_AdminQueueInfo : Proc(IMSMQMessage4*, Void*, Win32cr::Foundation::HRESULT),
    get_ResponseDestination : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    putref_ResponseDestination : Proc(IMSMQMessage4*, Void*, Win32cr::Foundation::HRESULT),
    get_Destination : Proc(IMSMQMessage4*, Void**, Win32cr::Foundation::HRESULT),
    get_LookupId : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_IsAuthenticated2 : Proc(IMSMQMessage4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsFirstInTransaction2 : Proc(IMSMQMessage4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsLastInTransaction2 : Proc(IMSMQMessage4*, Int16*, Win32cr::Foundation::HRESULT),
    attach_current_security_context2 : Proc(IMSMQMessage4*, Win32cr::Foundation::HRESULT),
    get_SoapEnvelope : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CompoundMessage : Proc(IMSMQMessage4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SoapHeader : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_SoapBody : Proc(IMSMQMessage4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQMessage4, lpVtbl : IMSMQMessage4Vtbl* do
    GUID = LibC::GUID.new(0xeba96b23_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQMessage4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQMessage4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQMessage4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQMessage4*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQMessage4*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQMessage4*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQMessage4*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Class(this : IMSMQMessage4*, plClass : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Class.call(this, plClass)
    end
    def get_PrivLevel(this : IMSMQMessage4*, plPrivLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivLevel.call(this, plPrivLevel)
    end
    def put_PrivLevel(this : IMSMQMessage4*, lPrivLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrivLevel.call(this, lPrivLevel)
    end
    def get_AuthLevel(this : IMSMQMessage4*, plAuthLevel : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthLevel.call(this, plAuthLevel)
    end
    def put_AuthLevel(this : IMSMQMessage4*, lAuthLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthLevel.call(this, lAuthLevel)
    end
    def get_IsAuthenticated(this : IMSMQMessage4*, pisAuthenticated : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsAuthenticated.call(this, pisAuthenticated)
    end
    def get_Delivery(this : IMSMQMessage4*, plDelivery : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Delivery.call(this, plDelivery)
    end
    def put_Delivery(this : IMSMQMessage4*, lDelivery : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Delivery.call(this, lDelivery)
    end
    def get_Trace(this : IMSMQMessage4*, plTrace : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Trace.call(this, plTrace)
    end
    def put_Trace(this : IMSMQMessage4*, lTrace : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Trace.call(this, lTrace)
    end
    def get_Priority(this : IMSMQMessage4*, plPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, plPriority)
    end
    def put_Priority(this : IMSMQMessage4*, lPriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, lPriority)
    end
    def get_Journal(this : IMSMQMessage4*, plJournal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Journal.call(this, plJournal)
    end
    def put_Journal(this : IMSMQMessage4*, lJournal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Journal.call(this, lJournal)
    end
    def get_ResponseQueueInfo_v1(this : IMSMQMessage4*, ppqinfoResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseQueueInfo_v1.call(this, ppqinfoResponse)
    end
    def putref_ResponseQueueInfo_v1(this : IMSMQMessage4*, pqinfoResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseQueueInfo_v1.call(this, pqinfoResponse)
    end
    def get_AppSpecific(this : IMSMQMessage4*, plAppSpecific : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppSpecific.call(this, plAppSpecific)
    end
    def put_AppSpecific(this : IMSMQMessage4*, lAppSpecific : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AppSpecific.call(this, lAppSpecific)
    end
    def get_SourceMachineGuid(this : IMSMQMessage4*, pbstrGuidSrcMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SourceMachineGuid.call(this, pbstrGuidSrcMachine)
    end
    def get_BodyLength(this : IMSMQMessage4*, pcbBody : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BodyLength.call(this, pcbBody)
    end
    def get_Body(this : IMSMQMessage4*, pvarBody : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Body.call(this, pvarBody)
    end
    def put_Body(this : IMSMQMessage4*, varBody : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Body.call(this, varBody)
    end
    def get_AdminQueueInfo_v1(this : IMSMQMessage4*, ppqinfoAdmin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminQueueInfo_v1.call(this, ppqinfoAdmin)
    end
    def putref_AdminQueueInfo_v1(this : IMSMQMessage4*, pqinfoAdmin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AdminQueueInfo_v1.call(this, pqinfoAdmin)
    end
    def get_Id(this : IMSMQMessage4*, pvarMsgId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pvarMsgId)
    end
    def get_CorrelationId(this : IMSMQMessage4*, pvarMsgId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CorrelationId.call(this, pvarMsgId)
    end
    def put_CorrelationId(this : IMSMQMessage4*, varMsgId : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CorrelationId.call(this, varMsgId)
    end
    def get_Ack(this : IMSMQMessage4*, plAck : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Ack.call(this, plAck)
    end
    def put_Ack(this : IMSMQMessage4*, lAck : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Ack.call(this, lAck)
    end
    def get_Label(this : IMSMQMessage4*, pbstrLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Label.call(this, pbstrLabel)
    end
    def put_Label(this : IMSMQMessage4*, bstrLabel : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Label.call(this, bstrLabel)
    end
    def get_MaxTimeToReachQueue(this : IMSMQMessage4*, plMaxTimeToReachQueue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxTimeToReachQueue.call(this, plMaxTimeToReachQueue)
    end
    def put_MaxTimeToReachQueue(this : IMSMQMessage4*, lMaxTimeToReachQueue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxTimeToReachQueue.call(this, lMaxTimeToReachQueue)
    end
    def get_MaxTimeToReceive(this : IMSMQMessage4*, plMaxTimeToReceive : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxTimeToReceive.call(this, plMaxTimeToReceive)
    end
    def put_MaxTimeToReceive(this : IMSMQMessage4*, lMaxTimeToReceive : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxTimeToReceive.call(this, lMaxTimeToReceive)
    end
    def get_HashAlgorithm(this : IMSMQMessage4*, plHashAlg : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HashAlgorithm.call(this, plHashAlg)
    end
    def put_HashAlgorithm(this : IMSMQMessage4*, lHashAlg : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HashAlgorithm.call(this, lHashAlg)
    end
    def get_EncryptAlgorithm(this : IMSMQMessage4*, plEncryptAlg : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EncryptAlgorithm.call(this, plEncryptAlg)
    end
    def put_EncryptAlgorithm(this : IMSMQMessage4*, lEncryptAlg : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EncryptAlgorithm.call(this, lEncryptAlg)
    end
    def get_SentTime(this : IMSMQMessage4*, pvarSentTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SentTime.call(this, pvarSentTime)
    end
    def get_ArrivedTime(this : IMSMQMessage4*, plArrivedTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArrivedTime.call(this, plArrivedTime)
    end
    def get_DestinationQueueInfo(this : IMSMQMessage4*, ppqinfoDest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationQueueInfo.call(this, ppqinfoDest)
    end
    def get_SenderCertificate(this : IMSMQMessage4*, pvarSenderCert : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderCertificate.call(this, pvarSenderCert)
    end
    def put_SenderCertificate(this : IMSMQMessage4*, varSenderCert : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderCertificate.call(this, varSenderCert)
    end
    def get_SenderId(this : IMSMQMessage4*, pvarSenderId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderId.call(this, pvarSenderId)
    end
    def get_SenderIdType(this : IMSMQMessage4*, plSenderIdType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderIdType.call(this, plSenderIdType)
    end
    def put_SenderIdType(this : IMSMQMessage4*, lSenderIdType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderIdType.call(this, lSenderIdType)
    end
    def send(this : IMSMQMessage4*, destination_queue : Void*, transaction : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send.call(this, destination_queue, transaction)
    end
    def attach_current_security_context(this : IMSMQMessage4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_current_security_context.call(this)
    end
    def get_SenderVersion(this : IMSMQMessage4*, plSenderVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderVersion.call(this, plSenderVersion)
    end
    def get_Extension(this : IMSMQMessage4*, pvarExtension : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Extension.call(this, pvarExtension)
    end
    def put_Extension(this : IMSMQMessage4*, varExtension : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Extension.call(this, varExtension)
    end
    def get_ConnectorTypeGuid(this : IMSMQMessage4*, pbstrGuidConnectorType : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectorTypeGuid.call(this, pbstrGuidConnectorType)
    end
    def put_ConnectorTypeGuid(this : IMSMQMessage4*, bstrGuidConnectorType : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectorTypeGuid.call(this, bstrGuidConnectorType)
    end
    def get_TransactionStatusQueueInfo(this : IMSMQMessage4*, ppqinfoXactStatus : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionStatusQueueInfo.call(this, ppqinfoXactStatus)
    end
    def get_DestinationSymmetricKey(this : IMSMQMessage4*, pvarDestSymmKey : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationSymmetricKey.call(this, pvarDestSymmKey)
    end
    def put_DestinationSymmetricKey(this : IMSMQMessage4*, varDestSymmKey : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DestinationSymmetricKey.call(this, varDestSymmKey)
    end
    def get_Signature(this : IMSMQMessage4*, pvarSignature : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Signature.call(this, pvarSignature)
    end
    def put_Signature(this : IMSMQMessage4*, varSignature : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Signature.call(this, varSignature)
    end
    def get_AuthenticationProviderType(this : IMSMQMessage4*, plAuthProvType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthenticationProviderType.call(this, plAuthProvType)
    end
    def put_AuthenticationProviderType(this : IMSMQMessage4*, lAuthProvType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthenticationProviderType.call(this, lAuthProvType)
    end
    def get_AuthenticationProviderName(this : IMSMQMessage4*, pbstrAuthProvName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthenticationProviderName.call(this, pbstrAuthProvName)
    end
    def put_AuthenticationProviderName(this : IMSMQMessage4*, bstrAuthProvName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthenticationProviderName.call(this, bstrAuthProvName)
    end
    def put_SenderId(this : IMSMQMessage4*, varSenderId : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderId.call(this, varSenderId)
    end
    def get_MsgClass(this : IMSMQMessage4*, plMsgClass : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsgClass.call(this, plMsgClass)
    end
    def put_MsgClass(this : IMSMQMessage4*, lMsgClass : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MsgClass.call(this, lMsgClass)
    end
    def get_Properties(this : IMSMQMessage4*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_TransactionId(this : IMSMQMessage4*, pvarXactId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionId.call(this, pvarXactId)
    end
    def get_IsFirstInTransaction(this : IMSMQMessage4*, pisFirstInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsFirstInTransaction.call(this, pisFirstInXact)
    end
    def get_IsLastInTransaction(this : IMSMQMessage4*, pisLastInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsLastInTransaction.call(this, pisLastInXact)
    end
    def get_ResponseQueueInfo_v2(this : IMSMQMessage4*, ppqinfoResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseQueueInfo_v2.call(this, ppqinfoResponse)
    end
    def putref_ResponseQueueInfo_v2(this : IMSMQMessage4*, pqinfoResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseQueueInfo_v2.call(this, pqinfoResponse)
    end
    def get_AdminQueueInfo_v2(this : IMSMQMessage4*, ppqinfoAdmin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminQueueInfo_v2.call(this, ppqinfoAdmin)
    end
    def putref_AdminQueueInfo_v2(this : IMSMQMessage4*, pqinfoAdmin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AdminQueueInfo_v2.call(this, pqinfoAdmin)
    end
    def get_ReceivedAuthenticationLevel(this : IMSMQMessage4*, psReceivedAuthenticationLevel : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceivedAuthenticationLevel.call(this, psReceivedAuthenticationLevel)
    end
    def get_ResponseQueueInfo(this : IMSMQMessage4*, ppqinfoResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseQueueInfo.call(this, ppqinfoResponse)
    end
    def putref_ResponseQueueInfo(this : IMSMQMessage4*, pqinfoResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseQueueInfo.call(this, pqinfoResponse)
    end
    def get_AdminQueueInfo(this : IMSMQMessage4*, ppqinfoAdmin : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminQueueInfo.call(this, ppqinfoAdmin)
    end
    def putref_AdminQueueInfo(this : IMSMQMessage4*, pqinfoAdmin : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_AdminQueueInfo.call(this, pqinfoAdmin)
    end
    def get_ResponseDestination(this : IMSMQMessage4*, ppdestResponse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResponseDestination.call(this, ppdestResponse)
    end
    def putref_ResponseDestination(this : IMSMQMessage4*, pdestResponse : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_ResponseDestination.call(this, pdestResponse)
    end
    def get_Destination(this : IMSMQMessage4*, ppdestDestination : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Destination.call(this, ppdestDestination)
    end
    def get_LookupId(this : IMSMQMessage4*, pvarLookupId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LookupId.call(this, pvarLookupId)
    end
    def get_IsAuthenticated2(this : IMSMQMessage4*, pisAuthenticated : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsAuthenticated2.call(this, pisAuthenticated)
    end
    def get_IsFirstInTransaction2(this : IMSMQMessage4*, pisFirstInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsFirstInTransaction2.call(this, pisFirstInXact)
    end
    def get_IsLastInTransaction2(this : IMSMQMessage4*, pisLastInXact : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsLastInTransaction2.call(this, pisLastInXact)
    end
    def attach_current_security_context2(this : IMSMQMessage4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_current_security_context2.call(this)
    end
    def get_SoapEnvelope(this : IMSMQMessage4*, pbstrSoapEnvelope : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SoapEnvelope.call(this, pbstrSoapEnvelope)
    end
    def get_CompoundMessage(this : IMSMQMessage4*, pvarCompoundMessage : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CompoundMessage.call(this, pvarCompoundMessage)
    end
    def put_SoapHeader(this : IMSMQMessage4*, bstrSoapHeader : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SoapHeader.call(this, bstrSoapHeader)
    end
    def put_SoapBody(this : IMSMQMessage4*, bstrSoapBody : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SoapBody.call(this, bstrSoapBody)
    end

  end

  @[Extern]
  record IMSMQPrivateEventVtbl,
    query_interface : Proc(IMSMQPrivateEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQPrivateEvent*, UInt32),
    release : Proc(IMSMQPrivateEvent*, UInt32),
    get_type_info_count : Proc(IMSMQPrivateEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQPrivateEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQPrivateEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQPrivateEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Hwnd : Proc(IMSMQPrivateEvent*, Int32*, Win32cr::Foundation::HRESULT),
    fire_arrived_event : Proc(IMSMQPrivateEvent*, Void*, Int32, Win32cr::Foundation::HRESULT),
    fire_arrived_error_event : Proc(IMSMQPrivateEvent*, Void*, Win32cr::Foundation::HRESULT, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQPrivateEvent, lpVtbl : IMSMQPrivateEventVtbl* do
    GUID = LibC::GUID.new(0xd7ab3341_u32, 0xc9d3_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0x47_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xc5_u8, 0xa2_u8, 0xc0_u8])
    def query_interface(this : IMSMQPrivateEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQPrivateEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQPrivateEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQPrivateEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQPrivateEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQPrivateEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQPrivateEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Hwnd(this : IMSMQPrivateEvent*, phwnd : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Hwnd.call(this, phwnd)
    end
    def fire_arrived_event(this : IMSMQPrivateEvent*, pq : Void*, msgcursor : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_arrived_event.call(this, pq, msgcursor)
    end
    def fire_arrived_error_event(this : IMSMQPrivateEvent*, pq : Void*, hrStatus : Win32cr::Foundation::HRESULT, msgcursor : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_arrived_error_event.call(this, pq, hrStatus, msgcursor)
    end

  end

  @[Extern]
  record DMSMQEventEvents_Vtbl,
    query_interface : Proc(DMSMQEventEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(DMSMQEventEvents_*, UInt32),
    release : Proc(DMSMQEventEvents_*, UInt32),
    get_type_info_count : Proc(DMSMQEventEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(DMSMQEventEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(DMSMQEventEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(DMSMQEventEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record DMSMQEventEvents_, lpVtbl : DMSMQEventEvents_Vtbl* do
    GUID = LibC::GUID.new(0xd7d6e078_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : DMSMQEventEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : DMSMQEventEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : DMSMQEventEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : DMSMQEventEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : DMSMQEventEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : DMSMQEventEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : DMSMQEventEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IMSMQTransaction2Vtbl,
    query_interface : Proc(IMSMQTransaction2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQTransaction2*, UInt32),
    release : Proc(IMSMQTransaction2*, UInt32),
    get_type_info_count : Proc(IMSMQTransaction2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQTransaction2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQTransaction2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQTransaction2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Transaction : Proc(IMSMQTransaction2*, Int32*, Win32cr::Foundation::HRESULT),
    commit : Proc(IMSMQTransaction2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    abort : Proc(IMSMQTransaction2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    init_new : Proc(IMSMQTransaction2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQTransaction2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQTransaction2, lpVtbl : IMSMQTransaction2Vtbl* do
    GUID = LibC::GUID.new(0x2ce0c5b0_u32, 0x6e67_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xe6_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQTransaction2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQTransaction2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQTransaction2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQTransaction2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQTransaction2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQTransaction2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQTransaction2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Transaction(this : IMSMQTransaction2*, plTransaction : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Transaction.call(this, plTransaction)
    end
    def commit(this : IMSMQTransaction2*, fRetaining : Win32cr::System::Com::VARIANT*, grfTC : Win32cr::System::Com::VARIANT*, grfRM : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, fRetaining, grfTC, grfRM)
    end
    def abort(this : IMSMQTransaction2*, fRetaining : Win32cr::System::Com::VARIANT*, fAsync : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this, fRetaining, fAsync)
    end
    def init_new(this : IMSMQTransaction2*, varTransaction : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_new.call(this, varTransaction)
    end
    def get_Properties(this : IMSMQTransaction2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQTransaction3Vtbl,
    query_interface : Proc(IMSMQTransaction3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQTransaction3*, UInt32),
    release : Proc(IMSMQTransaction3*, UInt32),
    get_type_info_count : Proc(IMSMQTransaction3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQTransaction3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQTransaction3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQTransaction3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Transaction : Proc(IMSMQTransaction3*, Int32*, Win32cr::Foundation::HRESULT),
    commit : Proc(IMSMQTransaction3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    abort : Proc(IMSMQTransaction3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    init_new : Proc(IMSMQTransaction3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQTransaction3*, Void**, Win32cr::Foundation::HRESULT),
    get_ITransaction : Proc(IMSMQTransaction3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQTransaction3, lpVtbl : IMSMQTransaction3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b13_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQTransaction3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQTransaction3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQTransaction3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQTransaction3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQTransaction3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQTransaction3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQTransaction3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Transaction(this : IMSMQTransaction3*, plTransaction : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Transaction.call(this, plTransaction)
    end
    def commit(this : IMSMQTransaction3*, fRetaining : Win32cr::System::Com::VARIANT*, grfTC : Win32cr::System::Com::VARIANT*, grfRM : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, fRetaining, grfTC, grfRM)
    end
    def abort(this : IMSMQTransaction3*, fRetaining : Win32cr::System::Com::VARIANT*, fAsync : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this, fRetaining, fAsync)
    end
    def init_new(this : IMSMQTransaction3*, varTransaction : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_new.call(this, varTransaction)
    end
    def get_Properties(this : IMSMQTransaction3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_ITransaction(this : IMSMQTransaction3*, pvarITransaction : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ITransaction.call(this, pvarITransaction)
    end

  end

  @[Extern]
  record IMSMQCoordinatedTransactionDispenser2Vtbl,
    query_interface : Proc(IMSMQCoordinatedTransactionDispenser2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQCoordinatedTransactionDispenser2*, UInt32),
    release : Proc(IMSMQCoordinatedTransactionDispenser2*, UInt32),
    get_type_info_count : Proc(IMSMQCoordinatedTransactionDispenser2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQCoordinatedTransactionDispenser2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQCoordinatedTransactionDispenser2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQCoordinatedTransactionDispenser2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_transaction : Proc(IMSMQCoordinatedTransactionDispenser2*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQCoordinatedTransactionDispenser2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQCoordinatedTransactionDispenser2, lpVtbl : IMSMQCoordinatedTransactionDispenser2Vtbl* do
    GUID = LibC::GUID.new(0xeba96b10_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQCoordinatedTransactionDispenser2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQCoordinatedTransactionDispenser2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQCoordinatedTransactionDispenser2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQCoordinatedTransactionDispenser2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQCoordinatedTransactionDispenser2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQCoordinatedTransactionDispenser2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQCoordinatedTransactionDispenser2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def begin_transaction(this : IMSMQCoordinatedTransactionDispenser2*, ptransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_transaction.call(this, ptransaction)
    end
    def get_Properties(this : IMSMQCoordinatedTransactionDispenser2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQCoordinatedTransactionDispenser3Vtbl,
    query_interface : Proc(IMSMQCoordinatedTransactionDispenser3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQCoordinatedTransactionDispenser3*, UInt32),
    release : Proc(IMSMQCoordinatedTransactionDispenser3*, UInt32),
    get_type_info_count : Proc(IMSMQCoordinatedTransactionDispenser3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQCoordinatedTransactionDispenser3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQCoordinatedTransactionDispenser3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQCoordinatedTransactionDispenser3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_transaction : Proc(IMSMQCoordinatedTransactionDispenser3*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQCoordinatedTransactionDispenser3*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQCoordinatedTransactionDispenser3, lpVtbl : IMSMQCoordinatedTransactionDispenser3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b14_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQCoordinatedTransactionDispenser3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQCoordinatedTransactionDispenser3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQCoordinatedTransactionDispenser3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQCoordinatedTransactionDispenser3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQCoordinatedTransactionDispenser3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQCoordinatedTransactionDispenser3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQCoordinatedTransactionDispenser3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def begin_transaction(this : IMSMQCoordinatedTransactionDispenser3*, ptransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_transaction.call(this, ptransaction)
    end
    def get_Properties(this : IMSMQCoordinatedTransactionDispenser3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQTransactionDispenser2Vtbl,
    query_interface : Proc(IMSMQTransactionDispenser2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQTransactionDispenser2*, UInt32),
    release : Proc(IMSMQTransactionDispenser2*, UInt32),
    get_type_info_count : Proc(IMSMQTransactionDispenser2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQTransactionDispenser2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQTransactionDispenser2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQTransactionDispenser2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_transaction : Proc(IMSMQTransactionDispenser2*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQTransactionDispenser2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQTransactionDispenser2, lpVtbl : IMSMQTransactionDispenser2Vtbl* do
    GUID = LibC::GUID.new(0xeba96b11_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQTransactionDispenser2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQTransactionDispenser2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQTransactionDispenser2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQTransactionDispenser2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQTransactionDispenser2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQTransactionDispenser2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQTransactionDispenser2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def begin_transaction(this : IMSMQTransactionDispenser2*, ptransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_transaction.call(this, ptransaction)
    end
    def get_Properties(this : IMSMQTransactionDispenser2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQTransactionDispenser3Vtbl,
    query_interface : Proc(IMSMQTransactionDispenser3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQTransactionDispenser3*, UInt32),
    release : Proc(IMSMQTransactionDispenser3*, UInt32),
    get_type_info_count : Proc(IMSMQTransactionDispenser3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQTransactionDispenser3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQTransactionDispenser3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQTransactionDispenser3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_transaction : Proc(IMSMQTransactionDispenser3*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQTransactionDispenser3*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQTransactionDispenser3, lpVtbl : IMSMQTransactionDispenser3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b15_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQTransactionDispenser3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQTransactionDispenser3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQTransactionDispenser3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQTransactionDispenser3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQTransactionDispenser3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQTransactionDispenser3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQTransactionDispenser3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def begin_transaction(this : IMSMQTransactionDispenser3*, ptransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_transaction.call(this, ptransaction)
    end
    def get_Properties(this : IMSMQTransactionDispenser3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQApplicationVtbl,
    query_interface : Proc(IMSMQApplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQApplication*, UInt32),
    release : Proc(IMSMQApplication*, UInt32),
    get_type_info_count : Proc(IMSMQApplication*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQApplication*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQApplication*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQApplication*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    machine_id_of_machine_name : Proc(IMSMQApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQApplication, lpVtbl : IMSMQApplicationVtbl* do
    GUID = LibC::GUID.new(0xd7d6e085_u32, 0xdccd_u16, 0x11d0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd_u8, 0xeb_u8, 0xae_u8])
    def query_interface(this : IMSMQApplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQApplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQApplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQApplication*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQApplication*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQApplication*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQApplication*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def machine_id_of_machine_name(this : IMSMQApplication*, machine_name : Win32cr::Foundation::BSTR, pbstrGuid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.machine_id_of_machine_name.call(this, machine_name, pbstrGuid)
    end

  end

  @[Extern]
  record IMSMQApplication2Vtbl,
    query_interface : Proc(IMSMQApplication2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQApplication2*, UInt32),
    release : Proc(IMSMQApplication2*, UInt32),
    get_type_info_count : Proc(IMSMQApplication2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQApplication2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQApplication2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQApplication2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    machine_id_of_machine_name : Proc(IMSMQApplication2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    register_certificate : Proc(IMSMQApplication2*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    machine_name_of_machine_id : Proc(IMSMQApplication2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MSMQVersionMajor : Proc(IMSMQApplication2*, Int16*, Win32cr::Foundation::HRESULT),
    get_MSMQVersionMinor : Proc(IMSMQApplication2*, Int16*, Win32cr::Foundation::HRESULT),
    get_MSMQVersionBuild : Proc(IMSMQApplication2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDsEnabled : Proc(IMSMQApplication2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQApplication2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQApplication2, lpVtbl : IMSMQApplication2Vtbl* do
    GUID = LibC::GUID.new(0x12a30900_u32, 0x7300_u16, 0x11d2_u16, StaticArray[0xb0_u8, 0xe6_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQApplication2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQApplication2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQApplication2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQApplication2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQApplication2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQApplication2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQApplication2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def machine_id_of_machine_name(this : IMSMQApplication2*, machine_name : Win32cr::Foundation::BSTR, pbstrGuid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.machine_id_of_machine_name.call(this, machine_name, pbstrGuid)
    end
    def register_certificate(this : IMSMQApplication2*, flags : Win32cr::System::Com::VARIANT*, external_certificate : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_certificate.call(this, flags, external_certificate)
    end
    def machine_name_of_machine_id(this : IMSMQApplication2*, bstrGuid : Win32cr::Foundation::BSTR, pbstrMachineName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.machine_name_of_machine_id.call(this, bstrGuid, pbstrMachineName)
    end
    def get_MSMQVersionMajor(this : IMSMQApplication2*, psMSMQVersionMajor : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MSMQVersionMajor.call(this, psMSMQVersionMajor)
    end
    def get_MSMQVersionMinor(this : IMSMQApplication2*, psMSMQVersionMinor : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MSMQVersionMinor.call(this, psMSMQVersionMinor)
    end
    def get_MSMQVersionBuild(this : IMSMQApplication2*, psMSMQVersionBuild : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MSMQVersionBuild.call(this, psMSMQVersionBuild)
    end
    def get_IsDsEnabled(this : IMSMQApplication2*, pfIsDsEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDsEnabled.call(this, pfIsDsEnabled)
    end
    def get_Properties(this : IMSMQApplication2*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQApplication3Vtbl,
    query_interface : Proc(IMSMQApplication3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQApplication3*, UInt32),
    release : Proc(IMSMQApplication3*, UInt32),
    get_type_info_count : Proc(IMSMQApplication3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQApplication3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQApplication3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQApplication3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    machine_id_of_machine_name : Proc(IMSMQApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    register_certificate : Proc(IMSMQApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    machine_name_of_machine_id : Proc(IMSMQApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MSMQVersionMajor : Proc(IMSMQApplication3*, Int16*, Win32cr::Foundation::HRESULT),
    get_MSMQVersionMinor : Proc(IMSMQApplication3*, Int16*, Win32cr::Foundation::HRESULT),
    get_MSMQVersionBuild : Proc(IMSMQApplication3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDsEnabled : Proc(IMSMQApplication3*, Int16*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQApplication3*, Void**, Win32cr::Foundation::HRESULT),
    get_ActiveQueues : Proc(IMSMQApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PrivateQueues : Proc(IMSMQApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DirectoryServiceServer : Proc(IMSMQApplication3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsConnected : Proc(IMSMQApplication3*, Int16*, Win32cr::Foundation::HRESULT),
    get_BytesInAllQueues : Proc(IMSMQApplication3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Machine : Proc(IMSMQApplication3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Machine : Proc(IMSMQApplication3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    connect : Proc(IMSMQApplication3*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IMSMQApplication3*, Win32cr::Foundation::HRESULT),
    tidy : Proc(IMSMQApplication3*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQApplication3, lpVtbl : IMSMQApplication3Vtbl* do
    GUID = LibC::GUID.new(0xeba96b1f_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQApplication3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQApplication3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQApplication3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQApplication3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQApplication3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQApplication3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQApplication3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def machine_id_of_machine_name(this : IMSMQApplication3*, machine_name : Win32cr::Foundation::BSTR, pbstrGuid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.machine_id_of_machine_name.call(this, machine_name, pbstrGuid)
    end
    def register_certificate(this : IMSMQApplication3*, flags : Win32cr::System::Com::VARIANT*, external_certificate : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_certificate.call(this, flags, external_certificate)
    end
    def machine_name_of_machine_id(this : IMSMQApplication3*, bstrGuid : Win32cr::Foundation::BSTR, pbstrMachineName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.machine_name_of_machine_id.call(this, bstrGuid, pbstrMachineName)
    end
    def get_MSMQVersionMajor(this : IMSMQApplication3*, psMSMQVersionMajor : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MSMQVersionMajor.call(this, psMSMQVersionMajor)
    end
    def get_MSMQVersionMinor(this : IMSMQApplication3*, psMSMQVersionMinor : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MSMQVersionMinor.call(this, psMSMQVersionMinor)
    end
    def get_MSMQVersionBuild(this : IMSMQApplication3*, psMSMQVersionBuild : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MSMQVersionBuild.call(this, psMSMQVersionBuild)
    end
    def get_IsDsEnabled(this : IMSMQApplication3*, pfIsDsEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDsEnabled.call(this, pfIsDsEnabled)
    end
    def get_Properties(this : IMSMQApplication3*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end
    def get_ActiveQueues(this : IMSMQApplication3*, pvActiveQueues : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActiveQueues.call(this, pvActiveQueues)
    end
    def get_PrivateQueues(this : IMSMQApplication3*, pvPrivateQueues : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateQueues.call(this, pvPrivateQueues)
    end
    def get_DirectoryServiceServer(this : IMSMQApplication3*, pbstrDirectoryServiceServer : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DirectoryServiceServer.call(this, pbstrDirectoryServiceServer)
    end
    def get_IsConnected(this : IMSMQApplication3*, pfIsConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsConnected.call(this, pfIsConnected)
    end
    def get_BytesInAllQueues(this : IMSMQApplication3*, pvBytesInAllQueues : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BytesInAllQueues.call(this, pvBytesInAllQueues)
    end
    def put_Machine(this : IMSMQApplication3*, bstrMachine : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Machine.call(this, bstrMachine)
    end
    def get_Machine(this : IMSMQApplication3*, pbstrMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Machine.call(this, pbstrMachine)
    end
    def connect(this : IMSMQApplication3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this)
    end
    def disconnect(this : IMSMQApplication3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def tidy(this : IMSMQApplication3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tidy.call(this)
    end

  end

  @[Extern]
  record IMSMQDestinationVtbl,
    query_interface : Proc(IMSMQDestination*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQDestination*, UInt32),
    release : Proc(IMSMQDestination*, UInt32),
    get_type_info_count : Proc(IMSMQDestination*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQDestination*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQDestination*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQDestination*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    open : Proc(IMSMQDestination*, Win32cr::Foundation::HRESULT),
    close : Proc(IMSMQDestination*, Win32cr::Foundation::HRESULT),
    get_IsOpen : Proc(IMSMQDestination*, Int16*, Win32cr::Foundation::HRESULT),
    get_IADs : Proc(IMSMQDestination*, Void**, Win32cr::Foundation::HRESULT),
    putref_IADs : Proc(IMSMQDestination*, Void*, Win32cr::Foundation::HRESULT),
    get_ADsPath : Proc(IMSMQDestination*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ADsPath : Proc(IMSMQDestination*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PathName : Proc(IMSMQDestination*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PathName : Proc(IMSMQDestination*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FormatName : Proc(IMSMQDestination*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FormatName : Proc(IMSMQDestination*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Destinations : Proc(IMSMQDestination*, Void**, Win32cr::Foundation::HRESULT),
    putref_Destinations : Proc(IMSMQDestination*, Void*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IMSMQDestination*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQDestination, lpVtbl : IMSMQDestinationVtbl* do
    GUID = LibC::GUID.new(0xeba96b16_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQDestination*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQDestination*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQDestination*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQDestination*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQDestination*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQDestination*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQDestination*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def open(this : IMSMQDestination*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this)
    end
    def close(this : IMSMQDestination*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_IsOpen(this : IMSMQDestination*, pfIsOpen : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsOpen.call(this, pfIsOpen)
    end
    def get_IADs(this : IMSMQDestination*, ppIADs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IADs.call(this, ppIADs)
    end
    def putref_IADs(this : IMSMQDestination*, pIADs : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_IADs.call(this, pIADs)
    end
    def get_ADsPath(this : IMSMQDestination*, pbstrADsPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ADsPath.call(this, pbstrADsPath)
    end
    def put_ADsPath(this : IMSMQDestination*, bstrADsPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ADsPath.call(this, bstrADsPath)
    end
    def get_PathName(this : IMSMQDestination*, pbstrPathName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathName.call(this, pbstrPathName)
    end
    def put_PathName(this : IMSMQDestination*, bstrPathName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PathName.call(this, bstrPathName)
    end
    def get_FormatName(this : IMSMQDestination*, pbstrFormatName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FormatName.call(this, pbstrFormatName)
    end
    def put_FormatName(this : IMSMQDestination*, bstrFormatName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FormatName.call(this, bstrFormatName)
    end
    def get_Destinations(this : IMSMQDestination*, ppDestinations : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Destinations.call(this, ppDestinations)
    end
    def putref_Destinations(this : IMSMQDestination*, pDestinations : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Destinations.call(this, pDestinations)
    end
    def get_Properties(this : IMSMQDestination*, ppcolProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppcolProperties)
    end

  end

  @[Extern]
  record IMSMQPrivateDestinationVtbl,
    query_interface : Proc(IMSMQPrivateDestination*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQPrivateDestination*, UInt32),
    release : Proc(IMSMQPrivateDestination*, UInt32),
    get_type_info_count : Proc(IMSMQPrivateDestination*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQPrivateDestination*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQPrivateDestination*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQPrivateDestination*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(IMSMQPrivateDestination*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Handle : Proc(IMSMQPrivateDestination*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQPrivateDestination, lpVtbl : IMSMQPrivateDestinationVtbl* do
    GUID = LibC::GUID.new(0xeba96b17_u32, 0x2168_u16, 0x11d3_u16, StaticArray[0x89_u8, 0x8c_u8, 0x0_u8, 0xe0_u8, 0x2c_u8, 0x7_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IMSMQPrivateDestination*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQPrivateDestination*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQPrivateDestination*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQPrivateDestination*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQPrivateDestination*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQPrivateDestination*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQPrivateDestination*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Handle(this : IMSMQPrivateDestination*, pvarHandle : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, pvarHandle)
    end
    def put_Handle(this : IMSMQPrivateDestination*, varHandle : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Handle.call(this, varHandle)
    end

  end

  @[Extern]
  record IMSMQCollectionVtbl,
    query_interface : Proc(IMSMQCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQCollection*, UInt32),
    release : Proc(IMSMQCollection*, UInt32),
    get_type_info_count : Proc(IMSMQCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    item : Proc(IMSMQCollection*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IMSMQCollection*, Int32*, Win32cr::Foundation::HRESULT),
    _new_enum : Proc(IMSMQCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQCollection, lpVtbl : IMSMQCollectionVtbl* do
    GUID = LibC::GUID.new(0x188ac2f_u32, 0xecb3_u16, 0x4173_u16, StaticArray[0x97_u8, 0x79_u8, 0x63_u8, 0x5c_u8, 0xa2_u8, 0x3_u8, 0x9c_u8, 0x72_u8])
    def query_interface(this : IMSMQCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def item(this : IMSMQCollection*, index : Win32cr::System::Com::VARIANT*, pvarRet : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, pvarRet)
    end
    def get_Count(this : IMSMQCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def _new_enum(this : IMSMQCollection*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value._new_enum.call(this, ppunk)
    end

  end

  @[Extern]
  record IMSMQManagementVtbl,
    query_interface : Proc(IMSMQManagement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQManagement*, UInt32),
    release : Proc(IMSMQManagement*, UInt32),
    get_type_info_count : Proc(IMSMQManagement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQManagement*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQManagement*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQManagement*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    init : Proc(IMSMQManagement*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_FormatName : Proc(IMSMQManagement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Machine : Proc(IMSMQManagement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MessageCount : Proc(IMSMQManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_ForeignStatus : Proc(IMSMQManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_QueueType : Proc(IMSMQManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_IsLocal : Proc(IMSMQManagement*, Int16*, Win32cr::Foundation::HRESULT),
    get_TransactionalStatus : Proc(IMSMQManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_BytesInQueue : Proc(IMSMQManagement*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQManagement, lpVtbl : IMSMQManagementVtbl* do
    GUID = LibC::GUID.new(0xbe5f0241_u32, 0xe489_u16, 0x4957_u16, StaticArray[0x8c_u8, 0xc4_u8, 0xa4_u8, 0x52_u8, 0xfc_u8, 0xf3_u8, 0xe2_u8, 0x3e_u8])
    def query_interface(this : IMSMQManagement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQManagement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQManagement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQManagement*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQManagement*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQManagement*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQManagement*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def init(this : IMSMQManagement*, machine : Win32cr::System::Com::VARIANT*, pathname : Win32cr::System::Com::VARIANT*, format_name : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, machine, pathname, format_name)
    end
    def get_FormatName(this : IMSMQManagement*, pbstrFormatName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FormatName.call(this, pbstrFormatName)
    end
    def get_Machine(this : IMSMQManagement*, pbstrMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Machine.call(this, pbstrMachine)
    end
    def get_MessageCount(this : IMSMQManagement*, plMessageCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MessageCount.call(this, plMessageCount)
    end
    def get_ForeignStatus(this : IMSMQManagement*, plForeignStatus : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ForeignStatus.call(this, plForeignStatus)
    end
    def get_QueueType(this : IMSMQManagement*, plQueueType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueType.call(this, plQueueType)
    end
    def get_IsLocal(this : IMSMQManagement*, pfIsLocal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsLocal.call(this, pfIsLocal)
    end
    def get_TransactionalStatus(this : IMSMQManagement*, plTransactionalStatus : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionalStatus.call(this, plTransactionalStatus)
    end
    def get_BytesInQueue(this : IMSMQManagement*, pvBytesInQueue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BytesInQueue.call(this, pvBytesInQueue)
    end

  end

  @[Extern]
  record IMSMQOutgoingQueueManagementVtbl,
    query_interface : Proc(IMSMQOutgoingQueueManagement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQOutgoingQueueManagement*, UInt32),
    release : Proc(IMSMQOutgoingQueueManagement*, UInt32),
    get_type_info_count : Proc(IMSMQOutgoingQueueManagement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQOutgoingQueueManagement*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQOutgoingQueueManagement*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQOutgoingQueueManagement*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    init : Proc(IMSMQOutgoingQueueManagement*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_FormatName : Proc(IMSMQOutgoingQueueManagement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Machine : Proc(IMSMQOutgoingQueueManagement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MessageCount : Proc(IMSMQOutgoingQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_ForeignStatus : Proc(IMSMQOutgoingQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_QueueType : Proc(IMSMQOutgoingQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_IsLocal : Proc(IMSMQOutgoingQueueManagement*, Int16*, Win32cr::Foundation::HRESULT),
    get_TransactionalStatus : Proc(IMSMQOutgoingQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_BytesInQueue : Proc(IMSMQOutgoingQueueManagement*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IMSMQOutgoingQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_NextHops : Proc(IMSMQOutgoingQueueManagement*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    eod_get_send_info : Proc(IMSMQOutgoingQueueManagement*, Void**, Win32cr::Foundation::HRESULT),
    resume : Proc(IMSMQOutgoingQueueManagement*, Win32cr::Foundation::HRESULT),
    pause : Proc(IMSMQOutgoingQueueManagement*, Win32cr::Foundation::HRESULT),
    eod_resend : Proc(IMSMQOutgoingQueueManagement*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQOutgoingQueueManagement, lpVtbl : IMSMQOutgoingQueueManagementVtbl* do
    GUID = LibC::GUID.new(0x64c478fb_u32, 0xf9b0_u16, 0x4695_u16, StaticArray[0x8a_u8, 0x7f_u8, 0x43_u8, 0x9a_u8, 0xc9_u8, 0x43_u8, 0x26_u8, 0xd3_u8])
    def query_interface(this : IMSMQOutgoingQueueManagement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQOutgoingQueueManagement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQOutgoingQueueManagement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQOutgoingQueueManagement*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQOutgoingQueueManagement*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQOutgoingQueueManagement*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQOutgoingQueueManagement*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def init(this : IMSMQOutgoingQueueManagement*, machine : Win32cr::System::Com::VARIANT*, pathname : Win32cr::System::Com::VARIANT*, format_name : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, machine, pathname, format_name)
    end
    def get_FormatName(this : IMSMQOutgoingQueueManagement*, pbstrFormatName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FormatName.call(this, pbstrFormatName)
    end
    def get_Machine(this : IMSMQOutgoingQueueManagement*, pbstrMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Machine.call(this, pbstrMachine)
    end
    def get_MessageCount(this : IMSMQOutgoingQueueManagement*, plMessageCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MessageCount.call(this, plMessageCount)
    end
    def get_ForeignStatus(this : IMSMQOutgoingQueueManagement*, plForeignStatus : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ForeignStatus.call(this, plForeignStatus)
    end
    def get_QueueType(this : IMSMQOutgoingQueueManagement*, plQueueType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueType.call(this, plQueueType)
    end
    def get_IsLocal(this : IMSMQOutgoingQueueManagement*, pfIsLocal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsLocal.call(this, pfIsLocal)
    end
    def get_TransactionalStatus(this : IMSMQOutgoingQueueManagement*, plTransactionalStatus : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionalStatus.call(this, plTransactionalStatus)
    end
    def get_BytesInQueue(this : IMSMQOutgoingQueueManagement*, pvBytesInQueue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BytesInQueue.call(this, pvBytesInQueue)
    end
    def get_State(this : IMSMQOutgoingQueueManagement*, plState : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, plState)
    end
    def get_NextHops(this : IMSMQOutgoingQueueManagement*, pvNextHops : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NextHops.call(this, pvNextHops)
    end
    def eod_get_send_info(this : IMSMQOutgoingQueueManagement*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.eod_get_send_info.call(this, ppCollection)
    end
    def resume(this : IMSMQOutgoingQueueManagement*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def pause(this : IMSMQOutgoingQueueManagement*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def eod_resend(this : IMSMQOutgoingQueueManagement*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.eod_resend.call(this)
    end

  end

  @[Extern]
  record IMSMQQueueManagementVtbl,
    query_interface : Proc(IMSMQQueueManagement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMSMQQueueManagement*, UInt32),
    release : Proc(IMSMQQueueManagement*, UInt32),
    get_type_info_count : Proc(IMSMQQueueManagement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMSMQQueueManagement*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMSMQQueueManagement*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMSMQQueueManagement*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    init : Proc(IMSMQQueueManagement*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_FormatName : Proc(IMSMQQueueManagement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Machine : Proc(IMSMQQueueManagement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MessageCount : Proc(IMSMQQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_ForeignStatus : Proc(IMSMQQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_QueueType : Proc(IMSMQQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_IsLocal : Proc(IMSMQQueueManagement*, Int16*, Win32cr::Foundation::HRESULT),
    get_TransactionalStatus : Proc(IMSMQQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_BytesInQueue : Proc(IMSMQQueueManagement*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_JournalMessageCount : Proc(IMSMQQueueManagement*, Int32*, Win32cr::Foundation::HRESULT),
    get_BytesInJournal : Proc(IMSMQQueueManagement*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    eod_get_receive_info : Proc(IMSMQQueueManagement*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMSMQQueueManagement, lpVtbl : IMSMQQueueManagementVtbl* do
    GUID = LibC::GUID.new(0x7fbe7759_u32, 0x5760_u16, 0x444d_u16, StaticArray[0xb8_u8, 0xa5_u8, 0x5e_u8, 0x7a_u8, 0xb9_u8, 0xa8_u8, 0x4c_u8, 0xce_u8])
    def query_interface(this : IMSMQQueueManagement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMSMQQueueManagement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMSMQQueueManagement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMSMQQueueManagement*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMSMQQueueManagement*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMSMQQueueManagement*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMSMQQueueManagement*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def init(this : IMSMQQueueManagement*, machine : Win32cr::System::Com::VARIANT*, pathname : Win32cr::System::Com::VARIANT*, format_name : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, machine, pathname, format_name)
    end
    def get_FormatName(this : IMSMQQueueManagement*, pbstrFormatName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FormatName.call(this, pbstrFormatName)
    end
    def get_Machine(this : IMSMQQueueManagement*, pbstrMachine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Machine.call(this, pbstrMachine)
    end
    def get_MessageCount(this : IMSMQQueueManagement*, plMessageCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MessageCount.call(this, plMessageCount)
    end
    def get_ForeignStatus(this : IMSMQQueueManagement*, plForeignStatus : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ForeignStatus.call(this, plForeignStatus)
    end
    def get_QueueType(this : IMSMQQueueManagement*, plQueueType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueueType.call(this, plQueueType)
    end
    def get_IsLocal(this : IMSMQQueueManagement*, pfIsLocal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsLocal.call(this, pfIsLocal)
    end
    def get_TransactionalStatus(this : IMSMQQueueManagement*, plTransactionalStatus : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionalStatus.call(this, plTransactionalStatus)
    end
    def get_BytesInQueue(this : IMSMQQueueManagement*, pvBytesInQueue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BytesInQueue.call(this, pvBytesInQueue)
    end
    def get_JournalMessageCount(this : IMSMQQueueManagement*, plJournalMessageCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_JournalMessageCount.call(this, plJournalMessageCount)
    end
    def get_BytesInJournal(this : IMSMQQueueManagement*, pvBytesInJournal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BytesInJournal.call(this, pvBytesInJournal)
    end
    def eod_get_receive_info(this : IMSMQQueueManagement*, pvCollection : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.eod_get_receive_info.call(this, pvCollection)
    end

  end

end