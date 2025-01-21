require "./../foundation.cr"
require "./../graphics/gdi.cr"
require "./com/structured_storage.cr"
require "./system_services.cr"
require "./../security.cr"
require "./ole.cr"

module Win32cr::System::Com
  alias CO_MTA_USAGE_COOKIE = LibC::IntPtrT
  alias CO_DEVICE_CATALOG_COOKIE = LibC::IntPtrT
  alias LPEXCEPFINO_DEFERRED_FILLIN = Proc(Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT)*

  alias LPFNGETCLASSOBJECT = Proc(LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)*

  alias LPFNCANUNLOADNOW = Proc(Win32cr::Foundation::HRESULT)*

  alias PFNCONTEXTCALL = Proc(Win32cr::System::Com::ComCallData*, Win32cr::Foundation::HRESULT)*

  MARSHALINTERFACE_MIN = 500_u32
  ASYNC_MODE_COMPATIBILITY = 1_i32
  ASYNC_MODE_DEFAULT = 0_i32
  STGTY_REPEAT = 256_i32
  STG_TOEND = -1_i32
  STG_LAYOUT_SEQUENTIAL = 0_i32
  STG_LAYOUT_INTERLEAVED = 1_i32
  COM_RIGHTS_EXECUTE = 1_u32
  COM_RIGHTS_EXECUTE_LOCAL = 2_u32
  COM_RIGHTS_EXECUTE_REMOTE = 4_u32
  COM_RIGHTS_ACTIVATE_LOCAL = 8_u32
  COM_RIGHTS_ACTIVATE_REMOTE = 16_u32
  COM_RIGHTS_RESERVED1 = 32_u32
  COM_RIGHTS_RESERVED2 = 64_u32
  CWMO_MAX_HANDLES = 56_u32
  ROTREGFLAGS_ALLOWANYCLIENT = 1_u32
  APPIDREGFLAGS_ACTIVATE_IUSERVER_INDESKTOP = 1_u32
  APPIDREGFLAGS_SECURE_SERVER_PROCESS_SD_AND_BIND = 2_u32
  APPIDREGFLAGS_ISSUE_ACTIVATION_RPC_AT_IDENTIFY = 4_u32
  APPIDREGFLAGS_IUSERVER_UNMODIFIED_LOGON_TOKEN = 8_u32
  APPIDREGFLAGS_IUSERVER_SELF_SID_IN_LAUNCH_PERMISSION = 16_u32
  APPIDREGFLAGS_IUSERVER_ACTIVATE_IN_CLIENT_SESSION_ONLY = 32_u32
  APPIDREGFLAGS_RESERVED1 = 64_u32
  APPIDREGFLAGS_RESERVED2 = 128_u32
  APPIDREGFLAGS_RESERVED3 = 256_u32
  APPIDREGFLAGS_RESERVED4 = 512_u32
  APPIDREGFLAGS_RESERVED5 = 1024_u32
  APPIDREGFLAGS_AAA_NO_IMPLICIT_ACTIVATE_AS_IU = 2048_u32
  APPIDREGFLAGS_RESERVED7 = 4096_u32
  APPIDREGFLAGS_RESERVED8 = 8192_u32
  APPIDREGFLAGS_RESERVED9 = 16384_u32
  DCOMSCM_ACTIVATION_USE_ALL_AUTHNSERVICES = 1_u32
  DCOMSCM_ACTIVATION_DISALLOW_UNSECURE_CALL = 2_u32
  DCOMSCM_RESOLVE_USE_ALL_AUTHNSERVICES = 4_u32
  DCOMSCM_RESOLVE_DISALLOW_UNSECURE_CALL = 8_u32
  DCOMSCM_PING_USE_MID_AUTHNSERVICE = 16_u32
  DCOMSCM_PING_DISALLOW_UNSECURE_CALL = 32_u32
  MAXLSN = 9223372036854775807_u64
  DMUS_ERRBASE = 4096_u32

  @[Flags]
  enum URI_CREATE_FLAGS : UInt32
    Uri_CREATE_ALLOW_RELATIVE = 1_u32
    Uri_CREATE_ALLOW_IMPLICIT_WILDCARD_SCHEME = 2_u32
    Uri_CREATE_ALLOW_IMPLICIT_FILE_SCHEME = 4_u32
    Uri_CREATE_NOFRAG = 8_u32
    Uri_CREATE_NO_CANONICALIZE = 16_u32
    Uri_CREATE_CANONICALIZE = 256_u32
    Uri_CREATE_FILE_USE_DOS_PATH = 32_u32
    Uri_CREATE_DECODE_EXTRA_INFO = 64_u32
    Uri_CREATE_NO_DECODE_EXTRA_INFO = 128_u32
    Uri_CREATE_CRACK_UNKNOWN_SCHEMES = 512_u32
    Uri_CREATE_NO_CRACK_UNKNOWN_SCHEMES = 1024_u32
    Uri_CREATE_PRE_PROCESS_HTML_URI = 2048_u32
    Uri_CREATE_NO_PRE_PROCESS_HTML_URI = 4096_u32
    Uri_CREATE_IE_SETTINGS = 8192_u32
    Uri_CREATE_NO_IE_SETTINGS = 16384_u32
    Uri_CREATE_NO_ENCODE_FORBIDDEN_CHARACTERS = 32768_u32
    Uri_CREATE_NORMALIZE_INTL_CHARACTERS = 65536_u32
    Uri_CREATE_CANONICALIZE_ABSOLUTE = 131072_u32
  end
  enum RPC_C_AUTHN_LEVEL : UInt32
    RPC_C_AUTHN_LEVEL_DEFAULT = 0_u32
    RPC_C_AUTHN_LEVEL_NONE = 1_u32
    RPC_C_AUTHN_LEVEL_CONNECT = 2_u32
    RPC_C_AUTHN_LEVEL_CALL = 3_u32
    RPC_C_AUTHN_LEVEL_PKT = 4_u32
    RPC_C_AUTHN_LEVEL_PKT_INTEGRITY = 5_u32
    RPC_C_AUTHN_LEVEL_PKT_PRIVACY = 6_u32
  end
  enum RPC_C_IMP_LEVEL : UInt32
    RPC_C_IMP_LEVEL_DEFAULT = 0_u32
    RPC_C_IMP_LEVEL_ANONYMOUS = 1_u32
    RPC_C_IMP_LEVEL_IDENTIFY = 2_u32
    RPC_C_IMP_LEVEL_IMPERSONATE = 3_u32
    RPC_C_IMP_LEVEL_DELEGATE = 4_u32
  end
  @[Flags]
  enum ROT_FLAGS : UInt32
    ROTFLAGS_REGISTRATIONKEEPSALIVE = 1_u32
    ROTFLAGS_ALLOWANYCLIENT = 2_u32
  end
  enum DVASPECT
    DVASPECT_CONTENT = 1_i32
    DVASPECT_THUMBNAIL = 2_i32
    DVASPECT_ICON = 4_i32
    DVASPECT_DOCPRINT = 8_i32
  end
  @[Flags]
  enum STGC : UInt32
    STGC_DEFAULT = 0_u32
    STGC_OVERWRITE = 1_u32
    STGC_ONLYIFCURRENT = 2_u32
    STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE = 4_u32
    STGC_CONSOLIDATE = 8_u32
  end
  enum TYSPEC
    TYSPEC_CLSID = 0_i32
    TYSPEC_FILEEXT = 1_i32
    TYSPEC_MIMETYPE = 2_i32
    TYSPEC_FILENAME = 3_i32
    TYSPEC_PROGID = 4_i32
    TYSPEC_PACKAGENAME = 5_i32
    TYSPEC_OBJECTID = 6_i32
  end
  enum REGCLS
    REGCLS_SINGLEUSE = 0_i32
    REGCLS_MULTIPLEUSE = 1_i32
    REGCLS_MULTI_SEPARATE = 2_i32
    REGCLS_SUSPENDED = 4_i32
    REGCLS_SURROGATE = 8_i32
    REGCLS_AGILE = 16_i32
  end
  enum COINITBASE
    COINITBASE_MULTITHREADED = 0_i32
  end
  enum MEMCTX
    MEMCTX_TASK = 1_i32
    MEMCTX_SHARED = 2_i32
    MEMCTX_MACSYSTEM = 3_i32
    MEMCTX_UNKNOWN = -1_i32
    MEMCTX_SAME = -2_i32
  end
  @[Flags]
  enum CLSCTX : UInt32
    CLSCTX_INPROC_SERVER = 1_u32
    CLSCTX_INPROC_HANDLER = 2_u32
    CLSCTX_LOCAL_SERVER = 4_u32
    CLSCTX_INPROC_SERVER16 = 8_u32
    CLSCTX_REMOTE_SERVER = 16_u32
    CLSCTX_INPROC_HANDLER16 = 32_u32
    CLSCTX_RESERVED1 = 64_u32
    CLSCTX_RESERVED2 = 128_u32
    CLSCTX_RESERVED3 = 256_u32
    CLSCTX_RESERVED4 = 512_u32
    CLSCTX_NO_CODE_DOWNLOAD = 1024_u32
    CLSCTX_RESERVED5 = 2048_u32
    CLSCTX_NO_CUSTOM_MARSHAL = 4096_u32
    CLSCTX_ENABLE_CODE_DOWNLOAD = 8192_u32
    CLSCTX_NO_FAILURE_LOG = 16384_u32
    CLSCTX_DISABLE_AAA = 32768_u32
    CLSCTX_ENABLE_AAA = 65536_u32
    CLSCTX_FROM_DEFAULT_CONTEXT = 131072_u32
    CLSCTX_ACTIVATE_X86_SERVER = 262144_u32
    CLSCTX_ACTIVATE_32_BIT_SERVER = 262144_u32
    CLSCTX_ACTIVATE_64_BIT_SERVER = 524288_u32
    CLSCTX_ENABLE_CLOAKING = 1048576_u32
    CLSCTX_APPCONTAINER = 4194304_u32
    CLSCTX_ACTIVATE_AAA_AS_IU = 8388608_u32
    CLSCTX_RESERVED6 = 16777216_u32
    CLSCTX_ACTIVATE_ARM32_SERVER = 33554432_u32
    CLSCTX_PS_DLL = 2147483648_u32
    CLSCTX_ALL = 23_u32
    CLSCTX_SERVER = 21_u32
  end
  enum MSHLFLAGS
    MSHLFLAGS_NORMAL = 0_i32
    MSHLFLAGS_TABLESTRONG = 1_i32
    MSHLFLAGS_TABLEWEAK = 2_i32
    MSHLFLAGS_NOPING = 4_i32
    MSHLFLAGS_RESERVED1 = 8_i32
    MSHLFLAGS_RESERVED2 = 16_i32
    MSHLFLAGS_RESERVED3 = 32_i32
    MSHLFLAGS_RESERVED4 = 64_i32
  end
  enum MSHCTX
    MSHCTX_LOCAL = 0_i32
    MSHCTX_NOSHAREDMEM = 1_i32
    MSHCTX_DIFFERENTMACHINE = 2_i32
    MSHCTX_INPROC = 3_i32
    MSHCTX_CROSSCTX = 4_i32
    MSHCTX_CONTAINER = 5_i32
  end
  enum EXTCONN
    EXTCONN_STRONG = 1_i32
    EXTCONN_WEAK = 2_i32
    EXTCONN_CALLABLE = 4_i32
  end
  enum STGTY
    STGTY_STORAGE = 1_i32
    STGTY_STREAM = 2_i32
    STGTY_LOCKBYTES = 3_i32
    STGTY_PROPERTY = 4_i32
  end
  enum STREAM_SEEK : UInt32
    STREAM_SEEK_SET = 0_u32
    STREAM_SEEK_CUR = 1_u32
    STREAM_SEEK_END = 2_u32
  end
  enum EOLE_AUTHENTICATION_CAPABILITIES
    EOAC_NONE = 0_i32
    EOAC_MUTUAL_AUTH = 1_i32
    EOAC_STATIC_CLOAKING = 32_i32
    EOAC_DYNAMIC_CLOAKING = 64_i32
    EOAC_ANY_AUTHORITY = 128_i32
    EOAC_MAKE_FULLSIC = 256_i32
    EOAC_DEFAULT = 2048_i32
    EOAC_SECURE_REFS = 2_i32
    EOAC_ACCESS_CONTROL = 4_i32
    EOAC_APPID = 8_i32
    EOAC_DYNAMIC = 16_i32
    EOAC_REQUIRE_FULLSIC = 512_i32
    EOAC_AUTO_IMPERSONATE = 1024_i32
    EOAC_DISABLE_AAA = 4096_i32
    EOAC_NO_CUSTOM_MARSHAL = 8192_i32
    EOAC_RESERVED1 = 16384_i32
  end
  enum RPCOPT_PROPERTIES
    COMBND_RPCTIMEOUT = 1_i32
    COMBND_SERVER_LOCALITY = 2_i32
    COMBND_RESERVED1 = 4_i32
    COMBND_RESERVED2 = 5_i32
    COMBND_RESERVED3 = 8_i32
    COMBND_RESERVED4 = 16_i32
  end
  enum RPCOPT_SERVER_LOCALITY_VALUES
    SERVER_LOCALITY_PROCESS_LOCAL = 0_i32
    SERVER_LOCALITY_MACHINE_LOCAL = 1_i32
    SERVER_LOCALITY_REMOTE = 2_i32
  end
  enum GLOBALOPT_PROPERTIES
    COMGLB_EXCEPTION_HANDLING = 1_i32
    COMGLB_APPID = 2_i32
    COMGLB_RPC_THREADPOOL_SETTING = 3_i32
    COMGLB_RO_SETTINGS = 4_i32
    COMGLB_UNMARSHALING_POLICY = 5_i32
    COMGLB_PROPERTIES_RESERVED1 = 6_i32
    COMGLB_PROPERTIES_RESERVED2 = 7_i32
    COMGLB_PROPERTIES_RESERVED3 = 8_i32
  end
  enum GLOBALOPT_EH_VALUES
    COMGLB_EXCEPTION_HANDLE = 0_i32
    COMGLB_EXCEPTION_DONOT_HANDLE_FATAL = 1_i32
    COMGLB_EXCEPTION_DONOT_HANDLE = 1_i32
    COMGLB_EXCEPTION_DONOT_HANDLE_ANY = 2_i32
  end
  enum GLOBALOPT_RPCTP_VALUES
    COMGLB_RPC_THREADPOOL_SETTING_DEFAULT_POOL = 0_i32
    COMGLB_RPC_THREADPOOL_SETTING_PRIVATE_POOL = 1_i32
  end
  enum GLOBALOPT_RO_FLAGS
    COMGLB_STA_MODALLOOP_REMOVE_TOUCH_MESSAGES = 1_i32
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_REMOVE_INPUT_MESSAGES = 2_i32
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_DONOT_REMOVE_INPUT_MESSAGES = 4_i32
    COMGLB_FAST_RUNDOWN = 8_i32
    COMGLB_RESERVED1 = 16_i32
    COMGLB_RESERVED2 = 32_i32
    COMGLB_RESERVED3 = 64_i32
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_REORDER_POINTER_MESSAGES = 128_i32
    COMGLB_RESERVED4 = 256_i32
    COMGLB_RESERVED5 = 512_i32
    COMGLB_RESERVED6 = 1024_i32
  end
  enum GLOBALOPT_UNMARSHALING_POLICY_VALUES
    COMGLB_UNMARSHALING_POLICY_NORMAL = 0_i32
    COMGLB_UNMARSHALING_POLICY_STRONG = 1_i32
    COMGLB_UNMARSHALING_POLICY_HYBRID = 2_i32
  end
  enum DCOM_CALL_STATE
    DCOM_NONE = 0_i32
    DCOM_CALL_COMPLETE = 1_i32
    DCOM_CALL_CANCELED = 2_i32
  end
  enum APTTYPEQUALIFIER
    APTTYPEQUALIFIER_NONE = 0_i32
    APTTYPEQUALIFIER_IMPLICIT_MTA = 1_i32
    APTTYPEQUALIFIER_NA_ON_MTA = 2_i32
    APTTYPEQUALIFIER_NA_ON_STA = 3_i32
    APTTYPEQUALIFIER_NA_ON_IMPLICIT_MTA = 4_i32
    APTTYPEQUALIFIER_NA_ON_MAINSTA = 5_i32
    APTTYPEQUALIFIER_APPLICATION_STA = 6_i32
    APTTYPEQUALIFIER_RESERVED_1 = 7_i32
  end
  enum APTTYPE
    APTTYPE_CURRENT = -1_i32
    APTTYPE_STA = 0_i32
    APTTYPE_MTA = 1_i32
    APTTYPE_NA = 2_i32
    APTTYPE_MAINSTA = 3_i32
  end
  enum THDTYPE
    THDTYPE_BLOCKMESSAGES = 0_i32
    THDTYPE_PROCESSMESSAGES = 1_i32
  end
  enum CO_MARSHALING_CONTEXT_ATTRIBUTES
    CO_MARSHALING_SOURCE_IS_APP_CONTAINER = 0_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_1 = -2147483648_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_2 = -2147483647_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_3 = -2147483646_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_4 = -2147483645_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_5 = -2147483644_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_6 = -2147483643_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_7 = -2147483642_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_8 = -2147483641_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_9 = -2147483640_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_10 = -2147483639_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_11 = -2147483638_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_12 = -2147483637_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_13 = -2147483636_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_14 = -2147483635_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_15 = -2147483634_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_16 = -2147483633_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_17 = -2147483632_i32
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_18 = -2147483631_i32
  end
  enum BIND_FLAGS
    BIND_MAYBOTHERUSER = 1_i32
    BIND_JUSTTESTEXISTENCE = 2_i32
  end
  enum MKSYS
    MKSYS_NONE = 0_i32
    MKSYS_GENERICCOMPOSITE = 1_i32
    MKSYS_FILEMONIKER = 2_i32
    MKSYS_ANTIMONIKER = 3_i32
    MKSYS_ITEMMONIKER = 4_i32
    MKSYS_POINTERMONIKER = 5_i32
    MKSYS_CLASSMONIKER = 7_i32
    MKSYS_OBJREFMONIKER = 8_i32
    MKSYS_SESSIONMONIKER = 9_i32
    MKSYS_LUAMONIKER = 10_i32
  end
  enum MKREDUCE
    MKRREDUCE_ONE = 196608_i32
    MKRREDUCE_TOUSER = 131072_i32
    MKRREDUCE_THROUGHUSER = 65536_i32
    MKRREDUCE_ALL = 0_i32
  end
  enum ADVF
    ADVF_NODATA = 1_i32
    ADVF_PRIMEFIRST = 2_i32
    ADVF_ONLYONCE = 4_i32
    ADVF_DATAONSTOP = 64_i32
    ADVFCACHE_NOHANDLER = 8_i32
    ADVFCACHE_FORCEBUILTIN = 16_i32
    ADVFCACHE_ONSAVE = 32_i32
  end
  enum TYMED
    TYMED_HGLOBAL = 1_i32
    TYMED_FILE = 2_i32
    TYMED_ISTREAM = 4_i32
    TYMED_ISTORAGE = 8_i32
    TYMED_GDI = 16_i32
    TYMED_MFPICT = 32_i32
    TYMED_ENHMF = 64_i32
    TYMED_NULL = 0_i32
  end
  enum DATADIR
    DATADIR_GET = 1_i32
    DATADIR_SET = 2_i32
  end
  enum CALLTYPE
    CALLTYPE_TOPLEVEL = 1_i32
    CALLTYPE_NESTED = 2_i32
    CALLTYPE_ASYNC = 3_i32
    CALLTYPE_TOPLEVEL_CALLPENDING = 4_i32
    CALLTYPE_ASYNC_CALLPENDING = 5_i32
  end
  enum SERVERCALL
    SERVERCALL_ISHANDLED = 0_i32
    SERVERCALL_REJECTED = 1_i32
    SERVERCALL_RETRYLATER = 2_i32
  end
  enum PENDINGTYPE
    PENDINGTYPE_TOPLEVEL = 1_i32
    PENDINGTYPE_NESTED = 2_i32
  end
  enum PENDINGMSG
    PENDINGMSG_CANCELCALL = 0_i32
    PENDINGMSG_WAITNOPROCESS = 1_i32
    PENDINGMSG_WAITDEFPROCESS = 2_i32
  end
  enum ApplicationType
    ServerApplication = 0_i32
    LibraryApplication = 1_i32
  end
  enum ShutdownType
    IdleShutdown = 0_i32
    ForcedShutdown = 1_i32
  end
  @[Flags]
  enum COINIT : UInt32
    COINIT_APARTMENTTHREADED = 2_u32
    COINIT_MULTITHREADED = 0_u32
    COINIT_DISABLE_OLE1DDE = 4_u32
    COINIT_SPEED_OVER_MEMORY = 8_u32
  end
  enum COMSD
    SD_LAUNCHPERMISSIONS = 0_i32
    SD_ACCESSPERMISSIONS = 1_i32
    SD_LAUNCHRESTRICTIONS = 2_i32
    SD_ACCESSRESTRICTIONS = 3_i32
  end
  enum COWAIT_FLAGS
    COWAIT_DEFAULT = 0_i32
    COWAIT_WAITALL = 1_i32
    COWAIT_ALERTABLE = 2_i32
    COWAIT_INPUTAVAILABLE = 4_i32
    COWAIT_DISPATCH_CALLS = 8_i32
    COWAIT_DISPATCH_WINDOW_MESSAGES = 16_i32
  end
  enum CWMO_FLAGS
    CWMO_DEFAULT = 0_i32
    CWMO_DISPATCH_CALLS = 1_i32
    CWMO_DISPATCH_WINDOW_MESSAGES = 2_i32
  end
  enum BINDINFOF
    BINDINFOF_URLENCODESTGMEDDATA = 1_i32
    BINDINFOF_URLENCODEDEXTRAINFO = 2_i32
  end
  enum Uri_PROPERTY
    Uri_PROPERTY_ABSOLUTE_URI = 0_i32
    Uri_PROPERTY_STRING_START = 0_i32
    Uri_PROPERTY_AUTHORITY = 1_i32
    Uri_PROPERTY_DISPLAY_URI = 2_i32
    Uri_PROPERTY_DOMAIN = 3_i32
    Uri_PROPERTY_EXTENSION = 4_i32
    Uri_PROPERTY_FRAGMENT = 5_i32
    Uri_PROPERTY_HOST = 6_i32
    Uri_PROPERTY_PASSWORD = 7_i32
    Uri_PROPERTY_PATH = 8_i32
    Uri_PROPERTY_PATH_AND_QUERY = 9_i32
    Uri_PROPERTY_QUERY = 10_i32
    Uri_PROPERTY_RAW_URI = 11_i32
    Uri_PROPERTY_SCHEME_NAME = 12_i32
    Uri_PROPERTY_USER_INFO = 13_i32
    Uri_PROPERTY_USER_NAME = 14_i32
    Uri_PROPERTY_STRING_LAST = 14_i32
    Uri_PROPERTY_HOST_TYPE = 15_i32
    Uri_PROPERTY_DWORD_START = 15_i32
    Uri_PROPERTY_PORT = 16_i32
    Uri_PROPERTY_SCHEME = 17_i32
    Uri_PROPERTY_ZONE = 18_i32
    Uri_PROPERTY_DWORD_LAST = 18_i32
  end
  enum TYPEKIND
    TKIND_ENUM = 0_i32
    TKIND_RECORD = 1_i32
    TKIND_MODULE = 2_i32
    TKIND_INTERFACE = 3_i32
    TKIND_DISPATCH = 4_i32
    TKIND_COCLASS = 5_i32
    TKIND_ALIAS = 6_i32
    TKIND_UNION = 7_i32
    TKIND_MAX = 8_i32
  end
  enum CALLCONV
    CC_FASTCALL = 0_i32
    CC_CDECL = 1_i32
    CC_MSCPASCAL = 2_i32
    CC_PASCAL = 2_i32
    CC_MACPASCAL = 3_i32
    CC_STDCALL = 4_i32
    CC_FPFASTCALL = 5_i32
    CC_SYSCALL = 6_i32
    CC_MPWCDECL = 7_i32
    CC_MPWPASCAL = 8_i32
    CC_MAX = 9_i32
  end
  enum FUNCKIND
    FUNC_VIRTUAL = 0_i32
    FUNC_PUREVIRTUAL = 1_i32
    FUNC_NONVIRTUAL = 2_i32
    FUNC_STATIC = 3_i32
    FUNC_DISPATCH = 4_i32
  end
  enum INVOKEKIND
    INVOKE_FUNC = 1_i32
    INVOKE_PROPERTYGET = 2_i32
    INVOKE_PROPERTYPUT = 4_i32
    INVOKE_PROPERTYPUTREF = 8_i32
  end
  enum VARKIND
    VAR_PERINSTANCE = 0_i32
    VAR_STATIC = 1_i32
    VAR_CONST = 2_i32
    VAR_DISPATCH = 3_i32
  end
  enum DESCKIND
    DESCKIND_NONE = 0_i32
    DESCKIND_FUNCDESC = 1_i32
    DESCKIND_VARDESC = 2_i32
    DESCKIND_TYPECOMP = 3_i32
    DESCKIND_IMPLICITAPPOBJ = 4_i32
    DESCKIND_MAX = 5_i32
  end
  enum SYSKIND
    SYS_WIN16 = 0_i32
    SYS_WIN32 = 1_i32
    SYS_MAC = 2_i32
    SYS_WIN64 = 3_i32
  end

  @[Extern(union: true)]
  record CY,
    anonymous : Anonymous_e__Struct_,
    int64 : Int64 do

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    record Anonymous_e__Struct_,
      lo : UInt32,
      hi : Int32

  end

  @[Extern]
  record CSPLATFORM,
    dwPlatformId : UInt32,
    dwVersionHi : UInt32,
    dwVersionLo : UInt32,
    dwProcessorArch : UInt32

  @[Extern]
  record QUERYCONTEXT,
    dwContext : UInt32,
    platform : Win32cr::System::Com::CSPLATFORM,
    locale : UInt32,
    dwVersionHi : UInt32,
    dwVersionLo : UInt32

  @[Extern]
  record Uclsspec,
    tyspec : UInt32,
    tagged_union : Tagged_union_e__struct_ do

    # Nested Type Tagged_union_e__struct_
    @[Extern(union: true)]
    record Tagged_union_e__struct_,
      clsid : LibC::GUID,
      pFileExt : Win32cr::Foundation::PWSTR,
      pMimeType : Win32cr::Foundation::PWSTR,
      pProgId : Win32cr::Foundation::PWSTR,
      pFileName : Win32cr::Foundation::PWSTR,
      by_name : ByName_e__Struct_,
      by_object_id : ByObjectId_e__Struct_ do

      # Nested Type ByObjectId_e__Struct_
      @[Extern]
      record ByObjectId_e__Struct_,
        object_id : LibC::GUID,
        policy_id : LibC::GUID


      # Nested Type ByName_e__Struct_
      @[Extern]
      record ByName_e__Struct_,
        pPackageName : Win32cr::Foundation::PWSTR,
        policy_id : LibC::GUID

    end

  end

  @[Extern]
  record COAUTHIDENTITY,
    user : UInt16*,
    user_length : UInt32,
    domain : UInt16*,
    domain_length : UInt32,
    password : UInt16*,
    password_length : UInt32,
    flags : UInt32

  @[Extern]
  record COAUTHINFO,
    dwAuthnSvc : UInt32,
    dwAuthzSvc : UInt32,
    pwszServerPrincName : Win32cr::Foundation::PWSTR,
    dwAuthnLevel : UInt32,
    dwImpersonationLevel : UInt32,
    pAuthIdentityData : Win32cr::System::Com::COAUTHIDENTITY*,
    dwCapabilities : UInt32

  @[Extern]
  record BYTE_BLOB,
    clSize : UInt32,
    abData : UInt8*

  @[Extern]
  record WORD_BLOB,
    clSize : UInt32,
    asData : UInt16*

  @[Extern]
  record DWORD_BLOB,
    clSize : UInt32,
    alData : UInt32*

  @[Extern]
  record FLAGGED_BYTE_BLOB,
    fFlags : UInt32,
    clSize : UInt32,
    abData : UInt8*

  @[Extern]
  record FLAGGED_WORD_BLOB,
    fFlags : UInt32,
    clSize : UInt32,
    asData : UInt16*

  @[Extern]
  record BYTE_SIZEDARR,
    clSize : UInt32,
    pData : UInt8*

  @[Extern]
  record SHORT_SIZEDARR,
    clSize : UInt32,
    pData : UInt16*

  @[Extern]
  record LONG_SIZEDARR,
    clSize : UInt32,
    pData : UInt32*

  @[Extern]
  record HYPER_SIZEDARR,
    clSize : UInt32,
    pData : Int64*

  @[Extern]
  record BLOB,
    cbSize : UInt32,
    pBlobData : UInt8*

  @[Extern]
  record IEnumContextProps
  @[Extern]
  record IContext
  @[Extern]
  record COSERVERINFO,
    dwReserved1 : UInt32,
    pwszName : Win32cr::Foundation::PWSTR,
    pAuthInfo : Win32cr::System::Com::COAUTHINFO*,
    dwReserved2 : UInt32

  @[Extern]
  record MULTI_QI,
    pIID : LibC::GUID*,
    pItf : Void*,
    hr : Win32cr::Foundation::HRESULT

  @[Extern]
  record STATSTG,
    pwcsName : Win32cr::Foundation::PWSTR,
    type__ : UInt32,
    cbSize : Win32cr::Foundation::ULARGE_INTEGER,
    mtime : Win32cr::Foundation::FILETIME,
    ctime : Win32cr::Foundation::FILETIME,
    atime : Win32cr::Foundation::FILETIME,
    grfMode : UInt32,
    grfLocksSupported : UInt32,
    clsid : LibC::GUID,
    grfStateBits : UInt32,
    reserved : UInt32

  @[Extern]
  record RPCOLEMESSAGE,
    reserved1 : Void*,
    dataRepresentation : UInt32,
    buffer : Void*,
    cbBuffer : UInt32,
    iMethod : UInt32,
    reserved2 : Void*[5],
    rpcFlags : UInt32

  @[Extern]
  record SChannelHookCallInfo,
    iid : LibC::GUID,
    cbSize : UInt32,
    uCausality : LibC::GUID,
    dwServerPid : UInt32,
    iMethod : UInt32,
    pObject : Void*

  @[Extern]
  record SOLE_AUTHENTICATION_SERVICE,
    dwAuthnSvc : UInt32,
    dwAuthzSvc : UInt32,
    pPrincipalName : Win32cr::Foundation::PWSTR,
    hr : Win32cr::Foundation::HRESULT

  @[Extern]
  record SOLE_AUTHENTICATION_INFO,
    dwAuthnSvc : UInt32,
    dwAuthzSvc : UInt32,
    pAuthInfo : Void*

  @[Extern]
  record SOLE_AUTHENTICATION_LIST,
    cAuthInfo : UInt32,
    aAuthInfo : Win32cr::System::Com::SOLE_AUTHENTICATION_INFO*

  @[Extern]
  record MachineGlobalObjectTableRegistrationToken__,
    unused : Int32

  @[Extern]
  record BIND_OPTS,
    cbStruct : UInt32,
    grfFlags : UInt32,
    grfMode : UInt32,
    dwTickCountDeadline : UInt32

  @[Extern]
  record BIND_OPTS2,
    __anonymous_base_objidl_l9017_c36 : Win32cr::System::Com::BIND_OPTS,
    dwTrackFlags : UInt32,
    dwClassContext : UInt32,
    locale : UInt32,
    pServerInfo : Win32cr::System::Com::COSERVERINFO*

  @[Extern]
  record BIND_OPTS3,
    __anonymous_base_objidl_l9041_c36 : Win32cr::System::Com::BIND_OPTS2,
    hwnd : Win32cr::Foundation::HWND

  @[Extern]
  record DVTARGETDEVICE,
    tdSize : UInt32,
    tdDriverNameOffset : UInt16,
    tdDeviceNameOffset : UInt16,
    tdPortNameOffset : UInt16,
    tdExtDevmodeOffset : UInt16,
    tdData : UInt8*

  @[Extern]
  record FORMATETC,
    cfFormat : UInt16,
    ptd : Win32cr::System::Com::DVTARGETDEVICE*,
    dwAspect : UInt32,
    lindex : Int32,
    tymed : UInt32

  @[Extern]
  record STATDATA,
    formatetc : Win32cr::System::Com::FORMATETC,
    advf : UInt32,
    pAdvSink : Void*,
    dwConnection : UInt32

  @[Extern]
  record RemSTGMEDIUM,
    tymed : UInt32,
    dwHandleType : UInt32,
    pData : UInt32,
    pUnkForRelease : UInt32,
    cbData : UInt32,
    data : UInt8*

  @[Extern]
  record STGMEDIUM,
    tymed : UInt32,
    anonymous : Anonymous_e__Union_,
    pUnkForRelease : Void* do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      hBitmap : Win32cr::Graphics::Gdi::HBITMAP,
      hMetaFilePict : Void*,
      hEnhMetaFile : Win32cr::Graphics::Gdi::HENHMETAFILE,
      hGlobal : LibC::IntPtrT,
      lpszFileName : Win32cr::Foundation::PWSTR,
      pstm : Void*,
      pstg : Void*

  end

  @[Extern]
  record GDI_OBJECT,
    object_type : UInt32,
    u : U_e__struct_ do

    # Nested Type U_e__struct_
    @[Extern(union: true)]
    record U_e__struct_,
      hBitmap : Win32cr::System::SystemServices::Userhbitmap*,
      hPalette : Win32cr::System::SystemServices::Userhpalette*,
      hGeneric : Win32cr::System::SystemServices::Userhglobal*

  end

  @[Extern]
  record Userstgmedium,
    pUnkForRelease : Void* do

    # Nested Type STGMEDIUM_UNION_
    @[Extern]
    record STGMEDIUM_UNION_,
      tymed : UInt32,
      u : U_e__struct_ do

      # Nested Type U_e__struct_
      @[Extern(union: true)]
      record U_e__struct_,
        hMetaFilePict : Win32cr::System::SystemServices::Userhmetafilepict*,
        hHEnhMetaFile : Win32cr::System::SystemServices::Userhenhmetafile*,
        hGdiHandle : Win32cr::System::Com::GDI_OBJECT*,
        hGlobal : Win32cr::System::SystemServices::Userhglobal*,
        lpszFileName : Win32cr::Foundation::PWSTR,
        pstm : Win32cr::System::Com::BYTE_BLOB*,
        pstg : Win32cr::System::Com::BYTE_BLOB*

    end

  end

  @[Extern]
  record Userflag_stgmedium,
    context_flags : Int32,
    fPassOwnership : Int32,
    stgmed : Win32cr::System::Com::Userstgmedium

  @[Extern]
  record FLAG_STGMEDIUM,
    context_flags : Int32,
    fPassOwnership : Int32,
    stgmed : Win32cr::System::Com::STGMEDIUM

  @[Extern]
  record INTERFACEINFO,
    pUnk : Void*,
    iid : LibC::GUID,
    wMethod : UInt16

  @[Extern]
  record StorageLayout,
    layout_type : UInt32,
    pwcsElementName : Win32cr::Foundation::PWSTR,
    cOffset : Win32cr::Foundation::LARGE_INTEGER,
    cBytes : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record CATEGORYINFO,
    catid : LibC::GUID,
    lcid : UInt32,
    szDescription : UInt16[128]

  @[Extern]
  record ComCallData,
    dwDispid : UInt32,
    dwReserved : UInt32,
    pUserDefined : Void*

  @[Extern]
  record BINDINFO,
    cbSize : UInt32,
    szExtraInfo : Win32cr::Foundation::PWSTR,
    stgmedData : Win32cr::System::Com::STGMEDIUM,
    grfBindInfoF : UInt32,
    dwBindVerb : UInt32,
    szCustomVerb : Win32cr::Foundation::PWSTR,
    cbstgmedData : UInt32,
    dwOptions : UInt32,
    dwOptionsFlags : UInt32,
    dwCodePage : UInt32,
    securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES,
    iid : LibC::GUID,
    pUnk : Void*,
    dwReserved : UInt32

  @[Extern]
  record AUTHENTICATEINFO,
    dwFlags : UInt32,
    dwReserved : UInt32

  @[Extern]
  record SAFEARRAYBOUND,
    cElements : UInt32,
    lLbound : Int32

  @[Extern]
  record SAFEARRAY,
    cDims : UInt16,
    fFeatures : UInt16,
    cbElements : UInt32,
    cLocks : UInt32,
    pvData : Void*,
    rgsabound : Win32cr::System::Com::SAFEARRAYBOUND*

  @[Extern]
  record VARIANT,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      anonymous : Anonymous_e__Struct_,
      decVal : Win32cr::Foundation::DECIMAL do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        vt : UInt16,
        wReserved1 : UInt16,
        wReserved2 : UInt16,
        wReserved3 : UInt16,
        anonymous : Anonymous_e__Union_ do

        # Nested Type Anonymous_e__Union_
        @[Extern(union: true)]
        record Anonymous_e__Union_,
          llVal : Int64,
          lVal : Int32,
          bVal : UInt8,
          iVal : Int16,
          fltVal : Float32,
          dblVal : Float64,
          boolVal : Int16,
          __obsolete__variant_bool : Int16,
          scode : Int32,
          cyVal : Win32cr::System::Com::CY,
          date : Float64,
          bstrVal : Win32cr::Foundation::BSTR,
          punkVal : Void*,
          pdispVal : Void*,
          parray : Win32cr::System::Com::SAFEARRAY*,
          pbVal : UInt8*,
          piVal : Int16*,
          plVal : Int32*,
          pllVal : Int64*,
          pfltVal : Float32*,
          pdblVal : Float64*,
          pboolVal : Int16*,
          __obsolete__variant_pbool : Int16*,
          pscode : Int32*,
          pcyVal : Win32cr::System::Com::CY*,
          pdate : Float64*,
          pbstrVal : Win32cr::Foundation::BSTR*,
          ppunkVal : Void**,
          ppdispVal : Void**,
          pparray : Win32cr::System::Com::SAFEARRAY**,
          pvarVal : Win32cr::System::Com::VARIANT*,
          byref : Void*,
          cVal : Win32cr::Foundation::CHAR,
          uiVal : UInt16,
          ulVal : UInt32,
          ullVal : UInt64,
          intVal : Int32,
          uintVal : UInt32,
          pdecVal : Win32cr::Foundation::DECIMAL*,
          pcVal : Win32cr::Foundation::PSTR,
          puiVal : UInt16*,
          pulVal : UInt32*,
          pullVal : UInt64*,
          pintVal : Int32*,
          puintVal : UInt32*,
          anonymous : Anonymous_e__Struct_ do

          # Nested Type Anonymous_e__Struct_
          @[Extern]
          record Anonymous_e__Struct_,
            pvRecord : Void*,
            pRecInfo : Void*

        end

      end

    end

  end

  @[Extern]
  record TYPEDESC,
    anonymous : Anonymous_e__Union_,
    vt : UInt16 do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      lptdesc : Win32cr::System::Com::TYPEDESC*,
      lpadesc : Win32cr::System::Ole::ARRAYDESC*,
      hreftype : UInt32

  end

  @[Extern]
  record IDLDESC,
    dwReserved : LibC::UIntPtrT,
    wIDLFlags : UInt16

  @[Extern]
  record ELEMDESC,
    tdesc : Win32cr::System::Com::TYPEDESC,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      idldesc : Win32cr::System::Com::IDLDESC,
      paramdesc : Win32cr::System::Ole::PARAMDESC

  end

  @[Extern]
  record TYPEATTR,
    guid : LibC::GUID,
    lcid : UInt32,
    dwReserved : UInt32,
    memidConstructor : Int32,
    memidDestructor : Int32,
    lpstrSchema : Win32cr::Foundation::PWSTR,
    cbSizeInstance : UInt32,
    typekind : Win32cr::System::Com::TYPEKIND,
    cFuncs : UInt16,
    cVars : UInt16,
    cImplTypes : UInt16,
    cbSizeVft : UInt16,
    cbAlignment : UInt16,
    wTypeFlags : UInt16,
    wMajorVerNum : UInt16,
    wMinorVerNum : UInt16,
    tdescAlias : Win32cr::System::Com::TYPEDESC,
    idldescType : Win32cr::System::Com::IDLDESC

  @[Extern]
  record DISPPARAMS,
    rgvarg : Win32cr::System::Com::VARIANT*,
    rgdispidNamedArgs : Int32*,
    cArgs : UInt32,
    cNamedArgs : UInt32

  @[Extern]
  record EXCEPINFO,
    wCode : UInt16,
    wReserved : UInt16,
    bstrSource : Win32cr::Foundation::BSTR,
    bstrDescription : Win32cr::Foundation::BSTR,
    bstrHelpFile : Win32cr::Foundation::BSTR,
    dwHelpContext : UInt32,
    pvReserved : Void*,
    pfnDeferredFillIn : Win32cr::System::Com::LPEXCEPFINO_DEFERRED_FILLIN,
    scode : Int32

  @[Extern]
  record FUNCDESC,
    memid : Int32,
    lprgscode : Int32*,
    lprgelemdescParam : Win32cr::System::Com::ELEMDESC*,
    funckind : Win32cr::System::Com::FUNCKIND,
    invkind : Win32cr::System::Com::INVOKEKIND,
    callconv : Win32cr::System::Com::CALLCONV,
    cParams : Int16,
    cParamsOpt : Int16,
    oVft : Int16,
    cScodes : Int16,
    elemdescFunc : Win32cr::System::Com::ELEMDESC,
    wFuncFlags : UInt16

  @[Extern]
  record VARDESC,
    memid : Int32,
    lpstrSchema : Win32cr::Foundation::PWSTR,
    anonymous : Anonymous_e__Union_,
    elemdescVar : Win32cr::System::Com::ELEMDESC,
    wVarFlags : UInt16,
    varkind : Win32cr::System::Com::VARKIND do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      oInst : UInt32,
      lpvarValue : Win32cr::System::Com::VARIANT*

  end

  @[Extern]
  record CUSTDATAITEM,
    guid : LibC::GUID,
    varValue : Win32cr::System::Com::VARIANT

  @[Extern]
  record CUSTDATA,
    cCustData : UInt32,
    prgCustData : Win32cr::System::Com::CUSTDATAITEM*

  @[Extern(union: true)]
  record BINDPTR,
    lpfuncdesc : Win32cr::System::Com::FUNCDESC*,
    lpvardesc : Win32cr::System::Com::VARDESC*,
    lptcomp : Void*

  @[Extern]
  record TLIBATTR,
    guid : LibC::GUID,
    lcid : UInt32,
    syskind : Win32cr::System::Com::SYSKIND,
    wMajorVerNum : UInt16,
    wMinorVerNum : UInt16,
    wLibFlags : UInt16

  @[Extern]
  record CONNECTDATA,
    pUnk : Void*,
    dwCookie : UInt32

  @[Extern]
  record IUnknownVtbl,
    query_interface : Proc(IUnknown*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUnknown*, UInt32),
    release : Proc(IUnknown*, UInt32)


  @[Extern]
  #@[Com("00000000-0000-0000-c000-000000000046")]
  record IUnknown, lpVtbl : IUnknownVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IUnknown*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUnknown*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUnknown*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record AsyncIUnknownVtbl,
    query_interface : Proc(AsyncIUnknown*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIUnknown*, UInt32),
    release : Proc(AsyncIUnknown*, UInt32),
    begin_query_interface : Proc(AsyncIUnknown*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    finish_query_interface : Proc(AsyncIUnknown*, Void**, Win32cr::Foundation::HRESULT),
    begin_add_ref : Proc(AsyncIUnknown*, Win32cr::Foundation::HRESULT),
    finish_add_ref : Proc(AsyncIUnknown*, UInt32),
    begin_release : Proc(AsyncIUnknown*, Win32cr::Foundation::HRESULT),
    finish_release : Proc(AsyncIUnknown*, UInt32)


  @[Extern]
  #@[Com("000e0000-0000-0000-c000-000000000046")]
  record AsyncIUnknown, lpVtbl : AsyncIUnknownVtbl* do
    GUID = LibC::GUID.new(0xe0000_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : AsyncIUnknown*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIUnknown*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIUnknown*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_query_interface(this : AsyncIUnknown*, riid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_query_interface.call(this, riid)
    end
    def finish_query_interface(this : AsyncIUnknown*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_query_interface.call(this, ppvObject)
    end
    def begin_add_ref(this : AsyncIUnknown*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_add_ref.call(this)
    end
    def finish_add_ref(this : AsyncIUnknown*) : UInt32
      @lpVtbl.try &.value.finish_add_ref.call(this)
    end
    def begin_release(this : AsyncIUnknown*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_release.call(this)
    end
    def finish_release(this : AsyncIUnknown*) : UInt32
      @lpVtbl.try &.value.finish_release.call(this)
    end

  end

  @[Extern]
  record IClassFactoryVtbl,
    query_interface : Proc(IClassFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IClassFactory*, UInt32),
    release : Proc(IClassFactory*, UInt32),
    create_instance : Proc(IClassFactory*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    lock_server : Proc(IClassFactory*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000001-0000-0000-c000-000000000046")]
  record IClassFactory, lpVtbl : IClassFactoryVtbl* do
    GUID = LibC::GUID.new(0x1_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IClassFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IClassFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IClassFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instance(this : IClassFactory*, pUnkOuter : Void*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pUnkOuter, riid, ppvObject)
    end
    def lock_server(this : IClassFactory*, fLock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_server.call(this, fLock)
    end

  end

  @[Extern]
  record INoMarshalVtbl,
    query_interface : Proc(INoMarshal*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INoMarshal*, UInt32),
    release : Proc(INoMarshal*, UInt32)


  @[Extern]
  #@[Com("ecc8691b-c1db-4dc0-855e-65f6c551af49")]
  record INoMarshal, lpVtbl : INoMarshalVtbl* do
    GUID = LibC::GUID.new(0xecc8691b_u32, 0xc1db_u16, 0x4dc0_u16, StaticArray[0x85_u8, 0x5e_u8, 0x65_u8, 0xf6_u8, 0xc5_u8, 0x51_u8, 0xaf_u8, 0x49_u8])
    def query_interface(this : INoMarshal*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INoMarshal*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INoMarshal*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IAgileObjectVtbl,
    query_interface : Proc(IAgileObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAgileObject*, UInt32),
    release : Proc(IAgileObject*, UInt32)


  @[Extern]
  #@[Com("94ea2b94-e9cc-49e0-c0ff-ee64ca8f5b90")]
  record IAgileObject, lpVtbl : IAgileObjectVtbl* do
    GUID = LibC::GUID.new(0x94ea2b94_u32, 0xe9cc_u16, 0x49e0_u16, StaticArray[0xc0_u8, 0xff_u8, 0xee_u8, 0x64_u8, 0xca_u8, 0x8f_u8, 0x5b_u8, 0x90_u8])
    def query_interface(this : IAgileObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAgileObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAgileObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IActivationFilterVtbl,
    query_interface : Proc(IActivationFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActivationFilter*, UInt32),
    release : Proc(IActivationFilter*, UInt32),
    handle_activation : Proc(IActivationFilter*, UInt32, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000017-0000-0000-c000-000000000046")]
  record IActivationFilter, lpVtbl : IActivationFilterVtbl* do
    GUID = LibC::GUID.new(0x17_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IActivationFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActivationFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActivationFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_activation(this : IActivationFilter*, dwActivationType : UInt32, rclsid : LibC::GUID*, pReplacementClsId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_activation.call(this, dwActivationType, rclsid, pReplacementClsId)
    end

  end

  @[Extern]
  record IMallocVtbl,
    query_interface : Proc(IMalloc*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMalloc*, UInt32),
    release : Proc(IMalloc*, UInt32),
    alloc : Proc(IMalloc*, LibC::UIntPtrT, Void*),
    realloc : Proc(IMalloc*, Void*, LibC::UIntPtrT, Void*),
    free : Proc(IMalloc*, Void*, Void),
    get_size : Proc(IMalloc*, Void*, LibC::UIntPtrT),
    did_alloc : Proc(IMalloc*, Void*, Int32),
    heap_minimize : Proc(IMalloc*, Void)


  @[Extern]
  #@[Com("00000002-0000-0000-c000-000000000046")]
  record IMalloc, lpVtbl : IMallocVtbl* do
    GUID = LibC::GUID.new(0x2_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IMalloc*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMalloc*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMalloc*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def alloc(this : IMalloc*, cb : LibC::UIntPtrT) : Void*
      @lpVtbl.try &.value.alloc.call(this, cb)
    end
    def realloc(this : IMalloc*, pv : Void*, cb : LibC::UIntPtrT) : Void*
      @lpVtbl.try &.value.realloc.call(this, pv, cb)
    end
    def free(this : IMalloc*, pv : Void*) : Void
      @lpVtbl.try &.value.free.call(this, pv)
    end
    def get_size(this : IMalloc*, pv : Void*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_size.call(this, pv)
    end
    def did_alloc(this : IMalloc*, pv : Void*) : Int32
      @lpVtbl.try &.value.did_alloc.call(this, pv)
    end
    def heap_minimize(this : IMalloc*) : Void
      @lpVtbl.try &.value.heap_minimize.call(this)
    end

  end

  @[Extern]
  record IStdMarshalInfoVtbl,
    query_interface : Proc(IStdMarshalInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStdMarshalInfo*, UInt32),
    release : Proc(IStdMarshalInfo*, UInt32),
    get_class_for_handler : Proc(IStdMarshalInfo*, UInt32, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000018-0000-0000-c000-000000000046")]
  record IStdMarshalInfo, lpVtbl : IStdMarshalInfoVtbl* do
    GUID = LibC::GUID.new(0x18_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IStdMarshalInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStdMarshalInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStdMarshalInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_for_handler(this : IStdMarshalInfo*, dwDestContext : UInt32, pvDestContext : Void*, pClsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_for_handler.call(this, dwDestContext, pvDestContext, pClsid)
    end

  end

  @[Extern]
  record IExternalConnectionVtbl,
    query_interface : Proc(IExternalConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExternalConnection*, UInt32),
    release : Proc(IExternalConnection*, UInt32),
    add_connection : Proc(IExternalConnection*, UInt32, UInt32, UInt32),
    release_connection : Proc(IExternalConnection*, UInt32, UInt32, Win32cr::Foundation::BOOL, UInt32)


  @[Extern]
  #@[Com("00000019-0000-0000-c000-000000000046")]
  record IExternalConnection, lpVtbl : IExternalConnectionVtbl* do
    GUID = LibC::GUID.new(0x19_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IExternalConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExternalConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExternalConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_connection(this : IExternalConnection*, extconn : UInt32, reserved : UInt32) : UInt32
      @lpVtbl.try &.value.add_connection.call(this, extconn, reserved)
    end
    def release_connection(this : IExternalConnection*, extconn : UInt32, reserved : UInt32, fLastReleaseCloses : Win32cr::Foundation::BOOL) : UInt32
      @lpVtbl.try &.value.release_connection.call(this, extconn, reserved, fLastReleaseCloses)
    end

  end

  @[Extern]
  record IMultiQIVtbl,
    query_interface : Proc(IMultiQI*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMultiQI*, UInt32),
    release : Proc(IMultiQI*, UInt32),
    query_multiple_interfaces : Proc(IMultiQI*, UInt32, Win32cr::System::Com::MULTI_QI*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000020-0000-0000-c000-000000000046")]
  record IMultiQI, lpVtbl : IMultiQIVtbl* do
    GUID = LibC::GUID.new(0x20_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IMultiQI*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMultiQI*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMultiQI*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_multiple_interfaces(this : IMultiQI*, cMQIs : UInt32, pMQIs : Win32cr::System::Com::MULTI_QI*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_multiple_interfaces.call(this, cMQIs, pMQIs)
    end

  end

  @[Extern]
  record AsyncIMultiQIVtbl,
    query_interface : Proc(AsyncIMultiQI*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIMultiQI*, UInt32),
    release : Proc(AsyncIMultiQI*, UInt32),
    begin_query_multiple_interfaces : Proc(AsyncIMultiQI*, UInt32, Win32cr::System::Com::MULTI_QI*, Win32cr::Foundation::HRESULT),
    finish_query_multiple_interfaces : Proc(AsyncIMultiQI*, Win32cr::System::Com::MULTI_QI*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("000e0020-0000-0000-c000-000000000046")]
  record AsyncIMultiQI, lpVtbl : AsyncIMultiQIVtbl* do
    GUID = LibC::GUID.new(0xe0020_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : AsyncIMultiQI*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIMultiQI*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIMultiQI*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_query_multiple_interfaces(this : AsyncIMultiQI*, cMQIs : UInt32, pMQIs : Win32cr::System::Com::MULTI_QI*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_query_multiple_interfaces.call(this, cMQIs, pMQIs)
    end
    def finish_query_multiple_interfaces(this : AsyncIMultiQI*, pMQIs : Win32cr::System::Com::MULTI_QI*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_query_multiple_interfaces.call(this, pMQIs)
    end

  end

  @[Extern]
  record IInternalUnknownVtbl,
    query_interface : Proc(IInternalUnknown*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInternalUnknown*, UInt32),
    release : Proc(IInternalUnknown*, UInt32),
    query_internal_interface : Proc(IInternalUnknown*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000021-0000-0000-c000-000000000046")]
  record IInternalUnknown, lpVtbl : IInternalUnknownVtbl* do
    GUID = LibC::GUID.new(0x21_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IInternalUnknown*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInternalUnknown*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInternalUnknown*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_internal_interface(this : IInternalUnknown*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_internal_interface.call(this, riid, ppv)
    end

  end

  @[Extern]
  record IEnumUnknownVtbl,
    query_interface : Proc(IEnumUnknown*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumUnknown*, UInt32),
    release : Proc(IEnumUnknown*, UInt32),
    next__ : Proc(IEnumUnknown*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumUnknown*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumUnknown*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumUnknown*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000100-0000-0000-c000-000000000046")]
  record IEnumUnknown, lpVtbl : IEnumUnknownVtbl* do
    GUID = LibC::GUID.new(0x100_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumUnknown*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumUnknown*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumUnknown*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumUnknown*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumUnknown*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumUnknown*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumUnknown*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IEnumStringVtbl,
    query_interface : Proc(IEnumString*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumString*, UInt32),
    release : Proc(IEnumString*, UInt32),
    next__ : Proc(IEnumString*, UInt32, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumString*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumString*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumString*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000101-0000-0000-c000-000000000046")]
  record IEnumString, lpVtbl : IEnumStringVtbl* do
    GUID = LibC::GUID.new(0x101_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumString*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumString*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumString*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumString*, celt : UInt32, rgelt : Win32cr::Foundation::PWSTR*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumString*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumString*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumString*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record ISequentialStreamVtbl,
    query_interface : Proc(ISequentialStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISequentialStream*, UInt32),
    release : Proc(ISequentialStream*, UInt32),
    read : Proc(ISequentialStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(ISequentialStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0c733a30-2a1c-11ce-ade5-00aa0044773d")]
  record ISequentialStream, lpVtbl : ISequentialStreamVtbl* do
    GUID = LibC::GUID.new(0xc733a30_u32, 0x2a1c_u16, 0x11ce_u16, StaticArray[0xad_u8, 0xe5_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x44_u8, 0x77_u8, 0x3d_u8])
    def query_interface(this : ISequentialStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISequentialStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISequentialStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : ISequentialStream*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : ISequentialStream*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end

  end

  @[Extern]
  record IStreamVtbl,
    query_interface : Proc(IStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStream*, UInt32),
    release : Proc(IStream*, UInt32),
    read : Proc(IStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(IStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(IStream*, Win32cr::Foundation::LARGE_INTEGER, Win32cr::System::Com::STREAM_SEEK, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    set_size : Proc(IStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IStream*, Void*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    commit : Proc(IStream*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(IStream*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(IStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(IStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(IStream*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IStream*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000000c-0000-0000-c000-000000000046")]
  record IStream, lpVtbl : IStreamVtbl* do
    GUID = LibC::GUID.new(0xc_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : IStream*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : IStream*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def seek(this : IStream*, dlibMove : Win32cr::Foundation::LARGE_INTEGER, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : IStream*, libNewSize : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : IStream*, pstm : Void*, cb : Win32cr::Foundation::ULARGE_INTEGER, pcbRead : Win32cr::Foundation::ULARGE_INTEGER*, pcbWritten : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : IStream*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : IStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : IStream*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : IStream*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : IStream*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end
    def clone(this : IStream*, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppstm)
    end

  end

  @[Extern]
  record IRpcChannelBufferVtbl,
    query_interface : Proc(IRpcChannelBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRpcChannelBuffer*, UInt32),
    release : Proc(IRpcChannelBuffer*, UInt32),
    get_buffer : Proc(IRpcChannelBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    send_receive : Proc(IRpcChannelBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32*, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(IRpcChannelBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, Win32cr::Foundation::HRESULT),
    get_dest_ctx : Proc(IRpcChannelBuffer*, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    is_connected : Proc(IRpcChannelBuffer*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d5f56b60-593b-101a-b569-08002b2dbf7a")]
  record IRpcChannelBuffer, lpVtbl : IRpcChannelBufferVtbl* do
    GUID = LibC::GUID.new(0xd5f56b60_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
    def query_interface(this : IRpcChannelBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRpcChannelBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRpcChannelBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer(this : IRpcChannelBuffer*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*, riid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, pMessage, riid)
    end
    def send_receive(this : IRpcChannelBuffer*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_receive.call(this, pMessage, pStatus)
    end
    def free_buffer(this : IRpcChannelBuffer*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this, pMessage)
    end
    def get_dest_ctx(this : IRpcChannelBuffer*, pdwDestContext : UInt32*, ppvDestContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dest_ctx.call(this, pdwDestContext, ppvDestContext)
    end
    def is_connected(this : IRpcChannelBuffer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_connected.call(this)
    end

  end

  @[Extern]
  record IRpcChannelBuffer2Vtbl,
    query_interface : Proc(IRpcChannelBuffer2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRpcChannelBuffer2*, UInt32),
    release : Proc(IRpcChannelBuffer2*, UInt32),
    get_buffer : Proc(IRpcChannelBuffer2*, Win32cr::System::Com::RPCOLEMESSAGE*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    send_receive : Proc(IRpcChannelBuffer2*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32*, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(IRpcChannelBuffer2*, Win32cr::System::Com::RPCOLEMESSAGE*, Win32cr::Foundation::HRESULT),
    get_dest_ctx : Proc(IRpcChannelBuffer2*, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    is_connected : Proc(IRpcChannelBuffer2*, Win32cr::Foundation::HRESULT),
    get_protocol_version : Proc(IRpcChannelBuffer2*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("594f31d0-7f19-11d0-b194-00a0c90dc8bf")]
  record IRpcChannelBuffer2, lpVtbl : IRpcChannelBuffer2Vtbl* do
    GUID = LibC::GUID.new(0x594f31d0_u32, 0x7f19_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x94_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0xc8_u8, 0xbf_u8])
    def query_interface(this : IRpcChannelBuffer2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRpcChannelBuffer2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRpcChannelBuffer2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer(this : IRpcChannelBuffer2*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*, riid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, pMessage, riid)
    end
    def send_receive(this : IRpcChannelBuffer2*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_receive.call(this, pMessage, pStatus)
    end
    def free_buffer(this : IRpcChannelBuffer2*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this, pMessage)
    end
    def get_dest_ctx(this : IRpcChannelBuffer2*, pdwDestContext : UInt32*, ppvDestContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dest_ctx.call(this, pdwDestContext, ppvDestContext)
    end
    def is_connected(this : IRpcChannelBuffer2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_connected.call(this)
    end
    def get_protocol_version(this : IRpcChannelBuffer2*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_version.call(this, pdwVersion)
    end

  end

  @[Extern]
  record IAsyncRpcChannelBufferVtbl,
    query_interface : Proc(IAsyncRpcChannelBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAsyncRpcChannelBuffer*, UInt32),
    release : Proc(IAsyncRpcChannelBuffer*, UInt32),
    get_buffer : Proc(IAsyncRpcChannelBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    send_receive : Proc(IAsyncRpcChannelBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32*, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(IAsyncRpcChannelBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, Win32cr::Foundation::HRESULT),
    get_dest_ctx : Proc(IAsyncRpcChannelBuffer*, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    is_connected : Proc(IAsyncRpcChannelBuffer*, Win32cr::Foundation::HRESULT),
    get_protocol_version : Proc(IAsyncRpcChannelBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    send : Proc(IAsyncRpcChannelBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    receive : Proc(IAsyncRpcChannelBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32*, Win32cr::Foundation::HRESULT),
    get_dest_ctx_ex : Proc(IAsyncRpcChannelBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a5029fb6-3c34-11d1-9c99-00c04fb998aa")]
  record IAsyncRpcChannelBuffer, lpVtbl : IAsyncRpcChannelBufferVtbl* do
    GUID = LibC::GUID.new(0xa5029fb6_u32, 0x3c34_u16, 0x11d1_u16, StaticArray[0x9c_u8, 0x99_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0xaa_u8])
    def query_interface(this : IAsyncRpcChannelBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAsyncRpcChannelBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAsyncRpcChannelBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer(this : IAsyncRpcChannelBuffer*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*, riid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, pMessage, riid)
    end
    def send_receive(this : IAsyncRpcChannelBuffer*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_receive.call(this, pMessage, pStatus)
    end
    def free_buffer(this : IAsyncRpcChannelBuffer*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this, pMessage)
    end
    def get_dest_ctx(this : IAsyncRpcChannelBuffer*, pdwDestContext : UInt32*, ppvDestContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dest_ctx.call(this, pdwDestContext, ppvDestContext)
    end
    def is_connected(this : IAsyncRpcChannelBuffer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_connected.call(this)
    end
    def get_protocol_version(this : IAsyncRpcChannelBuffer*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_version.call(this, pdwVersion)
    end
    def send(this : IAsyncRpcChannelBuffer*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, pSync : Void*, pulStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send.call(this, pMsg, pSync, pulStatus)
    end
    def receive(this : IAsyncRpcChannelBuffer*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, pulStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive.call(this, pMsg, pulStatus)
    end
    def get_dest_ctx_ex(this : IAsyncRpcChannelBuffer*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, pdwDestContext : UInt32*, ppvDestContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dest_ctx_ex.call(this, pMsg, pdwDestContext, ppvDestContext)
    end

  end

  @[Extern]
  record IRpcChannelBuffer3Vtbl,
    query_interface : Proc(IRpcChannelBuffer3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRpcChannelBuffer3*, UInt32),
    release : Proc(IRpcChannelBuffer3*, UInt32),
    get_buffer : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    send_receive : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32*, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, Win32cr::Foundation::HRESULT),
    get_dest_ctx : Proc(IRpcChannelBuffer3*, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    is_connected : Proc(IRpcChannelBuffer3*, Win32cr::Foundation::HRESULT),
    get_protocol_version : Proc(IRpcChannelBuffer3*, UInt32*, Win32cr::Foundation::HRESULT),
    send : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32*, Win32cr::Foundation::HRESULT),
    receive : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, Win32cr::Foundation::HRESULT),
    get_call_context : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_dest_ctx_ex : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_state : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32*, Win32cr::Foundation::HRESULT),
    register_async : Proc(IRpcChannelBuffer3*, Win32cr::System::Com::RPCOLEMESSAGE*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("25b15600-0115-11d0-bf0d-00aa00b8dfd2")]
  record IRpcChannelBuffer3, lpVtbl : IRpcChannelBuffer3Vtbl* do
    GUID = LibC::GUID.new(0x25b15600_u32, 0x115_u16, 0x11d0_u16, StaticArray[0xbf_u8, 0xd_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb8_u8, 0xdf_u8, 0xd2_u8])
    def query_interface(this : IRpcChannelBuffer3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRpcChannelBuffer3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRpcChannelBuffer3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer(this : IRpcChannelBuffer3*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*, riid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, pMessage, riid)
    end
    def send_receive(this : IRpcChannelBuffer3*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_receive.call(this, pMessage, pStatus)
    end
    def free_buffer(this : IRpcChannelBuffer3*, pMessage : Win32cr::System::Com::RPCOLEMESSAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this, pMessage)
    end
    def get_dest_ctx(this : IRpcChannelBuffer3*, pdwDestContext : UInt32*, ppvDestContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dest_ctx.call(this, pdwDestContext, ppvDestContext)
    end
    def is_connected(this : IRpcChannelBuffer3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_connected.call(this)
    end
    def get_protocol_version(this : IRpcChannelBuffer3*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_version.call(this, pdwVersion)
    end
    def send(this : IRpcChannelBuffer3*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, pulStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send.call(this, pMsg, pulStatus)
    end
    def receive(this : IRpcChannelBuffer3*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, ulSize : UInt32, pulStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.receive.call(this, pMsg, ulSize, pulStatus)
    end
    def cancel(this : IRpcChannelBuffer3*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this, pMsg)
    end
    def get_call_context(this : IRpcChannelBuffer3*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, riid : LibC::GUID*, pInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_call_context.call(this, pMsg, riid, pInterface)
    end
    def get_dest_ctx_ex(this : IRpcChannelBuffer3*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, pdwDestContext : UInt32*, ppvDestContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dest_ctx_ex.call(this, pMsg, pdwDestContext, ppvDestContext)
    end
    def get_state(this : IRpcChannelBuffer3*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, pState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pMsg, pState)
    end
    def register_async(this : IRpcChannelBuffer3*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, pAsyncMgr : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_async.call(this, pMsg, pAsyncMgr)
    end

  end

  @[Extern]
  record IRpcSyntaxNegotiateVtbl,
    query_interface : Proc(IRpcSyntaxNegotiate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRpcSyntaxNegotiate*, UInt32),
    release : Proc(IRpcSyntaxNegotiate*, UInt32),
    negotiate_syntax : Proc(IRpcSyntaxNegotiate*, Win32cr::System::Com::RPCOLEMESSAGE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("58a08519-24c8-4935-b482-3fd823333a4f")]
  record IRpcSyntaxNegotiate, lpVtbl : IRpcSyntaxNegotiateVtbl* do
    GUID = LibC::GUID.new(0x58a08519_u32, 0x24c8_u16, 0x4935_u16, StaticArray[0xb4_u8, 0x82_u8, 0x3f_u8, 0xd8_u8, 0x23_u8, 0x33_u8, 0x3a_u8, 0x4f_u8])
    def query_interface(this : IRpcSyntaxNegotiate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRpcSyntaxNegotiate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRpcSyntaxNegotiate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def negotiate_syntax(this : IRpcSyntaxNegotiate*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.negotiate_syntax.call(this, pMsg)
    end

  end

  @[Extern]
  record IRpcProxyBufferVtbl,
    query_interface : Proc(IRpcProxyBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRpcProxyBuffer*, UInt32),
    release : Proc(IRpcProxyBuffer*, UInt32),
    connect : Proc(IRpcProxyBuffer*, Void*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IRpcProxyBuffer*, Void)


  @[Extern]
  #@[Com("d5f56a34-593b-101a-b569-08002b2dbf7a")]
  record IRpcProxyBuffer, lpVtbl : IRpcProxyBufferVtbl* do
    GUID = LibC::GUID.new(0xd5f56a34_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
    def query_interface(this : IRpcProxyBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRpcProxyBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRpcProxyBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connect(this : IRpcProxyBuffer*, pRpcChannelBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, pRpcChannelBuffer)
    end
    def disconnect(this : IRpcProxyBuffer*) : Void
      @lpVtbl.try &.value.disconnect.call(this)
    end

  end

  @[Extern]
  record IRpcStubBufferVtbl,
    query_interface : Proc(IRpcStubBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRpcStubBuffer*, UInt32),
    release : Proc(IRpcStubBuffer*, UInt32),
    connect : Proc(IRpcStubBuffer*, Void*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IRpcStubBuffer*, Void),
    invoke : Proc(IRpcStubBuffer*, Win32cr::System::Com::RPCOLEMESSAGE*, Void*, Win32cr::Foundation::HRESULT),
    is_iid_supported : Proc(IRpcStubBuffer*, LibC::GUID*, Void*),
    count_refs : Proc(IRpcStubBuffer*, UInt32),
    debug_server_query_interface : Proc(IRpcStubBuffer*, Void**, Win32cr::Foundation::HRESULT),
    debug_server_release : Proc(IRpcStubBuffer*, Void*, Void)


  @[Extern]
  #@[Com("d5f56afc-593b-101a-b569-08002b2dbf7a")]
  record IRpcStubBuffer, lpVtbl : IRpcStubBufferVtbl* do
    GUID = LibC::GUID.new(0xd5f56afc_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
    def query_interface(this : IRpcStubBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRpcStubBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRpcStubBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connect(this : IRpcStubBuffer*, pUnkServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, pUnkServer)
    end
    def disconnect(this : IRpcStubBuffer*) : Void
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def invoke(this : IRpcStubBuffer*, _prpcmsg : Win32cr::System::Com::RPCOLEMESSAGE*, _p_rpc_channel_buffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, _prpcmsg, _p_rpc_channel_buffer)
    end
    def is_iid_supported(this : IRpcStubBuffer*, riid : LibC::GUID*) : Void*
      @lpVtbl.try &.value.is_iid_supported.call(this, riid)
    end
    def count_refs(this : IRpcStubBuffer*) : UInt32
      @lpVtbl.try &.value.count_refs.call(this)
    end
    def debug_server_query_interface(this : IRpcStubBuffer*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.debug_server_query_interface.call(this, ppv)
    end
    def debug_server_release(this : IRpcStubBuffer*, pv : Void*) : Void
      @lpVtbl.try &.value.debug_server_release.call(this, pv)
    end

  end

  @[Extern]
  record IPSFactoryBufferVtbl,
    query_interface : Proc(IPSFactoryBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPSFactoryBuffer*, UInt32),
    release : Proc(IPSFactoryBuffer*, UInt32),
    create_proxy : Proc(IPSFactoryBuffer*, Void*, LibC::GUID*, Void**, Void**, Win32cr::Foundation::HRESULT),
    create_stub : Proc(IPSFactoryBuffer*, LibC::GUID*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d5f569d0-593b-101a-b569-08002b2dbf7a")]
  record IPSFactoryBuffer, lpVtbl : IPSFactoryBufferVtbl* do
    GUID = LibC::GUID.new(0xd5f569d0_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
    def query_interface(this : IPSFactoryBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPSFactoryBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPSFactoryBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_proxy(this : IPSFactoryBuffer*, pUnkOuter : Void*, riid : LibC::GUID*, ppProxy : Void**, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_proxy.call(this, pUnkOuter, riid, ppProxy, ppv)
    end
    def create_stub(this : IPSFactoryBuffer*, riid : LibC::GUID*, pUnkServer : Void*, ppStub : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stub.call(this, riid, pUnkServer, ppStub)
    end

  end

  @[Extern]
  record IChannelHookVtbl,
    query_interface : Proc(IChannelHook*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IChannelHook*, UInt32),
    release : Proc(IChannelHook*, UInt32),
    client_get_size : Proc(IChannelHook*, LibC::GUID*, LibC::GUID*, UInt32*, Void),
    client_fill_buffer : Proc(IChannelHook*, LibC::GUID*, LibC::GUID*, UInt32*, Void*, Void),
    client_notify : Proc(IChannelHook*, LibC::GUID*, LibC::GUID*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT, Void),
    server_notify : Proc(IChannelHook*, LibC::GUID*, LibC::GUID*, UInt32, Void*, UInt32, Void),
    server_get_size : Proc(IChannelHook*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT, UInt32*, Void),
    server_fill_buffer : Proc(IChannelHook*, LibC::GUID*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT, Void)


  @[Extern]
  #@[Com("1008c4a0-7613-11cf-9af1-0020af6e72f4")]
  record IChannelHook, lpVtbl : IChannelHookVtbl* do
    GUID = LibC::GUID.new(0x1008c4a0_u32, 0x7613_u16, 0x11cf_u16, StaticArray[0x9a_u8, 0xf1_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0x6e_u8, 0x72_u8, 0xf4_u8])
    def query_interface(this : IChannelHook*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IChannelHook*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IChannelHook*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def client_get_size(this : IChannelHook*, uExtent : LibC::GUID*, riid : LibC::GUID*, pDataSize : UInt32*) : Void
      @lpVtbl.try &.value.client_get_size.call(this, uExtent, riid, pDataSize)
    end
    def client_fill_buffer(this : IChannelHook*, uExtent : LibC::GUID*, riid : LibC::GUID*, pDataSize : UInt32*, pDataBuffer : Void*) : Void
      @lpVtbl.try &.value.client_fill_buffer.call(this, uExtent, riid, pDataSize, pDataBuffer)
    end
    def client_notify(this : IChannelHook*, uExtent : LibC::GUID*, riid : LibC::GUID*, cbDataSize : UInt32, pDataBuffer : Void*, lDataRep : UInt32, hrFault : Win32cr::Foundation::HRESULT) : Void
      @lpVtbl.try &.value.client_notify.call(this, uExtent, riid, cbDataSize, pDataBuffer, lDataRep, hrFault)
    end
    def server_notify(this : IChannelHook*, uExtent : LibC::GUID*, riid : LibC::GUID*, cbDataSize : UInt32, pDataBuffer : Void*, lDataRep : UInt32) : Void
      @lpVtbl.try &.value.server_notify.call(this, uExtent, riid, cbDataSize, pDataBuffer, lDataRep)
    end
    def server_get_size(this : IChannelHook*, uExtent : LibC::GUID*, riid : LibC::GUID*, hrFault : Win32cr::Foundation::HRESULT, pDataSize : UInt32*) : Void
      @lpVtbl.try &.value.server_get_size.call(this, uExtent, riid, hrFault, pDataSize)
    end
    def server_fill_buffer(this : IChannelHook*, uExtent : LibC::GUID*, riid : LibC::GUID*, pDataSize : UInt32*, pDataBuffer : Void*, hrFault : Win32cr::Foundation::HRESULT) : Void
      @lpVtbl.try &.value.server_fill_buffer.call(this, uExtent, riid, pDataSize, pDataBuffer, hrFault)
    end

  end

  @[Extern]
  record IClientSecurityVtbl,
    query_interface : Proc(IClientSecurity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IClientSecurity*, UInt32),
    release : Proc(IClientSecurity*, UInt32),
    query_blanket : Proc(IClientSecurity*, Void*, UInt32*, UInt32*, UInt16**, Win32cr::System::Com::RPC_C_AUTHN_LEVEL*, Win32cr::System::Com::RPC_C_IMP_LEVEL*, Void**, Win32cr::System::Com::EOLE_AUTHENTICATION_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    set_blanket : Proc(IClientSecurity*, Void*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::System::Com::RPC_C_AUTHN_LEVEL, Win32cr::System::Com::RPC_C_IMP_LEVEL, Void*, Win32cr::System::Com::EOLE_AUTHENTICATION_CAPABILITIES, Win32cr::Foundation::HRESULT),
    copy_proxy : Proc(IClientSecurity*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000013d-0000-0000-c000-000000000046")]
  record IClientSecurity, lpVtbl : IClientSecurityVtbl* do
    GUID = LibC::GUID.new(0x13d_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IClientSecurity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IClientSecurity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IClientSecurity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_blanket(this : IClientSecurity*, pProxy : Void*, pAuthnSvc : UInt32*, pAuthzSvc : UInt32*, pServerPrincName : UInt16**, pAuthnLevel : Win32cr::System::Com::RPC_C_AUTHN_LEVEL*, pImpLevel : Win32cr::System::Com::RPC_C_IMP_LEVEL*, pAuthInfo : Void**, pCapabilites : Win32cr::System::Com::EOLE_AUTHENTICATION_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_blanket.call(this, pProxy, pAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, pAuthInfo, pCapabilites)
    end
    def set_blanket(this : IClientSecurity*, pProxy : Void*, dwAuthnSvc : UInt32, dwAuthzSvc : UInt32, pServerPrincName : Win32cr::Foundation::PWSTR, dwAuthnLevel : Win32cr::System::Com::RPC_C_AUTHN_LEVEL, dwImpLevel : Win32cr::System::Com::RPC_C_IMP_LEVEL, pAuthInfo : Void*, dwCapabilities : Win32cr::System::Com::EOLE_AUTHENTICATION_CAPABILITIES) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blanket.call(this, pProxy, dwAuthnSvc, dwAuthzSvc, pServerPrincName, dwAuthnLevel, dwImpLevel, pAuthInfo, dwCapabilities)
    end
    def copy_proxy(this : IClientSecurity*, pProxy : Void*, ppCopy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_proxy.call(this, pProxy, ppCopy)
    end

  end

  @[Extern]
  record IServerSecurityVtbl,
    query_interface : Proc(IServerSecurity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServerSecurity*, UInt32),
    release : Proc(IServerSecurity*, UInt32),
    query_blanket : Proc(IServerSecurity*, UInt32*, UInt32*, UInt16**, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    impersonate_client : Proc(IServerSecurity*, Win32cr::Foundation::HRESULT),
    revert_to_self : Proc(IServerSecurity*, Win32cr::Foundation::HRESULT),
    is_impersonating : Proc(IServerSecurity*, Win32cr::Foundation::BOOL)


  @[Extern]
  #@[Com("0000013e-0000-0000-c000-000000000046")]
  record IServerSecurity, lpVtbl : IServerSecurityVtbl* do
    GUID = LibC::GUID.new(0x13e_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IServerSecurity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServerSecurity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServerSecurity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_blanket(this : IServerSecurity*, pAuthnSvc : UInt32*, pAuthzSvc : UInt32*, pServerPrincName : UInt16**, pAuthnLevel : UInt32*, pImpLevel : UInt32*, pPrivs : Void**, pCapabilities : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_blanket.call(this, pAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, pPrivs, pCapabilities)
    end
    def impersonate_client(this : IServerSecurity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.impersonate_client.call(this)
    end
    def revert_to_self(this : IServerSecurity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert_to_self.call(this)
    end
    def is_impersonating(this : IServerSecurity*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_impersonating.call(this)
    end

  end

  @[Extern]
  record IRpcOptionsVtbl,
    query_interface : Proc(IRpcOptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRpcOptions*, UInt32),
    release : Proc(IRpcOptions*, UInt32),
    set : Proc(IRpcOptions*, Void*, Win32cr::System::Com::RPCOPT_PROPERTIES, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    query : Proc(IRpcOptions*, Void*, Win32cr::System::Com::RPCOPT_PROPERTIES, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000144-0000-0000-c000-000000000046")]
  record IRpcOptions, lpVtbl : IRpcOptionsVtbl* do
    GUID = LibC::GUID.new(0x144_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IRpcOptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRpcOptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRpcOptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set(this : IRpcOptions*, pPrx : Void*, dwProperty : Win32cr::System::Com::RPCOPT_PROPERTIES, dwValue : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set.call(this, pPrx, dwProperty, dwValue)
    end
    def query(this : IRpcOptions*, pPrx : Void*, dwProperty : Win32cr::System::Com::RPCOPT_PROPERTIES, pdwValue : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query.call(this, pPrx, dwProperty, pdwValue)
    end

  end

  @[Extern]
  record IGlobalOptionsVtbl,
    query_interface : Proc(IGlobalOptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGlobalOptions*, UInt32),
    release : Proc(IGlobalOptions*, UInt32),
    set : Proc(IGlobalOptions*, Win32cr::System::Com::GLOBALOPT_PROPERTIES, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    query : Proc(IGlobalOptions*, Win32cr::System::Com::GLOBALOPT_PROPERTIES, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000015b-0000-0000-c000-000000000046")]
  record IGlobalOptions, lpVtbl : IGlobalOptionsVtbl* do
    GUID = LibC::GUID.new(0x15b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IGlobalOptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGlobalOptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGlobalOptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set(this : IGlobalOptions*, dwProperty : Win32cr::System::Com::GLOBALOPT_PROPERTIES, dwValue : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set.call(this, dwProperty, dwValue)
    end
    def query(this : IGlobalOptions*, dwProperty : Win32cr::System::Com::GLOBALOPT_PROPERTIES, pdwValue : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query.call(this, dwProperty, pdwValue)
    end

  end

  @[Extern]
  record ISurrogateVtbl,
    query_interface : Proc(ISurrogate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISurrogate*, UInt32),
    release : Proc(ISurrogate*, UInt32),
    load_dll_server : Proc(ISurrogate*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    free_surrogate : Proc(ISurrogate*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000022-0000-0000-c000-000000000046")]
  record ISurrogate, lpVtbl : ISurrogateVtbl* do
    GUID = LibC::GUID.new(0x22_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ISurrogate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISurrogate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISurrogate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load_dll_server(this : ISurrogate*, clsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_dll_server.call(this, clsid)
    end
    def free_surrogate(this : ISurrogate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_surrogate.call(this)
    end

  end

  @[Extern]
  record IGlobalInterfaceTableVtbl,
    query_interface : Proc(IGlobalInterfaceTable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGlobalInterfaceTable*, UInt32),
    release : Proc(IGlobalInterfaceTable*, UInt32),
    register_interface_in_global : Proc(IGlobalInterfaceTable*, Void*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    revoke_interface_from_global : Proc(IGlobalInterfaceTable*, UInt32, Win32cr::Foundation::HRESULT),
    get_interface_from_global : Proc(IGlobalInterfaceTable*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000146-0000-0000-c000-000000000046")]
  record IGlobalInterfaceTable, lpVtbl : IGlobalInterfaceTableVtbl* do
    GUID = LibC::GUID.new(0x146_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IGlobalInterfaceTable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGlobalInterfaceTable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGlobalInterfaceTable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_interface_in_global(this : IGlobalInterfaceTable*, pUnk : Void*, riid : LibC::GUID*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_interface_in_global.call(this, pUnk, riid, pdwCookie)
    end
    def revoke_interface_from_global(this : IGlobalInterfaceTable*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke_interface_from_global.call(this, dwCookie)
    end
    def get_interface_from_global(this : IGlobalInterfaceTable*, dwCookie : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interface_from_global.call(this, dwCookie, riid, ppv)
    end

  end

  @[Extern]
  record ISynchronizeVtbl,
    query_interface : Proc(ISynchronize*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISynchronize*, UInt32),
    release : Proc(ISynchronize*, UInt32),
    wait : Proc(ISynchronize*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    signal : Proc(ISynchronize*, Win32cr::Foundation::HRESULT),
    reset : Proc(ISynchronize*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000030-0000-0000-c000-000000000046")]
  record ISynchronize, lpVtbl : ISynchronizeVtbl* do
    GUID = LibC::GUID.new(0x30_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ISynchronize*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISynchronize*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISynchronize*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def wait(this : ISynchronize*, dwFlags : UInt32, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait.call(this, dwFlags, dwMilliseconds)
    end
    def signal(this : ISynchronize*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.signal.call(this)
    end
    def reset(this : ISynchronize*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record ISynchronizeHandleVtbl,
    query_interface : Proc(ISynchronizeHandle*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISynchronizeHandle*, UInt32),
    release : Proc(ISynchronizeHandle*, UInt32),
    get_handle : Proc(ISynchronizeHandle*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000031-0000-0000-c000-000000000046")]
  record ISynchronizeHandle, lpVtbl : ISynchronizeHandleVtbl* do
    GUID = LibC::GUID.new(0x31_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ISynchronizeHandle*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISynchronizeHandle*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISynchronizeHandle*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_handle(this : ISynchronizeHandle*, ph : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle.call(this, ph)
    end

  end

  @[Extern]
  record ISynchronizeEventVtbl,
    query_interface : Proc(ISynchronizeEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISynchronizeEvent*, UInt32),
    release : Proc(ISynchronizeEvent*, UInt32),
    get_handle : Proc(ISynchronizeEvent*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    set_event_handle : Proc(ISynchronizeEvent*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000032-0000-0000-c000-000000000046")]
  record ISynchronizeEvent, lpVtbl : ISynchronizeEventVtbl* do
    GUID = LibC::GUID.new(0x32_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ISynchronizeEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISynchronizeEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISynchronizeEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_handle(this : ISynchronizeEvent*, ph : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle.call(this, ph)
    end
    def set_event_handle(this : ISynchronizeEvent*, ph : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_handle.call(this, ph)
    end

  end

  @[Extern]
  record ISynchronizeContainerVtbl,
    query_interface : Proc(ISynchronizeContainer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISynchronizeContainer*, UInt32),
    release : Proc(ISynchronizeContainer*, UInt32),
    add_synchronize : Proc(ISynchronizeContainer*, Void*, Win32cr::Foundation::HRESULT),
    wait_multiple : Proc(ISynchronizeContainer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000033-0000-0000-c000-000000000046")]
  record ISynchronizeContainer, lpVtbl : ISynchronizeContainerVtbl* do
    GUID = LibC::GUID.new(0x33_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ISynchronizeContainer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISynchronizeContainer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISynchronizeContainer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_synchronize(this : ISynchronizeContainer*, pSync : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_synchronize.call(this, pSync)
    end
    def wait_multiple(this : ISynchronizeContainer*, dwFlags : UInt32, dwTimeOut : UInt32, ppSync : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_multiple.call(this, dwFlags, dwTimeOut, ppSync)
    end

  end

  @[Extern]
  record ISynchronizeMutexVtbl,
    query_interface : Proc(ISynchronizeMutex*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISynchronizeMutex*, UInt32),
    release : Proc(ISynchronizeMutex*, UInt32),
    wait : Proc(ISynchronizeMutex*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    signal : Proc(ISynchronizeMutex*, Win32cr::Foundation::HRESULT),
    reset : Proc(ISynchronizeMutex*, Win32cr::Foundation::HRESULT),
    release_mutex : Proc(ISynchronizeMutex*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000025-0000-0000-c000-000000000046")]
  record ISynchronizeMutex, lpVtbl : ISynchronizeMutexVtbl* do
    GUID = LibC::GUID.new(0x25_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ISynchronizeMutex*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISynchronizeMutex*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISynchronizeMutex*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def wait(this : ISynchronizeMutex*, dwFlags : UInt32, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait.call(this, dwFlags, dwMilliseconds)
    end
    def signal(this : ISynchronizeMutex*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.signal.call(this)
    end
    def reset(this : ISynchronizeMutex*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def release_mutex(this : ISynchronizeMutex*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_mutex.call(this)
    end

  end

  @[Extern]
  record ICancelMethodCallsVtbl,
    query_interface : Proc(ICancelMethodCalls*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICancelMethodCalls*, UInt32),
    release : Proc(ICancelMethodCalls*, UInt32),
    cancel : Proc(ICancelMethodCalls*, UInt32, Win32cr::Foundation::HRESULT),
    test_cancel : Proc(ICancelMethodCalls*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000029-0000-0000-c000-000000000046")]
  record ICancelMethodCalls, lpVtbl : ICancelMethodCallsVtbl* do
    GUID = LibC::GUID.new(0x29_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ICancelMethodCalls*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICancelMethodCalls*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICancelMethodCalls*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cancel(this : ICancelMethodCalls*, ulSeconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this, ulSeconds)
    end
    def test_cancel(this : ICancelMethodCalls*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.test_cancel.call(this)
    end

  end

  @[Extern]
  record IAsyncManagerVtbl,
    query_interface : Proc(IAsyncManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAsyncManager*, UInt32),
    release : Proc(IAsyncManager*, UInt32),
    complete_call : Proc(IAsyncManager*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    get_call_context : Proc(IAsyncManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_state : Proc(IAsyncManager*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000002a-0000-0000-c000-000000000046")]
  record IAsyncManager, lpVtbl : IAsyncManagerVtbl* do
    GUID = LibC::GUID.new(0x2a_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IAsyncManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAsyncManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAsyncManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def complete_call(this : IAsyncManager*, result : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete_call.call(this, result)
    end
    def get_call_context(this : IAsyncManager*, riid : LibC::GUID*, pInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_call_context.call(this, riid, pInterface)
    end
    def get_state(this : IAsyncManager*, pulStateFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pulStateFlags)
    end

  end

  @[Extern]
  record ICallFactoryVtbl,
    query_interface : Proc(ICallFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICallFactory*, UInt32),
    release : Proc(ICallFactory*, UInt32),
    create_call : Proc(ICallFactory*, LibC::GUID*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1c733a30-2a1c-11ce-ade5-00aa0044773d")]
  record ICallFactory, lpVtbl : ICallFactoryVtbl* do
    GUID = LibC::GUID.new(0x1c733a30_u32, 0x2a1c_u16, 0x11ce_u16, StaticArray[0xad_u8, 0xe5_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x44_u8, 0x77_u8, 0x3d_u8])
    def query_interface(this : ICallFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICallFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICallFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_call(this : ICallFactory*, riid : LibC::GUID*, pCtrlUnk : Void*, riid2 : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_call.call(this, riid, pCtrlUnk, riid2, ppv)
    end

  end

  @[Extern]
  record IRpcHelperVtbl,
    query_interface : Proc(IRpcHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRpcHelper*, UInt32),
    release : Proc(IRpcHelper*, UInt32),
    get_dcom_protocol_version : Proc(IRpcHelper*, UInt32*, Win32cr::Foundation::HRESULT),
    get_iid_from_objref : Proc(IRpcHelper*, Void*, LibC::GUID**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000149-0000-0000-c000-000000000046")]
  record IRpcHelper, lpVtbl : IRpcHelperVtbl* do
    GUID = LibC::GUID.new(0x149_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IRpcHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRpcHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRpcHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dcom_protocol_version(this : IRpcHelper*, pComVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dcom_protocol_version.call(this, pComVersion)
    end
    def get_iid_from_objref(this : IRpcHelper*, pObjRef : Void*, piid : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iid_from_objref.call(this, pObjRef, piid)
    end

  end

  @[Extern]
  record IReleaseMarshalBuffersVtbl,
    query_interface : Proc(IReleaseMarshalBuffers*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReleaseMarshalBuffers*, UInt32),
    release : Proc(IReleaseMarshalBuffers*, UInt32),
    release_marshal_buffer : Proc(IReleaseMarshalBuffers*, Win32cr::System::Com::RPCOLEMESSAGE*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("eb0cb9e8-7996-11d2-872e-0000f8080859")]
  record IReleaseMarshalBuffers, lpVtbl : IReleaseMarshalBuffersVtbl* do
    GUID = LibC::GUID.new(0xeb0cb9e8_u32, 0x7996_u16, 0x11d2_u16, StaticArray[0x87_u8, 0x2e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x8_u8, 0x8_u8, 0x59_u8])
    def query_interface(this : IReleaseMarshalBuffers*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReleaseMarshalBuffers*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReleaseMarshalBuffers*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def release_marshal_buffer(this : IReleaseMarshalBuffers*, pMsg : Win32cr::System::Com::RPCOLEMESSAGE*, dwFlags : UInt32, pChnl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_marshal_buffer.call(this, pMsg, dwFlags, pChnl)
    end

  end

  @[Extern]
  record IWaitMultipleVtbl,
    query_interface : Proc(IWaitMultiple*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWaitMultiple*, UInt32),
    release : Proc(IWaitMultiple*, UInt32),
    wait_multiple : Proc(IWaitMultiple*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add_synchronize : Proc(IWaitMultiple*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000002b-0000-0000-c000-000000000046")]
  record IWaitMultiple, lpVtbl : IWaitMultipleVtbl* do
    GUID = LibC::GUID.new(0x2b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IWaitMultiple*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWaitMultiple*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWaitMultiple*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def wait_multiple(this : IWaitMultiple*, timeout : UInt32, pSync : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_multiple.call(this, timeout, pSync)
    end
    def add_synchronize(this : IWaitMultiple*, pSync : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_synchronize.call(this, pSync)
    end

  end

  @[Extern]
  record IAddrTrackingControlVtbl,
    query_interface : Proc(IAddrTrackingControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAddrTrackingControl*, UInt32),
    release : Proc(IAddrTrackingControl*, UInt32),
    enable_com_dynamic_addr_tracking : Proc(IAddrTrackingControl*, Win32cr::Foundation::HRESULT),
    disable_com_dynamic_addr_tracking : Proc(IAddrTrackingControl*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000147-0000-0000-c000-000000000046")]
  record IAddrTrackingControl, lpVtbl : IAddrTrackingControlVtbl* do
    GUID = LibC::GUID.new(0x147_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IAddrTrackingControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAddrTrackingControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAddrTrackingControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable_com_dynamic_addr_tracking(this : IAddrTrackingControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_com_dynamic_addr_tracking.call(this)
    end
    def disable_com_dynamic_addr_tracking(this : IAddrTrackingControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_com_dynamic_addr_tracking.call(this)
    end

  end

  @[Extern]
  record IAddrExclusionControlVtbl,
    query_interface : Proc(IAddrExclusionControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAddrExclusionControl*, UInt32),
    release : Proc(IAddrExclusionControl*, UInt32),
    get_current_addr_exclusion_list : Proc(IAddrExclusionControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    update_addr_exclusion_list : Proc(IAddrExclusionControl*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000148-0000-0000-c000-000000000046")]
  record IAddrExclusionControl, lpVtbl : IAddrExclusionControlVtbl* do
    GUID = LibC::GUID.new(0x148_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IAddrExclusionControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAddrExclusionControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAddrExclusionControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_addr_exclusion_list(this : IAddrExclusionControl*, riid : LibC::GUID*, ppEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_addr_exclusion_list.call(this, riid, ppEnumerator)
    end
    def update_addr_exclusion_list(this : IAddrExclusionControl*, pEnumerator : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_addr_exclusion_list.call(this, pEnumerator)
    end

  end

  @[Extern]
  record IPipeByteVtbl,
    query_interface : Proc(IPipeByte*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPipeByte*, UInt32),
    release : Proc(IPipeByte*, UInt32),
    pull : Proc(IPipeByte*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    push : Proc(IPipeByte*, UInt8*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("db2f3aca-2f86-11d1-8e04-00c04fb9989a")]
  record IPipeByte, lpVtbl : IPipeByteVtbl* do
    GUID = LibC::GUID.new(0xdb2f3aca_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
    def query_interface(this : IPipeByte*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPipeByte*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPipeByte*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def pull(this : IPipeByte*, buf : UInt8*, cRequest : UInt32, pcReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pull.call(this, buf, cRequest, pcReturned)
    end
    def push(this : IPipeByte*, buf : UInt8*, cSent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push.call(this, buf, cSent)
    end

  end

  @[Extern]
  record AsyncIPipeByteVtbl,
    query_interface : Proc(AsyncIPipeByte*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIPipeByte*, UInt32),
    release : Proc(AsyncIPipeByte*, UInt32),
    begin_pull : Proc(AsyncIPipeByte*, UInt32, Win32cr::Foundation::HRESULT),
    finish_pull : Proc(AsyncIPipeByte*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_push : Proc(AsyncIPipeByte*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    finish_push : Proc(AsyncIPipeByte*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("db2f3acb-2f86-11d1-8e04-00c04fb9989a")]
  record AsyncIPipeByte, lpVtbl : AsyncIPipeByteVtbl* do
    GUID = LibC::GUID.new(0xdb2f3acb_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
    def query_interface(this : AsyncIPipeByte*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIPipeByte*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIPipeByte*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_pull(this : AsyncIPipeByte*, cRequest : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_pull.call(this, cRequest)
    end
    def finish_pull(this : AsyncIPipeByte*, buf : UInt8*, pcReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_pull.call(this, buf, pcReturned)
    end
    def begin_push(this : AsyncIPipeByte*, buf : UInt8*, cSent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_push.call(this, buf, cSent)
    end
    def finish_push(this : AsyncIPipeByte*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_push.call(this)
    end

  end

  @[Extern]
  record IPipeLongVtbl,
    query_interface : Proc(IPipeLong*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPipeLong*, UInt32),
    release : Proc(IPipeLong*, UInt32),
    pull : Proc(IPipeLong*, Int32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    push : Proc(IPipeLong*, Int32*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("db2f3acc-2f86-11d1-8e04-00c04fb9989a")]
  record IPipeLong, lpVtbl : IPipeLongVtbl* do
    GUID = LibC::GUID.new(0xdb2f3acc_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
    def query_interface(this : IPipeLong*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPipeLong*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPipeLong*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def pull(this : IPipeLong*, buf : Int32*, cRequest : UInt32, pcReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pull.call(this, buf, cRequest, pcReturned)
    end
    def push(this : IPipeLong*, buf : Int32*, cSent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push.call(this, buf, cSent)
    end

  end

  @[Extern]
  record AsyncIPipeLongVtbl,
    query_interface : Proc(AsyncIPipeLong*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIPipeLong*, UInt32),
    release : Proc(AsyncIPipeLong*, UInt32),
    begin_pull : Proc(AsyncIPipeLong*, UInt32, Win32cr::Foundation::HRESULT),
    finish_pull : Proc(AsyncIPipeLong*, Int32*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_push : Proc(AsyncIPipeLong*, Int32*, UInt32, Win32cr::Foundation::HRESULT),
    finish_push : Proc(AsyncIPipeLong*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("db2f3acd-2f86-11d1-8e04-00c04fb9989a")]
  record AsyncIPipeLong, lpVtbl : AsyncIPipeLongVtbl* do
    GUID = LibC::GUID.new(0xdb2f3acd_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
    def query_interface(this : AsyncIPipeLong*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIPipeLong*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIPipeLong*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_pull(this : AsyncIPipeLong*, cRequest : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_pull.call(this, cRequest)
    end
    def finish_pull(this : AsyncIPipeLong*, buf : Int32*, pcReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_pull.call(this, buf, pcReturned)
    end
    def begin_push(this : AsyncIPipeLong*, buf : Int32*, cSent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_push.call(this, buf, cSent)
    end
    def finish_push(this : AsyncIPipeLong*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_push.call(this)
    end

  end

  @[Extern]
  record IPipeDoubleVtbl,
    query_interface : Proc(IPipeDouble*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPipeDouble*, UInt32),
    release : Proc(IPipeDouble*, UInt32),
    pull : Proc(IPipeDouble*, Float64*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    push : Proc(IPipeDouble*, Float64*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("db2f3ace-2f86-11d1-8e04-00c04fb9989a")]
  record IPipeDouble, lpVtbl : IPipeDoubleVtbl* do
    GUID = LibC::GUID.new(0xdb2f3ace_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
    def query_interface(this : IPipeDouble*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPipeDouble*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPipeDouble*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def pull(this : IPipeDouble*, buf : Float64*, cRequest : UInt32, pcReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pull.call(this, buf, cRequest, pcReturned)
    end
    def push(this : IPipeDouble*, buf : Float64*, cSent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push.call(this, buf, cSent)
    end

  end

  @[Extern]
  record AsyncIPipeDoubleVtbl,
    query_interface : Proc(AsyncIPipeDouble*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIPipeDouble*, UInt32),
    release : Proc(AsyncIPipeDouble*, UInt32),
    begin_pull : Proc(AsyncIPipeDouble*, UInt32, Win32cr::Foundation::HRESULT),
    finish_pull : Proc(AsyncIPipeDouble*, Float64*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_push : Proc(AsyncIPipeDouble*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    finish_push : Proc(AsyncIPipeDouble*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("db2f3acf-2f86-11d1-8e04-00c04fb9989a")]
  record AsyncIPipeDouble, lpVtbl : AsyncIPipeDoubleVtbl* do
    GUID = LibC::GUID.new(0xdb2f3acf_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
    def query_interface(this : AsyncIPipeDouble*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIPipeDouble*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIPipeDouble*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_pull(this : AsyncIPipeDouble*, cRequest : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_pull.call(this, cRequest)
    end
    def finish_pull(this : AsyncIPipeDouble*, buf : Float64*, pcReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_pull.call(this, buf, pcReturned)
    end
    def begin_push(this : AsyncIPipeDouble*, buf : Float64*, cSent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_push.call(this, buf, cSent)
    end
    def finish_push(this : AsyncIPipeDouble*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_push.call(this)
    end

  end

  @[Extern]
  record IComThreadingInfoVtbl,
    query_interface : Proc(IComThreadingInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComThreadingInfo*, UInt32),
    release : Proc(IComThreadingInfo*, UInt32),
    get_current_apartment_type : Proc(IComThreadingInfo*, Win32cr::System::Com::APTTYPE*, Win32cr::Foundation::HRESULT),
    get_current_thread_type : Proc(IComThreadingInfo*, Win32cr::System::Com::THDTYPE*, Win32cr::Foundation::HRESULT),
    get_current_logical_thread_id : Proc(IComThreadingInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_current_logical_thread_id : Proc(IComThreadingInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("000001ce-0000-0000-c000-000000000046")]
  record IComThreadingInfo, lpVtbl : IComThreadingInfoVtbl* do
    GUID = LibC::GUID.new(0x1ce_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IComThreadingInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComThreadingInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComThreadingInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_apartment_type(this : IComThreadingInfo*, pAptType : Win32cr::System::Com::APTTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_apartment_type.call(this, pAptType)
    end
    def get_current_thread_type(this : IComThreadingInfo*, pThreadType : Win32cr::System::Com::THDTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_type.call(this, pThreadType)
    end
    def get_current_logical_thread_id(this : IComThreadingInfo*, pguidLogicalThreadId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_logical_thread_id.call(this, pguidLogicalThreadId)
    end
    def set_current_logical_thread_id(this : IComThreadingInfo*, rguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_current_logical_thread_id.call(this, rguid)
    end

  end

  @[Extern]
  record IProcessInitControlVtbl,
    query_interface : Proc(IProcessInitControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProcessInitControl*, UInt32),
    release : Proc(IProcessInitControl*, UInt32),
    reset_initializer_timeout : Proc(IProcessInitControl*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("72380d55-8d2b-43a3-8513-2b6ef31434e9")]
  record IProcessInitControl, lpVtbl : IProcessInitControlVtbl* do
    GUID = LibC::GUID.new(0x72380d55_u32, 0x8d2b_u16, 0x43a3_u16, StaticArray[0x85_u8, 0x13_u8, 0x2b_u8, 0x6e_u8, 0xf3_u8, 0x14_u8, 0x34_u8, 0xe9_u8])
    def query_interface(this : IProcessInitControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProcessInitControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProcessInitControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reset_initializer_timeout(this : IProcessInitControl*, dwSecondsRemaining : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_initializer_timeout.call(this, dwSecondsRemaining)
    end

  end

  @[Extern]
  record IFastRundownVtbl,
    query_interface : Proc(IFastRundown*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFastRundown*, UInt32),
    release : Proc(IFastRundown*, UInt32)


  @[Extern]
  #@[Com("00000040-0000-0000-c000-000000000046")]
  record IFastRundown, lpVtbl : IFastRundownVtbl* do
    GUID = LibC::GUID.new(0x40_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IFastRundown*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFastRundown*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFastRundown*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IMachineGlobalObjectTableVtbl,
    query_interface : Proc(IMachineGlobalObjectTable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMachineGlobalObjectTable*, UInt32),
    release : Proc(IMachineGlobalObjectTable*, UInt32),
    register_object : Proc(IMachineGlobalObjectTable*, LibC::GUID*, Win32cr::Foundation::PWSTR, Void*, Win32cr::System::Com::MachineGlobalObjectTableRegistrationToken__**, Win32cr::Foundation::HRESULT),
    get_object : Proc(IMachineGlobalObjectTable*, LibC::GUID*, Win32cr::Foundation::PWSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    revoke_object : Proc(IMachineGlobalObjectTable*, Win32cr::System::Com::MachineGlobalObjectTableRegistrationToken__*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("26d709ac-f70b-4421-a96f-d2878fafb00d")]
  record IMachineGlobalObjectTable, lpVtbl : IMachineGlobalObjectTableVtbl* do
    GUID = LibC::GUID.new(0x26d709ac_u32, 0xf70b_u16, 0x4421_u16, StaticArray[0xa9_u8, 0x6f_u8, 0xd2_u8, 0x87_u8, 0x8f_u8, 0xaf_u8, 0xb0_u8, 0xd_u8])
    def query_interface(this : IMachineGlobalObjectTable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMachineGlobalObjectTable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMachineGlobalObjectTable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_object(this : IMachineGlobalObjectTable*, clsid : LibC::GUID*, identifier : Win32cr::Foundation::PWSTR, object : Void*, token : Win32cr::System::Com::MachineGlobalObjectTableRegistrationToken__**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_object.call(this, clsid, identifier, object, token)
    end
    def get_object(this : IMachineGlobalObjectTable*, clsid : LibC::GUID*, identifier : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object.call(this, clsid, identifier, riid, ppv)
    end
    def revoke_object(this : IMachineGlobalObjectTable*, token : Win32cr::System::Com::MachineGlobalObjectTableRegistrationToken__*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke_object.call(this, token)
    end

  end

  @[Extern]
  record IMallocSpyVtbl,
    query_interface : Proc(IMallocSpy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMallocSpy*, UInt32),
    release : Proc(IMallocSpy*, UInt32),
    pre_alloc : Proc(IMallocSpy*, LibC::UIntPtrT, LibC::UIntPtrT),
    post_alloc : Proc(IMallocSpy*, Void*, Void*),
    pre_free : Proc(IMallocSpy*, Void*, Win32cr::Foundation::BOOL, Void*),
    post_free : Proc(IMallocSpy*, Win32cr::Foundation::BOOL, Void),
    pre_realloc : Proc(IMallocSpy*, Void*, LibC::UIntPtrT, Void**, Win32cr::Foundation::BOOL, LibC::UIntPtrT),
    post_realloc : Proc(IMallocSpy*, Void*, Win32cr::Foundation::BOOL, Void*),
    pre_get_size : Proc(IMallocSpy*, Void*, Win32cr::Foundation::BOOL, Void*),
    post_get_size : Proc(IMallocSpy*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, LibC::UIntPtrT),
    pre_did_alloc : Proc(IMallocSpy*, Void*, Win32cr::Foundation::BOOL, Void*),
    post_did_alloc : Proc(IMallocSpy*, Void*, Win32cr::Foundation::BOOL, Int32, Int32),
    pre_heap_minimize : Proc(IMallocSpy*, Void),
    post_heap_minimize : Proc(IMallocSpy*, Void)


  @[Extern]
  #@[Com("0000001d-0000-0000-c000-000000000046")]
  record IMallocSpy, lpVtbl : IMallocSpyVtbl* do
    GUID = LibC::GUID.new(0x1d_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IMallocSpy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMallocSpy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMallocSpy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def pre_alloc(this : IMallocSpy*, cbRequest : LibC::UIntPtrT) : LibC::UIntPtrT
      @lpVtbl.try &.value.pre_alloc.call(this, cbRequest)
    end
    def post_alloc(this : IMallocSpy*, pActual : Void*) : Void*
      @lpVtbl.try &.value.post_alloc.call(this, pActual)
    end
    def pre_free(this : IMallocSpy*, pRequest : Void*, fSpyed : Win32cr::Foundation::BOOL) : Void*
      @lpVtbl.try &.value.pre_free.call(this, pRequest, fSpyed)
    end
    def post_free(this : IMallocSpy*, fSpyed : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.post_free.call(this, fSpyed)
    end
    def pre_realloc(this : IMallocSpy*, pRequest : Void*, cbRequest : LibC::UIntPtrT, ppNewRequest : Void**, fSpyed : Win32cr::Foundation::BOOL) : LibC::UIntPtrT
      @lpVtbl.try &.value.pre_realloc.call(this, pRequest, cbRequest, ppNewRequest, fSpyed)
    end
    def post_realloc(this : IMallocSpy*, pActual : Void*, fSpyed : Win32cr::Foundation::BOOL) : Void*
      @lpVtbl.try &.value.post_realloc.call(this, pActual, fSpyed)
    end
    def pre_get_size(this : IMallocSpy*, pRequest : Void*, fSpyed : Win32cr::Foundation::BOOL) : Void*
      @lpVtbl.try &.value.pre_get_size.call(this, pRequest, fSpyed)
    end
    def post_get_size(this : IMallocSpy*, cbActual : LibC::UIntPtrT, fSpyed : Win32cr::Foundation::BOOL) : LibC::UIntPtrT
      @lpVtbl.try &.value.post_get_size.call(this, cbActual, fSpyed)
    end
    def pre_did_alloc(this : IMallocSpy*, pRequest : Void*, fSpyed : Win32cr::Foundation::BOOL) : Void*
      @lpVtbl.try &.value.pre_did_alloc.call(this, pRequest, fSpyed)
    end
    def post_did_alloc(this : IMallocSpy*, pRequest : Void*, fSpyed : Win32cr::Foundation::BOOL, fActual : Int32) : Int32
      @lpVtbl.try &.value.post_did_alloc.call(this, pRequest, fSpyed, fActual)
    end
    def pre_heap_minimize(this : IMallocSpy*) : Void
      @lpVtbl.try &.value.pre_heap_minimize.call(this)
    end
    def post_heap_minimize(this : IMallocSpy*) : Void
      @lpVtbl.try &.value.post_heap_minimize.call(this)
    end

  end

  @[Extern]
  record IBindCtxVtbl,
    query_interface : Proc(IBindCtx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBindCtx*, UInt32),
    release : Proc(IBindCtx*, UInt32),
    register_object_bound : Proc(IBindCtx*, Void*, Win32cr::Foundation::HRESULT),
    revoke_object_bound : Proc(IBindCtx*, Void*, Win32cr::Foundation::HRESULT),
    release_bound_objects : Proc(IBindCtx*, Win32cr::Foundation::HRESULT),
    set_bind_options : Proc(IBindCtx*, Win32cr::System::Com::BIND_OPTS*, Win32cr::Foundation::HRESULT),
    get_bind_options : Proc(IBindCtx*, Win32cr::System::Com::BIND_OPTS*, Win32cr::Foundation::HRESULT),
    get_running_object_table : Proc(IBindCtx*, Void**, Win32cr::Foundation::HRESULT),
    register_object_param : Proc(IBindCtx*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    get_object_param : Proc(IBindCtx*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_object_param : Proc(IBindCtx*, Void**, Win32cr::Foundation::HRESULT),
    revoke_object_param : Proc(IBindCtx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000000e-0000-0000-c000-000000000046")]
  record IBindCtx, lpVtbl : IBindCtxVtbl* do
    GUID = LibC::GUID.new(0xe_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IBindCtx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBindCtx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBindCtx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_object_bound(this : IBindCtx*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_object_bound.call(this, punk)
    end
    def revoke_object_bound(this : IBindCtx*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke_object_bound.call(this, punk)
    end
    def release_bound_objects(this : IBindCtx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_bound_objects.call(this)
    end
    def set_bind_options(this : IBindCtx*, pbindopts : Win32cr::System::Com::BIND_OPTS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bind_options.call(this, pbindopts)
    end
    def get_bind_options(this : IBindCtx*, pbindopts : Win32cr::System::Com::BIND_OPTS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bind_options.call(this, pbindopts)
    end
    def get_running_object_table(this : IBindCtx*, pprot : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_running_object_table.call(this, pprot)
    end
    def register_object_param(this : IBindCtx*, pszKey : Win32cr::Foundation::PWSTR, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_object_param.call(this, pszKey, punk)
    end
    def get_object_param(this : IBindCtx*, pszKey : Win32cr::Foundation::PWSTR, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_param.call(this, pszKey, ppunk)
    end
    def enum_object_param(this : IBindCtx*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_object_param.call(this, ppenum)
    end
    def revoke_object_param(this : IBindCtx*, pszKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke_object_param.call(this, pszKey)
    end

  end

  @[Extern]
  record IEnumMonikerVtbl,
    query_interface : Proc(IEnumMoniker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumMoniker*, UInt32),
    release : Proc(IEnumMoniker*, UInt32),
    next__ : Proc(IEnumMoniker*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumMoniker*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumMoniker*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumMoniker*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000102-0000-0000-c000-000000000046")]
  record IEnumMoniker, lpVtbl : IEnumMonikerVtbl* do
    GUID = LibC::GUID.new(0x102_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumMoniker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumMoniker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumMoniker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumMoniker*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumMoniker*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumMoniker*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumMoniker*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IRunnableObjectVtbl,
    query_interface : Proc(IRunnableObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRunnableObject*, UInt32),
    release : Proc(IRunnableObject*, UInt32),
    get_running_class : Proc(IRunnableObject*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    run : Proc(IRunnableObject*, Void*, Win32cr::Foundation::HRESULT),
    is_running : Proc(IRunnableObject*, Win32cr::Foundation::BOOL),
    lock_running : Proc(IRunnableObject*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_contained_object : Proc(IRunnableObject*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000126-0000-0000-c000-000000000046")]
  record IRunnableObject, lpVtbl : IRunnableObjectVtbl* do
    GUID = LibC::GUID.new(0x126_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IRunnableObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRunnableObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRunnableObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_running_class(this : IRunnableObject*, lpClsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_running_class.call(this, lpClsid)
    end
    def run(this : IRunnableObject*, pbc : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run.call(this, pbc)
    end
    def is_running(this : IRunnableObject*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_running.call(this)
    end
    def lock_running(this : IRunnableObject*, fLock : Win32cr::Foundation::BOOL, fLastUnlockCloses : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_running.call(this, fLock, fLastUnlockCloses)
    end
    def set_contained_object(this : IRunnableObject*, fContained : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_contained_object.call(this, fContained)
    end

  end

  @[Extern]
  record IRunningObjectTableVtbl,
    query_interface : Proc(IRunningObjectTable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRunningObjectTable*, UInt32),
    release : Proc(IRunningObjectTable*, UInt32),
    register : Proc(IRunningObjectTable*, Win32cr::System::Com::ROT_FLAGS, Void*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    revoke : Proc(IRunningObjectTable*, UInt32, Win32cr::Foundation::HRESULT),
    is_running : Proc(IRunningObjectTable*, Void*, Win32cr::Foundation::HRESULT),
    get_object : Proc(IRunningObjectTable*, Void*, Void**, Win32cr::Foundation::HRESULT),
    note_change_time : Proc(IRunningObjectTable*, UInt32, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_time_of_last_change : Proc(IRunningObjectTable*, Void*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    enum_running : Proc(IRunningObjectTable*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000010-0000-0000-c000-000000000046")]
  record IRunningObjectTable, lpVtbl : IRunningObjectTableVtbl* do
    GUID = LibC::GUID.new(0x10_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IRunningObjectTable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRunningObjectTable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRunningObjectTable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register(this : IRunningObjectTable*, grfFlags : Win32cr::System::Com::ROT_FLAGS, punkObject : Void*, pmkObjectName : Void*, pdwRegister : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this, grfFlags, punkObject, pmkObjectName, pdwRegister)
    end
    def revoke(this : IRunningObjectTable*, dwRegister : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke.call(this, dwRegister)
    end
    def is_running(this : IRunningObjectTable*, pmkObjectName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_running.call(this, pmkObjectName)
    end
    def get_object(this : IRunningObjectTable*, pmkObjectName : Void*, ppunkObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object.call(this, pmkObjectName, ppunkObject)
    end
    def note_change_time(this : IRunningObjectTable*, dwRegister : UInt32, pfiletime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.note_change_time.call(this, dwRegister, pfiletime)
    end
    def get_time_of_last_change(this : IRunningObjectTable*, pmkObjectName : Void*, pfiletime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time_of_last_change.call(this, pmkObjectName, pfiletime)
    end
    def enum_running(this : IRunningObjectTable*, ppenumMoniker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_running.call(this, ppenumMoniker)
    end

  end

  @[Extern]
  record IPersistVtbl,
    query_interface : Proc(IPersist*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPersist*, UInt32),
    release : Proc(IPersist*, UInt32),
    get_class_id : Proc(IPersist*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000010c-0000-0000-c000-000000000046")]
  record IPersist, lpVtbl : IPersistVtbl* do
    GUID = LibC::GUID.new(0x10c_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IPersist*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPersist*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPersist*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IPersist*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end

  end

  @[Extern]
  record IPersistStreamVtbl,
    query_interface : Proc(IPersistStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPersistStream*, UInt32),
    release : Proc(IPersistStream*, UInt32),
    get_class_id : Proc(IPersistStream*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(IPersistStream*, Win32cr::Foundation::HRESULT),
    load : Proc(IPersistStream*, Void*, Win32cr::Foundation::HRESULT),
    save : Proc(IPersistStream*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_size_max : Proc(IPersistStream*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000109-0000-0000-c000-000000000046")]
  record IPersistStream, lpVtbl : IPersistStreamVtbl* do
    GUID = LibC::GUID.new(0x109_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IPersistStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPersistStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPersistStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IPersistStream*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end
    def is_dirty(this : IPersistStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this)
    end
    def load(this : IPersistStream*, pStm : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pStm)
    end
    def save(this : IPersistStream*, pStm : Void*, fClearDirty : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pStm, fClearDirty)
    end
    def get_size_max(this : IPersistStream*, pcbSize : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size_max.call(this, pcbSize)
    end

  end

  @[Extern]
  record IMonikerVtbl,
    query_interface : Proc(IMoniker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMoniker*, UInt32),
    release : Proc(IMoniker*, UInt32),
    get_class_id : Proc(IMoniker*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(IMoniker*, Win32cr::Foundation::HRESULT),
    load : Proc(IMoniker*, Void*, Win32cr::Foundation::HRESULT),
    save : Proc(IMoniker*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_size_max : Proc(IMoniker*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    bind_to_object : Proc(IMoniker*, Void*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    bind_to_storage : Proc(IMoniker*, Void*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    reduce : Proc(IMoniker*, Void*, UInt32, Void**, Void**, Win32cr::Foundation::HRESULT),
    compose_with : Proc(IMoniker*, Void*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    enum__ : Proc(IMoniker*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    is_equal : Proc(IMoniker*, Void*, Win32cr::Foundation::HRESULT),
    hash : Proc(IMoniker*, UInt32*, Win32cr::Foundation::HRESULT),
    is_running : Proc(IMoniker*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_time_of_last_change : Proc(IMoniker*, Void*, Void*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    inverse : Proc(IMoniker*, Void**, Win32cr::Foundation::HRESULT),
    common_prefix_with : Proc(IMoniker*, Void*, Void**, Win32cr::Foundation::HRESULT),
    relative_path_to : Proc(IMoniker*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IMoniker*, Void*, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    parse_display_name : Proc(IMoniker*, Void*, Void*, Win32cr::Foundation::PWSTR, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    is_system_moniker : Proc(IMoniker*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000000f-0000-0000-c000-000000000046")]
  record IMoniker, lpVtbl : IMonikerVtbl* do
    GUID = LibC::GUID.new(0xf_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IMoniker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMoniker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMoniker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IMoniker*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end
    def is_dirty(this : IMoniker*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this)
    end
    def load(this : IMoniker*, pStm : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pStm)
    end
    def save(this : IMoniker*, pStm : Void*, fClearDirty : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pStm, fClearDirty)
    end
    def get_size_max(this : IMoniker*, pcbSize : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size_max.call(this, pcbSize)
    end
    def bind_to_object(this : IMoniker*, pbc : Void*, pmkToLeft : Void*, riidResult : LibC::GUID*, ppvResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_to_object.call(this, pbc, pmkToLeft, riidResult, ppvResult)
    end
    def bind_to_storage(this : IMoniker*, pbc : Void*, pmkToLeft : Void*, riid : LibC::GUID*, ppvObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_to_storage.call(this, pbc, pmkToLeft, riid, ppvObj)
    end
    def reduce(this : IMoniker*, pbc : Void*, dwReduceHowFar : UInt32, ppmkToLeft : Void**, ppmkReduced : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reduce.call(this, pbc, dwReduceHowFar, ppmkToLeft, ppmkReduced)
    end
    def compose_with(this : IMoniker*, pmkRight : Void*, fOnlyIfNotGeneric : Win32cr::Foundation::BOOL, ppmkComposite : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compose_with.call(this, pmkRight, fOnlyIfNotGeneric, ppmkComposite)
    end
    def enum__(this : IMoniker*, fForward : Win32cr::Foundation::BOOL, ppenumMoniker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum__.call(this, fForward, ppenumMoniker)
    end
    def is_equal(this : IMoniker*, pmkOtherMoniker : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pmkOtherMoniker)
    end
    def hash(this : IMoniker*, pdwHash : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hash.call(this, pdwHash)
    end
    def is_running(this : IMoniker*, pbc : Void*, pmkToLeft : Void*, pmkNewlyRunning : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_running.call(this, pbc, pmkToLeft, pmkNewlyRunning)
    end
    def get_time_of_last_change(this : IMoniker*, pbc : Void*, pmkToLeft : Void*, pFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time_of_last_change.call(this, pbc, pmkToLeft, pFileTime)
    end
    def inverse(this : IMoniker*, ppmk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.inverse.call(this, ppmk)
    end
    def common_prefix_with(this : IMoniker*, pmkOther : Void*, ppmkPrefix : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.common_prefix_with.call(this, pmkOther, ppmkPrefix)
    end
    def relative_path_to(this : IMoniker*, pmkOther : Void*, ppmkRelPath : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.relative_path_to.call(this, pmkOther, ppmkRelPath)
    end
    def get_display_name(this : IMoniker*, pbc : Void*, pmkToLeft : Void*, ppszDisplayName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbc, pmkToLeft, ppszDisplayName)
    end
    def parse_display_name(this : IMoniker*, pbc : Void*, pmkToLeft : Void*, pszDisplayName : Win32cr::Foundation::PWSTR, pchEaten : UInt32*, ppmkOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_display_name.call(this, pbc, pmkToLeft, pszDisplayName, pchEaten, ppmkOut)
    end
    def is_system_moniker(this : IMoniker*, pdwMksys : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_system_moniker.call(this, pdwMksys)
    end

  end

  @[Extern]
  record IROTDataVtbl,
    query_interface : Proc(IROTData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IROTData*, UInt32),
    release : Proc(IROTData*, UInt32),
    get_comparison_data : Proc(IROTData*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f29f6bc0-5021-11ce-aa15-00006901293f")]
  record IROTData, lpVtbl : IROTDataVtbl* do
    GUID = LibC::GUID.new(0xf29f6bc0_u32, 0x5021_u16, 0x11ce_u16, StaticArray[0xaa_u8, 0x15_u8, 0x0_u8, 0x0_u8, 0x69_u8, 0x1_u8, 0x29_u8, 0x3f_u8])
    def query_interface(this : IROTData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IROTData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IROTData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_comparison_data(this : IROTData*, pbData : UInt8*, cbMax : UInt32, pcbData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_comparison_data.call(this, pbData, cbMax, pcbData)
    end

  end

  @[Extern]
  record IPersistFileVtbl,
    query_interface : Proc(IPersistFile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPersistFile*, UInt32),
    release : Proc(IPersistFile*, UInt32),
    get_class_id : Proc(IPersistFile*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(IPersistFile*, Win32cr::Foundation::HRESULT),
    load : Proc(IPersistFile*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    save : Proc(IPersistFile*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    save_completed : Proc(IPersistFile*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_cur_file : Proc(IPersistFile*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000010b-0000-0000-c000-000000000046")]
  record IPersistFile, lpVtbl : IPersistFileVtbl* do
    GUID = LibC::GUID.new(0x10b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IPersistFile*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPersistFile*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPersistFile*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IPersistFile*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end
    def is_dirty(this : IPersistFile*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this)
    end
    def load(this : IPersistFile*, pszFileName : Win32cr::Foundation::PWSTR, dwMode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pszFileName, dwMode)
    end
    def save(this : IPersistFile*, pszFileName : Win32cr::Foundation::PWSTR, fRemember : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pszFileName, fRemember)
    end
    def save_completed(this : IPersistFile*, pszFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_completed.call(this, pszFileName)
    end
    def get_cur_file(this : IPersistFile*, ppszFileName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cur_file.call(this, ppszFileName)
    end

  end

  @[Extern]
  record IEnumFORMATETCVtbl,
    query_interface : Proc(IEnumFORMATETC*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumFORMATETC*, UInt32),
    release : Proc(IEnumFORMATETC*, UInt32),
    next__ : Proc(IEnumFORMATETC*, UInt32, Win32cr::System::Com::FORMATETC*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumFORMATETC*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumFORMATETC*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumFORMATETC*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000103-0000-0000-c000-000000000046")]
  record IEnumFORMATETC, lpVtbl : IEnumFORMATETCVtbl* do
    GUID = LibC::GUID.new(0x103_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumFORMATETC*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumFORMATETC*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumFORMATETC*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumFORMATETC*, celt : UInt32, rgelt : Win32cr::System::Com::FORMATETC*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumFORMATETC*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumFORMATETC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumFORMATETC*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IEnumSTATDATAVtbl,
    query_interface : Proc(IEnumSTATDATA*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSTATDATA*, UInt32),
    release : Proc(IEnumSTATDATA*, UInt32),
    next__ : Proc(IEnumSTATDATA*, UInt32, Win32cr::System::Com::STATDATA*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSTATDATA*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSTATDATA*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSTATDATA*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000105-0000-0000-c000-000000000046")]
  record IEnumSTATDATA, lpVtbl : IEnumSTATDATAVtbl* do
    GUID = LibC::GUID.new(0x105_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumSTATDATA*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSTATDATA*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSTATDATA*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSTATDATA*, celt : UInt32, rgelt : Win32cr::System::Com::STATDATA*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumSTATDATA*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumSTATDATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSTATDATA*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IAdviseSinkVtbl,
    query_interface : Proc(IAdviseSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAdviseSink*, UInt32),
    release : Proc(IAdviseSink*, UInt32),
    on_data_change : Proc(IAdviseSink*, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::STGMEDIUM*, Void),
    on_view_change : Proc(IAdviseSink*, UInt32, Int32, Void),
    on_rename : Proc(IAdviseSink*, Void*, Void),
    on_save : Proc(IAdviseSink*, Void),
    on_close : Proc(IAdviseSink*, Void)


  @[Extern]
  #@[Com("0000010f-0000-0000-c000-000000000046")]
  record IAdviseSink, lpVtbl : IAdviseSinkVtbl* do
    GUID = LibC::GUID.new(0x10f_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IAdviseSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAdviseSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAdviseSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_data_change(this : IAdviseSink*, pFormatetc : Win32cr::System::Com::FORMATETC*, pStgmed : Win32cr::System::Com::STGMEDIUM*) : Void
      @lpVtbl.try &.value.on_data_change.call(this, pFormatetc, pStgmed)
    end
    def on_view_change(this : IAdviseSink*, dwAspect : UInt32, lindex : Int32) : Void
      @lpVtbl.try &.value.on_view_change.call(this, dwAspect, lindex)
    end
    def on_rename(this : IAdviseSink*, pmk : Void*) : Void
      @lpVtbl.try &.value.on_rename.call(this, pmk)
    end
    def on_save(this : IAdviseSink*) : Void
      @lpVtbl.try &.value.on_save.call(this)
    end
    def on_close(this : IAdviseSink*) : Void
      @lpVtbl.try &.value.on_close.call(this)
    end

  end

  @[Extern]
  record AsyncIAdviseSinkVtbl,
    query_interface : Proc(AsyncIAdviseSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIAdviseSink*, UInt32),
    release : Proc(AsyncIAdviseSink*, UInt32),
    begin_on_data_change : Proc(AsyncIAdviseSink*, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::STGMEDIUM*, Void),
    finish_on_data_change : Proc(AsyncIAdviseSink*, Void),
    begin_on_view_change : Proc(AsyncIAdviseSink*, UInt32, Int32, Void),
    finish_on_view_change : Proc(AsyncIAdviseSink*, Void),
    begin_on_rename : Proc(AsyncIAdviseSink*, Void*, Void),
    finish_on_rename : Proc(AsyncIAdviseSink*, Void),
    begin_on_save : Proc(AsyncIAdviseSink*, Void),
    finish_on_save : Proc(AsyncIAdviseSink*, Void),
    begin_on_close : Proc(AsyncIAdviseSink*, Void),
    finish_on_close : Proc(AsyncIAdviseSink*, Void)


  @[Extern]
  #@[Com("00000150-0000-0000-c000-000000000046")]
  record AsyncIAdviseSink, lpVtbl : AsyncIAdviseSinkVtbl* do
    GUID = LibC::GUID.new(0x150_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : AsyncIAdviseSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIAdviseSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIAdviseSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_on_data_change(this : AsyncIAdviseSink*, pFormatetc : Win32cr::System::Com::FORMATETC*, pStgmed : Win32cr::System::Com::STGMEDIUM*) : Void
      @lpVtbl.try &.value.begin_on_data_change.call(this, pFormatetc, pStgmed)
    end
    def finish_on_data_change(this : AsyncIAdviseSink*) : Void
      @lpVtbl.try &.value.finish_on_data_change.call(this)
    end
    def begin_on_view_change(this : AsyncIAdviseSink*, dwAspect : UInt32, lindex : Int32) : Void
      @lpVtbl.try &.value.begin_on_view_change.call(this, dwAspect, lindex)
    end
    def finish_on_view_change(this : AsyncIAdviseSink*) : Void
      @lpVtbl.try &.value.finish_on_view_change.call(this)
    end
    def begin_on_rename(this : AsyncIAdviseSink*, pmk : Void*) : Void
      @lpVtbl.try &.value.begin_on_rename.call(this, pmk)
    end
    def finish_on_rename(this : AsyncIAdviseSink*) : Void
      @lpVtbl.try &.value.finish_on_rename.call(this)
    end
    def begin_on_save(this : AsyncIAdviseSink*) : Void
      @lpVtbl.try &.value.begin_on_save.call(this)
    end
    def finish_on_save(this : AsyncIAdviseSink*) : Void
      @lpVtbl.try &.value.finish_on_save.call(this)
    end
    def begin_on_close(this : AsyncIAdviseSink*) : Void
      @lpVtbl.try &.value.begin_on_close.call(this)
    end
    def finish_on_close(this : AsyncIAdviseSink*) : Void
      @lpVtbl.try &.value.finish_on_close.call(this)
    end

  end

  @[Extern]
  record IAdviseSink2Vtbl,
    query_interface : Proc(IAdviseSink2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAdviseSink2*, UInt32),
    release : Proc(IAdviseSink2*, UInt32),
    on_data_change : Proc(IAdviseSink2*, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::STGMEDIUM*, Void),
    on_view_change : Proc(IAdviseSink2*, UInt32, Int32, Void),
    on_rename : Proc(IAdviseSink2*, Void*, Void),
    on_save : Proc(IAdviseSink2*, Void),
    on_close : Proc(IAdviseSink2*, Void),
    on_link_src_change : Proc(IAdviseSink2*, Void*, Void)


  @[Extern]
  #@[Com("00000125-0000-0000-c000-000000000046")]
  record IAdviseSink2, lpVtbl : IAdviseSink2Vtbl* do
    GUID = LibC::GUID.new(0x125_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IAdviseSink2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAdviseSink2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAdviseSink2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_data_change(this : IAdviseSink2*, pFormatetc : Win32cr::System::Com::FORMATETC*, pStgmed : Win32cr::System::Com::STGMEDIUM*) : Void
      @lpVtbl.try &.value.on_data_change.call(this, pFormatetc, pStgmed)
    end
    def on_view_change(this : IAdviseSink2*, dwAspect : UInt32, lindex : Int32) : Void
      @lpVtbl.try &.value.on_view_change.call(this, dwAspect, lindex)
    end
    def on_rename(this : IAdviseSink2*, pmk : Void*) : Void
      @lpVtbl.try &.value.on_rename.call(this, pmk)
    end
    def on_save(this : IAdviseSink2*) : Void
      @lpVtbl.try &.value.on_save.call(this)
    end
    def on_close(this : IAdviseSink2*) : Void
      @lpVtbl.try &.value.on_close.call(this)
    end
    def on_link_src_change(this : IAdviseSink2*, pmk : Void*) : Void
      @lpVtbl.try &.value.on_link_src_change.call(this, pmk)
    end

  end

  @[Extern]
  record AsyncIAdviseSink2Vtbl,
    query_interface : Proc(AsyncIAdviseSink2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIAdviseSink2*, UInt32),
    release : Proc(AsyncIAdviseSink2*, UInt32),
    begin_on_data_change : Proc(AsyncIAdviseSink2*, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::STGMEDIUM*, Void),
    finish_on_data_change : Proc(AsyncIAdviseSink2*, Void),
    begin_on_view_change : Proc(AsyncIAdviseSink2*, UInt32, Int32, Void),
    finish_on_view_change : Proc(AsyncIAdviseSink2*, Void),
    begin_on_rename : Proc(AsyncIAdviseSink2*, Void*, Void),
    finish_on_rename : Proc(AsyncIAdviseSink2*, Void),
    begin_on_save : Proc(AsyncIAdviseSink2*, Void),
    finish_on_save : Proc(AsyncIAdviseSink2*, Void),
    begin_on_close : Proc(AsyncIAdviseSink2*, Void),
    finish_on_close : Proc(AsyncIAdviseSink2*, Void),
    begin_on_link_src_change : Proc(AsyncIAdviseSink2*, Void*, Void),
    finish_on_link_src_change : Proc(AsyncIAdviseSink2*, Void)


  @[Extern]
  #@[Com("00000151-0000-0000-c000-000000000046")]
  record AsyncIAdviseSink2, lpVtbl : AsyncIAdviseSink2Vtbl* do
    GUID = LibC::GUID.new(0x151_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : AsyncIAdviseSink2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIAdviseSink2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIAdviseSink2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_on_data_change(this : AsyncIAdviseSink2*, pFormatetc : Win32cr::System::Com::FORMATETC*, pStgmed : Win32cr::System::Com::STGMEDIUM*) : Void
      @lpVtbl.try &.value.begin_on_data_change.call(this, pFormatetc, pStgmed)
    end
    def finish_on_data_change(this : AsyncIAdviseSink2*) : Void
      @lpVtbl.try &.value.finish_on_data_change.call(this)
    end
    def begin_on_view_change(this : AsyncIAdviseSink2*, dwAspect : UInt32, lindex : Int32) : Void
      @lpVtbl.try &.value.begin_on_view_change.call(this, dwAspect, lindex)
    end
    def finish_on_view_change(this : AsyncIAdviseSink2*) : Void
      @lpVtbl.try &.value.finish_on_view_change.call(this)
    end
    def begin_on_rename(this : AsyncIAdviseSink2*, pmk : Void*) : Void
      @lpVtbl.try &.value.begin_on_rename.call(this, pmk)
    end
    def finish_on_rename(this : AsyncIAdviseSink2*) : Void
      @lpVtbl.try &.value.finish_on_rename.call(this)
    end
    def begin_on_save(this : AsyncIAdviseSink2*) : Void
      @lpVtbl.try &.value.begin_on_save.call(this)
    end
    def finish_on_save(this : AsyncIAdviseSink2*) : Void
      @lpVtbl.try &.value.finish_on_save.call(this)
    end
    def begin_on_close(this : AsyncIAdviseSink2*) : Void
      @lpVtbl.try &.value.begin_on_close.call(this)
    end
    def finish_on_close(this : AsyncIAdviseSink2*) : Void
      @lpVtbl.try &.value.finish_on_close.call(this)
    end
    def begin_on_link_src_change(this : AsyncIAdviseSink2*, pmk : Void*) : Void
      @lpVtbl.try &.value.begin_on_link_src_change.call(this, pmk)
    end
    def finish_on_link_src_change(this : AsyncIAdviseSink2*) : Void
      @lpVtbl.try &.value.finish_on_link_src_change.call(this)
    end

  end

  @[Extern]
  record IDataObjectVtbl,
    query_interface : Proc(IDataObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDataObject*, UInt32),
    release : Proc(IDataObject*, UInt32),
    get_data : Proc(IDataObject*, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::STGMEDIUM*, Win32cr::Foundation::HRESULT),
    get_data_here : Proc(IDataObject*, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::STGMEDIUM*, Win32cr::Foundation::HRESULT),
    query_get_data : Proc(IDataObject*, Win32cr::System::Com::FORMATETC*, Win32cr::Foundation::HRESULT),
    get_canonical_format_etc : Proc(IDataObject*, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::FORMATETC*, Win32cr::Foundation::HRESULT),
    set_data : Proc(IDataObject*, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::STGMEDIUM*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    enum_format_etc : Proc(IDataObject*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    d_advise : Proc(IDataObject*, Win32cr::System::Com::FORMATETC*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    d_unadvise : Proc(IDataObject*, UInt32, Win32cr::Foundation::HRESULT),
    enum_d_advise : Proc(IDataObject*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0000010e-0000-0000-c000-000000000046")]
  record IDataObject, lpVtbl : IDataObjectVtbl* do
    GUID = LibC::GUID.new(0x10e_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IDataObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDataObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDataObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_data(this : IDataObject*, pformatetcIn : Win32cr::System::Com::FORMATETC*, pmedium : Win32cr::System::Com::STGMEDIUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, pformatetcIn, pmedium)
    end
    def get_data_here(this : IDataObject*, pformatetc : Win32cr::System::Com::FORMATETC*, pmedium : Win32cr::System::Com::STGMEDIUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_here.call(this, pformatetc, pmedium)
    end
    def query_get_data(this : IDataObject*, pformatetc : Win32cr::System::Com::FORMATETC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_get_data.call(this, pformatetc)
    end
    def get_canonical_format_etc(this : IDataObject*, pformatectIn : Win32cr::System::Com::FORMATETC*, pformatetcOut : Win32cr::System::Com::FORMATETC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_format_etc.call(this, pformatectIn, pformatetcOut)
    end
    def set_data(this : IDataObject*, pformatetc : Win32cr::System::Com::FORMATETC*, pmedium : Win32cr::System::Com::STGMEDIUM*, fRelease : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_data.call(this, pformatetc, pmedium, fRelease)
    end
    def enum_format_etc(this : IDataObject*, dwDirection : UInt32, ppenumFormatEtc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_format_etc.call(this, dwDirection, ppenumFormatEtc)
    end
    def d_advise(this : IDataObject*, pformatetc : Win32cr::System::Com::FORMATETC*, advf : UInt32, pAdvSink : Void*, pdwConnection : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.d_advise.call(this, pformatetc, advf, pAdvSink, pdwConnection)
    end
    def d_unadvise(this : IDataObject*, dwConnection : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.d_unadvise.call(this, dwConnection)
    end
    def enum_d_advise(this : IDataObject*, ppenumAdvise : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_d_advise.call(this, ppenumAdvise)
    end

  end

  @[Extern]
  record IDataAdviseHolderVtbl,
    query_interface : Proc(IDataAdviseHolder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDataAdviseHolder*, UInt32),
    release : Proc(IDataAdviseHolder*, UInt32),
    advise : Proc(IDataAdviseHolder*, Void*, Win32cr::System::Com::FORMATETC*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IDataAdviseHolder*, UInt32, Win32cr::Foundation::HRESULT),
    enum_advise : Proc(IDataAdviseHolder*, Void**, Win32cr::Foundation::HRESULT),
    send_on_data_change : Proc(IDataAdviseHolder*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000110-0000-0000-c000-000000000046")]
  record IDataAdviseHolder, lpVtbl : IDataAdviseHolderVtbl* do
    GUID = LibC::GUID.new(0x110_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IDataAdviseHolder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDataAdviseHolder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDataAdviseHolder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise(this : IDataAdviseHolder*, pDataObject : Void*, pFetc : Win32cr::System::Com::FORMATETC*, advf : UInt32, pAdvise : Void*, pdwConnection : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, pDataObject, pFetc, advf, pAdvise, pdwConnection)
    end
    def unadvise(this : IDataAdviseHolder*, dwConnection : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, dwConnection)
    end
    def enum_advise(this : IDataAdviseHolder*, ppenumAdvise : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_advise.call(this, ppenumAdvise)
    end
    def send_on_data_change(this : IDataAdviseHolder*, pDataObject : Void*, dwReserved : UInt32, advf : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_on_data_change.call(this, pDataObject, dwReserved, advf)
    end

  end

  @[Extern]
  record IClassActivatorVtbl,
    query_interface : Proc(IClassActivator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IClassActivator*, UInt32),
    release : Proc(IClassActivator*, UInt32),
    get_class_object : Proc(IClassActivator*, LibC::GUID*, UInt32, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000140-0000-0000-c000-000000000046")]
  record IClassActivator, lpVtbl : IClassActivatorVtbl* do
    GUID = LibC::GUID.new(0x140_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IClassActivator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IClassActivator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IClassActivator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_object(this : IClassActivator*, rclsid : LibC::GUID*, dwClassContext : UInt32, locale : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_object.call(this, rclsid, dwClassContext, locale, riid, ppv)
    end

  end

  @[Extern]
  record IProgressNotifyVtbl,
    query_interface : Proc(IProgressNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProgressNotify*, UInt32),
    release : Proc(IProgressNotify*, UInt32),
    on_progress : Proc(IProgressNotify*, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a9d758a0-4617-11cf-95fc-00aa00680db4")]
  record IProgressNotify, lpVtbl : IProgressNotifyVtbl* do
    GUID = LibC::GUID.new(0xa9d758a0_u32, 0x4617_u16, 0x11cf_u16, StaticArray[0x95_u8, 0xfc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0xd_u8, 0xb4_u8])
    def query_interface(this : IProgressNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProgressNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProgressNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_progress(this : IProgressNotify*, dwProgressCurrent : UInt32, dwProgressMaximum : UInt32, fAccurate : Win32cr::Foundation::BOOL, fOwner : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, dwProgressCurrent, dwProgressMaximum, fAccurate, fOwner)
    end

  end

  @[Extern]
  record IBlockingLockVtbl,
    query_interface : Proc(IBlockingLock*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBlockingLock*, UInt32),
    release : Proc(IBlockingLock*, UInt32),
    lock : Proc(IBlockingLock*, UInt32, Win32cr::Foundation::HRESULT),
    unlock : Proc(IBlockingLock*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("30f3d47a-6447-11d1-8e3c-00c04fb9386d")]
  record IBlockingLock, lpVtbl : IBlockingLockVtbl* do
    GUID = LibC::GUID.new(0x30f3d47a_u32, 0x6447_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x3c_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x38_u8, 0x6d_u8])
    def query_interface(this : IBlockingLock*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBlockingLock*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBlockingLock*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def lock(this : IBlockingLock*, dwTimeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock.call(this, dwTimeout)
    end
    def unlock(this : IBlockingLock*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock.call(this)
    end

  end

  @[Extern]
  record ITimeAndNoticeControlVtbl,
    query_interface : Proc(ITimeAndNoticeControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITimeAndNoticeControl*, UInt32),
    release : Proc(ITimeAndNoticeControl*, UInt32),
    suppress_changes : Proc(ITimeAndNoticeControl*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bc0bf6ae-8878-11d1-83e9-00c04fc2c6d4")]
  record ITimeAndNoticeControl, lpVtbl : ITimeAndNoticeControlVtbl* do
    GUID = LibC::GUID.new(0xbc0bf6ae_u32, 0x8878_u16, 0x11d1_u16, StaticArray[0x83_u8, 0xe9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xc6_u8, 0xd4_u8])
    def query_interface(this : ITimeAndNoticeControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITimeAndNoticeControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITimeAndNoticeControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def suppress_changes(this : ITimeAndNoticeControl*, res1 : UInt32, res2 : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suppress_changes.call(this, res1, res2)
    end

  end

  @[Extern]
  record IOplockStorageVtbl,
    query_interface : Proc(IOplockStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOplockStorage*, UInt32),
    release : Proc(IOplockStorage*, UInt32),
    create_storage_ex : Proc(IOplockStorage*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    open_storage_ex : Proc(IOplockStorage*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8d19c834-8879-11d1-83e9-00c04fc2c6d4")]
  record IOplockStorage, lpVtbl : IOplockStorageVtbl* do
    GUID = LibC::GUID.new(0x8d19c834_u32, 0x8879_u16, 0x11d1_u16, StaticArray[0x83_u8, 0xe9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xc6_u8, 0xd4_u8])
    def query_interface(this : IOplockStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOplockStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOplockStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_storage_ex(this : IOplockStorage*, pwcsName : Win32cr::Foundation::PWSTR, grfMode : UInt32, stgfmt : UInt32, grfAttrs : UInt32, riid : LibC::GUID*, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage_ex.call(this, pwcsName, grfMode, stgfmt, grfAttrs, riid, ppstgOpen)
    end
    def open_storage_ex(this : IOplockStorage*, pwcsName : Win32cr::Foundation::PWSTR, grfMode : UInt32, stgfmt : UInt32, grfAttrs : UInt32, riid : LibC::GUID*, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_storage_ex.call(this, pwcsName, grfMode, stgfmt, grfAttrs, riid, ppstgOpen)
    end

  end

  @[Extern]
  record IUrlMonVtbl,
    query_interface : Proc(IUrlMon*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUrlMon*, UInt32),
    release : Proc(IUrlMon*, UInt32),
    async_get_class_bits : Proc(IUrlMon*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::PWSTR, Void*, UInt32, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000026-0000-0000-c000-000000000046")]
  record IUrlMon, lpVtbl : IUrlMonVtbl* do
    GUID = LibC::GUID.new(0x26_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IUrlMon*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUrlMon*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUrlMon*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def async_get_class_bits(this : IUrlMon*, rclsid : LibC::GUID*, pszTYPE : Win32cr::Foundation::PWSTR, pszExt : Win32cr::Foundation::PWSTR, dwFileVersionMS : UInt32, dwFileVersionLS : UInt32, pszCodeBase : Win32cr::Foundation::PWSTR, pbc : Void*, dwClassContext : UInt32, riid : LibC::GUID*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.async_get_class_bits.call(this, rclsid, pszTYPE, pszExt, dwFileVersionMS, dwFileVersionLS, pszCodeBase, pbc, dwClassContext, riid, flags)
    end

  end

  @[Extern]
  record IForegroundTransferVtbl,
    query_interface : Proc(IForegroundTransfer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IForegroundTransfer*, UInt32),
    release : Proc(IForegroundTransfer*, UInt32),
    allow_foreground_transfer : Proc(IForegroundTransfer*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000145-0000-0000-c000-000000000046")]
  record IForegroundTransfer, lpVtbl : IForegroundTransferVtbl* do
    GUID = LibC::GUID.new(0x145_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IForegroundTransfer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IForegroundTransfer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IForegroundTransfer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def allow_foreground_transfer(this : IForegroundTransfer*, lpvReserved : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allow_foreground_transfer.call(this, lpvReserved)
    end

  end

  @[Extern]
  record IProcessLockVtbl,
    query_interface : Proc(IProcessLock*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProcessLock*, UInt32),
    release : Proc(IProcessLock*, UInt32),
    add_ref_on_process : Proc(IProcessLock*, UInt32),
    release_ref_on_process : Proc(IProcessLock*, UInt32)


  @[Extern]
  #@[Com("000001d5-0000-0000-c000-000000000046")]
  record IProcessLock, lpVtbl : IProcessLockVtbl* do
    GUID = LibC::GUID.new(0x1d5_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IProcessLock*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProcessLock*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProcessLock*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_ref_on_process(this : IProcessLock*) : UInt32
      @lpVtbl.try &.value.add_ref_on_process.call(this)
    end
    def release_ref_on_process(this : IProcessLock*) : UInt32
      @lpVtbl.try &.value.release_ref_on_process.call(this)
    end

  end

  @[Extern]
  record ISurrogateServiceVtbl,
    query_interface : Proc(ISurrogateService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISurrogateService*, UInt32),
    release : Proc(ISurrogateService*, UInt32),
    init : Proc(ISurrogateService*, LibC::GUID*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    application_launch : Proc(ISurrogateService*, LibC::GUID*, Win32cr::System::Com::ApplicationType, Win32cr::Foundation::HRESULT),
    application_free : Proc(ISurrogateService*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    catalog_refresh : Proc(ISurrogateService*, UInt32, Win32cr::Foundation::HRESULT),
    process_shutdown : Proc(ISurrogateService*, Win32cr::System::Com::ShutdownType, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("000001d4-0000-0000-c000-000000000046")]
  record ISurrogateService, lpVtbl : ISurrogateServiceVtbl* do
    GUID = LibC::GUID.new(0x1d4_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ISurrogateService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISurrogateService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISurrogateService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : ISurrogateService*, rguidProcessID : LibC::GUID*, pProcessLock : Void*, pfApplicationAware : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, rguidProcessID, pProcessLock, pfApplicationAware)
    end
    def application_launch(this : ISurrogateService*, rguidApplID : LibC::GUID*, appType : Win32cr::System::Com::ApplicationType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.application_launch.call(this, rguidApplID, appType)
    end
    def application_free(this : ISurrogateService*, rguidApplID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.application_free.call(this, rguidApplID)
    end
    def catalog_refresh(this : ISurrogateService*, ulReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.catalog_refresh.call(this, ulReserved)
    end
    def process_shutdown(this : ISurrogateService*, shutdownType : Win32cr::System::Com::ShutdownType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_shutdown.call(this, shutdownType)
    end

  end

  @[Extern]
  record IInitializeSpyVtbl,
    query_interface : Proc(IInitializeSpy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInitializeSpy*, UInt32),
    release : Proc(IInitializeSpy*, UInt32),
    pre_initialize : Proc(IInitializeSpy*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    post_initialize : Proc(IInitializeSpy*, Win32cr::Foundation::HRESULT, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    pre_uninitialize : Proc(IInitializeSpy*, UInt32, Win32cr::Foundation::HRESULT),
    post_uninitialize : Proc(IInitializeSpy*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00000034-0000-0000-c000-000000000046")]
  record IInitializeSpy, lpVtbl : IInitializeSpyVtbl* do
    GUID = LibC::GUID.new(0x34_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IInitializeSpy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInitializeSpy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInitializeSpy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def pre_initialize(this : IInitializeSpy*, dwCoInit : UInt32, dwCurThreadAptRefs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pre_initialize.call(this, dwCoInit, dwCurThreadAptRefs)
    end
    def post_initialize(this : IInitializeSpy*, hrCoInit : Win32cr::Foundation::HRESULT, dwCoInit : UInt32, dwNewThreadAptRefs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.post_initialize.call(this, hrCoInit, dwCoInit, dwNewThreadAptRefs)
    end
    def pre_uninitialize(this : IInitializeSpy*, dwCurThreadAptRefs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pre_uninitialize.call(this, dwCurThreadAptRefs)
    end
    def post_uninitialize(this : IInitializeSpy*, dwNewThreadAptRefs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.post_uninitialize.call(this, dwNewThreadAptRefs)
    end

  end

  @[Extern]
  record IServiceProviderVtbl,
    query_interface : Proc(IServiceProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceProvider*, UInt32),
    release : Proc(IServiceProvider*, UInt32),
    query_service : Proc(IServiceProvider*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6d5140c1-7436-11ce-8034-00aa006009fa")]
  record IServiceProvider, lpVtbl : IServiceProviderVtbl* do
    GUID = LibC::GUID.new(0x6d5140c1_u32, 0x7436_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x34_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0x9_u8, 0xfa_u8])
    def query_interface(this : IServiceProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_service(this : IServiceProvider*, guidService : LibC::GUID*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_service.call(this, guidService, riid, ppvObject)
    end

  end

  @[Extern]
  record IEnumGUIDVtbl,
    query_interface : Proc(IEnumGUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumGUID*, UInt32),
    release : Proc(IEnumGUID*, UInt32),
    next__ : Proc(IEnumGUID*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumGUID*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumGUID*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumGUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0002e000-0000-0000-c000-000000000046")]
  record IEnumGUID, lpVtbl : IEnumGUIDVtbl* do
    GUID = LibC::GUID.new(0x2e000_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumGUID*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumGUID*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumGUID*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumGUID*, celt : UInt32, rgelt : LibC::GUID*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumGUID*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumGUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumGUID*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IEnumCATEGORYINFOVtbl,
    query_interface : Proc(IEnumCATEGORYINFO*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumCATEGORYINFO*, UInt32),
    release : Proc(IEnumCATEGORYINFO*, UInt32),
    next__ : Proc(IEnumCATEGORYINFO*, UInt32, Win32cr::System::Com::CATEGORYINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumCATEGORYINFO*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumCATEGORYINFO*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumCATEGORYINFO*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0002e011-0000-0000-c000-000000000046")]
  record IEnumCATEGORYINFO, lpVtbl : IEnumCATEGORYINFOVtbl* do
    GUID = LibC::GUID.new(0x2e011_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumCATEGORYINFO*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumCATEGORYINFO*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumCATEGORYINFO*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumCATEGORYINFO*, celt : UInt32, rgelt : Win32cr::System::Com::CATEGORYINFO*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumCATEGORYINFO*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumCATEGORYINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumCATEGORYINFO*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record ICatRegisterVtbl,
    query_interface : Proc(ICatRegister*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICatRegister*, UInt32),
    release : Proc(ICatRegister*, UInt32),
    register_categories : Proc(ICatRegister*, UInt32, Win32cr::System::Com::CATEGORYINFO*, Win32cr::Foundation::HRESULT),
    un_register_categories : Proc(ICatRegister*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    register_class_impl_categories : Proc(ICatRegister*, LibC::GUID*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    un_register_class_impl_categories : Proc(ICatRegister*, LibC::GUID*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    register_class_req_categories : Proc(ICatRegister*, LibC::GUID*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    un_register_class_req_categories : Proc(ICatRegister*, LibC::GUID*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0002e012-0000-0000-c000-000000000046")]
  record ICatRegister, lpVtbl : ICatRegisterVtbl* do
    GUID = LibC::GUID.new(0x2e012_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ICatRegister*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICatRegister*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICatRegister*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_categories(this : ICatRegister*, cCategories : UInt32, rgCategoryInfo : Win32cr::System::Com::CATEGORYINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_categories.call(this, cCategories, rgCategoryInfo)
    end
    def un_register_categories(this : ICatRegister*, cCategories : UInt32, rgcatid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_register_categories.call(this, cCategories, rgcatid)
    end
    def register_class_impl_categories(this : ICatRegister*, rclsid : LibC::GUID*, cCategories : UInt32, rgcatid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_class_impl_categories.call(this, rclsid, cCategories, rgcatid)
    end
    def un_register_class_impl_categories(this : ICatRegister*, rclsid : LibC::GUID*, cCategories : UInt32, rgcatid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_register_class_impl_categories.call(this, rclsid, cCategories, rgcatid)
    end
    def register_class_req_categories(this : ICatRegister*, rclsid : LibC::GUID*, cCategories : UInt32, rgcatid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_class_req_categories.call(this, rclsid, cCategories, rgcatid)
    end
    def un_register_class_req_categories(this : ICatRegister*, rclsid : LibC::GUID*, cCategories : UInt32, rgcatid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_register_class_req_categories.call(this, rclsid, cCategories, rgcatid)
    end

  end

  @[Extern]
  record ICatInformationVtbl,
    query_interface : Proc(ICatInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICatInformation*, UInt32),
    release : Proc(ICatInformation*, UInt32),
    enum_categories : Proc(ICatInformation*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_category_desc : Proc(ICatInformation*, LibC::GUID*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    enum_classes_of_categories : Proc(ICatInformation*, UInt32, LibC::GUID*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    is_class_of_categories : Proc(ICatInformation*, LibC::GUID*, UInt32, LibC::GUID*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    enum_impl_categories_of_class : Proc(ICatInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_req_categories_of_class : Proc(ICatInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0002e013-0000-0000-c000-000000000046")]
  record ICatInformation, lpVtbl : ICatInformationVtbl* do
    GUID = LibC::GUID.new(0x2e013_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ICatInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICatInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICatInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_categories(this : ICatInformation*, lcid : UInt32, ppenumCategoryInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_categories.call(this, lcid, ppenumCategoryInfo)
    end
    def get_category_desc(this : ICatInformation*, rcatid : LibC::GUID*, lcid : UInt32, pszDesc : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category_desc.call(this, rcatid, lcid, pszDesc)
    end
    def enum_classes_of_categories(this : ICatInformation*, cImplemented : UInt32, rgcatidImpl : LibC::GUID*, cRequired : UInt32, rgcatidReq : LibC::GUID*, ppenumClsid : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_classes_of_categories.call(this, cImplemented, rgcatidImpl, cRequired, rgcatidReq, ppenumClsid)
    end
    def is_class_of_categories(this : ICatInformation*, rclsid : LibC::GUID*, cImplemented : UInt32, rgcatidImpl : LibC::GUID*, cRequired : UInt32, rgcatidReq : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_class_of_categories.call(this, rclsid, cImplemented, rgcatidImpl, cRequired, rgcatidReq)
    end
    def enum_impl_categories_of_class(this : ICatInformation*, rclsid : LibC::GUID*, ppenumCatid : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_impl_categories_of_class.call(this, rclsid, ppenumCatid)
    end
    def enum_req_categories_of_class(this : ICatInformation*, rclsid : LibC::GUID*, ppenumCatid : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_req_categories_of_class.call(this, rclsid, ppenumCatid)
    end

  end

  @[Extern]
  record IContextCallbackVtbl,
    query_interface : Proc(IContextCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContextCallback*, UInt32),
    release : Proc(IContextCallback*, UInt32),
    context_callback : Proc(IContextCallback*, Win32cr::System::Com::PFNCONTEXTCALL, Win32cr::System::Com::ComCallData*, LibC::GUID*, Int32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("000001da-0000-0000-c000-000000000046")]
  record IContextCallback, lpVtbl : IContextCallbackVtbl* do
    GUID = LibC::GUID.new(0x1da_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IContextCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContextCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContextCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def context_callback(this : IContextCallback*, pfnCallback : Win32cr::System::Com::PFNCONTEXTCALL, pParam : Win32cr::System::Com::ComCallData*, riid : LibC::GUID*, iMethod : Int32, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.context_callback.call(this, pfnCallback, pParam, riid, iMethod, pUnk)
    end

  end

  @[Extern]
  record IBindingVtbl,
    query_interface : Proc(IBinding*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBinding*, UInt32),
    release : Proc(IBinding*, UInt32),
    abort : Proc(IBinding*, Win32cr::Foundation::HRESULT),
    suspend : Proc(IBinding*, Win32cr::Foundation::HRESULT),
    resume : Proc(IBinding*, Win32cr::Foundation::HRESULT),
    set_priority : Proc(IBinding*, Int32, Win32cr::Foundation::HRESULT),
    get_priority : Proc(IBinding*, Int32*, Win32cr::Foundation::HRESULT),
    get_bind_result : Proc(IBinding*, LibC::GUID*, UInt32*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("79eac9c0-baf9-11ce-8c82-00aa004ba90b")]
  record IBinding, lpVtbl : IBindingVtbl* do
    GUID = LibC::GUID.new(0x79eac9c0_u32, 0xbaf9_u16, 0x11ce_u16, StaticArray[0x8c_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xa9_u8, 0xb_u8])
    def query_interface(this : IBinding*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBinding*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBinding*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def abort(this : IBinding*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def suspend(this : IBinding*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this)
    end
    def resume(this : IBinding*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def set_priority(this : IBinding*, nPriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority.call(this, nPriority)
    end
    def get_priority(this : IBinding*, pnPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pnPriority)
    end
    def get_bind_result(this : IBinding*, pclsidProtocol : LibC::GUID*, pdwResult : UInt32*, pszResult : Win32cr::Foundation::PWSTR*, pdwReserved : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bind_result.call(this, pclsidProtocol, pdwResult, pszResult, pdwReserved)
    end

  end

  @[Extern]
  record IBindStatusCallbackVtbl,
    query_interface : Proc(IBindStatusCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBindStatusCallback*, UInt32),
    release : Proc(IBindStatusCallback*, UInt32),
    on_start_binding : Proc(IBindStatusCallback*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_priority : Proc(IBindStatusCallback*, Int32*, Win32cr::Foundation::HRESULT),
    on_low_resource : Proc(IBindStatusCallback*, UInt32, Win32cr::Foundation::HRESULT),
    on_progress : Proc(IBindStatusCallback*, UInt32, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    on_stop_binding : Proc(IBindStatusCallback*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_bind_info : Proc(IBindStatusCallback*, UInt32*, Win32cr::System::Com::BINDINFO*, Win32cr::Foundation::HRESULT),
    on_data_available : Proc(IBindStatusCallback*, UInt32, UInt32, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::STGMEDIUM*, Win32cr::Foundation::HRESULT),
    on_object_available : Proc(IBindStatusCallback*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("79eac9c1-baf9-11ce-8c82-00aa004ba90b")]
  record IBindStatusCallback, lpVtbl : IBindStatusCallbackVtbl* do
    GUID = LibC::GUID.new(0x79eac9c1_u32, 0xbaf9_u16, 0x11ce_u16, StaticArray[0x8c_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xa9_u8, 0xb_u8])
    def query_interface(this : IBindStatusCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBindStatusCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBindStatusCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_start_binding(this : IBindStatusCallback*, dwReserved : UInt32, pib : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start_binding.call(this, dwReserved, pib)
    end
    def get_priority(this : IBindStatusCallback*, pnPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pnPriority)
    end
    def on_low_resource(this : IBindStatusCallback*, reserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_low_resource.call(this, reserved)
    end
    def on_progress(this : IBindStatusCallback*, ulProgress : UInt32, ulProgressMax : UInt32, ulStatusCode : UInt32, szStatusText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, ulProgress, ulProgressMax, ulStatusCode, szStatusText)
    end
    def on_stop_binding(this : IBindStatusCallback*, hresult : Win32cr::Foundation::HRESULT, szError : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_stop_binding.call(this, hresult, szError)
    end
    def get_bind_info(this : IBindStatusCallback*, grfBINDF : UInt32*, pbindinfo : Win32cr::System::Com::BINDINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bind_info.call(this, grfBINDF, pbindinfo)
    end
    def on_data_available(this : IBindStatusCallback*, grfBSCF : UInt32, dwSize : UInt32, pformatetc : Win32cr::System::Com::FORMATETC*, pstgmed : Win32cr::System::Com::STGMEDIUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_available.call(this, grfBSCF, dwSize, pformatetc, pstgmed)
    end
    def on_object_available(this : IBindStatusCallback*, riid : LibC::GUID*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_available.call(this, riid, punk)
    end

  end

  @[Extern]
  record IBindStatusCallbackExVtbl,
    query_interface : Proc(IBindStatusCallbackEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBindStatusCallbackEx*, UInt32),
    release : Proc(IBindStatusCallbackEx*, UInt32),
    on_start_binding : Proc(IBindStatusCallbackEx*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_priority : Proc(IBindStatusCallbackEx*, Int32*, Win32cr::Foundation::HRESULT),
    on_low_resource : Proc(IBindStatusCallbackEx*, UInt32, Win32cr::Foundation::HRESULT),
    on_progress : Proc(IBindStatusCallbackEx*, UInt32, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    on_stop_binding : Proc(IBindStatusCallbackEx*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_bind_info : Proc(IBindStatusCallbackEx*, UInt32*, Win32cr::System::Com::BINDINFO*, Win32cr::Foundation::HRESULT),
    on_data_available : Proc(IBindStatusCallbackEx*, UInt32, UInt32, Win32cr::System::Com::FORMATETC*, Win32cr::System::Com::STGMEDIUM*, Win32cr::Foundation::HRESULT),
    on_object_available : Proc(IBindStatusCallbackEx*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_bind_info_ex : Proc(IBindStatusCallbackEx*, UInt32*, Win32cr::System::Com::BINDINFO*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aaa74ef9-8ee7-4659-88d9-f8c504da73cc")]
  record IBindStatusCallbackEx, lpVtbl : IBindStatusCallbackExVtbl* do
    GUID = LibC::GUID.new(0xaaa74ef9_u32, 0x8ee7_u16, 0x4659_u16, StaticArray[0x88_u8, 0xd9_u8, 0xf8_u8, 0xc5_u8, 0x4_u8, 0xda_u8, 0x73_u8, 0xcc_u8])
    def query_interface(this : IBindStatusCallbackEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBindStatusCallbackEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBindStatusCallbackEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_start_binding(this : IBindStatusCallbackEx*, dwReserved : UInt32, pib : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start_binding.call(this, dwReserved, pib)
    end
    def get_priority(this : IBindStatusCallbackEx*, pnPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pnPriority)
    end
    def on_low_resource(this : IBindStatusCallbackEx*, reserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_low_resource.call(this, reserved)
    end
    def on_progress(this : IBindStatusCallbackEx*, ulProgress : UInt32, ulProgressMax : UInt32, ulStatusCode : UInt32, szStatusText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, ulProgress, ulProgressMax, ulStatusCode, szStatusText)
    end
    def on_stop_binding(this : IBindStatusCallbackEx*, hresult : Win32cr::Foundation::HRESULT, szError : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_stop_binding.call(this, hresult, szError)
    end
    def get_bind_info(this : IBindStatusCallbackEx*, grfBINDF : UInt32*, pbindinfo : Win32cr::System::Com::BINDINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bind_info.call(this, grfBINDF, pbindinfo)
    end
    def on_data_available(this : IBindStatusCallbackEx*, grfBSCF : UInt32, dwSize : UInt32, pformatetc : Win32cr::System::Com::FORMATETC*, pstgmed : Win32cr::System::Com::STGMEDIUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_available.call(this, grfBSCF, dwSize, pformatetc, pstgmed)
    end
    def on_object_available(this : IBindStatusCallbackEx*, riid : LibC::GUID*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_available.call(this, riid, punk)
    end
    def get_bind_info_ex(this : IBindStatusCallbackEx*, grfBINDF : UInt32*, pbindinfo : Win32cr::System::Com::BINDINFO*, grfBINDF2 : UInt32*, pdwReserved : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bind_info_ex.call(this, grfBINDF, pbindinfo, grfBINDF2, pdwReserved)
    end

  end

  @[Extern]
  record IAuthenticateVtbl,
    query_interface : Proc(IAuthenticate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAuthenticate*, UInt32),
    release : Proc(IAuthenticate*, UInt32),
    authenticate : Proc(IAuthenticate*, Win32cr::Foundation::HWND*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("79eac9d0-baf9-11ce-8c82-00aa004ba90b")]
  record IAuthenticate, lpVtbl : IAuthenticateVtbl* do
    GUID = LibC::GUID.new(0x79eac9d0_u32, 0xbaf9_u16, 0x11ce_u16, StaticArray[0x8c_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xa9_u8, 0xb_u8])
    def query_interface(this : IAuthenticate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAuthenticate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAuthenticate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def authenticate(this : IAuthenticate*, phwnd : Win32cr::Foundation::HWND*, pszUsername : Win32cr::Foundation::PWSTR*, pszPassword : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authenticate.call(this, phwnd, pszUsername, pszPassword)
    end

  end

  @[Extern]
  record IAuthenticateExVtbl,
    query_interface : Proc(IAuthenticateEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAuthenticateEx*, UInt32),
    release : Proc(IAuthenticateEx*, UInt32),
    authenticate : Proc(IAuthenticateEx*, Win32cr::Foundation::HWND*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    authenticate_ex : Proc(IAuthenticateEx*, Win32cr::Foundation::HWND*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::System::Com::AUTHENTICATEINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2ad1edaf-d83d-48b5-9adf-03dbe19f53bd")]
  record IAuthenticateEx, lpVtbl : IAuthenticateExVtbl* do
    GUID = LibC::GUID.new(0x2ad1edaf_u32, 0xd83d_u16, 0x48b5_u16, StaticArray[0x9a_u8, 0xdf_u8, 0x3_u8, 0xdb_u8, 0xe1_u8, 0x9f_u8, 0x53_u8, 0xbd_u8])
    def query_interface(this : IAuthenticateEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAuthenticateEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAuthenticateEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def authenticate(this : IAuthenticateEx*, phwnd : Win32cr::Foundation::HWND*, pszUsername : Win32cr::Foundation::PWSTR*, pszPassword : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authenticate.call(this, phwnd, pszUsername, pszPassword)
    end
    def authenticate_ex(this : IAuthenticateEx*, phwnd : Win32cr::Foundation::HWND*, pszUsername : Win32cr::Foundation::PWSTR*, pszPassword : Win32cr::Foundation::PWSTR*, pauthinfo : Win32cr::System::Com::AUTHENTICATEINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authenticate_ex.call(this, phwnd, pszUsername, pszPassword, pauthinfo)
    end

  end

  @[Extern]
  record IUriVtbl,
    query_interface : Proc(IUri*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUri*, UInt32),
    release : Proc(IUri*, UInt32),
    get_property_bstr : Proc(IUri*, Win32cr::System::Com::Uri_PROPERTY, Win32cr::Foundation::BSTR*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_length : Proc(IUri*, Win32cr::System::Com::Uri_PROPERTY, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_dword : Proc(IUri*, Win32cr::System::Com::Uri_PROPERTY, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    has_property : Proc(IUri*, Win32cr::System::Com::Uri_PROPERTY, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_absolute_uri : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_authority : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_display_uri : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_domain : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_extension : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_fragment : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_host : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_password : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_path_and_query : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_query : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_raw_uri : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_scheme_name : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_user_info : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_user_name : Proc(IUri*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_host_type : Proc(IUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_port : Proc(IUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_scheme : Proc(IUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_zone : Proc(IUri*, UInt32*, Win32cr::Foundation::HRESULT),
    get_properties : Proc(IUri*, UInt32*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(IUri*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a39ee748-6a27-4817-a6f2-13914bef5890")]
  record IUri, lpVtbl : IUriVtbl* do
    GUID = LibC::GUID.new(0xa39ee748_u32, 0x6a27_u16, 0x4817_u16, StaticArray[0xa6_u8, 0xf2_u8, 0x13_u8, 0x91_u8, 0x4b_u8, 0xef_u8, 0x58_u8, 0x90_u8])
    def query_interface(this : IUri*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUri*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUri*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_bstr(this : IUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pbstrProperty : Win32cr::Foundation::BSTR*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_bstr.call(this, uriProp, pbstrProperty, dwFlags)
    end
    def get_property_length(this : IUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pcchProperty : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_length.call(this, uriProp, pcchProperty, dwFlags)
    end
    def get_property_dword(this : IUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pdwProperty : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_dword.call(this, uriProp, pdwProperty, dwFlags)
    end
    def has_property(this : IUri*, uriProp : Win32cr::System::Com::Uri_PROPERTY, pfHasProperty : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_property.call(this, uriProp, pfHasProperty)
    end
    def get_absolute_uri(this : IUri*, pbstrAbsoluteUri : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_absolute_uri.call(this, pbstrAbsoluteUri)
    end
    def get_authority(this : IUri*, pbstrAuthority : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authority.call(this, pbstrAuthority)
    end
    def get_display_uri(this : IUri*, pbstrDisplayString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_uri.call(this, pbstrDisplayString)
    end
    def get_domain(this : IUri*, pbstrDomain : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_domain.call(this, pbstrDomain)
    end
    def get_extension(this : IUri*, pbstrExtension : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_extension.call(this, pbstrExtension)
    end
    def get_fragment(this : IUri*, pbstrFragment : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fragment.call(this, pbstrFragment)
    end
    def get_host(this : IUri*, pbstrHost : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host.call(this, pbstrHost)
    end
    def get_password(this : IUri*, pbstrPassword : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_password.call(this, pbstrPassword)
    end
    def get_path(this : IUri*, pbstrPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, pbstrPath)
    end
    def get_path_and_query(this : IUri*, pbstrPathAndQuery : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path_and_query.call(this, pbstrPathAndQuery)
    end
    def get_query(this : IUri*, pbstrQuery : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_query.call(this, pbstrQuery)
    end
    def get_raw_uri(this : IUri*, pbstrRawUri : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_raw_uri.call(this, pbstrRawUri)
    end
    def get_scheme_name(this : IUri*, pbstrSchemeName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scheme_name.call(this, pbstrSchemeName)
    end
    def get_user_info(this : IUri*, pbstrUserInfo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_info.call(this, pbstrUserInfo)
    end
    def get_user_name(this : IUri*, pbstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_name.call(this, pbstrUserName)
    end
    def get_host_type(this : IUri*, pdwHostType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host_type.call(this, pdwHostType)
    end
    def get_port(this : IUri*, pdwPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port.call(this, pdwPort)
    end
    def get_scheme(this : IUri*, pdwScheme : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scheme.call(this, pdwScheme)
    end
    def get_zone(this : IUri*, pdwZone : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_zone.call(this, pdwZone)
    end
    def get_properties(this : IUri*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, pdwFlags)
    end
    def is_equal(this : IUri*, pUri : Void*, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, pUri, pfEqual)
    end

  end

  @[Extern]
  record IUriBuilderVtbl,
    query_interface : Proc(IUriBuilder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUriBuilder*, UInt32),
    release : Proc(IUriBuilder*, UInt32),
    create_uri_simple : Proc(IUriBuilder*, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    create_uri : Proc(IUriBuilder*, UInt32, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    create_uri_with_flags : Proc(IUriBuilder*, UInt32, UInt32, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_i_uri : Proc(IUriBuilder*, Void**, Win32cr::Foundation::HRESULT),
    set_i_uri : Proc(IUriBuilder*, Void*, Win32cr::Foundation::HRESULT),
    get_fragment : Proc(IUriBuilder*, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_host : Proc(IUriBuilder*, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_password : Proc(IUriBuilder*, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IUriBuilder*, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_port : Proc(IUriBuilder*, Win32cr::Foundation::BOOL*, UInt32*, Win32cr::Foundation::HRESULT),
    get_query : Proc(IUriBuilder*, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_scheme_name : Proc(IUriBuilder*, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_user_name : Proc(IUriBuilder*, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_fragment : Proc(IUriBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_host : Proc(IUriBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_password : Proc(IUriBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_path : Proc(IUriBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_port : Proc(IUriBuilder*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::HRESULT),
    set_query : Proc(IUriBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_scheme_name : Proc(IUriBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_user_name : Proc(IUriBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    remove_properties : Proc(IUriBuilder*, UInt32, Win32cr::Foundation::HRESULT),
    has_been_modified : Proc(IUriBuilder*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4221b2e1-8955-46c0-bd5b-de9897565de7")]
  record IUriBuilder, lpVtbl : IUriBuilderVtbl* do
    GUID = LibC::GUID.new(0x4221b2e1_u32, 0x8955_u16, 0x46c0_u16, StaticArray[0xbd_u8, 0x5b_u8, 0xde_u8, 0x98_u8, 0x97_u8, 0x56_u8, 0x5d_u8, 0xe7_u8])
    def query_interface(this : IUriBuilder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUriBuilder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUriBuilder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_uri_simple(this : IUriBuilder*, dwAllowEncodingPropertyMask : UInt32, dwReserved : LibC::UIntPtrT, ppIUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_uri_simple.call(this, dwAllowEncodingPropertyMask, dwReserved, ppIUri)
    end
    def create_uri(this : IUriBuilder*, dwCreateFlags : UInt32, dwAllowEncodingPropertyMask : UInt32, dwReserved : LibC::UIntPtrT, ppIUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_uri.call(this, dwCreateFlags, dwAllowEncodingPropertyMask, dwReserved, ppIUri)
    end
    def create_uri_with_flags(this : IUriBuilder*, dwCreateFlags : UInt32, dwUriBuilderFlags : UInt32, dwAllowEncodingPropertyMask : UInt32, dwReserved : LibC::UIntPtrT, ppIUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_uri_with_flags.call(this, dwCreateFlags, dwUriBuilderFlags, dwAllowEncodingPropertyMask, dwReserved, ppIUri)
    end
    def get_i_uri(this : IUriBuilder*, ppIUri : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_uri.call(this, ppIUri)
    end
    def set_i_uri(this : IUriBuilder*, pIUri : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_i_uri.call(this, pIUri)
    end
    def get_fragment(this : IUriBuilder*, pcchFragment : UInt32*, ppwzFragment : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fragment.call(this, pcchFragment, ppwzFragment)
    end
    def get_host(this : IUriBuilder*, pcchHost : UInt32*, ppwzHost : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host.call(this, pcchHost, ppwzHost)
    end
    def get_password(this : IUriBuilder*, pcchPassword : UInt32*, ppwzPassword : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_password.call(this, pcchPassword, ppwzPassword)
    end
    def get_path(this : IUriBuilder*, pcchPath : UInt32*, ppwzPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, pcchPath, ppwzPath)
    end
    def get_port(this : IUriBuilder*, pfHasPort : Win32cr::Foundation::BOOL*, pdwPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_port.call(this, pfHasPort, pdwPort)
    end
    def get_query(this : IUriBuilder*, pcchQuery : UInt32*, ppwzQuery : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_query.call(this, pcchQuery, ppwzQuery)
    end
    def get_scheme_name(this : IUriBuilder*, pcchSchemeName : UInt32*, ppwzSchemeName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scheme_name.call(this, pcchSchemeName, ppwzSchemeName)
    end
    def get_user_name(this : IUriBuilder*, pcchUserName : UInt32*, ppwzUserName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_name.call(this, pcchUserName, ppwzUserName)
    end
    def set_fragment(this : IUriBuilder*, pwzNewValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fragment.call(this, pwzNewValue)
    end
    def set_host(this : IUriBuilder*, pwzNewValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_host.call(this, pwzNewValue)
    end
    def set_password(this : IUriBuilder*, pwzNewValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_password.call(this, pwzNewValue)
    end
    def set_path(this : IUriBuilder*, pwzNewValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_path.call(this, pwzNewValue)
    end
    def set_port(this : IUriBuilder*, fHasPort : Win32cr::Foundation::BOOL, dwNewValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_port.call(this, fHasPort, dwNewValue)
    end
    def set_query(this : IUriBuilder*, pwzNewValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_query.call(this, pwzNewValue)
    end
    def set_scheme_name(this : IUriBuilder*, pwzNewValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scheme_name.call(this, pwzNewValue)
    end
    def set_user_name(this : IUriBuilder*, pwzNewValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_name.call(this, pwzNewValue)
    end
    def remove_properties(this : IUriBuilder*, dwPropertyMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_properties.call(this, dwPropertyMask)
    end
    def has_been_modified(this : IUriBuilder*, pfModified : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_been_modified.call(this, pfModified)
    end

  end

  @[Extern]
  record IBindHostVtbl,
    query_interface : Proc(IBindHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBindHost*, UInt32),
    release : Proc(IBindHost*, UInt32),
    create_moniker : Proc(IBindHost*, Win32cr::Foundation::PWSTR, Void*, Void**, UInt32, Win32cr::Foundation::HRESULT),
    moniker_bind_to_storage : Proc(IBindHost*, Void*, Void*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    moniker_bind_to_object : Proc(IBindHost*, Void*, Void*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fc4801a1-2ba9-11cf-a229-00aa003d7352")]
  record IBindHost, lpVtbl : IBindHostVtbl* do
    GUID = LibC::GUID.new(0xfc4801a1_u32, 0x2ba9_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x29_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x3d_u8, 0x73_u8, 0x52_u8])
    def query_interface(this : IBindHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBindHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBindHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_moniker(this : IBindHost*, szName : Win32cr::Foundation::PWSTR, pBC : Void*, ppmk : Void**, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_moniker.call(this, szName, pBC, ppmk, dwReserved)
    end
    def moniker_bind_to_storage(this : IBindHost*, pMk : Void*, pBC : Void*, pBSC : Void*, riid : LibC::GUID*, ppvObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moniker_bind_to_storage.call(this, pMk, pBC, pBSC, riid, ppvObj)
    end
    def moniker_bind_to_object(this : IBindHost*, pMk : Void*, pBC : Void*, pBSC : Void*, riid : LibC::GUID*, ppvObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moniker_bind_to_object.call(this, pMk, pBC, pBSC, riid, ppvObj)
    end

  end

  @[Extern]
  record IDispatchVtbl,
    query_interface : Proc(IDispatch*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDispatch*, UInt32),
    release : Proc(IDispatch*, UInt32),
    get_type_info_count : Proc(IDispatch*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDispatch*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDispatch*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDispatch*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00020400-0000-0000-c000-000000000046")]
  record IDispatch, lpVtbl : IDispatchVtbl* do
    GUID = LibC::GUID.new(0x20400_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IDispatch*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDispatch*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDispatch*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDispatch*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDispatch*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDispatch*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDispatch*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ITypeCompVtbl,
    query_interface : Proc(ITypeComp*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeComp*, UInt32),
    release : Proc(ITypeComp*, UInt32),
    bind : Proc(ITypeComp*, Win32cr::Foundation::PWSTR, UInt32, UInt16, Void**, Win32cr::System::Com::DESCKIND*, Win32cr::System::Com::BINDPTR*, Win32cr::Foundation::HRESULT),
    bind_type : Proc(ITypeComp*, Win32cr::Foundation::PWSTR, UInt32, Void**, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00020403-0000-0000-c000-000000000046")]
  record ITypeComp, lpVtbl : ITypeCompVtbl* do
    GUID = LibC::GUID.new(0x20403_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ITypeComp*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeComp*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeComp*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def bind(this : ITypeComp*, szName : Win32cr::Foundation::PWSTR, lHashVal : UInt32, wFlags : UInt16, ppTInfo : Void**, pDescKind : Win32cr::System::Com::DESCKIND*, pBindPtr : Win32cr::System::Com::BINDPTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind.call(this, szName, lHashVal, wFlags, ppTInfo, pDescKind, pBindPtr)
    end
    def bind_type(this : ITypeComp*, szName : Win32cr::Foundation::PWSTR, lHashVal : UInt32, ppTInfo : Void**, ppTComp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_type.call(this, szName, lHashVal, ppTInfo, ppTComp)
    end

  end

  @[Extern]
  record ITypeInfoVtbl,
    query_interface : Proc(ITypeInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeInfo*, UInt32),
    release : Proc(ITypeInfo*, UInt32),
    get_type_attr : Proc(ITypeInfo*, Win32cr::System::Com::TYPEATTR**, Win32cr::Foundation::HRESULT),
    get_type_comp : Proc(ITypeInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_func_desc : Proc(ITypeInfo*, UInt32, Win32cr::System::Com::FUNCDESC**, Win32cr::Foundation::HRESULT),
    get_var_desc : Proc(ITypeInfo*, UInt32, Win32cr::System::Com::VARDESC**, Win32cr::Foundation::HRESULT),
    get_names : Proc(ITypeInfo*, Int32, Win32cr::Foundation::BSTR*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_ref_type_of_impl_type : Proc(ITypeInfo*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_impl_type_flags : Proc(ITypeInfo*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITypeInfo*, Win32cr::Foundation::PWSTR*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(ITypeInfo*, Void*, Int32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_documentation : Proc(ITypeInfo*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_dll_entry : Proc(ITypeInfo*, Int32, Win32cr::System::Com::INVOKEKIND, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, UInt16*, Win32cr::Foundation::HRESULT),
    get_ref_type_info : Proc(ITypeInfo*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    address_of_member : Proc(ITypeInfo*, Int32, Win32cr::System::Com::INVOKEKIND, Void**, Win32cr::Foundation::HRESULT),
    create_instance : Proc(ITypeInfo*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_mops : Proc(ITypeInfo*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_containing_type_lib : Proc(ITypeInfo*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    release_type_attr : Proc(ITypeInfo*, Win32cr::System::Com::TYPEATTR*, Void),
    release_func_desc : Proc(ITypeInfo*, Win32cr::System::Com::FUNCDESC*, Void),
    release_var_desc : Proc(ITypeInfo*, Win32cr::System::Com::VARDESC*, Void)


  @[Extern]
  #@[Com("00020401-0000-0000-c000-000000000046")]
  record ITypeInfo, lpVtbl : ITypeInfoVtbl* do
    GUID = LibC::GUID.new(0x20401_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ITypeInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_attr(this : ITypeInfo*, ppTypeAttr : Win32cr::System::Com::TYPEATTR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_attr.call(this, ppTypeAttr)
    end
    def get_type_comp(this : ITypeInfo*, ppTComp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_comp.call(this, ppTComp)
    end
    def get_func_desc(this : ITypeInfo*, index : UInt32, ppFuncDesc : Win32cr::System::Com::FUNCDESC**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_func_desc.call(this, index, ppFuncDesc)
    end
    def get_var_desc(this : ITypeInfo*, index : UInt32, ppVarDesc : Win32cr::System::Com::VARDESC**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_var_desc.call(this, index, ppVarDesc)
    end
    def get_names(this : ITypeInfo*, memid : Int32, rgBstrNames : Win32cr::Foundation::BSTR*, cMaxNames : UInt32, pcNames : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names.call(this, memid, rgBstrNames, cMaxNames, pcNames)
    end
    def get_ref_type_of_impl_type(this : ITypeInfo*, index : UInt32, pRefType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ref_type_of_impl_type.call(this, index, pRefType)
    end
    def get_impl_type_flags(this : ITypeInfo*, index : UInt32, pImplTypeFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_impl_type_flags.call(this, index, pImplTypeFlags)
    end
    def get_i_ds_of_names(this : ITypeInfo*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, pMemId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, rgszNames, cNames, pMemId)
    end
    def invoke(this : ITypeInfo*, pvInstance : Void*, memid : Int32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, pvInstance, memid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_documentation(this : ITypeInfo*, memid : Int32, pBstrName : Win32cr::Foundation::BSTR*, pBstrDocString : Win32cr::Foundation::BSTR*, pdwHelpContext : UInt32*, pBstrHelpFile : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_documentation.call(this, memid, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile)
    end
    def get_dll_entry(this : ITypeInfo*, memid : Int32, invKind : Win32cr::System::Com::INVOKEKIND, pBstrDllName : Win32cr::Foundation::BSTR*, pBstrName : Win32cr::Foundation::BSTR*, pwOrdinal : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dll_entry.call(this, memid, invKind, pBstrDllName, pBstrName, pwOrdinal)
    end
    def get_ref_type_info(this : ITypeInfo*, hRefType : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ref_type_info.call(this, hRefType, ppTInfo)
    end
    def address_of_member(this : ITypeInfo*, memid : Int32, invKind : Win32cr::System::Com::INVOKEKIND, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.address_of_member.call(this, memid, invKind, ppv)
    end
    def create_instance(this : ITypeInfo*, pUnkOuter : Void*, riid : LibC::GUID*, ppvObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pUnkOuter, riid, ppvObj)
    end
    def get_mops(this : ITypeInfo*, memid : Int32, pBstrMops : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mops.call(this, memid, pBstrMops)
    end
    def get_containing_type_lib(this : ITypeInfo*, ppTLib : Void**, pIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_containing_type_lib.call(this, ppTLib, pIndex)
    end
    def release_type_attr(this : ITypeInfo*, pTypeAttr : Win32cr::System::Com::TYPEATTR*) : Void
      @lpVtbl.try &.value.release_type_attr.call(this, pTypeAttr)
    end
    def release_func_desc(this : ITypeInfo*, pFuncDesc : Win32cr::System::Com::FUNCDESC*) : Void
      @lpVtbl.try &.value.release_func_desc.call(this, pFuncDesc)
    end
    def release_var_desc(this : ITypeInfo*, pVarDesc : Win32cr::System::Com::VARDESC*) : Void
      @lpVtbl.try &.value.release_var_desc.call(this, pVarDesc)
    end

  end

  @[Extern]
  record ITypeInfo2Vtbl,
    query_interface : Proc(ITypeInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeInfo2*, UInt32),
    release : Proc(ITypeInfo2*, UInt32),
    get_type_attr : Proc(ITypeInfo2*, Win32cr::System::Com::TYPEATTR**, Win32cr::Foundation::HRESULT),
    get_type_comp : Proc(ITypeInfo2*, Void**, Win32cr::Foundation::HRESULT),
    get_func_desc : Proc(ITypeInfo2*, UInt32, Win32cr::System::Com::FUNCDESC**, Win32cr::Foundation::HRESULT),
    get_var_desc : Proc(ITypeInfo2*, UInt32, Win32cr::System::Com::VARDESC**, Win32cr::Foundation::HRESULT),
    get_names : Proc(ITypeInfo2*, Int32, Win32cr::Foundation::BSTR*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_ref_type_of_impl_type : Proc(ITypeInfo2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_impl_type_flags : Proc(ITypeInfo2*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITypeInfo2*, Win32cr::Foundation::PWSTR*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(ITypeInfo2*, Void*, Int32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_documentation : Proc(ITypeInfo2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_dll_entry : Proc(ITypeInfo2*, Int32, Win32cr::System::Com::INVOKEKIND, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, UInt16*, Win32cr::Foundation::HRESULT),
    get_ref_type_info : Proc(ITypeInfo2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    address_of_member : Proc(ITypeInfo2*, Int32, Win32cr::System::Com::INVOKEKIND, Void**, Win32cr::Foundation::HRESULT),
    create_instance : Proc(ITypeInfo2*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_mops : Proc(ITypeInfo2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_containing_type_lib : Proc(ITypeInfo2*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    release_type_attr : Proc(ITypeInfo2*, Win32cr::System::Com::TYPEATTR*, Void),
    release_func_desc : Proc(ITypeInfo2*, Win32cr::System::Com::FUNCDESC*, Void),
    release_var_desc : Proc(ITypeInfo2*, Win32cr::System::Com::VARDESC*, Void),
    get_type_kind : Proc(ITypeInfo2*, Win32cr::System::Com::TYPEKIND*, Win32cr::Foundation::HRESULT),
    get_type_flags : Proc(ITypeInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_func_index_of_mem_id : Proc(ITypeInfo2*, Int32, Win32cr::System::Com::INVOKEKIND, UInt32*, Win32cr::Foundation::HRESULT),
    get_var_index_of_mem_id : Proc(ITypeInfo2*, Int32, UInt32*, Win32cr::Foundation::HRESULT),
    get_cust_data : Proc(ITypeInfo2*, LibC::GUID*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_func_cust_data : Proc(ITypeInfo2*, UInt32, LibC::GUID*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_param_cust_data : Proc(ITypeInfo2*, UInt32, UInt32, LibC::GUID*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_var_cust_data : Proc(ITypeInfo2*, UInt32, LibC::GUID*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_impl_type_cust_data : Proc(ITypeInfo2*, UInt32, LibC::GUID*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_documentation2 : Proc(ITypeInfo2*, Int32, UInt32, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_all_cust_data : Proc(ITypeInfo2*, Win32cr::System::Com::CUSTDATA*, Win32cr::Foundation::HRESULT),
    get_all_func_cust_data : Proc(ITypeInfo2*, UInt32, Win32cr::System::Com::CUSTDATA*, Win32cr::Foundation::HRESULT),
    get_all_param_cust_data : Proc(ITypeInfo2*, UInt32, UInt32, Win32cr::System::Com::CUSTDATA*, Win32cr::Foundation::HRESULT),
    get_all_var_cust_data : Proc(ITypeInfo2*, UInt32, Win32cr::System::Com::CUSTDATA*, Win32cr::Foundation::HRESULT),
    get_all_impl_type_cust_data : Proc(ITypeInfo2*, UInt32, Win32cr::System::Com::CUSTDATA*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00020412-0000-0000-c000-000000000046")]
  record ITypeInfo2, lpVtbl : ITypeInfo2Vtbl* do
    GUID = LibC::GUID.new(0x20412_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ITypeInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_attr(this : ITypeInfo2*, ppTypeAttr : Win32cr::System::Com::TYPEATTR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_attr.call(this, ppTypeAttr)
    end
    def get_type_comp(this : ITypeInfo2*, ppTComp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_comp.call(this, ppTComp)
    end
    def get_func_desc(this : ITypeInfo2*, index : UInt32, ppFuncDesc : Win32cr::System::Com::FUNCDESC**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_func_desc.call(this, index, ppFuncDesc)
    end
    def get_var_desc(this : ITypeInfo2*, index : UInt32, ppVarDesc : Win32cr::System::Com::VARDESC**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_var_desc.call(this, index, ppVarDesc)
    end
    def get_names(this : ITypeInfo2*, memid : Int32, rgBstrNames : Win32cr::Foundation::BSTR*, cMaxNames : UInt32, pcNames : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names.call(this, memid, rgBstrNames, cMaxNames, pcNames)
    end
    def get_ref_type_of_impl_type(this : ITypeInfo2*, index : UInt32, pRefType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ref_type_of_impl_type.call(this, index, pRefType)
    end
    def get_impl_type_flags(this : ITypeInfo2*, index : UInt32, pImplTypeFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_impl_type_flags.call(this, index, pImplTypeFlags)
    end
    def get_i_ds_of_names(this : ITypeInfo2*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, pMemId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, rgszNames, cNames, pMemId)
    end
    def invoke(this : ITypeInfo2*, pvInstance : Void*, memid : Int32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, pvInstance, memid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_documentation(this : ITypeInfo2*, memid : Int32, pBstrName : Win32cr::Foundation::BSTR*, pBstrDocString : Win32cr::Foundation::BSTR*, pdwHelpContext : UInt32*, pBstrHelpFile : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_documentation.call(this, memid, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile)
    end
    def get_dll_entry(this : ITypeInfo2*, memid : Int32, invKind : Win32cr::System::Com::INVOKEKIND, pBstrDllName : Win32cr::Foundation::BSTR*, pBstrName : Win32cr::Foundation::BSTR*, pwOrdinal : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dll_entry.call(this, memid, invKind, pBstrDllName, pBstrName, pwOrdinal)
    end
    def get_ref_type_info(this : ITypeInfo2*, hRefType : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ref_type_info.call(this, hRefType, ppTInfo)
    end
    def address_of_member(this : ITypeInfo2*, memid : Int32, invKind : Win32cr::System::Com::INVOKEKIND, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.address_of_member.call(this, memid, invKind, ppv)
    end
    def create_instance(this : ITypeInfo2*, pUnkOuter : Void*, riid : LibC::GUID*, ppvObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pUnkOuter, riid, ppvObj)
    end
    def get_mops(this : ITypeInfo2*, memid : Int32, pBstrMops : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mops.call(this, memid, pBstrMops)
    end
    def get_containing_type_lib(this : ITypeInfo2*, ppTLib : Void**, pIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_containing_type_lib.call(this, ppTLib, pIndex)
    end
    def release_type_attr(this : ITypeInfo2*, pTypeAttr : Win32cr::System::Com::TYPEATTR*) : Void
      @lpVtbl.try &.value.release_type_attr.call(this, pTypeAttr)
    end
    def release_func_desc(this : ITypeInfo2*, pFuncDesc : Win32cr::System::Com::FUNCDESC*) : Void
      @lpVtbl.try &.value.release_func_desc.call(this, pFuncDesc)
    end
    def release_var_desc(this : ITypeInfo2*, pVarDesc : Win32cr::System::Com::VARDESC*) : Void
      @lpVtbl.try &.value.release_var_desc.call(this, pVarDesc)
    end
    def get_type_kind(this : ITypeInfo2*, pTypeKind : Win32cr::System::Com::TYPEKIND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_kind.call(this, pTypeKind)
    end
    def get_type_flags(this : ITypeInfo2*, pTypeFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_flags.call(this, pTypeFlags)
    end
    def get_func_index_of_mem_id(this : ITypeInfo2*, memid : Int32, invKind : Win32cr::System::Com::INVOKEKIND, pFuncIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_func_index_of_mem_id.call(this, memid, invKind, pFuncIndex)
    end
    def get_var_index_of_mem_id(this : ITypeInfo2*, memid : Int32, pVarIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_var_index_of_mem_id.call(this, memid, pVarIndex)
    end
    def get_cust_data(this : ITypeInfo2*, guid : LibC::GUID*, pVarVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cust_data.call(this, guid, pVarVal)
    end
    def get_func_cust_data(this : ITypeInfo2*, index : UInt32, guid : LibC::GUID*, pVarVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_func_cust_data.call(this, index, guid, pVarVal)
    end
    def get_param_cust_data(this : ITypeInfo2*, indexFunc : UInt32, indexParam : UInt32, guid : LibC::GUID*, pVarVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_param_cust_data.call(this, indexFunc, indexParam, guid, pVarVal)
    end
    def get_var_cust_data(this : ITypeInfo2*, index : UInt32, guid : LibC::GUID*, pVarVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_var_cust_data.call(this, index, guid, pVarVal)
    end
    def get_impl_type_cust_data(this : ITypeInfo2*, index : UInt32, guid : LibC::GUID*, pVarVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_impl_type_cust_data.call(this, index, guid, pVarVal)
    end
    def get_documentation2(this : ITypeInfo2*, memid : Int32, lcid : UInt32, pbstrHelpString : Win32cr::Foundation::BSTR*, pdwHelpStringContext : UInt32*, pbstrHelpStringDll : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_documentation2.call(this, memid, lcid, pbstrHelpString, pdwHelpStringContext, pbstrHelpStringDll)
    end
    def get_all_cust_data(this : ITypeInfo2*, pCustData : Win32cr::System::Com::CUSTDATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_cust_data.call(this, pCustData)
    end
    def get_all_func_cust_data(this : ITypeInfo2*, index : UInt32, pCustData : Win32cr::System::Com::CUSTDATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_func_cust_data.call(this, index, pCustData)
    end
    def get_all_param_cust_data(this : ITypeInfo2*, indexFunc : UInt32, indexParam : UInt32, pCustData : Win32cr::System::Com::CUSTDATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_param_cust_data.call(this, indexFunc, indexParam, pCustData)
    end
    def get_all_var_cust_data(this : ITypeInfo2*, index : UInt32, pCustData : Win32cr::System::Com::CUSTDATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_var_cust_data.call(this, index, pCustData)
    end
    def get_all_impl_type_cust_data(this : ITypeInfo2*, index : UInt32, pCustData : Win32cr::System::Com::CUSTDATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_impl_type_cust_data.call(this, index, pCustData)
    end

  end

  @[Extern]
  record ITypeLibVtbl,
    query_interface : Proc(ITypeLib*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeLib*, UInt32),
    release : Proc(ITypeLib*, UInt32),
    get_type_info_count : Proc(ITypeLib*, UInt32),
    get_type_info : Proc(ITypeLib*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_type_info_type : Proc(ITypeLib*, UInt32, Win32cr::System::Com::TYPEKIND*, Win32cr::Foundation::HRESULT),
    get_type_info_of_guid : Proc(ITypeLib*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_lib_attr : Proc(ITypeLib*, Win32cr::System::Com::TLIBATTR**, Win32cr::Foundation::HRESULT),
    get_type_comp : Proc(ITypeLib*, Void**, Win32cr::Foundation::HRESULT),
    get_documentation : Proc(ITypeLib*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    is_name : Proc(ITypeLib*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    find_name : Proc(ITypeLib*, Win32cr::Foundation::PWSTR, UInt32, Void**, Int32*, UInt16*, Win32cr::Foundation::HRESULT),
    release_t_lib_attr : Proc(ITypeLib*, Win32cr::System::Com::TLIBATTR*, Void)


  @[Extern]
  #@[Com("00020402-0000-0000-c000-000000000046")]
  record ITypeLib, lpVtbl : ITypeLibVtbl* do
    GUID = LibC::GUID.new(0x20402_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ITypeLib*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeLib*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeLib*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITypeLib*) : UInt32
      @lpVtbl.try &.value.get_type_info_count.call(this)
    end
    def get_type_info(this : ITypeLib*, index : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, index, ppTInfo)
    end
    def get_type_info_type(this : ITypeLib*, index : UInt32, pTKind : Win32cr::System::Com::TYPEKIND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_type.call(this, index, pTKind)
    end
    def get_type_info_of_guid(this : ITypeLib*, guid : LibC::GUID*, ppTinfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_of_guid.call(this, guid, ppTinfo)
    end
    def get_lib_attr(this : ITypeLib*, ppTLibAttr : Win32cr::System::Com::TLIBATTR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lib_attr.call(this, ppTLibAttr)
    end
    def get_type_comp(this : ITypeLib*, ppTComp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_comp.call(this, ppTComp)
    end
    def get_documentation(this : ITypeLib*, index : Int32, pBstrName : Win32cr::Foundation::BSTR*, pBstrDocString : Win32cr::Foundation::BSTR*, pdwHelpContext : UInt32*, pBstrHelpFile : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_documentation.call(this, index, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile)
    end
    def is_name(this : ITypeLib*, szNameBuf : Win32cr::Foundation::PWSTR, lHashVal : UInt32, pfName : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_name.call(this, szNameBuf, lHashVal, pfName)
    end
    def find_name(this : ITypeLib*, szNameBuf : Win32cr::Foundation::PWSTR, lHashVal : UInt32, ppTInfo : Void**, rgMemId : Int32*, pcFound : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_name.call(this, szNameBuf, lHashVal, ppTInfo, rgMemId, pcFound)
    end
    def release_t_lib_attr(this : ITypeLib*, pTLibAttr : Win32cr::System::Com::TLIBATTR*) : Void
      @lpVtbl.try &.value.release_t_lib_attr.call(this, pTLibAttr)
    end

  end

  @[Extern]
  record ITypeLib2Vtbl,
    query_interface : Proc(ITypeLib2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeLib2*, UInt32),
    release : Proc(ITypeLib2*, UInt32),
    get_type_info_count : Proc(ITypeLib2*, UInt32),
    get_type_info : Proc(ITypeLib2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_type_info_type : Proc(ITypeLib2*, UInt32, Win32cr::System::Com::TYPEKIND*, Win32cr::Foundation::HRESULT),
    get_type_info_of_guid : Proc(ITypeLib2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_lib_attr : Proc(ITypeLib2*, Win32cr::System::Com::TLIBATTR**, Win32cr::Foundation::HRESULT),
    get_type_comp : Proc(ITypeLib2*, Void**, Win32cr::Foundation::HRESULT),
    get_documentation : Proc(ITypeLib2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    is_name : Proc(ITypeLib2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    find_name : Proc(ITypeLib2*, Win32cr::Foundation::PWSTR, UInt32, Void**, Int32*, UInt16*, Win32cr::Foundation::HRESULT),
    release_t_lib_attr : Proc(ITypeLib2*, Win32cr::System::Com::TLIBATTR*, Void),
    get_cust_data : Proc(ITypeLib2*, LibC::GUID*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_lib_statistics : Proc(ITypeLib2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_documentation2 : Proc(ITypeLib2*, Int32, UInt32, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_all_cust_data : Proc(ITypeLib2*, Win32cr::System::Com::CUSTDATA*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00020411-0000-0000-c000-000000000046")]
  record ITypeLib2, lpVtbl : ITypeLib2Vtbl* do
    GUID = LibC::GUID.new(0x20411_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ITypeLib2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeLib2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeLib2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITypeLib2*) : UInt32
      @lpVtbl.try &.value.get_type_info_count.call(this)
    end
    def get_type_info(this : ITypeLib2*, index : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, index, ppTInfo)
    end
    def get_type_info_type(this : ITypeLib2*, index : UInt32, pTKind : Win32cr::System::Com::TYPEKIND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_type.call(this, index, pTKind)
    end
    def get_type_info_of_guid(this : ITypeLib2*, guid : LibC::GUID*, ppTinfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_of_guid.call(this, guid, ppTinfo)
    end
    def get_lib_attr(this : ITypeLib2*, ppTLibAttr : Win32cr::System::Com::TLIBATTR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lib_attr.call(this, ppTLibAttr)
    end
    def get_type_comp(this : ITypeLib2*, ppTComp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_comp.call(this, ppTComp)
    end
    def get_documentation(this : ITypeLib2*, index : Int32, pBstrName : Win32cr::Foundation::BSTR*, pBstrDocString : Win32cr::Foundation::BSTR*, pdwHelpContext : UInt32*, pBstrHelpFile : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_documentation.call(this, index, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile)
    end
    def is_name(this : ITypeLib2*, szNameBuf : Win32cr::Foundation::PWSTR, lHashVal : UInt32, pfName : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_name.call(this, szNameBuf, lHashVal, pfName)
    end
    def find_name(this : ITypeLib2*, szNameBuf : Win32cr::Foundation::PWSTR, lHashVal : UInt32, ppTInfo : Void**, rgMemId : Int32*, pcFound : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_name.call(this, szNameBuf, lHashVal, ppTInfo, rgMemId, pcFound)
    end
    def release_t_lib_attr(this : ITypeLib2*, pTLibAttr : Win32cr::System::Com::TLIBATTR*) : Void
      @lpVtbl.try &.value.release_t_lib_attr.call(this, pTLibAttr)
    end
    def get_cust_data(this : ITypeLib2*, guid : LibC::GUID*, pVarVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cust_data.call(this, guid, pVarVal)
    end
    def get_lib_statistics(this : ITypeLib2*, pcUniqueNames : UInt32*, pcchUniqueNames : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lib_statistics.call(this, pcUniqueNames, pcchUniqueNames)
    end
    def get_documentation2(this : ITypeLib2*, index : Int32, lcid : UInt32, pbstrHelpString : Win32cr::Foundation::BSTR*, pdwHelpStringContext : UInt32*, pbstrHelpStringDll : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_documentation2.call(this, index, lcid, pbstrHelpString, pdwHelpStringContext, pbstrHelpStringDll)
    end
    def get_all_cust_data(this : ITypeLib2*, pCustData : Win32cr::System::Com::CUSTDATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_cust_data.call(this, pCustData)
    end

  end

  @[Extern]
  record IErrorInfoVtbl,
    query_interface : Proc(IErrorInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IErrorInfo*, UInt32),
    release : Proc(IErrorInfo*, UInt32),
    get_guid : Proc(IErrorInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_source : Proc(IErrorInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_description : Proc(IErrorInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_help_file : Proc(IErrorInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_help_context : Proc(IErrorInfo*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1cf2b120-547d-101b-8e65-08002b2bd119")]
  record IErrorInfo, lpVtbl : IErrorInfoVtbl* do
    GUID = LibC::GUID.new(0x1cf2b120_u32, 0x547d_u16, 0x101b_u16, StaticArray[0x8e_u8, 0x65_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2b_u8, 0xd1_u8, 0x19_u8])
    def query_interface(this : IErrorInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IErrorInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IErrorInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_guid(this : IErrorInfo*, pGUID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, pGUID)
    end
    def get_source(this : IErrorInfo*, pBstrSource : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source.call(this, pBstrSource)
    end
    def get_description(this : IErrorInfo*, pBstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pBstrDescription)
    end
    def get_help_file(this : IErrorInfo*, pBstrHelpFile : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_help_file.call(this, pBstrHelpFile)
    end
    def get_help_context(this : IErrorInfo*, pdwHelpContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_help_context.call(this, pdwHelpContext)
    end

  end

  @[Extern]
  record ISupportErrorInfoVtbl,
    query_interface : Proc(ISupportErrorInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISupportErrorInfo*, UInt32),
    release : Proc(ISupportErrorInfo*, UInt32),
    interface_supports_error_info : Proc(ISupportErrorInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("df0b3d60-548f-101b-8e65-08002b2bd119")]
  record ISupportErrorInfo, lpVtbl : ISupportErrorInfoVtbl* do
    GUID = LibC::GUID.new(0xdf0b3d60_u32, 0x548f_u16, 0x101b_u16, StaticArray[0x8e_u8, 0x65_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2b_u8, 0xd1_u8, 0x19_u8])
    def query_interface(this : ISupportErrorInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISupportErrorInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISupportErrorInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def interface_supports_error_info(this : ISupportErrorInfo*, riid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.interface_supports_error_info.call(this, riid)
    end

  end

  @[Extern]
  record IErrorLogVtbl,
    query_interface : Proc(IErrorLog*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IErrorLog*, UInt32),
    release : Proc(IErrorLog*, UInt32),
    add_error : Proc(IErrorLog*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3127ca40-446e-11ce-8135-00aa004bb851")]
  record IErrorLog, lpVtbl : IErrorLogVtbl* do
    GUID = LibC::GUID.new(0x3127ca40_u32, 0x446e_u16, 0x11ce_u16, StaticArray[0x81_u8, 0x35_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xb8_u8, 0x51_u8])
    def query_interface(this : IErrorLog*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IErrorLog*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IErrorLog*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_error(this : IErrorLog*, pszPropName : Win32cr::Foundation::PWSTR, pExcepInfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_error.call(this, pszPropName, pExcepInfo)
    end

  end

  @[Extern]
  record ITypeLibRegistrationReaderVtbl,
    query_interface : Proc(ITypeLibRegistrationReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeLibRegistrationReader*, UInt32),
    release : Proc(ITypeLibRegistrationReader*, UInt32),
    enum_type_lib_registrations : Proc(ITypeLibRegistrationReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ed6a8a2a-b160-4e77-8f73-aa7435cd5c27")]
  record ITypeLibRegistrationReader, lpVtbl : ITypeLibRegistrationReaderVtbl* do
    GUID = LibC::GUID.new(0xed6a8a2a_u32, 0xb160_u16, 0x4e77_u16, StaticArray[0x8f_u8, 0x73_u8, 0xaa_u8, 0x74_u8, 0x35_u8, 0xcd_u8, 0x5c_u8, 0x27_u8])
    def query_interface(this : ITypeLibRegistrationReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeLibRegistrationReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeLibRegistrationReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_type_lib_registrations(this : ITypeLibRegistrationReader*, ppEnumUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_type_lib_registrations.call(this, ppEnumUnknown)
    end

  end

  @[Extern]
  record ITypeLibRegistrationVtbl,
    query_interface : Proc(ITypeLibRegistration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeLibRegistration*, UInt32),
    release : Proc(ITypeLibRegistration*, UInt32),
    get_guid : Proc(ITypeLibRegistration*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(ITypeLibRegistration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_lcid : Proc(ITypeLibRegistration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_win32_path : Proc(ITypeLibRegistration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_win64_path : Proc(ITypeLibRegistration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(ITypeLibRegistration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_flags : Proc(ITypeLibRegistration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_help_dir : Proc(ITypeLibRegistration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("76a3e735-02df-4a12-98eb-043ad3600af3")]
  record ITypeLibRegistration, lpVtbl : ITypeLibRegistrationVtbl* do
    GUID = LibC::GUID.new(0x76a3e735_u32, 0x2df_u16, 0x4a12_u16, StaticArray[0x98_u8, 0xeb_u8, 0x4_u8, 0x3a_u8, 0xd3_u8, 0x60_u8, 0xa_u8, 0xf3_u8])
    def query_interface(this : ITypeLibRegistration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeLibRegistration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeLibRegistration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_guid(this : ITypeLibRegistration*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, pGuid)
    end
    def get_version(this : ITypeLibRegistration*, pVersion : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pVersion)
    end
    def get_lcid(this : ITypeLibRegistration*, pLcid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lcid.call(this, pLcid)
    end
    def get_win32_path(this : ITypeLibRegistration*, pWin32Path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_win32_path.call(this, pWin32Path)
    end
    def get_win64_path(this : ITypeLibRegistration*, pWin64Path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_win64_path.call(this, pWin64Path)
    end
    def get_display_name(this : ITypeLibRegistration*, pDisplayName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pDisplayName)
    end
    def get_flags(this : ITypeLibRegistration*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pFlags)
    end
    def get_help_dir(this : ITypeLibRegistration*, pHelpDir : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_help_dir.call(this, pHelpDir)
    end

  end

  @[Extern]
  record IEnumConnectionsVtbl,
    query_interface : Proc(IEnumConnections*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumConnections*, UInt32),
    release : Proc(IEnumConnections*, UInt32),
    next__ : Proc(IEnumConnections*, UInt32, Win32cr::System::Com::CONNECTDATA*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumConnections*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumConnections*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumConnections*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b196b287-bab4-101a-b69c-00aa00341d07")]
  record IEnumConnections, lpVtbl : IEnumConnectionsVtbl* do
    GUID = LibC::GUID.new(0xb196b287_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
    def query_interface(this : IEnumConnections*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumConnections*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumConnections*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumConnections*, cConnections : UInt32, rgcd : Win32cr::System::Com::CONNECTDATA*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cConnections, rgcd, pcFetched)
    end
    def skip(this : IEnumConnections*, cConnections : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cConnections)
    end
    def reset(this : IEnumConnections*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumConnections*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IConnectionPointVtbl,
    query_interface : Proc(IConnectionPoint*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConnectionPoint*, UInt32),
    release : Proc(IConnectionPoint*, UInt32),
    get_connection_interface : Proc(IConnectionPoint*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_connection_point_container : Proc(IConnectionPoint*, Void**, Win32cr::Foundation::HRESULT),
    advise : Proc(IConnectionPoint*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IConnectionPoint*, UInt32, Win32cr::Foundation::HRESULT),
    enum_connections : Proc(IConnectionPoint*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b196b286-bab4-101a-b69c-00aa00341d07")]
  record IConnectionPoint, lpVtbl : IConnectionPointVtbl* do
    GUID = LibC::GUID.new(0xb196b286_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
    def query_interface(this : IConnectionPoint*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConnectionPoint*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConnectionPoint*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_connection_interface(this : IConnectionPoint*, pIID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_interface.call(this, pIID)
    end
    def get_connection_point_container(this : IConnectionPoint*, ppCPC : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_point_container.call(this, ppCPC)
    end
    def advise(this : IConnectionPoint*, pUnkSink : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, pUnkSink, pdwCookie)
    end
    def unadvise(this : IConnectionPoint*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, dwCookie)
    end
    def enum_connections(this : IConnectionPoint*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_connections.call(this, ppEnum)
    end

  end

  @[Extern]
  record IEnumConnectionPointsVtbl,
    query_interface : Proc(IEnumConnectionPoints*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumConnectionPoints*, UInt32),
    release : Proc(IEnumConnectionPoints*, UInt32),
    next__ : Proc(IEnumConnectionPoints*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumConnectionPoints*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumConnectionPoints*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumConnectionPoints*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b196b285-bab4-101a-b69c-00aa00341d07")]
  record IEnumConnectionPoints, lpVtbl : IEnumConnectionPointsVtbl* do
    GUID = LibC::GUID.new(0xb196b285_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
    def query_interface(this : IEnumConnectionPoints*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumConnectionPoints*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumConnectionPoints*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumConnectionPoints*, cConnections : UInt32, ppCP : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cConnections, ppCP, pcFetched)
    end
    def skip(this : IEnumConnectionPoints*, cConnections : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cConnections)
    end
    def reset(this : IEnumConnectionPoints*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumConnectionPoints*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IConnectionPointContainerVtbl,
    query_interface : Proc(IConnectionPointContainer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConnectionPointContainer*, UInt32),
    release : Proc(IConnectionPointContainer*, UInt32),
    enum_connection_points : Proc(IConnectionPointContainer*, Void**, Win32cr::Foundation::HRESULT),
    find_connection_point : Proc(IConnectionPointContainer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b196b284-bab4-101a-b69c-00aa00341d07")]
  record IConnectionPointContainer, lpVtbl : IConnectionPointContainerVtbl* do
    GUID = LibC::GUID.new(0xb196b284_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
    def query_interface(this : IConnectionPointContainer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConnectionPointContainer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConnectionPointContainer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_connection_points(this : IConnectionPointContainer*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_connection_points.call(this, ppEnum)
    end
    def find_connection_point(this : IConnectionPointContainer*, riid : LibC::GUID*, ppCP : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_connection_point.call(this, riid, ppCP)
    end

  end

  @[Extern]
  record IPersistMemoryVtbl,
    query_interface : Proc(IPersistMemory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPersistMemory*, UInt32),
    release : Proc(IPersistMemory*, UInt32),
    get_class_id : Proc(IPersistMemory*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(IPersistMemory*, Win32cr::Foundation::HRESULT),
    load : Proc(IPersistMemory*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    save : Proc(IPersistMemory*, Void*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::HRESULT),
    get_size_max : Proc(IPersistMemory*, UInt32*, Win32cr::Foundation::HRESULT),
    init_new : Proc(IPersistMemory*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bd1ae5e0-a6ae-11ce-bd37-504200c10000")]
  record IPersistMemory, lpVtbl : IPersistMemoryVtbl* do
    GUID = LibC::GUID.new(0xbd1ae5e0_u32, 0xa6ae_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x37_u8, 0x50_u8, 0x42_u8, 0x0_u8, 0xc1_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IPersistMemory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPersistMemory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPersistMemory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IPersistMemory*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end
    def is_dirty(this : IPersistMemory*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this)
    end
    def load(this : IPersistMemory*, pMem : Void*, cbSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pMem, cbSize)
    end
    def save(this : IPersistMemory*, pMem : Void*, fClearDirty : Win32cr::Foundation::BOOL, cbSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pMem, fClearDirty, cbSize)
    end
    def get_size_max(this : IPersistMemory*, pCbSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size_max.call(this, pCbSize)
    end
    def init_new(this : IPersistMemory*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_new.call(this)
    end

  end

  @[Extern]
  record IPersistStreamInitVtbl,
    query_interface : Proc(IPersistStreamInit*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPersistStreamInit*, UInt32),
    release : Proc(IPersistStreamInit*, UInt32),
    get_class_id : Proc(IPersistStreamInit*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(IPersistStreamInit*, Win32cr::Foundation::HRESULT),
    load : Proc(IPersistStreamInit*, Void*, Win32cr::Foundation::HRESULT),
    save : Proc(IPersistStreamInit*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_size_max : Proc(IPersistStreamInit*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    init_new : Proc(IPersistStreamInit*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7fd52380-4e07-101b-ae2d-08002b2ec713")]
  record IPersistStreamInit, lpVtbl : IPersistStreamInitVtbl* do
    GUID = LibC::GUID.new(0x7fd52380_u32, 0x4e07_u16, 0x101b_u16, StaticArray[0xae_u8, 0x2d_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xc7_u8, 0x13_u8])
    def query_interface(this : IPersistStreamInit*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPersistStreamInit*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPersistStreamInit*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IPersistStreamInit*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end
    def is_dirty(this : IPersistStreamInit*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this)
    end
    def load(this : IPersistStreamInit*, pStm : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pStm)
    end
    def save(this : IPersistStreamInit*, pStm : Void*, fClearDirty : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pStm, fClearDirty)
    end
    def get_size_max(this : IPersistStreamInit*, pCbSize : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size_max.call(this, pCbSize)
    end
    def init_new(this : IPersistStreamInit*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_new.call(this)
    end

  end

  @[Link("ole32")]
  @[Link("urlmon")]
  @[Link("oleaut32")]
  lib C
    fun CoBuildVersion : UInt32

    fun CoInitialize(pvReserved : Void*) : Win32cr::Foundation::HRESULT

    fun CoRegisterMallocSpy(pMallocSpy : Void*) : Win32cr::Foundation::HRESULT

    fun CoRevokeMallocSpy : Win32cr::Foundation::HRESULT

    fun CoRegisterInitializeSpy(pSpy : Void*, puliCookie : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun CoRevokeInitializeSpy(uliCookie : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT

    fun CoGetSystemSecurityPermissions(comSDType : Win32cr::System::Com::COMSD, ppSD : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::HRESULT

    fun CoLoadLibrary(lpszLibName : Win32cr::Foundation::PWSTR, bAutoFree : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HINSTANCE

    fun CoFreeLibrary(hInst : Win32cr::Foundation::HINSTANCE) : Void

    fun CoFreeAllLibraries : Void

    fun CoAllowSetForegroundWindow(pUnk : Void*, lpvReserved : Void*) : Win32cr::Foundation::HRESULT

    fun DcomChannelSetHResult(pvReserved : Void*, pulReserved : UInt32*, appsHR : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT

    fun CoIsOle1Class(rclsid : LibC::GUID*) : Win32cr::Foundation::BOOL

    fun CLSIDFromProgIDEx(lpszProgID : Win32cr::Foundation::PWSTR, lpclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun CoFileTimeToDosDateTime(lpFileTime : Win32cr::Foundation::FILETIME*, lpDosDate : UInt16*, lpDosTime : UInt16*) : Win32cr::Foundation::BOOL

    fun CoDosDateTimeToFileTime(nDosDate : UInt16, nDosTime : UInt16, lpFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    fun CoFileTimeNow(lpFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun CoRegisterChannelHook(extension_uuid : LibC::GUID*, pChannelHook : Void*) : Win32cr::Foundation::HRESULT

    fun CoTreatAsClass(clsidOld : LibC::GUID*, clsidNew : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun CreateDataAdviseHolder(ppDAHolder : Void**) : Win32cr::Foundation::HRESULT

    fun CreateDataCache(pUnkOuter : Void*, rclsid : LibC::GUID*, iid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CoInstall(pbc : Void*, dwFlags : UInt32, pClassSpec : Win32cr::System::Com::Uclsspec*, pQuery : Win32cr::System::Com::QUERYCONTEXT*, pszCodeBase : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun BindMoniker(pmk : Void*, grfOpt : UInt32, iidResult : LibC::GUID*, ppvResult : Void**) : Win32cr::Foundation::HRESULT

    fun CoGetObject(pszName : Win32cr::Foundation::PWSTR, pBindOptions : Win32cr::System::Com::BIND_OPTS*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun MkParseDisplayName(pbc : Void*, szUserName : Win32cr::Foundation::PWSTR, pchEaten : UInt32*, ppmk : Void**) : Win32cr::Foundation::HRESULT

    fun MonikerRelativePathTo(pmkSrc : Void*, pmkDest : Void*, ppmkRelPath : Void**, dwReserved : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun MonikerCommonPrefixWith(pmkThis : Void*, pmkOther : Void*, ppmkCommon : Void**) : Win32cr::Foundation::HRESULT

    fun CreateBindCtx(reserved : UInt32, ppbc : Void**) : Win32cr::Foundation::HRESULT

    fun CreateGenericComposite(pmkFirst : Void*, pmkRest : Void*, ppmkComposite : Void**) : Win32cr::Foundation::HRESULT

    fun GetClassFile(szFilename : Win32cr::Foundation::PWSTR, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun CreateClassMoniker(rclsid : LibC::GUID*, ppmk : Void**) : Win32cr::Foundation::HRESULT

    fun CreateFileMoniker(lpszPathName : Win32cr::Foundation::PWSTR, ppmk : Void**) : Win32cr::Foundation::HRESULT

    fun CreateItemMoniker(lpszDelim : Win32cr::Foundation::PWSTR, lpszItem : Win32cr::Foundation::PWSTR, ppmk : Void**) : Win32cr::Foundation::HRESULT

    fun CreateAntiMoniker(ppmk : Void**) : Win32cr::Foundation::HRESULT

    fun CreatePointerMoniker(punk : Void*, ppmk : Void**) : Win32cr::Foundation::HRESULT

    fun CreateObjrefMoniker(punk : Void*, ppmk : Void**) : Win32cr::Foundation::HRESULT

    fun GetRunningObjectTable(reserved : UInt32, pprot : Void**) : Win32cr::Foundation::HRESULT

    fun CreateStdProgressIndicator(hwndParent : Win32cr::Foundation::HWND, pszTitle : Win32cr::Foundation::PWSTR, pIbscCaller : Void*, ppIbsc : Void**) : Win32cr::Foundation::HRESULT

    fun CoGetMalloc(dwMemContext : UInt32, ppMalloc : Void**) : Win32cr::Foundation::HRESULT

    fun CoUninitialize : Void

    fun CoGetCurrentProcess : UInt32

    fun CoInitializeEx(pvReserved : Void*, dwCoInit : Win32cr::System::Com::COINIT) : Win32cr::Foundation::HRESULT

    fun CoGetCallerTID(lpdwTID : UInt32*) : Win32cr::Foundation::HRESULT

    fun CoGetCurrentLogicalThreadId(pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun CoGetContextToken(pToken : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun CoGetApartmentType(pAptType : Win32cr::System::Com::APTTYPE*, pAptQualifier : Win32cr::System::Com::APTTYPEQUALIFIER*) : Win32cr::Foundation::HRESULT

    fun CoIncrementMTAUsage(pCookie : Win32cr::System::Com::CO_MTA_USAGE_COOKIE*) : Win32cr::Foundation::HRESULT

    fun CoDecrementMTAUsage(cookie : Win32cr::System::Com::CO_MTA_USAGE_COOKIE) : Win32cr::Foundation::HRESULT

    fun CoAllowUnmarshalerCLSID(clsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun CoGetObjectContext(riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CoGetClassObject(rclsid : LibC::GUID*, dwClsContext : Win32cr::System::Com::CLSCTX, pvReserved : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CoRegisterClassObject(rclsid : LibC::GUID*, pUnk : Void*, dwClsContext : Win32cr::System::Com::CLSCTX, flags : Win32cr::System::Com::REGCLS, lpdwRegister : UInt32*) : Win32cr::Foundation::HRESULT

    fun CoRevokeClassObject(dwRegister : UInt32) : Win32cr::Foundation::HRESULT

    fun CoResumeClassObjects : Win32cr::Foundation::HRESULT

    fun CoSuspendClassObjects : Win32cr::Foundation::HRESULT

    fun CoAddRefServerProcess : UInt32

    fun CoReleaseServerProcess : UInt32

    fun CoGetPSClsid(riid : LibC::GUID*, pClsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun CoRegisterPSClsid(riid : LibC::GUID*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun CoRegisterSurrogate(pSurrogate : Void*) : Win32cr::Foundation::HRESULT

    fun CoDisconnectObject(pUnk : Void*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT

    fun CoLockObjectExternal(pUnk : Void*, fLock : Win32cr::Foundation::BOOL, fLastUnlockReleases : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun CoIsHandlerConnected(pUnk : Void*) : Win32cr::Foundation::BOOL

    fun CoCreateFreeThreadedMarshaler(punkOuter : Void*, ppunkMarshal : Void**) : Win32cr::Foundation::HRESULT

    fun CoFreeUnusedLibraries : Void

    fun CoFreeUnusedLibrariesEx(dwUnloadDelay : UInt32, dwReserved : UInt32) : Void

    fun CoDisconnectContext(dwTimeout : UInt32) : Win32cr::Foundation::HRESULT

    fun CoInitializeSecurity(pSecDesc : Win32cr::Security::PSECURITY_DESCRIPTOR, cAuthSvc : Int32, asAuthSvc : Win32cr::System::Com::SOLE_AUTHENTICATION_SERVICE*, pReserved1 : Void*, dwAuthnLevel : Win32cr::System::Com::RPC_C_AUTHN_LEVEL, dwImpLevel : Win32cr::System::Com::RPC_C_IMP_LEVEL, pAuthList : Void*, dwCapabilities : Win32cr::System::Com::EOLE_AUTHENTICATION_CAPABILITIES, pReserved3 : Void*) : Win32cr::Foundation::HRESULT

    fun CoGetCallContext(riid : LibC::GUID*, ppInterface : Void**) : Win32cr::Foundation::HRESULT

    fun CoQueryProxyBlanket(pProxy : Void*, pwAuthnSvc : UInt32*, pAuthzSvc : UInt32*, pServerPrincName : Win32cr::Foundation::PWSTR*, pAuthnLevel : UInt32*, pImpLevel : UInt32*, pAuthInfo : Void**, pCapabilites : UInt32*) : Win32cr::Foundation::HRESULT

    fun CoSetProxyBlanket(pProxy : Void*, dwAuthnSvc : UInt32, dwAuthzSvc : UInt32, pServerPrincName : Win32cr::Foundation::PWSTR, dwAuthnLevel : Win32cr::System::Com::RPC_C_AUTHN_LEVEL, dwImpLevel : Win32cr::System::Com::RPC_C_IMP_LEVEL, pAuthInfo : Void*, dwCapabilities : Win32cr::System::Com::EOLE_AUTHENTICATION_CAPABILITIES) : Win32cr::Foundation::HRESULT

    fun CoCopyProxy(pProxy : Void*, ppCopy : Void**) : Win32cr::Foundation::HRESULT

    fun CoQueryClientBlanket(pAuthnSvc : UInt32*, pAuthzSvc : UInt32*, pServerPrincName : Win32cr::Foundation::PWSTR*, pAuthnLevel : UInt32*, pImpLevel : UInt32*, pPrivs : Void**, pCapabilities : UInt32*) : Win32cr::Foundation::HRESULT

    fun CoImpersonateClient : Win32cr::Foundation::HRESULT

    fun CoRevertToSelf : Win32cr::Foundation::HRESULT

    fun CoQueryAuthenticationServices(pcAuthSvc : UInt32*, asAuthSvc : Win32cr::System::Com::SOLE_AUTHENTICATION_SERVICE**) : Win32cr::Foundation::HRESULT

    fun CoSwitchCallContext(pNewObject : Void*, ppOldObject : Void**) : Win32cr::Foundation::HRESULT

    fun CoCreateInstance(rclsid : LibC::GUID*, pUnkOuter : Void*, dwClsContext : Win32cr::System::Com::CLSCTX, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CoCreateInstanceEx(clsid : LibC::GUID*, punkOuter : Void*, dwClsCtx : Win32cr::System::Com::CLSCTX, pServerInfo : Win32cr::System::Com::COSERVERINFO*, dwCount : UInt32, pResults : Win32cr::System::Com::MULTI_QI*) : Win32cr::Foundation::HRESULT

    fun CoCreateInstanceFromApp(clsid : LibC::GUID*, punkOuter : Void*, dwClsCtx : Win32cr::System::Com::CLSCTX, reserved : Void*, dwCount : UInt32, pResults : Win32cr::System::Com::MULTI_QI*) : Win32cr::Foundation::HRESULT

    fun CoRegisterActivationFilter(pActivationFilter : Void*) : Win32cr::Foundation::HRESULT

    fun CoGetCancelObject(dwThreadId : UInt32, iid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT

    fun CoSetCancelObject(pUnk : Void*) : Win32cr::Foundation::HRESULT

    fun CoCancelCall(dwThreadId : UInt32, ulTimeout : UInt32) : Win32cr::Foundation::HRESULT

    fun CoTestCancel : Win32cr::Foundation::HRESULT

    fun CoEnableCallCancellation(pReserved : Void*) : Win32cr::Foundation::HRESULT

    fun CoDisableCallCancellation(pReserved : Void*) : Win32cr::Foundation::HRESULT

    fun StringFromCLSID(rclsid : LibC::GUID*, lplpsz : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun CLSIDFromString(lpsz : Win32cr::Foundation::PWSTR, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun StringFromIID(rclsid : LibC::GUID*, lplpsz : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun IIDFromString(lpsz : Win32cr::Foundation::PWSTR, lpiid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun ProgIDFromCLSID(clsid : LibC::GUID*, lplpszProgID : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun CLSIDFromProgID(lpszProgID : Win32cr::Foundation::PWSTR, lpclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun StringFromGUID2(rguid : LibC::GUID*, lpsz : UInt16*, cchMax : Int32) : Int32

    fun CoCreateGuid(pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun CoWaitForMultipleHandles(dwFlags : UInt32, dwTimeout : UInt32, cHandles : UInt32, pHandles : Win32cr::Foundation::HANDLE*, lpdwindex : UInt32*) : Win32cr::Foundation::HRESULT

    fun CoWaitForMultipleObjects(dwFlags : UInt32, dwTimeout : UInt32, cHandles : UInt32, pHandles : Win32cr::Foundation::HANDLE*, lpdwindex : UInt32*) : Win32cr::Foundation::HRESULT

    fun CoGetTreatAsClass(clsidOld : LibC::GUID*, pClsidNew : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun CoInvalidateRemoteMachineBindings(pszMachineName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun CoTaskMemAlloc(cb : LibC::UIntPtrT) : Void*

    fun CoTaskMemRealloc(pv : Void*, cb : LibC::UIntPtrT) : Void*

    # Commented out due to being part of LibC
    #fun CoTaskMemFree(pv : Void*) : Void

    fun CoRegisterDeviceCatalog(deviceInstanceId : Win32cr::Foundation::PWSTR, cookie : Win32cr::System::Com::CO_DEVICE_CATALOG_COOKIE*) : Win32cr::Foundation::HRESULT

    fun CoRevokeDeviceCatalog(cookie : Win32cr::System::Com::CO_DEVICE_CATALOG_COOKIE) : Win32cr::Foundation::HRESULT

    fun CreateUri(pwzURI : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::System::Com::URI_CREATE_FLAGS, dwReserved : LibC::UIntPtrT, ppURI : Void**) : Win32cr::Foundation::HRESULT

    fun CreateUriWithFragment(pwzURI : Win32cr::Foundation::PWSTR, pwzFragment : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwReserved : LibC::UIntPtrT, ppURI : Void**) : Win32cr::Foundation::HRESULT

    fun CreateUriFromMultiByteString(pszANSIInputUri : Win32cr::Foundation::PSTR, dwEncodingFlags : UInt32, dwCodePage : UInt32, dwCreateFlags : UInt32, dwReserved : LibC::UIntPtrT, ppUri : Void**) : Win32cr::Foundation::HRESULT

    fun CreateIUriBuilder(pIUri : Void*, dwFlags : UInt32, dwReserved : LibC::UIntPtrT, ppIUriBuilder : Void**) : Win32cr::Foundation::HRESULT

    fun SetErrorInfo(dwReserved : UInt32, perrinfo : Void*) : Win32cr::Foundation::HRESULT

    fun GetErrorInfo(dwReserved : UInt32, pperrinfo : Void**) : Win32cr::Foundation::HRESULT

  end
end