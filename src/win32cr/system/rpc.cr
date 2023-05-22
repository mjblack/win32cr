require "../system/com.cr"
require "../foundation.cr"
require "../system/io.cr"
require "../security/cryptography.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:rpcrt4.dll")]
@[Link(ldflags: "/DELAYLOAD:rpcns4.dll")]
lib LibWin32
  RPC_C_BINDING_INFINITE_TIMEOUT = 10_u32
  RPC_C_BINDING_MIN_TIMEOUT = 0_u32
  RPC_C_BINDING_DEFAULT_TIMEOUT = 5_u32
  RPC_C_BINDING_MAX_TIMEOUT = 9_u32
  RPC_C_CANCEL_INFINITE_TIMEOUT = -1_i32
  RPC_C_LISTEN_MAX_CALLS_DEFAULT = 1234_u32
  RPC_C_PROTSEQ_MAX_REQS_DEFAULT = 10_u32
  RPC_C_BIND_TO_ALL_NICS = 1_u32
  RPC_C_USE_INTERNET_PORT = 1_u32
  RPC_C_USE_INTRANET_PORT = 2_u32
  RPC_C_DONT_FAIL = 4_u32
  RPC_C_RPCHTTP_USE_LOAD_BALANCE = 8_u32
  RPC_C_TRY_ENFORCE_MAX_CALLS = 16_u32
  RPC_C_MQ_TEMPORARY = 0_u32
  RPC_C_MQ_PERMANENT = 1_u32
  RPC_C_MQ_CLEAR_ON_OPEN = 2_u32
  RPC_C_MQ_USE_EXISTING_SECURITY = 4_u32
  RPC_C_MQ_AUTHN_LEVEL_NONE = 0_u32
  RPC_C_MQ_AUTHN_LEVEL_PKT_INTEGRITY = 8_u32
  RPC_C_MQ_AUTHN_LEVEL_PKT_PRIVACY = 16_u32
  RPC_C_MQ_EXPRESS = 0_u32
  RPC_C_MQ_RECOVERABLE = 1_u32
  RPC_C_MQ_JOURNAL_NONE = 0_u32
  RPC_C_MQ_JOURNAL_DEADLETTER = 1_u32
  RPC_C_MQ_JOURNAL_ALWAYS = 2_u32
  RPC_C_OPT_MQ_DELIVERY = 1_u32
  RPC_C_OPT_MQ_PRIORITY = 2_u32
  RPC_C_OPT_MQ_JOURNAL = 3_u32
  RPC_C_OPT_MQ_ACKNOWLEDGE = 4_u32
  RPC_C_OPT_MQ_AUTHN_SERVICE = 5_u32
  RPC_C_OPT_MQ_AUTHN_LEVEL = 6_u32
  RPC_C_OPT_MQ_TIME_TO_REACH_QUEUE = 7_u32
  RPC_C_OPT_MQ_TIME_TO_BE_RECEIVED = 8_u32
  RPC_C_OPT_BINDING_NONCAUSAL = 9_u32
  RPC_C_OPT_SECURITY_CALLBACK = 10_u32
  RPC_C_OPT_UNIQUE_BINDING = 11_u32
  RPC_C_OPT_MAX_OPTIONS = 12_u32
  RPC_C_OPT_CALL_TIMEOUT = 12_u32
  RPC_C_OPT_DONT_LINGER = 13_u32
  RPC_C_OPT_TRANS_SEND_BUFFER_SIZE = 5_u32
  RPC_C_OPT_TRUST_PEER = 14_u32
  RPC_C_OPT_ASYNC_BLOCK = 15_u32
  RPC_C_OPT_OPTIMIZE_TIME = 16_u32
  RPC_C_FULL_CERT_CHAIN = 1_u32
  RPC_C_STATS_CALLS_IN = 0_u32
  RPC_C_STATS_CALLS_OUT = 1_u32
  RPC_C_STATS_PKTS_IN = 2_u32
  RPC_C_STATS_PKTS_OUT = 3_u32
  RPC_C_AUTHN_NONE = 0_u32
  RPC_C_AUTHN_DCE_PRIVATE = 1_u32
  RPC_C_AUTHN_DCE_PUBLIC = 2_u32
  RPC_C_AUTHN_DEC_PUBLIC = 4_u32
  RPC_C_AUTHN_GSS_NEGOTIATE = 9_u32
  RPC_C_AUTHN_WINNT = 10_u32
  RPC_C_AUTHN_GSS_SCHANNEL = 14_u32
  RPC_C_AUTHN_GSS_KERBEROS = 16_u32
  RPC_C_AUTHN_DPA = 17_u32
  RPC_C_AUTHN_MSN = 18_u32
  RPC_C_AUTHN_DIGEST = 21_u32
  RPC_C_AUTHN_KERNEL = 20_u32
  RPC_C_AUTHN_NEGO_EXTENDER = 30_u32
  RPC_C_AUTHN_PKU2U = 31_u32
  RPC_C_AUTHN_LIVE_SSP = 32_u32
  RPC_C_AUTHN_LIVEXP_SSP = 35_u32
  RPC_C_AUTHN_CLOUD_AP = 36_u32
  RPC_C_AUTHN_MSONLINE = 82_u32
  RPC_C_AUTHN_MQ = 100_u32
  RPC_C_AUTHN_DEFAULT = -1_i32
  RPC_C_SECURITY_QOS_VERSION = 1_i32
  RPC_C_SECURITY_QOS_VERSION_1 = 1_i32
  RPC_C_SECURITY_QOS_VERSION_2 = 2_i32
  RPC_C_HTTP_AUTHN_SCHEME_BASIC = 1_u32
  RPC_C_HTTP_AUTHN_SCHEME_NTLM = 2_u32
  RPC_C_HTTP_AUTHN_SCHEME_PASSPORT = 4_u32
  RPC_C_HTTP_AUTHN_SCHEME_DIGEST = 8_u32
  RPC_C_HTTP_AUTHN_SCHEME_NEGOTIATE = 16_u32
  RPC_C_HTTP_AUTHN_SCHEME_CERT = 65536_u32
  RPC_C_SECURITY_QOS_VERSION_3 = 3_i32
  RPC_C_SECURITY_QOS_VERSION_4 = 4_i32
  RPC_C_SECURITY_QOS_VERSION_5 = 5_i32
  RPC_PROTSEQ_TCP = 1_u32
  RPC_PROTSEQ_NMP = 2_u32
  RPC_PROTSEQ_LRPC = 3_u32
  RPC_PROTSEQ_HTTP = 4_u32
  RPC_BHT_OBJECT_UUID_VALID = 1_u32
  RPC_BHO_EXCLUSIVE_AND_GUARANTEED = 4_u32
  RPC_C_AUTHZ_NONE = 0_u32
  RPC_C_AUTHZ_NAME = 1_u32
  RPC_C_AUTHZ_DCE = 2_u32
  RPC_C_AUTHZ_DEFAULT = 4294967295_u32
  DCE_C_ERROR_STRING_LEN = 256_u32
  RPC_C_EP_ALL_ELTS = 0_u32
  RPC_C_EP_MATCH_BY_IF = 1_u32
  RPC_C_EP_MATCH_BY_OBJ = 2_u32
  RPC_C_EP_MATCH_BY_BOTH = 3_u32
  RPC_C_VERS_ALL = 1_u32
  RPC_C_VERS_COMPATIBLE = 2_u32
  RPC_C_VERS_EXACT = 3_u32
  RPC_C_VERS_MAJOR_ONLY = 4_u32
  RPC_C_VERS_UPTO = 5_u32
  RPC_C_MGMT_INQ_IF_IDS = 0_u32
  RPC_C_MGMT_INQ_PRINC_NAME = 1_u32
  RPC_C_MGMT_INQ_STATS = 2_u32
  RPC_C_MGMT_IS_SERVER_LISTEN = 3_u32
  RPC_C_MGMT_STOP_SERVER_LISTEN = 4_u32
  RPC_C_PARM_MAX_PACKET_LENGTH = 1_u32
  RPC_C_PARM_BUFFER_LENGTH = 2_u32
  RPC_IF_AUTOLISTEN = 1_u32
  RPC_IF_OLE = 2_u32
  RPC_IF_ALLOW_UNKNOWN_AUTHORITY = 4_u32
  RPC_IF_ALLOW_SECURE_ONLY = 8_u32
  RPC_IF_ALLOW_CALLBACKS_WITH_NO_AUTH = 16_u32
  RPC_IF_ALLOW_LOCAL_ONLY = 32_u32
  RPC_IF_SEC_NO_CACHE = 64_u32
  RPC_IF_SEC_CACHE_PER_PROC = 128_u32
  RPC_IF_ASYNC_CALLBACK = 256_u32
  RPC_FW_IF_FLAG_DCOM = 1_u32
  RPC_C_NOTIFY_ON_SEND_COMPLETE = 1_u32
  MaxNumberOfEEInfoParams = 4_u32
  RPC_EEINFO_VERSION = 1_u32
  EEInfoPreviousRecordsMissing = 1_u32
  EEInfoNextRecordsMissing = 2_u32
  EEInfoUseFileTime = 4_u32
  EEInfoGCCOM = 11_u32
  EEInfoGCFRS = 12_u32
  RPC_CALL_ATTRIBUTES_VERSION = 2_u32
  RPC_QUERY_SERVER_PRINCIPAL_NAME = 2_u32
  RPC_QUERY_CLIENT_PRINCIPAL_NAME = 4_u32
  RPC_QUERY_CALL_LOCAL_ADDRESS = 8_u32
  RPC_QUERY_CLIENT_PID = 16_u32
  RPC_QUERY_IS_CLIENT_LOCAL = 32_u32
  RPC_QUERY_NO_AUTH_REQUIRED = 64_u32
  RPC_QUERY_CLIENT_ID = 128_u32
  RPC_CALL_STATUS_CANCELLED = 1_u32
  RPC_CALL_STATUS_DISCONNECTED = 2_u32
  RPC_CONTEXT_HANDLE_DEFAULT_FLAGS = 0_u32
  RPC_CONTEXT_HANDLE_FLAGS = 805306368_u32
  RPC_CONTEXT_HANDLE_SERIALIZE = 268435456_u32
  RPC_CONTEXT_HANDLE_DONT_SERIALIZE = 536870912_u32
  RPC_TYPE_STRICT_CONTEXT_HANDLE = 1073741824_u32
  RPC_TYPE_DISCONNECT_EVENT_CONTEXT_HANDLE = 2147483648_u32
  RPC_NCA_FLAGS_DEFAULT = 0_u32
  RPC_NCA_FLAGS_IDEMPOTENT = 1_u32
  RPC_NCA_FLAGS_BROADCAST = 2_u32
  RPC_NCA_FLAGS_MAYBE = 4_u32
  RPCFLG_HAS_GUARANTEE = 16_u32
  RPCFLG_WINRT_REMOTE_ASYNC = 32_u32
  RPC_BUFFER_COMPLETE = 4096_u32
  RPC_BUFFER_PARTIAL = 8192_u32
  RPC_BUFFER_EXTRA = 16384_u32
  RPC_BUFFER_ASYNC = 32768_u32
  RPC_BUFFER_NONOTIFY = 65536_u32
  RPCFLG_MESSAGE = 16777216_u32
  RPCFLG_AUTO_COMPLETE = 134217728_u32
  RPCFLG_LOCAL_CALL = 268435456_u32
  RPCFLG_INPUT_SYNCHRONOUS = 536870912_u32
  RPCFLG_ASYNCHRONOUS = 1073741824_u32
  RPCFLG_NON_NDR = 2147483648_u32
  RPCFLG_HAS_MULTI_SYNTAXES = 33554432_u32
  RPCFLG_HAS_CALLBACK = 67108864_u32
  RPCFLG_ACCESSIBILITY_BIT1 = 1048576_u32
  RPCFLG_ACCESSIBILITY_BIT2 = 2097152_u32
  RPCFLG_ACCESS_LOCAL = 4194304_u32
  NDR_CUSTOM_OR_DEFAULT_ALLOCATOR = 268435456_u32
  NDR_DEFAULT_ALLOCATOR = 536870912_u32
  RPCFLG_NDR64_CONTAINS_ARM_LAYOUT = 67108864_u32
  RPCFLG_SENDER_WAITING_FOR_REPLY = 8388608_u32
  RPC_FLAGS_VALID_BIT = 32768_u32
  NT351_INTERFACE_SIZE = 64_u32
  RPC_INTERFACE_HAS_PIPES = 1_u32
  RPC_SYSTEM_HANDLE_FREE_UNRETRIEVED = 1_u32
  RPC_SYSTEM_HANDLE_FREE_RETRIEVED = 2_u32
  RPC_SYSTEM_HANDLE_FREE_ALL = 3_u32
  RPC_SYSTEM_HANDLE_FREE_ERROR_ON_CLOSE = 4_u32
  TRANSPORT_TYPE_CN = 1_u32
  TRANSPORT_TYPE_DG = 2_u32
  TRANSPORT_TYPE_LPC = 4_u32
  TRANSPORT_TYPE_WMSG = 8_u32
  RPC_P_ADDR_FORMAT_TCP_IPV4 = 1_u32
  RPC_P_ADDR_FORMAT_TCP_IPV6 = 2_u32
  RPC_C_OPT_SESSION_ID = 6_u32
  RPC_C_OPT_COOKIE_AUTH = 7_u32
  RPC_C_OPT_RESOURCE_TYPE_UUID = 8_u32
  RPC_PROXY_CONNECTION_TYPE_IN_PROXY = 0_u32
  RPC_PROXY_CONNECTION_TYPE_OUT_PROXY = 1_u32
  RPC_C_OPT_PRIVATE_SUPPRESS_WAKE = 1_u32
  RPC_C_OPT_PRIVATE_DO_NOT_DISTURB = 2_u32
  RPC_C_OPT_PRIVATE_BREAK_ON_SUSPEND = 3_u32
  RPC_C_PROFILE_DEFAULT_ELT = 0_u32
  RPC_C_PROFILE_ALL_ELT = 1_u32
  RPC_C_PROFILE_ALL_ELTS = 1_u32
  RPC_C_PROFILE_MATCH_BY_IF = 2_u32
  RPC_C_PROFILE_MATCH_BY_MBR = 3_u32
  RPC_C_PROFILE_MATCH_BY_BOTH = 4_u32
  RPC_C_NS_DEFAULT_EXP_AGE = -1_i32
  TARGET_IS_NT100_OR_LATER = 1_u32
  TARGET_IS_NT63_OR_LATER = 1_u32
  TARGET_IS_NT62_OR_LATER = 1_u32
  TARGET_IS_NT61_OR_LATER = 1_u32
  TARGET_IS_NT60_OR_LATER = 1_u32
  TARGET_IS_NT51_OR_LATER = 1_u32
  TARGET_IS_NT50_OR_LATER = 1_u32
  TARGET_IS_NT40_OR_LATER = 1_u32
  TARGET_IS_NT351_OR_WIN95_OR_LATER = 1_u32
  USER_CALL_IS_ASYNC = 256_u32
  USER_CALL_NEW_CORRELATION_DESC = 512_u32
  MIDL_WINRT_TYPE_SERIALIZATION_INFO_CURRENT_VERSION = 1_i32
  USER_MARSHAL_FC_BYTE = 1_u32
  USER_MARSHAL_FC_CHAR = 2_u32
  USER_MARSHAL_FC_SMALL = 3_u32
  USER_MARSHAL_FC_USMALL = 4_u32
  USER_MARSHAL_FC_WCHAR = 5_u32
  USER_MARSHAL_FC_SHORT = 6_u32
  USER_MARSHAL_FC_USHORT = 7_u32
  USER_MARSHAL_FC_LONG = 8_u32
  USER_MARSHAL_FC_ULONG = 9_u32
  USER_MARSHAL_FC_FLOAT = 10_u32
  USER_MARSHAL_FC_HYPER = 11_u32
  USER_MARSHAL_FC_DOUBLE = 12_u32
  INVALID_FRAGMENT_ID = 0_u32
  NDR64_FC_EXPLICIT_HANDLE = 0_u32
  NDR64_FC_BIND_GENERIC = 1_u32
  NDR64_FC_BIND_PRIMITIVE = 2_u32
  NDR64_FC_AUTO_HANDLE = 3_u32
  NDR64_FC_CALLBACK_HANDLE = 4_u32
  NDR64_FC_NO_HANDLE = 5_u32
  RPCPROXY_H_VERSION__ = 475_u32
  MidlInterceptionInfoVersionOne = 1_i32
  MidlWinrtTypeSerializationInfoVersionOne = 1_i32

  type NDR_ASYNC_MESSAGE = Void
  type NDR_CORRELATION_INFO = Void
  type NDR_ALLOC_ALL_NODES_CONTEXT = Void
  type NDR_POINTER_QUEUE_STATE = Void
  type NDR_PROC_CONTEXT = Void

  alias RPC_OBJECT_INQ_FN = Proc(Guid*, Guid*, RPC_STATUS*, Void)
  alias RPC_IF_CALLBACK_FN = Proc(Void*, Void*, RPC_STATUS)
  alias RPC_SECURITY_CALLBACK_FN = Proc(Void*, Void)
  alias RPC_NEW_HTTP_PROXY_CHANNEL = Proc(RPC_HTTP_REDIRECTOR_STAGE, UInt16*, UInt16*, UInt16*, UInt16*, Void*, Void*, Void*, Void*, UInt32, UInt16**, UInt16**, RPC_STATUS)
  alias RPC_HTTP_PROXY_FREE_STRING = Proc(UInt16*, Void)
  alias RPC_AUTH_KEY_RETRIEVAL_FN = Proc(Void*, UInt16*, UInt32, Void**, RPC_STATUS*, Void)
  alias RPC_MGMT_AUTHORIZATION_FN = Proc(Void*, UInt32, RPC_STATUS*, Int32)
  alias RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN = Proc(Void*, Void*, UInt32, Void)
  alias RPC_FORWARD_FUNCTION = Proc(Guid*, RPC_VERSION*, Guid*, UInt8*, Void**, RPC_STATUS)
  alias RPC_ADDRESS_CHANGE_FN = Proc(Void*, Void)
  alias RPC_DISPATCH_FUNCTION = Proc(RPC_MESSAGE*, Void)
  alias PRPC_RUNDOWN = Proc(Void*, Void)
  alias RPCLT_PDU_FILTER_FUNC = Proc(Void*, UInt32, Int32, Void)
  alias RPC_SETFILTER_FUNC = Proc(RPCLT_PDU_FILTER_FUNC, Void)
  alias RPC_BLOCKING_FN = Proc(Void*, Void*, Void*, RPC_STATUS)
  alias I_RpcProxyIsValidMachineFn = Proc(UInt16*, UInt16*, UInt32, RPC_STATUS)
  alias I_RpcProxyGetClientAddressFn = Proc(Void*, PSTR, UInt32*, RPC_STATUS)
  alias I_RpcProxyGetConnectionTimeoutFn = Proc(UInt32*, RPC_STATUS)
  alias I_RpcPerformCalloutFn = Proc(Void*, RDR_CALLOUT_STATE*, RPC_HTTP_REDIRECTOR_STAGE, RPC_STATUS)
  alias I_RpcFreeCalloutStateFn = Proc(RDR_CALLOUT_STATE*, Void)
  alias I_RpcProxyGetClientSessionAndResourceUUID = Proc(Void*, Int32*, Guid*, Int32*, Guid*, RPC_STATUS)
  alias I_RpcProxyFilterIfFn = Proc(Void*, Guid*, UInt16, Int32*, RPC_STATUS)
  alias I_RpcProxyUpdatePerfCounterFn = Proc(RpcProxyPerfCounters, Int32, UInt32, Void)
  alias I_RpcProxyUpdatePerfCounterBackendServerFn = Proc(UInt16*, Int32, Void)
  alias PFN_RPCNOTIFICATION_ROUTINE = Proc(RPC_ASYNC_STATE*, Void*, RPC_ASYNC_EVENT, Void)
  alias NDR_RUNDOWN = Proc(Void*, Void)
  alias NDR_NOTIFY_ROUTINE = Proc(Void)
  alias NDR_NOTIFY2_ROUTINE = Proc(UInt8, Void)
  alias EXPR_EVAL = Proc(MIDL_STUB_MESSAGE*, Void)
  alias GENERIC_BINDING_ROUTINE = Proc(Void*, Void*)
  alias GENERIC_UNBIND_ROUTINE = Proc(Void*, UInt8*, Void)
  alias XMIT_HELPER_ROUTINE = Proc(MIDL_STUB_MESSAGE*, Void)
  alias USER_MARSHAL_SIZING_ROUTINE = Proc(UInt32*, UInt32, Void*, UInt32)
  alias USER_MARSHAL_MARSHALLING_ROUTINE = Proc(UInt32*, UInt8*, Void*, UInt8*)
  alias USER_MARSHAL_UNMARSHALLING_ROUTINE = Proc(UInt32*, UInt8*, Void*, UInt8*)
  alias USER_MARSHAL_FREEING_ROUTINE = Proc(UInt32*, Void*, Void)
  alias CS_TYPE_NET_SIZE_ROUTINE = Proc(Void*, UInt32, UInt32, IDL_CS_CONVERT*, UInt32*, UInt32*, Void)
  alias CS_TYPE_LOCAL_SIZE_ROUTINE = Proc(Void*, UInt32, UInt32, IDL_CS_CONVERT*, UInt32*, UInt32*, Void)
  alias CS_TYPE_TO_NETCS_ROUTINE = Proc(Void*, UInt32, Void*, UInt32, UInt8*, UInt32*, UInt32*, Void)
  alias CS_TYPE_FROM_NETCS_ROUTINE = Proc(Void*, UInt32, UInt8*, UInt32, UInt32, Void*, UInt32*, UInt32*, Void)
  alias CS_TAG_GETTING_ROUTINE = Proc(Void*, Int32, UInt32*, UInt32*, UInt32*, UInt32*, Void)
  alias STUB_THUNK = Proc(MIDL_STUB_MESSAGE*, Void)
  alias SERVER_ROUTINE = Proc(Int32)
  alias RPC_CLIENT_ALLOC = Proc(LibC::UINT_PTR, Void*)
  alias RPC_CLIENT_FREE = Proc(Void*, Void)
  alias MIDL_ES_ALLOC = Proc(Void*, Int8**, UInt32*, Void)
  alias MIDL_ES_WRITE = Proc(Void*, PSTR, UInt32, Void)
  alias MIDL_ES_READ = Proc(Void*, Int8**, UInt32*, Void)


  enum RPC_C_QOS_CAPABILITIES : UInt32
    RPC_C_QOS_CAPABILITIES_DEFAULT = 0
    RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH = 1
    RPC_C_QOS_CAPABILITIES_MAKE_FULLSIC = 2
    RPC_C_QOS_CAPABILITIES_ANY_AUTHORITY = 4
    RPC_C_QOS_CAPABILITIES_IGNORE_DELEGATE_FAILURE = 8
    RPC_C_QOS_CAPABILITIES_LOCAL_MA_HINT = 16
    RPC_C_QOS_CAPABILITIES_SCHANNEL_FULL_AUTH_IDENTITY = 32
  end

  enum RPC_C_QOS_IDENTITY : UInt32
    RPC_C_QOS_IDENTITY_STATIC = 0
    RPC_C_QOS_IDENTITY_DYNAMIC = 1
  end

  enum RPC_C_AUTHN_INFO_TYPE : UInt32
    RPC_C_AUTHN_INFO_NONE = 0
    RPC_C_AUTHN_INFO_TYPE_HTTP = 1
  end

  enum RPC_C_HTTP_FLAGS : UInt32
    RPC_C_HTTP_FLAG_USE_SSL = 1
    RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME = 2
    RPC_C_HTTP_FLAG_IGNORE_CERT_CN_INVALID = 8
    RPC_C_HTTP_FLAG_ENABLE_CERT_REVOCATION_CHECK = 16
  end

  enum RPC_C_HTTP_AUTHN_TARGET : UInt32
    RPC_C_HTTP_AUTHN_TARGET_SERVER = 1
    RPC_C_HTTP_AUTHN_TARGET_PROXY = 2
  end

  enum RPC_STATUS : Int32
    RPC_S_INVALID_STRING_BINDING = 1700
    RPC_S_WRONG_KIND_OF_BINDING = 1701
    RPC_S_INVALID_BINDING = 1702
    RPC_S_PROTSEQ_NOT_SUPPORTED = 1703
    RPC_S_INVALID_RPC_PROTSEQ = 1704
    RPC_S_INVALID_STRING_UUID = 1705
    RPC_S_INVALID_ENDPOINT_FORMAT = 1706
    RPC_S_INVALID_NET_ADDR = 1707
    RPC_S_NO_ENDPOINT_FOUND = 1708
    RPC_S_INVALID_TIMEOUT = 1709
    RPC_S_OBJECT_NOT_FOUND = 1710
    RPC_S_ALREADY_REGISTERED = 1711
    RPC_S_TYPE_ALREADY_REGISTERED = 1712
    RPC_S_ALREADY_LISTENING = 1713
    RPC_S_NO_PROTSEQS_REGISTERED = 1714
    RPC_S_NOT_LISTENING = 1715
    RPC_S_UNKNOWN_MGR_TYPE = 1716
    RPC_S_UNKNOWN_IF = 1717
    RPC_S_NO_BINDINGS = 1718
    RPC_S_NO_PROTSEQS = 1719
    RPC_S_CANT_CREATE_ENDPOINT = 1720
    RPC_S_OUT_OF_RESOURCES = 1721
    RPC_S_SERVER_UNAVAILABLE = 1722
    RPC_S_SERVER_TOO_BUSY = 1723
    RPC_S_INVALID_NETWORK_OPTIONS = 1724
    RPC_S_NO_CALL_ACTIVE = 1725
    RPC_S_CALL_FAILED = 1726
    RPC_S_CALL_FAILED_DNE = 1727
    RPC_S_PROTOCOL_ERROR = 1728
    RPC_S_PROXY_ACCESS_DENIED = 1729
    RPC_S_UNSUPPORTED_TRANS_SYN = 1730
    RPC_S_UNSUPPORTED_TYPE = 1732
    RPC_S_INVALID_TAG = 1733
    RPC_S_INVALID_BOUND = 1734
    RPC_S_NO_ENTRY_NAME = 1735
    RPC_S_INVALID_NAME_SYNTAX = 1736
    RPC_S_UNSUPPORTED_NAME_SYNTAX = 1737
    RPC_S_UUID_NO_ADDRESS = 1739
    RPC_S_DUPLICATE_ENDPOINT = 1740
    RPC_S_UNKNOWN_AUTHN_TYPE = 1741
    RPC_S_MAX_CALLS_TOO_SMALL = 1742
    RPC_S_STRING_TOO_LONG = 1743
    RPC_S_PROTSEQ_NOT_FOUND = 1744
    RPC_S_PROCNUM_OUT_OF_RANGE = 1745
    RPC_S_BINDING_HAS_NO_AUTH = 1746
    RPC_S_UNKNOWN_AUTHN_SERVICE = 1747
    RPC_S_UNKNOWN_AUTHN_LEVEL = 1748
    RPC_S_INVALID_AUTH_IDENTITY = 1749
    RPC_S_UNKNOWN_AUTHZ_SERVICE = 1750
    EPT_S_INVALID_ENTRY = 1751
    EPT_S_CANT_PERFORM_OP = 1752
    EPT_S_NOT_REGISTERED = 1753
    RPC_S_NOTHING_TO_EXPORT = 1754
    RPC_S_INCOMPLETE_NAME = 1755
    RPC_S_INVALID_VERS_OPTION = 1756
    RPC_S_NO_MORE_MEMBERS = 1757
    RPC_S_NOT_ALL_OBJS_UNEXPORTED = 1758
    RPC_S_INTERFACE_NOT_FOUND = 1759
    RPC_S_ENTRY_ALREADY_EXISTS = 1760
    RPC_S_ENTRY_NOT_FOUND = 1761
    RPC_S_NAME_SERVICE_UNAVAILABLE = 1762
    RPC_S_INVALID_NAF_ID = 1763
    RPC_S_CANNOT_SUPPORT = 1764
    RPC_S_NO_CONTEXT_AVAILABLE = 1765
    RPC_S_INTERNAL_ERROR = 1766
    RPC_S_ZERO_DIVIDE = 1767
    RPC_S_ADDRESS_ERROR = 1768
    RPC_S_FP_DIV_ZERO = 1769
    RPC_S_FP_UNDERFLOW = 1770
    RPC_S_FP_OVERFLOW = 1771
    RPC_S_CALL_IN_PROGRESS = 1791
    RPC_S_NO_MORE_BINDINGS = 1806
    RPC_S_NO_INTERFACES = 1817
    RPC_S_CALL_CANCELLED = 1818
    RPC_S_BINDING_INCOMPLETE = 1819
    RPC_S_COMM_FAILURE = 1820
    RPC_S_UNSUPPORTED_AUTHN_LEVEL = 1821
    RPC_S_NO_PRINC_NAME = 1822
    RPC_S_NOT_RPC_ERROR = 1823
    RPC_S_UUID_LOCAL_ONLY = 1824
    RPC_S_SEC_PKG_ERROR = 1825
    RPC_S_NOT_CANCELLED = 1826
    RPC_S_COOKIE_AUTH_FAILED = 1833
    RPC_S_DO_NOT_DISTURB = 1834
    RPC_S_SYSTEM_HANDLE_COUNT_EXCEEDED = 1835
    RPC_S_SYSTEM_HANDLE_TYPE_MISMATCH = 1836
    RPC_S_GROUP_MEMBER_NOT_FOUND = 1898
    EPT_S_CANT_CREATE = 1899
    RPC_S_INVALID_OBJECT = 1900
    RPC_S_SEND_INCOMPLETE = 1913
    RPC_S_INVALID_ASYNC_HANDLE = 1914
    RPC_S_INVALID_ASYNC_CALL = 1915
    RPC_S_ENTRY_TYPE_MISMATCH = 1922
    RPC_S_NOT_ALL_OBJS_EXPORTED = 1923
    RPC_S_INTERFACE_NOT_EXPORTED = 1924
    RPC_S_PROFILE_NOT_ADDED = 1925
    RPC_S_PRF_ELT_NOT_ADDED = 1926
    RPC_S_PRF_ELT_NOT_REMOVED = 1927
    RPC_S_GRP_ELT_NOT_ADDED = 1928
    RPC_S_GRP_ELT_NOT_REMOVED = 1929
  end

  enum GROUP_NAME_SYNTAX : UInt32
    RPC_C_NS_SYNTAX_DEFAULT = 0
    RPC_C_NS_SYNTAX_DCE = 3
  end

  enum SEC_WINNT_AUTH_IDENTITY : UInt32
    SEC_WINNT_AUTH_IDENTITY_ANSI = 1
    SEC_WINNT_AUTH_IDENTITY_UNICODE = 2
  end

  enum RPC_BINDING_HANDLE_OPTIONS_FLAGS : UInt32
    RPC_BHO_NONCAUSAL = 1
    RPC_BHO_DONTLINGER = 2
  end

  enum RPC_HTTP_REDIRECTOR_STAGE : Int32
    RPCHTTP_RS_REDIRECT = 1
    RPCHTTP_RS_ACCESS_1 = 2
    RPCHTTP_RS_SESSION = 3
    RPCHTTP_RS_ACCESS_2 = 4
    RPCHTTP_RS_INTERFACE = 5
  end

  enum RPC_ADDRESS_CHANGE_TYPE : Int32
    PROTOCOL_NOT_LOADED = 1
    PROTOCOL_LOADED = 2
    PROTOCOL_ADDRESS_CHANGE = 3
  end

  enum LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION : Int32
    MarshalDirectionMarshal = 0
    MarshalDirectionUnmarshal = 1
  end

  enum RpcProxyPerfCounters : Int32
    RpcCurrentUniqueUser = 1
    RpcBackEndConnectionAttempts = 2
    RpcBackEndConnectionFailed = 3
    RpcRequestsPerSecond = 4
    RpcIncomingConnections = 5
    RpcIncomingBandwidth = 6
    RpcOutgoingBandwidth = 7
    RpcAttemptedLbsDecisions = 8
    RpcFailedLbsDecisions = 9
    RpcAttemptedLbsMessages = 10
    RpcFailedLbsMessages = 11
    RpcLastCounter = 12
  end

  enum RPC_NOTIFICATION_TYPES : Int32
    RpcNotificationTypeNone = 0
    RpcNotificationTypeEvent = 1
    RpcNotificationTypeApc = 2
    RpcNotificationTypeIoc = 3
    RpcNotificationTypeHwnd = 4
    RpcNotificationTypeCallback = 5
  end

  enum RPC_ASYNC_EVENT : Int32
    RpcCallComplete = 0
    RpcSendComplete = 1
    RpcReceiveComplete = 2
    RpcClientDisconnect = 3
    RpcClientCancel = 4
  end

  enum ExtendedErrorParamTypes : Int32
    Eeptansistring = 1
    Eeptunicodestring = 2
    Eeptlongval = 3
    Eeptshortval = 4
    Eeptpointerval = 5
    Eeptnone = 6
    Eeptbinary = 7
  end

  enum RpcLocalAddressFormat : Int32
    Rlafinvalid = 0
    Rlafipv4 = 1
    Rlafipv6 = 2
  end

  enum RpcCallType : Int32
    Rctinvalid = 0
    Rctnormal = 1
    Rcttraining = 2
    Rctguaranteed = 3
  end

  enum RpcCallClientLocality : Int32
    Rcclinvalid = 0
    Rccllocal = 1
    Rcclremote = 2
    Rcclclientunknownlocality = 3
  end

  enum RPC_NOTIFICATIONS : Int32
    RpcNotificationCallNone = 0
    RpcNotificationClientDisconnect = 1
    RpcNotificationCallCancel = 2
  end

  enum USER_MARSHAL_CB_TYPE : Int32
    USER_MARSHAL_CB_BUFFER_SIZE = 0
    USER_MARSHAL_CB_MARSHALL = 1
    USER_MARSHAL_CB_UNMARSHALL = 2
    USER_MARSHAL_CB_FREE = 3
  end

  enum IDL_CS_CONVERT : Int32
    IDL_CS_NO_CONVERT = 0
    IDL_CS_IN_PLACE_CONVERT = 1
    IDL_CS_NEW_BUFFER_CONVERT = 2
  end

  enum XLAT_SIDE : Int32
    XLAT_SERVER = 1
    XLAT_CLIENT = 2
  end

  enum System_handle_t : Int32
    SYSTEM_HANDLE_FILE = 0
    SYSTEM_HANDLE_SEMAPHORE = 1
    SYSTEM_HANDLE_EVENT = 2
    SYSTEM_HANDLE_MUTEX = 3
    SYSTEM_HANDLE_PROCESS = 4
    SYSTEM_HANDLE_TOKEN = 5
    SYSTEM_HANDLE_SECTION = 6
    SYSTEM_HANDLE_REG_KEY = 7
    SYSTEM_HANDLE_THREAD = 8
    SYSTEM_HANDLE_COMPOSITION_OBJECT = 9
    SYSTEM_HANDLE_SOCKET = 10
    SYSTEM_HANDLE_JOB = 11
    SYSTEM_HANDLE_PIPE = 12
    SYSTEM_HANDLE_MAX = 12
    SYSTEM_HANDLE_INVALID = 255
  end

  enum STUB_PHASE : Int32
    STUB_UNMARSHAL = 0
    STUB_CALL_SERVER = 1
    STUB_MARSHAL = 2
    STUB_CALL_SERVER_NO_HRESULT = 3
  end

  enum PROXY_PHASE : Int32
    PROXY_CALCSIZE = 0
    PROXY_GETBUFFER = 1
    PROXY_MARSHAL = 2
    PROXY_SENDRECEIVE = 3
    PROXY_UNMARSHAL = 4
  end

  enum MIDL_ES_CODE : Int32
    MES_ENCODE = 0
    MES_DECODE = 1
    MES_ENCODE_NDR64 = 2
  end

  enum MIDL_ES_HANDLE_STYLE : Int32
    MES_INCREMENTAL_HANDLE = 0
    MES_FIXED_BUFFER_HANDLE = 1
    MES_DYNAMIC_BUFFER_HANDLE = 2
  end

  enum EXPR_TOKEN : Int32
    FC_EXPR_START = 0
    FC_EXPR_ILLEGAL = 0
    FC_EXPR_CONST32 = 1
    FC_EXPR_CONST64 = 2
    FC_EXPR_VAR = 3
    FC_EXPR_OPER = 4
    FC_EXPR_NOOP = 5
    FC_EXPR_END = 6
  end

