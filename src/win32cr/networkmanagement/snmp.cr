require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:snmpapi.dll")]
@[Link(ldflags: "/DELAYLOAD:mgmtapi.dll")]
@[Link(ldflags: "/DELAYLOAD:wsnmp32.dll")]
{% else %}
@[Link("snmpapi")]
@[Link("mgmtapi")]
@[Link("wsnmp32")]
{% end %}
lib LibWin32
  ASN_UNIVERSAL = 0_u32
  ASN_APPLICATION = 64_u32
  ASN_CONTEXT = 128_u32
  ASN_PRIVATE = 192_u32
  ASN_PRIMITIVE = 0_u32
  ASN_CONSTRUCTOR = 32_u32
  SNMP_ACCESS_NONE = 0_u32
  SNMP_ACCESS_NOTIFY = 1_u32
  SNMP_ACCESS_READ_ONLY = 2_u32
  SNMP_ACCESS_READ_WRITE = 3_u32
  SNMP_ACCESS_READ_CREATE = 4_u32
  SNMPAPI_NOERROR = 1_u32
  SNMPAPI_ERROR = 0_u32
  SNMP_OUTPUT_TO_EVENTLOG = 4_u32
  DEFAULT_SNMP_PORT_UDP = 161_u32
  DEFAULT_SNMP_PORT_IPX = 36879_u32
  DEFAULT_SNMPTRAP_PORT_UDP = 162_u32
  DEFAULT_SNMPTRAP_PORT_IPX = 36880_u32
  SNMP_MAX_OID_LEN = 128_u32
  SNMP_MEM_ALLOC_ERROR = 1_u32
  SNMP_BERAPI_INVALID_LENGTH = 10_u32
  SNMP_BERAPI_INVALID_TAG = 11_u32
  SNMP_BERAPI_OVERFLOW = 12_u32
  SNMP_BERAPI_SHORT_BUFFER = 13_u32
  SNMP_BERAPI_INVALID_OBJELEM = 14_u32
  SNMP_PDUAPI_UNRECOGNIZED_PDU = 20_u32
  SNMP_PDUAPI_INVALID_ES = 21_u32
  SNMP_PDUAPI_INVALID_GT = 22_u32
  SNMP_AUTHAPI_INVALID_VERSION = 30_u32
  SNMP_AUTHAPI_INVALID_MSG_TYPE = 31_u32
  SNMP_AUTHAPI_TRIV_AUTH_FAILED = 32_u32
  ASN_CONTEXTSPECIFIC = 128_u32
  ASN_PRIMATIVE = 0_u32
  SNMP_MGMTAPI_TIMEOUT = 40_u32
  SNMP_MGMTAPI_SELECT_FDERRORS = 41_u32
  SNMP_MGMTAPI_TRAP_ERRORS = 42_u32
  SNMP_MGMTAPI_TRAP_DUPINIT = 43_u32
  SNMP_MGMTAPI_NOTRAPS = 44_u32
  SNMP_MGMTAPI_AGAIN = 45_u32
  SNMP_MGMTAPI_INVALID_CTL = 46_u32
  SNMP_MGMTAPI_INVALID_SESSION = 47_u32
  SNMP_MGMTAPI_INVALID_BUFFER = 48_u32
  MGMCTL_SETAGENTPORT = 1_u32
  MAXOBJIDSIZE = 128_u32
  MAXOBJIDSTRSIZE = 1408_u32
  SNMPLISTEN_USEENTITY_ADDR = 0_u32
  SNMPLISTEN_ALL_ADDR = 1_u32
  SNMP_TRAP_COLDSTART = 0_u32
  SNMP_TRAP_WARMSTART = 1_u32
  SNMP_TRAP_LINKDOWN = 2_u32
  SNMP_TRAP_LINKUP = 3_u32
  SNMP_TRAP_AUTHFAIL = 4_u32
  SNMP_TRAP_EGPNEIGHBORLOSS = 5_u32
  SNMP_TRAP_ENTERPRISESPECIFIC = 6_u32
  SNMPAPI_NO_SUPPORT = 0_u32
  SNMPAPI_V1_SUPPORT = 1_u32
  SNMPAPI_V2_SUPPORT = 2_u32
  SNMPAPI_M2M_SUPPORT = 3_u32
  SNMPAPI_FAILURE = 0_u32
  SNMPAPI_SUCCESS = 1_u32
  SNMPAPI_ALLOC_ERROR = 2_u32
  SNMPAPI_CONTEXT_INVALID = 3_u32
  SNMPAPI_CONTEXT_UNKNOWN = 4_u32
  SNMPAPI_ENTITY_INVALID = 5_u32
  SNMPAPI_ENTITY_UNKNOWN = 6_u32
  SNMPAPI_INDEX_INVALID = 7_u32
  SNMPAPI_NOOP = 8_u32
  SNMPAPI_OID_INVALID = 9_u32
  SNMPAPI_OPERATION_INVALID = 10_u32
  SNMPAPI_OUTPUT_TRUNCATED = 11_u32
  SNMPAPI_PDU_INVALID = 12_u32
  SNMPAPI_SESSION_INVALID = 13_u32
  SNMPAPI_SYNTAX_INVALID = 14_u32
  SNMPAPI_VBL_INVALID = 15_u32
  SNMPAPI_MODE_INVALID = 16_u32
  SNMPAPI_SIZE_INVALID = 17_u32
  SNMPAPI_NOT_INITIALIZED = 18_u32
  SNMPAPI_MESSAGE_INVALID = 19_u32
  SNMPAPI_HWND_INVALID = 20_u32
  SNMPAPI_OTHER_ERROR = 99_u32
  SNMPAPI_TL_NOT_INITIALIZED = 100_u32
  SNMPAPI_TL_NOT_SUPPORTED = 101_u32
  SNMPAPI_TL_NOT_AVAILABLE = 102_u32
  SNMPAPI_TL_RESOURCE_ERROR = 103_u32
  SNMPAPI_TL_UNDELIVERABLE = 104_u32
  SNMPAPI_TL_SRC_INVALID = 105_u32
  SNMPAPI_TL_INVALID_PARAM = 106_u32
  SNMPAPI_TL_IN_USE = 107_u32
  SNMPAPI_TL_TIMEOUT = 108_u32
  SNMPAPI_TL_PDU_TOO_BIG = 109_u32
  SNMPAPI_TL_OTHER = 199_u32
  MAXVENDORINFO = 32_u32

  alias PFNSNMPEXTENSIONINIT = Proc(UInt32, LibC::HANDLE*, AsnObjectIdentifier*, LibC::BOOL)
  alias PFNSNMPEXTENSIONINITEX = Proc(AsnObjectIdentifier*, LibC::BOOL)
  alias PFNSNMPEXTENSIONMONITOR = Proc(Void*, LibC::BOOL)
  alias PFNSNMPEXTENSIONQUERY = Proc(UInt8, SnmpVarBindList*, Int32*, Int32*, LibC::BOOL)
  alias PFNSNMPEXTENSIONQUERYEX = Proc(UInt32, UInt32, SnmpVarBindList*, AsnOctetString*, Int32*, Int32*, LibC::BOOL)
  alias PFNSNMPEXTENSIONTRAP = Proc(AsnObjectIdentifier*, Int32*, Int32*, UInt32*, SnmpVarBindList*, LibC::BOOL)
  alias PFNSNMPEXTENSIONCLOSE = Proc(Void)
  alias SNMPAPI_CALLBACK = Proc(LibC::IntPtrT, LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, Void*, UInt32)
  alias PFNSNMPSTARTUPEX = Proc(UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, UInt32)
  alias PFNSNMPCLEANUPEX = Proc(UInt32)


  enum SNMP_PDU_TYPE : UInt32
    SNMP_PDU_GET = 160
    SNMP_PDU_GETNEXT = 161
    SNMP_PDU_RESPONSE = 162
    SNMP_PDU_SET = 163
    SNMP_PDU_GETBULK = 165
    SNMP_PDU_TRAP = 167
  end

  enum SNMP_EXTENSION_REQUEST_TYPE : UInt32
    SNMP_EXTENSION_GET = 160
    SNMP_EXTENSION_GET_NEXT = 161
    SNMP_EXTENSION_SET_TEST = 224
    SNMP_EXTENSION_SET_COMMIT = 163
    SNMP_EXTENSION_SET_UNDO = 225
    SNMP_EXTENSION_SET_CLEANUP = 226
  end

  enum SNMP_API_TRANSLATE_MODE : UInt32
    SNMPAPI_TRANSLATED = 0
    SNMPAPI_UNTRANSLATED_V1 = 1
    SNMPAPI_UNTRANSLATED_V2 = 2
  end

  enum SNMP_GENERICTRAP : UInt32
    SNMP_GENERICTRAP_COLDSTART = 0
    SNMP_GENERICTRAP_WARMSTART = 1
    SNMP_GENERICTRAP_LINKDOWN = 2
    SNMP_GENERICTRAP_LINKUP = 3
    SNMP_GENERICTRAP_AUTHFAILURE = 4
    SNMP_GENERICTRAP_EGPNEIGHLOSS = 5
    SNMP_GENERICTRAP_ENTERSPECIFIC = 6
  end

  enum SNMP_ERROR_STATUS : UInt32
    SNMP_ERRORSTATUS_NOERROR = 0
    SNMP_ERRORSTATUS_TOOBIG = 1
    SNMP_ERRORSTATUS_NOSUCHNAME = 2
    SNMP_ERRORSTATUS_BADVALUE = 3
    SNMP_ERRORSTATUS_READONLY = 4
    SNMP_ERRORSTATUS_GENERR = 5
    SNMP_ERRORSTATUS_NOACCESS = 6
    SNMP_ERRORSTATUS_WRONGTYPE = 7
    SNMP_ERRORSTATUS_WRONGLENGTH = 8
    SNMP_ERRORSTATUS_WRONGENCODING = 9
    SNMP_ERRORSTATUS_WRONGVALUE = 10
    SNMP_ERRORSTATUS_NOCREATION = 11
    SNMP_ERRORSTATUS_INCONSISTENTVALUE = 12
    SNMP_ERRORSTATUS_RESOURCEUNAVAILABLE = 13
    SNMP_ERRORSTATUS_COMMITFAILED = 14
    SNMP_ERRORSTATUS_UNDOFAILED = 15
    SNMP_ERRORSTATUS_AUTHORIZATIONERROR = 16
    SNMP_ERRORSTATUS_NOTWRITABLE = 17
    SNMP_ERRORSTATUS_INCONSISTENTNAME = 18
  end

  enum SNMP_STATUS : UInt32
    SNMPAPI_ON = 1
    SNMPAPI_OFF = 0
  end

  enum SNMP_OUTPUT_LOG_TYPE : UInt32
    SNMP_OUTPUT_TO_CONSOLE = 1
    SNMP_OUTPUT_TO_LOGFILE = 2
    SNMP_OUTPUT_TO_DEBUGGER = 8
  end

  enum SNMP_LOG : UInt32
    SNMP_LOG_SILENT = 0
    SNMP_LOG_FATAL = 1
    SNMP_LOG_ERROR = 2
    SNMP_LOG_WARNING = 3
    SNMP_LOG_TRACE = 4
    SNMP_LOG_VERBOSE = 5
  end

  enum SNMP_ERROR : UInt32
    SNMP_ERROR_NOERROR = 0
    SNMP_ERROR_TOOBIG = 1
    SNMP_ERROR_NOSUCHNAME = 2
    SNMP_ERROR_BADVALUE = 3
    SNMP_ERROR_READONLY = 4
    SNMP_ERROR_GENERR = 5
    SNMP_ERROR_NOACCESS = 6
    SNMP_ERROR_WRONGTYPE = 7
    SNMP_ERROR_WRONGLENGTH = 8
    SNMP_ERROR_WRONGENCODING = 9
    SNMP_ERROR_WRONGVALUE = 10
    SNMP_ERROR_NOCREATION = 11
    SNMP_ERROR_INCONSISTENTVALUE = 12
    SNMP_ERROR_RESOURCEUNAVAILABLE = 13
    SNMP_ERROR_COMMITFAILED = 14
    SNMP_ERROR_UNDOFAILED = 15
    SNMP_ERROR_AUTHORIZATIONERROR = 16
    SNMP_ERROR_NOTWRITABLE = 17
    SNMP_ERROR_INCONSISTENTNAME = 18
  end

  union AsnAny_asnValue_e__Union
    number : Int32
    unsigned32 : UInt32
    counter64 : ULARGE_INTEGER
    string : AsnOctetString
    bits : AsnOctetString
    object : AsnObjectIdentifier
    sequence : AsnOctetString
    address : AsnOctetString
    counter : UInt32
    gauge : UInt32
    ticks : UInt32
    arbitrary : AsnOctetString
  end
  union Smivalue_value_e__Union
    s_number : Int32
    u_number : UInt32
    h_number : Smicntr64
    string : Smioctets
    oid : Smioid
    empty : UInt8
  end

  struct AsnOctetString
    stream : UInt8*
    length : UInt32
    dynamic : LibC::BOOL
  end
  struct AsnObjectIdentifier
    id_length : UInt32
    ids : UInt32*
  end
  struct AsnAny
    asn_type : UInt8
    asn_value : AsnAny_asnValue_e__Union
  end
  struct SnmpVarBind
    name : AsnObjectIdentifier
    value : AsnAny
  end
  struct SnmpVarBindList
    list : SnmpVarBind*
    len : UInt32
  end
  struct Smioctets
    len : UInt32
    ptr : UInt8*
  end
  struct Smioid
    len : UInt32
    ptr : UInt32*
  end
  struct Smicntr64
    hipart : UInt32
    lopart : UInt32
  end
  struct Smivalue
    syntax : UInt32
    value : Smivalue_value_e__Union
  end
  struct Smivendorinfo
    vendor_name : CHAR[64]*
    vendor_contact : CHAR[64]*
    vendor_version_id : CHAR[32]*
    vendor_version_date : CHAR[32]*
    vendor_enterprise : UInt32
  end


  # Params # poiddst : AsnObjectIdentifier* [In],poidsrc : AsnObjectIdentifier* [In]
  fun SnmpUtilOidCpy(poiddst : AsnObjectIdentifier*, poidsrc : AsnObjectIdentifier*) : Int32

  # Params # poiddst : AsnObjectIdentifier* [In],poidsrc : AsnObjectIdentifier* [In]
  fun SnmpUtilOidAppend(poiddst : AsnObjectIdentifier*, poidsrc : AsnObjectIdentifier*) : Int32

  # Params # poid1 : AsnObjectIdentifier* [In],poid2 : AsnObjectIdentifier* [In],nsubids : UInt32 [In]
  fun SnmpUtilOidNCmp(poid1 : AsnObjectIdentifier*, poid2 : AsnObjectIdentifier*, nsubids : UInt32) : Int32

  # Params # poid1 : AsnObjectIdentifier* [In],poid2 : AsnObjectIdentifier* [In]
  fun SnmpUtilOidCmp(poid1 : AsnObjectIdentifier*, poid2 : AsnObjectIdentifier*) : Int32

  # Params # poid : AsnObjectIdentifier* [In]
  fun SnmpUtilOidFree(poid : AsnObjectIdentifier*)

  # Params # poctets1 : AsnOctetString* [In],poctets2 : AsnOctetString* [In]
  fun SnmpUtilOctetsCmp(poctets1 : AsnOctetString*, poctets2 : AsnOctetString*) : Int32

  # Params # poctets1 : AsnOctetString* [In],poctets2 : AsnOctetString* [In],nchars : UInt32 [In]
  fun SnmpUtilOctetsNCmp(poctets1 : AsnOctetString*, poctets2 : AsnOctetString*, nchars : UInt32) : Int32

  # Params # poctetsdst : AsnOctetString* [In],poctetssrc : AsnOctetString* [In]
  fun SnmpUtilOctetsCpy(poctetsdst : AsnOctetString*, poctetssrc : AsnOctetString*) : Int32

  # Params # poctets : AsnOctetString* [In]
  fun SnmpUtilOctetsFree(poctets : AsnOctetString*)

  # Params # panydst : AsnAny* [In],panysrc : AsnAny* [In]
  fun SnmpUtilAsnAnyCpy(panydst : AsnAny*, panysrc : AsnAny*) : Int32

  # Params # pany : AsnAny* [In]
  fun SnmpUtilAsnAnyFree(pany : AsnAny*)

  # Params # pvbdst : SnmpVarBind* [In],pvbsrc : SnmpVarBind* [In]
  fun SnmpUtilVarBindCpy(pvbdst : SnmpVarBind*, pvbsrc : SnmpVarBind*) : Int32

  # Params # pvb : SnmpVarBind* [In]
  fun SnmpUtilVarBindFree(pvb : SnmpVarBind*)

  # Params # pvbldst : SnmpVarBindList* [In],pvblsrc : SnmpVarBindList* [In]
  fun SnmpUtilVarBindListCpy(pvbldst : SnmpVarBindList*, pvblsrc : SnmpVarBindList*) : Int32

  # Params # pvbl : SnmpVarBindList* [In]
  fun SnmpUtilVarBindListFree(pvbl : SnmpVarBindList*)

  # Params # pmem : Void* [In]
  fun SnmpUtilMemFree(pmem : Void*)

  # Params # nbytes : UInt32 [In]
  fun SnmpUtilMemAlloc(nbytes : UInt32) : Void*

  # Params # pmem : Void* [In],nbytes : UInt32 [In]
  fun SnmpUtilMemReAlloc(pmem : Void*, nbytes : UInt32) : Void*

  # Params # oid : AsnObjectIdentifier* [In]
  fun SnmpUtilOidToA(oid : AsnObjectIdentifier*) : PSTR

  # Params # ids : UInt32* [In],idlength : UInt32 [In]
  fun SnmpUtilIdsToA(ids : UInt32*, idlength : UInt32) : PSTR

  # Params # oid : AsnObjectIdentifier* [In]
  fun SnmpUtilPrintOid(oid : AsnObjectIdentifier*)

  # Params # pany : AsnAny* [In]
  fun SnmpUtilPrintAsnAny(pany : AsnAny*)

  # Params # 
  fun SnmpSvcGetUptime : UInt32

  # Params # nloglevel : SNMP_LOG [In]
  fun SnmpSvcSetLogLevel(nloglevel : SNMP_LOG)

  # Params # nlogtype : SNMP_OUTPUT_LOG_TYPE [In]
  fun SnmpSvcSetLogType(nlogtype : SNMP_OUTPUT_LOG_TYPE)

  # Params # nloglevel : SNMP_LOG [In],szformat : PSTR [In]
  fun SnmpUtilDbgPrint(nloglevel : SNMP_LOG, szformat : PSTR)

  # Params # lpagentaddress : PSTR [In],lpagentcommunity : PSTR [In],ntimeout : Int32 [In],nretries : Int32 [In]
  fun SnmpMgrOpen(lpagentaddress : PSTR, lpagentcommunity : PSTR, ntimeout : Int32, nretries : Int32) : Void*

  # Params # session : Void* [In],dwctlcode : UInt32 [In],lpvinbuffer : Void* [In],cbinbuffer : UInt32 [In],lpvoutbuffer : Void* [In],cboutbuffer : UInt32 [In],lpcbbytesreturned : UInt32* [In]
  fun SnmpMgrCtl(session : Void*, dwctlcode : UInt32, lpvinbuffer : Void*, cbinbuffer : UInt32, lpvoutbuffer : Void*, cboutbuffer : UInt32, lpcbbytesreturned : UInt32*) : LibC::BOOL

  # Params # session : Void* [In]
  fun SnmpMgrClose(session : Void*) : LibC::BOOL

  # Params # session : Void* [In],requesttype : UInt8 [In],variablebindings : SnmpVarBindList* [In],errorstatus : SNMP_ERROR_STATUS* [In],errorindex : Int32* [In]
  fun SnmpMgrRequest(session : Void*, requesttype : UInt8, variablebindings : SnmpVarBindList*, errorstatus : SNMP_ERROR_STATUS*, errorindex : Int32*) : Int32

  # Params # string : PSTR [In],oid : AsnObjectIdentifier* [In]
  fun SnmpMgrStrToOid(string : PSTR, oid : AsnObjectIdentifier*) : LibC::BOOL

  # Params # oid : AsnObjectIdentifier* [In],string : PSTR* [In]
  fun SnmpMgrOidToStr(oid : AsnObjectIdentifier*, string : PSTR*) : LibC::BOOL

  # Params # phtrapavailable : LibC::HANDLE* [In]
  fun SnmpMgrTrapListen(phtrapavailable : LibC::HANDLE*) : LibC::BOOL

  # Params # enterprise : AsnObjectIdentifier* [In],ipaddress : AsnOctetString* [In],generictrap : SNMP_GENERICTRAP* [In],specifictrap : Int32* [In],timestamp : UInt32* [In],variablebindings : SnmpVarBindList* [In]
  fun SnmpMgrGetTrap(enterprise : AsnObjectIdentifier*, ipaddress : AsnOctetString*, generictrap : SNMP_GENERICTRAP*, specifictrap : Int32*, timestamp : UInt32*, variablebindings : SnmpVarBindList*) : LibC::BOOL

  # Params # enterprise : AsnObjectIdentifier* [In],agentaddress : AsnOctetString* [In],sourceaddress : AsnOctetString* [In],generictrap : SNMP_GENERICTRAP* [In],specifictrap : Int32* [In],community : AsnOctetString* [In],timestamp : UInt32* [In],variablebindings : SnmpVarBindList* [In]
  fun SnmpMgrGetTrapEx(enterprise : AsnObjectIdentifier*, agentaddress : AsnOctetString*, sourceaddress : AsnOctetString*, generictrap : SNMP_GENERICTRAP*, specifictrap : Int32*, community : AsnOctetString*, timestamp : UInt32*, variablebindings : SnmpVarBindList*) : LibC::BOOL

  # Params # ntranslatemode : SNMP_API_TRANSLATE_MODE* [In]
  fun SnmpGetTranslateMode(ntranslatemode : SNMP_API_TRANSLATE_MODE*) : UInt32

  # Params # ntranslatemode : SNMP_API_TRANSLATE_MODE [In]
  fun SnmpSetTranslateMode(ntranslatemode : SNMP_API_TRANSLATE_MODE) : UInt32

  # Params # nretransmitmode : SNMP_STATUS* [In]
  fun SnmpGetRetransmitMode(nretransmitmode : SNMP_STATUS*) : UInt32

  # Params # nretransmitmode : SNMP_STATUS [In]
  fun SnmpSetRetransmitMode(nretransmitmode : SNMP_STATUS) : UInt32

  # Params # hentity : LibC::IntPtrT [In],npolicytimeout : UInt32* [In],nactualtimeout : UInt32* [In]
  fun SnmpGetTimeout(hentity : LibC::IntPtrT, npolicytimeout : UInt32*, nactualtimeout : UInt32*) : UInt32

  # Params # hentity : LibC::IntPtrT [In],npolicytimeout : UInt32 [In]
  fun SnmpSetTimeout(hentity : LibC::IntPtrT, npolicytimeout : UInt32) : UInt32

  # Params # hentity : LibC::IntPtrT [In],npolicyretry : UInt32* [In],nactualretry : UInt32* [In]
  fun SnmpGetRetry(hentity : LibC::IntPtrT, npolicyretry : UInt32*, nactualretry : UInt32*) : UInt32

  # Params # hentity : LibC::IntPtrT [In],npolicyretry : UInt32 [In]
  fun SnmpSetRetry(hentity : LibC::IntPtrT, npolicyretry : UInt32) : UInt32

  # Params # vendorinfo : Smivendorinfo* [In]
  fun SnmpGetVendorInfo(vendorinfo : Smivendorinfo*) : UInt32

  # Params # nmajorversion : UInt32* [In],nminorversion : UInt32* [In],nlevel : UInt32* [In],ntranslatemode : SNMP_API_TRANSLATE_MODE* [In],nretransmitmode : SNMP_STATUS* [In]
  fun SnmpStartup(nmajorversion : UInt32*, nminorversion : UInt32*, nlevel : UInt32*, ntranslatemode : SNMP_API_TRANSLATE_MODE*, nretransmitmode : SNMP_STATUS*) : UInt32

  # Params # 
  fun SnmpCleanup : UInt32

  # Params # hwnd : LibC::HANDLE [In],wmsg : UInt32 [In]
  fun SnmpOpen(hwnd : LibC::HANDLE, wmsg : UInt32) : LibC::IntPtrT

  # Params # session : LibC::IntPtrT [In]
  fun SnmpClose(session : LibC::IntPtrT) : UInt32

  # Params # session : LibC::IntPtrT [In],srcentity : LibC::IntPtrT [In],dstentity : LibC::IntPtrT [In],context : LibC::IntPtrT [In],pdu : LibC::IntPtrT [In]
  fun SnmpSendMsg(session : LibC::IntPtrT, srcentity : LibC::IntPtrT, dstentity : LibC::IntPtrT, context : LibC::IntPtrT, pdu : LibC::IntPtrT) : UInt32

  # Params # session : LibC::IntPtrT [In],srcentity : LibC::IntPtrT* [In],dstentity : LibC::IntPtrT* [In],context : LibC::IntPtrT* [In],pdu : LibC::IntPtrT* [In]
  fun SnmpRecvMsg(session : LibC::IntPtrT, srcentity : LibC::IntPtrT*, dstentity : LibC::IntPtrT*, context : LibC::IntPtrT*, pdu : LibC::IntPtrT*) : UInt32

  # Params # session : LibC::IntPtrT [In],srcentity : LibC::IntPtrT [In],dstentity : LibC::IntPtrT [In],context : LibC::IntPtrT [In],notification : Smioid* [In],state : SNMP_STATUS [In]
  fun SnmpRegister(session : LibC::IntPtrT, srcentity : LibC::IntPtrT, dstentity : LibC::IntPtrT, context : LibC::IntPtrT, notification : Smioid*, state : SNMP_STATUS) : UInt32

  # Params # hwnd : LibC::HANDLE [In],wmsg : UInt32 [In],fcallback : SNMPAPI_CALLBACK [In],lpclientdata : Void* [In]
  fun SnmpCreateSession(hwnd : LibC::HANDLE, wmsg : UInt32, fcallback : SNMPAPI_CALLBACK, lpclientdata : Void*) : LibC::IntPtrT

  # Params # hentity : LibC::IntPtrT [In],lstatus : SNMP_STATUS [In]
  fun SnmpListen(hentity : LibC::IntPtrT, lstatus : SNMP_STATUS) : UInt32

  # Params # hentity : LibC::IntPtrT [In],lstatus : UInt32 [In],nuseentityaddr : UInt32 [In]
  fun SnmpListenEx(hentity : LibC::IntPtrT, lstatus : UInt32, nuseentityaddr : UInt32) : UInt32

  # Params # session : LibC::IntPtrT [In],reqid : Int32 [In]
  fun SnmpCancelMsg(session : LibC::IntPtrT, reqid : Int32) : UInt32

  # Params # nmajorversion : UInt32* [In],nminorversion : UInt32* [In],nlevel : UInt32* [In],ntranslatemode : SNMP_API_TRANSLATE_MODE* [In],nretransmitmode : SNMP_STATUS* [In]
  fun SnmpStartupEx(nmajorversion : UInt32*, nminorversion : UInt32*, nlevel : UInt32*, ntranslatemode : SNMP_API_TRANSLATE_MODE*, nretransmitmode : SNMP_STATUS*) : UInt32

  # Params # 
  fun SnmpCleanupEx : UInt32

  # Params # session : LibC::IntPtrT [In],string : PSTR [In]
  fun SnmpStrToEntity(session : LibC::IntPtrT, string : PSTR) : LibC::IntPtrT

  # Params # entity : LibC::IntPtrT [In],size : UInt32 [In],string : UInt8* [In]
  fun SnmpEntityToStr(entity : LibC::IntPtrT, size : UInt32, string : UInt8*) : UInt32

  # Params # entity : LibC::IntPtrT [In]
  fun SnmpFreeEntity(entity : LibC::IntPtrT) : UInt32

  # Params # session : LibC::IntPtrT [In],string : Smioctets* [In]
  fun SnmpStrToContext(session : LibC::IntPtrT, string : Smioctets*) : LibC::IntPtrT

  # Params # context : LibC::IntPtrT [In],string : Smioctets* [In]
  fun SnmpContextToStr(context : LibC::IntPtrT, string : Smioctets*) : UInt32

  # Params # context : LibC::IntPtrT [In]
  fun SnmpFreeContext(context : LibC::IntPtrT) : UInt32

  # Params # hentity : LibC::IntPtrT [In],nport : UInt32 [In]
  fun SnmpSetPort(hentity : LibC::IntPtrT, nport : UInt32) : UInt32

  # Params # session : LibC::IntPtrT [In],pdu_type : SNMP_PDU_TYPE [In],request_id : Int32 [In],error_status : Int32 [In],error_index : Int32 [In],varbindlist : LibC::IntPtrT [In]
  fun SnmpCreatePdu(session : LibC::IntPtrT, pdu_type : SNMP_PDU_TYPE, request_id : Int32, error_status : Int32, error_index : Int32, varbindlist : LibC::IntPtrT) : LibC::IntPtrT

  # Params # pdu : LibC::IntPtrT [In],pdu_type : SNMP_PDU_TYPE* [In],request_id : Int32* [In],error_status : SNMP_ERROR* [In],error_index : Int32* [In],varbindlist : LibC::IntPtrT* [In]
  fun SnmpGetPduData(pdu : LibC::IntPtrT, pdu_type : SNMP_PDU_TYPE*, request_id : Int32*, error_status : SNMP_ERROR*, error_index : Int32*, varbindlist : LibC::IntPtrT*) : UInt32

  # Params # pdu : LibC::IntPtrT [In],pdu_type : Int32* [In],request_id : Int32* [In],non_repeaters : Int32* [In],max_repetitions : Int32* [In],varbindlist : LibC::IntPtrT* [In]
  fun SnmpSetPduData(pdu : LibC::IntPtrT, pdu_type : Int32*, request_id : Int32*, non_repeaters : Int32*, max_repetitions : Int32*, varbindlist : LibC::IntPtrT*) : UInt32

  # Params # session : LibC::IntPtrT [In],pdu : LibC::IntPtrT [In]
  fun SnmpDuplicatePdu(session : LibC::IntPtrT, pdu : LibC::IntPtrT) : LibC::IntPtrT

  # Params # pdu : LibC::IntPtrT [In]
  fun SnmpFreePdu(pdu : LibC::IntPtrT) : UInt32

  # Params # session : LibC::IntPtrT [In],name : Smioid* [In],value : Smivalue* [In]
  fun SnmpCreateVbl(session : LibC::IntPtrT, name : Smioid*, value : Smivalue*) : LibC::IntPtrT

  # Params # session : LibC::IntPtrT [In],vbl : LibC::IntPtrT [In]
  fun SnmpDuplicateVbl(session : LibC::IntPtrT, vbl : LibC::IntPtrT) : LibC::IntPtrT

  # Params # vbl : LibC::IntPtrT [In]
  fun SnmpFreeVbl(vbl : LibC::IntPtrT) : UInt32

  # Params # vbl : LibC::IntPtrT [In]
  fun SnmpCountVbl(vbl : LibC::IntPtrT) : UInt32

  # Params # vbl : LibC::IntPtrT [In],index : UInt32 [In],name : Smioid* [In],value : Smivalue* [In]
  fun SnmpGetVb(vbl : LibC::IntPtrT, index : UInt32, name : Smioid*, value : Smivalue*) : UInt32

  # Params # vbl : LibC::IntPtrT [In],index : UInt32 [In],name : Smioid* [In],value : Smivalue* [In]
  fun SnmpSetVb(vbl : LibC::IntPtrT, index : UInt32, name : Smioid*, value : Smivalue*) : UInt32

  # Params # vbl : LibC::IntPtrT [In],index : UInt32 [In]
  fun SnmpDeleteVb(vbl : LibC::IntPtrT, index : UInt32) : UInt32

  # Params # session : LibC::IntPtrT [In]
  fun SnmpGetLastError(session : LibC::IntPtrT) : UInt32

  # Params # string : PSTR [In],dstoid : Smioid* [In]
  fun SnmpStrToOid(string : PSTR, dstoid : Smioid*) : UInt32

  # Params # srcoid : Smioid* [In],size : UInt32 [In],string : UInt8* [In]
  fun SnmpOidToStr(srcoid : Smioid*, size : UInt32, string : UInt8*) : UInt32

  # Params # srcoid : Smioid* [In],dstoid : Smioid* [In]
  fun SnmpOidCopy(srcoid : Smioid*, dstoid : Smioid*) : UInt32

  # Params # xoid : Smioid* [In],yoid : Smioid* [In],maxlen : UInt32 [In],result : Int32* [In]
  fun SnmpOidCompare(xoid : Smioid*, yoid : Smioid*, maxlen : UInt32, result : Int32*) : UInt32

  # Params # session : LibC::IntPtrT [In],srcentity : LibC::IntPtrT [In],dstentity : LibC::IntPtrT [In],context : LibC::IntPtrT [In],pdu : LibC::IntPtrT [In],msgbufdesc : Smioctets* [In]
  fun SnmpEncodeMsg(session : LibC::IntPtrT, srcentity : LibC::IntPtrT, dstentity : LibC::IntPtrT, context : LibC::IntPtrT, pdu : LibC::IntPtrT, msgbufdesc : Smioctets*) : UInt32

  # Params # session : LibC::IntPtrT [In],srcentity : LibC::IntPtrT* [In],dstentity : LibC::IntPtrT* [In],context : LibC::IntPtrT* [In],pdu : LibC::IntPtrT* [In],msgbufdesc : Smioctets* [In]
  fun SnmpDecodeMsg(session : LibC::IntPtrT, srcentity : LibC::IntPtrT*, dstentity : LibC::IntPtrT*, context : LibC::IntPtrT*, pdu : LibC::IntPtrT*, msgbufdesc : Smioctets*) : UInt32

  # Params # syntax : UInt32 [In],descriptor : Smioctets* [In]
  fun SnmpFreeDescriptor(syntax : UInt32, descriptor : Smioctets*) : UInt32
end
