require "../foundation.cr"
require "../security/authentication/identity.cr"
require "../security/cryptography.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wldap32.dll")]
{% else %}
@[Link("wldap32")]
{% end %}
lib LibWin32
  LBER_ERROR = -1_i32
  LBER_DEFAULT = -1_i32
  LDAP_UNICODE = 1_u32
  LDAP_PORT = 389_u32
  LDAP_SSL_PORT = 636_u32
  LDAP_GC_PORT = 3268_u32
  LDAP_SSL_GC_PORT = 3269_u32
  LDAP_VERSION1 = 1_u32
  LDAP_VERSION2 = 2_u32
  LDAP_VERSION3 = 3_u32
  LDAP_VERSION = 2_u32
  LDAP_BIND_CMD = 96_i32
  LDAP_UNBIND_CMD = 66_i32
  LDAP_SEARCH_CMD = 99_i32
  LDAP_MODIFY_CMD = 102_i32
  LDAP_ADD_CMD = 104_i32
  LDAP_DELETE_CMD = 74_i32
  LDAP_MODRDN_CMD = 108_i32
  LDAP_COMPARE_CMD = 110_i32
  LDAP_ABANDON_CMD = 80_i32
  LDAP_SESSION_CMD = 113_i32
  LDAP_EXTENDED_CMD = 119_i32
  LDAP_RES_BIND = 97_i32
  LDAP_RES_SEARCH_ENTRY = 100_i32
  LDAP_RES_SEARCH_RESULT = 101_i32
  LDAP_RES_MODIFY = 103_i32
  LDAP_RES_ADD = 105_i32
  LDAP_RES_DELETE = 107_i32
  LDAP_RES_MODRDN = 109_i32
  LDAP_RES_COMPARE = 111_i32
  LDAP_RES_SESSION = 114_i32
  LDAP_RES_REFERRAL = 115_i32
  LDAP_RES_EXTENDED = 120_i32
  LDAP_RES_ANY = -1_i32
  LDAP_INVALID_CMD = 255_u32
  LDAP_INVALID_RES = 255_u32
  LDAP_AUTH_SIMPLE = 128_i32
  LDAP_AUTH_SASL = 131_i32
  LDAP_AUTH_OTHERKIND = 134_i32
  LDAP_FILTER_AND = 160_u32
  LDAP_FILTER_OR = 161_u32
  LDAP_FILTER_NOT = 162_u32
  LDAP_FILTER_EQUALITY = 163_u32
  LDAP_FILTER_SUBSTRINGS = 164_u32
  LDAP_FILTER_GE = 165_u32
  LDAP_FILTER_LE = 166_u32
  LDAP_FILTER_PRESENT = 135_u32
  LDAP_FILTER_APPROX = 168_u32
  LDAP_FILTER_EXTENSIBLE = 169_u32
  LDAP_SUBSTRING_INITIAL = 128_i32
  LDAP_SUBSTRING_ANY = 129_i32
  LDAP_SUBSTRING_FINAL = 130_i32
  LDAP_DEREF_NEVER = 0_u32
  LDAP_DEREF_SEARCHING = 1_u32
  LDAP_DEREF_FINDING = 2_u32
  LDAP_DEREF_ALWAYS = 3_u32
  LDAP_NO_LIMIT = 0_u32
  LDAP_OPT_DNS = 1_u32
  LDAP_OPT_CHASE_REFERRALS = 2_u32
  LDAP_OPT_RETURN_REFS = 4_u32
  LDAP_MOD_ADD = 0_u32
  LDAP_MOD_DELETE = 1_u32
  LDAP_MOD_REPLACE = 2_u32
  LDAP_MOD_BVALUES = 128_u32
  LDAP_OPT_API_INFO = 0_u32
  LDAP_OPT_DESC = 1_u32
  LDAP_OPT_DEREF = 2_u32
  LDAP_OPT_SIZELIMIT = 3_u32
  LDAP_OPT_TIMELIMIT = 4_u32
  LDAP_OPT_THREAD_FN_PTRS = 5_u32
  LDAP_OPT_REBIND_FN = 6_u32
  LDAP_OPT_REBIND_ARG = 7_u32
  LDAP_OPT_REFERRALS = 8_u32
  LDAP_OPT_RESTART = 9_u32
  LDAP_OPT_SSL = 10_u32
  LDAP_OPT_IO_FN_PTRS = 11_u32
  LDAP_OPT_CACHE_FN_PTRS = 13_u32
  LDAP_OPT_CACHE_STRATEGY = 14_u32
  LDAP_OPT_CACHE_ENABLE = 15_u32
  LDAP_OPT_REFERRAL_HOP_LIMIT = 16_u32
  LDAP_OPT_PROTOCOL_VERSION = 17_u32
  LDAP_OPT_VERSION = 17_u32
  LDAP_OPT_API_FEATURE_INFO = 21_u32
  LDAP_OPT_HOST_NAME = 48_u32
  LDAP_OPT_ERROR_NUMBER = 49_u32
  LDAP_OPT_ERROR_STRING = 50_u32
  LDAP_OPT_SERVER_ERROR = 51_u32
  LDAP_OPT_SERVER_EXT_ERROR = 52_u32
  LDAP_OPT_HOST_REACHABLE = 62_u32
  LDAP_OPT_PING_KEEP_ALIVE = 54_u32
  LDAP_OPT_PING_WAIT_TIME = 55_u32
  LDAP_OPT_PING_LIMIT = 56_u32
  LDAP_OPT_DNSDOMAIN_NAME = 59_u32
  LDAP_OPT_GETDSNAME_FLAGS = 61_u32
  LDAP_OPT_PROMPT_CREDENTIALS = 63_u32
  LDAP_OPT_AUTO_RECONNECT = 145_u32
  LDAP_OPT_SSPI_FLAGS = 146_u32
  LDAP_OPT_SSL_INFO = 147_u32
  LDAP_OPT_TLS = 10_u32
  LDAP_OPT_TLS_INFO = 147_u32
  LDAP_OPT_SIGN = 149_u32
  LDAP_OPT_ENCRYPT = 150_u32
  LDAP_OPT_SASL_METHOD = 151_u32
  LDAP_OPT_AREC_EXCLUSIVE = 152_u32
  LDAP_OPT_SECURITY_CONTEXT = 153_u32
  LDAP_OPT_ROOTDSE_CACHE = 154_u32
  LDAP_OPT_TCP_KEEPALIVE = 64_u32
  LDAP_OPT_FAST_CONCURRENT_BIND = 65_u32
  LDAP_OPT_SEND_TIMEOUT = 66_u32
  LDAP_OPT_SCH_FLAGS = 67_u32
  LDAP_OPT_SOCKET_BIND_ADDRESSES = 68_u32
  LDAP_CHASE_SUBORDINATE_REFERRALS = 32_u32
  LDAP_CHASE_EXTERNAL_REFERRALS = 64_u32
  LDAP_SCOPE_BASE = 0_u32
  LDAP_SCOPE_ONELEVEL = 1_u32
  LDAP_SCOPE_SUBTREE = 2_u32
  LDAP_MSG_ONE = 0_u32
  LDAP_MSG_ALL = 1_u32
  LDAP_MSG_RECEIVED = 2_u32
  LBER_USE_DER = 1_u32
  LBER_USE_INDEFINITE_LEN = 2_u32
  LBER_TRANSLATE_STRINGS = 4_u32
  LAPI_MAJOR_VER1 = 1_u32
  LAPI_MINOR_VER1 = 1_u32
  LDAP_API_INFO_VERSION = 1_u32
  LDAP_API_VERSION = 2004_u32
  LDAP_VERSION_MIN = 2_u32
  LDAP_VERSION_MAX = 3_u32
  LDAP_VENDOR_VERSION = 510_u32
  LDAP_FEATURE_INFO_VERSION = 1_u32
  LDAP_API_FEATURE_VIRTUAL_LIST_VIEW = 1001_u32
  LDAP_VLVINFO_VERSION = 1_u32
  LDAP_OPT_REFERRAL_CALLBACK = 112_u32
  LDAP_OPT_CLIENT_CERTIFICATE = 128_u32
  LDAP_OPT_SERVER_CERTIFICATE = 129_u32
  LDAP_OPT_REF_DEREF_CONN_PER_MSG = 148_u32
  SERVER_SEARCH_FLAG_DOMAIN_SCOPE = 1_u32
  SERVER_SEARCH_FLAG_PHANTOM_ROOT = 2_u32
  LDAP_DIRSYNC_OBJECT_SECURITY = 1_u32
  LDAP_DIRSYNC_ANCESTORS_FIRST_ORDER = 2048_u32
  LDAP_DIRSYNC_PUBLIC_DATA_ONLY = 8192_u32
  LDAP_DIRSYNC_INCREMENTAL_VALUES = 2147483648_u32
  LDAP_DIRSYNC_ROPAS_DATA_ONLY = 1073741824_u32
  LDAP_POLICYHINT_APPLY_FULLPWDPOLICY = 1_u32

  type Ldapsearch = Void

  alias DBGPRINT = Proc(PSTR, UInt32)
  alias QUERYFORCONNECTION = Proc(Ldap*, Ldap*, LibC::LPWSTR, PSTR, UInt32, Void*, Void*, Ldap**, UInt32)
  alias NOTIFYOFNEWCONNECTION = Proc(Ldap*, Ldap*, LibC::LPWSTR, PSTR, Ldap*, UInt32, Void*, Void*, UInt32, BOOLEAN)
  alias DEREFERENCECONNECTION = Proc(Ldap*, Ldap*, UInt32)
  alias QUERYCLIENTCERT = Proc(Ldap*, SecPkgContext_IssuerListInfoEx*, CERT_CONTEXT**, BOOLEAN)
  alias VERIFYSERVERCERT = Proc(Ldap*, CERT_CONTEXT**, BOOLEAN)


  enum LDAP_RETCODE : Int32
    LDAP_SUCCESS = 0
    LDAP_OPERATIONS_ERROR = 1
    LDAP_PROTOCOL_ERROR = 2
    LDAP_TIMELIMIT_EXCEEDED = 3
    LDAP_SIZELIMIT_EXCEEDED = 4
    LDAP_COMPARE_FALSE = 5
    LDAP_COMPARE_TRUE = 6
    LDAP_AUTH_METHOD_NOT_SUPPORTED = 7
    LDAP_STRONG_AUTH_REQUIRED = 8
    LDAP_REFERRAL_V2 = 9
    LDAP_PARTIAL_RESULTS = 9
    LDAP_REFERRAL = 10
    LDAP_ADMIN_LIMIT_EXCEEDED = 11
    LDAP_UNAVAILABLE_CRIT_EXTENSION = 12
    LDAP_CONFIDENTIALITY_REQUIRED = 13
    LDAP_SASL_BIND_IN_PROGRESS = 14
    LDAP_NO_SUCH_ATTRIBUTE = 16
    LDAP_UNDEFINED_TYPE = 17
    LDAP_INAPPROPRIATE_MATCHING = 18
    LDAP_CONSTRAINT_VIOLATION = 19
    LDAP_ATTRIBUTE_OR_VALUE_EXISTS = 20
    LDAP_INVALID_SYNTAX = 21
    LDAP_NO_SUCH_OBJECT = 32
    LDAP_ALIAS_PROBLEM = 33
    LDAP_INVALID_DN_SYNTAX = 34
    LDAP_IS_LEAF = 35
    LDAP_ALIAS_DEREF_PROBLEM = 36
    LDAP_INAPPROPRIATE_AUTH = 48
    LDAP_INVALID_CREDENTIALS = 49
    LDAP_INSUFFICIENT_RIGHTS = 50
    LDAP_BUSY = 51
    LDAP_UNAVAILABLE = 52
    LDAP_UNWILLING_TO_PERFORM = 53
    LDAP_LOOP_DETECT = 54
    LDAP_SORT_CONTROL_MISSING = 60
    LDAP_OFFSET_RANGE_ERROR = 61
    LDAP_NAMING_VIOLATION = 64
    LDAP_OBJECT_CLASS_VIOLATION = 65
    LDAP_NOT_ALLOWED_ON_NONLEAF = 66
    LDAP_NOT_ALLOWED_ON_RDN = 67
    LDAP_ALREADY_EXISTS = 68
    LDAP_NO_OBJECT_CLASS_MODS = 69
    LDAP_RESULTS_TOO_LARGE = 70
    LDAP_AFFECTS_MULTIPLE_DSAS = 71
    LDAP_VIRTUAL_LIST_VIEW_ERROR = 76
    LDAP_OTHER = 80
    LDAP_SERVER_DOWN = 81
    LDAP_LOCAL_ERROR = 82
    LDAP_ENCODING_ERROR = 83
    LDAP_DECODING_ERROR = 84
    LDAP_TIMEOUT = 85
    LDAP_AUTH_UNKNOWN = 86
    LDAP_FILTER_ERROR = 87
    LDAP_USER_CANCELLED = 88
    LDAP_PARAM_ERROR = 89
    LDAP_NO_MEMORY = 90
    LDAP_CONNECT_ERROR = 91
    LDAP_NOT_SUPPORTED = 92
    LDAP_NO_RESULTS_RETURNED = 94
    LDAP_CONTROL_NOT_FOUND = 93
    LDAP_MORE_RESULTS_TO_RETURN = 95
    LDAP_CLIENT_LOOP = 96
    LDAP_REFERRAL_LIMIT_EXCEEDED = 97
  end

  union Ldapmodw_mod_vals_e__Union
    modv_strvals : LibC::LPWSTR*
    modv_bvals : LDAP_BERVAL**
  end
  union Ldapmoda_mod_vals_e__Union
    modv_strvals : PSTR*
    modv_bvals : LDAP_BERVAL**
  end

  struct Ldap
    ld_sb : Ldap_ld_sb_e__Struct
    ld_host : PSTR
    ld_version : UInt32
    ld_lberoptions : UInt8
    ld_deref : UInt32
    ld_timelimit : UInt32
    ld_sizelimit : UInt32
    ld_errno : UInt32
    ld_matched : PSTR
    ld_error : PSTR
    ld_msgid : UInt32
    reserved3 : UInt8[25]*
    ld_cldaptries : UInt32
    ld_cldaptimeout : UInt32
    ld_refhoplimit : UInt32
    ld_options : UInt32
  end
  struct Ldap_ld_sb_e__Struct
    sb_sd : LibC::UINT_PTR
    reserved1 : UInt8[41]*
    sb_naddr : LibC::UINT_PTR
    reserved2 : UInt8[24]*
  end
  struct LDAP_TIMEVAL
    tv_sec : Int32
    tv_usec : Int32
  end
  struct LDAP_BERVAL
    bv_len : UInt32
    bv_val : PSTR
  end
  struct LDAPMessage
    lm_msgid : UInt32
    lm_msgtype : UInt32
    lm_ber : Void*
    lm_chain : LDAPMessage*
    lm_next : LDAPMessage*
    lm_time : UInt32
    connection : Ldap*
    request : Void*
    lm_returncode : UInt32
    lm_referral : UInt16
    lm_chased : BOOLEAN
    lm_eom : BOOLEAN
    connection_referenced : BOOLEAN
  end
  struct Ldapcontrola
    ldctl_oid : PSTR
    ldctl_value : LDAP_BERVAL
    ldctl_iscritical : BOOLEAN
  end
  struct Ldapcontrolw
    ldctl_oid : LibC::LPWSTR
    ldctl_value : LDAP_BERVAL
    ldctl_iscritical : BOOLEAN
  end
  struct Ldapmodw
    mod_op : UInt32
    mod_type : LibC::LPWSTR
    mod_vals : Ldapmodw_mod_vals_e__Union
  end
  struct Ldapmoda
    mod_op : UInt32
    mod_type : PSTR
    mod_vals : Ldapmoda_mod_vals_e__Union
  end
  struct Berelement
    opaque : PSTR
  end
  struct Ldap_version_info
    lv_size : UInt32
    lv_major : UInt32
    lv_minor : UInt32
  end
  struct Ldapapiinfoa
    ldapai_info_version : Int32
    ldapai_api_version : Int32
    ldapai_protocol_version : Int32
    ldapai_extensions : Int8**
    ldapai_vendor_name : PSTR
    ldapai_vendor_version : Int32
  end
  struct Ldapapiinfow
    ldapai_info_version : Int32
    ldapai_api_version : Int32
    ldapai_protocol_version : Int32
    ldapai_extensions : LibC::LPWSTR*
    ldapai_vendor_name : LibC::LPWSTR
    ldapai_vendor_version : Int32
  end
  struct LDAPAPIFeatureInfoA
    ldapaif_info_version : Int32
    ldapaif_name : PSTR
    ldapaif_version : Int32
  end
  struct LDAPAPIFeatureInfoW
    ldapaif_info_version : Int32
    ldapaif_name : LibC::LPWSTR
    ldapaif_version : Int32
  end
  struct Ldapsortkeyw
    sk_attrtype : LibC::LPWSTR
    sk_matchruleoid : LibC::LPWSTR
    sk_reverseorder : BOOLEAN
  end
  struct Ldapsortkeya
    sk_attrtype : PSTR
    sk_matchruleoid : PSTR
    sk_reverseorder : BOOLEAN
  end
  struct Ldapvlvinfo
    ldvlv_version : Int32
    ldvlv_before_count : UInt32
    ldvlv_after_count : UInt32
    ldvlv_offset : UInt32
    ldvlv_count : UInt32
    ldvlv_attrvalue : LDAP_BERVAL*
    ldvlv_context : LDAP_BERVAL*
    ldvlv_extradata : Void*
  end
  struct LDAP_REFERRAL_CALLBACK
    size_of_callbacks : UInt32
    query_for_connection : QUERYFORCONNECTION
    notify_routine : NOTIFYOFNEWCONNECTION
    dereference_routine : DEREFERENCECONNECTION
  end


  # Params # hostname : LibC::LPWSTR [In],portnumber : UInt32 [In]
  fun ldap_openW(hostname : LibC::LPWSTR, portnumber : UInt32) : Ldap*

  # Params # hostname : PSTR [In],portnumber : UInt32 [In]
  fun ldap_openA(hostname : PSTR, portnumber : UInt32) : Ldap*

  # Params # hostname : LibC::LPWSTR [In],portnumber : UInt32 [In]
  fun ldap_initW(hostname : LibC::LPWSTR, portnumber : UInt32) : Ldap*

  # Params # hostname : PSTR [In],portnumber : UInt32 [In]
  fun ldap_initA(hostname : PSTR, portnumber : UInt32) : Ldap*

  # Params # hostname : LibC::LPWSTR [In],portnumber : UInt32 [In],secure : Int32 [In]
  fun ldap_sslinitW(hostname : LibC::LPWSTR, portnumber : UInt32, secure : Int32) : Ldap*

  # Params # hostname : PSTR [In],portnumber : UInt32 [In],secure : Int32 [In]
  fun ldap_sslinitA(hostname : PSTR, portnumber : UInt32, secure : Int32) : Ldap*

  # Params # ld : Ldap* [In],timeout : LDAP_TIMEVAL* [In]
  fun ldap_connect(ld : Ldap*, timeout : LDAP_TIMEVAL*) : UInt32

  # Params # hostname : PSTR [In],portnumber : UInt32 [In]
  fun ldap_open(hostname : PSTR, portnumber : UInt32) : Ldap*

  # Params # hostname : PSTR [In],portnumber : UInt32 [In]
  fun ldap_init(hostname : PSTR, portnumber : UInt32) : Ldap*

  # Params # hostname : PSTR [In],portnumber : UInt32 [In],secure : Int32 [In]
  fun ldap_sslinit(hostname : PSTR, portnumber : UInt32, secure : Int32) : Ldap*

  # Params # hostname : LibC::LPWSTR [In],portnumber : UInt32 [In]
  fun cldap_openW(hostname : LibC::LPWSTR, portnumber : UInt32) : Ldap*

  # Params # hostname : PSTR [In],portnumber : UInt32 [In]
  fun cldap_openA(hostname : PSTR, portnumber : UInt32) : Ldap*

  # Params # hostname : PSTR [In],portnumber : UInt32 [In]
  fun cldap_open(hostname : PSTR, portnumber : UInt32) : Ldap*

  # Params # ld : Ldap* [In]
  fun ldap_unbind(ld : Ldap*) : UInt32

  # Params # ld : Ldap* [In]
  fun ldap_unbind_s(ld : Ldap*) : UInt32

  # Params # ld : Ldap* [In],option : Int32 [In],outvalue : Void* [In]
  fun ldap_get_option(ld : Ldap*, option : Int32, outvalue : Void*) : UInt32

  # Params # ld : Ldap* [In],option : Int32 [In],outvalue : Void* [In]
  fun ldap_get_optionW(ld : Ldap*, option : Int32, outvalue : Void*) : UInt32

  # Params # ld : Ldap* [In],option : Int32 [In],invalue : Void* [In]
  fun ldap_set_option(ld : Ldap*, option : Int32, invalue : Void*) : UInt32

  # Params # ld : Ldap* [In],option : Int32 [In],invalue : Void* [In]
  fun ldap_set_optionW(ld : Ldap*, option : Int32, invalue : Void*) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],passwd : LibC::LPWSTR [In]
  fun ldap_simple_bindW(ld : Ldap*, dn : LibC::LPWSTR, passwd : LibC::LPWSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],passwd : PSTR [In]
  fun ldap_simple_bindA(ld : Ldap*, dn : PSTR, passwd : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],passwd : LibC::LPWSTR [In]
  fun ldap_simple_bind_sW(ld : Ldap*, dn : LibC::LPWSTR, passwd : LibC::LPWSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],passwd : PSTR [In]
  fun ldap_simple_bind_sA(ld : Ldap*, dn : PSTR, passwd : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],cred : LibC::LPWSTR [In],method : UInt32 [In]
  fun ldap_bindW(ld : Ldap*, dn : LibC::LPWSTR, cred : LibC::LPWSTR, method : UInt32) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],cred : PSTR [In],method : UInt32 [In]
  fun ldap_bindA(ld : Ldap*, dn : PSTR, cred : PSTR, method : UInt32) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],cred : LibC::LPWSTR [In],method : UInt32 [In]
  fun ldap_bind_sW(ld : Ldap*, dn : LibC::LPWSTR, cred : LibC::LPWSTR, method : UInt32) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],cred : PSTR [In],method : UInt32 [In]
  fun ldap_bind_sA(ld : Ldap*, dn : PSTR, cred : PSTR, method : UInt32) : UInt32

  # Params # externalhandle : Ldap* [In],distname : PSTR [In],authmechanism : PSTR [In],cred : LDAP_BERVAL* [In],serverctrls : Ldapcontrola** [In],clientctrls : Ldapcontrola** [In],messagenumber : Int32* [In]
  fun ldap_sasl_bindA(externalhandle : Ldap*, distname : PSTR, authmechanism : PSTR, cred : LDAP_BERVAL*, serverctrls : Ldapcontrola**, clientctrls : Ldapcontrola**, messagenumber : Int32*) : Int32

  # Params # externalhandle : Ldap* [In],distname : LibC::LPWSTR [In],authmechanism : LibC::LPWSTR [In],cred : LDAP_BERVAL* [In],serverctrls : Ldapcontrolw** [In],clientctrls : Ldapcontrolw** [In],messagenumber : Int32* [In]
  fun ldap_sasl_bindW(externalhandle : Ldap*, distname : LibC::LPWSTR, authmechanism : LibC::LPWSTR, cred : LDAP_BERVAL*, serverctrls : Ldapcontrolw**, clientctrls : Ldapcontrolw**, messagenumber : Int32*) : Int32

  # Params # externalhandle : Ldap* [In],distname : PSTR [In],authmechanism : PSTR [In],cred : LDAP_BERVAL* [In],serverctrls : Ldapcontrola** [In],clientctrls : Ldapcontrola** [In],serverdata : LDAP_BERVAL** [In]
  fun ldap_sasl_bind_sA(externalhandle : Ldap*, distname : PSTR, authmechanism : PSTR, cred : LDAP_BERVAL*, serverctrls : Ldapcontrola**, clientctrls : Ldapcontrola**, serverdata : LDAP_BERVAL**) : Int32

  # Params # externalhandle : Ldap* [In],distname : LibC::LPWSTR [In],authmechanism : LibC::LPWSTR [In],cred : LDAP_BERVAL* [In],serverctrls : Ldapcontrolw** [In],clientctrls : Ldapcontrolw** [In],serverdata : LDAP_BERVAL** [In]
  fun ldap_sasl_bind_sW(externalhandle : Ldap*, distname : LibC::LPWSTR, authmechanism : LibC::LPWSTR, cred : LDAP_BERVAL*, serverctrls : Ldapcontrolw**, clientctrls : Ldapcontrolw**, serverdata : LDAP_BERVAL**) : Int32

  # Params # ld : Ldap* [In],dn : PSTR [In],passwd : PSTR [In]
  fun ldap_simple_bind(ld : Ldap*, dn : PSTR, passwd : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],passwd : PSTR [In]
  fun ldap_simple_bind_s(ld : Ldap*, dn : PSTR, passwd : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],cred : PSTR [In],method : UInt32 [In]
  fun ldap_bind(ld : Ldap*, dn : PSTR, cred : PSTR, method : UInt32) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],cred : PSTR [In],method : UInt32 [In]
  fun ldap_bind_s(ld : Ldap*, dn : PSTR, cred : PSTR, method : UInt32) : UInt32

  # Params # ld : Ldap* [In],base : LibC::LPWSTR [In],scope : UInt32 [In],filter : LibC::LPWSTR [In],attrs : UInt16** [In],attrsonly : UInt32 [In]
  fun ldap_searchW(ld : Ldap*, base : LibC::LPWSTR, scope : UInt32, filter : LibC::LPWSTR, attrs : UInt16**, attrsonly : UInt32) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In]
  fun ldap_searchA(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32) : UInt32

  # Params # ld : Ldap* [In],base : LibC::LPWSTR [In],scope : UInt32 [In],filter : LibC::LPWSTR [In],attrs : UInt16** [In],attrsonly : UInt32 [In],res : LDAPMessage** [In]
  fun ldap_search_sW(ld : Ldap*, base : LibC::LPWSTR, scope : UInt32, filter : LibC::LPWSTR, attrs : UInt16**, attrsonly : UInt32, res : LDAPMessage**) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In],res : LDAPMessage** [In]
  fun ldap_search_sA(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32, res : LDAPMessage**) : UInt32

  # Params # ld : Ldap* [In],base : LibC::LPWSTR [In],scope : UInt32 [In],filter : LibC::LPWSTR [In],attrs : UInt16** [In],attrsonly : UInt32 [In],timeout : LDAP_TIMEVAL* [In],res : LDAPMessage** [In]
  fun ldap_search_stW(ld : Ldap*, base : LibC::LPWSTR, scope : UInt32, filter : LibC::LPWSTR, attrs : UInt16**, attrsonly : UInt32, timeout : LDAP_TIMEVAL*, res : LDAPMessage**) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In],timeout : LDAP_TIMEVAL* [In],res : LDAPMessage** [In]
  fun ldap_search_stA(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32, timeout : LDAP_TIMEVAL*, res : LDAPMessage**) : UInt32

  # Params # ld : Ldap* [In],base : LibC::LPWSTR [In],scope : UInt32 [In],filter : LibC::LPWSTR [In],attrs : UInt16** [In],attrsonly : UInt32 [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],timelimit : UInt32 [In],sizelimit : UInt32 [In],messagenumber : UInt32* [In]
  fun ldap_search_extW(ld : Ldap*, base : LibC::LPWSTR, scope : UInt32, filter : LibC::LPWSTR, attrs : UInt16**, attrsonly : UInt32, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, timelimit : UInt32, sizelimit : UInt32, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],timelimit : UInt32 [In],sizelimit : UInt32 [In],messagenumber : UInt32* [In]
  fun ldap_search_extA(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, timelimit : UInt32, sizelimit : UInt32, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],base : LibC::LPWSTR [In],scope : UInt32 [In],filter : LibC::LPWSTR [In],attrs : UInt16** [In],attrsonly : UInt32 [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],timeout : LDAP_TIMEVAL* [In],sizelimit : UInt32 [In],res : LDAPMessage** [In]
  fun ldap_search_ext_sW(ld : Ldap*, base : LibC::LPWSTR, scope : UInt32, filter : LibC::LPWSTR, attrs : UInt16**, attrsonly : UInt32, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, timeout : LDAP_TIMEVAL*, sizelimit : UInt32, res : LDAPMessage**) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],timeout : LDAP_TIMEVAL* [In],sizelimit : UInt32 [In],res : LDAPMessage** [In]
  fun ldap_search_ext_sA(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, timeout : LDAP_TIMEVAL*, sizelimit : UInt32, res : LDAPMessage**) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In]
  fun ldap_search(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In],res : LDAPMessage** [In]
  fun ldap_search_s(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32, res : LDAPMessage**) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In],timeout : LDAP_TIMEVAL* [In],res : LDAPMessage** [In]
  fun ldap_search_st(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32, timeout : LDAP_TIMEVAL*, res : LDAPMessage**) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],timelimit : UInt32 [In],sizelimit : UInt32 [In],messagenumber : UInt32* [In]
  fun ldap_search_ext(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, timelimit : UInt32, sizelimit : UInt32, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],base : PSTR [In],scope : UInt32 [In],filter : PSTR [In],attrs : Int8** [In],attrsonly : UInt32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],timeout : LDAP_TIMEVAL* [In],sizelimit : UInt32 [In],res : LDAPMessage** [In]
  fun ldap_search_ext_s(ld : Ldap*, base : PSTR, scope : UInt32, filter : PSTR, attrs : Int8**, attrsonly : UInt32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, timeout : LDAP_TIMEVAL*, sizelimit : UInt32, res : LDAPMessage**) : UInt32

  # Params # ld : Ldap* [In],searchfilter : LibC::LPWSTR [In]
  fun ldap_check_filterW(ld : Ldap*, searchfilter : LibC::LPWSTR) : UInt32

  # Params # ld : Ldap* [In],searchfilter : PSTR [In]
  fun ldap_check_filterA(ld : Ldap*, searchfilter : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],mods : Ldapmodw** [In]
  fun ldap_modifyW(ld : Ldap*, dn : LibC::LPWSTR, mods : Ldapmodw**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],mods : Ldapmoda** [In]
  fun ldap_modifyA(ld : Ldap*, dn : PSTR, mods : Ldapmoda**) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],mods : Ldapmodw** [In]
  fun ldap_modify_sW(ld : Ldap*, dn : LibC::LPWSTR, mods : Ldapmodw**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],mods : Ldapmoda** [In]
  fun ldap_modify_sA(ld : Ldap*, dn : PSTR, mods : Ldapmoda**) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],mods : Ldapmodw** [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],messagenumber : UInt32* [In]
  fun ldap_modify_extW(ld : Ldap*, dn : LibC::LPWSTR, mods : Ldapmodw**, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],mods : Ldapmoda** [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_modify_extA(ld : Ldap*, dn : PSTR, mods : Ldapmoda**, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],mods : Ldapmodw** [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In]
  fun ldap_modify_ext_sW(ld : Ldap*, dn : LibC::LPWSTR, mods : Ldapmodw**, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],mods : Ldapmoda** [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_modify_ext_sA(ld : Ldap*, dn : PSTR, mods : Ldapmoda**, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],mods : Ldapmoda** [In]
  fun ldap_modify(ld : Ldap*, dn : PSTR, mods : Ldapmoda**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],mods : Ldapmoda** [In]
  fun ldap_modify_s(ld : Ldap*, dn : PSTR, mods : Ldapmoda**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],mods : Ldapmoda** [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_modify_ext(ld : Ldap*, dn : PSTR, mods : Ldapmoda**, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],mods : Ldapmoda** [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_modify_ext_s(ld : Ldap*, dn : PSTR, mods : Ldapmoda**, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : LibC::LPWSTR [In],newdistinguishedname : LibC::LPWSTR [In],deleteoldrdn : Int32 [In]
  fun ldap_modrdn2W(externalhandle : Ldap*, distinguishedname : LibC::LPWSTR, newdistinguishedname : LibC::LPWSTR, deleteoldrdn : Int32) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],newdistinguishedname : PSTR [In],deleteoldrdn : Int32 [In]
  fun ldap_modrdn2A(externalhandle : Ldap*, distinguishedname : PSTR, newdistinguishedname : PSTR, deleteoldrdn : Int32) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : LibC::LPWSTR [In],newdistinguishedname : LibC::LPWSTR [In]
  fun ldap_modrdnW(externalhandle : Ldap*, distinguishedname : LibC::LPWSTR, newdistinguishedname : LibC::LPWSTR) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],newdistinguishedname : PSTR [In]
  fun ldap_modrdnA(externalhandle : Ldap*, distinguishedname : PSTR, newdistinguishedname : PSTR) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : LibC::LPWSTR [In],newdistinguishedname : LibC::LPWSTR [In],deleteoldrdn : Int32 [In]
  fun ldap_modrdn2_sW(externalhandle : Ldap*, distinguishedname : LibC::LPWSTR, newdistinguishedname : LibC::LPWSTR, deleteoldrdn : Int32) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],newdistinguishedname : PSTR [In],deleteoldrdn : Int32 [In]
  fun ldap_modrdn2_sA(externalhandle : Ldap*, distinguishedname : PSTR, newdistinguishedname : PSTR, deleteoldrdn : Int32) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : LibC::LPWSTR [In],newdistinguishedname : LibC::LPWSTR [In]
  fun ldap_modrdn_sW(externalhandle : Ldap*, distinguishedname : LibC::LPWSTR, newdistinguishedname : LibC::LPWSTR) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],newdistinguishedname : PSTR [In]
  fun ldap_modrdn_sA(externalhandle : Ldap*, distinguishedname : PSTR, newdistinguishedname : PSTR) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],newdistinguishedname : PSTR [In],deleteoldrdn : Int32 [In]
  fun ldap_modrdn2(externalhandle : Ldap*, distinguishedname : PSTR, newdistinguishedname : PSTR, deleteoldrdn : Int32) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],newdistinguishedname : PSTR [In]
  fun ldap_modrdn(externalhandle : Ldap*, distinguishedname : PSTR, newdistinguishedname : PSTR) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],newdistinguishedname : PSTR [In],deleteoldrdn : Int32 [In]
  fun ldap_modrdn2_s(externalhandle : Ldap*, distinguishedname : PSTR, newdistinguishedname : PSTR, deleteoldrdn : Int32) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],newdistinguishedname : PSTR [In]
  fun ldap_modrdn_s(externalhandle : Ldap*, distinguishedname : PSTR, newdistinguishedname : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],newrdn : LibC::LPWSTR [In],newparent : LibC::LPWSTR [In],deleteoldrdn : Int32 [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],messagenumber : UInt32* [In]
  fun ldap_rename_extW(ld : Ldap*, dn : LibC::LPWSTR, newrdn : LibC::LPWSTR, newparent : LibC::LPWSTR, deleteoldrdn : Int32, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],newrdn : PSTR [In],newparent : PSTR [In],deleteoldrdn : Int32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_rename_extA(ld : Ldap*, dn : PSTR, newrdn : PSTR, newparent : PSTR, deleteoldrdn : Int32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],newrdn : LibC::LPWSTR [In],newparent : LibC::LPWSTR [In],deleteoldrdn : Int32 [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In]
  fun ldap_rename_ext_sW(ld : Ldap*, dn : LibC::LPWSTR, newrdn : LibC::LPWSTR, newparent : LibC::LPWSTR, deleteoldrdn : Int32, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],newrdn : PSTR [In],newparent : PSTR [In],deleteoldrdn : Int32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_rename_ext_sA(ld : Ldap*, dn : PSTR, newrdn : PSTR, newparent : PSTR, deleteoldrdn : Int32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],newrdn : PSTR [In],newparent : PSTR [In],deleteoldrdn : Int32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_rename_ext(ld : Ldap*, dn : PSTR, newrdn : PSTR, newparent : PSTR, deleteoldrdn : Int32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],newrdn : PSTR [In],newparent : PSTR [In],deleteoldrdn : Int32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_rename_ext_s(ld : Ldap*, dn : PSTR, newrdn : PSTR, newparent : PSTR, deleteoldrdn : Int32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],attrs : Ldapmodw** [In]
  fun ldap_addW(ld : Ldap*, dn : LibC::LPWSTR, attrs : Ldapmodw**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attrs : Ldapmoda** [In]
  fun ldap_addA(ld : Ldap*, dn : PSTR, attrs : Ldapmoda**) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],attrs : Ldapmodw** [In]
  fun ldap_add_sW(ld : Ldap*, dn : LibC::LPWSTR, attrs : Ldapmodw**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attrs : Ldapmoda** [In]
  fun ldap_add_sA(ld : Ldap*, dn : PSTR, attrs : Ldapmoda**) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],attrs : Ldapmodw** [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],messagenumber : UInt32* [In]
  fun ldap_add_extW(ld : Ldap*, dn : LibC::LPWSTR, attrs : Ldapmodw**, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attrs : Ldapmoda** [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_add_extA(ld : Ldap*, dn : PSTR, attrs : Ldapmoda**, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],attrs : Ldapmodw** [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In]
  fun ldap_add_ext_sW(ld : Ldap*, dn : LibC::LPWSTR, attrs : Ldapmodw**, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attrs : Ldapmoda** [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_add_ext_sA(ld : Ldap*, dn : PSTR, attrs : Ldapmoda**, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attrs : Ldapmoda** [In]
  fun ldap_add(ld : Ldap*, dn : PSTR, attrs : Ldapmoda**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attrs : Ldapmoda** [In]
  fun ldap_add_s(ld : Ldap*, dn : PSTR, attrs : Ldapmoda**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attrs : Ldapmoda** [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_add_ext(ld : Ldap*, dn : PSTR, attrs : Ldapmoda**, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attrs : Ldapmoda** [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_add_ext_s(ld : Ldap*, dn : PSTR, attrs : Ldapmoda**, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],attr : LibC::LPWSTR [In],value : LibC::LPWSTR [In]
  fun ldap_compareW(ld : Ldap*, dn : LibC::LPWSTR, attr : LibC::LPWSTR, value : LibC::LPWSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attr : PSTR [In],value : PSTR [In]
  fun ldap_compareA(ld : Ldap*, dn : PSTR, attr : PSTR, value : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],attr : LibC::LPWSTR [In],value : LibC::LPWSTR [In]
  fun ldap_compare_sW(ld : Ldap*, dn : LibC::LPWSTR, attr : LibC::LPWSTR, value : LibC::LPWSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attr : PSTR [In],value : PSTR [In]
  fun ldap_compare_sA(ld : Ldap*, dn : PSTR, attr : PSTR, value : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attr : PSTR [In],value : PSTR [In]
  fun ldap_compare(ld : Ldap*, dn : PSTR, attr : PSTR, value : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attr : PSTR [In],value : PSTR [In]
  fun ldap_compare_s(ld : Ldap*, dn : PSTR, attr : PSTR, value : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],attr : LibC::LPWSTR [In],value : LibC::LPWSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],messagenumber : UInt32* [In]
  fun ldap_compare_extW(ld : Ldap*, dn : LibC::LPWSTR, attr : LibC::LPWSTR, value : LibC::LPWSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attr : PSTR [In],value : PSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_compare_extA(ld : Ldap*, dn : PSTR, attr : PSTR, value : PSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],attr : LibC::LPWSTR [In],value : LibC::LPWSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In]
  fun ldap_compare_ext_sW(ld : Ldap*, dn : LibC::LPWSTR, attr : LibC::LPWSTR, value : LibC::LPWSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attr : PSTR [In],value : PSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_compare_ext_sA(ld : Ldap*, dn : PSTR, attr : PSTR, value : PSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attr : PSTR [In],value : PSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_compare_ext(ld : Ldap*, dn : PSTR, attr : PSTR, value : PSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],attr : PSTR [In],value : PSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_compare_ext_s(ld : Ldap*, dn : PSTR, attr : PSTR, value : PSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In]
  fun ldap_deleteW(ld : Ldap*, dn : LibC::LPWSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In]
  fun ldap_deleteA(ld : Ldap*, dn : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In]
  fun ldap_delete_sW(ld : Ldap*, dn : LibC::LPWSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In]
  fun ldap_delete_sA(ld : Ldap*, dn : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],messagenumber : UInt32* [In]
  fun ldap_delete_extW(ld : Ldap*, dn : LibC::LPWSTR, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_delete_extA(ld : Ldap*, dn : PSTR, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : LibC::LPWSTR [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In]
  fun ldap_delete_ext_sW(ld : Ldap*, dn : LibC::LPWSTR, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_delete_ext_sA(ld : Ldap*, dn : PSTR, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In]
  fun ldap_delete(ld : Ldap*, dn : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In]
  fun ldap_delete_s(ld : Ldap*, dn : PSTR) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_delete_ext(ld : Ldap*, dn : PSTR, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],dn : PSTR [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_delete_ext_s(ld : Ldap*, dn : PSTR, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # ld : Ldap* [In],msgid : UInt32 [In]
  fun ldap_abandon(ld : Ldap*, msgid : UInt32) : UInt32

  # Params # ld : Ldap* [In],msgid : UInt32 [In],all : UInt32 [In],timeout : LDAP_TIMEVAL* [In],res : LDAPMessage** [In]
  fun ldap_result(ld : Ldap*, msgid : UInt32, all : UInt32, timeout : LDAP_TIMEVAL*, res : LDAPMessage**) : UInt32

  # Params # res : LDAPMessage* [In]
  fun ldap_msgfree(res : LDAPMessage*) : UInt32

  # Params # ld : Ldap* [In],res : LDAPMessage* [In],freeit : UInt32 [In]
  fun ldap_result2error(ld : Ldap*, res : LDAPMessage*, freeit : UInt32) : UInt32

  # Params # connection : Ldap* [In],resultmessage : LDAPMessage* [In],returncode : UInt32* [In],matcheddns : LibC::LPWSTR* [In],errormessage : LibC::LPWSTR* [In],referrals : UInt16*** [In],servercontrols : Ldapcontrolw*** [In],freeit : BOOLEAN [In]
  fun ldap_parse_resultW(connection : Ldap*, resultmessage : LDAPMessage*, returncode : UInt32*, matcheddns : LibC::LPWSTR*, errormessage : LibC::LPWSTR*, referrals : UInt16***, servercontrols : Ldapcontrolw***, freeit : BOOLEAN) : UInt32

  # Params # connection : Ldap* [In],resultmessage : LDAPMessage* [In],returncode : UInt32* [In],matcheddns : PSTR* [In],errormessage : PSTR* [In],referrals : Int8*** [In],servercontrols : Ldapcontrola*** [In],freeit : BOOLEAN [In]
  fun ldap_parse_resultA(connection : Ldap*, resultmessage : LDAPMessage*, returncode : UInt32*, matcheddns : PSTR*, errormessage : PSTR*, referrals : Int8***, servercontrols : Ldapcontrola***, freeit : BOOLEAN) : UInt32

  # Params # connection : Ldap* [In],resultmessage : LDAPMessage* [In],resultoid : PSTR* [In],resultdata : LDAP_BERVAL** [In],freeit : BOOLEAN [In]
  fun ldap_parse_extended_resultA(connection : Ldap*, resultmessage : LDAPMessage*, resultoid : PSTR*, resultdata : LDAP_BERVAL**, freeit : BOOLEAN) : UInt32

  # Params # connection : Ldap* [In],resultmessage : LDAPMessage* [In],resultoid : LibC::LPWSTR* [In],resultdata : LDAP_BERVAL** [In],freeit : BOOLEAN [In]
  fun ldap_parse_extended_resultW(connection : Ldap*, resultmessage : LDAPMessage*, resultoid : LibC::LPWSTR*, resultdata : LDAP_BERVAL**, freeit : BOOLEAN) : UInt32

  # Params # controls : Ldapcontrola** [In]
  fun ldap_controls_freeA(controls : Ldapcontrola**) : UInt32

  # Params # controls : Ldapcontrola* [In]
  fun ldap_control_freeA(controls : Ldapcontrola*) : UInt32

  # Params # control : Ldapcontrolw** [In]
  fun ldap_controls_freeW(control : Ldapcontrolw**) : UInt32

  # Params # control : Ldapcontrolw* [In]
  fun ldap_control_freeW(control : Ldapcontrolw*) : UInt32

  # Params # controls : Ldapcontrolw** [In]
  fun ldap_free_controlsW(controls : Ldapcontrolw**) : UInt32

  # Params # controls : Ldapcontrola** [In]
  fun ldap_free_controlsA(controls : Ldapcontrola**) : UInt32

  # Params # connection : Ldap* [In],resultmessage : LDAPMessage* [In],returncode : UInt32* [In],matcheddns : PSTR* [In],errormessage : PSTR* [In],referrals : PSTR** [In],servercontrols : Ldapcontrola*** [In],freeit : BOOLEAN [In]
  fun ldap_parse_result(connection : Ldap*, resultmessage : LDAPMessage*, returncode : UInt32*, matcheddns : PSTR*, errormessage : PSTR*, referrals : PSTR**, servercontrols : Ldapcontrola***, freeit : BOOLEAN) : UInt32

  # Params # controls : Ldapcontrola** [In]
  fun ldap_controls_free(controls : Ldapcontrola**) : UInt32

  # Params # control : Ldapcontrola* [In]
  fun ldap_control_free(control : Ldapcontrola*) : UInt32

  # Params # controls : Ldapcontrola** [In]
  fun ldap_free_controls(controls : Ldapcontrola**) : UInt32

  # Params # err : UInt32 [In]
  fun ldap_err2stringW(err : UInt32) : LibC::LPWSTR

  # Params # err : UInt32 [In]
  fun ldap_err2stringA(err : UInt32) : PSTR

  # Params # err : UInt32 [In]
  fun ldap_err2string(err : UInt32) : PSTR

  # Params # ld : Ldap* [In],msg : PSTR [In]
  fun ldap_perror(ld : Ldap*, msg : PSTR) : Void

  # Params # ld : Ldap* [In],res : LDAPMessage* [In]
  fun ldap_first_entry(ld : Ldap*, res : LDAPMessage*) : LDAPMessage*

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In]
  fun ldap_next_entry(ld : Ldap*, entry : LDAPMessage*) : LDAPMessage*

  # Params # ld : Ldap* [In],res : LDAPMessage* [In]
  fun ldap_count_entries(ld : Ldap*, res : LDAPMessage*) : UInt32

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In],ptr : Berelement** [In]
  fun ldap_first_attributeW(ld : Ldap*, entry : LDAPMessage*, ptr : Berelement**) : LibC::LPWSTR

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In],ptr : Berelement** [In]
  fun ldap_first_attributeA(ld : Ldap*, entry : LDAPMessage*, ptr : Berelement**) : PSTR

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In],ptr : Berelement** [In]
  fun ldap_first_attribute(ld : Ldap*, entry : LDAPMessage*, ptr : Berelement**) : PSTR

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In],ptr : Berelement* [In]
  fun ldap_next_attributeW(ld : Ldap*, entry : LDAPMessage*, ptr : Berelement*) : LibC::LPWSTR

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In],ptr : Berelement* [In]
  fun ldap_next_attributeA(ld : Ldap*, entry : LDAPMessage*, ptr : Berelement*) : PSTR

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In],ptr : Berelement* [In]
  fun ldap_next_attribute(ld : Ldap*, entry : LDAPMessage*, ptr : Berelement*) : PSTR

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In],attr : LibC::LPWSTR [In]
  fun ldap_get_valuesW(ld : Ldap*, entry : LDAPMessage*, attr : LibC::LPWSTR) : LibC::LPWSTR*

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In],attr : PSTR [In]
  fun ldap_get_valuesA(ld : Ldap*, entry : LDAPMessage*, attr : PSTR) : PSTR*

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In],attr : PSTR [In]
  fun ldap_get_values(ld : Ldap*, entry : LDAPMessage*, attr : PSTR) : PSTR*

  # Params # externalhandle : Ldap* [In],message : LDAPMessage* [In],attr : LibC::LPWSTR [In]
  fun ldap_get_values_lenW(externalhandle : Ldap*, message : LDAPMessage*, attr : LibC::LPWSTR) : LDAP_BERVAL**

  # Params # externalhandle : Ldap* [In],message : LDAPMessage* [In],attr : PSTR [In]
  fun ldap_get_values_lenA(externalhandle : Ldap*, message : LDAPMessage*, attr : PSTR) : LDAP_BERVAL**

  # Params # externalhandle : Ldap* [In],message : LDAPMessage* [In],attr : PSTR [In]
  fun ldap_get_values_len(externalhandle : Ldap*, message : LDAPMessage*, attr : PSTR) : LDAP_BERVAL**

  # Params # vals : LibC::LPWSTR* [In]
  fun ldap_count_valuesW(vals : LibC::LPWSTR*) : UInt32

  # Params # vals : PSTR* [In]
  fun ldap_count_valuesA(vals : PSTR*) : UInt32

  # Params # vals : PSTR* [In]
  fun ldap_count_values(vals : PSTR*) : UInt32

  # Params # vals : LDAP_BERVAL** [In]
  fun ldap_count_values_len(vals : LDAP_BERVAL**) : UInt32

  # Params # vals : LibC::LPWSTR* [In]
  fun ldap_value_freeW(vals : LibC::LPWSTR*) : UInt32

  # Params # vals : PSTR* [In]
  fun ldap_value_freeA(vals : PSTR*) : UInt32

  # Params # vals : PSTR* [In]
  fun ldap_value_free(vals : PSTR*) : UInt32

  # Params # vals : LDAP_BERVAL** [In]
  fun ldap_value_free_len(vals : LDAP_BERVAL**) : UInt32

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In]
  fun ldap_get_dnW(ld : Ldap*, entry : LDAPMessage*) : LibC::LPWSTR

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In]
  fun ldap_get_dnA(ld : Ldap*, entry : LDAPMessage*) : PSTR

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In]
  fun ldap_get_dn(ld : Ldap*, entry : LDAPMessage*) : PSTR

  # Params # dn : LibC::LPWSTR [In],notypes : UInt32 [In]
  fun ldap_explode_dnW(dn : LibC::LPWSTR, notypes : UInt32) : LibC::LPWSTR*

  # Params # dn : PSTR [In],notypes : UInt32 [In]
  fun ldap_explode_dnA(dn : PSTR, notypes : UInt32) : PSTR*

  # Params # dn : PSTR [In],notypes : UInt32 [In]
  fun ldap_explode_dn(dn : PSTR, notypes : UInt32) : PSTR*

  # Params # dn : LibC::LPWSTR [In]
  fun ldap_dn2ufnW(dn : LibC::LPWSTR) : LibC::LPWSTR

  # Params # dn : PSTR [In]
  fun ldap_dn2ufnA(dn : PSTR) : PSTR

  # Params # dn : PSTR [In]
  fun ldap_dn2ufn(dn : PSTR) : PSTR

  # Params # block : LibC::LPWSTR [In]
  fun ldap_memfreeW(block : LibC::LPWSTR) : Void

  # Params # block : PSTR [In]
  fun ldap_memfreeA(block : PSTR) : Void

  # Params # bv : LDAP_BERVAL* [In]
  fun ber_bvfree(bv : LDAP_BERVAL*) : Void

  # Params # block : PSTR [In]
  fun ldap_memfree(block : PSTR) : Void

  # Params # ufn : LibC::LPWSTR [In],pdn : LibC::LPWSTR* [In]
  fun ldap_ufn2dnW(ufn : LibC::LPWSTR, pdn : LibC::LPWSTR*) : UInt32

  # Params # ufn : PSTR [In],pdn : PSTR* [In]
  fun ldap_ufn2dnA(ufn : PSTR, pdn : PSTR*) : UInt32

  # Params # ufn : PSTR [In],pdn : PSTR* [In]
  fun ldap_ufn2dn(ufn : PSTR, pdn : PSTR*) : UInt32

  # Params # version : Ldap_version_info* [In],instance : LibC::HANDLE* [In]
  fun ldap_startup(version : Ldap_version_info*, instance : LibC::HANDLE*) : UInt32

  # Params # hinstance : LibC::HANDLE [In]
  fun ldap_cleanup(hinstance : LibC::HANDLE) : UInt32

  # Params # sourcefilterelement : PSTR [In],sourcelength : UInt32 [In],destfilterelement : LibC::LPWSTR [In],destlength : UInt32 [In]
  fun ldap_escape_filter_elementW(sourcefilterelement : PSTR, sourcelength : UInt32, destfilterelement : LibC::LPWSTR, destlength : UInt32) : UInt32

  # Params # sourcefilterelement : PSTR [In],sourcelength : UInt32 [In],destfilterelement : PSTR [In],destlength : UInt32 [In]
  fun ldap_escape_filter_elementA(sourcefilterelement : PSTR, sourcelength : UInt32, destfilterelement : PSTR, destlength : UInt32) : UInt32

  # Params # sourcefilterelement : PSTR [In],sourcelength : UInt32 [In],destfilterelement : PSTR [In],destlength : UInt32 [In]
  fun ldap_escape_filter_element(sourcefilterelement : PSTR, sourcelength : UInt32, destfilterelement : PSTR, destlength : UInt32) : UInt32

  # Params # newflags : UInt32 [In]
  fun ldap_set_dbg_flags(newflags : UInt32) : UInt32

  # Params # debugprintroutine : DBGPRINT [In]
  fun ldap_set_dbg_routine(debugprintroutine : DBGPRINT) : Void

  # Params # lpsrcstr : UInt8* [In],cchsrc : Int32 [In],lpdeststr : Char* [In],cchdest : Int32 [In]
  fun LdapUTF8ToUnicode(lpsrcstr : UInt8*, cchsrc : Int32, lpdeststr : Char*, cchdest : Int32) : Int32

  # Params # lpsrcstr : Char* [In],cchsrc : Int32 [In],lpdeststr : UInt8* [In],cchdest : Int32 [In]
  fun LdapUnicodeToUTF8(lpsrcstr : Char*, cchsrc : Int32, lpdeststr : UInt8*, cchdest : Int32) : Int32

  # Params # externalhandle : Ldap* [In],sortkeys : Ldapsortkeya** [In],iscritical : UInt8 [In],control : Ldapcontrola** [In]
  fun ldap_create_sort_controlA(externalhandle : Ldap*, sortkeys : Ldapsortkeya**, iscritical : UInt8, control : Ldapcontrola**) : UInt32

  # Params # externalhandle : Ldap* [In],sortkeys : Ldapsortkeyw** [In],iscritical : UInt8 [In],control : Ldapcontrolw** [In]
  fun ldap_create_sort_controlW(externalhandle : Ldap*, sortkeys : Ldapsortkeyw**, iscritical : UInt8, control : Ldapcontrolw**) : UInt32

  # Params # externalhandle : Ldap* [In],control : Ldapcontrola** [In],result : UInt32* [In],attribute : PSTR* [In]
  fun ldap_parse_sort_controlA(externalhandle : Ldap*, control : Ldapcontrola**, result : UInt32*, attribute : PSTR*) : UInt32

  # Params # externalhandle : Ldap* [In],control : Ldapcontrolw** [In],result : UInt32* [In],attribute : LibC::LPWSTR* [In]
  fun ldap_parse_sort_controlW(externalhandle : Ldap*, control : Ldapcontrolw**, result : UInt32*, attribute : LibC::LPWSTR*) : UInt32

  # Params # externalhandle : Ldap* [In],sortkeys : Ldapsortkeya** [In],iscritical : UInt8 [In],control : Ldapcontrola** [In]
  fun ldap_create_sort_control(externalhandle : Ldap*, sortkeys : Ldapsortkeya**, iscritical : UInt8, control : Ldapcontrola**) : UInt32

  # Params # externalhandle : Ldap* [In],control : Ldapcontrola** [In],result : UInt32* [In],attribute : PSTR* [In]
  fun ldap_parse_sort_control(externalhandle : Ldap*, control : Ldapcontrola**, result : UInt32*, attribute : PSTR*) : UInt32

  # Params # externalhandle : Ldap* [In],sortkeys : Ldapsortkeyw** [In],control : Ldapcontrolw* [In],criticality : BOOLEAN [In]
  fun ldap_encode_sort_controlW(externalhandle : Ldap*, sortkeys : Ldapsortkeyw**, control : Ldapcontrolw*, criticality : BOOLEAN) : UInt32

  # Params # externalhandle : Ldap* [In],sortkeys : Ldapsortkeya** [In],control : Ldapcontrola* [In],criticality : BOOLEAN [In]
  fun ldap_encode_sort_controlA(externalhandle : Ldap*, sortkeys : Ldapsortkeya**, control : Ldapcontrola*, criticality : BOOLEAN) : UInt32

  # Params # externalhandle : Ldap* [In],pagesize : UInt32 [In],cookie : LDAP_BERVAL* [In],iscritical : UInt8 [In],control : Ldapcontrolw** [In]
  fun ldap_create_page_controlW(externalhandle : Ldap*, pagesize : UInt32, cookie : LDAP_BERVAL*, iscritical : UInt8, control : Ldapcontrolw**) : UInt32

  # Params # externalhandle : Ldap* [In],pagesize : UInt32 [In],cookie : LDAP_BERVAL* [In],iscritical : UInt8 [In],control : Ldapcontrola** [In]
  fun ldap_create_page_controlA(externalhandle : Ldap*, pagesize : UInt32, cookie : LDAP_BERVAL*, iscritical : UInt8, control : Ldapcontrola**) : UInt32

  # Params # externalhandle : Ldap* [In],servercontrols : Ldapcontrolw** [In],totalcount : UInt32* [In],cookie : LDAP_BERVAL** [In]
  fun ldap_parse_page_controlW(externalhandle : Ldap*, servercontrols : Ldapcontrolw**, totalcount : UInt32*, cookie : LDAP_BERVAL**) : UInt32

  # Params # externalhandle : Ldap* [In],servercontrols : Ldapcontrola** [In],totalcount : UInt32* [In],cookie : LDAP_BERVAL** [In]
  fun ldap_parse_page_controlA(externalhandle : Ldap*, servercontrols : Ldapcontrola**, totalcount : UInt32*, cookie : LDAP_BERVAL**) : UInt32

  # Params # externalhandle : Ldap* [In],pagesize : UInt32 [In],cookie : LDAP_BERVAL* [In],iscritical : UInt8 [In],control : Ldapcontrola** [In]
  fun ldap_create_page_control(externalhandle : Ldap*, pagesize : UInt32, cookie : LDAP_BERVAL*, iscritical : UInt8, control : Ldapcontrola**) : UInt32

  # Params # externalhandle : Ldap* [In],servercontrols : Ldapcontrola** [In],totalcount : UInt32* [In],cookie : LDAP_BERVAL** [In]
  fun ldap_parse_page_control(externalhandle : Ldap*, servercontrols : Ldapcontrola**, totalcount : UInt32*, cookie : LDAP_BERVAL**) : UInt32

  # Params # externalhandle : Ldap* [In],distinguishedname : LibC::LPWSTR [In],scopeofsearch : UInt32 [In],searchfilter : LibC::LPWSTR [In],attributelist : UInt16** [In],attributesonly : UInt32 [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],pagetimelimit : UInt32 [In],totalsizelimit : UInt32 [In],sortkeys : Ldapsortkeyw** [In]
  fun ldap_search_init_pageW(externalhandle : Ldap*, distinguishedname : LibC::LPWSTR, scopeofsearch : UInt32, searchfilter : LibC::LPWSTR, attributelist : UInt16**, attributesonly : UInt32, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, pagetimelimit : UInt32, totalsizelimit : UInt32, sortkeys : Ldapsortkeyw**) : Ldapsearch*

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],scopeofsearch : UInt32 [In],searchfilter : PSTR [In],attributelist : Int8** [In],attributesonly : UInt32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],pagetimelimit : UInt32 [In],totalsizelimit : UInt32 [In],sortkeys : Ldapsortkeya** [In]
  fun ldap_search_init_pageA(externalhandle : Ldap*, distinguishedname : PSTR, scopeofsearch : UInt32, searchfilter : PSTR, attributelist : Int8**, attributesonly : UInt32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, pagetimelimit : UInt32, totalsizelimit : UInt32, sortkeys : Ldapsortkeya**) : Ldapsearch*

  # Params # externalhandle : Ldap* [In],distinguishedname : PSTR [In],scopeofsearch : UInt32 [In],searchfilter : PSTR [In],attributelist : Int8** [In],attributesonly : UInt32 [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],pagetimelimit : UInt32 [In],totalsizelimit : UInt32 [In],sortkeys : Ldapsortkeya** [In]
  fun ldap_search_init_page(externalhandle : Ldap*, distinguishedname : PSTR, scopeofsearch : UInt32, searchfilter : PSTR, attributelist : Int8**, attributesonly : UInt32, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, pagetimelimit : UInt32, totalsizelimit : UInt32, sortkeys : Ldapsortkeya**) : Ldapsearch*

  # Params # externalhandle : Ldap* [In],searchhandle : Ldapsearch* [In],pagesize : UInt32 [In],messagenumber : UInt32* [In]
  fun ldap_get_next_page(externalhandle : Ldap*, searchhandle : Ldapsearch*, pagesize : UInt32, messagenumber : UInt32*) : UInt32

  # Params # externalhandle : Ldap* [In],searchhandle : Ldapsearch* [In],timeout : LDAP_TIMEVAL* [In],pagesize : UInt32 [In],totalcount : UInt32* [In],results : LDAPMessage** [In]
  fun ldap_get_next_page_s(externalhandle : Ldap*, searchhandle : Ldapsearch*, timeout : LDAP_TIMEVAL*, pagesize : UInt32, totalcount : UInt32*, results : LDAPMessage**) : UInt32

  # Params # externalhandle : Ldap* [In],searchblock : Ldapsearch* [In],totalcount : UInt32* [In],results : LDAPMessage* [In]
  fun ldap_get_paged_count(externalhandle : Ldap*, searchblock : Ldapsearch*, totalcount : UInt32*, results : LDAPMessage*) : UInt32

  # Params # externalhandle : Ldap* [In],searchblock : Ldapsearch* [In]
  fun ldap_search_abandon_page(externalhandle : Ldap*, searchblock : Ldapsearch*) : UInt32

  # Params # externalhandle : Ldap* [In],vlvinfo : Ldapvlvinfo* [In],iscritical : UInt8 [In],control : Ldapcontrolw** [In]
  fun ldap_create_vlv_controlW(externalhandle : Ldap*, vlvinfo : Ldapvlvinfo*, iscritical : UInt8, control : Ldapcontrolw**) : Int32

  # Params # externalhandle : Ldap* [In],vlvinfo : Ldapvlvinfo* [In],iscritical : UInt8 [In],control : Ldapcontrola** [In]
  fun ldap_create_vlv_controlA(externalhandle : Ldap*, vlvinfo : Ldapvlvinfo*, iscritical : UInt8, control : Ldapcontrola**) : Int32

  # Params # externalhandle : Ldap* [In],control : Ldapcontrolw** [In],targetpos : UInt32* [In],listcount : UInt32* [In],context : LDAP_BERVAL** [In],errcode : Int32* [In]
  fun ldap_parse_vlv_controlW(externalhandle : Ldap*, control : Ldapcontrolw**, targetpos : UInt32*, listcount : UInt32*, context : LDAP_BERVAL**, errcode : Int32*) : Int32

  # Params # externalhandle : Ldap* [In],control : Ldapcontrola** [In],targetpos : UInt32* [In],listcount : UInt32* [In],context : LDAP_BERVAL** [In],errcode : Int32* [In]
  fun ldap_parse_vlv_controlA(externalhandle : Ldap*, control : Ldapcontrola**, targetpos : UInt32*, listcount : UInt32*, context : LDAP_BERVAL**, errcode : Int32*) : Int32

  # Params # externalhandle : Ldap* [In],serverreturnvalue : UInt32* [In],result : LDAPMessage** [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In]
  fun ldap_start_tls_sW(externalhandle : Ldap*, serverreturnvalue : UInt32*, result : LDAPMessage**, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**) : UInt32

  # Params # externalhandle : Ldap* [In],serverreturnvalue : UInt32* [In],result : LDAPMessage** [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In]
  fun ldap_start_tls_sA(externalhandle : Ldap*, serverreturnvalue : UInt32*, result : LDAPMessage**, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**) : UInt32

  # Params # externalhandle : Ldap* [In]
  fun ldap_stop_tls_s(externalhandle : Ldap*) : BOOLEAN

  # Params # ld : Ldap* [In],res : LDAPMessage* [In]
  fun ldap_first_reference(ld : Ldap*, res : LDAPMessage*) : LDAPMessage*

  # Params # ld : Ldap* [In],entry : LDAPMessage* [In]
  fun ldap_next_reference(ld : Ldap*, entry : LDAPMessage*) : LDAPMessage*

  # Params # ld : Ldap* [In],res : LDAPMessage* [In]
  fun ldap_count_references(ld : Ldap*, res : LDAPMessage*) : UInt32

  # Params # connection : Ldap* [In],resultmessage : LDAPMessage* [In],referrals : LibC::LPWSTR** [In]
  fun ldap_parse_referenceW(connection : Ldap*, resultmessage : LDAPMessage*, referrals : LibC::LPWSTR**) : UInt32

  # Params # connection : Ldap* [In],resultmessage : LDAPMessage* [In],referrals : PSTR** [In]
  fun ldap_parse_referenceA(connection : Ldap*, resultmessage : LDAPMessage*, referrals : PSTR**) : UInt32

  # Params # connection : Ldap* [In],resultmessage : LDAPMessage* [In],referrals : PSTR** [In]
  fun ldap_parse_reference(connection : Ldap*, resultmessage : LDAPMessage*, referrals : PSTR**) : UInt32

  # Params # ld : Ldap* [In],oid : LibC::LPWSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],messagenumber : UInt32* [In]
  fun ldap_extended_operationW(ld : Ldap*, oid : LibC::LPWSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],oid : PSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_extended_operationA(ld : Ldap*, oid : PSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # externalhandle : Ldap* [In],oid : PSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],returnedoid : PSTR* [In],returneddata : LDAP_BERVAL** [In]
  fun ldap_extended_operation_sA(externalhandle : Ldap*, oid : PSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, returnedoid : PSTR*, returneddata : LDAP_BERVAL**) : UInt32

  # Params # externalhandle : Ldap* [In],oid : LibC::LPWSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrolw** [In],clientcontrols : Ldapcontrolw** [In],returnedoid : LibC::LPWSTR* [In],returneddata : LDAP_BERVAL** [In]
  fun ldap_extended_operation_sW(externalhandle : Ldap*, oid : LibC::LPWSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrolw**, clientcontrols : Ldapcontrolw**, returnedoid : LibC::LPWSTR*, returneddata : LDAP_BERVAL**) : UInt32

  # Params # ld : Ldap* [In],oid : PSTR [In],data : LDAP_BERVAL* [In],servercontrols : Ldapcontrola** [In],clientcontrols : Ldapcontrola** [In],messagenumber : UInt32* [In]
  fun ldap_extended_operation(ld : Ldap*, oid : PSTR, data : LDAP_BERVAL*, servercontrols : Ldapcontrola**, clientcontrols : Ldapcontrola**, messagenumber : UInt32*) : UInt32

  # Params # ld : Ldap* [In],messagenumber : UInt32 [In]
  fun ldap_close_extended_op(ld : Ldap*, messagenumber : UInt32) : UInt32

  # Params # 
  fun LdapGetLastError : UInt32

  # Params # ldaperror : UInt32 [In]
  fun LdapMapErrorToWin32(ldaperror : UInt32) : UInt32

  # Params # primaryconn : Ldap* [In],res : LDAPMessage* [In]
  fun ldap_conn_from_msg(primaryconn : Ldap*, res : LDAPMessage*) : Ldap*

  # Params # pberval : LDAP_BERVAL* [In]
  fun ber_init(pberval : LDAP_BERVAL*) : Berelement*

  # Params # pberelement : Berelement* [In],fbuf : Int32 [In]
  fun ber_free(pberelement : Berelement*, fbuf : Int32) : Void

  # Params # pberval : LDAP_BERVAL** [In]
  fun ber_bvecfree(pberval : LDAP_BERVAL**) : Void

  # Params # pberval : LDAP_BERVAL* [In]
  fun ber_bvdup(pberval : LDAP_BERVAL*) : LDAP_BERVAL*

  # Params # options : Int32 [In]
  fun ber_alloc_t(options : Int32) : Berelement*

  # Params # pberelement : Berelement* [In],plen : UInt32* [In]
  fun ber_skip_tag(pberelement : Berelement*, plen : UInt32*) : UInt32

  # Params # pberelement : Berelement* [In],plen : UInt32* [In]
  fun ber_peek_tag(pberelement : Berelement*, plen : UInt32*) : UInt32

  # Params # pberelement : Berelement* [In],plen : UInt32* [In],ppopaque : CHAR** [In]
  fun ber_first_element(pberelement : Berelement*, plen : UInt32*, ppopaque : CHAR**) : UInt32

  # Params # pberelement : Berelement* [In],plen : UInt32* [In],opaque : PSTR [In]
  fun ber_next_element(pberelement : Berelement*, plen : UInt32*, opaque : PSTR) : UInt32

  # Params # pberelement : Berelement* [In],pberval : LDAP_BERVAL** [In]
  fun ber_flatten(pberelement : Berelement*, pberval : LDAP_BERVAL**) : Int32

  # Params # pberelement : Berelement* [In],fmt : PSTR [In]
  fun ber_printf(pberelement : Berelement*, fmt : PSTR) : Int32

  # Params # pberelement : Berelement* [In],fmt : PSTR [In]
  fun ber_scanf(pberelement : Berelement*, fmt : PSTR) : UInt32
end