union RPC_SECURITY_QOS_V2_W_u_e__Union
  http_credentials : RPC_HTTP_TRANSPORT_CREDENTIALS_W*
end
union RPC_SECURITY_QOS_V2_A_u_e__Union
  http_credentials : RPC_HTTP_TRANSPORT_CREDENTIALS_A*
end
union RPC_SECURITY_QOS_V3_W_u_e__Union
  http_credentials : RPC_HTTP_TRANSPORT_CREDENTIALS_W*
end
union RPC_SECURITY_QOS_V3_A_u_e__Union
  http_credentials : RPC_HTTP_TRANSPORT_CREDENTIALS_A*
end
union RPC_SECURITY_QOS_V4_W_u_e__Union
  http_credentials : RPC_HTTP_TRANSPORT_CREDENTIALS_W*
end
union RPC_SECURITY_QOS_V4_A_u_e__Union
  http_credentials : RPC_HTTP_TRANSPORT_CREDENTIALS_A*
end
union RPC_SECURITY_QOS_V5_W_u_e__Union
  http_credentials : RPC_HTTP_TRANSPORT_CREDENTIALS_W*
end
union RPC_SECURITY_QOS_V5_A_u_e__Union
  http_credentials : RPC_HTTP_TRANSPORT_CREDENTIALS_A*
end
union RPC_BINDING_HANDLE_TEMPLATE_V1_W_u1_e__Union
  reserved : UInt16*
end
union RPC_BINDING_HANDLE_TEMPLATE_V1_A_u1_e__Union
  reserved : UInt8*
end
union RPC_ASYNC_NOTIFICATION_INFO
  apc : RPC_ASYNC_NOTIFICATION_INFO_APC_e__Struct
  ioc : RPC_ASYNC_NOTIFICATION_INFO_IOC_e__Struct
  int_ptr : RPC_ASYNC_NOTIFICATION_INFO_IntPtr_e__Struct
  h_event : LibC::HANDLE
  notification_routine : PFN_RPCNOTIFICATION_ROUTINE
end
union RPC_EE_INFO_PARAM_u_e__Union
  ansi_string : PSTR
  unicode_string : LibC::LPWSTR
  l_val : Int32
  s_val : Int16
  p_val : UInt64
  b_val : BinaryParam
end
union RPC_EXTENDED_ERROR_INFO_u_e__Union
  system_time : SYSTEMTIME
  file_time : FILETIME
end
union MIDL_STUB_DESC_IMPLICIT_HANDLE_INFO_e__Union
  p_auto_handle : Void**
  p_primitive_handle : Void**
  p_generic_binding_info : GENERIC_BINDING_INFO*
end
union CLIENT_CALL_RETURN
  pointer : Void*
  simple : LibC::IntPtrT
end
union NDR_USER_MARSHAL_INFO_Anonymous_e__Union
  level1 : NDR_USER_MARSHAL_INFO_LEVEL1
end
union NDR64_BINDINGS
  primitive : NDR64_BIND_PRIMITIVE
  generic : NDR64_BIND_GENERIC
  context : NDR64_BIND_CONTEXT
