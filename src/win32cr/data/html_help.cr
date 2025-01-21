require "./../ui/controls.cr"
require "./../foundation.cr"
require "./../system/com.cr"
require "./../system/search.cr"

module Win32cr::Data::HtmlHelp
  alias PFNCOLHEAPFREE = Proc(Void*, Int32)*

  HH_DISPLAY_TOPIC = 0_u32
  HH_HELP_FINDER = 0_u32
  HH_DISPLAY_TOC = 1_u32
  HH_DISPLAY_INDEX = 2_u32
  HH_DISPLAY_SEARCH = 3_u32
  HH_SET_WIN_TYPE = 4_u32
  HH_GET_WIN_TYPE = 5_u32
  HH_GET_WIN_HANDLE = 6_u32
  HH_ENUM_INFO_TYPE = 7_u32
  HH_SET_INFO_TYPE = 8_u32
  HH_SYNC = 9_u32
  HH_RESERVED1 = 10_u32
  HH_RESERVED2 = 11_u32
  HH_RESERVED3 = 12_u32
  HH_KEYWORD_LOOKUP = 13_u32
  HH_DISPLAY_TEXT_POPUP = 14_u32
  HH_HELP_CONTEXT = 15_u32
  HH_TP_HELP_CONTEXTMENU = 16_u32
  HH_TP_HELP_WM_HELP = 17_u32
  HH_CLOSE_ALL = 18_u32
  HH_ALINK_LOOKUP = 19_u32
  HH_GET_LAST_ERROR = 20_u32
  HH_ENUM_CATEGORY = 21_u32
  HH_ENUM_CATEGORY_IT = 22_u32
  HH_RESET_IT_FILTER = 23_u32
  HH_SET_INCLUSIVE_FILTER = 24_u32
  HH_SET_EXCLUSIVE_FILTER = 25_u32
  HH_INITIALIZE = 28_u32
  HH_UNINITIALIZE = 29_u32
  HH_SET_QUERYSERVICE = 30_u32
  HH_PRETRANSLATEMESSAGE = 253_u32
  HH_SET_GLOBAL_PROPERTY = 252_u32
  HH_SAFE_DISPLAY_TOPIC = 32_u32
  HHWIN_PROP_TAB_AUTOHIDESHOW = 1_u32
  HHWIN_PROP_ONTOP = 2_u32
  HHWIN_PROP_NOTITLEBAR = 4_u32
  HHWIN_PROP_NODEF_STYLES = 8_u32
  HHWIN_PROP_NODEF_EXSTYLES = 16_u32
  HHWIN_PROP_TRI_PANE = 32_u32
  HHWIN_PROP_NOTB_TEXT = 64_u32
  HHWIN_PROP_POST_QUIT = 128_u32
  HHWIN_PROP_AUTO_SYNC = 256_u32
  HHWIN_PROP_TRACKING = 512_u32
  HHWIN_PROP_TAB_SEARCH = 1024_u32
  HHWIN_PROP_TAB_HISTORY = 2048_u32
  HHWIN_PROP_TAB_FAVORITES = 4096_u32
  HHWIN_PROP_CHANGE_TITLE = 8192_u32
  HHWIN_PROP_NAV_ONLY_WIN = 16384_u32
  HHWIN_PROP_NO_TOOLBAR = 32768_u32
  HHWIN_PROP_MENU = 65536_u32
  HHWIN_PROP_TAB_ADVSEARCH = 131072_u32
  HHWIN_PROP_USER_POS = 262144_u32
  HHWIN_PROP_TAB_CUSTOM1 = 524288_u32
  HHWIN_PROP_TAB_CUSTOM2 = 1048576_u32
  HHWIN_PROP_TAB_CUSTOM3 = 2097152_u32
  HHWIN_PROP_TAB_CUSTOM4 = 4194304_u32
  HHWIN_PROP_TAB_CUSTOM5 = 8388608_u32
  HHWIN_PROP_TAB_CUSTOM6 = 16777216_u32
  HHWIN_PROP_TAB_CUSTOM7 = 33554432_u32
  HHWIN_PROP_TAB_CUSTOM8 = 67108864_u32
  HHWIN_PROP_TAB_CUSTOM9 = 134217728_u32
  HHWIN_TB_MARGIN = 268435456_u32
  HHWIN_PARAM_PROPERTIES = 2_u32
  HHWIN_PARAM_STYLES = 4_u32
  HHWIN_PARAM_EXSTYLES = 8_u32
  HHWIN_PARAM_RECT = 16_u32
  HHWIN_PARAM_NAV_WIDTH = 32_u32
  HHWIN_PARAM_SHOWSTATE = 64_u32
  HHWIN_PARAM_INFOTYPES = 128_u32
  HHWIN_PARAM_TB_FLAGS = 256_u32
  HHWIN_PARAM_EXPANSION = 512_u32
  HHWIN_PARAM_TABPOS = 1024_u32
  HHWIN_PARAM_TABORDER = 2048_u32
  HHWIN_PARAM_HISTORY_COUNT = 4096_u32
  HHWIN_PARAM_CUR_TAB = 8192_u32
  HHWIN_BUTTON_EXPAND = 2_u32
  HHWIN_BUTTON_BACK = 4_u32
  HHWIN_BUTTON_FORWARD = 8_u32
  HHWIN_BUTTON_STOP = 16_u32
  HHWIN_BUTTON_REFRESH = 32_u32
  HHWIN_BUTTON_HOME = 64_u32
  HHWIN_BUTTON_BROWSE_FWD = 128_u32
  HHWIN_BUTTON_BROWSE_BCK = 256_u32
  HHWIN_BUTTON_NOTES = 512_u32
  HHWIN_BUTTON_CONTENTS = 1024_u32
  HHWIN_BUTTON_SYNC = 2048_u32
  HHWIN_BUTTON_OPTIONS = 4096_u32
  HHWIN_BUTTON_PRINT = 8192_u32
  HHWIN_BUTTON_INDEX = 16384_u32
  HHWIN_BUTTON_SEARCH = 32768_u32
  HHWIN_BUTTON_HISTORY = 65536_u32
  HHWIN_BUTTON_FAVORITES = 131072_u32
  HHWIN_BUTTON_JUMP1 = 262144_u32
  HHWIN_BUTTON_JUMP2 = 524288_u32
  HHWIN_BUTTON_ZOOM = 1048576_u32
  HHWIN_BUTTON_TOC_NEXT = 2097152_u32
  HHWIN_BUTTON_TOC_PREV = 4194304_u32
  IDTB_EXPAND = 200_u32
  IDTB_CONTRACT = 201_u32
  IDTB_STOP = 202_u32
  IDTB_REFRESH = 203_u32
  IDTB_BACK = 204_u32
  IDTB_HOME = 205_u32
  IDTB_SYNC = 206_u32
  IDTB_PRINT = 207_u32
  IDTB_OPTIONS = 208_u32
  IDTB_FORWARD = 209_u32
  IDTB_NOTES = 210_u32
  IDTB_BROWSE_FWD = 211_u32
  IDTB_BROWSE_BACK = 212_u32
  IDTB_CONTENTS = 213_u32
  IDTB_INDEX = 214_u32
  IDTB_SEARCH = 215_u32
  IDTB_HISTORY = 216_u32
  IDTB_FAVORITES = 217_u32
  IDTB_JUMP1 = 218_u32
  IDTB_JUMP2 = 219_u32
  IDTB_CUSTOMIZE = 221_u32
  IDTB_ZOOM = 222_u32
  IDTB_TOC_NEXT = 223_u32
  IDTB_TOC_PREV = 224_u32
  HH_MAX_TABS = 19_u32
  HH_FTS_DEFAULT_PROXIMITY = -1_i32
  CLSID_IITPropList = "4662daae-d393-11d0-9a56-00c04fb68bf7"
  PROP_ADD = 0_u32
  PROP_DELETE = 1_u32
  PROP_UPDATE = 2_u32
  TYPE_VALUE = 0_u32
  TYPE_POINTER = 1_u32
  TYPE_STRING = 2_u32
  CLSID_IITDatabase = "66673452-8c23-11d0-a84e-00aa006c7d01"
  CLSID_IITDatabaseLocal = "4662daa9-d393-11d0-9a56-00c04fb68bf7"
  STDPROP_UID = 1_u32
  STDPROP_TITLE = 2_u32
  STDPROP_USERDATA = 3_u32
  STDPROP_KEY = 4_u32
  STDPROP_SORTKEY = 100_u32
  STDPROP_DISPLAYKEY = 101_u32
  STDPROP_SORTORDINAL = 102_u32
  STDPROP_INDEX_TEXT = 200_u32
  STDPROP_INDEX_VFLD = 201_u32
  STDPROP_INDEX_DTYPE = 202_u32
  STDPROP_INDEX_LENGTH = 203_u32
  STDPROP_INDEX_BREAK = 204_u32
  STDPROP_INDEX_TERM = 210_u32
  STDPROP_INDEX_TERM_RAW_LENGTH = 211_u32
  STDPROP_USERPROP_BASE = 65536_u32
  STDPROP_USERPROP_MAX = 2147483647_u32
  SZ_WWDEST_GLOBAL = "GLOBAL"
  SZ_WWDEST_KEY = "KEY"
  SZ_WWDEST_OCC = "OCC"
  CLSID_IITCmdInt = "4662daa2-d393-11d0-9a56-00c04fb68bf7"
  CLSID_IITSvMgr = "4662daa3-d393-11d0-9a56-00c04fb68bf7"
  CLSID_IITWordWheelUpdate = "4662daa5-d393-11d0-9a56-00c04fb68bf7"
  CLSID_IITGroupUpdate = "4662daa4-d393-11d0-9a56-00c04fb68bf7"
  CLSID_IITIndexBuild = "8fa0d5aa-dedf-11d0-9a61-00c04fb68bf7"
  CLSID_IITWWFilterBuild = "8fa0d5ab-dedf-11d0-9a61-00c04fb68bf7"
  CLSID_IITWordWheel = "d73725c2-8c12-11d0-a84e-00aa006c7d01"
  CLSID_IITWordWheelLocal = "4662daa8-d393-11d0-9a56-00c04fb68bf7"
  ITWW_OPEN_NOCONNECT = 1_u32
  ITWW_CBKEY_MAX = 1024_u32
  IITWBC_BREAK_ACCEPT_WILDCARDS = 1_u32
  IITWBC_BREAK_AND_STEM = 2_u32
  E_NOTEXIST = -2147479552_i32
  E_DUPLICATE = -2147479551_i32
  E_BADVERSION = -2147479550_i32
  E_BADFILE = -2147479549_i32
  E_BADFORMAT = -2147479548_i32
  E_NOPERMISSION = -2147479547_i32
  E_ASSERT = -2147479546_i32
  E_INTERRUPT = -2147479545_i32
  E_NOTSUPPORTED = -2147479544_i32
  E_OUTOFRANGE = -2147479543_i32
  E_GROUPIDTOOBIG = -2147479542_i32
  E_TOOMANYTITLES = -2147479541_i32
  E_NOMERGEDDATA = -2147479540_i32
  E_NOTFOUND = -2147479539_i32
  E_CANTFINDDLL = -2147479538_i32
  E_NOHANDLE = -2147479537_i32
  E_GETLASTERROR = -2147479536_i32
  E_BADPARAM = -2147479535_i32
  E_INVALIDSTATE = -2147479534_i32
  E_NOTOPEN = -2147479533_i32
  E_ALREADYOPEN = -2147479533_i32
  E_UNKNOWN_TRANSPORT = -2147479530_i32
  E_UNSUPPORTED_TRANSPORT = -2147479529_i32
  E_BADFILTERSIZE = -2147479528_i32
  E_TOOMANYOBJECTS = -2147479527_i32
  E_NAMETOOLONG = -2147479520_i32
  E_FILECREATE = -2147479504_i32
  E_FILECLOSE = -2147479503_i32
  E_FILEREAD = -2147479502_i32
  E_FILESEEK = -2147479501_i32
  E_FILEWRITE = -2147479500_i32
  E_FILEDELETE = -2147479499_i32
  E_FILEINVALID = -2147479498_i32
  E_FILENOTFOUND = -2147479497_i32
  E_DISKFULL = -2147479496_i32
  E_TOOMANYTOPICS = -2147479472_i32
  E_TOOMANYDUPS = -2147479471_i32
  E_TREETOOBIG = -2147479470_i32
  E_BADBREAKER = -2147479469_i32
  E_BADVALUE = -2147479468_i32
  E_ALL_WILD = -2147479467_i32
  E_TOODEEP = -2147479466_i32
  E_EXPECTEDTERM = -2147479465_i32
  E_MISSLPAREN = -2147479464_i32
  E_MISSRPAREN = -2147479463_i32
  E_MISSQUOTE = -2147479462_i32
  E_NULLQUERY = -2147479461_i32
  E_STOPWORD = -2147479460_i32
  E_BADRANGEOP = -2147479459_i32
  E_UNMATCHEDTYPE = -2147479458_i32
  E_WORDTOOLONG = -2147479457_i32
  E_BADINDEXFLAGS = -2147479456_i32
  E_WILD_IN_DTYPE = -2147479455_i32
  E_NOSTEMMER = -2147479454_i32
  E_MISSINGPROP = -2147479424_i32
  E_PROPLISTNOTEMPTY = -2147479423_i32
  E_PROPLISTEMPTY = -2147479422_i32
  E_ALREADYINIT = -2147479421_i32
  E_NOTINIT = -2147479420_i32
  E_RESULTSETEMPTY = -2147479419_i32
  E_TOOMANYCOLUMNS = -2147479418_i32
  E_NOKEYPROP = -2147479417_i32
  CLSID_IITResultSet = "4662daa7-d393-11d0-9a56-00c04fb68bf7"
  MAX_COLUMNS = 256_u32
  CLSID_ITStdBreaker = "4662daaf-d393-11d0-9a56-00c04fb68bf7"
  CLSID_ITEngStemmer = "8fa0d5a8-dedf-11d0-9a61-00c04fb68bf7"
  HHWIN_NAVTYPE_TOC = 0_i32
  HHWIN_NAVTYPE_INDEX = 1_i32
  HHWIN_NAVTYPE_SEARCH = 2_i32
  HHWIN_NAVTYPE_FAVORITES = 3_i32
  HHWIN_NAVTYPE_HISTORY = 4_i32
  HHWIN_NAVTYPE_AUTHOR = 5_i32
  HHWIN_NAVTYPE_CUSTOM_FIRST = 11_i32
  IT_INCLUSIVE = 0_i32
  IT_EXCLUSIVE = 1_i32
  IT_HIDDEN = 2_i32
  HHWIN_NAVTAB_TOP = 0_i32
  HHWIN_NAVTAB_LEFT = 1_i32
  HHWIN_NAVTAB_BOTTOM = 2_i32
  HH_TAB_CONTENTS = 0_i32
  HH_TAB_INDEX = 1_i32
  HH_TAB_SEARCH = 2_i32
  HH_TAB_FAVORITES = 3_i32
  HH_TAB_HISTORY = 4_i32
  HH_TAB_AUTHOR = 5_i32
  HH_TAB_CUSTOM_FIRST = 11_i32
  HH_TAB_CUSTOM_LAST = 19_i32
  HHACT_TAB_CONTENTS = 0_i32
  HHACT_TAB_INDEX = 1_i32
  HHACT_TAB_SEARCH = 2_i32
  HHACT_TAB_HISTORY = 3_i32
  HHACT_TAB_FAVORITES = 4_i32
  HHACT_EXPAND = 5_i32
  HHACT_CONTRACT = 6_i32
  HHACT_BACK = 7_i32
  HHACT_FORWARD = 8_i32
  HHACT_STOP = 9_i32
  HHACT_REFRESH = 10_i32
  HHACT_HOME = 11_i32
  HHACT_SYNC = 12_i32
  HHACT_OPTIONS = 13_i32
  HHACT_PRINT = 14_i32
  HHACT_HIGHLIGHT = 15_i32
  HHACT_CUSTOMIZE = 16_i32
  HHACT_JUMP1 = 17_i32
  HHACT_JUMP2 = 18_i32
  HHACT_ZOOM = 19_i32
  HHACT_TOC_NEXT = 20_i32
  HHACT_TOC_PREV = 21_i32
  HHACT_NOTES = 22_i32
  HHACT_LAST_ENUM = 23_i32

  @[Flags]
  enum WORD_WHEEL_OPEN_FLAGS : UInt32
    ITWW_OPEN_CONNECT = 0_u32
  end
  enum HH_GPROPID
    HH_GPROPID_SINGLETHREAD = 1_i32
    HH_GPROPID_TOOLBAR_MARGIN = 2_i32
    HH_GPROPID_UI_LANGUAGE = 3_i32
    HH_GPROPID_CURRENT_SUBSET = 4_i32
    HH_GPROPID_CONTENT_LANGUAGE = 5_i32
  end
  enum PRIORITY
    PRIORITY_LOW = 0_i32
    PRIORITY_NORMAL = 1_i32
    PRIORITY_HIGH = 2_i32
  end

  @[Extern]
  record HHN_NOTIFY,
    hdr : Win32cr::UI::Controls::NMHDR,
    pszUrl : Win32cr::Foundation::PSTR

  @[Extern]
  record HH_POPUP,
    cbStruct : Int32,
    hinst : Win32cr::Foundation::HINSTANCE,
    idString : UInt32,
    pszText : Int8*,
    pt : Win32cr::Foundation::POINT,
    clrForeground : UInt32,
    clrBackground : UInt32,
    rcMargins : Win32cr::Foundation::RECT,
    pszFont : Int8*

  @[Extern]
  record HH_AKLINK,
    cbStruct : Int32,
    fReserved : Win32cr::Foundation::BOOL,
    pszKeywords : Int8*,
    pszUrl : Int8*,
    pszMsgText : Int8*,
    pszMsgTitle : Int8*,
    pszWindow : Int8*,
    fIndexOnFail : Win32cr::Foundation::BOOL

  @[Extern]
  record HH_ENUM_IT,
    cbStruct : Int32,
    iType : Int32,
    pszCatName : Win32cr::Foundation::PSTR,
    pszITName : Win32cr::Foundation::PSTR,
    pszITDescription : Win32cr::Foundation::PSTR

  @[Extern]
  record HH_ENUM_CAT,
    cbStruct : Int32,
    pszCatName : Win32cr::Foundation::PSTR,
    pszCatDescription : Win32cr::Foundation::PSTR

  @[Extern]
  record HH_SET_INFOTYPE,
    cbStruct : Int32,
    pszCatName : Win32cr::Foundation::PSTR,
    pszInfoTypeName : Win32cr::Foundation::PSTR

  @[Extern]
  record HH_FTS_QUERY,
    cbStruct : Int32,
    fUniCodeStrings : Win32cr::Foundation::BOOL,
    pszSearchQuery : Int8*,
    iProximity : Int32,
    fStemmedSearch : Win32cr::Foundation::BOOL,
    fTitleOnly : Win32cr::Foundation::BOOL,
    fExecute : Win32cr::Foundation::BOOL,
    pszWindow : Int8*

  @[Extern]
  record HH_WINTYPE,
    cbStruct : Int32,
    fUniCodeStrings : Win32cr::Foundation::BOOL,
    pszType : Int8*,
    fsValidMembers : UInt32,
    fsWinProperties : UInt32,
    pszCaption : Int8*,
    dwStyles : UInt32,
    dwExStyles : UInt32,
    rcWindowPos : Win32cr::Foundation::RECT,
    nShowState : Int32,
    hwndHelp : Win32cr::Foundation::HWND,
    hwndCaller : Win32cr::Foundation::HWND,
    paInfoTypes : UInt32*,
    hwndToolBar : Win32cr::Foundation::HWND,
    hwndNavigation : Win32cr::Foundation::HWND,
    hwndHTML : Win32cr::Foundation::HWND,
    iNavWidth : Int32,
    rcHTML : Win32cr::Foundation::RECT,
    pszToc : Int8*,
    pszIndex : Int8*,
    pszFile : Int8*,
    pszHome : Int8*,
    fsToolBarFlags : UInt32,
    fNotExpanded : Win32cr::Foundation::BOOL,
    curNavType : Int32,
    tabpos : Int32,
    idNotify : Int32,
    tabOrder : UInt8[20],
    cHistory : Int32,
    pszJump1 : Int8*,
    pszJump2 : Int8*,
    pszUrlJump1 : Int8*,
    pszUrlJump2 : Int8*,
    rcMinSize : Win32cr::Foundation::RECT,
    cbInfoTypes : Int32,
    pszCustomTabs : Int8*

  @[Extern]
  record HHNTRACK,
    hdr : Win32cr::UI::Controls::NMHDR,
    pszCurUrl : Win32cr::Foundation::PSTR,
    idAction : Int32,
    phhWinType : Win32cr::Data::HtmlHelp::HH_WINTYPE*

  @[Extern]
  record HH_GLOBAL_PROPERTY,
    id : Win32cr::Data::HtmlHelp::HH_GPROPID,
    var : Win32cr::System::Com::VARIANT

  @[Extern]
  record CProperty,
    dwPropID : UInt32,
    cbData : UInt32,
    dwType : UInt32,
    anonymous : Anonymous_e__Union_,
    fPersist : Win32cr::Foundation::BOOL do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      lpszwData : Win32cr::Foundation::PWSTR,
      lpvData : Void*,
      dwValue : UInt32

  end

  @[Extern]
  record IITGroup
  @[Extern]
  record IITQuery
  @[Extern]
  record IITStopWordList
  @[Extern]
  record ROWSTATUS,
    lRowFirst : Int32,
    cRows : Int32,
    cProperties : Int32,
    cRowsTotal : Int32

  @[Extern]
  record COLUMNSTATUS,
    cPropCount : Int32,
    cPropsLoaded : Int32

  @[Extern]
  record IITPropListVtbl,
    query_interface : Proc(IITPropList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IITPropList*, UInt32),
    release : Proc(IITPropList*, UInt32),
    get_class_id : Proc(IITPropList*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(IITPropList*, Win32cr::Foundation::HRESULT),
    load : Proc(IITPropList*, Void*, Win32cr::Foundation::HRESULT),
    save : Proc(IITPropList*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_size_max : Proc(IITPropList*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    init_new : Proc(IITPropList*, Win32cr::Foundation::HRESULT),
    set_1 : Proc(IITPropList*, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    set_2 : Proc(IITPropList*, UInt32, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_3 : Proc(IITPropList*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    add : Proc(IITPropList*, Win32cr::Data::HtmlHelp::CProperty*, Win32cr::Foundation::HRESULT),
    get : Proc(IITPropList*, UInt32, Win32cr::Data::HtmlHelp::CProperty*, Win32cr::Foundation::HRESULT),
    clear : Proc(IITPropList*, Win32cr::Foundation::HRESULT),
    set_persist_1 : Proc(IITPropList*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_persist_2 : Proc(IITPropList*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_first : Proc(IITPropList*, Win32cr::Data::HtmlHelp::CProperty*, Win32cr::Foundation::HRESULT),
    get_next : Proc(IITPropList*, Win32cr::Data::HtmlHelp::CProperty*, Win32cr::Foundation::HRESULT),
    get_prop_count : Proc(IITPropList*, Int32*, Win32cr::Foundation::HRESULT),
    save_header : Proc(IITPropList*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    save_data : Proc(IITPropList*, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_header_size : Proc(IITPropList*, UInt32*, Win32cr::Foundation::HRESULT),
    get_data_size : Proc(IITPropList*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    save_data_to_stream : Proc(IITPropList*, Void*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    load_from_mem : Proc(IITPropList*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    save_to_mem : Proc(IITPropList*, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1f403bb1-9997-11d0-a850-00aa006c7d01")]
  record IITPropList, lpVtbl : IITPropListVtbl* do
    GUID = LibC::GUID.new(0x1f403bb1_u32, 0x9997_u16, 0x11d0_u16, StaticArray[0xa8_u8, 0x50_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x7d_u8, 0x1_u8])
    def query_interface(this : IITPropList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IITPropList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IITPropList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IITPropList*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end
    def is_dirty(this : IITPropList*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this)
    end
    def load(this : IITPropList*, pStm : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pStm)
    end
    def save(this : IITPropList*, pStm : Void*, fClearDirty : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pStm, fClearDirty)
    end
    def get_size_max(this : IITPropList*, pCbSize : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size_max.call(this, pCbSize)
    end
    def init_new(this : IITPropList*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_new.call(this)
    end
    def set_1(this : IITPropList*, prop_id : UInt32, lpszwString : Win32cr::Foundation::PWSTR, dwOperation : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_1.call(this, prop_id, lpszwString, dwOperation)
    end
    def set_2(this : IITPropList*, prop_id : UInt32, lpvData : Void*, cbData : UInt32, dwOperation : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_2.call(this, prop_id, lpvData, cbData, dwOperation)
    end
    def set_3(this : IITPropList*, prop_id : UInt32, dwData : UInt32, dwOperation : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_3.call(this, prop_id, dwData, dwOperation)
    end
    def add(this : IITPropList*, prop : Win32cr::Data::HtmlHelp::CProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, prop)
    end
    def get(this : IITPropList*, prop_id : UInt32, property : Win32cr::Data::HtmlHelp::CProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, prop_id, property)
    end
    def clear(this : IITPropList*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def set_persist_1(this : IITPropList*, fPersist : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_persist_1.call(this, fPersist)
    end
    def set_persist_2(this : IITPropList*, prop_id : UInt32, fPersist : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_persist_2.call(this, prop_id, fPersist)
    end
    def get_first(this : IITPropList*, property : Win32cr::Data::HtmlHelp::CProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_first.call(this, property)
    end
    def get_next(this : IITPropList*, property : Win32cr::Data::HtmlHelp::CProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next.call(this, property)
    end
    def get_prop_count(this : IITPropList*, cProp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_count.call(this, cProp)
    end
    def save_header(this : IITPropList*, lpvData : Void*, dwHdrSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_header.call(this, lpvData, dwHdrSize)
    end
    def save_data(this : IITPropList*, lpvHeader : Void*, dwHdrSize : UInt32, lpvData : Void*, dwBufSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_data.call(this, lpvHeader, dwHdrSize, lpvData, dwBufSize)
    end
    def get_header_size(this : IITPropList*, dwHdrSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_header_size.call(this, dwHdrSize)
    end
    def get_data_size(this : IITPropList*, lpvHeader : Void*, dwHdrSize : UInt32, dwDataSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_size.call(this, lpvHeader, dwHdrSize, dwDataSize)
    end
    def save_data_to_stream(this : IITPropList*, lpvHeader : Void*, dwHdrSize : UInt32, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_data_to_stream.call(this, lpvHeader, dwHdrSize, pStream)
    end
    def load_from_mem(this : IITPropList*, lpvData : Void*, dwBufSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_from_mem.call(this, lpvData, dwBufSize)
    end
    def save_to_mem(this : IITPropList*, lpvData : Void*, dwBufSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_mem.call(this, lpvData, dwBufSize)
    end

  end

  @[Extern]
  record IITDatabaseVtbl,
    query_interface : Proc(IITDatabase*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IITDatabase*, UInt32),
    release : Proc(IITDatabase*, UInt32),
    open : Proc(IITDatabase*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    close : Proc(IITDatabase*, Win32cr::Foundation::HRESULT),
    create_object : Proc(IITDatabase*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_object : Proc(IITDatabase*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_object_persistence : Proc(IITDatabase*, Win32cr::Foundation::PWSTR, UInt32, Void**, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8fa0d5a2-dedf-11d0-9a61-00c04fb68bf7")]
  record IITDatabase, lpVtbl : IITDatabaseVtbl* do
    GUID = LibC::GUID.new(0x8fa0d5a2_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
    def query_interface(this : IITDatabase*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IITDatabase*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IITDatabase*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IITDatabase*, lpszHost : Win32cr::Foundation::PWSTR, lpszMoniker : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, lpszHost, lpszMoniker, dwFlags)
    end
    def close(this : IITDatabase*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def create_object(this : IITDatabase*, rclsid : LibC::GUID*, pdwObjInstance : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_object.call(this, rclsid, pdwObjInstance)
    end
    def get_object(this : IITDatabase*, dwObjInstance : UInt32, riid : LibC::GUID*, ppvObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object.call(this, dwObjInstance, riid, ppvObj)
    end
    def get_object_persistence(this : IITDatabase*, lpwszObject : Win32cr::Foundation::PWSTR, dwObjInstance : UInt32, ppvPersistence : Void**, fStream : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_persistence.call(this, lpwszObject, dwObjInstance, ppvPersistence, fStream)
    end

  end

  @[Extern]
  record IITWordWheelVtbl,
    query_interface : Proc(IITWordWheel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IITWordWheel*, UInt32),
    release : Proc(IITWordWheel*, UInt32),
    open : Proc(IITWordWheel*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Data::HtmlHelp::WORD_WHEEL_OPEN_FLAGS, Win32cr::Foundation::HRESULT),
    close : Proc(IITWordWheel*, Win32cr::Foundation::HRESULT),
    get_locale_info : Proc(IITWordWheel*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_sorter_instance : Proc(IITWordWheel*, UInt32*, Win32cr::Foundation::HRESULT),
    count : Proc(IITWordWheel*, Int32*, Win32cr::Foundation::HRESULT),
    lookup_1 : Proc(IITWordWheel*, Void*, Win32cr::Foundation::BOOL, Int32*, Win32cr::Foundation::HRESULT),
    lookup_2 : Proc(IITWordWheel*, Int32, Void*, Int32, Win32cr::Foundation::HRESULT),
    lookup_3 : Proc(IITWordWheel*, Int32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_group : Proc(IITWordWheel*, Win32cr::Data::HtmlHelp::IITGroup*, Win32cr::Foundation::HRESULT),
    get_group : Proc(IITWordWheel*, Win32cr::Data::HtmlHelp::IITGroup**, Win32cr::Foundation::HRESULT),
    get_data_count : Proc(IITWordWheel*, Int32, UInt32*, Win32cr::Foundation::HRESULT),
    get_data : Proc(IITWordWheel*, Int32, Void*, Win32cr::Foundation::HRESULT),
    get_data_columns : Proc(IITWordWheel*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8fa0d5a4-dedf-11d0-9a61-00c04fb68bf7")]
  record IITWordWheel, lpVtbl : IITWordWheelVtbl* do
    GUID = LibC::GUID.new(0x8fa0d5a4_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
    def query_interface(this : IITWordWheel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IITWordWheel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IITWordWheel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IITWordWheel*, lpITDB : Void*, lpszMoniker : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::Data::HtmlHelp::WORD_WHEEL_OPEN_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, lpITDB, lpszMoniker, dwFlags)
    end
    def close(this : IITWordWheel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_locale_info(this : IITWordWheel*, pdwCodePageID : UInt32*, plcid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_locale_info.call(this, pdwCodePageID, plcid)
    end
    def get_sorter_instance(this : IITWordWheel*, pdwObjInstance : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sorter_instance.call(this, pdwObjInstance)
    end
    def count(this : IITWordWheel*, pcEntries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.count.call(this, pcEntries)
    end
    def lookup_1(this : IITWordWheel*, lpcvPrefix : Void*, fExactMatch : Win32cr::Foundation::BOOL, plEntry : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_1.call(this, lpcvPrefix, fExactMatch, plEntry)
    end
    def lookup_2(this : IITWordWheel*, lEntry : Int32, lpITResult : Void*, cEntries : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_2.call(this, lEntry, lpITResult, cEntries)
    end
    def lookup_3(this : IITWordWheel*, lEntry : Int32, lpvKeyBuf : Void*, cbKeyBuf : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_3.call(this, lEntry, lpvKeyBuf, cbKeyBuf)
    end
    def set_group(this : IITWordWheel*, piitGroup : Win32cr::Data::HtmlHelp::IITGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_group.call(this, piitGroup)
    end
    def get_group(this : IITWordWheel*, ppiitGroup : Win32cr::Data::HtmlHelp::IITGroup**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_group.call(this, ppiitGroup)
    end
    def get_data_count(this : IITWordWheel*, lEntry : Int32, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_count.call(this, lEntry, pdwCount)
    end
    def get_data(this : IITWordWheel*, lEntry : Int32, lpITResult : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, lEntry, lpITResult)
    end
    def get_data_columns(this : IITWordWheel*, pRS : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_columns.call(this, pRS)
    end

  end

  @[Extern]
  record IStemSinkVtbl,
    query_interface : Proc(IStemSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStemSink*, UInt32),
    release : Proc(IStemSink*, UInt32),
    put_alt_word : Proc(IStemSink*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    put_word : Proc(IStemSink*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fe77c330-7f42-11ce-be57-00aa0051fe20")]
  record IStemSink, lpVtbl : IStemSinkVtbl* do
    GUID = LibC::GUID.new(0xfe77c330_u32, 0x7f42_u16, 0x11ce_u16, StaticArray[0xbe_u8, 0x57_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x51_u8, 0xfe_u8, 0x20_u8])
    def query_interface(this : IStemSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStemSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStemSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def put_alt_word(this : IStemSink*, pwcInBuf : Win32cr::Foundation::PWSTR, cwc : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_alt_word.call(this, pwcInBuf, cwc)
    end
    def put_word(this : IStemSink*, pwcInBuf : Win32cr::Foundation::PWSTR, cwc : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_word.call(this, pwcInBuf, cwc)
    end

  end

  @[Extern]
  record IStemmerConfigVtbl,
    query_interface : Proc(IStemmerConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStemmerConfig*, UInt32),
    release : Proc(IStemmerConfig*, UInt32),
    set_locale_info : Proc(IStemmerConfig*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_locale_info : Proc(IStemmerConfig*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_control_info : Proc(IStemmerConfig*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_control_info : Proc(IStemmerConfig*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    load_external_stemmer_data : Proc(IStemmerConfig*, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8fa0d5a7-dedf-11d0-9a61-00c04fb68bf7")]
  record IStemmerConfig, lpVtbl : IStemmerConfigVtbl* do
    GUID = LibC::GUID.new(0x8fa0d5a7_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
    def query_interface(this : IStemmerConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStemmerConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStemmerConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_locale_info(this : IStemmerConfig*, dwCodePageID : UInt32, lcid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_locale_info.call(this, dwCodePageID, lcid)
    end
    def get_locale_info(this : IStemmerConfig*, pdwCodePageID : UInt32*, plcid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_locale_info.call(this, pdwCodePageID, plcid)
    end
    def set_control_info(this : IStemmerConfig*, grfStemFlags : UInt32, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_control_info.call(this, grfStemFlags, dwReserved)
    end
    def get_control_info(this : IStemmerConfig*, pgrfStemFlags : UInt32*, pdwReserved : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_control_info.call(this, pgrfStemFlags, pdwReserved)
    end
    def load_external_stemmer_data(this : IStemmerConfig*, pStream : Void*, dwExtDataType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_external_stemmer_data.call(this, pStream, dwExtDataType)
    end

  end

  @[Extern]
  record IWordBreakerConfigVtbl,
    query_interface : Proc(IWordBreakerConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWordBreakerConfig*, UInt32),
    release : Proc(IWordBreakerConfig*, UInt32),
    set_locale_info : Proc(IWordBreakerConfig*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_locale_info : Proc(IWordBreakerConfig*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_break_word_type : Proc(IWordBreakerConfig*, UInt32, Win32cr::Foundation::HRESULT),
    get_break_word_type : Proc(IWordBreakerConfig*, UInt32*, Win32cr::Foundation::HRESULT),
    set_control_info : Proc(IWordBreakerConfig*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_control_info : Proc(IWordBreakerConfig*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    load_external_breaker_data : Proc(IWordBreakerConfig*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_word_stemmer : Proc(IWordBreakerConfig*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_word_stemmer : Proc(IWordBreakerConfig*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8fa0d5a6-dedf-11d0-9a61-00c04fb68bf7")]
  record IWordBreakerConfig, lpVtbl : IWordBreakerConfigVtbl* do
    GUID = LibC::GUID.new(0x8fa0d5a6_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
    def query_interface(this : IWordBreakerConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWordBreakerConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWordBreakerConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_locale_info(this : IWordBreakerConfig*, dwCodePageID : UInt32, lcid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_locale_info.call(this, dwCodePageID, lcid)
    end
    def get_locale_info(this : IWordBreakerConfig*, pdwCodePageID : UInt32*, plcid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_locale_info.call(this, pdwCodePageID, plcid)
    end
    def set_break_word_type(this : IWordBreakerConfig*, dwBreakWordType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_break_word_type.call(this, dwBreakWordType)
    end
    def get_break_word_type(this : IWordBreakerConfig*, pdwBreakWordType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_break_word_type.call(this, pdwBreakWordType)
    end
    def set_control_info(this : IWordBreakerConfig*, grfBreakFlags : UInt32, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_control_info.call(this, grfBreakFlags, dwReserved)
    end
    def get_control_info(this : IWordBreakerConfig*, pgrfBreakFlags : UInt32*, pdwReserved : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_control_info.call(this, pgrfBreakFlags, pdwReserved)
    end
    def load_external_breaker_data(this : IWordBreakerConfig*, pStream : Void*, dwExtDataType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_external_breaker_data.call(this, pStream, dwExtDataType)
    end
    def set_word_stemmer(this : IWordBreakerConfig*, rclsid : LibC::GUID*, pStemmer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_word_stemmer.call(this, rclsid, pStemmer)
    end
    def get_word_stemmer(this : IWordBreakerConfig*, ppStemmer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_word_stemmer.call(this, ppStemmer)
    end

  end

  @[Extern]
  record IITResultSetVtbl,
    query_interface : Proc(IITResultSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IITResultSet*, UInt32),
    release : Proc(IITResultSet*, UInt32),
    set_column_priority : Proc(IITResultSet*, Int32, Win32cr::Data::HtmlHelp::PRIORITY, Win32cr::Foundation::HRESULT),
    set_column_heap : Proc(IITResultSet*, Int32, Void*, Win32cr::Data::HtmlHelp::PFNCOLHEAPFREE, Win32cr::Foundation::HRESULT),
    set_key_prop : Proc(IITResultSet*, UInt32, Win32cr::Foundation::HRESULT),
    add_1 : Proc(IITResultSet*, UInt32, UInt32, Win32cr::Data::HtmlHelp::PRIORITY, Win32cr::Foundation::HRESULT),
    add_2 : Proc(IITResultSet*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Data::HtmlHelp::PRIORITY, Win32cr::Foundation::HRESULT),
    add_3 : Proc(IITResultSet*, UInt32, Void*, UInt32, Win32cr::Data::HtmlHelp::PRIORITY, Win32cr::Foundation::HRESULT),
    add_4 : Proc(IITResultSet*, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IITResultSet*, Void*, Void*, Win32cr::Foundation::HRESULT),
    set_1 : Proc(IITResultSet*, Int32, Int32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_2 : Proc(IITResultSet*, Int32, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_3 : Proc(IITResultSet*, Int32, Int32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    set_4 : Proc(IITResultSet*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    copy : Proc(IITResultSet*, Void*, Win32cr::Foundation::HRESULT),
    append_rows : Proc(IITResultSet*, Void*, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get : Proc(IITResultSet*, Int32, Int32, Win32cr::Data::HtmlHelp::CProperty*, Win32cr::Foundation::HRESULT),
    get_key_prop : Proc(IITResultSet*, UInt32*, Win32cr::Foundation::HRESULT),
    get_column_priority : Proc(IITResultSet*, Int32, Win32cr::Data::HtmlHelp::PRIORITY*, Win32cr::Foundation::HRESULT),
    get_row_count : Proc(IITResultSet*, Int32*, Win32cr::Foundation::HRESULT),
    get_column_count : Proc(IITResultSet*, Int32*, Win32cr::Foundation::HRESULT),
    get_column_1 : Proc(IITResultSet*, Int32, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Data::HtmlHelp::PRIORITY*, Win32cr::Foundation::HRESULT),
    get_column_2 : Proc(IITResultSet*, Int32, UInt32*, Win32cr::Foundation::HRESULT),
    get_column_from_prop_id : Proc(IITResultSet*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    clear : Proc(IITResultSet*, Win32cr::Foundation::HRESULT),
    clear_rows : Proc(IITResultSet*, Win32cr::Foundation::HRESULT),
    free : Proc(IITResultSet*, Win32cr::Foundation::HRESULT),
    is_completed : Proc(IITResultSet*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IITResultSet*, Win32cr::Foundation::HRESULT),
    pause : Proc(IITResultSet*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_row_status : Proc(IITResultSet*, Int32, Int32, Win32cr::Data::HtmlHelp::ROWSTATUS*, Win32cr::Foundation::HRESULT),
    get_column_status : Proc(IITResultSet*, Win32cr::Data::HtmlHelp::COLUMNSTATUS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3bb91d41-998b-11d0-a850-00aa006c7d01")]
  record IITResultSet, lpVtbl : IITResultSetVtbl* do
    GUID = LibC::GUID.new(0x3bb91d41_u32, 0x998b_u16, 0x11d0_u16, StaticArray[0xa8_u8, 0x50_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x7d_u8, 0x1_u8])
    def query_interface(this : IITResultSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IITResultSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IITResultSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_column_priority(this : IITResultSet*, lColumnIndex : Int32, column_priority : Win32cr::Data::HtmlHelp::PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_column_priority.call(this, lColumnIndex, column_priority)
    end
    def set_column_heap(this : IITResultSet*, lColumnIndex : Int32, lpvHeap : Void*, pfnColHeapFree : Win32cr::Data::HtmlHelp::PFNCOLHEAPFREE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_column_heap.call(this, lColumnIndex, lpvHeap, pfnColHeapFree)
    end
    def set_key_prop(this : IITResultSet*, prop_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_key_prop.call(this, prop_id)
    end
    def add_1(this : IITResultSet*, prop_id : UInt32, dwDefaultData : UInt32, priority : Win32cr::Data::HtmlHelp::PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_1.call(this, prop_id, dwDefaultData, priority)
    end
    def add_2(this : IITResultSet*, prop_id : UInt32, lpszwDefault : Win32cr::Foundation::PWSTR, priority : Win32cr::Data::HtmlHelp::PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_2.call(this, prop_id, lpszwDefault, priority)
    end
    def add_3(this : IITResultSet*, prop_id : UInt32, lpvDefaultData : Void*, cbData : UInt32, priority : Win32cr::Data::HtmlHelp::PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_3.call(this, prop_id, lpvDefaultData, cbData, priority)
    end
    def add_4(this : IITResultSet*, lpvHdr : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_4.call(this, lpvHdr)
    end
    def append(this : IITResultSet*, lpvHdr : Void*, lpvData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, lpvHdr, lpvData)
    end
    def set_1(this : IITResultSet*, lRowIndex : Int32, lColumnIndex : Int32, lpvData : Void*, cbData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_1.call(this, lRowIndex, lColumnIndex, lpvData, cbData)
    end
    def set_2(this : IITResultSet*, lRowIndex : Int32, lColumnIndex : Int32, lpwStr : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_2.call(this, lRowIndex, lColumnIndex, lpwStr)
    end
    def set_3(this : IITResultSet*, lRowIndex : Int32, lColumnIndex : Int32, dwData : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_3.call(this, lRowIndex, lColumnIndex, dwData)
    end
    def set_4(this : IITResultSet*, lRowIndex : Int32, lpvHdr : Void*, lpvData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_4.call(this, lRowIndex, lpvHdr, lpvData)
    end
    def copy(this : IITResultSet*, pRSCopy : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, pRSCopy)
    end
    def append_rows(this : IITResultSet*, pResSrc : Void*, lRowSrcFirst : Int32, cSrcRows : Int32, lRowFirstDest : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append_rows.call(this, pResSrc, lRowSrcFirst, cSrcRows, lRowFirstDest)
    end
    def get(this : IITResultSet*, lRowIndex : Int32, lColumnIndex : Int32, prop : Win32cr::Data::HtmlHelp::CProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, lRowIndex, lColumnIndex, prop)
    end
    def get_key_prop(this : IITResultSet*, key_prop_id : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_key_prop.call(this, key_prop_id)
    end
    def get_column_priority(this : IITResultSet*, lColumnIndex : Int32, column_priority : Win32cr::Data::HtmlHelp::PRIORITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_priority.call(this, lColumnIndex, column_priority)
    end
    def get_row_count(this : IITResultSet*, lNumberOfRows : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_row_count.call(this, lNumberOfRows)
    end
    def get_column_count(this : IITResultSet*, lNumberOfColumns : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_count.call(this, lNumberOfColumns)
    end
    def get_column_1(this : IITResultSet*, lColumnIndex : Int32, prop_id : UInt32*, dwType : UInt32*, lpvDefaultValue : Void**, cbSize : UInt32*, column_priority : Win32cr::Data::HtmlHelp::PRIORITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_1.call(this, lColumnIndex, prop_id, dwType, lpvDefaultValue, cbSize, column_priority)
    end
    def get_column_2(this : IITResultSet*, lColumnIndex : Int32, prop_id : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_2.call(this, lColumnIndex, prop_id)
    end
    def get_column_from_prop_id(this : IITResultSet*, prop_id : UInt32, lColumnIndex : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_from_prop_id.call(this, prop_id, lColumnIndex)
    end
    def clear(this : IITResultSet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def clear_rows(this : IITResultSet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_rows.call(this)
    end
    def free(this : IITResultSet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free.call(this)
    end
    def is_completed(this : IITResultSet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_completed.call(this)
    end
    def cancel(this : IITResultSet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def pause(this : IITResultSet*, fPause : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this, fPause)
    end
    def get_row_status(this : IITResultSet*, lRowFirst : Int32, cRows : Int32, lpRowStatus : Win32cr::Data::HtmlHelp::ROWSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_row_status.call(this, lRowFirst, cRows, lpRowStatus)
    end
    def get_column_status(this : IITResultSet*, lpColStatus : Win32cr::Data::HtmlHelp::COLUMNSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_status.call(this, lpColStatus)
    end

  end

end