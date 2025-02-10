require "./../foundation.cr"

module Win32cr::NetworkManagement::Snmp
  extend self
  alias PFNSNMPEXTENSIONINIT = Proc(UInt32, Win32cr::Foundation::HANDLE*, Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, Win32cr::Foundation::BOOL)

  alias PFNSNMPEXTENSIONINITEX = Proc(Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, Win32cr::Foundation::BOOL)

  alias PFNSNMPEXTENSIONMONITOR = Proc(Void*, Win32cr::Foundation::BOOL)

  alias PFNSNMPEXTENSIONQUERY = Proc(UInt8, Win32cr::NetworkManagement::Snmp::SnmpVarBindList*, Int32*, Int32*, Win32cr::Foundation::BOOL)

  alias PFNSNMPEXTENSIONQUERYEX = Proc(UInt32, UInt32, Win32cr::NetworkManagement::Snmp::SnmpVarBindList*, Win32cr::NetworkManagement::Snmp::AsnOctetString*, Int32*, Int32*, Win32cr::Foundation::BOOL)

  alias PFNSNMPEXTENSIONTRAP = Proc(Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, Int32*, Int32*, UInt32*, Win32cr::NetworkManagement::Snmp::SnmpVarBindList*, Win32cr::Foundation::BOOL)

  alias PFNSNMPEXTENSIONCLOSE = Proc(Void)

  alias SNMPAPI_CALLBACK = Proc(LibC::IntPtrT, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Void*, UInt32)

  alias PFNSNMPSTARTUPEX = Proc(UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, UInt32)

  alias PFNSNMPCLEANUPEX = Proc(UInt32)

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

  enum SNMP_PDU_TYPE : UInt32
    SNMP_PDU_GET = 160_u32
    SNMP_PDU_GETNEXT = 161_u32
    SNMP_PDU_RESPONSE = 162_u32
    SNMP_PDU_SET = 163_u32
    SNMP_PDU_GETBULK = 165_u32
    SNMP_PDU_TRAP = 167_u32
  end
  enum SNMP_EXTENSION_REQUEST_TYPE : UInt32
    SNMP_EXTENSION_GET = 160_u32
    SNMP_EXTENSION_GET_NEXT = 161_u32
    SNMP_EXTENSION_SET_TEST = 224_u32
    SNMP_EXTENSION_SET_COMMIT = 163_u32
    SNMP_EXTENSION_SET_UNDO = 225_u32
    SNMP_EXTENSION_SET_CLEANUP = 226_u32
  end
  enum SNMP_API_TRANSLATE_MODE : UInt32
    SNMPAPI_TRANSLATED = 0_u32
    SNMPAPI_UNTRANSLATED_V1 = 1_u32
    SNMPAPI_UNTRANSLATED_V2 = 2_u32
  end
  enum SNMP_GENERICTRAP : UInt32
    SNMP_GENERICTRAP_COLDSTART = 0_u32
    SNMP_GENERICTRAP_WARMSTART = 1_u32
    SNMP_GENERICTRAP_LINKDOWN = 2_u32
    SNMP_GENERICTRAP_LINKUP = 3_u32
    SNMP_GENERICTRAP_AUTHFAILURE = 4_u32
    SNMP_GENERICTRAP_EGPNEIGHLOSS = 5_u32
    SNMP_GENERICTRAP_ENTERSPECIFIC = 6_u32
  end
  enum SNMP_ERROR_STATUS : UInt32
    SNMP_ERRORSTATUS_NOERROR = 0_u32
    SNMP_ERRORSTATUS_TOOBIG = 1_u32
    SNMP_ERRORSTATUS_NOSUCHNAME = 2_u32
    SNMP_ERRORSTATUS_BADVALUE = 3_u32
    SNMP_ERRORSTATUS_READONLY = 4_u32
    SNMP_ERRORSTATUS_GENERR = 5_u32
    SNMP_ERRORSTATUS_NOACCESS = 6_u32
    SNMP_ERRORSTATUS_WRONGTYPE = 7_u32
    SNMP_ERRORSTATUS_WRONGLENGTH = 8_u32
    SNMP_ERRORSTATUS_WRONGENCODING = 9_u32
    SNMP_ERRORSTATUS_WRONGVALUE = 10_u32
    SNMP_ERRORSTATUS_NOCREATION = 11_u32
    SNMP_ERRORSTATUS_INCONSISTENTVALUE = 12_u32
    SNMP_ERRORSTATUS_RESOURCEUNAVAILABLE = 13_u32
    SNMP_ERRORSTATUS_COMMITFAILED = 14_u32
    SNMP_ERRORSTATUS_UNDOFAILED = 15_u32
    SNMP_ERRORSTATUS_AUTHORIZATIONERROR = 16_u32
    SNMP_ERRORSTATUS_NOTWRITABLE = 17_u32
    SNMP_ERRORSTATUS_INCONSISTENTNAME = 18_u32
  end
  enum SNMP_STATUS : UInt32
    SNMPAPI_ON = 1_u32
    SNMPAPI_OFF = 0_u32
  end
  enum SNMP_OUTPUT_LOG_TYPE : UInt32
    SNMP_OUTPUT_TO_CONSOLE = 1_u32
    SNMP_OUTPUT_TO_LOGFILE = 2_u32
    SNMP_OUTPUT_TO_DEBUGGER = 8_u32
  end
  enum SNMP_LOG : UInt32
    SNMP_LOG_SILENT = 0_u32
    SNMP_LOG_FATAL = 1_u32
    SNMP_LOG_ERROR = 2_u32
    SNMP_LOG_WARNING = 3_u32
    SNMP_LOG_TRACE = 4_u32
    SNMP_LOG_VERBOSE = 5_u32
  end
  enum SNMP_ERROR : UInt32
    SNMP_ERROR_NOERROR = 0_u32
    SNMP_ERROR_TOOBIG = 1_u32
    SNMP_ERROR_NOSUCHNAME = 2_u32
    SNMP_ERROR_BADVALUE = 3_u32
    SNMP_ERROR_READONLY = 4_u32
    SNMP_ERROR_GENERR = 5_u32
    SNMP_ERROR_NOACCESS = 6_u32
    SNMP_ERROR_WRONGTYPE = 7_u32
    SNMP_ERROR_WRONGLENGTH = 8_u32
    SNMP_ERROR_WRONGENCODING = 9_u32
    SNMP_ERROR_WRONGVALUE = 10_u32
    SNMP_ERROR_NOCREATION = 11_u32
    SNMP_ERROR_INCONSISTENTVALUE = 12_u32
    SNMP_ERROR_RESOURCEUNAVAILABLE = 13_u32
    SNMP_ERROR_COMMITFAILED = 14_u32
    SNMP_ERROR_UNDOFAILED = 15_u32
    SNMP_ERROR_AUTHORIZATIONERROR = 16_u32
    SNMP_ERROR_NOTWRITABLE = 17_u32
    SNMP_ERROR_INCONSISTENTNAME = 18_u32
  end

  @[Extern]
  struct AsnOctetString
    property stream : UInt8*
    property length : UInt32
    property dynamic : Win32cr::Foundation::BOOL
    def initialize(@stream : UInt8*, @length : UInt32, @dynamic : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct AsnObjectIdentifier
    property idLength : UInt32
    property ids : UInt32*
    def initialize(@idLength : UInt32, @ids : UInt32*)
    end
  end

  @[Extern]
  struct AsnAny
    property asnType : UInt8
    property asnValue : Asnvalue_e__union_

    # Nested Type Asnvalue_e__union_
    @[Extern(union: true)]
    struct Asnvalue_e__union_
    property number : Int32
    property unsigned32 : UInt32
    property counter64 : Win32cr::Foundation::ULARGE_INTEGER
    property string : Win32cr::NetworkManagement::Snmp::AsnOctetString
    property bits : Win32cr::NetworkManagement::Snmp::AsnOctetString
    property object : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier
    property sequence : Win32cr::NetworkManagement::Snmp::AsnOctetString
    property address : Win32cr::NetworkManagement::Snmp::AsnOctetString
    property counter : UInt32
    property gauge : UInt32
    property ticks : UInt32
    property arbitrary : Win32cr::NetworkManagement::Snmp::AsnOctetString
    def initialize(@number : Int32, @unsigned32 : UInt32, @counter64 : Win32cr::Foundation::ULARGE_INTEGER, @string : Win32cr::NetworkManagement::Snmp::AsnOctetString, @bits : Win32cr::NetworkManagement::Snmp::AsnOctetString, @object : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier, @sequence : Win32cr::NetworkManagement::Snmp::AsnOctetString, @address : Win32cr::NetworkManagement::Snmp::AsnOctetString, @counter : UInt32, @gauge : UInt32, @ticks : UInt32, @arbitrary : Win32cr::NetworkManagement::Snmp::AsnOctetString)
    end
    end

    def initialize(@asnType : UInt8, @asnValue : Asnvalue_e__union_)
    end
  end

  @[Extern]
  struct SnmpVarBind
    property name : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier
    property value : Win32cr::NetworkManagement::Snmp::AsnAny
    def initialize(@name : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier, @value : Win32cr::NetworkManagement::Snmp::AsnAny)
    end
  end

  @[Extern]
  struct SnmpVarBindList
    property list : Win32cr::NetworkManagement::Snmp::SnmpVarBind*
    property len : UInt32
    def initialize(@list : Win32cr::NetworkManagement::Snmp::SnmpVarBind*, @len : UInt32)
    end
  end

  @[Extern]
  struct Smioctets
    property len : UInt32
    property ptr : UInt8*
    def initialize(@len : UInt32, @ptr : UInt8*)
    end
  end

  @[Extern]
  struct Smioid
    property len : UInt32
    property ptr : UInt32*
    def initialize(@len : UInt32, @ptr : UInt32*)
    end
  end

  @[Extern]
  struct Smicntr64
    property hipart : UInt32
    property lopart : UInt32
    def initialize(@hipart : UInt32, @lopart : UInt32)
    end
  end

  @[Extern]
  struct Smivalue
    property syntax : UInt32
    property value : Value_e__union_

    # Nested Type Value_e__union_
    @[Extern(union: true)]
    struct Value_e__union_
    property sNumber : Int32
    property uNumber : UInt32
    property hNumber : Win32cr::NetworkManagement::Snmp::Smicntr64
    property string : Win32cr::NetworkManagement::Snmp::Smioctets
    property oid : Win32cr::NetworkManagement::Snmp::Smioid
    property empty : UInt8
    def initialize(@sNumber : Int32, @uNumber : UInt32, @hNumber : Win32cr::NetworkManagement::Snmp::Smicntr64, @string : Win32cr::NetworkManagement::Snmp::Smioctets, @oid : Win32cr::NetworkManagement::Snmp::Smioid, @empty : UInt8)
    end
    end

    def initialize(@syntax : UInt32, @value : Value_e__union_)
    end
  end

  @[Extern]
  struct Smivendorinfo
    property vendorName : Win32cr::Foundation::CHAR[64]
    property vendorContact : Win32cr::Foundation::CHAR[64]
    property vendorVersionId : Win32cr::Foundation::CHAR[32]
    property vendorVersionDate : Win32cr::Foundation::CHAR[32]
    property vendorEnterprise : UInt32
    def initialize(@vendorName : Win32cr::Foundation::CHAR[64], @vendorContact : Win32cr::Foundation::CHAR[64], @vendorVersionId : Win32cr::Foundation::CHAR[32], @vendorVersionDate : Win32cr::Foundation::CHAR[32], @vendorEnterprise : UInt32)
    end
  end

  def snmpUtilOidCpy(pOidDst : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, pOidSrc : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilOidCpy(pOidDst, pOidSrc)
    {% end %}
  end

  def snmpUtilOidAppend(pOidDst : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, pOidSrc : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilOidAppend(pOidDst, pOidSrc)
    {% end %}
  end

  def snmpUtilOidNCmp(pOid1 : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, pOid2 : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, nSubIds : UInt32) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilOidNCmp(pOid1, pOid2, nSubIds)
    {% end %}
  end

  def snmpUtilOidCmp(pOid1 : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, pOid2 : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilOidCmp(pOid1, pOid2)
    {% end %}
  end

  def snmpUtilOidFree(pOid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Void
    {% if !flag?(:docs) %}
    C.SnmpUtilOidFree(pOid)
    {% end %}
  end

  def snmpUtilOctetsCmp(pOctets1 : Win32cr::NetworkManagement::Snmp::AsnOctetString*, pOctets2 : Win32cr::NetworkManagement::Snmp::AsnOctetString*) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilOctetsCmp(pOctets1, pOctets2)
    {% end %}
  end

  def snmpUtilOctetsNCmp(pOctets1 : Win32cr::NetworkManagement::Snmp::AsnOctetString*, pOctets2 : Win32cr::NetworkManagement::Snmp::AsnOctetString*, nChars : UInt32) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilOctetsNCmp(pOctets1, pOctets2, nChars)
    {% end %}
  end

  def snmpUtilOctetsCpy(pOctetsDst : Win32cr::NetworkManagement::Snmp::AsnOctetString*, pOctetsSrc : Win32cr::NetworkManagement::Snmp::AsnOctetString*) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilOctetsCpy(pOctetsDst, pOctetsSrc)
    {% end %}
  end

  def snmpUtilOctetsFree(pOctets : Win32cr::NetworkManagement::Snmp::AsnOctetString*) : Void
    {% if !flag?(:docs) %}
    C.SnmpUtilOctetsFree(pOctets)
    {% end %}
  end

  def snmpUtilAsnAnyCpy(pAnyDst : Win32cr::NetworkManagement::Snmp::AsnAny*, pAnySrc : Win32cr::NetworkManagement::Snmp::AsnAny*) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilAsnAnyCpy(pAnyDst, pAnySrc)
    {% end %}
  end

  def snmpUtilAsnAnyFree(pAny : Win32cr::NetworkManagement::Snmp::AsnAny*) : Void
    {% if !flag?(:docs) %}
    C.SnmpUtilAsnAnyFree(pAny)
    {% end %}
  end

  def snmpUtilVarBindCpy(pVbDst : Win32cr::NetworkManagement::Snmp::SnmpVarBind*, pVbSrc : Win32cr::NetworkManagement::Snmp::SnmpVarBind*) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilVarBindCpy(pVbDst, pVbSrc)
    {% end %}
  end

  def snmpUtilVarBindFree(pVb : Win32cr::NetworkManagement::Snmp::SnmpVarBind*) : Void
    {% if !flag?(:docs) %}
    C.SnmpUtilVarBindFree(pVb)
    {% end %}
  end

  def snmpUtilVarBindListCpy(pVblDst : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*, pVblSrc : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*) : Int32
    {% if !flag?(:docs) %}
    C.SnmpUtilVarBindListCpy(pVblDst, pVblSrc)
    {% end %}
  end

  def snmpUtilVarBindListFree(pVbl : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*) : Void
    {% if !flag?(:docs) %}
    C.SnmpUtilVarBindListFree(pVbl)
    {% end %}
  end

  def snmpUtilMemFree(pMem : Void*) : Void
    {% if !flag?(:docs) %}
    C.SnmpUtilMemFree(pMem)
    {% end %}
  end

  def snmpUtilMemAlloc(nBytes : UInt32) : Void*
    {% if !flag?(:docs) %}
    C.SnmpUtilMemAlloc(nBytes)
    {% end %}
  end

  def snmpUtilMemReAlloc(pMem : Void*, nBytes : UInt32) : Void*
    {% if !flag?(:docs) %}
    C.SnmpUtilMemReAlloc(pMem, nBytes)
    {% end %}
  end

  def snmpUtilOidToA(oid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Win32cr::Foundation::PSTR
    {% if !flag?(:docs) %}
    C.SnmpUtilOidToA(oid)
    {% end %}
  end

  def snmpUtilIdsToA(ids : UInt32*, id_length : UInt32) : Win32cr::Foundation::PSTR
    {% if !flag?(:docs) %}
    C.SnmpUtilIdsToA(ids, id_length)
    {% end %}
  end

  def snmpUtilPrintOid(oid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Void
    {% if !flag?(:docs) %}
    C.SnmpUtilPrintOid(oid)
    {% end %}
  end

  def snmpUtilPrintAsnAny(pAny : Win32cr::NetworkManagement::Snmp::AsnAny*) : Void
    {% if !flag?(:docs) %}
    C.SnmpUtilPrintAsnAny(pAny)
    {% end %}
  end

  def snmpSvcGetUptime : UInt32
    {% if !flag?(:docs) %}
    C.SnmpSvcGetUptime
    {% end %}
  end

  def snmpSvcSetLogLevel(nLogLevel : Win32cr::NetworkManagement::Snmp::SNMP_LOG) : Void
    {% if !flag?(:docs) %}
    C.SnmpSvcSetLogLevel(nLogLevel)
    {% end %}
  end

  def snmpSvcSetLogType(nLogType : Win32cr::NetworkManagement::Snmp::SNMP_OUTPUT_LOG_TYPE) : Void
    {% if !flag?(:docs) %}
    C.SnmpSvcSetLogType(nLogType)
    {% end %}
  end

  def snmpUtilDbgPrint(nLogLevel : Win32cr::NetworkManagement::Snmp::SNMP_LOG, szFormat : Win32cr::Foundation::PSTR) : Void
    {% if !flag?(:docs) %}
    C.SnmpUtilDbgPrint(nLogLevel, szFormat)
    {% end %}
  end

  def snmpMgrOpen(lpAgentAddress : Win32cr::Foundation::PSTR, lpAgentCommunity : Win32cr::Foundation::PSTR, nTimeOut : Int32, nRetries : Int32) : Void*
    {% if !flag?(:docs) %}
    C.SnmpMgrOpen(lpAgentAddress, lpAgentCommunity, nTimeOut, nRetries)
    {% end %}
  end

  def snmpMgrCtl(session : Void*, dwCtlCode : UInt32, lpvInBuffer : Void*, cbInBuffer : UInt32, lpvOUTBuffer : Void*, cbOUTBuffer : UInt32, lpcbBytesReturned : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SnmpMgrCtl(session, dwCtlCode, lpvInBuffer, cbInBuffer, lpvOUTBuffer, cbOUTBuffer, lpcbBytesReturned)
    {% end %}
  end

  def snmpMgrClose(session : Void*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SnmpMgrClose(session)
    {% end %}
  end

  def snmpMgrRequest(session : Void*, requestType : UInt8, variableBindings : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*, errorStatus : Win32cr::NetworkManagement::Snmp::SNMP_ERROR_STATUS*, errorIndex : Int32*) : Int32
    {% if !flag?(:docs) %}
    C.SnmpMgrRequest(session, requestType, variableBindings, errorStatus, errorIndex)
    {% end %}
  end

  def snmpMgrStrToOid(string : Win32cr::Foundation::PSTR, oid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SnmpMgrStrToOid(string, oid)
    {% end %}
  end

  def snmpMgrOidToStr(oid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, string : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SnmpMgrOidToStr(oid, string)
    {% end %}
  end

  def snmpMgrTrapListen(phTrapAvailable : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SnmpMgrTrapListen(phTrapAvailable)
    {% end %}
  end

  def snmpMgrGetTrap(enterprise : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, ip_address : Win32cr::NetworkManagement::Snmp::AsnOctetString*, genericTrap : Win32cr::NetworkManagement::Snmp::SNMP_GENERICTRAP*, specificTrap : Int32*, timeStamp : UInt32*, variableBindings : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SnmpMgrGetTrap(enterprise, ip_address, genericTrap, specificTrap, timeStamp, variableBindings)
    {% end %}
  end

  def snmpMgrGetTrapEx(enterprise : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, agentAddress : Win32cr::NetworkManagement::Snmp::AsnOctetString*, sourceAddress : Win32cr::NetworkManagement::Snmp::AsnOctetString*, genericTrap : Win32cr::NetworkManagement::Snmp::SNMP_GENERICTRAP*, specificTrap : Int32*, community : Win32cr::NetworkManagement::Snmp::AsnOctetString*, timeStamp : UInt32*, variableBindings : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SnmpMgrGetTrapEx(enterprise, agentAddress, sourceAddress, genericTrap, specificTrap, community, timeStamp, variableBindings)
    {% end %}
  end

  def snmpGetTranslateMode(nTranslateMode : Win32cr::NetworkManagement::Snmp::SNMP_API_TRANSLATE_MODE*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpGetTranslateMode(nTranslateMode)
    {% end %}
  end

  def snmpSetTranslateMode(nTranslateMode : Win32cr::NetworkManagement::Snmp::SNMP_API_TRANSLATE_MODE) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpSetTranslateMode(nTranslateMode)
    {% end %}
  end

  def snmpGetRetransmitMode(nRetransmitMode : Win32cr::NetworkManagement::Snmp::SNMP_STATUS*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpGetRetransmitMode(nRetransmitMode)
    {% end %}
  end

  def snmpSetRetransmitMode(nRetransmitMode : Win32cr::NetworkManagement::Snmp::SNMP_STATUS) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpSetRetransmitMode(nRetransmitMode)
    {% end %}
  end

  def snmpGetTimeout(hEntity : LibC::IntPtrT, nPolicyTimeout : UInt32*, nActualTimeout : UInt32*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpGetTimeout(hEntity, nPolicyTimeout, nActualTimeout)
    {% end %}
  end

  def snmpSetTimeout(hEntity : LibC::IntPtrT, nPolicyTimeout : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpSetTimeout(hEntity, nPolicyTimeout)
    {% end %}
  end

  def snmpGetRetry(hEntity : LibC::IntPtrT, nPolicyRetry : UInt32*, nActualRetry : UInt32*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpGetRetry(hEntity, nPolicyRetry, nActualRetry)
    {% end %}
  end

  def snmpSetRetry(hEntity : LibC::IntPtrT, nPolicyRetry : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpSetRetry(hEntity, nPolicyRetry)
    {% end %}
  end

  def snmpGetVendorInfo(vendorInfo : Win32cr::NetworkManagement::Snmp::Smivendorinfo*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpGetVendorInfo(vendorInfo)
    {% end %}
  end

  def snmpStartup(nMajorVersion : UInt32*, nMinorVersion : UInt32*, nLevel : UInt32*, nTranslateMode : Win32cr::NetworkManagement::Snmp::SNMP_API_TRANSLATE_MODE*, nRetransmitMode : Win32cr::NetworkManagement::Snmp::SNMP_STATUS*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpStartup(nMajorVersion, nMinorVersion, nLevel, nTranslateMode, nRetransmitMode)
    {% end %}
  end

  def snmpCleanup : UInt32
    {% if !flag?(:docs) %}
    C.SnmpCleanup
    {% end %}
  end

  def snmpOpen(hWnd : Win32cr::Foundation::HWND, wMsg : UInt32) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.SnmpOpen(hWnd, wMsg)
    {% end %}
  end

  def snmpClose(session : LibC::IntPtrT) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpClose(session)
    {% end %}
  end

  def snmpSendMsg(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT, dstEntity : LibC::IntPtrT, context : LibC::IntPtrT, pdu : LibC::IntPtrT) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpSendMsg(session, srcEntity, dstEntity, context, pdu)
    {% end %}
  end

  def snmpRecvMsg(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT*, dstEntity : LibC::IntPtrT*, context : LibC::IntPtrT*, pdu : LibC::IntPtrT*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpRecvMsg(session, srcEntity, dstEntity, context, pdu)
    {% end %}
  end

  def snmpRegister(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT, dstEntity : LibC::IntPtrT, context : LibC::IntPtrT, notification : Win32cr::NetworkManagement::Snmp::Smioid*, state : Win32cr::NetworkManagement::Snmp::SNMP_STATUS) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpRegister(session, srcEntity, dstEntity, context, notification, state)
    {% end %}
  end

  def snmpCreateSession(hWnd : Win32cr::Foundation::HWND, wMsg : UInt32, fCallBack : Win32cr::NetworkManagement::Snmp::SNMPAPI_CALLBACK, lpClientData : Void*) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.SnmpCreateSession(hWnd, wMsg, fCallBack, lpClientData)
    {% end %}
  end

  def snmpListen(hEntity : LibC::IntPtrT, lStatus : Win32cr::NetworkManagement::Snmp::SNMP_STATUS) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpListen(hEntity, lStatus)
    {% end %}
  end

  def snmpListenEx(hEntity : LibC::IntPtrT, lStatus : UInt32, nUseEntityAddr : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpListenEx(hEntity, lStatus, nUseEntityAddr)
    {% end %}
  end

  def snmpCancelMsg(session : LibC::IntPtrT, reqId : Int32) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpCancelMsg(session, reqId)
    {% end %}
  end

  def snmpStartupEx(nMajorVersion : UInt32*, nMinorVersion : UInt32*, nLevel : UInt32*, nTranslateMode : Win32cr::NetworkManagement::Snmp::SNMP_API_TRANSLATE_MODE*, nRetransmitMode : Win32cr::NetworkManagement::Snmp::SNMP_STATUS*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpStartupEx(nMajorVersion, nMinorVersion, nLevel, nTranslateMode, nRetransmitMode)
    {% end %}
  end

  def snmpCleanupEx : UInt32
    {% if !flag?(:docs) %}
    C.SnmpCleanupEx
    {% end %}
  end

  def snmpStrToEntity(session : LibC::IntPtrT, string : Win32cr::Foundation::PSTR) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.SnmpStrToEntity(session, string)
    {% end %}
  end

  def snmpEntityToStr(entity : LibC::IntPtrT, size : UInt32, string : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpEntityToStr(entity, size, string)
    {% end %}
  end

  def snmpFreeEntity(entity : LibC::IntPtrT) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpFreeEntity(entity)
    {% end %}
  end

  def snmpStrToContext(session : LibC::IntPtrT, string : Win32cr::NetworkManagement::Snmp::Smioctets*) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.SnmpStrToContext(session, string)
    {% end %}
  end

  def snmpContextToStr(context : LibC::IntPtrT, string : Win32cr::NetworkManagement::Snmp::Smioctets*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpContextToStr(context, string)
    {% end %}
  end

  def snmpFreeContext(context : LibC::IntPtrT) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpFreeContext(context)
    {% end %}
  end

  def snmpSetPort(hEntity : LibC::IntPtrT, nPort : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpSetPort(hEntity, nPort)
    {% end %}
  end

  def snmpCreatePdu(session : LibC::IntPtrT, pdu_type : Win32cr::NetworkManagement::Snmp::SNMP_PDU_TYPE, request_id : Int32, error_status : Int32, error_index : Int32, varbindlist : LibC::IntPtrT) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.SnmpCreatePdu(session, pdu_type, request_id, error_status, error_index, varbindlist)
    {% end %}
  end

  def snmpGetPduData(pdu : LibC::IntPtrT, pdu_type : Win32cr::NetworkManagement::Snmp::SNMP_PDU_TYPE*, request_id : Int32*, error_status : Win32cr::NetworkManagement::Snmp::SNMP_ERROR*, error_index : Int32*, varbindlist : LibC::IntPtrT*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpGetPduData(pdu, pdu_type, request_id, error_status, error_index, varbindlist)
    {% end %}
  end

  def snmpSetPduData(pdu : LibC::IntPtrT, pdu_type : Int32*, request_id : Int32*, non_repeaters : Int32*, max_repetitions : Int32*, varbindlist : LibC::IntPtrT*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpSetPduData(pdu, pdu_type, request_id, non_repeaters, max_repetitions, varbindlist)
    {% end %}
  end

  def snmpDuplicatePdu(session : LibC::IntPtrT, pdu : LibC::IntPtrT) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.SnmpDuplicatePdu(session, pdu)
    {% end %}
  end

  def snmpFreePdu(pdu : LibC::IntPtrT) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpFreePdu(pdu)
    {% end %}
  end

  def snmpCreateVbl(session : LibC::IntPtrT, name : Win32cr::NetworkManagement::Snmp::Smioid*, value : Win32cr::NetworkManagement::Snmp::Smivalue*) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.SnmpCreateVbl(session, name, value)
    {% end %}
  end

  def snmpDuplicateVbl(session : LibC::IntPtrT, vbl : LibC::IntPtrT) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.SnmpDuplicateVbl(session, vbl)
    {% end %}
  end

  def snmpFreeVbl(vbl : LibC::IntPtrT) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpFreeVbl(vbl)
    {% end %}
  end

  def snmpCountVbl(vbl : LibC::IntPtrT) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpCountVbl(vbl)
    {% end %}
  end

  def snmpGetVb(vbl : LibC::IntPtrT, index : UInt32, name : Win32cr::NetworkManagement::Snmp::Smioid*, value : Win32cr::NetworkManagement::Snmp::Smivalue*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpGetVb(vbl, index, name, value)
    {% end %}
  end

  def snmpSetVb(vbl : LibC::IntPtrT, index : UInt32, name : Win32cr::NetworkManagement::Snmp::Smioid*, value : Win32cr::NetworkManagement::Snmp::Smivalue*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpSetVb(vbl, index, name, value)
    {% end %}
  end

  def snmpDeleteVb(vbl : LibC::IntPtrT, index : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpDeleteVb(vbl, index)
    {% end %}
  end

  def snmpGetLastError(session : LibC::IntPtrT) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpGetLastError(session)
    {% end %}
  end

  def snmpStrToOid(string : Win32cr::Foundation::PSTR, dstOID : Win32cr::NetworkManagement::Snmp::Smioid*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpStrToOid(string, dstOID)
    {% end %}
  end

  def snmpOidToStr(srcOID : Win32cr::NetworkManagement::Snmp::Smioid*, size : UInt32, string : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpOidToStr(srcOID, size, string)
    {% end %}
  end

  def snmpOidCopy(srcOID : Win32cr::NetworkManagement::Snmp::Smioid*, dstOID : Win32cr::NetworkManagement::Snmp::Smioid*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpOidCopy(srcOID, dstOID)
    {% end %}
  end

  def snmpOidCompare(xOID : Win32cr::NetworkManagement::Snmp::Smioid*, yOID : Win32cr::NetworkManagement::Snmp::Smioid*, maxlen : UInt32, result : Int32*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpOidCompare(xOID, yOID, maxlen, result)
    {% end %}
  end

  def snmpEncodeMsg(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT, dstEntity : LibC::IntPtrT, context : LibC::IntPtrT, pdu : LibC::IntPtrT, msgBufDesc : Win32cr::NetworkManagement::Snmp::Smioctets*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpEncodeMsg(session, srcEntity, dstEntity, context, pdu, msgBufDesc)
    {% end %}
  end

  def snmpDecodeMsg(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT*, dstEntity : LibC::IntPtrT*, context : LibC::IntPtrT*, pdu : LibC::IntPtrT*, msgBufDesc : Win32cr::NetworkManagement::Snmp::Smioctets*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpDecodeMsg(session, srcEntity, dstEntity, context, pdu, msgBufDesc)
    {% end %}
  end

  def snmpFreeDescriptor(syntax : UInt32, descriptor : Win32cr::NetworkManagement::Snmp::Smioctets*) : UInt32
    {% if !flag?(:docs) %}
    C.SnmpFreeDescriptor(syntax, descriptor)
    {% end %}
  end

  @[Link("snmpapi")]
  @[Link("mgmtapi")]
  @[Link("wsnmp32")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun SnmpUtilOidCpy(pOidDst : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, pOidSrc : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Int32

    # :nodoc:
    fun SnmpUtilOidAppend(pOidDst : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, pOidSrc : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Int32

    # :nodoc:
    fun SnmpUtilOidNCmp(pOid1 : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, pOid2 : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, nSubIds : UInt32) : Int32

    # :nodoc:
    fun SnmpUtilOidCmp(pOid1 : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, pOid2 : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Int32

    # :nodoc:
    fun SnmpUtilOidFree(pOid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Void

    # :nodoc:
    fun SnmpUtilOctetsCmp(pOctets1 : Win32cr::NetworkManagement::Snmp::AsnOctetString*, pOctets2 : Win32cr::NetworkManagement::Snmp::AsnOctetString*) : Int32

    # :nodoc:
    fun SnmpUtilOctetsNCmp(pOctets1 : Win32cr::NetworkManagement::Snmp::AsnOctetString*, pOctets2 : Win32cr::NetworkManagement::Snmp::AsnOctetString*, nChars : UInt32) : Int32

    # :nodoc:
    fun SnmpUtilOctetsCpy(pOctetsDst : Win32cr::NetworkManagement::Snmp::AsnOctetString*, pOctetsSrc : Win32cr::NetworkManagement::Snmp::AsnOctetString*) : Int32

    # :nodoc:
    fun SnmpUtilOctetsFree(pOctets : Win32cr::NetworkManagement::Snmp::AsnOctetString*) : Void

    # :nodoc:
    fun SnmpUtilAsnAnyCpy(pAnyDst : Win32cr::NetworkManagement::Snmp::AsnAny*, pAnySrc : Win32cr::NetworkManagement::Snmp::AsnAny*) : Int32

    # :nodoc:
    fun SnmpUtilAsnAnyFree(pAny : Win32cr::NetworkManagement::Snmp::AsnAny*) : Void

    # :nodoc:
    fun SnmpUtilVarBindCpy(pVbDst : Win32cr::NetworkManagement::Snmp::SnmpVarBind*, pVbSrc : Win32cr::NetworkManagement::Snmp::SnmpVarBind*) : Int32

    # :nodoc:
    fun SnmpUtilVarBindFree(pVb : Win32cr::NetworkManagement::Snmp::SnmpVarBind*) : Void

    # :nodoc:
    fun SnmpUtilVarBindListCpy(pVblDst : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*, pVblSrc : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*) : Int32

    # :nodoc:
    fun SnmpUtilVarBindListFree(pVbl : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*) : Void

    # :nodoc:
    fun SnmpUtilMemFree(pMem : Void*) : Void

    # :nodoc:
    fun SnmpUtilMemAlloc(nBytes : UInt32) : Void*

    # :nodoc:
    fun SnmpUtilMemReAlloc(pMem : Void*, nBytes : UInt32) : Void*

    # :nodoc:
    fun SnmpUtilOidToA(oid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Win32cr::Foundation::PSTR

    # :nodoc:
    fun SnmpUtilIdsToA(ids : UInt32*, id_length : UInt32) : Win32cr::Foundation::PSTR

    # :nodoc:
    fun SnmpUtilPrintOid(oid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Void

    # :nodoc:
    fun SnmpUtilPrintAsnAny(pAny : Win32cr::NetworkManagement::Snmp::AsnAny*) : Void

    # :nodoc:
    fun SnmpSvcGetUptime : UInt32

    # :nodoc:
    fun SnmpSvcSetLogLevel(nLogLevel : Win32cr::NetworkManagement::Snmp::SNMP_LOG) : Void

    # :nodoc:
    fun SnmpSvcSetLogType(nLogType : Win32cr::NetworkManagement::Snmp::SNMP_OUTPUT_LOG_TYPE) : Void

    # :nodoc:
    fun SnmpUtilDbgPrint(nLogLevel : Win32cr::NetworkManagement::Snmp::SNMP_LOG, szFormat : Win32cr::Foundation::PSTR) : Void

    # :nodoc:
    fun SnmpMgrOpen(lpAgentAddress : Win32cr::Foundation::PSTR, lpAgentCommunity : Win32cr::Foundation::PSTR, nTimeOut : Int32, nRetries : Int32) : Void*

    # :nodoc:
    fun SnmpMgrCtl(session : Void*, dwCtlCode : UInt32, lpvInBuffer : Void*, cbInBuffer : UInt32, lpvOUTBuffer : Void*, cbOUTBuffer : UInt32, lpcbBytesReturned : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SnmpMgrClose(session : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SnmpMgrRequest(session : Void*, requestType : UInt8, variableBindings : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*, errorStatus : Win32cr::NetworkManagement::Snmp::SNMP_ERROR_STATUS*, errorIndex : Int32*) : Int32

    # :nodoc:
    fun SnmpMgrStrToOid(string : Win32cr::Foundation::PSTR, oid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SnmpMgrOidToStr(oid : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, string : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SnmpMgrTrapListen(phTrapAvailable : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SnmpMgrGetTrap(enterprise : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, ip_address : Win32cr::NetworkManagement::Snmp::AsnOctetString*, genericTrap : Win32cr::NetworkManagement::Snmp::SNMP_GENERICTRAP*, specificTrap : Int32*, timeStamp : UInt32*, variableBindings : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SnmpMgrGetTrapEx(enterprise : Win32cr::NetworkManagement::Snmp::AsnObjectIdentifier*, agentAddress : Win32cr::NetworkManagement::Snmp::AsnOctetString*, sourceAddress : Win32cr::NetworkManagement::Snmp::AsnOctetString*, genericTrap : Win32cr::NetworkManagement::Snmp::SNMP_GENERICTRAP*, specificTrap : Int32*, community : Win32cr::NetworkManagement::Snmp::AsnOctetString*, timeStamp : UInt32*, variableBindings : Win32cr::NetworkManagement::Snmp::SnmpVarBindList*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SnmpGetTranslateMode(nTranslateMode : Win32cr::NetworkManagement::Snmp::SNMP_API_TRANSLATE_MODE*) : UInt32

    # :nodoc:
    fun SnmpSetTranslateMode(nTranslateMode : Win32cr::NetworkManagement::Snmp::SNMP_API_TRANSLATE_MODE) : UInt32

    # :nodoc:
    fun SnmpGetRetransmitMode(nRetransmitMode : Win32cr::NetworkManagement::Snmp::SNMP_STATUS*) : UInt32

    # :nodoc:
    fun SnmpSetRetransmitMode(nRetransmitMode : Win32cr::NetworkManagement::Snmp::SNMP_STATUS) : UInt32

    # :nodoc:
    fun SnmpGetTimeout(hEntity : LibC::IntPtrT, nPolicyTimeout : UInt32*, nActualTimeout : UInt32*) : UInt32

    # :nodoc:
    fun SnmpSetTimeout(hEntity : LibC::IntPtrT, nPolicyTimeout : UInt32) : UInt32

    # :nodoc:
    fun SnmpGetRetry(hEntity : LibC::IntPtrT, nPolicyRetry : UInt32*, nActualRetry : UInt32*) : UInt32

    # :nodoc:
    fun SnmpSetRetry(hEntity : LibC::IntPtrT, nPolicyRetry : UInt32) : UInt32

    # :nodoc:
    fun SnmpGetVendorInfo(vendorInfo : Win32cr::NetworkManagement::Snmp::Smivendorinfo*) : UInt32

    # :nodoc:
    fun SnmpStartup(nMajorVersion : UInt32*, nMinorVersion : UInt32*, nLevel : UInt32*, nTranslateMode : Win32cr::NetworkManagement::Snmp::SNMP_API_TRANSLATE_MODE*, nRetransmitMode : Win32cr::NetworkManagement::Snmp::SNMP_STATUS*) : UInt32

    # :nodoc:
    fun SnmpCleanup : UInt32

    # :nodoc:
    fun SnmpOpen(hWnd : Win32cr::Foundation::HWND, wMsg : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun SnmpClose(session : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun SnmpSendMsg(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT, dstEntity : LibC::IntPtrT, context : LibC::IntPtrT, pdu : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun SnmpRecvMsg(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT*, dstEntity : LibC::IntPtrT*, context : LibC::IntPtrT*, pdu : LibC::IntPtrT*) : UInt32

    # :nodoc:
    fun SnmpRegister(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT, dstEntity : LibC::IntPtrT, context : LibC::IntPtrT, notification : Win32cr::NetworkManagement::Snmp::Smioid*, state : Win32cr::NetworkManagement::Snmp::SNMP_STATUS) : UInt32

    # :nodoc:
    fun SnmpCreateSession(hWnd : Win32cr::Foundation::HWND, wMsg : UInt32, fCallBack : Win32cr::NetworkManagement::Snmp::SNMPAPI_CALLBACK, lpClientData : Void*) : LibC::IntPtrT

    # :nodoc:
    fun SnmpListen(hEntity : LibC::IntPtrT, lStatus : Win32cr::NetworkManagement::Snmp::SNMP_STATUS) : UInt32

    # :nodoc:
    fun SnmpListenEx(hEntity : LibC::IntPtrT, lStatus : UInt32, nUseEntityAddr : UInt32) : UInt32

    # :nodoc:
    fun SnmpCancelMsg(session : LibC::IntPtrT, reqId : Int32) : UInt32

    # :nodoc:
    fun SnmpStartupEx(nMajorVersion : UInt32*, nMinorVersion : UInt32*, nLevel : UInt32*, nTranslateMode : Win32cr::NetworkManagement::Snmp::SNMP_API_TRANSLATE_MODE*, nRetransmitMode : Win32cr::NetworkManagement::Snmp::SNMP_STATUS*) : UInt32

    # :nodoc:
    fun SnmpCleanupEx : UInt32

    # :nodoc:
    fun SnmpStrToEntity(session : LibC::IntPtrT, string : Win32cr::Foundation::PSTR) : LibC::IntPtrT

    # :nodoc:
    fun SnmpEntityToStr(entity : LibC::IntPtrT, size : UInt32, string : UInt8*) : UInt32

    # :nodoc:
    fun SnmpFreeEntity(entity : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun SnmpStrToContext(session : LibC::IntPtrT, string : Win32cr::NetworkManagement::Snmp::Smioctets*) : LibC::IntPtrT

    # :nodoc:
    fun SnmpContextToStr(context : LibC::IntPtrT, string : Win32cr::NetworkManagement::Snmp::Smioctets*) : UInt32

    # :nodoc:
    fun SnmpFreeContext(context : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun SnmpSetPort(hEntity : LibC::IntPtrT, nPort : UInt32) : UInt32

    # :nodoc:
    fun SnmpCreatePdu(session : LibC::IntPtrT, pdu_type : Win32cr::NetworkManagement::Snmp::SNMP_PDU_TYPE, request_id : Int32, error_status : Int32, error_index : Int32, varbindlist : LibC::IntPtrT) : LibC::IntPtrT

    # :nodoc:
    fun SnmpGetPduData(pdu : LibC::IntPtrT, pdu_type : Win32cr::NetworkManagement::Snmp::SNMP_PDU_TYPE*, request_id : Int32*, error_status : Win32cr::NetworkManagement::Snmp::SNMP_ERROR*, error_index : Int32*, varbindlist : LibC::IntPtrT*) : UInt32

    # :nodoc:
    fun SnmpSetPduData(pdu : LibC::IntPtrT, pdu_type : Int32*, request_id : Int32*, non_repeaters : Int32*, max_repetitions : Int32*, varbindlist : LibC::IntPtrT*) : UInt32

    # :nodoc:
    fun SnmpDuplicatePdu(session : LibC::IntPtrT, pdu : LibC::IntPtrT) : LibC::IntPtrT

    # :nodoc:
    fun SnmpFreePdu(pdu : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun SnmpCreateVbl(session : LibC::IntPtrT, name : Win32cr::NetworkManagement::Snmp::Smioid*, value : Win32cr::NetworkManagement::Snmp::Smivalue*) : LibC::IntPtrT

    # :nodoc:
    fun SnmpDuplicateVbl(session : LibC::IntPtrT, vbl : LibC::IntPtrT) : LibC::IntPtrT

    # :nodoc:
    fun SnmpFreeVbl(vbl : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun SnmpCountVbl(vbl : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun SnmpGetVb(vbl : LibC::IntPtrT, index : UInt32, name : Win32cr::NetworkManagement::Snmp::Smioid*, value : Win32cr::NetworkManagement::Snmp::Smivalue*) : UInt32

    # :nodoc:
    fun SnmpSetVb(vbl : LibC::IntPtrT, index : UInt32, name : Win32cr::NetworkManagement::Snmp::Smioid*, value : Win32cr::NetworkManagement::Snmp::Smivalue*) : UInt32

    # :nodoc:
    fun SnmpDeleteVb(vbl : LibC::IntPtrT, index : UInt32) : UInt32

    # :nodoc:
    fun SnmpGetLastError(session : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun SnmpStrToOid(string : Win32cr::Foundation::PSTR, dstOID : Win32cr::NetworkManagement::Snmp::Smioid*) : UInt32

    # :nodoc:
    fun SnmpOidToStr(srcOID : Win32cr::NetworkManagement::Snmp::Smioid*, size : UInt32, string : UInt8*) : UInt32

    # :nodoc:
    fun SnmpOidCopy(srcOID : Win32cr::NetworkManagement::Snmp::Smioid*, dstOID : Win32cr::NetworkManagement::Snmp::Smioid*) : UInt32

    # :nodoc:
    fun SnmpOidCompare(xOID : Win32cr::NetworkManagement::Snmp::Smioid*, yOID : Win32cr::NetworkManagement::Snmp::Smioid*, maxlen : UInt32, result : Int32*) : UInt32

    # :nodoc:
    fun SnmpEncodeMsg(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT, dstEntity : LibC::IntPtrT, context : LibC::IntPtrT, pdu : LibC::IntPtrT, msgBufDesc : Win32cr::NetworkManagement::Snmp::Smioctets*) : UInt32

    # :nodoc:
    fun SnmpDecodeMsg(session : LibC::IntPtrT, srcEntity : LibC::IntPtrT*, dstEntity : LibC::IntPtrT*, context : LibC::IntPtrT*, pdu : LibC::IntPtrT*, msgBufDesc : Win32cr::NetworkManagement::Snmp::Smioctets*) : UInt32

    # :nodoc:
    fun SnmpFreeDescriptor(syntax : UInt32, descriptor : Win32cr::NetworkManagement::Snmp::Smioctets*) : UInt32

  end
  {% end %}
end