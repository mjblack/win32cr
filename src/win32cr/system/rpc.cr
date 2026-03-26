require "./com.cr"
require "./../foundation.cr"
require "./io.cr"
require "./../security/cryptography.cr"

module Win32cr::System::Rpc
  extend self
  alias RPC_OBJECT_INQ_FN = Proc(LibC::GUID*, LibC::GUID*, Win32cr::System::Rpc::RPC_STATUS*, Void)

  alias RPC_IF_CALLBACK_FN = Proc(Void*, Void*, Win32cr::System::Rpc::RPC_STATUS)

  alias RPC_SECURITY_CALLBACK_FN = Proc(Void*, Void)

  alias RPC_NEW_HTTP_PROXY_CHANNEL = Proc(Win32cr::System::Rpc::RPC_HTTP_REDIRECTOR_STAGE, UInt16*, UInt16*, UInt16*, UInt16*, Void*, Void*, Void*, Void*, UInt32, UInt16**, UInt16**, Win32cr::System::Rpc::RPC_STATUS)

  alias RPC_HTTP_PROXY_FREE_STRING = Proc(UInt16*, Void)

  alias RPC_AUTH_KEY_RETRIEVAL_FN = Proc(Void*, UInt16*, UInt32, Void**, Win32cr::System::Rpc::RPC_STATUS*, Void)

  alias RPC_MGMT_AUTHORIZATION_FN = Proc(Void*, UInt32, Win32cr::System::Rpc::RPC_STATUS*, Int32)

  alias RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN = Proc(Void*, Void*, UInt32, Void)

  alias RPC_FORWARD_FUNCTION = Proc(LibC::GUID*, Win32cr::System::Rpc::RPC_VERSION*, LibC::GUID*, UInt8*, Void**, Win32cr::System::Rpc::RPC_STATUS)

  alias RPC_ADDRESS_CHANGE_FN = Proc(Void*, Void)

  alias RPC_DISPATCH_FUNCTION = Proc(Win32cr::System::Rpc::RPC_MESSAGE*, Void)

  alias PRPC_RUNDOWN = Proc(Void*, Void)

  alias RPCLT_PDU_FILTER_FUNC = Proc(Void*, UInt32, Int32, Void)

  alias RPC_SETFILTER_FUNC = Proc(Win32cr::System::Rpc::RPCLT_PDU_FILTER_FUNC, Void)

  alias RPC_BLOCKING_FN = Proc(Void*, Void*, Void*, Win32cr::System::Rpc::RPC_STATUS)

  alias I_RpcProxyIsValidMachineFn = Proc(UInt16*, UInt16*, UInt32, Win32cr::System::Rpc::RPC_STATUS)

  alias I_RpcProxyGetClientAddressFn = Proc(Void*, Win32cr::Foundation::PSTR, UInt32*, Win32cr::System::Rpc::RPC_STATUS)

  alias I_RpcProxyGetConnectionTimeoutFn = Proc(UInt32*, Win32cr::System::Rpc::RPC_STATUS)

  alias I_RpcPerformCalloutFn = Proc(Void*, Win32cr::System::Rpc::RDR_CALLOUT_STATE*, Win32cr::System::Rpc::RPC_HTTP_REDIRECTOR_STAGE, Win32cr::System::Rpc::RPC_STATUS)

  alias I_RpcFreeCalloutStateFn = Proc(Win32cr::System::Rpc::RDR_CALLOUT_STATE*, Void)

  alias I_RpcProxyGetClientSessionAndResourceUUID = Proc(Void*, Int32*, LibC::GUID*, Int32*, LibC::GUID*, Win32cr::System::Rpc::RPC_STATUS)

  alias I_RpcProxyFilterIfFn = Proc(Void*, LibC::GUID*, UInt16, Int32*, Win32cr::System::Rpc::RPC_STATUS)

  alias I_RpcProxyUpdatePerfCounterFn = Proc(Win32cr::System::Rpc::RpcProxyPerfCounters, Int32, UInt32, Void)

  alias I_RpcProxyUpdatePerfCounterBackendServerFn = Proc(UInt16*, Int32, Void)

  alias PFN_RPCNOTIFICATION_ROUTINE = Proc(Win32cr::System::Rpc::RPC_ASYNC_STATE*, Void*, Win32cr::System::Rpc::RPC_ASYNC_EVENT, Void)

  alias NDR_RUNDOWN = Proc(Void*, Void)

  alias NDR_NOTIFY_ROUTINE = Proc(Void)

  alias NDR_NOTIFY2_ROUTINE = Proc(UInt8, Void)

  alias EXPR_EVAL = Proc(Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, Void)

  alias GENERIC_BINDING_ROUTINE = Proc(Void*, Void*)

  alias GENERIC_UNBIND_ROUTINE = Proc(Void*, UInt8*, Void)

  alias XMIT_HELPER_ROUTINE = Proc(Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, Void)

  alias USER_MARSHAL_SIZING_ROUTINE = Proc(UInt32*, UInt32, Void*, UInt32)

  alias USER_MARSHAL_MARSHALLING_ROUTINE = Proc(UInt32*, UInt8*, Void*, UInt8*)

  alias USER_MARSHAL_UNMARSHALLING_ROUTINE = Proc(UInt32*, UInt8*, Void*, UInt8*)

  alias USER_MARSHAL_FREEING_ROUTINE = Proc(UInt32*, Void*, Void)

  alias CS_TYPE_NET_SIZE_ROUTINE = Proc(Void*, UInt32, UInt32, Win32cr::System::Rpc::IDL_CS_CONVERT*, UInt32*, UInt32*, Void)

  alias CS_TYPE_LOCAL_SIZE_ROUTINE = Proc(Void*, UInt32, UInt32, Win32cr::System::Rpc::IDL_CS_CONVERT*, UInt32*, UInt32*, Void)

  alias CS_TYPE_TO_NETCS_ROUTINE = Proc(Void*, UInt32, Void*, UInt32, UInt8*, UInt32*, UInt32*, Void)

  alias CS_TYPE_FROM_NETCS_ROUTINE = Proc(Void*, UInt32, UInt8*, UInt32, UInt32, Void*, UInt32*, UInt32*, Void)

  alias CS_TAG_GETTING_ROUTINE = Proc(Void*, Int32, UInt32*, UInt32*, UInt32*, UInt32*, Void)

  alias STUB_THUNK = Proc(Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, Void)

  alias SERVER_ROUTINE = Proc(Int32)

  alias RPC_CLIENT_ALLOC = Proc(LibC::UIntPtrT, Void*)

  alias RPC_CLIENT_FREE = Proc(Void*, Void)

  alias MIDL_ES_ALLOC = Proc(Void*, Int8**, UInt32*, Void)

  alias MIDL_ES_WRITE = Proc(Void*, Win32cr::Foundation::PSTR, UInt32, Void)

  alias MIDL_ES_READ = Proc(Void*, Int8**, UInt32*, Void)

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
  Cbndrcontext = 20_u32
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
  RPCPROXY_H_VERSION____ = 475_u32
  MidlInterceptionInfoVersionOne = 1_i32
  MidlWinrtTypeSerializationInfoVersionOne = 1_i32

  @[Flags]
  enum RPC_C_QOS_CAPABILITIES : UInt32
    RPC_C_QOS_CAPABILITIES_DEFAULT = 0_u32
    RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH = 1_u32
    RPC_C_QOS_CAPABILITIES_MAKE_FULLSIC = 2_u32
    RPC_C_QOS_CAPABILITIES_ANY_AUTHORITY = 4_u32
    RPC_C_QOS_CAPABILITIES_IGNORE_DELEGATE_FAILURE = 8_u32
    RPC_C_QOS_CAPABILITIES_LOCAL_MA_HINT = 16_u32
    RPC_C_QOS_CAPABILITIES_SCHANNEL_FULL_AUTH_IDENTITY = 32_u32
  end
  enum RPC_C_QOS_IDENTITY : UInt32
    RPC_C_QOS_IDENTITY_STATIC = 0_u32
    RPC_C_QOS_IDENTITY_DYNAMIC = 1_u32
  end
  enum RPC_C_AUTHN_INFO_TYPE : UInt32
    RPC_C_AUTHN_INFO_NONE = 0_u32
    RPC_C_AUTHN_INFO_TYPE_HTTP = 1_u32
  end
  @[Flags]
  enum RPC_C_HTTP_FLAGS : UInt32
    RPC_C_HTTP_FLAG_USE_SSL = 1_u32
    RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME = 2_u32
    RPC_C_HTTP_FLAG_IGNORE_CERT_CN_INVALID = 8_u32
    RPC_C_HTTP_FLAG_ENABLE_CERT_REVOCATION_CHECK = 16_u32
  end
  @[Flags]
  enum RPC_C_HTTP_AUTHN_TARGET : UInt32
    RPC_C_HTTP_AUTHN_TARGET_SERVER = 1_u32
    RPC_C_HTTP_AUTHN_TARGET_PROXY = 2_u32
  end
  enum RPC_STATUS
    RPC_S_INVALID_STRING_BINDING = 1700_i32
    RPC_S_WRONG_KIND_OF_BINDING = 1701_i32
    RPC_S_INVALID_BINDING = 1702_i32
    RPC_S_PROTSEQ_NOT_SUPPORTED = 1703_i32
    RPC_S_INVALID_RPC_PROTSEQ = 1704_i32
    RPC_S_INVALID_STRING_UUID = 1705_i32
    RPC_S_INVALID_ENDPOINT_FORMAT = 1706_i32
    RPC_S_INVALID_NET_ADDR = 1707_i32
    RPC_S_NO_ENDPOINT_FOUND = 1708_i32
    RPC_S_INVALID_TIMEOUT = 1709_i32
    RPC_S_OBJECT_NOT_FOUND = 1710_i32
    RPC_S_ALREADY_REGISTERED = 1711_i32
    RPC_S_TYPE_ALREADY_REGISTERED = 1712_i32
    RPC_S_ALREADY_LISTENING = 1713_i32
    RPC_S_NO_PROTSEQS_REGISTERED = 1714_i32
    RPC_S_NOT_LISTENING = 1715_i32
    RPC_S_UNKNOWN_MGR_TYPE = 1716_i32
    RPC_S_UNKNOWN_IF = 1717_i32
    RPC_S_NO_BINDINGS = 1718_i32
    RPC_S_NO_PROTSEQS = 1719_i32
    RPC_S_CANT_CREATE_ENDPOINT = 1720_i32
    RPC_S_OUT_OF_RESOURCES = 1721_i32
    RPC_S_SERVER_UNAVAILABLE = 1722_i32
    RPC_S_SERVER_TOO_BUSY = 1723_i32
    RPC_S_INVALID_NETWORK_OPTIONS = 1724_i32
    RPC_S_NO_CALL_ACTIVE = 1725_i32
    RPC_S_CALL_FAILED = 1726_i32
    RPC_S_CALL_FAILED_DNE = 1727_i32
    RPC_S_PROTOCOL_ERROR = 1728_i32
    RPC_S_PROXY_ACCESS_DENIED = 1729_i32
    RPC_S_UNSUPPORTED_TRANS_SYN = 1730_i32
    RPC_S_UNSUPPORTED_TYPE = 1732_i32
    RPC_S_INVALID_TAG = 1733_i32
    RPC_S_INVALID_BOUND = 1734_i32
    RPC_S_NO_ENTRY_NAME = 1735_i32
    RPC_S_INVALID_NAME_SYNTAX = 1736_i32
    RPC_S_UNSUPPORTED_NAME_SYNTAX = 1737_i32
    RPC_S_UUID_NO_ADDRESS = 1739_i32
    RPC_S_DUPLICATE_ENDPOINT = 1740_i32
    RPC_S_UNKNOWN_AUTHN_TYPE = 1741_i32
    RPC_S_MAX_CALLS_TOO_SMALL = 1742_i32
    RPC_S_STRING_TOO_LONG = 1743_i32
    RPC_S_PROTSEQ_NOT_FOUND = 1744_i32
    RPC_S_PROCNUM_OUT_OF_RANGE = 1745_i32
    RPC_S_BINDING_HAS_NO_AUTH = 1746_i32
    RPC_S_UNKNOWN_AUTHN_SERVICE = 1747_i32
    RPC_S_UNKNOWN_AUTHN_LEVEL = 1748_i32
    RPC_S_INVALID_AUTH_IDENTITY = 1749_i32
    RPC_S_UNKNOWN_AUTHZ_SERVICE = 1750_i32
    EPT_S_INVALID_ENTRY = 1751_i32
    EPT_S_CANT_PERFORM_OP = 1752_i32
    EPT_S_NOT_REGISTERED = 1753_i32
    RPC_S_NOTHING_TO_EXPORT = 1754_i32
    RPC_S_INCOMPLETE_NAME = 1755_i32
    RPC_S_INVALID_VERS_OPTION = 1756_i32
    RPC_S_NO_MORE_MEMBERS = 1757_i32
    RPC_S_NOT_ALL_OBJS_UNEXPORTED = 1758_i32
    RPC_S_INTERFACE_NOT_FOUND = 1759_i32
    RPC_S_ENTRY_ALREADY_EXISTS = 1760_i32
    RPC_S_ENTRY_NOT_FOUND = 1761_i32
    RPC_S_NAME_SERVICE_UNAVAILABLE = 1762_i32
    RPC_S_INVALID_NAF_ID = 1763_i32
    RPC_S_CANNOT_SUPPORT = 1764_i32
    RPC_S_NO_CONTEXT_AVAILABLE = 1765_i32
    RPC_S_INTERNAL_ERROR = 1766_i32
    RPC_S_ZERO_DIVIDE = 1767_i32
    RPC_S_ADDRESS_ERROR = 1768_i32
    RPC_S_FP_DIV_ZERO = 1769_i32
    RPC_S_FP_UNDERFLOW = 1770_i32
    RPC_S_FP_OVERFLOW = 1771_i32
    RPC_S_CALL_IN_PROGRESS = 1791_i32
    RPC_S_NO_MORE_BINDINGS = 1806_i32
    RPC_S_NO_INTERFACES = 1817_i32
    RPC_S_CALL_CANCELLED = 1818_i32
    RPC_S_BINDING_INCOMPLETE = 1819_i32
    RPC_S_COMM_FAILURE = 1820_i32
    RPC_S_UNSUPPORTED_AUTHN_LEVEL = 1821_i32
    RPC_S_NO_PRINC_NAME = 1822_i32
    RPC_S_NOT_RPC_ERROR = 1823_i32
    RPC_S_UUID_LOCAL_ONLY = 1824_i32
    RPC_S_SEC_PKG_ERROR = 1825_i32
    RPC_S_NOT_CANCELLED = 1826_i32
    RPC_S_COOKIE_AUTH_FAILED = 1833_i32
    RPC_S_DO_NOT_DISTURB = 1834_i32
    RPC_S_SYSTEM_HANDLE_COUNT_EXCEEDED = 1835_i32
    RPC_S_SYSTEM_HANDLE_TYPE_MISMATCH = 1836_i32
    RPC_S_GROUP_MEMBER_NOT_FOUND = 1898_i32
    EPT_S_CANT_CREATE = 1899_i32
    RPC_S_INVALID_OBJECT = 1900_i32
    RPC_S_SEND_INCOMPLETE = 1913_i32
    RPC_S_INVALID_ASYNC_HANDLE = 1914_i32
    RPC_S_INVALID_ASYNC_CALL = 1915_i32
    RPC_S_ENTRY_TYPE_MISMATCH = 1922_i32
    RPC_S_NOT_ALL_OBJS_EXPORTED = 1923_i32
    RPC_S_INTERFACE_NOT_EXPORTED = 1924_i32
    RPC_S_PROFILE_NOT_ADDED = 1925_i32
    RPC_S_PRF_ELT_NOT_ADDED = 1926_i32
    RPC_S_PRF_ELT_NOT_REMOVED = 1927_i32
    RPC_S_GRP_ELT_NOT_ADDED = 1928_i32
    RPC_S_GRP_ELT_NOT_REMOVED = 1929_i32
  end
  enum GROUP_NAME_SYNTAX : UInt32
    RPC_C_NS_SYNTAX_DEFAULT = 0_u32
    RPC_C_NS_SYNTAX_DCE = 3_u32
  end
  enum SEC_WINNT_AUTH_IDENTITY : UInt32
    SEC_WINNT_AUTH_IDENTITY_ANSI = 1_u32
    SEC_WINNT_AUTH_IDENTITY_UNICODE = 2_u32
  end
  @[Flags]
  enum RPC_BINDING_HANDLE_OPTIONS_FLAGS : UInt32
    RPC_BHO_NONCAUSAL = 1_u32
    RPC_BHO_DONTLINGER = 2_u32
  end
  enum RPC_HTTP_REDIRECTOR_STAGE
    RPCHTTP_RS_REDIRECT = 1_i32
    RPCHTTP_RS_ACCESS_1 = 2_i32
    RPCHTTP_RS_SESSION = 3_i32
    RPCHTTP_RS_ACCESS_2 = 4_i32
    RPCHTTP_RS_INTERFACE = 5_i32
  end
  enum RPC_ADDRESS_CHANGE_TYPE
    PROTOCOL_NOT_LOADED = 1_i32
    PROTOCOL_LOADED = 2_i32
    PROTOCOL_ADDRESS_CHANGE = 3_i32
  end
  enum LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION
    MarshalDirectionMarshal = 0_i32
    MarshalDirectionUnmarshal = 1_i32
  end
  enum RpcProxyPerfCounters
    RpcCurrentUniqueUser = 1_i32
    RpcBackEndConnectionAttempts = 2_i32
    RpcBackEndConnectionFailed = 3_i32
    RpcRequestsPerSecond = 4_i32
    RpcIncomingConnections = 5_i32
    RpcIncomingBandwidth = 6_i32
    RpcOutgoingBandwidth = 7_i32
    RpcAttemptedLbsDecisions = 8_i32
    RpcFailedLbsDecisions = 9_i32
    RpcAttemptedLbsMessages = 10_i32
    RpcFailedLbsMessages = 11_i32
    RpcLastCounter = 12_i32
  end
  enum RPC_NOTIFICATION_TYPES
    RpcNotificationTypeNone = 0_i32
    RpcNotificationTypeEvent = 1_i32
    RpcNotificationTypeApc = 2_i32
    RpcNotificationTypeIoc = 3_i32
    RpcNotificationTypeHwnd = 4_i32
    RpcNotificationTypeCallback = 5_i32
  end
  enum RPC_ASYNC_EVENT
    RpcCallComplete = 0_i32
    RpcSendComplete = 1_i32
    RpcReceiveComplete = 2_i32
    RpcClientDisconnect = 3_i32
    RpcClientCancel = 4_i32
  end
  enum ExtendedErrorParamTypes
    Eeptansistring = 1_i32
    Eeptunicodestring = 2_i32
    Eeptlongval = 3_i32
    Eeptshortval = 4_i32
    Eeptpointerval = 5_i32
    Eeptnone = 6_i32
    Eeptbinary = 7_i32
  end
  enum RpcLocalAddressFormat
    Rlafinvalid = 0_i32
    Rlafipv4 = 1_i32
    Rlafipv6 = 2_i32
  end
  enum RpcCallType
    Rctinvalid = 0_i32
    Rctnormal = 1_i32
    Rcttraining = 2_i32
    Rctguaranteed = 3_i32
  end
  enum RpcCallClientLocality
    Rcclinvalid = 0_i32
    Rccllocal = 1_i32
    Rcclremote = 2_i32
    Rcclclientunknownlocality = 3_i32
  end
  enum RPC_NOTIFICATIONS
    RpcNotificationCallNone = 0_i32
    RpcNotificationClientDisconnect = 1_i32
    RpcNotificationCallCancel = 2_i32
  end
  enum USER_MARSHAL_CB_TYPE
    USER_MARSHAL_CB_BUFFER_SIZE = 0_i32
    USER_MARSHAL_CB_MARSHALL = 1_i32
    USER_MARSHAL_CB_UNMARSHALL = 2_i32
    USER_MARSHAL_CB_FREE = 3_i32
  end
  enum IDL_CS_CONVERT
    IDL_CS_NO_CONVERT = 0_i32
    IDL_CS_IN_PLACE_CONVERT = 1_i32
    IDL_CS_NEW_BUFFER_CONVERT = 2_i32
  end
  enum XLAT_SIDE
    XLAT_SERVER = 1_i32
    XLAT_CLIENT = 2_i32
  end
  enum System_handle_t
    SYSTEM_HANDLE_FILE = 0_i32
    SYSTEM_HANDLE_SEMAPHORE = 1_i32
    SYSTEM_HANDLE_EVENT = 2_i32
    SYSTEM_HANDLE_MUTEX = 3_i32
    SYSTEM_HANDLE_PROCESS = 4_i32
    SYSTEM_HANDLE_TOKEN = 5_i32
    SYSTEM_HANDLE_SECTION = 6_i32
    SYSTEM_HANDLE_REG_KEY = 7_i32
    SYSTEM_HANDLE_THREAD = 8_i32
    SYSTEM_HANDLE_COMPOSITION_OBJECT = 9_i32
    SYSTEM_HANDLE_SOCKET = 10_i32
    SYSTEM_HANDLE_JOB = 11_i32
    SYSTEM_HANDLE_PIPE = 12_i32
    SYSTEM_HANDLE_MAX = 12_i32
    SYSTEM_HANDLE_INVALID = 255_i32
  end
  enum STUB_PHASE
    STUB_UNMARSHAL = 0_i32
    STUB_CALL_SERVER = 1_i32
    STUB_MARSHAL = 2_i32
    STUB_CALL_SERVER_NO_HRESULT = 3_i32
  end
  enum PROXY_PHASE
    PROXY_CALCSIZE = 0_i32
    PROXY_GETBUFFER = 1_i32
    PROXY_MARSHAL = 2_i32
    PROXY_SENDRECEIVE = 3_i32
    PROXY_UNMARSHAL = 4_i32
  end
  enum MIDL_ES_CODE
    MES_ENCODE = 0_i32
    MES_DECODE = 1_i32
    MES_ENCODE_NDR64 = 2_i32
  end
  enum MIDL_ES_HANDLE_STYLE
    MES_INCREMENTAL_HANDLE = 0_i32
    MES_FIXED_BUFFER_HANDLE = 1_i32
    MES_DYNAMIC_BUFFER_HANDLE = 2_i32
  end
  enum EXPR_TOKEN
    FC_EXPR_START = 0_i32
    FC_EXPR_ILLEGAL = 0_i32
    FC_EXPR_CONST32 = 1_i32
    FC_EXPR_CONST64 = 2_i32
    FC_EXPR_VAR = 3_i32
    FC_EXPR_OPER = 4_i32
    FC_EXPR_NOOP = 5_i32
    FC_EXPR_END = 6_i32
  end

  @[Extern]
  struct NDR_SCONTEXT_1
    property pad : Void*[2]
    property userContext : Void*
    def initialize(@pad : Void*[2], @userContext : Void*)
    end
  end

  @[Extern]
  struct RPC_BINDING_VECTOR
    property count : UInt32
    property binding_h : Void**
    def initialize(@count : UInt32, @binding_h : Void**)
    end
  end

  @[Extern]
  struct UUID_VECTOR
    property count : UInt32
    property uuid : LibC::GUID**
    def initialize(@count : UInt32, @uuid : LibC::GUID**)
    end
  end

  @[Extern]
  struct RPC_IF_ID
    property uuid : LibC::GUID
    property vers_major : UInt16
    property vers_minor : UInt16
    def initialize(@uuid : LibC::GUID, @vers_major : UInt16, @vers_minor : UInt16)
    end
  end

  @[Extern]
  struct RPC_PROTSEQ_VECTORA
    property count : UInt32
    property protseq : UInt8**
    def initialize(@count : UInt32, @protseq : UInt8**)
    end
  end

  @[Extern]
  struct RPC_PROTSEQ_VECTORW
    property count : UInt32
    property protseq : UInt16**
    def initialize(@count : UInt32, @protseq : UInt16**)
    end
  end

  @[Extern]
  struct RPC_POLICY
    property length : UInt32
    property endpoint_flags : UInt32
    property nic_flags : UInt32
    def initialize(@length : UInt32, @endpoint_flags : UInt32, @nic_flags : UInt32)
    end
  end

  @[Extern]
  struct RPC_STATS_VECTOR
    property count : UInt32
    property stats : UInt32*
    def initialize(@count : UInt32, @stats : UInt32*)
    end
  end

  @[Extern]
  struct RPC_IF_ID_VECTOR
    property count : UInt32
    property if_id : Win32cr::System::Rpc::RPC_IF_ID**
    def initialize(@count : UInt32, @if_id : Win32cr::System::Rpc::RPC_IF_ID**)
    end
  end

  @[Extern]
  struct RPC_SECURITY_QOS
    property version : UInt32
    property capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES
    property identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY
    property impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL
    def initialize(@version : UInt32, @capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES, @identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY, @impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL)
    end
  end

  @[Extern]
  struct SEC_WINNT_AUTH_IDENTITY_W
    property user : UInt16*
    property user_length : UInt32
    property domain : UInt16*
    property domain_length : UInt32
    property password : UInt16*
    property password_length : UInt32
    property flags : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY
    def initialize(@user : UInt16*, @user_length : UInt32, @domain : UInt16*, @domain_length : UInt32, @password : UInt16*, @password_length : UInt32, @flags : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY)
    end
  end

  @[Extern]
  struct SEC_WINNT_AUTH_IDENTITY_A
    property user : UInt8*
    property user_length : UInt32
    property domain : UInt8*
    property domain_length : UInt32
    property password : UInt8*
    property password_length : UInt32
    property flags : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY
    def initialize(@user : UInt8*, @user_length : UInt32, @domain : UInt8*, @domain_length : UInt32, @password : UInt8*, @password_length : UInt32, @flags : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY)
    end
  end

  @[Extern]
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_W
    property transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*
    property flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS
    property authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET
    property number_of_authn_schemes : UInt32
    property authn_schemes : UInt32*
    property server_certificate_subject : UInt16*
    def initialize(@transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*, @flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS, @authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET, @number_of_authn_schemes : UInt32, @authn_schemes : UInt32*, @server_certificate_subject : UInt16*)
    end
  end

  @[Extern]
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_A
    property transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*
    property flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS
    property authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET
    property number_of_authn_schemes : UInt32
    property authn_schemes : UInt32*
    property server_certificate_subject : UInt8*
    def initialize(@transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*, @flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS, @authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET, @number_of_authn_schemes : UInt32, @authn_schemes : UInt32*, @server_certificate_subject : UInt8*)
    end
  end

  @[Extern]
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_V2_W
    property transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*
    property flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS
    property authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET
    property number_of_authn_schemes : UInt32
    property authn_schemes : UInt32*
    property server_certificate_subject : UInt16*
    property proxy_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*
    property number_of_proxy_authn_schemes : UInt32
    property proxy_authn_schemes : UInt32*
    def initialize(@transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*, @flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS, @authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET, @number_of_authn_schemes : UInt32, @authn_schemes : UInt32*, @server_certificate_subject : UInt16*, @proxy_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*, @number_of_proxy_authn_schemes : UInt32, @proxy_authn_schemes : UInt32*)
    end
  end

  @[Extern]
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_V2_A
    property transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*
    property flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS
    property authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET
    property number_of_authn_schemes : UInt32
    property authn_schemes : UInt32*
    property server_certificate_subject : UInt8*
    property proxy_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*
    property number_of_proxy_authn_schemes : UInt32
    property proxy_authn_schemes : UInt32*
    def initialize(@transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*, @flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS, @authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET, @number_of_authn_schemes : UInt32, @authn_schemes : UInt32*, @server_certificate_subject : UInt8*, @proxy_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*, @number_of_proxy_authn_schemes : UInt32, @proxy_authn_schemes : UInt32*)
    end
  end

  @[Extern]
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_V3_W
    property transport_credentials : Void*
    property flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS
    property authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET
    property number_of_authn_schemes : UInt32
    property authn_schemes : UInt32*
    property server_certificate_subject : UInt16*
    property proxy_credentials : Void*
    property number_of_proxy_authn_schemes : UInt32
    property proxy_authn_schemes : UInt32*
    def initialize(@transport_credentials : Void*, @flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS, @authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET, @number_of_authn_schemes : UInt32, @authn_schemes : UInt32*, @server_certificate_subject : UInt16*, @proxy_credentials : Void*, @number_of_proxy_authn_schemes : UInt32, @proxy_authn_schemes : UInt32*)
    end
  end

  @[Extern]
  struct RPC_HTTP_TRANSPORT_CREDENTIALS_V3_A
    property transport_credentials : Void*
    property flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS
    property authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET
    property number_of_authn_schemes : UInt32
    property authn_schemes : UInt32*
    property server_certificate_subject : UInt8*
    property proxy_credentials : Void*
    property number_of_proxy_authn_schemes : UInt32
    property proxy_authn_schemes : UInt32*
    def initialize(@transport_credentials : Void*, @flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS, @authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET, @number_of_authn_schemes : UInt32, @authn_schemes : UInt32*, @server_certificate_subject : UInt8*, @proxy_credentials : Void*, @number_of_proxy_authn_schemes : UInt32, @proxy_authn_schemes : UInt32*)
    end
  end

  @[Extern]
  struct RPC_SECURITY_QOS_V2_W
    property version : UInt32
    property capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES
    property identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY
    property impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL
    property additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE
    property u : U_e__union_

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*
    def initialize(@http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*)
    end
    end

    def initialize(@version : UInt32, @capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES, @identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY, @impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL, @additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE, @u : U_e__union_)
    end
  end

  @[Extern]
  struct RPC_SECURITY_QOS_V2_A
    property version : UInt32
    property capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES
    property identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY
    property impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL
    property additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE
    property u : U_e__union_

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*
    def initialize(@http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*)
    end
    end

    def initialize(@version : UInt32, @capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES, @identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY, @impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL, @additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE, @u : U_e__union_)
    end
  end

  @[Extern]
  struct RPC_SECURITY_QOS_V3_W
    property version : UInt32
    property capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES
    property identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY
    property impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL
    property additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE
    property u : U_e__union_
    property sid : Void*

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*
    def initialize(@http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*)
    end
    end

    def initialize(@version : UInt32, @capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES, @identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY, @impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL, @additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE, @u : U_e__union_, @sid : Void*)
    end
  end

  @[Extern]
  struct RPC_SECURITY_QOS_V3_A
    property version : UInt32
    property capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES
    property identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY
    property impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL
    property additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE
    property u : U_e__union_
    property sid : Void*

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*
    def initialize(@http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*)
    end
    end

    def initialize(@version : UInt32, @capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES, @identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY, @impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL, @additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE, @u : U_e__union_, @sid : Void*)
    end
  end

  @[Extern]
  struct RPC_SECURITY_QOS_V4_W
    property version : UInt32
    property capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES
    property identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY
    property impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL
    property additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE
    property u : U_e__union_
    property sid : Void*
    property effective_only : UInt32

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*
    def initialize(@http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*)
    end
    end

    def initialize(@version : UInt32, @capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES, @identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY, @impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL, @additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE, @u : U_e__union_, @sid : Void*, @effective_only : UInt32)
    end
  end

  @[Extern]
  struct RPC_SECURITY_QOS_V4_A
    property version : UInt32
    property capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES
    property identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY
    property impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL
    property additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE
    property u : U_e__union_
    property sid : Void*
    property effective_only : UInt32

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*
    def initialize(@http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*)
    end
    end

    def initialize(@version : UInt32, @capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES, @identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY, @impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL, @additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE, @u : U_e__union_, @sid : Void*, @effective_only : UInt32)
    end
  end

  @[Extern]
  struct RPC_SECURITY_QOS_V5_W
    property version : UInt32
    property capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES
    property identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY
    property impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL
    property additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE
    property u : U_e__union_
    property sid : Void*
    property effective_only : UInt32
    property server_security_descriptor : Void*

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*
    def initialize(@http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*)
    end
    end

    def initialize(@version : UInt32, @capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES, @identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY, @impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL, @additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE, @u : U_e__union_, @sid : Void*, @effective_only : UInt32, @server_security_descriptor : Void*)
    end
  end

  @[Extern]
  struct RPC_SECURITY_QOS_V5_A
    property version : UInt32
    property capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES
    property identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY
    property impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL
    property additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE
    property u : U_e__union_
    property sid : Void*
    property effective_only : UInt32
    property server_security_descriptor : Void*

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*
    def initialize(@http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*)
    end
    end

    def initialize(@version : UInt32, @capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES, @identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY, @impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL, @additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE, @u : U_e__union_, @sid : Void*, @effective_only : UInt32, @server_security_descriptor : Void*)
    end
  end

  @[Extern]
  struct RPC_BINDING_HANDLE_TEMPLATE_V1_W
    property version : UInt32
    property flags : UInt32
    property protocol_sequence : UInt32
    property network_address : UInt16*
    property string_endpoint : UInt16*
    property u1 : U1_e__union_
    property object_uuid : LibC::GUID

    # Nested Type U1_e__union_
    @[Extern(union: true)]
    struct U1_e__union_
    property reserved : UInt16*
    def initialize(@reserved : UInt16*)
    end
    end

    def initialize(@version : UInt32, @flags : UInt32, @protocol_sequence : UInt32, @network_address : UInt16*, @string_endpoint : UInt16*, @u1 : U1_e__union_, @object_uuid : LibC::GUID)
    end
  end

  @[Extern]
  struct RPC_BINDING_HANDLE_TEMPLATE_V1_A
    property version : UInt32
    property flags : UInt32
    property protocol_sequence : UInt32
    property network_address : UInt8*
    property string_endpoint : UInt8*
    property u1 : U1_e__union_
    property object_uuid : LibC::GUID

    # Nested Type U1_e__union_
    @[Extern(union: true)]
    struct U1_e__union_
    property reserved : UInt8*
    def initialize(@reserved : UInt8*)
    end
    end

    def initialize(@version : UInt32, @flags : UInt32, @protocol_sequence : UInt32, @network_address : UInt8*, @string_endpoint : UInt8*, @u1 : U1_e__union_, @object_uuid : LibC::GUID)
    end
  end

  @[Extern]
  struct RPC_BINDING_HANDLE_SECURITY_V1_W
    property version : UInt32
    property server_princ_name : UInt16*
    property authn_level : UInt32
    property authn_svc : UInt32
    property auth_identity : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*
    property security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*
    def initialize(@version : UInt32, @server_princ_name : UInt16*, @authn_level : UInt32, @authn_svc : UInt32, @auth_identity : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*, @security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*)
    end
  end

  @[Extern]
  struct RPC_BINDING_HANDLE_SECURITY_V1_A
    property version : UInt32
    property server_princ_name : UInt8*
    property authn_level : UInt32
    property authn_svc : UInt32
    property auth_identity : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*
    property security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*
    def initialize(@version : UInt32, @server_princ_name : UInt8*, @authn_level : UInt32, @authn_svc : UInt32, @auth_identity : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*, @security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*)
    end
  end

  @[Extern]
  struct RPC_BINDING_HANDLE_OPTIONS_V1
    property version : UInt32
    property flags : Win32cr::System::Rpc::RPC_BINDING_HANDLE_OPTIONS_FLAGS
    property com_timeout : UInt32
    property call_timeout : UInt32
    def initialize(@version : UInt32, @flags : Win32cr::System::Rpc::RPC_BINDING_HANDLE_OPTIONS_FLAGS, @com_timeout : UInt32, @call_timeout : UInt32)
    end
  end

  @[Extern]
  struct RPC_CLIENT_INFORMATION1
    property user_name : UInt8*
    property computer_name : UInt8*
    property privilege : UInt16
    property auth_flags : UInt32
    def initialize(@user_name : UInt8*, @computer_name : UInt8*, @privilege : UInt16, @auth_flags : UInt32)
    end
  end

  @[Extern]
  struct RPC_ENDPOINT_TEMPLATEW
    property version : UInt32
    property prot_seq : UInt16*
    property endpoint : UInt16*
    property security_descriptor : Void*
    property backlog : UInt32
    def initialize(@version : UInt32, @prot_seq : UInt16*, @endpoint : UInt16*, @security_descriptor : Void*, @backlog : UInt32)
    end
  end

  @[Extern]
  struct RPC_ENDPOINT_TEMPLATEA
    property version : UInt32
    property prot_seq : UInt8*
    property endpoint : UInt8*
    property security_descriptor : Void*
    property backlog : UInt32
    def initialize(@version : UInt32, @prot_seq : UInt8*, @endpoint : UInt8*, @security_descriptor : Void*, @backlog : UInt32)
    end
  end

  @[Extern]
  struct RPC_INTERFACE_TEMPLATEA
    property version : UInt32
    property if_spec : Void*
    property mgr_type_uuid : LibC::GUID*
    property mgr_epv : Void*
    property flags : UInt32
    property max_calls : UInt32
    property max_rpc_size : UInt32
    property if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN
    property uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*
    property annotation__ : UInt8*
    property security_descriptor : Void*
    def initialize(@version : UInt32, @if_spec : Void*, @mgr_type_uuid : LibC::GUID*, @mgr_epv : Void*, @flags : UInt32, @max_calls : UInt32, @max_rpc_size : UInt32, @if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN, @uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, @annotation__ : UInt8*, @security_descriptor : Void*)
    end
  end

  @[Extern]
  struct RPC_INTERFACE_TEMPLATEW
    property version : UInt32
    property if_spec : Void*
    property mgr_type_uuid : LibC::GUID*
    property mgr_epv : Void*
    property flags : UInt32
    property max_calls : UInt32
    property max_rpc_size : UInt32
    property if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN
    property uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*
    property annotation__ : UInt16*
    property security_descriptor : Void*
    def initialize(@version : UInt32, @if_spec : Void*, @mgr_type_uuid : LibC::GUID*, @mgr_epv : Void*, @flags : UInt32, @max_calls : UInt32, @max_rpc_size : UInt32, @if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN, @uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, @annotation__ : UInt16*, @security_descriptor : Void*)
    end
  end

  @[Extern]
  struct RPC_VERSION
    property major_version : UInt16
    property minor_version : UInt16
    def initialize(@major_version : UInt16, @minor_version : UInt16)
    end
  end

  @[Extern]
  struct RPC_SYNTAX_IDENTIFIER
    property syntax_guid : LibC::GUID
    property syntax_version : Win32cr::System::Rpc::RPC_VERSION
    def initialize(@syntax_guid : LibC::GUID, @syntax_version : Win32cr::System::Rpc::RPC_VERSION)
    end
  end

  @[Extern]
  struct RPC_MESSAGE
    property handle : Void*
    property data_representation : UInt32
    property buffer : Void*
    property buffer_length : UInt32
    property proc_num : UInt32
    property transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*
    property rpc_interface_information : Void*
    property reserved_for_runtime : Void*
    property manager_epv : Void*
    property import_context : Void*
    property rpc_flags : UInt32
    def initialize(@handle : Void*, @data_representation : UInt32, @buffer : Void*, @buffer_length : UInt32, @proc_num : UInt32, @transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*, @rpc_interface_information : Void*, @reserved_for_runtime : Void*, @manager_epv : Void*, @import_context : Void*, @rpc_flags : UInt32)
    end
  end

  @[Extern]
  struct RPC_DISPATCH_TABLE
    property dispatch_table_count : UInt32
    property dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_FUNCTION
    property reserved : LibC::IntPtrT
    def initialize(@dispatch_table_count : UInt32, @dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_FUNCTION, @reserved : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct RPC_PROTSEQ_ENDPOINT
    property rpc_protocol_sequence : UInt8*
    property endpoint : UInt8*
    def initialize(@rpc_protocol_sequence : UInt8*, @endpoint : UInt8*)
    end
  end

  @[Extern]
  struct RPC_SERVER_INTERFACE
    property length : UInt32
    property interface_id : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER
    property transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER
    property dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_TABLE*
    property rpc_protseq_endpoint_count : UInt32
    property rpc_protseq_endpoint : Win32cr::System::Rpc::RPC_PROTSEQ_ENDPOINT*
    property default_manager_epv : Void*
    property interpreter_info : Void*
    property flags : UInt32
    def initialize(@length : UInt32, @interface_id : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER, @transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER, @dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_TABLE*, @rpc_protseq_endpoint_count : UInt32, @rpc_protseq_endpoint : Win32cr::System::Rpc::RPC_PROTSEQ_ENDPOINT*, @default_manager_epv : Void*, @interpreter_info : Void*, @flags : UInt32)
    end
  end

  @[Extern]
  struct RPC_CLIENT_INTERFACE
    property length : UInt32
    property interface_id : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER
    property transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER
    property dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_TABLE*
    property rpc_protseq_endpoint_count : UInt32
    property rpc_protseq_endpoint : Win32cr::System::Rpc::RPC_PROTSEQ_ENDPOINT*
    property reserved : LibC::UIntPtrT
    property interpreter_info : Void*
    property flags : UInt32
    def initialize(@length : UInt32, @interface_id : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER, @transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER, @dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_TABLE*, @rpc_protseq_endpoint_count : UInt32, @rpc_protseq_endpoint : Win32cr::System::Rpc::RPC_PROTSEQ_ENDPOINT*, @reserved : LibC::UIntPtrT, @interpreter_info : Void*, @flags : UInt32)
    end
  end

  @[Extern]
  struct RPC_SEC_CONTEXT_KEY_INFO
    property encrypt_algorithm : UInt32
    property key_size : UInt32
    property signature_algorithm : UInt32
    def initialize(@encrypt_algorithm : UInt32, @key_size : UInt32, @signature_algorithm : UInt32)
    end
  end

  @[Extern]
  struct RPC_TRANSFER_SYNTAX
    property uuid : LibC::GUID
    property vers_major : UInt16
    property vers_minor : UInt16
    def initialize(@uuid : LibC::GUID, @vers_major : UInt16, @vers_minor : UInt16)
    end
  end

  @[Extern]
  struct RPC_C_OPT_COOKIE_AUTH_DESCRIPTOR
    property buffer_size : UInt32
    property buffer : Win32cr::Foundation::PSTR
    def initialize(@buffer_size : UInt32, @buffer : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct RDR_CALLOUT_STATE
    property last_error : Win32cr::System::Rpc::RPC_STATUS
    property last_ee_info : Void*
    property last_called_stage : Win32cr::System::Rpc::RPC_HTTP_REDIRECTOR_STAGE
    property server_name : UInt16*
    property server_port : UInt16*
    property remote_user : UInt16*
    property auth_type : UInt16*
    property resource_type_present : UInt8
    property session_id_present : UInt8
    property interface_present : UInt8
    property resource_type : LibC::GUID
    property session_id : LibC::GUID
    property interface : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER
    property cert_context : Void*
    def initialize(@last_error : Win32cr::System::Rpc::RPC_STATUS, @last_ee_info : Void*, @last_called_stage : Win32cr::System::Rpc::RPC_HTTP_REDIRECTOR_STAGE, @server_name : UInt16*, @server_port : UInt16*, @remote_user : UInt16*, @auth_type : UInt16*, @resource_type_present : UInt8, @session_id_present : UInt8, @interface_present : UInt8, @resource_type : LibC::GUID, @session_id : LibC::GUID, @interface : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER, @cert_context : Void*)
    end
  end

  @[Extern]
  struct I_RpcProxyCallbackInterface
    property is_valid_machine_fn : Win32cr::System::Rpc::I_RpcProxyIsValidMachineFn
    property get_client_address_fn : Win32cr::System::Rpc::I_RpcProxyGetClientAddressFn
    property get_connection_timeout_fn : Win32cr::System::Rpc::I_RpcProxyGetConnectionTimeoutFn
    property perform_callout_fn : Win32cr::System::Rpc::I_RpcPerformCalloutFn
    property free_callout_state_fn : Win32cr::System::Rpc::I_RpcFreeCalloutStateFn
    property get_client_session_and_resource_uuid_fn : Win32cr::System::Rpc::I_RpcProxyGetClientSessionAndResourceUUID
    property proxy_filter_if_fn : Win32cr::System::Rpc::I_RpcProxyFilterIfFn
    property rpc_proxy_update_perf_counter_fn : Win32cr::System::Rpc::I_RpcProxyUpdatePerfCounterFn
    property rpc_proxy_update_perf_counter_backend_server_fn : Win32cr::System::Rpc::I_RpcProxyUpdatePerfCounterBackendServerFn
    def initialize(@is_valid_machine_fn : Win32cr::System::Rpc::I_RpcProxyIsValidMachineFn, @get_client_address_fn : Win32cr::System::Rpc::I_RpcProxyGetClientAddressFn, @get_connection_timeout_fn : Win32cr::System::Rpc::I_RpcProxyGetConnectionTimeoutFn, @perform_callout_fn : Win32cr::System::Rpc::I_RpcPerformCalloutFn, @free_callout_state_fn : Win32cr::System::Rpc::I_RpcFreeCalloutStateFn, @get_client_session_and_resource_uuid_fn : Win32cr::System::Rpc::I_RpcProxyGetClientSessionAndResourceUUID, @proxy_filter_if_fn : Win32cr::System::Rpc::I_RpcProxyFilterIfFn, @rpc_proxy_update_perf_counter_fn : Win32cr::System::Rpc::I_RpcProxyUpdatePerfCounterFn, @rpc_proxy_update_perf_counter_backend_server_fn : Win32cr::System::Rpc::I_RpcProxyUpdatePerfCounterBackendServerFn)
    end
  end

  @[Extern(union: true)]
  struct RPC_ASYNC_NOTIFICATION_INFO
    property apc : APC_e__Struct_
    property ioc : IOC_e__Struct_
    property int_ptr : IntPtr_e__Struct_
    property hEvent : Win32cr::Foundation::HANDLE
    property notification_routine : Win32cr::System::Rpc::PFN_RPCNOTIFICATION_ROUTINE

    # Nested Type IntPtr_e__Struct_
    @[Extern]
    struct IntPtr_e__Struct_
    property hWnd : Win32cr::Foundation::HWND
    property msg : UInt32
    def initialize(@hWnd : Win32cr::Foundation::HWND, @msg : UInt32)
    end
    end


    # Nested Type IOC_e__Struct_
    @[Extern]
    struct IOC_e__Struct_
    property hIOPort : Win32cr::Foundation::HANDLE
    property dwNumberOfBytesTransferred : UInt32
    property dwCompletionKey : LibC::UIntPtrT
    property lpOverlapped : Win32cr::System::IO::OVERLAPPED*
    def initialize(@hIOPort : Win32cr::Foundation::HANDLE, @dwNumberOfBytesTransferred : UInt32, @dwCompletionKey : LibC::UIntPtrT, @lpOverlapped : Win32cr::System::IO::OVERLAPPED*)
    end
    end


    # Nested Type APC_e__Struct_
    @[Extern]
    struct APC_e__Struct_
    property notification_routine : Win32cr::System::Rpc::PFN_RPCNOTIFICATION_ROUTINE
    property hThread : Win32cr::Foundation::HANDLE
    def initialize(@notification_routine : Win32cr::System::Rpc::PFN_RPCNOTIFICATION_ROUTINE, @hThread : Win32cr::Foundation::HANDLE)
    end
    end

    def initialize(@apc : APC_e__Struct_, @ioc : IOC_e__Struct_, @int_ptr : IntPtr_e__Struct_, @hEvent : Win32cr::Foundation::HANDLE, @notification_routine : Win32cr::System::Rpc::PFN_RPCNOTIFICATION_ROUTINE)
    end
  end

  @[Extern]
  struct RPC_ASYNC_STATE
    property size : UInt32
    property signature : UInt32
    property lock : Int32
    property flags : UInt32
    property stub_info : Void*
    property user_info : Void*
    property runtime_info : Void*
    property event : Win32cr::System::Rpc::RPC_ASYNC_EVENT
    property notification_type : Win32cr::System::Rpc::RPC_NOTIFICATION_TYPES
    property u : Win32cr::System::Rpc::RPC_ASYNC_NOTIFICATION_INFO
    property reserved : LibC::IntPtrT[4]
    def initialize(@size : UInt32, @signature : UInt32, @lock : Int32, @flags : UInt32, @stub_info : Void*, @user_info : Void*, @runtime_info : Void*, @event : Win32cr::System::Rpc::RPC_ASYNC_EVENT, @notification_type : Win32cr::System::Rpc::RPC_NOTIFICATION_TYPES, @u : Win32cr::System::Rpc::RPC_ASYNC_NOTIFICATION_INFO, @reserved : LibC::IntPtrT[4])
    end
  end

  @[Extern]
  struct BinaryParam
    property buffer : Void*
    property size : Int16
    def initialize(@buffer : Void*, @size : Int16)
    end
  end

  @[Extern]
  struct RPC_EE_INFO_PARAM
    property parameter_type : Win32cr::System::Rpc::ExtendedErrorParamTypes
    property u : U_e__union_

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property ansi_string : Win32cr::Foundation::PSTR
    property unicode_string : Win32cr::Foundation::PWSTR
    property l_val : Int32
    property s_val : Int16
    property p_val : UInt64
    property b_val : Win32cr::System::Rpc::BinaryParam
    def initialize(@ansi_string : Win32cr::Foundation::PSTR, @unicode_string : Win32cr::Foundation::PWSTR, @l_val : Int32, @s_val : Int16, @p_val : UInt64, @b_val : Win32cr::System::Rpc::BinaryParam)
    end
    end

    def initialize(@parameter_type : Win32cr::System::Rpc::ExtendedErrorParamTypes, @u : U_e__union_)
    end
  end

  @[Extern]
  struct RPC_EXTENDED_ERROR_INFO
    property version : UInt32
    property computer_name : Win32cr::Foundation::PWSTR
    property process_id : UInt32
    property u : U_e__union_
    property generating_component : UInt32
    property status : UInt32
    property detection_location : UInt16
    property flags : UInt16
    property number_of_parameters : Int32
    property parameters : Win32cr::System::Rpc::RPC_EE_INFO_PARAM[4]

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property system_time : Win32cr::Foundation::SYSTEMTIME
    property file_time : Win32cr::Foundation::FILETIME
    def initialize(@system_time : Win32cr::Foundation::SYSTEMTIME, @file_time : Win32cr::Foundation::FILETIME)
    end
    end

    def initialize(@version : UInt32, @computer_name : Win32cr::Foundation::PWSTR, @process_id : UInt32, @u : U_e__union_, @generating_component : UInt32, @status : UInt32, @detection_location : UInt16, @flags : UInt16, @number_of_parameters : Int32, @parameters : Win32cr::System::Rpc::RPC_EE_INFO_PARAM[4])
    end
  end

  @[Extern]
  struct RPC_ERROR_ENUM_HANDLE
    property signature : UInt32
    property current_pos : Void*
    property head : Void*
    def initialize(@signature : UInt32, @current_pos : Void*, @head : Void*)
    end
  end

  @[Extern]
  struct RPC_CALL_LOCAL_ADDRESS_V1
    property version : UInt32
    property buffer : Void*
    property buffer_size : UInt32
    property address_format : Win32cr::System::Rpc::RpcLocalAddressFormat
    def initialize(@version : UInt32, @buffer : Void*, @buffer_size : UInt32, @address_format : Win32cr::System::Rpc::RpcLocalAddressFormat)
    end
  end

  @[Extern]
  struct RPC_CALL_ATTRIBUTES_V1_W
    property version : UInt32
    property flags : UInt32
    property server_principal_name_buffer_length : UInt32
    property server_principal_name : UInt16*
    property client_principal_name_buffer_length : UInt32
    property client_principal_name : UInt16*
    property authentication_level : UInt32
    property authentication_service : UInt32
    property null_session : Win32cr::Foundation::BOOL
    def initialize(@version : UInt32, @flags : UInt32, @server_principal_name_buffer_length : UInt32, @server_principal_name : UInt16*, @client_principal_name_buffer_length : UInt32, @client_principal_name : UInt16*, @authentication_level : UInt32, @authentication_service : UInt32, @null_session : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct RPC_CALL_ATTRIBUTES_V1_A
    property version : UInt32
    property flags : UInt32
    property server_principal_name_buffer_length : UInt32
    property server_principal_name : UInt8*
    property client_principal_name_buffer_length : UInt32
    property client_principal_name : UInt8*
    property authentication_level : UInt32
    property authentication_service : UInt32
    property null_session : Win32cr::Foundation::BOOL
    def initialize(@version : UInt32, @flags : UInt32, @server_principal_name_buffer_length : UInt32, @server_principal_name : UInt8*, @client_principal_name_buffer_length : UInt32, @client_principal_name : UInt8*, @authentication_level : UInt32, @authentication_service : UInt32, @null_session : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct RPC_CALL_ATTRIBUTES_V2_W
    property version : UInt32
    property flags : UInt32
    property server_principal_name_buffer_length : UInt32
    property server_principal_name : UInt16*
    property client_principal_name_buffer_length : UInt32
    property client_principal_name : UInt16*
    property authentication_level : UInt32
    property authentication_service : UInt32
    property null_session : Win32cr::Foundation::BOOL
    property kernel_mode_caller : Win32cr::Foundation::BOOL
    property protocol_sequence : UInt32
    property is_client_local : Win32cr::System::Rpc::RpcCallClientLocality
    property client_pid : Win32cr::Foundation::HANDLE
    property call_status : UInt32
    property call_type : Win32cr::System::Rpc::RpcCallType
    property call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*
    property op_num : UInt16
    property interface_uuid : LibC::GUID
    def initialize(@version : UInt32, @flags : UInt32, @server_principal_name_buffer_length : UInt32, @server_principal_name : UInt16*, @client_principal_name_buffer_length : UInt32, @client_principal_name : UInt16*, @authentication_level : UInt32, @authentication_service : UInt32, @null_session : Win32cr::Foundation::BOOL, @kernel_mode_caller : Win32cr::Foundation::BOOL, @protocol_sequence : UInt32, @is_client_local : Win32cr::System::Rpc::RpcCallClientLocality, @client_pid : Win32cr::Foundation::HANDLE, @call_status : UInt32, @call_type : Win32cr::System::Rpc::RpcCallType, @call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*, @op_num : UInt16, @interface_uuid : LibC::GUID)
    end
  end

  @[Extern]
  struct RPC_CALL_ATTRIBUTES_V2_A
    property version : UInt32
    property flags : UInt32
    property server_principal_name_buffer_length : UInt32
    property server_principal_name : UInt8*
    property client_principal_name_buffer_length : UInt32
    property client_principal_name : UInt8*
    property authentication_level : UInt32
    property authentication_service : UInt32
    property null_session : Win32cr::Foundation::BOOL
    property kernel_mode_caller : Win32cr::Foundation::BOOL
    property protocol_sequence : UInt32
    property is_client_local : UInt32
    property client_pid : Win32cr::Foundation::HANDLE
    property call_status : UInt32
    property call_type : Win32cr::System::Rpc::RpcCallType
    property call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*
    property op_num : UInt16
    property interface_uuid : LibC::GUID
    def initialize(@version : UInt32, @flags : UInt32, @server_principal_name_buffer_length : UInt32, @server_principal_name : UInt8*, @client_principal_name_buffer_length : UInt32, @client_principal_name : UInt8*, @authentication_level : UInt32, @authentication_service : UInt32, @null_session : Win32cr::Foundation::BOOL, @kernel_mode_caller : Win32cr::Foundation::BOOL, @protocol_sequence : UInt32, @is_client_local : UInt32, @client_pid : Win32cr::Foundation::HANDLE, @call_status : UInt32, @call_type : Win32cr::System::Rpc::RpcCallType, @call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*, @op_num : UInt16, @interface_uuid : LibC::GUID)
    end
  end

  @[Extern]
  struct RPC_CALL_ATTRIBUTES_V3_W
    property version : UInt32
    property flags : UInt32
    property server_principal_name_buffer_length : UInt32
    property server_principal_name : UInt16*
    property client_principal_name_buffer_length : UInt32
    property client_principal_name : UInt16*
    property authentication_level : UInt32
    property authentication_service : UInt32
    property null_session : Win32cr::Foundation::BOOL
    property kernel_mode_caller : Win32cr::Foundation::BOOL
    property protocol_sequence : UInt32
    property is_client_local : Win32cr::System::Rpc::RpcCallClientLocality
    property client_pid : Win32cr::Foundation::HANDLE
    property call_status : UInt32
    property call_type : Win32cr::System::Rpc::RpcCallType
    property call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*
    property op_num : UInt16
    property interface_uuid : LibC::GUID
    property client_identifier_buffer_length : UInt32
    property client_identifier : UInt8*
    def initialize(@version : UInt32, @flags : UInt32, @server_principal_name_buffer_length : UInt32, @server_principal_name : UInt16*, @client_principal_name_buffer_length : UInt32, @client_principal_name : UInt16*, @authentication_level : UInt32, @authentication_service : UInt32, @null_session : Win32cr::Foundation::BOOL, @kernel_mode_caller : Win32cr::Foundation::BOOL, @protocol_sequence : UInt32, @is_client_local : Win32cr::System::Rpc::RpcCallClientLocality, @client_pid : Win32cr::Foundation::HANDLE, @call_status : UInt32, @call_type : Win32cr::System::Rpc::RpcCallType, @call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*, @op_num : UInt16, @interface_uuid : LibC::GUID, @client_identifier_buffer_length : UInt32, @client_identifier : UInt8*)
    end
  end

  @[Extern]
  struct RPC_CALL_ATTRIBUTES_V3_A
    property version : UInt32
    property flags : UInt32
    property server_principal_name_buffer_length : UInt32
    property server_principal_name : UInt8*
    property client_principal_name_buffer_length : UInt32
    property client_principal_name : UInt8*
    property authentication_level : UInt32
    property authentication_service : UInt32
    property null_session : Win32cr::Foundation::BOOL
    property kernel_mode_caller : Win32cr::Foundation::BOOL
    property protocol_sequence : UInt32
    property is_client_local : UInt32
    property client_pid : Win32cr::Foundation::HANDLE
    property call_status : UInt32
    property call_type : Win32cr::System::Rpc::RpcCallType
    property call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*
    property op_num : UInt16
    property interface_uuid : LibC::GUID
    property client_identifier_buffer_length : UInt32
    property client_identifier : UInt8*
    def initialize(@version : UInt32, @flags : UInt32, @server_principal_name_buffer_length : UInt32, @server_principal_name : UInt8*, @client_principal_name_buffer_length : UInt32, @client_principal_name : UInt8*, @authentication_level : UInt32, @authentication_service : UInt32, @null_session : Win32cr::Foundation::BOOL, @kernel_mode_caller : Win32cr::Foundation::BOOL, @protocol_sequence : UInt32, @is_client_local : UInt32, @client_pid : Win32cr::Foundation::HANDLE, @call_status : UInt32, @call_type : Win32cr::System::Rpc::RpcCallType, @call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*, @op_num : UInt16, @interface_uuid : LibC::GUID, @client_identifier_buffer_length : UInt32, @client_identifier : UInt8*)
    end
  end

  @[Extern]
  struct RPC_IMPORT_CONTEXT_P
    property lookup_context : Void*
    property proposed_handle : Void*
    property bindings : Win32cr::System::Rpc::RPC_BINDING_VECTOR*
    def initialize(@lookup_context : Void*, @proposed_handle : Void*, @bindings : Win32cr::System::Rpc::RPC_BINDING_VECTOR*)
    end
  end

  @[Extern]
  struct NDR_SCONTEXT_
    property pad : Void*[2]
    property userContext : Void*
    def initialize(@pad : Void*[2], @userContext : Void*)
    end
  end

  @[Extern]
  struct SCONTEXT_QUEUE
    property number_of_objects : UInt32
    property array_of_objects : Win32cr::System::Rpc::NDR_SCONTEXT_1**
    def initialize(@number_of_objects : UInt32, @array_of_objects : Win32cr::System::Rpc::NDR_SCONTEXT_1**)
    end
  end

  @[Extern]
  struct ARRAY_INFO
    property dimension : Int32
    property buffer_conformance_mark : UInt32*
    property buffer_variance_mark : UInt32*
    property max_count_array : UInt32*
    property offset_array : UInt32*
    property actual_count_array : UInt32*
    def initialize(@dimension : Int32, @buffer_conformance_mark : UInt32*, @buffer_variance_mark : UInt32*, @max_count_array : UInt32*, @offset_array : UInt32*, @actual_count_array : UInt32*)
    end
  end

  alias NDR_ASYNC_MESSAGE_ = Void

  alias NDR_CORRELATION_INFO_ = Void

  alias NDR_ALLOC_ALL_NODES_CONTEXT = Void

  alias NDR_POINTER_QUEUE_STATE = Void

  alias NDR_PROC_CONTEXT_ = Void

  @[Extern]
  struct MIDL_STUB_MESSAGE
    property rpc_msg : Win32cr::System::Rpc::RPC_MESSAGE*
    property buffer : UInt8*
    property buffer_start : UInt8*
    property buffer_end : UInt8*
    property buffer_mark : UInt8*
    property buffer_length : UInt32
    property memory_size : UInt32
    property memory : UInt8*
    property is_client : UInt8
    property pad : UInt8
    property uFlags2 : UInt16
    property reuse_buffer : Int32
    property pAllocAllNodesContext : Win32cr::System::Rpc::NDR_ALLOC_ALL_NODES_CONTEXT*
    property pPointerQueueState : Win32cr::System::Rpc::NDR_POINTER_QUEUE_STATE*
    property ignore_embedded_pointers : Int32
    property pointer_buffer_mark : UInt8*
    property corr_desp_increment : UInt8
    property uFlags : UInt8
    property unique_ptr_count : UInt16
    property max_count : LibC::UIntPtrT
    property offset : UInt32
    property actual_count : UInt32
    property pfnAllocate : LibC::IntPtrT
    property pfnFree : LibC::IntPtrT
    property stack_top : UInt8*
    property pPresentedType : UInt8*
    property pTransmitType : UInt8*
    property saved_handle : Void*
    property stub_desc : Win32cr::System::Rpc::MIDL_STUB_DESC*
    property full_ptr_xlat_tables : Win32cr::System::Rpc::FULL_PTR_XLAT_TABLES*
    property full_ptr_ref_id : UInt32
    property pointer_length : UInt32
    property _bitfield : Int32
    property dwDestContext : UInt32
    property pvDestContext : Void*
    property saved_context_handles : Win32cr::System::Rpc::NDR_SCONTEXT_1**
    property param_number : Int32
    property pRpcChannelBuffer : Void*
    property pArrayInfo : Win32cr::System::Rpc::ARRAY_INFO*
    property size_ptr_count_array : UInt32*
    property size_ptr_offset_array : UInt32*
    property size_ptr_length_array : UInt32*
    property pArgQueue : Void*
    property dwStubPhase : UInt32
    property low_stack_mark : Void*
    property pAsyncMsg : Win32cr::System::Rpc::NDR_ASYNC_MESSAGE_*
    property pCorrInfo : Win32cr::System::Rpc::NDR_CORRELATION_INFO_*
    property pCorrMemory : UInt8*
    property pMemoryList : Void*
    property pCSInfo : LibC::IntPtrT
    property conformance_mark : UInt8*
    property variance_mark : UInt8*
    property unused : LibC::IntPtrT
    property pContext : Win32cr::System::Rpc::NDR_PROC_CONTEXT_*
    property context_handle_hash : Void*
    property pUserMarshalList : Void*
    property reserved51_3 : LibC::IntPtrT
    property reserved51_4 : LibC::IntPtrT
    property reserved51_5 : LibC::IntPtrT
    def initialize(@rpc_msg : Win32cr::System::Rpc::RPC_MESSAGE*, @buffer : UInt8*, @buffer_start : UInt8*, @buffer_end : UInt8*, @buffer_mark : UInt8*, @buffer_length : UInt32, @memory_size : UInt32, @memory : UInt8*, @is_client : UInt8, @pad : UInt8, @uFlags2 : UInt16, @reuse_buffer : Int32, @pAllocAllNodesContext : Win32cr::System::Rpc::NDR_ALLOC_ALL_NODES_CONTEXT*, @pPointerQueueState : Win32cr::System::Rpc::NDR_POINTER_QUEUE_STATE*, @ignore_embedded_pointers : Int32, @pointer_buffer_mark : UInt8*, @corr_desp_increment : UInt8, @uFlags : UInt8, @unique_ptr_count : UInt16, @max_count : LibC::UIntPtrT, @offset : UInt32, @actual_count : UInt32, @pfnAllocate : LibC::IntPtrT, @pfnFree : LibC::IntPtrT, @stack_top : UInt8*, @pPresentedType : UInt8*, @pTransmitType : UInt8*, @saved_handle : Void*, @stub_desc : Win32cr::System::Rpc::MIDL_STUB_DESC*, @full_ptr_xlat_tables : Win32cr::System::Rpc::FULL_PTR_XLAT_TABLES*, @full_ptr_ref_id : UInt32, @pointer_length : UInt32, @_bitfield : Int32, @dwDestContext : UInt32, @pvDestContext : Void*, @saved_context_handles : Win32cr::System::Rpc::NDR_SCONTEXT_1**, @param_number : Int32, @pRpcChannelBuffer : Void*, @pArrayInfo : Win32cr::System::Rpc::ARRAY_INFO*, @size_ptr_count_array : UInt32*, @size_ptr_offset_array : UInt32*, @size_ptr_length_array : UInt32*, @pArgQueue : Void*, @dwStubPhase : UInt32, @low_stack_mark : Void*, @pAsyncMsg : Win32cr::System::Rpc::NDR_ASYNC_MESSAGE_*, @pCorrInfo : Win32cr::System::Rpc::NDR_CORRELATION_INFO_*, @pCorrMemory : UInt8*, @pMemoryList : Void*, @pCSInfo : LibC::IntPtrT, @conformance_mark : UInt8*, @variance_mark : UInt8*, @unused : LibC::IntPtrT, @pContext : Win32cr::System::Rpc::NDR_PROC_CONTEXT_*, @context_handle_hash : Void*, @pUserMarshalList : Void*, @reserved51_3 : LibC::IntPtrT, @reserved51_4 : LibC::IntPtrT, @reserved51_5 : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct GENERIC_BINDING_ROUTINE_PAIR
    property pfnBind : Win32cr::System::Rpc::GENERIC_BINDING_ROUTINE
    property pfnUnbind : Win32cr::System::Rpc::GENERIC_UNBIND_ROUTINE
    def initialize(@pfnBind : Win32cr::System::Rpc::GENERIC_BINDING_ROUTINE, @pfnUnbind : Win32cr::System::Rpc::GENERIC_UNBIND_ROUTINE)
    end
  end

  @[Extern]
  struct GENERIC_BINDING_INFO
    property pObj : Void*
    property size : UInt32
    property pfnBind : Win32cr::System::Rpc::GENERIC_BINDING_ROUTINE
    property pfnUnbind : Win32cr::System::Rpc::GENERIC_UNBIND_ROUTINE
    def initialize(@pObj : Void*, @size : UInt32, @pfnBind : Win32cr::System::Rpc::GENERIC_BINDING_ROUTINE, @pfnUnbind : Win32cr::System::Rpc::GENERIC_UNBIND_ROUTINE)
    end
  end

  @[Extern]
  struct XMIT_ROUTINE_QUINTUPLE
    property pfnTranslateToXmit : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE
    property pfnTranslateFromXmit : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE
    property pfnFreeXmit : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE
    property pfnFreeInst : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE
    def initialize(@pfnTranslateToXmit : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE, @pfnTranslateFromXmit : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE, @pfnFreeXmit : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE, @pfnFreeInst : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE)
    end
  end

  @[Extern]
  struct USER_MARSHAL_ROUTINE_QUADRUPLE
    property pfnBufferSize : Win32cr::System::Rpc::USER_MARSHAL_SIZING_ROUTINE
    property pfnMarshall : Win32cr::System::Rpc::USER_MARSHAL_MARSHALLING_ROUTINE
    property pfnUnmarshall : Win32cr::System::Rpc::USER_MARSHAL_UNMARSHALLING_ROUTINE
    property pfnFree : Win32cr::System::Rpc::USER_MARSHAL_FREEING_ROUTINE
    def initialize(@pfnBufferSize : Win32cr::System::Rpc::USER_MARSHAL_SIZING_ROUTINE, @pfnMarshall : Win32cr::System::Rpc::USER_MARSHAL_MARSHALLING_ROUTINE, @pfnUnmarshall : Win32cr::System::Rpc::USER_MARSHAL_UNMARSHALLING_ROUTINE, @pfnFree : Win32cr::System::Rpc::USER_MARSHAL_FREEING_ROUTINE)
    end
  end

  @[Extern]
  struct USER_MARSHAL_CB
    property flags : UInt32
    property pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*
    property pReserve : UInt8*
    property signature : UInt32
    property cb_type : Win32cr::System::Rpc::USER_MARSHAL_CB_TYPE
    property pFormat : UInt8*
    property pTypeFormat : UInt8*
    def initialize(@flags : UInt32, @pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, @pReserve : UInt8*, @signature : UInt32, @cb_type : Win32cr::System::Rpc::USER_MARSHAL_CB_TYPE, @pFormat : UInt8*, @pTypeFormat : UInt8*)
    end
  end

  @[Extern]
  struct MALLOC_FREE_STRUCT
    property pfnAllocate : LibC::IntPtrT
    property pfnFree : LibC::IntPtrT
    def initialize(@pfnAllocate : LibC::IntPtrT, @pfnFree : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct COMM_FAULT_OFFSETS
    property comm_offset : Int16
    property fault_offset : Int16
    def initialize(@comm_offset : Int16, @fault_offset : Int16)
    end
  end

  @[Extern]
  struct NDR_CS_SIZE_CONVERT_ROUTINES
    property pfnNetSize : Win32cr::System::Rpc::CS_TYPE_NET_SIZE_ROUTINE
    property pfnToNetCs : Win32cr::System::Rpc::CS_TYPE_TO_NETCS_ROUTINE
    property pfnLocalSize : Win32cr::System::Rpc::CS_TYPE_LOCAL_SIZE_ROUTINE
    property pfnFromNetCs : Win32cr::System::Rpc::CS_TYPE_FROM_NETCS_ROUTINE
    def initialize(@pfnNetSize : Win32cr::System::Rpc::CS_TYPE_NET_SIZE_ROUTINE, @pfnToNetCs : Win32cr::System::Rpc::CS_TYPE_TO_NETCS_ROUTINE, @pfnLocalSize : Win32cr::System::Rpc::CS_TYPE_LOCAL_SIZE_ROUTINE, @pfnFromNetCs : Win32cr::System::Rpc::CS_TYPE_FROM_NETCS_ROUTINE)
    end
  end

  @[Extern]
  struct NDR_CS_ROUTINES
    property pSizeConvertRoutines : Win32cr::System::Rpc::NDR_CS_SIZE_CONVERT_ROUTINES*
    property pTagGettingRoutines : Win32cr::System::Rpc::CS_TAG_GETTING_ROUTINE*
    def initialize(@pSizeConvertRoutines : Win32cr::System::Rpc::NDR_CS_SIZE_CONVERT_ROUTINES*, @pTagGettingRoutines : Win32cr::System::Rpc::CS_TAG_GETTING_ROUTINE*)
    end
  end

  @[Extern]
  struct NDR_EXPR_DESC
    property pOffset : UInt16*
    property pFormatExpr : UInt8*
    def initialize(@pOffset : UInt16*, @pFormatExpr : UInt8*)
    end
  end

  @[Extern]
  struct MIDL_STUB_DESC
    property rpc_interface_information : Void*
    property pfnAllocate : LibC::IntPtrT
    property pfnFree : LibC::IntPtrT
    property implicit_handle_info : IMPLICIT_HANDLE_INFO_e__Union_
    property apfnNdrRundownRoutines : Win32cr::System::Rpc::NDR_RUNDOWN*
    property aGenericBindingRoutinePairs : Win32cr::System::Rpc::GENERIC_BINDING_ROUTINE_PAIR*
    property apfnExprEval : Win32cr::System::Rpc::EXPR_EVAL*
    property aXmitQuintuple : Win32cr::System::Rpc::XMIT_ROUTINE_QUINTUPLE*
    property pFormatTypes : UInt8*
    property fCheckBounds : Int32
    property version : UInt32
    property pMallocFreeStruct : Win32cr::System::Rpc::MALLOC_FREE_STRUCT*
    property midl_version : Int32
    property comm_fault_offsets : Win32cr::System::Rpc::COMM_FAULT_OFFSETS*
    property aUserMarshalQuadruple : Win32cr::System::Rpc::USER_MARSHAL_ROUTINE_QUADRUPLE*
    property notify_routine_table : Win32cr::System::Rpc::NDR_NOTIFY_ROUTINE*
    property mFlags : LibC::UIntPtrT
    property cs_routine_tables : Win32cr::System::Rpc::NDR_CS_ROUTINES*
    property proxy_server_info : Void*
    property pExprInfo : Win32cr::System::Rpc::NDR_EXPR_DESC*

    # Nested Type IMPLICIT_HANDLE_INFO_e__Union_
    @[Extern(union: true)]
    struct IMPLICIT_HANDLE_INFO_e__Union_
    property pAutoHandle : Void**
    property pPrimitiveHandle : Void**
    property pGenericBindingInfo : Win32cr::System::Rpc::GENERIC_BINDING_INFO*
    def initialize(@pAutoHandle : Void**, @pPrimitiveHandle : Void**, @pGenericBindingInfo : Win32cr::System::Rpc::GENERIC_BINDING_INFO*)
    end
    end

    def initialize(@rpc_interface_information : Void*, @pfnAllocate : LibC::IntPtrT, @pfnFree : LibC::IntPtrT, @implicit_handle_info : IMPLICIT_HANDLE_INFO_e__Union_, @apfnNdrRundownRoutines : Win32cr::System::Rpc::NDR_RUNDOWN*, @aGenericBindingRoutinePairs : Win32cr::System::Rpc::GENERIC_BINDING_ROUTINE_PAIR*, @apfnExprEval : Win32cr::System::Rpc::EXPR_EVAL*, @aXmitQuintuple : Win32cr::System::Rpc::XMIT_ROUTINE_QUINTUPLE*, @pFormatTypes : UInt8*, @fCheckBounds : Int32, @version : UInt32, @pMallocFreeStruct : Win32cr::System::Rpc::MALLOC_FREE_STRUCT*, @midl_version : Int32, @comm_fault_offsets : Win32cr::System::Rpc::COMM_FAULT_OFFSETS*, @aUserMarshalQuadruple : Win32cr::System::Rpc::USER_MARSHAL_ROUTINE_QUADRUPLE*, @notify_routine_table : Win32cr::System::Rpc::NDR_NOTIFY_ROUTINE*, @mFlags : LibC::UIntPtrT, @cs_routine_tables : Win32cr::System::Rpc::NDR_CS_ROUTINES*, @proxy_server_info : Void*, @pExprInfo : Win32cr::System::Rpc::NDR_EXPR_DESC*)
    end
  end

  @[Extern]
  struct MIDL_FORMAT_STRING
    property pad : Int16
    property format : UInt8*
    def initialize(@pad : Int16, @format : UInt8*)
    end
  end

  @[Extern]
  struct MIDL_METHOD_PROPERTY
    property id : UInt32
    property value : LibC::UIntPtrT
    def initialize(@id : UInt32, @value : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct MIDL_METHOD_PROPERTY_MAP
    property count : UInt32
    property properties : Win32cr::System::Rpc::MIDL_METHOD_PROPERTY*
    def initialize(@count : UInt32, @properties : Win32cr::System::Rpc::MIDL_METHOD_PROPERTY*)
    end
  end

  @[Extern]
  struct MIDL_INTERFACE_METHOD_PROPERTIES
    property method_count : UInt16
    property method_properties : Win32cr::System::Rpc::MIDL_METHOD_PROPERTY_MAP**
    def initialize(@method_count : UInt16, @method_properties : Win32cr::System::Rpc::MIDL_METHOD_PROPERTY_MAP**)
    end
  end

  @[Extern]
  struct MIDL_SERVER_INFO
    property pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*
    property dispatch_table : Win32cr::System::Rpc::SERVER_ROUTINE*
    property proc_string : UInt8*
    property fmt_string_offset : UInt16*
    property thunk_table : Win32cr::System::Rpc::STUB_THUNK*
    property pTransferSyntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*
    property nCount : LibC::UIntPtrT
    property pSyntaxInfo : Win32cr::System::Rpc::MIDL_SYNTAX_INFO*
    def initialize(@pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, @dispatch_table : Win32cr::System::Rpc::SERVER_ROUTINE*, @proc_string : UInt8*, @fmt_string_offset : UInt16*, @thunk_table : Win32cr::System::Rpc::STUB_THUNK*, @pTransferSyntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*, @nCount : LibC::UIntPtrT, @pSyntaxInfo : Win32cr::System::Rpc::MIDL_SYNTAX_INFO*)
    end
  end

  @[Extern]
  struct MIDL_STUBLESS_PROXY_INFO
    property pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*
    property proc_format_string : UInt8*
    property format_string_offset : UInt16*
    property pTransferSyntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*
    property nCount : LibC::UIntPtrT
    property pSyntaxInfo : Win32cr::System::Rpc::MIDL_SYNTAX_INFO*
    def initialize(@pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, @proc_format_string : UInt8*, @format_string_offset : UInt16*, @pTransferSyntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*, @nCount : LibC::UIntPtrT, @pSyntaxInfo : Win32cr::System::Rpc::MIDL_SYNTAX_INFO*)
    end
  end

  @[Extern]
  struct MIDL_SYNTAX_INFO
    property transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER
    property dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_TABLE*
    property proc_string : UInt8*
    property fmt_string_offset : UInt16*
    property type_string : UInt8*
    property aUserMarshalQuadruple : Void*
    property pMethodProperties : Win32cr::System::Rpc::MIDL_INTERFACE_METHOD_PROPERTIES*
    property pReserved2 : LibC::UIntPtrT
    def initialize(@transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER, @dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_TABLE*, @proc_string : UInt8*, @fmt_string_offset : UInt16*, @type_string : UInt8*, @aUserMarshalQuadruple : Void*, @pMethodProperties : Win32cr::System::Rpc::MIDL_INTERFACE_METHOD_PROPERTIES*, @pReserved2 : LibC::UIntPtrT)
    end
  end

  @[Extern(union: true)]
  struct CLIENT_CALL_RETURN
    property pointer : Void*
    property simple : LibC::IntPtrT
    def initialize(@pointer : Void*, @simple : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct FULL_PTR_XLAT_TABLES
    property ref_id_to_pointer : Void*
    property pointer_to_ref_id : Void*
    property next_ref_id : UInt32
    property xlat_side : Win32cr::System::Rpc::XLAT_SIDE
    def initialize(@ref_id_to_pointer : Void*, @pointer_to_ref_id : Void*, @next_ref_id : UInt32, @xlat_side : Win32cr::System::Rpc::XLAT_SIDE)
    end
  end

  @[Extern]
  struct MIDL_INTERCEPTION_INFO
    property version : UInt32
    property proc_string : UInt8*
    property proc_format_offset_table : UInt16*
    property proc_count : UInt32
    property type_string : UInt8*
    def initialize(@version : UInt32, @proc_string : UInt8*, @proc_format_offset_table : UInt16*, @proc_count : UInt32, @type_string : UInt8*)
    end
  end

  @[Extern]
  struct MIDL_WINRT_TYPE_SERIALIZATION_INFO
    property version : UInt32
    property type_format_string : UInt8*
    property format_string_size : UInt16
    property type_offset : UInt16
    property stub_desc : Win32cr::System::Rpc::MIDL_STUB_DESC*
    def initialize(@version : UInt32, @type_format_string : UInt8*, @format_string_size : UInt16, @type_offset : UInt16, @stub_desc : Win32cr::System::Rpc::MIDL_STUB_DESC*)
    end
  end

  @[Extern]
  struct NDR_USER_MARSHAL_INFO_LEVEL1
    property buffer : Void*
    property buffer_size : UInt32
    property pfnAllocate : LibC::IntPtrT
    property pfnFree : LibC::IntPtrT
    property pRpcChannelBuffer : Void*
    property reserved : LibC::UIntPtrT[5]
    def initialize(@buffer : Void*, @buffer_size : UInt32, @pfnAllocate : LibC::IntPtrT, @pfnFree : LibC::IntPtrT, @pRpcChannelBuffer : Void*, @reserved : LibC::UIntPtrT[5])
    end
  end

  @[Extern]
  struct NDR_USER_MARSHAL_INFO
    property information_level : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property level1 : Win32cr::System::Rpc::NDR_USER_MARSHAL_INFO_LEVEL1
    def initialize(@level1 : Win32cr::System::Rpc::NDR_USER_MARSHAL_INFO_LEVEL1)
    end
    end

    def initialize(@information_level : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct MIDL_TYPE_PICKLING_INFO
    property version : UInt32
    property flags : UInt32
    property reserved : LibC::UIntPtrT[3]
    def initialize(@version : UInt32, @flags : UInt32, @reserved : LibC::UIntPtrT[3])
    end
  end

  @[Extern]
  struct NDR64_PROC_FLAGS
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
  end

  @[Extern]
  struct NDR64_RPC_FLAGS
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
  end

  @[Extern]
  struct NDR64_PROC_FORMAT
    property flags : UInt32
    property stack_size : UInt32
    property constant_client_buffer_size : UInt32
    property constant_server_buffer_size : UInt32
    property rpc_flags : UInt16
    property float_double_mask : UInt16
    property number_of_params : UInt16
    property extension_size : UInt16
    def initialize(@flags : UInt32, @stack_size : UInt32, @constant_client_buffer_size : UInt32, @constant_server_buffer_size : UInt32, @rpc_flags : UInt16, @float_double_mask : UInt16, @number_of_params : UInt16, @extension_size : UInt16)
    end
  end

  @[Extern]
  struct NDR64_PARAM_FLAGS
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
  end

  @[Extern]
  struct NDR64_PARAM_FORMAT
    property type__ : Void*
    property attributes : Win32cr::System::Rpc::NDR64_PARAM_FLAGS
    property reserved : UInt16
    property stack_offset : UInt32
    def initialize(@type__ : Void*, @attributes : Win32cr::System::Rpc::NDR64_PARAM_FLAGS, @reserved : UInt16, @stack_offset : UInt32)
    end
  end

  @[Extern]
  struct NDR64_RANGE_FORMAT
    property format_code : UInt8
    property range_type : UInt8
    property reserved : UInt16
    property min_value : Int64
    property max_value : Int64
    def initialize(@format_code : UInt8, @range_type : UInt8, @reserved : UInt16, @min_value : Int64, @max_value : Int64)
    end
  end

  @[Extern]
  struct NDR64_CONTEXT_HANDLE_FLAGS
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
  end

  @[Extern]
  struct NDR64_CONTEXT_HANDLE_FORMAT
    property format_code : UInt8
    property context_flags : UInt8
    property rundown_routine_index : UInt8
    property ordinal : UInt8
    def initialize(@format_code : UInt8, @context_flags : UInt8, @rundown_routine_index : UInt8, @ordinal : UInt8)
    end
  end

  @[Extern]
  struct NDR64_BIND_PRIMITIVE
    property handle_type : UInt8
    property flags : UInt8
    property stack_offset : UInt16
    property reserved : UInt16
    def initialize(@handle_type : UInt8, @flags : UInt8, @stack_offset : UInt16, @reserved : UInt16)
    end
  end

  @[Extern]
  struct NDR64_BIND_GENERIC
    property handle_type : UInt8
    property flags : UInt8
    property stack_offset : UInt16
    property routine_index : UInt8
    property size : UInt8
    def initialize(@handle_type : UInt8, @flags : UInt8, @stack_offset : UInt16, @routine_index : UInt8, @size : UInt8)
    end
  end

  @[Extern]
  struct NDR64_BIND_CONTEXT
    property handle_type : UInt8
    property flags : UInt8
    property stack_offset : UInt16
    property routine_index : UInt8
    property ordinal : UInt8
    def initialize(@handle_type : UInt8, @flags : UInt8, @stack_offset : UInt16, @routine_index : UInt8, @ordinal : UInt8)
    end
  end

  @[Extern(union: true)]
  struct NDR64_BINDINGS
    property primitive : Win32cr::System::Rpc::NDR64_BIND_PRIMITIVE
    property generic : Win32cr::System::Rpc::NDR64_BIND_GENERIC
    property context : Win32cr::System::Rpc::NDR64_BIND_CONTEXT
    def initialize(@primitive : Win32cr::System::Rpc::NDR64_BIND_PRIMITIVE, @generic : Win32cr::System::Rpc::NDR64_BIND_GENERIC, @context : Win32cr::System::Rpc::NDR64_BIND_CONTEXT)
    end
  end

  @[Extern]
  struct NDR64_BIND_AND_NOTIFY_EXTENSION
    property binding : Win32cr::System::Rpc::NDR64_BIND_CONTEXT
    property notify_index : UInt16
    def initialize(@binding : Win32cr::System::Rpc::NDR64_BIND_CONTEXT, @notify_index : UInt16)
    end
  end

  @[Extern]
  struct NDR64_SYSTEM_HANDLE_FORMAT
    property format_code : UInt8
    property handle_type : UInt8
    property desired_access : UInt32
    def initialize(@format_code : UInt8, @handle_type : UInt8, @desired_access : UInt32)
    end
  end

  @[Extern]
  struct NDR64_POINTER_FORMAT
    property format_code : UInt8
    property flags : UInt8
    property reserved : UInt16
    property pointee : Void*
    def initialize(@format_code : UInt8, @flags : UInt8, @reserved : UInt16, @pointee : Void*)
    end
  end

  @[Extern]
  struct NDR64_NO_REPEAT_FORMAT
    property format_code : UInt8
    property flags : UInt8
    property reserved1 : UInt16
    property reserved2 : UInt32
    def initialize(@format_code : UInt8, @flags : UInt8, @reserved1 : UInt16, @reserved2 : UInt32)
    end
  end

  @[Extern]
  struct NDR64_POINTER_INSTANCE_HEADER_FORMAT
    property offset : UInt32
    property reserved : UInt32
    def initialize(@offset : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct NDR64_POINTER_REPEAT_FLAGS
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
  end

  @[Extern]
  struct NDR64_REPEAT_FORMAT
    property format_code : UInt8
    property flags : Win32cr::System::Rpc::NDR64_POINTER_REPEAT_FLAGS
    property reserved : UInt16
    property increment : UInt32
    property offset_to_array : UInt32
    property number_of_pointers : UInt32
    def initialize(@format_code : UInt8, @flags : Win32cr::System::Rpc::NDR64_POINTER_REPEAT_FLAGS, @reserved : UInt16, @increment : UInt32, @offset_to_array : UInt32, @number_of_pointers : UInt32)
    end
  end

  @[Extern]
  struct NDR64_FIXED_REPEAT_FORMAT
    property repeat_format : Win32cr::System::Rpc::NDR64_REPEAT_FORMAT
    property iterations : UInt32
    property reserved : UInt32
    def initialize(@repeat_format : Win32cr::System::Rpc::NDR64_REPEAT_FORMAT, @iterations : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct NDR64_IID_FLAGS
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
  end

  @[Extern]
  struct NDR64_CONSTANT_IID_FORMAT
    property format_code : UInt8
    property flags : UInt8
    property reserved : UInt16
    property guid : LibC::GUID
    def initialize(@format_code : UInt8, @flags : UInt8, @reserved : UInt16, @guid : LibC::GUID)
    end
  end

  @[Extern]
  struct NDR64_IID_FORMAT
    property format_code : UInt8
    property flags : UInt8
    property reserved : UInt16
    property iid_descriptor : Void*
    def initialize(@format_code : UInt8, @flags : UInt8, @reserved : UInt16, @iid_descriptor : Void*)
    end
  end

  @[Extern]
  struct NDR64_STRUCTURE_FLAGS
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
  end

  @[Extern]
  struct NDR64_STRUCTURE_HEADER_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS
    property reserve : UInt8
    property memory_size : UInt32
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS, @reserve : UInt8, @memory_size : UInt32)
    end
  end

  @[Extern]
  struct NDR64_CONF_STRUCTURE_HEADER_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS
    property reserve : UInt8
    property memory_size : UInt32
    property array_description : Void*
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS, @reserve : UInt8, @memory_size : UInt32, @array_description : Void*)
    end
  end

  @[Extern]
  struct NDR64_BOGUS_STRUCTURE_HEADER_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS
    property reserve : UInt8
    property memory_size : UInt32
    property original_member_layout : Void*
    property original_pointer_layout : Void*
    property pointer_layout : Void*
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS, @reserve : UInt8, @memory_size : UInt32, @original_member_layout : Void*, @original_pointer_layout : Void*, @pointer_layout : Void*)
    end
  end

  @[Extern]
  struct NDR64_CONF_BOGUS_STRUCTURE_HEADER_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS
    property dimensions : UInt8
    property memory_size : UInt32
    property original_member_layout : Void*
    property original_pointer_layout : Void*
    property pointer_layout : Void*
    property conf_array_description : Void*
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS, @dimensions : UInt8, @memory_size : UInt32, @original_member_layout : Void*, @original_pointer_layout : Void*, @pointer_layout : Void*, @conf_array_description : Void*)
    end
  end

  @[Extern]
  struct NDR64_SIMPLE_MEMBER_FORMAT
    property format_code : UInt8
    property reserved1 : UInt8
    property reserved2 : UInt16
    property reserved3 : UInt32
    def initialize(@format_code : UInt8, @reserved1 : UInt8, @reserved2 : UInt16, @reserved3 : UInt32)
    end
  end

  @[Extern]
  struct NDR64_MEMPAD_FORMAT
    property format_code : UInt8
    property reserve1 : UInt8
    property mem_pad : UInt16
    property reserved2 : UInt32
    def initialize(@format_code : UInt8, @reserve1 : UInt8, @mem_pad : UInt16, @reserved2 : UInt32)
    end
  end

  @[Extern]
  struct NDR64_EMBEDDED_COMPLEX_FORMAT
    property format_code : UInt8
    property reserve1 : UInt8
    property reserve2 : UInt16
    property type__ : Void*
    def initialize(@format_code : UInt8, @reserve1 : UInt8, @reserve2 : UInt16, @type__ : Void*)
    end
  end

  @[Extern]
  struct NDR64_BUFFER_ALIGN_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property reserved : UInt16
    property reserved2 : UInt32
    def initialize(@format_code : UInt8, @alignment : UInt8, @reserved : UInt16, @reserved2 : UInt32)
    end
  end

  @[Extern]
  struct NDR64_SIMPLE_REGION_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property region_size : UInt16
    property reserved : UInt32
    def initialize(@format_code : UInt8, @alignment : UInt8, @region_size : UInt16, @reserved : UInt32)
    end
  end

  @[Extern]
  struct NDR64_ENCAPSULATED_UNION
    property format_code : UInt8
    property alignment : UInt8
    property flags : UInt8
    property switch_type : UInt8
    property memory_offset : UInt32
    property memory_size : UInt32
    property reserved : UInt32
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : UInt8, @switch_type : UInt8, @memory_offset : UInt32, @memory_size : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct NDR64_NON_ENCAPSULATED_UNION
    property format_code : UInt8
    property alignment : UInt8
    property flags : UInt8
    property switch_type : UInt8
    property memory_size : UInt32
    property switch : Void*
    property reserved : UInt32
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : UInt8, @switch_type : UInt8, @memory_size : UInt32, @switch : Void*, @reserved : UInt32)
    end
  end

  @[Extern]
  struct NDR64_UNION_ARM_SELECTOR
    property reserved1 : UInt8
    property alignment : UInt8
    property reserved2 : UInt16
    property arms : UInt32
    def initialize(@reserved1 : UInt8, @alignment : UInt8, @reserved2 : UInt16, @arms : UInt32)
    end
  end

  @[Extern]
  struct NDR64_UNION_ARM
    property case_value : Int64
    property type__ : Void*
    property reserved : UInt32
    def initialize(@case_value : Int64, @type__ : Void*, @reserved : UInt32)
    end
  end

  @[Extern]
  struct NDR64_ARRAY_FLAGS
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
  end

  @[Extern]
  struct NDR64_ARRAY_ELEMENT_INFO
    property element_mem_size : UInt32
    property element : Void*
    def initialize(@element_mem_size : UInt32, @element : Void*)
    end
  end

  @[Extern]
  struct NDR64_FIX_ARRAY_HEADER_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS
    property reserved : UInt8
    property total_size : UInt32
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS, @reserved : UInt8, @total_size : UInt32)
    end
  end

  @[Extern]
  struct NDR64_CONF_ARRAY_HEADER_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS
    property reserved : UInt8
    property element_size : UInt32
    property conf_descriptor : Void*
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS, @reserved : UInt8, @element_size : UInt32, @conf_descriptor : Void*)
    end
  end

  @[Extern]
  struct NDR64_CONF_VAR_ARRAY_HEADER_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS
    property reserved : UInt8
    property element_size : UInt32
    property conf_descriptor : Void*
    property var_descriptor : Void*
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS, @reserved : UInt8, @element_size : UInt32, @conf_descriptor : Void*, @var_descriptor : Void*)
    end
  end

  @[Extern]
  struct NDR64_VAR_ARRAY_HEADER_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS
    property reserved : UInt8
    property total_size : UInt32
    property element_size : UInt32
    property var_descriptor : Void*
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS, @reserved : UInt8, @total_size : UInt32, @element_size : UInt32, @var_descriptor : Void*)
    end
  end

  @[Extern]
  struct NDR64_BOGUS_ARRAY_HEADER_FORMAT
    property format_code : UInt8
    property alignment : UInt8
    property flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS
    property number_dims : UInt8
    property number_elements : UInt32
    property element : Void*
    def initialize(@format_code : UInt8, @alignment : UInt8, @flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS, @number_dims : UInt8, @number_elements : UInt32, @element : Void*)
    end
  end

  @[Extern]
  struct NDR64_CONF_VAR_BOGUS_ARRAY_HEADER_FORMAT
    property fixed_array_format : Win32cr::System::Rpc::NDR64_BOGUS_ARRAY_HEADER_FORMAT
    property conf_description : Void*
    property var_description : Void*
    property offset_description : Void*
    def initialize(@fixed_array_format : Win32cr::System::Rpc::NDR64_BOGUS_ARRAY_HEADER_FORMAT, @conf_description : Void*, @var_description : Void*, @offset_description : Void*)
    end
  end

  @[Extern]
  struct NDR64_STRING_FLAGS
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
  end

  @[Extern]
  struct NDR64_STRING_HEADER_FORMAT
    property format_code : UInt8
    property flags : Win32cr::System::Rpc::NDR64_STRING_FLAGS
    property element_size : UInt16
    def initialize(@format_code : UInt8, @flags : Win32cr::System::Rpc::NDR64_STRING_FLAGS, @element_size : UInt16)
    end
  end

  @[Extern]
  struct NDR64_NON_CONFORMANT_STRING_FORMAT
    property header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT
    property total_size : UInt32
    def initialize(@header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT, @total_size : UInt32)
    end
  end

  @[Extern]
  struct NDR64_RANGED_STRING_FORMAT
    property header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT
    property reserved : UInt32
    property min : UInt64
    property max : UInt64
    def initialize(@header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT, @reserved : UInt32, @min : UInt64, @max : UInt64)
    end
  end

  @[Extern]
  struct NDR64_CONFORMANT_STRING_FORMAT
    property header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT
    def initialize(@header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT)
    end
  end

  @[Extern]
  struct NDR64_SIZED_CONFORMANT_STRING_FORMAT
    property header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT
    property size_description : Void*
    def initialize(@header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT, @size_description : Void*)
    end
  end

  @[Extern]
  struct NDR64_EXPR_OPERATOR
    property expr_type : UInt8
    property operator : UInt8
    property cast_type : UInt8
    property reserved : UInt8
    def initialize(@expr_type : UInt8, @operator : UInt8, @cast_type : UInt8, @reserved : UInt8)
    end
  end

  @[Extern]
  struct NDR64_EXPR_CONST32
    property expr_type : UInt8
    property reserved : UInt8
    property reserved1 : UInt16
    property const_value : UInt32
    def initialize(@expr_type : UInt8, @reserved : UInt8, @reserved1 : UInt16, @const_value : UInt32)
    end
  end

  @[Extern]
  struct NDR64_EXPR_CONST64
    property expr_type : UInt8
    property reserved : UInt8
    property reserved1 : UInt16
    property const_value : Int64
    def initialize(@expr_type : UInt8, @reserved : UInt8, @reserved1 : UInt16, @const_value : Int64)
    end
  end

  @[Extern]
  struct NDR64_EXPR_VAR
    property expr_type : UInt8
    property var_type : UInt8
    property reserved : UInt16
    property offset : UInt32
    def initialize(@expr_type : UInt8, @var_type : UInt8, @reserved : UInt16, @offset : UInt32)
    end
  end

  @[Extern]
  struct NDR64_EXPR_NOOP
    property expr_type : UInt8
    property size : UInt8
    property reserved : UInt16
    def initialize(@expr_type : UInt8, @size : UInt8, @reserved : UInt16)
    end
  end

  @[Extern]
  struct NDR64_TRANSMIT_AS_FLAGS
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
  end

  @[Extern]
  struct NDR64_TRANSMIT_AS_FORMAT
    property format_code : UInt8
    property flags : UInt8
    property routine_index : UInt16
    property transmitted_type_wire_alignment : UInt16
    property memory_alignment : UInt16
    property presented_type_memory_size : UInt32
    property transmitted_type_buffer_size : UInt32
    property transmitted_type : Void*
    def initialize(@format_code : UInt8, @flags : UInt8, @routine_index : UInt16, @transmitted_type_wire_alignment : UInt16, @memory_alignment : UInt16, @presented_type_memory_size : UInt32, @transmitted_type_buffer_size : UInt32, @transmitted_type : Void*)
    end
  end

  @[Extern]
  struct NDR64_USER_MARSHAL_FLAGS
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
  end

  @[Extern]
  struct NDR64_USER_MARSHAL_FORMAT
    property format_code : UInt8
    property flags : UInt8
    property routine_index : UInt16
    property transmitted_type_wire_alignment : UInt16
    property memory_alignment : UInt16
    property user_type_memory_size : UInt32
    property transmitted_type_buffer_size : UInt32
    property transmitted_type : Void*
    def initialize(@format_code : UInt8, @flags : UInt8, @routine_index : UInt16, @transmitted_type_wire_alignment : UInt16, @memory_alignment : UInt16, @user_type_memory_size : UInt32, @transmitted_type_buffer_size : UInt32, @transmitted_type : Void*)
    end
  end

  @[Extern]
  struct NDR64_PIPE_FLAGS
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
  end

  @[Extern]
  struct NDR64_PIPE_FORMAT
    property format_code : UInt8
    property flags : UInt8
    property alignment : UInt8
    property reserved : UInt8
    property type__ : Void*
    property memory_size : UInt32
    property buffer_size : UInt32
    def initialize(@format_code : UInt8, @flags : UInt8, @alignment : UInt8, @reserved : UInt8, @type__ : Void*, @memory_size : UInt32, @buffer_size : UInt32)
    end
  end

  @[Extern]
  struct NDR64_RANGE_PIPE_FORMAT
    property format_code : UInt8
    property flags : UInt8
    property alignment : UInt8
    property reserved : UInt8
    property type__ : Void*
    property memory_size : UInt32
    property buffer_size : UInt32
    property min_value : UInt32
    property max_value : UInt32
    def initialize(@format_code : UInt8, @flags : UInt8, @alignment : UInt8, @reserved : UInt8, @type__ : Void*, @memory_size : UInt32, @buffer_size : UInt32, @min_value : UInt32, @max_value : UInt32)
    end
  end

  @[Extern]
  struct NDR64_TYPE_STRICT_CONTEXT_HANDLE
    property format_code : UInt8
    property real_format_code : UInt8
    property reserved : UInt16
    property type__ : Void*
    property ctxt_flags : UInt32
    property ctxt_id : UInt32
    def initialize(@format_code : UInt8, @real_format_code : UInt8, @reserved : UInt16, @type__ : Void*, @ctxt_flags : UInt32, @ctxt_id : UInt32)
    end
  end

  def iUnknownQueryInterfaceProxy(this : Void*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IUnknown_QueryInterface_Proxy(this, riid, ppvObject)
    {% end %}
  end

  def iUnknownAddRefProxy(this : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.IUnknown_AddRef_Proxy(this)
    {% end %}
  end

  def iUnknownReleaseProxy(this : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.IUnknown_Release_Proxy(this)
    {% end %}
  end

  def rpcBindingCopy(source_binding : Void*, destination_binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingCopy(source_binding, destination_binding)
    {% end %}
  end

  def rpcBindingFree(binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingFree(binding)
    {% end %}
  end

  def rpcBindingSetOption(hBinding : Void*, option : UInt32, optionValue : LibC::UIntPtrT) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingSetOption(hBinding, option, optionValue)
    {% end %}
  end

  def rpcBindingInqOption(hBinding : Void*, option : UInt32, pOptionValue : LibC::UIntPtrT*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqOption(hBinding, option, pOptionValue)
    {% end %}
  end

  def rpcBindingFromStringBindingA(string_binding : UInt8*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingFromStringBindingA(string_binding, binding)
    {% end %}
  end

  def rpcBindingFromStringBindingW(string_binding : UInt16*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingFromStringBindingW(string_binding, binding)
    {% end %}
  end

  def rpcSsGetContextBinding(context_handle : Void*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSsGetContextBinding(context_handle, binding)
    {% end %}
  end

  def rpcBindingInqMaxCalls(binding : Void*, max_calls : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqMaxCalls(binding, max_calls)
    {% end %}
  end

  def rpcBindingInqObject(binding : Void*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqObject(binding, object_uuid)
    {% end %}
  end

  def rpcBindingReset(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingReset(binding)
    {% end %}
  end

  def rpcBindingSetObject(binding : Void*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingSetObject(binding, object_uuid)
    {% end %}
  end

  def rpcMgmtInqDefaultProtectLevel(authn_svc : UInt32, authn_level : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtInqDefaultProtectLevel(authn_svc, authn_level)
    {% end %}
  end

  def rpcBindingToStringBindingA(binding : Void*, string_binding : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingToStringBindingA(binding, string_binding)
    {% end %}
  end

  def rpcBindingToStringBindingW(binding : Void*, string_binding : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingToStringBindingW(binding, string_binding)
    {% end %}
  end

  def rpcBindingVectorFree(binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingVectorFree(binding_vector)
    {% end %}
  end

  def rpcStringBindingComposeA(obj_uuid : UInt8*, prot_seq : UInt8*, network_addr : UInt8*, endpoint : UInt8*, options : UInt8*, string_binding : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcStringBindingComposeA(obj_uuid, prot_seq, network_addr, endpoint, options, string_binding)
    {% end %}
  end

  def rpcStringBindingComposeW(obj_uuid : UInt16*, prot_seq : UInt16*, network_addr : UInt16*, endpoint : UInt16*, options : UInt16*, string_binding : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcStringBindingComposeW(obj_uuid, prot_seq, network_addr, endpoint, options, string_binding)
    {% end %}
  end

  def rpcStringBindingParseA(string_binding : UInt8*, obj_uuid : UInt8**, protseq : UInt8**, network_addr : UInt8**, endpoint : UInt8**, network_options : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcStringBindingParseA(string_binding, obj_uuid, protseq, network_addr, endpoint, network_options)
    {% end %}
  end

  def rpcStringBindingParseW(string_binding : UInt16*, obj_uuid : UInt16**, protseq : UInt16**, network_addr : UInt16**, endpoint : UInt16**, network_options : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcStringBindingParseW(string_binding, obj_uuid, protseq, network_addr, endpoint, network_options)
    {% end %}
  end

  def rpcStringFreeA(string : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcStringFreeA(string)
    {% end %}
  end

  def rpcStringFreeW(string : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcStringFreeW(string)
    {% end %}
  end

  def rpcIfInqId(rpc_if_handle : Void*, rpc_if_id : Win32cr::System::Rpc::RPC_IF_ID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcIfInqId(rpc_if_handle, rpc_if_id)
    {% end %}
  end

  def rpcNetworkIsProtseqValidA(protseq : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNetworkIsProtseqValidA(protseq)
    {% end %}
  end

  def rpcNetworkIsProtseqValidW(protseq : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNetworkIsProtseqValidW(protseq)
    {% end %}
  end

  def rpcMgmtInqComTimeout(binding : Void*, timeout : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtInqComTimeout(binding, timeout)
    {% end %}
  end

  def rpcMgmtSetComTimeout(binding : Void*, timeout : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtSetComTimeout(binding, timeout)
    {% end %}
  end

  def rpcMgmtSetCancelTimeout(timeout : Int32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtSetCancelTimeout(timeout)
    {% end %}
  end

  def rpcNetworkInqProtseqsA(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORA**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNetworkInqProtseqsA(protseq_vector)
    {% end %}
  end

  def rpcNetworkInqProtseqsW(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORW**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNetworkInqProtseqsW(protseq_vector)
    {% end %}
  end

  def rpcObjectInqType(obj_uuid : LibC::GUID*, type_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcObjectInqType(obj_uuid, type_uuid)
    {% end %}
  end

  def rpcObjectSetInqFn(inquiry_fn : Win32cr::System::Rpc::RPC_OBJECT_INQ_FN) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcObjectSetInqFn(inquiry_fn)
    {% end %}
  end

  def rpcObjectSetType(obj_uuid : LibC::GUID*, type_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcObjectSetType(obj_uuid, type_uuid)
    {% end %}
  end

  def rpcProtseqVectorFreeA(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORA**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcProtseqVectorFreeA(protseq_vector)
    {% end %}
  end

  def rpcProtseqVectorFreeW(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORW**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcProtseqVectorFreeW(protseq_vector)
    {% end %}
  end

  def rpcServerInqBindings(binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInqBindings(binding_vector)
    {% end %}
  end

  def rpcServerInqBindingsEx(security_descriptor : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInqBindingsEx(security_descriptor, binding_vector)
    {% end %}
  end

  def rpcServerInqIf(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInqIf(if_spec, mgr_type_uuid, mgr_epv)
    {% end %}
  end

  def rpcServerListen(minimum_call_threads : UInt32, max_calls : UInt32, dont_wait : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerListen(minimum_call_threads, max_calls, dont_wait)
    {% end %}
  end

  def rpcServerRegisterIf(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerRegisterIf(if_spec, mgr_type_uuid, mgr_epv)
    {% end %}
  end

  def rpcServerRegisterIfEx(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*, flags : UInt32, max_calls : UInt32, if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerRegisterIfEx(if_spec, mgr_type_uuid, mgr_epv, flags, max_calls, if_callback)
    {% end %}
  end

  def rpcServerRegisterIf2(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*, flags : UInt32, max_calls : UInt32, max_rpc_size : UInt32, if_callback_fn : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerRegisterIf2(if_spec, mgr_type_uuid, mgr_epv, flags, max_calls, max_rpc_size, if_callback_fn)
    {% end %}
  end

  def rpcServerRegisterIf3(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*, flags : UInt32, max_calls : UInt32, max_rpc_size : UInt32, if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerRegisterIf3(if_spec, mgr_type_uuid, mgr_epv, flags, max_calls, max_rpc_size, if_callback, security_descriptor)
    {% end %}
  end

  def rpcServerUnregisterIf(if_spec : Void*, mgr_type_uuid : LibC::GUID*, wait_for_calls_to_complete : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUnregisterIf(if_spec, mgr_type_uuid, wait_for_calls_to_complete)
    {% end %}
  end

  def rpcServerUnregisterIfEx(if_spec : Void*, mgr_type_uuid : LibC::GUID*, rundown_context_handles : Int32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUnregisterIfEx(if_spec, mgr_type_uuid, rundown_context_handles)
    {% end %}
  end

  def rpcServerUseAllProtseqs(max_calls : UInt32, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseAllProtseqs(max_calls, security_descriptor)
    {% end %}
  end

  def rpcServerUseAllProtseqsEx(max_calls : UInt32, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseAllProtseqsEx(max_calls, security_descriptor, policy)
    {% end %}
  end

  def rpcServerUseAllProtseqsIf(max_calls : UInt32, if_spec : Void*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseAllProtseqsIf(max_calls, if_spec, security_descriptor)
    {% end %}
  end

  def rpcServerUseAllProtseqsIfEx(max_calls : UInt32, if_spec : Void*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseAllProtseqsIfEx(max_calls, if_spec, security_descriptor, policy)
    {% end %}
  end

  def rpcServerUseProtseqA(protseq : UInt8*, max_calls : UInt32, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqA(protseq, max_calls, security_descriptor)
    {% end %}
  end

  def rpcServerUseProtseqExA(protseq : UInt8*, max_calls : UInt32, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqExA(protseq, max_calls, security_descriptor, policy)
    {% end %}
  end

  def rpcServerUseProtseqW(protseq : UInt16*, max_calls : UInt32, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqW(protseq, max_calls, security_descriptor)
    {% end %}
  end

  def rpcServerUseProtseqExW(protseq : UInt16*, max_calls : UInt32, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqExW(protseq, max_calls, security_descriptor, policy)
    {% end %}
  end

  def rpcServerUseProtseqEpA(protseq : UInt8*, max_calls : UInt32, endpoint : UInt8*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqEpA(protseq, max_calls, endpoint, security_descriptor)
    {% end %}
  end

  def rpcServerUseProtseqEpExA(protseq : UInt8*, max_calls : UInt32, endpoint : UInt8*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqEpExA(protseq, max_calls, endpoint, security_descriptor, policy)
    {% end %}
  end

  def rpcServerUseProtseqEpW(protseq : UInt16*, max_calls : UInt32, endpoint : UInt16*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqEpW(protseq, max_calls, endpoint, security_descriptor)
    {% end %}
  end

  def rpcServerUseProtseqEpExW(protseq : UInt16*, max_calls : UInt32, endpoint : UInt16*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqEpExW(protseq, max_calls, endpoint, security_descriptor, policy)
    {% end %}
  end

  def rpcServerUseProtseqIfA(protseq : UInt8*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqIfA(protseq, max_calls, if_spec, security_descriptor)
    {% end %}
  end

  def rpcServerUseProtseqIfExA(protseq : UInt8*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqIfExA(protseq, max_calls, if_spec, security_descriptor, policy)
    {% end %}
  end

  def rpcServerUseProtseqIfW(protseq : UInt16*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqIfW(protseq, max_calls, if_spec, security_descriptor)
    {% end %}
  end

  def rpcServerUseProtseqIfExW(protseq : UInt16*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUseProtseqIfExW(protseq, max_calls, if_spec, security_descriptor, policy)
    {% end %}
  end

  def rpcServerYield : Void
    {% if !flag?(:docs) %}
    C.RpcServerYield
    {% end %}
  end

  def rpcMgmtStatsVectorFree(stats_vector : Win32cr::System::Rpc::RPC_STATS_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtStatsVectorFree(stats_vector)
    {% end %}
  end

  def rpcMgmtInqStats(binding : Void*, statistics : Win32cr::System::Rpc::RPC_STATS_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtInqStats(binding, statistics)
    {% end %}
  end

  def rpcMgmtIsServerListening(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtIsServerListening(binding)
    {% end %}
  end

  def rpcMgmtStopServerListening(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtStopServerListening(binding)
    {% end %}
  end

  def rpcMgmtWaitServerListen : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtWaitServerListen
    {% end %}
  end

  def rpcMgmtSetServerStackSize(thread_stack_size : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtSetServerStackSize(thread_stack_size)
    {% end %}
  end

  def rpcSsDontSerializeContext : Void
    {% if !flag?(:docs) %}
    C.RpcSsDontSerializeContext
    {% end %}
  end

  def rpcMgmtEnableIdleCleanup : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtEnableIdleCleanup
    {% end %}
  end

  def rpcMgmtInqIfIds(binding : Void*, if_id_vector : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtInqIfIds(binding, if_id_vector)
    {% end %}
  end

  def rpcIfIdVectorFree(if_id_vector : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcIfIdVectorFree(if_id_vector)
    {% end %}
  end

  def rpcMgmtInqServerPrincNameA(binding : Void*, authn_svc : UInt32, server_princ_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtInqServerPrincNameA(binding, authn_svc, server_princ_name)
    {% end %}
  end

  def rpcMgmtInqServerPrincNameW(binding : Void*, authn_svc : UInt32, server_princ_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtInqServerPrincNameW(binding, authn_svc, server_princ_name)
    {% end %}
  end

  def rpcServerInqDefaultPrincNameA(authn_svc : UInt32, princ_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInqDefaultPrincNameA(authn_svc, princ_name)
    {% end %}
  end

  def rpcServerInqDefaultPrincNameW(authn_svc : UInt32, princ_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInqDefaultPrincNameW(authn_svc, princ_name)
    {% end %}
  end

  def rpcEpResolveBinding(binding : Void*, if_spec : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcEpResolveBinding(binding, if_spec)
    {% end %}
  end

  def rpcNsBindingInqEntryNameA(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingInqEntryNameA(binding, entry_name_syntax, entry_name)
    {% end %}
  end

  def rpcNsBindingInqEntryNameW(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingInqEntryNameW(binding, entry_name_syntax, entry_name)
    {% end %}
  end

  def rpcBindingCreateA(template : Win32cr::System::Rpc::RPC_BINDING_HANDLE_TEMPLATE_V1_A*, security : Win32cr::System::Rpc::RPC_BINDING_HANDLE_SECURITY_V1_A*, options : Win32cr::System::Rpc::RPC_BINDING_HANDLE_OPTIONS_V1*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingCreateA(template, security, options, binding)
    {% end %}
  end

  def rpcBindingCreateW(template : Win32cr::System::Rpc::RPC_BINDING_HANDLE_TEMPLATE_V1_W*, security : Win32cr::System::Rpc::RPC_BINDING_HANDLE_SECURITY_V1_W*, options : Win32cr::System::Rpc::RPC_BINDING_HANDLE_OPTIONS_V1*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingCreateW(template, security, options, binding)
    {% end %}
  end

  def rpcServerInqBindingHandle(binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInqBindingHandle(binding)
    {% end %}
  end

  def rpcImpersonateClient(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcImpersonateClient(binding_handle)
    {% end %}
  end

  def rpcImpersonateClient2(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcImpersonateClient2(binding_handle)
    {% end %}
  end

  def rpcRevertToSelfEx(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcRevertToSelfEx(binding_handle)
    {% end %}
  end

  def rpcRevertToSelf : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcRevertToSelf
    {% end %}
  end

  def rpcImpersonateClientContainer(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcImpersonateClientContainer(binding_handle)
    {% end %}
  end

  def rpcRevertContainerImpersonation : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcRevertContainerImpersonation
    {% end %}
  end

  def rpcBindingInqAuthClientA(client_binding : Void*, privs : Void**, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqAuthClientA(client_binding, privs, server_princ_name, authn_level, authn_svc, authz_svc)
    {% end %}
  end

  def rpcBindingInqAuthClientW(client_binding : Void*, privs : Void**, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqAuthClientW(client_binding, privs, server_princ_name, authn_level, authn_svc, authz_svc)
    {% end %}
  end

  def rpcBindingInqAuthClientExA(client_binding : Void*, privs : Void**, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*, flags : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqAuthClientExA(client_binding, privs, server_princ_name, authn_level, authn_svc, authz_svc, flags)
    {% end %}
  end

  def rpcBindingInqAuthClientExW(client_binding : Void*, privs : Void**, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*, flags : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqAuthClientExW(client_binding, privs, server_princ_name, authn_level, authn_svc, authz_svc, flags)
    {% end %}
  end

  def rpcBindingInqAuthInfoA(binding : Void*, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqAuthInfoA(binding, server_princ_name, authn_level, authn_svc, auth_identity, authz_svc)
    {% end %}
  end

  def rpcBindingInqAuthInfoW(binding : Void*, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqAuthInfoW(binding, server_princ_name, authn_level, authn_svc, auth_identity, authz_svc)
    {% end %}
  end

  def rpcBindingSetAuthInfoA(binding : Void*, server_princ_name : UInt8*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingSetAuthInfoA(binding, server_princ_name, authn_level, authn_svc, auth_identity, authz_svc)
    {% end %}
  end

  def rpcBindingSetAuthInfoExA(binding : Void*, server_princ_name : UInt8*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingSetAuthInfoExA(binding, server_princ_name, authn_level, authn_svc, auth_identity, authz_svc, security_qos)
    {% end %}
  end

  def rpcBindingSetAuthInfoW(binding : Void*, server_princ_name : UInt16*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingSetAuthInfoW(binding, server_princ_name, authn_level, authn_svc, auth_identity, authz_svc)
    {% end %}
  end

  def rpcBindingSetAuthInfoExW(binding : Void*, server_princ_name : UInt16*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingSetAuthInfoExW(binding, server_princ_name, authn_level, authn_svc, auth_identity, authz_svc, security_qos)
    {% end %}
  end

  def rpcBindingInqAuthInfoExA(binding : Void*, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*, rpc_qos_version : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqAuthInfoExA(binding, server_princ_name, authn_level, authn_svc, auth_identity, authz_svc, rpc_qos_version, security_qos)
    {% end %}
  end

  def rpcBindingInqAuthInfoExW(binding : Void*, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*, rpc_qos_version : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingInqAuthInfoExW(binding, server_princ_name, authn_level, authn_svc, auth_identity, authz_svc, rpc_qos_version, security_qos)
    {% end %}
  end

  def rpcServerCompleteSecurityCallback(binding_handle : Void*, status : Win32cr::System::Rpc::RPC_STATUS) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerCompleteSecurityCallback(binding_handle, status)
    {% end %}
  end

  def rpcServerRegisterAuthInfoA(server_princ_name : UInt8*, authn_svc : UInt32, get_key_fn : Win32cr::System::Rpc::RPC_AUTH_KEY_RETRIEVAL_FN, arg : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerRegisterAuthInfoA(server_princ_name, authn_svc, get_key_fn, arg)
    {% end %}
  end

  def rpcServerRegisterAuthInfoW(server_princ_name : UInt16*, authn_svc : UInt32, get_key_fn : Win32cr::System::Rpc::RPC_AUTH_KEY_RETRIEVAL_FN, arg : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerRegisterAuthInfoW(server_princ_name, authn_svc, get_key_fn, arg)
    {% end %}
  end

  def rpcBindingServerFromClient(client_binding : Void*, server_binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingServerFromClient(client_binding, server_binding)
    {% end %}
  end

  def rpcRaiseException(exception : Win32cr::System::Rpc::RPC_STATUS) : Void
    {% if !flag?(:docs) %}
    C.RpcRaiseException(exception)
    {% end %}
  end

  def rpcTestCancel : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcTestCancel
    {% end %}
  end

  def rpcServerTestCancel(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerTestCancel(binding_handle)
    {% end %}
  end

  def rpcCancelThread(thread : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcCancelThread(thread)
    {% end %}
  end

  def rpcCancelThreadEx(thread : Void*, timeout : Int32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcCancelThreadEx(thread, timeout)
    {% end %}
  end

  def uuidCreate(uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.UuidCreate(uuid)
    {% end %}
  end

  def uuidCreateSequential(uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.UuidCreateSequential(uuid)
    {% end %}
  end

  def uuidToStringA(uuid : LibC::GUID*, string_uuid : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.UuidToStringA(uuid, string_uuid)
    {% end %}
  end

  def uuidFromStringA(string_uuid : UInt8*, uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.UuidFromStringA(string_uuid, uuid)
    {% end %}
  end

  def uuidToStringW(uuid : LibC::GUID*, string_uuid : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.UuidToStringW(uuid, string_uuid)
    {% end %}
  end

  def uuidFromStringW(string_uuid : UInt16*, uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.UuidFromStringW(string_uuid, uuid)
    {% end %}
  end

  def uuidCompare(uuid1 : LibC::GUID*, uuid2 : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : Int32
    {% if !flag?(:docs) %}
    C.UuidCompare(uuid1, uuid2, status)
    {% end %}
  end

  def uuidCreateNil(nil_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.UuidCreateNil(nil_uuid)
    {% end %}
  end

  def uuidEqual(uuid1 : LibC::GUID*, uuid2 : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : Int32
    {% if !flag?(:docs) %}
    C.UuidEqual(uuid1, uuid2, status)
    {% end %}
  end

  def uuidHash(uuid : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : UInt16
    {% if !flag?(:docs) %}
    C.UuidHash(uuid, status)
    {% end %}
  end

  def uuidIsNil(uuid : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : Int32
    {% if !flag?(:docs) %}
    C.UuidIsNil(uuid, status)
    {% end %}
  end

  def rpcEpRegisterNoReplaceA(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcEpRegisterNoReplaceA(if_spec, binding_vector, uuid_vector, annotation__)
    {% end %}
  end

  def rpcEpRegisterNoReplaceW(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcEpRegisterNoReplaceW(if_spec, binding_vector, uuid_vector, annotation__)
    {% end %}
  end

  def rpcEpRegisterA(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcEpRegisterA(if_spec, binding_vector, uuid_vector, annotation__)
    {% end %}
  end

  def rpcEpRegisterW(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcEpRegisterW(if_spec, binding_vector, uuid_vector, annotation__)
    {% end %}
  end

  def rpcEpUnregister(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcEpUnregister(if_spec, binding_vector, uuid_vector)
    {% end %}
  end

  def dceErrorInqTextA(rpc_status : Win32cr::System::Rpc::RPC_STATUS, error_text : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.DceErrorInqTextA(rpc_status, error_text)
    {% end %}
  end

  def dceErrorInqTextW(rpc_status : Win32cr::System::Rpc::RPC_STATUS, error_text : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.DceErrorInqTextW(rpc_status, error_text)
    {% end %}
  end

  def rpcMgmtEpEltInqBegin(ep_binding : Void*, inquiry_type : UInt32, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, object_uuid : LibC::GUID*, inquiry_context : Void***) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtEpEltInqBegin(ep_binding, inquiry_type, if_id, vers_option, object_uuid, inquiry_context)
    {% end %}
  end

  def rpcMgmtEpEltInqDone(inquiry_context : Void***) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtEpEltInqDone(inquiry_context)
    {% end %}
  end

  def rpcMgmtEpEltInqNextA(inquiry_context : Void**, if_id : Win32cr::System::Rpc::RPC_IF_ID*, binding : Void**, object_uuid : LibC::GUID*, annotation__ : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtEpEltInqNextA(inquiry_context, if_id, binding, object_uuid, annotation__)
    {% end %}
  end

  def rpcMgmtEpEltInqNextW(inquiry_context : Void**, if_id : Win32cr::System::Rpc::RPC_IF_ID*, binding : Void**, object_uuid : LibC::GUID*, annotation__ : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtEpEltInqNextW(inquiry_context, if_id, binding, object_uuid, annotation__)
    {% end %}
  end

  def rpcMgmtEpUnregister(ep_binding : Void*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, binding : Void*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtEpUnregister(ep_binding, if_id, binding, object_uuid)
    {% end %}
  end

  def rpcMgmtSetAuthorizationFn(authorization_fn : Win32cr::System::Rpc::RPC_MGMT_AUTHORIZATION_FN) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcMgmtSetAuthorizationFn(authorization_fn)
    {% end %}
  end

  def rpcExceptionFilter(exception_code : UInt32) : Int32
    {% if !flag?(:docs) %}
    C.RpcExceptionFilter(exception_code)
    {% end %}
  end

  def rpcServerInterfaceGroupCreateW(interfaces : Win32cr::System::Rpc::RPC_INTERFACE_TEMPLATEW*, num_ifs : UInt32, endpoints : Win32cr::System::Rpc::RPC_ENDPOINT_TEMPLATEW*, num_endpoints : UInt32, idle_period : UInt32, idle_callback_fn : Win32cr::System::Rpc::RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN, idle_callback_context : Void*, if_group : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInterfaceGroupCreateW(interfaces, num_ifs, endpoints, num_endpoints, idle_period, idle_callback_fn, idle_callback_context, if_group)
    {% end %}
  end

  def rpcServerInterfaceGroupCreateA(interfaces : Win32cr::System::Rpc::RPC_INTERFACE_TEMPLATEA*, num_ifs : UInt32, endpoints : Win32cr::System::Rpc::RPC_ENDPOINT_TEMPLATEA*, num_endpoints : UInt32, idle_period : UInt32, idle_callback_fn : Win32cr::System::Rpc::RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN, idle_callback_context : Void*, if_group : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInterfaceGroupCreateA(interfaces, num_ifs, endpoints, num_endpoints, idle_period, idle_callback_fn, idle_callback_context, if_group)
    {% end %}
  end

  def rpcServerInterfaceGroupClose(if_group : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInterfaceGroupClose(if_group)
    {% end %}
  end

  def rpcServerInterfaceGroupActivate(if_group : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInterfaceGroupActivate(if_group)
    {% end %}
  end

  def rpcServerInterfaceGroupDeactivate(if_group : Void*, force_deactivation : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInterfaceGroupDeactivate(if_group, force_deactivation)
    {% end %}
  end

  def rpcServerInterfaceGroupInqBindings(if_group : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInterfaceGroupInqBindings(if_group, binding_vector)
    {% end %}
  end

  def iRpcNegotiateTransferSyntax(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcNegotiateTransferSyntax(message)
    {% end %}
  end

  def iRpcGetBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcGetBuffer(message)
    {% end %}
  end

  def iRpcGetBufferWithObject(message : Win32cr::System::Rpc::RPC_MESSAGE*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcGetBufferWithObject(message, object_uuid)
    {% end %}
  end

  def iRpcSendReceive(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcSendReceive(message)
    {% end %}
  end

  def iRpcFreeBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcFreeBuffer(message)
    {% end %}
  end

  def iRpcSend(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcSend(message)
    {% end %}
  end

  def iRpcReceive(message : Win32cr::System::Rpc::RPC_MESSAGE*, size : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcReceive(message, size)
    {% end %}
  end

  def iRpcFreePipeBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcFreePipeBuffer(message)
    {% end %}
  end

  def iRpcReallocPipeBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*, new_size : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcReallocPipeBuffer(message, new_size)
    {% end %}
  end

  def iRpcRequestMutex(mutex : Void**) : Void
    {% if !flag?(:docs) %}
    C.I_RpcRequestMutex(mutex)
    {% end %}
  end

  def iRpcClearMutex(mutex : Void*) : Void
    {% if !flag?(:docs) %}
    C.I_RpcClearMutex(mutex)
    {% end %}
  end

  def iRpcDeleteMutex(mutex : Void*) : Void
    {% if !flag?(:docs) %}
    C.I_RpcDeleteMutex(mutex)
    {% end %}
  end

  def iRpcAllocate(size : UInt32) : Void*
    {% if !flag?(:docs) %}
    C.I_RpcAllocate(size)
    {% end %}
  end

  def iRpcFree(object : Void*) : Void
    {% if !flag?(:docs) %}
    C.I_RpcFree(object)
    {% end %}
  end

  def iRpcPauseExecution(milliseconds : UInt32) : Void
    {% if !flag?(:docs) %}
    C.I_RpcPauseExecution(milliseconds)
    {% end %}
  end

  def iRpcGetExtendedError : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcGetExtendedError
    {% end %}
  end

  def iRpcSystemHandleTypeSpecificWork(handle : Void*, actual_type : UInt8, idl_type : UInt8, marshal_direction : Win32cr::System::Rpc::LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcSystemHandleTypeSpecificWork(handle, actual_type, idl_type, marshal_direction)
    {% end %}
  end

  def iRpcGetCurrentCallHandle : Void*
    {% if !flag?(:docs) %}
    C.I_RpcGetCurrentCallHandle
    {% end %}
  end

  def iRpcNsInterfaceExported(entry_name_syntax : UInt32, entry_name : UInt16*, rpc_interface_information : Win32cr::System::Rpc::RPC_SERVER_INTERFACE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcNsInterfaceExported(entry_name_syntax, entry_name, rpc_interface_information)
    {% end %}
  end

  def iRpcNsInterfaceUnexported(entry_name_syntax : UInt32, entry_name : UInt16*, rpc_interface_information : Win32cr::System::Rpc::RPC_SERVER_INTERFACE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcNsInterfaceUnexported(entry_name_syntax, entry_name, rpc_interface_information)
    {% end %}
  end

  def iRpcBindingToStaticStringBindingW(binding : Void*, string_binding : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingToStaticStringBindingW(binding, string_binding)
    {% end %}
  end

  def iRpcBindingInqSecurityContext(binding : Void*, security_context_handle : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingInqSecurityContext(binding, security_context_handle)
    {% end %}
  end

  def iRpcBindingInqSecurityContextKeyInfo(binding : Void*, key_info : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingInqSecurityContextKeyInfo(binding, key_info)
    {% end %}
  end

  def iRpcBindingInqWireIdForSnego(binding : Void*, wire_id : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingInqWireIdForSnego(binding, wire_id)
    {% end %}
  end

  def iRpcBindingInqMarshalledTargetInfo(binding : Void*, marshalled_target_info_size : UInt32*, marshalled_target_info : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingInqMarshalledTargetInfo(binding, marshalled_target_info_size, marshalled_target_info)
    {% end %}
  end

  def iRpcBindingInqLocalClientPID(binding : Void*, pid : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingInqLocalClientPID(binding, pid)
    {% end %}
  end

  def iRpcBindingHandleToAsyncHandle(binding : Void*, async_handle : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingHandleToAsyncHandle(binding, async_handle)
    {% end %}
  end

  def iRpcNsBindingSetEntryNameW(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcNsBindingSetEntryNameW(binding, entry_name_syntax, entry_name)
    {% end %}
  end

  def iRpcNsBindingSetEntryNameA(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcNsBindingSetEntryNameA(binding, entry_name_syntax, entry_name)
    {% end %}
  end

  def iRpcServerUseProtseqEp2A(network_address : UInt8*, protseq : UInt8*, max_calls : UInt32, endpoint : UInt8*, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerUseProtseqEp2A(network_address, protseq, max_calls, endpoint, security_descriptor, policy)
    {% end %}
  end

  def iRpcServerUseProtseqEp2W(network_address : UInt16*, protseq : UInt16*, max_calls : UInt32, endpoint : UInt16*, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerUseProtseqEp2W(network_address, protseq, max_calls, endpoint, security_descriptor, policy)
    {% end %}
  end

  def iRpcServerUseProtseq2W(network_address : UInt16*, protseq : UInt16*, max_calls : UInt32, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerUseProtseq2W(network_address, protseq, max_calls, security_descriptor, policy)
    {% end %}
  end

  def iRpcServerUseProtseq2A(network_address : UInt8*, protseq : UInt8*, max_calls : UInt32, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerUseProtseq2A(network_address, protseq, max_calls, security_descriptor, policy)
    {% end %}
  end

  def iRpcServerStartService(protseq : UInt16*, endpoint : UInt16*, if_spec : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerStartService(protseq, endpoint, if_spec)
    {% end %}
  end

  def iRpcBindingInqDynamicEndpointW(binding : Void*, dynamic_endpoint : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingInqDynamicEndpointW(binding, dynamic_endpoint)
    {% end %}
  end

  def iRpcBindingInqDynamicEndpointA(binding : Void*, dynamic_endpoint : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingInqDynamicEndpointA(binding, dynamic_endpoint)
    {% end %}
  end

  def iRpcServerCheckClientRestriction(context : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerCheckClientRestriction(context)
    {% end %}
  end

  def iRpcBindingInqTransportType(binding : Void*, type__ : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingInqTransportType(binding, type__)
    {% end %}
  end

  def iRpcIfInqTransferSyntaxes(rpc_if_handle : Void*, transfer_syntaxes : Win32cr::System::Rpc::RPC_TRANSFER_SYNTAX*, transfer_syntax_size : UInt32, transfer_syntax_count : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcIfInqTransferSyntaxes(rpc_if_handle, transfer_syntaxes, transfer_syntax_size, transfer_syntax_count)
    {% end %}
  end

  def iUuidCreate(uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_UuidCreate(uuid)
    {% end %}
  end

  def iRpcBindingCopy(source_binding : Void*, destination_binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingCopy(source_binding, destination_binding)
    {% end %}
  end

  def iRpcBindingIsClientLocal(binding_handle : Void*, client_local_flag : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingIsClientLocal(binding_handle, client_local_flag)
    {% end %}
  end

  def iRpcBindingCreateNP(server_name : UInt16*, service_name : UInt16*, network_options : UInt16*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingCreateNP(server_name, service_name, network_options, binding)
    {% end %}
  end

  def iRpcSsDontSerializeContext : Void
    {% if !flag?(:docs) %}
    C.I_RpcSsDontSerializeContext
    {% end %}
  end

  def iRpcServerRegisterForwardFunction(pForwardFunction : Win32cr::System::Rpc::RPC_FORWARD_FUNCTION*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerRegisterForwardFunction(pForwardFunction)
    {% end %}
  end

  def iRpcServerInqAddressChangeFn : Win32cr::System::Rpc::RPC_ADDRESS_CHANGE_FN*
    {% if !flag?(:docs) %}
    C.I_RpcServerInqAddressChangeFn
    {% end %}
  end

  def iRpcServerSetAddressChangeFn(pAddressChangeFn : Win32cr::System::Rpc::RPC_ADDRESS_CHANGE_FN*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerSetAddressChangeFn(pAddressChangeFn)
    {% end %}
  end

  def iRpcServerInqLocalConnAddress(binding : Void*, buffer : Void*, buffer_size : UInt32*, address_format : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerInqLocalConnAddress(binding, buffer, buffer_size, address_format)
    {% end %}
  end

  def iRpcServerInqRemoteConnAddress(binding : Void*, buffer : Void*, buffer_size : UInt32*, address_format : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerInqRemoteConnAddress(binding, buffer, buffer_size, address_format)
    {% end %}
  end

  def iRpcSessionStrictContextHandle : Void
    {% if !flag?(:docs) %}
    C.I_RpcSessionStrictContextHandle
    {% end %}
  end

  def iRpcTurnOnEEInfoPropagation : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcTurnOnEEInfoPropagation
    {% end %}
  end

  def iRpcServerInqTransportType(type__ : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerInqTransportType(type__)
    {% end %}
  end

  def iRpcMapWin32Status(status : Win32cr::System::Rpc::RPC_STATUS) : Int32
    {% if !flag?(:docs) %}
    C.I_RpcMapWin32Status(status)
    {% end %}
  end

  def iRpcRecordCalloutFailure(rpc_status : Win32cr::System::Rpc::RPC_STATUS, call_out_state : Win32cr::System::Rpc::RDR_CALLOUT_STATE*, dll_name : UInt16*) : Void
    {% if !flag?(:docs) %}
    C.I_RpcRecordCalloutFailure(rpc_status, call_out_state, dll_name)
    {% end %}
  end

  def iRpcMgmtEnableDedicatedThreadPool : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcMgmtEnableDedicatedThreadPool
    {% end %}
  end

  def iRpcGetDefaultSD(ppSecurityDescriptor : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcGetDefaultSD(ppSecurityDescriptor)
    {% end %}
  end

  def iRpcOpenClientProcess(binding : Void*, desired_access : UInt32, client_process : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcOpenClientProcess(binding, desired_access, client_process)
    {% end %}
  end

  def iRpcBindingIsServerLocal(binding : Void*, server_local_flag : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingIsServerLocal(binding, server_local_flag)
    {% end %}
  end

  def iRpcBindingSetPrivateOption(hBinding : Void*, option : UInt32, optionValue : LibC::UIntPtrT) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingSetPrivateOption(hBinding, option, optionValue)
    {% end %}
  end

  def iRpcServerSubscribeForDisconnectNotification(binding : Void*, hEvent : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerSubscribeForDisconnectNotification(binding, hEvent)
    {% end %}
  end

  def iRpcServerGetAssociationID(binding : Void*, association_id : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerGetAssociationID(binding, association_id)
    {% end %}
  end

  def iRpcServerDisableExceptionFilter : Int32
    {% if !flag?(:docs) %}
    C.I_RpcServerDisableExceptionFilter
    {% end %}
  end

  def iRpcServerSubscribeForDisconnectNotification2(binding : Void*, hEvent : Void*, subscription_id : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerSubscribeForDisconnectNotification2(binding, hEvent, subscription_id)
    {% end %}
  end

  def iRpcServerUnsubscribeForDisconnectNotification(binding : Void*, subscription_id : LibC::GUID) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcServerUnsubscribeForDisconnectNotification(binding, subscription_id)
    {% end %}
  end

  def rpcNsBindingExportA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingExportA(entry_name_syntax, entry_name, if_spec, binding_vec, object_uuid_vec)
    {% end %}
  end

  def rpcNsBindingUnexportA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingUnexportA(entry_name_syntax, entry_name, if_spec, object_uuid_vec)
    {% end %}
  end

  def rpcNsBindingExportW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingExportW(entry_name_syntax, entry_name, if_spec, binding_vec, object_uuid_vec)
    {% end %}
  end

  def rpcNsBindingUnexportW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingUnexportW(entry_name_syntax, entry_name, if_spec, object_uuid_vec)
    {% end %}
  end

  def rpcNsBindingExportPnPA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingExportPnPA(entry_name_syntax, entry_name, if_spec, object_vector)
    {% end %}
  end

  def rpcNsBindingUnexportPnPA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingUnexportPnPA(entry_name_syntax, entry_name, if_spec, object_vector)
    {% end %}
  end

  def rpcNsBindingExportPnPW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingExportPnPW(entry_name_syntax, entry_name, if_spec, object_vector)
    {% end %}
  end

  def rpcNsBindingUnexportPnPW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingUnexportPnPW(entry_name_syntax, entry_name, if_spec, object_vector)
    {% end %}
  end

  def rpcNsBindingLookupBeginA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, obj_uuid : LibC::GUID*, binding_max_count : UInt32, lookup_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingLookupBeginA(entry_name_syntax, entry_name, if_spec, obj_uuid, binding_max_count, lookup_context)
    {% end %}
  end

  def rpcNsBindingLookupBeginW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, obj_uuid : LibC::GUID*, binding_max_count : UInt32, lookup_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingLookupBeginW(entry_name_syntax, entry_name, if_spec, obj_uuid, binding_max_count, lookup_context)
    {% end %}
  end

  def rpcNsBindingLookupNext(lookup_context : Void*, binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingLookupNext(lookup_context, binding_vec)
    {% end %}
  end

  def rpcNsBindingLookupDone(lookup_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingLookupDone(lookup_context)
    {% end %}
  end

  def rpcNsGroupDeleteA(group_name_syntax : Win32cr::System::Rpc::GROUP_NAME_SYNTAX, group_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupDeleteA(group_name_syntax, group_name)
    {% end %}
  end

  def rpcNsGroupMbrAddA(group_name_syntax : UInt32, group_name : UInt8*, member_name_syntax : UInt32, member_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupMbrAddA(group_name_syntax, group_name, member_name_syntax, member_name)
    {% end %}
  end

  def rpcNsGroupMbrRemoveA(group_name_syntax : UInt32, group_name : UInt8*, member_name_syntax : UInt32, member_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupMbrRemoveA(group_name_syntax, group_name, member_name_syntax, member_name)
    {% end %}
  end

  def rpcNsGroupMbrInqBeginA(group_name_syntax : UInt32, group_name : UInt8*, member_name_syntax : UInt32, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupMbrInqBeginA(group_name_syntax, group_name, member_name_syntax, inquiry_context)
    {% end %}
  end

  def rpcNsGroupMbrInqNextA(inquiry_context : Void*, member_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupMbrInqNextA(inquiry_context, member_name)
    {% end %}
  end

  def rpcNsGroupDeleteW(group_name_syntax : Win32cr::System::Rpc::GROUP_NAME_SYNTAX, group_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupDeleteW(group_name_syntax, group_name)
    {% end %}
  end

  def rpcNsGroupMbrAddW(group_name_syntax : UInt32, group_name : UInt16*, member_name_syntax : UInt32, member_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupMbrAddW(group_name_syntax, group_name, member_name_syntax, member_name)
    {% end %}
  end

  def rpcNsGroupMbrRemoveW(group_name_syntax : UInt32, group_name : UInt16*, member_name_syntax : UInt32, member_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupMbrRemoveW(group_name_syntax, group_name, member_name_syntax, member_name)
    {% end %}
  end

  def rpcNsGroupMbrInqBeginW(group_name_syntax : UInt32, group_name : UInt16*, member_name_syntax : UInt32, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupMbrInqBeginW(group_name_syntax, group_name, member_name_syntax, inquiry_context)
    {% end %}
  end

  def rpcNsGroupMbrInqNextW(inquiry_context : Void*, member_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupMbrInqNextW(inquiry_context, member_name)
    {% end %}
  end

  def rpcNsGroupMbrInqDone(inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsGroupMbrInqDone(inquiry_context)
    {% end %}
  end

  def rpcNsProfileDeleteA(profile_name_syntax : UInt32, profile_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileDeleteA(profile_name_syntax, profile_name)
    {% end %}
  end

  def rpcNsProfileEltAddA(profile_name_syntax : UInt32, profile_name : UInt8*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt8*, priority : UInt32, annotation__ : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileEltAddA(profile_name_syntax, profile_name, if_id, member_name_syntax, member_name, priority, annotation__)
    {% end %}
  end

  def rpcNsProfileEltRemoveA(profile_name_syntax : UInt32, profile_name : UInt8*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileEltRemoveA(profile_name_syntax, profile_name, if_id, member_name_syntax, member_name)
    {% end %}
  end

  def rpcNsProfileEltInqBeginA(profile_name_syntax : UInt32, profile_name : UInt8*, inquiry_type : UInt32, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, member_name_syntax : UInt32, member_name : UInt8*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileEltInqBeginA(profile_name_syntax, profile_name, inquiry_type, if_id, vers_option, member_name_syntax, member_name, inquiry_context)
    {% end %}
  end

  def rpcNsProfileEltInqNextA(inquiry_context : Void*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name : UInt8**, priority : UInt32*, annotation__ : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileEltInqNextA(inquiry_context, if_id, member_name, priority, annotation__)
    {% end %}
  end

  def rpcNsProfileDeleteW(profile_name_syntax : UInt32, profile_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileDeleteW(profile_name_syntax, profile_name)
    {% end %}
  end

  def rpcNsProfileEltAddW(profile_name_syntax : UInt32, profile_name : UInt16*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt16*, priority : UInt32, annotation__ : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileEltAddW(profile_name_syntax, profile_name, if_id, member_name_syntax, member_name, priority, annotation__)
    {% end %}
  end

  def rpcNsProfileEltRemoveW(profile_name_syntax : UInt32, profile_name : UInt16*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileEltRemoveW(profile_name_syntax, profile_name, if_id, member_name_syntax, member_name)
    {% end %}
  end

  def rpcNsProfileEltInqBeginW(profile_name_syntax : UInt32, profile_name : UInt16*, inquiry_type : UInt32, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, member_name_syntax : UInt32, member_name : UInt16*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileEltInqBeginW(profile_name_syntax, profile_name, inquiry_type, if_id, vers_option, member_name_syntax, member_name, inquiry_context)
    {% end %}
  end

  def rpcNsProfileEltInqNextW(inquiry_context : Void*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name : UInt16**, priority : UInt32*, annotation__ : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileEltInqNextW(inquiry_context, if_id, member_name, priority, annotation__)
    {% end %}
  end

  def rpcNsProfileEltInqDone(inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsProfileEltInqDone(inquiry_context)
    {% end %}
  end

  def rpcNsEntryObjectInqBeginA(entry_name_syntax : UInt32, entry_name : UInt8*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsEntryObjectInqBeginA(entry_name_syntax, entry_name, inquiry_context)
    {% end %}
  end

  def rpcNsEntryObjectInqBeginW(entry_name_syntax : UInt32, entry_name : UInt16*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsEntryObjectInqBeginW(entry_name_syntax, entry_name, inquiry_context)
    {% end %}
  end

  def rpcNsEntryObjectInqNext(inquiry_context : Void*, obj_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsEntryObjectInqNext(inquiry_context, obj_uuid)
    {% end %}
  end

  def rpcNsEntryObjectInqDone(inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsEntryObjectInqDone(inquiry_context)
    {% end %}
  end

  def rpcNsEntryExpandNameA(entry_name_syntax : UInt32, entry_name : UInt8*, expanded_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsEntryExpandNameA(entry_name_syntax, entry_name, expanded_name)
    {% end %}
  end

  def rpcNsMgmtBindingUnexportA(entry_name_syntax : UInt32, entry_name : UInt8*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtBindingUnexportA(entry_name_syntax, entry_name, if_id, vers_option, object_uuid_vec)
    {% end %}
  end

  def rpcNsMgmtEntryCreateA(entry_name_syntax : UInt32, entry_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtEntryCreateA(entry_name_syntax, entry_name)
    {% end %}
  end

  def rpcNsMgmtEntryDeleteA(entry_name_syntax : UInt32, entry_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtEntryDeleteA(entry_name_syntax, entry_name)
    {% end %}
  end

  def rpcNsMgmtEntryInqIfIdsA(entry_name_syntax : UInt32, entry_name : UInt8*, if_id_vec : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtEntryInqIfIdsA(entry_name_syntax, entry_name, if_id_vec)
    {% end %}
  end

  def rpcNsMgmtHandleSetExpAge(ns_handle : Void*, expiration_age : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtHandleSetExpAge(ns_handle, expiration_age)
    {% end %}
  end

  def rpcNsMgmtInqExpAge(expiration_age : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtInqExpAge(expiration_age)
    {% end %}
  end

  def rpcNsMgmtSetExpAge(expiration_age : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtSetExpAge(expiration_age)
    {% end %}
  end

  def rpcNsEntryExpandNameW(entry_name_syntax : UInt32, entry_name : UInt16*, expanded_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsEntryExpandNameW(entry_name_syntax, entry_name, expanded_name)
    {% end %}
  end

  def rpcNsMgmtBindingUnexportW(entry_name_syntax : UInt32, entry_name : UInt16*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtBindingUnexportW(entry_name_syntax, entry_name, if_id, vers_option, object_uuid_vec)
    {% end %}
  end

  def rpcNsMgmtEntryCreateW(entry_name_syntax : UInt32, entry_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtEntryCreateW(entry_name_syntax, entry_name)
    {% end %}
  end

  def rpcNsMgmtEntryDeleteW(entry_name_syntax : UInt32, entry_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtEntryDeleteW(entry_name_syntax, entry_name)
    {% end %}
  end

  def rpcNsMgmtEntryInqIfIdsW(entry_name_syntax : UInt32, entry_name : UInt16*, if_id_vec : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsMgmtEntryInqIfIdsW(entry_name_syntax, entry_name, if_id_vec)
    {% end %}
  end

  def rpcNsBindingImportBeginA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, obj_uuid : LibC::GUID*, import_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingImportBeginA(entry_name_syntax, entry_name, if_spec, obj_uuid, import_context)
    {% end %}
  end

  def rpcNsBindingImportBeginW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, obj_uuid : LibC::GUID*, import_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingImportBeginW(entry_name_syntax, entry_name, if_spec, obj_uuid, import_context)
    {% end %}
  end

  def rpcNsBindingImportNext(import_context : Void*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingImportNext(import_context, binding)
    {% end %}
  end

  def rpcNsBindingImportDone(import_context : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingImportDone(import_context)
    {% end %}
  end

  def rpcNsBindingSelect(binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcNsBindingSelect(binding_vec, binding)
    {% end %}
  end

  def rpcAsyncRegisterInfo(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcAsyncRegisterInfo(pAsync)
    {% end %}
  end

  def rpcAsyncInitializeHandle(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, size : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcAsyncInitializeHandle(pAsync, size)
    {% end %}
  end

  def rpcAsyncGetCallStatus(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcAsyncGetCallStatus(pAsync)
    {% end %}
  end

  def rpcAsyncCompleteCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, reply : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcAsyncCompleteCall(pAsync, reply)
    {% end %}
  end

  def rpcAsyncAbortCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, exception_code : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcAsyncAbortCall(pAsync, exception_code)
    {% end %}
  end

  def rpcAsyncCancelCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, fAbort : Win32cr::Foundation::BOOL) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcAsyncCancelCall(pAsync, fAbort)
    {% end %}
  end

  def rpcErrorStartEnumeration(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcErrorStartEnumeration(enum_handle)
    {% end %}
  end

  def rpcErrorGetNextRecord(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*, copy_strings : Win32cr::Foundation::BOOL, error_info : Win32cr::System::Rpc::RPC_EXTENDED_ERROR_INFO*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcErrorGetNextRecord(enum_handle, copy_strings, error_info)
    {% end %}
  end

  def rpcErrorEndEnumeration(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcErrorEndEnumeration(enum_handle)
    {% end %}
  end

  def rpcErrorResetEnumeration(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcErrorResetEnumeration(enum_handle)
    {% end %}
  end

  def rpcErrorGetNumberOfRecords(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*, records : Int32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcErrorGetNumberOfRecords(enum_handle, records)
    {% end %}
  end

  def rpcErrorSaveErrorInfo(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*, error_blob : Void**, blob_size : LibC::UIntPtrT*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcErrorSaveErrorInfo(enum_handle, error_blob, blob_size)
    {% end %}
  end

  def rpcErrorLoadErrorInfo(error_blob : Void*, blob_size : LibC::UIntPtrT, enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcErrorLoadErrorInfo(error_blob, blob_size, enum_handle)
    {% end %}
  end

  def rpcErrorAddRecord(error_info : Win32cr::System::Rpc::RPC_EXTENDED_ERROR_INFO*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcErrorAddRecord(error_info)
    {% end %}
  end

  def rpcErrorClearInformation : Void
    {% if !flag?(:docs) %}
    C.RpcErrorClearInformation
    {% end %}
  end

  def rpcGetAuthorizationContextForClient(client_binding : Void*, impersonate_on_return : Win32cr::Foundation::BOOL, reserved1 : Void*, pExpirationTime : Win32cr::Foundation::LARGE_INTEGER*, reserved2 : Win32cr::Foundation::LUID, reserved3 : UInt32, reserved4 : Void*, pAuthzClientContext : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcGetAuthorizationContextForClient(client_binding, impersonate_on_return, reserved1, pExpirationTime, reserved2, reserved3, reserved4, pAuthzClientContext)
    {% end %}
  end

  def rpcFreeAuthorizationContext(pAuthzClientContext : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcFreeAuthorizationContext(pAuthzClientContext)
    {% end %}
  end

  def rpcSsContextLockExclusive(server_binding_handle : Void*, user_context : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSsContextLockExclusive(server_binding_handle, user_context)
    {% end %}
  end

  def rpcSsContextLockShared(server_binding_handle : Void*, user_context : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSsContextLockShared(server_binding_handle, user_context)
    {% end %}
  end

  def rpcServerInqCallAttributesW(client_binding : Void*, rpc_call_attributes : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInqCallAttributesW(client_binding, rpc_call_attributes)
    {% end %}
  end

  def rpcServerInqCallAttributesA(client_binding : Void*, rpc_call_attributes : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerInqCallAttributesA(client_binding, rpc_call_attributes)
    {% end %}
  end

  def rpcServerSubscribeForNotification(binding : Void*, notification : Win32cr::System::Rpc::RPC_NOTIFICATIONS, notification_type : Win32cr::System::Rpc::RPC_NOTIFICATION_TYPES, notification_info : Win32cr::System::Rpc::RPC_ASYNC_NOTIFICATION_INFO*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerSubscribeForNotification(binding, notification, notification_type, notification_info)
    {% end %}
  end

  def rpcServerUnsubscribeForNotification(binding : Void*, notification : Win32cr::System::Rpc::RPC_NOTIFICATIONS, notifications_queued : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcServerUnsubscribeForNotification(binding, notification, notifications_queued)
    {% end %}
  end

  def rpcBindingBind(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, binding : Void*, if_spec : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingBind(pAsync, binding, if_spec)
    {% end %}
  end

  def rpcBindingUnbind(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcBindingUnbind(binding)
    {% end %}
  end

  def iRpcAsyncSetHandle(message : Win32cr::System::Rpc::RPC_MESSAGE*, pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcAsyncSetHandle(message, pAsync)
    {% end %}
  end

  def iRpcAsyncAbortCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, exception_code : UInt32) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcAsyncAbortCall(pAsync, exception_code)
    {% end %}
  end

  def iRpcExceptionFilter(exception_code : UInt32) : Int32
    {% if !flag?(:docs) %}
    C.I_RpcExceptionFilter(exception_code)
    {% end %}
  end

  def iRpcBindingInqClientTokenAttributes(binding : Void*, token_id : Win32cr::Foundation::LUID*, authentication_id : Win32cr::Foundation::LUID*, modified_id : Win32cr::Foundation::LUID*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcBindingInqClientTokenAttributes(binding, token_id, authentication_id, modified_id)
    {% end %}
  end

  def iRpcNsGetBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcNsGetBuffer(message)
    {% end %}
  end

  def iRpcNsSendReceive(message : Win32cr::System::Rpc::RPC_MESSAGE*, handle : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcNsSendReceive(message, handle)
    {% end %}
  end

  def iRpcNsRaiseException(message : Win32cr::System::Rpc::RPC_MESSAGE*, status : Win32cr::System::Rpc::RPC_STATUS) : Void
    {% if !flag?(:docs) %}
    C.I_RpcNsRaiseException(message, status)
    {% end %}
  end

  def iRpcReBindBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.I_RpcReBindBuffer(message)
    {% end %}
  end

  def nDRCContextBinding(c_context : LibC::IntPtrT) : Void*
    {% if !flag?(:docs) %}
    C.NDRCContextBinding(c_context)
    {% end %}
  end

  def nDRCContextMarshall(c_context : LibC::IntPtrT, pBuff : Void*) : Void
    {% if !flag?(:docs) %}
    C.NDRCContextMarshall(c_context, pBuff)
    {% end %}
  end

  def nDRCContextUnmarshall(pCContext : LibC::IntPtrT*, hBinding : Void*, pBuff : Void*, data_representation : UInt32) : Void
    {% if !flag?(:docs) %}
    C.NDRCContextUnmarshall(pCContext, hBinding, pBuff, data_representation)
    {% end %}
  end

  def nDRSContextMarshall(c_context : Win32cr::System::Rpc::NDR_SCONTEXT_1*, pBuff : Void*, userRunDownIn : Win32cr::System::Rpc::NDR_RUNDOWN) : Void
    {% if !flag?(:docs) %}
    C.NDRSContextMarshall(c_context, pBuff, userRunDownIn)
    {% end %}
  end

  def nDRSContextUnmarshall(pBuff : Void*, data_representation : UInt32) : Win32cr::System::Rpc::NDR_SCONTEXT_1*
    {% if !flag?(:docs) %}
    C.NDRSContextUnmarshall(pBuff, data_representation)
    {% end %}
  end

  def nDRSContextMarshallEx(binding_handle : Void*, c_context : Win32cr::System::Rpc::NDR_SCONTEXT_1*, pBuff : Void*, userRunDownIn : Win32cr::System::Rpc::NDR_RUNDOWN) : Void
    {% if !flag?(:docs) %}
    C.NDRSContextMarshallEx(binding_handle, c_context, pBuff, userRunDownIn)
    {% end %}
  end

  def nDRSContextMarshall2(binding_handle : Void*, c_context : Win32cr::System::Rpc::NDR_SCONTEXT_1*, pBuff : Void*, userRunDownIn : Win32cr::System::Rpc::NDR_RUNDOWN, ctx_guard : Void*, flags : UInt32) : Void
    {% if !flag?(:docs) %}
    C.NDRSContextMarshall2(binding_handle, c_context, pBuff, userRunDownIn, ctx_guard, flags)
    {% end %}
  end

  def nDRSContextUnmarshallEx(binding_handle : Void*, pBuff : Void*, data_representation : UInt32) : Win32cr::System::Rpc::NDR_SCONTEXT_1*
    {% if !flag?(:docs) %}
    C.NDRSContextUnmarshallEx(binding_handle, pBuff, data_representation)
    {% end %}
  end

  def nDRSContextUnmarshall2(binding_handle : Void*, pBuff : Void*, data_representation : UInt32, ctx_guard : Void*, flags : UInt32) : Win32cr::System::Rpc::NDR_SCONTEXT_1*
    {% if !flag?(:docs) %}
    C.NDRSContextUnmarshall2(binding_handle, pBuff, data_representation, ctx_guard, flags)
    {% end %}
  end

  def rpcSsDestroyClientContext(context_handle : Void**) : Void
    {% if !flag?(:docs) %}
    C.RpcSsDestroyClientContext(context_handle)
    {% end %}
  end

  def ndrSimpleTypeMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, format_char : UInt8) : Void
    {% if !flag?(:docs) %}
    C.NdrSimpleTypeMarshall(pStubMsg, pMemory, format_char)
    {% end %}
  end

  def ndrPointerMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrPointerMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrSimpleStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrSimpleStructMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantStructMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantVaryingStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingStructMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrComplexStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrComplexStructMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrFixedArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrFixedArrayMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantArrayMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantVaryingArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingArrayMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrVaryingArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrVaryingArrayMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrComplexArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrComplexArrayMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrNonConformantStringMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrNonConformantStringMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantStringMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantStringMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrEncapsulatedUnionMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrEncapsulatedUnionMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrNonEncapsulatedUnionMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrNonEncapsulatedUnionMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrByteCountPointerMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrByteCountPointerMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrXmitOrRepAsMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrXmitOrRepAsMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrUserMarshalMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrUserMarshalMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrInterfacePointerMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrInterfacePointerMarshall(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrClientContextMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, context_handle : LibC::IntPtrT, fCheck : Int32) : Void
    {% if !flag?(:docs) %}
    C.NdrClientContextMarshall(pStubMsg, context_handle, fCheck)
    {% end %}
  end

  def ndrServerContextMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, context_handle : Win32cr::System::Rpc::NDR_SCONTEXT_1*, rundown_routine : Win32cr::System::Rpc::NDR_RUNDOWN) : Void
    {% if !flag?(:docs) %}
    C.NdrServerContextMarshall(pStubMsg, context_handle, rundown_routine)
    {% end %}
  end

  def ndrServerContextNewMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, context_handle : Win32cr::System::Rpc::NDR_SCONTEXT_1*, rundown_routine : Win32cr::System::Rpc::NDR_RUNDOWN, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrServerContextNewMarshall(pStubMsg, context_handle, rundown_routine, pFormat)
    {% end %}
  end

  def ndrSimpleTypeUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, format_char : UInt8) : Void
    {% if !flag?(:docs) %}
    C.NdrSimpleTypeUnmarshall(pStubMsg, pMemory, format_char)
    {% end %}
  end

  def ndrRangeUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrRangeUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrCorrelationInitialize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : Void*, cache_size : UInt32, flags : UInt32) : Void
    {% if !flag?(:docs) %}
    C.NdrCorrelationInitialize(pStubMsg, pMemory, cache_size, flags)
    {% end %}
  end

  def ndrCorrelationPass(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrCorrelationPass(pStubMsg)
    {% end %}
  end

  def ndrCorrelationFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrCorrelationFree(pStubMsg)
    {% end %}
  end

  def ndrPointerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrPointerUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrSimpleStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrSimpleStructUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrConformantStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantStructUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrConformantVaryingStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingStructUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrComplexStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrComplexStructUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrFixedArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrFixedArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrConformantArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrConformantVaryingArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrVaryingArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrVaryingArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrComplexArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrComplexArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrNonConformantStringUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrNonConformantStringUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrConformantStringUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrConformantStringUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrEncapsulatedUnionUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrEncapsulatedUnionUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrNonEncapsulatedUnionUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrNonEncapsulatedUnionUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrByteCountPointerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrByteCountPointerUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrXmitOrRepAsUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrXmitOrRepAsUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrUserMarshalUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrUserMarshalUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrInterfacePointerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrInterfacePointerUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc)
    {% end %}
  end

  def ndrClientContextUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pContextHandle : LibC::IntPtrT*, bind_handle : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrClientContextUnmarshall(pStubMsg, pContextHandle, bind_handle)
    {% end %}
  end

  def ndrServerContextUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Win32cr::System::Rpc::NDR_SCONTEXT_1*
    {% if !flag?(:docs) %}
    C.NdrServerContextUnmarshall(pStubMsg)
    {% end %}
  end

  def ndrContextHandleInitialize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : Win32cr::System::Rpc::NDR_SCONTEXT_1*
    {% if !flag?(:docs) %}
    C.NdrContextHandleInitialize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrServerContextNewUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : Win32cr::System::Rpc::NDR_SCONTEXT_1*
    {% if !flag?(:docs) %}
    C.NdrServerContextNewUnmarshall(pStubMsg, pFormat)
    {% end %}
  end

  def ndrPointerBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrPointerBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrSimpleStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrSimpleStructBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConformantStructBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantVaryingStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingStructBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrComplexStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrComplexStructBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrFixedArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrFixedArrayBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConformantArrayBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantVaryingArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingArrayBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrVaryingArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrVaryingArrayBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrComplexArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrComplexArrayBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantStringBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConformantStringBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrNonConformantStringBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrNonConformantStringBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrEncapsulatedUnionBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrEncapsulatedUnionBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrNonEncapsulatedUnionBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrNonEncapsulatedUnionBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrByteCountPointerBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrByteCountPointerBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrXmitOrRepAsBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrXmitOrRepAsBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrUserMarshalBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrUserMarshalBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrInterfacePointerBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrInterfacePointerBufferSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrContextHandleSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrContextHandleSize(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrPointerMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrPointerMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrSimpleStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrSimpleStructMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrConformantStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrConformantStructMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrConformantVaryingStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingStructMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrComplexStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrComplexStructMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrFixedArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrFixedArrayMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrConformantArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrConformantArrayMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrConformantVaryingArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingArrayMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrVaryingArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrVaryingArrayMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrComplexArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrComplexArrayMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrConformantStringMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrConformantStringMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrNonConformantStringMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrNonConformantStringMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrEncapsulatedUnionMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrEncapsulatedUnionMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrNonEncapsulatedUnionMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrNonEncapsulatedUnionMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrXmitOrRepAsMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrXmitOrRepAsMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrUserMarshalMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrUserMarshalMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrInterfacePointerMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.NdrInterfacePointerMemorySize(pStubMsg, pFormat)
    {% end %}
  end

  def ndrPointerFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrPointerFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrSimpleStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrSimpleStructFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConformantStructFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantVaryingStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingStructFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrComplexStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrComplexStructFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrFixedArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrFixedArrayFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConformantArrayFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConformantVaryingArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConformantVaryingArrayFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrVaryingArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrVaryingArrayFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrComplexArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrComplexArrayFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrEncapsulatedUnionFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrEncapsulatedUnionFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrNonEncapsulatedUnionFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrNonEncapsulatedUnionFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrByteCountPointerFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrByteCountPointerFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrXmitOrRepAsFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrXmitOrRepAsFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrUserMarshalFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrUserMarshalFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrInterfacePointerFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrInterfacePointerFree(pStubMsg, pMemory, pFormat)
    {% end %}
  end

  def ndrConvert2(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*, number_params : Int32) : Void
    {% if !flag?(:docs) %}
    C.NdrConvert2(pStubMsg, pFormat, number_params)
    {% end %}
  end

  def ndrConvert(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrConvert(pStubMsg, pFormat)
    {% end %}
  end

  def ndrUserMarshalSimpleTypeConvert(pFlags : UInt32*, pBuffer : UInt8*, format_char : UInt8) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrUserMarshalSimpleTypeConvert(pFlags, pBuffer, format_char)
    {% end %}
  end

  def ndrClientInitializeNew(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, proc_num : UInt32) : Void
    {% if !flag?(:docs) %}
    C.NdrClientInitializeNew(pRpcMsg, pStubMsg, pStubDescriptor, proc_num)
    {% end %}
  end

  def ndrServerInitializeNew(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrServerInitializeNew(pRpcMsg, pStubMsg, pStubDescriptor)
    {% end %}
  end

  def ndrServerInitializePartial(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, requested_buffer_size : UInt32) : Void
    {% if !flag?(:docs) %}
    C.NdrServerInitializePartial(pRpcMsg, pStubMsg, pStubDescriptor, requested_buffer_size)
    {% end %}
  end

  def ndrClientInitialize(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, proc_num : UInt32) : Void
    {% if !flag?(:docs) %}
    C.NdrClientInitialize(pRpcMsg, pStubMsg, pStubDescriptor, proc_num)
    {% end %}
  end

  def ndrServerInitialize(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrServerInitialize(pRpcMsg, pStubMsg, pStubDescriptor)
    {% end %}
  end

  def ndrServerInitializeUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrServerInitializeUnmarshall(pStubMsg, pStubDescriptor, pRpcMsg)
    {% end %}
  end

  def ndrServerInitializeMarshall(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrServerInitializeMarshall(pRpcMsg, pStubMsg)
    {% end %}
  end

  def ndrGetBuffer(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, buffer_length : UInt32, handle : Void*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrGetBuffer(pStubMsg, buffer_length, handle)
    {% end %}
  end

  def ndrNsGetBuffer(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, buffer_length : UInt32, handle : Void*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrNsGetBuffer(pStubMsg, buffer_length, handle)
    {% end %}
  end

  def ndrSendReceive(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pBufferEnd : UInt8*) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrSendReceive(pStubMsg, pBufferEnd)
    {% end %}
  end

  def ndrNsSendReceive(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pBufferEnd : UInt8*, pAutoHandle : Void**) : UInt8*
    {% if !flag?(:docs) %}
    C.NdrNsSendReceive(pStubMsg, pBufferEnd, pAutoHandle)
    {% end %}
  end

  def ndrFreeBuffer(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrFreeBuffer(pStubMsg)
    {% end %}
  end

  def ndrGetDcomProtocolVersion(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pVersion : Win32cr::System::Rpc::RPC_VERSION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.NdrGetDcomProtocolVersion(pStubMsg, pVersion)
    {% end %}
  end

  def ndrClientCall2(pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormat : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN
    {% if !flag?(:docs) %}
    C.NdrClientCall2(pStubDescriptor, pFormat)
    {% end %}
  end

  def ndrAsyncClientCall(pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormat : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN
    {% if !flag?(:docs) %}
    C.NdrAsyncClientCall(pStubDescriptor, pFormat)
    {% end %}
  end

  def ndrDcomAsyncClientCall(pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormat : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN
    {% if !flag?(:docs) %}
    C.NdrDcomAsyncClientCall(pStubDescriptor, pFormat)
    {% end %}
  end

  def ndrAsyncServerCall(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrAsyncServerCall(pRpcMsg)
    {% end %}
  end

  def ndrDcomAsyncStubCall(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32
    {% if !flag?(:docs) %}
    C.NdrDcomAsyncStubCall(pThis, pChannel, pRpcMsg, pdwStubPhase)
    {% end %}
  end

  def ndrStubCall2(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32
    {% if !flag?(:docs) %}
    C.NdrStubCall2(pThis, pChannel, pRpcMsg, pdwStubPhase)
    {% end %}
  end

  def ndrServerCall2(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrServerCall2(pRpcMsg)
    {% end %}
  end

  def ndrMapCommAndFaultStatus(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pCommStatus : UInt32*, pFaultStatus : UInt32*, status : Win32cr::System::Rpc::RPC_STATUS) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.NdrMapCommAndFaultStatus(pStubMsg, pCommStatus, pFaultStatus, status)
    {% end %}
  end

  def rpcSsAllocate(size : LibC::UIntPtrT) : Void*
    {% if !flag?(:docs) %}
    C.RpcSsAllocate(size)
    {% end %}
  end

  def rpcSsDisableAllocate : Void
    {% if !flag?(:docs) %}
    C.RpcSsDisableAllocate
    {% end %}
  end

  def rpcSsEnableAllocate : Void
    {% if !flag?(:docs) %}
    C.RpcSsEnableAllocate
    {% end %}
  end

  def rpcSsFree(node_to_free : Void*) : Void
    {% if !flag?(:docs) %}
    C.RpcSsFree(node_to_free)
    {% end %}
  end

  def rpcSsGetThreadHandle : Void*
    {% if !flag?(:docs) %}
    C.RpcSsGetThreadHandle
    {% end %}
  end

  def rpcSsSetClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE) : Void
    {% if !flag?(:docs) %}
    C.RpcSsSetClientAllocFree(client_alloc, client_free)
    {% end %}
  end

  def rpcSsSetThreadHandle(id : Void*) : Void
    {% if !flag?(:docs) %}
    C.RpcSsSetThreadHandle(id)
    {% end %}
  end

  def rpcSsSwapClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE, old_client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC*, old_client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE*) : Void
    {% if !flag?(:docs) %}
    C.RpcSsSwapClientAllocFree(client_alloc, client_free, old_client_alloc, old_client_free)
    {% end %}
  end

  def rpcSmAllocate(size : LibC::UIntPtrT, pStatus : Win32cr::System::Rpc::RPC_STATUS*) : Void*
    {% if !flag?(:docs) %}
    C.RpcSmAllocate(size, pStatus)
    {% end %}
  end

  def rpcSmClientFree(pNodeToFree : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSmClientFree(pNodeToFree)
    {% end %}
  end

  def rpcSmDestroyClientContext(context_handle : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSmDestroyClientContext(context_handle)
    {% end %}
  end

  def rpcSmDisableAllocate : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSmDisableAllocate
    {% end %}
  end

  def rpcSmEnableAllocate : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSmEnableAllocate
    {% end %}
  end

  def rpcSmFree(node_to_free : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSmFree(node_to_free)
    {% end %}
  end

  def rpcSmGetThreadHandle(pStatus : Win32cr::System::Rpc::RPC_STATUS*) : Void*
    {% if !flag?(:docs) %}
    C.RpcSmGetThreadHandle(pStatus)
    {% end %}
  end

  def rpcSmSetClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSmSetClientAllocFree(client_alloc, client_free)
    {% end %}
  end

  def rpcSmSetThreadHandle(id : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSmSetThreadHandle(id)
    {% end %}
  end

  def rpcSmSwapClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE, old_client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC*, old_client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcSmSwapClientAllocFree(client_alloc, client_free, old_client_alloc, old_client_free)
    {% end %}
  end

  def ndrRpcSsEnableAllocate(pMessage : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrRpcSsEnableAllocate(pMessage)
    {% end %}
  end

  def ndrRpcSsDisableAllocate(pMessage : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrRpcSsDisableAllocate(pMessage)
    {% end %}
  end

  def ndrRpcSmSetClientToOsf(pMessage : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrRpcSmSetClientToOsf(pMessage)
    {% end %}
  end

  def ndrRpcSmClientAllocate(size : LibC::UIntPtrT) : Void*
    {% if !flag?(:docs) %}
    C.NdrRpcSmClientAllocate(size)
    {% end %}
  end

  def ndrRpcSmClientFree(node_to_free : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrRpcSmClientFree(node_to_free)
    {% end %}
  end

  def ndrRpcSsDefaultAllocate(size : LibC::UIntPtrT) : Void*
    {% if !flag?(:docs) %}
    C.NdrRpcSsDefaultAllocate(size)
    {% end %}
  end

  def ndrRpcSsDefaultFree(node_to_free : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrRpcSsDefaultFree(node_to_free)
    {% end %}
  end

  def ndrFullPointerXlatInit(number_of_pointers : UInt32, xlat_side : Win32cr::System::Rpc::XLAT_SIDE) : Win32cr::System::Rpc::FULL_PTR_XLAT_TABLES*
    {% if !flag?(:docs) %}
    C.NdrFullPointerXlatInit(number_of_pointers, xlat_side)
    {% end %}
  end

  def ndrFullPointerXlatFree(pXlatTables : Win32cr::System::Rpc::FULL_PTR_XLAT_TABLES*) : Void
    {% if !flag?(:docs) %}
    C.NdrFullPointerXlatFree(pXlatTables)
    {% end %}
  end

  def ndrAllocate(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, len : LibC::UIntPtrT) : Void*
    {% if !flag?(:docs) %}
    C.NdrAllocate(pStubMsg, len)
    {% end %}
  end

  def ndrClearOutParameters(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*, arg_addr : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrClearOutParameters(pStubMsg, pFormat, arg_addr)
    {% end %}
  end

  def ndrOleAllocate(size : LibC::UIntPtrT) : Void*
    {% if !flag?(:docs) %}
    C.NdrOleAllocate(size)
    {% end %}
  end

  def ndrOleFree(node_to_free : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrOleFree(node_to_free)
    {% end %}
  end

  def ndrGetUserMarshalInfo(pFlags : UInt32*, information_level : UInt32, pMarshalInfo : Win32cr::System::Rpc::NDR_USER_MARSHAL_INFO*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.NdrGetUserMarshalInfo(pFlags, information_level, pMarshalInfo)
    {% end %}
  end

  def ndrCreateServerInterfaceFromStub(pStub : Void*, pServerIf : Win32cr::System::Rpc::RPC_SERVER_INTERFACE*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.NdrCreateServerInterfaceFromStub(pStub, pServerIf)
    {% end %}
  end

  def ndrClientCall3(pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN
    {% if !flag?(:docs) %}
    C.NdrClientCall3(pProxyInfo, nProcNum, pReturnValue)
    {% end %}
  end

  def ndr64AsyncClientCall(pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN
    {% if !flag?(:docs) %}
    C.Ndr64AsyncClientCall(pProxyInfo, nProcNum, pReturnValue)
    {% end %}
  end

  def ndr64DcomAsyncClientCall(pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN
    {% if !flag?(:docs) %}
    C.Ndr64DcomAsyncClientCall(pProxyInfo, nProcNum, pReturnValue)
    {% end %}
  end

  def ndr64AsyncServerCall64(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.Ndr64AsyncServerCall64(pRpcMsg)
    {% end %}
  end

  def ndr64AsyncServerCallAll(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.Ndr64AsyncServerCallAll(pRpcMsg)
    {% end %}
  end

  def ndr64DcomAsyncStubCall(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32
    {% if !flag?(:docs) %}
    C.Ndr64DcomAsyncStubCall(pThis, pChannel, pRpcMsg, pdwStubPhase)
    {% end %}
  end

  def ndrStubCall3(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32
    {% if !flag?(:docs) %}
    C.NdrStubCall3(pThis, pChannel, pRpcMsg, pdwStubPhase)
    {% end %}
  end

  def ndrServerCallAll(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrServerCallAll(pRpcMsg)
    {% end %}
  end

  def ndrServerCallNdr64(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void
    {% if !flag?(:docs) %}
    C.NdrServerCallNdr64(pRpcMsg)
    {% end %}
  end

  def ndrPartialIgnoreClientMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrPartialIgnoreClientMarshall(pStubMsg, pMemory)
    {% end %}
  end

  def ndrPartialIgnoreServerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : Void**) : Void
    {% if !flag?(:docs) %}
    C.NdrPartialIgnoreServerUnmarshall(pStubMsg, ppMemory)
    {% end %}
  end

  def ndrPartialIgnoreClientBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrPartialIgnoreClientBufferSize(pStubMsg, pMemory)
    {% end %}
  end

  def ndrPartialIgnoreServerInitialize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : Void**, pFormat : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrPartialIgnoreServerInitialize(pStubMsg, ppMemory, pFormat)
    {% end %}
  end

  def rpcUserFree(async_handle : Void*, pBuffer : Void*) : Void
    {% if !flag?(:docs) %}
    C.RpcUserFree(async_handle, pBuffer)
    {% end %}
  end

  def mesEncodeIncrementalHandleCreate(user_state : Void*, alloc_fn : Win32cr::System::Rpc::MIDL_ES_ALLOC, write_fn : Win32cr::System::Rpc::MIDL_ES_WRITE, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.MesEncodeIncrementalHandleCreate(user_state, alloc_fn, write_fn, pHandle)
    {% end %}
  end

  def mesDecodeIncrementalHandleCreate(user_state : Void*, read_fn : Win32cr::System::Rpc::MIDL_ES_READ, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.MesDecodeIncrementalHandleCreate(user_state, read_fn, pHandle)
    {% end %}
  end

  def mesIncrementalHandleReset(handle : Void*, user_state : Void*, alloc_fn : Win32cr::System::Rpc::MIDL_ES_ALLOC, write_fn : Win32cr::System::Rpc::MIDL_ES_WRITE, read_fn : Win32cr::System::Rpc::MIDL_ES_READ, operation : Win32cr::System::Rpc::MIDL_ES_CODE) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.MesIncrementalHandleReset(handle, user_state, alloc_fn, write_fn, read_fn, operation)
    {% end %}
  end

  def mesEncodeFixedBufferHandleCreate(pBuffer : Win32cr::Foundation::PSTR, buffer_size : UInt32, pEncodedSize : UInt32*, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.MesEncodeFixedBufferHandleCreate(pBuffer, buffer_size, pEncodedSize, pHandle)
    {% end %}
  end

  def mesEncodeDynBufferHandleCreate(pBuffer : Int8**, pEncodedSize : UInt32*, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.MesEncodeDynBufferHandleCreate(pBuffer, pEncodedSize, pHandle)
    {% end %}
  end

  def mesDecodeBufferHandleCreate(buffer : Win32cr::Foundation::PSTR, buffer_size : UInt32, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.MesDecodeBufferHandleCreate(buffer, buffer_size, pHandle)
    {% end %}
  end

  def mesBufferHandleReset(handle : Void*, handle_style : UInt32, operation : Win32cr::System::Rpc::MIDL_ES_CODE, pBuffer : Int8**, buffer_size : UInt32, pEncodedSize : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.MesBufferHandleReset(handle, handle_style, operation, pBuffer, buffer_size, pEncodedSize)
    {% end %}
  end

  def mesHandleFree(handle : Void*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.MesHandleFree(handle)
    {% end %}
  end

  def mesInqProcEncodingId(handle : Void*, pInterfaceId : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*, pProcNum : UInt32*) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.MesInqProcEncodingId(handle, pInterfaceId, pProcNum)
    {% end %}
  end

  def ndrMesSimpleTypeAlignSize(param0 : Void*) : LibC::UIntPtrT
    {% if !flag?(:docs) %}
    C.NdrMesSimpleTypeAlignSize(param0)
    {% end %}
  end

  def ndrMesSimpleTypeDecode(handle : Void*, pObject : Void*, size : Int16) : Void
    {% if !flag?(:docs) %}
    C.NdrMesSimpleTypeDecode(handle, pObject, size)
    {% end %}
  end

  def ndrMesSimpleTypeEncode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pObject : Void*, size : Int16) : Void
    {% if !flag?(:docs) %}
    C.NdrMesSimpleTypeEncode(handle, pStubDesc, pObject, size)
    {% end %}
  end

  def ndrMesTypeAlignSize(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : LibC::UIntPtrT
    {% if !flag?(:docs) %}
    C.NdrMesTypeAlignSize(handle, pStubDesc, pFormatString, pObject)
    {% end %}
  end

  def ndrMesTypeEncode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrMesTypeEncode(handle, pStubDesc, pFormatString, pObject)
    {% end %}
  end

  def ndrMesTypeDecode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrMesTypeDecode(handle, pStubDesc, pFormatString, pObject)
    {% end %}
  end

  def ndrMesTypeAlignSize2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : LibC::UIntPtrT
    {% if !flag?(:docs) %}
    C.NdrMesTypeAlignSize2(handle, pPicklingInfo, pStubDesc, pFormatString, pObject)
    {% end %}
  end

  def ndrMesTypeEncode2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrMesTypeEncode2(handle, pPicklingInfo, pStubDesc, pFormatString, pObject)
    {% end %}
  end

  def ndrMesTypeDecode2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrMesTypeDecode2(handle, pPicklingInfo, pStubDesc, pFormatString, pObject)
    {% end %}
  end

  def ndrMesTypeFree2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrMesTypeFree2(handle, pPicklingInfo, pStubDesc, pFormatString, pObject)
    {% end %}
  end

  def ndrMesProcEncodeDecode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.NdrMesProcEncodeDecode(handle, pStubDesc, pFormatString)
    {% end %}
  end

  def ndrMesProcEncodeDecode2(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN
    {% if !flag?(:docs) %}
    C.NdrMesProcEncodeDecode2(handle, pStubDesc, pFormatString)
    {% end %}
  end

  def ndrMesTypeAlignSize3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : LibC::UIntPtrT
    {% if !flag?(:docs) %}
    C.NdrMesTypeAlignSize3(handle, pPicklingInfo, pProxyInfo, arr_type_offset, nTypeIndex, pObject)
    {% end %}
  end

  def ndrMesTypeEncode3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrMesTypeEncode3(handle, pPicklingInfo, pProxyInfo, arr_type_offset, nTypeIndex, pObject)
    {% end %}
  end

  def ndrMesTypeDecode3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrMesTypeDecode3(handle, pPicklingInfo, pProxyInfo, arr_type_offset, nTypeIndex, pObject)
    {% end %}
  end

  def ndrMesTypeFree3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : Void
    {% if !flag?(:docs) %}
    C.NdrMesTypeFree3(handle, pPicklingInfo, pProxyInfo, arr_type_offset, nTypeIndex, pObject)
    {% end %}
  end

  def ndrMesProcEncodeDecode3(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN
    {% if !flag?(:docs) %}
    C.NdrMesProcEncodeDecode3(handle, pProxyInfo, nProcNum, pReturnValue)
    {% end %}
  end

  def ndrMesSimpleTypeDecodeAll(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, pObject : Void*, size : Int16) : Void
    {% if !flag?(:docs) %}
    C.NdrMesSimpleTypeDecodeAll(handle, pProxyInfo, pObject, size)
    {% end %}
  end

  def ndrMesSimpleTypeEncodeAll(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, pObject : Void*, size : Int16) : Void
    {% if !flag?(:docs) %}
    C.NdrMesSimpleTypeEncodeAll(handle, pProxyInfo, pObject, size)
    {% end %}
  end

  def ndrMesSimpleTypeAlignSizeAll(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*) : LibC::UIntPtrT
    {% if !flag?(:docs) %}
    C.NdrMesSimpleTypeAlignSizeAll(handle, pProxyInfo)
    {% end %}
  end

  def rpcCertGeneratePrincipalNameW(context : Win32cr::Security::Cryptography::CERT_CONTEXT*, flags : UInt32, pBuffer : UInt16**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcCertGeneratePrincipalNameW(context, flags, pBuffer)
    {% end %}
  end

  def rpcCertGeneratePrincipalNameA(context : Win32cr::Security::Cryptography::CERT_CONTEXT*, flags : UInt32, pBuffer : UInt8**) : Win32cr::System::Rpc::RPC_STATUS
    {% if !flag?(:docs) %}
    C.RpcCertGeneratePrincipalNameA(context, flags, pBuffer)
    {% end %}
  end

  @[Link("rpcrt4.dll")]
  @[Link("rpcns4.dll")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun IUnknown_QueryInterface_Proxy(this : Void*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IUnknown_AddRef_Proxy(this : Void*) : UInt32

    # :nodoc:
    fun IUnknown_Release_Proxy(this : Void*) : UInt32

    # :nodoc:
    fun RpcBindingCopy(source_binding : Void*, destination_binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingFree(binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingSetOption(hBinding : Void*, option : UInt32, optionValue : LibC::UIntPtrT) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqOption(hBinding : Void*, option : UInt32, pOptionValue : LibC::UIntPtrT*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingFromStringBindingA(string_binding : UInt8*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingFromStringBindingW(string_binding : UInt16*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSsGetContextBinding(context_handle : Void*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqMaxCalls(binding : Void*, max_calls : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqObject(binding : Void*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingReset(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingSetObject(binding : Void*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtInqDefaultProtectLevel(authn_svc : UInt32, authn_level : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingToStringBindingA(binding : Void*, string_binding : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingToStringBindingW(binding : Void*, string_binding : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingVectorFree(binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcStringBindingComposeA(obj_uuid : UInt8*, prot_seq : UInt8*, network_addr : UInt8*, endpoint : UInt8*, options : UInt8*, string_binding : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcStringBindingComposeW(obj_uuid : UInt16*, prot_seq : UInt16*, network_addr : UInt16*, endpoint : UInt16*, options : UInt16*, string_binding : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcStringBindingParseA(string_binding : UInt8*, obj_uuid : UInt8**, protseq : UInt8**, network_addr : UInt8**, endpoint : UInt8**, network_options : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcStringBindingParseW(string_binding : UInt16*, obj_uuid : UInt16**, protseq : UInt16**, network_addr : UInt16**, endpoint : UInt16**, network_options : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcStringFreeA(string : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcStringFreeW(string : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcIfInqId(rpc_if_handle : Void*, rpc_if_id : Win32cr::System::Rpc::RPC_IF_ID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNetworkIsProtseqValidA(protseq : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNetworkIsProtseqValidW(protseq : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtInqComTimeout(binding : Void*, timeout : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtSetComTimeout(binding : Void*, timeout : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtSetCancelTimeout(timeout : Int32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNetworkInqProtseqsA(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORA**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNetworkInqProtseqsW(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORW**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcObjectInqType(obj_uuid : LibC::GUID*, type_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcObjectSetInqFn(inquiry_fn : Win32cr::System::Rpc::RPC_OBJECT_INQ_FN) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcObjectSetType(obj_uuid : LibC::GUID*, type_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcProtseqVectorFreeA(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORA**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcProtseqVectorFreeW(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORW**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInqBindings(binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInqBindingsEx(security_descriptor : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInqIf(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerListen(minimum_call_threads : UInt32, max_calls : UInt32, dont_wait : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerRegisterIf(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerRegisterIfEx(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*, flags : UInt32, max_calls : UInt32, if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerRegisterIf2(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*, flags : UInt32, max_calls : UInt32, max_rpc_size : UInt32, if_callback_fn : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerRegisterIf3(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*, flags : UInt32, max_calls : UInt32, max_rpc_size : UInt32, if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUnregisterIf(if_spec : Void*, mgr_type_uuid : LibC::GUID*, wait_for_calls_to_complete : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUnregisterIfEx(if_spec : Void*, mgr_type_uuid : LibC::GUID*, rundown_context_handles : Int32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseAllProtseqs(max_calls : UInt32, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseAllProtseqsEx(max_calls : UInt32, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseAllProtseqsIf(max_calls : UInt32, if_spec : Void*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseAllProtseqsIfEx(max_calls : UInt32, if_spec : Void*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqA(protseq : UInt8*, max_calls : UInt32, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqExA(protseq : UInt8*, max_calls : UInt32, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqW(protseq : UInt16*, max_calls : UInt32, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqExW(protseq : UInt16*, max_calls : UInt32, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqEpA(protseq : UInt8*, max_calls : UInt32, endpoint : UInt8*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqEpExA(protseq : UInt8*, max_calls : UInt32, endpoint : UInt8*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqEpW(protseq : UInt16*, max_calls : UInt32, endpoint : UInt16*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqEpExW(protseq : UInt16*, max_calls : UInt32, endpoint : UInt16*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqIfA(protseq : UInt8*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqIfExA(protseq : UInt8*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqIfW(protseq : UInt16*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUseProtseqIfExW(protseq : UInt16*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerYield : Void

    # :nodoc:
    fun RpcMgmtStatsVectorFree(stats_vector : Win32cr::System::Rpc::RPC_STATS_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtInqStats(binding : Void*, statistics : Win32cr::System::Rpc::RPC_STATS_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtIsServerListening(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtStopServerListening(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtWaitServerListen : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtSetServerStackSize(thread_stack_size : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSsDontSerializeContext : Void

    # :nodoc:
    fun RpcMgmtEnableIdleCleanup : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtInqIfIds(binding : Void*, if_id_vector : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcIfIdVectorFree(if_id_vector : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtInqServerPrincNameA(binding : Void*, authn_svc : UInt32, server_princ_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtInqServerPrincNameW(binding : Void*, authn_svc : UInt32, server_princ_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInqDefaultPrincNameA(authn_svc : UInt32, princ_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInqDefaultPrincNameW(authn_svc : UInt32, princ_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcEpResolveBinding(binding : Void*, if_spec : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingInqEntryNameA(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingInqEntryNameW(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingCreateA(template : Win32cr::System::Rpc::RPC_BINDING_HANDLE_TEMPLATE_V1_A*, security : Win32cr::System::Rpc::RPC_BINDING_HANDLE_SECURITY_V1_A*, options : Win32cr::System::Rpc::RPC_BINDING_HANDLE_OPTIONS_V1*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingCreateW(template : Win32cr::System::Rpc::RPC_BINDING_HANDLE_TEMPLATE_V1_W*, security : Win32cr::System::Rpc::RPC_BINDING_HANDLE_SECURITY_V1_W*, options : Win32cr::System::Rpc::RPC_BINDING_HANDLE_OPTIONS_V1*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInqBindingHandle(binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcImpersonateClient(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcImpersonateClient2(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcRevertToSelfEx(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcRevertToSelf : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcImpersonateClientContainer(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcRevertContainerImpersonation : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqAuthClientA(client_binding : Void*, privs : Void**, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqAuthClientW(client_binding : Void*, privs : Void**, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqAuthClientExA(client_binding : Void*, privs : Void**, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*, flags : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqAuthClientExW(client_binding : Void*, privs : Void**, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*, flags : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqAuthInfoA(binding : Void*, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqAuthInfoW(binding : Void*, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingSetAuthInfoA(binding : Void*, server_princ_name : UInt8*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingSetAuthInfoExA(binding : Void*, server_princ_name : UInt8*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingSetAuthInfoW(binding : Void*, server_princ_name : UInt16*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingSetAuthInfoExW(binding : Void*, server_princ_name : UInt16*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqAuthInfoExA(binding : Void*, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*, rpc_qos_version : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingInqAuthInfoExW(binding : Void*, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*, rpc_qos_version : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerCompleteSecurityCallback(binding_handle : Void*, status : Win32cr::System::Rpc::RPC_STATUS) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerRegisterAuthInfoA(server_princ_name : UInt8*, authn_svc : UInt32, get_key_fn : Win32cr::System::Rpc::RPC_AUTH_KEY_RETRIEVAL_FN, arg : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerRegisterAuthInfoW(server_princ_name : UInt16*, authn_svc : UInt32, get_key_fn : Win32cr::System::Rpc::RPC_AUTH_KEY_RETRIEVAL_FN, arg : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingServerFromClient(client_binding : Void*, server_binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcRaiseException(exception : Win32cr::System::Rpc::RPC_STATUS) : Void

    # :nodoc:
    fun RpcTestCancel : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerTestCancel(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcCancelThread(thread : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcCancelThreadEx(thread : Void*, timeout : Int32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun UuidCreate(uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun UuidCreateSequential(uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun UuidToStringA(uuid : LibC::GUID*, string_uuid : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun UuidFromStringA(string_uuid : UInt8*, uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun UuidToStringW(uuid : LibC::GUID*, string_uuid : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun UuidFromStringW(string_uuid : UInt16*, uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun UuidCompare(uuid1 : LibC::GUID*, uuid2 : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : Int32

    # :nodoc:
    fun UuidCreateNil(nil_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun UuidEqual(uuid1 : LibC::GUID*, uuid2 : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : Int32

    # :nodoc:
    fun UuidHash(uuid : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : UInt16

    # :nodoc:
    fun UuidIsNil(uuid : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : Int32

    # :nodoc:
    fun RpcEpRegisterNoReplaceA(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcEpRegisterNoReplaceW(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcEpRegisterA(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcEpRegisterW(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcEpUnregister(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun DceErrorInqTextA(rpc_status : Win32cr::System::Rpc::RPC_STATUS, error_text : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun DceErrorInqTextW(rpc_status : Win32cr::System::Rpc::RPC_STATUS, error_text : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtEpEltInqBegin(ep_binding : Void*, inquiry_type : UInt32, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, object_uuid : LibC::GUID*, inquiry_context : Void***) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtEpEltInqDone(inquiry_context : Void***) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtEpEltInqNextA(inquiry_context : Void**, if_id : Win32cr::System::Rpc::RPC_IF_ID*, binding : Void**, object_uuid : LibC::GUID*, annotation__ : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtEpEltInqNextW(inquiry_context : Void**, if_id : Win32cr::System::Rpc::RPC_IF_ID*, binding : Void**, object_uuid : LibC::GUID*, annotation__ : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtEpUnregister(ep_binding : Void*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, binding : Void*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcMgmtSetAuthorizationFn(authorization_fn : Win32cr::System::Rpc::RPC_MGMT_AUTHORIZATION_FN) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcExceptionFilter(exception_code : UInt32) : Int32

    # :nodoc:
    fun RpcServerInterfaceGroupCreateW(interfaces : Win32cr::System::Rpc::RPC_INTERFACE_TEMPLATEW*, num_ifs : UInt32, endpoints : Win32cr::System::Rpc::RPC_ENDPOINT_TEMPLATEW*, num_endpoints : UInt32, idle_period : UInt32, idle_callback_fn : Win32cr::System::Rpc::RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN, idle_callback_context : Void*, if_group : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInterfaceGroupCreateA(interfaces : Win32cr::System::Rpc::RPC_INTERFACE_TEMPLATEA*, num_ifs : UInt32, endpoints : Win32cr::System::Rpc::RPC_ENDPOINT_TEMPLATEA*, num_endpoints : UInt32, idle_period : UInt32, idle_callback_fn : Win32cr::System::Rpc::RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN, idle_callback_context : Void*, if_group : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInterfaceGroupClose(if_group : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInterfaceGroupActivate(if_group : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInterfaceGroupDeactivate(if_group : Void*, force_deactivation : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInterfaceGroupInqBindings(if_group : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcNegotiateTransferSyntax(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcGetBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcGetBufferWithObject(message : Win32cr::System::Rpc::RPC_MESSAGE*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcSendReceive(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcFreeBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcSend(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcReceive(message : Win32cr::System::Rpc::RPC_MESSAGE*, size : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcFreePipeBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcReallocPipeBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*, new_size : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcRequestMutex(mutex : Void**) : Void

    # :nodoc:
    fun I_RpcClearMutex(mutex : Void*) : Void

    # :nodoc:
    fun I_RpcDeleteMutex(mutex : Void*) : Void

    # :nodoc:
    fun I_RpcAllocate(size : UInt32) : Void*

    # :nodoc:
    fun I_RpcFree(object : Void*) : Void

    # :nodoc:
    fun I_RpcPauseExecution(milliseconds : UInt32) : Void

    # :nodoc:
    fun I_RpcGetExtendedError : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcSystemHandleTypeSpecificWork(handle : Void*, actual_type : UInt8, idl_type : UInt8, marshal_direction : Win32cr::System::Rpc::LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcGetCurrentCallHandle : Void*

    # :nodoc:
    fun I_RpcNsInterfaceExported(entry_name_syntax : UInt32, entry_name : UInt16*, rpc_interface_information : Win32cr::System::Rpc::RPC_SERVER_INTERFACE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcNsInterfaceUnexported(entry_name_syntax : UInt32, entry_name : UInt16*, rpc_interface_information : Win32cr::System::Rpc::RPC_SERVER_INTERFACE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingToStaticStringBindingW(binding : Void*, string_binding : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingInqSecurityContext(binding : Void*, security_context_handle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingInqSecurityContextKeyInfo(binding : Void*, key_info : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingInqWireIdForSnego(binding : Void*, wire_id : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingInqMarshalledTargetInfo(binding : Void*, marshalled_target_info_size : UInt32*, marshalled_target_info : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingInqLocalClientPID(binding : Void*, pid : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingHandleToAsyncHandle(binding : Void*, async_handle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcNsBindingSetEntryNameW(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcNsBindingSetEntryNameA(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerUseProtseqEp2A(network_address : UInt8*, protseq : UInt8*, max_calls : UInt32, endpoint : UInt8*, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerUseProtseqEp2W(network_address : UInt16*, protseq : UInt16*, max_calls : UInt32, endpoint : UInt16*, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerUseProtseq2W(network_address : UInt16*, protseq : UInt16*, max_calls : UInt32, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerUseProtseq2A(network_address : UInt8*, protseq : UInt8*, max_calls : UInt32, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerStartService(protseq : UInt16*, endpoint : UInt16*, if_spec : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingInqDynamicEndpointW(binding : Void*, dynamic_endpoint : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingInqDynamicEndpointA(binding : Void*, dynamic_endpoint : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerCheckClientRestriction(context : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingInqTransportType(binding : Void*, type__ : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcIfInqTransferSyntaxes(rpc_if_handle : Void*, transfer_syntaxes : Win32cr::System::Rpc::RPC_TRANSFER_SYNTAX*, transfer_syntax_size : UInt32, transfer_syntax_count : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_UuidCreate(uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingCopy(source_binding : Void*, destination_binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingIsClientLocal(binding_handle : Void*, client_local_flag : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingCreateNP(server_name : UInt16*, service_name : UInt16*, network_options : UInt16*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcSsDontSerializeContext : Void

    # :nodoc:
    fun I_RpcServerRegisterForwardFunction(pForwardFunction : Win32cr::System::Rpc::RPC_FORWARD_FUNCTION*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerInqAddressChangeFn : Win32cr::System::Rpc::RPC_ADDRESS_CHANGE_FN*

    # :nodoc:
    fun I_RpcServerSetAddressChangeFn(pAddressChangeFn : Win32cr::System::Rpc::RPC_ADDRESS_CHANGE_FN*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerInqLocalConnAddress(binding : Void*, buffer : Void*, buffer_size : UInt32*, address_format : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerInqRemoteConnAddress(binding : Void*, buffer : Void*, buffer_size : UInt32*, address_format : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcSessionStrictContextHandle : Void

    # :nodoc:
    fun I_RpcTurnOnEEInfoPropagation : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerInqTransportType(type__ : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcMapWin32Status(status : Win32cr::System::Rpc::RPC_STATUS) : Int32

    # :nodoc:
    fun I_RpcRecordCalloutFailure(rpc_status : Win32cr::System::Rpc::RPC_STATUS, call_out_state : Win32cr::System::Rpc::RDR_CALLOUT_STATE*, dll_name : UInt16*) : Void

    # :nodoc:
    fun I_RpcMgmtEnableDedicatedThreadPool : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcGetDefaultSD(ppSecurityDescriptor : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcOpenClientProcess(binding : Void*, desired_access : UInt32, client_process : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingIsServerLocal(binding : Void*, server_local_flag : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcBindingSetPrivateOption(hBinding : Void*, option : UInt32, optionValue : LibC::UIntPtrT) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerSubscribeForDisconnectNotification(binding : Void*, hEvent : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerGetAssociationID(binding : Void*, association_id : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerDisableExceptionFilter : Int32

    # :nodoc:
    fun I_RpcServerSubscribeForDisconnectNotification2(binding : Void*, hEvent : Void*, subscription_id : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcServerUnsubscribeForDisconnectNotification(binding : Void*, subscription_id : LibC::GUID) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingExportA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingUnexportA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingExportW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingUnexportW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingExportPnPA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingUnexportPnPA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingExportPnPW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingUnexportPnPW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingLookupBeginA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, obj_uuid : LibC::GUID*, binding_max_count : UInt32, lookup_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingLookupBeginW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, obj_uuid : LibC::GUID*, binding_max_count : UInt32, lookup_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingLookupNext(lookup_context : Void*, binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingLookupDone(lookup_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupDeleteA(group_name_syntax : Win32cr::System::Rpc::GROUP_NAME_SYNTAX, group_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupMbrAddA(group_name_syntax : UInt32, group_name : UInt8*, member_name_syntax : UInt32, member_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupMbrRemoveA(group_name_syntax : UInt32, group_name : UInt8*, member_name_syntax : UInt32, member_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupMbrInqBeginA(group_name_syntax : UInt32, group_name : UInt8*, member_name_syntax : UInt32, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupMbrInqNextA(inquiry_context : Void*, member_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupDeleteW(group_name_syntax : Win32cr::System::Rpc::GROUP_NAME_SYNTAX, group_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupMbrAddW(group_name_syntax : UInt32, group_name : UInt16*, member_name_syntax : UInt32, member_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupMbrRemoveW(group_name_syntax : UInt32, group_name : UInt16*, member_name_syntax : UInt32, member_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupMbrInqBeginW(group_name_syntax : UInt32, group_name : UInt16*, member_name_syntax : UInt32, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupMbrInqNextW(inquiry_context : Void*, member_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsGroupMbrInqDone(inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileDeleteA(profile_name_syntax : UInt32, profile_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileEltAddA(profile_name_syntax : UInt32, profile_name : UInt8*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt8*, priority : UInt32, annotation__ : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileEltRemoveA(profile_name_syntax : UInt32, profile_name : UInt8*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileEltInqBeginA(profile_name_syntax : UInt32, profile_name : UInt8*, inquiry_type : UInt32, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, member_name_syntax : UInt32, member_name : UInt8*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileEltInqNextA(inquiry_context : Void*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name : UInt8**, priority : UInt32*, annotation__ : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileDeleteW(profile_name_syntax : UInt32, profile_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileEltAddW(profile_name_syntax : UInt32, profile_name : UInt16*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt16*, priority : UInt32, annotation__ : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileEltRemoveW(profile_name_syntax : UInt32, profile_name : UInt16*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileEltInqBeginW(profile_name_syntax : UInt32, profile_name : UInt16*, inquiry_type : UInt32, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, member_name_syntax : UInt32, member_name : UInt16*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileEltInqNextW(inquiry_context : Void*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name : UInt16**, priority : UInt32*, annotation__ : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsProfileEltInqDone(inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsEntryObjectInqBeginA(entry_name_syntax : UInt32, entry_name : UInt8*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsEntryObjectInqBeginW(entry_name_syntax : UInt32, entry_name : UInt16*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsEntryObjectInqNext(inquiry_context : Void*, obj_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsEntryObjectInqDone(inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsEntryExpandNameA(entry_name_syntax : UInt32, entry_name : UInt8*, expanded_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtBindingUnexportA(entry_name_syntax : UInt32, entry_name : UInt8*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtEntryCreateA(entry_name_syntax : UInt32, entry_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtEntryDeleteA(entry_name_syntax : UInt32, entry_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtEntryInqIfIdsA(entry_name_syntax : UInt32, entry_name : UInt8*, if_id_vec : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtHandleSetExpAge(ns_handle : Void*, expiration_age : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtInqExpAge(expiration_age : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtSetExpAge(expiration_age : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsEntryExpandNameW(entry_name_syntax : UInt32, entry_name : UInt16*, expanded_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtBindingUnexportW(entry_name_syntax : UInt32, entry_name : UInt16*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtEntryCreateW(entry_name_syntax : UInt32, entry_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtEntryDeleteW(entry_name_syntax : UInt32, entry_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsMgmtEntryInqIfIdsW(entry_name_syntax : UInt32, entry_name : UInt16*, if_id_vec : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingImportBeginA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, obj_uuid : LibC::GUID*, import_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingImportBeginW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, obj_uuid : LibC::GUID*, import_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingImportNext(import_context : Void*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingImportDone(import_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcNsBindingSelect(binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcAsyncRegisterInfo(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcAsyncInitializeHandle(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, size : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcAsyncGetCallStatus(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcAsyncCompleteCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, reply : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcAsyncAbortCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, exception_code : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcAsyncCancelCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, fAbort : Win32cr::Foundation::BOOL) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcErrorStartEnumeration(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcErrorGetNextRecord(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*, copy_strings : Win32cr::Foundation::BOOL, error_info : Win32cr::System::Rpc::RPC_EXTENDED_ERROR_INFO*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcErrorEndEnumeration(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcErrorResetEnumeration(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcErrorGetNumberOfRecords(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*, records : Int32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcErrorSaveErrorInfo(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*, error_blob : Void**, blob_size : LibC::UIntPtrT*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcErrorLoadErrorInfo(error_blob : Void*, blob_size : LibC::UIntPtrT, enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcErrorAddRecord(error_info : Win32cr::System::Rpc::RPC_EXTENDED_ERROR_INFO*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcErrorClearInformation : Void

    # :nodoc:
    fun RpcGetAuthorizationContextForClient(client_binding : Void*, impersonate_on_return : Win32cr::Foundation::BOOL, reserved1 : Void*, pExpirationTime : Win32cr::Foundation::LARGE_INTEGER*, reserved2 : Win32cr::Foundation::LUID, reserved3 : UInt32, reserved4 : Void*, pAuthzClientContext : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcFreeAuthorizationContext(pAuthzClientContext : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSsContextLockExclusive(server_binding_handle : Void*, user_context : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSsContextLockShared(server_binding_handle : Void*, user_context : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInqCallAttributesW(client_binding : Void*, rpc_call_attributes : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerInqCallAttributesA(client_binding : Void*, rpc_call_attributes : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerSubscribeForNotification(binding : Void*, notification : Win32cr::System::Rpc::RPC_NOTIFICATIONS, notification_type : Win32cr::System::Rpc::RPC_NOTIFICATION_TYPES, notification_info : Win32cr::System::Rpc::RPC_ASYNC_NOTIFICATION_INFO*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcServerUnsubscribeForNotification(binding : Void*, notification : Win32cr::System::Rpc::RPC_NOTIFICATIONS, notifications_queued : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingBind(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, binding : Void*, if_spec : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcBindingUnbind(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcAsyncSetHandle(message : Win32cr::System::Rpc::RPC_MESSAGE*, pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcAsyncAbortCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, exception_code : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcExceptionFilter(exception_code : UInt32) : Int32

    # :nodoc:
    fun I_RpcBindingInqClientTokenAttributes(binding : Void*, token_id : Win32cr::Foundation::LUID*, authentication_id : Win32cr::Foundation::LUID*, modified_id : Win32cr::Foundation::LUID*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcNsGetBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcNsSendReceive(message : Win32cr::System::Rpc::RPC_MESSAGE*, handle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun I_RpcNsRaiseException(message : Win32cr::System::Rpc::RPC_MESSAGE*, status : Win32cr::System::Rpc::RPC_STATUS) : Void

    # :nodoc:
    fun I_RpcReBindBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun NDRCContextBinding(c_context : LibC::IntPtrT) : Void*

    # :nodoc:
    fun NDRCContextMarshall(c_context : LibC::IntPtrT, pBuff : Void*) : Void

    # :nodoc:
    fun NDRCContextUnmarshall(pCContext : LibC::IntPtrT*, hBinding : Void*, pBuff : Void*, data_representation : UInt32) : Void

    # :nodoc:
    fun NDRSContextMarshall(c_context : Win32cr::System::Rpc::NDR_SCONTEXT_1*, pBuff : Void*, userRunDownIn : Win32cr::System::Rpc::NDR_RUNDOWN) : Void

    # :nodoc:
    fun NDRSContextUnmarshall(pBuff : Void*, data_representation : UInt32) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    # :nodoc:
    fun NDRSContextMarshallEx(binding_handle : Void*, c_context : Win32cr::System::Rpc::NDR_SCONTEXT_1*, pBuff : Void*, userRunDownIn : Win32cr::System::Rpc::NDR_RUNDOWN) : Void

    # :nodoc:
    fun NDRSContextMarshall2(binding_handle : Void*, c_context : Win32cr::System::Rpc::NDR_SCONTEXT_1*, pBuff : Void*, userRunDownIn : Win32cr::System::Rpc::NDR_RUNDOWN, ctx_guard : Void*, flags : UInt32) : Void

    # :nodoc:
    fun NDRSContextUnmarshallEx(binding_handle : Void*, pBuff : Void*, data_representation : UInt32) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    # :nodoc:
    fun NDRSContextUnmarshall2(binding_handle : Void*, pBuff : Void*, data_representation : UInt32, ctx_guard : Void*, flags : UInt32) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    # :nodoc:
    fun RpcSsDestroyClientContext(context_handle : Void**) : Void

    # :nodoc:
    fun NdrSimpleTypeMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, format_char : UInt8) : Void

    # :nodoc:
    fun NdrPointerMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrSimpleStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrConformantStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrConformantVaryingStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrComplexStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrFixedArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrConformantArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrConformantVaryingArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrVaryingArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrComplexArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrNonConformantStringMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrConformantStringMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrEncapsulatedUnionMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrNonEncapsulatedUnionMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrByteCountPointerMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrXmitOrRepAsMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrUserMarshalMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrInterfacePointerMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    # :nodoc:
    fun NdrClientContextMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, context_handle : LibC::IntPtrT, fCheck : Int32) : Void

    # :nodoc:
    fun NdrServerContextMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, context_handle : Win32cr::System::Rpc::NDR_SCONTEXT_1*, rundown_routine : Win32cr::System::Rpc::NDR_RUNDOWN) : Void

    # :nodoc:
    fun NdrServerContextNewMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, context_handle : Win32cr::System::Rpc::NDR_SCONTEXT_1*, rundown_routine : Win32cr::System::Rpc::NDR_RUNDOWN, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrSimpleTypeUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, format_char : UInt8) : Void

    # :nodoc:
    fun NdrRangeUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrCorrelationInitialize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : Void*, cache_size : UInt32, flags : UInt32) : Void

    # :nodoc:
    fun NdrCorrelationPass(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    # :nodoc:
    fun NdrCorrelationFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    # :nodoc:
    fun NdrPointerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrSimpleStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrConformantStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrConformantVaryingStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrComplexStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrFixedArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrConformantArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrConformantVaryingArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrVaryingArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrComplexArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrNonConformantStringUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrConformantStringUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrEncapsulatedUnionUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrNonEncapsulatedUnionUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrByteCountPointerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrXmitOrRepAsUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrUserMarshalUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrInterfacePointerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    # :nodoc:
    fun NdrClientContextUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pContextHandle : LibC::IntPtrT*, bind_handle : Void*) : Void

    # :nodoc:
    fun NdrServerContextUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    # :nodoc:
    fun NdrContextHandleInitialize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    # :nodoc:
    fun NdrServerContextNewUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    # :nodoc:
    fun NdrPointerBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrSimpleStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConformantStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConformantVaryingStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrComplexStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrFixedArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConformantArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConformantVaryingArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrVaryingArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrComplexArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConformantStringBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrNonConformantStringBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrEncapsulatedUnionBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrNonEncapsulatedUnionBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrByteCountPointerBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrXmitOrRepAsBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrUserMarshalBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrInterfacePointerBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrContextHandleSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrPointerMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrSimpleStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrConformantStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrConformantVaryingStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrComplexStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrFixedArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrConformantArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrConformantVaryingArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrVaryingArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrComplexArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrConformantStringMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrNonConformantStringMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrEncapsulatedUnionMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrNonEncapsulatedUnionMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrXmitOrRepAsMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrUserMarshalMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrInterfacePointerMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    # :nodoc:
    fun NdrPointerFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrSimpleStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConformantStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConformantVaryingStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrComplexStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrFixedArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConformantArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConformantVaryingArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrVaryingArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrComplexArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrEncapsulatedUnionFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrNonEncapsulatedUnionFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrByteCountPointerFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrXmitOrRepAsFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrUserMarshalFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrInterfacePointerFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrConvert2(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*, number_params : Int32) : Void

    # :nodoc:
    fun NdrConvert(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : Void

    # :nodoc:
    fun NdrUserMarshalSimpleTypeConvert(pFlags : UInt32*, pBuffer : UInt8*, format_char : UInt8) : UInt8*

    # :nodoc:
    fun NdrClientInitializeNew(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, proc_num : UInt32) : Void

    # :nodoc:
    fun NdrServerInitializeNew(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*) : UInt8*

    # :nodoc:
    fun NdrServerInitializePartial(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, requested_buffer_size : UInt32) : Void

    # :nodoc:
    fun NdrClientInitialize(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, proc_num : UInt32) : Void

    # :nodoc:
    fun NdrServerInitialize(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*) : UInt8*

    # :nodoc:
    fun NdrServerInitializeUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : UInt8*

    # :nodoc:
    fun NdrServerInitializeMarshall(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    # :nodoc:
    fun NdrGetBuffer(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, buffer_length : UInt32, handle : Void*) : UInt8*

    # :nodoc:
    fun NdrNsGetBuffer(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, buffer_length : UInt32, handle : Void*) : UInt8*

    # :nodoc:
    fun NdrSendReceive(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pBufferEnd : UInt8*) : UInt8*

    # :nodoc:
    fun NdrNsSendReceive(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pBufferEnd : UInt8*, pAutoHandle : Void**) : UInt8*

    # :nodoc:
    fun NdrFreeBuffer(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    # :nodoc:
    fun NdrGetDcomProtocolVersion(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pVersion : Win32cr::System::Rpc::RPC_VERSION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NdrClientCall2(pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormat : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    # :nodoc:
    fun NdrAsyncClientCall(pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormat : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    # :nodoc:
    fun NdrDcomAsyncClientCall(pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormat : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    # :nodoc:
    fun NdrAsyncServerCall(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    # :nodoc:
    fun NdrDcomAsyncStubCall(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32

    # :nodoc:
    fun NdrStubCall2(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32

    # :nodoc:
    fun NdrServerCall2(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    # :nodoc:
    fun NdrMapCommAndFaultStatus(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pCommStatus : UInt32*, pFaultStatus : UInt32*, status : Win32cr::System::Rpc::RPC_STATUS) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSsAllocate(size : LibC::UIntPtrT) : Void*

    # :nodoc:
    fun RpcSsDisableAllocate : Void

    # :nodoc:
    fun RpcSsEnableAllocate : Void

    # :nodoc:
    fun RpcSsFree(node_to_free : Void*) : Void

    # :nodoc:
    fun RpcSsGetThreadHandle : Void*

    # :nodoc:
    fun RpcSsSetClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE) : Void

    # :nodoc:
    fun RpcSsSetThreadHandle(id : Void*) : Void

    # :nodoc:
    fun RpcSsSwapClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE, old_client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC*, old_client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE*) : Void

    # :nodoc:
    fun RpcSmAllocate(size : LibC::UIntPtrT, pStatus : Win32cr::System::Rpc::RPC_STATUS*) : Void*

    # :nodoc:
    fun RpcSmClientFree(pNodeToFree : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSmDestroyClientContext(context_handle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSmDisableAllocate : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSmEnableAllocate : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSmFree(node_to_free : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSmGetThreadHandle(pStatus : Win32cr::System::Rpc::RPC_STATUS*) : Void*

    # :nodoc:
    fun RpcSmSetClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSmSetThreadHandle(id : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcSmSwapClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE, old_client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC*, old_client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun NdrRpcSsEnableAllocate(pMessage : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    # :nodoc:
    fun NdrRpcSsDisableAllocate(pMessage : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    # :nodoc:
    fun NdrRpcSmSetClientToOsf(pMessage : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    # :nodoc:
    fun NdrRpcSmClientAllocate(size : LibC::UIntPtrT) : Void*

    # :nodoc:
    fun NdrRpcSmClientFree(node_to_free : Void*) : Void

    # :nodoc:
    fun NdrRpcSsDefaultAllocate(size : LibC::UIntPtrT) : Void*

    # :nodoc:
    fun NdrRpcSsDefaultFree(node_to_free : Void*) : Void

    # :nodoc:
    fun NdrFullPointerXlatInit(number_of_pointers : UInt32, xlat_side : Win32cr::System::Rpc::XLAT_SIDE) : Win32cr::System::Rpc::FULL_PTR_XLAT_TABLES*

    # :nodoc:
    fun NdrFullPointerXlatFree(pXlatTables : Win32cr::System::Rpc::FULL_PTR_XLAT_TABLES*) : Void

    # :nodoc:
    fun NdrAllocate(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, len : LibC::UIntPtrT) : Void*

    # :nodoc:
    fun NdrClearOutParameters(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*, arg_addr : Void*) : Void

    # :nodoc:
    fun NdrOleAllocate(size : LibC::UIntPtrT) : Void*

    # :nodoc:
    fun NdrOleFree(node_to_free : Void*) : Void

    # :nodoc:
    fun NdrGetUserMarshalInfo(pFlags : UInt32*, information_level : UInt32, pMarshalInfo : Win32cr::System::Rpc::NDR_USER_MARSHAL_INFO*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun NdrCreateServerInterfaceFromStub(pStub : Void*, pServerIf : Win32cr::System::Rpc::RPC_SERVER_INTERFACE*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun NdrClientCall3(pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    # :nodoc:
    fun Ndr64AsyncClientCall(pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    # :nodoc:
    fun Ndr64DcomAsyncClientCall(pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    # :nodoc:
    fun Ndr64AsyncServerCall64(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    # :nodoc:
    fun Ndr64AsyncServerCallAll(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    # :nodoc:
    fun Ndr64DcomAsyncStubCall(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32

    # :nodoc:
    fun NdrStubCall3(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32

    # :nodoc:
    fun NdrServerCallAll(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    # :nodoc:
    fun NdrServerCallNdr64(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    # :nodoc:
    fun NdrPartialIgnoreClientMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : Void*) : Void

    # :nodoc:
    fun NdrPartialIgnoreServerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : Void**) : Void

    # :nodoc:
    fun NdrPartialIgnoreClientBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : Void*) : Void

    # :nodoc:
    fun NdrPartialIgnoreServerInitialize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : Void**, pFormat : UInt8*) : Void

    # :nodoc:
    fun RpcUserFree(async_handle : Void*, pBuffer : Void*) : Void

    # :nodoc:
    fun MesEncodeIncrementalHandleCreate(user_state : Void*, alloc_fn : Win32cr::System::Rpc::MIDL_ES_ALLOC, write_fn : Win32cr::System::Rpc::MIDL_ES_WRITE, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun MesDecodeIncrementalHandleCreate(user_state : Void*, read_fn : Win32cr::System::Rpc::MIDL_ES_READ, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun MesIncrementalHandleReset(handle : Void*, user_state : Void*, alloc_fn : Win32cr::System::Rpc::MIDL_ES_ALLOC, write_fn : Win32cr::System::Rpc::MIDL_ES_WRITE, read_fn : Win32cr::System::Rpc::MIDL_ES_READ, operation : Win32cr::System::Rpc::MIDL_ES_CODE) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun MesEncodeFixedBufferHandleCreate(pBuffer : Win32cr::Foundation::PSTR, buffer_size : UInt32, pEncodedSize : UInt32*, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun MesEncodeDynBufferHandleCreate(pBuffer : Int8**, pEncodedSize : UInt32*, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun MesDecodeBufferHandleCreate(buffer : Win32cr::Foundation::PSTR, buffer_size : UInt32, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun MesBufferHandleReset(handle : Void*, handle_style : UInt32, operation : Win32cr::System::Rpc::MIDL_ES_CODE, pBuffer : Int8**, buffer_size : UInt32, pEncodedSize : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun MesHandleFree(handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun MesInqProcEncodingId(handle : Void*, pInterfaceId : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*, pProcNum : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun NdrMesSimpleTypeAlignSize(param0 : Void*) : LibC::UIntPtrT

    # :nodoc:
    fun NdrMesSimpleTypeDecode(handle : Void*, pObject : Void*, size : Int16) : Void

    # :nodoc:
    fun NdrMesSimpleTypeEncode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pObject : Void*, size : Int16) : Void

    # :nodoc:
    fun NdrMesTypeAlignSize(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : LibC::UIntPtrT

    # :nodoc:
    fun NdrMesTypeEncode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    # :nodoc:
    fun NdrMesTypeDecode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    # :nodoc:
    fun NdrMesTypeAlignSize2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : LibC::UIntPtrT

    # :nodoc:
    fun NdrMesTypeEncode2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    # :nodoc:
    fun NdrMesTypeDecode2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    # :nodoc:
    fun NdrMesTypeFree2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    # :nodoc:
    fun NdrMesProcEncodeDecode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*) : Void

    # :nodoc:
    fun NdrMesProcEncodeDecode2(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    # :nodoc:
    fun NdrMesTypeAlignSize3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : LibC::UIntPtrT

    # :nodoc:
    fun NdrMesTypeEncode3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : Void

    # :nodoc:
    fun NdrMesTypeDecode3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : Void

    # :nodoc:
    fun NdrMesTypeFree3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : Void

    # :nodoc:
    fun NdrMesProcEncodeDecode3(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    # :nodoc:
    fun NdrMesSimpleTypeDecodeAll(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, pObject : Void*, size : Int16) : Void

    # :nodoc:
    fun NdrMesSimpleTypeEncodeAll(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, pObject : Void*, size : Int16) : Void

    # :nodoc:
    fun NdrMesSimpleTypeAlignSizeAll(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*) : LibC::UIntPtrT

    # :nodoc:
    fun RpcCertGeneratePrincipalNameW(context : Win32cr::Security::Cryptography::CERT_CONTEXT*, flags : UInt32, pBuffer : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    # :nodoc:
    fun RpcCertGeneratePrincipalNameA(context : Win32cr::Security::Cryptography::CERT_CONTEXT*, flags : UInt32, pBuffer : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

  end
  {% end %}
end