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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IUnknown_GUID = "00000000-0000-0000-c000-000000000046"
  IID_IUnknown = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IUnknown
    lpVtbl : IUnknownVTbl*
  end

  struct AsyncIUnknownVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_query_interface : UInt64
    finish_query_interface : UInt64
    begin_add_ref : UInt64
    finish_add_ref : UInt64
    begin_release : UInt64
    finish_release : UInt64
  end

  AsyncIUnknown_GUID = "000e0000-0000-0000-c000-000000000046"
  IID_AsyncIUnknown = LibC::GUID.new(0xe0000_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct AsyncIUnknown
    lpVtbl : AsyncIUnknownVTbl*
  end

  struct IClassFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_instance : UInt64
    lock_server : UInt64
  end

  IClassFactory_GUID = "00000001-0000-0000-c000-000000000046"
  IID_IClassFactory = LibC::GUID.new(0x1_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IClassFactory
    lpVtbl : IClassFactoryVTbl*
  end

  struct INoMarshalVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  INoMarshal_GUID = "ecc8691b-c1db-4dc0-855e-65f6c551af49"
  IID_INoMarshal = LibC::GUID.new(0xecc8691b_u32, 0xc1db_u16, 0x4dc0_u16, StaticArray[0x85_u8, 0x5e_u8, 0x65_u8, 0xf6_u8, 0xc5_u8, 0x51_u8, 0xaf_u8, 0x49_u8])
  struct INoMarshal
    lpVtbl : INoMarshalVTbl*
  end

  struct IAgileObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IAgileObject_GUID = "94ea2b94-e9cc-49e0-c0ff-ee64ca8f5b90"
  IID_IAgileObject = LibC::GUID.new(0x94ea2b94_u32, 0xe9cc_u16, 0x49e0_u16, StaticArray[0xc0_u8, 0xff_u8, 0xee_u8, 0x64_u8, 0xca_u8, 0x8f_u8, 0x5b_u8, 0x90_u8])
  struct IAgileObject
    lpVtbl : IAgileObjectVTbl*
  end

  struct IActivationFilterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_activation : UInt64
  end

  IActivationFilter_GUID = "00000017-0000-0000-c000-000000000046"
  IID_IActivationFilter = LibC::GUID.new(0x17_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IActivationFilter
    lpVtbl : IActivationFilterVTbl*
  end

  struct IMallocVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    alloc : UInt64
    realloc : UInt64
    free : UInt64
    get_size : UInt64
    did_alloc : UInt64
    heap_minimize : UInt64
  end

  IMalloc_GUID = "00000002-0000-0000-c000-000000000046"
  IID_IMalloc = LibC::GUID.new(0x2_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMalloc
    lpVtbl : IMallocVTbl*
  end

  struct IStdMarshalInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_for_handler : UInt64
  end

  IStdMarshalInfo_GUID = "00000018-0000-0000-c000-000000000046"
  IID_IStdMarshalInfo = LibC::GUID.new(0x18_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IStdMarshalInfo
    lpVtbl : IStdMarshalInfoVTbl*
  end

  struct IExternalConnectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_connection : UInt64
    release_connection : UInt64
  end

  IExternalConnection_GUID = "00000019-0000-0000-c000-000000000046"
  IID_IExternalConnection = LibC::GUID.new(0x19_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IExternalConnection
    lpVtbl : IExternalConnectionVTbl*
  end

  struct IMultiQIVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_multiple_interfaces : UInt64
  end

  IMultiQI_GUID = "00000020-0000-0000-c000-000000000046"
  IID_IMultiQI = LibC::GUID.new(0x20_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMultiQI
    lpVtbl : IMultiQIVTbl*
  end

  struct AsyncIMultiQIVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_query_multiple_interfaces : UInt64
    finish_query_multiple_interfaces : UInt64
  end

  AsyncIMultiQI_GUID = "000e0020-0000-0000-c000-000000000046"
  IID_AsyncIMultiQI = LibC::GUID.new(0xe0020_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct AsyncIMultiQI
    lpVtbl : AsyncIMultiQIVTbl*
  end

  struct IInternalUnknownVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_internal_interface : UInt64
  end

  IInternalUnknown_GUID = "00000021-0000-0000-c000-000000000046"
  IID_IInternalUnknown = LibC::GUID.new(0x21_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IInternalUnknown
    lpVtbl : IInternalUnknownVTbl*
  end

  struct IEnumUnknownVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumUnknown_GUID = "00000100-0000-0000-c000-000000000046"
  IID_IEnumUnknown = LibC::GUID.new(0x100_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumUnknown
    lpVtbl : IEnumUnknownVTbl*
  end

  struct IEnumStringVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumString_GUID = "00000101-0000-0000-c000-000000000046"
  IID_IEnumString = LibC::GUID.new(0x101_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumString
    lpVtbl : IEnumStringVTbl*
  end

  struct ISequentialStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
  end

  ISequentialStream_GUID = "0c733a30-2a1c-11ce-ade5-00aa0044773d"
  IID_ISequentialStream = LibC::GUID.new(0xc733a30_u32, 0x2a1c_u16, 0x11ce_u16, StaticArray[0xad_u8, 0xe5_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x44_u8, 0x77_u8, 0x3d_u8])
  struct ISequentialStream
    lpVtbl : ISequentialStreamVTbl*
  end

  struct IStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
    seek : UInt64
    set_size : UInt64
    copy_to : UInt64
    commit : UInt64
    revert : UInt64
    lock_region : UInt64
    unlock_region : UInt64
    stat : UInt64
    clone : UInt64
  end

  IStream_GUID = "0000000c-0000-0000-c000-000000000046"
  IID_IStream = LibC::GUID.new(0xc_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IStream
    lpVtbl : IStreamVTbl*
  end

  struct IRpcChannelBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer : UInt64
    send_receive : UInt64
    free_buffer : UInt64
    get_dest_ctx : UInt64
    is_connected : UInt64
  end

  IRpcChannelBuffer_GUID = "d5f56b60-593b-101a-b569-08002b2dbf7a"
  IID_IRpcChannelBuffer = LibC::GUID.new(0xd5f56b60_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
  struct IRpcChannelBuffer
    lpVtbl : IRpcChannelBufferVTbl*
  end

  struct IRpcChannelBuffer2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer : UInt64
    send_receive : UInt64
    free_buffer : UInt64
    get_dest_ctx : UInt64
    is_connected : UInt64
    get_protocol_version : UInt64
  end

  IRpcChannelBuffer2_GUID = "594f31d0-7f19-11d0-b194-00a0c90dc8bf"
  IID_IRpcChannelBuffer2 = LibC::GUID.new(0x594f31d0_u32, 0x7f19_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x94_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0xc8_u8, 0xbf_u8])
  struct IRpcChannelBuffer2
    lpVtbl : IRpcChannelBuffer2VTbl*
  end

  struct IAsyncRpcChannelBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer : UInt64
    send_receive : UInt64
    free_buffer : UInt64
    get_dest_ctx : UInt64
    is_connected : UInt64
    get_protocol_version : UInt64
    send : UInt64
    receive : UInt64
    get_dest_ctx_ex : UInt64
  end

  IAsyncRpcChannelBuffer_GUID = "a5029fb6-3c34-11d1-9c99-00c04fb998aa"
  IID_IAsyncRpcChannelBuffer = LibC::GUID.new(0xa5029fb6_u32, 0x3c34_u16, 0x11d1_u16, StaticArray[0x9c_u8, 0x99_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0xaa_u8])
  struct IAsyncRpcChannelBuffer
    lpVtbl : IAsyncRpcChannelBufferVTbl*
  end

  struct IRpcChannelBuffer3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer : UInt64
    send_receive : UInt64
    free_buffer : UInt64
    get_dest_ctx : UInt64
    is_connected : UInt64
    get_protocol_version : UInt64
    send : UInt64
    receive : UInt64
    cancel : UInt64
    get_call_context : UInt64
    get_dest_ctx_ex : UInt64
    get_state : UInt64
    register_async : UInt64
  end

  IRpcChannelBuffer3_GUID = "25b15600-0115-11d0-bf0d-00aa00b8dfd2"
  IID_IRpcChannelBuffer3 = LibC::GUID.new(0x25b15600_u32, 0x115_u16, 0x11d0_u16, StaticArray[0xbf_u8, 0xd_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb8_u8, 0xdf_u8, 0xd2_u8])
  struct IRpcChannelBuffer3
    lpVtbl : IRpcChannelBuffer3VTbl*
  end

  struct IRpcSyntaxNegotiateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    negotiate_syntax : UInt64
  end

  IRpcSyntaxNegotiate_GUID = "58a08519-24c8-4935-b482-3fd823333a4f"
  IID_IRpcSyntaxNegotiate = LibC::GUID.new(0x58a08519_u32, 0x24c8_u16, 0x4935_u16, StaticArray[0xb4_u8, 0x82_u8, 0x3f_u8, 0xd8_u8, 0x23_u8, 0x33_u8, 0x3a_u8, 0x4f_u8])
  struct IRpcSyntaxNegotiate
    lpVtbl : IRpcSyntaxNegotiateVTbl*
  end

  struct IRpcProxyBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    connect : UInt64
    disconnect : UInt64
  end

  IRpcProxyBuffer_GUID = "d5f56a34-593b-101a-b569-08002b2dbf7a"
  IID_IRpcProxyBuffer = LibC::GUID.new(0xd5f56a34_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
  struct IRpcProxyBuffer
    lpVtbl : IRpcProxyBufferVTbl*
  end

  struct IRpcStubBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    connect : UInt64
    disconnect : UInt64
    invoke : UInt64
    is_iid_supported : UInt64
    count_refs : UInt64
    debug_server_query_interface : UInt64
    debug_server_release : UInt64
  end

  IRpcStubBuffer_GUID = "d5f56afc-593b-101a-b569-08002b2dbf7a"
  IID_IRpcStubBuffer = LibC::GUID.new(0xd5f56afc_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
  struct IRpcStubBuffer
    lpVtbl : IRpcStubBufferVTbl*
  end

  struct IPSFactoryBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_proxy : UInt64
    create_stub : UInt64
  end

  IPSFactoryBuffer_GUID = "d5f569d0-593b-101a-b569-08002b2dbf7a"
  IID_IPSFactoryBuffer = LibC::GUID.new(0xd5f569d0_u32, 0x593b_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x69_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2d_u8, 0xbf_u8, 0x7a_u8])
  struct IPSFactoryBuffer
    lpVtbl : IPSFactoryBufferVTbl*
  end

  struct IChannelHookVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    client_get_size : UInt64
    client_fill_buffer : UInt64
    client_notify : UInt64
    server_notify : UInt64
    server_get_size : UInt64
    server_fill_buffer : UInt64
  end

  IChannelHook_GUID = "1008c4a0-7613-11cf-9af1-0020af6e72f4"
  IID_IChannelHook = LibC::GUID.new(0x1008c4a0_u32, 0x7613_u16, 0x11cf_u16, StaticArray[0x9a_u8, 0xf1_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0x6e_u8, 0x72_u8, 0xf4_u8])
  struct IChannelHook
    lpVtbl : IChannelHookVTbl*
  end

  struct IClientSecurityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_blanket : UInt64
    set_blanket : UInt64
    copy_proxy : UInt64
  end

  IClientSecurity_GUID = "0000013d-0000-0000-c000-000000000046"
  IID_IClientSecurity = LibC::GUID.new(0x13d_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IClientSecurity
    lpVtbl : IClientSecurityVTbl*
  end

  struct IServerSecurityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_blanket : UInt64
    impersonate_client : UInt64
    revert_to_self : UInt64
    is_impersonating : UInt64
  end

  IServerSecurity_GUID = "0000013e-0000-0000-c000-000000000046"
  IID_IServerSecurity = LibC::GUID.new(0x13e_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IServerSecurity
    lpVtbl : IServerSecurityVTbl*
  end

  struct IRpcOptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set : UInt64
    query : UInt64
  end

  IRpcOptions_GUID = "00000144-0000-0000-c000-000000000046"
  IID_IRpcOptions = LibC::GUID.new(0x144_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRpcOptions
    lpVtbl : IRpcOptionsVTbl*
  end

  struct IGlobalOptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set : UInt64
    query : UInt64
  end

  IGlobalOptions_GUID = "0000015b-0000-0000-c000-000000000046"
  IID_IGlobalOptions = LibC::GUID.new(0x15b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IGlobalOptions
    lpVtbl : IGlobalOptionsVTbl*
  end

  struct ISurrogateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load_dll_server : UInt64
    free_surrogate : UInt64
  end

  ISurrogate_GUID = "00000022-0000-0000-c000-000000000046"
  IID_ISurrogate = LibC::GUID.new(0x22_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISurrogate
    lpVtbl : ISurrogateVTbl*
  end

  struct IGlobalInterfaceTableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_interface_in_global : UInt64
    revoke_interface_from_global : UInt64
    get_interface_from_global : UInt64
  end

  IGlobalInterfaceTable_GUID = "00000146-0000-0000-c000-000000000046"
  IID_IGlobalInterfaceTable = LibC::GUID.new(0x146_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IGlobalInterfaceTable
    lpVtbl : IGlobalInterfaceTableVTbl*
  end

  struct ISynchronizeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    wait : UInt64
    signal : UInt64
    reset : UInt64
  end

  ISynchronize_GUID = "00000030-0000-0000-c000-000000000046"
  IID_ISynchronize = LibC::GUID.new(0x30_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronize
    lpVtbl : ISynchronizeVTbl*
  end

  struct ISynchronizeHandleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_handle : UInt64
  end

  ISynchronizeHandle_GUID = "00000031-0000-0000-c000-000000000046"
  IID_ISynchronizeHandle = LibC::GUID.new(0x31_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronizeHandle
    lpVtbl : ISynchronizeHandleVTbl*
  end

  struct ISynchronizeEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_handle : UInt64
    set_event_handle : UInt64
  end

  ISynchronizeEvent_GUID = "00000032-0000-0000-c000-000000000046"
  IID_ISynchronizeEvent = LibC::GUID.new(0x32_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronizeEvent
    lpVtbl : ISynchronizeEventVTbl*
  end

  struct ISynchronizeContainerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_synchronize : UInt64
    wait_multiple : UInt64
  end

  ISynchronizeContainer_GUID = "00000033-0000-0000-c000-000000000046"
  IID_ISynchronizeContainer = LibC::GUID.new(0x33_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronizeContainer
    lpVtbl : ISynchronizeContainerVTbl*
  end

  struct ISynchronizeMutexVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    wait : UInt64
    signal : UInt64
    reset : UInt64
    release_mutex : UInt64
  end

  ISynchronizeMutex_GUID = "00000025-0000-0000-c000-000000000046"
  IID_ISynchronizeMutex = LibC::GUID.new(0x25_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISynchronizeMutex
    lpVtbl : ISynchronizeMutexVTbl*
  end

  struct ICancelMethodCallsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cancel : UInt64
    test_cancel : UInt64
  end

  ICancelMethodCalls_GUID = "00000029-0000-0000-c000-000000000046"
  IID_ICancelMethodCalls = LibC::GUID.new(0x29_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ICancelMethodCalls
    lpVtbl : ICancelMethodCallsVTbl*
  end

  struct IAsyncManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    complete_call : UInt64
    get_call_context : UInt64
    get_state : UInt64
  end

  IAsyncManager_GUID = "0000002a-0000-0000-c000-000000000046"
  IID_IAsyncManager = LibC::GUID.new(0x2a_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAsyncManager
    lpVtbl : IAsyncManagerVTbl*
  end

  struct ICallFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_call : UInt64
  end

  ICallFactory_GUID = "1c733a30-2a1c-11ce-ade5-00aa0044773d"
  IID_ICallFactory = LibC::GUID.new(0x1c733a30_u32, 0x2a1c_u16, 0x11ce_u16, StaticArray[0xad_u8, 0xe5_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x44_u8, 0x77_u8, 0x3d_u8])
  struct ICallFactory
    lpVtbl : ICallFactoryVTbl*
  end

  struct IRpcHelperVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_dcom_protocol_version : UInt64
    get_iid_from_objref : UInt64
  end

  IRpcHelper_GUID = "00000149-0000-0000-c000-000000000046"
  IID_IRpcHelper = LibC::GUID.new(0x149_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRpcHelper
    lpVtbl : IRpcHelperVTbl*
  end

  struct IReleaseMarshalBuffersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    release_marshal_buffer : UInt64
  end

  IReleaseMarshalBuffers_GUID = "eb0cb9e8-7996-11d2-872e-0000f8080859"
  IID_IReleaseMarshalBuffers = LibC::GUID.new(0xeb0cb9e8_u32, 0x7996_u16, 0x11d2_u16, StaticArray[0x87_u8, 0x2e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x8_u8, 0x8_u8, 0x59_u8])
  struct IReleaseMarshalBuffers
    lpVtbl : IReleaseMarshalBuffersVTbl*
  end

  struct IWaitMultipleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    wait_multiple : UInt64
    add_synchronize : UInt64
  end

  IWaitMultiple_GUID = "0000002b-0000-0000-c000-000000000046"
  IID_IWaitMultiple = LibC::GUID.new(0x2b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IWaitMultiple
    lpVtbl : IWaitMultipleVTbl*
  end

  struct IAddrTrackingControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enable_com_dynamic_addr_tracking : UInt64
    disable_com_dynamic_addr_tracking : UInt64
  end

  IAddrTrackingControl_GUID = "00000147-0000-0000-c000-000000000046"
  IID_IAddrTrackingControl = LibC::GUID.new(0x147_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAddrTrackingControl
    lpVtbl : IAddrTrackingControlVTbl*
  end

  struct IAddrExclusionControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_addr_exclusion_list : UInt64
    update_addr_exclusion_list : UInt64
  end

  IAddrExclusionControl_GUID = "00000148-0000-0000-c000-000000000046"
  IID_IAddrExclusionControl = LibC::GUID.new(0x148_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAddrExclusionControl
    lpVtbl : IAddrExclusionControlVTbl*
  end

  struct IPipeByteVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    pull : UInt64
    push : UInt64
  end

  IPipeByte_GUID = "db2f3aca-2f86-11d1-8e04-00c04fb9989a"
  IID_IPipeByte = LibC::GUID.new(0xdb2f3aca_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct IPipeByte
    lpVtbl : IPipeByteVTbl*
  end

  struct AsyncIPipeByteVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_pull : UInt64
    finish_pull : UInt64
    begin_push : UInt64
    finish_push : UInt64
  end

  AsyncIPipeByte_GUID = "db2f3acb-2f86-11d1-8e04-00c04fb9989a"
  IID_AsyncIPipeByte = LibC::GUID.new(0xdb2f3acb_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct AsyncIPipeByte
    lpVtbl : AsyncIPipeByteVTbl*
  end

  struct IPipeLongVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    pull : UInt64
    push : UInt64
  end

  IPipeLong_GUID = "db2f3acc-2f86-11d1-8e04-00c04fb9989a"
  IID_IPipeLong = LibC::GUID.new(0xdb2f3acc_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct IPipeLong
    lpVtbl : IPipeLongVTbl*
  end

  struct AsyncIPipeLongVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_pull : UInt64
    finish_pull : UInt64
    begin_push : UInt64
    finish_push : UInt64
  end

  AsyncIPipeLong_GUID = "db2f3acd-2f86-11d1-8e04-00c04fb9989a"
  IID_AsyncIPipeLong = LibC::GUID.new(0xdb2f3acd_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct AsyncIPipeLong
    lpVtbl : AsyncIPipeLongVTbl*
  end

  struct IPipeDoubleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    pull : UInt64
    push : UInt64
  end

  IPipeDouble_GUID = "db2f3ace-2f86-11d1-8e04-00c04fb9989a"
  IID_IPipeDouble = LibC::GUID.new(0xdb2f3ace_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct IPipeDouble
    lpVtbl : IPipeDoubleVTbl*
  end

  struct AsyncIPipeDoubleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_pull : UInt64
    finish_pull : UInt64
    begin_push : UInt64
    finish_push : UInt64
  end

  AsyncIPipeDouble_GUID = "db2f3acf-2f86-11d1-8e04-00c04fb9989a"
  IID_AsyncIPipeDouble = LibC::GUID.new(0xdb2f3acf_u32, 0x2f86_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x98_u8, 0x9a_u8])
  struct AsyncIPipeDouble
    lpVtbl : AsyncIPipeDoubleVTbl*
  end

  struct IComThreadingInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_apartment_type : UInt64
    get_current_thread_type : UInt64
    get_current_logical_thread_id : UInt64
    set_current_logical_thread_id : UInt64
  end

  IComThreadingInfo_GUID = "000001ce-0000-0000-c000-000000000046"
  IID_IComThreadingInfo = LibC::GUID.new(0x1ce_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IComThreadingInfo
    lpVtbl : IComThreadingInfoVTbl*
  end

  struct IProcessInitControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reset_initializer_timeout : UInt64
  end

  IProcessInitControl_GUID = "72380d55-8d2b-43a3-8513-2b6ef31434e9"
  IID_IProcessInitControl = LibC::GUID.new(0x72380d55_u32, 0x8d2b_u16, 0x43a3_u16, StaticArray[0x85_u8, 0x13_u8, 0x2b_u8, 0x6e_u8, 0xf3_u8, 0x14_u8, 0x34_u8, 0xe9_u8])
  struct IProcessInitControl
    lpVtbl : IProcessInitControlVTbl*
  end

  struct IFastRundownVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IFastRundown_GUID = "00000040-0000-0000-c000-000000000046"
  IID_IFastRundown = LibC::GUID.new(0x40_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IFastRundown
    lpVtbl : IFastRundownVTbl*
  end

  struct IMachineGlobalObjectTableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_object : UInt64
    get_object : UInt64
    revoke_object : UInt64
  end

  IMachineGlobalObjectTable_GUID = "26d709ac-f70b-4421-a96f-d2878fafb00d"
  IID_IMachineGlobalObjectTable = LibC::GUID.new(0x26d709ac_u32, 0xf70b_u16, 0x4421_u16, StaticArray[0xa9_u8, 0x6f_u8, 0xd2_u8, 0x87_u8, 0x8f_u8, 0xaf_u8, 0xb0_u8, 0xd_u8])
  struct IMachineGlobalObjectTable
    lpVtbl : IMachineGlobalObjectTableVTbl*
  end

  struct IMallocSpyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    pre_alloc : UInt64
    post_alloc : UInt64
    pre_free : UInt64
    post_free : UInt64
    pre_realloc : UInt64
    post_realloc : UInt64
    pre_get_size : UInt64
    post_get_size : UInt64
    pre_did_alloc : UInt64
    post_did_alloc : UInt64
    pre_heap_minimize : UInt64
    post_heap_minimize : UInt64
  end

  IMallocSpy_GUID = "0000001d-0000-0000-c000-000000000046"
  IID_IMallocSpy = LibC::GUID.new(0x1d_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMallocSpy
    lpVtbl : IMallocSpyVTbl*
  end

  struct IBindCtxVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_object_bound : UInt64
    revoke_object_bound : UInt64
    release_bound_objects : UInt64
    set_bind_options : UInt64
    get_bind_options : UInt64
    get_running_object_table : UInt64
    register_object_param : UInt64
    get_object_param : UInt64
    enum_object_param : UInt64
    revoke_object_param : UInt64
  end

  IBindCtx_GUID = "0000000e-0000-0000-c000-000000000046"
  IID_IBindCtx = LibC::GUID.new(0xe_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IBindCtx
    lpVtbl : IBindCtxVTbl*
  end

  struct IEnumMonikerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumMoniker_GUID = "00000102-0000-0000-c000-000000000046"
  IID_IEnumMoniker = LibC::GUID.new(0x102_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumMoniker
    lpVtbl : IEnumMonikerVTbl*
  end

  struct IRunnableObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_running_class : UInt64
    run : UInt64
    is_running : UInt64
    lock_running : UInt64
    set_contained_object : UInt64
  end

  IRunnableObject_GUID = "00000126-0000-0000-c000-000000000046"
  IID_IRunnableObject = LibC::GUID.new(0x126_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRunnableObject
    lpVtbl : IRunnableObjectVTbl*
  end

  struct IRunningObjectTableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register : UInt64
    revoke : UInt64
    is_running : UInt64
    get_object : UInt64
    note_change_time : UInt64
    get_time_of_last_change : UInt64
    enum_running : UInt64
  end

  IRunningObjectTable_GUID = "00000010-0000-0000-c000-000000000046"
  IID_IRunningObjectTable = LibC::GUID.new(0x10_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRunningObjectTable
    lpVtbl : IRunningObjectTableVTbl*
  end

  struct IPersistVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_id : UInt64
  end

  IPersist_GUID = "0000010c-0000-0000-c000-000000000046"
  IID_IPersist = LibC::GUID.new(0x10c_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IPersist
    lpVtbl : IPersistVTbl*
  end

  struct IPersistStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_id : UInt64
    is_dirty : UInt64
    load : UInt64
    save : UInt64
    get_size_max : UInt64
  end

  IPersistStream_GUID = "00000109-0000-0000-c000-000000000046"
  IID_IPersistStream = LibC::GUID.new(0x109_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IPersistStream
    lpVtbl : IPersistStreamVTbl*
  end

  struct IMonikerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_id : UInt64
    is_dirty : UInt64
    load : UInt64
    save : UInt64
    get_size_max : UInt64
    bind_to_object : UInt64
    bind_to_storage : UInt64
    reduce : UInt64
    compose_with : UInt64
    enum : UInt64
    is_equal : UInt64
    hash : UInt64
    is_running : UInt64
    get_time_of_last_change : UInt64
    inverse : UInt64
    common_prefix_with : UInt64
    relative_path_to : UInt64
    get_display_name : UInt64
    parse_display_name : UInt64
    is_system_moniker : UInt64
  end

  IMoniker_GUID = "0000000f-0000-0000-c000-000000000046"
  IID_IMoniker = LibC::GUID.new(0xf_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMoniker
    lpVtbl : IMonikerVTbl*
  end

  struct IROTDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_comparison_data : UInt64
  end

  IROTData_GUID = "f29f6bc0-5021-11ce-aa15-00006901293f"
  IID_IROTData = LibC::GUID.new(0xf29f6bc0_u32, 0x5021_u16, 0x11ce_u16, StaticArray[0xaa_u8, 0x15_u8, 0x0_u8, 0x0_u8, 0x69_u8, 0x1_u8, 0x29_u8, 0x3f_u8])
  struct IROTData
    lpVtbl : IROTDataVTbl*
  end

  struct IPersistFileVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_id : UInt64
    is_dirty : UInt64
    load : UInt64
    save : UInt64
    save_completed : UInt64
    get_cur_file : UInt64
  end

  IPersistFile_GUID = "0000010b-0000-0000-c000-000000000046"
  IID_IPersistFile = LibC::GUID.new(0x10b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IPersistFile
    lpVtbl : IPersistFileVTbl*
  end

  struct IEnumFORMATETCVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumFORMATETC_GUID = "00000103-0000-0000-c000-000000000046"
  IID_IEnumFORMATETC = LibC::GUID.new(0x103_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumFORMATETC
    lpVtbl : IEnumFORMATETCVTbl*
  end

  struct IEnumSTATDATAVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumSTATDATA_GUID = "00000105-0000-0000-c000-000000000046"
  IID_IEnumSTATDATA = LibC::GUID.new(0x105_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumSTATDATA
    lpVtbl : IEnumSTATDATAVTbl*
  end

  struct IAdviseSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_data_change : UInt64
    on_view_change : UInt64
    on_rename : UInt64
    on_save : UInt64
    on_close : UInt64
  end

  IAdviseSink_GUID = "0000010f-0000-0000-c000-000000000046"
  IID_IAdviseSink = LibC::GUID.new(0x10f_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAdviseSink
    lpVtbl : IAdviseSinkVTbl*
  end

  struct AsyncIAdviseSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_on_data_change : UInt64
    finish_on_data_change : UInt64
    begin_on_view_change : UInt64
    finish_on_view_change : UInt64
    begin_on_rename : UInt64
    finish_on_rename : UInt64
    begin_on_save : UInt64
    finish_on_save : UInt64
    begin_on_close : UInt64
    finish_on_close : UInt64
  end

  AsyncIAdviseSink_GUID = "00000150-0000-0000-c000-000000000046"
  IID_AsyncIAdviseSink = LibC::GUID.new(0x150_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct AsyncIAdviseSink
    lpVtbl : AsyncIAdviseSinkVTbl*
  end

  struct IAdviseSink2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_data_change : UInt64
    on_view_change : UInt64
    on_rename : UInt64
    on_save : UInt64
    on_close : UInt64
    on_link_src_change : UInt64
  end

  IAdviseSink2_GUID = "00000125-0000-0000-c000-000000000046"
  IID_IAdviseSink2 = LibC::GUID.new(0x125_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IAdviseSink2
    lpVtbl : IAdviseSink2VTbl*
  end

  struct AsyncIAdviseSink2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_on_data_change : UInt64
    finish_on_data_change : UInt64
    begin_on_view_change : UInt64
    finish_on_view_change : UInt64
    begin_on_rename : UInt64
    finish_on_rename : UInt64
    begin_on_save : UInt64
    finish_on_save : UInt64
    begin_on_close : UInt64
    finish_on_close : UInt64
    begin_on_link_src_change : UInt64
    finish_on_link_src_change : UInt64
  end

  AsyncIAdviseSink2_GUID = "00000151-0000-0000-c000-000000000046"
  IID_AsyncIAdviseSink2 = LibC::GUID.new(0x151_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct AsyncIAdviseSink2
    lpVtbl : AsyncIAdviseSink2VTbl*
  end

  struct IDataObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_data : UInt64
    get_data_here : UInt64
    query_get_data : UInt64
    get_canonical_format_etc : UInt64
    set_data : UInt64
    enum_format_etc : UInt64
    d_advise : UInt64
    d_unadvise : UInt64
    enum_d_advise : UInt64
  end

  IDataObject_GUID = "0000010e-0000-0000-c000-000000000046"
  IID_IDataObject = LibC::GUID.new(0x10e_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IDataObject
    lpVtbl : IDataObjectVTbl*
  end

  struct IDataAdviseHolderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise : UInt64
    unadvise : UInt64
    enum_advise : UInt64
    send_on_data_change : UInt64
  end

  IDataAdviseHolder_GUID = "00000110-0000-0000-c000-000000000046"
  IID_IDataAdviseHolder = LibC::GUID.new(0x110_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IDataAdviseHolder
    lpVtbl : IDataAdviseHolderVTbl*
  end

  struct IClassActivatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_object : UInt64
  end

  IClassActivator_GUID = "00000140-0000-0000-c000-000000000046"
  IID_IClassActivator = LibC::GUID.new(0x140_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IClassActivator
    lpVtbl : IClassActivatorVTbl*
  end

  struct IProgressNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_progress : UInt64
  end

  IProgressNotify_GUID = "a9d758a0-4617-11cf-95fc-00aa00680db4"
  IID_IProgressNotify = LibC::GUID.new(0xa9d758a0_u32, 0x4617_u16, 0x11cf_u16, StaticArray[0x95_u8, 0xfc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0xd_u8, 0xb4_u8])
  struct IProgressNotify
    lpVtbl : IProgressNotifyVTbl*
  end

  struct IBlockingLockVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    lock : UInt64
    unlock : UInt64
  end

  IBlockingLock_GUID = "30f3d47a-6447-11d1-8e3c-00c04fb9386d"
  IID_IBlockingLock = LibC::GUID.new(0x30f3d47a_u32, 0x6447_u16, 0x11d1_u16, StaticArray[0x8e_u8, 0x3c_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x38_u8, 0x6d_u8])
  struct IBlockingLock
    lpVtbl : IBlockingLockVTbl*
  end

  struct ITimeAndNoticeControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    suppress_changes : UInt64
  end

  ITimeAndNoticeControl_GUID = "bc0bf6ae-8878-11d1-83e9-00c04fc2c6d4"
  IID_ITimeAndNoticeControl = LibC::GUID.new(0xbc0bf6ae_u32, 0x8878_u16, 0x11d1_u16, StaticArray[0x83_u8, 0xe9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xc6_u8, 0xd4_u8])
  struct ITimeAndNoticeControl
    lpVtbl : ITimeAndNoticeControlVTbl*
  end

  struct IOplockStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_storage_ex : UInt64
    open_storage_ex : UInt64
  end

  IOplockStorage_GUID = "8d19c834-8879-11d1-83e9-00c04fc2c6d4"
  IID_IOplockStorage = LibC::GUID.new(0x8d19c834_u32, 0x8879_u16, 0x11d1_u16, StaticArray[0x83_u8, 0xe9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xc6_u8, 0xd4_u8])
  struct IOplockStorage
    lpVtbl : IOplockStorageVTbl*
  end

  struct IUrlMonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    async_get_class_bits : UInt64
  end

  IUrlMon_GUID = "00000026-0000-0000-c000-000000000046"
  IID_IUrlMon = LibC::GUID.new(0x26_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IUrlMon
    lpVtbl : IUrlMonVTbl*
  end

  struct IForegroundTransferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    allow_foreground_transfer : UInt64
  end

  IForegroundTransfer_GUID = "00000145-0000-0000-c000-000000000046"
  IID_IForegroundTransfer = LibC::GUID.new(0x145_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IForegroundTransfer
    lpVtbl : IForegroundTransferVTbl*
  end

  struct IProcessLockVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_ref_on_process : UInt64
    release_ref_on_process : UInt64
  end

  IProcessLock_GUID = "000001d5-0000-0000-c000-000000000046"
  IID_IProcessLock = LibC::GUID.new(0x1d5_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IProcessLock
    lpVtbl : IProcessLockVTbl*
  end

  struct ISurrogateServiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    init : UInt64
    application_launch : UInt64
    application_free : UInt64
    catalog_refresh : UInt64
    process_shutdown : UInt64
  end

  ISurrogateService_GUID = "000001d4-0000-0000-c000-000000000046"
  IID_ISurrogateService = LibC::GUID.new(0x1d4_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ISurrogateService
    lpVtbl : ISurrogateServiceVTbl*
  end

  struct IInitializeSpyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    pre_initialize : UInt64
    post_initialize : UInt64
    pre_uninitialize : UInt64
    post_uninitialize : UInt64
  end

  IInitializeSpy_GUID = "00000034-0000-0000-c000-000000000046"
  IID_IInitializeSpy = LibC::GUID.new(0x34_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IInitializeSpy
    lpVtbl : IInitializeSpyVTbl*
  end

  struct IServiceProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_service : UInt64
  end

  IServiceProvider_GUID = "6d5140c1-7436-11ce-8034-00aa006009fa"
  IID_IServiceProvider = LibC::GUID.new(0x6d5140c1_u32, 0x7436_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x34_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0x9_u8, 0xfa_u8])
  struct IServiceProvider
    lpVtbl : IServiceProviderVTbl*
  end

  struct IEnumGUIDVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumGUID_GUID = "0002e000-0000-0000-c000-000000000046"
  IID_IEnumGUID = LibC::GUID.new(0x2e000_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumGUID
    lpVtbl : IEnumGUIDVTbl*
  end

  struct IEnumCATEGORYINFOVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumCATEGORYINFO_GUID = "0002e011-0000-0000-c000-000000000046"
  IID_IEnumCATEGORYINFO = LibC::GUID.new(0x2e011_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumCATEGORYINFO
    lpVtbl : IEnumCATEGORYINFOVTbl*
  end

  struct ICatRegisterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_categories : UInt64
    un_register_categories : UInt64
    register_class_impl_categories : UInt64
    un_register_class_impl_categories : UInt64
    register_class_req_categories : UInt64
    un_register_class_req_categories : UInt64
  end

  ICatRegister_GUID = "0002e012-0000-0000-c000-000000000046"
  IID_ICatRegister = LibC::GUID.new(0x2e012_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ICatRegister
    lpVtbl : ICatRegisterVTbl*
  end

  struct ICatInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enum_categories : UInt64
    get_category_desc : UInt64
    enum_classes_of_categories : UInt64
    is_class_of_categories : UInt64
    enum_impl_categories_of_class : UInt64
    enum_req_categories_of_class : UInt64
  end

  ICatInformation_GUID = "0002e013-0000-0000-c000-000000000046"
  IID_ICatInformation = LibC::GUID.new(0x2e013_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ICatInformation
    lpVtbl : ICatInformationVTbl*
  end

  struct IContextCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    context_callback : UInt64
  end

  IContextCallback_GUID = "000001da-0000-0000-c000-000000000046"
  IID_IContextCallback = LibC::GUID.new(0x1da_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IContextCallback
    lpVtbl : IContextCallbackVTbl*
  end

  struct IBindingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    abort : UInt64
    suspend : UInt64
    resume : UInt64
    set_priority : UInt64
    get_priority : UInt64
    get_bind_result : UInt64
  end

  IBinding_GUID = "79eac9c0-baf9-11ce-8c82-00aa004ba90b"
  IID_IBinding = LibC::GUID.new(0x79eac9c0_u32, 0xbaf9_u16, 0x11ce_u16, StaticArray[0x8c_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xa9_u8, 0xb_u8])
  struct IBinding
    lpVtbl : IBindingVTbl*
  end

  struct IBindStatusCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_start_binding : UInt64
    get_priority : UInt64
    on_low_resource : UInt64
    on_progress : UInt64
    on_stop_binding : UInt64
    get_bind_info : UInt64
    on_data_available : UInt64
    on_object_available : UInt64
  end

  IBindStatusCallback_GUID = "79eac9c1-baf9-11ce-8c82-00aa004ba90b"
  IID_IBindStatusCallback = LibC::GUID.new(0x79eac9c1_u32, 0xbaf9_u16, 0x11ce_u16, StaticArray[0x8c_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xa9_u8, 0xb_u8])
  struct IBindStatusCallback
    lpVtbl : IBindStatusCallbackVTbl*
  end

  struct IBindStatusCallbackExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_start_binding : UInt64
    get_priority : UInt64
    on_low_resource : UInt64
    on_progress : UInt64
    on_stop_binding : UInt64
    get_bind_info : UInt64
    on_data_available : UInt64
    on_object_available : UInt64
    get_bind_info_ex : UInt64
  end

  IBindStatusCallbackEx_GUID = "aaa74ef9-8ee7-4659-88d9-f8c504da73cc"
  IID_IBindStatusCallbackEx = LibC::GUID.new(0xaaa74ef9_u32, 0x8ee7_u16, 0x4659_u16, StaticArray[0x88_u8, 0xd9_u8, 0xf8_u8, 0xc5_u8, 0x4_u8, 0xda_u8, 0x73_u8, 0xcc_u8])
  struct IBindStatusCallbackEx
    lpVtbl : IBindStatusCallbackExVTbl*
  end

  struct IAuthenticateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    authenticate : UInt64
  end

  IAuthenticate_GUID = "79eac9d0-baf9-11ce-8c82-00aa004ba90b"
  IID_IAuthenticate = LibC::GUID.new(0x79eac9d0_u32, 0xbaf9_u16, 0x11ce_u16, StaticArray[0x8c_u8, 0x82_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xa9_u8, 0xb_u8])
  struct IAuthenticate
    lpVtbl : IAuthenticateVTbl*
  end

  struct IAuthenticateExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    authenticate : UInt64
    authenticate_ex : UInt64
  end

  IAuthenticateEx_GUID = "2ad1edaf-d83d-48b5-9adf-03dbe19f53bd"
  IID_IAuthenticateEx = LibC::GUID.new(0x2ad1edaf_u32, 0xd83d_u16, 0x48b5_u16, StaticArray[0x9a_u8, 0xdf_u8, 0x3_u8, 0xdb_u8, 0xe1_u8, 0x9f_u8, 0x53_u8, 0xbd_u8])
  struct IAuthenticateEx
    lpVtbl : IAuthenticateExVTbl*
  end

  struct IUriVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_bstr : UInt64
    get_property_length : UInt64
    get_property_dword : UInt64
    has_property : UInt64
    get_absolute_uri : UInt64
    get_authority : UInt64
    get_display_uri : UInt64
    get_domain : UInt64
    get_extension : UInt64
    get_fragment : UInt64
    get_host : UInt64
    get_password : UInt64
    get_path : UInt64
    get_path_and_query : UInt64
    get_query : UInt64
    get_raw_uri : UInt64
    get_scheme_name : UInt64
    get_user_info : UInt64
    get_user_name : UInt64
    get_host_type : UInt64
    get_port : UInt64
    get_scheme : UInt64
    get_zone : UInt64
    get_properties : UInt64
    is_equal : UInt64
  end

  IUri_GUID = "a39ee748-6a27-4817-a6f2-13914bef5890"
  IID_IUri = LibC::GUID.new(0xa39ee748_u32, 0x6a27_u16, 0x4817_u16, StaticArray[0xa6_u8, 0xf2_u8, 0x13_u8, 0x91_u8, 0x4b_u8, 0xef_u8, 0x58_u8, 0x90_u8])
  struct IUri
    lpVtbl : IUriVTbl*
  end

  struct IUriBuilderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_uri_simple : UInt64
    create_uri : UInt64
    create_uri_with_flags : UInt64
    get_i_uri : UInt64
    set_i_uri : UInt64
    get_fragment : UInt64
    get_host : UInt64
    get_password : UInt64
    get_path : UInt64
    get_port : UInt64
    get_query : UInt64
    get_scheme_name : UInt64
    get_user_name : UInt64
    set_fragment : UInt64
    set_host : UInt64
    set_password : UInt64
    set_path : UInt64
    set_port : UInt64
    set_query : UInt64
    set_scheme_name : UInt64
    set_user_name : UInt64
    remove_properties : UInt64
    has_been_modified : UInt64
  end

  IUriBuilder_GUID = "4221b2e1-8955-46c0-bd5b-de9897565de7"
  IID_IUriBuilder = LibC::GUID.new(0x4221b2e1_u32, 0x8955_u16, 0x46c0_u16, StaticArray[0xbd_u8, 0x5b_u8, 0xde_u8, 0x98_u8, 0x97_u8, 0x56_u8, 0x5d_u8, 0xe7_u8])
  struct IUriBuilder
    lpVtbl : IUriBuilderVTbl*
  end

  struct IBindHostVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_moniker : UInt64
    moniker_bind_to_storage : UInt64
    moniker_bind_to_object : UInt64
  end

  IBindHost_GUID = "fc4801a1-2ba9-11cf-a229-00aa003d7352"
  IID_IBindHost = LibC::GUID.new(0xfc4801a1_u32, 0x2ba9_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x29_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x3d_u8, 0x73_u8, 0x52_u8])
  struct IBindHost
    lpVtbl : IBindHostVTbl*
  end

  struct IDispatchVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IDispatch_GUID = "00020400-0000-0000-c000-000000000046"
  IID_IDispatch = LibC::GUID.new(0x20400_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IDispatch
    lpVtbl : IDispatchVTbl*
  end

  struct ITypeCompVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    bind : UInt64
    bind_type : UInt64
  end

  ITypeComp_GUID = "00020403-0000-0000-c000-000000000046"
  IID_ITypeComp = LibC::GUID.new(0x20403_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeComp
    lpVtbl : ITypeCompVTbl*
  end

  struct ITypeInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_attr : UInt64
    get_type_comp : UInt64
    get_func_desc : UInt64
    get_var_desc : UInt64
    get_names : UInt64
    get_ref_type_of_impl_type : UInt64
    get_impl_type_flags : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_documentation : UInt64
    get_dll_entry : UInt64
    get_ref_type_info : UInt64
    address_of_member : UInt64
    create_instance : UInt64
    get_mops : UInt64
    get_containing_type_lib : UInt64
    release_type_attr : UInt64
    release_func_desc : UInt64
    release_var_desc : UInt64
  end

  ITypeInfo_GUID = "00020401-0000-0000-c000-000000000046"
  IID_ITypeInfo = LibC::GUID.new(0x20401_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeInfo
    lpVtbl : ITypeInfoVTbl*
  end

  struct ITypeInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_attr : UInt64
    get_type_comp : UInt64
    get_func_desc : UInt64
    get_var_desc : UInt64
    get_names : UInt64
    get_ref_type_of_impl_type : UInt64
    get_impl_type_flags : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_documentation : UInt64
    get_dll_entry : UInt64
    get_ref_type_info : UInt64
    address_of_member : UInt64
    create_instance : UInt64
    get_mops : UInt64
    get_containing_type_lib : UInt64
    release_type_attr : UInt64
    release_func_desc : UInt64
    release_var_desc : UInt64
    get_type_kind : UInt64
    get_type_flags : UInt64
    get_func_index_of_mem_id : UInt64
    get_var_index_of_mem_id : UInt64
    get_cust_data : UInt64
    get_func_cust_data : UInt64
    get_param_cust_data : UInt64
    get_var_cust_data : UInt64
    get_impl_type_cust_data : UInt64
    get_documentation2 : UInt64
    get_all_cust_data : UInt64
    get_all_func_cust_data : UInt64
    get_all_param_cust_data : UInt64
    get_all_var_cust_data : UInt64
    get_all_impl_type_cust_data : UInt64
  end

  ITypeInfo2_GUID = "00020412-0000-0000-c000-000000000046"
  IID_ITypeInfo2 = LibC::GUID.new(0x20412_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeInfo2
    lpVtbl : ITypeInfo2VTbl*
  end

  struct ITypeLibVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_type_info_type : UInt64
    get_type_info_of_guid : UInt64
    get_lib_attr : UInt64
    get_type_comp : UInt64
    get_documentation : UInt64
    is_name : UInt64
    find_name : UInt64
    release_t_lib_attr : UInt64
  end

  ITypeLib_GUID = "00020402-0000-0000-c000-000000000046"
  IID_ITypeLib = LibC::GUID.new(0x20402_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeLib
    lpVtbl : ITypeLibVTbl*
  end

  struct ITypeLib2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_type_info_type : UInt64
    get_type_info_of_guid : UInt64
    get_lib_attr : UInt64
    get_type_comp : UInt64
    get_documentation : UInt64
    is_name : UInt64
    find_name : UInt64
    release_t_lib_attr : UInt64
    get_cust_data : UInt64
    get_lib_statistics : UInt64
    get_documentation2 : UInt64
    get_all_cust_data : UInt64
  end

  ITypeLib2_GUID = "00020411-0000-0000-c000-000000000046"
  IID_ITypeLib2 = LibC::GUID.new(0x20411_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ITypeLib2
    lpVtbl : ITypeLib2VTbl*
  end

  struct IErrorInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_guid : UInt64
    get_source : UInt64
    get_description : UInt64
    get_help_file : UInt64
    get_help_context : UInt64
  end

  IErrorInfo_GUID = "1cf2b120-547d-101b-8e65-08002b2bd119"
  IID_IErrorInfo = LibC::GUID.new(0x1cf2b120_u32, 0x547d_u16, 0x101b_u16, StaticArray[0x8e_u8, 0x65_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2b_u8, 0xd1_u8, 0x19_u8])
  struct IErrorInfo
    lpVtbl : IErrorInfoVTbl*
  end

  struct ISupportErrorInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    interface_supports_error_info : UInt64
  end

  ISupportErrorInfo_GUID = "df0b3d60-548f-101b-8e65-08002b2bd119"
  IID_ISupportErrorInfo = LibC::GUID.new(0xdf0b3d60_u32, 0x548f_u16, 0x101b_u16, StaticArray[0x8e_u8, 0x65_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2b_u8, 0xd1_u8, 0x19_u8])
  struct ISupportErrorInfo
    lpVtbl : ISupportErrorInfoVTbl*
  end

  struct IErrorLogVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_error : UInt64
  end

  IErrorLog_GUID = "3127ca40-446e-11ce-8135-00aa004bb851"
  IID_IErrorLog = LibC::GUID.new(0x3127ca40_u32, 0x446e_u16, 0x11ce_u16, StaticArray[0x81_u8, 0x35_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xb8_u8, 0x51_u8])
  struct IErrorLog
    lpVtbl : IErrorLogVTbl*
  end

  struct ITypeLibRegistrationReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enum_type_lib_registrations : UInt64
  end

  ITypeLibRegistrationReader_GUID = "ed6a8a2a-b160-4e77-8f73-aa7435cd5c27"
  IID_ITypeLibRegistrationReader = LibC::GUID.new(0xed6a8a2a_u32, 0xb160_u16, 0x4e77_u16, StaticArray[0x8f_u8, 0x73_u8, 0xaa_u8, 0x74_u8, 0x35_u8, 0xcd_u8, 0x5c_u8, 0x27_u8])
  struct ITypeLibRegistrationReader
    lpVtbl : ITypeLibRegistrationReaderVTbl*
  end

  struct ITypeLibRegistrationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_guid : UInt64
    get_version : UInt64
    get_lcid : UInt64
    get_win32_path : UInt64
    get_win64_path : UInt64
    get_display_name : UInt64
    get_flags : UInt64
    get_help_dir : UInt64
  end

  ITypeLibRegistration_GUID = "76a3e735-02df-4a12-98eb-043ad3600af3"
  IID_ITypeLibRegistration = LibC::GUID.new(0x76a3e735_u32, 0x2df_u16, 0x4a12_u16, StaticArray[0x98_u8, 0xeb_u8, 0x4_u8, 0x3a_u8, 0xd3_u8, 0x60_u8, 0xa_u8, 0xf3_u8])
  struct ITypeLibRegistration
    lpVtbl : ITypeLibRegistrationVTbl*
  end

  struct IEnumConnectionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumConnections_GUID = "b196b287-bab4-101a-b69c-00aa00341d07"
  IID_IEnumConnections = LibC::GUID.new(0xb196b287_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
  struct IEnumConnections
    lpVtbl : IEnumConnectionsVTbl*
  end

  struct IConnectionPointVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_connection_interface : UInt64
    get_connection_point_container : UInt64
    advise : UInt64
    unadvise : UInt64
    enum_connections : UInt64
  end

  IConnectionPoint_GUID = "b196b286-bab4-101a-b69c-00aa00341d07"
  IID_IConnectionPoint = LibC::GUID.new(0xb196b286_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
  struct IConnectionPoint
    lpVtbl : IConnectionPointVTbl*
  end

  struct IEnumConnectionPointsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumConnectionPoints_GUID = "b196b285-bab4-101a-b69c-00aa00341d07"
  IID_IEnumConnectionPoints = LibC::GUID.new(0xb196b285_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
  struct IEnumConnectionPoints
    lpVtbl : IEnumConnectionPointsVTbl*
  end

  struct IConnectionPointContainerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enum_connection_points : UInt64
    find_connection_point : UInt64
  end

  IConnectionPointContainer_GUID = "b196b284-bab4-101a-b69c-00aa00341d07"
  IID_IConnectionPointContainer = LibC::GUID.new(0xb196b284_u32, 0xbab4_u16, 0x101a_u16, StaticArray[0xb6_u8, 0x9c_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x34_u8, 0x1d_u8, 0x7_u8])
  struct IConnectionPointContainer
    lpVtbl : IConnectionPointContainerVTbl*
  end

  struct IPersistMemoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_id : UInt64
    is_dirty : UInt64
    load : UInt64
    save : UInt64
    get_size_max : UInt64
    init_new : UInt64
  end

  IPersistMemory_GUID = "bd1ae5e0-a6ae-11ce-bd37-504200c10000"
  IID_IPersistMemory = LibC::GUID.new(0xbd1ae5e0_u32, 0xa6ae_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x37_u8, 0x50_u8, 0x42_u8, 0x0_u8, 0xc1_u8, 0x0_u8, 0x0_u8])
  struct IPersistMemory
    lpVtbl : IPersistMemoryVTbl*
  end

  struct IPersistStreamInitVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_id : UInt64
    is_dirty : UInt64
    load : UInt64
    save : UInt64
    get_size_max : UInt64
    init_new : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::AsyncIUnknown
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_query_interface(riid : Guid*) : HRESULT
    @lpVtbl.value.begin_query_interface.unsafe_as(Proc(Guid*, HRESULT)).call(riid)
  end
  def finish_query_interface(ppvobject : Void**) : HRESULT
    @lpVtbl.value.finish_query_interface.unsafe_as(Proc(Void**, HRESULT)).call(ppvobject)
  end
  def begin_add_ref : HRESULT
    @lpVtbl.value.begin_add_ref.unsafe_as(Proc(HRESULT)).call
  end
  def finish_add_ref : UInt32
    @lpVtbl.value.finish_add_ref.unsafe_as(Proc(UInt32)).call
  end
  def begin_release : HRESULT
    @lpVtbl.value.begin_release.unsafe_as(Proc(HRESULT)).call
  end
  def finish_release : UInt32
    @lpVtbl.value.finish_release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IClassFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_instance(punkouter : IUnknown, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(IUnknown, Guid*, Void**, HRESULT)).call(punkouter, riid, ppvobject)
  end
  def lock_server(flock : LibC::BOOL) : HRESULT
    @lpVtbl.value.lock_server.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(flock)
  end
end
struct LibWin32::INoMarshal
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IAgileObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IActivationFilter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_activation(dwactivationtype : UInt32, rclsid : Guid*, preplacementclsid : Guid*) : HRESULT
    @lpVtbl.value.handle_activation.unsafe_as(Proc(UInt32, Guid*, Guid*, HRESULT)).call(dwactivationtype, rclsid, preplacementclsid)
  end
end
struct LibWin32::IMalloc
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def alloc(cb : LibC::UINT_PTR) : Void*
    this = self
    @lpVtbl.value.alloc.unsafe_as(Proc(LibC::UINT_PTR, Void*)).call(cb)
  end
  def realloc(pv : Void*, cb : LibC::UINT_PTR) : Void*
    @lpVtbl.value.realloc.unsafe_as(Proc(Void*, LibC::UINT_PTR, Void**)).call(pv, cb)
  end
  def free(pv : Void*) : Void
    @lpVtbl.value.free.unsafe_as(Proc(Void*, Void)).call(pv)
  end
  def get_size(pv : Void*) : LibC::UINT_PTR
    this = self
    @lpVtbl.value.get_size.unsafe_as(Proc(Void*, LibC::UINT_PTR)).call(pv)
  end
  def did_alloc(pv : Void*) : Int32
    @lpVtbl.value.did_alloc.unsafe_as(Proc(Void*, Int32)).call(pv)
  end
  def heap_minimize : Void
    @lpVtbl.value.heap_minimize.unsafe_as(Proc(Void)).call
  end
end
struct LibWin32::IStdMarshalInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_class_for_handler(dwdestcontext : UInt32, pvdestcontext : Void*, pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_class_for_handler.unsafe_as(Proc(UInt32, Void*, Guid*, HRESULT)).call(dwdestcontext, pvdestcontext, pclsid)
  end
end
struct LibWin32::IExternalConnection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_connection(extconn : UInt32, reserved : UInt32) : UInt32
    @lpVtbl.value.add_connection.unsafe_as(Proc(UInt32, UInt32, UInt32)).call(extconn, reserved)
  end
  def release_connection(extconn : UInt32, reserved : UInt32, flastreleasecloses : LibC::BOOL) : UInt32
    @lpVtbl.value.release_connection.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL, UInt32)).call(extconn, reserved, flastreleasecloses)
  end
end
struct LibWin32::IMultiQI
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_multiple_interfaces(cmqis : UInt32, pmqis : MULTI_QI*) : HRESULT
    @lpVtbl.value.query_multiple_interfaces.unsafe_as(Proc(UInt32, MULTI_QI*, HRESULT)).call(cmqis, pmqis)
  end
end
struct LibWin32::AsyncIMultiQI
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_query_multiple_interfaces(cmqis : UInt32, pmqis : MULTI_QI*) : HRESULT
    @lpVtbl.value.begin_query_multiple_interfaces.unsafe_as(Proc(UInt32, MULTI_QI*, HRESULT)).call(cmqis, pmqis)
  end
  def finish_query_multiple_interfaces(pmqis : MULTI_QI*) : HRESULT
    @lpVtbl.value.finish_query_multiple_interfaces.unsafe_as(Proc(MULTI_QI*, HRESULT)).call(pmqis)
  end
end
struct LibWin32::IInternalUnknown
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_internal_interface(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.query_internal_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::IEnumUnknown
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : IUnknown*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IUnknown*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumUnknown*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumString
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : LibC::LPWSTR*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, LibC::LPWSTR*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumString*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumString*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ISequentialStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbread)
  end
  def write(pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbwritten)
  end
end
struct LibWin32::IStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbread)
  end
  def write(pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbwritten)
  end
  def seek(dlibmove : LARGE_INTEGER, dworigin : STREAM_SEEK, plibnewposition : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)).call(dlibmove, dworigin, plibnewposition)
  end
  def set_size(libnewsize : ULARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(ULARGE_INTEGER, HRESULT)).call(libnewsize)
  end
  def copy_to(pstm : IStream, cb : ULARGE_INTEGER, pcbread : ULARGE_INTEGER*, pcbwritten : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)).call(pstm, cb, pcbread, pcbwritten)
  end
  def commit(grfcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(grfcommitflags)
  end
  def revert : HRESULT
    @lpVtbl.value.revert.unsafe_as(Proc(HRESULT)).call
  end
  def lock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.lock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def unlock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.unlock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def stat(pstatstg : STATSTG*, grfstatflag : UInt32) : HRESULT
    @lpVtbl.value.stat.unsafe_as(Proc(STATSTG*, UInt32, HRESULT)).call(pstatstg, grfstatflag)
  end
  def clone(ppstm : IStream*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IStream*, HRESULT)).call(ppstm)
  end
end
struct LibWin32::IRpcChannelBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer(pmessage : RPCOLEMESSAGE*, riid : Guid*) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(RPCOLEMESSAGE*, Guid*, HRESULT)).call(pmessage, riid)
  end
  def send_receive(pmessage : RPCOLEMESSAGE*, pstatus : UInt32*) : HRESULT
    @lpVtbl.value.send_receive.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32*, HRESULT)).call(pmessage, pstatus)
  end
  def free_buffer(pmessage : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(RPCOLEMESSAGE*, HRESULT)).call(pmessage)
  end
  def get_dest_ctx(pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx.unsafe_as(Proc(UInt32*, Void**, HRESULT)).call(pdwdestcontext, ppvdestcontext)
  end
  def is_connected : HRESULT
    @lpVtbl.value.is_connected.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IRpcChannelBuffer2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer(pmessage : RPCOLEMESSAGE*, riid : Guid*) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(RPCOLEMESSAGE*, Guid*, HRESULT)).call(pmessage, riid)
  end
  def send_receive(pmessage : RPCOLEMESSAGE*, pstatus : UInt32*) : HRESULT
    @lpVtbl.value.send_receive.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32*, HRESULT)).call(pmessage, pstatus)
  end
  def free_buffer(pmessage : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(RPCOLEMESSAGE*, HRESULT)).call(pmessage)
  end
  def get_dest_ctx(pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx.unsafe_as(Proc(UInt32*, Void**, HRESULT)).call(pdwdestcontext, ppvdestcontext)
  end
  def is_connected : HRESULT
    @lpVtbl.value.is_connected.unsafe_as(Proc(HRESULT)).call
  end
  def get_protocol_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
end
struct LibWin32::IAsyncRpcChannelBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer(pmessage : RPCOLEMESSAGE*, riid : Guid*) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(RPCOLEMESSAGE*, Guid*, HRESULT)).call(pmessage, riid)
  end
  def send_receive(pmessage : RPCOLEMESSAGE*, pstatus : UInt32*) : HRESULT
    @lpVtbl.value.send_receive.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32*, HRESULT)).call(pmessage, pstatus)
  end
  def free_buffer(pmessage : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(RPCOLEMESSAGE*, HRESULT)).call(pmessage)
  end
  def get_dest_ctx(pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx.unsafe_as(Proc(UInt32*, Void**, HRESULT)).call(pdwdestcontext, ppvdestcontext)
  end
  def is_connected : HRESULT
    @lpVtbl.value.is_connected.unsafe_as(Proc(HRESULT)).call
  end
  def get_protocol_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def send(pmsg : RPCOLEMESSAGE*, psync : ISynchronize, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.send.unsafe_as(Proc(RPCOLEMESSAGE*, ISynchronize, UInt32*, HRESULT)).call(pmsg, psync, pulstatus)
  end
  def receive(pmsg : RPCOLEMESSAGE*, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.receive.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32*, HRESULT)).call(pmsg, pulstatus)
  end
  def get_dest_ctx_ex(pmsg : RPCOLEMESSAGE*, pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx_ex.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32*, Void**, HRESULT)).call(pmsg, pdwdestcontext, ppvdestcontext)
  end
end
struct LibWin32::IRpcChannelBuffer3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer(pmessage : RPCOLEMESSAGE*, riid : Guid*) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(RPCOLEMESSAGE*, Guid*, HRESULT)).call(pmessage, riid)
  end
  def send_receive(pmessage : RPCOLEMESSAGE*, pstatus : UInt32*) : HRESULT
    @lpVtbl.value.send_receive.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32*, HRESULT)).call(pmessage, pstatus)
  end
  def free_buffer(pmessage : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(RPCOLEMESSAGE*, HRESULT)).call(pmessage)
  end
  def get_dest_ctx(pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx.unsafe_as(Proc(UInt32*, Void**, HRESULT)).call(pdwdestcontext, ppvdestcontext)
  end
  def is_connected : HRESULT
    @lpVtbl.value.is_connected.unsafe_as(Proc(HRESULT)).call
  end
  def get_protocol_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def send(pmsg : RPCOLEMESSAGE*, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.send.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32*, HRESULT)).call(pmsg, pulstatus)
  end
  def receive(pmsg : RPCOLEMESSAGE*, ulsize : UInt32, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.receive.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32, UInt32*, HRESULT)).call(pmsg, ulsize, pulstatus)
  end
  def cancel(pmsg : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(RPCOLEMESSAGE*, HRESULT)).call(pmsg)
  end
  def get_call_context(pmsg : RPCOLEMESSAGE*, riid : Guid*, pinterface : Void**) : HRESULT
    @lpVtbl.value.get_call_context.unsafe_as(Proc(RPCOLEMESSAGE*, Guid*, Void**, HRESULT)).call(pmsg, riid, pinterface)
  end
  def get_dest_ctx_ex(pmsg : RPCOLEMESSAGE*, pdwdestcontext : UInt32*, ppvdestcontext : Void**) : HRESULT
    @lpVtbl.value.get_dest_ctx_ex.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32*, Void**, HRESULT)).call(pmsg, pdwdestcontext, ppvdestcontext)
  end
  def get_state(pmsg : RPCOLEMESSAGE*, pstate : UInt32*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32*, HRESULT)).call(pmsg, pstate)
  end
  def register_async(pmsg : RPCOLEMESSAGE*, pasyncmgr : IAsyncManager) : HRESULT
    @lpVtbl.value.register_async.unsafe_as(Proc(RPCOLEMESSAGE*, IAsyncManager, HRESULT)).call(pmsg, pasyncmgr)
  end
end
struct LibWin32::IRpcSyntaxNegotiate
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def negotiate_syntax(pmsg : RPCOLEMESSAGE*) : HRESULT
    @lpVtbl.value.negotiate_syntax.unsafe_as(Proc(RPCOLEMESSAGE*, HRESULT)).call(pmsg)
  end
end
struct LibWin32::IRpcProxyBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def connect(prpcchannelbuffer : IRpcChannelBuffer) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(IRpcChannelBuffer, HRESULT)).call(prpcchannelbuffer)
  end
  def disconnect : Void
    @lpVtbl.value.disconnect.unsafe_as(Proc(Void)).call
  end
end
struct LibWin32::IRpcStubBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def connect(punkserver : IUnknown) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(IUnknown, HRESULT)).call(punkserver)
  end
  def disconnect : Void
    @lpVtbl.value.disconnect.unsafe_as(Proc(Void)).call
  end
  def invoke(prpcmsg : RPCOLEMESSAGE*, prpcchannelbuffer : IRpcChannelBuffer) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(RPCOLEMESSAGE*, IRpcChannelBuffer, HRESULT)).call(prpcmsg, prpcchannelbuffer)
  end
  def is_iid_supported(riid : Guid*) : IRpcStubBuffer
    @lpVtbl.value.is_iid_supported.unsafe_as(Proc(Guid*, IRpcStubBuffer)).call(riid)
  end
  def count_refs : UInt32
    @lpVtbl.value.count_refs.unsafe_as(Proc(UInt32)).call
  end
  def debug_server_query_interface(ppv : Void**) : HRESULT
    @lpVtbl.value.debug_server_query_interface.unsafe_as(Proc(Void**, HRESULT)).call(ppv)
  end
  def debug_server_release(pv : Void*) : Void
    @lpVtbl.value.debug_server_release.unsafe_as(Proc(Void*, Void)).call(pv)
  end
end
struct LibWin32::IPSFactoryBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_proxy(punkouter : IUnknown, riid : Guid*, ppproxy : IRpcProxyBuffer*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_proxy.unsafe_as(Proc(IUnknown, Guid*, IRpcProxyBuffer*, Void**, HRESULT)).call(punkouter, riid, ppproxy, ppv)
  end
  def create_stub(riid : Guid*, punkserver : IUnknown, ppstub : IRpcStubBuffer*) : HRESULT
    @lpVtbl.value.create_stub.unsafe_as(Proc(Guid*, IUnknown, IRpcStubBuffer*, HRESULT)).call(riid, punkserver, ppstub)
  end
end
struct LibWin32::IChannelHook
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def client_get_size(uextent : Guid*, riid : Guid*, pdatasize : UInt32*) : Void
    @lpVtbl.value.client_get_size.unsafe_as(Proc(Guid*, Guid*, UInt32*, Void)).call(uextent, riid, pdatasize)
  end
  def client_fill_buffer(uextent : Guid*, riid : Guid*, pdatasize : UInt32*, pdatabuffer : Void*) : Void
    @lpVtbl.value.client_fill_buffer.unsafe_as(Proc(Guid*, Guid*, UInt32*, Void*, Void)).call(uextent, riid, pdatasize, pdatabuffer)
  end
  def client_notify(uextent : Guid*, riid : Guid*, cbdatasize : UInt32, pdatabuffer : Void*, ldatarep : UInt32, hrfault : HRESULT) : Void
    @lpVtbl.value.client_notify.unsafe_as(Proc(Guid*, Guid*, UInt32, Void*, UInt32, HRESULT, Void)).call(uextent, riid, cbdatasize, pdatabuffer, ldatarep, hrfault)
  end
  def server_notify(uextent : Guid*, riid : Guid*, cbdatasize : UInt32, pdatabuffer : Void*, ldatarep : UInt32) : Void
    @lpVtbl.value.server_notify.unsafe_as(Proc(Guid*, Guid*, UInt32, Void*, UInt32, Void)).call(uextent, riid, cbdatasize, pdatabuffer, ldatarep)
  end
  def server_get_size(uextent : Guid*, riid : Guid*, hrfault : HRESULT, pdatasize : UInt32*) : Void
    @lpVtbl.value.server_get_size.unsafe_as(Proc(Guid*, Guid*, HRESULT, UInt32*, Void)).call(uextent, riid, hrfault, pdatasize)
  end
  def server_fill_buffer(uextent : Guid*, riid : Guid*, pdatasize : UInt32*, pdatabuffer : Void*, hrfault : HRESULT) : Void
    @lpVtbl.value.server_fill_buffer.unsafe_as(Proc(Guid*, Guid*, UInt32*, Void*, HRESULT, Void)).call(uextent, riid, pdatasize, pdatabuffer, hrfault)
  end
end
struct LibWin32::IClientSecurity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_blanket(pproxy : IUnknown, pauthnsvc : UInt32*, pauthzsvc : UInt32*, pserverprincname : UInt16**, pauthnlevel : RPC_C_AUTHN_LEVEL*, pimplevel : RPC_C_IMP_LEVEL*, pauthinfo : Void**, pcapabilites : EOLE_AUTHENTICATION_CAPABILITIES*) : HRESULT
    @lpVtbl.value.query_blanket.unsafe_as(Proc(IUnknown, UInt32*, UInt32*, UInt16**, RPC_C_AUTHN_LEVEL*, RPC_C_IMP_LEVEL*, Void**, EOLE_AUTHENTICATION_CAPABILITIES*, HRESULT)).call(pproxy, pauthnsvc, pauthzsvc, pserverprincname, pauthnlevel, pimplevel, pauthinfo, pcapabilites)
  end
  def set_blanket(pproxy : IUnknown, dwauthnsvc : UInt32, dwauthzsvc : UInt32, pserverprincname : LibC::LPWSTR, dwauthnlevel : RPC_C_AUTHN_LEVEL, dwimplevel : RPC_C_IMP_LEVEL, pauthinfo : Void*, dwcapabilities : EOLE_AUTHENTICATION_CAPABILITIES) : HRESULT
    @lpVtbl.value.set_blanket.unsafe_as(Proc(IUnknown, UInt32, UInt32, LibC::LPWSTR, RPC_C_AUTHN_LEVEL, RPC_C_IMP_LEVEL, Void*, EOLE_AUTHENTICATION_CAPABILITIES, HRESULT)).call(pproxy, dwauthnsvc, dwauthzsvc, pserverprincname, dwauthnlevel, dwimplevel, pauthinfo, dwcapabilities)
  end
  def copy_proxy(pproxy : IUnknown, ppcopy : IUnknown*) : HRESULT
    @lpVtbl.value.copy_proxy.unsafe_as(Proc(IUnknown, IUnknown*, HRESULT)).call(pproxy, ppcopy)
  end
end
struct LibWin32::IServerSecurity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_blanket(pauthnsvc : UInt32*, pauthzsvc : UInt32*, pserverprincname : UInt16**, pauthnlevel : UInt32*, pimplevel : UInt32*, pprivs : Void**, pcapabilities : UInt32*) : HRESULT
    @lpVtbl.value.query_blanket.unsafe_as(Proc(UInt32*, UInt32*, UInt16**, UInt32*, UInt32*, Void**, UInt32*, HRESULT)).call(pauthnsvc, pauthzsvc, pserverprincname, pauthnlevel, pimplevel, pprivs, pcapabilities)
  end
  def impersonate_client : HRESULT
    @lpVtbl.value.impersonate_client.unsafe_as(Proc(HRESULT)).call
  end
  def revert_to_self : HRESULT
    @lpVtbl.value.revert_to_self.unsafe_as(Proc(HRESULT)).call
  end
  def is_impersonating : LibC::BOOL
    @lpVtbl.value.is_impersonating.unsafe_as(Proc(LibC::BOOL)).call
  end
end
struct LibWin32::IRpcOptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set(pprx : IUnknown, dwproperty : RPCOPT_PROPERTIES, dwvalue : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.set.unsafe_as(Proc(IUnknown, RPCOPT_PROPERTIES, LibC::UINT_PTR, HRESULT)).call(pprx, dwproperty, dwvalue)
  end
  def query(pprx : IUnknown, dwproperty : RPCOPT_PROPERTIES, pdwvalue : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.query.unsafe_as(Proc(IUnknown, RPCOPT_PROPERTIES, LibC::UINT_PTR*, HRESULT)).call(pprx, dwproperty, pdwvalue)
  end
end
struct LibWin32::IGlobalOptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set(dwproperty : GLOBALOPT_PROPERTIES, dwvalue : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.set.unsafe_as(Proc(GLOBALOPT_PROPERTIES, LibC::UINT_PTR, HRESULT)).call(dwproperty, dwvalue)
  end
  def query(dwproperty : GLOBALOPT_PROPERTIES, pdwvalue : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.query.unsafe_as(Proc(GLOBALOPT_PROPERTIES, LibC::UINT_PTR*, HRESULT)).call(dwproperty, pdwvalue)
  end
end
struct LibWin32::ISurrogate
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load_dll_server(clsid : Guid*) : HRESULT
    @lpVtbl.value.load_dll_server.unsafe_as(Proc(Guid*, HRESULT)).call(clsid)
  end
  def free_surrogate : HRESULT
    @lpVtbl.value.free_surrogate.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IGlobalInterfaceTable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_interface_in_global(punk : IUnknown, riid : Guid*, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.register_interface_in_global.unsafe_as(Proc(IUnknown, Guid*, UInt32*, HRESULT)).call(punk, riid, pdwcookie)
  end
  def revoke_interface_from_global(dwcookie : UInt32) : HRESULT
    @lpVtbl.value.revoke_interface_from_global.unsafe_as(Proc(UInt32, HRESULT)).call(dwcookie)
  end
  def get_interface_from_global(dwcookie : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_interface_from_global.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(dwcookie, riid, ppv)
  end
end
struct LibWin32::ISynchronize
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def wait(dwflags : UInt32, dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwflags, dwmilliseconds)
  end
  def signal : HRESULT
    @lpVtbl.value.signal.unsafe_as(Proc(HRESULT)).call
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISynchronizeHandle
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_handle(ph : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_handle.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(ph)
  end
end
struct LibWin32::ISynchronizeEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_handle(ph : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_handle.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(ph)
  end
  def set_event_handle(ph : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.set_event_handle.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(ph)
  end
end
struct LibWin32::ISynchronizeContainer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_synchronize(psync : ISynchronize) : HRESULT
    @lpVtbl.value.add_synchronize.unsafe_as(Proc(ISynchronize, HRESULT)).call(psync)
  end
  def wait_multiple(dwflags : UInt32, dwtimeout : UInt32, ppsync : ISynchronize*) : HRESULT
    @lpVtbl.value.wait_multiple.unsafe_as(Proc(UInt32, UInt32, ISynchronize*, HRESULT)).call(dwflags, dwtimeout, ppsync)
  end
end
struct LibWin32::ISynchronizeMutex
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def wait(dwflags : UInt32, dwmilliseconds : UInt32) : HRESULT
    @lpVtbl.value.wait.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwflags, dwmilliseconds)
  end
  def signal : HRESULT
    @lpVtbl.value.signal.unsafe_as(Proc(HRESULT)).call
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def release_mutex : HRESULT
    @lpVtbl.value.release_mutex.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ICancelMethodCalls
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cancel(ulseconds : UInt32) : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(UInt32, HRESULT)).call(ulseconds)
  end
  def test_cancel : HRESULT
    @lpVtbl.value.test_cancel.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAsyncManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def complete_call(result : HRESULT) : HRESULT
    @lpVtbl.value.complete_call.unsafe_as(Proc(HRESULT, HRESULT)).call(result)
  end
  def get_call_context(riid : Guid*, pinterface : Void**) : HRESULT
    @lpVtbl.value.get_call_context.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, pinterface)
  end
  def get_state(pulstateflags : UInt32*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(UInt32*, HRESULT)).call(pulstateflags)
  end
end
struct LibWin32::ICallFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_call(riid : Guid*, pctrlunk : IUnknown, riid2 : Guid*, ppv : IUnknown*) : HRESULT
    @lpVtbl.value.create_call.unsafe_as(Proc(Guid*, IUnknown, Guid*, IUnknown*, HRESULT)).call(riid, pctrlunk, riid2, ppv)
  end
end
struct LibWin32::IRpcHelper
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_dcom_protocol_version(pcomversion : UInt32*) : HRESULT
    @lpVtbl.value.get_dcom_protocol_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pcomversion)
  end
  def get_iid_from_objref(pobjref : Void*, piid : Guid**) : HRESULT
    @lpVtbl.value.get_iid_from_objref.unsafe_as(Proc(Void*, Guid**, HRESULT)).call(pobjref, piid)
  end
end
struct LibWin32::IReleaseMarshalBuffers
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def release_marshal_buffer(pmsg : RPCOLEMESSAGE*, dwflags : UInt32, pchnl : IUnknown) : HRESULT
    @lpVtbl.value.release_marshal_buffer.unsafe_as(Proc(RPCOLEMESSAGE*, UInt32, IUnknown, HRESULT)).call(pmsg, dwflags, pchnl)
  end
end
struct LibWin32::IWaitMultiple
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def wait_multiple(timeout : UInt32, psync : ISynchronize*) : HRESULT
    @lpVtbl.value.wait_multiple.unsafe_as(Proc(UInt32, ISynchronize*, HRESULT)).call(timeout, psync)
  end
  def add_synchronize(psync : ISynchronize) : HRESULT
    @lpVtbl.value.add_synchronize.unsafe_as(Proc(ISynchronize, HRESULT)).call(psync)
  end
end
struct LibWin32::IAddrTrackingControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enable_com_dynamic_addr_tracking : HRESULT
    @lpVtbl.value.enable_com_dynamic_addr_tracking.unsafe_as(Proc(HRESULT)).call
  end
  def disable_com_dynamic_addr_tracking : HRESULT
    @lpVtbl.value.disable_com_dynamic_addr_tracking.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAddrExclusionControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_addr_exclusion_list(riid : Guid*, ppenumerator : Void**) : HRESULT
    @lpVtbl.value.get_current_addr_exclusion_list.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppenumerator)
  end
  def update_addr_exclusion_list(penumerator : IUnknown) : HRESULT
    @lpVtbl.value.update_addr_exclusion_list.unsafe_as(Proc(IUnknown, HRESULT)).call(penumerator)
  end
end
struct LibWin32::IPipeByte
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def pull(buf : UInt8*, crequest : UInt32, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.pull.unsafe_as(Proc(UInt8*, UInt32, UInt32*, HRESULT)).call(buf, crequest, pcreturned)
  end
  def push(buf : UInt8*, csent : UInt32) : HRESULT
    @lpVtbl.value.push.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(buf, csent)
  end
end
struct LibWin32::AsyncIPipeByte
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_pull(crequest : UInt32) : HRESULT
    @lpVtbl.value.begin_pull.unsafe_as(Proc(UInt32, HRESULT)).call(crequest)
  end
  def finish_pull(buf : UInt8*, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.finish_pull.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(buf, pcreturned)
  end
  def begin_push(buf : UInt8*, csent : UInt32) : HRESULT
    @lpVtbl.value.begin_push.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(buf, csent)
  end
  def finish_push : HRESULT
    @lpVtbl.value.finish_push.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IPipeLong
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def pull(buf : Int32*, crequest : UInt32, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.pull.unsafe_as(Proc(Int32*, UInt32, UInt32*, HRESULT)).call(buf, crequest, pcreturned)
  end
  def push(buf : Int32*, csent : UInt32) : HRESULT
    @lpVtbl.value.push.unsafe_as(Proc(Int32*, UInt32, HRESULT)).call(buf, csent)
  end
end
struct LibWin32::AsyncIPipeLong
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_pull(crequest : UInt32) : HRESULT
    @lpVtbl.value.begin_pull.unsafe_as(Proc(UInt32, HRESULT)).call(crequest)
  end
  def finish_pull(buf : Int32*, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.finish_pull.unsafe_as(Proc(Int32*, UInt32*, HRESULT)).call(buf, pcreturned)
  end
  def begin_push(buf : Int32*, csent : UInt32) : HRESULT
    @lpVtbl.value.begin_push.unsafe_as(Proc(Int32*, UInt32, HRESULT)).call(buf, csent)
  end
  def finish_push : HRESULT
    @lpVtbl.value.finish_push.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IPipeDouble
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def pull(buf : Float64*, crequest : UInt32, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.pull.unsafe_as(Proc(Float64*, UInt32, UInt32*, HRESULT)).call(buf, crequest, pcreturned)
  end
  def push(buf : Float64*, csent : UInt32) : HRESULT
    @lpVtbl.value.push.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(buf, csent)
  end
end
struct LibWin32::AsyncIPipeDouble
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_pull(crequest : UInt32) : HRESULT
    @lpVtbl.value.begin_pull.unsafe_as(Proc(UInt32, HRESULT)).call(crequest)
  end
  def finish_pull(buf : Float64*, pcreturned : UInt32*) : HRESULT
    @lpVtbl.value.finish_pull.unsafe_as(Proc(Float64*, UInt32*, HRESULT)).call(buf, pcreturned)
  end
  def begin_push(buf : Float64*, csent : UInt32) : HRESULT
    @lpVtbl.value.begin_push.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(buf, csent)
  end
  def finish_push : HRESULT
    @lpVtbl.value.finish_push.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IComThreadingInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_apartment_type(papttype : APTTYPE*) : HRESULT
    @lpVtbl.value.get_current_apartment_type.unsafe_as(Proc(APTTYPE*, HRESULT)).call(papttype)
  end
  def get_current_thread_type(pthreadtype : THDTYPE*) : HRESULT
    @lpVtbl.value.get_current_thread_type.unsafe_as(Proc(THDTYPE*, HRESULT)).call(pthreadtype)
  end
  def get_current_logical_thread_id(pguidlogicalthreadid : Guid*) : HRESULT
    @lpVtbl.value.get_current_logical_thread_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguidlogicalthreadid)
  end
  def set_current_logical_thread_id(rguid : Guid*) : HRESULT
    @lpVtbl.value.set_current_logical_thread_id.unsafe_as(Proc(Guid*, HRESULT)).call(rguid)
  end
end
struct LibWin32::IProcessInitControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reset_initializer_timeout(dwsecondsremaining : UInt32) : HRESULT
    @lpVtbl.value.reset_initializer_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(dwsecondsremaining)
  end
end
struct LibWin32::IFastRundown
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IMachineGlobalObjectTable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_object(clsid : Guid*, identifier : LibC::LPWSTR, object : IUnknown, token : MachineGlobalObjectTableRegistrationToken__**) : HRESULT
    @lpVtbl.value.register_object.unsafe_as(Proc(Guid*, LibC::LPWSTR, IUnknown, MachineGlobalObjectTableRegistrationToken__**, HRESULT)).call(clsid, identifier, object, token)
  end
  def get_object(clsid : Guid*, identifier : LibC::LPWSTR, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_object.unsafe_as(Proc(Guid*, LibC::LPWSTR, Guid*, Void**, HRESULT)).call(clsid, identifier, riid, ppv)
  end
  def revoke_object(token : MachineGlobalObjectTableRegistrationToken__*) : HRESULT
    @lpVtbl.value.revoke_object.unsafe_as(Proc(MachineGlobalObjectTableRegistrationToken__*, HRESULT)).call(token)
  end
end
struct LibWin32::IMallocSpy
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def pre_alloc(cbrequest : LibC::UINT_PTR) : LibC::UINT_PTR
    @lpVtbl.value.pre_alloc.unsafe_as(Proc(LibC::UINT_PTR, LibC::UINT_PTR)).call(cbrequest)
  end
  def post_alloc(pactual : Void*) : Void*
    @lpVtbl.value.post_alloc.unsafe_as(Proc(Void*, Void**)).call(pactual)
  end
  def pre_free(prequest : Void*, fspyed : LibC::BOOL) : Void*
    @lpVtbl.value.pre_free.unsafe_as(Proc(Void*, LibC::BOOL, Void**)).call(prequest, fspyed)
  end
  def post_free(fspyed : LibC::BOOL) : Void
    @lpVtbl.value.post_free.unsafe_as(Proc(LibC::BOOL, Void)).call(fspyed)
  end
  def pre_realloc(prequest : Void*, cbrequest : LibC::UINT_PTR, ppnewrequest : Void**, fspyed : LibC::BOOL) : LibC::UINT_PTR
    @lpVtbl.value.pre_realloc.unsafe_as(Proc(Void*, LibC::UINT_PTR, Void**, LibC::BOOL, LibC::UINT_PTR)).call(prequest, cbrequest, ppnewrequest, fspyed)
  end
  def post_realloc(pactual : Void*, fspyed : LibC::BOOL) : Void*
    @lpVtbl.value.post_realloc.unsafe_as(Proc(Void*, LibC::BOOL, Void**)).call(pactual, fspyed)
  end
  def pre_get_size(prequest : Void*, fspyed : LibC::BOOL) : Void*
    @lpVtbl.value.pre_get_size.unsafe_as(Proc(Void*, LibC::BOOL, Void**)).call(prequest, fspyed)
  end
  def post_get_size(cbactual : LibC::UINT_PTR, fspyed : LibC::BOOL) : LibC::UINT_PTR
    @lpVtbl.value.post_get_size.unsafe_as(Proc(LibC::UINT_PTR, LibC::BOOL, LibC::UINT_PTR)).call(cbactual, fspyed)
  end
  def pre_did_alloc(prequest : Void*, fspyed : LibC::BOOL) : Void*
    @lpVtbl.value.pre_did_alloc.unsafe_as(Proc(Void*, LibC::BOOL, Void**)).call(prequest, fspyed)
  end
  def post_did_alloc(prequest : Void*, fspyed : LibC::BOOL, factual : Int32) : Int32
    @lpVtbl.value.post_did_alloc.unsafe_as(Proc(Void*, LibC::BOOL, Int32, Int32)).call(prequest, fspyed, factual)
  end
  def pre_heap_minimize : Void
    @lpVtbl.value.pre_heap_minimize.unsafe_as(Proc(Void)).call
  end
  def post_heap_minimize : Void
    @lpVtbl.value.post_heap_minimize.unsafe_as(Proc(Void)).call
  end
end
struct LibWin32::IBindCtx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_object_bound(punk : IUnknown) : HRESULT
    @lpVtbl.value.register_object_bound.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def revoke_object_bound(punk : IUnknown) : HRESULT
    @lpVtbl.value.revoke_object_bound.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def release_bound_objects : HRESULT
    @lpVtbl.value.release_bound_objects.unsafe_as(Proc(HRESULT)).call
  end
  def set_bind_options(pbindopts : BIND_OPTS*) : HRESULT
    @lpVtbl.value.set_bind_options.unsafe_as(Proc(BIND_OPTS*, HRESULT)).call(pbindopts)
  end
  def get_bind_options(pbindopts : BIND_OPTS*) : HRESULT
    @lpVtbl.value.get_bind_options.unsafe_as(Proc(BIND_OPTS*, HRESULT)).call(pbindopts)
  end
  def get_running_object_table(pprot : IRunningObjectTable*) : HRESULT
    @lpVtbl.value.get_running_object_table.unsafe_as(Proc(IRunningObjectTable*, HRESULT)).call(pprot)
  end
  def register_object_param(pszkey : LibC::LPWSTR, punk : IUnknown) : HRESULT
    @lpVtbl.value.register_object_param.unsafe_as(Proc(LibC::LPWSTR, IUnknown, HRESULT)).call(pszkey, punk)
  end
  def get_object_param(pszkey : LibC::LPWSTR, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_object_param.unsafe_as(Proc(LibC::LPWSTR, IUnknown*, HRESULT)).call(pszkey, ppunk)
  end
  def enum_object_param(ppenum : IEnumString*) : HRESULT
    @lpVtbl.value.enum_object_param.unsafe_as(Proc(IEnumString*, HRESULT)).call(ppenum)
  end
  def revoke_object_param(pszkey : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.revoke_object_param.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszkey)
  end
end
struct LibWin32::IEnumMoniker
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : IMoniker*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IMoniker*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumMoniker*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumMoniker*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IRunnableObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_running_class(lpclsid : Guid*) : HRESULT
    @lpVtbl.value.get_running_class.unsafe_as(Proc(Guid*, HRESULT)).call(lpclsid)
  end
  def run(pbc : IBindCtx) : HRESULT
    @lpVtbl.value.run.unsafe_as(Proc(IBindCtx, HRESULT)).call(pbc)
  end
  def is_running : LibC::BOOL
    @lpVtbl.value.is_running.unsafe_as(Proc(LibC::BOOL)).call
  end
  def lock_running(flock : LibC::BOOL, flastunlockcloses : LibC::BOOL) : HRESULT
    @lpVtbl.value.lock_running.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, HRESULT)).call(flock, flastunlockcloses)
  end
  def set_contained_object(fcontained : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_contained_object.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fcontained)
  end
end
struct LibWin32::IRunningObjectTable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register(grfflags : UInt32, punkobject : IUnknown, pmkobjectname : IMoniker, pdwregister : UInt32*) : HRESULT
    @lpVtbl.value.register.unsafe_as(Proc(UInt32, IUnknown, IMoniker, UInt32*, HRESULT)).call(grfflags, punkobject, pmkobjectname, pdwregister)
  end
  def revoke(dwregister : UInt32) : HRESULT
    @lpVtbl.value.revoke.unsafe_as(Proc(UInt32, HRESULT)).call(dwregister)
  end
  def is_running(pmkobjectname : IMoniker) : HRESULT
    @lpVtbl.value.is_running.unsafe_as(Proc(IMoniker, HRESULT)).call(pmkobjectname)
  end
  def get_object(pmkobjectname : IMoniker, ppunkobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_object.unsafe_as(Proc(IMoniker, IUnknown*, HRESULT)).call(pmkobjectname, ppunkobject)
  end
  def note_change_time(dwregister : UInt32, pfiletime : FILETIME*) : HRESULT
    @lpVtbl.value.note_change_time.unsafe_as(Proc(UInt32, FILETIME*, HRESULT)).call(dwregister, pfiletime)
  end
  def get_time_of_last_change(pmkobjectname : IMoniker, pfiletime : FILETIME*) : HRESULT
    @lpVtbl.value.get_time_of_last_change.unsafe_as(Proc(IMoniker, FILETIME*, HRESULT)).call(pmkobjectname, pfiletime)
  end
  def enum_running(ppenummoniker : IEnumMoniker*) : HRESULT
    @lpVtbl.value.enum_running.unsafe_as(Proc(IEnumMoniker*, HRESULT)).call(ppenummoniker)
  end
end
struct LibWin32::IPersist
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_class_id(pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.unsafe_as(Proc(Guid*, HRESULT)).call(pclassid)
  end
end
struct LibWin32::IPersistStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_class_id(pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.unsafe_as(Proc(Guid*, HRESULT)).call(pclassid)
  end
  def is_dirty : HRESULT
    @lpVtbl.value.is_dirty.unsafe_as(Proc(HRESULT)).call
  end
  def load(pstm : IStream) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(IStream, HRESULT)).call(pstm)
  end
  def save(pstm : IStream, fcleardirty : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(IStream, LibC::BOOL, HRESULT)).call(pstm, fcleardirty)
  end
  def get_size_max(pcbsize : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_size_max.unsafe_as(Proc(ULARGE_INTEGER*, HRESULT)).call(pcbsize)
  end
end
struct LibWin32::IMoniker
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_class_id(pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.unsafe_as(Proc(Guid*, HRESULT)).call(pclassid)
  end
  def is_dirty : HRESULT
    @lpVtbl.value.is_dirty.unsafe_as(Proc(HRESULT)).call
  end
  def load(pstm : IStream) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(IStream, HRESULT)).call(pstm)
  end
  def save(pstm : IStream, fcleardirty : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(IStream, LibC::BOOL, HRESULT)).call(pstm, fcleardirty)
  end
  def get_size_max(pcbsize : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_size_max.unsafe_as(Proc(ULARGE_INTEGER*, HRESULT)).call(pcbsize)
  end
  def bind_to_object(pbc : IBindCtx, pmktoleft : IMoniker, riidresult : Guid*, ppvresult : Void**) : HRESULT
    @lpVtbl.value.bind_to_object.unsafe_as(Proc(IBindCtx, IMoniker, Guid*, Void**, HRESULT)).call(pbc, pmktoleft, riidresult, ppvresult)
  end
  def bind_to_storage(pbc : IBindCtx, pmktoleft : IMoniker, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.bind_to_storage.unsafe_as(Proc(IBindCtx, IMoniker, Guid*, Void**, HRESULT)).call(pbc, pmktoleft, riid, ppvobj)
  end
  def reduce(pbc : IBindCtx, dwreducehowfar : UInt32, ppmktoleft : IMoniker*, ppmkreduced : IMoniker*) : HRESULT
    @lpVtbl.value.reduce.unsafe_as(Proc(IBindCtx, UInt32, IMoniker*, IMoniker*, HRESULT)).call(pbc, dwreducehowfar, ppmktoleft, ppmkreduced)
  end
  def compose_with(pmkright : IMoniker, fonlyifnotgeneric : LibC::BOOL, ppmkcomposite : IMoniker*) : HRESULT
    @lpVtbl.value.compose_with.unsafe_as(Proc(IMoniker, LibC::BOOL, IMoniker*, HRESULT)).call(pmkright, fonlyifnotgeneric, ppmkcomposite)
  end
  def enum(fforward : LibC::BOOL, ppenummoniker : IEnumMoniker*) : HRESULT
    @lpVtbl.value.enum.unsafe_as(Proc(LibC::BOOL, IEnumMoniker*, HRESULT)).call(fforward, ppenummoniker)
  end
  def is_equal(pmkothermoniker : IMoniker) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(IMoniker, HRESULT)).call(pmkothermoniker)
  end
  def hash(pdwhash : UInt32*) : HRESULT
    @lpVtbl.value.hash.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwhash)
  end
  def is_running(pbc : IBindCtx, pmktoleft : IMoniker, pmknewlyrunning : IMoniker) : HRESULT
    @lpVtbl.value.is_running.unsafe_as(Proc(IBindCtx, IMoniker, IMoniker, HRESULT)).call(pbc, pmktoleft, pmknewlyrunning)
  end
  def get_time_of_last_change(pbc : IBindCtx, pmktoleft : IMoniker, pfiletime : FILETIME*) : HRESULT
    @lpVtbl.value.get_time_of_last_change.unsafe_as(Proc(IBindCtx, IMoniker, FILETIME*, HRESULT)).call(pbc, pmktoleft, pfiletime)
  end
  def inverse(ppmk : IMoniker*) : HRESULT
    @lpVtbl.value.inverse.unsafe_as(Proc(IMoniker*, HRESULT)).call(ppmk)
  end
  def common_prefix_with(pmkother : IMoniker, ppmkprefix : IMoniker*) : HRESULT
    @lpVtbl.value.common_prefix_with.unsafe_as(Proc(IMoniker, IMoniker*, HRESULT)).call(pmkother, ppmkprefix)
  end
  def relative_path_to(pmkother : IMoniker, ppmkrelpath : IMoniker*) : HRESULT
    @lpVtbl.value.relative_path_to.unsafe_as(Proc(IMoniker, IMoniker*, HRESULT)).call(pmkother, ppmkrelpath)
  end
  def get_display_name(pbc : IBindCtx, pmktoleft : IMoniker, ppszdisplayname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(IBindCtx, IMoniker, LibC::LPWSTR*, HRESULT)).call(pbc, pmktoleft, ppszdisplayname)
  end
  def parse_display_name(pbc : IBindCtx, pmktoleft : IMoniker, pszdisplayname : LibC::LPWSTR, pcheaten : UInt32*, ppmkout : IMoniker*) : HRESULT
    @lpVtbl.value.parse_display_name.unsafe_as(Proc(IBindCtx, IMoniker, LibC::LPWSTR, UInt32*, IMoniker*, HRESULT)).call(pbc, pmktoleft, pszdisplayname, pcheaten, ppmkout)
  end
  def is_system_moniker(pdwmksys : UInt32*) : HRESULT
    @lpVtbl.value.is_system_moniker.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwmksys)
  end
end
struct LibWin32::IROTData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_comparison_data(pbdata : UInt8*, cbmax : UInt32, pcbdata : UInt32*) : HRESULT
    @lpVtbl.value.get_comparison_data.unsafe_as(Proc(UInt8*, UInt32, UInt32*, HRESULT)).call(pbdata, cbmax, pcbdata)
  end
end
struct LibWin32::IPersistFile
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_class_id(pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.unsafe_as(Proc(Guid*, HRESULT)).call(pclassid)
  end
  def is_dirty : HRESULT
    @lpVtbl.value.is_dirty.unsafe_as(Proc(HRESULT)).call
  end
  def load(pszfilename : LibC::LPWSTR, dwmode : UInt32) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszfilename, dwmode)
  end
  def save(pszfilename : LibC::LPWSTR, fremember : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pszfilename, fremember)
  end
  def save_completed(pszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_completed.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszfilename)
  end
  def get_cur_file(ppszfilename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_cur_file.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszfilename)
  end
end
struct LibWin32::IEnumFORMATETC
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : FORMATETC*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, FORMATETC*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumFORMATETC*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumFORMATETC*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumSTATDATA
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : STATDATA*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, STATDATA*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSTATDATA*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSTATDATA*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IAdviseSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_data_change(pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : Void
    @lpVtbl.value.on_data_change.unsafe_as(Proc(FORMATETC*, STGMEDIUM*, Void)).call(pformatetc, pstgmed)
  end
  def on_view_change(dwaspect : UInt32, lindex : Int32) : Void
    @lpVtbl.value.on_view_change.unsafe_as(Proc(UInt32, Int32, Void)).call(dwaspect, lindex)
  end
  def on_rename(pmk : IMoniker) : Void
    @lpVtbl.value.on_rename.unsafe_as(Proc(IMoniker, Void)).call(pmk)
  end
  def on_save : Void
    @lpVtbl.value.on_save.unsafe_as(Proc(Void)).call
  end
  def on_close : Void
    @lpVtbl.value.on_close.unsafe_as(Proc(Void)).call
  end
end
struct LibWin32::AsyncIAdviseSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_on_data_change(pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : Void
    @lpVtbl.value.begin_on_data_change.unsafe_as(Proc(FORMATETC*, STGMEDIUM*, Void)).call(pformatetc, pstgmed)
  end
  def finish_on_data_change : Void
    @lpVtbl.value.finish_on_data_change.unsafe_as(Proc(Void)).call
  end
  def begin_on_view_change(dwaspect : UInt32, lindex : Int32) : Void
    @lpVtbl.value.begin_on_view_change.unsafe_as(Proc(UInt32, Int32, Void)).call(dwaspect, lindex)
  end
  def finish_on_view_change : Void
    @lpVtbl.value.finish_on_view_change.unsafe_as(Proc(Void)).call
  end
  def begin_on_rename(pmk : IMoniker) : Void
    @lpVtbl.value.begin_on_rename.unsafe_as(Proc(IMoniker, Void)).call(pmk)
  end
  def finish_on_rename : Void
    @lpVtbl.value.finish_on_rename.unsafe_as(Proc(Void)).call
  end
  def begin_on_save : Void
    @lpVtbl.value.begin_on_save.unsafe_as(Proc(Void)).call
  end
  def finish_on_save : Void
    @lpVtbl.value.finish_on_save.unsafe_as(Proc(Void)).call
  end
  def begin_on_close : Void
    @lpVtbl.value.begin_on_close.unsafe_as(Proc(Void)).call
  end
  def finish_on_close : Void
    @lpVtbl.value.finish_on_close.unsafe_as(Proc(Void)).call
  end
end
struct LibWin32::IAdviseSink2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_data_change(pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : Void
    @lpVtbl.value.on_data_change.unsafe_as(Proc(FORMATETC*, STGMEDIUM*, Void)).call(pformatetc, pstgmed)
  end
  def on_view_change(dwaspect : UInt32, lindex : Int32) : Void
    @lpVtbl.value.on_view_change.unsafe_as(Proc(UInt32, Int32, Void)).call(dwaspect, lindex)
  end
  def on_rename(pmk : IMoniker) : Void
    @lpVtbl.value.on_rename.unsafe_as(Proc(IMoniker, Void)).call(pmk)
  end
  def on_save : Void
    @lpVtbl.value.on_save.unsafe_as(Proc(Void)).call
  end
  def on_close : Void
    @lpVtbl.value.on_close.unsafe_as(Proc(Void)).call
  end
  def on_link_src_change(pmk : IMoniker) : Void
    @lpVtbl.value.on_link_src_change.unsafe_as(Proc(IMoniker, Void)).call(pmk)
  end
end
struct LibWin32::AsyncIAdviseSink2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_on_data_change(pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : Void
    @lpVtbl.value.begin_on_data_change.unsafe_as(Proc(FORMATETC*, STGMEDIUM*, Void)).call(pformatetc, pstgmed)
  end
  def finish_on_data_change : Void
    @lpVtbl.value.finish_on_data_change.unsafe_as(Proc(Void)).call
  end
  def begin_on_view_change(dwaspect : UInt32, lindex : Int32) : Void
    @lpVtbl.value.begin_on_view_change.unsafe_as(Proc(UInt32, Int32, Void)).call(dwaspect, lindex)
  end
  def finish_on_view_change : Void
    @lpVtbl.value.finish_on_view_change.unsafe_as(Proc(Void)).call
  end
  def begin_on_rename(pmk : IMoniker) : Void
    @lpVtbl.value.begin_on_rename.unsafe_as(Proc(IMoniker, Void)).call(pmk)
  end
  def finish_on_rename : Void
    @lpVtbl.value.finish_on_rename.unsafe_as(Proc(Void)).call
  end
  def begin_on_save : Void
    @lpVtbl.value.begin_on_save.unsafe_as(Proc(Void)).call
  end
  def finish_on_save : Void
    @lpVtbl.value.finish_on_save.unsafe_as(Proc(Void)).call
  end
  def begin_on_close : Void
    @lpVtbl.value.begin_on_close.unsafe_as(Proc(Void)).call
  end
  def finish_on_close : Void
    @lpVtbl.value.finish_on_close.unsafe_as(Proc(Void)).call
  end
  def begin_on_link_src_change(pmk : IMoniker) : Void
    @lpVtbl.value.begin_on_link_src_change.unsafe_as(Proc(IMoniker, Void)).call(pmk)
  end
  def finish_on_link_src_change : Void
    @lpVtbl.value.finish_on_link_src_change.unsafe_as(Proc(Void)).call
  end
end
struct LibWin32::IDataObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_data(pformatetcin : FORMATETC*, pmedium : STGMEDIUM*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(FORMATETC*, STGMEDIUM*, HRESULT)).call(pformatetcin, pmedium)
  end
  def get_data_here(pformatetc : FORMATETC*, pmedium : STGMEDIUM*) : HRESULT
    @lpVtbl.value.get_data_here.unsafe_as(Proc(FORMATETC*, STGMEDIUM*, HRESULT)).call(pformatetc, pmedium)
  end
  def query_get_data(pformatetc : FORMATETC*) : HRESULT
    @lpVtbl.value.query_get_data.unsafe_as(Proc(FORMATETC*, HRESULT)).call(pformatetc)
  end
  def get_canonical_format_etc(pformatectin : FORMATETC*, pformatetcout : FORMATETC*) : HRESULT
    @lpVtbl.value.get_canonical_format_etc.unsafe_as(Proc(FORMATETC*, FORMATETC*, HRESULT)).call(pformatectin, pformatetcout)
  end
  def set_data(pformatetc : FORMATETC*, pmedium : STGMEDIUM*, frelease : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_data.unsafe_as(Proc(FORMATETC*, STGMEDIUM*, LibC::BOOL, HRESULT)).call(pformatetc, pmedium, frelease)
  end
  def enum_format_etc(dwdirection : UInt32, ppenumformatetc : IEnumFORMATETC*) : HRESULT
    @lpVtbl.value.enum_format_etc.unsafe_as(Proc(UInt32, IEnumFORMATETC*, HRESULT)).call(dwdirection, ppenumformatetc)
  end
  def d_advise(pformatetc : FORMATETC*, advf : UInt32, padvsink : IAdviseSink, pdwconnection : UInt32*) : HRESULT
    @lpVtbl.value.d_advise.unsafe_as(Proc(FORMATETC*, UInt32, IAdviseSink, UInt32*, HRESULT)).call(pformatetc, advf, padvsink, pdwconnection)
  end
  def d_unadvise(dwconnection : UInt32) : HRESULT
    @lpVtbl.value.d_unadvise.unsafe_as(Proc(UInt32, HRESULT)).call(dwconnection)
  end
  def enum_d_advise(ppenumadvise : IEnumSTATDATA*) : HRESULT
    @lpVtbl.value.enum_d_advise.unsafe_as(Proc(IEnumSTATDATA*, HRESULT)).call(ppenumadvise)
  end
end
struct LibWin32::IDataAdviseHolder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise(pdataobject : IDataObject, pfetc : FORMATETC*, advf : UInt32, padvise : IAdviseSink, pdwconnection : UInt32*) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(IDataObject, FORMATETC*, UInt32, IAdviseSink, UInt32*, HRESULT)).call(pdataobject, pfetc, advf, padvise, pdwconnection)
  end
  def unadvise(dwconnection : UInt32) : HRESULT
    @lpVtbl.value.unadvise.unsafe_as(Proc(UInt32, HRESULT)).call(dwconnection)
  end
  def enum_advise(ppenumadvise : IEnumSTATDATA*) : HRESULT
    @lpVtbl.value.enum_advise.unsafe_as(Proc(IEnumSTATDATA*, HRESULT)).call(ppenumadvise)
  end
  def send_on_data_change(pdataobject : IDataObject, dwreserved : UInt32, advf : UInt32) : HRESULT
    @lpVtbl.value.send_on_data_change.unsafe_as(Proc(IDataObject, UInt32, UInt32, HRESULT)).call(pdataobject, dwreserved, advf)
  end
end
struct LibWin32::IClassActivator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_class_object(rclsid : Guid*, dwclasscontext : UInt32, locale : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_class_object.unsafe_as(Proc(Guid*, UInt32, UInt32, Guid*, Void**, HRESULT)).call(rclsid, dwclasscontext, locale, riid, ppv)
  end
end
struct LibWin32::IProgressNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_progress(dwprogresscurrent : UInt32, dwprogressmaximum : UInt32, faccurate : LibC::BOOL, fowner : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_progress.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL, LibC::BOOL, HRESULT)).call(dwprogresscurrent, dwprogressmaximum, faccurate, fowner)
  end
end
struct LibWin32::IBlockingLock
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def lock(dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.lock.unsafe_as(Proc(UInt32, HRESULT)).call(dwtimeout)
  end
  def unlock : HRESULT
    @lpVtbl.value.unlock.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITimeAndNoticeControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def suppress_changes(res1 : UInt32, res2 : UInt32) : HRESULT
    @lpVtbl.value.suppress_changes.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(res1, res2)
  end
end
struct LibWin32::IOplockStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_storage_ex(pwcsname : LibC::LPWSTR, grfmode : UInt32, stgfmt : UInt32, grfattrs : UInt32, riid : Guid*, ppstgopen : Void**) : HRESULT
    @lpVtbl.value.create_storage_ex.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, UInt32, Guid*, Void**, HRESULT)).call(pwcsname, grfmode, stgfmt, grfattrs, riid, ppstgopen)
  end
  def open_storage_ex(pwcsname : LibC::LPWSTR, grfmode : UInt32, stgfmt : UInt32, grfattrs : UInt32, riid : Guid*, ppstgopen : Void**) : HRESULT
    @lpVtbl.value.open_storage_ex.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, UInt32, Guid*, Void**, HRESULT)).call(pwcsname, grfmode, stgfmt, grfattrs, riid, ppstgopen)
  end
end
struct LibWin32::IUrlMon
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def async_get_class_bits(rclsid : Guid*, psztype : LibC::LPWSTR, pszext : LibC::LPWSTR, dwfileversionms : UInt32, dwfileversionls : UInt32, pszcodebase : LibC::LPWSTR, pbc : IBindCtx, dwclasscontext : UInt32, riid : Guid*, flags : UInt32) : HRESULT
    @lpVtbl.value.async_get_class_bits.unsafe_as(Proc(Guid*, LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt32, LibC::LPWSTR, IBindCtx, UInt32, Guid*, UInt32, HRESULT)).call(rclsid, psztype, pszext, dwfileversionms, dwfileversionls, pszcodebase, pbc, dwclasscontext, riid, flags)
  end
end
struct LibWin32::IForegroundTransfer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def allow_foreground_transfer(lpvreserved : Void*) : HRESULT
    @lpVtbl.value.allow_foreground_transfer.unsafe_as(Proc(Void*, HRESULT)).call(lpvreserved)
  end
end
struct LibWin32::IProcessLock
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_ref_on_process : UInt32
    @lpVtbl.value.add_ref_on_process.unsafe_as(Proc(UInt32)).call
  end
  def release_ref_on_process : UInt32
    @lpVtbl.value.release_ref_on_process.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::ISurrogateService
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def init(rguidprocessid : Guid*, pprocesslock : IProcessLock, pfapplicationaware : LibC::BOOL*) : HRESULT
    @lpVtbl.value.init.unsafe_as(Proc(Guid*, IProcessLock, LibC::BOOL*, HRESULT)).call(rguidprocessid, pprocesslock, pfapplicationaware)
  end
  def application_launch(rguidapplid : Guid*, apptype : ApplicationType) : HRESULT
    @lpVtbl.value.application_launch.unsafe_as(Proc(Guid*, ApplicationType, HRESULT)).call(rguidapplid, apptype)
  end
  def application_free(rguidapplid : Guid*) : HRESULT
    @lpVtbl.value.application_free.unsafe_as(Proc(Guid*, HRESULT)).call(rguidapplid)
  end
  def catalog_refresh(ulreserved : UInt32) : HRESULT
    @lpVtbl.value.catalog_refresh.unsafe_as(Proc(UInt32, HRESULT)).call(ulreserved)
  end
  def process_shutdown(shutdowntype : ShutdownType) : HRESULT
    @lpVtbl.value.process_shutdown.unsafe_as(Proc(ShutdownType, HRESULT)).call(shutdowntype)
  end
end
struct LibWin32::IInitializeSpy
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def pre_initialize(dwcoinit : UInt32, dwcurthreadaptrefs : UInt32) : HRESULT
    @lpVtbl.value.pre_initialize.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwcoinit, dwcurthreadaptrefs)
  end
  def post_initialize(hrcoinit : HRESULT, dwcoinit : UInt32, dwnewthreadaptrefs : UInt32) : HRESULT
    @lpVtbl.value.post_initialize.unsafe_as(Proc(HRESULT, UInt32, UInt32, HRESULT)).call(hrcoinit, dwcoinit, dwnewthreadaptrefs)
  end
  def pre_uninitialize(dwcurthreadaptrefs : UInt32) : HRESULT
    @lpVtbl.value.pre_uninitialize.unsafe_as(Proc(UInt32, HRESULT)).call(dwcurthreadaptrefs)
  end
  def post_uninitialize(dwnewthreadaptrefs : UInt32) : HRESULT
    @lpVtbl.value.post_uninitialize.unsafe_as(Proc(UInt32, HRESULT)).call(dwnewthreadaptrefs)
  end
end
struct LibWin32::IServiceProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_service(guidservice : Guid*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_service.unsafe_as(Proc(Guid*, Guid*, Void**, HRESULT)).call(guidservice, riid, ppvobject)
  end
end
struct LibWin32::IEnumGUID
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : Guid*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, Guid*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumGUID*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumGUID*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumCATEGORYINFO
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : CATEGORYINFO*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, CATEGORYINFO*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumCATEGORYINFO*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumCATEGORYINFO*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ICatRegister
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_categories(ccategories : UInt32, rgcategoryinfo : CATEGORYINFO*) : HRESULT
    @lpVtbl.value.register_categories.unsafe_as(Proc(UInt32, CATEGORYINFO*, HRESULT)).call(ccategories, rgcategoryinfo)
  end
  def un_register_categories(ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.un_register_categories.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(ccategories, rgcatid)
  end
  def register_class_impl_categories(rclsid : Guid*, ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.register_class_impl_categories.unsafe_as(Proc(Guid*, UInt32, Guid*, HRESULT)).call(rclsid, ccategories, rgcatid)
  end
  def un_register_class_impl_categories(rclsid : Guid*, ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.un_register_class_impl_categories.unsafe_as(Proc(Guid*, UInt32, Guid*, HRESULT)).call(rclsid, ccategories, rgcatid)
  end
  def register_class_req_categories(rclsid : Guid*, ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.register_class_req_categories.unsafe_as(Proc(Guid*, UInt32, Guid*, HRESULT)).call(rclsid, ccategories, rgcatid)
  end
  def un_register_class_req_categories(rclsid : Guid*, ccategories : UInt32, rgcatid : Guid*) : HRESULT
    @lpVtbl.value.un_register_class_req_categories.unsafe_as(Proc(Guid*, UInt32, Guid*, HRESULT)).call(rclsid, ccategories, rgcatid)
  end
end
struct LibWin32::ICatInformation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enum_categories(lcid : UInt32, ppenumcategoryinfo : IEnumCATEGORYINFO*) : HRESULT
    @lpVtbl.value.enum_categories.unsafe_as(Proc(UInt32, IEnumCATEGORYINFO*, HRESULT)).call(lcid, ppenumcategoryinfo)
  end
  def get_category_desc(rcatid : Guid*, lcid : UInt32, pszdesc : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_category_desc.unsafe_as(Proc(Guid*, UInt32, LibC::LPWSTR*, HRESULT)).call(rcatid, lcid, pszdesc)
  end
  def enum_classes_of_categories(cimplemented : UInt32, rgcatidimpl : Guid*, crequired : UInt32, rgcatidreq : Guid*, ppenumclsid : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_classes_of_categories.unsafe_as(Proc(UInt32, Guid*, UInt32, Guid*, IEnumGUID*, HRESULT)).call(cimplemented, rgcatidimpl, crequired, rgcatidreq, ppenumclsid)
  end
  def is_class_of_categories(rclsid : Guid*, cimplemented : UInt32, rgcatidimpl : Guid*, crequired : UInt32, rgcatidreq : Guid*) : HRESULT
    @lpVtbl.value.is_class_of_categories.unsafe_as(Proc(Guid*, UInt32, Guid*, UInt32, Guid*, HRESULT)).call(rclsid, cimplemented, rgcatidimpl, crequired, rgcatidreq)
  end
  def enum_impl_categories_of_class(rclsid : Guid*, ppenumcatid : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_impl_categories_of_class.unsafe_as(Proc(Guid*, IEnumGUID*, HRESULT)).call(rclsid, ppenumcatid)
  end
  def enum_req_categories_of_class(rclsid : Guid*, ppenumcatid : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_req_categories_of_class.unsafe_as(Proc(Guid*, IEnumGUID*, HRESULT)).call(rclsid, ppenumcatid)
  end
end
struct LibWin32::IContextCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def context_callback(pfncallback : PFNCONTEXTCALL, pparam : ComCallData*, riid : Guid*, imethod : Int32, punk : IUnknown) : HRESULT
    @lpVtbl.value.context_callback.unsafe_as(Proc(PFNCONTEXTCALL, ComCallData*, Guid*, Int32, IUnknown, HRESULT)).call(pfncallback, pparam, riid, imethod, punk)
  end
end
struct LibWin32::IBinding
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def abort : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(HRESULT)).call
  end
  def suspend : HRESULT
    @lpVtbl.value.suspend.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def set_priority(npriority : Int32) : HRESULT
    @lpVtbl.value.set_priority.unsafe_as(Proc(Int32, HRESULT)).call(npriority)
  end
  def get_priority(pnpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(pnpriority)
  end
  def get_bind_result(pclsidprotocol : Guid*, pdwresult : UInt32*, pszresult : LibC::LPWSTR*, pdwreserved : UInt32*) : HRESULT
    @lpVtbl.value.get_bind_result.unsafe_as(Proc(Guid*, UInt32*, LibC::LPWSTR*, UInt32*, HRESULT)).call(pclsidprotocol, pdwresult, pszresult, pdwreserved)
  end
end
struct LibWin32::IBindStatusCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_start_binding(dwreserved : UInt32, pib : IBinding) : HRESULT
    @lpVtbl.value.on_start_binding.unsafe_as(Proc(UInt32, IBinding, HRESULT)).call(dwreserved, pib)
  end
  def get_priority(pnpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(pnpriority)
  end
  def on_low_resource(reserved : UInt32) : HRESULT
    @lpVtbl.value.on_low_resource.unsafe_as(Proc(UInt32, HRESULT)).call(reserved)
  end
  def on_progress(ulprogress : UInt32, ulprogressmax : UInt32, ulstatuscode : UInt32, szstatustext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_progress.unsafe_as(Proc(UInt32, UInt32, UInt32, LibC::LPWSTR, HRESULT)).call(ulprogress, ulprogressmax, ulstatuscode, szstatustext)
  end
  def on_stop_binding(hresult : HRESULT, szerror : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_stop_binding.unsafe_as(Proc(HRESULT, LibC::LPWSTR, HRESULT)).call(hresult, szerror)
  end
  def get_bind_info(grfbindf : UInt32*, pbindinfo : BINDINFO*) : HRESULT
    @lpVtbl.value.get_bind_info.unsafe_as(Proc(UInt32*, BINDINFO*, HRESULT)).call(grfbindf, pbindinfo)
  end
  def on_data_available(grfbscf : UInt32, dwsize : UInt32, pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : HRESULT
    @lpVtbl.value.on_data_available.unsafe_as(Proc(UInt32, UInt32, FORMATETC*, STGMEDIUM*, HRESULT)).call(grfbscf, dwsize, pformatetc, pstgmed)
  end
  def on_object_available(riid : Guid*, punk : IUnknown) : HRESULT
    @lpVtbl.value.on_object_available.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(riid, punk)
  end
end
struct LibWin32::IBindStatusCallbackEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_start_binding(dwreserved : UInt32, pib : IBinding) : HRESULT
    @lpVtbl.value.on_start_binding.unsafe_as(Proc(UInt32, IBinding, HRESULT)).call(dwreserved, pib)
  end
  def get_priority(pnpriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(pnpriority)
  end
  def on_low_resource(reserved : UInt32) : HRESULT
    @lpVtbl.value.on_low_resource.unsafe_as(Proc(UInt32, HRESULT)).call(reserved)
  end
  def on_progress(ulprogress : UInt32, ulprogressmax : UInt32, ulstatuscode : UInt32, szstatustext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_progress.unsafe_as(Proc(UInt32, UInt32, UInt32, LibC::LPWSTR, HRESULT)).call(ulprogress, ulprogressmax, ulstatuscode, szstatustext)
  end
  def on_stop_binding(hresult : HRESULT, szerror : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_stop_binding.unsafe_as(Proc(HRESULT, LibC::LPWSTR, HRESULT)).call(hresult, szerror)
  end
  def get_bind_info(grfbindf : UInt32*, pbindinfo : BINDINFO*) : HRESULT
    @lpVtbl.value.get_bind_info.unsafe_as(Proc(UInt32*, BINDINFO*, HRESULT)).call(grfbindf, pbindinfo)
  end
  def on_data_available(grfbscf : UInt32, dwsize : UInt32, pformatetc : FORMATETC*, pstgmed : STGMEDIUM*) : HRESULT
    @lpVtbl.value.on_data_available.unsafe_as(Proc(UInt32, UInt32, FORMATETC*, STGMEDIUM*, HRESULT)).call(grfbscf, dwsize, pformatetc, pstgmed)
  end
  def on_object_available(riid : Guid*, punk : IUnknown) : HRESULT
    @lpVtbl.value.on_object_available.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(riid, punk)
  end
  def get_bind_info_ex(grfbindf : UInt32*, pbindinfo : BINDINFO*, grfbindf2 : UInt32*, pdwreserved : UInt32*) : HRESULT
    @lpVtbl.value.get_bind_info_ex.unsafe_as(Proc(UInt32*, BINDINFO*, UInt32*, UInt32*, HRESULT)).call(grfbindf, pbindinfo, grfbindf2, pdwreserved)
  end
end
struct LibWin32::IAuthenticate
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def authenticate(phwnd : HANDLE*, pszusername : LibC::LPWSTR*, pszpassword : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.authenticate.unsafe_as(Proc(HANDLE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(phwnd, pszusername, pszpassword)
  end
end
struct LibWin32::IAuthenticateEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def authenticate(phwnd : HANDLE*, pszusername : LibC::LPWSTR*, pszpassword : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.authenticate.unsafe_as(Proc(HANDLE*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(phwnd, pszusername, pszpassword)
  end
  def authenticate_ex(phwnd : HANDLE*, pszusername : LibC::LPWSTR*, pszpassword : LibC::LPWSTR*, pauthinfo : AUTHENTICATEINFO*) : HRESULT
    @lpVtbl.value.authenticate_ex.unsafe_as(Proc(HANDLE*, LibC::LPWSTR*, LibC::LPWSTR*, AUTHENTICATEINFO*, HRESULT)).call(phwnd, pszusername, pszpassword, pauthinfo)
  end
end
struct LibWin32::IUri
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_bstr(uriprop : Uri_PROPERTY, pbstrproperty : UInt8**, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_bstr.unsafe_as(Proc(Uri_PROPERTY, UInt8**, UInt32, HRESULT)).call(uriprop, pbstrproperty, dwflags)
  end
  def get_property_length(uriprop : Uri_PROPERTY, pcchproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_length.unsafe_as(Proc(Uri_PROPERTY, UInt32*, UInt32, HRESULT)).call(uriprop, pcchproperty, dwflags)
  end
  def get_property_dword(uriprop : Uri_PROPERTY, pdwproperty : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_property_dword.unsafe_as(Proc(Uri_PROPERTY, UInt32*, UInt32, HRESULT)).call(uriprop, pdwproperty, dwflags)
  end
  def has_property(uriprop : Uri_PROPERTY, pfhasproperty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_property.unsafe_as(Proc(Uri_PROPERTY, LibC::BOOL*, HRESULT)).call(uriprop, pfhasproperty)
  end
  def get_absolute_uri(pbstrabsoluteuri : UInt8**) : HRESULT
    @lpVtbl.value.get_absolute_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrabsoluteuri)
  end
  def get_authority(pbstrauthority : UInt8**) : HRESULT
    @lpVtbl.value.get_authority.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrauthority)
  end
  def get_display_uri(pbstrdisplaystring : UInt8**) : HRESULT
    @lpVtbl.value.get_display_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdisplaystring)
  end
  def get_domain(pbstrdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdomain)
  end
  def get_extension(pbstrextension : UInt8**) : HRESULT
    @lpVtbl.value.get_extension.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrextension)
  end
  def get_fragment(pbstrfragment : UInt8**) : HRESULT
    @lpVtbl.value.get_fragment.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfragment)
  end
  def get_host(pbstrhost : UInt8**) : HRESULT
    @lpVtbl.value.get_host.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrhost)
  end
  def get_password(pbstrpassword : UInt8**) : HRESULT
    @lpVtbl.value.get_password.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpassword)
  end
  def get_path(pbstrpath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpath)
  end
  def get_path_and_query(pbstrpathandquery : UInt8**) : HRESULT
    @lpVtbl.value.get_path_and_query.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpathandquery)
  end
  def get_query(pbstrquery : UInt8**) : HRESULT
    @lpVtbl.value.get_query.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrquery)
  end
  def get_raw_uri(pbstrrawuri : UInt8**) : HRESULT
    @lpVtbl.value.get_raw_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrrawuri)
  end
  def get_scheme_name(pbstrschemename : UInt8**) : HRESULT
    @lpVtbl.value.get_scheme_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrschemename)
  end
  def get_user_info(pbstruserinfo : UInt8**) : HRESULT
    @lpVtbl.value.get_user_info.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstruserinfo)
  end
  def get_user_name(pbstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrusername)
  end
  def get_host_type(pdwhosttype : UInt32*) : HRESULT
    @lpVtbl.value.get_host_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwhosttype)
  end
  def get_port(pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_port.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwport)
  end
  def get_scheme(pdwscheme : UInt32*) : HRESULT
    @lpVtbl.value.get_scheme.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwscheme)
  end
  def get_zone(pdwzone : UInt32*) : HRESULT
    @lpVtbl.value.get_zone.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwzone)
  end
  def get_properties(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def is_equal(puri : IUri, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(IUri, LibC::BOOL*, HRESULT)).call(puri, pfequal)
  end
end
struct LibWin32::IUriBuilder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_uri_simple(dwallowencodingpropertymask : UInt32, dwreserved : LibC::UINT_PTR, ppiuri : IUri*) : HRESULT
    @lpVtbl.value.create_uri_simple.unsafe_as(Proc(UInt32, LibC::UINT_PTR, IUri*, HRESULT)).call(dwallowencodingpropertymask, dwreserved, ppiuri)
  end
  def create_uri(dwcreateflags : UInt32, dwallowencodingpropertymask : UInt32, dwreserved : LibC::UINT_PTR, ppiuri : IUri*) : HRESULT
    @lpVtbl.value.create_uri.unsafe_as(Proc(UInt32, UInt32, LibC::UINT_PTR, IUri*, HRESULT)).call(dwcreateflags, dwallowencodingpropertymask, dwreserved, ppiuri)
  end
  def create_uri_with_flags(dwcreateflags : UInt32, dwuribuilderflags : UInt32, dwallowencodingpropertymask : UInt32, dwreserved : LibC::UINT_PTR, ppiuri : IUri*) : HRESULT
    @lpVtbl.value.create_uri_with_flags.unsafe_as(Proc(UInt32, UInt32, UInt32, LibC::UINT_PTR, IUri*, HRESULT)).call(dwcreateflags, dwuribuilderflags, dwallowencodingpropertymask, dwreserved, ppiuri)
  end
  def get_i_uri(ppiuri : IUri*) : HRESULT
    @lpVtbl.value.get_i_uri.unsafe_as(Proc(IUri*, HRESULT)).call(ppiuri)
  end
  def set_i_uri(piuri : IUri) : HRESULT
    @lpVtbl.value.set_i_uri.unsafe_as(Proc(IUri, HRESULT)).call(piuri)
  end
  def get_fragment(pcchfragment : UInt32*, ppwzfragment : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_fragment.unsafe_as(Proc(UInt32*, LibC::LPWSTR*, HRESULT)).call(pcchfragment, ppwzfragment)
  end
  def get_host(pcchhost : UInt32*, ppwzhost : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_host.unsafe_as(Proc(UInt32*, LibC::LPWSTR*, HRESULT)).call(pcchhost, ppwzhost)
  end
  def get_password(pcchpassword : UInt32*, ppwzpassword : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_password.unsafe_as(Proc(UInt32*, LibC::LPWSTR*, HRESULT)).call(pcchpassword, ppwzpassword)
  end
  def get_path(pcchpath : UInt32*, ppwzpath : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt32*, LibC::LPWSTR*, HRESULT)).call(pcchpath, ppwzpath)
  end
  def get_port(pfhasport : LibC::BOOL*, pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_port.unsafe_as(Proc(LibC::BOOL*, UInt32*, HRESULT)).call(pfhasport, pdwport)
  end
  def get_query(pcchquery : UInt32*, ppwzquery : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_query.unsafe_as(Proc(UInt32*, LibC::LPWSTR*, HRESULT)).call(pcchquery, ppwzquery)
  end
  def get_scheme_name(pcchschemename : UInt32*, ppwzschemename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_scheme_name.unsafe_as(Proc(UInt32*, LibC::LPWSTR*, HRESULT)).call(pcchschemename, ppwzschemename)
  end
  def get_user_name(pcchusername : UInt32*, ppwzusername : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_user_name.unsafe_as(Proc(UInt32*, LibC::LPWSTR*, HRESULT)).call(pcchusername, ppwzusername)
  end
  def set_fragment(pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_fragment.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwznewvalue)
  end
  def set_host(pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_host.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwznewvalue)
  end
  def set_password(pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_password.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwznewvalue)
  end
  def set_path(pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_path.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwznewvalue)
  end
  def set_port(fhasport : LibC::BOOL, dwnewvalue : UInt32) : HRESULT
    @lpVtbl.value.set_port.unsafe_as(Proc(LibC::BOOL, UInt32, HRESULT)).call(fhasport, dwnewvalue)
  end
  def set_query(pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_query.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwznewvalue)
  end
  def set_scheme_name(pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_scheme_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwznewvalue)
  end
  def set_user_name(pwznewvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_user_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwznewvalue)
  end
  def remove_properties(dwpropertymask : UInt32) : HRESULT
    @lpVtbl.value.remove_properties.unsafe_as(Proc(UInt32, HRESULT)).call(dwpropertymask)
  end
  def has_been_modified(pfmodified : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_been_modified.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfmodified)
  end
end
struct LibWin32::IBindHost
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_moniker(szname : LibC::LPWSTR, pbc : IBindCtx, ppmk : IMoniker*, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.create_moniker.unsafe_as(Proc(LibC::LPWSTR, IBindCtx, IMoniker*, UInt32, HRESULT)).call(szname, pbc, ppmk, dwreserved)
  end
  def moniker_bind_to_storage(pmk : IMoniker, pbc : IBindCtx, pbsc : IBindStatusCallback, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.moniker_bind_to_storage.unsafe_as(Proc(IMoniker, IBindCtx, IBindStatusCallback, Guid*, Void**, HRESULT)).call(pmk, pbc, pbsc, riid, ppvobj)
  end
  def moniker_bind_to_object(pmk : IMoniker, pbc : IBindCtx, pbsc : IBindStatusCallback, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.moniker_bind_to_object.unsafe_as(Proc(IMoniker, IBindCtx, IBindStatusCallback, Guid*, Void**, HRESULT)).call(pmk, pbc, pbsc, riid, ppvobj)
  end
end
struct LibWin32::IDispatch
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
struct LibWin32::ITypeComp
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def bind(szname : LibC::LPWSTR, lhashval : UInt32, wflags : UInt16, pptinfo : ITypeInfo*, pdesckind : DESCKIND*, pbindptr : BINDPTR*) : HRESULT
    @lpVtbl.value.bind.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt16, ITypeInfo*, DESCKIND*, BINDPTR*, HRESULT)).call(szname, lhashval, wflags, pptinfo, pdesckind, pbindptr)
  end
  def bind_type(szname : LibC::LPWSTR, lhashval : UInt32, pptinfo : ITypeInfo*, pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.bind_type.unsafe_as(Proc(LibC::LPWSTR, UInt32, ITypeInfo*, ITypeComp*, HRESULT)).call(szname, lhashval, pptinfo, pptcomp)
  end
end
struct LibWin32::ITypeInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_attr(pptypeattr : TYPEATTR**) : HRESULT
    @lpVtbl.value.get_type_attr.unsafe_as(Proc(TYPEATTR**, HRESULT)).call(pptypeattr)
  end
  def get_type_comp(pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.get_type_comp.unsafe_as(Proc(ITypeComp*, HRESULT)).call(pptcomp)
  end
  def get_func_desc(index : UInt32, ppfuncdesc : FUNCDESC**) : HRESULT
    @lpVtbl.value.get_func_desc.unsafe_as(Proc(UInt32, FUNCDESC**, HRESULT)).call(index, ppfuncdesc)
  end
  def get_var_desc(index : UInt32, ppvardesc : VARDESC**) : HRESULT
    @lpVtbl.value.get_var_desc.unsafe_as(Proc(UInt32, VARDESC**, HRESULT)).call(index, ppvardesc)
  end
  def get_names(memid : Int32, rgbstrnames : UInt8**, cmaxnames : UInt32, pcnames : UInt32*) : HRESULT
    @lpVtbl.value.get_names.unsafe_as(Proc(Int32, UInt8**, UInt32, UInt32*, HRESULT)).call(memid, rgbstrnames, cmaxnames, pcnames)
  end
  def get_ref_type_of_impl_type(index : UInt32, preftype : UInt32*) : HRESULT
    @lpVtbl.value.get_ref_type_of_impl_type.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(index, preftype)
  end
  def get_impl_type_flags(index : UInt32, pimpltypeflags : Int32*) : HRESULT
    @lpVtbl.value.get_impl_type_flags.unsafe_as(Proc(UInt32, Int32*, HRESULT)).call(index, pimpltypeflags)
  end
  def get_i_ds_of_names(rgsznames : LibC::LPWSTR*, cnames : UInt32, pmemid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(LibC::LPWSTR*, UInt32, Int32*, HRESULT)).call(rgsznames, cnames, pmemid)
  end
  def invoke(pvinstance : Void*, memid : Int32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Void*, Int32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(pvinstance, memid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_documentation(memid : Int32, pbstrname : UInt8**, pbstrdocstring : UInt8**, pdwhelpcontext : UInt32*, pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.unsafe_as(Proc(Int32, UInt8**, UInt8**, UInt32*, UInt8**, HRESULT)).call(memid, pbstrname, pbstrdocstring, pdwhelpcontext, pbstrhelpfile)
  end
  def get_dll_entry(memid : Int32, invkind : INVOKEKIND, pbstrdllname : UInt8**, pbstrname : UInt8**, pwordinal : UInt16*) : HRESULT
    @lpVtbl.value.get_dll_entry.unsafe_as(Proc(Int32, INVOKEKIND, UInt8**, UInt8**, UInt16*, HRESULT)).call(memid, invkind, pbstrdllname, pbstrname, pwordinal)
  end
  def get_ref_type_info(hreftype : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_ref_type_info.unsafe_as(Proc(UInt32, ITypeInfo*, HRESULT)).call(hreftype, pptinfo)
  end
  def address_of_member(memid : Int32, invkind : INVOKEKIND, ppv : Void**) : HRESULT
    @lpVtbl.value.address_of_member.unsafe_as(Proc(Int32, INVOKEKIND, Void**, HRESULT)).call(memid, invkind, ppv)
  end
  def create_instance(punkouter : IUnknown, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(IUnknown, Guid*, Void**, HRESULT)).call(punkouter, riid, ppvobj)
  end
  def get_mops(memid : Int32, pbstrmops : UInt8**) : HRESULT
    @lpVtbl.value.get_mops.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(memid, pbstrmops)
  end
  def get_containing_type_lib(pptlib : ITypeLib*, pindex : UInt32*) : HRESULT
    @lpVtbl.value.get_containing_type_lib.unsafe_as(Proc(ITypeLib*, UInt32*, HRESULT)).call(pptlib, pindex)
  end
  def release_type_attr(ptypeattr : TYPEATTR*) : Void
    @lpVtbl.value.release_type_attr.unsafe_as(Proc(TYPEATTR*, Void)).call(ptypeattr)
  end
  def release_func_desc(pfuncdesc : FUNCDESC*) : Void
    @lpVtbl.value.release_func_desc.unsafe_as(Proc(FUNCDESC*, Void)).call(pfuncdesc)
  end
  def release_var_desc(pvardesc : VARDESC*) : Void
    @lpVtbl.value.release_var_desc.unsafe_as(Proc(VARDESC*, Void)).call(pvardesc)
  end
end
struct LibWin32::ITypeInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_attr(pptypeattr : TYPEATTR**) : HRESULT
    @lpVtbl.value.get_type_attr.unsafe_as(Proc(TYPEATTR**, HRESULT)).call(pptypeattr)
  end
  def get_type_comp(pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.get_type_comp.unsafe_as(Proc(ITypeComp*, HRESULT)).call(pptcomp)
  end
  def get_func_desc(index : UInt32, ppfuncdesc : FUNCDESC**) : HRESULT
    @lpVtbl.value.get_func_desc.unsafe_as(Proc(UInt32, FUNCDESC**, HRESULT)).call(index, ppfuncdesc)
  end
  def get_var_desc(index : UInt32, ppvardesc : VARDESC**) : HRESULT
    @lpVtbl.value.get_var_desc.unsafe_as(Proc(UInt32, VARDESC**, HRESULT)).call(index, ppvardesc)
  end
  def get_names(memid : Int32, rgbstrnames : UInt8**, cmaxnames : UInt32, pcnames : UInt32*) : HRESULT
    @lpVtbl.value.get_names.unsafe_as(Proc(Int32, UInt8**, UInt32, UInt32*, HRESULT)).call(memid, rgbstrnames, cmaxnames, pcnames)
  end
  def get_ref_type_of_impl_type(index : UInt32, preftype : UInt32*) : HRESULT
    @lpVtbl.value.get_ref_type_of_impl_type.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(index, preftype)
  end
  def get_impl_type_flags(index : UInt32, pimpltypeflags : Int32*) : HRESULT
    @lpVtbl.value.get_impl_type_flags.unsafe_as(Proc(UInt32, Int32*, HRESULT)).call(index, pimpltypeflags)
  end
  def get_i_ds_of_names(rgsznames : LibC::LPWSTR*, cnames : UInt32, pmemid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(LibC::LPWSTR*, UInt32, Int32*, HRESULT)).call(rgsznames, cnames, pmemid)
  end
  def invoke(pvinstance : Void*, memid : Int32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Void*, Int32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(pvinstance, memid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_documentation(memid : Int32, pbstrname : UInt8**, pbstrdocstring : UInt8**, pdwhelpcontext : UInt32*, pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.unsafe_as(Proc(Int32, UInt8**, UInt8**, UInt32*, UInt8**, HRESULT)).call(memid, pbstrname, pbstrdocstring, pdwhelpcontext, pbstrhelpfile)
  end
  def get_dll_entry(memid : Int32, invkind : INVOKEKIND, pbstrdllname : UInt8**, pbstrname : UInt8**, pwordinal : UInt16*) : HRESULT
    @lpVtbl.value.get_dll_entry.unsafe_as(Proc(Int32, INVOKEKIND, UInt8**, UInt8**, UInt16*, HRESULT)).call(memid, invkind, pbstrdllname, pbstrname, pwordinal)
  end
  def get_ref_type_info(hreftype : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_ref_type_info.unsafe_as(Proc(UInt32, ITypeInfo*, HRESULT)).call(hreftype, pptinfo)
  end
  def address_of_member(memid : Int32, invkind : INVOKEKIND, ppv : Void**) : HRESULT
    @lpVtbl.value.address_of_member.unsafe_as(Proc(Int32, INVOKEKIND, Void**, HRESULT)).call(memid, invkind, ppv)
  end
  def create_instance(punkouter : IUnknown, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(IUnknown, Guid*, Void**, HRESULT)).call(punkouter, riid, ppvobj)
  end
  def get_mops(memid : Int32, pbstrmops : UInt8**) : HRESULT
    @lpVtbl.value.get_mops.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(memid, pbstrmops)
  end
  def get_containing_type_lib(pptlib : ITypeLib*, pindex : UInt32*) : HRESULT
    @lpVtbl.value.get_containing_type_lib.unsafe_as(Proc(ITypeLib*, UInt32*, HRESULT)).call(pptlib, pindex)
  end
  def release_type_attr(ptypeattr : TYPEATTR*) : Void
    @lpVtbl.value.release_type_attr.unsafe_as(Proc(TYPEATTR*, Void)).call(ptypeattr)
  end
  def release_func_desc(pfuncdesc : FUNCDESC*) : Void
    @lpVtbl.value.release_func_desc.unsafe_as(Proc(FUNCDESC*, Void)).call(pfuncdesc)
  end
  def release_var_desc(pvardesc : VARDESC*) : Void
    @lpVtbl.value.release_var_desc.unsafe_as(Proc(VARDESC*, Void)).call(pvardesc)
  end
  def get_type_kind(ptypekind : TYPEKIND*) : HRESULT
    @lpVtbl.value.get_type_kind.unsafe_as(Proc(TYPEKIND*, HRESULT)).call(ptypekind)
  end
  def get_type_flags(ptypeflags : UInt32*) : HRESULT
    @lpVtbl.value.get_type_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(ptypeflags)
  end
  def get_func_index_of_mem_id(memid : Int32, invkind : INVOKEKIND, pfuncindex : UInt32*) : HRESULT
    @lpVtbl.value.get_func_index_of_mem_id.unsafe_as(Proc(Int32, INVOKEKIND, UInt32*, HRESULT)).call(memid, invkind, pfuncindex)
  end
  def get_var_index_of_mem_id(memid : Int32, pvarindex : UInt32*) : HRESULT
    @lpVtbl.value.get_var_index_of_mem_id.unsafe_as(Proc(Int32, UInt32*, HRESULT)).call(memid, pvarindex)
  end
  def get_cust_data(guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cust_data.unsafe_as(Proc(Guid*, VARIANT*, HRESULT)).call(guid, pvarval)
  end
  def get_func_cust_data(index : UInt32, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_func_cust_data.unsafe_as(Proc(UInt32, Guid*, VARIANT*, HRESULT)).call(index, guid, pvarval)
  end
  def get_param_cust_data(indexfunc : UInt32, indexparam : UInt32, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_param_cust_data.unsafe_as(Proc(UInt32, UInt32, Guid*, VARIANT*, HRESULT)).call(indexfunc, indexparam, guid, pvarval)
  end
  def get_var_cust_data(index : UInt32, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_var_cust_data.unsafe_as(Proc(UInt32, Guid*, VARIANT*, HRESULT)).call(index, guid, pvarval)
  end
  def get_impl_type_cust_data(index : UInt32, guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_impl_type_cust_data.unsafe_as(Proc(UInt32, Guid*, VARIANT*, HRESULT)).call(index, guid, pvarval)
  end
  def get_documentation2(memid : Int32, lcid : UInt32, pbstrhelpstring : UInt8**, pdwhelpstringcontext : UInt32*, pbstrhelpstringdll : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation2.unsafe_as(Proc(Int32, UInt32, UInt8**, UInt32*, UInt8**, HRESULT)).call(memid, lcid, pbstrhelpstring, pdwhelpstringcontext, pbstrhelpstringdll)
  end
  def get_all_cust_data(pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_cust_data.unsafe_as(Proc(CUSTDATA*, HRESULT)).call(pcustdata)
  end
  def get_all_func_cust_data(index : UInt32, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_func_cust_data.unsafe_as(Proc(UInt32, CUSTDATA*, HRESULT)).call(index, pcustdata)
  end
  def get_all_param_cust_data(indexfunc : UInt32, indexparam : UInt32, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_param_cust_data.unsafe_as(Proc(UInt32, UInt32, CUSTDATA*, HRESULT)).call(indexfunc, indexparam, pcustdata)
  end
  def get_all_var_cust_data(index : UInt32, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_var_cust_data.unsafe_as(Proc(UInt32, CUSTDATA*, HRESULT)).call(index, pcustdata)
  end
  def get_all_impl_type_cust_data(index : UInt32, pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_impl_type_cust_data.unsafe_as(Proc(UInt32, CUSTDATA*, HRESULT)).call(index, pcustdata)
  end
end
struct LibWin32::ITypeLib
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count : UInt32
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info(index : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, ITypeInfo*, HRESULT)).call(index, pptinfo)
  end
  def get_type_info_type(index : UInt32, ptkind : TYPEKIND*) : HRESULT
    @lpVtbl.value.get_type_info_type.unsafe_as(Proc(UInt32, TYPEKIND*, HRESULT)).call(index, ptkind)
  end
  def get_type_info_of_guid(guid : Guid*, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info_of_guid.unsafe_as(Proc(Guid*, ITypeInfo*, HRESULT)).call(guid, pptinfo)
  end
  def get_lib_attr(pptlibattr : TLIBATTR**) : HRESULT
    @lpVtbl.value.get_lib_attr.unsafe_as(Proc(TLIBATTR**, HRESULT)).call(pptlibattr)
  end
  def get_type_comp(pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.get_type_comp.unsafe_as(Proc(ITypeComp*, HRESULT)).call(pptcomp)
  end
  def get_documentation(index : Int32, pbstrname : UInt8**, pbstrdocstring : UInt8**, pdwhelpcontext : UInt32*, pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.unsafe_as(Proc(Int32, UInt8**, UInt8**, UInt32*, UInt8**, HRESULT)).call(index, pbstrname, pbstrdocstring, pdwhelpcontext, pbstrhelpfile)
  end
  def is_name(sznamebuf : LibC::LPWSTR, lhashval : UInt32, pfname : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_name.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::BOOL*, HRESULT)).call(sznamebuf, lhashval, pfname)
  end
  def find_name(sznamebuf : LibC::LPWSTR, lhashval : UInt32, pptinfo : ITypeInfo*, rgmemid : Int32*, pcfound : UInt16*) : HRESULT
    @lpVtbl.value.find_name.unsafe_as(Proc(LibC::LPWSTR, UInt32, ITypeInfo*, Int32*, UInt16*, HRESULT)).call(sznamebuf, lhashval, pptinfo, rgmemid, pcfound)
  end
  def release_t_lib_attr(ptlibattr : TLIBATTR*) : Void
    @lpVtbl.value.release_t_lib_attr.unsafe_as(Proc(TLIBATTR*, Void)).call(ptlibattr)
  end
end
struct LibWin32::ITypeLib2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count : UInt32
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info(index : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, ITypeInfo*, HRESULT)).call(index, pptinfo)
  end
  def get_type_info_type(index : UInt32, ptkind : TYPEKIND*) : HRESULT
    @lpVtbl.value.get_type_info_type.unsafe_as(Proc(UInt32, TYPEKIND*, HRESULT)).call(index, ptkind)
  end
  def get_type_info_of_guid(guid : Guid*, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info_of_guid.unsafe_as(Proc(Guid*, ITypeInfo*, HRESULT)).call(guid, pptinfo)
  end
  def get_lib_attr(pptlibattr : TLIBATTR**) : HRESULT
    @lpVtbl.value.get_lib_attr.unsafe_as(Proc(TLIBATTR**, HRESULT)).call(pptlibattr)
  end
  def get_type_comp(pptcomp : ITypeComp*) : HRESULT
    @lpVtbl.value.get_type_comp.unsafe_as(Proc(ITypeComp*, HRESULT)).call(pptcomp)
  end
  def get_documentation(index : Int32, pbstrname : UInt8**, pbstrdocstring : UInt8**, pdwhelpcontext : UInt32*, pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.unsafe_as(Proc(Int32, UInt8**, UInt8**, UInt32*, UInt8**, HRESULT)).call(index, pbstrname, pbstrdocstring, pdwhelpcontext, pbstrhelpfile)
  end
  def is_name(sznamebuf : LibC::LPWSTR, lhashval : UInt32, pfname : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_name.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::BOOL*, HRESULT)).call(sznamebuf, lhashval, pfname)
  end
  def find_name(sznamebuf : LibC::LPWSTR, lhashval : UInt32, pptinfo : ITypeInfo*, rgmemid : Int32*, pcfound : UInt16*) : HRESULT
    @lpVtbl.value.find_name.unsafe_as(Proc(LibC::LPWSTR, UInt32, ITypeInfo*, Int32*, UInt16*, HRESULT)).call(sznamebuf, lhashval, pptinfo, rgmemid, pcfound)
  end
  def release_t_lib_attr(ptlibattr : TLIBATTR*) : Void
    @lpVtbl.value.release_t_lib_attr.unsafe_as(Proc(TLIBATTR*, Void)).call(ptlibattr)
  end
  def get_cust_data(guid : Guid*, pvarval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cust_data.unsafe_as(Proc(Guid*, VARIANT*, HRESULT)).call(guid, pvarval)
  end
  def get_lib_statistics(pcuniquenames : UInt32*, pcchuniquenames : UInt32*) : HRESULT
    @lpVtbl.value.get_lib_statistics.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pcuniquenames, pcchuniquenames)
  end
  def get_documentation2(index : Int32, lcid : UInt32, pbstrhelpstring : UInt8**, pdwhelpstringcontext : UInt32*, pbstrhelpstringdll : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation2.unsafe_as(Proc(Int32, UInt32, UInt8**, UInt32*, UInt8**, HRESULT)).call(index, lcid, pbstrhelpstring, pdwhelpstringcontext, pbstrhelpstringdll)
  end
  def get_all_cust_data(pcustdata : CUSTDATA*) : HRESULT
    @lpVtbl.value.get_all_cust_data.unsafe_as(Proc(CUSTDATA*, HRESULT)).call(pcustdata)
  end
end
struct LibWin32::IErrorInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_source(pbstrsource : UInt8**) : HRESULT
    @lpVtbl.value.get_source.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsource)
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def get_help_file(pbstrhelpfile : UInt8**) : HRESULT
    @lpVtbl.value.get_help_file.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrhelpfile)
  end
  def get_help_context(pdwhelpcontext : UInt32*) : HRESULT
    @lpVtbl.value.get_help_context.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwhelpcontext)
  end
end
struct LibWin32::ISupportErrorInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def interface_supports_error_info(riid : Guid*) : HRESULT
    @lpVtbl.value.interface_supports_error_info.unsafe_as(Proc(Guid*, HRESULT)).call(riid)
  end
end
struct LibWin32::IErrorLog
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_error(pszpropname : LibC::LPWSTR, pexcepinfo : EXCEPINFO*) : HRESULT
    @lpVtbl.value.add_error.unsafe_as(Proc(LibC::LPWSTR, EXCEPINFO*, HRESULT)).call(pszpropname, pexcepinfo)
  end
end
struct LibWin32::ITypeLibRegistrationReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enum_type_lib_registrations(ppenumunknown : IEnumUnknown*) : HRESULT
    @lpVtbl.value.enum_type_lib_registrations.unsafe_as(Proc(IEnumUnknown*, HRESULT)).call(ppenumunknown)
  end
end
struct LibWin32::ITypeLibRegistration
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_version(pversion : UInt8**) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt8**, HRESULT)).call(pversion)
  end
  def get_lcid(plcid : UInt32*) : HRESULT
    @lpVtbl.value.get_lcid.unsafe_as(Proc(UInt32*, HRESULT)).call(plcid)
  end
  def get_win32_path(pwin32path : UInt8**) : HRESULT
    @lpVtbl.value.get_win32_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pwin32path)
  end
  def get_win64_path(pwin64path : UInt8**) : HRESULT
    @lpVtbl.value.get_win64_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pwin64path)
  end
  def get_display_name(pdisplayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pdisplayname)
  end
  def get_flags(pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pflags)
  end
  def get_help_dir(phelpdir : UInt8**) : HRESULT
    @lpVtbl.value.get_help_dir.unsafe_as(Proc(UInt8**, HRESULT)).call(phelpdir)
  end
end
struct LibWin32::IEnumConnections
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cconnections : UInt32, rgcd : CONNECTDATA*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, CONNECTDATA*, UInt32*, HRESULT)).call(cconnections, rgcd, pcfetched)
  end
  def skip(cconnections : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cconnections)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumConnections*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumConnections*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IConnectionPoint
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_connection_interface(piid : Guid*) : HRESULT
    @lpVtbl.value.get_connection_interface.unsafe_as(Proc(Guid*, HRESULT)).call(piid)
  end
  def get_connection_point_container(ppcpc : IConnectionPointContainer*) : HRESULT
    @lpVtbl.value.get_connection_point_container.unsafe_as(Proc(IConnectionPointContainer*, HRESULT)).call(ppcpc)
  end
  def advise(punksink : IUnknown, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(IUnknown, UInt32*, HRESULT)).call(punksink, pdwcookie)
  end
  def unadvise(dwcookie : UInt32) : HRESULT
    @lpVtbl.value.unadvise.unsafe_as(Proc(UInt32, HRESULT)).call(dwcookie)
  end
  def enum_connections(ppenum : IEnumConnections*) : HRESULT
    @lpVtbl.value.enum_connections.unsafe_as(Proc(IEnumConnections*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumConnectionPoints
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cconnections : UInt32, ppcp : IConnectionPoint*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IConnectionPoint*, UInt32*, HRESULT)).call(cconnections, ppcp, pcfetched)
  end
  def skip(cconnections : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cconnections)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumConnectionPoints*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumConnectionPoints*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IConnectionPointContainer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enum_connection_points(ppenum : IEnumConnectionPoints*) : HRESULT
    @lpVtbl.value.enum_connection_points.unsafe_as(Proc(IEnumConnectionPoints*, HRESULT)).call(ppenum)
  end
  def find_connection_point(riid : Guid*, ppcp : IConnectionPoint*) : HRESULT
    @lpVtbl.value.find_connection_point.unsafe_as(Proc(Guid*, IConnectionPoint*, HRESULT)).call(riid, ppcp)
  end
end
struct LibWin32::IPersistMemory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_class_id(pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.unsafe_as(Proc(Guid*, HRESULT)).call(pclassid)
  end
  def is_dirty : HRESULT
    @lpVtbl.value.is_dirty.unsafe_as(Proc(HRESULT)).call
  end
  def load(pmem : Void*, cbsize : UInt32) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(Void*, UInt32, HRESULT)).call(pmem, cbsize)
  end
  def save(pmem : Void*, fcleardirty : LibC::BOOL, cbsize : UInt32) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(Void*, LibC::BOOL, UInt32, HRESULT)).call(pmem, fcleardirty, cbsize)
  end
  def get_size_max(pcbsize : UInt32*) : HRESULT
    @lpVtbl.value.get_size_max.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbsize)
  end
  def init_new : HRESULT
    @lpVtbl.value.init_new.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IPersistStreamInit
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_class_id(pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.unsafe_as(Proc(Guid*, HRESULT)).call(pclassid)
  end
  def is_dirty : HRESULT
    @lpVtbl.value.is_dirty.unsafe_as(Proc(HRESULT)).call
  end
  def load(pstm : IStream) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(IStream, HRESULT)).call(pstm)
  end
  def save(pstm : IStream, fcleardirty : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(IStream, LibC::BOOL, HRESULT)).call(pstm, fcleardirty)
  end
  def get_size_max(pcbsize : ULARGE_INTEGER*) : HRESULT
    @lpVtbl.value.get_size_max.unsafe_as(Proc(ULARGE_INTEGER*, HRESULT)).call(pcbsize)
  end
  def init_new : HRESULT
    @lpVtbl.value.init_new.unsafe_as(Proc(HRESULT)).call
  end
end
