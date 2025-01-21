require "./../security.cr"
require "./../foundation.cr"
require "./../graphics/gdi.cr"

module Win32cr::System::DataExchange
  alias HSZ = LibC::IntPtrT
  alias HCONV = LibC::IntPtrT
  alias HCONVLIST = LibC::IntPtrT
  alias HDDEDATA = LibC::IntPtrT
  alias PFNCALLBACK = Proc(UInt32, UInt32, Win32cr::System::DataExchange::HCONV, Win32cr::System::DataExchange::HSZ, Win32cr::System::DataExchange::HSZ, Win32cr::System::DataExchange::HDDEDATA, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::System::DataExchange::HDDEDATA)*

  WM_DDE_FIRST = 992_u32
  WM_DDE_INITIATE = 992_u32
  WM_DDE_TERMINATE = 993_u32
  WM_DDE_ADVISE = 994_u32
  WM_DDE_UNADVISE = 995_u32
  WM_DDE_ACK = 996_u32
  WM_DDE_DATA = 997_u32
  WM_DDE_REQUEST = 998_u32
  WM_DDE_POKE = 999_u32
  WM_DDE_EXECUTE = 1000_u32
  WM_DDE_LAST = 1000_u32
  CADV_LATEACK = 65535_u32
  DDE_FACK = 32768_u32
  DDE_FBUSY = 16384_u32
  DDE_FDEFERUPD = 16384_u32
  DDE_FACKREQ = 32768_u32
  DDE_FRELEASE = 8192_u32
  DDE_FREQUESTED = 4096_u32
  DDE_FAPPSTATUS = 255_u32
  DDE_FNOTPROCESSED = 0_u32
  MSGF_DDEMGR = 32769_u32
  CP_WINANSI = 1004_i32
  CP_WINUNICODE = 1200_i32
  CP_WINNEUTRAL = 1200_i32
  XTYPF_NOBLOCK = 2_u32
  XTYPF_NODATA = 4_u32
  XTYPF_ACKREQ = 8_u32
  XCLASS_MASK = 64512_u32
  XCLASS_BOOL = 4096_u32
  XCLASS_DATA = 8192_u32
  XCLASS_FLAGS = 16384_u32
  XCLASS_NOTIFICATION = 32768_u32
  XTYP_MASK = 240_u32
  XTYP_SHIFT = 4_u32
  TIMEOUT_ASYNC = 4294967295_u32
  QID_SYNC = 4294967295_u32
  SZDDESYS_TOPIC = "System"
  SZDDESYS_ITEM_TOPICS = "Topics"
  SZDDESYS_ITEM_SYSITEMS = "SysItems"
  SZDDESYS_ITEM_RTNMSG = "ReturnMessage"
  SZDDESYS_ITEM_STATUS = "Status"
  SZDDESYS_ITEM_FORMATS = "Formats"
  SZDDESYS_ITEM_HELP = "Help"
  SZDDE_ITEM_ITEMLIST = "TopicItemList"
  APPCMD_MASK = 4080_i32
  APPCLASS_MASK = 15_i32
  HDATA_APPOWNED = 1_u32
  DMLERR_NO_ERROR = 0_u32
  DMLERR_FIRST = 16384_u32
  DMLERR_ADVACKTIMEOUT = 16384_u32
  DMLERR_BUSY = 16385_u32
  DMLERR_DATAACKTIMEOUT = 16386_u32
  DMLERR_DLL_NOT_INITIALIZED = 16387_u32
  DMLERR_DLL_USAGE = 16388_u32
  DMLERR_EXECACKTIMEOUT = 16389_u32
  DMLERR_INVALIDPARAMETER = 16390_u32
  DMLERR_LOW_MEMORY = 16391_u32
  DMLERR_MEMORY_ERROR = 16392_u32
  DMLERR_NOTPROCESSED = 16393_u32
  DMLERR_NO_CONV_ESTABLISHED = 16394_u32
  DMLERR_POKEACKTIMEOUT = 16395_u32
  DMLERR_POSTMSG_FAILED = 16396_u32
  DMLERR_REENTRANCY = 16397_u32
  DMLERR_SERVER_DIED = 16398_u32
  DMLERR_SYS_ERROR = 16399_u32
  DMLERR_UNADVACKTIMEOUT = 16400_u32
  DMLERR_UNFOUND_QUEUE_ID = 16401_u32
  DMLERR_LAST = 16401_u32
  MH_CREATE = 1_u32
  MH_KEEP = 2_u32
  MH_DELETE = 3_u32
  MH_CLEANUP = 4_u32
  MAX_MONITORS = 4_u32
  MF_MASK = 4278190080_u32

  enum DDE_ENABLE_CALLBACK_CMD : UInt32
    EC_ENABLEALL = 0_u32
    EC_ENABLEONE = 128_u32
    EC_DISABLE = 8_u32
    EC_QUERYWAITING = 2_u32
  end
  @[Flags]
  enum DDE_INITIALIZE_COMMAND : UInt32
    APPCLASS_MONITOR = 1_u32
    APPCLASS_STANDARD = 0_u32
    APPCMD_CLIENTONLY = 16_u32
    APPCMD_FILTERINITS = 32_u32
    CBF_FAIL_ALLSVRXACTIONS = 258048_u32
    CBF_FAIL_ADVISES = 16384_u32
    CBF_FAIL_CONNECTIONS = 8192_u32
    CBF_FAIL_EXECUTES = 32768_u32
    CBF_FAIL_POKES = 65536_u32
    CBF_FAIL_REQUESTS = 131072_u32
    CBF_FAIL_SELFCONNECTIONS = 4096_u32
    CBF_SKIP_ALLNOTIFICATIONS = 3932160_u32
    CBF_SKIP_CONNECT_CONFIRMS = 262144_u32
    CBF_SKIP_DISCONNECTS = 2097152_u32
    CBF_SKIP_REGISTRATIONS = 524288_u32
    CBF_SKIP_UNREGISTRATIONS = 1048576_u32
    MF_CALLBACKS = 134217728_u32
    MF_CONV = 1073741824_u32
    MF_ERRORS = 268435456_u32
    MF_HSZ_INFO = 16777216_u32
    MF_LINKS = 536870912_u32
    MF_POSTMSGS = 67108864_u32
    MF_SENDMSGS = 33554432_u32
  end
  enum DDE_NAME_SERVICE_CMD : UInt32
    DNS_REGISTER = 1_u32
    DNS_UNREGISTER = 2_u32
    DNS_FILTERON = 4_u32
    DNS_FILTEROFF = 8_u32
  end
  enum DDE_CLIENT_TRANSACTION_TYPE : UInt32
    XTYP_ADVSTART = 4144_u32
    XTYP_ADVSTOP = 32832_u32
    XTYP_EXECUTE = 16464_u32
    XTYP_POKE = 16528_u32
    XTYP_REQUEST = 8368_u32
    XTYP_ADVDATA = 16400_u32
    XTYP_ADVREQ = 8226_u32
    XTYP_CONNECT = 4194_u32
    XTYP_CONNECT_CONFIRM = 32882_u32
    XTYP_DISCONNECT = 32962_u32
    XTYP_MONITOR = 33010_u32
    XTYP_REGISTER = 32930_u32
    XTYP_UNREGISTER = 32978_u32
    XTYP_WILDCONNECT = 8418_u32
    XTYP_XACT_COMPLETE = 32896_u32
  end
  enum CONVINFO_CONVERSATION_STATE : UInt32
    XST_ADVACKRCVD = 13_u32
    XST_ADVDATAACKRCVD = 16_u32
    XST_ADVDATASENT = 15_u32
    XST_ADVSENT = 11_u32
    XST_CONNECTED = 2_u32
    XST_DATARCVD = 6_u32
    XST_EXECACKRCVD = 10_u32
    XST_EXECSENT = 9_u32
    XST_INCOMPLETE = 1_u32
    XST_INIT1 = 3_u32
    XST_INIT2 = 4_u32
    XST_NULL = 0_u32
    XST_POKEACKRCVD = 8_u32
    XST_POKESENT = 7_u32
    XST_REQSENT = 5_u32
    XST_UNADVACKRCVD = 14_u32
    XST_UNADVSENT = 12_u32
  end
  @[Flags]
  enum CONVINFO_STATUS : UInt32
    ST_ADVISE = 2_u32
    ST_BLOCKED = 8_u32
    ST_BLOCKNEXT = 128_u32
    ST_CLIENT = 16_u32
    ST_CONNECTED = 1_u32
    ST_INLIST = 64_u32
    ST_ISLOCAL = 4_u32
    ST_ISSELF = 256_u32
    ST_TERMINATED = 32_u32
  end

  @[Extern]
  record DDEACK,
    _bitfield : UInt16

  @[Extern]
  record DDEADVISE,
    _bitfield : UInt16,
    cfFormat : Int16

  @[Extern]
  record DDEDATA,
    _bitfield : UInt16,
    cfFormat : Int16,
    value : UInt8*

  @[Extern]
  record DDEPOKE,
    _bitfield : UInt16,
    cfFormat : Int16,
    value : UInt8*

  @[Extern]
  record DDELN,
    _bitfield : UInt16,
    cfFormat : Int16

  @[Extern]
  record DDEUP,
    _bitfield : UInt16,
    cfFormat : Int16,
    rgb : UInt8*

  @[Extern]
  record HSZPAIR,
    hszSvc : Win32cr::System::DataExchange::HSZ,
    hszTopic : Win32cr::System::DataExchange::HSZ

  @[Extern]
  record CONVCONTEXT,
    cb : UInt32,
    wFlags : UInt32,
    wCountryID : UInt32,
    iCodePage : Int32,
    dwLangID : UInt32,
    dwSecurity : UInt32,
    qos : Win32cr::Security::SECURITY_QUALITY_OF_SERVICE

  @[Extern]
  record CONVINFO,
    cb : UInt32,
    hUser : LibC::UIntPtrT,
    hConvPartner : Win32cr::System::DataExchange::HCONV,
    hszSvcPartner : Win32cr::System::DataExchange::HSZ,
    hszServiceReq : Win32cr::System::DataExchange::HSZ,
    hszTopic : Win32cr::System::DataExchange::HSZ,
    hszItem : Win32cr::System::DataExchange::HSZ,
    wFmt : UInt32,
    wType : Win32cr::System::DataExchange::DDE_CLIENT_TRANSACTION_TYPE,
    wStatus : Win32cr::System::DataExchange::CONVINFO_STATUS,
    wConvst : Win32cr::System::DataExchange::CONVINFO_CONVERSATION_STATE,
    wLastError : UInt32,
    hConvList : Win32cr::System::DataExchange::HCONVLIST,
    conv_ctxt : Win32cr::System::DataExchange::CONVCONTEXT,
    hwnd : Win32cr::Foundation::HWND,
    hwndPartner : Win32cr::Foundation::HWND

  @[Extern]
  record DDEML_MSG_HOOK_DATA,
    uiLo : LibC::UIntPtrT,
    uiHi : LibC::UIntPtrT,
    cbData : UInt32,
    data : UInt32[8]

  @[Extern]
  record MONMSGSTRUCT,
    cb : UInt32,
    hwndTo : Win32cr::Foundation::HWND,
    dwTime : UInt32,
    hTask : Win32cr::Foundation::HANDLE,
    wMsg : UInt32,
    wParam : Win32cr::Foundation::WPARAM,
    lParam : Win32cr::Foundation::LPARAM,
    dmhd : Win32cr::System::DataExchange::DDEML_MSG_HOOK_DATA

  @[Extern]
  record MONCBSTRUCT,
    cb : UInt32,
    dwTime : UInt32,
    hTask : Win32cr::Foundation::HANDLE,
    dwRet : UInt32,
    wType : UInt32,
    wFmt : UInt32,
    hConv : Win32cr::System::DataExchange::HCONV,
    hsz1 : Win32cr::System::DataExchange::HSZ,
    hsz2 : Win32cr::System::DataExchange::HSZ,
    hData : Win32cr::System::DataExchange::HDDEDATA,
    dwData1 : LibC::UIntPtrT,
    dwData2 : LibC::UIntPtrT,
    cc : Win32cr::System::DataExchange::CONVCONTEXT,
    cbData : UInt32,
    data : UInt32[8]

  @[Extern]
  record MONHSZSTRUCTA,
    cb : UInt32,
    fsAction : Win32cr::Foundation::BOOL,
    dwTime : UInt32,
    hsz : Win32cr::System::DataExchange::HSZ,
    hTask : Win32cr::Foundation::HANDLE,
    str : Win32cr::Foundation::CHAR*

  @[Extern]
  record MONHSZSTRUCTW,
    cb : UInt32,
    fsAction : Win32cr::Foundation::BOOL,
    dwTime : UInt32,
    hsz : Win32cr::System::DataExchange::HSZ,
    hTask : Win32cr::Foundation::HANDLE,
    str : UInt16*

  @[Extern]
  record MONERRSTRUCT,
    cb : UInt32,
    wLastError : UInt32,
    dwTime : UInt32,
    hTask : Win32cr::Foundation::HANDLE

  @[Extern]
  record MONLINKSTRUCT,
    cb : UInt32,
    dwTime : UInt32,
    hTask : Win32cr::Foundation::HANDLE,
    fEstablished : Win32cr::Foundation::BOOL,
    fNoData : Win32cr::Foundation::BOOL,
    hszSvc : Win32cr::System::DataExchange::HSZ,
    hszTopic : Win32cr::System::DataExchange::HSZ,
    hszItem : Win32cr::System::DataExchange::HSZ,
    wFmt : UInt32,
    fServer : Win32cr::Foundation::BOOL,
    hConvServer : Win32cr::System::DataExchange::HCONV,
    hConvClient : Win32cr::System::DataExchange::HCONV

  @[Extern]
  record MONCONVSTRUCT,
    cb : UInt32,
    fConnect : Win32cr::Foundation::BOOL,
    dwTime : UInt32,
    hTask : Win32cr::Foundation::HANDLE,
    hszSvc : Win32cr::System::DataExchange::HSZ,
    hszTopic : Win32cr::System::DataExchange::HSZ,
    hConvClient : Win32cr::System::DataExchange::HCONV,
    hConvServer : Win32cr::System::DataExchange::HCONV

  @[Extern]
  record METAFILEPICT,
    mm : Int32,
    xExt : Int32,
    yExt : Int32,
    hMF : Win32cr::Graphics::Gdi::HMETAFILE

  @[Extern]
  record COPYDATASTRUCT,
    dwData : LibC::UIntPtrT,
    cbData : UInt32,
    lpData : Void*

  @[Link("user32")]
  @[Link("gdi32")]
  @[Link("kernel32")]
  lib C
    fun DdeSetQualityOfService(hwndClient : Win32cr::Foundation::HWND, pqosNew : Win32cr::Security::SECURITY_QUALITY_OF_SERVICE*, pqosPrev : Win32cr::Security::SECURITY_QUALITY_OF_SERVICE*) : Win32cr::Foundation::BOOL

    fun ImpersonateDdeClientWindow(hWndClient : Win32cr::Foundation::HWND, hWndServer : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun PackDDElParam(msg : UInt32, uiLo : LibC::UIntPtrT, uiHi : LibC::UIntPtrT) : Win32cr::Foundation::LPARAM

    fun UnpackDDElParam(msg : UInt32, lParam : Win32cr::Foundation::LPARAM, puiLo : LibC::UIntPtrT*, puiHi : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    fun FreeDDElParam(msg : UInt32, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    fun ReuseDDElParam(lParam : Win32cr::Foundation::LPARAM, msgIn : UInt32, msgOut : UInt32, uiLo : LibC::UIntPtrT, uiHi : LibC::UIntPtrT) : Win32cr::Foundation::LPARAM

    fun DdeInitializeA(pidInst : UInt32*, pfnCallback : Win32cr::System::DataExchange::PFNCALLBACK, afCmd : Win32cr::System::DataExchange::DDE_INITIALIZE_COMMAND, ulRes : UInt32) : UInt32

    fun DdeInitializeW(pidInst : UInt32*, pfnCallback : Win32cr::System::DataExchange::PFNCALLBACK, afCmd : Win32cr::System::DataExchange::DDE_INITIALIZE_COMMAND, ulRes : UInt32) : UInt32

    fun DdeUninitialize(idInst : UInt32) : Win32cr::Foundation::BOOL

    fun DdeConnectList(idInst : UInt32, hszService : Win32cr::System::DataExchange::HSZ, hszTopic : Win32cr::System::DataExchange::HSZ, hConvList : Win32cr::System::DataExchange::HCONVLIST, pCC : Win32cr::System::DataExchange::CONVCONTEXT*) : Win32cr::System::DataExchange::HCONVLIST

    fun DdeQueryNextServer(hConvList : Win32cr::System::DataExchange::HCONVLIST, hConvPrev : Win32cr::System::DataExchange::HCONV) : Win32cr::System::DataExchange::HCONV

    fun DdeDisconnectList(hConvList : Win32cr::System::DataExchange::HCONVLIST) : Win32cr::Foundation::BOOL

    fun DdeConnect(idInst : UInt32, hszService : Win32cr::System::DataExchange::HSZ, hszTopic : Win32cr::System::DataExchange::HSZ, pCC : Win32cr::System::DataExchange::CONVCONTEXT*) : Win32cr::System::DataExchange::HCONV

    fun DdeDisconnect(hConv : Win32cr::System::DataExchange::HCONV) : Win32cr::Foundation::BOOL

    fun DdeReconnect(hConv : Win32cr::System::DataExchange::HCONV) : Win32cr::System::DataExchange::HCONV

    fun DdeQueryConvInfo(hConv : Win32cr::System::DataExchange::HCONV, idTransaction : UInt32, pConvInfo : Win32cr::System::DataExchange::CONVINFO*) : UInt32

    fun DdeSetUserHandle(hConv : Win32cr::System::DataExchange::HCONV, id : UInt32, hUser : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun DdeAbandonTransaction(idInst : UInt32, hConv : Win32cr::System::DataExchange::HCONV, idTransaction : UInt32) : Win32cr::Foundation::BOOL

    fun DdePostAdvise(idInst : UInt32, hszTopic : Win32cr::System::DataExchange::HSZ, hszItem : Win32cr::System::DataExchange::HSZ) : Win32cr::Foundation::BOOL

    fun DdeEnableCallback(idInst : UInt32, hConv : Win32cr::System::DataExchange::HCONV, wCmd : Win32cr::System::DataExchange::DDE_ENABLE_CALLBACK_CMD) : Win32cr::Foundation::BOOL

    fun DdeImpersonateClient(hConv : Win32cr::System::DataExchange::HCONV) : Win32cr::Foundation::BOOL

    fun DdeNameService(idInst : UInt32, hsz1 : Win32cr::System::DataExchange::HSZ, hsz2 : Win32cr::System::DataExchange::HSZ, afCmd : Win32cr::System::DataExchange::DDE_NAME_SERVICE_CMD) : Win32cr::System::DataExchange::HDDEDATA

    fun DdeClientTransaction(pData : UInt8*, cbData : UInt32, hConv : Win32cr::System::DataExchange::HCONV, hszItem : Win32cr::System::DataExchange::HSZ, wFmt : UInt32, wType : Win32cr::System::DataExchange::DDE_CLIENT_TRANSACTION_TYPE, dwTimeout : UInt32, pdwResult : UInt32*) : Win32cr::System::DataExchange::HDDEDATA

    fun DdeCreateDataHandle(idInst : UInt32, pSrc : UInt8*, cb : UInt32, cbOff : UInt32, hszItem : Win32cr::System::DataExchange::HSZ, wFmt : UInt32, afCmd : UInt32) : Win32cr::System::DataExchange::HDDEDATA

    fun DdeAddData(hData : Win32cr::System::DataExchange::HDDEDATA, pSrc : UInt8*, cb : UInt32, cbOff : UInt32) : Win32cr::System::DataExchange::HDDEDATA

    fun DdeGetData(hData : Win32cr::System::DataExchange::HDDEDATA, pDst : UInt8*, cbMax : UInt32, cbOff : UInt32) : UInt32

    fun DdeAccessData(hData : Win32cr::System::DataExchange::HDDEDATA, pcbDataSize : UInt32*) : UInt8*

    fun DdeUnaccessData(hData : Win32cr::System::DataExchange::HDDEDATA) : Win32cr::Foundation::BOOL

    fun DdeFreeDataHandle(hData : Win32cr::System::DataExchange::HDDEDATA) : Win32cr::Foundation::BOOL

    fun DdeGetLastError(idInst : UInt32) : UInt32

    fun DdeCreateStringHandleA(idInst : UInt32, psz : Win32cr::Foundation::PSTR, iCodePage : Int32) : Win32cr::System::DataExchange::HSZ

    fun DdeCreateStringHandleW(idInst : UInt32, psz : Win32cr::Foundation::PWSTR, iCodePage : Int32) : Win32cr::System::DataExchange::HSZ

    fun DdeQueryStringA(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ, psz : UInt8*, cchMax : UInt32, iCodePage : Int32) : UInt32

    fun DdeQueryStringW(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ, psz : UInt16*, cchMax : UInt32, iCodePage : Int32) : UInt32

    fun DdeFreeStringHandle(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ) : Win32cr::Foundation::BOOL

    fun DdeKeepStringHandle(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ) : Win32cr::Foundation::BOOL

    fun DdeCmpStringHandles(hsz1 : Win32cr::System::DataExchange::HSZ, hsz2 : Win32cr::System::DataExchange::HSZ) : Int32

    fun SetWinMetaFileBits(nSize : UInt32, lpMeta16Data : UInt8*, hdcRef : Win32cr::Graphics::Gdi::HDC, lpMFP : Win32cr::System::DataExchange::METAFILEPICT*) : Win32cr::Graphics::Gdi::HENHMETAFILE

    fun OpenClipboard(hWndNewOwner : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun CloseClipboard : Win32cr::Foundation::BOOL

    fun GetClipboardSequenceNumber : UInt32

    fun GetClipboardOwner : Win32cr::Foundation::HWND

    fun SetClipboardViewer(hWndNewViewer : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND

    fun GetClipboardViewer : Win32cr::Foundation::HWND

    fun ChangeClipboardChain(hWndRemove : Win32cr::Foundation::HWND, hWndNewNext : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun SetClipboardData(uFormat : UInt32, hMem : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HANDLE

    fun GetClipboardData(uFormat : UInt32) : Win32cr::Foundation::HANDLE

    fun RegisterClipboardFormatA(lpszFormat : Win32cr::Foundation::PSTR) : UInt32

    fun RegisterClipboardFormatW(lpszFormat : Win32cr::Foundation::PWSTR) : UInt32

    fun CountClipboardFormats : Int32

    fun EnumClipboardFormats(format : UInt32) : UInt32

    fun GetClipboardFormatNameA(format : UInt32, lpszFormatName : UInt8*, cchMaxCount : Int32) : Int32

    fun GetClipboardFormatNameW(format : UInt32, lpszFormatName : UInt16*, cchMaxCount : Int32) : Int32

    fun EmptyClipboard : Win32cr::Foundation::BOOL

    fun IsClipboardFormatAvailable(format : UInt32) : Win32cr::Foundation::BOOL

    fun GetPriorityClipboardFormat(paFormatPriorityList : UInt32*, cFormats : Int32) : Int32

    fun GetOpenClipboardWindow : Win32cr::Foundation::HWND

    fun AddClipboardFormatListener(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun RemoveClipboardFormatListener(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun GetUpdatedClipboardFormats(lpuiFormats : UInt32*, cFormats : UInt32, pcFormatsOut : UInt32*) : Win32cr::Foundation::BOOL

    fun GlobalDeleteAtom(nAtom : UInt16) : UInt16

    fun InitAtomTable(nSize : UInt32) : Win32cr::Foundation::BOOL

    fun DeleteAtom(nAtom : UInt16) : UInt16

    fun GlobalAddAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16

    fun GlobalAddAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16

    fun GlobalAddAtomExA(lpString : Win32cr::Foundation::PSTR, flags : UInt32) : UInt16

    fun GlobalAddAtomExW(lpString : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt16

    fun GlobalFindAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16

    fun GlobalFindAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16

    fun GlobalGetAtomNameA(nAtom : UInt16, lpBuffer : UInt8*, nSize : Int32) : UInt32

    fun GlobalGetAtomNameW(nAtom : UInt16, lpBuffer : UInt16*, nSize : Int32) : UInt32

    fun AddAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16

    fun AddAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16

    fun FindAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16

    fun FindAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16

    fun GetAtomNameA(nAtom : UInt16, lpBuffer : UInt8*, nSize : Int32) : UInt32

    fun GetAtomNameW(nAtom : UInt16, lpBuffer : UInt16*, nSize : Int32) : UInt32

  end
end