end

  struct NDR_SCONTEXT_1
    pad : Void[2]**
    user_context : Void*
  end
  struct RPC_BINDING_VECTOR
    count : UInt32
    binding_h : Void[0]**
  end
  struct UUID_VECTOR
    count : UInt32
    uuid : Guid[0]**
  end
  struct RPC_IF_ID
    uuid : Guid
    vers_major : UInt16
    vers_minor : UInt16
  end
  struct RPC_PROTSEQ_VECTORA
    count : UInt32
    protseq : UInt8[0]**
  end
  struct RPC_PROTSEQ_VECTORW
    count : UInt32
    protseq : UInt16[0]**
  end
  struct RPC_POLICY
    length : UInt32
    endpoint_flags : UInt32
    nic_flags : UInt32
  end
  struct RPC_STATS_VECTOR
    count : UInt32
    stats : UInt32[0]*
  end
  struct RPC_IF_ID_VECTOR
    count : UInt32
    if_id : RPC_IF_ID[0]**
  end
  struct RPC_SECURITY_QOS
    version : UInt32
    capabilities : RPC_C_QOS_CAPABILITIES
    identity_tracking : RPC_C_QOS_IDENTITY
    impersonation_type : RPC_C_IMP_LEVEL
  end
  struct SEC_WINNT_AUTH_IDENTITY_W
    user : UInt16*
    user_length : UInt32
    domain : UInt16*
    domain_length : UInt32
    password : UInt16*
    password_length : UInt32
    flags : SEC_WINNT_AUTH_IDENTITY
  end
  struct SEC_WINNT_AUTH_IDENTITY_A
    user : UInt8*
    user_length : UInt32
    domain : UInt8*
    domain_length : UInt32
    password : UInt8*
    password_length : UInt32
    flags : SEC_WINNT_AUTH_IDENTITY
  end
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_W
    transport_credentials : SEC_WINNT_AUTH_IDENTITY_W*
    flags : RPC_C_HTTP_FLAGS
    authentication_target : RPC_C_HTTP_AUTHN_TARGET
    number_of_authn_schemes : UInt32
    authn_schemes : UInt32*
    server_certificate_subject : UInt16*
  end
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_A
    transport_credentials : SEC_WINNT_AUTH_IDENTITY_A*
    flags : RPC_C_HTTP_FLAGS
    authentication_target : RPC_C_HTTP_AUTHN_TARGET
    number_of_authn_schemes : UInt32
    authn_schemes : UInt32*
    server_certificate_subject : UInt8*
  end
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_V2_W
    transport_credentials : SEC_WINNT_AUTH_IDENTITY_W*
    flags : RPC_C_HTTP_FLAGS
    authentication_target : RPC_C_HTTP_AUTHN_TARGET
    number_of_authn_schemes : UInt32
    authn_schemes : UInt32*
    server_certificate_subject : UInt16*
    proxy_credentials : SEC_WINNT_AUTH_IDENTITY_W*
    number_of_proxy_authn_schemes : UInt32
    proxy_authn_schemes : UInt32*
  end
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_V2_A
    transport_credentials : SEC_WINNT_AUTH_IDENTITY_A*
    flags : RPC_C_HTTP_FLAGS
    authentication_target : RPC_C_HTTP_AUTHN_TARGET
    number_of_authn_schemes : UInt32
    authn_schemes : UInt32*
    server_certificate_subject : UInt8*
    proxy_credentials : SEC_WINNT_AUTH_IDENTITY_A*
    number_of_proxy_authn_schemes : UInt32
    proxy_authn_schemes : UInt32*
  end
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_V3_W
    transport_credentials : Void*
    flags : RPC_C_HTTP_FLAGS
    authentication_target : RPC_C_HTTP_AUTHN_TARGET
    number_of_authn_schemes : UInt32
    authn_schemes : UInt32*
    server_certificate_subject : UInt16*
    proxy_credentials : Void*
    number_of_proxy_authn_schemes : UInt32
    proxy_authn_schemes : UInt32*
  end
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_V3_A
    transport_credentials : Void*
    flags : RPC_C_HTTP_FLAGS
    authentication_target : RPC_C_HTTP_AUTHN_TARGET
    number_of_authn_schemes : UInt32
    authn_schemes : UInt32*
    server_certificate_subject : UInt8*
    proxy_credentials : Void*
    number_of_proxy_authn_schemes : UInt32
    proxy_authn_schemes : UInt32*
  end
  struct RPC_SECURITY_QOS_V2_W
    version : UInt32
    capabilities : RPC_C_QOS_CAPABILITIES
    identity_tracking : RPC_C_QOS_IDENTITY
    impersonation_type : RPC_C_IMP_LEVEL
    additional_security_info_type : RPC_C_AUTHN_INFO_TYPE
    u : RPC_SECURITY_QOS_V2_W_u_e__Union
  end
  struct RPC_SECURITY_QOS_V2_A
    version : UInt32
    capabilities : RPC_C_QOS_CAPABILITIES
    identity_tracking : RPC_C_QOS_IDENTITY
    impersonation_type : RPC_C_IMP_LEVEL
    additional_security_info_type : RPC_C_AUTHN_INFO_TYPE
    u : RPC_SECURITY_QOS_V2_A_u_e__Union
  end
  struct RPC_SECURITY_QOS_V3_W
    version : UInt32
    capabilities : RPC_C_QOS_CAPABILITIES
    identity_tracking : RPC_C_QOS_IDENTITY
    impersonation_type : RPC_C_IMP_LEVEL
    additional_security_info_type : RPC_C_AUTHN_INFO_TYPE
    u : RPC_SECURITY_QOS_V3_W_u_e__Union
    sid : Void*
  end
  struct RPC_SECURITY_QOS_V3_A
    version : UInt32
    capabilities : RPC_C_QOS_CAPABILITIES
    identity_tracking : RPC_C_QOS_IDENTITY
    impersonation_type : RPC_C_IMP_LEVEL
    additional_security_info_type : RPC_C_AUTHN_INFO_TYPE
    u : RPC_SECURITY_QOS_V3_A_u_e__Union
    sid : Void*
  end
  struct RPC_SECURITY_QOS_V4_W
    version : UInt32
    capabilities : RPC_C_QOS_CAPABILITIES
    identity_tracking : RPC_C_QOS_IDENTITY
    impersonation_type : RPC_C_IMP_LEVEL
    additional_security_info_type : RPC_C_AUTHN_INFO_TYPE
    u : RPC_SECURITY_QOS_V4_W_u_e__Union
    sid : Void*
    effective_only : UInt32
  end
  struct RPC_SECURITY_QOS_V4_A
    version : UInt32
    capabilities : RPC_C_QOS_CAPABILITIES
    identity_tracking : RPC_C_QOS_IDENTITY
    impersonation_type : RPC_C_IMP_LEVEL
    additional_security_info_type : RPC_C_AUTHN_INFO_TYPE
    u : RPC_SECURITY_QOS_V4_A_u_e__Union
    sid : Void*
    effective_only : UInt32
  end
  struct RPC_SECURITY_QOS_V5_W
    version : UInt32
    capabilities : RPC_C_QOS_CAPABILITIES
    identity_tracking : RPC_C_QOS_IDENTITY
    impersonation_type : RPC_C_IMP_LEVEL
    additional_security_info_type : RPC_C_AUTHN_INFO_TYPE
    u : RPC_SECURITY_QOS_V5_W_u_e__Union
    sid : Void*
    effective_only : UInt32
    server_security_descriptor : Void*
  end
  struct RPC_SECURITY_QOS_V5_A
    version : UInt32
    capabilities : RPC_C_QOS_CAPABILITIES
    identity_tracking : RPC_C_QOS_IDENTITY
    impersonation_type : RPC_C_IMP_LEVEL
    additional_security_info_type : RPC_C_AUTHN_INFO_TYPE
    u : RPC_SECURITY_QOS_V5_A_u_e__Union
    sid : Void*
    effective_only : UInt32
    server_security_descriptor : Void*
  end
  struct RPC_BINDING_HANDLE_TEMPLATE_V1_W
    version : UInt32
    flags : UInt32
    protocol_sequence : UInt32
    network_address : UInt16*
    string_endpoint : UInt16*
    u1 : RPC_BINDING_HANDLE_TEMPLATE_V1_W_u1_e__Union
    object_uuid : Guid
  end
  struct RPC_BINDING_HANDLE_TEMPLATE_V1_A
    version : UInt32
    flags : UInt32
    protocol_sequence : UInt32
    network_address : UInt8*
    string_endpoint : UInt8*
    u1 : RPC_BINDING_HANDLE_TEMPLATE_V1_A_u1_e__Union
    object_uuid : Guid
  end
  struct RPC_BINDING_HANDLE_SECURITY_V1_W
    version : UInt32
    server_princ_name : UInt16*
    authn_level : UInt32
    authn_svc : UInt32
    auth_identity : SEC_WINNT_AUTH_IDENTITY_W*
    security_qos : RPC_SECURITY_QOS*
  end
  struct RPC_BINDING_HANDLE_SECURITY_V1_A
    version : UInt32
    server_princ_name : UInt8*
    authn_level : UInt32
    authn_svc : UInt32
    auth_identity : SEC_WINNT_AUTH_IDENTITY_A*
    security_qos : RPC_SECURITY_QOS*
  end
  struct RPC_BINDING_HANDLE_OPTIONS_V1
    version : UInt32
    flags : RPC_BINDING_HANDLE_OPTIONS_FLAGS
    com_timeout : UInt32
    call_timeout : UInt32
  end
  struct RPC_CLIENT_INFORMATION1
    user_name : UInt8*
    computer_name : UInt8*
    privilege : UInt16
    auth_flags : UInt32
  end
  struct RPC_ENDPOINT_TEMPLATEW
    version : UInt32
    prot_seq : UInt16*
    endpoint : UInt16*
    security_descriptor : Void*
    backlog : UInt32
  end
  struct RPC_ENDPOINT_TEMPLATEA
    version : UInt32
    prot_seq : UInt8*
    endpoint : UInt8*
    security_descriptor : Void*
    backlog : UInt32
  end
  struct RPC_INTERFACE_TEMPLATEA
    version : UInt32
    if_spec : Void*
    mgr_type_uuid : Guid*
    mgr_epv : Void*
    flags : UInt32
    max_calls : UInt32
    max_rpc_size : UInt32
    if_callback : RPC_IF_CALLBACK_FN
    uuid_vector : UUID_VECTOR*
    annotation : UInt8*
    security_descriptor : Void*
  end
  struct RPC_INTERFACE_TEMPLATEW
    version : UInt32
    if_spec : Void*
    mgr_type_uuid : Guid*
    mgr_epv : Void*
    flags : UInt32
    max_calls : UInt32
    max_rpc_size : UInt32
    if_callback : RPC_IF_CALLBACK_FN
    uuid_vector : UUID_VECTOR*
    annotation : UInt16*
    security_descriptor : Void*
  end
  struct RPC_VERSION
    major_version : UInt16
    minor_version : UInt16
  end
  struct RPC_SYNTAX_IDENTIFIER
    syntax_guid : Guid
    syntax_version : RPC_VERSION
  end
  struct RPC_MESSAGE
    handle : Void*
    data_representation : UInt32
    buffer : Void*
    buffer_length : UInt32
    proc_num : UInt32
    transfer_syntax : RPC_SYNTAX_IDENTIFIER*
    rpc_interface_information : Void*
    reserved_for_runtime : Void*
    manager_epv : Void*
    import_context : Void*
    rpc_flags : UInt32
  end
  struct RPC_DISPATCH_TABLE
    dispatch_table_count : UInt32
    dispatch_table : RPC_DISPATCH_FUNCTION
    reserved : LibC::IntPtrT
  end
  struct RPC_PROTSEQ_ENDPOINT
    rpc_protocol_sequence : UInt8*
    endpoint : UInt8*
  end
  struct RPC_SERVER_INTERFACE
    length : UInt32
    interface_id : RPC_SYNTAX_IDENTIFIER
    transfer_syntax : RPC_SYNTAX_IDENTIFIER
    dispatch_table : RPC_DISPATCH_TABLE*
    rpc_protseq_endpoint_count : UInt32
    rpc_protseq_endpoint : RPC_PROTSEQ_ENDPOINT*
    default_manager_epv : Void*
    interpreter_info : Void*
    flags : UInt32
  end
  struct RPC_CLIENT_INTERFACE
    length : UInt32
    interface_id : RPC_SYNTAX_IDENTIFIER
    transfer_syntax : RPC_SYNTAX_IDENTIFIER
    dispatch_table : RPC_DISPATCH_TABLE*
    rpc_protseq_endpoint_count : UInt32
    rpc_protseq_endpoint : RPC_PROTSEQ_ENDPOINT*
    reserved : LibC::UINT_PTR
    interpreter_info : Void*
    flags : UInt32
  end
  struct RPC_SEC_CONTEXT_KEY_INFO
    encrypt_algorithm : UInt32
    key_size : UInt32
    signature_algorithm : UInt32
  end
  struct RPC_TRANSFER_SYNTAX
    uuid : Guid
    vers_major : UInt16
    vers_minor : UInt16
  end
  struct RPC_C_OPT_COOKIE_AUTH_DESCRIPTOR
    buffer_size : UInt32
    buffer : PSTR
  end
  struct RDR_CALLOUT_STATE
    last_error : RPC_STATUS
    last_ee_info : Void*
    last_called_stage : RPC_HTTP_REDIRECTOR_STAGE
    server_name : UInt16*
    server_port : UInt16*
    remote_user : UInt16*
    auth_type : UInt16*
    resource_type_present : UInt8
    session_id_present : UInt8
    interface_present : UInt8
    resource_type : Guid
    session_id : Guid
    interface : RPC_SYNTAX_IDENTIFIER
    cert_context : Void*
  end
  struct I_RpcProxyCallbackInterface
    is_valid_machine_fn : I_RpcProxyIsValidMachineFn
    get_client_address_fn : I_RpcProxyGetClientAddressFn
    get_connection_timeout_fn : I_RpcProxyGetConnectionTimeoutFn
    perform_callout_fn : I_RpcPerformCalloutFn
    free_callout_state_fn : I_RpcFreeCalloutStateFn
    get_client_session_and_resource_uuid_fn : I_RpcProxyGetClientSessionAndResourceUUID
    proxy_filter_if_fn : I_RpcProxyFilterIfFn
    rpc_proxy_update_perf_counter_fn : I_RpcProxyUpdatePerfCounterFn
    rpc_proxy_update_perf_counter_backend_server_fn : I_RpcProxyUpdatePerfCounterBackendServerFn
  end
  struct RPC_ASYNC_NOTIFICATION_INFO_IOC_e__Struct
    h_io_port : LibC::HANDLE
    dw_number_of_bytes_transferred : UInt32
    dw_completion_key : LibC::UINT_PTR
    lp_overlapped : OVERLAPPED*
  end
  struct RPC_ASYNC_NOTIFICATION_INFO_APC_e__Struct
    notification_routine : PFN_RPCNOTIFICATION_ROUTINE
    h_thread : LibC::HANDLE
  end
  struct RPC_ASYNC_NOTIFICATION_INFO_IntPtr_e__Struct
    h_wnd : HANDLE
    msg : UInt32
  end
  struct RPC_ASYNC_STATE
    size : UInt32
    signature : UInt32
    lock : Int32
    flags : UInt32
    stub_info : Void*
    user_info : Void*
    runtime_info : Void*
    event : RPC_ASYNC_EVENT
    notification_type : RPC_NOTIFICATION_TYPES
    u : RPC_ASYNC_NOTIFICATION_INFO
    reserved : LibC::IntPtrT[4]*
  end
  struct BinaryParam
    buffer : Void*
    size : Int16
  end
  struct RPC_EE_INFO_PARAM
    parameter_type : ExtendedErrorParamTypes
    u : RPC_EE_INFO_PARAM_u_e__Union
  end
  struct RPC_EXTENDED_ERROR_INFO
    version : UInt32
    computer_name : LibC::LPWSTR
    process_id : UInt32
    u : RPC_EXTENDED_ERROR_INFO_u_e__Union
    generating_component : UInt32
    status : UInt32
    detection_location : UInt16
    flags : UInt16
    number_of_parameters : Int32
    parameters : RPC_EE_INFO_PARAM[4]*
  end
  struct RPC_ERROR_ENUM_HANDLE
    signature : UInt32
    current_pos : Void*
    head : Void*
  end
  struct RPC_CALL_LOCAL_ADDRESS_V1
    version : UInt32
    buffer : Void*
    buffer_size : UInt32
    address_format : RpcLocalAddressFormat
  end
  struct RPC_CALL_ATTRIBUTES_V1_W
    version : UInt32
    flags : UInt32
    server_principal_name_buffer_length : UInt32
    server_principal_name : UInt16*
    client_principal_name_buffer_length : UInt32
    client_principal_name : UInt16*
    authentication_level : UInt32
    authentication_service : UInt32
    null_session : LibC::BOOL
  end
  struct RPC_CALL_ATTRIBUTES_V1_A
    version : UInt32
    flags : UInt32
    server_principal_name_buffer_length : UInt32
    server_principal_name : UInt8*
    client_principal_name_buffer_length : UInt32
    client_principal_name : UInt8*
    authentication_level : UInt32
    authentication_service : UInt32
    null_session : LibC::BOOL
  end
  struct RPC_CALL_ATTRIBUTES_V2_W
    version : UInt32
    flags : UInt32
    server_principal_name_buffer_length : UInt32
    server_principal_name : UInt16*
    client_principal_name_buffer_length : UInt32
    client_principal_name : UInt16*
    authentication_level : UInt32
    authentication_service : UInt32
    null_session : LibC::BOOL
    kernel_mode_caller : LibC::BOOL
    protocol_sequence : UInt32
    is_client_local : RpcCallClientLocality
    client_pid : LibC::HANDLE
    call_status : UInt32
    call_type : RpcCallType
    call_local_address : RPC_CALL_LOCAL_ADDRESS_V1*
    op_num : UInt16
    interface_uuid : Guid
  end
  struct RPC_CALL_ATTRIBUTES_V2_A
    version : UInt32
    flags : UInt32
    server_principal_name_buffer_length : UInt32
    server_principal_name : UInt8*
    client_principal_name_buffer_length : UInt32
    client_principal_name : UInt8*
    authentication_level : UInt32
    authentication_service : UInt32
    null_session : LibC::BOOL
    kernel_mode_caller : LibC::BOOL
    protocol_sequence : UInt32
    is_client_local : UInt32
    client_pid : LibC::HANDLE
    call_status : UInt32
    call_type : RpcCallType
    call_local_address : RPC_CALL_LOCAL_ADDRESS_V1*
    op_num : UInt16
    interface_uuid : Guid
  end
  struct RPC_CALL_ATTRIBUTES_V3_W
    version : UInt32
    flags : UInt32
    server_principal_name_buffer_length : UInt32
    server_principal_name : UInt16*
    client_principal_name_buffer_length : UInt32
    client_principal_name : UInt16*
    authentication_level : UInt32
    authentication_service : UInt32
    null_session : LibC::BOOL
    kernel_mode_caller : LibC::BOOL
    protocol_sequence : UInt32
    is_client_local : RpcCallClientLocality
    client_pid : LibC::HANDLE
    call_status : UInt32
    call_type : RpcCallType
    call_local_address : RPC_CALL_LOCAL_ADDRESS_V1*
    op_num : UInt16
    interface_uuid : Guid
    client_identifier_buffer_length : UInt32
    client_identifier : UInt8*
  end
  struct RPC_CALL_ATTRIBUTES_V3_A
    version : UInt32
    flags : UInt32
    server_principal_name_buffer_length : UInt32
    server_principal_name : UInt8*
    client_principal_name_buffer_length : UInt32
    client_principal_name : UInt8*
    authentication_level : UInt32
    authentication_service : UInt32
    null_session : LibC::BOOL
    kernel_mode_caller : LibC::BOOL
    protocol_sequence : UInt32
    is_client_local : UInt32
    client_pid : LibC::HANDLE
    call_status : UInt32
    call_type : RpcCallType
    call_local_address : RPC_CALL_LOCAL_ADDRESS_V1*
    op_num : UInt16
    interface_uuid : Guid
    client_identifier_buffer_length : UInt32
    client_identifier : UInt8*
  end
  struct RPC_IMPORT_CONTEXT_P
    lookup_context : Void*
    proposed_handle : Void*
    bindings : RPC_BINDING_VECTOR*
  end
  struct NDR_SCONTEXT
    pad : Void[2]**
    user_context : Void*
  end
  struct SCONTEXT_QUEUE
    number_of_objects : UInt32
    array_of_objects : NDR_SCONTEXT_1**
  end
  struct ARRAY_INFO
    dimension : Int32
    buffer_conformance_mark : UInt32*
    buffer_variance_mark : UInt32*
    max_count_array : UInt32*
    offset_array : UInt32*
    actual_count_array : UInt32*
  end
  struct MIDL_STUB_MESSAGE
    rpc_msg : RPC_MESSAGE*
    buffer : UInt8*
    buffer_start : UInt8*
    buffer_end : UInt8*
    buffer_mark : UInt8*
    buffer_length : UInt32
    memory_size : UInt32
    memory : UInt8*
    is_client : UInt8
    pad : UInt8
    u_flags2 : UInt16
    reuse_buffer : Int32
    p_alloc_all_nodes_context : NDR_ALLOC_ALL_NODES_CONTEXT*
    p_pointer_queue_state : NDR_POINTER_QUEUE_STATE*
    ignore_embedded_pointers : Int32
    pointer_buffer_mark : UInt8*
    corr_desp_increment : UInt8
    u_flags : UInt8
    unique_ptr_count : UInt16
    max_count : LibC::UINT_PTR
    offset : UInt32
    actual_count : UInt32
    pfn_allocate : LibC::IntPtrT
    pfn_free : LibC::IntPtrT
    stack_top : UInt8*
    p_presented_type : UInt8*
    p_transmit_type : UInt8*
    saved_handle : Void*
    stub_desc : MIDL_STUB_DESC*
    full_ptr_xlat_tables : FULL_PTR_XLAT_TABLES*
    full_ptr_ref_id : UInt32
    pointer_length : UInt32
    _bitfield : Int32
    dw_dest_context : UInt32
    pv_dest_context : Void*
    saved_context_handles : NDR_SCONTEXT_1**
    param_number : Int32
    p_rpc_channel_buffer : IRpcChannelBuffer
    p_array_info : ARRAY_INFO*
    size_ptr_count_array : UInt32*
    size_ptr_offset_array : UInt32*
    size_ptr_length_array : UInt32*
    p_arg_queue : Void*
    dw_stub_phase : UInt32
    low_stack_mark : Void*
    p_async_msg : NDR_ASYNC_MESSAGE*
    p_corr_info : NDR_CORRELATION_INFO*
    p_corr_memory : UInt8*
    p_memory_list : Void*
    p_cs_info : LibC::IntPtrT
    conformance_mark : UInt8*
    variance_mark : UInt8*
    unused : LibC::IntPtrT
    p_context : NDR_PROC_CONTEXT*
    context_handle_hash : Void*
    p_user_marshal_list : Void*
    reserved51_3 : LibC::IntPtrT
    reserved51_4 : LibC::IntPtrT
    reserved51_5 : LibC::IntPtrT
  end
  struct GENERIC_BINDING_ROUTINE_PAIR
    pfn_bind : GENERIC_BINDING_ROUTINE
    pfn_unbind : GENERIC_UNBIND_ROUTINE
  end
  struct GENERIC_BINDING_INFO
    p_obj : Void*
    size : UInt32
    pfn_bind : GENERIC_BINDING_ROUTINE
    pfn_unbind : GENERIC_UNBIND_ROUTINE
  end
  struct XMIT_ROUTINE_QUINTUPLE
    pfn_translate_to_xmit : XMIT_HELPER_ROUTINE
    pfn_translate_from_xmit : XMIT_HELPER_ROUTINE
    pfn_free_xmit : XMIT_HELPER_ROUTINE
    pfn_free_inst : XMIT_HELPER_ROUTINE
  end
  struct USER_MARSHAL_ROUTINE_QUADRUPLE
    pfn_buffer_size : USER_MARSHAL_SIZING_ROUTINE
    pfn_marshall : USER_MARSHAL_MARSHALLING_ROUTINE
    pfn_unmarshall : USER_MARSHAL_UNMARSHALLING_ROUTINE
    pfn_free : USER_MARSHAL_FREEING_ROUTINE
  end
  struct USER_MARSHAL_CB
    flags : UInt32
    p_stub_msg : MIDL_STUB_MESSAGE*
    p_reserve : UInt8*
    signature : UInt32
    cb_type : USER_MARSHAL_CB_TYPE
    p_format : UInt8*
    p_type_format : UInt8*
  end
  struct MALLOC_FREE_STRUCT
    pfn_allocate : LibC::IntPtrT
    pfn_free : LibC::IntPtrT
  end
  struct COMM_FAULT_OFFSETS
    comm_offset : Int16
    fault_offset : Int16
  end
  struct NDR_CS_SIZE_CONVERT_ROUTINES
    pfn_net_size : CS_TYPE_NET_SIZE_ROUTINE
    pfn_to_net_cs : CS_TYPE_TO_NETCS_ROUTINE
    pfn_local_size : CS_TYPE_LOCAL_SIZE_ROUTINE
    pfn_from_net_cs : CS_TYPE_FROM_NETCS_ROUTINE
  end
  struct NDR_CS_ROUTINES
    p_size_convert_routines : NDR_CS_SIZE_CONVERT_ROUTINES*
    p_tag_getting_routines : CS_TAG_GETTING_ROUTINE*
  end
  struct NDR_EXPR_DESC
    p_offset : UInt16*
    p_format_expr : UInt8*
  end
  struct MIDL_STUB_DESC
    rpc_interface_information : Void*
    pfn_allocate : LibC::IntPtrT
    pfn_free : LibC::IntPtrT
    implicit_handle_info : MIDL_STUB_DESC_IMPLICIT_HANDLE_INFO_e__Union
    apfn_ndr_rundown_routines : NDR_RUNDOWN*
    a_generic_binding_routine_pairs : GENERIC_BINDING_ROUTINE_PAIR*
    apfn_expr_eval : EXPR_EVAL*
    a_xmit_quintuple : XMIT_ROUTINE_QUINTUPLE*
    p_format_types : UInt8*
    f_check_bounds : Int32
    version : UInt32
    p_malloc_free_struct : MALLOC_FREE_STRUCT*
    midl_version : Int32
    comm_fault_offsets : COMM_FAULT_OFFSETS*
    a_user_marshal_quadruple : USER_MARSHAL_ROUTINE_QUADRUPLE*
    notify_routine_table : NDR_NOTIFY_ROUTINE*
    m_flags : LibC::UINT_PTR
    cs_routine_tables : NDR_CS_ROUTINES*
    proxy_server_info : Void*
    p_expr_info : NDR_EXPR_DESC*
  end
  struct MIDL_FORMAT_STRING
    pad : Int16
    format : UInt8[0]*
  end
  struct MIDL_METHOD_PROPERTY
    id : UInt32
    value : LibC::UINT_PTR
  end
  struct MIDL_METHOD_PROPERTY_MAP
    count : UInt32
    properties : MIDL_METHOD_PROPERTY*
  end
  struct MIDL_INTERFACE_METHOD_PROPERTIES
    method_count : UInt16
    method_properties : MIDL_METHOD_PROPERTY_MAP**
  end
  struct MIDL_SERVER_INFO
    p_stub_desc : MIDL_STUB_DESC*
    dispatch_table : SERVER_ROUTINE*
    proc_string : UInt8*
    fmt_string_offset : UInt16*
    thunk_table : STUB_THUNK*
    p_transfer_syntax : RPC_SYNTAX_IDENTIFIER*
    n_count : LibC::UINT_PTR
    p_syntax_info : MIDL_SYNTAX_INFO*
  end
  struct MIDL_STUBLESS_PROXY_INFO
    p_stub_desc : MIDL_STUB_DESC*
    proc_format_string : UInt8*
    format_string_offset : UInt16*
    p_transfer_syntax : RPC_SYNTAX_IDENTIFIER*
    n_count : LibC::UINT_PTR
    p_syntax_info : MIDL_SYNTAX_INFO*
  end
  struct MIDL_SYNTAX_INFO
    transfer_syntax : RPC_SYNTAX_IDENTIFIER
    dispatch_table : RPC_DISPATCH_TABLE*
    proc_string : UInt8*
    fmt_string_offset : UInt16*
    type_string : UInt8*
    a_user_marshal_quadruple : Void*
    p_method_properties : MIDL_INTERFACE_METHOD_PROPERTIES*
    p_reserved2 : LibC::UINT_PTR
  end
  struct FULL_PTR_XLAT_TABLES
    ref_id_to_pointer : Void*
    pointer_to_ref_id : Void*
    next_ref_id : UInt32
    xlat_side : XLAT_SIDE
  end
  struct MIDL_INTERCEPTION_INFO
    version : UInt32
    proc_string : UInt8*
    proc_format_offset_table : UInt16*
    proc_count : UInt32
    type_string : UInt8*
  end
  struct MIDL_WINRT_TYPE_SERIALIZATION_INFO
    version : UInt32
    type_format_string : UInt8*
    format_string_size : UInt16
    type_offset : UInt16
    stub_desc : MIDL_STUB_DESC*
  end
  struct NDR_USER_MARSHAL_INFO_LEVEL1
    buffer : Void*
    buffer_size : UInt32
    pfn_allocate : LibC::IntPtrT
    pfn_free : LibC::IntPtrT
    p_rpc_channel_buffer : IRpcChannelBuffer
    reserved : LibC::UINT_PTR[5]*
  end
  struct NDR_USER_MARSHAL_INFO
    information_level : UInt32
    anonymous : NDR_USER_MARSHAL_INFO_Anonymous_e__Union
  end
  struct MIDL_TYPE_PICKLING_INFO
    version : UInt32
    flags : UInt32
    reserved : LibC::UINT_PTR[3]*
  end
  struct NDR64_PROC_FLAGS
    _bitfield : UInt32
  end
  struct NDR64_RPC_FLAGS
    _bitfield : UInt16
  end
  struct NDR64_PROC_FORMAT
    flags : UInt32
    stack_size : UInt32
    constant_client_buffer_size : UInt32
    constant_server_buffer_size : UInt32
    rpc_flags : UInt16
    float_double_mask : UInt16
    number_of_params : UInt16
    extension_size : UInt16
  end
  struct NDR64_PARAM_FLAGS
    _bitfield : UInt16
  end
  struct NDR64_PARAM_FORMAT
    type : Void*
    attributes : NDR64_PARAM_FLAGS
    reserved : UInt16
    stack_offset : UInt32
  end
  struct NDR64_RANGE_FORMAT
    format_code : UInt8
    range_type : UInt8
    reserved : UInt16
    min_value : Int64
    max_value : Int64
  end
  struct NDR64_CONTEXT_HANDLE_FLAGS
    _bitfield : UInt8
  end
  struct NDR64_CONTEXT_HANDLE_FORMAT
    format_code : UInt8
    context_flags : UInt8
    rundown_routine_index : UInt8
    ordinal : UInt8
  end
  struct NDR64_BIND_PRIMITIVE
    handle_type : UInt8
    flags : UInt8
    stack_offset : UInt16
    reserved : UInt16
  end
  struct NDR64_BIND_GENERIC
    handle_type : UInt8
    flags : UInt8
    stack_offset : UInt16
    routine_index : UInt8
    size : UInt8
  end
  struct NDR64_BIND_CONTEXT
    handle_type : UInt8
    flags : UInt8
    stack_offset : UInt16
    routine_index : UInt8
    ordinal : UInt8
  end
  struct NDR64_BIND_AND_NOTIFY_EXTENSION
    binding : NDR64_BIND_CONTEXT
    notify_index : UInt16
  end
  struct NDR64_SYSTEM_HANDLE_FORMAT
    format_code : UInt8
    handle_type : UInt8
    desired_access : UInt32
  end
  struct NDR64_POINTER_FORMAT
    format_code : UInt8
    flags : UInt8
    reserved : UInt16
    pointee : Void*
  end
  struct NDR64_NO_REPEAT_FORMAT
    format_code : UInt8
    flags : UInt8
    reserved1 : UInt16
    reserved2 : UInt32
  end
  struct NDR64_POINTER_INSTANCE_HEADER_FORMAT
    offset : UInt32
    reserved : UInt32
  end
  struct NDR64_POINTER_REPEAT_FLAGS
    _bitfield : UInt8
  end
  struct NDR64_REPEAT_FORMAT
    format_code : UInt8
    flags : NDR64_POINTER_REPEAT_FLAGS
    reserved : UInt16
    increment : UInt32
    offset_to_array : UInt32
    number_of_pointers : UInt32
  end
  struct NDR64_FIXED_REPEAT_FORMAT
    repeat_format : NDR64_REPEAT_FORMAT
    iterations : UInt32
    reserved : UInt32
  end
  struct NDR64_IID_FLAGS
    _bitfield : UInt8
  end
  struct NDR64_CONSTANT_IID_FORMAT
    format_code : UInt8
    flags : UInt8
    reserved : UInt16
    guid : Guid
  end
  struct NDR64_IID_FORMAT
    format_code : UInt8
    flags : UInt8
    reserved : UInt16
    iid_descriptor : Void*
  end
  struct NDR64_STRUCTURE_FLAGS
    _bitfield : UInt8
  end
  struct NDR64_STRUCTURE_HEADER_FORMAT
    format_code : UInt8
    alignment : UInt8
    flags : NDR64_STRUCTURE_FLAGS
    reserve : UInt8
    memory_size : UInt32
  end
  struct NDR64_CONF_STRUCTURE_HEADER_FORMAT
    format_code : UInt8
    alignment : UInt8
    flags : NDR64_STRUCTURE_FLAGS
    reserve : UInt8
    memory_size : UInt32
    array_description : Void*
  end
  struct NDR64_BOGUS_STRUCTURE_HEADER_FORMAT
    format_code : UInt8
    alignment : UInt8
    flags : NDR64_STRUCTURE_FLAGS
    reserve : UInt8
    memory_size : UInt32
    original_member_layout : Void*
    original_pointer_layout : Void*
    pointer_layout : Void*
  end
  struct NDR64_CONF_BOGUS_STRUCTURE_HEADER_FORMAT
    format_code : UInt8
    alignment : UInt8
    flags : NDR64_STRUCTURE_FLAGS
    dimensions : UInt8
    memory_size : UInt32
    original_member_layout : Void*
    original_pointer_layout : Void*
    pointer_layout : Void*
    conf_array_description : Void*
  end
  struct NDR64_SIMPLE_MEMBER_FORMAT
    format_code : UInt8
    reserved1 : UInt8
    reserved2 : UInt16
    reserved3 : UInt32
  end
  struct NDR64_MEMPAD_FORMAT
    format_code : UInt8
    reserve1 : UInt8
    mem_pad : UInt16
    reserved2 : UInt32
  end
  struct NDR64_EMBEDDED_COMPLEX_FORMAT
    format_code : UInt8
    reserve1 : UInt8
    reserve2 : UInt16
    type : Void*
  end
  struct NDR64_BUFFER_ALIGN_FORMAT
    format_code : UInt8
    alignment : UInt8
    reserved : UInt16
    reserved2 : UInt32
  end
  struct NDR64_SIMPLE_REGION_FORMAT
    format_code : UInt8
    alignment : UInt8
    region_size : UInt16
    reserved : UInt32
  end
  struct NDR64_ENCAPSULATED_UNION
    format_code : UInt8
    alignment : UInt8
    flags : UInt8
    switch_type : UInt8
    memory_offset : UInt32
    memory_size : UInt32
    reserved : UInt32
  end
  struct NDR64_NON_ENCAPSULATED_UNION
    format_code : UInt8
    alignment : UInt8
    flags : UInt8
    switch_type : UInt8
    memory_size : UInt32
    switch : Void*
    reserved : UInt32
  end
  struct NDR64_UNION_ARM_SELECTOR
    reserved1 : UInt8
    alignment : UInt8
    reserved2 : UInt16
    arms : UInt32
  end
  struct NDR64_UNION_ARM
    case_value : Int64
    type : Void*
    reserved : UInt32
  end
  struct NDR64_ARRAY_FLAGS
    _bitfield : UInt8
  end
  struct NDR64_ARRAY_ELEMENT_INFO
    element_mem_size : UInt32
    element : Void*
  end
  struct NDR64_FIX_ARRAY_HEADER_FORMAT
    format_code : UInt8
    alignment : UInt8
    flags : NDR64_ARRAY_FLAGS
    reserved : UInt8
    total_size : UInt32
  end
  struct NDR64_CONF_ARRAY_HEADER_FORMAT
    format_code : UInt8
    alignment : UInt8
    flags : NDR64_ARRAY_FLAGS
    reserved : UInt8
    element_size : UInt32
    conf_descriptor : Void*
  end
  struct NDR64_CONF_VAR_ARRAY_HEADER_FORMAT
    format_code : UInt8
    alignment : UInt8
    flags : NDR64_ARRAY_FLAGS
    reserved : UInt8
    element_size : UInt32
    conf_descriptor : Void*
    var_descriptor : Void*
  end
  struct NDR64_VAR_ARRAY_HEADER_FORMAT
    format_code : UInt8
    alignment : UInt8
    flags : NDR64_ARRAY_FLAGS
    reserved : UInt8
    total_size : UInt32
    element_size : UInt32
    var_descriptor : Void*
  end
  struct NDR64_BOGUS_ARRAY_HEADER_FORMAT
    format_code : UInt8
    alignment : UInt8
    flags : NDR64_ARRAY_FLAGS
    number_dims : UInt8
    number_elements : UInt32
    element : Void*
  end
  struct NDR64_CONF_VAR_BOGUS_ARRAY_HEADER_FORMAT
    fixed_array_format : NDR64_BOGUS_ARRAY_HEADER_FORMAT
    conf_description : Void*
    var_description : Void*
    offset_description : Void*
  end
  struct NDR64_STRING_FLAGS
    _bitfield : UInt8
  end
  struct NDR64_STRING_HEADER_FORMAT
    format_code : UInt8
    flags : NDR64_STRING_FLAGS
    element_size : UInt16
  end
  struct NDR64_NON_CONFORMANT_STRING_FORMAT
    header : NDR64_STRING_HEADER_FORMAT
    total_size : UInt32
  end
  struct NDR64_RANGED_STRING_FORMAT
    header : NDR64_STRING_HEADER_FORMAT
    reserved : UInt32
    min : UInt64
    max : UInt64
  end
  struct NDR64_CONFORMANT_STRING_FORMAT
    header : NDR64_STRING_HEADER_FORMAT
  end
  struct NDR64_SIZED_CONFORMANT_STRING_FORMAT
    header : NDR64_STRING_HEADER_FORMAT
    size_description : Void*
  end
  struct NDR64_EXPR_OPERATOR
    expr_type : UInt8
    operator : UInt8
    cast_type : UInt8
    reserved : UInt8
  end
  struct NDR64_EXPR_CONST32
    expr_type : UInt8
    reserved : UInt8
    reserved1 : UInt16
    const_value : UInt32
  end
  struct NDR64_EXPR_CONST64
    expr_type : UInt8
    reserved : UInt8
    reserved1 : UInt16
    const_value : Int64
  end
  struct NDR64_EXPR_VAR
    expr_type : UInt8
    var_type : UInt8
    reserved : UInt16
    offset : UInt32
  end
  struct NDR64_EXPR_NOOP
    expr_type : UInt8
    size : UInt8
    reserved : UInt16
  end
  struct NDR64_TRANSMIT_AS_FLAGS
    _bitfield : UInt8
  end
  struct NDR64_TRANSMIT_AS_FORMAT
    format_code : UInt8
    flags : UInt8
    routine_index : UInt16
    transmitted_type_wire_alignment : UInt16
    memory_alignment : UInt16
    presented_type_memory_size : UInt32
    transmitted_type_buffer_size : UInt32
    transmitted_type : Void*
  end
  struct NDR64_USER_MARSHAL_FLAGS
    _bitfield : UInt8
  end
  struct NDR64_USER_MARSHAL_FORMAT
    format_code : UInt8
    flags : UInt8
    routine_index : UInt16
    transmitted_type_wire_alignment : UInt16
    memory_alignment : UInt16
    user_type_memory_size : UInt32
    transmitted_type_buffer_size : UInt32
    transmitted_type : Void*
  end
  struct NDR64_PIPE_FLAGS
    _bitfield : UInt8
  end
  struct NDR64_PIPE_FORMAT
    format_code : UInt8
    flags : UInt8
    alignment : UInt8
    reserved : UInt8
    type : Void*
    memory_size : UInt32
    buffer_size : UInt32
  end
  struct NDR64_RANGE_PIPE_FORMAT
    format_code : UInt8
    flags : UInt8
    alignment : UInt8
    reserved : UInt8
    type : Void*
    memory_size : UInt32
    buffer_size : UInt32
    min_value : UInt32
    max_value : UInt32
  end
  struct NDR64_TYPE_STRICT_CONTEXT_HANDLE
    format_code : UInt8
    real_format_code : UInt8
    reserved : UInt16
    type : Void*
    ctxt_flags : UInt32
    ctxt_id : UInt32
  end


  # Params # this : IUnknown [In],riid : Guid* [In],ppvobject : Void** [In]
  fun IUnknown_QueryInterface_Proxy(this : IUnknown, riid : Guid*, ppvobject : Void**) : HRESULT

  # Params # this : IUnknown [In]
  fun IUnknown_AddRef_Proxy(this : IUnknown) : UInt32

  # Params # this : IUnknown [In]
  fun IUnknown_Release_Proxy(this : IUnknown) : UInt32

  # Params # sourcebinding : Void* [In],destinationbinding : Void** [In]
  fun RpcBindingCopy(sourcebinding : Void*, destinationbinding : Void**) : RPC_STATUS

  # Params # binding : Void** [In]
  fun RpcBindingFree(binding : Void**) : RPC_STATUS

  # Params # hbinding : Void* [In],option : UInt32 [In],optionvalue : LibC::UINT_PTR [In]
  fun RpcBindingSetOption(hbinding : Void*, option : UInt32, optionvalue : LibC::UINT_PTR) : RPC_STATUS

  # Params # hbinding : Void* [In],option : UInt32 [In],poptionvalue : LibC::UINT_PTR* [In]
  fun RpcBindingInqOption(hbinding : Void*, option : UInt32, poptionvalue : LibC::UINT_PTR*) : RPC_STATUS

  # Params # stringbinding : UInt8* [In],binding : Void** [In]
  fun RpcBindingFromStringBindingA(stringbinding : UInt8*, binding : Void**) : RPC_STATUS

  # Params # stringbinding : UInt16* [In],binding : Void** [In]
  fun RpcBindingFromStringBindingW(stringbinding : UInt16*, binding : Void**) : RPC_STATUS

  # Params # contexthandle : Void* [In],binding : Void** [In]
  fun RpcSsGetContextBinding(contexthandle : Void*, binding : Void**) : RPC_STATUS

  # Params # binding : Void* [In],maxcalls : UInt32* [In]
  fun RpcBindingInqMaxCalls(binding : Void*, maxcalls : UInt32*) : RPC_STATUS

  # Params # binding : Void* [In],objectuuid : Guid* [In]
  fun RpcBindingInqObject(binding : Void*, objectuuid : Guid*) : RPC_STATUS

  # Params # binding : Void* [In]
  fun RpcBindingReset(binding : Void*) : RPC_STATUS

  # Params # binding : Void* [In],objectuuid : Guid* [In]
  fun RpcBindingSetObject(binding : Void*, objectuuid : Guid*) : RPC_STATUS

  # Params # authnsvc : UInt32 [In],authnlevel : UInt32* [In]
  fun RpcMgmtInqDefaultProtectLevel(authnsvc : UInt32, authnlevel : UInt32*) : RPC_STATUS

  # Params # binding : Void* [In],stringbinding : UInt8** [In]
  fun RpcBindingToStringBindingA(binding : Void*, stringbinding : UInt8**) : RPC_STATUS

  # Params # binding : Void* [In],stringbinding : UInt16** [In]
  fun RpcBindingToStringBindingW(binding : Void*, stringbinding : UInt16**) : RPC_STATUS

  # Params # bindingvector : RPC_BINDING_VECTOR** [In]
  fun RpcBindingVectorFree(bindingvector : RPC_BINDING_VECTOR**) : RPC_STATUS

  # Params # objuuid : UInt8* [In],protseq : UInt8* [In],networkaddr : UInt8* [In],endpoint : UInt8* [In],options : UInt8* [In],stringbinding : UInt8** [In]
  fun RpcStringBindingComposeA(objuuid : UInt8*, protseq : UInt8*, networkaddr : UInt8*, endpoint : UInt8*, options : UInt8*, stringbinding : UInt8**) : RPC_STATUS

  # Params # objuuid : UInt16* [In],protseq : UInt16* [In],networkaddr : UInt16* [In],endpoint : UInt16* [In],options : UInt16* [In],stringbinding : UInt16** [In]
  fun RpcStringBindingComposeW(objuuid : UInt16*, protseq : UInt16*, networkaddr : UInt16*, endpoint : UInt16*, options : UInt16*, stringbinding : UInt16**) : RPC_STATUS

  # Params # stringbinding : UInt8* [In],objuuid : UInt8** [In],protseq : UInt8** [In],networkaddr : UInt8** [In],endpoint : UInt8** [In],networkoptions : UInt8** [In]
  fun RpcStringBindingParseA(stringbinding : UInt8*, objuuid : UInt8**, protseq : UInt8**, networkaddr : UInt8**, endpoint : UInt8**, networkoptions : UInt8**) : RPC_STATUS

  # Params # stringbinding : UInt16* [In],objuuid : UInt16** [In],protseq : UInt16** [In],networkaddr : UInt16** [In],endpoint : UInt16** [In],networkoptions : UInt16** [In]
  fun RpcStringBindingParseW(stringbinding : UInt16*, objuuid : UInt16**, protseq : UInt16**, networkaddr : UInt16**, endpoint : UInt16**, networkoptions : UInt16**) : RPC_STATUS

  # Params # string : UInt8** [In]
  fun RpcStringFreeA(string : UInt8**) : RPC_STATUS

  # Params # string : UInt16** [In]
  fun RpcStringFreeW(string : UInt16**) : RPC_STATUS

  # Params # rpcifhandle : Void* [In],rpcifid : RPC_IF_ID* [In]
  fun RpcIfInqId(rpcifhandle : Void*, rpcifid : RPC_IF_ID*) : RPC_STATUS

  # Params # protseq : UInt8* [In]
  fun RpcNetworkIsProtseqValidA(protseq : UInt8*) : RPC_STATUS

  # Params # protseq : UInt16* [In]
  fun RpcNetworkIsProtseqValidW(protseq : UInt16*) : RPC_STATUS

  # Params # binding : Void* [In],timeout : UInt32* [In]
  fun RpcMgmtInqComTimeout(binding : Void*, timeout : UInt32*) : RPC_STATUS

  # Params # binding : Void* [In],timeout : UInt32 [In]
  fun RpcMgmtSetComTimeout(binding : Void*, timeout : UInt32) : RPC_STATUS

  # Params # timeout : Int32 [In]
  fun RpcMgmtSetCancelTimeout(timeout : Int32) : RPC_STATUS

  # Params # protseqvector : RPC_PROTSEQ_VECTORA** [In]
  fun RpcNetworkInqProtseqsA(protseqvector : RPC_PROTSEQ_VECTORA**) : RPC_STATUS

  # Params # protseqvector : RPC_PROTSEQ_VECTORW** [In]
  fun RpcNetworkInqProtseqsW(protseqvector : RPC_PROTSEQ_VECTORW**) : RPC_STATUS

  # Params # objuuid : Guid* [In],typeuuid : Guid* [In]
  fun RpcObjectInqType(objuuid : Guid*, typeuuid : Guid*) : RPC_STATUS

  # Params # inquiryfn : RPC_OBJECT_INQ_FN [In]
  fun RpcObjectSetInqFn(inquiryfn : RPC_OBJECT_INQ_FN) : RPC_STATUS

  # Params # objuuid : Guid* [In],typeuuid : Guid* [In]
  fun RpcObjectSetType(objuuid : Guid*, typeuuid : Guid*) : RPC_STATUS

  # Params # protseqvector : RPC_PROTSEQ_VECTORA** [In]
  fun RpcProtseqVectorFreeA(protseqvector : RPC_PROTSEQ_VECTORA**) : RPC_STATUS

  # Params # protseqvector : RPC_PROTSEQ_VECTORW** [In]
  fun RpcProtseqVectorFreeW(protseqvector : RPC_PROTSEQ_VECTORW**) : RPC_STATUS

  # Params # bindingvector : RPC_BINDING_VECTOR** [In]
  fun RpcServerInqBindings(bindingvector : RPC_BINDING_VECTOR**) : RPC_STATUS

  # Params # securitydescriptor : Void* [In],bindingvector : RPC_BINDING_VECTOR** [In]
  fun RpcServerInqBindingsEx(securitydescriptor : Void*, bindingvector : RPC_BINDING_VECTOR**) : RPC_STATUS

  # Params # ifspec : Void* [In],mgrtypeuuid : Guid* [In],mgrepv : Void** [In]
  fun RpcServerInqIf(ifspec : Void*, mgrtypeuuid : Guid*, mgrepv : Void**) : RPC_STATUS

  # Params # minimumcallthreads : UInt32 [In],maxcalls : UInt32 [In],dontwait : UInt32 [In]
  fun RpcServerListen(minimumcallthreads : UInt32, maxcalls : UInt32, dontwait : UInt32) : RPC_STATUS

  # Params # ifspec : Void* [In],mgrtypeuuid : Guid* [In],mgrepv : Void* [In]
  fun RpcServerRegisterIf(ifspec : Void*, mgrtypeuuid : Guid*, mgrepv : Void*) : RPC_STATUS

  # Params # ifspec : Void* [In],mgrtypeuuid : Guid* [In],mgrepv : Void* [In],flags : UInt32 [In],maxcalls : UInt32 [In],ifcallback : RPC_IF_CALLBACK_FN [In]
  fun RpcServerRegisterIfEx(ifspec : Void*, mgrtypeuuid : Guid*, mgrepv : Void*, flags : UInt32, maxcalls : UInt32, ifcallback : RPC_IF_CALLBACK_FN) : RPC_STATUS

  # Params # ifspec : Void* [In],mgrtypeuuid : Guid* [In],mgrepv : Void* [In],flags : UInt32 [In],maxcalls : UInt32 [In],maxrpcsize : UInt32 [In],ifcallbackfn : RPC_IF_CALLBACK_FN [In]
  fun RpcServerRegisterIf2(ifspec : Void*, mgrtypeuuid : Guid*, mgrepv : Void*, flags : UInt32, maxcalls : UInt32, maxrpcsize : UInt32, ifcallbackfn : RPC_IF_CALLBACK_FN) : RPC_STATUS

  # Params # ifspec : Void* [In],mgrtypeuuid : Guid* [In],mgrepv : Void* [In],flags : UInt32 [In],maxcalls : UInt32 [In],maxrpcsize : UInt32 [In],ifcallback : RPC_IF_CALLBACK_FN [In],securitydescriptor : Void* [In]
  fun RpcServerRegisterIf3(ifspec : Void*, mgrtypeuuid : Guid*, mgrepv : Void*, flags : UInt32, maxcalls : UInt32, maxrpcsize : UInt32, ifcallback : RPC_IF_CALLBACK_FN, securitydescriptor : Void*) : RPC_STATUS

  # Params # ifspec : Void* [In],mgrtypeuuid : Guid* [In],waitforcallstocomplete : UInt32 [In]
  fun RpcServerUnregisterIf(ifspec : Void*, mgrtypeuuid : Guid*, waitforcallstocomplete : UInt32) : RPC_STATUS

  # Params # ifspec : Void* [In],mgrtypeuuid : Guid* [In],rundowncontexthandles : Int32 [In]
  fun RpcServerUnregisterIfEx(ifspec : Void*, mgrtypeuuid : Guid*, rundowncontexthandles : Int32) : RPC_STATUS

  # Params # maxcalls : UInt32 [In],securitydescriptor : Void* [In]
  fun RpcServerUseAllProtseqs(maxcalls : UInt32, securitydescriptor : Void*) : RPC_STATUS

  # Params # maxcalls : UInt32 [In],securitydescriptor : Void* [In],policy : RPC_POLICY* [In]
  fun RpcServerUseAllProtseqsEx(maxcalls : UInt32, securitydescriptor : Void*, policy : RPC_POLICY*) : RPC_STATUS

  # Params # maxcalls : UInt32 [In],ifspec : Void* [In],securitydescriptor : Void* [In]
  fun RpcServerUseAllProtseqsIf(maxcalls : UInt32, ifspec : Void*, securitydescriptor : Void*) : RPC_STATUS

  # Params # maxcalls : UInt32 [In],ifspec : Void* [In],securitydescriptor : Void* [In],policy : RPC_POLICY* [In]
  fun RpcServerUseAllProtseqsIfEx(maxcalls : UInt32, ifspec : Void*, securitydescriptor : Void*, policy : RPC_POLICY*) : RPC_STATUS

  # Params # protseq : UInt8* [In],maxcalls : UInt32 [In],securitydescriptor : Void* [In]
  fun RpcServerUseProtseqA(protseq : UInt8*, maxcalls : UInt32, securitydescriptor : Void*) : RPC_STATUS

  # Params # protseq : UInt8* [In],maxcalls : UInt32 [In],securitydescriptor : Void* [In],policy : RPC_POLICY* [In]
  fun RpcServerUseProtseqExA(protseq : UInt8*, maxcalls : UInt32, securitydescriptor : Void*, policy : RPC_POLICY*) : RPC_STATUS

  # Params # protseq : UInt16* [In],maxcalls : UInt32 [In],securitydescriptor : Void* [In]
  fun RpcServerUseProtseqW(protseq : UInt16*, maxcalls : UInt32, securitydescriptor : Void*) : RPC_STATUS

  # Params # protseq : UInt16* [In],maxcalls : UInt32 [In],securitydescriptor : Void* [In],policy : RPC_POLICY* [In]
  fun RpcServerUseProtseqExW(protseq : UInt16*, maxcalls : UInt32, securitydescriptor : Void*, policy : RPC_POLICY*) : RPC_STATUS

  # Params # protseq : UInt8* [In],maxcalls : UInt32 [In],endpoint : UInt8* [In],securitydescriptor : Void* [In]
  fun RpcServerUseProtseqEpA(protseq : UInt8*, maxcalls : UInt32, endpoint : UInt8*, securitydescriptor : Void*) : RPC_STATUS

  # Params # protseq : UInt8* [In],maxcalls : UInt32 [In],endpoint : UInt8* [In],securitydescriptor : Void* [In],policy : RPC_POLICY* [In]
  fun RpcServerUseProtseqEpExA(protseq : UInt8*, maxcalls : UInt32, endpoint : UInt8*, securitydescriptor : Void*, policy : RPC_POLICY*) : RPC_STATUS

  # Params # protseq : UInt16* [In],maxcalls : UInt32 [In],endpoint : UInt16* [In],securitydescriptor : Void* [In]
  fun RpcServerUseProtseqEpW(protseq : UInt16*, maxcalls : UInt32, endpoint : UInt16*, securitydescriptor : Void*) : RPC_STATUS

  # Params # protseq : UInt16* [In],maxcalls : UInt32 [In],endpoint : UInt16* [In],securitydescriptor : Void* [In],policy : RPC_POLICY* [In]
  fun RpcServerUseProtseqEpExW(protseq : UInt16*, maxcalls : UInt32, endpoint : UInt16*, securitydescriptor : Void*, policy : RPC_POLICY*) : RPC_STATUS

  # Params # protseq : UInt8* [In],maxcalls : UInt32 [In],ifspec : Void* [In],securitydescriptor : Void* [In]
  fun RpcServerUseProtseqIfA(protseq : UInt8*, maxcalls : UInt32, ifspec : Void*, securitydescriptor : Void*) : RPC_STATUS

  # Params # protseq : UInt8* [In],maxcalls : UInt32 [In],ifspec : Void* [In],securitydescriptor : Void* [In],policy : RPC_POLICY* [In]
  fun RpcServerUseProtseqIfExA(protseq : UInt8*, maxcalls : UInt32, ifspec : Void*, securitydescriptor : Void*, policy : RPC_POLICY*) : RPC_STATUS

  # Params # protseq : UInt16* [In],maxcalls : UInt32 [In],ifspec : Void* [In],securitydescriptor : Void* [In]
  fun RpcServerUseProtseqIfW(protseq : UInt16*, maxcalls : UInt32, ifspec : Void*, securitydescriptor : Void*) : RPC_STATUS

  # Params # protseq : UInt16* [In],maxcalls : UInt32 [In],ifspec : Void* [In],securitydescriptor : Void* [In],policy : RPC_POLICY* [In]
  fun RpcServerUseProtseqIfExW(protseq : UInt16*, maxcalls : UInt32, ifspec : Void*, securitydescriptor : Void*, policy : RPC_POLICY*) : RPC_STATUS

  # Params # 
  fun RpcServerYield

  # Params # statsvector : RPC_STATS_VECTOR** [In]
  fun RpcMgmtStatsVectorFree(statsvector : RPC_STATS_VECTOR**) : RPC_STATUS

  # Params # binding : Void* [In],statistics : RPC_STATS_VECTOR** [In]
  fun RpcMgmtInqStats(binding : Void*, statistics : RPC_STATS_VECTOR**) : RPC_STATUS

  # Params # binding : Void* [In]
  fun RpcMgmtIsServerListening(binding : Void*) : RPC_STATUS

  # Params # binding : Void* [In]
  fun RpcMgmtStopServerListening(binding : Void*) : RPC_STATUS

  # Params # 
  fun RpcMgmtWaitServerListen : RPC_STATUS

  # Params # threadstacksize : UInt32 [In]
  fun RpcMgmtSetServerStackSize(threadstacksize : UInt32) : RPC_STATUS

  # Params # 
  fun RpcSsDontSerializeContext

  # Params # 
  fun RpcMgmtEnableIdleCleanup : RPC_STATUS

  # Params # binding : Void* [In],ifidvector : RPC_IF_ID_VECTOR** [In]
  fun RpcMgmtInqIfIds(binding : Void*, ifidvector : RPC_IF_ID_VECTOR**) : RPC_STATUS

  # Params # ifidvector : RPC_IF_ID_VECTOR** [In]
  fun RpcIfIdVectorFree(ifidvector : RPC_IF_ID_VECTOR**) : RPC_STATUS

  # Params # binding : Void* [In],authnsvc : UInt32 [In],serverprincname : UInt8** [In]
  fun RpcMgmtInqServerPrincNameA(binding : Void*, authnsvc : UInt32, serverprincname : UInt8**) : RPC_STATUS

  # Params # binding : Void* [In],authnsvc : UInt32 [In],serverprincname : UInt16** [In]
  fun RpcMgmtInqServerPrincNameW(binding : Void*, authnsvc : UInt32, serverprincname : UInt16**) : RPC_STATUS

  # Params # authnsvc : UInt32 [In],princname : UInt8** [In]
  fun RpcServerInqDefaultPrincNameA(authnsvc : UInt32, princname : UInt8**) : RPC_STATUS

  # Params # authnsvc : UInt32 [In],princname : UInt16** [In]
  fun RpcServerInqDefaultPrincNameW(authnsvc : UInt32, princname : UInt16**) : RPC_STATUS

  # Params # binding : Void* [In],ifspec : Void* [In]
  fun RpcEpResolveBinding(binding : Void*, ifspec : Void*) : RPC_STATUS

  # Params # binding : Void* [In],entrynamesyntax : UInt32 [In],entryname : UInt8** [In]
  fun RpcNsBindingInqEntryNameA(binding : Void*, entrynamesyntax : UInt32, entryname : UInt8**) : RPC_STATUS

  # Params # binding : Void* [In],entrynamesyntax : UInt32 [In],entryname : UInt16** [In]
  fun RpcNsBindingInqEntryNameW(binding : Void*, entrynamesyntax : UInt32, entryname : UInt16**) : RPC_STATUS

  # Params # template : RPC_BINDING_HANDLE_TEMPLATE_V1_A* [In],security : RPC_BINDING_HANDLE_SECURITY_V1_A* [In],options : RPC_BINDING_HANDLE_OPTIONS_V1* [In],binding : Void** [In]
  fun RpcBindingCreateA(template : RPC_BINDING_HANDLE_TEMPLATE_V1_A*, security : RPC_BINDING_HANDLE_SECURITY_V1_A*, options : RPC_BINDING_HANDLE_OPTIONS_V1*, binding : Void**) : RPC_STATUS

  # Params # template : RPC_BINDING_HANDLE_TEMPLATE_V1_W* [In],security : RPC_BINDING_HANDLE_SECURITY_V1_W* [In],options : RPC_BINDING_HANDLE_OPTIONS_V1* [In],binding : Void** [In]
  fun RpcBindingCreateW(template : RPC_BINDING_HANDLE_TEMPLATE_V1_W*, security : RPC_BINDING_HANDLE_SECURITY_V1_W*, options : RPC_BINDING_HANDLE_OPTIONS_V1*, binding : Void**) : RPC_STATUS

  # Params # binding : Void** [In]
  fun RpcServerInqBindingHandle(binding : Void**) : RPC_STATUS

  # Params # bindinghandle : Void* [In]
  fun RpcImpersonateClient(bindinghandle : Void*) : RPC_STATUS

  # Params # bindinghandle : Void* [In]
  fun RpcImpersonateClient2(bindinghandle : Void*) : RPC_STATUS

  # Params # bindinghandle : Void* [In]
  fun RpcRevertToSelfEx(bindinghandle : Void*) : RPC_STATUS

  # Params # 
  fun RpcRevertToSelf : RPC_STATUS

  # Params # bindinghandle : Void* [In]
  fun RpcImpersonateClientContainer(bindinghandle : Void*) : RPC_STATUS

  # Params # 
  fun RpcRevertContainerImpersonation : RPC_STATUS

  # Params # clientbinding : Void* [In],privs : Void** [In],serverprincname : UInt8** [In],authnlevel : UInt32* [In],authnsvc : UInt32* [In],authzsvc : UInt32* [In]
  fun RpcBindingInqAuthClientA(clientbinding : Void*, privs : Void**, serverprincname : UInt8**, authnlevel : UInt32*, authnsvc : UInt32*, authzsvc : UInt32*) : RPC_STATUS

  # Params # clientbinding : Void* [In],privs : Void** [In],serverprincname : UInt16** [In],authnlevel : UInt32* [In],authnsvc : UInt32* [In],authzsvc : UInt32* [In]
  fun RpcBindingInqAuthClientW(clientbinding : Void*, privs : Void**, serverprincname : UInt16**, authnlevel : UInt32*, authnsvc : UInt32*, authzsvc : UInt32*) : RPC_STATUS

  # Params # clientbinding : Void* [In],privs : Void** [In],serverprincname : UInt8** [In],authnlevel : UInt32* [In],authnsvc : UInt32* [In],authzsvc : UInt32* [In],flags : UInt32 [In]
  fun RpcBindingInqAuthClientExA(clientbinding : Void*, privs : Void**, serverprincname : UInt8**, authnlevel : UInt32*, authnsvc : UInt32*, authzsvc : UInt32*, flags : UInt32) : RPC_STATUS

  # Params # clientbinding : Void* [In],privs : Void** [In],serverprincname : UInt16** [In],authnlevel : UInt32* [In],authnsvc : UInt32* [In],authzsvc : UInt32* [In],flags : UInt32 [In]
  fun RpcBindingInqAuthClientExW(clientbinding : Void*, privs : Void**, serverprincname : UInt16**, authnlevel : UInt32*, authnsvc : UInt32*, authzsvc : UInt32*, flags : UInt32) : RPC_STATUS

  # Params # binding : Void* [In],serverprincname : UInt8** [In],authnlevel : UInt32* [In],authnsvc : UInt32* [In],authidentity : Void** [In],authzsvc : UInt32* [In]
  fun RpcBindingInqAuthInfoA(binding : Void*, serverprincname : UInt8**, authnlevel : UInt32*, authnsvc : UInt32*, authidentity : Void**, authzsvc : UInt32*) : RPC_STATUS

  # Params # binding : Void* [In],serverprincname : UInt16** [In],authnlevel : UInt32* [In],authnsvc : UInt32* [In],authidentity : Void** [In],authzsvc : UInt32* [In]
  fun RpcBindingInqAuthInfoW(binding : Void*, serverprincname : UInt16**, authnlevel : UInt32*, authnsvc : UInt32*, authidentity : Void**, authzsvc : UInt32*) : RPC_STATUS

  # Params # binding : Void* [In],serverprincname : UInt8* [In],authnlevel : UInt32 [In],authnsvc : UInt32 [In],authidentity : Void* [In],authzsvc : UInt32 [In]
  fun RpcBindingSetAuthInfoA(binding : Void*, serverprincname : UInt8*, authnlevel : UInt32, authnsvc : UInt32, authidentity : Void*, authzsvc : UInt32) : RPC_STATUS

  # Params # binding : Void* [In],serverprincname : UInt8* [In],authnlevel : UInt32 [In],authnsvc : UInt32 [In],authidentity : Void* [In],authzsvc : UInt32 [In],securityqos : RPC_SECURITY_QOS* [In]
  fun RpcBindingSetAuthInfoExA(binding : Void*, serverprincname : UInt8*, authnlevel : UInt32, authnsvc : UInt32, authidentity : Void*, authzsvc : UInt32, securityqos : RPC_SECURITY_QOS*) : RPC_STATUS

  # Params # binding : Void* [In],serverprincname : UInt16* [In],authnlevel : UInt32 [In],authnsvc : UInt32 [In],authidentity : Void* [In],authzsvc : UInt32 [In]
  fun RpcBindingSetAuthInfoW(binding : Void*, serverprincname : UInt16*, authnlevel : UInt32, authnsvc : UInt32, authidentity : Void*, authzsvc : UInt32) : RPC_STATUS

  # Params # binding : Void* [In],serverprincname : UInt16* [In],authnlevel : UInt32 [In],authnsvc : UInt32 [In],authidentity : Void* [In],authzsvc : UInt32 [In],securityqos : RPC_SECURITY_QOS* [In]
  fun RpcBindingSetAuthInfoExW(binding : Void*, serverprincname : UInt16*, authnlevel : UInt32, authnsvc : UInt32, authidentity : Void*, authzsvc : UInt32, securityqos : RPC_SECURITY_QOS*) : RPC_STATUS

  # Params # binding : Void* [In],serverprincname : UInt8** [In],authnlevel : UInt32* [In],authnsvc : UInt32* [In],authidentity : Void** [In],authzsvc : UInt32* [In],rpcqosversion : UInt32 [In],securityqos : RPC_SECURITY_QOS* [In]
  fun RpcBindingInqAuthInfoExA(binding : Void*, serverprincname : UInt8**, authnlevel : UInt32*, authnsvc : UInt32*, authidentity : Void**, authzsvc : UInt32*, rpcqosversion : UInt32, securityqos : RPC_SECURITY_QOS*) : RPC_STATUS

  # Params # binding : Void* [In],serverprincname : UInt16** [In],authnlevel : UInt32* [In],authnsvc : UInt32* [In],authidentity : Void** [In],authzsvc : UInt32* [In],rpcqosversion : UInt32 [In],securityqos : RPC_SECURITY_QOS* [In]
  fun RpcBindingInqAuthInfoExW(binding : Void*, serverprincname : UInt16**, authnlevel : UInt32*, authnsvc : UInt32*, authidentity : Void**, authzsvc : UInt32*, rpcqosversion : UInt32, securityqos : RPC_SECURITY_QOS*) : RPC_STATUS

  # Params # bindinghandle : Void* [In],status : RPC_STATUS [In]
  fun RpcServerCompleteSecurityCallback(bindinghandle : Void*, status : RPC_STATUS) : RPC_STATUS

  # Params # serverprincname : UInt8* [In],authnsvc : UInt32 [In],getkeyfn : RPC_AUTH_KEY_RETRIEVAL_FN [In],arg : Void* [In]
  fun RpcServerRegisterAuthInfoA(serverprincname : UInt8*, authnsvc : UInt32, getkeyfn : RPC_AUTH_KEY_RETRIEVAL_FN, arg : Void*) : RPC_STATUS

  # Params # serverprincname : UInt16* [In],authnsvc : UInt32 [In],getkeyfn : RPC_AUTH_KEY_RETRIEVAL_FN [In],arg : Void* [In]
  fun RpcServerRegisterAuthInfoW(serverprincname : UInt16*, authnsvc : UInt32, getkeyfn : RPC_AUTH_KEY_RETRIEVAL_FN, arg : Void*) : RPC_STATUS

  # Params # clientbinding : Void* [In],serverbinding : Void** [In]
  fun RpcBindingServerFromClient(clientbinding : Void*, serverbinding : Void**) : RPC_STATUS

  # Params # exception : RPC_STATUS [In]
  fun RpcRaiseException(exception : RPC_STATUS)

  # Params # 
  fun RpcTestCancel : RPC_STATUS

  # Params # bindinghandle : Void* [In]
  fun RpcServerTestCancel(bindinghandle : Void*) : RPC_STATUS

  # Params # thread : Void* [In]
  fun RpcCancelThread(thread : Void*) : RPC_STATUS

  # Params # thread : Void* [In],timeout : Int32 [In]
  fun RpcCancelThreadEx(thread : Void*, timeout : Int32) : RPC_STATUS

  # Params # uuid : Guid* [In]
  fun UuidCreate(uuid : Guid*) : RPC_STATUS

  # Params # uuid : Guid* [In]
  fun UuidCreateSequential(uuid : Guid*) : RPC_STATUS

  # Params # uuid : Guid* [In],stringuuid : UInt8** [In]
  fun UuidToStringA(uuid : Guid*, stringuuid : UInt8**) : RPC_STATUS

  # Params # stringuuid : UInt8* [In],uuid : Guid* [In]
  fun UuidFromStringA(stringuuid : UInt8*, uuid : Guid*) : RPC_STATUS

  # Params # uuid : Guid* [In],stringuuid : UInt16** [In]
  fun UuidToStringW(uuid : Guid*, stringuuid : UInt16**) : RPC_STATUS

  # Params # stringuuid : UInt16* [In],uuid : Guid* [In]
  fun UuidFromStringW(stringuuid : UInt16*, uuid : Guid*) : RPC_STATUS

  # Params # uuid1 : Guid* [In],uuid2 : Guid* [In],status : RPC_STATUS* [In]
  fun UuidCompare(uuid1 : Guid*, uuid2 : Guid*, status : RPC_STATUS*) : Int32

  # Params # niluuid : Guid* [In]
  fun UuidCreateNil(niluuid : Guid*) : RPC_STATUS

  # Params # uuid1 : Guid* [In],uuid2 : Guid* [In],status : RPC_STATUS* [In]
  fun UuidEqual(uuid1 : Guid*, uuid2 : Guid*, status : RPC_STATUS*) : Int32

  # Params # uuid : Guid* [In],status : RPC_STATUS* [In]
  fun UuidHash(uuid : Guid*, status : RPC_STATUS*) : UInt16

  # Params # uuid : Guid* [In],status : RPC_STATUS* [In]
  fun UuidIsNil(uuid : Guid*, status : RPC_STATUS*) : Int32

  # Params # ifspec : Void* [In],bindingvector : RPC_BINDING_VECTOR* [In],uuidvector : UUID_VECTOR* [In],annotation : UInt8* [In]
  fun RpcEpRegisterNoReplaceA(ifspec : Void*, bindingvector : RPC_BINDING_VECTOR*, uuidvector : UUID_VECTOR*, annotation : UInt8*) : RPC_STATUS

  # Params # ifspec : Void* [In],bindingvector : RPC_BINDING_VECTOR* [In],uuidvector : UUID_VECTOR* [In],annotation : UInt16* [In]
  fun RpcEpRegisterNoReplaceW(ifspec : Void*, bindingvector : RPC_BINDING_VECTOR*, uuidvector : UUID_VECTOR*, annotation : UInt16*) : RPC_STATUS

  # Params # ifspec : Void* [In],bindingvector : RPC_BINDING_VECTOR* [In],uuidvector : UUID_VECTOR* [In],annotation : UInt8* [In]
  fun RpcEpRegisterA(ifspec : Void*, bindingvector : RPC_BINDING_VECTOR*, uuidvector : UUID_VECTOR*, annotation : UInt8*) : RPC_STATUS

  # Params # ifspec : Void* [In],bindingvector : RPC_BINDING_VECTOR* [In],uuidvector : UUID_VECTOR* [In],annotation : UInt16* [In]
  fun RpcEpRegisterW(ifspec : Void*, bindingvector : RPC_BINDING_VECTOR*, uuidvector : UUID_VECTOR*, annotation : UInt16*) : RPC_STATUS

  # Params # ifspec : Void* [In],bindingvector : RPC_BINDING_VECTOR* [In],uuidvector : UUID_VECTOR* [In]
  fun RpcEpUnregister(ifspec : Void*, bindingvector : RPC_BINDING_VECTOR*, uuidvector : UUID_VECTOR*) : RPC_STATUS

  # Params # rpcstatus : RPC_STATUS [In],errortext : UInt8* [In]
  fun DceErrorInqTextA(rpcstatus : RPC_STATUS, errortext : UInt8*) : RPC_STATUS

  # Params # rpcstatus : RPC_STATUS [In],errortext : UInt16* [In]
  fun DceErrorInqTextW(rpcstatus : RPC_STATUS, errortext : UInt16*) : RPC_STATUS

  # Params # epbinding : Void* [In],inquirytype : UInt32 [In],ifid : RPC_IF_ID* [In],versoption : UInt32 [In],objectuuid : Guid* [In],inquirycontext : Void*** [In]
  fun RpcMgmtEpEltInqBegin(epbinding : Void*, inquirytype : UInt32, ifid : RPC_IF_ID*, versoption : UInt32, objectuuid : Guid*, inquirycontext : Void***) : RPC_STATUS

  # Params # inquirycontext : Void*** [In]
  fun RpcMgmtEpEltInqDone(inquirycontext : Void***) : RPC_STATUS

  # Params # inquirycontext : Void** [In],ifid : RPC_IF_ID* [In],binding : Void** [In],objectuuid : Guid* [In],annotation : UInt8** [In]
  fun RpcMgmtEpEltInqNextA(inquirycontext : Void**, ifid : RPC_IF_ID*, binding : Void**, objectuuid : Guid*, annotation : UInt8**) : RPC_STATUS

  # Params # inquirycontext : Void** [In],ifid : RPC_IF_ID* [In],binding : Void** [In],objectuuid : Guid* [In],annotation : UInt16** [In]
  fun RpcMgmtEpEltInqNextW(inquirycontext : Void**, ifid : RPC_IF_ID*, binding : Void**, objectuuid : Guid*, annotation : UInt16**) : RPC_STATUS

  # Params # epbinding : Void* [In],ifid : RPC_IF_ID* [In],binding : Void* [In],objectuuid : Guid* [In]
  fun RpcMgmtEpUnregister(epbinding : Void*, ifid : RPC_IF_ID*, binding : Void*, objectuuid : Guid*) : RPC_STATUS

  # Params # authorizationfn : RPC_MGMT_AUTHORIZATION_FN [In]
  fun RpcMgmtSetAuthorizationFn(authorizationfn : RPC_MGMT_AUTHORIZATION_FN) : RPC_STATUS

  # Params # exceptioncode : UInt32 [In]
  fun RpcExceptionFilter(exceptioncode : UInt32) : Int32

  # Params # interfaces : RPC_INTERFACE_TEMPLATEW* [In],numifs : UInt32 [In],endpoints : RPC_ENDPOINT_TEMPLATEW* [In],numendpoints : UInt32 [In],idleperiod : UInt32 [In],idlecallbackfn : RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN [In],idlecallbackcontext : Void* [In],ifgroup : Void** [In]
  fun RpcServerInterfaceGroupCreateW(interfaces : RPC_INTERFACE_TEMPLATEW*, numifs : UInt32, endpoints : RPC_ENDPOINT_TEMPLATEW*, numendpoints : UInt32, idleperiod : UInt32, idlecallbackfn : RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN, idlecallbackcontext : Void*, ifgroup : Void**) : RPC_STATUS

  # Params # interfaces : RPC_INTERFACE_TEMPLATEA* [In],numifs : UInt32 [In],endpoints : RPC_ENDPOINT_TEMPLATEA* [In],numendpoints : UInt32 [In],idleperiod : UInt32 [In],idlecallbackfn : RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN [In],idlecallbackcontext : Void* [In],ifgroup : Void** [In]
  fun RpcServerInterfaceGroupCreateA(interfaces : RPC_INTERFACE_TEMPLATEA*, numifs : UInt32, endpoints : RPC_ENDPOINT_TEMPLATEA*, numendpoints : UInt32, idleperiod : UInt32, idlecallbackfn : RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN, idlecallbackcontext : Void*, ifgroup : Void**) : RPC_STATUS

  # Params # ifgroup : Void* [In]
  fun RpcServerInterfaceGroupClose(ifgroup : Void*) : RPC_STATUS

  # Params # ifgroup : Void* [In]
  fun RpcServerInterfaceGroupActivate(ifgroup : Void*) : RPC_STATUS

  # Params # ifgroup : Void* [In],forcedeactivation : UInt32 [In]
  fun RpcServerInterfaceGroupDeactivate(ifgroup : Void*, forcedeactivation : UInt32) : RPC_STATUS

  # Params # ifgroup : Void* [In],bindingvector : RPC_BINDING_VECTOR** [In]
  fun RpcServerInterfaceGroupInqBindings(ifgroup : Void*, bindingvector : RPC_BINDING_VECTOR**) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In]
  fun I_RpcNegotiateTransferSyntax(message : RPC_MESSAGE*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In]
  fun I_RpcGetBuffer(message : RPC_MESSAGE*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In],objectuuid : Guid* [In]
  fun I_RpcGetBufferWithObject(message : RPC_MESSAGE*, objectuuid : Guid*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In]
  fun I_RpcSendReceive(message : RPC_MESSAGE*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In]
  fun I_RpcFreeBuffer(message : RPC_MESSAGE*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In]
  fun I_RpcSend(message : RPC_MESSAGE*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In],size : UInt32 [In]
  fun I_RpcReceive(message : RPC_MESSAGE*, size : UInt32) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In]
  fun I_RpcFreePipeBuffer(message : RPC_MESSAGE*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In],newsize : UInt32 [In]
  fun I_RpcReallocPipeBuffer(message : RPC_MESSAGE*, newsize : UInt32) : RPC_STATUS

  # Params # mutex : Void** [In]
  fun I_RpcRequestMutex(mutex : Void**)

  # Params # mutex : Void* [In]
  fun I_RpcClearMutex(mutex : Void*)

  # Params # mutex : Void* [In]
  fun I_RpcDeleteMutex(mutex : Void*)

  # Params # size : UInt32 [In]
  fun I_RpcAllocate(size : UInt32) : Void*

  # Params # object : Void* [In]
  fun I_RpcFree(object : Void*)

  # Params # milliseconds : UInt32 [In]
  fun I_RpcPauseExecution(milliseconds : UInt32)

  # Params # 
  fun I_RpcGetExtendedError : RPC_STATUS

  # Params # handle : Void* [In],actualtype : UInt8 [In],idltype : UInt8 [In],marshaldirection : LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION [In]
  fun I_RpcSystemHandleTypeSpecificWork(handle : Void*, actualtype : UInt8, idltype : UInt8, marshaldirection : LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION) : RPC_STATUS

  # Params # 
  fun I_RpcGetCurrentCallHandle : Void*

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],rpcinterfaceinformation : RPC_SERVER_INTERFACE* [In]
  fun I_RpcNsInterfaceExported(entrynamesyntax : UInt32, entryname : UInt16*, rpcinterfaceinformation : RPC_SERVER_INTERFACE*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],rpcinterfaceinformation : RPC_SERVER_INTERFACE* [In]
  fun I_RpcNsInterfaceUnexported(entrynamesyntax : UInt32, entryname : UInt16*, rpcinterfaceinformation : RPC_SERVER_INTERFACE*) : RPC_STATUS

  # Params # binding : Void* [In],stringbinding : UInt16** [In]
  fun I_RpcBindingToStaticStringBindingW(binding : Void*, stringbinding : UInt16**) : RPC_STATUS

  # Params # binding : Void* [In],securitycontexthandle : Void** [In]
  fun I_RpcBindingInqSecurityContext(binding : Void*, securitycontexthandle : Void**) : RPC_STATUS

  # Params # binding : Void* [In],keyinfo : Void* [In]
  fun I_RpcBindingInqSecurityContextKeyInfo(binding : Void*, keyinfo : Void*) : RPC_STATUS

  # Params # binding : Void* [In],wireid : UInt8* [In]
  fun I_RpcBindingInqWireIdForSnego(binding : Void*, wireid : UInt8*) : RPC_STATUS

  # Params # binding : Void* [In],marshalledtargetinfosize : UInt32* [In],marshalledtargetinfo : UInt8** [In]
  fun I_RpcBindingInqMarshalledTargetInfo(binding : Void*, marshalledtargetinfosize : UInt32*, marshalledtargetinfo : UInt8**) : RPC_STATUS

  # Params # binding : Void* [In],pid : UInt32* [In]
  fun I_RpcBindingInqLocalClientPID(binding : Void*, pid : UInt32*) : RPC_STATUS

  # Params # binding : Void* [In],asynchandle : Void** [In]
  fun I_RpcBindingHandleToAsyncHandle(binding : Void*, asynchandle : Void**) : RPC_STATUS

  # Params # binding : Void* [In],entrynamesyntax : UInt32 [In],entryname : UInt16* [In]
  fun I_RpcNsBindingSetEntryNameW(binding : Void*, entrynamesyntax : UInt32, entryname : UInt16*) : RPC_STATUS

  # Params # binding : Void* [In],entrynamesyntax : UInt32 [In],entryname : UInt8* [In]
  fun I_RpcNsBindingSetEntryNameA(binding : Void*, entrynamesyntax : UInt32, entryname : UInt8*) : RPC_STATUS

  # Params # networkaddress : UInt8* [In],protseq : UInt8* [In],maxcalls : UInt32 [In],endpoint : UInt8* [In],securitydescriptor : Void* [In],policy : Void* [In]
  fun I_RpcServerUseProtseqEp2A(networkaddress : UInt8*, protseq : UInt8*, maxcalls : UInt32, endpoint : UInt8*, securitydescriptor : Void*, policy : Void*) : RPC_STATUS

  # Params # networkaddress : UInt16* [In],protseq : UInt16* [In],maxcalls : UInt32 [In],endpoint : UInt16* [In],securitydescriptor : Void* [In],policy : Void* [In]
  fun I_RpcServerUseProtseqEp2W(networkaddress : UInt16*, protseq : UInt16*, maxcalls : UInt32, endpoint : UInt16*, securitydescriptor : Void*, policy : Void*) : RPC_STATUS

  # Params # networkaddress : UInt16* [In],protseq : UInt16* [In],maxcalls : UInt32 [In],securitydescriptor : Void* [In],policy : Void* [In]
  fun I_RpcServerUseProtseq2W(networkaddress : UInt16*, protseq : UInt16*, maxcalls : UInt32, securitydescriptor : Void*, policy : Void*) : RPC_STATUS

  # Params # networkaddress : UInt8* [In],protseq : UInt8* [In],maxcalls : UInt32 [In],securitydescriptor : Void* [In],policy : Void* [In]
  fun I_RpcServerUseProtseq2A(networkaddress : UInt8*, protseq : UInt8*, maxcalls : UInt32, securitydescriptor : Void*, policy : Void*) : RPC_STATUS

  # Params # protseq : UInt16* [In],endpoint : UInt16* [In],ifspec : Void* [In]
  fun I_RpcServerStartService(protseq : UInt16*, endpoint : UInt16*, ifspec : Void*) : RPC_STATUS

  # Params # binding : Void* [In],dynamicendpoint : UInt16** [In]
  fun I_RpcBindingInqDynamicEndpointW(binding : Void*, dynamicendpoint : UInt16**) : RPC_STATUS

  # Params # binding : Void* [In],dynamicendpoint : UInt8** [In]
  fun I_RpcBindingInqDynamicEndpointA(binding : Void*, dynamicendpoint : UInt8**) : RPC_STATUS

  # Params # context : Void* [In]
  fun I_RpcServerCheckClientRestriction(context : Void*) : RPC_STATUS

  # Params # binding : Void* [In],type : UInt32* [In]
  fun I_RpcBindingInqTransportType(binding : Void*, type : UInt32*) : RPC_STATUS

  # Params # rpcifhandle : Void* [In],transfersyntaxes : RPC_TRANSFER_SYNTAX* [In],transfersyntaxsize : UInt32 [In],transfersyntaxcount : UInt32* [In]
  fun I_RpcIfInqTransferSyntaxes(rpcifhandle : Void*, transfersyntaxes : RPC_TRANSFER_SYNTAX*, transfersyntaxsize : UInt32, transfersyntaxcount : UInt32*) : RPC_STATUS

  # Params # uuid : Guid* [In]
  fun I_UuidCreate(uuid : Guid*) : RPC_STATUS

  # Params # sourcebinding : Void* [In],destinationbinding : Void** [In]
  fun I_RpcBindingCopy(sourcebinding : Void*, destinationbinding : Void**) : RPC_STATUS

  # Params # bindinghandle : Void* [In],clientlocalflag : UInt32* [In]
  fun I_RpcBindingIsClientLocal(bindinghandle : Void*, clientlocalflag : UInt32*) : RPC_STATUS

  # Params # servername : UInt16* [In],servicename : UInt16* [In],networkoptions : UInt16* [In],binding : Void** [In]
  fun I_RpcBindingCreateNP(servername : UInt16*, servicename : UInt16*, networkoptions : UInt16*, binding : Void**) : RPC_STATUS

  # Params # 
  fun I_RpcSsDontSerializeContext

  # Params # pforwardfunction : RPC_FORWARD_FUNCTION* [In]
  fun I_RpcServerRegisterForwardFunction(pforwardfunction : RPC_FORWARD_FUNCTION*) : RPC_STATUS

  # Params # 
  fun I_RpcServerInqAddressChangeFn : RPC_ADDRESS_CHANGE_FN*

  # Params # paddresschangefn : RPC_ADDRESS_CHANGE_FN* [In]
  fun I_RpcServerSetAddressChangeFn(paddresschangefn : RPC_ADDRESS_CHANGE_FN*) : RPC_STATUS

  # Params # binding : Void* [In],buffer : Void* [In],buffersize : UInt32* [In],addressformat : UInt32* [In]
  fun I_RpcServerInqLocalConnAddress(binding : Void*, buffer : Void*, buffersize : UInt32*, addressformat : UInt32*) : RPC_STATUS

  # Params # binding : Void* [In],buffer : Void* [In],buffersize : UInt32* [In],addressformat : UInt32* [In]
  fun I_RpcServerInqRemoteConnAddress(binding : Void*, buffer : Void*, buffersize : UInt32*, addressformat : UInt32*) : RPC_STATUS

  # Params # 
  fun I_RpcSessionStrictContextHandle

  # Params # 
  fun I_RpcTurnOnEEInfoPropagation : RPC_STATUS

  # Params # type : UInt32* [In]
  fun I_RpcServerInqTransportType(type : UInt32*) : RPC_STATUS

  # Params # status : RPC_STATUS [In]
  fun I_RpcMapWin32Status(status : RPC_STATUS) : Int32

  # Params # rpcstatus : RPC_STATUS [In],calloutstate : RDR_CALLOUT_STATE* [In],dllname : UInt16* [In]
  fun I_RpcRecordCalloutFailure(rpcstatus : RPC_STATUS, calloutstate : RDR_CALLOUT_STATE*, dllname : UInt16*)

  # Params # 
  fun I_RpcMgmtEnableDedicatedThreadPool : RPC_STATUS

  # Params # ppsecuritydescriptor : Void** [In]
  fun I_RpcGetDefaultSD(ppsecuritydescriptor : Void**) : RPC_STATUS

  # Params # binding : Void* [In],desiredaccess : UInt32 [In],clientprocess : Void** [In]
  fun I_RpcOpenClientProcess(binding : Void*, desiredaccess : UInt32, clientprocess : Void**) : RPC_STATUS

  # Params # binding : Void* [In],serverlocalflag : UInt32* [In]
  fun I_RpcBindingIsServerLocal(binding : Void*, serverlocalflag : UInt32*) : RPC_STATUS

  # Params # hbinding : Void* [In],option : UInt32 [In],optionvalue : LibC::UINT_PTR [In]
  fun I_RpcBindingSetPrivateOption(hbinding : Void*, option : UInt32, optionvalue : LibC::UINT_PTR) : RPC_STATUS

  # Params # binding : Void* [In],hevent : Void* [In]
  fun I_RpcServerSubscribeForDisconnectNotification(binding : Void*, hevent : Void*) : RPC_STATUS

  # Params # binding : Void* [In],associationid : UInt32* [In]
  fun I_RpcServerGetAssociationID(binding : Void*, associationid : UInt32*) : RPC_STATUS

  # Params # 
  fun I_RpcServerDisableExceptionFilter : Int32

  # Params # binding : Void* [In],hevent : Void* [In],subscriptionid : Guid* [In]
  fun I_RpcServerSubscribeForDisconnectNotification2(binding : Void*, hevent : Void*, subscriptionid : Guid*) : RPC_STATUS

  # Params # binding : Void* [In],subscriptionid : Guid [In]
  fun I_RpcServerUnsubscribeForDisconnectNotification(binding : Void*, subscriptionid : Guid) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],ifspec : Void* [In],bindingvec : RPC_BINDING_VECTOR* [In],objectuuidvec : UUID_VECTOR* [In]
  fun RpcNsBindingExportA(entrynamesyntax : UInt32, entryname : UInt8*, ifspec : Void*, bindingvec : RPC_BINDING_VECTOR*, objectuuidvec : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],ifspec : Void* [In],objectuuidvec : UUID_VECTOR* [In]
  fun RpcNsBindingUnexportA(entrynamesyntax : UInt32, entryname : UInt8*, ifspec : Void*, objectuuidvec : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],ifspec : Void* [In],bindingvec : RPC_BINDING_VECTOR* [In],objectuuidvec : UUID_VECTOR* [In]
  fun RpcNsBindingExportW(entrynamesyntax : UInt32, entryname : UInt16*, ifspec : Void*, bindingvec : RPC_BINDING_VECTOR*, objectuuidvec : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],ifspec : Void* [In],objectuuidvec : UUID_VECTOR* [In]
  fun RpcNsBindingUnexportW(entrynamesyntax : UInt32, entryname : UInt16*, ifspec : Void*, objectuuidvec : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],ifspec : Void* [In],objectvector : UUID_VECTOR* [In]
  fun RpcNsBindingExportPnPA(entrynamesyntax : UInt32, entryname : UInt8*, ifspec : Void*, objectvector : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],ifspec : Void* [In],objectvector : UUID_VECTOR* [In]
  fun RpcNsBindingUnexportPnPA(entrynamesyntax : UInt32, entryname : UInt8*, ifspec : Void*, objectvector : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],ifspec : Void* [In],objectvector : UUID_VECTOR* [In]
  fun RpcNsBindingExportPnPW(entrynamesyntax : UInt32, entryname : UInt16*, ifspec : Void*, objectvector : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],ifspec : Void* [In],objectvector : UUID_VECTOR* [In]
  fun RpcNsBindingUnexportPnPW(entrynamesyntax : UInt32, entryname : UInt16*, ifspec : Void*, objectvector : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],ifspec : Void* [In],objuuid : Guid* [In],bindingmaxcount : UInt32 [In],lookupcontext : Void** [In]
  fun RpcNsBindingLookupBeginA(entrynamesyntax : UInt32, entryname : UInt8*, ifspec : Void*, objuuid : Guid*, bindingmaxcount : UInt32, lookupcontext : Void**) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],ifspec : Void* [In],objuuid : Guid* [In],bindingmaxcount : UInt32 [In],lookupcontext : Void** [In]
  fun RpcNsBindingLookupBeginW(entrynamesyntax : UInt32, entryname : UInt16*, ifspec : Void*, objuuid : Guid*, bindingmaxcount : UInt32, lookupcontext : Void**) : RPC_STATUS

  # Params # lookupcontext : Void* [In],bindingvec : RPC_BINDING_VECTOR** [In]
  fun RpcNsBindingLookupNext(lookupcontext : Void*, bindingvec : RPC_BINDING_VECTOR**) : RPC_STATUS

  # Params # lookupcontext : Void** [In]
  fun RpcNsBindingLookupDone(lookupcontext : Void**) : RPC_STATUS

  # Params # groupnamesyntax : GROUP_NAME_SYNTAX [In],groupname : UInt8* [In]
  fun RpcNsGroupDeleteA(groupnamesyntax : GROUP_NAME_SYNTAX, groupname : UInt8*) : RPC_STATUS

  # Params # groupnamesyntax : UInt32 [In],groupname : UInt8* [In],membernamesyntax : UInt32 [In],membername : UInt8* [In]
  fun RpcNsGroupMbrAddA(groupnamesyntax : UInt32, groupname : UInt8*, membernamesyntax : UInt32, membername : UInt8*) : RPC_STATUS

  # Params # groupnamesyntax : UInt32 [In],groupname : UInt8* [In],membernamesyntax : UInt32 [In],membername : UInt8* [In]
  fun RpcNsGroupMbrRemoveA(groupnamesyntax : UInt32, groupname : UInt8*, membernamesyntax : UInt32, membername : UInt8*) : RPC_STATUS

  # Params # groupnamesyntax : UInt32 [In],groupname : UInt8* [In],membernamesyntax : UInt32 [In],inquirycontext : Void** [In]
  fun RpcNsGroupMbrInqBeginA(groupnamesyntax : UInt32, groupname : UInt8*, membernamesyntax : UInt32, inquirycontext : Void**) : RPC_STATUS

  # Params # inquirycontext : Void* [In],membername : UInt8** [In]
  fun RpcNsGroupMbrInqNextA(inquirycontext : Void*, membername : UInt8**) : RPC_STATUS

  # Params # groupnamesyntax : GROUP_NAME_SYNTAX [In],groupname : UInt16* [In]
  fun RpcNsGroupDeleteW(groupnamesyntax : GROUP_NAME_SYNTAX, groupname : UInt16*) : RPC_STATUS

  # Params # groupnamesyntax : UInt32 [In],groupname : UInt16* [In],membernamesyntax : UInt32 [In],membername : UInt16* [In]
  fun RpcNsGroupMbrAddW(groupnamesyntax : UInt32, groupname : UInt16*, membernamesyntax : UInt32, membername : UInt16*) : RPC_STATUS

  # Params # groupnamesyntax : UInt32 [In],groupname : UInt16* [In],membernamesyntax : UInt32 [In],membername : UInt16* [In]
  fun RpcNsGroupMbrRemoveW(groupnamesyntax : UInt32, groupname : UInt16*, membernamesyntax : UInt32, membername : UInt16*) : RPC_STATUS

  # Params # groupnamesyntax : UInt32 [In],groupname : UInt16* [In],membernamesyntax : UInt32 [In],inquirycontext : Void** [In]
  fun RpcNsGroupMbrInqBeginW(groupnamesyntax : UInt32, groupname : UInt16*, membernamesyntax : UInt32, inquirycontext : Void**) : RPC_STATUS

  # Params # inquirycontext : Void* [In],membername : UInt16** [In]
  fun RpcNsGroupMbrInqNextW(inquirycontext : Void*, membername : UInt16**) : RPC_STATUS

  # Params # inquirycontext : Void** [In]
  fun RpcNsGroupMbrInqDone(inquirycontext : Void**) : RPC_STATUS

  # Params # profilenamesyntax : UInt32 [In],profilename : UInt8* [In]
  fun RpcNsProfileDeleteA(profilenamesyntax : UInt32, profilename : UInt8*) : RPC_STATUS

  # Params # profilenamesyntax : UInt32 [In],profilename : UInt8* [In],ifid : RPC_IF_ID* [In],membernamesyntax : UInt32 [In],membername : UInt8* [In],priority : UInt32 [In],annotation : UInt8* [In]
  fun RpcNsProfileEltAddA(profilenamesyntax : UInt32, profilename : UInt8*, ifid : RPC_IF_ID*, membernamesyntax : UInt32, membername : UInt8*, priority : UInt32, annotation : UInt8*) : RPC_STATUS

  # Params # profilenamesyntax : UInt32 [In],profilename : UInt8* [In],ifid : RPC_IF_ID* [In],membernamesyntax : UInt32 [In],membername : UInt8* [In]
  fun RpcNsProfileEltRemoveA(profilenamesyntax : UInt32, profilename : UInt8*, ifid : RPC_IF_ID*, membernamesyntax : UInt32, membername : UInt8*) : RPC_STATUS

  # Params # profilenamesyntax : UInt32 [In],profilename : UInt8* [In],inquirytype : UInt32 [In],ifid : RPC_IF_ID* [In],versoption : UInt32 [In],membernamesyntax : UInt32 [In],membername : UInt8* [In],inquirycontext : Void** [In]
  fun RpcNsProfileEltInqBeginA(profilenamesyntax : UInt32, profilename : UInt8*, inquirytype : UInt32, ifid : RPC_IF_ID*, versoption : UInt32, membernamesyntax : UInt32, membername : UInt8*, inquirycontext : Void**) : RPC_STATUS

  # Params # inquirycontext : Void* [In],ifid : RPC_IF_ID* [In],membername : UInt8** [In],priority : UInt32* [In],annotation : UInt8** [In]
  fun RpcNsProfileEltInqNextA(inquirycontext : Void*, ifid : RPC_IF_ID*, membername : UInt8**, priority : UInt32*, annotation : UInt8**) : RPC_STATUS

  # Params # profilenamesyntax : UInt32 [In],profilename : UInt16* [In]
  fun RpcNsProfileDeleteW(profilenamesyntax : UInt32, profilename : UInt16*) : RPC_STATUS

  # Params # profilenamesyntax : UInt32 [In],profilename : UInt16* [In],ifid : RPC_IF_ID* [In],membernamesyntax : UInt32 [In],membername : UInt16* [In],priority : UInt32 [In],annotation : UInt16* [In]
  fun RpcNsProfileEltAddW(profilenamesyntax : UInt32, profilename : UInt16*, ifid : RPC_IF_ID*, membernamesyntax : UInt32, membername : UInt16*, priority : UInt32, annotation : UInt16*) : RPC_STATUS

  # Params # profilenamesyntax : UInt32 [In],profilename : UInt16* [In],ifid : RPC_IF_ID* [In],membernamesyntax : UInt32 [In],membername : UInt16* [In]
  fun RpcNsProfileEltRemoveW(profilenamesyntax : UInt32, profilename : UInt16*, ifid : RPC_IF_ID*, membernamesyntax : UInt32, membername : UInt16*) : RPC_STATUS

  # Params # profilenamesyntax : UInt32 [In],profilename : UInt16* [In],inquirytype : UInt32 [In],ifid : RPC_IF_ID* [In],versoption : UInt32 [In],membernamesyntax : UInt32 [In],membername : UInt16* [In],inquirycontext : Void** [In]
  fun RpcNsProfileEltInqBeginW(profilenamesyntax : UInt32, profilename : UInt16*, inquirytype : UInt32, ifid : RPC_IF_ID*, versoption : UInt32, membernamesyntax : UInt32, membername : UInt16*, inquirycontext : Void**) : RPC_STATUS

  # Params # inquirycontext : Void* [In],ifid : RPC_IF_ID* [In],membername : UInt16** [In],priority : UInt32* [In],annotation : UInt16** [In]
  fun RpcNsProfileEltInqNextW(inquirycontext : Void*, ifid : RPC_IF_ID*, membername : UInt16**, priority : UInt32*, annotation : UInt16**) : RPC_STATUS

  # Params # inquirycontext : Void** [In]
  fun RpcNsProfileEltInqDone(inquirycontext : Void**) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],inquirycontext : Void** [In]
  fun RpcNsEntryObjectInqBeginA(entrynamesyntax : UInt32, entryname : UInt8*, inquirycontext : Void**) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],inquirycontext : Void** [In]
  fun RpcNsEntryObjectInqBeginW(entrynamesyntax : UInt32, entryname : UInt16*, inquirycontext : Void**) : RPC_STATUS

  # Params # inquirycontext : Void* [In],objuuid : Guid* [In]
  fun RpcNsEntryObjectInqNext(inquirycontext : Void*, objuuid : Guid*) : RPC_STATUS

  # Params # inquirycontext : Void** [In]
  fun RpcNsEntryObjectInqDone(inquirycontext : Void**) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],expandedname : UInt8** [In]
  fun RpcNsEntryExpandNameA(entrynamesyntax : UInt32, entryname : UInt8*, expandedname : UInt8**) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],ifid : RPC_IF_ID* [In],versoption : UInt32 [In],objectuuidvec : UUID_VECTOR* [In]
  fun RpcNsMgmtBindingUnexportA(entrynamesyntax : UInt32, entryname : UInt8*, ifid : RPC_IF_ID*, versoption : UInt32, objectuuidvec : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In]
  fun RpcNsMgmtEntryCreateA(entrynamesyntax : UInt32, entryname : UInt8*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In]
  fun RpcNsMgmtEntryDeleteA(entrynamesyntax : UInt32, entryname : UInt8*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],ifidvec : RPC_IF_ID_VECTOR** [In]
  fun RpcNsMgmtEntryInqIfIdsA(entrynamesyntax : UInt32, entryname : UInt8*, ifidvec : RPC_IF_ID_VECTOR**) : RPC_STATUS

  # Params # nshandle : Void* [In],expirationage : UInt32 [In]
  fun RpcNsMgmtHandleSetExpAge(nshandle : Void*, expirationage : UInt32) : RPC_STATUS

  # Params # expirationage : UInt32* [In]
  fun RpcNsMgmtInqExpAge(expirationage : UInt32*) : RPC_STATUS

  # Params # expirationage : UInt32 [In]
  fun RpcNsMgmtSetExpAge(expirationage : UInt32) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],expandedname : UInt16** [In]
  fun RpcNsEntryExpandNameW(entrynamesyntax : UInt32, entryname : UInt16*, expandedname : UInt16**) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],ifid : RPC_IF_ID* [In],versoption : UInt32 [In],objectuuidvec : UUID_VECTOR* [In]
  fun RpcNsMgmtBindingUnexportW(entrynamesyntax : UInt32, entryname : UInt16*, ifid : RPC_IF_ID*, versoption : UInt32, objectuuidvec : UUID_VECTOR*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In]
  fun RpcNsMgmtEntryCreateW(entrynamesyntax : UInt32, entryname : UInt16*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In]
  fun RpcNsMgmtEntryDeleteW(entrynamesyntax : UInt32, entryname : UInt16*) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],ifidvec : RPC_IF_ID_VECTOR** [In]
  fun RpcNsMgmtEntryInqIfIdsW(entrynamesyntax : UInt32, entryname : UInt16*, ifidvec : RPC_IF_ID_VECTOR**) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt8* [In],ifspec : Void* [In],objuuid : Guid* [In],importcontext : Void** [In]
  fun RpcNsBindingImportBeginA(entrynamesyntax : UInt32, entryname : UInt8*, ifspec : Void*, objuuid : Guid*, importcontext : Void**) : RPC_STATUS

  # Params # entrynamesyntax : UInt32 [In],entryname : UInt16* [In],ifspec : Void* [In],objuuid : Guid* [In],importcontext : Void** [In]
  fun RpcNsBindingImportBeginW(entrynamesyntax : UInt32, entryname : UInt16*, ifspec : Void*, objuuid : Guid*, importcontext : Void**) : RPC_STATUS

  # Params # importcontext : Void* [In],binding : Void** [In]
  fun RpcNsBindingImportNext(importcontext : Void*, binding : Void**) : RPC_STATUS

  # Params # importcontext : Void** [In]
  fun RpcNsBindingImportDone(importcontext : Void**) : RPC_STATUS

  # Params # bindingvec : RPC_BINDING_VECTOR* [In],binding : Void** [In]
  fun RpcNsBindingSelect(bindingvec : RPC_BINDING_VECTOR*, binding : Void**) : RPC_STATUS

  # Params # pasync : RPC_ASYNC_STATE* [In]
  fun RpcAsyncRegisterInfo(pasync : RPC_ASYNC_STATE*) : RPC_STATUS

  # Params # pasync : RPC_ASYNC_STATE* [In],size : UInt32 [In]
  fun RpcAsyncInitializeHandle(pasync : RPC_ASYNC_STATE*, size : UInt32) : RPC_STATUS

  # Params # pasync : RPC_ASYNC_STATE* [In]
  fun RpcAsyncGetCallStatus(pasync : RPC_ASYNC_STATE*) : RPC_STATUS

  # Params # pasync : RPC_ASYNC_STATE* [In],reply : Void* [In]
  fun RpcAsyncCompleteCall(pasync : RPC_ASYNC_STATE*, reply : Void*) : RPC_STATUS

  # Params # pasync : RPC_ASYNC_STATE* [In],exceptioncode : UInt32 [In]
  fun RpcAsyncAbortCall(pasync : RPC_ASYNC_STATE*, exceptioncode : UInt32) : RPC_STATUS

  # Params # pasync : RPC_ASYNC_STATE* [In],fabort : LibC::BOOL [In]
  fun RpcAsyncCancelCall(pasync : RPC_ASYNC_STATE*, fabort : LibC::BOOL) : RPC_STATUS

  # Params # enumhandle : RPC_ERROR_ENUM_HANDLE* [In]
  fun RpcErrorStartEnumeration(enumhandle : RPC_ERROR_ENUM_HANDLE*) : RPC_STATUS

  # Params # enumhandle : RPC_ERROR_ENUM_HANDLE* [In],copystrings : LibC::BOOL [In],errorinfo : RPC_EXTENDED_ERROR_INFO* [In]
  fun RpcErrorGetNextRecord(enumhandle : RPC_ERROR_ENUM_HANDLE*, copystrings : LibC::BOOL, errorinfo : RPC_EXTENDED_ERROR_INFO*) : RPC_STATUS

  # Params # enumhandle : RPC_ERROR_ENUM_HANDLE* [In]
  fun RpcErrorEndEnumeration(enumhandle : RPC_ERROR_ENUM_HANDLE*) : RPC_STATUS

  # Params # enumhandle : RPC_ERROR_ENUM_HANDLE* [In]
  fun RpcErrorResetEnumeration(enumhandle : RPC_ERROR_ENUM_HANDLE*) : RPC_STATUS

  # Params # enumhandle : RPC_ERROR_ENUM_HANDLE* [In],records : Int32* [In]
  fun RpcErrorGetNumberOfRecords(enumhandle : RPC_ERROR_ENUM_HANDLE*, records : Int32*) : RPC_STATUS

  # Params # enumhandle : RPC_ERROR_ENUM_HANDLE* [In],errorblob : Void** [In],blobsize : LibC::UINT_PTR* [In]
  fun RpcErrorSaveErrorInfo(enumhandle : RPC_ERROR_ENUM_HANDLE*, errorblob : Void**, blobsize : LibC::UINT_PTR*) : RPC_STATUS

  # Params # errorblob : Void* [In],blobsize : LibC::UINT_PTR [In],enumhandle : RPC_ERROR_ENUM_HANDLE* [In]
  fun RpcErrorLoadErrorInfo(errorblob : Void*, blobsize : LibC::UINT_PTR, enumhandle : RPC_ERROR_ENUM_HANDLE*) : RPC_STATUS

  # Params # errorinfo : RPC_EXTENDED_ERROR_INFO* [In]
  fun RpcErrorAddRecord(errorinfo : RPC_EXTENDED_ERROR_INFO*) : RPC_STATUS

  # Params # 
  fun RpcErrorClearInformation

  # Params # clientbinding : Void* [In],impersonateonreturn : LibC::BOOL [In],reserved1 : Void* [In],pexpirationtime : LARGE_INTEGER* [In],reserved2 : LUID [In],reserved3 : UInt32 [In],reserved4 : Void* [In],pauthzclientcontext : Void** [In]
  fun RpcGetAuthorizationContextForClient(clientbinding : Void*, impersonateonreturn : LibC::BOOL, reserved1 : Void*, pexpirationtime : LARGE_INTEGER*, reserved2 : LUID, reserved3 : UInt32, reserved4 : Void*, pauthzclientcontext : Void**) : RPC_STATUS

  # Params # pauthzclientcontext : Void** [In]
  fun RpcFreeAuthorizationContext(pauthzclientcontext : Void**) : RPC_STATUS

  # Params # serverbindinghandle : Void* [In],usercontext : Void* [In]
  fun RpcSsContextLockExclusive(serverbindinghandle : Void*, usercontext : Void*) : RPC_STATUS

  # Params # serverbindinghandle : Void* [In],usercontext : Void* [In]
  fun RpcSsContextLockShared(serverbindinghandle : Void*, usercontext : Void*) : RPC_STATUS

  # Params # clientbinding : Void* [In],rpccallattributes : Void* [In]
  fun RpcServerInqCallAttributesW(clientbinding : Void*, rpccallattributes : Void*) : RPC_STATUS

  # Params # clientbinding : Void* [In],rpccallattributes : Void* [In]
  fun RpcServerInqCallAttributesA(clientbinding : Void*, rpccallattributes : Void*) : RPC_STATUS

  # Params # binding : Void* [In],notification : RPC_NOTIFICATIONS [In],notificationtype : RPC_NOTIFICATION_TYPES [In],notificationinfo : RPC_ASYNC_NOTIFICATION_INFO* [In]
  fun RpcServerSubscribeForNotification(binding : Void*, notification : RPC_NOTIFICATIONS, notificationtype : RPC_NOTIFICATION_TYPES, notificationinfo : RPC_ASYNC_NOTIFICATION_INFO*) : RPC_STATUS

  # Params # binding : Void* [In],notification : RPC_NOTIFICATIONS [In],notificationsqueued : UInt32* [In]
  fun RpcServerUnsubscribeForNotification(binding : Void*, notification : RPC_NOTIFICATIONS, notificationsqueued : UInt32*) : RPC_STATUS

  # Params # pasync : RPC_ASYNC_STATE* [In],binding : Void* [In],ifspec : Void* [In]
  fun RpcBindingBind(pasync : RPC_ASYNC_STATE*, binding : Void*, ifspec : Void*) : RPC_STATUS

  # Params # binding : Void* [In]
  fun RpcBindingUnbind(binding : Void*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In],pasync : RPC_ASYNC_STATE* [In]
  fun I_RpcAsyncSetHandle(message : RPC_MESSAGE*, pasync : RPC_ASYNC_STATE*) : RPC_STATUS

  # Params # pasync : RPC_ASYNC_STATE* [In],exceptioncode : UInt32 [In]
  fun I_RpcAsyncAbortCall(pasync : RPC_ASYNC_STATE*, exceptioncode : UInt32) : RPC_STATUS

  # Params # exceptioncode : UInt32 [In]
  fun I_RpcExceptionFilter(exceptioncode : UInt32) : Int32

  # Params # binding : Void* [In],tokenid : LUID* [In],authenticationid : LUID* [In],modifiedid : LUID* [In]
  fun I_RpcBindingInqClientTokenAttributes(binding : Void*, tokenid : LUID*, authenticationid : LUID*, modifiedid : LUID*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In]
  fun I_RpcNsGetBuffer(message : RPC_MESSAGE*) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In],handle : Void** [In]
  fun I_RpcNsSendReceive(message : RPC_MESSAGE*, handle : Void**) : RPC_STATUS

  # Params # message : RPC_MESSAGE* [In],status : RPC_STATUS [In]
  fun I_RpcNsRaiseException(message : RPC_MESSAGE*, status : RPC_STATUS)

  # Params # message : RPC_MESSAGE* [In]
  fun I_RpcReBindBuffer(message : RPC_MESSAGE*) : RPC_STATUS

  # Params # ccontext : LibC::IntPtrT [In]
  fun NDRCContextBinding(ccontext : LibC::IntPtrT) : Void*

  # Params # ccontext : LibC::IntPtrT [In],pbuff : Void* [In]
  fun NDRCContextMarshall(ccontext : LibC::IntPtrT, pbuff : Void*)

  # Params # pccontext : LibC::IntPtrT* [In],hbinding : Void* [In],pbuff : Void* [In],datarepresentation : UInt32 [In]
  fun NDRCContextUnmarshall(pccontext : LibC::IntPtrT*, hbinding : Void*, pbuff : Void*, datarepresentation : UInt32)

  # Params # ccontext : NDR_SCONTEXT_1* [In],pbuff : Void* [In],userrundownin : NDR_RUNDOWN [In]
  fun NDRSContextMarshall(ccontext : NDR_SCONTEXT_1*, pbuff : Void*, userrundownin : NDR_RUNDOWN)

  # Params # pbuff : Void* [In],datarepresentation : UInt32 [In]
  fun NDRSContextUnmarshall(pbuff : Void*, datarepresentation : UInt32) : NDR_SCONTEXT_1*

  # Params # bindinghandle : Void* [In],ccontext : NDR_SCONTEXT_1* [In],pbuff : Void* [In],userrundownin : NDR_RUNDOWN [In]
  fun NDRSContextMarshallEx(bindinghandle : Void*, ccontext : NDR_SCONTEXT_1*, pbuff : Void*, userrundownin : NDR_RUNDOWN)

  # Params # bindinghandle : Void* [In],ccontext : NDR_SCONTEXT_1* [In],pbuff : Void* [In],userrundownin : NDR_RUNDOWN [In],ctxguard : Void* [In],flags : UInt32 [In]
  fun NDRSContextMarshall2(bindinghandle : Void*, ccontext : NDR_SCONTEXT_1*, pbuff : Void*, userrundownin : NDR_RUNDOWN, ctxguard : Void*, flags : UInt32)

  # Params # bindinghandle : Void* [In],pbuff : Void* [In],datarepresentation : UInt32 [In]
  fun NDRSContextUnmarshallEx(bindinghandle : Void*, pbuff : Void*, datarepresentation : UInt32) : NDR_SCONTEXT_1*

  # Params # bindinghandle : Void* [In],pbuff : Void* [In],datarepresentation : UInt32 [In],ctxguard : Void* [In],flags : UInt32 [In]
  fun NDRSContextUnmarshall2(bindinghandle : Void*, pbuff : Void*, datarepresentation : UInt32, ctxguard : Void*, flags : UInt32) : NDR_SCONTEXT_1*

  # Params # contexthandle : Void** [In]
  fun RpcSsDestroyClientContext(contexthandle : Void**)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],formatchar : UInt8 [In]
  fun NdrSimpleTypeMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, formatchar : UInt8)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrPointerMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrSimpleStructMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantStructMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantVaryingStructMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrComplexStructMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrFixedArrayMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantArrayMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantVaryingArrayMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrVaryingArrayMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrComplexArrayMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrNonConformantStringMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantStringMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrEncapsulatedUnionMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrNonEncapsulatedUnionMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrByteCountPointerMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrXmitOrRepAsMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrUserMarshalMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrInterfacePointerMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],contexthandle : LibC::IntPtrT [In],fcheck : Int32 [In]
  fun NdrClientContextMarshall(pstubmsg : MIDL_STUB_MESSAGE*, contexthandle : LibC::IntPtrT, fcheck : Int32)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],contexthandle : NDR_SCONTEXT_1* [In],rundownroutine : NDR_RUNDOWN [In]
  fun NdrServerContextMarshall(pstubmsg : MIDL_STUB_MESSAGE*, contexthandle : NDR_SCONTEXT_1*, rundownroutine : NDR_RUNDOWN)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],contexthandle : NDR_SCONTEXT_1* [In],rundownroutine : NDR_RUNDOWN [In],pformat : UInt8* [In]
  fun NdrServerContextNewMarshall(pstubmsg : MIDL_STUB_MESSAGE*, contexthandle : NDR_SCONTEXT_1*, rundownroutine : NDR_RUNDOWN, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],formatchar : UInt8 [In]
  fun NdrSimpleTypeUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, formatchar : UInt8)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrRangeUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : Void* [In],cachesize : UInt32 [In],flags : UInt32 [In]
  fun NdrCorrelationInitialize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : Void*, cachesize : UInt32, flags : UInt32)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In]
  fun NdrCorrelationPass(pstubmsg : MIDL_STUB_MESSAGE*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In]
  fun NdrCorrelationFree(pstubmsg : MIDL_STUB_MESSAGE*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrPointerUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrSimpleStructUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrConformantStructUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrConformantVaryingStructUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrComplexStructUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrFixedArrayUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrConformantArrayUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrConformantVaryingArrayUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrVaryingArrayUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrComplexArrayUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrNonConformantStringUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrConformantStringUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrEncapsulatedUnionUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrNonEncapsulatedUnionUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrByteCountPointerUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrXmitOrRepAsUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrUserMarshalUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : UInt8** [In],pformat : UInt8* [In],fmustalloc : UInt8 [In]
  fun NdrInterfacePointerUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : UInt8**, pformat : UInt8*, fmustalloc : UInt8) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pcontexthandle : LibC::IntPtrT* [In],bindhandle : Void* [In]
  fun NdrClientContextUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, pcontexthandle : LibC::IntPtrT*, bindhandle : Void*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In]
  fun NdrServerContextUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*) : NDR_SCONTEXT_1*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrContextHandleInitialize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : NDR_SCONTEXT_1*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrServerContextNewUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : NDR_SCONTEXT_1*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrPointerBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrSimpleStructBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantStructBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantVaryingStructBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrComplexStructBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrFixedArrayBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantArrayBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantVaryingArrayBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrVaryingArrayBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrComplexArrayBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantStringBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrNonConformantStringBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrEncapsulatedUnionBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrNonEncapsulatedUnionBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrByteCountPointerBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrXmitOrRepAsBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrUserMarshalBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrInterfacePointerBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrContextHandleSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrPointerMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrSimpleStructMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrConformantStructMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrConformantVaryingStructMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrComplexStructMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrFixedArrayMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrConformantArrayMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrConformantVaryingArrayMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrVaryingArrayMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrComplexArrayMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrConformantStringMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrNonConformantStringMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrEncapsulatedUnionMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrNonEncapsulatedUnionMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrXmitOrRepAsMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrUserMarshalMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrInterfacePointerMemorySize(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*) : UInt32

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrPointerFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrSimpleStructFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantStructFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantVaryingStructFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrComplexStructFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrFixedArrayFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantArrayFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrConformantVaryingArrayFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrVaryingArrayFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrComplexArrayFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrEncapsulatedUnionFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrNonEncapsulatedUnionFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrByteCountPointerFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrXmitOrRepAsFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrUserMarshalFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : UInt8* [In],pformat : UInt8* [In]
  fun NdrInterfacePointerFree(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : UInt8*, pformat : UInt8*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In],numberparams : Int32 [In]
  fun NdrConvert2(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*, numberparams : Int32)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In]
  fun NdrConvert(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*)

  # Params # pflags : UInt32* [In],pbuffer : UInt8* [In],formatchar : UInt8 [In]
  fun NdrUserMarshalSimpleTypeConvert(pflags : UInt32*, pbuffer : UInt8*, formatchar : UInt8) : UInt8*

  # Params # prpcmsg : RPC_MESSAGE* [In],pstubmsg : MIDL_STUB_MESSAGE* [In],pstubdescriptor : MIDL_STUB_DESC* [In],procnum : UInt32 [In]
  fun NdrClientInitializeNew(prpcmsg : RPC_MESSAGE*, pstubmsg : MIDL_STUB_MESSAGE*, pstubdescriptor : MIDL_STUB_DESC*, procnum : UInt32)

  # Params # prpcmsg : RPC_MESSAGE* [In],pstubmsg : MIDL_STUB_MESSAGE* [In],pstubdescriptor : MIDL_STUB_DESC* [In]
  fun NdrServerInitializeNew(prpcmsg : RPC_MESSAGE*, pstubmsg : MIDL_STUB_MESSAGE*, pstubdescriptor : MIDL_STUB_DESC*) : UInt8*

  # Params # prpcmsg : RPC_MESSAGE* [In],pstubmsg : MIDL_STUB_MESSAGE* [In],pstubdescriptor : MIDL_STUB_DESC* [In],requestedbuffersize : UInt32 [In]
  fun NdrServerInitializePartial(prpcmsg : RPC_MESSAGE*, pstubmsg : MIDL_STUB_MESSAGE*, pstubdescriptor : MIDL_STUB_DESC*, requestedbuffersize : UInt32)

  # Params # prpcmsg : RPC_MESSAGE* [In],pstubmsg : MIDL_STUB_MESSAGE* [In],pstubdescriptor : MIDL_STUB_DESC* [In],procnum : UInt32 [In]
  fun NdrClientInitialize(prpcmsg : RPC_MESSAGE*, pstubmsg : MIDL_STUB_MESSAGE*, pstubdescriptor : MIDL_STUB_DESC*, procnum : UInt32)

  # Params # prpcmsg : RPC_MESSAGE* [In],pstubmsg : MIDL_STUB_MESSAGE* [In],pstubdescriptor : MIDL_STUB_DESC* [In]
  fun NdrServerInitialize(prpcmsg : RPC_MESSAGE*, pstubmsg : MIDL_STUB_MESSAGE*, pstubdescriptor : MIDL_STUB_DESC*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pstubdescriptor : MIDL_STUB_DESC* [In],prpcmsg : RPC_MESSAGE* [In]
  fun NdrServerInitializeUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, pstubdescriptor : MIDL_STUB_DESC*, prpcmsg : RPC_MESSAGE*) : UInt8*

  # Params # prpcmsg : RPC_MESSAGE* [In],pstubmsg : MIDL_STUB_MESSAGE* [In]
  fun NdrServerInitializeMarshall(prpcmsg : RPC_MESSAGE*, pstubmsg : MIDL_STUB_MESSAGE*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],bufferlength : UInt32 [In],handle : Void* [In]
  fun NdrGetBuffer(pstubmsg : MIDL_STUB_MESSAGE*, bufferlength : UInt32, handle : Void*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],bufferlength : UInt32 [In],handle : Void* [In]
  fun NdrNsGetBuffer(pstubmsg : MIDL_STUB_MESSAGE*, bufferlength : UInt32, handle : Void*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pbufferend : UInt8* [In]
  fun NdrSendReceive(pstubmsg : MIDL_STUB_MESSAGE*, pbufferend : UInt8*) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pbufferend : UInt8* [In],pautohandle : Void** [In]
  fun NdrNsSendReceive(pstubmsg : MIDL_STUB_MESSAGE*, pbufferend : UInt8*, pautohandle : Void**) : UInt8*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In]
  fun NdrFreeBuffer(pstubmsg : MIDL_STUB_MESSAGE*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pversion : RPC_VERSION* [In]
  fun NdrGetDcomProtocolVersion(pstubmsg : MIDL_STUB_MESSAGE*, pversion : RPC_VERSION*) : HRESULT

  # Params # pstubdescriptor : MIDL_STUB_DESC* [In],pformat : UInt8* [In]
  fun NdrClientCall2(pstubdescriptor : MIDL_STUB_DESC*, pformat : UInt8*) : CLIENT_CALL_RETURN

  # Params # pstubdescriptor : MIDL_STUB_DESC* [In],pformat : UInt8* [In]
  fun NdrAsyncClientCall(pstubdescriptor : MIDL_STUB_DESC*, pformat : UInt8*) : CLIENT_CALL_RETURN

  # Params # pstubdescriptor : MIDL_STUB_DESC* [In],pformat : UInt8* [In]
  fun NdrDcomAsyncClientCall(pstubdescriptor : MIDL_STUB_DESC*, pformat : UInt8*) : CLIENT_CALL_RETURN

  # Params # prpcmsg : RPC_MESSAGE* [In]
  fun NdrAsyncServerCall(prpcmsg : RPC_MESSAGE*)

  # Params # pthis : IRpcStubBuffer [In],pchannel : IRpcChannelBuffer [In],prpcmsg : RPC_MESSAGE* [In],pdwstubphase : UInt32* [In]
  fun NdrDcomAsyncStubCall(pthis : IRpcStubBuffer, pchannel : IRpcChannelBuffer, prpcmsg : RPC_MESSAGE*, pdwstubphase : UInt32*) : Int32

  # Params # pthis : Void* [In],pchannel : Void* [In],prpcmsg : RPC_MESSAGE* [In],pdwstubphase : UInt32* [In]
  fun NdrStubCall2(pthis : Void*, pchannel : Void*, prpcmsg : RPC_MESSAGE*, pdwstubphase : UInt32*) : Int32

  # Params # prpcmsg : RPC_MESSAGE* [In]
  fun NdrServerCall2(prpcmsg : RPC_MESSAGE*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pcommstatus : UInt32* [In],pfaultstatus : UInt32* [In],status : RPC_STATUS [In]
  fun NdrMapCommAndFaultStatus(pstubmsg : MIDL_STUB_MESSAGE*, pcommstatus : UInt32*, pfaultstatus : UInt32*, status : RPC_STATUS) : RPC_STATUS

  # Params # size : LibC::UINT_PTR [In]
  fun RpcSsAllocate(size : LibC::UINT_PTR) : Void*

  # Params # 
  fun RpcSsDisableAllocate

  # Params # 
  fun RpcSsEnableAllocate

  # Params # nodetofree : Void* [In]
  fun RpcSsFree(nodetofree : Void*)

  # Params # 
  fun RpcSsGetThreadHandle : Void*

  # Params # clientalloc : RPC_CLIENT_ALLOC [In],clientfree : RPC_CLIENT_FREE [In]
  fun RpcSsSetClientAllocFree(clientalloc : RPC_CLIENT_ALLOC, clientfree : RPC_CLIENT_FREE)

  # Params # id : Void* [In]
  fun RpcSsSetThreadHandle(id : Void*)

  # Params # clientalloc : RPC_CLIENT_ALLOC [In],clientfree : RPC_CLIENT_FREE [In],oldclientalloc : RPC_CLIENT_ALLOC* [In],oldclientfree : RPC_CLIENT_FREE* [In]
  fun RpcSsSwapClientAllocFree(clientalloc : RPC_CLIENT_ALLOC, clientfree : RPC_CLIENT_FREE, oldclientalloc : RPC_CLIENT_ALLOC*, oldclientfree : RPC_CLIENT_FREE*)

  # Params # size : LibC::UINT_PTR [In],pstatus : RPC_STATUS* [In]
  fun RpcSmAllocate(size : LibC::UINT_PTR, pstatus : RPC_STATUS*) : Void*

  # Params # pnodetofree : Void* [In]
  fun RpcSmClientFree(pnodetofree : Void*) : RPC_STATUS

  # Params # contexthandle : Void** [In]
  fun RpcSmDestroyClientContext(contexthandle : Void**) : RPC_STATUS

  # Params # 
  fun RpcSmDisableAllocate : RPC_STATUS

  # Params # 
  fun RpcSmEnableAllocate : RPC_STATUS

  # Params # nodetofree : Void* [In]
  fun RpcSmFree(nodetofree : Void*) : RPC_STATUS

  # Params # pstatus : RPC_STATUS* [In]
  fun RpcSmGetThreadHandle(pstatus : RPC_STATUS*) : Void*

  # Params # clientalloc : RPC_CLIENT_ALLOC [In],clientfree : RPC_CLIENT_FREE [In]
  fun RpcSmSetClientAllocFree(clientalloc : RPC_CLIENT_ALLOC, clientfree : RPC_CLIENT_FREE) : RPC_STATUS

  # Params # id : Void* [In]
  fun RpcSmSetThreadHandle(id : Void*) : RPC_STATUS

  # Params # clientalloc : RPC_CLIENT_ALLOC [In],clientfree : RPC_CLIENT_FREE [In],oldclientalloc : RPC_CLIENT_ALLOC* [In],oldclientfree : RPC_CLIENT_FREE* [In]
  fun RpcSmSwapClientAllocFree(clientalloc : RPC_CLIENT_ALLOC, clientfree : RPC_CLIENT_FREE, oldclientalloc : RPC_CLIENT_ALLOC*, oldclientfree : RPC_CLIENT_FREE*) : RPC_STATUS

  # Params # pmessage : MIDL_STUB_MESSAGE* [In]
  fun NdrRpcSsEnableAllocate(pmessage : MIDL_STUB_MESSAGE*)

  # Params # pmessage : MIDL_STUB_MESSAGE* [In]
  fun NdrRpcSsDisableAllocate(pmessage : MIDL_STUB_MESSAGE*)

  # Params # pmessage : MIDL_STUB_MESSAGE* [In]
  fun NdrRpcSmSetClientToOsf(pmessage : MIDL_STUB_MESSAGE*)

  # Params # size : LibC::UINT_PTR [In]
  fun NdrRpcSmClientAllocate(size : LibC::UINT_PTR) : Void*

  # Params # nodetofree : Void* [In]
  fun NdrRpcSmClientFree(nodetofree : Void*)

  # Params # size : LibC::UINT_PTR [In]
  fun NdrRpcSsDefaultAllocate(size : LibC::UINT_PTR) : Void*

  # Params # nodetofree : Void* [In]
  fun NdrRpcSsDefaultFree(nodetofree : Void*)

  # Params # numberofpointers : UInt32 [In],xlatside : XLAT_SIDE [In]
  fun NdrFullPointerXlatInit(numberofpointers : UInt32, xlatside : XLAT_SIDE) : FULL_PTR_XLAT_TABLES*

  # Params # pxlattables : FULL_PTR_XLAT_TABLES* [In]
  fun NdrFullPointerXlatFree(pxlattables : FULL_PTR_XLAT_TABLES*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],len : LibC::UINT_PTR [In]
  fun NdrAllocate(pstubmsg : MIDL_STUB_MESSAGE*, len : LibC::UINT_PTR) : Void*

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pformat : UInt8* [In],argaddr : Void* [In]
  fun NdrClearOutParameters(pstubmsg : MIDL_STUB_MESSAGE*, pformat : UInt8*, argaddr : Void*)

  # Params # size : LibC::UINT_PTR [In]
  fun NdrOleAllocate(size : LibC::UINT_PTR) : Void*

  # Params # nodetofree : Void* [In]
  fun NdrOleFree(nodetofree : Void*)

  # Params # pflags : UInt32* [In],informationlevel : UInt32 [In],pmarshalinfo : NDR_USER_MARSHAL_INFO* [In]
  fun NdrGetUserMarshalInfo(pflags : UInt32*, informationlevel : UInt32, pmarshalinfo : NDR_USER_MARSHAL_INFO*) : RPC_STATUS

  # Params # pstub : IRpcStubBuffer [In],pserverif : RPC_SERVER_INTERFACE* [In]
  fun NdrCreateServerInterfaceFromStub(pstub : IRpcStubBuffer, pserverif : RPC_SERVER_INTERFACE*) : RPC_STATUS

  # Params # pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],nprocnum : UInt32 [In],preturnvalue : Void* [In]
  fun NdrClientCall3(pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, nprocnum : UInt32, preturnvalue : Void*) : CLIENT_CALL_RETURN

  # Params # pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],nprocnum : UInt32 [In],preturnvalue : Void* [In]
  fun Ndr64AsyncClientCall(pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, nprocnum : UInt32, preturnvalue : Void*) : CLIENT_CALL_RETURN

  # Params # pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],nprocnum : UInt32 [In],preturnvalue : Void* [In]
  fun Ndr64DcomAsyncClientCall(pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, nprocnum : UInt32, preturnvalue : Void*) : CLIENT_CALL_RETURN

  # Params # prpcmsg : RPC_MESSAGE* [In]
  fun Ndr64AsyncServerCall64(prpcmsg : RPC_MESSAGE*)

  # Params # prpcmsg : RPC_MESSAGE* [In]
  fun Ndr64AsyncServerCallAll(prpcmsg : RPC_MESSAGE*)

  # Params # pthis : IRpcStubBuffer [In],pchannel : IRpcChannelBuffer [In],prpcmsg : RPC_MESSAGE* [In],pdwstubphase : UInt32* [In]
  fun Ndr64DcomAsyncStubCall(pthis : IRpcStubBuffer, pchannel : IRpcChannelBuffer, prpcmsg : RPC_MESSAGE*, pdwstubphase : UInt32*) : Int32

  # Params # pthis : Void* [In],pchannel : Void* [In],prpcmsg : RPC_MESSAGE* [In],pdwstubphase : UInt32* [In]
  fun NdrStubCall3(pthis : Void*, pchannel : Void*, prpcmsg : RPC_MESSAGE*, pdwstubphase : UInt32*) : Int32

  # Params # prpcmsg : RPC_MESSAGE* [In]
  fun NdrServerCallAll(prpcmsg : RPC_MESSAGE*)

  # Params # prpcmsg : RPC_MESSAGE* [In]
  fun NdrServerCallNdr64(prpcmsg : RPC_MESSAGE*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : Void* [In]
  fun NdrPartialIgnoreClientMarshall(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : Void*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : Void** [In]
  fun NdrPartialIgnoreServerUnmarshall(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : Void**)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],pmemory : Void* [In]
  fun NdrPartialIgnoreClientBufferSize(pstubmsg : MIDL_STUB_MESSAGE*, pmemory : Void*)

  # Params # pstubmsg : MIDL_STUB_MESSAGE* [In],ppmemory : Void** [In],pformat : UInt8* [In]
  fun NdrPartialIgnoreServerInitialize(pstubmsg : MIDL_STUB_MESSAGE*, ppmemory : Void**, pformat : UInt8*)

  # Params # asynchandle : Void* [In],pbuffer : Void* [In]
  fun RpcUserFree(asynchandle : Void*, pbuffer : Void*)

  # Params # userstate : Void* [In],allocfn : MIDL_ES_ALLOC [In],writefn : MIDL_ES_WRITE [In],phandle : Void** [In]
  fun MesEncodeIncrementalHandleCreate(userstate : Void*, allocfn : MIDL_ES_ALLOC, writefn : MIDL_ES_WRITE, phandle : Void**) : RPC_STATUS

  # Params # userstate : Void* [In],readfn : MIDL_ES_READ [In],phandle : Void** [In]
  fun MesDecodeIncrementalHandleCreate(userstate : Void*, readfn : MIDL_ES_READ, phandle : Void**) : RPC_STATUS

  # Params # handle : Void* [In],userstate : Void* [In],allocfn : MIDL_ES_ALLOC [In],writefn : MIDL_ES_WRITE [In],readfn : MIDL_ES_READ [In],operation : MIDL_ES_CODE [In]
  fun MesIncrementalHandleReset(handle : Void*, userstate : Void*, allocfn : MIDL_ES_ALLOC, writefn : MIDL_ES_WRITE, readfn : MIDL_ES_READ, operation : MIDL_ES_CODE) : RPC_STATUS

  # Params # pbuffer : PSTR [In],buffersize : UInt32 [In],pencodedsize : UInt32* [In],phandle : Void** [In]
  fun MesEncodeFixedBufferHandleCreate(pbuffer : PSTR, buffersize : UInt32, pencodedsize : UInt32*, phandle : Void**) : RPC_STATUS

  # Params # pbuffer : Int8** [In],pencodedsize : UInt32* [In],phandle : Void** [In]
  fun MesEncodeDynBufferHandleCreate(pbuffer : Int8**, pencodedsize : UInt32*, phandle : Void**) : RPC_STATUS

  # Params # buffer : PSTR [In],buffersize : UInt32 [In],phandle : Void** [In]
  fun MesDecodeBufferHandleCreate(buffer : PSTR, buffersize : UInt32, phandle : Void**) : RPC_STATUS

  # Params # handle : Void* [In],handlestyle : UInt32 [In],operation : MIDL_ES_CODE [In],pbuffer : Int8** [In],buffersize : UInt32 [In],pencodedsize : UInt32* [In]
  fun MesBufferHandleReset(handle : Void*, handlestyle : UInt32, operation : MIDL_ES_CODE, pbuffer : Int8**, buffersize : UInt32, pencodedsize : UInt32*) : RPC_STATUS

  # Params # handle : Void* [In]
  fun MesHandleFree(handle : Void*) : RPC_STATUS

  # Params # handle : Void* [In],pinterfaceid : RPC_SYNTAX_IDENTIFIER* [In],pprocnum : UInt32* [In]
  fun MesInqProcEncodingId(handle : Void*, pinterfaceid : RPC_SYNTAX_IDENTIFIER*, pprocnum : UInt32*) : RPC_STATUS

  # Params # param0 : Void* [In]
  fun NdrMesSimpleTypeAlignSize(param0 : Void*) : LibC::UINT_PTR

  # Params # handle : Void* [In],pobject : Void* [In],size : Int16 [In]
  fun NdrMesSimpleTypeDecode(handle : Void*, pobject : Void*, size : Int16)

  # Params # handle : Void* [In],pstubdesc : MIDL_STUB_DESC* [In],pobject : Void* [In],size : Int16 [In]
  fun NdrMesSimpleTypeEncode(handle : Void*, pstubdesc : MIDL_STUB_DESC*, pobject : Void*, size : Int16)

  # Params # handle : Void* [In],pstubdesc : MIDL_STUB_DESC* [In],pformatstring : UInt8* [In],pobject : Void* [In]
  fun NdrMesTypeAlignSize(handle : Void*, pstubdesc : MIDL_STUB_DESC*, pformatstring : UInt8*, pobject : Void*) : LibC::UINT_PTR

  # Params # handle : Void* [In],pstubdesc : MIDL_STUB_DESC* [In],pformatstring : UInt8* [In],pobject : Void* [In]
  fun NdrMesTypeEncode(handle : Void*, pstubdesc : MIDL_STUB_DESC*, pformatstring : UInt8*, pobject : Void*)

  # Params # handle : Void* [In],pstubdesc : MIDL_STUB_DESC* [In],pformatstring : UInt8* [In],pobject : Void* [In]
  fun NdrMesTypeDecode(handle : Void*, pstubdesc : MIDL_STUB_DESC*, pformatstring : UInt8*, pobject : Void*)

  # Params # handle : Void* [In],ppicklinginfo : MIDL_TYPE_PICKLING_INFO* [In],pstubdesc : MIDL_STUB_DESC* [In],pformatstring : UInt8* [In],pobject : Void* [In]
  fun NdrMesTypeAlignSize2(handle : Void*, ppicklinginfo : MIDL_TYPE_PICKLING_INFO*, pstubdesc : MIDL_STUB_DESC*, pformatstring : UInt8*, pobject : Void*) : LibC::UINT_PTR

  # Params # handle : Void* [In],ppicklinginfo : MIDL_TYPE_PICKLING_INFO* [In],pstubdesc : MIDL_STUB_DESC* [In],pformatstring : UInt8* [In],pobject : Void* [In]
  fun NdrMesTypeEncode2(handle : Void*, ppicklinginfo : MIDL_TYPE_PICKLING_INFO*, pstubdesc : MIDL_STUB_DESC*, pformatstring : UInt8*, pobject : Void*)

  # Params # handle : Void* [In],ppicklinginfo : MIDL_TYPE_PICKLING_INFO* [In],pstubdesc : MIDL_STUB_DESC* [In],pformatstring : UInt8* [In],pobject : Void* [In]
  fun NdrMesTypeDecode2(handle : Void*, ppicklinginfo : MIDL_TYPE_PICKLING_INFO*, pstubdesc : MIDL_STUB_DESC*, pformatstring : UInt8*, pobject : Void*)

  # Params # handle : Void* [In],ppicklinginfo : MIDL_TYPE_PICKLING_INFO* [In],pstubdesc : MIDL_STUB_DESC* [In],pformatstring : UInt8* [In],pobject : Void* [In]
  fun NdrMesTypeFree2(handle : Void*, ppicklinginfo : MIDL_TYPE_PICKLING_INFO*, pstubdesc : MIDL_STUB_DESC*, pformatstring : UInt8*, pobject : Void*)

  # Params # handle : Void* [In],pstubdesc : MIDL_STUB_DESC* [In],pformatstring : UInt8* [In]
  fun NdrMesProcEncodeDecode(handle : Void*, pstubdesc : MIDL_STUB_DESC*, pformatstring : UInt8*)

  # Params # handle : Void* [In],pstubdesc : MIDL_STUB_DESC* [In],pformatstring : UInt8* [In]
  fun NdrMesProcEncodeDecode2(handle : Void*, pstubdesc : MIDL_STUB_DESC*, pformatstring : UInt8*) : CLIENT_CALL_RETURN

  # Params # handle : Void* [In],ppicklinginfo : MIDL_TYPE_PICKLING_INFO* [In],pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],arrtypeoffset : UInt32** [In],ntypeindex : UInt32 [In],pobject : Void* [In]
  fun NdrMesTypeAlignSize3(handle : Void*, ppicklinginfo : MIDL_TYPE_PICKLING_INFO*, pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, arrtypeoffset : UInt32**, ntypeindex : UInt32, pobject : Void*) : LibC::UINT_PTR

  # Params # handle : Void* [In],ppicklinginfo : MIDL_TYPE_PICKLING_INFO* [In],pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],arrtypeoffset : UInt32** [In],ntypeindex : UInt32 [In],pobject : Void* [In]
  fun NdrMesTypeEncode3(handle : Void*, ppicklinginfo : MIDL_TYPE_PICKLING_INFO*, pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, arrtypeoffset : UInt32**, ntypeindex : UInt32, pobject : Void*)

  # Params # handle : Void* [In],ppicklinginfo : MIDL_TYPE_PICKLING_INFO* [In],pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],arrtypeoffset : UInt32** [In],ntypeindex : UInt32 [In],pobject : Void* [In]
  fun NdrMesTypeDecode3(handle : Void*, ppicklinginfo : MIDL_TYPE_PICKLING_INFO*, pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, arrtypeoffset : UInt32**, ntypeindex : UInt32, pobject : Void*)

  # Params # handle : Void* [In],ppicklinginfo : MIDL_TYPE_PICKLING_INFO* [In],pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],arrtypeoffset : UInt32** [In],ntypeindex : UInt32 [In],pobject : Void* [In]
  fun NdrMesTypeFree3(handle : Void*, ppicklinginfo : MIDL_TYPE_PICKLING_INFO*, pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, arrtypeoffset : UInt32**, ntypeindex : UInt32, pobject : Void*)

  # Params # handle : Void* [In],pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],nprocnum : UInt32 [In],preturnvalue : Void* [In]
  fun NdrMesProcEncodeDecode3(handle : Void*, pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, nprocnum : UInt32, preturnvalue : Void*) : CLIENT_CALL_RETURN

  # Params # handle : Void* [In],pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],pobject : Void* [In],size : Int16 [In]
  fun NdrMesSimpleTypeDecodeAll(handle : Void*, pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, pobject : Void*, size : Int16)

  # Params # handle : Void* [In],pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In],pobject : Void* [In],size : Int16 [In]
  fun NdrMesSimpleTypeEncodeAll(handle : Void*, pproxyinfo : MIDL_STUBLESS_PROXY_INFO*, pobject : Void*, size : Int16)

  # Params # handle : Void* [In],pproxyinfo : MIDL_STUBLESS_PROXY_INFO* [In]
  fun NdrMesSimpleTypeAlignSizeAll(handle : Void*, pproxyinfo : MIDL_STUBLESS_PROXY_INFO*) : LibC::UINT_PTR

  # Params # context : CERT_CONTEXT* [In],flags : UInt32 [In],pbuffer : UInt16** [In]
  fun RpcCertGeneratePrincipalNameW(context : CERT_CONTEXT*, flags : UInt32, pbuffer : UInt16**) : RPC_STATUS

  # Params # context : CERT_CONTEXT* [In],flags : UInt32 [In],pbuffer : UInt8** [In]
  fun RpcCertGeneratePrincipalNameA(context : CERT_CONTEXT*, flags : UInt32, pbuffer : UInt8**) : RPC_STATUS
end
