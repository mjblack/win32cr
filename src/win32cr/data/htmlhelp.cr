require "../ui/controls.cr"
require "../foundation.cr"
require "../system/com.cr"
require "../system/search.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
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

  type IITGroup = Void
  type IITQuery = Void
  type IITStopWordList = Void

  alias PFNCOLHEAPFREE = Proc(Void*, Int32)


  enum WORD_WHEEL_OPEN_FLAGS : UInt32
    ITWW_OPEN_CONNECT = 0
  end

  enum HH_GPROPID : Int32
    HH_GPROPID_SINGLETHREAD = 1
    HH_GPROPID_TOOLBAR_MARGIN = 2
    HH_GPROPID_UI_LANGUAGE = 3
    HH_GPROPID_CURRENT_SUBSET = 4
    HH_GPROPID_CONTENT_LANGUAGE = 5
  end

  enum PRIORITY : Int32
    PRIORITY_LOW = 0
    PRIORITY_NORMAL = 1
    PRIORITY_HIGH = 2
  end

  union CProperty_Anonymous_e__Union
    lpszw_data : LibC::LPWSTR
    lpv_data : Void*
    dw_value : UInt32
  end

  struct HHN_NOTIFY
    hdr : NMHDR
    psz_url : PSTR
  end
  struct HH_POPUP
    cb_struct : Int32
    hinst : HINSTANCE
    id_string : UInt32
    psz_text : Int8*
    pt : POINT
    clr_foreground : UInt32
    clr_background : UInt32
    rc_margins : RECT
    psz_font : Int8*
  end
  struct HH_AKLINK
    cb_struct : Int32
    f_reserved : LibC::BOOL
    psz_keywords : Int8*
    psz_url : Int8*
    psz_msg_text : Int8*
    psz_msg_title : Int8*
    psz_window : Int8*
    f_index_on_fail : LibC::BOOL
  end
  struct HH_ENUM_IT
    cb_struct : Int32
    i_type : Int32
    psz_cat_name : PSTR
    psz_it_name : PSTR
    psz_it_description : PSTR
  end
  struct HH_ENUM_CAT
    cb_struct : Int32
    psz_cat_name : PSTR
    psz_cat_description : PSTR
  end
  struct HH_SET_INFOTYPE
    cb_struct : Int32
    psz_cat_name : PSTR
    psz_info_type_name : PSTR
  end
  struct HH_FTS_QUERY
    cb_struct : Int32
    f_uni_code_strings : LibC::BOOL
    psz_search_query : Int8*
    i_proximity : Int32
    f_stemmed_search : LibC::BOOL
    f_title_only : LibC::BOOL
    f_execute : LibC::BOOL
    psz_window : Int8*
  end
  struct HH_WINTYPE
    cb_struct : Int32
    f_uni_code_strings : LibC::BOOL
    psz_type : Int8*
    fs_valid_members : UInt32
    fs_win_properties : UInt32
    psz_caption : Int8*
    dw_styles : UInt32
    dw_ex_styles : UInt32
    rc_window_pos : RECT
    n_show_state : Int32
    hwnd_help : HANDLE
    hwnd_caller : HANDLE
    pa_info_types : UInt32*
    hwnd_tool_bar : HANDLE
    hwnd_navigation : HANDLE
    hwnd_html : HANDLE
    i_nav_width : Int32
    rc_html : RECT
    psz_toc : Int8*
    psz_index : Int8*
    psz_file : Int8*
    psz_home : Int8*
    fs_tool_bar_flags : UInt32
    f_not_expanded : LibC::BOOL
    cur_nav_type : Int32
    tabpos : Int32
    id_notify : Int32
    tab_order : UInt8[20]*
    c_history : Int32
    psz_jump1 : Int8*
    psz_jump2 : Int8*
    psz_url_jump1 : Int8*
    psz_url_jump2 : Int8*
    rc_min_size : RECT
    cb_info_types : Int32
    psz_custom_tabs : Int8*
  end
  struct HHNTRACK
    hdr : NMHDR
    psz_cur_url : PSTR
    id_action : Int32
    phh_win_type : HH_WINTYPE*
  end
  struct HH_GLOBAL_PROPERTY
    id : HH_GPROPID
    var : VARIANT
  end
  struct CProperty
    dw_prop_id : UInt32
    cb_data : UInt32
    dw_type : UInt32
    anonymous : CProperty_Anonymous_e__Union
    f_persist : LibC::BOOL
  end
  struct ROWSTATUS
    l_row_first : Int32
    c_rows : Int32
    c_properties : Int32
    c_rows_total : Int32
  end
  struct COLUMNSTATUS
    c_prop_count : Int32
    c_props_loaded : Int32
  end


  struct IITPropListVTbl
    query_interface : Proc(IITPropList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IITPropList*, UInt32)
    release : Proc(IITPropList*, UInt32)
    get_class_id : Proc(IITPropList*, Guid*, HRESULT)
    is_dirty : Proc(IITPropList*, HRESULT)
    load : Proc(IITPropList*, IStream, HRESULT)
    save : Proc(IITPropList*, IStream, LibC::BOOL, HRESULT)
    get_size_max : Proc(IITPropList*, ULARGE_INTEGER*, HRESULT)
    init_new : Proc(IITPropList*, HRESULT)
    set : Proc(IITPropList*, UInt32, LibC::LPWSTR, UInt32, HRESULT)
    set2 : Proc(IITPropList*, UInt32, Void*, UInt32, UInt32, HRESULT)
    set3 : Proc(IITPropList*, UInt32, UInt32, UInt32, HRESULT)
    add : Proc(IITPropList*, CProperty*, HRESULT)
    get : Proc(IITPropList*, UInt32, CProperty*, HRESULT)
    clear : Proc(IITPropList*, HRESULT)
    set_persist : Proc(IITPropList*, LibC::BOOL, HRESULT)
    set_persist2 : Proc(IITPropList*, UInt32, LibC::BOOL, HRESULT)
    get_first : Proc(IITPropList*, CProperty*, HRESULT)
    get_next : Proc(IITPropList*, CProperty*, HRESULT)
    get_prop_count : Proc(IITPropList*, Int32*, HRESULT)
    save_header : Proc(IITPropList*, Void*, UInt32, HRESULT)
    save_data : Proc(IITPropList*, Void*, UInt32, Void*, UInt32, HRESULT)
    get_header_size : Proc(IITPropList*, UInt32*, HRESULT)
    get_data_size : Proc(IITPropList*, Void*, UInt32, UInt32*, HRESULT)
    save_data_to_stream : Proc(IITPropList*, Void*, UInt32, IStream, HRESULT)
    load_from_mem : Proc(IITPropList*, Void*, UInt32, HRESULT)
    save_to_mem : Proc(IITPropList*, Void*, UInt32, HRESULT)
  end

  IITPropList_GUID = "1f403bb1-9997-11d0-a850-00aa006c7d01"
  IID_IITPropList = LibC::GUID.new(0x1f403bb1_u32, 0x9997_u16, 0x11d0_u16, StaticArray[0xa8_u8, 0x50_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x7d_u8, 0x1_u8])
  struct IITPropList
    lpVtbl : IITPropListVTbl*
  end

  struct IITDatabaseVTbl
    query_interface : Proc(IITDatabase*, Guid*, Void**, HRESULT)
    add_ref : Proc(IITDatabase*, UInt32)
    release : Proc(IITDatabase*, UInt32)
    open : Proc(IITDatabase*, LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)
    close : Proc(IITDatabase*, HRESULT)
    create_object : Proc(IITDatabase*, Guid*, UInt32*, HRESULT)
    get_object : Proc(IITDatabase*, UInt32, Guid*, Void**, HRESULT)
    get_object_persistence : Proc(IITDatabase*, LibC::LPWSTR, UInt32, Void**, LibC::BOOL, HRESULT)
  end

  IITDatabase_GUID = "8fa0d5a2-dedf-11d0-9a61-00c04fb68bf7"
  IID_IITDatabase = LibC::GUID.new(0x8fa0d5a2_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
  struct IITDatabase
    lpVtbl : IITDatabaseVTbl*
  end

  struct IITWordWheelVTbl
    query_interface : Proc(IITWordWheel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IITWordWheel*, UInt32)
    release : Proc(IITWordWheel*, UInt32)
    open : Proc(IITWordWheel*, IITDatabase, LibC::LPWSTR, WORD_WHEEL_OPEN_FLAGS, HRESULT)
    close : Proc(IITWordWheel*, HRESULT)
    get_locale_info : Proc(IITWordWheel*, UInt32*, UInt32*, HRESULT)
    get_sorter_instance : Proc(IITWordWheel*, UInt32*, HRESULT)
    count : Proc(IITWordWheel*, Int32*, HRESULT)
    lookup : Proc(IITWordWheel*, Void*, LibC::BOOL, Int32*, HRESULT)
    lookup2 : Proc(IITWordWheel*, Int32, IITResultSet, Int32, HRESULT)
    lookup3 : Proc(IITWordWheel*, Int32, Void*, UInt32, HRESULT)
    set_group : Proc(IITWordWheel*, IITGroup*, HRESULT)
    get_group : Proc(IITWordWheel*, IITGroup**, HRESULT)
    get_data_count : Proc(IITWordWheel*, Int32, UInt32*, HRESULT)
    get_data : Proc(IITWordWheel*, Int32, IITResultSet, HRESULT)
    get_data_columns : Proc(IITWordWheel*, IITResultSet, HRESULT)
  end

  IITWordWheel_GUID = "8fa0d5a4-dedf-11d0-9a61-00c04fb68bf7"
  IID_IITWordWheel = LibC::GUID.new(0x8fa0d5a4_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
  struct IITWordWheel
    lpVtbl : IITWordWheelVTbl*
  end

  struct IStemSinkVTbl
    query_interface : Proc(IStemSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStemSink*, UInt32)
    release : Proc(IStemSink*, UInt32)
    put_alt_word : Proc(IStemSink*, LibC::LPWSTR, UInt32, HRESULT)
    put_word : Proc(IStemSink*, LibC::LPWSTR, UInt32, HRESULT)
  end

  IStemSink_GUID = "fe77c330-7f42-11ce-be57-00aa0051fe20"
  IID_IStemSink = LibC::GUID.new(0xfe77c330_u32, 0x7f42_u16, 0x11ce_u16, StaticArray[0xbe_u8, 0x57_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x51_u8, 0xfe_u8, 0x20_u8])
  struct IStemSink
    lpVtbl : IStemSinkVTbl*
  end

  struct IStemmerConfigVTbl
    query_interface : Proc(IStemmerConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStemmerConfig*, UInt32)
    release : Proc(IStemmerConfig*, UInt32)
    set_locale_info : Proc(IStemmerConfig*, UInt32, UInt32, HRESULT)
    get_locale_info : Proc(IStemmerConfig*, UInt32*, UInt32*, HRESULT)
    set_control_info : Proc(IStemmerConfig*, UInt32, UInt32, HRESULT)
    get_control_info : Proc(IStemmerConfig*, UInt32*, UInt32*, HRESULT)
    load_external_stemmer_data : Proc(IStemmerConfig*, IStream, UInt32, HRESULT)
  end

  IStemmerConfig_GUID = "8fa0d5a7-dedf-11d0-9a61-00c04fb68bf7"
  IID_IStemmerConfig = LibC::GUID.new(0x8fa0d5a7_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
  struct IStemmerConfig
    lpVtbl : IStemmerConfigVTbl*
  end

  struct IWordBreakerConfigVTbl
    query_interface : Proc(IWordBreakerConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWordBreakerConfig*, UInt32)
    release : Proc(IWordBreakerConfig*, UInt32)
    set_locale_info : Proc(IWordBreakerConfig*, UInt32, UInt32, HRESULT)
    get_locale_info : Proc(IWordBreakerConfig*, UInt32*, UInt32*, HRESULT)
    set_break_word_type : Proc(IWordBreakerConfig*, UInt32, HRESULT)
    get_break_word_type : Proc(IWordBreakerConfig*, UInt32*, HRESULT)
    set_control_info : Proc(IWordBreakerConfig*, UInt32, UInt32, HRESULT)
    get_control_info : Proc(IWordBreakerConfig*, UInt32*, UInt32*, HRESULT)
    load_external_breaker_data : Proc(IWordBreakerConfig*, IStream, UInt32, HRESULT)
    set_word_stemmer : Proc(IWordBreakerConfig*, Guid*, IStemmer, HRESULT)
    get_word_stemmer : Proc(IWordBreakerConfig*, IStemmer*, HRESULT)
  end

  IWordBreakerConfig_GUID = "8fa0d5a6-dedf-11d0-9a61-00c04fb68bf7"
  IID_IWordBreakerConfig = LibC::GUID.new(0x8fa0d5a6_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
  struct IWordBreakerConfig
    lpVtbl : IWordBreakerConfigVTbl*
  end

  struct IITResultSetVTbl
    query_interface : Proc(IITResultSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IITResultSet*, UInt32)
    release : Proc(IITResultSet*, UInt32)
    set_column_priority : Proc(IITResultSet*, Int32, PRIORITY, HRESULT)
    set_column_heap : Proc(IITResultSet*, Int32, Void*, PFNCOLHEAPFREE, HRESULT)
    set_key_prop : Proc(IITResultSet*, UInt32, HRESULT)
    add : Proc(IITResultSet*, UInt32, UInt32, PRIORITY, HRESULT)
    add2 : Proc(IITResultSet*, UInt32, LibC::LPWSTR, PRIORITY, HRESULT)
    add3 : Proc(IITResultSet*, UInt32, Void*, UInt32, PRIORITY, HRESULT)
    add4 : Proc(IITResultSet*, Void*, HRESULT)
    append : Proc(IITResultSet*, Void*, Void*, HRESULT)
    set : Proc(IITResultSet*, Int32, Int32, Void*, UInt32, HRESULT)
    set2 : Proc(IITResultSet*, Int32, Int32, LibC::LPWSTR, HRESULT)
    set3 : Proc(IITResultSet*, Int32, Int32, LibC::UINT_PTR, HRESULT)
    set4 : Proc(IITResultSet*, Int32, Void*, Void*, HRESULT)
    copy : Proc(IITResultSet*, IITResultSet, HRESULT)
    append_rows : Proc(IITResultSet*, IITResultSet, Int32, Int32, Int32*, HRESULT)
    get : Proc(IITResultSet*, Int32, Int32, CProperty*, HRESULT)
    get_key_prop : Proc(IITResultSet*, UInt32*, HRESULT)
    get_column_priority : Proc(IITResultSet*, Int32, PRIORITY*, HRESULT)
    get_row_count : Proc(IITResultSet*, Int32*, HRESULT)
    get_column_count : Proc(IITResultSet*, Int32*, HRESULT)
    get_column : Proc(IITResultSet*, Int32, UInt32*, UInt32*, Void**, UInt32*, PRIORITY*, HRESULT)
    get_column2 : Proc(IITResultSet*, Int32, UInt32*, HRESULT)
    get_column_from_prop_id : Proc(IITResultSet*, UInt32, Int32*, HRESULT)
    clear : Proc(IITResultSet*, HRESULT)
    clear_rows : Proc(IITResultSet*, HRESULT)
    free : Proc(IITResultSet*, HRESULT)
    is_completed : Proc(IITResultSet*, HRESULT)
    cancel : Proc(IITResultSet*, HRESULT)
    pause : Proc(IITResultSet*, LibC::BOOL, HRESULT)
    get_row_status : Proc(IITResultSet*, Int32, Int32, ROWSTATUS*, HRESULT)
    get_column_status : Proc(IITResultSet*, COLUMNSTATUS*, HRESULT)
  end

  IITResultSet_GUID = "3bb91d41-998b-11d0-a850-00aa006c7d01"
  IID_IITResultSet = LibC::GUID.new(0x3bb91d41_u32, 0x998b_u16, 0x11d0_u16, StaticArray[0xa8_u8, 0x50_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x7d_u8, 0x1_u8])
  struct IITResultSet
    lpVtbl : IITResultSetVTbl*
  end

end
