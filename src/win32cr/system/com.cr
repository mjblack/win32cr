require "../foundation.cr"
require "../graphics/gdi.cr"
require "../system/com/structuredstorage.cr"
require "../system/systemservices.cr"
require "../security.cr"
require "../system/ole.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:ole32.dll")]
@[Link(ldflags: "/DELAYLOAD:urlmon.dll")]
@[Link(ldflags: "/DELAYLOAD:oleaut32.dll")]
{% else %}
@[Link("ole32")]
@[Link("urlmon")]
@[Link("oleaut32")]
{% end %}
lib LibWin32
  alias CO_MTA_USAGE_COOKIE = LibC::IntPtrT
  alias CO_DEVICE_CATALOG_COOKIE = LibC::IntPtrT

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

  type IEnumContextProps = Void
  type IContext = Void

  alias LPEXCEPFINO_DEFERRED_FILLIN = Proc(EXCEPINFO*, HRESULT)
  alias LPFNGETCLASSOBJECT = Proc(Guid*, Guid*, Void**, HRESULT)
  alias LPFNCANUNLOADNOW = Proc(HRESULT)
  alias PFNCONTEXTCALL = Proc(ComCallData*, HRESULT)


  enum URI_CREATE_FLAGS : UInt32
    Uri_CREATE_ALLOW_RELATIVE = 1
    Uri_CREATE_ALLOW_IMPLICIT_WILDCARD_SCHEME = 2
    Uri_CREATE_ALLOW_IMPLICIT_FILE_SCHEME = 4
    Uri_CREATE_NOFRAG = 8
    Uri_CREATE_NO_CANONICALIZE = 16
    Uri_CREATE_CANONICALIZE = 256
    Uri_CREATE_FILE_USE_DOS_PATH = 32
    Uri_CREATE_DECODE_EXTRA_INFO = 64
    Uri_CREATE_NO_DECODE_EXTRA_INFO = 128
    Uri_CREATE_CRACK_UNKNOWN_SCHEMES = 512
    Uri_CREATE_NO_CRACK_UNKNOWN_SCHEMES = 1024
    Uri_CREATE_PRE_PROCESS_HTML_URI = 2048
    Uri_CREATE_NO_PRE_PROCESS_HTML_URI = 4096
    Uri_CREATE_IE_SETTINGS = 8192
    Uri_CREATE_NO_IE_SETTINGS = 16384
    Uri_CREATE_NO_ENCODE_FORBIDDEN_CHARACTERS = 32768
    Uri_CREATE_NORMALIZE_INTL_CHARACTERS = 65536
    Uri_CREATE_CANONICALIZE_ABSOLUTE = 131072
  end

  enum RPC_C_AUTHN_LEVEL : UInt32
    RPC_C_AUTHN_LEVEL_DEFAULT = 0
    RPC_C_AUTHN_LEVEL_NONE = 1
    RPC_C_AUTHN_LEVEL_CONNECT = 2
    RPC_C_AUTHN_LEVEL_CALL = 3
    RPC_C_AUTHN_LEVEL_PKT = 4
    RPC_C_AUTHN_LEVEL_PKT_INTEGRITY = 5
    RPC_C_AUTHN_LEVEL_PKT_PRIVACY = 6
  end

  enum RPC_C_IMP_LEVEL : UInt32
    RPC_C_IMP_LEVEL_DEFAULT = 0
    RPC_C_IMP_LEVEL_ANONYMOUS = 1
    RPC_C_IMP_LEVEL_IDENTIFY = 2
    RPC_C_IMP_LEVEL_IMPERSONATE = 3
    RPC_C_IMP_LEVEL_DELEGATE = 4
  end

  enum DVASPECT : Int32
    DVASPECT_CONTENT = 1
    DVASPECT_THUMBNAIL = 2
    DVASPECT_ICON = 4
    DVASPECT_DOCPRINT = 8
  end

  enum TYSPEC : Int32
    TYSPEC_CLSID = 0
    TYSPEC_FILEEXT = 1
    TYSPEC_MIMETYPE = 2
    TYSPEC_FILENAME = 3
    TYSPEC_PROGID = 4
    TYSPEC_PACKAGENAME = 5
    TYSPEC_OBJECTID = 6
  end

  enum REGCLS : Int32
    REGCLS_SINGLEUSE = 0
    REGCLS_MULTIPLEUSE = 1
    REGCLS_MULTI_SEPARATE = 2
    REGCLS_SUSPENDED = 4
    REGCLS_SURROGATE = 8
    REGCLS_AGILE = 16
  end

  enum COINITBASE : Int32
    COINITBASE_MULTITHREADED = 0
  end

  enum MEMCTX : Int32
    MEMCTX_TASK = 1
    MEMCTX_SHARED = 2
    MEMCTX_MACSYSTEM = 3
    MEMCTX_UNKNOWN = -1
    MEMCTX_SAME = -2
  end

  enum CLSCTX : UInt32
    CLSCTX_INPROC_SERVER = 1
    CLSCTX_INPROC_HANDLER = 2
    CLSCTX_LOCAL_SERVER = 4
    CLSCTX_INPROC_SERVER16 = 8
    CLSCTX_REMOTE_SERVER = 16
    CLSCTX_INPROC_HANDLER16 = 32
    CLSCTX_RESERVED1 = 64
    CLSCTX_RESERVED2 = 128
    CLSCTX_RESERVED3 = 256
    CLSCTX_RESERVED4 = 512
    CLSCTX_NO_CODE_DOWNLOAD = 1024
    CLSCTX_RESERVED5 = 2048
    CLSCTX_NO_CUSTOM_MARSHAL = 4096
    CLSCTX_ENABLE_CODE_DOWNLOAD = 8192
    CLSCTX_NO_FAILURE_LOG = 16384
    CLSCTX_DISABLE_AAA = 32768
    CLSCTX_ENABLE_AAA = 65536
    CLSCTX_FROM_DEFAULT_CONTEXT = 131072
    CLSCTX_ACTIVATE_X86_SERVER = 262144
    CLSCTX_ACTIVATE_32_BIT_SERVER = 262144
    CLSCTX_ACTIVATE_64_BIT_SERVER = 524288
    CLSCTX_ENABLE_CLOAKING = 1048576
    CLSCTX_APPCONTAINER = 4194304
    CLSCTX_ACTIVATE_AAA_AS_IU = 8388608
    CLSCTX_RESERVED6 = 16777216
    CLSCTX_ACTIVATE_ARM32_SERVER = 33554432
    CLSCTX_PS_DLL = 2147483648
    CLSCTX_ALL = 23
    CLSCTX_SERVER = 21
  end

  enum MSHLFLAGS : Int32
    MSHLFLAGS_NORMAL = 0
    MSHLFLAGS_TABLESTRONG = 1
    MSHLFLAGS_TABLEWEAK = 2
    MSHLFLAGS_NOPING = 4
    MSHLFLAGS_RESERVED1 = 8
    MSHLFLAGS_RESERVED2 = 16
    MSHLFLAGS_RESERVED3 = 32
    MSHLFLAGS_RESERVED4 = 64
  end

  enum MSHCTX : Int32
    MSHCTX_LOCAL = 0
    MSHCTX_NOSHAREDMEM = 1
    MSHCTX_DIFFERENTMACHINE = 2
    MSHCTX_INPROC = 3
    MSHCTX_CROSSCTX = 4
    MSHCTX_CONTAINER = 5
  end

  enum EXTCONN : Int32
    EXTCONN_STRONG = 1
    EXTCONN_WEAK = 2
    EXTCONN_CALLABLE = 4
  end

  enum STGTY : Int32
    STGTY_STORAGE = 1
    STGTY_STREAM = 2
    STGTY_LOCKBYTES = 3
    STGTY_PROPERTY = 4
  end

  enum STREAM_SEEK : UInt32
    STREAM_SEEK_SET = 0
    STREAM_SEEK_CUR = 1
    STREAM_SEEK_END = 2
  end

  enum EOLE_AUTHENTICATION_CAPABILITIES : Int32
    EOAC_NONE = 0
    EOAC_MUTUAL_AUTH = 1
    EOAC_STATIC_CLOAKING = 32
    EOAC_DYNAMIC_CLOAKING = 64
    EOAC_ANY_AUTHORITY = 128
    EOAC_MAKE_FULLSIC = 256
    EOAC_DEFAULT = 2048
    EOAC_SECURE_REFS = 2
    EOAC_ACCESS_CONTROL = 4
    EOAC_APPID = 8
    EOAC_DYNAMIC = 16
    EOAC_REQUIRE_FULLSIC = 512
    EOAC_AUTO_IMPERSONATE = 1024
    EOAC_DISABLE_AAA = 4096
    EOAC_NO_CUSTOM_MARSHAL = 8192
    EOAC_RESERVED1 = 16384
  end

  enum RPCOPT_PROPERTIES : Int32
    COMBND_RPCTIMEOUT = 1
    COMBND_SERVER_LOCALITY = 2
    COMBND_RESERVED1 = 4
    COMBND_RESERVED2 = 5
    COMBND_RESERVED3 = 8
    COMBND_RESERVED4 = 16
  end

  enum RPCOPT_SERVER_LOCALITY_VALUES : Int32
    SERVER_LOCALITY_PROCESS_LOCAL = 0
    SERVER_LOCALITY_MACHINE_LOCAL = 1
    SERVER_LOCALITY_REMOTE = 2
  end

  enum GLOBALOPT_PROPERTIES : Int32
    COMGLB_EXCEPTION_HANDLING = 1
    COMGLB_APPID = 2
    COMGLB_RPC_THREADPOOL_SETTING = 3
    COMGLB_RO_SETTINGS = 4
    COMGLB_UNMARSHALING_POLICY = 5
    COMGLB_PROPERTIES_RESERVED1 = 6
    COMGLB_PROPERTIES_RESERVED2 = 7
    COMGLB_PROPERTIES_RESERVED3 = 8
  end

  enum GLOBALOPT_EH_VALUES : Int32
    COMGLB_EXCEPTION_HANDLE = 0
    COMGLB_EXCEPTION_DONOT_HANDLE_FATAL = 1
    COMGLB_EXCEPTION_DONOT_HANDLE = 1
    COMGLB_EXCEPTION_DONOT_HANDLE_ANY = 2
  end

  enum GLOBALOPT_RPCTP_VALUES : Int32
    COMGLB_RPC_THREADPOOL_SETTING_DEFAULT_POOL = 0
    COMGLB_RPC_THREADPOOL_SETTING_PRIVATE_POOL = 1
  end

  enum GLOBALOPT_RO_FLAGS : Int32
    COMGLB_STA_MODALLOOP_REMOVE_TOUCH_MESSAGES = 1
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_REMOVE_INPUT_MESSAGES = 2
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_DONOT_REMOVE_INPUT_MESSAGES = 4
    COMGLB_FAST_RUNDOWN = 8
    COMGLB_RESERVED1 = 16
    COMGLB_RESERVED2 = 32
    COMGLB_RESERVED3 = 64
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_REORDER_POINTER_MESSAGES = 128
    COMGLB_RESERVED4 = 256
    COMGLB_RESERVED5 = 512
    COMGLB_RESERVED6 = 1024
  end

  enum GLOBALOPT_UNMARSHALING_POLICY_VALUES : Int32
    COMGLB_UNMARSHALING_POLICY_NORMAL = 0
    COMGLB_UNMARSHALING_POLICY_STRONG = 1
    COMGLB_UNMARSHALING_POLICY_HYBRID = 2
  end

  enum DCOM_CALL_STATE : Int32
    DCOM_NONE = 0
    DCOM_CALL_COMPLETE = 1
    DCOM_CALL_CANCELED = 2
  end

  enum APTTYPEQUALIFIER : Int32
    APTTYPEQUALIFIER_NONE = 0
    APTTYPEQUALIFIER_IMPLICIT_MTA = 1
    APTTYPEQUALIFIER_NA_ON_MTA = 2
    APTTYPEQUALIFIER_NA_ON_STA = 3
    APTTYPEQUALIFIER_NA_ON_IMPLICIT_MTA = 4
    APTTYPEQUALIFIER_NA_ON_MAINSTA = 5
    APTTYPEQUALIFIER_APPLICATION_STA = 6
    APTTYPEQUALIFIER_RESERVED_1 = 7
  end

  enum APTTYPE : Int32
    APTTYPE_CURRENT = -1
    APTTYPE_STA = 0
    APTTYPE_MTA = 1
    APTTYPE_NA = 2
    APTTYPE_MAINSTA = 3
  end

  enum THDTYPE : Int32
    THDTYPE_BLOCKMESSAGES = 0
    THDTYPE_PROCESSMESSAGES = 1
  end

  enum CO_MARSHALING_CONTEXT_ATTRIBUTES : Int32
    CO_MARSHALING_SOURCE_IS_APP_CONTAINER = 0
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_1 = -2147483648
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_2 = -2147483647
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_3 = -2147483646
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_4 = -2147483645
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_5 = -2147483644
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_6 = -2147483643
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_7 = -2147483642
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_8 = -2147483641
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_9 = -2147483640
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_10 = -2147483639
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_11 = -2147483638
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_12 = -2147483637
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_13 = -2147483636
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_14 = -2147483635
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_15 = -2147483634
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_16 = -2147483633
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_17 = -2147483632
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_18 = -2147483631
  end

  enum BIND_FLAGS : Int32
    BIND_MAYBOTHERUSER = 1
    BIND_JUSTTESTEXISTENCE = 2
  end

  enum MKSYS : Int32
    MKSYS_NONE = 0
    MKSYS_GENERICCOMPOSITE = 1
    MKSYS_FILEMONIKER = 2
    MKSYS_ANTIMONIKER = 3
    MKSYS_ITEMMONIKER = 4
    MKSYS_POINTERMONIKER = 5
    MKSYS_CLASSMONIKER = 7
    MKSYS_OBJREFMONIKER = 8
    MKSYS_SESSIONMONIKER = 9
    MKSYS_LUAMONIKER = 10
  end

  enum MKREDUCE : Int32
    MKRREDUCE_ONE = 196608
    MKRREDUCE_TOUSER = 131072
    MKRREDUCE_THROUGHUSER = 65536
    MKRREDUCE_ALL = 0
  end

  enum ADVF : Int32
    ADVF_NODATA = 1
    ADVF_PRIMEFIRST = 2
    ADVF_ONLYONCE = 4
    ADVF_DATAONSTOP = 64
    ADVFCACHE_NOHANDLER = 8
    ADVFCACHE_FORCEBUILTIN = 16
    ADVFCACHE_ONSAVE = 32
  end

  enum TYMED : Int32
    TYMED_HGLOBAL = 1
    TYMED_FILE = 2
    TYMED_ISTREAM = 4
    TYMED_ISTORAGE = 8
    TYMED_GDI = 16
    TYMED_MFPICT = 32
    TYMED_ENHMF = 64
    TYMED_NULL = 0
  end

  enum DATADIR : Int32
    DATADIR_GET = 1
    DATADIR_SET = 2
  end

  enum CALLTYPE : Int32
    CALLTYPE_TOPLEVEL = 1
    CALLTYPE_NESTED = 2
    CALLTYPE_ASYNC = 3
    CALLTYPE_TOPLEVEL_CALLPENDING = 4
    CALLTYPE_ASYNC_CALLPENDING = 5
  end

  enum SERVERCALL : Int32
    SERVERCALL_ISHANDLED = 0
    SERVERCALL_REJECTED = 1
    SERVERCALL_RETRYLATER = 2
  end

  enum PENDINGTYPE : Int32
    PENDINGTYPE_TOPLEVEL = 1
    PENDINGTYPE_NESTED = 2
  end

  enum PENDINGMSG : Int32
    PENDINGMSG_CANCELCALL = 0
    PENDINGMSG_WAITNOPROCESS = 1
    PENDINGMSG_WAITDEFPROCESS = 2
  end

  enum ApplicationType : Int32
    ServerApplication = 0
    LibraryApplication = 1
  end

  enum ShutdownType : Int32
    IdleShutdown = 0
    ForcedShutdown = 1
  end

  enum COINIT : UInt32
    COINIT_APARTMENTTHREADED = 2
    COINIT_MULTITHREADED = 0
    COINIT_DISABLE_OLE1DDE = 4
    COINIT_SPEED_OVER_MEMORY = 8
  end

  enum COMSD : Int32
    SD_LAUNCHPERMISSIONS = 0
    SD_ACCESSPERMISSIONS = 1
    SD_LAUNCHRESTRICTIONS = 2
    SD_ACCESSRESTRICTIONS = 3
  end

  enum COWAIT_FLAGS : Int32
    COWAIT_DEFAULT = 0
    COWAIT_WAITALL = 1
    COWAIT_ALERTABLE = 2
    COWAIT_INPUTAVAILABLE = 4
    COWAIT_DISPATCH_CALLS = 8
    COWAIT_DISPATCH_WINDOW_MESSAGES = 16
  end

  enum CWMO_FLAGS : Int32
    CWMO_DEFAULT = 0
    CWMO_DISPATCH_CALLS = 1
    CWMO_DISPATCH_WINDOW_MESSAGES = 2
  end

  enum BINDINFOF : Int32
    BINDINFOF_URLENCODESTGMEDDATA = 1
    BINDINFOF_URLENCODEDEXTRAINFO = 2
  end

  enum Uri_PROPERTY : Int32
    Uri_PROPERTY_ABSOLUTE_URI = 0
    Uri_PROPERTY_STRING_START = 0
    Uri_PROPERTY_AUTHORITY = 1
    Uri_PROPERTY_DISPLAY_URI = 2
    Uri_PROPERTY_DOMAIN = 3
    Uri_PROPERTY_EXTENSION = 4
    Uri_PROPERTY_FRAGMENT = 5
    Uri_PROPERTY_HOST = 6
    Uri_PROPERTY_PASSWORD = 7
    Uri_PROPERTY_PATH = 8
    Uri_PROPERTY_PATH_AND_QUERY = 9
    Uri_PROPERTY_QUERY = 10
    Uri_PROPERTY_RAW_URI = 11
    Uri_PROPERTY_SCHEME_NAME = 12
    Uri_PROPERTY_USER_INFO = 13
    Uri_PROPERTY_USER_NAME = 14
    Uri_PROPERTY_STRING_LAST = 14
    Uri_PROPERTY_HOST_TYPE = 15
    Uri_PROPERTY_DWORD_START = 15
    Uri_PROPERTY_PORT = 16
    Uri_PROPERTY_SCHEME = 17
    Uri_PROPERTY_ZONE = 18
    Uri_PROPERTY_DWORD_LAST = 18
  end

  enum TYPEKIND : Int32
    TKIND_ENUM = 0
    TKIND_RECORD = 1
    TKIND_MODULE = 2
    TKIND_INTERFACE = 3
    TKIND_DISPATCH = 4
    TKIND_COCLASS = 5
    TKIND_ALIAS = 6
    TKIND_UNION = 7
    TKIND_MAX = 8
  end

  enum CALLCONV : Int32
    CC_FASTCALL = 0
    CC_CDECL = 1
    CC_MSCPASCAL = 2
    CC_PASCAL = 2
    CC_MACPASCAL = 3
    CC_STDCALL = 4
    CC_FPFASTCALL = 5
    CC_SYSCALL = 6
    CC_MPWCDECL = 7
    CC_MPWPASCAL = 8
    CC_MAX = 9
  end

  enum FUNCKIND : Int32
    FUNC_VIRTUAL = 0
    FUNC_PUREVIRTUAL = 1
    FUNC_NONVIRTUAL = 2
    FUNC_STATIC = 3
    FUNC_DISPATCH = 4
  end

  enum INVOKEKIND : Int32
    INVOKE_FUNC = 1
    INVOKE_PROPERTYGET = 2
    INVOKE_PROPERTYPUT = 4
    INVOKE_PROPERTYPUTREF = 8
  end

  enum VARKIND : Int32
    VAR_PERINSTANCE = 0
    VAR_STATIC = 1
    VAR_CONST = 2
    VAR_DISPATCH = 3
  end

  enum DESCKIND : Int32
    DESCKIND_NONE = 0
    DESCKIND_FUNCDESC = 1
    DESCKIND_VARDESC = 2
    DESCKIND_TYPECOMP = 3
    DESCKIND_IMPLICITAPPOBJ = 4
    DESCKIND_MAX = 5
  end

  enum SYSKIND : Int32
    SYS_WIN16 = 0
    SYS_WIN32 = 1
    SYS_MAC = 2
    SYS_WIN64 = 3
  end

  union CY
    anonymous : CY_Anonymous_e__Struct
    int64 : Int64
  end
  union Uclsspec_tagged_union_e__Struct
    clsid : Guid
    p_file_ext : LibC::LPWSTR
    p_mime_type : LibC::LPWSTR
    p_prog_id : LibC::LPWSTR
    p_file_name : LibC::LPWSTR
    by_name : Uclsspec_tagged_union_e__Struct_ByName_e__Struct
    by_object_id : Uclsspec_tagged_union_e__Struct_ByObjectId_e__Struct
  end
  union STGMEDIUM_Anonymous_e__Union
    h_bitmap : HBITMAP
    h_meta_file_pict : Void*
    h_enh_meta_file : HENHMETAFILE
    h_global : LibC::IntPtrT
    lpsz_file_name : LibC::LPWSTR
    pstm : IStream
    pstg : IStorage
  end
  union GDI_OBJECT_u_e__Struct
    h_bitmap : Userhbitmap*
    h_palette : Userhpalette*
    h_generic : Userhglobal*
  end
  union Userstgmedium_STGMEDIUM_UNION_u_e__Struct
    h_meta_file_pict : Userhmetafilepict*
    h_h_enh_meta_file : Userhenhmetafile*
    h_gdi_handle : GDI_OBJECT*
    h_global : Userhglobal*
    lpsz_file_name : LibC::LPWSTR
    pstm : BYTE_BLOB*
    pstg : BYTE_BLOB*
  end
  union VARIANT_Anonymous_e__Union
    anonymous : VARIANT_Anonymous_e__Union_Anonymous_e__Struct
    dec_val : DECIMAL
  end
  union VARIANT_Anonymous_e__Union_Anonymous_e__Struct_Anonymous_e__Union
    ll_val : Int64
    l_val : Int32
    b_val : UInt8
    i_val : Int16
    flt_val : Float32
    dbl_val : Float64
    bool_val : Int16
    __obsolete__variant_bool : Int16
    scode : Int32
    cy_val : CY
    date : Float64
    bstr_val : UInt8*
    punk_val : IUnknown
    pdisp_val : IDispatch
    parray : SAFEARRAY*
    pb_val : UInt8*
    pi_val : Int16*
    pl_val : Int32*
    pll_val : Int64*
    pflt_val : Float32*
    pdbl_val : Float64*
    pbool_val : Int16*
    __obsolete__variant_pbool : Int16*
    pscode : Int32*
    pcy_val : CY*
    pdate : Float64*
    pbstr_val : UInt8**
    ppunk_val : IUnknown*
    ppdisp_val : IDispatch*
    pparray : SAFEARRAY**
    pvar_val : VARIANT*
    byref : Void*
    c_val : CHAR
    ui_val : UInt16
    ul_val : UInt32
    ull_val : UInt64
    int_val : Int32
    uint_val : UInt32
    pdec_val : DECIMAL*
    pc_val : PSTR
    pui_val : UInt16*
    pul_val : UInt32*
    pull_val : UInt64*
    pint_val : Int32*
    puint_val : UInt32*
    anonymous : VARIANT_Anonymous_e__Union_Anonymous_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
  end
  union TYPEDESC_Anonymous_e__Union
    lptdesc : TYPEDESC*
    lpadesc : ARRAYDESC*
    hreftype : UInt32
  end
  union ELEMDESC_Anonymous_e__Union
    idldesc : IDLDESC
    paramdesc : PARAMDESC
  end
  union VARDESC_Anonymous_e__Union
    o_inst : UInt32
    lpvar_value : VARIANT*
  end
  union BINDPTR
    lpfuncdesc : FUNCDESC*
    lpvardesc : VARDESC*
    lptcomp : ITypeComp
  end

  struct CY_Anonymous_e__Struct
    lo : UInt32
    hi : Int32
  end
  struct CSPLATFORM
    dw_platform_id : UInt32
    dw_version_hi : UInt32
    dw_version_lo : UInt32
    dw_processor_arch : UInt32
  end
  struct QUERYCONTEXT
    dw_context : UInt32
    platform : CSPLATFORM
    locale : UInt32
    dw_version_hi : UInt32
    dw_version_lo : UInt32
  end
  struct Uclsspec
    tyspec : UInt32
    tagged_union : Uclsspec_tagged_union_e__Struct
  end
  struct Uclsspec_tagged_union_e__Struct_ByName_e__Struct
    p_package_name : LibC::LPWSTR
    policy_id : Guid
  end
  struct Uclsspec_tagged_union_e__Struct_ByObjectId_e__Struct
    object_id : Guid
    policy_id : Guid
  end
  struct COAUTHIDENTITY
    user : UInt16*
    user_length : UInt32
    domain : UInt16*
    domain_length : UInt32
    password : UInt16*
    password_length : UInt32
    flags : UInt32
  end
  struct COAUTHINFO
    dw_authn_svc : UInt32
    dw_authz_svc : UInt32
    pwsz_server_princ_name : LibC::LPWSTR
    dw_authn_level : UInt32
    dw_impersonation_level : UInt32
    p_auth_identity_data : COAUTHIDENTITY*
    dw_capabilities : UInt32
  end
  struct BYTE_BLOB
    cl_size : UInt32
    ab_data : UInt8[0]*
  end
  struct WORD_BLOB
    cl_size : UInt32
    as_data : UInt16[0]*
  end
  struct DWORD_BLOB
    cl_size : UInt32
    al_data : UInt32[0]*
  end
  struct FLAGGED_BYTE_BLOB
    f_flags : UInt32
    cl_size : UInt32
    ab_data : UInt8[0]*
  end
  struct FLAGGED_WORD_BLOB
    f_flags : UInt32
    cl_size : UInt32
    as_data : UInt16[0]*
  end
  struct BYTE_SIZEDARR
    cl_size : UInt32
    p_data : UInt8*
  end
  struct SHORT_SIZEDARR
    cl_size : UInt32
    p_data : UInt16*
  end
  struct LONG_SIZEDARR
    cl_size : UInt32
    p_data : UInt32*
  end
  struct HYPER_SIZEDARR
    cl_size : UInt32
    p_data : Int64*
  end
  struct BLOB
    cb_size : UInt32
    p_blob_data : UInt8*
  end
  struct COSERVERINFO
    dw_reserved1 : UInt32
    pwsz_name : LibC::LPWSTR
    p_auth_info : COAUTHINFO*
    dw_reserved2 : UInt32
  end
  struct MULTI_QI
    p_iid : Guid*
    p_itf : IUnknown
    hr : HRESULT
  end
  struct STATSTG
    pwcs_name : LibC::LPWSTR
    type : UInt32
    cb_size : ULARGE_INTEGER
    mtime : FILETIME
    ctime : FILETIME
    atime : FILETIME
    grf_mode : UInt32
    grf_locks_supported : UInt32
    clsid : Guid
    grf_state_bits : UInt32
    reserved : UInt32
  end
  struct RPCOLEMESSAGE
    reserved1 : Void*
    data_representation : UInt32
    buffer : Void*
    cb_buffer : UInt32
    i_method : UInt32
    reserved2 : Void[5]**
    rpc_flags : UInt32
  end
  struct SChannelHookCallInfo
    iid : Guid
    cb_size : UInt32
    u_causality : Guid
    dw_server_pid : UInt32
    i_method : UInt32
    p_object : Void*
  end
  struct SOLE_AUTHENTICATION_SERVICE
    dw_authn_svc : UInt32
    dw_authz_svc : UInt32
    p_principal_name : LibC::LPWSTR
    hr : HRESULT
  end
  struct SOLE_AUTHENTICATION_INFO
    dw_authn_svc : UInt32
    dw_authz_svc : UInt32
    p_auth_info : Void*
  end
  struct SOLE_AUTHENTICATION_LIST
    c_auth_info : UInt32
    a_auth_info : SOLE_AUTHENTICATION_INFO*
  end
  struct MachineGlobalObjectTableRegistrationToken__
    unused : Int32
  end
  struct BIND_OPTS
    cb_struct : UInt32
    grf_flags : UInt32
    grf_mode : UInt32
    dw_tick_count_deadline : UInt32
  end
  struct BIND_OPTS2
    __anonymous_base_objidl_l9017_c36 : BIND_OPTS
    dw_track_flags : UInt32
    dw_class_context : UInt32
    locale : UInt32
    p_server_info : COSERVERINFO*
  end
  struct BIND_OPTS3
    __anonymous_base_objidl_l9041_c36 : BIND_OPTS2
    hwnd : HANDLE
  end
  struct DVTARGETDEVICE
    td_size : UInt32
    td_driver_name_offset : UInt16
    td_device_name_offset : UInt16
    td_port_name_offset : UInt16
    td_ext_devmode_offset : UInt16
    td_data : UInt8[0]*
  end
  struct FORMATETC
    cf_format : UInt16
    ptd : DVTARGETDEVICE*
    dw_aspect : UInt32
    lindex : Int32
    tymed : UInt32
  end
  struct STATDATA
    formatetc : FORMATETC
    advf : UInt32
    p_adv_sink : IAdviseSink
    dw_connection : UInt32
  end
  struct RemSTGMEDIUM
    tymed : UInt32
    dw_handle_type : UInt32
    p_data : UInt32
    p_unk_for_release : UInt32
    cb_data : UInt32
    data : UInt8[0]*
  end
  struct STGMEDIUM
    tymed : UInt32
    anonymous : STGMEDIUM_Anonymous_e__Union
    p_unk_for_release : IUnknown
  end
  struct GDI_OBJECT
    object_type : UInt32
    u : GDI_OBJECT_u_e__Struct
  end
  struct Userstgmedium
    p_unk_for_release : IUnknown
  end
  struct Userstgmedium_STGMEDIUM_UNION
    tymed : UInt32
    u : Userstgmedium_STGMEDIUM_UNION_u_e__Struct
  end
  struct Userflag_stgmedium
    context_flags : Int32
    f_pass_ownership : Int32
    stgmed : Userstgmedium
  end
  struct FLAG_STGMEDIUM
    context_flags : Int32
    f_pass_ownership : Int32
    stgmed : STGMEDIUM
  end
  struct INTERFACEINFO
    p_unk : IUnknown
    iid : Guid
    w_method : UInt16
  end
  struct StorageLayout
    layout_type : UInt32
    pwcs_element_name : LibC::LPWSTR
    c_offset : LARGE_INTEGER
    c_bytes : LARGE_INTEGER
  end
  struct CATEGORYINFO
    catid : Guid
    lcid : UInt32
    sz_description : Char[128]*
  end
  struct ComCallData
    dw_dispid : UInt32
    dw_reserved : UInt32
    p_user_defined : Void*
  end
  struct BINDINFO
    cb_size : UInt32
    sz_extra_info : LibC::LPWSTR
    stgmed_data : STGMEDIUM
    grf_bind_info_f : UInt32
    dw_bind_verb : UInt32
    sz_custom_verb : LibC::LPWSTR
    cbstgmed_data : UInt32
    dw_options : UInt32
    dw_options_flags : UInt32
    dw_code_page : UInt32
    security_attributes : SECURITY_ATTRIBUTES
    iid : Guid
    p_unk : IUnknown
    dw_reserved : UInt32
  end
  struct AUTHENTICATEINFO
    dw_flags : UInt32
    dw_reserved : UInt32
  end
  struct SAFEARRAYBOUND
    c_elements : UInt32
    l_lbound : Int32
  end
  struct SAFEARRAY
    c_dims : UInt16
    f_features : UInt16
    cb_elements : UInt32
    c_locks : UInt32
    pv_data : Void*
    rgsabound : SAFEARRAYBOUND[0]*
  end
  struct VARIANT
    anonymous : VARIANT_Anonymous_e__Union
  end
  struct VARIANT_Anonymous_e__Union_Anonymous_e__Struct
    vt : UInt16
    w_reserved1 : UInt16
    w_reserved2 : UInt16
    w_reserved3 : UInt16
    anonymous : VARIANT_Anonymous_e__Union_Anonymous_e__Struct_Anonymous_e__Union
  end
  struct VARIANT_Anonymous_e__Union_Anonymous_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
    pv_record : Void*
    p_rec_info : IRecordInfo
  end
  struct TYPEDESC
    anonymous : TYPEDESC_Anonymous_e__Union
    vt : UInt16
  end
  struct IDLDESC
    dw_reserved : LibC::UINT_PTR
    w_idl_flags : UInt16
  end
  struct ELEMDESC
    tdesc : TYPEDESC
    anonymous : ELEMDESC_Anonymous_e__Union
  end
  struct TYPEATTR
    guid : Guid
    lcid : UInt32
    dw_reserved : UInt32
    memid_constructor : Int32
    memid_destructor : Int32
    lpstr_schema : LibC::LPWSTR
    cb_size_instance : UInt32
    typekind : TYPEKIND
    c_funcs : UInt16
    c_vars : UInt16
    c_impl_types : UInt16
    cb_size_vft : UInt16
    cb_alignment : UInt16
    w_type_flags : UInt16
    w_major_ver_num : UInt16
    w_minor_ver_num : UInt16
    tdesc_alias : TYPEDESC
    idldesc_type : IDLDESC
  end
  struct DISPPARAMS
    rgvarg : VARIANT*
    rgdispid_named_args : Int32*
    c_args : UInt32
    c_named_args : UInt32
  end
  struct EXCEPINFO
    w_code : UInt16
    w_reserved : UInt16
    bstr_source : UInt8*
    bstr_description : UInt8*
    bstr_help_file : UInt8*
    dw_help_context : UInt32
    pv_reserved : Void*
    pfn_deferred_fill_in : LPEXCEPFINO_DEFERRED_FILLIN
    scode : Int32
  end
  struct FUNCDESC
    memid : Int32
    lprgscode : Int32*
    lprgelemdesc_param : ELEMDESC*
    funckind : FUNCKIND
    invkind : INVOKEKIND
    callconv : CALLCONV
    c_params : Int16
    c_params_opt : Int16
    o_vft : Int16
    c_scodes : Int16
    elemdesc_func : ELEMDESC
    w_func_flags : UInt16
  end
  struct VARDESC
    memid : Int32
    lpstr_schema : LibC::LPWSTR
    anonymous : VARDESC_Anonymous_e__Union
    elemdesc_var : ELEMDESC
    w_var_flags : UInt16
    varkind : VARKIND
  end
  struct CUSTDATAITEM
    guid : Guid
    var_value : VARIANT
  end
  struct CUSTDATA
    c_cust_data : UInt32
    prg_cust_data : CUSTDATAITEM*
  end
  struct TLIBATTR
    guid : Guid
    lcid : UInt32
    syskind : SYSKIND
    w_major_ver_num : UInt16
    w_minor_ver_num : UInt16
    w_lib_flags : UInt16
  end
  struct CONNECTDATA
    p_unk : IUnknown
    dw_cookie : UInt32
  end


  struct IUnknownVTbl
    query_interface : Proc(IUnknown*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUnknown*, UInt32)
    release : Proc(IUnknown*, UInt32)
  end

  IUnknown_GUID = "00000000-0000-0000-c000-000000000046"
  IID_IUnknown = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IUnknown
    lpVtbl : IUnknownVTbl*
  end

  struct AsyncIUnknownVTbl
    query_interface : Proc(AsyncIUnknown*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIUnknown*, UInt32)
    release : Proc(AsyncIUnknown*, UInt32)
    begin_query_interface : Proc(AsyncIUnknown*, Guid*, HRESULT)
    finish_query_interface : Proc(AsyncIUnknown*, Void**, HRESULT)
    begin_add_ref : Proc(AsyncIUnknown*, HRESULT)
    finish_add_ref : Proc(AsyncIUnknown*, UInt32)
    begin_release : Proc(AsyncIUnknown*, HRESULT)
    finish_release : Proc(AsyncIUnknown*, UInt32)
  end

  AsyncIUnknown_GUID = "000e0000-0000-0000-c000-000000000046"
  IID_AsyncIUnknown = LibC::GUID.new(0xe0000_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct AsyncIUnknown
    lpVtbl : AsyncIUnknownVTbl*
  end

  struct IClassFactoryVTbl
    query_interface : Proc(IClassFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IClassFactory*, UInt32)
    release : Proc(IClassFactory*, UInt32)
    create_instance : Proc(IClassFactory*, IUnknown, Guid*, Void**, HRESULT)
    lock_server : Proc(IClassFactory*, LibC::BOOL, HRESULT)
  end

  IClassFactory_GUID = "00000001-0000-0000-c000-000000000046"
  IID_IClassFactory = LibC::GUID.new(0x1_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IClassFactory
    lpVtbl : IClassFactoryVTbl*
  end

  struct INoMarshalVTbl
    query_interface : Proc(INoMarshal*, Guid*, Void**, HRESULT)
    add_ref : Proc(INoMarshal*, UInt32)
    release : Proc(INoMarshal*, UInt32)
  end

  INoMarshal_GUID = "ecc8691b-c1db-4dc0-855e-65f6c551af49"
  IID_INoMarshal = LibC::GUID.new(0xecc8691b_u32, 0xc1db_u16, 0x4dc0_u16, StaticArray[0x85_u8, 0x5e_u8, 0x65_u8, 0xf6_u8, 0xc5_u8, 0x51_u8, 0xaf_u8, 0x49_u8])
  struct INoMarshal
    lpVtbl : INoMarshalVTbl*
  end

  struct IAgileObjectVTbl
    query_interface : Proc(IAgileObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAgileObject*, UInt32)
    release : Proc(IAgileObject*, UInt32)
  end

  IAgileObject_GUID = "94ea2b94-e9cc-49e0-c0ff-ee64ca8f5b90"
  IID_IAgileObject = LibC::GUID.new(0x94ea2b94_u32, 0xe9cc_u16, 0x49e0_u16, StaticArray[0xc0_u8, 0xff_u8, 0xee_u8, 0x64_u8, 0xca_u8, 0x8f_u8, 0x5b_u8, 0x90_u8])
  struct IAgileObject
    lpVtbl : IAgileObjectVTbl*
  end

  struct IActivationFilterVTbl
    query_interface : Proc(IActivationFilter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActivationFilter*, UInt32)
    release : Proc(IActivationFilter*, UInt32)
    handle_activation : Proc(IActivationFilter*, UInt32, Guid*, Guid*, HRESULT)
  end

  IActivationFilter_GUID = "00000017-0000-0000-c000-000000000046"
  IID_IActivationFilter = LibC::GUID.new(0x17_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IActivationFilter
    lpVtbl : IActivationFilterVTbl*
  end

  struct IMallocVTbl
    query_interface : Proc(IMalloc*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMalloc*, UInt32)
    release : Proc(IMalloc*, UInt32)
    alloc : Proc(IMalloc*, LibC::UINT_PTR, Void**)
    realloc : Proc(IMalloc*, Void*, LibC::UINT_PTR, Void**)
    free : Proc(IMalloc*, Void*, Void)
    get_size : Proc(IMalloc*, Void*, LibC::UINT_PTR)
    did_alloc : Proc(IMalloc*, Void*, Int32)
    heap_minimize : Proc(IMalloc*, Void)
  end

  IMalloc_GUID = "00000002-0000-0000-c000-000000000046"
  IID_IMalloc = LibC::GUID.new(0x2_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMalloc
    lpVtbl : IMallocVTbl*
  end

  struct IStdMarshalInfoVTbl
    query_interface : Proc(IStdMarshalInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStdMarshalInfo*, UInt32)
    release : Proc(IStdMarshalInfo*, UInt32)
    get_class_for_handler : Proc(IStdMarshalInfo*, UInt32, Void*, Guid*, HRESULT)
  end

  IStdMarshalInfo_GUID = "00000018-0000-0000-c000-000000000046"
  IID_IStdMarshalInfo = LibC::GUID.new(0x18_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IStdMarshalInfo
    lpVtbl : IStdMarshalInfoVTbl*
  end

  struct IExternalConnectionVTbl
    query_interface : Proc(IExternalConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExternalConnection*, UInt32)
    release : Proc(IExternalConnection*, UInt32)
    add_connection : Proc(IExternalConnection*, UInt32, UInt32, UInt32)
    release_connection : Proc(IExternalConnection*, UInt32, UInt32, LibC::BOOL, UInt32)
  end

  IExternalConnection_GUID = "00000019-0000-0000-c000-000000000046"
  IID_IExternalConnection = LibC::GUID.new(0x19_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IExternalConnection
    lpVtbl : IExternalConnectionVTbl*
  end

  struct IMultiQIVTbl
    query_interface : Proc(IMultiQI*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMultiQI*, UInt32)
    release : Proc(IMultiQI*, UInt32)
    query_multiple_interfaces : Proc(IMultiQI*, UInt32, MULTI_QI*, HRESULT)
  end

  IMultiQI_GUID = "00000020-0000-0000-c000-000000000046"
  IID_IMultiQI = LibC::GUID.new(0x20_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMultiQI
    lpVtbl : IMultiQIVTbl*
  end

  struct AsyncIMultiQIVTbl
    query_interface : Proc(AsyncIMultiQI*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIMultiQI*, UInt32)
    release : Proc(AsyncIMultiQI*, UInt32)
    begin_query_multiple_interfaces : Proc(AsyncIMultiQI*, UInt32, MULTI_QI*, HRESULT)
    finish_query_multiple_interfaces : Proc(AsyncIMultiQI*, MULTI_QI*, HRESULT)
  end

  AsyncIMultiQI_GUID = "000e0020-0000-0000-c000-000000000046"
  IID_AsyncIMultiQI = LibC::GUID.new(0xe0020_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct AsyncIMultiQI
    lpVtbl : AsyncIMultiQIVTbl*
  end

  struct IInternalUnknownVTbl
    query_interface : Proc(IInternalUnknown*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInternalUnknown*, UInt32)
    release : Proc(IInternalUnknown*, UInt32)
    query_internal_interface : Proc(IInternalUnknown*, Guid*, Void**, HRESULT)
  end

  IInternalUnknown_GUID = "00000021-0000-0000-c000-000000000046"
  IID_IInternalUnknown = LibC::GUID.new(0x21_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IInternalUnknown
    lpVtbl : IInternalUnknownVTbl*
  end

  struct IEnumUnknownVTbl
    query_interface : Proc(IEnumUnknown*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumUnknown*, UInt32)
    release : Proc(IEnumUnknown*, UInt32)
    next : Proc(IEnumUnknown*, UInt32, IUnknown*, UInt32*, HRESULT)
    skip : Proc(IEnumUnknown*, UInt32, HRESULT)
    reset : Proc(IEnumUnknown*, HRESULT)
    clone : Proc(IEnumUnknown*, IEnumUnknown*, HRESULT)
  end

  IEnumUnknown_GUID = "00000100-0000-0000-c000-000000000046"
  IID_IEnumUnknown = LibC::GUID.new(0x100_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumUnknown
    lpVtbl : IEnumUnknownVTbl*
  end

  struct IEnumStringVTbl
    query_interface : Proc(IEnumString*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumString*, UInt32)
    release : Proc(IEnumString*, UInt32)
    next : Proc(IEnumString*, UInt32, LibC::LPWSTR*, UInt32*, HRESULT)
    skip : Proc(IEnumString*, UInt32, HRESULT)
    reset : Proc(IEnumString*, HRESULT)
    clone : Proc(IEnumString*, IEnumString*, HRESULT)
  end

  IEnumString_GUID = "00000101-0000-0000-c000-000000000046"
  IID_IEnumString = LibC::GUID.new(0x101_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumString
    lpVtbl : IEnumStringVTbl*
  end

  struct ISequentialStreamVTbl
    query_interface : Proc(ISequentialStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISequentialStream*, UInt32)
    release : Proc(ISequentialStream*, UInt32)
    read : Proc(ISequentialStream*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(ISequentialStream*, Void*, UInt32, UInt32*, HRESULT)
  end

  ISequentialStream_GUID = "0c733a30-2a1c-11ce-ade5-00aa0044773d"
  IID_ISequentialStream = LibC::GUID.new(0xc733a30_u32, 0x2a1c_u16, 0x11ce_u16, StaticArray[0xad_u8, 0xe5_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x44_u8, 0x77_u8, 0x3d_u8])
  struct ISequentialStream
    lpVtbl : ISequentialStreamVTbl*
  end

  struct IStreamVTbl
    query_interface : Proc(IStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStream*, UInt32)
    release : Proc(IStream*, UInt32)
    read : Proc(IStream*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(IStream*, Void*, UInt32, UInt32*, HRESULT)
    seek : Proc(IStream*, LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)
    set_size : Proc(IStream*, ULARGE_INTEGER, HRESULT)
    copy_to : Proc(IStream*, IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)
    commit : Proc(IStream*, UInt32, HRESULT)
    revert : Proc(IStream*, HRESULT)
    lock_region : Proc(IStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(IStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(IStream*, STATSTG*, UInt32, HRESULT)
    clone : Proc(IStream*, IStream*, HRESULT)
  end

  IStream_GUID = "0000000c-0000-0000-c000-000000000046"
  IID_IStream = LibC::GUID.new(0xc_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IStream
    lpVtbl : IStreamVTbl*
  end

  struct IRpcChannelBufferVTbl
    query_interface : Proc(IRpcChannelBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRpcChannelBuffer*, UInt32)
    release : Proc(IRpcChannelBuffer*, UInt32)
    get_buffer : Proc(IRpcChannelBuffer*, RPCOLEMESSAGE*, Guid*, HRESULT)
    send_receive : Proc(IRpcChannelBuffer*, RPCOLEMESSAGE*, UInt32*, HRESULT)
    free_buffer : Proc(IRpcChannelBuffer*, RPCOLEMESSAGE*, HRESULT)
    get_dest_ctx : Proc(IRpcChannelBuffer*, UInt32*, Void**, HRESULT)
    is_connected : Proc(IRpcChannelBuffer*, HRESULT)
  end

  IRpcChannelBuffer_GUID = "d5f56b60-593b-101a-b569-08002b2dbf7a"
  IID_IRpcChannelBuffer = LibC::GUID.new(0xd5f56b60_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
  struct IRpcChannelBuffer
    lpVtbl : IRpcChannelBufferVTbl*
  end

  struct IRpcChannelBuffer2VTbl
    query_interface : Proc(IRpcChannelBuffer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRpcChannelBuffer2*, UInt32)
    release : Proc(IRpcChannelBuffer2*, UInt32)
    get_buffer : Proc(IRpcChannelBuffer2*, RPCOLEMESSAGE*, Guid*, HRESULT)
    send_receive : Proc(IRpcChannelBuffer2*, RPCOLEMESSAGE*, UInt32*, HRESULT)
    free_buffer : Proc(IRpcChannelBuffer2*, RPCOLEMESSAGE*, HRESULT)
    get_dest_ctx : Proc(IRpcChannelBuffer2*, UInt32*, Void**, HRESULT)
    is_connected : Proc(IRpcChannelBuffer2*, HRESULT)
    get_protocol_version : Proc(IRpcChannelBuffer2*, UInt32*, HRESULT)
  end

  IRpcChannelBuffer2_GUID = "594f31d0-7f19-11d0-b194-00a0c90dc8bf"
  IID_IRpcChannelBuffer2 = LibC::GUID.new(0x594f31d0_u32, 0x7f19_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x94_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0xc8_u8, 0xbf_u8])
  struct IRpcChannelBuffer2
    lpVtbl : IRpcChannelBuffer2VTbl*
  end

  struct IAsyncRpcChannelBufferVTbl
    query_interface : Proc(IAsyncRpcChannelBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAsyncRpcChannelBuffer*, UInt32)
    release : Proc(IAsyncRpcChannelBuffer*, UInt32)
    get_buffer : Proc(IAsyncRpcChannelBuffer*, RPCOLEMESSAGE*, Guid*, HRESULT)
    send_receive : Proc(IAsyncRpcChannelBuffer*, RPCOLEMESSAGE*, UInt32*, HRESULT)
    free_buffer : Proc(IAsyncRpcChannelBuffer*, RPCOLEMESSAGE*, HRESULT)
    get_dest_ctx : Proc(IAsyncRpcChannelBuffer*, UInt32*, Void**, HRESULT)
    is_connected : Proc(IAsyncRpcChannelBuffer*, HRESULT)
    get_protocol_version : Proc(IAsyncRpcChannelBuffer*, UInt32*, HRESULT)
    send : Proc(IAsyncRpcChannelBuffer*, RPCOLEMESSAGE*, ISynchronize, UInt32*, HRESULT)
    receive : Proc(IAsyncRpcChannelBuffer*, RPCOLEMESSAGE*, UInt32*, HRESULT)
    get_dest_ctx_ex : Proc(IAsyncRpcChannelBuffer*, RPCOLEMESSAGE*, UInt32*, Void**, HRESULT)
  end

  IAsyncRpcChannelBuffer_GUID = "a5029fb6-3c34-11d1-9c99-00c04fb998aa"
  IID_IAsyncRpcChannelBuffer = LibC::GUID.new(0xa5029fb6_u32, 0x3c34_u16, 0x11d1_u16, StaticArray[0x9c_u8, 0x99_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0xaa_u8])
  struct IAsyncRpcChannelBuffer
    lpVtbl : IAsyncRpcChannelBufferVTbl*
  end

  struct IRpcChannelBuffer3VTbl
    query_interface : Proc(IRpcChannelBuffer3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRpcChannelBuffer3*, UInt32)
    release : Proc(IRpcChannelBuffer3*, UInt32)
    get_buffer : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, Guid*, HRESULT)
    send_receive : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, UInt32*, HRESULT)
    free_buffer : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, HRESULT)
    get_dest_ctx : Proc(IRpcChannelBuffer3*, UInt32*, Void**, HRESULT)
    is_connected : Proc(IRpcChannelBuffer3*, HRESULT)
    get_protocol_version : Proc(IRpcChannelBuffer3*, UInt32*, HRESULT)
    send : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, UInt32*, HRESULT)
    receive : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, UInt32, UInt32*, HRESULT)
    cancel : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, HRESULT)
    get_call_context : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, Guid*, Void**, HRESULT)
    get_dest_ctx_ex : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, UInt32*, Void**, HRESULT)
    get_state : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, UInt32*, HRESULT)
    register_async : Proc(IRpcChannelBuffer3*, RPCOLEMESSAGE*, IAsyncManager, HRESULT)
  end

  IRpcChannelBuffer3_GUID = "25b15600-0115-11d0-bf0d-00aa00b8dfd2"
  IID_IRpcChannelBuffer3 = LibC::GUID.new(0x25b15600_u32, 0x115_u16, 0x11d0_u16, StaticArray[0xbf_u8, 0xd_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb8_u8, 0xdf_u8, 0xd2_u8])
  struct IRpcChannelBuffer3
    lpVtbl : IRpcChannelBuffer3VTbl*
  end

  struct IRpcSyntaxNegotiateVTbl
    query_interface : Proc(IRpcSyntaxNegotiate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRpcSyntaxNegotiate*, UInt32)
    release : Proc(IRpcSyntaxNegotiate*, UInt32)
    negotiate_syntax : Proc(IRpcSyntaxNegotiate*, RPCOLEMESSAGE*, HRESULT)
  end

  IRpcSyntaxNegotiate_GUID = "58a08519-24c8-4935-b482-3fd823333a4f"
  IID_IRpcSyntaxNegotiate = LibC::GUID.new(0x58a08519_u32, 0x24c8_u16, 0x4935_u16, StaticArray[0xb4_u8, 0x82_u8, 0x3f_u8, 0xd8_u8, 0x23_u8, 0x33_u8, 0x3a_u8, 0x4f_u8])
  struct IRpcSyntaxNegotiate
    lpVtbl : IRpcSyntaxNegotiateVTbl*
  end

  struct IRpcProxyBufferVTbl
    query_interface : Proc(IRpcProxyBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRpcProxyBuffer*, UInt32)
    release : Proc(IRpcProxyBuffer*, UInt32)
    connect : Proc(IRpcProxyBuffer*, IRpcChannelBuffer, HRESULT)
    disconnect : Proc(IRpcProxyBuffer*, Void)
  end

  IRpcProxyBuffer_GUID = "d5f56a34-593b-101a-b569-08002b2dbf7a"
  IID_IRpcProxyBuffer = LibC::GUID.new(0xd5f56a34_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
  struct IRpcProxyBuffer
    lpVtbl : IRpcProxyBufferVTbl*
  end

  struct IRpcStubBufferVTbl
    query_interface : Proc(IRpcStubBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRpcStubBuffer*, UInt32)
    release : Proc(IRpcStubBuffer*, UInt32)
    connect : Proc(IRpcStubBuffer*, IUnknown, HRESULT)
    disconnect : Proc(IRpcStubBuffer*, Void)
    invoke : Proc(IRpcStubBuffer*, RPCOLEMESSAGE*, IRpcChannelBuffer, HRESULT)
    is_iid_supported : Proc(IRpcStubBuffer*, Guid*, IRpcStubBuffer)
    count_refs : Proc(IRpcStubBuffer*, UInt32)
    debug_server_query_interface : Proc(IRpcStubBuffer*, Void**, HRESULT)
    debug_server_release : Proc(IRpcStubBuffer*, Void*, Void)
  end

  IRpcStubBuffer_GUID = "d5f56afc-593b-101a-b569-08002b2dbf7a"
  IID_IRpcStubBuffer = LibC::GUID.new(0xd5f56afc_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
  struct IRpcStubBuffer
    lpVtbl : IRpcStubBufferVTbl*
  end

  struct IPSFactoryBufferVTbl
    query_interface : Proc(IPSFactoryBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPSFactoryBuffer*, UInt32)
    release : Proc(IPSFactoryBuffer*, UInt32)
    create_proxy : Proc(IPSFactoryBuffer*, IUnknown, Guid*, IRpcProxyBuffer*, Void**, HRESULT)
    create_stub : Proc(IPSFactoryBuffer*, Guid*, IUnknown, IRpcStubBuffer*, HRESULT)
  end

  IPSFactoryBuffer_GUID = "d5f569d0-593b-101a-b569-08002b2dbf7a"
  IID_IPSFactoryBuffer = LibC::GUID.new(0xd5f569d0_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
  struct IPSFactoryBuffer
    lpVtbl : IPSFactoryBufferVTbl*
  end

  struct IChannelHookVTbl
    query_interface : Proc(IChannelHook*, Guid*, Void**, HRESULT)
    add_ref : Proc(IChannelHook*, UInt32)
    release : Proc(IChannelHook*, UInt32)
    client_get_size : Proc(IChannelHook*, Guid*, Guid*, UInt32*, Void)
    client_fill_buffer : Proc(IChannelHook*, Guid*, Guid*, UInt32*, Void*, Void)
    client_notify : Proc(IChannelHook*, Guid*, Guid*, UInt32, Void*, UInt32, HRESULT, Void)
    server_notify : Proc(IChannelHook*, Guid*, Guid*, UInt32, Void*, UInt32, Void)
    server_get_size : Proc(IChannelHook*, Guid*, Guid*, HRESULT, UInt32*, Void)
    server_fill_buffer : Proc(IChannelHook*, Guid*, Guid*, UInt32*, Void*, HRESULT, Void)
  end

  IChannelHook_GUID = "1008c4a0-7613-11cf-9af1-0020af6e72f4"
  IID_IChannelHook = LibC::GUID.new(0x1008c4a0_u32, 0x7613_u16, 0x11cf_u16, StaticArray[0x9a_u8, 0xf1_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0x6e_u8, 0x72_u8, 0xf4_u8])
  struct IChannelHook
    lpVtbl : IChannelHookVTbl*
  end

  struct IClientSecurityVTbl
    query_interface : Proc(IClientSecurity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IClientSecurity*, UInt32)
    release : Proc(IClientSecurity*, UInt32)
    query_blanket : Proc(IClientSecurity*, IUnknown, UInt32*, UInt32*, UInt16**, RPC_C_AUTHN_LEVEL*, RPC_C_IMP_LEVEL*, Void**, EOLE_AUTHENTICATION_CAPABILITIES*, HRESULT)
    set_blanket : Proc(IClientSecurity*, IUnknown, UInt32, UInt32, LibC::LPWSTR, RPC_C_AUTHN_LEVEL, RPC_C_IMP_LEVEL, Void*, EOLE_AUTHENTICATION_CAPABILITIES, HRESULT)
    copy_proxy : Proc(IClientSecurity*, IUnknown, IUnknown*, HRESULT)
  end

  IClientSecurity_GUID = "0000013d-0000-0000-c000-000000000046"
  IID_IClientSecurity = LibC::GUID.new(0x13d_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IClientSecurity
    lpVtbl : IClientSecurityVTbl*
  end

  struct IServerSecurityVTbl
    query_interface : Proc(IServerSecurity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServerSecurity*, UInt32)
    release : Proc(IServerSecurity*, UInt32)
    query_blanket : Proc(IServerSecurity*, UInt32*, UInt32*, UInt16**, UInt32*, UInt32*, Void**, UInt32*, HRESULT)
    impersonate_client : Proc(IServerSecurity*, HRESULT)
    revert_to_self : Proc(IServerSecurity*, HRESULT)
    is_impersonating : Proc(IServerSecurity*, LibC::BOOL)
  end

  IServerSecurity_GUID = "0000013e-0000-0000-c000-000000000046"
  IID_IServerSecurity = LibC::GUID.new(0x13e_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IServerSecurity
    lpVtbl : IServerSecurityVTbl*
  end

  struct IRpcOptionsVTbl
    query_interface : Proc(IRpcOptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRpcOptions*, UInt32)
    release : Proc(IRpcOptions*, UInt32)
    set : Proc(IRpcOptions*, IUnknown, RPCOPT_PROPERTIES, LibC::UINT_PTR, HRESULT)
    query : Proc(IRpcOptions*, IUnknown, RPCOPT_PROPERTIES, LibC::UINT_PTR*, HRESULT)
  end

  IRpcOptions_GUID = "00000144-0000-0000-c000-000000000046"
  IID_IRpcOptions = LibC::GUID.new(0x144_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRpcOptions
    lpVtbl : IRpcOptionsVTbl*
  end

  struct IGlobalOptionsVTbl
    query_interface : Proc(IGlobalOptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGlobalOptions*, UInt32)
    release : Proc(IGlobalOptions*, UInt32)
    set : Proc(IGlobalOptions*, GLOBALOPT_PROPERTIES, LibC::UINT_PTR, HRESULT)
    query : Proc(IGlobalOptions*, GLOBALOPT_PROPERTIES, LibC::UINT_PTR*, HRESULT)
  end

  IGlobalOptions_GUID = "0000015b-0000-0000-c000-000000000046"
  IID_IGlobalOptions = LibC::GUID.new(0x15b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IGlobalOptions
    lpVtbl : IGlobalOptionsVTbl*
  end

  struct ISurrogateVTbl
    query_interface : Proc(ISurrogate*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISurrogate*, UInt32)
    release : Proc(ISurrogate*, UInt32)
    load_dll_server : Proc(ISurrogate*, Guid*, HRESULT)
    free_surrogate : Proc(ISurrogate*, HRESULT)
  end

  ISurrogate_GUID = "00000022-0000-0000-c000-000000000046"
  IID_ISurrogate = LibC::GUID.new(0x22_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISurrogate
    lpVtbl : ISurrogateVTbl*
  end

  struct IGlobalInterfaceTableVTbl
    query_interface : Proc(IGlobalInterfaceTable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGlobalInterfaceTable*, UInt32)
    release : Proc(IGlobalInterfaceTable*, UInt32)
    register_interface_in_global : Proc(IGlobalInterfaceTable*, IUnknown, Guid*, UInt32*, HRESULT)
    revoke_interface_from_global : Proc(IGlobalInterfaceTable*, UInt32, HRESULT)
    get_interface_from_global : Proc(IGlobalInterfaceTable*, UInt32, Guid*, Void**, HRESULT)
  end

  IGlobalInterfaceTable_GUID = "00000146-0000-0000-c000-000000000046"
  IID_IGlobalInterfaceTable = LibC::GUID.new(0x146_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IGlobalInterfaceTable
    lpVtbl : IGlobalInterfaceTableVTbl*
  end

  struct ISynchronizeVTbl
    query_interface : Proc(ISynchronize*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISynchronize*, UInt32)
    release : Proc(ISynchronize*, UInt32)
    wait : Proc(ISynchronize*, UInt32, UInt32, HRESULT)
    signal : Proc(ISynchronize*, HRESULT)
    reset : Proc(ISynchronize*, HRESULT)
  end

  ISynchronize_GUID = "00000030-0000-0000-c000-000000000046"
  IID_ISynchronize = LibC::GUID.new(0x30_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronize
    lpVtbl : ISynchronizeVTbl*
  end

  struct ISynchronizeHandleVTbl
    query_interface : Proc(ISynchronizeHandle*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISynchronizeHandle*, UInt32)
    release : Proc(ISynchronizeHandle*, UInt32)
    get_handle : Proc(ISynchronizeHandle*, LibC::HANDLE*, HRESULT)
  end

  ISynchronizeHandle_GUID = "00000031-0000-0000-c000-000000000046"
  IID_ISynchronizeHandle = LibC::GUID.new(0x31_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronizeHandle
    lpVtbl : ISynchronizeHandleVTbl*
  end

  struct ISynchronizeEventVTbl
    query_interface : Proc(ISynchronizeEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISynchronizeEvent*, UInt32)
    release : Proc(ISynchronizeEvent*, UInt32)
    get_handle : Proc(ISynchronizeEvent*, LibC::HANDLE*, HRESULT)
    set_event_handle : Proc(ISynchronizeEvent*, LibC::HANDLE*, HRESULT)
  end

  ISynchronizeEvent_GUID = "00000032-0000-0000-c000-000000000046"
  IID_ISynchronizeEvent = LibC::GUID.new(0x32_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronizeEvent
    lpVtbl : ISynchronizeEventVTbl*
  end

  struct ISynchronizeContainerVTbl
    query_interface : Proc(ISynchronizeContainer*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISynchronizeContainer*, UInt32)
    release : Proc(ISynchronizeContainer*, UInt32)
    add_synchronize : Proc(ISynchronizeContainer*, ISynchronize, HRESULT)
    wait_multiple : Proc(ISynchronizeContainer*, UInt32, UInt32, ISynchronize*, HRESULT)
  end

  ISynchronizeContainer_GUID = "00000033-0000-0000-c000-000000000046"
  IID_ISynchronizeContainer = LibC::GUID.new(0x33_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronizeContainer
    lpVtbl : ISynchronizeContainerVTbl*
  end

  struct ISynchronizeMutexVTbl
    query_interface : Proc(ISynchronizeMutex*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISynchronizeMutex*, UInt32)
    release : Proc(ISynchronizeMutex*, UInt32)
    wait : Proc(ISynchronizeMutex*, UInt32, UInt32, HRESULT)
    signal : Proc(ISynchronizeMutex*, HRESULT)
    reset : Proc(ISynchronizeMutex*, HRESULT)
    release_mutex : Proc(ISynchronizeMutex*, HRESULT)
  end

  ISynchronizeMutex_GUID = "00000025-0000-0000-c000-000000000046"
  IID_ISynchronizeMutex = LibC::GUID.new(0x25_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronizeMutex
    lpVtbl : ISynchronizeMutexVTbl*
  end

  struct ICancelMethodCallsVTbl
    query_interface : Proc(ICancelMethodCalls*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICancelMethodCalls*, UInt32)
    release : Proc(ICancelMethodCalls*, UInt32)
    cancel : Proc(ICancelMethodCalls*, UInt32, HRESULT)
    test_cancel : Proc(ICancelMethodCalls*, HRESULT)
  end

  ICancelMethodCalls_GUID = "00000029-0000-0000-c000-000000000046"
  IID_ICancelMethodCalls = LibC::GUID.new(0x29_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ICancelMethodCalls
    lpVtbl : ICancelMethodCallsVTbl*
  end

  struct IAsyncManagerVTbl
    query_interface : Proc(IAsyncManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAsyncManager*, UInt32)
    release : Proc(IAsyncManager*, UInt32)
    complete_call : Proc(IAsyncManager*, HRESULT, HRESULT)
    get_call_context : Proc(IAsyncManager*, Guid*, Void**, HRESULT)
    get_state : Proc(IAsyncManager*, UInt32*, HRESULT)
  end

  IAsyncManager_GUID = "0000002a-0000-0000-c000-000000000046"
  IID_IAsyncManager = LibC::GUID.new(0x2a_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAsyncManager
    lpVtbl : IAsyncManagerVTbl*
  end

  struct ICallFactoryVTbl
    query_interface : Proc(ICallFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICallFactory*, UInt32)
    release : Proc(ICallFactory*, UInt32)
    create_call : Proc(ICallFactory*, Guid*, IUnknown, Guid*, IUnknown*, HRESULT)
  end

  ICallFactory_GUID = "1c733a30-2a1c-11ce-ade5-00aa0044773d"
  IID_ICallFactory = LibC::GUID.new(0x1c733a30_u32, 0x2a1c_u16, 0x11ce_u16, StaticArray[0xad_u8, 0xe5_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x44_u8, 0x77_u8, 0x3d_u8])
  struct ICallFactory
    lpVtbl : ICallFactoryVTbl*
  end

  struct IRpcHelperVTbl
    query_interface : Proc(IRpcHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRpcHelper*, UInt32)
    release : Proc(IRpcHelper*, UInt32)
    get_dcom_protocol_version : Proc(IRpcHelper*, UInt32*, HRESULT)
    get_iid_from_objref : Proc(IRpcHelper*, Void*, Guid**, HRESULT)
  end

  IRpcHelper_GUID = "00000149-0000-0000-c000-000000000046"
  IID_IRpcHelper = LibC::GUID.new(0x149_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRpcHelper
    lpVtbl : IRpcHelperVTbl*
  end

  struct IReleaseMarshalBuffersVTbl
    query_interface : Proc(IReleaseMarshalBuffers*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReleaseMarshalBuffers*, UInt32)
    release : Proc(IReleaseMarshalBuffers*, UInt32)
    release_marshal_buffer : Proc(IReleaseMarshalBuffers*, RPCOLEMESSAGE*, UInt32, IUnknown, HRESULT)
  end

  IReleaseMarshalBuffers_GUID = "eb0cb9e8-7996-11d2-872e-0000f8080859"
  IID_IReleaseMarshalBuffers = LibC::GUID.new(0xeb0cb9e8_u32, 0x7996_u16, 0x11d2_u16, StaticArray[0x87_u8, 0x2e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x8_u8, 0x8_u8, 0x59_u8])
  struct IReleaseMarshalBuffers
    lpVtbl : IReleaseMarshalBuffersVTbl*
  end

  struct IWaitMultipleVTbl
    query_interface : Proc(IWaitMultiple*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWaitMultiple*, UInt32)
    release : Proc(IWaitMultiple*, UInt32)
    wait_multiple : Proc(IWaitMultiple*, UInt32, ISynchronize*, HRESULT)
    add_synchronize : Proc(IWaitMultiple*, ISynchronize, HRESULT)
  end

  IWaitMultiple_GUID = "0000002b-0000-0000-c000-000000000046"
  IID_IWaitMultiple = LibC::GUID.new(0x2b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IWaitMultiple
    lpVtbl : IWaitMultipleVTbl*
  end

  struct IAddrTrackingControlVTbl
    query_interface : Proc(IAddrTrackingControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAddrTrackingControl*, UInt32)
    release : Proc(IAddrTrackingControl*, UInt32)
    enable_com_dynamic_addr_tracking : Proc(IAddrTrackingControl*, HRESULT)
    disable_com_dynamic_addr_tracking : Proc(IAddrTrackingControl*, HRESULT)
  end

  IAddrTrackingControl_GUID = "00000147-0000-0000-c000-000000000046"
  IID_IAddrTrackingControl = LibC::GUID.new(0x147_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAddrTrackingControl
    lpVtbl : IAddrTrackingControlVTbl*
  end

  struct IAddrExclusionControlVTbl
    query_interface : Proc(IAddrExclusionControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAddrExclusionControl*, UInt32)
    release : Proc(IAddrExclusionControl*, UInt32)
    get_current_addr_exclusion_list : Proc(IAddrExclusionControl*, Guid*, Void**, HRESULT)
    update_addr_exclusion_list : Proc(IAddrExclusionControl*, IUnknown, HRESULT)
  end

  IAddrExclusionControl_GUID = "00000148-0000-0000-c000-000000000046"
  IID_IAddrExclusionControl = LibC::GUID.new(0x148_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAddrExclusionControl
    lpVtbl : IAddrExclusionControlVTbl*
  end

  struct IPipeByteVTbl
    query_interface : Proc(IPipeByte*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPipeByte*, UInt32)
    release : Proc(IPipeByte*, UInt32)
    pull : Proc(IPipeByte*, UInt8*, UInt32, UInt32*, HRESULT)
    push : Proc(IPipeByte*, UInt8*, UInt32, HRESULT)
  end

  IPipeByte_GUID = "db2f3aca-2f86-11d1-8e04-00c04fb9989a"
  IID_IPipeByte = LibC::GUID.new(0xdb2f3aca_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct IPipeByte
    lpVtbl : IPipeByteVTbl*
  end

  struct AsyncIPipeByteVTbl
    query_interface : Proc(AsyncIPipeByte*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIPipeByte*, UInt32)
    release : Proc(AsyncIPipeByte*, UInt32)
    begin_pull : Proc(AsyncIPipeByte*, UInt32, HRESULT)
    finish_pull : Proc(AsyncIPipeByte*, UInt8*, UInt32*, HRESULT)
    begin_push : Proc(AsyncIPipeByte*, UInt8*, UInt32, HRESULT)
    finish_push : Proc(AsyncIPipeByte*, HRESULT)
  end

  AsyncIPipeByte_GUID = "db2f3acb-2f86-11d1-8e04-00c04fb9989a"
  IID_AsyncIPipeByte = LibC::GUID.new(0xdb2f3acb_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct AsyncIPipeByte
    lpVtbl : AsyncIPipeByteVTbl*
  end

  struct IPipeLongVTbl
    query_interface : Proc(IPipeLong*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPipeLong*, UInt32)
    release : Proc(IPipeLong*, UInt32)
    pull : Proc(IPipeLong*, Int32*, UInt32, UInt32*, HRESULT)
    push : Proc(IPipeLong*, Int32*, UInt32, HRESULT)
  end

  IPipeLong_GUID = "db2f3acc-2f86-11d1-8e04-00c04fb9989a"
  IID_IPipeLong = LibC::GUID.new(0xdb2f3acc_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct IPipeLong
    lpVtbl : IPipeLongVTbl*
  end

  struct AsyncIPipeLongVTbl
    query_interface : Proc(AsyncIPipeLong*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIPipeLong*, UInt32)
    release : Proc(AsyncIPipeLong*, UInt32)
    begin_pull : Proc(AsyncIPipeLong*, UInt32, HRESULT)
    finish_pull : Proc(AsyncIPipeLong*, Int32*, UInt32*, HRESULT)
    begin_push : Proc(AsyncIPipeLong*, Int32*, UInt32, HRESULT)
    finish_push : Proc(AsyncIPipeLong*, HRESULT)
  end

  AsyncIPipeLong_GUID = "db2f3acd-2f86-11d1-8e04-00c04fb9989a"
  IID_AsyncIPipeLong = LibC::GUID.new(0xdb2f3acd_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct AsyncIPipeLong
    lpVtbl : AsyncIPipeLongVTbl*
  end

  struct IPipeDoubleVTbl
    query_interface : Proc(IPipeDouble*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPipeDouble*, UInt32)
    release : Proc(IPipeDouble*, UInt32)
    pull : Proc(IPipeDouble*, Float64*, UInt32, UInt32*, HRESULT)
    push : Proc(IPipeDouble*, Float64*, UInt32, HRESULT)
  end

  IPipeDouble_GUID = "db2f3ace-2f86-11d1-8e04-00c04fb9989a"
  IID_IPipeDouble = LibC::GUID.new(0xdb2f3ace_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct IPipeDouble
    lpVtbl : IPipeDoubleVTbl*
  end

  struct AsyncIPipeDoubleVTbl
    query_interface : Proc(AsyncIPipeDouble*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIPipeDouble*, UInt32)
    release : Proc(AsyncIPipeDouble*, UInt32)
    begin_pull : Proc(AsyncIPipeDouble*, UInt32, HRESULT)
    finish_pull : Proc(AsyncIPipeDouble*, Float64*, UInt32*, HRESULT)
    begin_push : Proc(AsyncIPipeDouble*, Float64*, UInt32, HRESULT)
    finish_push : Proc(AsyncIPipeDouble*, HRESULT)
  end

  AsyncIPipeDouble_GUID = "db2f3acf-2f86-11d1-8e04-00c04fb9989a"
  IID_AsyncIPipeDouble = LibC::GUID.new(0xdb2f3acf_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct AsyncIPipeDouble
    lpVtbl : AsyncIPipeDoubleVTbl*
  end

  struct IComThreadingInfoVTbl
    query_interface : Proc(IComThreadingInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComThreadingInfo*, UInt32)
    release : Proc(IComThreadingInfo*, UInt32)
    get_current_apartment_type : Proc(IComThreadingInfo*, APTTYPE*, HRESULT)
    get_current_thread_type : Proc(IComThreadingInfo*, THDTYPE*, HRESULT)
    get_current_logical_thread_id : Proc(IComThreadingInfo*, Guid*, HRESULT)
    set_current_logical_thread_id : Proc(IComThreadingInfo*, Guid*, HRESULT)
  end

  IComThreadingInfo_GUID = "000001ce-0000-0000-c000-000000000046"
  IID_IComThreadingInfo = LibC::GUID.new(0x1ce_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IComThreadingInfo
    lpVtbl : IComThreadingInfoVTbl*
  end

  struct IProcessInitControlVTbl
    query_interface : Proc(IProcessInitControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProcessInitControl*, UInt32)
    release : Proc(IProcessInitControl*, UInt32)
    reset_initializer_timeout : Proc(IProcessInitControl*, UInt32, HRESULT)
  end

  IProcessInitControl_GUID = "72380d55-8d2b-43a3-8513-2b6ef31434e9"
  IID_IProcessInitControl = LibC::GUID.new(0x72380d55_u32, 0x8d2b_u16, 0x43a3_u16, StaticArray[0x85_u8, 0x13_u8, 0x2b_u8, 0x6e_u8, 0xf3_u8, 0x14_u8, 0x34_u8, 0xe9_u8])
  struct IProcessInitControl
    lpVtbl : IProcessInitControlVTbl*
  end

  struct IFastRundownVTbl
    query_interface : Proc(IFastRundown*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFastRundown*, UInt32)
    release : Proc(IFastRundown*, UInt32)
  end

  IFastRundown_GUID = "00000040-0000-0000-c000-000000000046"
  IID_IFastRundown = LibC::GUID.new(0x40_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IFastRundown
    lpVtbl : IFastRundownVTbl*
  end

  struct IMachineGlobalObjectTableVTbl
    query_interface : Proc(IMachineGlobalObjectTable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMachineGlobalObjectTable*, UInt32)
    release : Proc(IMachineGlobalObjectTable*, UInt32)
    register_object : Proc(IMachineGlobalObjectTable*, Guid*, LibC::LPWSTR, IUnknown, MachineGlobalObjectTableRegistrationToken__**, HRESULT)
    get_object : Proc(IMachineGlobalObjectTable*, Guid*, LibC::LPWSTR, Guid*, Void**, HRESULT)
    revoke_object : Proc(IMachineGlobalObjectTable*, MachineGlobalObjectTableRegistrationToken__*, HRESULT)
  end

  IMachineGlobalObjectTable_GUID = "26d709ac-f70b-4421-a96f-d2878fafb00d"
  IID_IMachineGlobalObjectTable = LibC::GUID.new(0x26d709ac_u32, 0xf70b_u16, 0x4421_u16, StaticArray[0xa9_u8, 0x6f_u8, 0xd2_u8, 0x87_u8, 0x8f_u8, 0xaf_u8, 0xb0_u8, 0xd_u8])
  struct IMachineGlobalObjectTable
    lpVtbl : IMachineGlobalObjectTableVTbl*
  end

  struct IMallocSpyVTbl
    query_interface : Proc(IMallocSpy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMallocSpy*, UInt32)
    release : Proc(IMallocSpy*, UInt32)
    pre_alloc : Proc(IMallocSpy*, LibC::UINT_PTR, LibC::UINT_PTR)
    post_alloc : Proc(IMallocSpy*, Void*, Void**)
    pre_free : Proc(IMallocSpy*, Void*, LibC::BOOL, Void**)
    post_free : Proc(IMallocSpy*, LibC::BOOL, Void)
    pre_realloc : Proc(IMallocSpy*, Void*, LibC::UINT_PTR, Void**, LibC::BOOL, LibC::UINT_PTR)
    post_realloc : Proc(IMallocSpy*, Void*, LibC::BOOL, Void**)
    pre_get_size : Proc(IMallocSpy*, Void*, LibC::BOOL, Void**)
    post_get_size : Proc(IMallocSpy*, LibC::UINT_PTR, LibC::BOOL, LibC::UINT_PTR)
    pre_did_alloc : Proc(IMallocSpy*, Void*, LibC::BOOL, Void**)
    post_did_alloc : Proc(IMallocSpy*, Void*, LibC::BOOL, Int32, Int32)
    pre_heap_minimize : Proc(IMallocSpy*, Void)
    post_heap_minimize : Proc(IMallocSpy*, Void)
  end

  IMallocSpy_GUID = "0000001d-0000-0000-c000-000000000046"
  IID_IMallocSpy = LibC::GUID.new(0x1d_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMallocSpy
    lpVtbl : IMallocSpyVTbl*
  end

  struct IBindCtxVTbl
    query_interface : Proc(IBindCtx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBindCtx*, UInt32)
    release : Proc(IBindCtx*, UInt32)
    register_object_bound : Proc(IBindCtx*, IUnknown, HRESULT)
    revoke_object_bound : Proc(IBindCtx*, IUnknown, HRESULT)
    release_bound_objects : Proc(IBindCtx*, HRESULT)
    set_bind_options : Proc(IBindCtx*, BIND_OPTS*, HRESULT)
    get_bind_options : Proc(IBindCtx*, BIND_OPTS*, HRESULT)
    get_running_object_table : Proc(IBindCtx*, IRunningObjectTable*, HRESULT)
    register_object_param : Proc(IBindCtx*, LibC::LPWSTR, IUnknown, HRESULT)
    get_object_param : Proc(IBindCtx*, LibC::LPWSTR, IUnknown*, HRESULT)
    enum_object_param : Proc(IBindCtx*, IEnumString*, HRESULT)
    revoke_object_param : Proc(IBindCtx*, LibC::LPWSTR, HRESULT)
  end

  IBindCtx_GUID = "0000000e-0000-0000-c000-000000000046"
  IID_IBindCtx = LibC::GUID.new(0xe_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IBindCtx
    lpVtbl : IBindCtxVTbl*
  end

  struct IEnumMonikerVTbl
    query_interface : Proc(IEnumMoniker*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumMoniker*, UInt32)
    release : Proc(IEnumMoniker*, UInt32)
    next : Proc(IEnumMoniker*, UInt32, IMoniker*, UInt32*, HRESULT)
    skip : Proc(IEnumMoniker*, UInt32, HRESULT)
    reset : Proc(IEnumMoniker*, HRESULT)
    clone : Proc(IEnumMoniker*, IEnumMoniker*, HRESULT)
  end

  IEnumMoniker_GUID = "00000102-0000-0000-c000-000000000046"
  IID_IEnumMoniker = LibC::GUID.new(0x102_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumMoniker
    lpVtbl : IEnumMonikerVTbl*
  end

  struct IRunnableObjectVTbl
    query_interface : Proc(IRunnableObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRunnableObject*, UInt32)
    release : Proc(IRunnableObject*, UInt32)
    get_running_class : Proc(IRunnableObject*, Guid*, HRESULT)
    run : Proc(IRunnableObject*, IBindCtx, HRESULT)
    is_running : Proc(IRunnableObject*, LibC::BOOL)
    lock_running : Proc(IRunnableObject*, LibC::BOOL, LibC::BOOL, HRESULT)
    set_contained_object : Proc(IRunnableObject*, LibC::BOOL, HRESULT)
  end

  IRunnableObject_GUID = "00000126-0000-0000-c000-000000000046"
  IID_IRunnableObject = LibC::GUID.new(0x126_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRunnableObject
    lpVtbl : IRunnableObjectVTbl*
  end

  struct IRunningObjectTableVTbl
    query_interface : Proc(IRunningObjectTable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRunningObjectTable*, UInt32)
    release : Proc(IRunningObjectTable*, UInt32)
    register : Proc(IRunningObjectTable*, UInt32, IUnknown, IMoniker, UInt32*, HRESULT)
    revoke : Proc(IRunningObjectTable*, UInt32, HRESULT)
    is_running : Proc(IRunningObjectTable*, IMoniker, HRESULT)
    get_object : Proc(IRunningObjectTable*, IMoniker, IUnknown*, HRESULT)
    note_change_time : Proc(IRunningObjectTable*, UInt32, FILETIME*, HRESULT)
    get_time_of_last_change : Proc(IRunningObjectTable*, IMoniker, FILETIME*, HRESULT)
    enum_running : Proc(IRunningObjectTable*, IEnumMoniker*, HRESULT)
  end

  IRunningObjectTable_GUID = "00000010-0000-0000-c000-000000000046"
  IID_IRunningObjectTable = LibC::GUID.new(0x10_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRunningObjectTable
    lpVtbl : IRunningObjectTableVTbl*
  end

  struct IPersistVTbl
    query_interface : Proc(IPersist*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPersist*, UInt32)
    release : Proc(IPersist*, UInt32)
    get_class_id : Proc(IPersist*, Guid*, HRESULT)
  end

  IPersist_GUID = "0000010c-0000-0000-c000-000000000046"
  IID_IPersist = LibC::GUID.new(0x10c_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IPersist
    lpVtbl : IPersistVTbl*
  end

  struct IPersistStreamVTbl
    query_interface : Proc(IPersistStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPersistStream*, UInt32)
    release : Proc(IPersistStream*, UInt32)
    get_class_id : Proc(IPersistStream*, Guid*, HRESULT)
    is_dirty : Proc(IPersistStream*, HRESULT)
    load : Proc(IPersistStream*, IStream, HRESULT)
    save : Proc(IPersistStream*, IStream, LibC::BOOL, HRESULT)
    get_size_max : Proc(IPersistStream*, ULARGE_INTEGER*, HRESULT)
  end

  IPersistStream_GUID = "00000109-0000-0000-c000-000000000046"
  IID_IPersistStream = LibC::GUID.new(0x109_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IPersistStream
    lpVtbl : IPersistStreamVTbl*
  end

  struct IMonikerVTbl
    query_interface : Proc(IMoniker*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMoniker*, UInt32)
    release : Proc(IMoniker*, UInt32)
    get_class_id : Proc(IMoniker*, Guid*, HRESULT)
    is_dirty : Proc(IMoniker*, HRESULT)
    load : Proc(IMoniker*, IStream, HRESULT)
    save : Proc(IMoniker*, IStream, LibC::BOOL, HRESULT)
    get_size_max : Proc(IMoniker*, ULARGE_INTEGER*, HRESULT)
    bind_to_object : Proc(IMoniker*, IBindCtx, IMoniker, Guid*, Void**, HRESULT)
    bind_to_storage : Proc(IMoniker*, IBindCtx, IMoniker, Guid*, Void**, HRESULT)
    reduce : Proc(IMoniker*, IBindCtx, UInt32, IMoniker*, IMoniker*, HRESULT)
    compose_with : Proc(IMoniker*, IMoniker, LibC::BOOL, IMoniker*, HRESULT)
    enum : Proc(IMoniker*, LibC::BOOL, IEnumMoniker*, HRESULT)
    is_equal : Proc(IMoniker*, IMoniker, HRESULT)
    hash : Proc(IMoniker*, UInt32*, HRESULT)
    is_running : Proc(IMoniker*, IBindCtx, IMoniker, IMoniker, HRESULT)
    get_time_of_last_change : Proc(IMoniker*, IBindCtx, IMoniker, FILETIME*, HRESULT)
    inverse : Proc(IMoniker*, IMoniker*, HRESULT)
    common_prefix_with : Proc(IMoniker*, IMoniker, IMoniker*, HRESULT)
    relative_path_to : Proc(IMoniker*, IMoniker, IMoniker*, HRESULT)
    get_display_name : Proc(IMoniker*, IBindCtx, IMoniker, LibC::LPWSTR*, HRESULT)
    parse_display_name : Proc(IMoniker*, IBindCtx, IMoniker, LibC::LPWSTR, UInt32*, IMoniker*, HRESULT)
    is_system_moniker : Proc(IMoniker*, UInt32*, HRESULT)
  end

  IMoniker_GUID = "0000000f-0000-0000-c000-000000000046"
  IID_IMoniker = LibC::GUID.new(0xf_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMoniker
    lpVtbl : IMonikerVTbl*
  end

  struct IROTDataVTbl
    query_interface : Proc(IROTData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IROTData*, UInt32)
    release : Proc(IROTData*, UInt32)
    get_comparison_data : Proc(IROTData*, UInt8*, UInt32, UInt32*, HRESULT)
  end

  IROTData_GUID = "f29f6bc0-5021-11ce-aa15-00006901293f"
  IID_IROTData = LibC::GUID.new(0xf29f6bc0_u32, 0x5021_u16, 0x11ce_u16, StaticArray[0xaa_u8, 0x15_u8, 0x0_u8, 0x0_u8, 0x69_u8, 0x1_u8, 0x29_u8, 0x3f_u8])
  struct IROTData
    lpVtbl : IROTDataVTbl*
  end

  struct IPersistFileVTbl
    query_interface : Proc(IPersistFile*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPersistFile*, UInt32)
    release : Proc(IPersistFile*, UInt32)
    get_class_id : Proc(IPersistFile*, Guid*, HRESULT)
    is_dirty : Proc(IPersistFile*, HRESULT)
    load : Proc(IPersistFile*, LibC::LPWSTR, UInt32, HRESULT)
    save : Proc(IPersistFile*, LibC::LPWSTR, LibC::BOOL, HRESULT)
    save_completed : Proc(IPersistFile*, LibC::LPWSTR, HRESULT)
    get_cur_file : Proc(IPersistFile*, LibC::LPWSTR*, HRESULT)
  end

  IPersistFile_GUID = "0000010b-0000-0000-c000-000000000046"
  IID_IPersistFile = LibC::GUID.new(0x10b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IPersistFile
    lpVtbl : IPersistFileVTbl*
  end

  struct IEnumFORMATETCVTbl
    query_interface : Proc(IEnumFORMATETC*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumFORMATETC*, UInt32)
    release : Proc(IEnumFORMATETC*, UInt32)
    next : Proc(IEnumFORMATETC*, UInt32, FORMATETC*, UInt32*, HRESULT)
    skip : Proc(IEnumFORMATETC*, UInt32, HRESULT)
    reset : Proc(IEnumFORMATETC*, HRESULT)
    clone : Proc(IEnumFORMATETC*, IEnumFORMATETC*, HRESULT)
  end

  IEnumFORMATETC_GUID = "00000103-0000-0000-c000-000000000046"
  IID_IEnumFORMATETC = LibC::GUID.new(0x103_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumFORMATETC
    lpVtbl : IEnumFORMATETCVTbl*
  end

  struct IEnumSTATDATAVTbl
    query_interface : Proc(IEnumSTATDATA*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSTATDATA*, UInt32)
    release : Proc(IEnumSTATDATA*, UInt32)
    next : Proc(IEnumSTATDATA*, UInt32, STATDATA*, UInt32*, HRESULT)
    skip : Proc(IEnumSTATDATA*, UInt32, HRESULT)
    reset : Proc(IEnumSTATDATA*, HRESULT)
    clone : Proc(IEnumSTATDATA*, IEnumSTATDATA*, HRESULT)
  end

  IEnumSTATDATA_GUID = "00000105-0000-0000-c000-000000000046"
  IID_IEnumSTATDATA = LibC::GUID.new(0x105_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumSTATDATA
    lpVtbl : IEnumSTATDATAVTbl*
  end

  struct IAdviseSinkVTbl
    query_interface : Proc(IAdviseSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAdviseSink*, UInt32)
    release : Proc(IAdviseSink*, UInt32)
    on_data_change : Proc(IAdviseSink*, FORMATETC*, STGMEDIUM*, Void)
    on_view_change : Proc(IAdviseSink*, UInt32, Int32, Void)
    on_rename : Proc(IAdviseSink*, IMoniker, Void)
    on_save : Proc(IAdviseSink*, Void)
    on_close : Proc(IAdviseSink*, Void)
  end

  IAdviseSink_GUID = "0000010f-0000-0000-c000-000000000046"
  IID_IAdviseSink = LibC::GUID.new(0x10f_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAdviseSink
    lpVtbl : IAdviseSinkVTbl*
  end

  struct AsyncIAdviseSinkVTbl
    query_interface : Proc(AsyncIAdviseSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIAdviseSink*, UInt32)
    release : Proc(AsyncIAdviseSink*, UInt32)
    begin_on_data_change : Proc(AsyncIAdviseSink*, FORMATETC*, STGMEDIUM*, Void)
    finish_on_data_change : Proc(AsyncIAdviseSink*, Void)
    begin_on_view_change : Proc(AsyncIAdviseSink*, UInt32, Int32, Void)
    finish_on_view_change : Proc(AsyncIAdviseSink*, Void)
    begin_on_rename : Proc(AsyncIAdviseSink*, IMoniker, Void)
    finish_on_rename : Proc(AsyncIAdviseSink*, Void)
    begin_on_save : Proc(AsyncIAdviseSink*, Void)
    finish_on_save : Proc(AsyncIAdviseSink*, Void)
    begin_on_close : Proc(AsyncIAdviseSink*, Void)
    finish_on_close : Proc(AsyncIAdviseSink*, Void)
  end

  AsyncIAdviseSink_GUID = "00000150-0000-0000-c000-000000000046"
  IID_AsyncIAdviseSink = LibC::GUID.new(0x150_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct AsyncIAdviseSink
    lpVtbl : AsyncIAdviseSinkVTbl*
  end

  struct IAdviseSink2VTbl
    query_interface : Proc(IAdviseSink2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAdviseSink2*, UInt32)
    release : Proc(IAdviseSink2*, UInt32)
    on_data_change : Proc(IAdviseSink2*, FORMATETC*, STGMEDIUM*, Void)
    on_view_change : Proc(IAdviseSink2*, UInt32, Int32, Void)
    on_rename : Proc(IAdviseSink2*, IMoniker, Void)
    on_save : Proc(IAdviseSink2*, Void)
    on_close : Proc(IAdviseSink2*, Void)
    on_link_src_change : Proc(IAdviseSink2*, IMoniker, Void)
  end

  IAdviseSink2_GUID = "00000125-0000-0000-c000-000000000046"
  IID_IAdviseSink2 = LibC::GUID.new(0x125_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAdviseSink2
    lpVtbl : IAdviseSink2VTbl*
  end

  struct AsyncIAdviseSink2VTbl
    query_interface : Proc(AsyncIAdviseSink2*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIAdviseSink2*, UInt32)
    release : Proc(AsyncIAdviseSink2*, UInt32)
    begin_on_data_change : Proc(AsyncIAdviseSink2*, FORMATETC*, STGMEDIUM*, Void)
    finish_on_data_change : Proc(AsyncIAdviseSink2*, Void)
    begin_on_view_change : Proc(AsyncIAdviseSink2*, UInt32, Int32, Void)
    finish_on_view_change : Proc(AsyncIAdviseSink2*, Void)
    begin_on_rename : Proc(AsyncIAdviseSink2*, IMoniker, Void)
    finish_on_rename : Proc(AsyncIAdviseSink2*, Void)
    begin_on_save : Proc(AsyncIAdviseSink2*, Void)
    finish_on_save : Proc(AsyncIAdviseSink2*, Void)
    begin_on_close : Proc(AsyncIAdviseSink2*, Void)
    finish_on_close : Proc(AsyncIAdviseSink2*, Void)
    begin_on_link_src_change : Proc(AsyncIAdviseSink2*, IMoniker, Void)
    finish_on_link_src_change : Proc(AsyncIAdviseSink2*, Void)
  end

  AsyncIAdviseSink2_GUID = "00000151-0000-0000-c000-000000000046"
  IID_AsyncIAdviseSink2 = LibC::GUID.new(0x151_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct AsyncIAdviseSink2
    lpVtbl : AsyncIAdviseSink2VTbl*
  end

  struct IDataObjectVTbl
    query_interface : Proc(IDataObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDataObject*, UInt32)
    release : Proc(IDataObject*, UInt32)
    get_data : Proc(IDataObject*, FORMATETC*, STGMEDIUM*, HRESULT)
    get_data_here : Proc(IDataObject*, FORMATETC*, STGMEDIUM*, HRESULT)
    query_get_data : Proc(IDataObject*, FORMATETC*, HRESULT)
    get_canonical_format_etc : Proc(IDataObject*, FORMATETC*, FORMATETC*, HRESULT)
    set_data : Proc(IDataObject*, FORMATETC*, STGMEDIUM*, LibC::BOOL, HRESULT)
    enum_format_etc : Proc(IDataObject*, UInt32, IEnumFORMATETC*, HRESULT)
    d_advise : Proc(IDataObject*, FORMATETC*, UInt32, IAdviseSink, UInt32*, HRESULT)
    d_unadvise : Proc(IDataObject*, UInt32, HRESULT)
    enum_d_advise : Proc(IDataObject*, IEnumSTATDATA*, HRESULT)
  end

  IDataObject_GUID = "0000010e-0000-0000-c000-000000000046"
  IID_IDataObject = LibC::GUID.new(0x10e_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IDataObject
    lpVtbl : IDataObjectVTbl*
  end

  struct IDataAdviseHolderVTbl
    query_interface : Proc(IDataAdviseHolder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDataAdviseHolder*, UInt32)
    release : Proc(IDataAdviseHolder*, UInt32)
    advise : Proc(IDataAdviseHolder*, IDataObject, FORMATETC*, UInt32, IAdviseSink, UInt32*, HRESULT)
    unadvise : Proc(IDataAdviseHolder*, UInt32, HRESULT)
    enum_advise : Proc(IDataAdviseHolder*, IEnumSTATDATA*, HRESULT)
    send_on_data_change : Proc(IDataAdviseHolder*, IDataObject, UInt32, UInt32, HRESULT)
  end

  IDataAdviseHolder_GUID = "00000110-0000-0000-c000-000000000046"
  IID_IDataAdviseHolder = LibC::GUID.new(0x110_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IDataAdviseHolder
    lpVtbl : IDataAdviseHolderVTbl*
  end

  struct IClassActivatorVTbl
    query_interface : Proc(IClassActivator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IClassActivator*, UInt32)
    release : Proc(IClassActivator*, UInt32)
    get_class_object : Proc(IClassActivator*, Guid*, UInt32, UInt32, Guid*, Void**, HRESULT)
  end

  IClassActivator_GUID = "00000140-0000-0000-c000-000000000046"
  IID_IClassActivator = LibC::GUID.new(0x140_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IClassActivator
    lpVtbl : IClassActivatorVTbl*
  end

  struct IProgressNotifyVTbl
    query_interface : Proc(IProgressNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProgressNotify*, UInt32)
    release : Proc(IProgressNotify*, UInt32)
    on_progress : Proc(IProgressNotify*, UInt32, UInt32, LibC::BOOL, LibC::BOOL, HRESULT)
  end

  IProgressNotify_GUID = "a9d758a0-4617-11cf-95fc-00aa00680db4"
  IID_IProgressNotify = LibC::GUID.new(0xa9d758a0_u32, 0x4617_u16, 0x11cf_u16, StaticArray[0x95_u8, 0xfc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0xd_u8, 0xb4_u8])
  struct IProgressNotify
    lpVtbl : IProgressNotifyVTbl*
  end

  struct IBlockingLockVTbl
    query_interface : Proc(IBlockingLock*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBlockingLock*, UInt32)
    release : Proc(IBlockingLock*, UInt32)
    lock : Proc(IBlockingLock*, UInt32, HRESULT)
    unlock : Proc(IBlockingLock*, HRESULT)
  end

  IBlockingLock_GUID = "30f3d47a-6447-11d1-8e3c-00c04fb9386d"
  IID_IBlockingLock = LibC::GUID.new(0x30f3d47a_u32, 0x6447_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x3c_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x38_u8, 0x6d_u8])
  struct IBlockingLock
    lpVtbl : IBlockingLockVTbl*
  end

  struct ITimeAndNoticeControlVTbl
    query_interface : Proc(ITimeAndNoticeControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITimeAndNoticeControl*, UInt32)
    release : Proc(ITimeAndNoticeControl*, UInt32)
    suppress_changes : Proc(ITimeAndNoticeControl*, UInt32, UInt32, HRESULT)
  end

  ITimeAndNoticeControl_GUID = "bc0bf6ae-8878-11d1-83e9-00c04fc2c6d4"
  IID_ITimeAndNoticeControl = LibC::GUID.new(0xbc0bf6ae_u32, 0x8878_u16, 0x11d1_u16, StaticArray[0x83_u8, 0xe9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xc6_u8, 0xd4_u8])
  struct ITimeAndNoticeControl
    lpVtbl : ITimeAndNoticeControlVTbl*
  end

  struct IOplockStorageVTbl
    query_interface : Proc(IOplockStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOplockStorage*, UInt32)
    release : Proc(IOplockStorage*, UInt32)
    create_storage_ex : Proc(IOplockStorage*, LibC::LPWSTR, UInt32, UInt32, UInt32, Guid*, Void**, HRESULT)
    open_storage_ex : Proc(IOplockStorage*, LibC::LPWSTR, UInt32, UInt32, UInt32, Guid*, Void**, HRESULT)
  end

  IOplockStorage_GUID = "8d19c834-8879-11d1-83e9-00c04fc2c6d4"
  IID_IOplockStorage = LibC::GUID.new(0x8d19c834_u32, 0x8879_u16, 0x11d1_u16, StaticArray[0x83_u8, 0xe9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xc6_u8, 0xd4_u8])
  struct IOplockStorage
    lpVtbl : IOplockStorageVTbl*
  end

  struct IUrlMonVTbl
    query_interface : Proc(IUrlMon*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUrlMon*, UInt32)
    release : Proc(IUrlMon*, UInt32)
    async_get_class_bits : Proc(IUrlMon*, Guid*, LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt32, LibC::LPWSTR, IBindCtx, UInt32, Guid*, UInt32, HRESULT)
  end

  IUrlMon_GUID = "00000026-0000-0000-c000-000000000046"
  IID_IUrlMon = LibC::GUID.new(0x26_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IUrlMon
    lpVtbl : IUrlMonVTbl*
  end

  struct IForegroundTransferVTbl
    query_interface : Proc(IForegroundTransfer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IForegroundTransfer*, UInt32)
    release : Proc(IForegroundTransfer*, UInt32)
    allow_foreground_transfer : Proc(IForegroundTransfer*, Void*, HRESULT)
  end

  IForegroundTransfer_GUID = "00000145-0000-0000-c000-000000000046"
  IID_IForegroundTransfer = LibC::GUID.new(0x145_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IForegroundTransfer
    lpVtbl : IForegroundTransferVTbl*
  end

  struct IProcessLockVTbl
    query_interface : Proc(IProcessLock*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProcessLock*, UInt32)
    release : Proc(IProcessLock*, UInt32)
    add_ref_on_process : Proc(IProcessLock*, UInt32)
    release_ref_on_process : Proc(IProcessLock*, UInt32)
  end

  IProcessLock_GUID = "000001d5-0000-0000-c000-000000000046"
  IID_IProcessLock = LibC::GUID.new(0x1d5_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IProcessLock
    lpVtbl : IProcessLockVTbl*
  end

  struct ISurrogateServiceVTbl
    query_interface : Proc(ISurrogateService*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISurrogateService*, UInt32)
    release : Proc(ISurrogateService*, UInt32)
    init : Proc(ISurrogateService*, Guid*, IProcessLock, LibC::BOOL*, HRESULT)
    application_launch : Proc(ISurrogateService*, Guid*, ApplicationType, HRESULT)
    application_free : Proc(ISurrogateService*, Guid*, HRESULT)
    catalog_refresh : Proc(ISurrogateService*, UInt32, HRESULT)
    process_shutdown : Proc(ISurrogateService*, ShutdownType, HRESULT)
  end

  ISurrogateService_GUID = "000001d4-0000-0000-c000-000000000046"
  IID_ISurrogateService = LibC::GUID.new(0x1d4_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISurrogateService
    lpVtbl : ISurrogateServiceVTbl*
  end

  struct IInitializeSpyVTbl
    query_interface : Proc(IInitializeSpy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInitializeSpy*, UInt32)
    release : Proc(IInitializeSpy*, UInt32)
    pre_initialize : Proc(IInitializeSpy*, UInt32, UInt32, HRESULT)
    post_initialize : Proc(IInitializeSpy*, HRESULT, UInt32, UInt32, HRESULT)
    pre_uninitialize : Proc(IInitializeSpy*, UInt32, HRESULT)
    post_uninitialize : Proc(IInitializeSpy*, UInt32, HRESULT)
  end

  IInitializeSpy_GUID = "00000034-0000-0000-c000-000000000046"
  IID_IInitializeSpy = LibC::GUID.new(0x34_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IInitializeSpy
    lpVtbl : IInitializeSpyVTbl*
  end

  struct IServiceProviderVTbl
    query_interface : Proc(IServiceProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceProvider*, UInt32)
    release : Proc(IServiceProvider*, UInt32)
    query_service : Proc(IServiceProvider*, Guid*, Guid*, Void**, HRESULT)
  end

  IServiceProvider_GUID = "6d5140c1-7436-11ce-8034-00aa006009fa"
  IID_IServiceProvider = LibC::GUID.new(0x6d5140c1_u32, 0x7436_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x34_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0x9_u8, 0xfa_u8])
  struct IServiceProvider
    lpVtbl : IServiceProviderVTbl*
  end

  struct IEnumGUIDVTbl
    query_interface : Proc(IEnumGUID*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumGUID*, UInt32)
    release : Proc(IEnumGUID*, UInt32)
    next : Proc(IEnumGUID*, UInt32, Guid*, UInt32*, HRESULT)
    skip : Proc(IEnumGUID*, UInt32, HRESULT)
    reset : Proc(IEnumGUID*, HRESULT)
    clone : Proc(IEnumGUID*, IEnumGUID*, HRESULT)
  end

  IEnumGUID_GUID = "0002e000-0000-0000-c000-000000000046"
  IID_IEnumGUID = LibC::GUID.new(0x2e000_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumGUID
    lpVtbl : IEnumGUIDVTbl*
  end

  struct IEnumCATEGORYINFOVTbl
    query_interface : Proc(IEnumCATEGORYINFO*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumCATEGORYINFO*, UInt32)
    release : Proc(IEnumCATEGORYINFO*, UInt32)
    next : Proc(IEnumCATEGORYINFO*, UInt32, CATEGORYINFO*, UInt32*, HRESULT)
    skip : Proc(IEnumCATEGORYINFO*, UInt32, HRESULT)
    reset : Proc(IEnumCATEGORYINFO*, HRESULT)
    clone : Proc(IEnumCATEGORYINFO*, IEnumCATEGORYINFO*, HRESULT)
  end

  IEnumCATEGORYINFO_GUID = "0002e011-0000-0000-c000-000000000046"
  IID_IEnumCATEGORYINFO = LibC::GUID.new(0x2e011_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumCATEGORYINFO
    lpVtbl : IEnumCATEGORYINFOVTbl*
  end

  struct ICatRegisterVTbl
    query_interface : Proc(ICatRegister*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICatRegister*, UInt32)
    release : Proc(ICatRegister*, UInt32)
    register_categories : Proc(ICatRegister*, UInt32, CATEGORYINFO*, HRESULT)
    un_register_categories : Proc(ICatRegister*, UInt32, Guid*, HRESULT)
    register_class_impl_categories : Proc(ICatRegister*, Guid*, UInt32, Guid*, HRESULT)
    un_register_class_impl_categories : Proc(ICatRegister*, Guid*, UInt32, Guid*, HRESULT)
    register_class_req_categories : Proc(ICatRegister*, Guid*, UInt32, Guid*, HRESULT)
    un_register_class_req_categories : Proc(ICatRegister*, Guid*, UInt32, Guid*, HRESULT)
  end

  ICatRegister_GUID = "0002e012-0000-0000-c000-000000000046"
  IID_ICatRegister = LibC::GUID.new(0x2e012_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ICatRegister
    lpVtbl : ICatRegisterVTbl*
  end

  struct ICatInformationVTbl
    query_interface : Proc(ICatInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICatInformation*, UInt32)
    release : Proc(ICatInformation*, UInt32)
    enum_categories : Proc(ICatInformation*, UInt32, IEnumCATEGORYINFO*, HRESULT)
    get_category_desc : Proc(ICatInformation*, Guid*, UInt32, LibC::LPWSTR*, HRESULT)
    enum_classes_of_categories : Proc(ICatInformation*, UInt32, Guid*, UInt32, Guid*, IEnumGUID*, HRESULT)
    is_class_of_categories : Proc(ICatInformation*, Guid*, UInt32, Guid*, UInt32, Guid*, HRESULT)
    enum_impl_categories_of_class : Proc(ICatInformation*, Guid*, IEnumGUID*, HRESULT)
    enum_req_categories_of_class : Proc(ICatInformation*, Guid*, IEnumGUID*, HRESULT)
  end

  ICatInformation_GUID = "0002e013-0000-0000-c000-000000000046"
  IID_ICatInformation = LibC::GUID.new(0x2e013_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ICatInformation
    lpVtbl : ICatInformationVTbl*
  end

  struct IContextCallbackVTbl
    query_interface : Proc(IContextCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContextCallback*, UInt32)
    release : Proc(IContextCallback*, UInt32)
    context_callback : Proc(IContextCallback*, PFNCONTEXTCALL, ComCallData*, Guid*, Int32, IUnknown, HRESULT)
  end

  IContextCallback_GUID = "000001da-0000-0000-c000-000000000046"
  IID_IContextCallback = LibC::GUID.new(0x1da_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IContextCallback
    lpVtbl : IContextCallbackVTbl*
  end

  struct IBindingVTbl
    query_interface : Proc(IBinding*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBinding*, UInt32)
    release : Proc(IBinding*, UInt32)
    abort : Proc(IBinding*, HRESULT)
    suspend : Proc(IBinding*, HRESULT)
    resume : Proc(IBinding*, HRESULT)
    set_priority : Proc(IBinding*, Int32, HRESULT)
    get_priority : Proc(IBinding*, Int32*, HRESULT)
    get_bind_result : Proc(IBinding*, Guid*, UInt32*, LibC::LPWSTR*, UInt32*, HRESULT)
  end

  IBinding_GUID = "79eac9c0-baf9-11ce-8c82-00aa004ba90b"
  IID_IBinding = LibC::GUID.new(0x79eac9c0_u32, 0xbaf9_u16, 0x11ce_u16, StaticArray[0x8c_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xa9_u8, 0xb_u8])
  struct IBinding
    lpVtbl : IBindingVTbl*
  end

  struct IBindStatusCallbackVTbl
    query_interface : Proc(IBindStatusCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBindStatusCallback*, UInt32)
    release : Proc(IBindStatusCallback*, UInt32)
    on_start_binding : Proc(IBindStatusCallback*, UInt32, IBinding, HRESULT)
    get_priority : Proc(IBindStatusCallback*, Int32*, HRESULT)
    on_low_resource : Proc(IBindStatusCallback*, UInt32, HRESULT)
    on_progress : Proc(IBindStatusCallback*, UInt32, UInt32, UInt32, LibC::LPWSTR, HRESULT)
    on_stop_binding : Proc(IBindStatusCallback*, HRESULT, LibC::LPWSTR, HRESULT)
    get_bind_info : Proc(IBindStatusCallback*, UInt32*, BINDINFO*, HRESULT)
    on_data_available : Proc(IBindStatusCallback*, UInt32, UInt32, FORMATETC*, STGMEDIUM*, HRESULT)
    on_object_available : Proc(IBindStatusCallback*, Guid*, IUnknown, HRESULT)
  end

  IBindStatusCallback_GUID = "79eac9c1-baf9-11ce-8c82-00aa004ba90b"
  IID_IBindStatusCallback = LibC::GUID.new(0x79eac9c1_u32, 0xbaf9_u16, 0x11ce_u16, StaticArray[0x8c_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xa9_u8, 0xb_u8])
  struct IBindStatusCallback
    lpVtbl : IBindStatusCallbackVTbl*
  end

  struct IBindStatusCallbackExVTbl
    query_interface : Proc(IBindStatusCallbackEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBindStatusCallbackEx*, UInt32)
    release : Proc(IBindStatusCallbackEx*, UInt32)
    on_start_binding : Proc(IBindStatusCallbackEx*, UInt32, IBinding, HRESULT)
    get_priority : Proc(IBindStatusCallbackEx*, Int32*, HRESULT)
    on_low_resource : Proc(IBindStatusCallbackEx*, UInt32, HRESULT)
    on_progress : Proc(IBindStatusCallbackEx*, UInt32, UInt32, UInt32, LibC::LPWSTR, HRESULT)
    on_stop_binding : Proc(IBindStatusCallbackEx*, HRESULT, LibC::LPWSTR, HRESULT)
    get_bind_info : Proc(IBindStatusCallbackEx*, UInt32*, BINDINFO*, HRESULT)
    on_data_available : Proc(IBindStatusCallbackEx*, UInt32, UInt32, FORMATETC*, STGMEDIUM*, HRESULT)
    on_object_available : Proc(IBindStatusCallbackEx*, Guid*, IUnknown, HRESULT)
    get_bind_info_ex : Proc(IBindStatusCallbackEx*, UInt32*, BINDINFO*, UInt32*, UInt32*, HRESULT)
  end

  IBindStatusCallbackEx_GUID = "aaa74ef9-8ee7-4659-88d9-f8c504da73cc"
  IID_IBindStatusCallbackEx = LibC::GUID.new(0xaaa74ef9_u32, 0x8ee7_u16, 0x4659_u16, StaticArray[0x88_u8, 0xd9_u8, 0xf8_u8, 0xc5_u8, 0x4_u8, 0xda_u8, 0x73_u8, 0xcc_u8])
  struct IBindStatusCallbackEx
    lpVtbl : IBindStatusCallbackExVTbl*
  end

  struct IAuthenticateVTbl
    query_interface : Proc(IAuthenticate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAuthenticate*, UInt32)
    release : Proc(IAuthenticate*, UInt32)
    authenticate : Proc(IAuthenticate*, HANDLE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
  end

  IAuthenticate_GUID = "79eac9d0-baf9-11ce-8c82-00aa004ba90b"
  IID_IAuthenticate = LibC::GUID.new(0x79eac9d0_u32, 0xbaf9_u16, 0x11ce_u16, StaticArray[0x8c_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xa9_u8, 0xb_u8])
  struct IAuthenticate
    lpVtbl : IAuthenticateVTbl*
  end

  struct IAuthenticateExVTbl
    query_interface : Proc(IAuthenticateEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAuthenticateEx*, UInt32)
    release : Proc(IAuthenticateEx*, UInt32)
    authenticate : Proc(IAuthenticateEx*, HANDLE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    authenticate_ex : Proc(IAuthenticateEx*, HANDLE*, LibC::LPWSTR*, LibC::LPWSTR*, AUTHENTICATEINFO*, HRESULT)
  end

  IAuthenticateEx_GUID = "2ad1edaf-d83d-48b5-9adf-03dbe19f53bd"
  IID_IAuthenticateEx = LibC::GUID.new(0x2ad1edaf_u32, 0xd83d_u16, 0x48b5_u16, StaticArray[0x9a_u8, 0xdf_u8, 0x3_u8, 0xdb_u8, 0xe1_u8, 0x9f_u8, 0x53_u8, 0xbd_u8])
  struct IAuthenticateEx
    lpVtbl : IAuthenticateExVTbl*
  end

  struct IUriVTbl
    query_interface : Proc(IUri*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUri*, UInt32)
    release : Proc(IUri*, UInt32)
    get_property_bstr : Proc(IUri*, Uri_PROPERTY, UInt8**, UInt32, HRESULT)
    get_property_length : Proc(IUri*, Uri_PROPERTY, UInt32*, UInt32, HRESULT)
    get_property_dword : Proc(IUri*, Uri_PROPERTY, UInt32*, UInt32, HRESULT)
    has_property : Proc(IUri*, Uri_PROPERTY, LibC::BOOL*, HRESULT)
    get_absolute_uri : Proc(IUri*, UInt8**, HRESULT)
    get_authority : Proc(IUri*, UInt8**, HRESULT)
    get_display_uri : Proc(IUri*, UInt8**, HRESULT)
    get_domain : Proc(IUri*, UInt8**, HRESULT)
    get_extension : Proc(IUri*, UInt8**, HRESULT)
    get_fragment : Proc(IUri*, UInt8**, HRESULT)
    get_host : Proc(IUri*, UInt8**, HRESULT)
    get_password : Proc(IUri*, UInt8**, HRESULT)
    get_path : Proc(IUri*, UInt8**, HRESULT)
    get_path_and_query : Proc(IUri*, UInt8**, HRESULT)
    get_query : Proc(IUri*, UInt8**, HRESULT)
    get_raw_uri : Proc(IUri*, UInt8**, HRESULT)
    get_scheme_name : Proc(IUri*, UInt8**, HRESULT)
    get_user_info : Proc(IUri*, UInt8**, HRESULT)
    get_user_name : Proc(IUri*, UInt8**, HRESULT)
    get_host_type : Proc(IUri*, UInt32*, HRESULT)
    get_port : Proc(IUri*, UInt32*, HRESULT)
    get_scheme : Proc(IUri*, UInt32*, HRESULT)
    get_zone : Proc(IUri*, UInt32*, HRESULT)
    get_properties : Proc(IUri*, UInt32*, HRESULT)
    is_equal : Proc(IUri*, IUri, LibC::BOOL*, HRESULT)
  end

  IUri_GUID = "a39ee748-6a27-4817-a6f2-13914bef5890"
  IID_IUri = LibC::GUID.new(0xa39ee748_u32, 0x6a27_u16, 0x4817_u16, StaticArray[0xa6_u8, 0xf2_u8, 0x13_u8, 0x91_u8, 0x4b_u8, 0xef_u8, 0x58_u8, 0x90_u8])
  struct IUri
    lpVtbl : IUriVTbl*
  end

  struct IUriBuilderVTbl
    query_interface : Proc(IUriBuilder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUriBuilder*, UInt32)
    release : Proc(IUriBuilder*, UInt32)
    create_uri_simple : Proc(IUriBuilder*, UInt32, LibC::UINT_PTR, IUri*, HRESULT)
    create_uri : Proc(IUriBuilder*, UInt32, UInt32, LibC::UINT_PTR, IUri*, HRESULT)
    create_uri_with_flags : Proc(IUriBuilder*, UInt32, UInt32, UInt32, LibC::UINT_PTR, IUri*, HRESULT)
    get_i_uri : Proc(IUriBuilder*, IUri*, HRESULT)
    set_i_uri : Proc(IUriBuilder*, IUri, HRESULT)
    get_fragment : Proc(IUriBuilder*, UInt32*, LibC::LPWSTR*, HRESULT)
    get_host : Proc(IUriBuilder*, UInt32*, LibC::LPWSTR*, HRESULT)
    get_password : Proc(IUriBuilder*, UInt32*, LibC::LPWSTR*, HRESULT)
    get_path : Proc(IUriBuilder*, UInt32*, LibC::LPWSTR*, HRESULT)
    get_port : Proc(IUriBuilder*, LibC::BOOL*, UInt32*, HRESULT)
    get_query : Proc(IUriBuilder*, UInt32*, LibC::LPWSTR*, HRESULT)
    get_scheme_name : Proc(IUriBuilder*, UInt32*, LibC::LPWSTR*, HRESULT)
    get_user_name : Proc(IUriBuilder*, UInt32*, LibC::LPWSTR*, HRESULT)
    set_fragment : Proc(IUriBuilder*, LibC::LPWSTR, HRESULT)
    set_host : Proc(IUriBuilder*, LibC::LPWSTR, HRESULT)
    set_password : Proc(IUriBuilder*, LibC::LPWSTR, HRESULT)
    set_path : Proc(IUriBuilder*, LibC::LPWSTR, HRESULT)
    set_port : Proc(IUriBuilder*, LibC::BOOL, UInt32, HRESULT)
    set_query : Proc(IUriBuilder*, LibC::LPWSTR, HRESULT)
    set_scheme_name : Proc(IUriBuilder*, LibC::LPWSTR, HRESULT)
    set_user_name : Proc(IUriBuilder*, LibC::LPWSTR, HRESULT)
    remove_properties : Proc(IUriBuilder*, UInt32, HRESULT)
    has_been_modified : Proc(IUriBuilder*, LibC::BOOL*, HRESULT)
  end

  IUriBuilder_GUID = "4221b2e1-8955-46c0-bd5b-de9897565de7"
  IID_IUriBuilder = LibC::GUID.new(0x4221b2e1_u32, 0x8955_u16, 0x46c0_u16, StaticArray[0xbd_u8, 0x5b_u8, 0xde_u8, 0x98_u8, 0x97_u8, 0x56_u8, 0x5d_u8, 0xe7_u8])
  struct IUriBuilder
    lpVtbl : IUriBuilderVTbl*
  end

  struct IBindHostVTbl
    query_interface : Proc(IBindHost*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBindHost*, UInt32)
    release : Proc(IBindHost*, UInt32)
    create_moniker : Proc(IBindHost*, LibC::LPWSTR, IBindCtx, IMoniker*, UInt32, HRESULT)
    moniker_bind_to_storage : Proc(IBindHost*, IMoniker, IBindCtx, IBindStatusCallback, Guid*, Void**, HRESULT)
    moniker_bind_to_object : Proc(IBindHost*, IMoniker, IBindCtx, IBindStatusCallback, Guid*, Void**, HRESULT)
  end

  IBindHost_GUID = "fc4801a1-2ba9-11cf-a229-00aa003d7352"
  IID_IBindHost = LibC::GUID.new(0xfc4801a1_u32, 0x2ba9_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x29_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x3d_u8, 0x73_u8, 0x52_u8])
  struct IBindHost
    lpVtbl : IBindHostVTbl*
  end

  struct IDispatchVTbl
    query_interface : Proc(IDispatch*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDispatch*, UInt32)
    release : Proc(IDispatch*, UInt32)
    get_type_info_count : Proc(IDispatch*, UInt32*, HRESULT)
    get_type_info : Proc(IDispatch*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDispatch*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDispatch*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IDispatch_GUID = "00020400-0000-0000-c000-000000000046"
  IID_IDispatch = LibC::GUID.new(0x20400_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IDispatch
    lpVtbl : IDispatchVTbl*
  end

  struct ITypeCompVTbl
    query_interface : Proc(ITypeComp*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITypeComp*, UInt32)
    release : Proc(ITypeComp*, UInt32)
    bind : Proc(ITypeComp*, LibC::LPWSTR, UInt32, UInt16, ITypeInfo*, DESCKIND*, BINDPTR*, HRESULT)
    bind_type : Proc(ITypeComp*, LibC::LPWSTR, UInt32, ITypeInfo*, ITypeComp*, HRESULT)
  end

  ITypeComp_GUID = "00020403-0000-0000-c000-000000000046"
  IID_ITypeComp = LibC::GUID.new(0x20403_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeComp
    lpVtbl : ITypeCompVTbl*
  end

  struct ITypeInfoVTbl
    query_interface : Proc(ITypeInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITypeInfo*, UInt32)
    release : Proc(ITypeInfo*, UInt32)
    get_type_attr : Proc(ITypeInfo*, TYPEATTR**, HRESULT)
    get_type_comp : Proc(ITypeInfo*, ITypeComp*, HRESULT)
    get_func_desc : Proc(ITypeInfo*, UInt32, FUNCDESC**, HRESULT)
    get_var_desc : Proc(ITypeInfo*, UInt32, VARDESC**, HRESULT)
    get_names : Proc(ITypeInfo*, Int32, UInt8**, UInt32, UInt32*, HRESULT)
    get_ref_type_of_impl_type : Proc(ITypeInfo*, UInt32, UInt32*, HRESULT)
    get_impl_type_flags : Proc(ITypeInfo*, UInt32, Int32*, HRESULT)
    get_i_ds_of_names : Proc(ITypeInfo*, LibC::LPWSTR*, UInt32, Int32*, HRESULT)
    invoke : Proc(ITypeInfo*, Void*, Int32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_documentation : Proc(ITypeInfo*, Int32, UInt8**, UInt8**, UInt32*, UInt8**, HRESULT)
    get_dll_entry : Proc(ITypeInfo*, Int32, INVOKEKIND, UInt8**, UInt8**, UInt16*, HRESULT)
    get_ref_type_info : Proc(ITypeInfo*, UInt32, ITypeInfo*, HRESULT)
    address_of_member : Proc(ITypeInfo*, Int32, INVOKEKIND, Void**, HRESULT)
    create_instance : Proc(ITypeInfo*, IUnknown, Guid*, Void**, HRESULT)
    get_mops : Proc(ITypeInfo*, Int32, UInt8**, HRESULT)
    get_containing_type_lib : Proc(ITypeInfo*, ITypeLib*, UInt32*, HRESULT)
    release_type_attr : Proc(ITypeInfo*, TYPEATTR*, Void)
    release_func_desc : Proc(ITypeInfo*, FUNCDESC*, Void)
    release_var_desc : Proc(ITypeInfo*, VARDESC*, Void)
  end

  ITypeInfo_GUID = "00020401-0000-0000-c000-000000000046"
  IID_ITypeInfo = LibC::GUID.new(0x20401_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeInfo
    lpVtbl : ITypeInfoVTbl*
  end

  struct ITypeInfo2VTbl
    query_interface : Proc(ITypeInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITypeInfo2*, UInt32)
    release : Proc(ITypeInfo2*, UInt32)
    get_type_attr : Proc(ITypeInfo2*, TYPEATTR**, HRESULT)
    get_type_comp : Proc(ITypeInfo2*, ITypeComp*, HRESULT)
    get_func_desc : Proc(ITypeInfo2*, UInt32, FUNCDESC**, HRESULT)
    get_var_desc : Proc(ITypeInfo2*, UInt32, VARDESC**, HRESULT)
    get_names : Proc(ITypeInfo2*, Int32, UInt8**, UInt32, UInt32*, HRESULT)
    get_ref_type_of_impl_type : Proc(ITypeInfo2*, UInt32, UInt32*, HRESULT)
    get_impl_type_flags : Proc(ITypeInfo2*, UInt32, Int32*, HRESULT)
    get_i_ds_of_names : Proc(ITypeInfo2*, LibC::LPWSTR*, UInt32, Int32*, HRESULT)
    invoke : Proc(ITypeInfo2*, Void*, Int32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_documentation : Proc(ITypeInfo2*, Int32, UInt8**, UInt8**, UInt32*, UInt8**, HRESULT)
    get_dll_entry : Proc(ITypeInfo2*, Int32, INVOKEKIND, UInt8**, UInt8**, UInt16*, HRESULT)
    get_ref_type_info : Proc(ITypeInfo2*, UInt32, ITypeInfo*, HRESULT)
    address_of_member : Proc(ITypeInfo2*, Int32, INVOKEKIND, Void**, HRESULT)
    create_instance : Proc(ITypeInfo2*, IUnknown, Guid*, Void**, HRESULT)
    get_mops : Proc(ITypeInfo2*, Int32, UInt8**, HRESULT)
    get_containing_type_lib : Proc(ITypeInfo2*, ITypeLib*, UInt32*, HRESULT)
    release_type_attr : Proc(ITypeInfo2*, TYPEATTR*, Void)
    release_func_desc : Proc(ITypeInfo2*, FUNCDESC*, Void)
    release_var_desc : Proc(ITypeInfo2*, VARDESC*, Void)
    get_type_kind : Proc(ITypeInfo2*, TYPEKIND*, HRESULT)
    get_type_flags : Proc(ITypeInfo2*, UInt32*, HRESULT)
    get_func_index_of_mem_id : Proc(ITypeInfo2*, Int32, INVOKEKIND, UInt32*, HRESULT)
    get_var_index_of_mem_id : Proc(ITypeInfo2*, Int32, UInt32*, HRESULT)
    get_cust_data : Proc(ITypeInfo2*, Guid*, VARIANT*, HRESULT)
    get_func_cust_data : Proc(ITypeInfo2*, UInt32, Guid*, VARIANT*, HRESULT)
    get_param_cust_data : Proc(ITypeInfo2*, UInt32, UInt32, Guid*, VARIANT*, HRESULT)
    get_var_cust_data : Proc(ITypeInfo2*, UInt32, Guid*, VARIANT*, HRESULT)
    get_impl_type_cust_data : Proc(ITypeInfo2*, UInt32, Guid*, VARIANT*, HRESULT)
    get_documentation2 : Proc(ITypeInfo2*, Int32, UInt32, UInt8**, UInt32*, UInt8**, HRESULT)
    get_all_cust_data : Proc(ITypeInfo2*, CUSTDATA*, HRESULT)
    get_all_func_cust_data : Proc(ITypeInfo2*, UInt32, CUSTDATA*, HRESULT)
    get_all_param_cust_data : Proc(ITypeInfo2*, UInt32, UInt32, CUSTDATA*, HRESULT)
    get_all_var_cust_data : Proc(ITypeInfo2*, UInt32, CUSTDATA*, HRESULT)
    get_all_impl_type_cust_data : Proc(ITypeInfo2*, UInt32, CUSTDATA*, HRESULT)
  end

  ITypeInfo2_GUID = "00020412-0000-0000-c000-000000000046"
  IID_ITypeInfo2 = LibC::GUID.new(0x20412_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeInfo2
    lpVtbl : ITypeInfo2VTbl*
  end

  struct ITypeLibVTbl
    query_interface : Proc(ITypeLib*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITypeLib*, UInt32)
    release : Proc(ITypeLib*, UInt32)
    get_type_info_count : Proc(ITypeLib*, UInt32)
    get_type_info : Proc(ITypeLib*, UInt32, ITypeInfo*, HRESULT)
    get_type_info_type : Proc(ITypeLib*, UInt32, TYPEKIND*, HRESULT)
    get_type_info_of_guid : Proc(ITypeLib*, Guid*, ITypeInfo*, HRESULT)
    get_lib_attr : Proc(ITypeLib*, TLIBATTR**, HRESULT)
    get_type_comp : Proc(ITypeLib*, ITypeComp*, HRESULT)
    get_documentation : Proc(ITypeLib*, Int32, UInt8**, UInt8**, UInt32*, UInt8**, HRESULT)
    is_name : Proc(ITypeLib*, LibC::LPWSTR, UInt32, LibC::BOOL*, HRESULT)
    find_name : Proc(ITypeLib*, LibC::LPWSTR, UInt32, ITypeInfo*, Int32*, UInt16*, HRESULT)
    release_t_lib_attr : Proc(ITypeLib*, TLIBATTR*, Void)
  end

  ITypeLib_GUID = "00020402-0000-0000-c000-000000000046"
  IID_ITypeLib = LibC::GUID.new(0x20402_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeLib
    lpVtbl : ITypeLibVTbl*
  end

  struct ITypeLib2VTbl
    query_interface : Proc(ITypeLib2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITypeLib2*, UInt32)
    release : Proc(ITypeLib2*, UInt32)
    get_type_info_count : Proc(ITypeLib2*, UInt32)
    get_type_info : Proc(ITypeLib2*, UInt32, ITypeInfo*, HRESULT)
    get_type_info_type : Proc(ITypeLib2*, UInt32, TYPEKIND*, HRESULT)
    get_type_info_of_guid : Proc(ITypeLib2*, Guid*, ITypeInfo*, HRESULT)
    get_lib_attr : Proc(ITypeLib2*, TLIBATTR**, HRESULT)
    get_type_comp : Proc(ITypeLib2*, ITypeComp*, HRESULT)
    get_documentation : Proc(ITypeLib2*, Int32, UInt8**, UInt8**, UInt32*, UInt8**, HRESULT)
    is_name : Proc(ITypeLib2*, LibC::LPWSTR, UInt32, LibC::BOOL*, HRESULT)
    find_name : Proc(ITypeLib2*, LibC::LPWSTR, UInt32, ITypeInfo*, Int32*, UInt16*, HRESULT)
    release_t_lib_attr : Proc(ITypeLib2*, TLIBATTR*, Void)
    get_cust_data : Proc(ITypeLib2*, Guid*, VARIANT*, HRESULT)
    get_lib_statistics : Proc(ITypeLib2*, UInt32*, UInt32*, HRESULT)
    get_documentation2 : Proc(ITypeLib2*, Int32, UInt32, UInt8**, UInt32*, UInt8**, HRESULT)
    get_all_cust_data : Proc(ITypeLib2*, CUSTDATA*, HRESULT)
  end

  ITypeLib2_GUID = "00020411-0000-0000-c000-000000000046"
  IID_ITypeLib2 = LibC::GUID.new(0x20411_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeLib2
    lpVtbl : ITypeLib2VTbl*
  end

  struct IErrorInfoVTbl
    query_interface : Proc(IErrorInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IErrorInfo*, UInt32)
    release : Proc(IErrorInfo*, UInt32)
    get_guid : Proc(IErrorInfo*, Guid*, HRESULT)
    get_source : Proc(IErrorInfo*, UInt8**, HRESULT)
    get_description : Proc(IErrorInfo*, UInt8**, HRESULT)
    get_help_file : Proc(IErrorInfo*, UInt8**, HRESULT)
    get_help_context : Proc(IErrorInfo*, UInt32*, HRESULT)
  end

  IErrorInfo_GUID = "1cf2b120-547d-101b-8e65-08002b2bd119"
  IID_IErrorInfo = LibC::GUID.new(0x1cf2b120_u32, 0x547d_u16, 0x101b_u16, StaticArray[0x8e_u8, 0x65_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2b_u8, 0xd1_u8, 0x19_u8])
  struct IErrorInfo
    lpVtbl : IErrorInfoVTbl*
  end

  struct ISupportErrorInfoVTbl
    query_interface : Proc(ISupportErrorInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISupportErrorInfo*, UInt32)
    release : Proc(ISupportErrorInfo*, UInt32)
    interface_supports_error_info : Proc(ISupportErrorInfo*, Guid*, HRESULT)
  end

  ISupportErrorInfo_GUID = "df0b3d60-548f-101b-8e65-08002b2bd119"
  IID_ISupportErrorInfo = LibC::GUID.new(0xdf0b3d60_u32, 0x548f_u16, 0x101b_u16, StaticArray[0x8e_u8, 0x65_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2b_u8, 0xd1_u8, 0x19_u8])
  struct ISupportErrorInfo
    lpVtbl : ISupportErrorInfoVTbl*
  end

  struct IErrorLogVTbl
    query_interface : Proc(IErrorLog*, Guid*, Void**, HRESULT)
    add_ref : Proc(IErrorLog*, UInt32)
    release : Proc(IErrorLog*, UInt32)
    add_error : Proc(IErrorLog*, LibC::LPWSTR, EXCEPINFO*, HRESULT)
  end

  IErrorLog_GUID = "3127ca40-446e-11ce-8135-00aa004bb851"
  IID_IErrorLog = LibC::GUID.new(0x3127ca40_u32, 0x446e_u16, 0x11ce_u16, StaticArray[0x81_u8, 0x35_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xb8_u8, 0x51_u8])
  struct IErrorLog
    lpVtbl : IErrorLogVTbl*
  end

  struct ITypeLibRegistrationReaderVTbl
    query_interface : Proc(ITypeLibRegistrationReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITypeLibRegistrationReader*, UInt32)
    release : Proc(ITypeLibRegistrationReader*, UInt32)
    enum_type_lib_registrations : Proc(ITypeLibRegistrationReader*, IEnumUnknown*, HRESULT)
  end

  ITypeLibRegistrationReader_GUID = "ed6a8a2a-b160-4e77-8f73-aa7435cd5c27"
  IID_ITypeLibRegistrationReader = LibC::GUID.new(0xed6a8a2a_u32, 0xb160_u16, 0x4e77_u16, StaticArray[0x8f_u8, 0x73_u8, 0xaa_u8, 0x74_u8, 0x35_u8, 0xcd_u8, 0x5c_u8, 0x27_u8])
  struct ITypeLibRegistrationReader
    lpVtbl : ITypeLibRegistrationReaderVTbl*
  end

  struct ITypeLibRegistrationVTbl
    query_interface : Proc(ITypeLibRegistration*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITypeLibRegistration*, UInt32)
    release : Proc(ITypeLibRegistration*, UInt32)
    get_guid : Proc(ITypeLibRegistration*, Guid*, HRESULT)
    get_version : Proc(ITypeLibRegistration*, UInt8**, HRESULT)
    get_lcid : Proc(ITypeLibRegistration*, UInt32*, HRESULT)
    get_win32_path : Proc(ITypeLibRegistration*, UInt8**, HRESULT)
    get_win64_path : Proc(ITypeLibRegistration*, UInt8**, HRESULT)
    get_display_name : Proc(ITypeLibRegistration*, UInt8**, HRESULT)
    get_flags : Proc(ITypeLibRegistration*, UInt32*, HRESULT)
    get_help_dir : Proc(ITypeLibRegistration*, UInt8**, HRESULT)
  end

  ITypeLibRegistration_GUID = "76a3e735-02df-4a12-98eb-043ad3600af3"
  IID_ITypeLibRegistration = LibC::GUID.new(0x76a3e735_u32, 0x2df_u16, 0x4a12_u16, StaticArray[0x98_u8, 0xeb_u8, 0x4_u8, 0x3a_u8, 0xd3_u8, 0x60_u8, 0xa_u8, 0xf3_u8])
  struct ITypeLibRegistration
    lpVtbl : ITypeLibRegistrationVTbl*
  end

  struct IEnumConnectionsVTbl
    query_interface : Proc(IEnumConnections*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumConnections*, UInt32)
    release : Proc(IEnumConnections*, UInt32)
    next : Proc(IEnumConnections*, UInt32, CONNECTDATA*, UInt32*, HRESULT)
    skip : Proc(IEnumConnections*, UInt32, HRESULT)
    reset : Proc(IEnumConnections*, HRESULT)
    clone : Proc(IEnumConnections*, IEnumConnections*, HRESULT)
  end

  IEnumConnections_GUID = "b196b287-bab4-101a-b69c-00aa00341d07"
  IID_IEnumConnections = LibC::GUID.new(0xb196b287_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
  struct IEnumConnections
    lpVtbl : IEnumConnectionsVTbl*
  end

  struct IConnectionPointVTbl
    query_interface : Proc(IConnectionPoint*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConnectionPoint*, UInt32)
    release : Proc(IConnectionPoint*, UInt32)
    get_connection_interface : Proc(IConnectionPoint*, Guid*, HRESULT)
    get_connection_point_container : Proc(IConnectionPoint*, IConnectionPointContainer*, HRESULT)
    advise : Proc(IConnectionPoint*, IUnknown, UInt32*, HRESULT)
    unadvise : Proc(IConnectionPoint*, UInt32, HRESULT)
    enum_connections : Proc(IConnectionPoint*, IEnumConnections*, HRESULT)
  end

  IConnectionPoint_GUID = "b196b286-bab4-101a-b69c-00aa00341d07"
  IID_IConnectionPoint = LibC::GUID.new(0xb196b286_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
  struct IConnectionPoint
    lpVtbl : IConnectionPointVTbl*
  end

  struct IEnumConnectionPointsVTbl
    query_interface : Proc(IEnumConnectionPoints*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumConnectionPoints*, UInt32)
    release : Proc(IEnumConnectionPoints*, UInt32)
    next : Proc(IEnumConnectionPoints*, UInt32, IConnectionPoint*, UInt32*, HRESULT)
    skip : Proc(IEnumConnectionPoints*, UInt32, HRESULT)
    reset : Proc(IEnumConnectionPoints*, HRESULT)
    clone : Proc(IEnumConnectionPoints*, IEnumConnectionPoints*, HRESULT)
  end

  IEnumConnectionPoints_GUID = "b196b285-bab4-101a-b69c-00aa00341d07"
  IID_IEnumConnectionPoints = LibC::GUID.new(0xb196b285_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
  struct IEnumConnectionPoints
    lpVtbl : IEnumConnectionPointsVTbl*
  end

  struct IConnectionPointContainerVTbl
    query_interface : Proc(IConnectionPointContainer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConnectionPointContainer*, UInt32)
    release : Proc(IConnectionPointContainer*, UInt32)
    enum_connection_points : Proc(IConnectionPointContainer*, IEnumConnectionPoints*, HRESULT)
    find_connection_point : Proc(IConnectionPointContainer*, Guid*, IConnectionPoint*, HRESULT)
  end

  IConnectionPointContainer_GUID = "b196b284-bab4-101a-b69c-00aa00341d07"
  IID_IConnectionPointContainer = LibC::GUID.new(0xb196b284_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
  struct IConnectionPointContainer
    lpVtbl : IConnectionPointContainerVTbl*
  end

  struct IPersistMemoryVTbl
    query_interface : Proc(IPersistMemory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPersistMemory*, UInt32)
    release : Proc(IPersistMemory*, UInt32)
    get_class_id : Proc(IPersistMemory*, Guid*, HRESULT)
    is_dirty : Proc(IPersistMemory*, HRESULT)
    load : Proc(IPersistMemory*, Void*, UInt32, HRESULT)
    save : Proc(IPersistMemory*, Void*, LibC::BOOL, UInt32, HRESULT)
    get_size_max : Proc(IPersistMemory*, UInt32*, HRESULT)
    init_new : Proc(IPersistMemory*, HRESULT)
  end

  IPersistMemory_GUID = "bd1ae5e0-a6ae-11ce-bd37-504200c10000"
  IID_IPersistMemory = LibC::GUID.new(0xbd1ae5e0_u32, 0xa6ae_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x37_u8, 0x50_u8, 0x42_u8, 0x0_u8, 0xc1_u8, 0x0_u8, 0x0_u8])
  struct IPersistMemory
    lpVtbl : IPersistMemoryVTbl*
  end

  struct IPersistStreamInitVTbl
    query_interface : Proc(IPersistStreamInit*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPersistStreamInit*, UInt32)
    release : Proc(IPersistStreamInit*, UInt32)
    get_class_id : Proc(IPersistStreamInit*, Guid*, HRESULT)
    is_dirty : Proc(IPersistStreamInit*, HRESULT)
    load : Proc(IPersistStreamInit*, IStream, HRESULT)
    save : Proc(IPersistStreamInit*, IStream, LibC::BOOL, HRESULT)
    get_size_max : Proc(IPersistStreamInit*, ULARGE_INTEGER*, HRESULT)
    init_new : Proc(IPersistStreamInit*, HRESULT)
  end

  IPersistStreamInit_GUID = "7fd52380-4e07-101b-ae2d-08002b2ec713"
  IID_IPersistStreamInit = LibC::GUID.new(0x7fd52380_u32, 0x4e07_u16, 0x101b_u16, StaticArray[0xae_u8, 0x2d_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xc7_u8, 0x13_u8])
  struct IPersistStreamInit
    lpVtbl : IPersistStreamInitVTbl*
  end


  # Params # 
  fun CoBuildVersion : UInt32

  # Params # pvreserved : Void* [In]
  fun CoInitialize(pvreserved : Void*) : HRESULT

  # Params # pmallocspy : IMallocSpy [In]
  fun CoRegisterMallocSpy(pmallocspy : IMallocSpy) : HRESULT

  # Params # 
  fun CoRevokeMallocSpy : HRESULT

  # Params # pspy : IInitializeSpy [In],pulicookie : ULARGE_INTEGER* [In]
  fun CoRegisterInitializeSpy(pspy : IInitializeSpy, pulicookie : ULARGE_INTEGER*) : HRESULT

  # Params # ulicookie : ULARGE_INTEGER [In]
  fun CoRevokeInitializeSpy(ulicookie : ULARGE_INTEGER) : HRESULT

  # Params # comsdtype : COMSD [In],ppsd : SECURITY_DESCRIPTOR** [In]
  fun CoGetSystemSecurityPermissions(comsdtype : COMSD, ppsd : SECURITY_DESCRIPTOR**) : HRESULT

  # Params # lpszlibname : LibC::LPWSTR [In],bautofree : LibC::BOOL [In]
  fun CoLoadLibrary(lpszlibname : LibC::LPWSTR, bautofree : LibC::BOOL) : HINSTANCE

  # Params # hinst : HINSTANCE [In]
  fun CoFreeLibrary(hinst : HINSTANCE) : Void

  # Params # 
  fun CoFreeAllLibraries : Void

  # Params # punk : IUnknown [In],lpvreserved : Void* [In]
  fun CoAllowSetForegroundWindow(punk : IUnknown, lpvreserved : Void*) : HRESULT

  # Params # pvreserved : Void* [In],pulreserved : UInt32* [In],appshr : HRESULT [In]
  fun DcomChannelSetHResult(pvreserved : Void*, pulreserved : UInt32*, appshr : HRESULT) : HRESULT

  # Params # rclsid : Guid* [In]
  fun CoIsOle1Class(rclsid : Guid*) : LibC::BOOL

  # Params # lpszprogid : LibC::LPWSTR [In],lpclsid : Guid* [In]
  fun CLSIDFromProgIDEx(lpszprogid : LibC::LPWSTR, lpclsid : Guid*) : HRESULT

  # Params # lpfiletime : FILETIME* [In],lpdosdate : UInt16* [In],lpdostime : UInt16* [In]
  fun CoFileTimeToDosDateTime(lpfiletime : FILETIME*, lpdosdate : UInt16*, lpdostime : UInt16*) : LibC::BOOL

  # Params # ndosdate : UInt16 [In],ndostime : UInt16 [In],lpfiletime : FILETIME* [In]
  fun CoDosDateTimeToFileTime(ndosdate : UInt16, ndostime : UInt16, lpfiletime : FILETIME*) : LibC::BOOL

  # Params # lpfiletime : FILETIME* [In]
  fun CoFileTimeNow(lpfiletime : FILETIME*) : HRESULT

  # Params # extensionuuid : Guid* [In],pchannelhook : IChannelHook [In]
  fun CoRegisterChannelHook(extensionuuid : Guid*, pchannelhook : IChannelHook) : HRESULT

  # Params # clsidold : Guid* [In],clsidnew : Guid* [In]
  fun CoTreatAsClass(clsidold : Guid*, clsidnew : Guid*) : HRESULT

  # Params # ppdaholder : IDataAdviseHolder* [In]
  fun CreateDataAdviseHolder(ppdaholder : IDataAdviseHolder*) : HRESULT

  # Params # punkouter : IUnknown [In],rclsid : Guid* [In],iid : Guid* [In],ppv : Void** [In]
  fun CreateDataCache(punkouter : IUnknown, rclsid : Guid*, iid : Guid*, ppv : Void**) : HRESULT

  # Params # pbc : IBindCtx [In],dwflags : UInt32 [In],pclassspec : Uclsspec* [In],pquery : QUERYCONTEXT* [In],pszcodebase : LibC::LPWSTR [In]
  fun CoInstall(pbc : IBindCtx, dwflags : UInt32, pclassspec : Uclsspec*, pquery : QUERYCONTEXT*, pszcodebase : LibC::LPWSTR) : HRESULT

  # Params # pmk : IMoniker [In],grfopt : UInt32 [In],iidresult : Guid* [In],ppvresult : Void** [In]
  fun BindMoniker(pmk : IMoniker, grfopt : UInt32, iidresult : Guid*, ppvresult : Void**) : HRESULT

  # Params # pszname : LibC::LPWSTR [In],pbindoptions : BIND_OPTS* [In],riid : Guid* [In],ppv : Void** [In]
  fun CoGetObject(pszname : LibC::LPWSTR, pbindoptions : BIND_OPTS*, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pbc : IBindCtx [In],szusername : LibC::LPWSTR [In],pcheaten : UInt32* [In],ppmk : IMoniker* [In]
  fun MkParseDisplayName(pbc : IBindCtx, szusername : LibC::LPWSTR, pcheaten : UInt32*, ppmk : IMoniker*) : HRESULT

  # Params # pmksrc : IMoniker [In],pmkdest : IMoniker [In],ppmkrelpath : IMoniker* [In],dwreserved : LibC::BOOL [In]
  fun MonikerRelativePathTo(pmksrc : IMoniker, pmkdest : IMoniker, ppmkrelpath : IMoniker*, dwreserved : LibC::BOOL) : HRESULT

  # Params # pmkthis : IMoniker [In],pmkother : IMoniker [In],ppmkcommon : IMoniker* [In]
  fun MonikerCommonPrefixWith(pmkthis : IMoniker, pmkother : IMoniker, ppmkcommon : IMoniker*) : HRESULT

  # Params # reserved : UInt32 [In],ppbc : IBindCtx* [In]
  fun CreateBindCtx(reserved : UInt32, ppbc : IBindCtx*) : HRESULT

  # Params # pmkfirst : IMoniker [In],pmkrest : IMoniker [In],ppmkcomposite : IMoniker* [In]
  fun CreateGenericComposite(pmkfirst : IMoniker, pmkrest : IMoniker, ppmkcomposite : IMoniker*) : HRESULT

  # Params # szfilename : LibC::LPWSTR [In],pclsid : Guid* [In]
  fun GetClassFile(szfilename : LibC::LPWSTR, pclsid : Guid*) : HRESULT

  # Params # rclsid : Guid* [In],ppmk : IMoniker* [In]
  fun CreateClassMoniker(rclsid : Guid*, ppmk : IMoniker*) : HRESULT

  # Params # lpszpathname : LibC::LPWSTR [In],ppmk : IMoniker* [In]
  fun CreateFileMoniker(lpszpathname : LibC::LPWSTR, ppmk : IMoniker*) : HRESULT

  # Params # lpszdelim : LibC::LPWSTR [In],lpszitem : LibC::LPWSTR [In],ppmk : IMoniker* [In]
  fun CreateItemMoniker(lpszdelim : LibC::LPWSTR, lpszitem : LibC::LPWSTR, ppmk : IMoniker*) : HRESULT

  # Params # ppmk : IMoniker* [In]
  fun CreateAntiMoniker(ppmk : IMoniker*) : HRESULT

  # Params # punk : IUnknown [In],ppmk : IMoniker* [In]
  fun CreatePointerMoniker(punk : IUnknown, ppmk : IMoniker*) : HRESULT

  # Params # punk : IUnknown [In],ppmk : IMoniker* [In]
  fun CreateObjrefMoniker(punk : IUnknown, ppmk : IMoniker*) : HRESULT

  # Params # reserved : UInt32 [In],pprot : IRunningObjectTable* [In]
  fun GetRunningObjectTable(reserved : UInt32, pprot : IRunningObjectTable*) : HRESULT

  # Params # hwndparent : LibC::HANDLE [In],psztitle : LibC::LPWSTR [In],pibsccaller : IBindStatusCallback [In],ppibsc : IBindStatusCallback* [In]
  fun CreateStdProgressIndicator(hwndparent : LibC::HANDLE, psztitle : LibC::LPWSTR, pibsccaller : IBindStatusCallback, ppibsc : IBindStatusCallback*) : HRESULT

  # Params # dwmemcontext : UInt32 [In],ppmalloc : IMalloc** [In]
  fun CoGetMalloc(dwmemcontext : UInt32, ppmalloc : IMalloc**) : HRESULT

  # Params # 
  fun CoUninitialize : Void

  # Params # 
  fun CoGetCurrentProcess : UInt32

  # Params # pvreserved : Void* [In],dwcoinit : COINIT [In]
  fun CoInitializeEx(pvreserved : Void*, dwcoinit : COINIT) : HRESULT

  # Params # lpdwtid : UInt32* [In]
  fun CoGetCallerTID(lpdwtid : UInt32*) : HRESULT

  # Params # pguid : Guid* [In]
  fun CoGetCurrentLogicalThreadId(pguid : Guid*) : HRESULT

  # Params # ptoken : LibC::UINT_PTR* [In]
  fun CoGetContextToken(ptoken : LibC::UINT_PTR*) : HRESULT

  # Params # papttype : APTTYPE* [In],paptqualifier : APTTYPEQUALIFIER* [In]
  fun CoGetApartmentType(papttype : APTTYPE*, paptqualifier : APTTYPEQUALIFIER*) : HRESULT

  # Params # pcookie : CO_MTA_USAGE_COOKIE* [In]
  fun CoIncrementMTAUsage(pcookie : CO_MTA_USAGE_COOKIE*) : HRESULT

  # Params # cookie : CO_MTA_USAGE_COOKIE [In]
  fun CoDecrementMTAUsage(cookie : CO_MTA_USAGE_COOKIE) : HRESULT

  # Params # clsid : Guid* [In]
  fun CoAllowUnmarshalerCLSID(clsid : Guid*) : HRESULT

  # Params # riid : Guid* [In],ppv : Void** [In]
  fun CoGetObjectContext(riid : Guid*, ppv : Void**) : HRESULT

  # Params # rclsid : Guid* [In],dwclscontext : CLSCTX [In],pvreserved : Void* [In],riid : Guid* [In],ppv : Void** [In]
  fun CoGetClassObject(rclsid : Guid*, dwclscontext : CLSCTX, pvreserved : Void*, riid : Guid*, ppv : Void**) : HRESULT

  # Params # rclsid : Guid* [In],punk : IUnknown [In],dwclscontext : CLSCTX [In],flags : UInt32 [In],lpdwregister : UInt32* [In]
  fun CoRegisterClassObject(rclsid : Guid*, punk : IUnknown, dwclscontext : CLSCTX, flags : UInt32, lpdwregister : UInt32*) : HRESULT

  # Params # dwregister : UInt32 [In]
  fun CoRevokeClassObject(dwregister : UInt32) : HRESULT

  # Params # 
  fun CoResumeClassObjects : HRESULT

  # Params # 
  fun CoSuspendClassObjects : HRESULT

  # Params # 
  fun CoAddRefServerProcess : UInt32

  # Params # 
  fun CoReleaseServerProcess : UInt32

  # Params # riid : Guid* [In],pclsid : Guid* [In]
  fun CoGetPSClsid(riid : Guid*, pclsid : Guid*) : HRESULT

  # Params # riid : Guid* [In],rclsid : Guid* [In]
  fun CoRegisterPSClsid(riid : Guid*, rclsid : Guid*) : HRESULT

  # Params # psurrogate : ISurrogate [In]
  fun CoRegisterSurrogate(psurrogate : ISurrogate) : HRESULT

  # Params # punk : IUnknown [In],dwreserved : UInt32 [In]
  fun CoDisconnectObject(punk : IUnknown, dwreserved : UInt32) : HRESULT

  # Params # punk : IUnknown [In],flock : LibC::BOOL [In],flastunlockreleases : LibC::BOOL [In]
  fun CoLockObjectExternal(punk : IUnknown, flock : LibC::BOOL, flastunlockreleases : LibC::BOOL) : HRESULT

  # Params # punk : IUnknown [In]
  fun CoIsHandlerConnected(punk : IUnknown) : LibC::BOOL

  # Params # punkouter : IUnknown [In],ppunkmarshal : IUnknown* [In]
  fun CoCreateFreeThreadedMarshaler(punkouter : IUnknown, ppunkmarshal : IUnknown*) : HRESULT

  # Params # 
  fun CoFreeUnusedLibraries : Void

  # Params # dwunloaddelay : UInt32 [In],dwreserved : UInt32 [In]
  fun CoFreeUnusedLibrariesEx(dwunloaddelay : UInt32, dwreserved : UInt32) : Void

  # Params # dwtimeout : UInt32 [In]
  fun CoDisconnectContext(dwtimeout : UInt32) : HRESULT

  # Params # psecdesc : SECURITY_DESCRIPTOR* [In],cauthsvc : Int32 [In],asauthsvc : SOLE_AUTHENTICATION_SERVICE* [In],preserved1 : Void* [In],dwauthnlevel : RPC_C_AUTHN_LEVEL [In],dwimplevel : RPC_C_IMP_LEVEL [In],pauthlist : Void* [In],dwcapabilities : EOLE_AUTHENTICATION_CAPABILITIES [In],preserved3 : Void* [In]
  fun CoInitializeSecurity(psecdesc : SECURITY_DESCRIPTOR*, cauthsvc : Int32, asauthsvc : SOLE_AUTHENTICATION_SERVICE*, preserved1 : Void*, dwauthnlevel : RPC_C_AUTHN_LEVEL, dwimplevel : RPC_C_IMP_LEVEL, pauthlist : Void*, dwcapabilities : EOLE_AUTHENTICATION_CAPABILITIES, preserved3 : Void*) : HRESULT

  # Params # riid : Guid* [In],ppinterface : Void** [In]
  fun CoGetCallContext(riid : Guid*, ppinterface : Void**) : HRESULT

  # Params # pproxy : IUnknown [In],pwauthnsvc : UInt32* [In],pauthzsvc : UInt32* [In],pserverprincname : LibC::LPWSTR* [In],pauthnlevel : UInt32* [In],pimplevel : UInt32* [In],pauthinfo : Void** [In],pcapabilites : UInt32* [In]
  fun CoQueryProxyBlanket(pproxy : IUnknown, pwauthnsvc : UInt32*, pauthzsvc : UInt32*, pserverprincname : LibC::LPWSTR*, pauthnlevel : UInt32*, pimplevel : UInt32*, pauthinfo : Void**, pcapabilites : UInt32*) : HRESULT

  # Params # pproxy : IUnknown [In],dwauthnsvc : UInt32 [In],dwauthzsvc : UInt32 [In],pserverprincname : LibC::LPWSTR [In],dwauthnlevel : RPC_C_AUTHN_LEVEL [In],dwimplevel : RPC_C_IMP_LEVEL [In],pauthinfo : Void* [In],dwcapabilities : EOLE_AUTHENTICATION_CAPABILITIES [In]
  fun CoSetProxyBlanket(pproxy : IUnknown, dwauthnsvc : UInt32, dwauthzsvc : UInt32, pserverprincname : LibC::LPWSTR, dwauthnlevel : RPC_C_AUTHN_LEVEL, dwimplevel : RPC_C_IMP_LEVEL, pauthinfo : Void*, dwcapabilities : EOLE_AUTHENTICATION_CAPABILITIES) : HRESULT

  # Params # pproxy : IUnknown [In],ppcopy : IUnknown* [In]
  fun CoCopyProxy(pproxy : IUnknown, ppcopy : IUnknown*) : HRESULT

  # Params # pauthnsvc : UInt32* [In],pauthzsvc : UInt32* [In],pserverprincname : LibC::LPWSTR* [In],pauthnlevel : UInt32* [In],pimplevel : UInt32* [In],pprivs : Void** [In],pcapabilities : UInt32* [In]
  fun CoQueryClientBlanket(pauthnsvc : UInt32*, pauthzsvc : UInt32*, pserverprincname : LibC::LPWSTR*, pauthnlevel : UInt32*, pimplevel : UInt32*, pprivs : Void**, pcapabilities : UInt32*) : HRESULT

  # Params # 
  fun CoImpersonateClient : HRESULT

  # Params # 
  fun CoRevertToSelf : HRESULT

  # Params # pcauthsvc : UInt32* [In],asauthsvc : SOLE_AUTHENTICATION_SERVICE** [In]
  fun CoQueryAuthenticationServices(pcauthsvc : UInt32*, asauthsvc : SOLE_AUTHENTICATION_SERVICE**) : HRESULT

  # Params # pnewobject : Void* [In],ppoldobject : IUnknown* [In]
  fun CoSwitchCallContext(pnewobject : Void*, ppoldobject : IUnknown*) : HRESULT

  # Params # rclsid : Guid* [In],punkouter : Void* [In],dwclscontext : CLSCTX [In],riid : Guid* [In],ppv : Void** [In]
  fun CoCreateInstance(rclsid : Guid*, punkouter : Void*, dwclscontext : CLSCTX, riid : Guid*, ppv : Void**) : HRESULT

  # Params # clsid : Guid* [In],punkouter : Void* [In],dwclsctx : CLSCTX [In],pserverinfo : COSERVERINFO* [In],dwcount : UInt32 [In],presults : MULTI_QI* [In]
  fun CoCreateInstanceEx(clsid : Guid*, punkouter : Void*, dwclsctx : CLSCTX, pserverinfo : COSERVERINFO*, dwcount : UInt32, presults : MULTI_QI*) : HRESULT

  # Params # clsid : Guid* [In],punkouter : Void* [In],dwclsctx : CLSCTX [In],reserved : Void* [In],dwcount : UInt32 [In],presults : MULTI_QI* [In]
  fun CoCreateInstanceFromApp(clsid : Guid*, punkouter : Void*, dwclsctx : CLSCTX, reserved : Void*, dwcount : UInt32, presults : MULTI_QI*) : HRESULT

  # Params # pactivationfilter : IActivationFilter [In]
  fun CoRegisterActivationFilter(pactivationfilter : IActivationFilter) : HRESULT

  # Params # dwthreadid : UInt32 [In],iid : Guid* [In],ppunk : Void** [In]
  fun CoGetCancelObject(dwthreadid : UInt32, iid : Guid*, ppunk : Void**) : HRESULT

  # Params # punk : IUnknown [In]
  fun CoSetCancelObject(punk : IUnknown) : HRESULT

  # Params # dwthreadid : UInt32 [In],ultimeout : UInt32 [In]
  fun CoCancelCall(dwthreadid : UInt32, ultimeout : UInt32) : HRESULT

  # Params # 
  fun CoTestCancel : HRESULT

  # Params # preserved : Void* [In]
  fun CoEnableCallCancellation(preserved : Void*) : HRESULT

  # Params # preserved : Void* [In]
  fun CoDisableCallCancellation(preserved : Void*) : HRESULT

  # Params # rclsid : Guid* [In],lplpsz : LibC::LPWSTR* [In]
  fun StringFromCLSID(rclsid : Guid*, lplpsz : LibC::LPWSTR*) : HRESULT

  # Params # lpsz : LibC::LPWSTR [In],pclsid : Guid* [In]
  fun CLSIDFromString(lpsz : LibC::LPWSTR, pclsid : Guid*) : HRESULT

  # Params # rclsid : Guid* [In],lplpsz : LibC::LPWSTR* [In]
  fun StringFromIID(rclsid : Guid*, lplpsz : LibC::LPWSTR*) : HRESULT

  # Params # lpsz : LibC::LPWSTR [In],lpiid : Guid* [In]
  fun IIDFromString(lpsz : LibC::LPWSTR, lpiid : Guid*) : HRESULT

  # Params # clsid : Guid* [In],lplpszprogid : LibC::LPWSTR* [In]
  fun ProgIDFromCLSID(clsid : Guid*, lplpszprogid : LibC::LPWSTR*) : HRESULT

  # Params # lpszprogid : LibC::LPWSTR [In],lpclsid : Guid* [In]
  fun CLSIDFromProgID(lpszprogid : LibC::LPWSTR, lpclsid : Guid*) : HRESULT

  # Params # rguid : Guid* [In],lpsz : Char* [In],cchmax : Int32 [In]
  fun StringFromGUID2(rguid : Guid*, lpsz : Char*, cchmax : Int32) : Int32

  # Params # pguid : Guid* [In]
  fun CoCreateGuid(pguid : Guid*) : HRESULT

  # Params # dwflags : UInt32 [In],dwtimeout : UInt32 [In],chandles : UInt32 [In],phandles : LibC::HANDLE* [In],lpdwindex : UInt32* [In]
  fun CoWaitForMultipleHandles(dwflags : UInt32, dwtimeout : UInt32, chandles : UInt32, phandles : LibC::HANDLE*, lpdwindex : UInt32*) : HRESULT

  # Params # dwflags : UInt32 [In],dwtimeout : UInt32 [In],chandles : UInt32 [In],phandles : LibC::HANDLE* [In],lpdwindex : UInt32* [In]
  fun CoWaitForMultipleObjects(dwflags : UInt32, dwtimeout : UInt32, chandles : UInt32, phandles : LibC::HANDLE*, lpdwindex : UInt32*) : HRESULT

  # Params # clsidold : Guid* [In],pclsidnew : Guid* [In]
  fun CoGetTreatAsClass(clsidold : Guid*, pclsidnew : Guid*) : HRESULT

  # Params # pszmachinename : LibC::LPWSTR [In]
  fun CoInvalidateRemoteMachineBindings(pszmachinename : LibC::LPWSTR) : HRESULT

  # Params # cb : LibC::UINT_PTR [In]
  fun CoTaskMemAlloc(cb : LibC::UINT_PTR) : Void*

  # Params # pv : Void* [In],cb : LibC::UINT_PTR [In]
  fun CoTaskMemRealloc(pv : Void*, cb : LibC::UINT_PTR) : Void*

  # Params # pv : Void* [In]
  # Commented out because function is part of Lib C
  #fun CoTaskMemFree(pv : Void*) : Void

  # Params # deviceinstanceid : LibC::LPWSTR [In],cookie : CO_DEVICE_CATALOG_COOKIE* [In]
  fun CoRegisterDeviceCatalog(deviceinstanceid : LibC::LPWSTR, cookie : CO_DEVICE_CATALOG_COOKIE*) : HRESULT

  # Params # cookie : CO_DEVICE_CATALOG_COOKIE [In]
  fun CoRevokeDeviceCatalog(cookie : CO_DEVICE_CATALOG_COOKIE) : HRESULT

  # Params # pwzuri : LibC::LPWSTR [In],dwflags : URI_CREATE_FLAGS [In],dwreserved : LibC::UINT_PTR [In],ppuri : IUri* [In]
  fun CreateUri(pwzuri : LibC::LPWSTR, dwflags : URI_CREATE_FLAGS, dwreserved : LibC::UINT_PTR, ppuri : IUri*) : HRESULT

  # Params # pwzuri : LibC::LPWSTR [In],pwzfragment : LibC::LPWSTR [In],dwflags : UInt32 [In],dwreserved : LibC::UINT_PTR [In],ppuri : IUri* [In]
  fun CreateUriWithFragment(pwzuri : LibC::LPWSTR, pwzfragment : LibC::LPWSTR, dwflags : UInt32, dwreserved : LibC::UINT_PTR, ppuri : IUri*) : HRESULT

  # Params # pszansiinputuri : PSTR [In],dwencodingflags : UInt32 [In],dwcodepage : UInt32 [In],dwcreateflags : UInt32 [In],dwreserved : LibC::UINT_PTR [In],ppuri : IUri* [In]
  fun CreateUriFromMultiByteString(pszansiinputuri : PSTR, dwencodingflags : UInt32, dwcodepage : UInt32, dwcreateflags : UInt32, dwreserved : LibC::UINT_PTR, ppuri : IUri*) : HRESULT

  # Params # piuri : IUri [In],dwflags : UInt32 [In],dwreserved : LibC::UINT_PTR [In],ppiuribuilder : IUriBuilder* [In]
  fun CreateIUriBuilder(piuri : IUri, dwflags : UInt32, dwreserved : LibC::UINT_PTR, ppiuribuilder : IUriBuilder*) : HRESULT

  # Params # dwreserved : UInt32 [In],perrinfo : IErrorInfo [In]
  fun SetErrorInfo(dwreserved : UInt32, perrinfo : IErrorInfo) : HRESULT

  # Params # dwreserved : UInt32 [In],pperrinfo : IErrorInfo* [In]
  fun GetErrorInfo(dwreserved : UInt32, pperrinfo : IErrorInfo*) : HRESULT
end
struct LibWin32::IUnknown
  def query_interface(this : IUnknown*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUnknown*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUnknown*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::AsyncIUnknown
  def query_interface(this : AsyncIUnknown*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIUnknown*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIUnknown*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_query_interface(this : AsyncIUnknown*, riid : Guid*) : HRESULT
    @lpVtbl.value.begin_query_interface.call(this, riid)
  end
  def finish_query_interface(this : AsyncIUnknown*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.finish_query_interface.call(this, ppvobject)
  end
  def begin_add_ref(this : AsyncIUnknown*) : HRESULT
    @lpVtbl.value.begin_add_ref.call(this)
  end
  def finish_add_ref(this : AsyncIUnknown*) : UInt32
    @lpVtbl.value.finish_add_ref.call(this)
  end
  def begin_release(this : AsyncIUnknown*) : HRESULT
    @lpVtbl.value.begin_release.call(this)
  end
  def finish_release(this : AsyncIUnknown*) : UInt32
    @lpVtbl.value.finish_release.call(this)
  end
end
struct LibWin32::IClassFactory
  def query_interface(this : IClassFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IClassFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IClassFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_instance(this : IClassFactory*, punkouter : IUnknown, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.call(this, punkouter, riid, ppvobject)
  end
  def lock_server(this : IClassFactory*, flock : LibC::BOOL) : HRESULT
    @lpVtbl.value.lock_server.call(this, flock)
  end
end
struct LibWin32::INoMarshal
  def query_interface(this : INoMarshal*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INoMarshal*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INoMarshal*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IAgileObject
  def query_interface(this : IAgileObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAgileObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAgileObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IActivationFilter
  def query_interface(this : IActivationFilter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IActivationFilter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IActivationFilter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_activation(this : IActivationFilter*, dwactivationtype : UInt32, rclsid : Guid*, preplacementclsid : Guid*) : HRESULT
    @lpVtbl.value.handle_activation.call(this, dwactivationtype, rclsid, preplacementclsid)
  end
end
struct LibWin32::IMalloc
  def query_interface(this : IMalloc*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMalloc*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMalloc*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def alloc(this : IMalloc*, cb : LibC::UINT_PTR) : Void*
    @lpVtbl.value.alloc.call(this, cb)
  end
  def realloc(this : IMalloc*, pv : Void*, cb : LibC::UINT_PTR) : Void*
    @lpVtbl.value.realloc.call(this, pv, cb)
  end
  def free(this : IMalloc*, pv : Void*) : Void
    @lpVtbl.value.free.call(this, pv)
  end
  def get_size(this : IMalloc*, pv : Void*) : LibC::UINT_PTR
    @lpVtbl.value.get_size.call(this, pv)
  end
  def did_alloc(this : IMalloc*, pv : Void*) : Int32
    @lpVtbl.value.did_alloc.call(this, pv)
  end
  def heap_minimize(this : IMalloc*) : Void
    @lpVtbl.value.heap_minimize.call(this)
  end
end
struct LibWin32::IStdMarshalInfo
  def query_interface(this : IStdMarshalInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStdMarshalInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStdMarshalInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_class_for_handler(this : IStdMarshalInfo*, dwdestcontext : UInt32, pvdestcontext : Void*, pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_class_for_handler.call(this, dwdestcontext, pvdestcontext, pclsid)
  end
end
struct LibWin32::IExternalConnection
  def query_interface(this : IExternalConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExternalConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExternalConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_connection(this : IExternalConnection*, extconn : UInt32, reserved : UInt32) : UInt32
    @lpVtbl.value.add_connection.call(this, extconn, reserved)
  end
  def release_connection(this : IExternalConnection*, extconn : UInt32, reserved : UInt32, flastreleasecloses : LibC::BOOL) : UInt32
    @lpVtbl.value.release_connection.call(this, extconn, reserved, flastreleasecloses)
  end
end
struct LibWin32::IMultiQI
  def query_interface(this : IMultiQI*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMultiQI*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMultiQI*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_multiple_interfaces(this : IMultiQI*, cmqis : UInt32, pmqis : MULTI_QI*) : HRESULT
    @lpVtbl.value.query_multiple_interfaces.call(this, cmqis, pmqis)
  end
end
struct LibWin32::AsyncIMultiQI
  def query_interface(this : AsyncIMultiQI*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIMultiQI*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIMultiQI*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_query_multiple_interfaces(this : AsyncIMultiQI*, cmqis : UInt32, pmqis : MULTI_QI*) : HRESULT
    @lpVtbl.value.begin_query_multiple_interfaces.call(this, cmqis, pmqis)
  end
  def finish_query_multiple_interfaces(this : AsyncIMultiQI*, pmqis : MULTI_QI*) : HRESULT
    @lpVtbl.value.finish_query_multiple_interfaces.call(this, pmqis)
  end
end
struct LibWin32::IInternalUnknown
  def query_interface(this : IInternalUnknown*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInternalUnknown*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInternalUnknown*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_internal_interface(this : IInternalUnknown*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.query_internal_interface.call(this, riid, ppv)
  end
end
struct LibWin32::IEnumUnknown
  def query_interface(this : IEnumUnknown*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumUnknown*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumUnknown*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumUnknown*, celt : UInt32, rgelt : IUnknown*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumUnknown*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumUnknown*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumUnknown*, ppenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IEnumString
  def query_interface(this : IEnumString*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumString*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumString*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumString*, celt : UInt32, rgelt : LibC::LPWSTR*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumString*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumString*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumString*, ppenum : IEnumString*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::ISequentialStream
  def query_interface(this : ISequentialStream*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISequentialStream*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISequentialStream*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read(this : ISequentialStream*, pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.call(this, pv, cb, pcbread)
  end
  def write(this : ISequentialStream*, pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.call(this, pv, cb, pcbwritten)
  end
end
struct LibWin32::IStream
  def query_interface(this : IStream*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStream*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStream*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read(this : IStream*, pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.call(this, pv, cb, pcbread)
  end
  def write(this : IStream*, pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.call(this, pv, cb, pcbwritten)
  end
  def seek(this : IStream*, dlibmove : LARGE_INTEGER, dworigin : STREAM_SEEK, plibnewposition : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.seek.call(this, dlibmove, dworigin, plibnewposition)
  end
  def set_size(this : IStream*, libnewsize : ULARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_size.call(this, libnewsize)
  end
  def copy_to(this : IStream*, pstm : IStream, cb : ULARGE_INTEGER, pcbread : ULARGE_INTEGER*, pcbwritten : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.copy_to.call(this, pstm, cb, pcbread, pcbwritten)
  end
  def commit(this : IStream*, grfcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit.call(this, grfcommitflags)
  end
  def revert(this : IStream*) : HRESULT
    @lpVtbl.value.revert.call(this)
  end
  def lock_region(this : IStream*, liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.lock_region.call(this, liboffset, cb, dwlocktype)
  end
  def unlock_region(this : IStream*, liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.unlock_region.call(this, liboffset, cb, dwlocktype)
  end
  def stat(this : IStream*, pstatstg : STATSTG*, grfstatflag : UInt32) : HRESULT
    @lpVtbl.value.stat.call(this, pstatstg, grfstatflag)
  end
  def clone(this : IStream*, ppstm : IStream*) : HRESULT
    @lpVtbl.value.clone.call(this, ppstm)
  end
end
struct LibWin32::IRpcChannelBuffer
  def query_interface(this : IRpcChannelBuffer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRpcChannelBuffer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRpcChannelBuffer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer(this : IRpcChannelBuffer*, pmessage : RPCOLEMESSAGE*, riid : Guid*) : HRESULT
    @lpVtbl.value.get_buffer.call(this, pmessage, riid)
  end
  def send_receive(this : IRpcChannelBuffer*, pmessage : RPCOLEMESSAGE*, pstatus : UInt32*) : HRESULT
    @lpVtbl.value.send_receive.call(this, pmessage, pstatus)
  end
  def free_buffer(this : IRpcChannelBuffer*, pmessage : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.free_buffer.call(this, pmessage)
  end
  def get_dest_ctx(this : IRpcChannelBuffer*, pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx.call(this, pdwdestcontext, ppvdestcontext)
  end
  def is_connected(this : IRpcChannelBuffer*) : HRESULT
    @lpVtbl.value.is_connected.call(this)
  end
end
struct LibWin32::IRpcChannelBuffer2
  def query_interface(this : IRpcChannelBuffer2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRpcChannelBuffer2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRpcChannelBuffer2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer(this : IRpcChannelBuffer2*, pmessage : RPCOLEMESSAGE*, riid : Guid*) : HRESULT
    @lpVtbl.value.get_buffer.call(this, pmessage, riid)
  end
  def send_receive(this : IRpcChannelBuffer2*, pmessage : RPCOLEMESSAGE*, pstatus : UInt32*) : HRESULT
    @lpVtbl.value.send_receive.call(this, pmessage, pstatus)
  end
  def free_buffer(this : IRpcChannelBuffer2*, pmessage : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.free_buffer.call(this, pmessage)
  end
  def get_dest_ctx(this : IRpcChannelBuffer2*, pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx.call(this, pdwdestcontext, ppvdestcontext)
  end
  def is_connected(this : IRpcChannelBuffer2*) : HRESULT
    @lpVtbl.value.is_connected.call(this)
  end
  def get_protocol_version(this : IRpcChannelBuffer2*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_version.call(this, pdwversion)
  end
end
struct LibWin32::IAsyncRpcChannelBuffer
  def query_interface(this : IAsyncRpcChannelBuffer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAsyncRpcChannelBuffer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAsyncRpcChannelBuffer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer(this : IAsyncRpcChannelBuffer*, pmessage : RPCOLEMESSAGE*, riid : Guid*) : HRESULT
    @lpVtbl.value.get_buffer.call(this, pmessage, riid)
  end
  def send_receive(this : IAsyncRpcChannelBuffer*, pmessage : RPCOLEMESSAGE*, pstatus : UInt32*) : HRESULT
    @lpVtbl.value.send_receive.call(this, pmessage, pstatus)
  end
  def free_buffer(this : IAsyncRpcChannelBuffer*, pmessage : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.free_buffer.call(this, pmessage)
  end
  def get_dest_ctx(this : IAsyncRpcChannelBuffer*, pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx.call(this, pdwdestcontext, ppvdestcontext)
  end
  def is_connected(this : IAsyncRpcChannelBuffer*) : HRESULT
    @lpVtbl.value.is_connected.call(this)
  end
  def get_protocol_version(this : IAsyncRpcChannelBuffer*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_version.call(this, pdwversion)
  end
  def send(this : IAsyncRpcChannelBuffer*, pmsg : RPCOLEMESSAGE*, psync : ISynchronize, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.send.call(this, pmsg, psync, pulstatus)
  end
  def receive(this : IAsyncRpcChannelBuffer*, pmsg : RPCOLEMESSAGE*, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.receive.call(this, pmsg, pulstatus)
  end
  def get_dest_ctx_ex(this : IAsyncRpcChannelBuffer*, pmsg : RPCOLEMESSAGE*, pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx_ex.call(this, pmsg, pdwdestcontext, ppvdestcontext)
  end
end
struct LibWin32::IRpcChannelBuffer3
  def query_interface(this : IRpcChannelBuffer3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRpcChannelBuffer3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRpcChannelBuffer3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer(this : IRpcChannelBuffer3*, pmessage : RPCOLEMESSAGE*, riid : Guid*) : HRESULT
    @lpVtbl.value.get_buffer.call(this, pmessage, riid)
  end
  def send_receive(this : IRpcChannelBuffer3*, pmessage : RPCOLEMESSAGE*, pstatus : UInt32*) : HRESULT
    @lpVtbl.value.send_receive.call(this, pmessage, pstatus)
  end
  def free_buffer(this : IRpcChannelBuffer3*, pmessage : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.free_buffer.call(this, pmessage)
  end
  def get_dest_ctx(this : IRpcChannelBuffer3*, pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx.call(this, pdwdestcontext, ppvdestcontext)
  end
  def is_connected(this : IRpcChannelBuffer3*) : HRESULT
    @lpVtbl.value.is_connected.call(this)
  end
  def get_protocol_version(this : IRpcChannelBuffer3*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_version.call(this, pdwversion)
  end
  def send(this : IRpcChannelBuffer3*, pmsg : RPCOLEMESSAGE*, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.send.call(this, pmsg, pulstatus)
  end
  def receive(this : IRpcChannelBuffer3*, pmsg : RPCOLEMESSAGE*, ulsize : UInt32, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.receive.call(this, pmsg, ulsize, pulstatus)
  end
  def cancel(this : IRpcChannelBuffer3*, pmsg : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.cancel.call(this, pmsg)
  end
  def get_call_context(this : IRpcChannelBuffer3*, pmsg : RPCOLEMESSAGE*, riid : Guid*, pinterface : Void**) : HRESULT
    @lpVtbl.value.get_call_context.call(this, pmsg, riid, pinterface)
  end
  def get_dest_ctx_ex(this : IRpcChannelBuffer3*, pmsg : RPCOLEMESSAGE*, pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx_ex.call(this, pmsg, pdwdestcontext, ppvdestcontext)
  end
  def get_state(this : IRpcChannelBuffer3*, pmsg : RPCOLEMESSAGE*, pstate : UInt32*) : HRESULT
    @lpVtbl.value.get_state.call(this, pmsg, pstate)
  end
  def register_async(this : IRpcChannelBuffer3*, pmsg : RPCOLEMESSAGE*, pasyncmgr : IAsyncManager) : HRESULT
    @lpVtbl.value.register_async.call(this, pmsg, pasyncmgr)
  end
end
struct LibWin32::IRpcSyntaxNegotiate
  def query_interface(this : IRpcSyntaxNegotiate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRpcSyntaxNegotiate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRpcSyntaxNegotiate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def negotiate_syntax(this : IRpcSyntaxNegotiate*, pmsg : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.negotiate_syntax.call(this, pmsg)
  end
end
struct LibWin32::IRpcProxyBuffer
  def query_interface(this : IRpcProxyBuffer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRpcProxyBuffer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRpcProxyBuffer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def connect(this : IRpcProxyBuffer*, prpcchannelbuffer : IRpcChannelBuffer) : HRESULT
    @lpVtbl.value.connect.call(this, prpcchannelbuffer)
  end
  def disconnect(this : IRpcProxyBuffer*) : Void
    @lpVtbl.value.disconnect.call(this)
  end
end
struct LibWin32::IRpcStubBuffer
  def query_interface(this : IRpcStubBuffer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRpcStubBuffer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRpcStubBuffer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def connect(this : IRpcStubBuffer*, punkserver : IUnknown) : HRESULT
    @lpVtbl.value.connect.call(this, punkserver)
  end
  def disconnect(this : IRpcStubBuffer*) : Void
    @lpVtbl.value.disconnect.call(this)
  end
  def invoke(this : IRpcStubBuffer*, prpcmsg : RPCOLEMESSAGE*, prpcchannelbuffer : IRpcChannelBuffer) : HRESULT
    @lpVtbl.value.invoke.call(this, prpcmsg, prpcchannelbuffer)
  end
  def is_iid_supported(this : IRpcStubBuffer*, riid : Guid*) : IRpcStubBuffer
    @lpVtbl.value.is_iid_supported.call(this, riid)
  end
  def count_refs(this : IRpcStubBuffer*) : UInt32
    @lpVtbl.value.count_refs.call(this)
  end
  def debug_server_query_interface(this : IRpcStubBuffer*, ppv : Void**) : HRESULT
    @lpVtbl.value.debug_server_query_interface.call(this, ppv)
  end
  def debug_server_release(this : IRpcStubBuffer*, pv : Void*) : Void
    @lpVtbl.value.debug_server_release.call(this, pv)
  end
end
struct LibWin32::IPSFactoryBuffer
  def query_interface(this : IPSFactoryBuffer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPSFactoryBuffer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPSFactoryBuffer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_proxy(this : IPSFactoryBuffer*, punkouter : IUnknown, riid : Guid*, ppproxy : IRpcProxyBuffer*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_proxy.call(this, punkouter, riid, ppproxy, ppv)
  end
  def create_stub(this : IPSFactoryBuffer*, riid : Guid*, punkserver : IUnknown, ppstub : IRpcStubBuffer*) : HRESULT
    @lpVtbl.value.create_stub.call(this, riid, punkserver, ppstub)
  end
end
struct LibWin32::IChannelHook
  def query_interface(this : IChannelHook*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IChannelHook*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IChannelHook*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def client_get_size(this : IChannelHook*, uextent : Guid*, riid : Guid*, pdatasize : UInt32*) : Void
    @lpVtbl.value.client_get_size.call(this, uextent, riid, pdatasize)
  end
  def client_fill_buffer(this : IChannelHook*, uextent : Guid*, riid : Guid*, pdatasize : UInt32*, pdatabuffer : Void*) : Void
    @lpVtbl.value.client_fill_buffer.call(this, uextent, riid, pdatasize, pdatabuffer)
  end
  def client_notify(this : IChannelHook*, uextent : Guid*, riid : Guid*, cbdatasize : UInt32, pdatabuffer : Void*, ldatarep : UInt32, hrfault : HRESULT) : Void
    @lpVtbl.value.client_notify.call(this, uextent, riid, cbdatasize, pdatabuffer, ldatarep, hrfault)
  end
  def server_notify(this : IChannelHook*, uextent : Guid*, riid : Guid*, cbdatasize : UInt32, pdatabuffer : Void*, ldatarep : UInt32) : Void
    @lpVtbl.value.server_notify.call(this, uextent, riid, cbdatasize, pdatabuffer, ldatarep)
  end
  def server_get_size(this : IChannelHook*, uextent : Guid*, riid : Guid*, hrfault : HRESULT, pdatasize : UInt32*) : Void
    @lpVtbl.value.server_get_size.call(this, uextent, riid, hrfault, pdatasize)
  end
  def server_fill_buffer(this : IChannelHook*, uextent : Guid*, riid : Guid*, pdatasize : UInt32*, pdatabuffer : Void*, hrfault : HRESULT) : Void
    @lpVtbl.value.server_fill_buffer.call(this, uextent, riid, pdatasize, pdatabuffer, hrfault)
  end
end
struct LibWin32::IClientSecurity
  def query_interface(this : IClientSecurity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IClientSecurity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IClientSecurity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_blanket(this : IClientSecurity*, pproxy : IUnknown, pauthnsvc : UInt32*, pauthzsvc : UInt32*, pserverprincname : UInt16**, pauthnlevel : RPC_C_AUTHN_LEVEL*, pimplevel : RPC_C_IMP_LEVEL*, pauthinfo : Void**, pcapabilites : EOLE_AUTHENTICATION_CAPABILITIES*) : HRESULT
    @lpVtbl.value.query_blanket.call(this, pproxy, pauthnsvc, pauthzsvc, pserverprincname, pauthnlevel, pimplevel, pauthinfo, pcapabilites)
  end
  def set_blanket(this : IClientSecurity*, pproxy : IUnknown, dwauthnsvc : UInt32, dwauthzsvc : UInt32, pserverprincname : LibC::LPWSTR, dwauthnlevel : RPC_C_AUTHN_LEVEL, dwimplevel : RPC_C_IMP_LEVEL, pauthinfo : Void*, dwcapabilities : EOLE_AUTHENTICATION_CAPABILITIES) : HRESULT
    @lpVtbl.value.set_blanket.call(this, pproxy, dwauthnsvc, dwauthzsvc, pserverprincname, dwauthnlevel, dwimplevel, pauthinfo, dwcapabilities)
  end
  def copy_proxy(this : IClientSecurity*, pproxy : IUnknown, ppcopy : IUnknown*) : HRESULT
    @lpVtbl.value.copy_proxy.call(this, pproxy, ppcopy)
  end
end
struct LibWin32::IServerSecurity
  def query_interface(this : IServerSecurity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServerSecurity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServerSecurity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_blanket(this : IServerSecurity*, pauthnsvc : UInt32*, pauthzsvc : UInt32*, pserverprincname : UInt16**, pauthnlevel : UInt32*, pimplevel : UInt32*, pprivs : Void**, pcapabilities : UInt32*) : HRESULT
    @lpVtbl.value.query_blanket.call(this, pauthnsvc, pauthzsvc, pserverprincname, pauthnlevel, pimplevel, pprivs, pcapabilities)
  end
  def impersonate_client(this : IServerSecurity*) : HRESULT
    @lpVtbl.value.impersonate_client.call(this)
  end
  def revert_to_self(this : IServerSecurity*) : HRESULT
    @lpVtbl.value.revert_to_self.call(this)
  end
  def is_impersonating(this : IServerSecurity*) : LibC::BOOL
    @lpVtbl.value.is_impersonating.call(this)
  end
end
struct LibWin32::IRpcOptions
  def query_interface(this : IRpcOptions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRpcOptions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRpcOptions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set(this : IRpcOptions*, pprx : IUnknown, dwproperty : RPCOPT_PROPERTIES, dwvalue : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.set.call(this, pprx, dwproperty, dwvalue)
  end
  def query(this : IRpcOptions*, pprx : IUnknown, dwproperty : RPCOPT_PROPERTIES, pdwvalue : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.query.call(this, pprx, dwproperty, pdwvalue)
  end
end
struct LibWin32::IGlobalOptions
  def query_interface(this : IGlobalOptions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGlobalOptions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGlobalOptions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set(this : IGlobalOptions*, dwproperty : GLOBALOPT_PROPERTIES, dwvalue : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.set.call(this, dwproperty, dwvalue)
  end
  def query(this : IGlobalOptions*, dwproperty : GLOBALOPT_PROPERTIES, pdwvalue : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.query.call(this, dwproperty, pdwvalue)
  end
end
struct LibWin32::ISurrogate
  def query_interface(this : ISurrogate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISurrogate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISurrogate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def load_dll_server(this : ISurrogate*, clsid : Guid*) : HRESULT
    @lpVtbl.value.load_dll_server.call(this, clsid)
  end
  def free_surrogate(this : ISurrogate*) : HRESULT
    @lpVtbl.value.free_surrogate.call(this)
  end
end
struct LibWin32::IGlobalInterfaceTable
  def query_interface(this : IGlobalInterfaceTable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGlobalInterfaceTable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGlobalInterfaceTable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_interface_in_global(this : IGlobalInterfaceTable*, punk : IUnknown, riid : Guid*, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.register_interface_in_global.call(this, punk, riid, pdwcookie)
  end
  def revoke_interface_from_global(this : IGlobalInterfaceTable*, dwcookie : UInt32) : HRESULT
    @lpVtbl.value.revoke_interface_from_global.call(this, dwcookie)
  end
  def get_interface_from_global(this : IGlobalInterfaceTable*, dwcookie : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_interface_from_global.call(this, dwcookie, riid, ppv)
  end
end
struct LibWin32::ISynchronize
  def query_interface(this : ISynchronize*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISynchronize*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISynchronize*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def wait(this : ISynchronize*, dwflags : UInt32, dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait.call(this, dwflags, dwmilliseconds)
  end
  def signal(this : ISynchronize*) : HRESULT
    @lpVtbl.value.signal.call(this)
  end
  def reset(this : ISynchronize*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
end
struct LibWin32::ISynchronizeHandle
  def query_interface(this : ISynchronizeHandle*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISynchronizeHandle*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISynchronizeHandle*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_handle(this : ISynchronizeHandle*, ph : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_handle.call(this, ph)
  end
end
struct LibWin32::ISynchronizeEvent
  def query_interface(this : ISynchronizeEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISynchronizeEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISynchronizeEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_handle(this : ISynchronizeEvent*, ph : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_handle.call(this, ph)
  end
  def set_event_handle(this : ISynchronizeEvent*, ph : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.set_event_handle.call(this, ph)
  end
end
struct LibWin32::ISynchronizeContainer
  def query_interface(this : ISynchronizeContainer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISynchronizeContainer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISynchronizeContainer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_synchronize(this : ISynchronizeContainer*, psync : ISynchronize) : HRESULT
    @lpVtbl.value.add_synchronize.call(this, psync)
  end
  def wait_multiple(this : ISynchronizeContainer*, dwflags : UInt32, dwtimeout : UInt32, ppsync : ISynchronize*) : HRESULT
    @lpVtbl.value.wait_multiple.call(this, dwflags, dwtimeout, ppsync)
  end
end
struct LibWin32::ISynchronizeMutex
  def query_interface(this : ISynchronizeMutex*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISynchronizeMutex*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISynchronizeMutex*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def wait(this : ISynchronizeMutex*, dwflags : UInt32, dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait.call(this, dwflags, dwmilliseconds)
  end
  def signal(this : ISynchronizeMutex*) : HRESULT
    @lpVtbl.value.signal.call(this)
  end
  def reset(this : ISynchronizeMutex*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def release_mutex(this : ISynchronizeMutex*) : HRESULT
    @lpVtbl.value.release_mutex.call(this)
  end
end
struct LibWin32::ICancelMethodCalls
  def query_interface(this : ICancelMethodCalls*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICancelMethodCalls*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICancelMethodCalls*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def cancel(this : ICancelMethodCalls*, ulseconds : UInt32) : HRESULT
    @lpVtbl.value.cancel.call(this, ulseconds)
  end
  def test_cancel(this : ICancelMethodCalls*) : HRESULT
    @lpVtbl.value.test_cancel.call(this)
  end
end
struct LibWin32::IAsyncManager
  def query_interface(this : IAsyncManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAsyncManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAsyncManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def complete_call(this : IAsyncManager*, result : HRESULT) : HRESULT
    @lpVtbl.value.complete_call.call(this, result)
  end
  def get_call_context(this : IAsyncManager*, riid : Guid*, pinterface : Void**) : HRESULT
    @lpVtbl.value.get_call_context.call(this, riid, pinterface)
  end
  def get_state(this : IAsyncManager*, pulstateflags : UInt32*) : HRESULT
    @lpVtbl.value.get_state.call(this, pulstateflags)
  end
end
struct LibWin32::ICallFactory
  def query_interface(this : ICallFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICallFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICallFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_call(this : ICallFactory*, riid : Guid*, pctrlunk : IUnknown, riid2 : Guid*, ppv : IUnknown*) : HRESULT
    @lpVtbl.value.create_call.call(this, riid, pctrlunk, riid2, ppv)
  end
end
struct LibWin32::IRpcHelper
  def query_interface(this : IRpcHelper*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRpcHelper*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRpcHelper*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_dcom_protocol_version(this : IRpcHelper*, pcomversion : UInt32*) : HRESULT
    @lpVtbl.value.get_dcom_protocol_version.call(this, pcomversion)
  end
  def get_iid_from_objref(this : IRpcHelper*, pobjref : Void*, piid : Guid**) : HRESULT
    @lpVtbl.value.get_iid_from_objref.call(this, pobjref, piid)
  end
end
struct LibWin32::IReleaseMarshalBuffers
  def query_interface(this : IReleaseMarshalBuffers*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IReleaseMarshalBuffers*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IReleaseMarshalBuffers*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def release_marshal_buffer(this : IReleaseMarshalBuffers*, pmsg : RPCOLEMESSAGE*, dwflags : UInt32, pchnl : IUnknown) : HRESULT
    @lpVtbl.value.release_marshal_buffer.call(this, pmsg, dwflags, pchnl)
  end
end
struct LibWin32::IWaitMultiple
  def query_interface(this : IWaitMultiple*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWaitMultiple*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWaitMultiple*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def wait_multiple(this : IWaitMultiple*, timeout : UInt32, psync : ISynchronize*) : HRESULT
    @lpVtbl.value.wait_multiple.call(this, timeout, psync)
  end
  def add_synchronize(this : IWaitMultiple*, psync : ISynchronize) : HRESULT
    @lpVtbl.value.add_synchronize.call(this, psync)
  end
end
struct LibWin32::IAddrTrackingControl
  def query_interface(this : IAddrTrackingControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAddrTrackingControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAddrTrackingControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enable_com_dynamic_addr_tracking(this : IAddrTrackingControl*) : HRESULT
    @lpVtbl.value.enable_com_dynamic_addr_tracking.call(this)
  end
  def disable_com_dynamic_addr_tracking(this : IAddrTrackingControl*) : HRESULT
    @lpVtbl.value.disable_com_dynamic_addr_tracking.call(this)
  end
end
struct LibWin32::IAddrExclusionControl
  def query_interface(this : IAddrExclusionControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAddrExclusionControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAddrExclusionControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_addr_exclusion_list(this : IAddrExclusionControl*, riid : Guid*, ppenumerator : Void**) : HRESULT
    @lpVtbl.value.get_current_addr_exclusion_list.call(this, riid, ppenumerator)
  end
  def update_addr_exclusion_list(this : IAddrExclusionControl*, penumerator : IUnknown) : HRESULT
    @lpVtbl.value.update_addr_exclusion_list.call(this, penumerator)
  end
end
struct LibWin32::IPipeByte
  def query_interface(this : IPipeByte*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPipeByte*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPipeByte*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def pull(this : IPipeByte*, buf : UInt8*, crequest : UInt32, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.pull.call(this, buf, crequest, pcreturned)
  end
  def push(this : IPipeByte*, buf : UInt8*, csent : UInt32) : HRESULT
    @lpVtbl.value.push.call(this, buf, csent)
  end
end
struct LibWin32::AsyncIPipeByte
  def query_interface(this : AsyncIPipeByte*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIPipeByte*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIPipeByte*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_pull(this : AsyncIPipeByte*, crequest : UInt32) : HRESULT
    @lpVtbl.value.begin_pull.call(this, crequest)
  end
  def finish_pull(this : AsyncIPipeByte*, buf : UInt8*, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.finish_pull.call(this, buf, pcreturned)
  end
  def begin_push(this : AsyncIPipeByte*, buf : UInt8*, csent : UInt32) : HRESULT
    @lpVtbl.value.begin_push.call(this, buf, csent)
  end
  def finish_push(this : AsyncIPipeByte*) : HRESULT
    @lpVtbl.value.finish_push.call(this)
  end
end
struct LibWin32::IPipeLong
  def query_interface(this : IPipeLong*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPipeLong*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPipeLong*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def pull(this : IPipeLong*, buf : Int32*, crequest : UInt32, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.pull.call(this, buf, crequest, pcreturned)
  end
  def push(this : IPipeLong*, buf : Int32*, csent : UInt32) : HRESULT
    @lpVtbl.value.push.call(this, buf, csent)
  end
end
struct LibWin32::AsyncIPipeLong
  def query_interface(this : AsyncIPipeLong*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIPipeLong*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIPipeLong*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_pull(this : AsyncIPipeLong*, crequest : UInt32) : HRESULT
    @lpVtbl.value.begin_pull.call(this, crequest)
  end
  def finish_pull(this : AsyncIPipeLong*, buf : Int32*, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.finish_pull.call(this, buf, pcreturned)
  end
  def begin_push(this : AsyncIPipeLong*, buf : Int32*, csent : UInt32) : HRESULT
    @lpVtbl.value.begin_push.call(this, buf, csent)
  end
  def finish_push(this : AsyncIPipeLong*) : HRESULT
    @lpVtbl.value.finish_push.call(this)
  end
end
struct LibWin32::IPipeDouble
  def query_interface(this : IPipeDouble*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPipeDouble*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPipeDouble*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def pull(this : IPipeDouble*, buf : Float64*, crequest : UInt32, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.pull.call(this, buf, crequest, pcreturned)
  end
  def push(this : IPipeDouble*, buf : Float64*, csent : UInt32) : HRESULT
    @lpVtbl.value.push.call(this, buf, csent)
  end
end
struct LibWin32::AsyncIPipeDouble
  def query_interface(this : AsyncIPipeDouble*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIPipeDouble*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIPipeDouble*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_pull(this : AsyncIPipeDouble*, crequest : UInt32) : HRESULT
    @lpVtbl.value.begin_pull.call(this, crequest)
  end
  def finish_pull(this : AsyncIPipeDouble*, buf : Float64*, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.finish_pull.call(this, buf, pcreturned)
  end
  def begin_push(this : AsyncIPipeDouble*, buf : Float64*, csent : UInt32) : HRESULT
    @lpVtbl.value.begin_push.call(this, buf, csent)
  end
  def finish_push(this : AsyncIPipeDouble*) : HRESULT
    @lpVtbl.value.finish_push.call(this)
  end
end
struct LibWin32::IComThreadingInfo
  def query_interface(this : IComThreadingInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComThreadingInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComThreadingInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_apartment_type(this : IComThreadingInfo*, papttype : APTTYPE*) : HRESULT
    @lpVtbl.value.get_current_apartment_type.call(this, papttype)
  end
  def get_current_thread_type(this : IComThreadingInfo*, pthreadtype : THDTYPE*) : HRESULT
    @lpVtbl.value.get_current_thread_type.call(this, pthreadtype)
  end
  def get_current_logical_thread_id(this : IComThreadingInfo*, pguidlogicalthreadid : Guid*) : HRESULT
    @lpVtbl.value.get_current_logical_thread_id.call(this, pguidlogicalthreadid)
  end
  def set_current_logical_thread_id(this : IComThreadingInfo*, rguid : Guid*) : HRESULT
    @lpVtbl.value.set_current_logical_thread_id.call(this, rguid)
  end
end
struct LibWin32::IProcessInitControl
  def query_interface(this : IProcessInitControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IProcessInitControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IProcessInitControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def reset_initializer_timeout(this : IProcessInitControl*, dwsecondsremaining : UInt32) : HRESULT
    @lpVtbl.value.reset_initializer_timeout.call(this, dwsecondsremaining)
  end
end
struct LibWin32::IFastRundown
  def query_interface(this : IFastRundown*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFastRundown*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFastRundown*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IMachineGlobalObjectTable
  def query_interface(this : IMachineGlobalObjectTable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMachineGlobalObjectTable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMachineGlobalObjectTable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_object(this : IMachineGlobalObjectTable*, clsid : Guid*, identifier : LibC::LPWSTR, object : IUnknown, token : MachineGlobalObjectTableRegistrationToken__**) : HRESULT
    @lpVtbl.value.register_object.call(this, clsid, identifier, object, token)
  end
  def get_object(this : IMachineGlobalObjectTable*, clsid : Guid*, identifier : LibC::LPWSTR, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_object.call(this, clsid, identifier, riid, ppv)
  end
  def revoke_object(this : IMachineGlobalObjectTable*, token : MachineGlobalObjectTableRegistrationToken__*) : HRESULT
    @lpVtbl.value.revoke_object.call(this, token)
  end
end
struct LibWin32::IMallocSpy
  def query_interface(this : IMallocSpy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMallocSpy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMallocSpy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def pre_alloc(this : IMallocSpy*, cbrequest : LibC::UINT_PTR) : LibC::UINT_PTR
    @lpVtbl.value.pre_alloc.call(this, cbrequest)
  end
  def post_alloc(this : IMallocSpy*, pactual : Void*) : Void*
    @lpVtbl.value.post_alloc.call(this, pactual)
  end
  def pre_free(this : IMallocSpy*, prequest : Void*, fspyed : LibC::BOOL) : Void*
    @lpVtbl.value.pre_free.call(this, prequest, fspyed)
  end
  def post_free(this : IMallocSpy*, fspyed : LibC::BOOL) : Void
    @lpVtbl.value.post_free.call(this, fspyed)
  end
  def pre_realloc(this : IMallocSpy*, prequest : Void*, cbrequest : LibC::UINT_PTR, ppnewrequest : Void**, fspyed : LibC::BOOL) : LibC::UINT_PTR
    @lpVtbl.value.pre_realloc.call(this, prequest, cbrequest, ppnewrequest, fspyed)
  end
  def post_realloc(this : IMallocSpy*, pactual : Void*, fspyed : LibC::BOOL) : Void*
    @lpVtbl.value.post_realloc.call(this, pactual, fspyed)
  end
  def pre_get_size(this : IMallocSpy*, prequest : Void*, fspyed : LibC::BOOL) : Void*
    @lpVtbl.value.pre_get_size.call(this, prequest, fspyed)
  end
  def post_get_size(this : IMallocSpy*, cbactual : LibC::UINT_PTR, fspyed : LibC::BOOL) : LibC::UINT_PTR
    @lpVtbl.value.post_get_size.call(this, cbactual, fspyed)
  end
  def pre_did_alloc(this : IMallocSpy*, prequest : Void*, fspyed : LibC::BOOL) : Void*
    @lpVtbl.value.pre_did_alloc.call(this, prequest, fspyed)
  end
  def post_did_alloc(this : IMallocSpy*, prequest : Void*, fspyed : LibC::BOOL, factual : Int32) : Int32
    @lpVtbl.value.post_did_alloc.call(this, prequest, fspyed, factual)
  end
  def pre_heap_minimize(this : IMallocSpy*) : Void
    @lpVtbl.value.pre_heap_minimize.call(this)
  end
  def post_heap_minimize(this : IMallocSpy*) : Void
    @lpVtbl.value.post_heap_minimize.call(this)
  end
end
struct LibWin32::IBindCtx
  def query_interface(this : IBindCtx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IBindCtx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IBindCtx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_object_bound(this : IBindCtx*, punk : IUnknown) : HRESULT
    @lpVtbl.value.register_object_bound.call(this, punk)
  end
  def revoke_object_bound(this : IBindCtx*, punk : IUnknown) : HRESULT
    @lpVtbl.value.revoke_object_bound.call(this, punk)
  end
  def release_bound_objects(this : IBindCtx*) : HRESULT
    @lpVtbl.value.release_bound_objects.call(this)
  end
  def set_bind_options(this : IBindCtx*, pbindopts : BIND_OPTS*) : HRESULT
    @lpVtbl.value.set_bind_options.call(this, pbindopts)
  end
  def get_bind_options(this : IBindCtx*, pbindopts : BIND_OPTS*) : HRESULT
    @lpVtbl.value.get_bind_options.call(this, pbindopts)
  end
  def get_running_object_table(this : IBindCtx*, pprot : IRunningObjectTable*) : HRESULT
    @lpVtbl.value.get_running_object_table.call(this, pprot)
  end
  def register_object_param(this : IBindCtx*, pszkey : LibC::LPWSTR, punk : IUnknown) : HRESULT
    @lpVtbl.value.register_object_param.call(this, pszkey, punk)
  end
  def get_object_param(this : IBindCtx*, pszkey : LibC::LPWSTR, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_object_param.call(this, pszkey, ppunk)
  end
  def enum_object_param(this : IBindCtx*, ppenum : IEnumString*) : HRESULT
    @lpVtbl.value.enum_object_param.call(this, ppenum)
  end
  def revoke_object_param(this : IBindCtx*, pszkey : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.revoke_object_param.call(this, pszkey)
  end
end
struct LibWin32::IEnumMoniker
  def query_interface(this : IEnumMoniker*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumMoniker*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumMoniker*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumMoniker*, celt : UInt32, rgelt : IMoniker*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumMoniker*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumMoniker*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumMoniker*, ppenum : IEnumMoniker*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IRunnableObject
  def query_interface(this : IRunnableObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRunnableObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRunnableObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_running_class(this : IRunnableObject*, lpclsid : Guid*) : HRESULT
    @lpVtbl.value.get_running_class.call(this, lpclsid)
  end
  def run(this : IRunnableObject*, pbc : IBindCtx) : HRESULT
    @lpVtbl.value.run.call(this, pbc)
  end
  def is_running(this : IRunnableObject*) : LibC::BOOL
    @lpVtbl.value.is_running.call(this)
  end
  def lock_running(this : IRunnableObject*, flock : LibC::BOOL, flastunlockcloses : LibC::BOOL) : HRESULT
    @lpVtbl.value.lock_running.call(this, flock, flastunlockcloses)
  end
  def set_contained_object(this : IRunnableObject*, fcontained : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_contained_object.call(this, fcontained)
  end
end
struct LibWin32::IRunningObjectTable
  def query_interface(this : IRunningObjectTable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRunningObjectTable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRunningObjectTable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register(this : IRunningObjectTable*, grfflags : UInt32, punkobject : IUnknown, pmkobjectname : IMoniker, pdwregister : UInt32*) : HRESULT
    @lpVtbl.value.register.call(this, grfflags, punkobject, pmkobjectname, pdwregister)
  end
  def revoke(this : IRunningObjectTable*, dwregister : UInt32) : HRESULT
    @lpVtbl.value.revoke.call(this, dwregister)
  end
  def is_running(this : IRunningObjectTable*, pmkobjectname : IMoniker) : HRESULT
    @lpVtbl.value.is_running.call(this, pmkobjectname)
  end
  def get_object(this : IRunningObjectTable*, pmkobjectname : IMoniker, ppunkobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_object.call(this, pmkobjectname, ppunkobject)
  end
  def note_change_time(this : IRunningObjectTable*, dwregister : UInt32, pfiletime : FILETIME*) : HRESULT
    @lpVtbl.value.note_change_time.call(this, dwregister, pfiletime)
  end
  def get_time_of_last_change(this : IRunningObjectTable*, pmkobjectname : IMoniker, pfiletime : FILETIME*) : HRESULT
    @lpVtbl.value.get_time_of_last_change.call(this, pmkobjectname, pfiletime)
  end
  def enum_running(this : IRunningObjectTable*, ppenummoniker : IEnumMoniker*) : HRESULT
    @lpVtbl.value.enum_running.call(this, ppenummoniker)
  end
end
struct LibWin32::IPersist
  def query_interface(this : IPersist*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPersist*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPersist*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_class_id(this : IPersist*, pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.call(this, pclassid)
  end
end
struct LibWin32::IPersistStream
  def query_interface(this : IPersistStream*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPersistStream*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPersistStream*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_class_id(this : IPersistStream*, pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.call(this, pclassid)
  end
  def is_dirty(this : IPersistStream*) : HRESULT
    @lpVtbl.value.is_dirty.call(this)
  end
  def load(this : IPersistStream*, pstm : IStream) : HRESULT
    @lpVtbl.value.load.call(this, pstm)
  end
  def save(this : IPersistStream*, pstm : IStream, fcleardirty : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.call(this, pstm, fcleardirty)
  end
  def get_size_max(this : IPersistStream*, pcbsize : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_size_max.call(this, pcbsize)
  end
end
struct LibWin32::IMoniker
  def query_interface(this : IMoniker*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMoniker*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMoniker*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_class_id(this : IMoniker*, pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.call(this, pclassid)
  end
  def is_dirty(this : IMoniker*) : HRESULT
    @lpVtbl.value.is_dirty.call(this)
  end
  def load(this : IMoniker*, pstm : IStream) : HRESULT
    @lpVtbl.value.load.call(this, pstm)
  end
  def save(this : IMoniker*, pstm : IStream, fcleardirty : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.call(this, pstm, fcleardirty)
  end
  def get_size_max(this : IMoniker*, pcbsize : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_size_max.call(this, pcbsize)
  end
  def bind_to_object(this : IMoniker*, pbc : IBindCtx, pmktoleft : IMoniker, riidresult : Guid*, ppvresult : Void**) : HRESULT
    @lpVtbl.value.bind_to_object.call(this, pbc, pmktoleft, riidresult, ppvresult)
  end
  def bind_to_storage(this : IMoniker*, pbc : IBindCtx, pmktoleft : IMoniker, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.bind_to_storage.call(this, pbc, pmktoleft, riid, ppvobj)
  end
  def reduce(this : IMoniker*, pbc : IBindCtx, dwreducehowfar : UInt32, ppmktoleft : IMoniker*, ppmkreduced : IMoniker*) : HRESULT
    @lpVtbl.value.reduce.call(this, pbc, dwreducehowfar, ppmktoleft, ppmkreduced)
  end
  def compose_with(this : IMoniker*, pmkright : IMoniker, fonlyifnotgeneric : LibC::BOOL, ppmkcomposite : IMoniker*) : HRESULT
    @lpVtbl.value.compose_with.call(this, pmkright, fonlyifnotgeneric, ppmkcomposite)
  end
  def enum(this : IMoniker*, fforward : LibC::BOOL, ppenummoniker : IEnumMoniker*) : HRESULT
    @lpVtbl.value.enum.call(this, fforward, ppenummoniker)
  end
  def is_equal(this : IMoniker*, pmkothermoniker : IMoniker) : HRESULT
    @lpVtbl.value.is_equal.call(this, pmkothermoniker)
  end
  def hash(this : IMoniker*, pdwhash : UInt32*) : HRESULT
    @lpVtbl.value.hash.call(this, pdwhash)
  end
  def is_running(this : IMoniker*, pbc : IBindCtx, pmktoleft : IMoniker, pmknewlyrunning : IMoniker) : HRESULT
    @lpVtbl.value.is_running.call(this, pbc, pmktoleft, pmknewlyrunning)
  end
  def get_time_of_last_change(this : IMoniker*, pbc : IBindCtx, pmktoleft : IMoniker, pfiletime : FILETIME*) : HRESULT
    @lpVtbl.value.get_time_of_last_change.call(this, pbc, pmktoleft, pfiletime)
  end
  def inverse(this : IMoniker*, ppmk : IMoniker*) : HRESULT
    @lpVtbl.value.inverse.call(this, ppmk)
  end
  def common_prefix_with(this : IMoniker*, pmkother : IMoniker, ppmkprefix : IMoniker*) : HRESULT
    @lpVtbl.value.common_prefix_with.call(this, pmkother, ppmkprefix)
  end
  def relative_path_to(this : IMoniker*, pmkother : IMoniker, ppmkrelpath : IMoniker*) : HRESULT
    @lpVtbl.value.relative_path_to.call(this, pmkother, ppmkrelpath)
  end
  def get_display_name(this : IMoniker*, pbc : IBindCtx, pmktoleft : IMoniker, ppszdisplayname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pbc, pmktoleft, ppszdisplayname)
  end
  def parse_display_name(this : IMoniker*, pbc : IBindCtx, pmktoleft : IMoniker, pszdisplayname : LibC::LPWSTR, pcheaten : UInt32*, ppmkout : IMoniker*) : HRESULT
    @lpVtbl.value.parse_display_name.call(this, pbc, pmktoleft, pszdisplayname, pcheaten, ppmkout)
  end
  def is_system_moniker(this : IMoniker*, pdwmksys : UInt32*) : HRESULT
    @lpVtbl.value.is_system_moniker.call(this, pdwmksys)
  end
end
struct LibWin32::IROTData
  def query_interface(this : IROTData*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IROTData*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IROTData*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_comparison_data(this : IROTData*, pbdata : UInt8*, cbmax : UInt32, pcbdata : UInt32*) : HRESULT
    @lpVtbl.value.get_comparison_data.call(this, pbdata, cbmax, pcbdata)
  end
end
struct LibWin32::IPersistFile
  def query_interface(this : IPersistFile*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPersistFile*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPersistFile*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_class_id(this : IPersistFile*, pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.call(this, pclassid)
  end
  def is_dirty(this : IPersistFile*) : HRESULT
    @lpVtbl.value.is_dirty.call(this)
  end
  def load(this : IPersistFile*, pszfilename : LibC::LPWSTR, dwmode : UInt32) : HRESULT
    @lpVtbl.value.load.call(this, pszfilename, dwmode)
  end
  def save(this : IPersistFile*, pszfilename : LibC::LPWSTR, fremember : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.call(this, pszfilename, fremember)
  end
  def save_completed(this : IPersistFile*, pszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_completed.call(this, pszfilename)
  end
  def get_cur_file(this : IPersistFile*, ppszfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_cur_file.call(this, ppszfilename)
  end
end
struct LibWin32::IEnumFORMATETC
  def query_interface(this : IEnumFORMATETC*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumFORMATETC*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumFORMATETC*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumFORMATETC*, celt : UInt32, rgelt : FORMATETC*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumFORMATETC*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumFORMATETC*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumFORMATETC*, ppenum : IEnumFORMATETC*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IEnumSTATDATA
  def query_interface(this : IEnumSTATDATA*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumSTATDATA*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumSTATDATA*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumSTATDATA*, celt : UInt32, rgelt : STATDATA*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumSTATDATA*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumSTATDATA*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumSTATDATA*, ppenum : IEnumSTATDATA*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IAdviseSink
  def query_interface(this : IAdviseSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAdviseSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAdviseSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_data_change(this : IAdviseSink*, pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : Void
    @lpVtbl.value.on_data_change.call(this, pformatetc, pstgmed)
  end
  def on_view_change(this : IAdviseSink*, dwaspect : UInt32, lindex : Int32) : Void
    @lpVtbl.value.on_view_change.call(this, dwaspect, lindex)
  end
  def on_rename(this : IAdviseSink*, pmk : IMoniker) : Void
    @lpVtbl.value.on_rename.call(this, pmk)
  end
  def on_save(this : IAdviseSink*) : Void
    @lpVtbl.value.on_save.call(this)
  end
  def on_close(this : IAdviseSink*) : Void
    @lpVtbl.value.on_close.call(this)
  end
end
struct LibWin32::AsyncIAdviseSink
  def query_interface(this : AsyncIAdviseSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIAdviseSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIAdviseSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_on_data_change(this : AsyncIAdviseSink*, pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : Void
    @lpVtbl.value.begin_on_data_change.call(this, pformatetc, pstgmed)
  end
  def finish_on_data_change(this : AsyncIAdviseSink*) : Void
    @lpVtbl.value.finish_on_data_change.call(this)
  end
  def begin_on_view_change(this : AsyncIAdviseSink*, dwaspect : UInt32, lindex : Int32) : Void
    @lpVtbl.value.begin_on_view_change.call(this, dwaspect, lindex)
  end
  def finish_on_view_change(this : AsyncIAdviseSink*) : Void
    @lpVtbl.value.finish_on_view_change.call(this)
  end
  def begin_on_rename(this : AsyncIAdviseSink*, pmk : IMoniker) : Void
    @lpVtbl.value.begin_on_rename.call(this, pmk)
  end
  def finish_on_rename(this : AsyncIAdviseSink*) : Void
    @lpVtbl.value.finish_on_rename.call(this)
  end
  def begin_on_save(this : AsyncIAdviseSink*) : Void
    @lpVtbl.value.begin_on_save.call(this)
  end
  def finish_on_save(this : AsyncIAdviseSink*) : Void
    @lpVtbl.value.finish_on_save.call(this)
  end
  def begin_on_close(this : AsyncIAdviseSink*) : Void
    @lpVtbl.value.begin_on_close.call(this)
  end
  def finish_on_close(this : AsyncIAdviseSink*) : Void
    @lpVtbl.value.finish_on_close.call(this)
  end
end
struct LibWin32::IAdviseSink2
  def query_interface(this : IAdviseSink2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAdviseSink2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAdviseSink2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_data_change(this : IAdviseSink2*, pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : Void
    @lpVtbl.value.on_data_change.call(this, pformatetc, pstgmed)
  end
  def on_view_change(this : IAdviseSink2*, dwaspect : UInt32, lindex : Int32) : Void
    @lpVtbl.value.on_view_change.call(this, dwaspect, lindex)
  end
  def on_rename(this : IAdviseSink2*, pmk : IMoniker) : Void
    @lpVtbl.value.on_rename.call(this, pmk)
  end
  def on_save(this : IAdviseSink2*) : Void
    @lpVtbl.value.on_save.call(this)
  end
  def on_close(this : IAdviseSink2*) : Void
    @lpVtbl.value.on_close.call(this)
  end
  def on_link_src_change(this : IAdviseSink2*, pmk : IMoniker) : Void
    @lpVtbl.value.on_link_src_change.call(this, pmk)
  end
end
struct LibWin32::AsyncIAdviseSink2
  def query_interface(this : AsyncIAdviseSink2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIAdviseSink2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIAdviseSink2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_on_data_change(this : AsyncIAdviseSink2*, pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : Void
    @lpVtbl.value.begin_on_data_change.call(this, pformatetc, pstgmed)
  end
  def finish_on_data_change(this : AsyncIAdviseSink2*) : Void
    @lpVtbl.value.finish_on_data_change.call(this)
  end
  def begin_on_view_change(this : AsyncIAdviseSink2*, dwaspect : UInt32, lindex : Int32) : Void
    @lpVtbl.value.begin_on_view_change.call(this, dwaspect, lindex)
  end
  def finish_on_view_change(this : AsyncIAdviseSink2*) : Void
    @lpVtbl.value.finish_on_view_change.call(this)
  end
  def begin_on_rename(this : AsyncIAdviseSink2*, pmk : IMoniker) : Void
    @lpVtbl.value.begin_on_rename.call(this, pmk)
  end
  def finish_on_rename(this : AsyncIAdviseSink2*) : Void
    @lpVtbl.value.finish_on_rename.call(this)
  end
  def begin_on_save(this : AsyncIAdviseSink2*) : Void
    @lpVtbl.value.begin_on_save.call(this)
  end
  def finish_on_save(this : AsyncIAdviseSink2*) : Void
    @lpVtbl.value.finish_on_save.call(this)
  end
  def begin_on_close(this : AsyncIAdviseSink2*) : Void
    @lpVtbl.value.begin_on_close.call(this)
  end
  def finish_on_close(this : AsyncIAdviseSink2*) : Void
    @lpVtbl.value.finish_on_close.call(this)
  end
  def begin_on_link_src_change(this : AsyncIAdviseSink2*, pmk : IMoniker) : Void
    @lpVtbl.value.begin_on_link_src_change.call(this, pmk)
  end
  def finish_on_link_src_change(this : AsyncIAdviseSink2*) : Void
    @lpVtbl.value.finish_on_link_src_change.call(this)
  end
end
struct LibWin32::IDataObject
  def query_interface(this : IDataObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDataObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDataObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_data(this : IDataObject*, pformatetcin : FORMATETC*, pmedium : STGMEDIUM*) : HRESULT
    @lpVtbl.value.get_data.call(this, pformatetcin, pmedium)
  end
  def get_data_here(this : IDataObject*, pformatetc : FORMATETC*, pmedium : STGMEDIUM*) : HRESULT
    @lpVtbl.value.get_data_here.call(this, pformatetc, pmedium)
  end
  def query_get_data(this : IDataObject*, pformatetc : FORMATETC*) : HRESULT
    @lpVtbl.value.query_get_data.call(this, pformatetc)
  end
  def get_canonical_format_etc(this : IDataObject*, pformatectin : FORMATETC*, pformatetcout : FORMATETC*) : HRESULT
    @lpVtbl.value.get_canonical_format_etc.call(this, pformatectin, pformatetcout)
  end
  def set_data(this : IDataObject*, pformatetc : FORMATETC*, pmedium : STGMEDIUM*, frelease : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_data.call(this, pformatetc, pmedium, frelease)
  end
  def enum_format_etc(this : IDataObject*, dwdirection : UInt32, ppenumformatetc : IEnumFORMATETC*) : HRESULT
    @lpVtbl.value.enum_format_etc.call(this, dwdirection, ppenumformatetc)
  end
  def d_advise(this : IDataObject*, pformatetc : FORMATETC*, advf : UInt32, padvsink : IAdviseSink, pdwconnection : UInt32*) : HRESULT
    @lpVtbl.value.d_advise.call(this, pformatetc, advf, padvsink, pdwconnection)
  end
  def d_unadvise(this : IDataObject*, dwconnection : UInt32) : HRESULT
    @lpVtbl.value.d_unadvise.call(this, dwconnection)
  end
  def enum_d_advise(this : IDataObject*, ppenumadvise : IEnumSTATDATA*) : HRESULT
    @lpVtbl.value.enum_d_advise.call(this, ppenumadvise)
  end
end
struct LibWin32::IDataAdviseHolder
  def query_interface(this : IDataAdviseHolder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDataAdviseHolder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDataAdviseHolder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def advise(this : IDataAdviseHolder*, pdataobject : IDataObject, pfetc : FORMATETC*, advf : UInt32, padvise : IAdviseSink, pdwconnection : UInt32*) : HRESULT
    @lpVtbl.value.advise.call(this, pdataobject, pfetc, advf, padvise, pdwconnection)
  end
  def unadvise(this : IDataAdviseHolder*, dwconnection : UInt32) : HRESULT
    @lpVtbl.value.unadvise.call(this, dwconnection)
  end
  def enum_advise(this : IDataAdviseHolder*, ppenumadvise : IEnumSTATDATA*) : HRESULT
    @lpVtbl.value.enum_advise.call(this, ppenumadvise)
  end
  def send_on_data_change(this : IDataAdviseHolder*, pdataobject : IDataObject, dwreserved : UInt32, advf : UInt32) : HRESULT
    @lpVtbl.value.send_on_data_change.call(this, pdataobject, dwreserved, advf)
  end
end
struct LibWin32::IClassActivator
  def query_interface(this : IClassActivator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IClassActivator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IClassActivator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_class_object(this : IClassActivator*, rclsid : Guid*, dwclasscontext : UInt32, locale : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_class_object.call(this, rclsid, dwclasscontext, locale, riid, ppv)
  end
end
struct LibWin32::IProgressNotify
  def query_interface(this : IProgressNotify*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IProgressNotify*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IProgressNotify*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_progress(this : IProgressNotify*, dwprogresscurrent : UInt32, dwprogressmaximum : UInt32, faccurate : LibC::BOOL, fowner : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_progress.call(this, dwprogresscurrent, dwprogressmaximum, faccurate, fowner)
  end
end
struct LibWin32::IBlockingLock
  def query_interface(this : IBlockingLock*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IBlockingLock*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IBlockingLock*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def lock(this : IBlockingLock*, dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.lock.call(this, dwtimeout)
  end
  def unlock(this : IBlockingLock*) : HRESULT
    @lpVtbl.value.unlock.call(this)
  end
end
struct LibWin32::ITimeAndNoticeControl
  def query_interface(this : ITimeAndNoticeControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITimeAndNoticeControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITimeAndNoticeControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def suppress_changes(this : ITimeAndNoticeControl*, res1 : UInt32, res2 : UInt32) : HRESULT
    @lpVtbl.value.suppress_changes.call(this, res1, res2)
  end
end
struct LibWin32::IOplockStorage
  def query_interface(this : IOplockStorage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOplockStorage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOplockStorage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_storage_ex(this : IOplockStorage*, pwcsname : LibC::LPWSTR, grfmode : UInt32, stgfmt : UInt32, grfattrs : UInt32, riid : Guid*, ppstgopen : Void**) : HRESULT
    @lpVtbl.value.create_storage_ex.call(this, pwcsname, grfmode, stgfmt, grfattrs, riid, ppstgopen)
  end
  def open_storage_ex(this : IOplockStorage*, pwcsname : LibC::LPWSTR, grfmode : UInt32, stgfmt : UInt32, grfattrs : UInt32, riid : Guid*, ppstgopen : Void**) : HRESULT
    @lpVtbl.value.open_storage_ex.call(this, pwcsname, grfmode, stgfmt, grfattrs, riid, ppstgopen)
  end
end
struct LibWin32::IUrlMon
  def query_interface(this : IUrlMon*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUrlMon*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUrlMon*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def async_get_class_bits(this : IUrlMon*, rclsid : Guid*, psztype : LibC::LPWSTR, pszext : LibC::LPWSTR, dwfileversionms : UInt32, dwfileversionls : UInt32, pszcodebase : LibC::LPWSTR, pbc : IBindCtx, dwclasscontext : UInt32, riid : Guid*, flags : UInt32) : HRESULT
    @lpVtbl.value.async_get_class_bits.call(this, rclsid, psztype, pszext, dwfileversionms, dwfileversionls, pszcodebase, pbc, dwclasscontext, riid, flags)
  end
end
struct LibWin32::IForegroundTransfer
  def query_interface(this : IForegroundTransfer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IForegroundTransfer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IForegroundTransfer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def allow_foreground_transfer(this : IForegroundTransfer*, lpvreserved : Void*) : HRESULT
    @lpVtbl.value.allow_foreground_transfer.call(this, lpvreserved)
  end
end
struct LibWin32::IProcessLock
  def query_interface(this : IProcessLock*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IProcessLock*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IProcessLock*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_ref_on_process(this : IProcessLock*) : UInt32
    @lpVtbl.value.add_ref_on_process.call(this)
  end
  def release_ref_on_process(this : IProcessLock*) : UInt32
    @lpVtbl.value.release_ref_on_process.call(this)
  end
end
struct LibWin32::ISurrogateService
  def query_interface(this : ISurrogateService*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISurrogateService*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISurrogateService*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def init(this : ISurrogateService*, rguidprocessid : Guid*, pprocesslock : IProcessLock, pfapplicationaware : LibC::BOOL*) : HRESULT
    @lpVtbl.value.init.call(this, rguidprocessid, pprocesslock, pfapplicationaware)
  end
  def application_launch(this : ISurrogateService*, rguidapplid : Guid*, apptype : ApplicationType) : HRESULT
    @lpVtbl.value.application_launch.call(this, rguidapplid, apptype)
  end
  def application_free(this : ISurrogateService*, rguidapplid : Guid*) : HRESULT
    @lpVtbl.value.application_free.call(this, rguidapplid)
  end
  def catalog_refresh(this : ISurrogateService*, ulreserved : UInt32) : HRESULT
    @lpVtbl.value.catalog_refresh.call(this, ulreserved)
  end
  def process_shutdown(this : ISurrogateService*, shutdowntype : ShutdownType) : HRESULT
    @lpVtbl.value.process_shutdown.call(this, shutdowntype)
  end
end
struct LibWin32::IInitializeSpy
  def query_interface(this : IInitializeSpy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInitializeSpy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInitializeSpy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def pre_initialize(this : IInitializeSpy*, dwcoinit : UInt32, dwcurthreadaptrefs : UInt32) : HRESULT
    @lpVtbl.value.pre_initialize.call(this, dwcoinit, dwcurthreadaptrefs)
  end
  def post_initialize(this : IInitializeSpy*, hrcoinit : HRESULT, dwcoinit : UInt32, dwnewthreadaptrefs : UInt32) : HRESULT
    @lpVtbl.value.post_initialize.call(this, hrcoinit, dwcoinit, dwnewthreadaptrefs)
  end
  def pre_uninitialize(this : IInitializeSpy*, dwcurthreadaptrefs : UInt32) : HRESULT
    @lpVtbl.value.pre_uninitialize.call(this, dwcurthreadaptrefs)
  end
  def post_uninitialize(this : IInitializeSpy*, dwnewthreadaptrefs : UInt32) : HRESULT
    @lpVtbl.value.post_uninitialize.call(this, dwnewthreadaptrefs)
  end
end
struct LibWin32::IServiceProvider
  def query_interface(this : IServiceProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_service(this : IServiceProvider*, guidservice : Guid*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_service.call(this, guidservice, riid, ppvobject)
  end
end
struct LibWin32::IEnumGUID
  def query_interface(this : IEnumGUID*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumGUID*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumGUID*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumGUID*, celt : UInt32, rgelt : Guid*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumGUID*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumGUID*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumGUID*, ppenum : IEnumGUID*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IEnumCATEGORYINFO
  def query_interface(this : IEnumCATEGORYINFO*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumCATEGORYINFO*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumCATEGORYINFO*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumCATEGORYINFO*, celt : UInt32, rgelt : CATEGORYINFO*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumCATEGORYINFO*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumCATEGORYINFO*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumCATEGORYINFO*, ppenum : IEnumCATEGORYINFO*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::ICatRegister
  def query_interface(this : ICatRegister*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICatRegister*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICatRegister*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_categories(this : ICatRegister*, ccategories : UInt32, rgcategoryinfo : CATEGORYINFO*) : HRESULT
    @lpVtbl.value.register_categories.call(this, ccategories, rgcategoryinfo)
  end
  def un_register_categories(this : ICatRegister*, ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.un_register_categories.call(this, ccategories, rgcatid)
  end
  def register_class_impl_categories(this : ICatRegister*, rclsid : Guid*, ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.register_class_impl_categories.call(this, rclsid, ccategories, rgcatid)
  end
  def un_register_class_impl_categories(this : ICatRegister*, rclsid : Guid*, ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.un_register_class_impl_categories.call(this, rclsid, ccategories, rgcatid)
  end
  def register_class_req_categories(this : ICatRegister*, rclsid : Guid*, ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.register_class_req_categories.call(this, rclsid, ccategories, rgcatid)
  end
  def un_register_class_req_categories(this : ICatRegister*, rclsid : Guid*, ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.un_register_class_req_categories.call(this, rclsid, ccategories, rgcatid)
  end
end
struct LibWin32::ICatInformation
  def query_interface(this : ICatInformation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICatInformation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICatInformation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enum_categories(this : ICatInformation*, lcid : UInt32, ppenumcategoryinfo : IEnumCATEGORYINFO*) : HRESULT
    @lpVtbl.value.enum_categories.call(this, lcid, ppenumcategoryinfo)
  end
  def get_category_desc(this : ICatInformation*, rcatid : Guid*, lcid : UInt32, pszdesc : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_category_desc.call(this, rcatid, lcid, pszdesc)
  end
  def enum_classes_of_categories(this : ICatInformation*, cimplemented : UInt32, rgcatidimpl : Guid*, crequired : UInt32, rgcatidreq : Guid*, ppenumclsid : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_classes_of_categories.call(this, cimplemented, rgcatidimpl, crequired, rgcatidreq, ppenumclsid)
  end
  def is_class_of_categories(this : ICatInformation*, rclsid : Guid*, cimplemented : UInt32, rgcatidimpl : Guid*, crequired : UInt32, rgcatidreq : Guid*) : HRESULT
    @lpVtbl.value.is_class_of_categories.call(this, rclsid, cimplemented, rgcatidimpl, crequired, rgcatidreq)
  end
  def enum_impl_categories_of_class(this : ICatInformation*, rclsid : Guid*, ppenumcatid : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_impl_categories_of_class.call(this, rclsid, ppenumcatid)
  end
  def enum_req_categories_of_class(this : ICatInformation*, rclsid : Guid*, ppenumcatid : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_req_categories_of_class.call(this, rclsid, ppenumcatid)
  end
end
struct LibWin32::IContextCallback
  def query_interface(this : IContextCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContextCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContextCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def context_callback(this : IContextCallback*, pfncallback : PFNCONTEXTCALL, pparam : ComCallData*, riid : Guid*, imethod : Int32, punk : IUnknown) : HRESULT
    @lpVtbl.value.context_callback.call(this, pfncallback, pparam, riid, imethod, punk)
  end
end
struct LibWin32::IBinding
  def query_interface(this : IBinding*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IBinding*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IBinding*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def abort(this : IBinding*) : HRESULT
    @lpVtbl.value.abort.call(this)
  end
  def suspend(this : IBinding*) : HRESULT
    @lpVtbl.value.suspend.call(this)
  end
  def resume(this : IBinding*) : HRESULT
    @lpVtbl.value.resume.call(this)
  end
  def set_priority(this : IBinding*, npriority : Int32) : HRESULT
    @lpVtbl.value.set_priority.call(this, npriority)
  end
  def get_priority(this : IBinding*, pnpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, pnpriority)
  end
  def get_bind_result(this : IBinding*, pclsidprotocol : Guid*, pdwresult : UInt32*, pszresult : LibC::LPWSTR*, pdwreserved : UInt32*) : HRESULT
    @lpVtbl.value.get_bind_result.call(this, pclsidprotocol, pdwresult, pszresult, pdwreserved)
  end
end
struct LibWin32::IBindStatusCallback
  def query_interface(this : IBindStatusCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IBindStatusCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IBindStatusCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_start_binding(this : IBindStatusCallback*, dwreserved : UInt32, pib : IBinding) : HRESULT
    @lpVtbl.value.on_start_binding.call(this, dwreserved, pib)
  end
  def get_priority(this : IBindStatusCallback*, pnpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, pnpriority)
  end
  def on_low_resource(this : IBindStatusCallback*, reserved : UInt32) : HRESULT
    @lpVtbl.value.on_low_resource.call(this, reserved)
  end
  def on_progress(this : IBindStatusCallback*, ulprogress : UInt32, ulprogressmax : UInt32, ulstatuscode : UInt32, szstatustext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_progress.call(this, ulprogress, ulprogressmax, ulstatuscode, szstatustext)
  end
  def on_stop_binding(this : IBindStatusCallback*, hresult : HRESULT, szerror : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_stop_binding.call(this, hresult, szerror)
  end
  def get_bind_info(this : IBindStatusCallback*, grfbindf : UInt32*, pbindinfo : BINDINFO*) : HRESULT
    @lpVtbl.value.get_bind_info.call(this, grfbindf, pbindinfo)
  end
  def on_data_available(this : IBindStatusCallback*, grfbscf : UInt32, dwsize : UInt32, pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : HRESULT
    @lpVtbl.value.on_data_available.call(this, grfbscf, dwsize, pformatetc, pstgmed)
  end
  def on_object_available(this : IBindStatusCallback*, riid : Guid*, punk : IUnknown) : HRESULT
    @lpVtbl.value.on_object_available.call(this, riid, punk)
  end
end
struct LibWin32::IBindStatusCallbackEx
  def query_interface(this : IBindStatusCallbackEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IBindStatusCallbackEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IBindStatusCallbackEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_start_binding(this : IBindStatusCallbackEx*, dwreserved : UInt32, pib : IBinding) : HRESULT
    @lpVtbl.value.on_start_binding.call(this, dwreserved, pib)
  end
  def get_priority(this : IBindStatusCallbackEx*, pnpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, pnpriority)
  end
  def on_low_resource(this : IBindStatusCallbackEx*, reserved : UInt32) : HRESULT
    @lpVtbl.value.on_low_resource.call(this, reserved)
  end
  def on_progress(this : IBindStatusCallbackEx*, ulprogress : UInt32, ulprogressmax : UInt32, ulstatuscode : UInt32, szstatustext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_progress.call(this, ulprogress, ulprogressmax, ulstatuscode, szstatustext)
  end
  def on_stop_binding(this : IBindStatusCallbackEx*, hresult : HRESULT, szerror : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_stop_binding.call(this, hresult, szerror)
  end
  def get_bind_info(this : IBindStatusCallbackEx*, grfbindf : UInt32*, pbindinfo : BINDINFO*) : HRESULT
    @lpVtbl.value.get_bind_info.call(this, grfbindf, pbindinfo)
  end
  def on_data_available(this : IBindStatusCallbackEx*, grfbscf : UInt32, dwsize : UInt32, pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : HRESULT
    @lpVtbl.value.on_data_available.call(this, grfbscf, dwsize, pformatetc, pstgmed)
  end
  def on_object_available(this : IBindStatusCallbackEx*, riid : Guid*, punk : IUnknown) : HRESULT
    @lpVtbl.value.on_object_available.call(this, riid, punk)
  end
  def get_bind_info_ex(this : IBindStatusCallbackEx*, grfbindf : UInt32*, pbindinfo : BINDINFO*, grfbindf2 : UInt32*, pdwreserved : UInt32*) : HRESULT
    @lpVtbl.value.get_bind_info_ex.call(this, grfbindf, pbindinfo, grfbindf2, pdwreserved)
  end
end
struct LibWin32::IAuthenticate
  def query_interface(this : IAuthenticate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAuthenticate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAuthenticate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def authenticate(this : IAuthenticate*, phwnd : HANDLE*, pszusername : LibC::LPWSTR*, pszpassword : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.authenticate.call(this, phwnd, pszusername, pszpassword)
  end
end
struct LibWin32::IAuthenticateEx
  def query_interface(this : IAuthenticateEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAuthenticateEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAuthenticateEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def authenticate(this : IAuthenticateEx*, phwnd : HANDLE*, pszusername : LibC::LPWSTR*, pszpassword : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.authenticate.call(this, phwnd, pszusername, pszpassword)
  end
  def authenticate_ex(this : IAuthenticateEx*, phwnd : HANDLE*, pszusername : LibC::LPWSTR*, pszpassword : LibC::LPWSTR*, pauthinfo : AUTHENTICATEINFO*) : HRESULT
    @lpVtbl.value.authenticate_ex.call(this, phwnd, pszusername, pszpassword, pauthinfo)
  end
end
struct LibWin32::IUri
  def query_interface(this : IUri*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUri*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUri*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_property_bstr(this : IUri*, uriprop : Uri_PROPERTY, pbstrproperty : UInt8**, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_bstr.call(this, uriprop, pbstrproperty, dwflags)
  end
  def get_property_length(this : IUri*, uriprop : Uri_PROPERTY, pcchproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_length.call(this, uriprop, pcchproperty, dwflags)
  end
  def get_property_dword(this : IUri*, uriprop : Uri_PROPERTY, pdwproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_dword.call(this, uriprop, pdwproperty, dwflags)
  end
  def has_property(this : IUri*, uriprop : Uri_PROPERTY, pfhasproperty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_property.call(this, uriprop, pfhasproperty)
  end
  def get_absolute_uri(this : IUri*, pbstrabsoluteuri : UInt8**) : HRESULT
    @lpVtbl.value.get_absolute_uri.call(this, pbstrabsoluteuri)
  end
  def get_authority(this : IUri*, pbstrauthority : UInt8**) : HRESULT
    @lpVtbl.value.get_authority.call(this, pbstrauthority)
  end
  def get_display_uri(this : IUri*, pbstrdisplaystring : UInt8**) : HRESULT
    @lpVtbl.value.get_display_uri.call(this, pbstrdisplaystring)
  end
  def get_domain(this : IUri*, pbstrdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, pbstrdomain)
  end
  def get_extension(this : IUri*, pbstrextension : UInt8**) : HRESULT
    @lpVtbl.value.get_extension.call(this, pbstrextension)
  end
  def get_fragment(this : IUri*, pbstrfragment : UInt8**) : HRESULT
    @lpVtbl.value.get_fragment.call(this, pbstrfragment)
  end
  def get_host(this : IUri*, pbstrhost : UInt8**) : HRESULT
    @lpVtbl.value.get_host.call(this, pbstrhost)
  end
  def get_password(this : IUri*, pbstrpassword : UInt8**) : HRESULT
    @lpVtbl.value.get_password.call(this, pbstrpassword)
  end
  def get_path(this : IUri*, pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, pbstrpath)
  end
  def get_path_and_query(this : IUri*, pbstrpathandquery : UInt8**) : HRESULT
    @lpVtbl.value.get_path_and_query.call(this, pbstrpathandquery)
  end
  def get_query(this : IUri*, pbstrquery : UInt8**) : HRESULT
    @lpVtbl.value.get_query.call(this, pbstrquery)
  end
  def get_raw_uri(this : IUri*, pbstrrawuri : UInt8**) : HRESULT
    @lpVtbl.value.get_raw_uri.call(this, pbstrrawuri)
  end
  def get_scheme_name(this : IUri*, pbstrschemename : UInt8**) : HRESULT
    @lpVtbl.value.get_scheme_name.call(this, pbstrschemename)
  end
  def get_user_info(this : IUri*, pbstruserinfo : UInt8**) : HRESULT
    @lpVtbl.value.get_user_info.call(this, pbstruserinfo)
  end
  def get_user_name(this : IUri*, pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.call(this, pbstrusername)
  end
  def get_host_type(this : IUri*, pdwhosttype : UInt32*) : HRESULT
    @lpVtbl.value.get_host_type.call(this, pdwhosttype)
  end
  def get_port(this : IUri*, pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_port.call(this, pdwport)
  end
  def get_scheme(this : IUri*, pdwscheme : UInt32*) : HRESULT
    @lpVtbl.value.get_scheme.call(this, pdwscheme)
  end
  def get_zone(this : IUri*, pdwzone : UInt32*) : HRESULT
    @lpVtbl.value.get_zone.call(this, pdwzone)
  end
  def get_properties(this : IUri*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_properties.call(this, pdwflags)
  end
  def is_equal(this : IUri*, puri : IUri, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal.call(this, puri, pfequal)
  end
end
struct LibWin32::IUriBuilder
  def query_interface(this : IUriBuilder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUriBuilder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUriBuilder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_uri_simple(this : IUriBuilder*, dwallowencodingpropertymask : UInt32, dwreserved : LibC::UINT_PTR, ppiuri : IUri*) : HRESULT
    @lpVtbl.value.create_uri_simple.call(this, dwallowencodingpropertymask, dwreserved, ppiuri)
  end
  def create_uri(this : IUriBuilder*, dwcreateflags : UInt32, dwallowencodingpropertymask : UInt32, dwreserved : LibC::UINT_PTR, ppiuri : IUri*) : HRESULT
    @lpVtbl.value.create_uri.call(this, dwcreateflags, dwallowencodingpropertymask, dwreserved, ppiuri)
  end
  def create_uri_with_flags(this : IUriBuilder*, dwcreateflags : UInt32, dwuribuilderflags : UInt32, dwallowencodingpropertymask : UInt32, dwreserved : LibC::UINT_PTR, ppiuri : IUri*) : HRESULT
    @lpVtbl.value.create_uri_with_flags.call(this, dwcreateflags, dwuribuilderflags, dwallowencodingpropertymask, dwreserved, ppiuri)
  end
  def get_i_uri(this : IUriBuilder*, ppiuri : IUri*) : HRESULT
    @lpVtbl.value.get_i_uri.call(this, ppiuri)
  end
  def set_i_uri(this : IUriBuilder*, piuri : IUri) : HRESULT
    @lpVtbl.value.set_i_uri.call(this, piuri)
  end
  def get_fragment(this : IUriBuilder*, pcchfragment : UInt32*, ppwzfragment : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_fragment.call(this, pcchfragment, ppwzfragment)
  end
  def get_host(this : IUriBuilder*, pcchhost : UInt32*, ppwzhost : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_host.call(this, pcchhost, ppwzhost)
  end
  def get_password(this : IUriBuilder*, pcchpassword : UInt32*, ppwzpassword : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_password.call(this, pcchpassword, ppwzpassword)
  end
  def get_path(this : IUriBuilder*, pcchpath : UInt32*, ppwzpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.call(this, pcchpath, ppwzpath)
  end
  def get_port(this : IUriBuilder*, pfhasport : LibC::BOOL*, pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_port.call(this, pfhasport, pdwport)
  end
  def get_query(this : IUriBuilder*, pcchquery : UInt32*, ppwzquery : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_query.call(this, pcchquery, ppwzquery)
  end
  def get_scheme_name(this : IUriBuilder*, pcchschemename : UInt32*, ppwzschemename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_scheme_name.call(this, pcchschemename, ppwzschemename)
  end
  def get_user_name(this : IUriBuilder*, pcchusername : UInt32*, ppwzusername : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_user_name.call(this, pcchusername, ppwzusername)
  end
  def set_fragment(this : IUriBuilder*, pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_fragment.call(this, pwznewvalue)
  end
  def set_host(this : IUriBuilder*, pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_host.call(this, pwznewvalue)
  end
  def set_password(this : IUriBuilder*, pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_password.call(this, pwznewvalue)
  end
  def set_path(this : IUriBuilder*, pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_path.call(this, pwznewvalue)
  end
  def set_port(this : IUriBuilder*, fhasport : LibC::BOOL, dwnewvalue : UInt32) : HRESULT
    @lpVtbl.value.set_port.call(this, fhasport, dwnewvalue)
  end
  def set_query(this : IUriBuilder*, pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_query.call(this, pwznewvalue)
  end
  def set_scheme_name(this : IUriBuilder*, pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_scheme_name.call(this, pwznewvalue)
  end
  def set_user_name(this : IUriBuilder*, pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_user_name.call(this, pwznewvalue)
  end
  def remove_properties(this : IUriBuilder*, dwpropertymask : UInt32) : HRESULT
    @lpVtbl.value.remove_properties.call(this, dwpropertymask)
  end
  def has_been_modified(this : IUriBuilder*, pfmodified : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_been_modified.call(this, pfmodified)
  end
end
struct LibWin32::IBindHost
  def query_interface(this : IBindHost*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IBindHost*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IBindHost*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_moniker(this : IBindHost*, szname : LibC::LPWSTR, pbc : IBindCtx, ppmk : IMoniker*, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.create_moniker.call(this, szname, pbc, ppmk, dwreserved)
  end
  def moniker_bind_to_storage(this : IBindHost*, pmk : IMoniker, pbc : IBindCtx, pbsc : IBindStatusCallback, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.moniker_bind_to_storage.call(this, pmk, pbc, pbsc, riid, ppvobj)
  end
  def moniker_bind_to_object(this : IBindHost*, pmk : IMoniker, pbc : IBindCtx, pbsc : IBindStatusCallback, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.moniker_bind_to_object.call(this, pmk, pbc, pbsc, riid, ppvobj)
  end
end
struct LibWin32::IDispatch
  def query_interface(this : IDispatch*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDispatch*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDispatch*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IDispatch*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IDispatch*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IDispatch*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IDispatch*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::ITypeComp
  def query_interface(this : ITypeComp*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITypeComp*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITypeComp*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def bind(this : ITypeComp*, szname : LibC::LPWSTR, lhashval : UInt32, wflags : UInt16, pptinfo : ITypeInfo*, pdesckind : DESCKIND*, pbindptr : BINDPTR*) : HRESULT
    @lpVtbl.value.bind.call(this, szname, lhashval, wflags, pptinfo, pdesckind, pbindptr)
  end
  def bind_type(this : ITypeComp*, szname : LibC::LPWSTR, lhashval : UInt32, pptinfo : ITypeInfo*, pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.bind_type.call(this, szname, lhashval, pptinfo, pptcomp)
  end
end
struct LibWin32::ITypeInfo
  def query_interface(this : ITypeInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITypeInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITypeInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_attr(this : ITypeInfo*, pptypeattr : TYPEATTR**) : HRESULT
    @lpVtbl.value.get_type_attr.call(this, pptypeattr)
  end
  def get_type_comp(this : ITypeInfo*, pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.get_type_comp.call(this, pptcomp)
  end
  def get_func_desc(this : ITypeInfo*, index : UInt32, ppfuncdesc : FUNCDESC**) : HRESULT
    @lpVtbl.value.get_func_desc.call(this, index, ppfuncdesc)
  end
  def get_var_desc(this : ITypeInfo*, index : UInt32, ppvardesc : VARDESC**) : HRESULT
    @lpVtbl.value.get_var_desc.call(this, index, ppvardesc)
  end
  def get_names(this : ITypeInfo*, memid : Int32, rgbstrnames : UInt8**, cmaxnames : UInt32, pcnames : UInt32*) : HRESULT
    @lpVtbl.value.get_names.call(this, memid, rgbstrnames, cmaxnames, pcnames)
  end
  def get_ref_type_of_impl_type(this : ITypeInfo*, index : UInt32, preftype : UInt32*) : HRESULT
    @lpVtbl.value.get_ref_type_of_impl_type.call(this, index, preftype)
  end
  def get_impl_type_flags(this : ITypeInfo*, index : UInt32, pimpltypeflags : Int32*) : HRESULT
    @lpVtbl.value.get_impl_type_flags.call(this, index, pimpltypeflags)
  end
  def get_i_ds_of_names(this : ITypeInfo*, rgsznames : LibC::LPWSTR*, cnames : UInt32, pmemid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, rgsznames, cnames, pmemid)
  end
  def invoke(this : ITypeInfo*, pvinstance : Void*, memid : Int32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, pvinstance, memid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_documentation(this : ITypeInfo*, memid : Int32, pbstrname : UInt8**, pbstrdocstring : UInt8**, pdwhelpcontext : UInt32*, pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.call(this, memid, pbstrname, pbstrdocstring, pdwhelpcontext, pbstrhelpfile)
  end
  def get_dll_entry(this : ITypeInfo*, memid : Int32, invkind : INVOKEKIND, pbstrdllname : UInt8**, pbstrname : UInt8**, pwordinal : UInt16*) : HRESULT
    @lpVtbl.value.get_dll_entry.call(this, memid, invkind, pbstrdllname, pbstrname, pwordinal)
  end
  def get_ref_type_info(this : ITypeInfo*, hreftype : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_ref_type_info.call(this, hreftype, pptinfo)
  end
  def address_of_member(this : ITypeInfo*, memid : Int32, invkind : INVOKEKIND, ppv : Void**) : HRESULT
    @lpVtbl.value.address_of_member.call(this, memid, invkind, ppv)
  end
  def create_instance(this : ITypeInfo*, punkouter : IUnknown, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.create_instance.call(this, punkouter, riid, ppvobj)
  end
  def get_mops(this : ITypeInfo*, memid : Int32, pbstrmops : UInt8**) : HRESULT
    @lpVtbl.value.get_mops.call(this, memid, pbstrmops)
  end
  def get_containing_type_lib(this : ITypeInfo*, pptlib : ITypeLib*, pindex : UInt32*) : HRESULT
    @lpVtbl.value.get_containing_type_lib.call(this, pptlib, pindex)
  end
  def release_type_attr(this : ITypeInfo*, ptypeattr : TYPEATTR*) : Void
    @lpVtbl.value.release_type_attr.call(this, ptypeattr)
  end
  def release_func_desc(this : ITypeInfo*, pfuncdesc : FUNCDESC*) : Void
    @lpVtbl.value.release_func_desc.call(this, pfuncdesc)
  end
  def release_var_desc(this : ITypeInfo*, pvardesc : VARDESC*) : Void
    @lpVtbl.value.release_var_desc.call(this, pvardesc)
  end
end
struct LibWin32::ITypeInfo2
  def query_interface(this : ITypeInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITypeInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITypeInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_attr(this : ITypeInfo2*, pptypeattr : TYPEATTR**) : HRESULT
    @lpVtbl.value.get_type_attr.call(this, pptypeattr)
  end
  def get_type_comp(this : ITypeInfo2*, pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.get_type_comp.call(this, pptcomp)
  end
  def get_func_desc(this : ITypeInfo2*, index : UInt32, ppfuncdesc : FUNCDESC**) : HRESULT
    @lpVtbl.value.get_func_desc.call(this, index, ppfuncdesc)
  end
  def get_var_desc(this : ITypeInfo2*, index : UInt32, ppvardesc : VARDESC**) : HRESULT
    @lpVtbl.value.get_var_desc.call(this, index, ppvardesc)
  end
  def get_names(this : ITypeInfo2*, memid : Int32, rgbstrnames : UInt8**, cmaxnames : UInt32, pcnames : UInt32*) : HRESULT
    @lpVtbl.value.get_names.call(this, memid, rgbstrnames, cmaxnames, pcnames)
  end
  def get_ref_type_of_impl_type(this : ITypeInfo2*, index : UInt32, preftype : UInt32*) : HRESULT
    @lpVtbl.value.get_ref_type_of_impl_type.call(this, index, preftype)
  end
  def get_impl_type_flags(this : ITypeInfo2*, index : UInt32, pimpltypeflags : Int32*) : HRESULT
    @lpVtbl.value.get_impl_type_flags.call(this, index, pimpltypeflags)
  end
  def get_i_ds_of_names(this : ITypeInfo2*, rgsznames : LibC::LPWSTR*, cnames : UInt32, pmemid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, rgsznames, cnames, pmemid)
  end
  def invoke(this : ITypeInfo2*, pvinstance : Void*, memid : Int32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, pvinstance, memid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_documentation(this : ITypeInfo2*, memid : Int32, pbstrname : UInt8**, pbstrdocstring : UInt8**, pdwhelpcontext : UInt32*, pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.call(this, memid, pbstrname, pbstrdocstring, pdwhelpcontext, pbstrhelpfile)
  end
  def get_dll_entry(this : ITypeInfo2*, memid : Int32, invkind : INVOKEKIND, pbstrdllname : UInt8**, pbstrname : UInt8**, pwordinal : UInt16*) : HRESULT
    @lpVtbl.value.get_dll_entry.call(this, memid, invkind, pbstrdllname, pbstrname, pwordinal)
  end
  def get_ref_type_info(this : ITypeInfo2*, hreftype : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_ref_type_info.call(this, hreftype, pptinfo)
  end
  def address_of_member(this : ITypeInfo2*, memid : Int32, invkind : INVOKEKIND, ppv : Void**) : HRESULT
    @lpVtbl.value.address_of_member.call(this, memid, invkind, ppv)
  end
  def create_instance(this : ITypeInfo2*, punkouter : IUnknown, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.create_instance.call(this, punkouter, riid, ppvobj)
  end
  def get_mops(this : ITypeInfo2*, memid : Int32, pbstrmops : UInt8**) : HRESULT
    @lpVtbl.value.get_mops.call(this, memid, pbstrmops)
  end
  def get_containing_type_lib(this : ITypeInfo2*, pptlib : ITypeLib*, pindex : UInt32*) : HRESULT
    @lpVtbl.value.get_containing_type_lib.call(this, pptlib, pindex)
  end
  def release_type_attr(this : ITypeInfo2*, ptypeattr : TYPEATTR*) : Void
    @lpVtbl.value.release_type_attr.call(this, ptypeattr)
  end
  def release_func_desc(this : ITypeInfo2*, pfuncdesc : FUNCDESC*) : Void
    @lpVtbl.value.release_func_desc.call(this, pfuncdesc)
  end
  def release_var_desc(this : ITypeInfo2*, pvardesc : VARDESC*) : Void
    @lpVtbl.value.release_var_desc.call(this, pvardesc)
  end
  def get_type_kind(this : ITypeInfo2*, ptypekind : TYPEKIND*) : HRESULT
    @lpVtbl.value.get_type_kind.call(this, ptypekind)
  end
  def get_type_flags(this : ITypeInfo2*, ptypeflags : UInt32*) : HRESULT
    @lpVtbl.value.get_type_flags.call(this, ptypeflags)
  end
  def get_func_index_of_mem_id(this : ITypeInfo2*, memid : Int32, invkind : INVOKEKIND, pfuncindex : UInt32*) : HRESULT
    @lpVtbl.value.get_func_index_of_mem_id.call(this, memid, invkind, pfuncindex)
  end
  def get_var_index_of_mem_id(this : ITypeInfo2*, memid : Int32, pvarindex : UInt32*) : HRESULT
    @lpVtbl.value.get_var_index_of_mem_id.call(this, memid, pvarindex)
  end
  def get_cust_data(this : ITypeInfo2*, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cust_data.call(this, guid, pvarval)
  end
  def get_func_cust_data(this : ITypeInfo2*, index : UInt32, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_func_cust_data.call(this, index, guid, pvarval)
  end
  def get_param_cust_data(this : ITypeInfo2*, indexfunc : UInt32, indexparam : UInt32, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_param_cust_data.call(this, indexfunc, indexparam, guid, pvarval)
  end
  def get_var_cust_data(this : ITypeInfo2*, index : UInt32, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_var_cust_data.call(this, index, guid, pvarval)
  end
  def get_impl_type_cust_data(this : ITypeInfo2*, index : UInt32, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_impl_type_cust_data.call(this, index, guid, pvarval)
  end
  def get_documentation2(this : ITypeInfo2*, memid : Int32, lcid : UInt32, pbstrhelpstring : UInt8**, pdwhelpstringcontext : UInt32*, pbstrhelpstringdll : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation2.call(this, memid, lcid, pbstrhelpstring, pdwhelpstringcontext, pbstrhelpstringdll)
  end
  def get_all_cust_data(this : ITypeInfo2*, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_cust_data.call(this, pcustdata)
  end
  def get_all_func_cust_data(this : ITypeInfo2*, index : UInt32, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_func_cust_data.call(this, index, pcustdata)
  end
  def get_all_param_cust_data(this : ITypeInfo2*, indexfunc : UInt32, indexparam : UInt32, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_param_cust_data.call(this, indexfunc, indexparam, pcustdata)
  end
  def get_all_var_cust_data(this : ITypeInfo2*, index : UInt32, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_var_cust_data.call(this, index, pcustdata)
  end
  def get_all_impl_type_cust_data(this : ITypeInfo2*, index : UInt32, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_impl_type_cust_data.call(this, index, pcustdata)
  end
end
struct LibWin32::ITypeLib
  def query_interface(this : ITypeLib*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITypeLib*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITypeLib*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITypeLib*) : UInt32
    @lpVtbl.value.get_type_info_count.call(this)
  end
  def get_type_info(this : ITypeLib*, index : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, index, pptinfo)
  end
  def get_type_info_type(this : ITypeLib*, index : UInt32, ptkind : TYPEKIND*) : HRESULT
    @lpVtbl.value.get_type_info_type.call(this, index, ptkind)
  end
  def get_type_info_of_guid(this : ITypeLib*, guid : Guid*, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info_of_guid.call(this, guid, pptinfo)
  end
  def get_lib_attr(this : ITypeLib*, pptlibattr : TLIBATTR**) : HRESULT
    @lpVtbl.value.get_lib_attr.call(this, pptlibattr)
  end
  def get_type_comp(this : ITypeLib*, pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.get_type_comp.call(this, pptcomp)
  end
  def get_documentation(this : ITypeLib*, index : Int32, pbstrname : UInt8**, pbstrdocstring : UInt8**, pdwhelpcontext : UInt32*, pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.call(this, index, pbstrname, pbstrdocstring, pdwhelpcontext, pbstrhelpfile)
  end
  def is_name(this : ITypeLib*, sznamebuf : LibC::LPWSTR, lhashval : UInt32, pfname : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_name.call(this, sznamebuf, lhashval, pfname)
  end
  def find_name(this : ITypeLib*, sznamebuf : LibC::LPWSTR, lhashval : UInt32, pptinfo : ITypeInfo*, rgmemid : Int32*, pcfound : UInt16*) : HRESULT
    @lpVtbl.value.find_name.call(this, sznamebuf, lhashval, pptinfo, rgmemid, pcfound)
  end
  def release_t_lib_attr(this : ITypeLib*, ptlibattr : TLIBATTR*) : Void
    @lpVtbl.value.release_t_lib_attr.call(this, ptlibattr)
  end
end
struct LibWin32::ITypeLib2
  def query_interface(this : ITypeLib2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITypeLib2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITypeLib2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITypeLib2*) : UInt32
    @lpVtbl.value.get_type_info_count.call(this)
  end
  def get_type_info(this : ITypeLib2*, index : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, index, pptinfo)
  end
  def get_type_info_type(this : ITypeLib2*, index : UInt32, ptkind : TYPEKIND*) : HRESULT
    @lpVtbl.value.get_type_info_type.call(this, index, ptkind)
  end
  def get_type_info_of_guid(this : ITypeLib2*, guid : Guid*, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info_of_guid.call(this, guid, pptinfo)
  end
  def get_lib_attr(this : ITypeLib2*, pptlibattr : TLIBATTR**) : HRESULT
    @lpVtbl.value.get_lib_attr.call(this, pptlibattr)
  end
  def get_type_comp(this : ITypeLib2*, pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.get_type_comp.call(this, pptcomp)
  end
  def get_documentation(this : ITypeLib2*, index : Int32, pbstrname : UInt8**, pbstrdocstring : UInt8**, pdwhelpcontext : UInt32*, pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.call(this, index, pbstrname, pbstrdocstring, pdwhelpcontext, pbstrhelpfile)
  end
  def is_name(this : ITypeLib2*, sznamebuf : LibC::LPWSTR, lhashval : UInt32, pfname : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_name.call(this, sznamebuf, lhashval, pfname)
  end
  def find_name(this : ITypeLib2*, sznamebuf : LibC::LPWSTR, lhashval : UInt32, pptinfo : ITypeInfo*, rgmemid : Int32*, pcfound : UInt16*) : HRESULT
    @lpVtbl.value.find_name.call(this, sznamebuf, lhashval, pptinfo, rgmemid, pcfound)
  end
  def release_t_lib_attr(this : ITypeLib2*, ptlibattr : TLIBATTR*) : Void
    @lpVtbl.value.release_t_lib_attr.call(this, ptlibattr)
  end
  def get_cust_data(this : ITypeLib2*, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cust_data.call(this, guid, pvarval)
  end
  def get_lib_statistics(this : ITypeLib2*, pcuniquenames : UInt32*, pcchuniquenames : UInt32*) : HRESULT
    @lpVtbl.value.get_lib_statistics.call(this, pcuniquenames, pcchuniquenames)
  end
  def get_documentation2(this : ITypeLib2*, index : Int32, lcid : UInt32, pbstrhelpstring : UInt8**, pdwhelpstringcontext : UInt32*, pbstrhelpstringdll : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation2.call(this, index, lcid, pbstrhelpstring, pdwhelpstringcontext, pbstrhelpstringdll)
  end
  def get_all_cust_data(this : ITypeLib2*, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_cust_data.call(this, pcustdata)
  end
end
struct LibWin32::IErrorInfo
  def query_interface(this : IErrorInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IErrorInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IErrorInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_guid(this : IErrorInfo*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.call(this, pguid)
  end
  def get_source(this : IErrorInfo*, pbstrsource : UInt8**) : HRESULT
    @lpVtbl.value.get_source.call(this, pbstrsource)
  end
  def get_description(this : IErrorInfo*, pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbstrdescription)
  end
  def get_help_file(this : IErrorInfo*, pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_help_file.call(this, pbstrhelpfile)
  end
  def get_help_context(this : IErrorInfo*, pdwhelpcontext : UInt32*) : HRESULT
    @lpVtbl.value.get_help_context.call(this, pdwhelpcontext)
  end
end
struct LibWin32::ISupportErrorInfo
  def query_interface(this : ISupportErrorInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISupportErrorInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISupportErrorInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def interface_supports_error_info(this : ISupportErrorInfo*, riid : Guid*) : HRESULT
    @lpVtbl.value.interface_supports_error_info.call(this, riid)
  end
end
struct LibWin32::IErrorLog
  def query_interface(this : IErrorLog*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IErrorLog*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IErrorLog*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_error(this : IErrorLog*, pszpropname : LibC::LPWSTR, pexcepinfo : EXCEPINFO*) : HRESULT
    @lpVtbl.value.add_error.call(this, pszpropname, pexcepinfo)
  end
end
struct LibWin32::ITypeLibRegistrationReader
  def query_interface(this : ITypeLibRegistrationReader*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITypeLibRegistrationReader*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITypeLibRegistrationReader*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enum_type_lib_registrations(this : ITypeLibRegistrationReader*, ppenumunknown : IEnumUnknown*) : HRESULT
    @lpVtbl.value.enum_type_lib_registrations.call(this, ppenumunknown)
  end
end
struct LibWin32::ITypeLibRegistration
  def query_interface(this : ITypeLibRegistration*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITypeLibRegistration*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITypeLibRegistration*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_guid(this : ITypeLibRegistration*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.call(this, pguid)
  end
  def get_version(this : ITypeLibRegistration*, pversion : UInt8**) : HRESULT
    @lpVtbl.value.get_version.call(this, pversion)
  end
  def get_lcid(this : ITypeLibRegistration*, plcid : UInt32*) : HRESULT
    @lpVtbl.value.get_lcid.call(this, plcid)
  end
  def get_win32_path(this : ITypeLibRegistration*, pwin32path : UInt8**) : HRESULT
    @lpVtbl.value.get_win32_path.call(this, pwin32path)
  end
  def get_win64_path(this : ITypeLibRegistration*, pwin64path : UInt8**) : HRESULT
    @lpVtbl.value.get_win64_path.call(this, pwin64path)
  end
  def get_display_name(this : ITypeLibRegistration*, pdisplayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pdisplayname)
  end
  def get_flags(this : ITypeLibRegistration*, pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.call(this, pflags)
  end
  def get_help_dir(this : ITypeLibRegistration*, phelpdir : UInt8**) : HRESULT
    @lpVtbl.value.get_help_dir.call(this, phelpdir)
  end
end
struct LibWin32::IEnumConnections
  def query_interface(this : IEnumConnections*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumConnections*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumConnections*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumConnections*, cconnections : UInt32, rgcd : CONNECTDATA*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, cconnections, rgcd, pcfetched)
  end
  def skip(this : IEnumConnections*, cconnections : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, cconnections)
  end
  def reset(this : IEnumConnections*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumConnections*, ppenum : IEnumConnections*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IConnectionPoint
  def query_interface(this : IConnectionPoint*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConnectionPoint*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConnectionPoint*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_connection_interface(this : IConnectionPoint*, piid : Guid*) : HRESULT
    @lpVtbl.value.get_connection_interface.call(this, piid)
  end
  def get_connection_point_container(this : IConnectionPoint*, ppcpc : IConnectionPointContainer*) : HRESULT
    @lpVtbl.value.get_connection_point_container.call(this, ppcpc)
  end
  def advise(this : IConnectionPoint*, punksink : IUnknown, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.advise.call(this, punksink, pdwcookie)
  end
  def unadvise(this : IConnectionPoint*, dwcookie : UInt32) : HRESULT
    @lpVtbl.value.unadvise.call(this, dwcookie)
  end
  def enum_connections(this : IConnectionPoint*, ppenum : IEnumConnections*) : HRESULT
    @lpVtbl.value.enum_connections.call(this, ppenum)
  end
end
struct LibWin32::IEnumConnectionPoints
  def query_interface(this : IEnumConnectionPoints*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumConnectionPoints*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumConnectionPoints*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumConnectionPoints*, cconnections : UInt32, ppcp : IConnectionPoint*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, cconnections, ppcp, pcfetched)
  end
  def skip(this : IEnumConnectionPoints*, cconnections : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, cconnections)
  end
  def reset(this : IEnumConnectionPoints*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumConnectionPoints*, ppenum : IEnumConnectionPoints*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IConnectionPointContainer
  def query_interface(this : IConnectionPointContainer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConnectionPointContainer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConnectionPointContainer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enum_connection_points(this : IConnectionPointContainer*, ppenum : IEnumConnectionPoints*) : HRESULT
    @lpVtbl.value.enum_connection_points.call(this, ppenum)
  end
  def find_connection_point(this : IConnectionPointContainer*, riid : Guid*, ppcp : IConnectionPoint*) : HRESULT
    @lpVtbl.value.find_connection_point.call(this, riid, ppcp)
  end
end
struct LibWin32::IPersistMemory
  def query_interface(this : IPersistMemory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPersistMemory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPersistMemory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_class_id(this : IPersistMemory*, pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.call(this, pclassid)
  end
  def is_dirty(this : IPersistMemory*) : HRESULT
    @lpVtbl.value.is_dirty.call(this)
  end
  def load(this : IPersistMemory*, pmem : Void*, cbsize : UInt32) : HRESULT
    @lpVtbl.value.load.call(this, pmem, cbsize)
  end
  def save(this : IPersistMemory*, pmem : Void*, fcleardirty : LibC::BOOL, cbsize : UInt32) : HRESULT
    @lpVtbl.value.save.call(this, pmem, fcleardirty, cbsize)
  end
  def get_size_max(this : IPersistMemory*, pcbsize : UInt32*) : HRESULT
    @lpVtbl.value.get_size_max.call(this, pcbsize)
  end
  def init_new(this : IPersistMemory*) : HRESULT
    @lpVtbl.value.init_new.call(this)
  end
end
struct LibWin32::IPersistStreamInit
  def query_interface(this : IPersistStreamInit*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPersistStreamInit*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPersistStreamInit*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_class_id(this : IPersistStreamInit*, pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.call(this, pclassid)
  end
  def is_dirty(this : IPersistStreamInit*) : HRESULT
    @lpVtbl.value.is_dirty.call(this)
  end
  def load(this : IPersistStreamInit*, pstm : IStream) : HRESULT
    @lpVtbl.value.load.call(this, pstm)
  end
  def save(this : IPersistStreamInit*, pstm : IStream, fcleardirty : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.call(this, pstm, fcleardirty)
  end
  def get_size_max(this : IPersistStreamInit*, pcbsize : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_size_max.call(this, pcbsize)
  end
  def init_new(this : IPersistStreamInit*) : HRESULT
    @lpVtbl.value.init_new.call(this)
  end
end
