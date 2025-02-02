require "./../security.cr"
require "./../foundation.cr"
require "./../graphics/gdi.cr"

module Win32cr::System::DataExchange
  extend self
  alias HSZ = LibC::IntPtrT
  alias HCONV = LibC::IntPtrT
  alias HCONVLIST = LibC::IntPtrT
  alias HDDEDATA = LibC::IntPtrT
  alias PFNCALLBACK = Proc(UInt32, UInt32, Win32cr::System::DataExchange::HCONV, Win32cr::System::DataExchange::HSZ, Win32cr::System::DataExchange::HSZ, Win32cr::System::DataExchange::HDDEDATA, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::System::DataExchange::HDDEDATA)

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
  struct DDEACK
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
  end

  @[Extern]
  struct DDEADVISE
    property _bitfield : UInt16
    property cfFormat : Int16
    def initialize(@_bitfield : UInt16, @cfFormat : Int16)
    end
  end

  @[Extern]
  struct DDEDATA
    property _bitfield : UInt16
    property cfFormat : Int16
    property value : UInt8*
    def initialize(@_bitfield : UInt16, @cfFormat : Int16, @value : UInt8*)
    end
  end

  @[Extern]
  struct DDEPOKE
    property _bitfield : UInt16
    property cfFormat : Int16
    property value : UInt8*
    def initialize(@_bitfield : UInt16, @cfFormat : Int16, @value : UInt8*)
    end
  end

  @[Extern]
  struct DDELN
    property _bitfield : UInt16
    property cfFormat : Int16
    def initialize(@_bitfield : UInt16, @cfFormat : Int16)
    end
  end

  @[Extern]
  struct DDEUP
    property _bitfield : UInt16
    property cfFormat : Int16
    property rgb : UInt8*
    def initialize(@_bitfield : UInt16, @cfFormat : Int16, @rgb : UInt8*)
    end
  end

  @[Extern]
  struct HSZPAIR
    property hszSvc : Win32cr::System::DataExchange::HSZ
    property hszTopic : Win32cr::System::DataExchange::HSZ
    def initialize(@hszSvc : Win32cr::System::DataExchange::HSZ, @hszTopic : Win32cr::System::DataExchange::HSZ)
    end
  end

  @[Extern]
  struct CONVCONTEXT
    property cb : UInt32
    property wFlags : UInt32
    property wCountryID : UInt32
    property iCodePage : Int32
    property dwLangID : UInt32
    property dwSecurity : UInt32
    property qos : Win32cr::Security::SECURITY_QUALITY_OF_SERVICE
    def initialize(@cb : UInt32, @wFlags : UInt32, @wCountryID : UInt32, @iCodePage : Int32, @dwLangID : UInt32, @dwSecurity : UInt32, @qos : Win32cr::Security::SECURITY_QUALITY_OF_SERVICE)
    end
  end

  @[Extern]
  struct CONVINFO
    property cb : UInt32
    property hUser : LibC::UIntPtrT
    property hConvPartner : Win32cr::System::DataExchange::HCONV
    property hszSvcPartner : Win32cr::System::DataExchange::HSZ
    property hszServiceReq : Win32cr::System::DataExchange::HSZ
    property hszTopic : Win32cr::System::DataExchange::HSZ
    property hszItem : Win32cr::System::DataExchange::HSZ
    property wFmt : UInt32
    property wType : Win32cr::System::DataExchange::DDE_CLIENT_TRANSACTION_TYPE
    property wStatus : Win32cr::System::DataExchange::CONVINFO_STATUS
    property wConvst : Win32cr::System::DataExchange::CONVINFO_CONVERSATION_STATE
    property wLastError : UInt32
    property hConvList : Win32cr::System::DataExchange::HCONVLIST
    property conv_ctxt : Win32cr::System::DataExchange::CONVCONTEXT
    property hwnd : Win32cr::Foundation::HWND
    property hwndPartner : Win32cr::Foundation::HWND
    def initialize(@cb : UInt32, @hUser : LibC::UIntPtrT, @hConvPartner : Win32cr::System::DataExchange::HCONV, @hszSvcPartner : Win32cr::System::DataExchange::HSZ, @hszServiceReq : Win32cr::System::DataExchange::HSZ, @hszTopic : Win32cr::System::DataExchange::HSZ, @hszItem : Win32cr::System::DataExchange::HSZ, @wFmt : UInt32, @wType : Win32cr::System::DataExchange::DDE_CLIENT_TRANSACTION_TYPE, @wStatus : Win32cr::System::DataExchange::CONVINFO_STATUS, @wConvst : Win32cr::System::DataExchange::CONVINFO_CONVERSATION_STATE, @wLastError : UInt32, @hConvList : Win32cr::System::DataExchange::HCONVLIST, @conv_ctxt : Win32cr::System::DataExchange::CONVCONTEXT, @hwnd : Win32cr::Foundation::HWND, @hwndPartner : Win32cr::Foundation::HWND)
    end
  end

  @[Extern]
  struct DDEML_MSG_HOOK_DATA
    property uiLo : LibC::UIntPtrT
    property uiHi : LibC::UIntPtrT
    property cbData : UInt32
    property data : UInt32[8]
    def initialize(@uiLo : LibC::UIntPtrT, @uiHi : LibC::UIntPtrT, @cbData : UInt32, @data : UInt32[8])
    end
  end

  @[Extern]
  struct MONMSGSTRUCT
    property cb : UInt32
    property hwndTo : Win32cr::Foundation::HWND
    property dwTime : UInt32
    property hTask : Win32cr::Foundation::HANDLE
    property wMsg : UInt32
    property wParam : Win32cr::Foundation::WPARAM
    property lParam : Win32cr::Foundation::LPARAM
    property dmhd : Win32cr::System::DataExchange::DDEML_MSG_HOOK_DATA
    def initialize(@cb : UInt32, @hwndTo : Win32cr::Foundation::HWND, @dwTime : UInt32, @hTask : Win32cr::Foundation::HANDLE, @wMsg : UInt32, @wParam : Win32cr::Foundation::WPARAM, @lParam : Win32cr::Foundation::LPARAM, @dmhd : Win32cr::System::DataExchange::DDEML_MSG_HOOK_DATA)
    end
  end

  @[Extern]
  struct MONCBSTRUCT
    property cb : UInt32
    property dwTime : UInt32
    property hTask : Win32cr::Foundation::HANDLE
    property dwRet : UInt32
    property wType : UInt32
    property wFmt : UInt32
    property hConv : Win32cr::System::DataExchange::HCONV
    property hsz1 : Win32cr::System::DataExchange::HSZ
    property hsz2 : Win32cr::System::DataExchange::HSZ
    property hData : Win32cr::System::DataExchange::HDDEDATA
    property dwData1 : LibC::UIntPtrT
    property dwData2 : LibC::UIntPtrT
    property cc : Win32cr::System::DataExchange::CONVCONTEXT
    property cbData : UInt32
    property data : UInt32[8]
    def initialize(@cb : UInt32, @dwTime : UInt32, @hTask : Win32cr::Foundation::HANDLE, @dwRet : UInt32, @wType : UInt32, @wFmt : UInt32, @hConv : Win32cr::System::DataExchange::HCONV, @hsz1 : Win32cr::System::DataExchange::HSZ, @hsz2 : Win32cr::System::DataExchange::HSZ, @hData : Win32cr::System::DataExchange::HDDEDATA, @dwData1 : LibC::UIntPtrT, @dwData2 : LibC::UIntPtrT, @cc : Win32cr::System::DataExchange::CONVCONTEXT, @cbData : UInt32, @data : UInt32[8])
    end
  end

  @[Extern]
  struct MONHSZSTRUCTA
    property cb : UInt32
    property fsAction : Win32cr::Foundation::BOOL
    property dwTime : UInt32
    property hsz : Win32cr::System::DataExchange::HSZ
    property hTask : Win32cr::Foundation::HANDLE
    property str : Win32cr::Foundation::CHAR*
    def initialize(@cb : UInt32, @fsAction : Win32cr::Foundation::BOOL, @dwTime : UInt32, @hsz : Win32cr::System::DataExchange::HSZ, @hTask : Win32cr::Foundation::HANDLE, @str : Win32cr::Foundation::CHAR*)
    end
  end

  @[Extern]
  struct MONHSZSTRUCTW
    property cb : UInt32
    property fsAction : Win32cr::Foundation::BOOL
    property dwTime : UInt32
    property hsz : Win32cr::System::DataExchange::HSZ
    property hTask : Win32cr::Foundation::HANDLE
    property str : UInt16*
    def initialize(@cb : UInt32, @fsAction : Win32cr::Foundation::BOOL, @dwTime : UInt32, @hsz : Win32cr::System::DataExchange::HSZ, @hTask : Win32cr::Foundation::HANDLE, @str : UInt16*)
    end
  end

  @[Extern]
  struct MONERRSTRUCT
    property cb : UInt32
    property wLastError : UInt32
    property dwTime : UInt32
    property hTask : Win32cr::Foundation::HANDLE
    def initialize(@cb : UInt32, @wLastError : UInt32, @dwTime : UInt32, @hTask : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct MONLINKSTRUCT
    property cb : UInt32
    property dwTime : UInt32
    property hTask : Win32cr::Foundation::HANDLE
    property fEstablished : Win32cr::Foundation::BOOL
    property fNoData : Win32cr::Foundation::BOOL
    property hszSvc : Win32cr::System::DataExchange::HSZ
    property hszTopic : Win32cr::System::DataExchange::HSZ
    property hszItem : Win32cr::System::DataExchange::HSZ
    property wFmt : UInt32
    property fServer : Win32cr::Foundation::BOOL
    property hConvServer : Win32cr::System::DataExchange::HCONV
    property hConvClient : Win32cr::System::DataExchange::HCONV
    def initialize(@cb : UInt32, @dwTime : UInt32, @hTask : Win32cr::Foundation::HANDLE, @fEstablished : Win32cr::Foundation::BOOL, @fNoData : Win32cr::Foundation::BOOL, @hszSvc : Win32cr::System::DataExchange::HSZ, @hszTopic : Win32cr::System::DataExchange::HSZ, @hszItem : Win32cr::System::DataExchange::HSZ, @wFmt : UInt32, @fServer : Win32cr::Foundation::BOOL, @hConvServer : Win32cr::System::DataExchange::HCONV, @hConvClient : Win32cr::System::DataExchange::HCONV)
    end
  end

  @[Extern]
  struct MONCONVSTRUCT
    property cb : UInt32
    property fConnect : Win32cr::Foundation::BOOL
    property dwTime : UInt32
    property hTask : Win32cr::Foundation::HANDLE
    property hszSvc : Win32cr::System::DataExchange::HSZ
    property hszTopic : Win32cr::System::DataExchange::HSZ
    property hConvClient : Win32cr::System::DataExchange::HCONV
    property hConvServer : Win32cr::System::DataExchange::HCONV
    def initialize(@cb : UInt32, @fConnect : Win32cr::Foundation::BOOL, @dwTime : UInt32, @hTask : Win32cr::Foundation::HANDLE, @hszSvc : Win32cr::System::DataExchange::HSZ, @hszTopic : Win32cr::System::DataExchange::HSZ, @hConvClient : Win32cr::System::DataExchange::HCONV, @hConvServer : Win32cr::System::DataExchange::HCONV)
    end
  end

  @[Extern]
  struct METAFILEPICT
    property mm : Int32
    property xExt : Int32
    property yExt : Int32
    property hMF : Win32cr::Graphics::Gdi::HMETAFILE
    def initialize(@mm : Int32, @xExt : Int32, @yExt : Int32, @hMF : Win32cr::Graphics::Gdi::HMETAFILE)
    end
  end

  @[Extern]
  struct COPYDATASTRUCT
    property dwData : LibC::UIntPtrT
    property cbData : UInt32
    property lpData : Void*
    def initialize(@dwData : LibC::UIntPtrT, @cbData : UInt32, @lpData : Void*)
    end
  end

  def ddeSetQualityOfService(hwndClient : Win32cr::Foundation::HWND, pqosNew : Win32cr::Security::SECURITY_QUALITY_OF_SERVICE*, pqosPrev : Win32cr::Security::SECURITY_QUALITY_OF_SERVICE*) : Win32cr::Foundation::BOOL
    C.DdeSetQualityOfService(hwndClient, pqosNew, pqosPrev)
  end

  def impersonateDdeClientWindow(hWndClient : Win32cr::Foundation::HWND, hWndServer : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL
    C.ImpersonateDdeClientWindow(hWndClient, hWndServer)
  end

  def packDDElParam(msg : UInt32, uiLo : LibC::UIntPtrT, uiHi : LibC::UIntPtrT) : Win32cr::Foundation::LPARAM
    C.PackDDElParam(msg, uiLo, uiHi)
  end

  def unpackDDElParam(msg : UInt32, lParam : Win32cr::Foundation::LPARAM, puiLo : LibC::UIntPtrT*, puiHi : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.UnpackDDElParam(msg, lParam, puiLo, puiHi)
  end

  def freeDDElParam(msg : UInt32, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL
    C.FreeDDElParam(msg, lParam)
  end

  def reuseDDElParam(lParam : Win32cr::Foundation::LPARAM, msgIn : UInt32, msgOut : UInt32, uiLo : LibC::UIntPtrT, uiHi : LibC::UIntPtrT) : Win32cr::Foundation::LPARAM
    C.ReuseDDElParam(lParam, msgIn, msgOut, uiLo, uiHi)
  end

  def ddeInitializeA(pidInst : UInt32*, pfnCallback : Win32cr::System::DataExchange::PFNCALLBACK, afCmd : Win32cr::System::DataExchange::DDE_INITIALIZE_COMMAND, ulRes : UInt32) : UInt32
    C.DdeInitializeA(pidInst, pfnCallback, afCmd, ulRes)
  end

  def ddeInitializeW(pidInst : UInt32*, pfnCallback : Win32cr::System::DataExchange::PFNCALLBACK, afCmd : Win32cr::System::DataExchange::DDE_INITIALIZE_COMMAND, ulRes : UInt32) : UInt32
    C.DdeInitializeW(pidInst, pfnCallback, afCmd, ulRes)
  end

  def ddeUninitialize(idInst : UInt32) : Win32cr::Foundation::BOOL
    C.DdeUninitialize(idInst)
  end

  def ddeConnectList(idInst : UInt32, hszService : Win32cr::System::DataExchange::HSZ, hszTopic : Win32cr::System::DataExchange::HSZ, hConvList : Win32cr::System::DataExchange::HCONVLIST, pCC : Win32cr::System::DataExchange::CONVCONTEXT*) : Win32cr::System::DataExchange::HCONVLIST
    C.DdeConnectList(idInst, hszService, hszTopic, hConvList, pCC)
  end

  def ddeQueryNextServer(hConvList : Win32cr::System::DataExchange::HCONVLIST, hConvPrev : Win32cr::System::DataExchange::HCONV) : Win32cr::System::DataExchange::HCONV
    C.DdeQueryNextServer(hConvList, hConvPrev)
  end

  def ddeDisconnectList(hConvList : Win32cr::System::DataExchange::HCONVLIST) : Win32cr::Foundation::BOOL
    C.DdeDisconnectList(hConvList)
  end

  def ddeConnect(idInst : UInt32, hszService : Win32cr::System::DataExchange::HSZ, hszTopic : Win32cr::System::DataExchange::HSZ, pCC : Win32cr::System::DataExchange::CONVCONTEXT*) : Win32cr::System::DataExchange::HCONV
    C.DdeConnect(idInst, hszService, hszTopic, pCC)
  end

  def ddeDisconnect(hConv : Win32cr::System::DataExchange::HCONV) : Win32cr::Foundation::BOOL
    C.DdeDisconnect(hConv)
  end

  def ddeReconnect(hConv : Win32cr::System::DataExchange::HCONV) : Win32cr::System::DataExchange::HCONV
    C.DdeReconnect(hConv)
  end

  def ddeQueryConvInfo(hConv : Win32cr::System::DataExchange::HCONV, idTransaction : UInt32, pConvInfo : Win32cr::System::DataExchange::CONVINFO*) : UInt32
    C.DdeQueryConvInfo(hConv, idTransaction, pConvInfo)
  end

  def ddeSetUserHandle(hConv : Win32cr::System::DataExchange::HCONV, id : UInt32, hUser : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.DdeSetUserHandle(hConv, id, hUser)
  end

  def ddeAbandonTransaction(idInst : UInt32, hConv : Win32cr::System::DataExchange::HCONV, idTransaction : UInt32) : Win32cr::Foundation::BOOL
    C.DdeAbandonTransaction(idInst, hConv, idTransaction)
  end

  def ddePostAdvise(idInst : UInt32, hszTopic : Win32cr::System::DataExchange::HSZ, hszItem : Win32cr::System::DataExchange::HSZ) : Win32cr::Foundation::BOOL
    C.DdePostAdvise(idInst, hszTopic, hszItem)
  end

  def ddeEnableCallback(idInst : UInt32, hConv : Win32cr::System::DataExchange::HCONV, wCmd : Win32cr::System::DataExchange::DDE_ENABLE_CALLBACK_CMD) : Win32cr::Foundation::BOOL
    C.DdeEnableCallback(idInst, hConv, wCmd)
  end

  def ddeImpersonateClient(hConv : Win32cr::System::DataExchange::HCONV) : Win32cr::Foundation::BOOL
    C.DdeImpersonateClient(hConv)
  end

  def ddeNameService(idInst : UInt32, hsz1 : Win32cr::System::DataExchange::HSZ, hsz2 : Win32cr::System::DataExchange::HSZ, afCmd : Win32cr::System::DataExchange::DDE_NAME_SERVICE_CMD) : Win32cr::System::DataExchange::HDDEDATA
    C.DdeNameService(idInst, hsz1, hsz2, afCmd)
  end

  def ddeClientTransaction(pData : UInt8*, cbData : UInt32, hConv : Win32cr::System::DataExchange::HCONV, hszItem : Win32cr::System::DataExchange::HSZ, wFmt : UInt32, wType : Win32cr::System::DataExchange::DDE_CLIENT_TRANSACTION_TYPE, dwTimeout : UInt32, pdwResult : UInt32*) : Win32cr::System::DataExchange::HDDEDATA
    C.DdeClientTransaction(pData, cbData, hConv, hszItem, wFmt, wType, dwTimeout, pdwResult)
  end

  def ddeCreateDataHandle(idInst : UInt32, pSrc : UInt8*, cb : UInt32, cbOff : UInt32, hszItem : Win32cr::System::DataExchange::HSZ, wFmt : UInt32, afCmd : UInt32) : Win32cr::System::DataExchange::HDDEDATA
    C.DdeCreateDataHandle(idInst, pSrc, cb, cbOff, hszItem, wFmt, afCmd)
  end

  def ddeAddData(hData : Win32cr::System::DataExchange::HDDEDATA, pSrc : UInt8*, cb : UInt32, cbOff : UInt32) : Win32cr::System::DataExchange::HDDEDATA
    C.DdeAddData(hData, pSrc, cb, cbOff)
  end

  def ddeGetData(hData : Win32cr::System::DataExchange::HDDEDATA, pDst : UInt8*, cbMax : UInt32, cbOff : UInt32) : UInt32
    C.DdeGetData(hData, pDst, cbMax, cbOff)
  end

  def ddeAccessData(hData : Win32cr::System::DataExchange::HDDEDATA, pcbDataSize : UInt32*) : UInt8*
    C.DdeAccessData(hData, pcbDataSize)
  end

  def ddeUnaccessData(hData : Win32cr::System::DataExchange::HDDEDATA) : Win32cr::Foundation::BOOL
    C.DdeUnaccessData(hData)
  end

  def ddeFreeDataHandle(hData : Win32cr::System::DataExchange::HDDEDATA) : Win32cr::Foundation::BOOL
    C.DdeFreeDataHandle(hData)
  end

  def ddeGetLastError(idInst : UInt32) : UInt32
    C.DdeGetLastError(idInst)
  end

  def ddeCreateStringHandleA(idInst : UInt32, psz : Win32cr::Foundation::PSTR, iCodePage : Int32) : Win32cr::System::DataExchange::HSZ
    C.DdeCreateStringHandleA(idInst, psz, iCodePage)
  end

  def ddeCreateStringHandleW(idInst : UInt32, psz : Win32cr::Foundation::PWSTR, iCodePage : Int32) : Win32cr::System::DataExchange::HSZ
    C.DdeCreateStringHandleW(idInst, psz, iCodePage)
  end

  def ddeQueryStringA(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ, psz : UInt8*, cchMax : UInt32, iCodePage : Int32) : UInt32
    C.DdeQueryStringA(idInst, hsz, psz, cchMax, iCodePage)
  end

  def ddeQueryStringW(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ, psz : UInt16*, cchMax : UInt32, iCodePage : Int32) : UInt32
    C.DdeQueryStringW(idInst, hsz, psz, cchMax, iCodePage)
  end

  def ddeFreeStringHandle(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ) : Win32cr::Foundation::BOOL
    C.DdeFreeStringHandle(idInst, hsz)
  end

  def ddeKeepStringHandle(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ) : Win32cr::Foundation::BOOL
    C.DdeKeepStringHandle(idInst, hsz)
  end

  def ddeCmpStringHandles(hsz1 : Win32cr::System::DataExchange::HSZ, hsz2 : Win32cr::System::DataExchange::HSZ) : Int32
    C.DdeCmpStringHandles(hsz1, hsz2)
  end

  def setWinMetaFileBits(nSize : UInt32, lpMeta16Data : UInt8*, hdcRef : Win32cr::Graphics::Gdi::HDC, lpMFP : Win32cr::System::DataExchange::METAFILEPICT*) : Win32cr::Graphics::Gdi::HENHMETAFILE
    C.SetWinMetaFileBits(nSize, lpMeta16Data, hdcRef, lpMFP)
  end

  def openClipboard(hWndNewOwner : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL
    C.OpenClipboard(hWndNewOwner)
  end

  def closeClipboard : Win32cr::Foundation::BOOL
    C.CloseClipboard
  end

  def getClipboardSequenceNumber : UInt32
    C.GetClipboardSequenceNumber
  end

  def getClipboardOwner : Win32cr::Foundation::HWND
    C.GetClipboardOwner
  end

  def setClipboardViewer(hWndNewViewer : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND
    C.SetClipboardViewer(hWndNewViewer)
  end

  def getClipboardViewer : Win32cr::Foundation::HWND
    C.GetClipboardViewer
  end

  def changeClipboardChain(hWndRemove : Win32cr::Foundation::HWND, hWndNewNext : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL
    C.ChangeClipboardChain(hWndRemove, hWndNewNext)
  end

  def setClipboardData(uFormat : UInt32, hMem : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HANDLE
    C.SetClipboardData(uFormat, hMem)
  end

  def getClipboardData(uFormat : UInt32) : Win32cr::Foundation::HANDLE
    C.GetClipboardData(uFormat)
  end

  def registerClipboardFormatA(lpszFormat : Win32cr::Foundation::PSTR) : UInt32
    C.RegisterClipboardFormatA(lpszFormat)
  end

  def registerClipboardFormatW(lpszFormat : Win32cr::Foundation::PWSTR) : UInt32
    C.RegisterClipboardFormatW(lpszFormat)
  end

  def countClipboardFormats : Int32
    C.CountClipboardFormats
  end

  def enumClipboardFormats(format : UInt32) : UInt32
    C.EnumClipboardFormats(format)
  end

  def getClipboardFormatNameA(format : UInt32, lpszFormatName : UInt8*, cchMaxCount : Int32) : Int32
    C.GetClipboardFormatNameA(format, lpszFormatName, cchMaxCount)
  end

  def getClipboardFormatNameW(format : UInt32, lpszFormatName : UInt16*, cchMaxCount : Int32) : Int32
    C.GetClipboardFormatNameW(format, lpszFormatName, cchMaxCount)
  end

  def emptyClipboard : Win32cr::Foundation::BOOL
    C.EmptyClipboard
  end

  def isClipboardFormatAvailable(format : UInt32) : Win32cr::Foundation::BOOL
    C.IsClipboardFormatAvailable(format)
  end

  def getPriorityClipboardFormat(paFormatPriorityList : UInt32*, cFormats : Int32) : Int32
    C.GetPriorityClipboardFormat(paFormatPriorityList, cFormats)
  end

  def getOpenClipboardWindow : Win32cr::Foundation::HWND
    C.GetOpenClipboardWindow
  end

  def addClipboardFormatListener(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL
    C.AddClipboardFormatListener(hwnd)
  end

  def removeClipboardFormatListener(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL
    C.RemoveClipboardFormatListener(hwnd)
  end

  def getUpdatedClipboardFormats(lpuiFormats : UInt32*, cFormats : UInt32, pcFormatsOut : UInt32*) : Win32cr::Foundation::BOOL
    C.GetUpdatedClipboardFormats(lpuiFormats, cFormats, pcFormatsOut)
  end

  def globalDeleteAtom(nAtom : UInt16) : UInt16
    C.GlobalDeleteAtom(nAtom)
  end

  def initAtomTable(nSize : UInt32) : Win32cr::Foundation::BOOL
    C.InitAtomTable(nSize)
  end

  def deleteAtom(nAtom : UInt16) : UInt16
    C.DeleteAtom(nAtom)
  end

  def globalAddAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16
    C.GlobalAddAtomA(lpString)
  end

  def globalAddAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16
    C.GlobalAddAtomW(lpString)
  end

  def globalAddAtomExA(lpString : Win32cr::Foundation::PSTR, flags : UInt32) : UInt16
    C.GlobalAddAtomExA(lpString, flags)
  end

  def globalAddAtomExW(lpString : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt16
    C.GlobalAddAtomExW(lpString, flags)
  end

  def globalFindAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16
    C.GlobalFindAtomA(lpString)
  end

  def globalFindAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16
    C.GlobalFindAtomW(lpString)
  end

  def globalGetAtomNameA(nAtom : UInt16, lpBuffer : UInt8*, nSize : Int32) : UInt32
    C.GlobalGetAtomNameA(nAtom, lpBuffer, nSize)
  end

  def globalGetAtomNameW(nAtom : UInt16, lpBuffer : UInt16*, nSize : Int32) : UInt32
    C.GlobalGetAtomNameW(nAtom, lpBuffer, nSize)
  end

  def addAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16
    C.AddAtomA(lpString)
  end

  def addAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16
    C.AddAtomW(lpString)
  end

  def findAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16
    C.FindAtomA(lpString)
  end

  def findAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16
    C.FindAtomW(lpString)
  end

  def getAtomNameA(nAtom : UInt16, lpBuffer : UInt8*, nSize : Int32) : UInt32
    C.GetAtomNameA(nAtom, lpBuffer, nSize)
  end

  def getAtomNameW(nAtom : UInt16, lpBuffer : UInt16*, nSize : Int32) : UInt32
    C.GetAtomNameW(nAtom, lpBuffer, nSize)
  end

  @[Link("user32")]
  @[Link("gdi32")]
  @[Link("kernel32")]
  lib C
    # :nodoc:
    fun DdeSetQualityOfService(hwndClient : Win32cr::Foundation::HWND, pqosNew : Win32cr::Security::SECURITY_QUALITY_OF_SERVICE*, pqosPrev : Win32cr::Security::SECURITY_QUALITY_OF_SERVICE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ImpersonateDdeClientWindow(hWndClient : Win32cr::Foundation::HWND, hWndServer : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PackDDElParam(msg : UInt32, uiLo : LibC::UIntPtrT, uiHi : LibC::UIntPtrT) : Win32cr::Foundation::LPARAM

    # :nodoc:
    fun UnpackDDElParam(msg : UInt32, lParam : Win32cr::Foundation::LPARAM, puiLo : LibC::UIntPtrT*, puiHi : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FreeDDElParam(msg : UInt32, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReuseDDElParam(lParam : Win32cr::Foundation::LPARAM, msgIn : UInt32, msgOut : UInt32, uiLo : LibC::UIntPtrT, uiHi : LibC::UIntPtrT) : Win32cr::Foundation::LPARAM

    # :nodoc:
    fun DdeInitializeA(pidInst : UInt32*, pfnCallback : Win32cr::System::DataExchange::PFNCALLBACK, afCmd : Win32cr::System::DataExchange::DDE_INITIALIZE_COMMAND, ulRes : UInt32) : UInt32

    # :nodoc:
    fun DdeInitializeW(pidInst : UInt32*, pfnCallback : Win32cr::System::DataExchange::PFNCALLBACK, afCmd : Win32cr::System::DataExchange::DDE_INITIALIZE_COMMAND, ulRes : UInt32) : UInt32

    # :nodoc:
    fun DdeUninitialize(idInst : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeConnectList(idInst : UInt32, hszService : Win32cr::System::DataExchange::HSZ, hszTopic : Win32cr::System::DataExchange::HSZ, hConvList : Win32cr::System::DataExchange::HCONVLIST, pCC : Win32cr::System::DataExchange::CONVCONTEXT*) : Win32cr::System::DataExchange::HCONVLIST

    # :nodoc:
    fun DdeQueryNextServer(hConvList : Win32cr::System::DataExchange::HCONVLIST, hConvPrev : Win32cr::System::DataExchange::HCONV) : Win32cr::System::DataExchange::HCONV

    # :nodoc:
    fun DdeDisconnectList(hConvList : Win32cr::System::DataExchange::HCONVLIST) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeConnect(idInst : UInt32, hszService : Win32cr::System::DataExchange::HSZ, hszTopic : Win32cr::System::DataExchange::HSZ, pCC : Win32cr::System::DataExchange::CONVCONTEXT*) : Win32cr::System::DataExchange::HCONV

    # :nodoc:
    fun DdeDisconnect(hConv : Win32cr::System::DataExchange::HCONV) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeReconnect(hConv : Win32cr::System::DataExchange::HCONV) : Win32cr::System::DataExchange::HCONV

    # :nodoc:
    fun DdeQueryConvInfo(hConv : Win32cr::System::DataExchange::HCONV, idTransaction : UInt32, pConvInfo : Win32cr::System::DataExchange::CONVINFO*) : UInt32

    # :nodoc:
    fun DdeSetUserHandle(hConv : Win32cr::System::DataExchange::HCONV, id : UInt32, hUser : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeAbandonTransaction(idInst : UInt32, hConv : Win32cr::System::DataExchange::HCONV, idTransaction : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdePostAdvise(idInst : UInt32, hszTopic : Win32cr::System::DataExchange::HSZ, hszItem : Win32cr::System::DataExchange::HSZ) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeEnableCallback(idInst : UInt32, hConv : Win32cr::System::DataExchange::HCONV, wCmd : Win32cr::System::DataExchange::DDE_ENABLE_CALLBACK_CMD) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeImpersonateClient(hConv : Win32cr::System::DataExchange::HCONV) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeNameService(idInst : UInt32, hsz1 : Win32cr::System::DataExchange::HSZ, hsz2 : Win32cr::System::DataExchange::HSZ, afCmd : Win32cr::System::DataExchange::DDE_NAME_SERVICE_CMD) : Win32cr::System::DataExchange::HDDEDATA

    # :nodoc:
    fun DdeClientTransaction(pData : UInt8*, cbData : UInt32, hConv : Win32cr::System::DataExchange::HCONV, hszItem : Win32cr::System::DataExchange::HSZ, wFmt : UInt32, wType : Win32cr::System::DataExchange::DDE_CLIENT_TRANSACTION_TYPE, dwTimeout : UInt32, pdwResult : UInt32*) : Win32cr::System::DataExchange::HDDEDATA

    # :nodoc:
    fun DdeCreateDataHandle(idInst : UInt32, pSrc : UInt8*, cb : UInt32, cbOff : UInt32, hszItem : Win32cr::System::DataExchange::HSZ, wFmt : UInt32, afCmd : UInt32) : Win32cr::System::DataExchange::HDDEDATA

    # :nodoc:
    fun DdeAddData(hData : Win32cr::System::DataExchange::HDDEDATA, pSrc : UInt8*, cb : UInt32, cbOff : UInt32) : Win32cr::System::DataExchange::HDDEDATA

    # :nodoc:
    fun DdeGetData(hData : Win32cr::System::DataExchange::HDDEDATA, pDst : UInt8*, cbMax : UInt32, cbOff : UInt32) : UInt32

    # :nodoc:
    fun DdeAccessData(hData : Win32cr::System::DataExchange::HDDEDATA, pcbDataSize : UInt32*) : UInt8*

    # :nodoc:
    fun DdeUnaccessData(hData : Win32cr::System::DataExchange::HDDEDATA) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeFreeDataHandle(hData : Win32cr::System::DataExchange::HDDEDATA) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeGetLastError(idInst : UInt32) : UInt32

    # :nodoc:
    fun DdeCreateStringHandleA(idInst : UInt32, psz : Win32cr::Foundation::PSTR, iCodePage : Int32) : Win32cr::System::DataExchange::HSZ

    # :nodoc:
    fun DdeCreateStringHandleW(idInst : UInt32, psz : Win32cr::Foundation::PWSTR, iCodePage : Int32) : Win32cr::System::DataExchange::HSZ

    # :nodoc:
    fun DdeQueryStringA(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ, psz : UInt8*, cchMax : UInt32, iCodePage : Int32) : UInt32

    # :nodoc:
    fun DdeQueryStringW(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ, psz : UInt16*, cchMax : UInt32, iCodePage : Int32) : UInt32

    # :nodoc:
    fun DdeFreeStringHandle(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeKeepStringHandle(idInst : UInt32, hsz : Win32cr::System::DataExchange::HSZ) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DdeCmpStringHandles(hsz1 : Win32cr::System::DataExchange::HSZ, hsz2 : Win32cr::System::DataExchange::HSZ) : Int32

    # :nodoc:
    fun SetWinMetaFileBits(nSize : UInt32, lpMeta16Data : UInt8*, hdcRef : Win32cr::Graphics::Gdi::HDC, lpMFP : Win32cr::System::DataExchange::METAFILEPICT*) : Win32cr::Graphics::Gdi::HENHMETAFILE

    # :nodoc:
    fun OpenClipboard(hWndNewOwner : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CloseClipboard : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetClipboardSequenceNumber : UInt32

    # :nodoc:
    fun GetClipboardOwner : Win32cr::Foundation::HWND

    # :nodoc:
    fun SetClipboardViewer(hWndNewViewer : Win32cr::Foundation::HWND) : Win32cr::Foundation::HWND

    # :nodoc:
    fun GetClipboardViewer : Win32cr::Foundation::HWND

    # :nodoc:
    fun ChangeClipboardChain(hWndRemove : Win32cr::Foundation::HWND, hWndNewNext : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetClipboardData(uFormat : UInt32, hMem : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun GetClipboardData(uFormat : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun RegisterClipboardFormatA(lpszFormat : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun RegisterClipboardFormatW(lpszFormat : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun CountClipboardFormats : Int32

    # :nodoc:
    fun EnumClipboardFormats(format : UInt32) : UInt32

    # :nodoc:
    fun GetClipboardFormatNameA(format : UInt32, lpszFormatName : UInt8*, cchMaxCount : Int32) : Int32

    # :nodoc:
    fun GetClipboardFormatNameW(format : UInt32, lpszFormatName : UInt16*, cchMaxCount : Int32) : Int32

    # :nodoc:
    fun EmptyClipboard : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsClipboardFormatAvailable(format : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetPriorityClipboardFormat(paFormatPriorityList : UInt32*, cFormats : Int32) : Int32

    # :nodoc:
    fun GetOpenClipboardWindow : Win32cr::Foundation::HWND

    # :nodoc:
    fun AddClipboardFormatListener(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RemoveClipboardFormatListener(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetUpdatedClipboardFormats(lpuiFormats : UInt32*, cFormats : UInt32, pcFormatsOut : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GlobalDeleteAtom(nAtom : UInt16) : UInt16

    # :nodoc:
    fun InitAtomTable(nSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteAtom(nAtom : UInt16) : UInt16

    # :nodoc:
    fun GlobalAddAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16

    # :nodoc:
    fun GlobalAddAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16

    # :nodoc:
    fun GlobalAddAtomExA(lpString : Win32cr::Foundation::PSTR, flags : UInt32) : UInt16

    # :nodoc:
    fun GlobalAddAtomExW(lpString : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt16

    # :nodoc:
    fun GlobalFindAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16

    # :nodoc:
    fun GlobalFindAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16

    # :nodoc:
    fun GlobalGetAtomNameA(nAtom : UInt16, lpBuffer : UInt8*, nSize : Int32) : UInt32

    # :nodoc:
    fun GlobalGetAtomNameW(nAtom : UInt16, lpBuffer : UInt16*, nSize : Int32) : UInt32

    # :nodoc:
    fun AddAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16

    # :nodoc:
    fun AddAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16

    # :nodoc:
    fun FindAtomA(lpString : Win32cr::Foundation::PSTR) : UInt16

    # :nodoc:
    fun FindAtomW(lpString : Win32cr::Foundation::PWSTR) : UInt16

    # :nodoc:
    fun GetAtomNameA(nAtom : UInt16, lpBuffer : UInt8*, nSize : Int32) : UInt32

    # :nodoc:
    fun GetAtomNameW(nAtom : UInt16, lpBuffer : UInt16*, nSize : Int32) : UInt32

  end
end