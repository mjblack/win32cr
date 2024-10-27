require "./com.cr"
require "./../foundation.cr"
require "./io.cr"
require "./../security/cryptography.cr"

module Win32cr::System::Rpc
  alias RPC_OBJECT_INQ_FN = Proc(LibC::GUID*, LibC::GUID*, Win32cr::System::Rpc::RPC_STATUS*, Void)*

  alias RPC_IF_CALLBACK_FN = Proc(Void*, Void*, Win32cr::System::Rpc::RPC_STATUS)*

  alias RPC_SECURITY_CALLBACK_FN = Proc(Void*, Void)*

  alias RPC_NEW_HTTP_PROXY_CHANNEL = Proc(Win32cr::System::Rpc::RPC_HTTP_REDIRECTOR_STAGE, UInt16*, UInt16*, UInt16*, UInt16*, Void*, Void*, Void*, Void*, UInt32, UInt16**, UInt16**, Win32cr::System::Rpc::RPC_STATUS)*

  alias RPC_HTTP_PROXY_FREE_STRING = Proc(UInt16*, Void)*

  alias RPC_AUTH_KEY_RETRIEVAL_FN = Proc(Void*, UInt16*, UInt32, Void**, Win32cr::System::Rpc::RPC_STATUS*, Void)*

  alias RPC_MGMT_AUTHORIZATION_FN = Proc(Void*, UInt32, Win32cr::System::Rpc::RPC_STATUS*, Int32)*

  alias RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN = Proc(Void*, Void*, UInt32, Void)*

  alias RPC_FORWARD_FUNCTION = Proc(LibC::GUID*, Win32cr::System::Rpc::RPC_VERSION*, LibC::GUID*, UInt8*, Void**, Win32cr::System::Rpc::RPC_STATUS)*

  alias RPC_ADDRESS_CHANGE_FN = Proc(Void*, Void)*

  alias RPC_DISPATCH_FUNCTION = Proc(Win32cr::System::Rpc::RPC_MESSAGE*, Void)*

  alias PRPC_RUNDOWN = Proc(Void*, Void)*

  alias RPCLT_PDU_FILTER_FUNC = Proc(Void*, UInt32, Int32, Void)*

  alias RPC_SETFILTER_FUNC = Proc(Win32cr::System::Rpc::RPCLT_PDU_FILTER_FUNC, Void)*

  alias RPC_BLOCKING_FN = Proc(Void*, Void*, Void*, Win32cr::System::Rpc::RPC_STATUS)*

  alias I_RpcProxyIsValidMachineFn = Proc(UInt16*, UInt16*, UInt32, Win32cr::System::Rpc::RPC_STATUS)*

  alias I_RpcProxyGetClientAddressFn = Proc(Void*, Win32cr::Foundation::PSTR, UInt32*, Win32cr::System::Rpc::RPC_STATUS)*

  alias I_RpcProxyGetConnectionTimeoutFn = Proc(UInt32*, Win32cr::System::Rpc::RPC_STATUS)*

  alias I_RpcPerformCalloutFn = Proc(Void*, Win32cr::System::Rpc::RDR_CALLOUT_STATE*, Win32cr::System::Rpc::RPC_HTTP_REDIRECTOR_STAGE, Win32cr::System::Rpc::RPC_STATUS)*

  alias I_RpcFreeCalloutStateFn = Proc(Win32cr::System::Rpc::RDR_CALLOUT_STATE*, Void)*

  alias I_RpcProxyGetClientSessionAndResourceUUID = Proc(Void*, Int32*, LibC::GUID*, Int32*, LibC::GUID*, Win32cr::System::Rpc::RPC_STATUS)*

  alias I_RpcProxyFilterIfFn = Proc(Void*, LibC::GUID*, UInt16, Int32*, Win32cr::System::Rpc::RPC_STATUS)*

  alias I_RpcProxyUpdatePerfCounterFn = Proc(Win32cr::System::Rpc::RpcProxyPerfCounters, Int32, UInt32, Void)*

  alias I_RpcProxyUpdatePerfCounterBackendServerFn = Proc(UInt16*, Int32, Void)*

  alias PFN_RPCNOTIFICATION_ROUTINE = Proc(Win32cr::System::Rpc::RPC_ASYNC_STATE*, Void*, Win32cr::System::Rpc::RPC_ASYNC_EVENT, Void)*

  alias NDR_RUNDOWN = Proc(Void*, Void)*

  alias NDR_NOTIFY_ROUTINE = Proc(Void)*

  alias NDR_NOTIFY2_ROUTINE = Proc(UInt8, Void)*

  alias EXPR_EVAL = Proc(Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, Void)*

  alias GENERIC_BINDING_ROUTINE = Proc(Void*, Void*)*

  alias GENERIC_UNBIND_ROUTINE = Proc(Void*, UInt8*, Void)*

  alias XMIT_HELPER_ROUTINE = Proc(Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, Void)*

  alias USER_MARSHAL_SIZING_ROUTINE = Proc(UInt32*, UInt32, Void*, UInt32)*

  alias USER_MARSHAL_MARSHALLING_ROUTINE = Proc(UInt32*, UInt8*, Void*, UInt8*)*

  alias USER_MARSHAL_UNMARSHALLING_ROUTINE = Proc(UInt32*, UInt8*, Void*, UInt8*)*

  alias USER_MARSHAL_FREEING_ROUTINE = Proc(UInt32*, Void*, Void)*

  alias CS_TYPE_NET_SIZE_ROUTINE = Proc(Void*, UInt32, UInt32, Win32cr::System::Rpc::IDL_CS_CONVERT*, UInt32*, UInt32*, Void)*

  alias CS_TYPE_LOCAL_SIZE_ROUTINE = Proc(Void*, UInt32, UInt32, Win32cr::System::Rpc::IDL_CS_CONVERT*, UInt32*, UInt32*, Void)*

  alias CS_TYPE_TO_NETCS_ROUTINE = Proc(Void*, UInt32, Void*, UInt32, UInt8*, UInt32*, UInt32*, Void)*

  alias CS_TYPE_FROM_NETCS_ROUTINE = Proc(Void*, UInt32, UInt8*, UInt32, UInt32, Void*, UInt32*, UInt32*, Void)*

  alias CS_TAG_GETTING_ROUTINE = Proc(Void*, Int32, UInt32*, UInt32*, UInt32*, UInt32*, Void)*

  alias STUB_THUNK = Proc(Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, Void)*

  alias SERVER_ROUTINE = Proc(Int32)*

  alias RPC_CLIENT_ALLOC = Proc(LibC::UIntPtrT, Void*)*

  alias RPC_CLIENT_FREE = Proc(Void*, Void)*

  alias MIDL_ES_ALLOC = Proc(Void*, Int8**, UInt32*, Void)*

  alias MIDL_ES_WRITE = Proc(Void*, Win32cr::Foundation::PSTR, UInt32, Void)*

  alias MIDL_ES_READ = Proc(Void*, Int8**, UInt32*, Void)*

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
  RPCPROXY_H_VERSION__ = 475_u32
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
  record NDR_SCONTEXT_1,
    pad : Void*[2],
    userContext : Void*

  @[Extern]
  record RPC_BINDING_VECTOR,
    count : UInt32,
    binding_h : Void**

  @[Extern]
  record UUID_VECTOR,
    count : UInt32,
    uuid : LibC::GUID**

  @[Extern]
  record RPC_IF_ID,
    uuid : LibC::GUID,
    vers_major : UInt16,
    vers_minor : UInt16

  @[Extern]
  record RPC_PROTSEQ_VECTORA,
    count : UInt32,
    protseq : UInt8**

  @[Extern]
  record RPC_PROTSEQ_VECTORW,
    count : UInt32,
    protseq : UInt16**

  @[Extern]
  record RPC_POLICY,
    length : UInt32,
    endpoint_flags : UInt32,
    nic_flags : UInt32

  @[Extern]
  record RPC_STATS_VECTOR,
    count : UInt32,
    stats : UInt32*

  @[Extern]
  record RPC_IF_ID_VECTOR,
    count : UInt32,
    if_id : Win32cr::System::Rpc::RPC_IF_ID**

  @[Extern]
  record RPC_SECURITY_QOS,
    version : UInt32,
    capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES,
    identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY,
    impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL

  @[Extern]
  record SEC_WINNT_AUTH_IDENTITY_W,
    user : UInt16*,
    user_length : UInt32,
    domain : UInt16*,
    domain_length : UInt32,
    password : UInt16*,
    password_length : UInt32,
    flags : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY

  @[Extern]
  record SEC_WINNT_AUTH_IDENTITY_A,
    user : UInt8*,
    user_length : UInt32,
    domain : UInt8*,
    domain_length : UInt32,
    password : UInt8*,
    password_length : UInt32,
    flags : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY

  @[Extern]
  record RPC_HTTP_TRANSPORT_CREDENTIALS_W,
    transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*,
    flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS,
    authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET,
    number_of_authn_schemes : UInt32,
    authn_schemes : UInt32*,
    server_certificate_subject : UInt16*

  @[Extern]
  record RPC_HTTP_TRANSPORT_CREDENTIALS_A,
    transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*,
    flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS,
    authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET,
    number_of_authn_schemes : UInt32,
    authn_schemes : UInt32*,
    server_certificate_subject : UInt8*

  @[Extern]
  record RPC_HTTP_TRANSPORT_CREDENTIALS_V2_W,
    transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*,
    flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS,
    authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET,
    number_of_authn_schemes : UInt32,
    authn_schemes : UInt32*,
    server_certificate_subject : UInt16*,
    proxy_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*,
    number_of_proxy_authn_schemes : UInt32,
    proxy_authn_schemes : UInt32*

  @[Extern]
  record RPC_HTTP_TRANSPORT_CREDENTIALS_V2_A,
    transport_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*,
    flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS,
    authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET,
    number_of_authn_schemes : UInt32,
    authn_schemes : UInt32*,
    server_certificate_subject : UInt8*,
    proxy_credentials : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*,
    number_of_proxy_authn_schemes : UInt32,
    proxy_authn_schemes : UInt32*

  @[Extern]
  record RPC_HTTP_TRANSPORT_CREDENTIALS_V3_W,
    transport_credentials : Void*,
    flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS,
    authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET,
    number_of_authn_schemes : UInt32,
    authn_schemes : UInt32*,
    server_certificate_subject : UInt16*,
    proxy_credentials : Void*,
    number_of_proxy_authn_schemes : UInt32,
    proxy_authn_schemes : UInt32*

  @[Extern]
  record RPC_HTTP_TRANSPORT_CREDENTIALS_V3_A,
    transport_credentials : Void*,
    flags : Win32cr::System::Rpc::RPC_C_HTTP_FLAGS,
    authentication_target : Win32cr::System::Rpc::RPC_C_HTTP_AUTHN_TARGET,
    number_of_authn_schemes : UInt32,
    authn_schemes : UInt32*,
    server_certificate_subject : UInt8*,
    proxy_credentials : Void*,
    number_of_proxy_authn_schemes : UInt32,
    proxy_authn_schemes : UInt32*

  @[Extern]
  record RPC_SECURITY_QOS_V2_W,
    version : UInt32,
    capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES,
    identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY,
    impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL,
    additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE,
    u : U_e__union do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*

  end

  @[Extern]
  record RPC_SECURITY_QOS_V2_A,
    version : UInt32,
    capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES,
    identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY,
    impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL,
    additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE,
    u : U_e__union do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*

  end

  @[Extern]
  record RPC_SECURITY_QOS_V3_W,
    version : UInt32,
    capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES,
    identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY,
    impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL,
    additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE,
    u : U_e__union,
    sid : Void* do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*

  end

  @[Extern]
  record RPC_SECURITY_QOS_V3_A,
    version : UInt32,
    capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES,
    identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY,
    impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL,
    additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE,
    u : U_e__union,
    sid : Void* do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*

  end

  @[Extern]
  record RPC_SECURITY_QOS_V4_W,
    version : UInt32,
    capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES,
    identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY,
    impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL,
    additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE,
    u : U_e__union,
    sid : Void*,
    effective_only : UInt32 do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*

  end

  @[Extern]
  record RPC_SECURITY_QOS_V4_A,
    version : UInt32,
    capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES,
    identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY,
    impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL,
    additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE,
    u : U_e__union,
    sid : Void*,
    effective_only : UInt32 do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*

  end

  @[Extern]
  record RPC_SECURITY_QOS_V5_W,
    version : UInt32,
    capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES,
    identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY,
    impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL,
    additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE,
    u : U_e__union,
    sid : Void*,
    effective_only : UInt32,
    server_security_descriptor : Void* do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_W*

  end

  @[Extern]
  record RPC_SECURITY_QOS_V5_A,
    version : UInt32,
    capabilities : Win32cr::System::Rpc::RPC_C_QOS_CAPABILITIES,
    identity_tracking : Win32cr::System::Rpc::RPC_C_QOS_IDENTITY,
    impersonation_type : Win32cr::System::Com::RPC_C_IMP_LEVEL,
    additional_security_info_type : Win32cr::System::Rpc::RPC_C_AUTHN_INFO_TYPE,
    u : U_e__union,
    sid : Void*,
    effective_only : UInt32,
    server_security_descriptor : Void* do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      http_credentials : Win32cr::System::Rpc::RPC_HTTP_TRANSPORT_CREDENTIALS_A*

  end

  @[Extern]
  record RPC_BINDING_HANDLE_TEMPLATE_V1_W,
    version : UInt32,
    flags : UInt32,
    protocol_sequence : UInt32,
    network_address : UInt16*,
    string_endpoint : UInt16*,
    u1 : U1_e__union,
    object_uuid : LibC::GUID do

    # Nested Type U1_e__union
    @[Extern(union: true)]
    record U1_e__union,
      reserved : UInt16*

  end

  @[Extern]
  record RPC_BINDING_HANDLE_TEMPLATE_V1_A,
    version : UInt32,
    flags : UInt32,
    protocol_sequence : UInt32,
    network_address : UInt8*,
    string_endpoint : UInt8*,
    u1 : U1_e__union,
    object_uuid : LibC::GUID do

    # Nested Type U1_e__union
    @[Extern(union: true)]
    record U1_e__union,
      reserved : UInt8*

  end

  @[Extern]
  record RPC_BINDING_HANDLE_SECURITY_V1_W,
    version : UInt32,
    server_princ_name : UInt16*,
    authn_level : UInt32,
    authn_svc : UInt32,
    auth_identity : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W*,
    security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*

  @[Extern]
  record RPC_BINDING_HANDLE_SECURITY_V1_A,
    version : UInt32,
    server_princ_name : UInt8*,
    authn_level : UInt32,
    authn_svc : UInt32,
    auth_identity : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A*,
    security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*

  @[Extern]
  record RPC_BINDING_HANDLE_OPTIONS_V1,
    version : UInt32,
    flags : Win32cr::System::Rpc::RPC_BINDING_HANDLE_OPTIONS_FLAGS,
    com_timeout : UInt32,
    call_timeout : UInt32

  @[Extern]
  record RPC_CLIENT_INFORMATION1,
    user_name : UInt8*,
    computer_name : UInt8*,
    privilege : UInt16,
    auth_flags : UInt32

  @[Extern]
  record RPC_ENDPOINT_TEMPLATEW,
    version : UInt32,
    prot_seq : UInt16*,
    endpoint : UInt16*,
    security_descriptor : Void*,
    backlog : UInt32

  @[Extern]
  record RPC_ENDPOINT_TEMPLATEA,
    version : UInt32,
    prot_seq : UInt8*,
    endpoint : UInt8*,
    security_descriptor : Void*,
    backlog : UInt32

  @[Extern]
  record RPC_INTERFACE_TEMPLATEA,
    version : UInt32,
    if_spec : Void*,
    mgr_type_uuid : LibC::GUID*,
    mgr_epv : Void*,
    flags : UInt32,
    max_calls : UInt32,
    max_rpc_size : UInt32,
    if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN,
    uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*,
    annotation__ : UInt8*,
    security_descriptor : Void*

  @[Extern]
  record RPC_INTERFACE_TEMPLATEW,
    version : UInt32,
    if_spec : Void*,
    mgr_type_uuid : LibC::GUID*,
    mgr_epv : Void*,
    flags : UInt32,
    max_calls : UInt32,
    max_rpc_size : UInt32,
    if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN,
    uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*,
    annotation__ : UInt16*,
    security_descriptor : Void*

  @[Extern]
  record RPC_VERSION,
    major_version : UInt16,
    minor_version : UInt16

  @[Extern]
  record RPC_SYNTAX_IDENTIFIER,
    syntax_guid : LibC::GUID,
    syntax_version : Win32cr::System::Rpc::RPC_VERSION

  @[Extern]
  record RPC_MESSAGE,
    handle : Void*,
    data_representation : UInt32,
    buffer : Void*,
    buffer_length : UInt32,
    proc_num : UInt32,
    transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*,
    rpc_interface_information : Void*,
    reserved_for_runtime : Void*,
    manager_epv : Void*,
    import_context : Void*,
    rpc_flags : UInt32

  @[Extern]
  record RPC_DISPATCH_TABLE,
    dispatch_table_count : UInt32,
    dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_FUNCTION,
    reserved : LibC::IntPtrT

  @[Extern]
  record RPC_PROTSEQ_ENDPOINT,
    rpc_protocol_sequence : UInt8*,
    endpoint : UInt8*

  @[Extern]
  record RPC_SERVER_INTERFACE,
    length : UInt32,
    interface_id : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER,
    transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER,
    dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_TABLE*,
    rpc_protseq_endpoint_count : UInt32,
    rpc_protseq_endpoint : Win32cr::System::Rpc::RPC_PROTSEQ_ENDPOINT*,
    default_manager_epv : Void*,
    interpreter_info : Void*,
    flags : UInt32

  @[Extern]
  record RPC_CLIENT_INTERFACE,
    length : UInt32,
    interface_id : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER,
    transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER,
    dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_TABLE*,
    rpc_protseq_endpoint_count : UInt32,
    rpc_protseq_endpoint : Win32cr::System::Rpc::RPC_PROTSEQ_ENDPOINT*,
    reserved : LibC::UIntPtrT,
    interpreter_info : Void*,
    flags : UInt32

  @[Extern]
  record RPC_SEC_CONTEXT_KEY_INFO,
    encrypt_algorithm : UInt32,
    key_size : UInt32,
    signature_algorithm : UInt32

  @[Extern]
  record RPC_TRANSFER_SYNTAX,
    uuid : LibC::GUID,
    vers_major : UInt16,
    vers_minor : UInt16

  @[Extern]
  record RPC_C_OPT_COOKIE_AUTH_DESCRIPTOR,
    buffer_size : UInt32,
    buffer : Win32cr::Foundation::PSTR

  @[Extern]
  record RDR_CALLOUT_STATE,
    last_error : Win32cr::System::Rpc::RPC_STATUS,
    last_ee_info : Void*,
    last_called_stage : Win32cr::System::Rpc::RPC_HTTP_REDIRECTOR_STAGE,
    server_name : UInt16*,
    server_port : UInt16*,
    remote_user : UInt16*,
    auth_type : UInt16*,
    resource_type_present : UInt8,
    session_id_present : UInt8,
    interface_present : UInt8,
    resource_type : LibC::GUID,
    session_id : LibC::GUID,
    interface : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER,
    cert_context : Void*

  @[Extern]
  record I_RpcProxyCallbackInterface,
    is_valid_machine_fn : Win32cr::System::Rpc::I_RpcProxyIsValidMachineFn,
    get_client_address_fn : Win32cr::System::Rpc::I_RpcProxyGetClientAddressFn,
    get_connection_timeout_fn : Win32cr::System::Rpc::I_RpcProxyGetConnectionTimeoutFn,
    perform_callout_fn : Win32cr::System::Rpc::I_RpcPerformCalloutFn,
    free_callout_state_fn : Win32cr::System::Rpc::I_RpcFreeCalloutStateFn,
    get_client_session_and_resource_uuid_fn : Win32cr::System::Rpc::I_RpcProxyGetClientSessionAndResourceUUID,
    proxy_filter_if_fn : Win32cr::System::Rpc::I_RpcProxyFilterIfFn,
    rpc_proxy_update_perf_counter_fn : Win32cr::System::Rpc::I_RpcProxyUpdatePerfCounterFn,
    rpc_proxy_update_perf_counter_backend_server_fn : Win32cr::System::Rpc::I_RpcProxyUpdatePerfCounterBackendServerFn

  @[Extern(union: true)]
  record RPC_ASYNC_NOTIFICATION_INFO,
    apc : APC_e__Struct,
    ioc : IOC_e__Struct,
    int_ptr : IntPtr_e__Struct,
    hEvent : Win32cr::Foundation::HANDLE,
    notification_routine : Win32cr::System::Rpc::PFN_RPCNOTIFICATION_ROUTINE do

    # Nested Type IOC_e__Struct
    @[Extern]
    record IOC_e__Struct,
      hIOPort : Win32cr::Foundation::HANDLE,
      dwNumberOfBytesTransferred : UInt32,
      dwCompletionKey : LibC::UIntPtrT,
      lpOverlapped : Win32cr::System::IO::OVERLAPPED*


    # Nested Type APC_e__Struct
    @[Extern]
    record APC_e__Struct,
      notification_routine : Win32cr::System::Rpc::PFN_RPCNOTIFICATION_ROUTINE,
      hThread : Win32cr::Foundation::HANDLE


    # Nested Type IntPtr_e__Struct
    @[Extern]
    record IntPtr_e__Struct,
      hWnd : Win32cr::Foundation::HWND,
      msg : UInt32

  end

  @[Extern]
  record RPC_ASYNC_STATE,
    size : UInt32,
    signature : UInt32,
    lock : Int32,
    flags : UInt32,
    stub_info : Void*,
    user_info : Void*,
    runtime_info : Void*,
    event : Win32cr::System::Rpc::RPC_ASYNC_EVENT,
    notification_type : Win32cr::System::Rpc::RPC_NOTIFICATION_TYPES,
    u : Win32cr::System::Rpc::RPC_ASYNC_NOTIFICATION_INFO,
    reserved : LibC::IntPtrT[4]

  @[Extern]
  record BinaryParam,
    buffer : Void*,
    size : Int16

  @[Extern]
  record RPC_EE_INFO_PARAM,
    parameter_type : Win32cr::System::Rpc::ExtendedErrorParamTypes,
    u : U_e__union do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      ansi_string : Win32cr::Foundation::PSTR,
      unicode_string : Win32cr::Foundation::PWSTR,
      l_val : Int32,
      s_val : Int16,
      p_val : UInt64,
      b_val : Win32cr::System::Rpc::BinaryParam

  end

  @[Extern]
  record RPC_EXTENDED_ERROR_INFO,
    version : UInt32,
    computer_name : Win32cr::Foundation::PWSTR,
    process_id : UInt32,
    u : U_e__union,
    generating_component : UInt32,
    status : UInt32,
    detection_location : UInt16,
    flags : UInt16,
    number_of_parameters : Int32,
    parameters : Win32cr::System::Rpc::RPC_EE_INFO_PARAM[4] do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      system_time : Win32cr::Foundation::SYSTEMTIME,
      file_time : Win32cr::Foundation::FILETIME

  end

  @[Extern]
  record RPC_ERROR_ENUM_HANDLE,
    signature : UInt32,
    current_pos : Void*,
    head : Void*

  @[Extern]
  record RPC_CALL_LOCAL_ADDRESS_V1,
    version : UInt32,
    buffer : Void*,
    buffer_size : UInt32,
    address_format : Win32cr::System::Rpc::RpcLocalAddressFormat

  @[Extern]
  record RPC_CALL_ATTRIBUTES_V1_W,
    version : UInt32,
    flags : UInt32,
    server_principal_name_buffer_length : UInt32,
    server_principal_name : UInt16*,
    client_principal_name_buffer_length : UInt32,
    client_principal_name : UInt16*,
    authentication_level : UInt32,
    authentication_service : UInt32,
    null_session : Win32cr::Foundation::BOOL

  @[Extern]
  record RPC_CALL_ATTRIBUTES_V1_A,
    version : UInt32,
    flags : UInt32,
    server_principal_name_buffer_length : UInt32,
    server_principal_name : UInt8*,
    client_principal_name_buffer_length : UInt32,
    client_principal_name : UInt8*,
    authentication_level : UInt32,
    authentication_service : UInt32,
    null_session : Win32cr::Foundation::BOOL

  @[Extern]
  record RPC_CALL_ATTRIBUTES_V2_W,
    version : UInt32,
    flags : UInt32,
    server_principal_name_buffer_length : UInt32,
    server_principal_name : UInt16*,
    client_principal_name_buffer_length : UInt32,
    client_principal_name : UInt16*,
    authentication_level : UInt32,
    authentication_service : UInt32,
    null_session : Win32cr::Foundation::BOOL,
    kernel_mode_caller : Win32cr::Foundation::BOOL,
    protocol_sequence : UInt32,
    is_client_local : Win32cr::System::Rpc::RpcCallClientLocality,
    client_pid : Win32cr::Foundation::HANDLE,
    call_status : UInt32,
    call_type : Win32cr::System::Rpc::RpcCallType,
    call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*,
    op_num : UInt16,
    interface_uuid : LibC::GUID

  @[Extern]
  record RPC_CALL_ATTRIBUTES_V2_A,
    version : UInt32,
    flags : UInt32,
    server_principal_name_buffer_length : UInt32,
    server_principal_name : UInt8*,
    client_principal_name_buffer_length : UInt32,
    client_principal_name : UInt8*,
    authentication_level : UInt32,
    authentication_service : UInt32,
    null_session : Win32cr::Foundation::BOOL,
    kernel_mode_caller : Win32cr::Foundation::BOOL,
    protocol_sequence : UInt32,
    is_client_local : UInt32,
    client_pid : Win32cr::Foundation::HANDLE,
    call_status : UInt32,
    call_type : Win32cr::System::Rpc::RpcCallType,
    call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*,
    op_num : UInt16,
    interface_uuid : LibC::GUID

  @[Extern]
  record RPC_CALL_ATTRIBUTES_V3_W,
    version : UInt32,
    flags : UInt32,
    server_principal_name_buffer_length : UInt32,
    server_principal_name : UInt16*,
    client_principal_name_buffer_length : UInt32,
    client_principal_name : UInt16*,
    authentication_level : UInt32,
    authentication_service : UInt32,
    null_session : Win32cr::Foundation::BOOL,
    kernel_mode_caller : Win32cr::Foundation::BOOL,
    protocol_sequence : UInt32,
    is_client_local : Win32cr::System::Rpc::RpcCallClientLocality,
    client_pid : Win32cr::Foundation::HANDLE,
    call_status : UInt32,
    call_type : Win32cr::System::Rpc::RpcCallType,
    call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*,
    op_num : UInt16,
    interface_uuid : LibC::GUID,
    client_identifier_buffer_length : UInt32,
    client_identifier : UInt8*

  @[Extern]
  record RPC_CALL_ATTRIBUTES_V3_A,
    version : UInt32,
    flags : UInt32,
    server_principal_name_buffer_length : UInt32,
    server_principal_name : UInt8*,
    client_principal_name_buffer_length : UInt32,
    client_principal_name : UInt8*,
    authentication_level : UInt32,
    authentication_service : UInt32,
    null_session : Win32cr::Foundation::BOOL,
    kernel_mode_caller : Win32cr::Foundation::BOOL,
    protocol_sequence : UInt32,
    is_client_local : UInt32,
    client_pid : Win32cr::Foundation::HANDLE,
    call_status : UInt32,
    call_type : Win32cr::System::Rpc::RpcCallType,
    call_local_address : Win32cr::System::Rpc::RPC_CALL_LOCAL_ADDRESS_V1*,
    op_num : UInt16,
    interface_uuid : LibC::GUID,
    client_identifier_buffer_length : UInt32,
    client_identifier : UInt8*

  @[Extern]
  record RPC_IMPORT_CONTEXT_P,
    lookup_context : Void*,
    proposed_handle : Void*,
    bindings : Win32cr::System::Rpc::RPC_BINDING_VECTOR*

  @[Extern]
  record NDR_SCONTEXT,
    pad : Void*[2],
    userContext : Void*

  @[Extern]
  record SCONTEXT_QUEUE,
    number_of_objects : UInt32,
    array_of_objects : Win32cr::System::Rpc::NDR_SCONTEXT_1**

  @[Extern]
  record ARRAY_INFO,
    dimension : Int32,
    buffer_conformance_mark : UInt32*,
    buffer_variance_mark : UInt32*,
    max_count_array : UInt32*,
    offset_array : UInt32*,
    actual_count_array : UInt32*

  @[Extern]
  record NDR_ASYNC_MESSAGE
  @[Extern]
  record NDR_CORRELATION_INFO
  @[Extern]
  record NDR_ALLOC_ALL_NODES_CONTEXT
  @[Extern]
  record NDR_POINTER_QUEUE_STATE
  @[Extern]
  record NDR_PROC_CONTEXT
  @[Extern]
  record MIDL_STUB_MESSAGE,
    rpc_msg : Win32cr::System::Rpc::RPC_MESSAGE*,
    buffer : UInt8*,
    buffer_start : UInt8*,
    buffer_end : UInt8*,
    buffer_mark : UInt8*,
    buffer_length : UInt32,
    memory_size : UInt32,
    memory : UInt8*,
    is_client : UInt8,
    pad : UInt8,
    uFlags2 : UInt16,
    reuse_buffer : Int32,
    pAllocAllNodesContext : Win32cr::System::Rpc::NDR_ALLOC_ALL_NODES_CONTEXT*,
    pPointerQueueState : Win32cr::System::Rpc::NDR_POINTER_QUEUE_STATE*,
    ignore_embedded_pointers : Int32,
    pointer_buffer_mark : UInt8*,
    corr_desp_increment : UInt8,
    uFlags : UInt8,
    unique_ptr_count : UInt16,
    max_count : LibC::UIntPtrT,
    offset : UInt32,
    actual_count : UInt32,
    pfnAllocate : LibC::IntPtrT,
    pfnFree : LibC::IntPtrT,
    stack_top : UInt8*,
    pPresentedType : UInt8*,
    pTransmitType : UInt8*,
    saved_handle : Void*,
    stub_desc : Win32cr::System::Rpc::MIDL_STUB_DESC*,
    full_ptr_xlat_tables : Win32cr::System::Rpc::FULL_PTR_XLAT_TABLES*,
    full_ptr_ref_id : UInt32,
    pointer_length : UInt32,
    _bitfield : Int32,
    dwDestContext : UInt32,
    pvDestContext : Void*,
    saved_context_handles : Win32cr::System::Rpc::NDR_SCONTEXT_1**,
    param_number : Int32,
    pRpcChannelBuffer : Void*,
    pArrayInfo : Win32cr::System::Rpc::ARRAY_INFO*,
    size_ptr_count_array : UInt32*,
    size_ptr_offset_array : UInt32*,
    size_ptr_length_array : UInt32*,
    pArgQueue : Void*,
    dwStubPhase : UInt32,
    low_stack_mark : Void*,
    pAsyncMsg : Win32cr::System::Rpc::NDR_ASYNC_MESSAGE*,
    pCorrInfo : Win32cr::System::Rpc::NDR_CORRELATION_INFO*,
    pCorrMemory : UInt8*,
    pMemoryList : Void*,
    pCSInfo : LibC::IntPtrT,
    conformance_mark : UInt8*,
    variance_mark : UInt8*,
    unused : LibC::IntPtrT,
    pContext : Win32cr::System::Rpc::NDR_PROC_CONTEXT*,
    context_handle_hash : Void*,
    pUserMarshalList : Void*,
    reserved51_3 : LibC::IntPtrT,
    reserved51_4 : LibC::IntPtrT,
    reserved51_5 : LibC::IntPtrT

  @[Extern]
  record GENERIC_BINDING_ROUTINE_PAIR,
    pfnBind : Win32cr::System::Rpc::GENERIC_BINDING_ROUTINE,
    pfnUnbind : Win32cr::System::Rpc::GENERIC_UNBIND_ROUTINE

  @[Extern]
  record GENERIC_BINDING_INFO,
    pObj : Void*,
    size : UInt32,
    pfnBind : Win32cr::System::Rpc::GENERIC_BINDING_ROUTINE,
    pfnUnbind : Win32cr::System::Rpc::GENERIC_UNBIND_ROUTINE

  @[Extern]
  record XMIT_ROUTINE_QUINTUPLE,
    pfnTranslateToXmit : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE,
    pfnTranslateFromXmit : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE,
    pfnFreeXmit : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE,
    pfnFreeInst : Win32cr::System::Rpc::XMIT_HELPER_ROUTINE

  @[Extern]
  record USER_MARSHAL_ROUTINE_QUADRUPLE,
    pfnBufferSize : Win32cr::System::Rpc::USER_MARSHAL_SIZING_ROUTINE,
    pfnMarshall : Win32cr::System::Rpc::USER_MARSHAL_MARSHALLING_ROUTINE,
    pfnUnmarshall : Win32cr::System::Rpc::USER_MARSHAL_UNMARSHALLING_ROUTINE,
    pfnFree : Win32cr::System::Rpc::USER_MARSHAL_FREEING_ROUTINE

  @[Extern]
  record USER_MARSHAL_CB,
    flags : UInt32,
    pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*,
    pReserve : UInt8*,
    signature : UInt32,
    cb_type : Win32cr::System::Rpc::USER_MARSHAL_CB_TYPE,
    pFormat : UInt8*,
    pTypeFormat : UInt8*

  @[Extern]
  record MALLOC_FREE_STRUCT,
    pfnAllocate : LibC::IntPtrT,
    pfnFree : LibC::IntPtrT

  @[Extern]
  record COMM_FAULT_OFFSETS,
    comm_offset : Int16,
    fault_offset : Int16

  @[Extern]
  record NDR_CS_SIZE_CONVERT_ROUTINES,
    pfnNetSize : Win32cr::System::Rpc::CS_TYPE_NET_SIZE_ROUTINE,
    pfnToNetCs : Win32cr::System::Rpc::CS_TYPE_TO_NETCS_ROUTINE,
    pfnLocalSize : Win32cr::System::Rpc::CS_TYPE_LOCAL_SIZE_ROUTINE,
    pfnFromNetCs : Win32cr::System::Rpc::CS_TYPE_FROM_NETCS_ROUTINE

  @[Extern]
  record NDR_CS_ROUTINES,
    pSizeConvertRoutines : Win32cr::System::Rpc::NDR_CS_SIZE_CONVERT_ROUTINES*,
    pTagGettingRoutines : Win32cr::System::Rpc::CS_TAG_GETTING_ROUTINE*

  @[Extern]
  record NDR_EXPR_DESC,
    pOffset : UInt16*,
    pFormatExpr : UInt8*

  @[Extern]
  record MIDL_STUB_DESC,
    rpc_interface_information : Void*,
    pfnAllocate : LibC::IntPtrT,
    pfnFree : LibC::IntPtrT,
    implicit_handle_info : IMPLICIT_HANDLE_INFO_e__Union,
    apfnNdrRundownRoutines : Win32cr::System::Rpc::NDR_RUNDOWN*,
    aGenericBindingRoutinePairs : Win32cr::System::Rpc::GENERIC_BINDING_ROUTINE_PAIR*,
    apfnExprEval : Win32cr::System::Rpc::EXPR_EVAL*,
    aXmitQuintuple : Win32cr::System::Rpc::XMIT_ROUTINE_QUINTUPLE*,
    pFormatTypes : UInt8*,
    fCheckBounds : Int32,
    version : UInt32,
    pMallocFreeStruct : Win32cr::System::Rpc::MALLOC_FREE_STRUCT*,
    midl_version : Int32,
    comm_fault_offsets : Win32cr::System::Rpc::COMM_FAULT_OFFSETS*,
    aUserMarshalQuadruple : Win32cr::System::Rpc::USER_MARSHAL_ROUTINE_QUADRUPLE*,
    notify_routine_table : Win32cr::System::Rpc::NDR_NOTIFY_ROUTINE*,
    mFlags : LibC::UIntPtrT,
    cs_routine_tables : Win32cr::System::Rpc::NDR_CS_ROUTINES*,
    proxy_server_info : Void*,
    pExprInfo : Win32cr::System::Rpc::NDR_EXPR_DESC* do

    # Nested Type IMPLICIT_HANDLE_INFO_e__Union
    @[Extern(union: true)]
    record IMPLICIT_HANDLE_INFO_e__Union,
      pAutoHandle : Void**,
      pPrimitiveHandle : Void**,
      pGenericBindingInfo : Win32cr::System::Rpc::GENERIC_BINDING_INFO*

  end

  @[Extern]
  record MIDL_FORMAT_STRING,
    pad : Int16,
    format : UInt8*

  @[Extern]
  record MIDL_METHOD_PROPERTY,
    id : UInt32,
    value : LibC::UIntPtrT

  @[Extern]
  record MIDL_METHOD_PROPERTY_MAP,
    count : UInt32,
    properties : Win32cr::System::Rpc::MIDL_METHOD_PROPERTY*

  @[Extern]
  record MIDL_INTERFACE_METHOD_PROPERTIES,
    method_count : UInt16,
    method_properties : Win32cr::System::Rpc::MIDL_METHOD_PROPERTY_MAP**

  @[Extern]
  record MIDL_SERVER_INFO,
    pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*,
    dispatch_table : Win32cr::System::Rpc::SERVER_ROUTINE*,
    proc_string : UInt8*,
    fmt_string_offset : UInt16*,
    thunk_table : Win32cr::System::Rpc::STUB_THUNK*,
    pTransferSyntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*,
    nCount : LibC::UIntPtrT,
    pSyntaxInfo : Win32cr::System::Rpc::MIDL_SYNTAX_INFO*

  @[Extern]
  record MIDL_STUBLESS_PROXY_INFO,
    pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*,
    proc_format_string : UInt8*,
    format_string_offset : UInt16*,
    pTransferSyntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*,
    nCount : LibC::UIntPtrT,
    pSyntaxInfo : Win32cr::System::Rpc::MIDL_SYNTAX_INFO*

  @[Extern]
  record MIDL_SYNTAX_INFO,
    transfer_syntax : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER,
    dispatch_table : Win32cr::System::Rpc::RPC_DISPATCH_TABLE*,
    proc_string : UInt8*,
    fmt_string_offset : UInt16*,
    type_string : UInt8*,
    aUserMarshalQuadruple : Void*,
    pMethodProperties : Win32cr::System::Rpc::MIDL_INTERFACE_METHOD_PROPERTIES*,
    pReserved2 : LibC::UIntPtrT

  @[Extern(union: true)]
  record CLIENT_CALL_RETURN,
    pointer : Void*,
    simple : LibC::IntPtrT

  @[Extern]
  record FULL_PTR_XLAT_TABLES,
    ref_id_to_pointer : Void*,
    pointer_to_ref_id : Void*,
    next_ref_id : UInt32,
    xlat_side : Win32cr::System::Rpc::XLAT_SIDE

  @[Extern]
  record MIDL_INTERCEPTION_INFO,
    version : UInt32,
    proc_string : UInt8*,
    proc_format_offset_table : UInt16*,
    proc_count : UInt32,
    type_string : UInt8*

  @[Extern]
  record MIDL_WINRT_TYPE_SERIALIZATION_INFO,
    version : UInt32,
    type_format_string : UInt8*,
    format_string_size : UInt16,
    type_offset : UInt16,
    stub_desc : Win32cr::System::Rpc::MIDL_STUB_DESC*

  @[Extern]
  record NDR_USER_MARSHAL_INFO_LEVEL1,
    buffer : Void*,
    buffer_size : UInt32,
    pfnAllocate : LibC::IntPtrT,
    pfnFree : LibC::IntPtrT,
    pRpcChannelBuffer : Void*,
    reserved : LibC::UIntPtrT[5]

  @[Extern]
  record NDR_USER_MARSHAL_INFO,
    information_level : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      level1 : Win32cr::System::Rpc::NDR_USER_MARSHAL_INFO_LEVEL1

  end

  @[Extern]
  record MIDL_TYPE_PICKLING_INFO,
    version : UInt32,
    flags : UInt32,
    reserved : LibC::UIntPtrT[3]

  @[Extern]
  record NDR64_PROC_FLAGS,
    _bitfield : UInt32

  @[Extern]
  record NDR64_RPC_FLAGS,
    _bitfield : UInt16

  @[Extern]
  record NDR64_PROC_FORMAT,
    flags : UInt32,
    stack_size : UInt32,
    constant_client_buffer_size : UInt32,
    constant_server_buffer_size : UInt32,
    rpc_flags : UInt16,
    float_double_mask : UInt16,
    number_of_params : UInt16,
    extension_size : UInt16

  @[Extern]
  record NDR64_PARAM_FLAGS,
    _bitfield : UInt16

  @[Extern]
  record NDR64_PARAM_FORMAT,
    type__ : Void*,
    attributes : Win32cr::System::Rpc::NDR64_PARAM_FLAGS,
    reserved : UInt16,
    stack_offset : UInt32

  @[Extern]
  record NDR64_RANGE_FORMAT,
    format_code : UInt8,
    range_type : UInt8,
    reserved : UInt16,
    min_value : Int64,
    max_value : Int64

  @[Extern]
  record NDR64_CONTEXT_HANDLE_FLAGS,
    _bitfield : UInt8

  @[Extern]
  record NDR64_CONTEXT_HANDLE_FORMAT,
    format_code : UInt8,
    context_flags : UInt8,
    rundown_routine_index : UInt8,
    ordinal : UInt8

  @[Extern]
  record NDR64_BIND_PRIMITIVE,
    handle_type : UInt8,
    flags : UInt8,
    stack_offset : UInt16,
    reserved : UInt16

  @[Extern]
  record NDR64_BIND_GENERIC,
    handle_type : UInt8,
    flags : UInt8,
    stack_offset : UInt16,
    routine_index : UInt8,
    size : UInt8

  @[Extern]
  record NDR64_BIND_CONTEXT,
    handle_type : UInt8,
    flags : UInt8,
    stack_offset : UInt16,
    routine_index : UInt8,
    ordinal : UInt8

  @[Extern(union: true)]
  record NDR64_BINDINGS,
    primitive : Win32cr::System::Rpc::NDR64_BIND_PRIMITIVE,
    generic : Win32cr::System::Rpc::NDR64_BIND_GENERIC,
    context : Win32cr::System::Rpc::NDR64_BIND_CONTEXT

  @[Extern]
  record NDR64_BIND_AND_NOTIFY_EXTENSION,
    binding : Win32cr::System::Rpc::NDR64_BIND_CONTEXT,
    notify_index : UInt16

  @[Extern]
  record NDR64_SYSTEM_HANDLE_FORMAT,
    format_code : UInt8,
    handle_type : UInt8,
    desired_access : UInt32

  @[Extern]
  record NDR64_POINTER_FORMAT,
    format_code : UInt8,
    flags : UInt8,
    reserved : UInt16,
    pointee : Void*

  @[Extern]
  record NDR64_NO_REPEAT_FORMAT,
    format_code : UInt8,
    flags : UInt8,
    reserved1 : UInt16,
    reserved2 : UInt32

  @[Extern]
  record NDR64_POINTER_INSTANCE_HEADER_FORMAT,
    offset : UInt32,
    reserved : UInt32

  @[Extern]
  record NDR64_POINTER_REPEAT_FLAGS,
    _bitfield : UInt8

  @[Extern]
  record NDR64_REPEAT_FORMAT,
    format_code : UInt8,
    flags : Win32cr::System::Rpc::NDR64_POINTER_REPEAT_FLAGS,
    reserved : UInt16,
    increment : UInt32,
    offset_to_array : UInt32,
    number_of_pointers : UInt32

  @[Extern]
  record NDR64_FIXED_REPEAT_FORMAT,
    repeat_format : Win32cr::System::Rpc::NDR64_REPEAT_FORMAT,
    iterations : UInt32,
    reserved : UInt32

  @[Extern]
  record NDR64_IID_FLAGS,
    _bitfield : UInt8

  @[Extern]
  record NDR64_CONSTANT_IID_FORMAT,
    format_code : UInt8,
    flags : UInt8,
    reserved : UInt16,
    guid : LibC::GUID

  @[Extern]
  record NDR64_IID_FORMAT,
    format_code : UInt8,
    flags : UInt8,
    reserved : UInt16,
    iid_descriptor : Void*

  @[Extern]
  record NDR64_STRUCTURE_FLAGS,
    _bitfield : UInt8

  @[Extern]
  record NDR64_STRUCTURE_HEADER_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS,
    reserve : UInt8,
    memory_size : UInt32

  @[Extern]
  record NDR64_CONF_STRUCTURE_HEADER_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS,
    reserve : UInt8,
    memory_size : UInt32,
    array_description : Void*

  @[Extern]
  record NDR64_BOGUS_STRUCTURE_HEADER_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS,
    reserve : UInt8,
    memory_size : UInt32,
    original_member_layout : Void*,
    original_pointer_layout : Void*,
    pointer_layout : Void*

  @[Extern]
  record NDR64_CONF_BOGUS_STRUCTURE_HEADER_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    flags : Win32cr::System::Rpc::NDR64_STRUCTURE_FLAGS,
    dimensions : UInt8,
    memory_size : UInt32,
    original_member_layout : Void*,
    original_pointer_layout : Void*,
    pointer_layout : Void*,
    conf_array_description : Void*

  @[Extern]
  record NDR64_SIMPLE_MEMBER_FORMAT,
    format_code : UInt8,
    reserved1 : UInt8,
    reserved2 : UInt16,
    reserved3 : UInt32

  @[Extern]
  record NDR64_MEMPAD_FORMAT,
    format_code : UInt8,
    reserve1 : UInt8,
    mem_pad : UInt16,
    reserved2 : UInt32

  @[Extern]
  record NDR64_EMBEDDED_COMPLEX_FORMAT,
    format_code : UInt8,
    reserve1 : UInt8,
    reserve2 : UInt16,
    type__ : Void*

  @[Extern]
  record NDR64_BUFFER_ALIGN_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    reserved : UInt16,
    reserved2 : UInt32

  @[Extern]
  record NDR64_SIMPLE_REGION_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    region_size : UInt16,
    reserved : UInt32

  @[Extern]
  record NDR64_ENCAPSULATED_UNION,
    format_code : UInt8,
    alignment : UInt8,
    flags : UInt8,
    switch_type : UInt8,
    memory_offset : UInt32,
    memory_size : UInt32,
    reserved : UInt32

  @[Extern]
  record NDR64_NON_ENCAPSULATED_UNION,
    format_code : UInt8,
    alignment : UInt8,
    flags : UInt8,
    switch_type : UInt8,
    memory_size : UInt32,
    switch : Void*,
    reserved : UInt32

  @[Extern]
  record NDR64_UNION_ARM_SELECTOR,
    reserved1 : UInt8,
    alignment : UInt8,
    reserved2 : UInt16,
    arms : UInt32

  @[Extern]
  record NDR64_UNION_ARM,
    case_value : Int64,
    type__ : Void*,
    reserved : UInt32

  @[Extern]
  record NDR64_ARRAY_FLAGS,
    _bitfield : UInt8

  @[Extern]
  record NDR64_ARRAY_ELEMENT_INFO,
    element_mem_size : UInt32,
    element : Void*

  @[Extern]
  record NDR64_FIX_ARRAY_HEADER_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS,
    reserved : UInt8,
    total_size : UInt32

  @[Extern]
  record NDR64_CONF_ARRAY_HEADER_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS,
    reserved : UInt8,
    element_size : UInt32,
    conf_descriptor : Void*

  @[Extern]
  record NDR64_CONF_VAR_ARRAY_HEADER_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS,
    reserved : UInt8,
    element_size : UInt32,
    conf_descriptor : Void*,
    var_descriptor : Void*

  @[Extern]
  record NDR64_VAR_ARRAY_HEADER_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS,
    reserved : UInt8,
    total_size : UInt32,
    element_size : UInt32,
    var_descriptor : Void*

  @[Extern]
  record NDR64_BOGUS_ARRAY_HEADER_FORMAT,
    format_code : UInt8,
    alignment : UInt8,
    flags : Win32cr::System::Rpc::NDR64_ARRAY_FLAGS,
    number_dims : UInt8,
    number_elements : UInt32,
    element : Void*

  @[Extern]
  record NDR64_CONF_VAR_BOGUS_ARRAY_HEADER_FORMAT,
    fixed_array_format : Win32cr::System::Rpc::NDR64_BOGUS_ARRAY_HEADER_FORMAT,
    conf_description : Void*,
    var_description : Void*,
    offset_description : Void*

  @[Extern]
  record NDR64_STRING_FLAGS,
    _bitfield : UInt8

  @[Extern]
  record NDR64_STRING_HEADER_FORMAT,
    format_code : UInt8,
    flags : Win32cr::System::Rpc::NDR64_STRING_FLAGS,
    element_size : UInt16

  @[Extern]
  record NDR64_NON_CONFORMANT_STRING_FORMAT,
    header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT,
    total_size : UInt32

  @[Extern]
  record NDR64_RANGED_STRING_FORMAT,
    header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT,
    reserved : UInt32,
    min : UInt64,
    max : UInt64

  @[Extern]
  record NDR64_CONFORMANT_STRING_FORMAT,
    header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT

  @[Extern]
  record NDR64_SIZED_CONFORMANT_STRING_FORMAT,
    header : Win32cr::System::Rpc::NDR64_STRING_HEADER_FORMAT,
    size_description : Void*

  @[Extern]
  record NDR64_EXPR_OPERATOR,
    expr_type : UInt8,
    operator : UInt8,
    cast_type : UInt8,
    reserved : UInt8

  @[Extern]
  record NDR64_EXPR_CONST32,
    expr_type : UInt8,
    reserved : UInt8,
    reserved1 : UInt16,
    const_value : UInt32

  @[Extern]
  record NDR64_EXPR_CONST64,
    expr_type : UInt8,
    reserved : UInt8,
    reserved1 : UInt16,
    const_value : Int64

  @[Extern]
  record NDR64_EXPR_VAR,
    expr_type : UInt8,
    var_type : UInt8,
    reserved : UInt16,
    offset : UInt32

  @[Extern]
  record NDR64_EXPR_NOOP,
    expr_type : UInt8,
    size : UInt8,
    reserved : UInt16

  @[Extern]
  record NDR64_TRANSMIT_AS_FLAGS,
    _bitfield : UInt8

  @[Extern]
  record NDR64_TRANSMIT_AS_FORMAT,
    format_code : UInt8,
    flags : UInt8,
    routine_index : UInt16,
    transmitted_type_wire_alignment : UInt16,
    memory_alignment : UInt16,
    presented_type_memory_size : UInt32,
    transmitted_type_buffer_size : UInt32,
    transmitted_type : Void*

  @[Extern]
  record NDR64_USER_MARSHAL_FLAGS,
    _bitfield : UInt8

  @[Extern]
  record NDR64_USER_MARSHAL_FORMAT,
    format_code : UInt8,
    flags : UInt8,
    routine_index : UInt16,
    transmitted_type_wire_alignment : UInt16,
    memory_alignment : UInt16,
    user_type_memory_size : UInt32,
    transmitted_type_buffer_size : UInt32,
    transmitted_type : Void*

  @[Extern]
  record NDR64_PIPE_FLAGS,
    _bitfield : UInt8

  @[Extern]
  record NDR64_PIPE_FORMAT,
    format_code : UInt8,
    flags : UInt8,
    alignment : UInt8,
    reserved : UInt8,
    type__ : Void*,
    memory_size : UInt32,
    buffer_size : UInt32

  @[Extern]
  record NDR64_RANGE_PIPE_FORMAT,
    format_code : UInt8,
    flags : UInt8,
    alignment : UInt8,
    reserved : UInt8,
    type__ : Void*,
    memory_size : UInt32,
    buffer_size : UInt32,
    min_value : UInt32,
    max_value : UInt32

  @[Extern]
  record NDR64_TYPE_STRICT_CONTEXT_HANDLE,
    format_code : UInt8,
    real_format_code : UInt8,
    reserved : UInt16,
    type__ : Void*,
    ctxt_flags : UInt32,
    ctxt_id : UInt32

  @[Link("rpcrt4")]
  @[Link("rpcns4")]
  lib C
    fun IUnknown_QueryInterface_Proxy(this : Void*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT

    fun IUnknown_AddRef_Proxy(this : Void*) : UInt32

    fun IUnknown_Release_Proxy(this : Void*) : UInt32

    fun RpcBindingCopy(source_binding : Void*, destination_binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingFree(binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingSetOption(hBinding : Void*, option : UInt32, optionValue : LibC::UIntPtrT) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqOption(hBinding : Void*, option : UInt32, pOptionValue : LibC::UIntPtrT*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingFromStringBindingA(string_binding : UInt8*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingFromStringBindingW(string_binding : UInt16*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSsGetContextBinding(context_handle : Void*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqMaxCalls(binding : Void*, max_calls : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqObject(binding : Void*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingReset(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingSetObject(binding : Void*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtInqDefaultProtectLevel(authn_svc : UInt32, authn_level : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingToStringBindingA(binding : Void*, string_binding : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingToStringBindingW(binding : Void*, string_binding : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingVectorFree(binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcStringBindingComposeA(obj_uuid : UInt8*, prot_seq : UInt8*, network_addr : UInt8*, endpoint : UInt8*, options : UInt8*, string_binding : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcStringBindingComposeW(obj_uuid : UInt16*, prot_seq : UInt16*, network_addr : UInt16*, endpoint : UInt16*, options : UInt16*, string_binding : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcStringBindingParseA(string_binding : UInt8*, obj_uuid : UInt8**, protseq : UInt8**, network_addr : UInt8**, endpoint : UInt8**, network_options : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcStringBindingParseW(string_binding : UInt16*, obj_uuid : UInt16**, protseq : UInt16**, network_addr : UInt16**, endpoint : UInt16**, network_options : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcStringFreeA(string : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcStringFreeW(string : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcIfInqId(rpc_if_handle : Void*, rpc_if_id : Win32cr::System::Rpc::RPC_IF_ID*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNetworkIsProtseqValidA(protseq : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNetworkIsProtseqValidW(protseq : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtInqComTimeout(binding : Void*, timeout : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtSetComTimeout(binding : Void*, timeout : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtSetCancelTimeout(timeout : Int32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNetworkInqProtseqsA(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORA**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNetworkInqProtseqsW(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORW**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcObjectInqType(obj_uuid : LibC::GUID*, type_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcObjectSetInqFn(inquiry_fn : Win32cr::System::Rpc::RPC_OBJECT_INQ_FN) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcObjectSetType(obj_uuid : LibC::GUID*, type_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcProtseqVectorFreeA(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORA**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcProtseqVectorFreeW(protseq_vector : Win32cr::System::Rpc::RPC_PROTSEQ_VECTORW**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInqBindings(binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInqBindingsEx(security_descriptor : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInqIf(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerListen(minimum_call_threads : UInt32, max_calls : UInt32, dont_wait : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerRegisterIf(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerRegisterIfEx(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*, flags : UInt32, max_calls : UInt32, if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerRegisterIf2(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*, flags : UInt32, max_calls : UInt32, max_rpc_size : UInt32, if_callback_fn : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerRegisterIf3(if_spec : Void*, mgr_type_uuid : LibC::GUID*, mgr_epv : Void*, flags : UInt32, max_calls : UInt32, max_rpc_size : UInt32, if_callback : Win32cr::System::Rpc::RPC_IF_CALLBACK_FN, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUnregisterIf(if_spec : Void*, mgr_type_uuid : LibC::GUID*, wait_for_calls_to_complete : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUnregisterIfEx(if_spec : Void*, mgr_type_uuid : LibC::GUID*, rundown_context_handles : Int32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseAllProtseqs(max_calls : UInt32, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseAllProtseqsEx(max_calls : UInt32, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseAllProtseqsIf(max_calls : UInt32, if_spec : Void*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseAllProtseqsIfEx(max_calls : UInt32, if_spec : Void*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqA(protseq : UInt8*, max_calls : UInt32, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqExA(protseq : UInt8*, max_calls : UInt32, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqW(protseq : UInt16*, max_calls : UInt32, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqExW(protseq : UInt16*, max_calls : UInt32, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqEpA(protseq : UInt8*, max_calls : UInt32, endpoint : UInt8*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqEpExA(protseq : UInt8*, max_calls : UInt32, endpoint : UInt8*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqEpW(protseq : UInt16*, max_calls : UInt32, endpoint : UInt16*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqEpExW(protseq : UInt16*, max_calls : UInt32, endpoint : UInt16*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqIfA(protseq : UInt8*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqIfExA(protseq : UInt8*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqIfW(protseq : UInt16*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUseProtseqIfExW(protseq : UInt16*, max_calls : UInt32, if_spec : Void*, security_descriptor : Void*, policy : Win32cr::System::Rpc::RPC_POLICY*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerYield : Void

    fun RpcMgmtStatsVectorFree(stats_vector : Win32cr::System::Rpc::RPC_STATS_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtInqStats(binding : Void*, statistics : Win32cr::System::Rpc::RPC_STATS_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtIsServerListening(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtStopServerListening(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtWaitServerListen : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtSetServerStackSize(thread_stack_size : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSsDontSerializeContext : Void

    fun RpcMgmtEnableIdleCleanup : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtInqIfIds(binding : Void*, if_id_vector : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcIfIdVectorFree(if_id_vector : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtInqServerPrincNameA(binding : Void*, authn_svc : UInt32, server_princ_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtInqServerPrincNameW(binding : Void*, authn_svc : UInt32, server_princ_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInqDefaultPrincNameA(authn_svc : UInt32, princ_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInqDefaultPrincNameW(authn_svc : UInt32, princ_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcEpResolveBinding(binding : Void*, if_spec : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingInqEntryNameA(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingInqEntryNameW(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingCreateA(template : Win32cr::System::Rpc::RPC_BINDING_HANDLE_TEMPLATE_V1_A*, security : Win32cr::System::Rpc::RPC_BINDING_HANDLE_SECURITY_V1_A*, options : Win32cr::System::Rpc::RPC_BINDING_HANDLE_OPTIONS_V1*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingCreateW(template : Win32cr::System::Rpc::RPC_BINDING_HANDLE_TEMPLATE_V1_W*, security : Win32cr::System::Rpc::RPC_BINDING_HANDLE_SECURITY_V1_W*, options : Win32cr::System::Rpc::RPC_BINDING_HANDLE_OPTIONS_V1*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInqBindingHandle(binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcImpersonateClient(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcImpersonateClient2(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcRevertToSelfEx(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcRevertToSelf : Win32cr::System::Rpc::RPC_STATUS

    fun RpcImpersonateClientContainer(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcRevertContainerImpersonation : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqAuthClientA(client_binding : Void*, privs : Void**, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqAuthClientW(client_binding : Void*, privs : Void**, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqAuthClientExA(client_binding : Void*, privs : Void**, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*, flags : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqAuthClientExW(client_binding : Void*, privs : Void**, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, authz_svc : UInt32*, flags : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqAuthInfoA(binding : Void*, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqAuthInfoW(binding : Void*, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingSetAuthInfoA(binding : Void*, server_princ_name : UInt8*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingSetAuthInfoExA(binding : Void*, server_princ_name : UInt8*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingSetAuthInfoW(binding : Void*, server_princ_name : UInt16*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingSetAuthInfoExW(binding : Void*, server_princ_name : UInt16*, authn_level : UInt32, authn_svc : UInt32, auth_identity : Void*, authz_svc : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqAuthInfoExA(binding : Void*, server_princ_name : UInt8**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*, rpc_qos_version : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingInqAuthInfoExW(binding : Void*, server_princ_name : UInt16**, authn_level : UInt32*, authn_svc : UInt32*, auth_identity : Void**, authz_svc : UInt32*, rpc_qos_version : UInt32, security_qos : Win32cr::System::Rpc::RPC_SECURITY_QOS*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerCompleteSecurityCallback(binding_handle : Void*, status : Win32cr::System::Rpc::RPC_STATUS) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerRegisterAuthInfoA(server_princ_name : UInt8*, authn_svc : UInt32, get_key_fn : Win32cr::System::Rpc::RPC_AUTH_KEY_RETRIEVAL_FN, arg : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerRegisterAuthInfoW(server_princ_name : UInt16*, authn_svc : UInt32, get_key_fn : Win32cr::System::Rpc::RPC_AUTH_KEY_RETRIEVAL_FN, arg : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingServerFromClient(client_binding : Void*, server_binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcRaiseException(exception : Win32cr::System::Rpc::RPC_STATUS) : Void

    fun RpcTestCancel : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerTestCancel(binding_handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcCancelThread(thread : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcCancelThreadEx(thread : Void*, timeout : Int32) : Win32cr::System::Rpc::RPC_STATUS

    fun UuidCreate(uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun UuidCreateSequential(uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun UuidToStringA(uuid : LibC::GUID*, string_uuid : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun UuidFromStringA(string_uuid : UInt8*, uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun UuidToStringW(uuid : LibC::GUID*, string_uuid : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun UuidFromStringW(string_uuid : UInt16*, uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun UuidCompare(uuid1 : LibC::GUID*, uuid2 : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : Int32

    fun UuidCreateNil(nil_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun UuidEqual(uuid1 : LibC::GUID*, uuid2 : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : Int32

    fun UuidHash(uuid : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : UInt16

    fun UuidIsNil(uuid : LibC::GUID*, status : Win32cr::System::Rpc::RPC_STATUS*) : Int32

    fun RpcEpRegisterNoReplaceA(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcEpRegisterNoReplaceW(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcEpRegisterA(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcEpRegisterW(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*, annotation__ : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcEpUnregister(if_spec : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, uuid_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun DceErrorInqTextA(rpc_status : Win32cr::System::Rpc::RPC_STATUS, error_text : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun DceErrorInqTextW(rpc_status : Win32cr::System::Rpc::RPC_STATUS, error_text : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtEpEltInqBegin(ep_binding : Void*, inquiry_type : UInt32, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, object_uuid : LibC::GUID*, inquiry_context : Void***) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtEpEltInqDone(inquiry_context : Void***) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtEpEltInqNextA(inquiry_context : Void**, if_id : Win32cr::System::Rpc::RPC_IF_ID*, binding : Void**, object_uuid : LibC::GUID*, annotation__ : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtEpEltInqNextW(inquiry_context : Void**, if_id : Win32cr::System::Rpc::RPC_IF_ID*, binding : Void**, object_uuid : LibC::GUID*, annotation__ : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtEpUnregister(ep_binding : Void*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, binding : Void*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcMgmtSetAuthorizationFn(authorization_fn : Win32cr::System::Rpc::RPC_MGMT_AUTHORIZATION_FN) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcExceptionFilter(exception_code : UInt32) : Int32

    fun RpcServerInterfaceGroupCreateW(interfaces : Win32cr::System::Rpc::RPC_INTERFACE_TEMPLATEW*, num_ifs : UInt32, endpoints : Win32cr::System::Rpc::RPC_ENDPOINT_TEMPLATEW*, num_endpoints : UInt32, idle_period : UInt32, idle_callback_fn : Win32cr::System::Rpc::RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN, idle_callback_context : Void*, if_group : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInterfaceGroupCreateA(interfaces : Win32cr::System::Rpc::RPC_INTERFACE_TEMPLATEA*, num_ifs : UInt32, endpoints : Win32cr::System::Rpc::RPC_ENDPOINT_TEMPLATEA*, num_endpoints : UInt32, idle_period : UInt32, idle_callback_fn : Win32cr::System::Rpc::RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN, idle_callback_context : Void*, if_group : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInterfaceGroupClose(if_group : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInterfaceGroupActivate(if_group : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInterfaceGroupDeactivate(if_group : Void*, force_deactivation : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInterfaceGroupInqBindings(if_group : Void*, binding_vector : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcNegotiateTransferSyntax(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcGetBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcGetBufferWithObject(message : Win32cr::System::Rpc::RPC_MESSAGE*, object_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcSendReceive(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcFreeBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcSend(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcReceive(message : Win32cr::System::Rpc::RPC_MESSAGE*, size : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcFreePipeBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcReallocPipeBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*, new_size : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcRequestMutex(mutex : Void**) : Void

    fun I_RpcClearMutex(mutex : Void*) : Void

    fun I_RpcDeleteMutex(mutex : Void*) : Void

    fun I_RpcAllocate(size : UInt32) : Void*

    fun I_RpcFree(object : Void*) : Void

    fun I_RpcPauseExecution(milliseconds : UInt32) : Void

    fun I_RpcGetExtendedError : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcSystemHandleTypeSpecificWork(handle : Void*, actual_type : UInt8, idl_type : UInt8, marshal_direction : Win32cr::System::Rpc::LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcGetCurrentCallHandle : Void*

    fun I_RpcNsInterfaceExported(entry_name_syntax : UInt32, entry_name : UInt16*, rpc_interface_information : Win32cr::System::Rpc::RPC_SERVER_INTERFACE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcNsInterfaceUnexported(entry_name_syntax : UInt32, entry_name : UInt16*, rpc_interface_information : Win32cr::System::Rpc::RPC_SERVER_INTERFACE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingToStaticStringBindingW(binding : Void*, string_binding : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingInqSecurityContext(binding : Void*, security_context_handle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingInqSecurityContextKeyInfo(binding : Void*, key_info : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingInqWireIdForSnego(binding : Void*, wire_id : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingInqMarshalledTargetInfo(binding : Void*, marshalled_target_info_size : UInt32*, marshalled_target_info : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingInqLocalClientPID(binding : Void*, pid : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingHandleToAsyncHandle(binding : Void*, async_handle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcNsBindingSetEntryNameW(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcNsBindingSetEntryNameA(binding : Void*, entry_name_syntax : UInt32, entry_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerUseProtseqEp2A(network_address : UInt8*, protseq : UInt8*, max_calls : UInt32, endpoint : UInt8*, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerUseProtseqEp2W(network_address : UInt16*, protseq : UInt16*, max_calls : UInt32, endpoint : UInt16*, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerUseProtseq2W(network_address : UInt16*, protseq : UInt16*, max_calls : UInt32, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerUseProtseq2A(network_address : UInt8*, protseq : UInt8*, max_calls : UInt32, security_descriptor : Void*, policy : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerStartService(protseq : UInt16*, endpoint : UInt16*, if_spec : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingInqDynamicEndpointW(binding : Void*, dynamic_endpoint : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingInqDynamicEndpointA(binding : Void*, dynamic_endpoint : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerCheckClientRestriction(context : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingInqTransportType(binding : Void*, type__ : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcIfInqTransferSyntaxes(rpc_if_handle : Void*, transfer_syntaxes : Win32cr::System::Rpc::RPC_TRANSFER_SYNTAX*, transfer_syntax_size : UInt32, transfer_syntax_count : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_UuidCreate(uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingCopy(source_binding : Void*, destination_binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingIsClientLocal(binding_handle : Void*, client_local_flag : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingCreateNP(server_name : UInt16*, service_name : UInt16*, network_options : UInt16*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcSsDontSerializeContext : Void

    fun I_RpcServerRegisterForwardFunction(pForwardFunction : Win32cr::System::Rpc::RPC_FORWARD_FUNCTION*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerInqAddressChangeFn : Win32cr::System::Rpc::RPC_ADDRESS_CHANGE_FN*

    fun I_RpcServerSetAddressChangeFn(pAddressChangeFn : Win32cr::System::Rpc::RPC_ADDRESS_CHANGE_FN*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerInqLocalConnAddress(binding : Void*, buffer : Void*, buffer_size : UInt32*, address_format : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerInqRemoteConnAddress(binding : Void*, buffer : Void*, buffer_size : UInt32*, address_format : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcSessionStrictContextHandle : Void

    fun I_RpcTurnOnEEInfoPropagation : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerInqTransportType(type__ : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcMapWin32Status(status : Win32cr::System::Rpc::RPC_STATUS) : Int32

    fun I_RpcRecordCalloutFailure(rpc_status : Win32cr::System::Rpc::RPC_STATUS, call_out_state : Win32cr::System::Rpc::RDR_CALLOUT_STATE*, dll_name : UInt16*) : Void

    fun I_RpcMgmtEnableDedicatedThreadPool : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcGetDefaultSD(ppSecurityDescriptor : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcOpenClientProcess(binding : Void*, desired_access : UInt32, client_process : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingIsServerLocal(binding : Void*, server_local_flag : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcBindingSetPrivateOption(hBinding : Void*, option : UInt32, optionValue : LibC::UIntPtrT) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerSubscribeForDisconnectNotification(binding : Void*, hEvent : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerGetAssociationID(binding : Void*, association_id : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerDisableExceptionFilter : Int32

    fun I_RpcServerSubscribeForDisconnectNotification2(binding : Void*, hEvent : Void*, subscription_id : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcServerUnsubscribeForDisconnectNotification(binding : Void*, subscription_id : LibC::GUID) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingExportA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingUnexportA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingExportW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingUnexportW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingExportPnPA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingUnexportPnPA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingExportPnPW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingUnexportPnPW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, object_vector : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingLookupBeginA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, obj_uuid : LibC::GUID*, binding_max_count : UInt32, lookup_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingLookupBeginW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, obj_uuid : LibC::GUID*, binding_max_count : UInt32, lookup_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingLookupNext(lookup_context : Void*, binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingLookupDone(lookup_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupDeleteA(group_name_syntax : Win32cr::System::Rpc::GROUP_NAME_SYNTAX, group_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupMbrAddA(group_name_syntax : UInt32, group_name : UInt8*, member_name_syntax : UInt32, member_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupMbrRemoveA(group_name_syntax : UInt32, group_name : UInt8*, member_name_syntax : UInt32, member_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupMbrInqBeginA(group_name_syntax : UInt32, group_name : UInt8*, member_name_syntax : UInt32, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupMbrInqNextA(inquiry_context : Void*, member_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupDeleteW(group_name_syntax : Win32cr::System::Rpc::GROUP_NAME_SYNTAX, group_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupMbrAddW(group_name_syntax : UInt32, group_name : UInt16*, member_name_syntax : UInt32, member_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupMbrRemoveW(group_name_syntax : UInt32, group_name : UInt16*, member_name_syntax : UInt32, member_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupMbrInqBeginW(group_name_syntax : UInt32, group_name : UInt16*, member_name_syntax : UInt32, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupMbrInqNextW(inquiry_context : Void*, member_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsGroupMbrInqDone(inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileDeleteA(profile_name_syntax : UInt32, profile_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileEltAddA(profile_name_syntax : UInt32, profile_name : UInt8*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt8*, priority : UInt32, annotation__ : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileEltRemoveA(profile_name_syntax : UInt32, profile_name : UInt8*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileEltInqBeginA(profile_name_syntax : UInt32, profile_name : UInt8*, inquiry_type : UInt32, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, member_name_syntax : UInt32, member_name : UInt8*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileEltInqNextA(inquiry_context : Void*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name : UInt8**, priority : UInt32*, annotation__ : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileDeleteW(profile_name_syntax : UInt32, profile_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileEltAddW(profile_name_syntax : UInt32, profile_name : UInt16*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt16*, priority : UInt32, annotation__ : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileEltRemoveW(profile_name_syntax : UInt32, profile_name : UInt16*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name_syntax : UInt32, member_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileEltInqBeginW(profile_name_syntax : UInt32, profile_name : UInt16*, inquiry_type : UInt32, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, member_name_syntax : UInt32, member_name : UInt16*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileEltInqNextW(inquiry_context : Void*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, member_name : UInt16**, priority : UInt32*, annotation__ : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsProfileEltInqDone(inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsEntryObjectInqBeginA(entry_name_syntax : UInt32, entry_name : UInt8*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsEntryObjectInqBeginW(entry_name_syntax : UInt32, entry_name : UInt16*, inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsEntryObjectInqNext(inquiry_context : Void*, obj_uuid : LibC::GUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsEntryObjectInqDone(inquiry_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsEntryExpandNameA(entry_name_syntax : UInt32, entry_name : UInt8*, expanded_name : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtBindingUnexportA(entry_name_syntax : UInt32, entry_name : UInt8*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtEntryCreateA(entry_name_syntax : UInt32, entry_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtEntryDeleteA(entry_name_syntax : UInt32, entry_name : UInt8*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtEntryInqIfIdsA(entry_name_syntax : UInt32, entry_name : UInt8*, if_id_vec : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtHandleSetExpAge(ns_handle : Void*, expiration_age : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtInqExpAge(expiration_age : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtSetExpAge(expiration_age : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsEntryExpandNameW(entry_name_syntax : UInt32, entry_name : UInt16*, expanded_name : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtBindingUnexportW(entry_name_syntax : UInt32, entry_name : UInt16*, if_id : Win32cr::System::Rpc::RPC_IF_ID*, vers_option : UInt32, object_uuid_vec : Win32cr::System::Rpc::UUID_VECTOR*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtEntryCreateW(entry_name_syntax : UInt32, entry_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtEntryDeleteW(entry_name_syntax : UInt32, entry_name : UInt16*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsMgmtEntryInqIfIdsW(entry_name_syntax : UInt32, entry_name : UInt16*, if_id_vec : Win32cr::System::Rpc::RPC_IF_ID_VECTOR**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingImportBeginA(entry_name_syntax : UInt32, entry_name : UInt8*, if_spec : Void*, obj_uuid : LibC::GUID*, import_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingImportBeginW(entry_name_syntax : UInt32, entry_name : UInt16*, if_spec : Void*, obj_uuid : LibC::GUID*, import_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingImportNext(import_context : Void*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingImportDone(import_context : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcNsBindingSelect(binding_vec : Win32cr::System::Rpc::RPC_BINDING_VECTOR*, binding : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcAsyncRegisterInfo(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcAsyncInitializeHandle(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, size : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcAsyncGetCallStatus(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcAsyncCompleteCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, reply : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcAsyncAbortCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, exception_code : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcAsyncCancelCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, fAbort : Win32cr::Foundation::BOOL) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcErrorStartEnumeration(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcErrorGetNextRecord(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*, copy_strings : Win32cr::Foundation::BOOL, error_info : Win32cr::System::Rpc::RPC_EXTENDED_ERROR_INFO*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcErrorEndEnumeration(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcErrorResetEnumeration(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcErrorGetNumberOfRecords(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*, records : Int32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcErrorSaveErrorInfo(enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*, error_blob : Void**, blob_size : LibC::UIntPtrT*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcErrorLoadErrorInfo(error_blob : Void*, blob_size : LibC::UIntPtrT, enum_handle : Win32cr::System::Rpc::RPC_ERROR_ENUM_HANDLE*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcErrorAddRecord(error_info : Win32cr::System::Rpc::RPC_EXTENDED_ERROR_INFO*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcErrorClearInformation : Void

    fun RpcGetAuthorizationContextForClient(client_binding : Void*, impersonate_on_return : Win32cr::Foundation::BOOL, reserved1 : Void*, pExpirationTime : Win32cr::Foundation::LARGE_INTEGER*, reserved2 : Win32cr::Foundation::LUID, reserved3 : UInt32, reserved4 : Void*, pAuthzClientContext : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcFreeAuthorizationContext(pAuthzClientContext : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSsContextLockExclusive(server_binding_handle : Void*, user_context : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSsContextLockShared(server_binding_handle : Void*, user_context : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInqCallAttributesW(client_binding : Void*, rpc_call_attributes : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerInqCallAttributesA(client_binding : Void*, rpc_call_attributes : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerSubscribeForNotification(binding : Void*, notification : Win32cr::System::Rpc::RPC_NOTIFICATIONS, notification_type : Win32cr::System::Rpc::RPC_NOTIFICATION_TYPES, notification_info : Win32cr::System::Rpc::RPC_ASYNC_NOTIFICATION_INFO*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcServerUnsubscribeForNotification(binding : Void*, notification : Win32cr::System::Rpc::RPC_NOTIFICATIONS, notifications_queued : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingBind(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, binding : Void*, if_spec : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcBindingUnbind(binding : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcAsyncSetHandle(message : Win32cr::System::Rpc::RPC_MESSAGE*, pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcAsyncAbortCall(pAsync : Win32cr::System::Rpc::RPC_ASYNC_STATE*, exception_code : UInt32) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcExceptionFilter(exception_code : UInt32) : Int32

    fun I_RpcBindingInqClientTokenAttributes(binding : Void*, token_id : Win32cr::Foundation::LUID*, authentication_id : Win32cr::Foundation::LUID*, modified_id : Win32cr::Foundation::LUID*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcNsGetBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcNsSendReceive(message : Win32cr::System::Rpc::RPC_MESSAGE*, handle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun I_RpcNsRaiseException(message : Win32cr::System::Rpc::RPC_MESSAGE*, status : Win32cr::System::Rpc::RPC_STATUS) : Void

    fun I_RpcReBindBuffer(message : Win32cr::System::Rpc::RPC_MESSAGE*) : Win32cr::System::Rpc::RPC_STATUS

    fun NDRCContextBinding(c_context : LibC::IntPtrT) : Void*

    fun NDRCContextMarshall(c_context : LibC::IntPtrT, pBuff : Void*) : Void

    fun NDRCContextUnmarshall(pCContext : LibC::IntPtrT*, hBinding : Void*, pBuff : Void*, data_representation : UInt32) : Void

    fun NDRSContextMarshall(c_context : Win32cr::System::Rpc::NDR_SCONTEXT_1*, pBuff : Void*, userRunDownIn : Win32cr::System::Rpc::NDR_RUNDOWN) : Void

    fun NDRSContextUnmarshall(pBuff : Void*, data_representation : UInt32) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    fun NDRSContextMarshallEx(binding_handle : Void*, c_context : Win32cr::System::Rpc::NDR_SCONTEXT_1*, pBuff : Void*, userRunDownIn : Win32cr::System::Rpc::NDR_RUNDOWN) : Void

    fun NDRSContextMarshall2(binding_handle : Void*, c_context : Win32cr::System::Rpc::NDR_SCONTEXT_1*, pBuff : Void*, userRunDownIn : Win32cr::System::Rpc::NDR_RUNDOWN, ctx_guard : Void*, flags : UInt32) : Void

    fun NDRSContextUnmarshallEx(binding_handle : Void*, pBuff : Void*, data_representation : UInt32) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    fun NDRSContextUnmarshall2(binding_handle : Void*, pBuff : Void*, data_representation : UInt32, ctx_guard : Void*, flags : UInt32) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    fun RpcSsDestroyClientContext(context_handle : Void**) : Void

    fun NdrSimpleTypeMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, format_char : UInt8) : Void

    fun NdrPointerMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrSimpleStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrConformantStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrConformantVaryingStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrComplexStructMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrFixedArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrConformantArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrConformantVaryingArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrVaryingArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrComplexArrayMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrNonConformantStringMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrConformantStringMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrEncapsulatedUnionMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrNonEncapsulatedUnionMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrByteCountPointerMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrXmitOrRepAsMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrUserMarshalMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrInterfacePointerMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : UInt8*

    fun NdrClientContextMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, context_handle : LibC::IntPtrT, fCheck : Int32) : Void

    fun NdrServerContextMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, context_handle : Win32cr::System::Rpc::NDR_SCONTEXT_1*, rundown_routine : Win32cr::System::Rpc::NDR_RUNDOWN) : Void

    fun NdrServerContextNewMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, context_handle : Win32cr::System::Rpc::NDR_SCONTEXT_1*, rundown_routine : Win32cr::System::Rpc::NDR_RUNDOWN, pFormat : UInt8*) : Void

    fun NdrSimpleTypeUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, format_char : UInt8) : Void

    fun NdrRangeUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrCorrelationInitialize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : Void*, cache_size : UInt32, flags : UInt32) : Void

    fun NdrCorrelationPass(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    fun NdrCorrelationFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    fun NdrPointerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrSimpleStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrConformantStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrConformantVaryingStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrComplexStructUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrFixedArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrConformantArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrConformantVaryingArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrVaryingArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrComplexArrayUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrNonConformantStringUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrConformantStringUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrEncapsulatedUnionUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrNonEncapsulatedUnionUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrByteCountPointerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrXmitOrRepAsUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrUserMarshalUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrInterfacePointerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : UInt8**, pFormat : UInt8*, fMustAlloc : UInt8) : UInt8*

    fun NdrClientContextUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pContextHandle : LibC::IntPtrT*, bind_handle : Void*) : Void

    fun NdrServerContextUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    fun NdrContextHandleInitialize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    fun NdrServerContextNewUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : Win32cr::System::Rpc::NDR_SCONTEXT_1*

    fun NdrPointerBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrSimpleStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConformantStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConformantVaryingStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrComplexStructBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrFixedArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConformantArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConformantVaryingArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrVaryingArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrComplexArrayBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConformantStringBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrNonConformantStringBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrEncapsulatedUnionBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrNonEncapsulatedUnionBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrByteCountPointerBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrXmitOrRepAsBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrUserMarshalBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrInterfacePointerBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrContextHandleSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrPointerMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrSimpleStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrConformantStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrConformantVaryingStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrComplexStructMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrFixedArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrConformantArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrConformantVaryingArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrVaryingArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrComplexArrayMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrConformantStringMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrNonConformantStringMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrEncapsulatedUnionMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrNonEncapsulatedUnionMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrXmitOrRepAsMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrUserMarshalMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrInterfacePointerMemorySize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : UInt32

    fun NdrPointerFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrSimpleStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConformantStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConformantVaryingStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrComplexStructFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrFixedArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConformantArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConformantVaryingArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrVaryingArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrComplexArrayFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrEncapsulatedUnionFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrNonEncapsulatedUnionFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrByteCountPointerFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrXmitOrRepAsFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrUserMarshalFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrInterfacePointerFree(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : UInt8*, pFormat : UInt8*) : Void

    fun NdrConvert2(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*, number_params : Int32) : Void

    fun NdrConvert(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*) : Void

    fun NdrUserMarshalSimpleTypeConvert(pFlags : UInt32*, pBuffer : UInt8*, format_char : UInt8) : UInt8*

    fun NdrClientInitializeNew(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, proc_num : UInt32) : Void

    fun NdrServerInitializeNew(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*) : UInt8*

    fun NdrServerInitializePartial(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, requested_buffer_size : UInt32) : Void

    fun NdrClientInitialize(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, proc_num : UInt32) : Void

    fun NdrServerInitialize(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*) : UInt8*

    fun NdrServerInitializeUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : UInt8*

    fun NdrServerInitializeMarshall(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    fun NdrGetBuffer(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, buffer_length : UInt32, handle : Void*) : UInt8*

    fun NdrNsGetBuffer(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, buffer_length : UInt32, handle : Void*) : UInt8*

    fun NdrSendReceive(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pBufferEnd : UInt8*) : UInt8*

    fun NdrNsSendReceive(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pBufferEnd : UInt8*, pAutoHandle : Void**) : UInt8*

    fun NdrFreeBuffer(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    fun NdrGetDcomProtocolVersion(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pVersion : Win32cr::System::Rpc::RPC_VERSION*) : Win32cr::Foundation::HRESULT

    fun NdrClientCall2(pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormat : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    fun NdrAsyncClientCall(pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormat : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    fun NdrDcomAsyncClientCall(pStubDescriptor : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormat : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    fun NdrAsyncServerCall(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    fun NdrDcomAsyncStubCall(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32

    fun NdrStubCall2(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32

    fun NdrServerCall2(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    fun NdrMapCommAndFaultStatus(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pCommStatus : UInt32*, pFaultStatus : UInt32*, status : Win32cr::System::Rpc::RPC_STATUS) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSsAllocate(size : LibC::UIntPtrT) : Void*

    fun RpcSsDisableAllocate : Void

    fun RpcSsEnableAllocate : Void

    fun RpcSsFree(node_to_free : Void*) : Void

    fun RpcSsGetThreadHandle : Void*

    fun RpcSsSetClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE) : Void

    fun RpcSsSetThreadHandle(id : Void*) : Void

    fun RpcSsSwapClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE, old_client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC*, old_client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE*) : Void

    fun RpcSmAllocate(size : LibC::UIntPtrT, pStatus : Win32cr::System::Rpc::RPC_STATUS*) : Void*

    fun RpcSmClientFree(pNodeToFree : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSmDestroyClientContext(context_handle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSmDisableAllocate : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSmEnableAllocate : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSmFree(node_to_free : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSmGetThreadHandle(pStatus : Win32cr::System::Rpc::RPC_STATUS*) : Void*

    fun RpcSmSetClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSmSetThreadHandle(id : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcSmSwapClientAllocFree(client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC, client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE, old_client_alloc : Win32cr::System::Rpc::RPC_CLIENT_ALLOC*, old_client_free : Win32cr::System::Rpc::RPC_CLIENT_FREE*) : Win32cr::System::Rpc::RPC_STATUS

    fun NdrRpcSsEnableAllocate(pMessage : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    fun NdrRpcSsDisableAllocate(pMessage : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    fun NdrRpcSmSetClientToOsf(pMessage : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*) : Void

    fun NdrRpcSmClientAllocate(size : LibC::UIntPtrT) : Void*

    fun NdrRpcSmClientFree(node_to_free : Void*) : Void

    fun NdrRpcSsDefaultAllocate(size : LibC::UIntPtrT) : Void*

    fun NdrRpcSsDefaultFree(node_to_free : Void*) : Void

    fun NdrFullPointerXlatInit(number_of_pointers : UInt32, xlat_side : Win32cr::System::Rpc::XLAT_SIDE) : Win32cr::System::Rpc::FULL_PTR_XLAT_TABLES*

    fun NdrFullPointerXlatFree(pXlatTables : Win32cr::System::Rpc::FULL_PTR_XLAT_TABLES*) : Void

    fun NdrAllocate(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, len : LibC::UIntPtrT) : Void*

    fun NdrClearOutParameters(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pFormat : UInt8*, arg_addr : Void*) : Void

    fun NdrOleAllocate(size : LibC::UIntPtrT) : Void*

    fun NdrOleFree(node_to_free : Void*) : Void

    fun NdrGetUserMarshalInfo(pFlags : UInt32*, information_level : UInt32, pMarshalInfo : Win32cr::System::Rpc::NDR_USER_MARSHAL_INFO*) : Win32cr::System::Rpc::RPC_STATUS

    fun NdrCreateServerInterfaceFromStub(pStub : Void*, pServerIf : Win32cr::System::Rpc::RPC_SERVER_INTERFACE*) : Win32cr::System::Rpc::RPC_STATUS

    fun NdrClientCall3(pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    fun Ndr64AsyncClientCall(pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    fun Ndr64DcomAsyncClientCall(pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    fun Ndr64AsyncServerCall64(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    fun Ndr64AsyncServerCallAll(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    fun Ndr64DcomAsyncStubCall(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32

    fun NdrStubCall3(pThis : Void*, pChannel : Void*, pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*, pdwStubPhase : UInt32*) : Int32

    fun NdrServerCallAll(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    fun NdrServerCallNdr64(pRpcMsg : Win32cr::System::Rpc::RPC_MESSAGE*) : Void

    fun NdrPartialIgnoreClientMarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : Void*) : Void

    fun NdrPartialIgnoreServerUnmarshall(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : Void**) : Void

    fun NdrPartialIgnoreClientBufferSize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, pMemory : Void*) : Void

    fun NdrPartialIgnoreServerInitialize(pStubMsg : Win32cr::System::Rpc::MIDL_STUB_MESSAGE*, ppMemory : Void**, pFormat : UInt8*) : Void

    fun RpcUserFree(async_handle : Void*, pBuffer : Void*) : Void

    fun MesEncodeIncrementalHandleCreate(user_state : Void*, alloc_fn : Win32cr::System::Rpc::MIDL_ES_ALLOC, write_fn : Win32cr::System::Rpc::MIDL_ES_WRITE, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun MesDecodeIncrementalHandleCreate(user_state : Void*, read_fn : Win32cr::System::Rpc::MIDL_ES_READ, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun MesIncrementalHandleReset(handle : Void*, user_state : Void*, alloc_fn : Win32cr::System::Rpc::MIDL_ES_ALLOC, write_fn : Win32cr::System::Rpc::MIDL_ES_WRITE, read_fn : Win32cr::System::Rpc::MIDL_ES_READ, operation : Win32cr::System::Rpc::MIDL_ES_CODE) : Win32cr::System::Rpc::RPC_STATUS

    fun MesEncodeFixedBufferHandleCreate(pBuffer : Win32cr::Foundation::PSTR, buffer_size : UInt32, pEncodedSize : UInt32*, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun MesEncodeDynBufferHandleCreate(pBuffer : Int8**, pEncodedSize : UInt32*, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun MesDecodeBufferHandleCreate(buffer : Win32cr::Foundation::PSTR, buffer_size : UInt32, pHandle : Void**) : Win32cr::System::Rpc::RPC_STATUS

    fun MesBufferHandleReset(handle : Void*, handle_style : UInt32, operation : Win32cr::System::Rpc::MIDL_ES_CODE, pBuffer : Int8**, buffer_size : UInt32, pEncodedSize : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun MesHandleFree(handle : Void*) : Win32cr::System::Rpc::RPC_STATUS

    fun MesInqProcEncodingId(handle : Void*, pInterfaceId : Win32cr::System::Rpc::RPC_SYNTAX_IDENTIFIER*, pProcNum : UInt32*) : Win32cr::System::Rpc::RPC_STATUS

    fun NdrMesSimpleTypeAlignSize(param0 : Void*) : LibC::UIntPtrT

    fun NdrMesSimpleTypeDecode(handle : Void*, pObject : Void*, size : Int16) : Void

    fun NdrMesSimpleTypeEncode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pObject : Void*, size : Int16) : Void

    fun NdrMesTypeAlignSize(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : LibC::UIntPtrT

    fun NdrMesTypeEncode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    fun NdrMesTypeDecode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    fun NdrMesTypeAlignSize2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : LibC::UIntPtrT

    fun NdrMesTypeEncode2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    fun NdrMesTypeDecode2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    fun NdrMesTypeFree2(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*, pObject : Void*) : Void

    fun NdrMesProcEncodeDecode(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*) : Void

    fun NdrMesProcEncodeDecode2(handle : Void*, pStubDesc : Win32cr::System::Rpc::MIDL_STUB_DESC*, pFormatString : UInt8*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    fun NdrMesTypeAlignSize3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : LibC::UIntPtrT

    fun NdrMesTypeEncode3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : Void

    fun NdrMesTypeDecode3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : Void

    fun NdrMesTypeFree3(handle : Void*, pPicklingInfo : Win32cr::System::Rpc::MIDL_TYPE_PICKLING_INFO*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, arr_type_offset : UInt32**, nTypeIndex : UInt32, pObject : Void*) : Void

    fun NdrMesProcEncodeDecode3(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, nProcNum : UInt32, pReturnValue : Void*) : Win32cr::System::Rpc::CLIENT_CALL_RETURN

    fun NdrMesSimpleTypeDecodeAll(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, pObject : Void*, size : Int16) : Void

    fun NdrMesSimpleTypeEncodeAll(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*, pObject : Void*, size : Int16) : Void

    fun NdrMesSimpleTypeAlignSizeAll(handle : Void*, pProxyInfo : Win32cr::System::Rpc::MIDL_STUBLESS_PROXY_INFO*) : LibC::UIntPtrT

    fun RpcCertGeneratePrincipalNameW(context : Win32cr::Security::Cryptography::CERT_CONTEXT*, flags : UInt32, pBuffer : UInt16**) : Win32cr::System::Rpc::RPC_STATUS

    fun RpcCertGeneratePrincipalNameA(context : Win32cr::Security::Cryptography::CERT_CONTEXT*, flags : UInt32, pBuffer : UInt8**) : Win32cr::System::Rpc::RPC_STATUS

  end
end