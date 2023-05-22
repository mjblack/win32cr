require "../security.cr"
require "../foundation.cr"
require "../graphics/gdi.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
@[Link(ldflags: "/DELAYLOAD:gdi32.dll")]
lib LibWin32
  alias HSZ = LibC::IntPtrT
  alias HCONV = LibC::IntPtrT
  alias HCONVLIST = LibC::IntPtrT
  alias HDDEDATA = LibC::IntPtrT

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

  alias PFNCALLBACK = Proc(UInt32, UInt32, HCONV, HSZ, HSZ, HDDEDATA, LibC::UINT_PTR, LibC::UINT_PTR, HDDEDATA)


  enum DDE_ENABLE_CALLBACK_CMD : UInt32
    EC_ENABLEALL = 0
    EC_ENABLEONE = 128
    EC_DISABLE = 8
    EC_QUERYWAITING = 2
  end

  enum DDE_INITIALIZE_COMMAND : UInt32
    APPCLASS_MONITOR = 1
    APPCLASS_STANDARD = 0
    APPCMD_CLIENTONLY = 16
    APPCMD_FILTERINITS = 32
    CBF_FAIL_ALLSVRXACTIONS = 258048
    CBF_FAIL_ADVISES = 16384
    CBF_FAIL_CONNECTIONS = 8192
    CBF_FAIL_EXECUTES = 32768
    CBF_FAIL_POKES = 65536
    CBF_FAIL_REQUESTS = 131072
    CBF_FAIL_SELFCONNECTIONS = 4096
    CBF_SKIP_ALLNOTIFICATIONS = 3932160
    CBF_SKIP_CONNECT_CONFIRMS = 262144
    CBF_SKIP_DISCONNECTS = 2097152
    CBF_SKIP_REGISTRATIONS = 524288
    CBF_SKIP_UNREGISTRATIONS = 1048576
    MF_CALLBACKS = 134217728
    MF_CONV = 1073741824
    MF_ERRORS = 268435456
    MF_HSZ_INFO = 16777216
    MF_LINKS = 536870912
    MF_POSTMSGS = 67108864
    MF_SENDMSGS = 33554432
  end

  enum DDE_NAME_SERVICE_CMD : UInt32
    DNS_REGISTER = 1
    DNS_UNREGISTER = 2
    DNS_FILTERON = 4
    DNS_FILTEROFF = 8
  end

  enum DDE_CLIENT_TRANSACTION_TYPE : UInt32
    XTYP_ADVSTART = 4144
    XTYP_ADVSTOP = 32832
    XTYP_EXECUTE = 16464
    XTYP_POKE = 16528
    XTYP_REQUEST = 8368
    XTYP_ADVDATA = 16400
    XTYP_ADVREQ = 8226
    XTYP_CONNECT = 4194
    XTYP_CONNECT_CONFIRM = 32882
    XTYP_DISCONNECT = 32962
    XTYP_MONITOR = 33010
    XTYP_REGISTER = 32930
    XTYP_UNREGISTER = 32978
    XTYP_WILDCONNECT = 8418
    XTYP_XACT_COMPLETE = 32896
  end

  enum CONVINFO_CONVERSATION_STATE : UInt32
    XST_ADVACKRCVD = 13
    XST_ADVDATAACKRCVD = 16
    XST_ADVDATASENT = 15
    XST_ADVSENT = 11
    XST_CONNECTED = 2
    XST_DATARCVD = 6
    XST_EXECACKRCVD = 10
    XST_EXECSENT = 9
    XST_INCOMPLETE = 1
    XST_INIT1 = 3
    XST_INIT2 = 4
    XST_NULL = 0
    XST_POKEACKRCVD = 8
    XST_POKESENT = 7
    XST_REQSENT = 5
    XST_UNADVACKRCVD = 14
    XST_UNADVSENT = 12
  end

  enum CONVINFO_STATUS : UInt32
    ST_ADVISE = 2
    ST_BLOCKED = 8
    ST_BLOCKNEXT = 128
    ST_CLIENT = 16
    ST_CONNECTED = 1
    ST_INLIST = 64
    ST_ISLOCAL = 4
    ST_ISSELF = 256
    ST_TERMINATED = 32
  end

  struct DDEACK
    _bitfield : UInt16
  end
  struct DDEADVISE
    _bitfield : UInt16
    cf_format : Int16
  end
  struct DDEDATA
    _bitfield : UInt16
    cf_format : Int16
    value : UInt8[0]*
  end
  struct DDEPOKE
    _bitfield : UInt16
    cf_format : Int16
    value : UInt8[0]*
  end
  struct DDELN
    _bitfield : UInt16
    cf_format : Int16
  end
  struct DDEUP
    _bitfield : UInt16
    cf_format : Int16
    rgb : UInt8[0]*
  end
  struct HSZPAIR
    hsz_svc : HSZ
    hsz_topic : HSZ
  end
  struct CONVCONTEXT
    cb : UInt32
    w_flags : UInt32
    w_country_id : UInt32
    i_code_page : Int32
    dw_lang_id : UInt32
    dw_security : UInt32
    qos : SECURITY_QUALITY_OF_SERVICE
  end
  struct CONVINFO
    cb : UInt32
    h_user : LibC::UINT_PTR
    h_conv_partner : HCONV
    hsz_svc_partner : HSZ
    hsz_service_req : HSZ
    hsz_topic : HSZ
    hsz_item : HSZ
    w_fmt : UInt32
    w_type : DDE_CLIENT_TRANSACTION_TYPE
    w_status : CONVINFO_STATUS
    w_convst : CONVINFO_CONVERSATION_STATE
    w_last_error : UInt32
    h_conv_list : HCONVLIST
    conv_ctxt : CONVCONTEXT
    hwnd : HANDLE
    hwnd_partner : HANDLE
  end
  struct DDEML_MSG_HOOK_DATA
    ui_lo : LibC::UINT_PTR
    ui_hi : LibC::UINT_PTR
    cb_data : UInt32
    data : UInt32[8]*
  end
  struct MONMSGSTRUCT
    cb : UInt32
    hwnd_to : HANDLE
    dw_time : UInt32
    h_task : LibC::HANDLE
    w_msg : UInt32
    w_param : LibC::UINT_PTR
    l_param : LPARAM
    dmhd : DDEML_MSG_HOOK_DATA
  end
  struct MONCBSTRUCT
    cb : UInt32
    dw_time : UInt32
    h_task : LibC::HANDLE
    dw_ret : UInt32
    w_type : UInt32
    w_fmt : UInt32
    h_conv : HCONV
    hsz1 : HSZ
    hsz2 : HSZ
    h_data : HDDEDATA
    dw_data1 : LibC::UINT_PTR
    dw_data2 : LibC::UINT_PTR
    cc : CONVCONTEXT
    cb_data : UInt32
    data : UInt32[8]*
  end
  struct MONHSZSTRUCTA
    cb : UInt32
    fs_action : LibC::BOOL
    dw_time : UInt32
    hsz : HSZ
    h_task : LibC::HANDLE
    str : CHAR[0]*
  end
  struct MONHSZSTRUCTW
    cb : UInt32
    fs_action : LibC::BOOL
    dw_time : UInt32
    hsz : HSZ
    h_task : LibC::HANDLE
    str : Char[0]*
  end
  struct MONERRSTRUCT
    cb : UInt32
    w_last_error : UInt32
    dw_time : UInt32
    h_task : LibC::HANDLE
  end
  struct MONLINKSTRUCT
    cb : UInt32
    dw_time : UInt32
    h_task : LibC::HANDLE
    f_established : LibC::BOOL
    f_no_data : LibC::BOOL
    hsz_svc : HSZ
    hsz_topic : HSZ
    hsz_item : HSZ
    w_fmt : UInt32
    f_server : LibC::BOOL
    h_conv_server : HCONV
    h_conv_client : HCONV
  end
  struct MONCONVSTRUCT
    cb : UInt32
    f_connect : LibC::BOOL
    dw_time : UInt32
    h_task : LibC::HANDLE
    hsz_svc : HSZ
    hsz_topic : HSZ
    h_conv_client : HCONV
    h_conv_server : HCONV
  end
  struct METAFILEPICT
    mm : Int32
    x_ext : Int32
    y_ext : Int32
    h_mf : HMETAFILE
  end
  struct COPYDATASTRUCT
    dw_data : LibC::UINT_PTR
    cb_data : UInt32
    lp_data : Void*
  end


  # Params # hwndclient : LibC::HANDLE [In],pqosnew : SECURITY_QUALITY_OF_SERVICE* [In],pqosprev : SECURITY_QUALITY_OF_SERVICE* [In]
  fun DdeSetQualityOfService(hwndclient : LibC::HANDLE, pqosnew : SECURITY_QUALITY_OF_SERVICE*, pqosprev : SECURITY_QUALITY_OF_SERVICE*) : LibC::BOOL

  # Params # hwndclient : LibC::HANDLE [In],hwndserver : LibC::HANDLE [In]
  fun ImpersonateDdeClientWindow(hwndclient : LibC::HANDLE, hwndserver : LibC::HANDLE) : LibC::BOOL

  # Params # msg : UInt32 [In],uilo : LibC::UINT_PTR [In],uihi : LibC::UINT_PTR [In]
  fun PackDDElParam(msg : UInt32, uilo : LibC::UINT_PTR, uihi : LibC::UINT_PTR) : LPARAM

  # Params # msg : UInt32 [In],lparam : LPARAM [In],puilo : LibC::UINT_PTR* [In],puihi : LibC::UINT_PTR* [In]
  fun UnpackDDElParam(msg : UInt32, lparam : LPARAM, puilo : LibC::UINT_PTR*, puihi : LibC::UINT_PTR*) : LibC::BOOL

  # Params # msg : UInt32 [In],lparam : LPARAM [In]
  fun FreeDDElParam(msg : UInt32, lparam : LPARAM) : LibC::BOOL

  # Params # lparam : LPARAM [In],msgin : UInt32 [In],msgout : UInt32 [In],uilo : LibC::UINT_PTR [In],uihi : LibC::UINT_PTR [In]
  fun ReuseDDElParam(lparam : LPARAM, msgin : UInt32, msgout : UInt32, uilo : LibC::UINT_PTR, uihi : LibC::UINT_PTR) : LPARAM

  # Params # pidinst : UInt32* [In],pfncallback : PFNCALLBACK [In],afcmd : DDE_INITIALIZE_COMMAND [In],ulres : UInt32 [In]
  fun DdeInitializeA(pidinst : UInt32*, pfncallback : PFNCALLBACK, afcmd : DDE_INITIALIZE_COMMAND, ulres : UInt32) : UInt32

  # Params # pidinst : UInt32* [In],pfncallback : PFNCALLBACK [In],afcmd : DDE_INITIALIZE_COMMAND [In],ulres : UInt32 [In]
  fun DdeInitializeW(pidinst : UInt32*, pfncallback : PFNCALLBACK, afcmd : DDE_INITIALIZE_COMMAND, ulres : UInt32) : UInt32

  # Params # idinst : UInt32 [In]
  fun DdeUninitialize(idinst : UInt32) : LibC::BOOL

  # Params # idinst : UInt32 [In],hszservice : HSZ [In],hsztopic : HSZ [In],hconvlist : HCONVLIST [In],pcc : CONVCONTEXT* [In]
  fun DdeConnectList(idinst : UInt32, hszservice : HSZ, hsztopic : HSZ, hconvlist : HCONVLIST, pcc : CONVCONTEXT*) : HCONVLIST

  # Params # hconvlist : HCONVLIST [In],hconvprev : HCONV [In]
  fun DdeQueryNextServer(hconvlist : HCONVLIST, hconvprev : HCONV) : HCONV

  # Params # hconvlist : HCONVLIST [In]
  fun DdeDisconnectList(hconvlist : HCONVLIST) : LibC::BOOL

  # Params # idinst : UInt32 [In],hszservice : HSZ [In],hsztopic : HSZ [In],pcc : CONVCONTEXT* [In]
  fun DdeConnect(idinst : UInt32, hszservice : HSZ, hsztopic : HSZ, pcc : CONVCONTEXT*) : HCONV

  # Params # hconv : HCONV [In]
  fun DdeDisconnect(hconv : HCONV) : LibC::BOOL

  # Params # hconv : HCONV [In]
  fun DdeReconnect(hconv : HCONV) : HCONV

  # Params # hconv : HCONV [In],idtransaction : UInt32 [In],pconvinfo : CONVINFO* [In]
  fun DdeQueryConvInfo(hconv : HCONV, idtransaction : UInt32, pconvinfo : CONVINFO*) : UInt32

  # Params # hconv : HCONV [In],id : UInt32 [In],huser : LibC::UINT_PTR [In]
  fun DdeSetUserHandle(hconv : HCONV, id : UInt32, huser : LibC::UINT_PTR) : LibC::BOOL

  # Params # idinst : UInt32 [In],hconv : HCONV [In],idtransaction : UInt32 [In]
  fun DdeAbandonTransaction(idinst : UInt32, hconv : HCONV, idtransaction : UInt32) : LibC::BOOL

  # Params # idinst : UInt32 [In],hsztopic : HSZ [In],hszitem : HSZ [In]
  fun DdePostAdvise(idinst : UInt32, hsztopic : HSZ, hszitem : HSZ) : LibC::BOOL

  # Params # idinst : UInt32 [In],hconv : HCONV [In],wcmd : DDE_ENABLE_CALLBACK_CMD [In]
  fun DdeEnableCallback(idinst : UInt32, hconv : HCONV, wcmd : DDE_ENABLE_CALLBACK_CMD) : LibC::BOOL

  # Params # hconv : HCONV [In]
  fun DdeImpersonateClient(hconv : HCONV) : LibC::BOOL

  # Params # idinst : UInt32 [In],hsz1 : HSZ [In],hsz2 : HSZ [In],afcmd : DDE_NAME_SERVICE_CMD [In]
  fun DdeNameService(idinst : UInt32, hsz1 : HSZ, hsz2 : HSZ, afcmd : DDE_NAME_SERVICE_CMD) : HDDEDATA

  # Params # pdata : UInt8* [In],cbdata : UInt32 [In],hconv : HCONV [In],hszitem : HSZ [In],wfmt : UInt32 [In],wtype : DDE_CLIENT_TRANSACTION_TYPE [In],dwtimeout : UInt32 [In],pdwresult : UInt32* [In]
  fun DdeClientTransaction(pdata : UInt8*, cbdata : UInt32, hconv : HCONV, hszitem : HSZ, wfmt : UInt32, wtype : DDE_CLIENT_TRANSACTION_TYPE, dwtimeout : UInt32, pdwresult : UInt32*) : HDDEDATA

  # Params # idinst : UInt32 [In],psrc : UInt8* [In],cb : UInt32 [In],cboff : UInt32 [In],hszitem : HSZ [In],wfmt : UInt32 [In],afcmd : UInt32 [In]
  fun DdeCreateDataHandle(idinst : UInt32, psrc : UInt8*, cb : UInt32, cboff : UInt32, hszitem : HSZ, wfmt : UInt32, afcmd : UInt32) : HDDEDATA

  # Params # hdata : HDDEDATA [In],psrc : UInt8* [In],cb : UInt32 [In],cboff : UInt32 [In]
  fun DdeAddData(hdata : HDDEDATA, psrc : UInt8*, cb : UInt32, cboff : UInt32) : HDDEDATA

  # Params # hdata : HDDEDATA [In],pdst : UInt8* [In],cbmax : UInt32 [In],cboff : UInt32 [In]
  fun DdeGetData(hdata : HDDEDATA, pdst : UInt8*, cbmax : UInt32, cboff : UInt32) : UInt32

  # Params # hdata : HDDEDATA [In],pcbdatasize : UInt32* [In]
  fun DdeAccessData(hdata : HDDEDATA, pcbdatasize : UInt32*) : UInt8*

  # Params # hdata : HDDEDATA [In]
  fun DdeUnaccessData(hdata : HDDEDATA) : LibC::BOOL

  # Params # hdata : HDDEDATA [In]
  fun DdeFreeDataHandle(hdata : HDDEDATA) : LibC::BOOL

  # Params # idinst : UInt32 [In]
  fun DdeGetLastError(idinst : UInt32) : UInt32

  # Params # idinst : UInt32 [In],psz : PSTR [In],icodepage : Int32 [In]
  fun DdeCreateStringHandleA(idinst : UInt32, psz : PSTR, icodepage : Int32) : HSZ

  # Params # idinst : UInt32 [In],psz : LibC::LPWSTR [In],icodepage : Int32 [In]
  fun DdeCreateStringHandleW(idinst : UInt32, psz : LibC::LPWSTR, icodepage : Int32) : HSZ

  # Params # idinst : UInt32 [In],hsz : HSZ [In],psz : UInt8* [In],cchmax : UInt32 [In],icodepage : Int32 [In]
  fun DdeQueryStringA(idinst : UInt32, hsz : HSZ, psz : UInt8*, cchmax : UInt32, icodepage : Int32) : UInt32

  # Params # idinst : UInt32 [In],hsz : HSZ [In],psz : Char* [In],cchmax : UInt32 [In],icodepage : Int32 [In]
  fun DdeQueryStringW(idinst : UInt32, hsz : HSZ, psz : Char*, cchmax : UInt32, icodepage : Int32) : UInt32

  # Params # idinst : UInt32 [In],hsz : HSZ [In]
  fun DdeFreeStringHandle(idinst : UInt32, hsz : HSZ) : LibC::BOOL

  # Params # idinst : UInt32 [In],hsz : HSZ [In]
  fun DdeKeepStringHandle(idinst : UInt32, hsz : HSZ) : LibC::BOOL

  # Params # hsz1 : HSZ [In],hsz2 : HSZ [In]
  fun DdeCmpStringHandles(hsz1 : HSZ, hsz2 : HSZ) : Int32

  # Params # nsize : UInt32 [In],lpmeta16data : UInt8* [In],hdcref : HDC [In],lpmfp : METAFILEPICT* [In]
  fun SetWinMetaFileBits(nsize : UInt32, lpmeta16data : UInt8*, hdcref : HDC, lpmfp : METAFILEPICT*) : HENHMETAFILE

  # Params # hwndnewowner : LibC::HANDLE [In]
  fun OpenClipboard(hwndnewowner : LibC::HANDLE) : LibC::BOOL

  # Params # 
  fun CloseClipboard : LibC::BOOL

  # Params # 
  fun GetClipboardSequenceNumber : UInt32

  # Params # 
  fun GetClipboardOwner : HANDLE

  # Params # hwndnewviewer : LibC::HANDLE [In]
  fun SetClipboardViewer(hwndnewviewer : LibC::HANDLE) : HANDLE

  # Params # 
  fun GetClipboardViewer : HANDLE

  # Params # hwndremove : LibC::HANDLE [In],hwndnewnext : LibC::HANDLE [In]
  fun ChangeClipboardChain(hwndremove : LibC::HANDLE, hwndnewnext : LibC::HANDLE) : LibC::BOOL

  # Params # uformat : UInt32 [In],hmem : LibC::HANDLE [In]
  fun SetClipboardData(uformat : UInt32, hmem : LibC::HANDLE) : LibC::HANDLE

  # Params # uformat : UInt32 [In]
  fun GetClipboardData(uformat : UInt32) : LibC::HANDLE

  # Params # lpszformat : PSTR [In]
  fun RegisterClipboardFormatA(lpszformat : PSTR) : UInt32

  # Params # lpszformat : LibC::LPWSTR [In]
  fun RegisterClipboardFormatW(lpszformat : LibC::LPWSTR) : UInt32

  # Params # 
  fun CountClipboardFormats : Int32

  # Params # format : UInt32 [In]
  fun EnumClipboardFormats(format : UInt32) : UInt32

  # Params # format : UInt32 [In],lpszformatname : UInt8* [In],cchmaxcount : Int32 [In]
  fun GetClipboardFormatNameA(format : UInt32, lpszformatname : UInt8*, cchmaxcount : Int32) : Int32

  # Params # format : UInt32 [In],lpszformatname : Char* [In],cchmaxcount : Int32 [In]
  fun GetClipboardFormatNameW(format : UInt32, lpszformatname : Char*, cchmaxcount : Int32) : Int32

  # Params # 
  fun EmptyClipboard : LibC::BOOL

  # Params # format : UInt32 [In]
  fun IsClipboardFormatAvailable(format : UInt32) : LibC::BOOL

  # Params # paformatprioritylist : UInt32* [In],cformats : Int32 [In]
  fun GetPriorityClipboardFormat(paformatprioritylist : UInt32*, cformats : Int32) : Int32

  # Params # 
  fun GetOpenClipboardWindow : HANDLE

  # Params # hwnd : LibC::HANDLE [In]
  fun AddClipboardFormatListener(hwnd : LibC::HANDLE) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun RemoveClipboardFormatListener(hwnd : LibC::HANDLE) : LibC::BOOL

  # Params # lpuiformats : UInt32* [In],cformats : UInt32 [In],pcformatsout : UInt32* [In]
  fun GetUpdatedClipboardFormats(lpuiformats : UInt32*, cformats : UInt32, pcformatsout : UInt32*) : LibC::BOOL

  # Params # natom : UInt16 [In]
  fun GlobalDeleteAtom(natom : UInt16) : UInt16

  # Params # nsize : UInt32 [In]
  fun InitAtomTable(nsize : UInt32) : LibC::BOOL

  # Params # natom : UInt16 [In]
  fun DeleteAtom(natom : UInt16) : UInt16

  # Params # lpstring : PSTR [In]
  fun GlobalAddAtomA(lpstring : PSTR) : UInt16

  # Params # lpstring : LibC::LPWSTR [In]
  fun GlobalAddAtomW(lpstring : LibC::LPWSTR) : UInt16

  # Params # lpstring : PSTR [In],flags : UInt32 [In]
  fun GlobalAddAtomExA(lpstring : PSTR, flags : UInt32) : UInt16

  # Params # lpstring : LibC::LPWSTR [In],flags : UInt32 [In]
  fun GlobalAddAtomExW(lpstring : LibC::LPWSTR, flags : UInt32) : UInt16

  # Params # lpstring : PSTR [In]
  fun GlobalFindAtomA(lpstring : PSTR) : UInt16

  # Params # lpstring : LibC::LPWSTR [In]
  fun GlobalFindAtomW(lpstring : LibC::LPWSTR) : UInt16

  # Params # natom : UInt16 [In],lpbuffer : UInt8* [In],nsize : Int32 [In]
  fun GlobalGetAtomNameA(natom : UInt16, lpbuffer : UInt8*, nsize : Int32) : UInt32

  # Params # natom : UInt16 [In],lpbuffer : Char* [In],nsize : Int32 [In]
  fun GlobalGetAtomNameW(natom : UInt16, lpbuffer : Char*, nsize : Int32) : UInt32

  # Params # lpstring : PSTR [In]
  fun AddAtomA(lpstring : PSTR) : UInt16

  # Params # lpstring : LibC::LPWSTR [In]
  fun AddAtomW(lpstring : LibC::LPWSTR) : UInt16

  # Params # lpstring : PSTR [In]
  fun FindAtomA(lpstring : PSTR) : UInt16

  # Params # lpstring : LibC::LPWSTR [In]
  fun FindAtomW(lpstring : LibC::LPWSTR) : UInt16

  # Params # natom : UInt16 [In],lpbuffer : UInt8* [In],nsize : Int32 [In]
  fun GetAtomNameA(natom : UInt16, lpbuffer : UInt8*, nsize : Int32) : UInt32

  # Params # natom : UInt16 [In],lpbuffer : Char* [In],nsize : Int32 [In]
  fun GetAtomNameW(natom : UInt16, lpbuffer : Char*, nsize : Int32) : UInt32
end
