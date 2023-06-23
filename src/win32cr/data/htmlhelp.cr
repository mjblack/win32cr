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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_id : UInt64
    is_dirty : UInt64
    load : UInt64
    save : UInt64
    get_size_max : UInt64
    init_new : UInt64
    set : UInt64
    set2 : UInt64
    set3 : UInt64
    add : UInt64
    get : UInt64
    clear : UInt64
    set_persist : UInt64
    set_persist2 : UInt64
    get_first : UInt64
    get_next : UInt64
    get_prop_count : UInt64
    save_header : UInt64
    save_data : UInt64
    get_header_size : UInt64
    get_data_size : UInt64
    save_data_to_stream : UInt64
    load_from_mem : UInt64
    save_to_mem : UInt64
  end

  IITPropList_GUID = "1f403bb1-9997-11d0-a850-00aa006c7d01"
  IID_IITPropList = LibC::GUID.new(0x1f403bb1_u32, 0x9997_u16, 0x11d0_u16, StaticArray[0xa8_u8, 0x50_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x7d_u8, 0x1_u8])
  struct IITPropList
    lpVtbl : IITPropListVTbl*
  end

  struct IITDatabaseVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open : UInt64
    close : UInt64
    create_object : UInt64
    get_object : UInt64
    get_object_persistence : UInt64
  end

  IITDatabase_GUID = "8fa0d5a2-dedf-11d0-9a61-00c04fb68bf7"
  IID_IITDatabase = LibC::GUID.new(0x8fa0d5a2_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
  struct IITDatabase
    lpVtbl : IITDatabaseVTbl*
  end

  struct IITWordWheelVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open : UInt64
    close : UInt64
    get_locale_info : UInt64
    get_sorter_instance : UInt64
    count : UInt64
    lookup : UInt64
    lookup2 : UInt64
    lookup3 : UInt64
    set_group : UInt64
    get_group : UInt64
    get_data_count : UInt64
    get_data : UInt64
    get_data_columns : UInt64
  end

  IITWordWheel_GUID = "8fa0d5a4-dedf-11d0-9a61-00c04fb68bf7"
  IID_IITWordWheel = LibC::GUID.new(0x8fa0d5a4_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
  struct IITWordWheel
    lpVtbl : IITWordWheelVTbl*
  end

  struct IStemSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    put_alt_word : UInt64
    put_word : UInt64
  end

  IStemSink_GUID = "fe77c330-7f42-11ce-be57-00aa0051fe20"
  IID_IStemSink = LibC::GUID.new(0xfe77c330_u32, 0x7f42_u16, 0x11ce_u16, StaticArray[0xbe_u8, 0x57_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x51_u8, 0xfe_u8, 0x20_u8])
  struct IStemSink
    lpVtbl : IStemSinkVTbl*
  end

  struct IStemmerConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_locale_info : UInt64
    get_locale_info : UInt64
    set_control_info : UInt64
    get_control_info : UInt64
    load_external_stemmer_data : UInt64
  end

  IStemmerConfig_GUID = "8fa0d5a7-dedf-11d0-9a61-00c04fb68bf7"
  IID_IStemmerConfig = LibC::GUID.new(0x8fa0d5a7_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
  struct IStemmerConfig
    lpVtbl : IStemmerConfigVTbl*
  end

  struct IWordBreakerConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_locale_info : UInt64
    get_locale_info : UInt64
    set_break_word_type : UInt64
    get_break_word_type : UInt64
    set_control_info : UInt64
    get_control_info : UInt64
    load_external_breaker_data : UInt64
    set_word_stemmer : UInt64
    get_word_stemmer : UInt64
  end

  IWordBreakerConfig_GUID = "8fa0d5a6-dedf-11d0-9a61-00c04fb68bf7"
  IID_IWordBreakerConfig = LibC::GUID.new(0x8fa0d5a6_u32, 0xdedf_u16, 0x11d0_u16, StaticArray[0x9a_u8, 0x61_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x8b_u8, 0xf7_u8])
  struct IWordBreakerConfig
    lpVtbl : IWordBreakerConfigVTbl*
  end

  struct IITResultSetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_column_priority : UInt64
    set_column_heap : UInt64
    set_key_prop : UInt64
    add : UInt64
    add2 : UInt64
    add3 : UInt64
    add4 : UInt64
    append : UInt64
    set : UInt64
    set2 : UInt64
    set3 : UInt64
    set4 : UInt64
    copy : UInt64
    append_rows : UInt64
    get : UInt64
    get_key_prop : UInt64
    get_column_priority : UInt64
    get_row_count : UInt64
    get_column_count : UInt64
    get_column : UInt64
    get_column2 : UInt64
    get_column_from_prop_id : UInt64
    clear : UInt64
    clear_rows : UInt64
    free : UInt64
    is_completed : UInt64
    cancel : UInt64
    pause : UInt64
    get_row_status : UInt64
    get_column_status : UInt64
  end

  IITResultSet_GUID = "3bb91d41-998b-11d0-a850-00aa006c7d01"
  IID_IITResultSet = LibC::GUID.new(0x3bb91d41_u32, 0x998b_u16, 0x11d0_u16, StaticArray[0xa8_u8, 0x50_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x7d_u8, 0x1_u8])
  struct IITResultSet
    lpVtbl : IITResultSetVTbl*
  end

end
struct LibWin32::IITPropList
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
  def set(propid : UInt32, lpszwstring : LibC::LPWSTR, dwoperation : UInt32) : HRESULT
    @lpVtbl.value.set.unsafe_as(Proc(UInt32, LibC::LPWSTR, UInt32, HRESULT)).call(propid, lpszwstring, dwoperation)
  end
  def set2(propid : UInt32, lpvdata : Void*, cbdata : UInt32, dwoperation : UInt32) : HRESULT
    @lpVtbl.value.set2.unsafe_as(Proc(UInt32, Void*, UInt32, UInt32, HRESULT)).call(propid, lpvdata, cbdata, dwoperation)
  end
  def set3(propid : UInt32, dwdata : UInt32, dwoperation : UInt32) : HRESULT
    @lpVtbl.value.set3.unsafe_as(Proc(UInt32, UInt32, UInt32, HRESULT)).call(propid, dwdata, dwoperation)
  end
  def add(prop : CProperty*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(CProperty*, HRESULT)).call(prop)
  end
  def get(propid : UInt32, property : CProperty*) : HRESULT
    @lpVtbl.value.get.unsafe_as(Proc(UInt32, CProperty*, HRESULT)).call(propid, property)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def set_persist(fpersist : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_persist.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fpersist)
  end
  def set_persist2(propid : UInt32, fpersist : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_persist2.unsafe_as(Proc(UInt32, LibC::BOOL, HRESULT)).call(propid, fpersist)
  end
  def get_first(property : CProperty*) : HRESULT
    @lpVtbl.value.get_first.unsafe_as(Proc(CProperty*, HRESULT)).call(property)
  end
  def get_next(property : CProperty*) : HRESULT
    @lpVtbl.value.get_next.unsafe_as(Proc(CProperty*, HRESULT)).call(property)
  end
  def get_prop_count(cprop : Int32*) : HRESULT
    @lpVtbl.value.get_prop_count.unsafe_as(Proc(Int32*, HRESULT)).call(cprop)
  end
  def save_header(lpvdata : Void*, dwhdrsize : UInt32) : HRESULT
    @lpVtbl.value.save_header.unsafe_as(Proc(Void*, UInt32, HRESULT)).call(lpvdata, dwhdrsize)
  end
  def save_data(lpvheader : Void*, dwhdrsize : UInt32, lpvdata : Void*, dwbufsize : UInt32) : HRESULT
    @lpVtbl.value.save_data.unsafe_as(Proc(Void*, UInt32, Void*, UInt32, HRESULT)).call(lpvheader, dwhdrsize, lpvdata, dwbufsize)
  end
  def get_header_size(dwhdrsize : UInt32*) : HRESULT
    @lpVtbl.value.get_header_size.unsafe_as(Proc(UInt32*, HRESULT)).call(dwhdrsize)
  end
  def get_data_size(lpvheader : Void*, dwhdrsize : UInt32, dwdatasize : UInt32*) : HRESULT
    @lpVtbl.value.get_data_size.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(lpvheader, dwhdrsize, dwdatasize)
  end
  def save_data_to_stream(lpvheader : Void*, dwhdrsize : UInt32, pstream : IStream) : HRESULT
    @lpVtbl.value.save_data_to_stream.unsafe_as(Proc(Void*, UInt32, IStream, HRESULT)).call(lpvheader, dwhdrsize, pstream)
  end
  def load_from_mem(lpvdata : Void*, dwbufsize : UInt32) : HRESULT
    @lpVtbl.value.load_from_mem.unsafe_as(Proc(Void*, UInt32, HRESULT)).call(lpvdata, dwbufsize)
  end
  def save_to_mem(lpvdata : Void*, dwbufsize : UInt32) : HRESULT
    @lpVtbl.value.save_to_mem.unsafe_as(Proc(Void*, UInt32, HRESULT)).call(lpvdata, dwbufsize)
  end
end
struct LibWin32::IITDatabase
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open(lpszhost : LibC::LPWSTR, lpszmoniker : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)).call(lpszhost, lpszmoniker, dwflags)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def create_object(rclsid : Guid*, pdwobjinstance : UInt32*) : HRESULT
    @lpVtbl.value.create_object.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(rclsid, pdwobjinstance)
  end
  def get_object(dwobjinstance : UInt32, riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.get_object.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(dwobjinstance, riid, ppvobj)
  end
  def get_object_persistence(lpwszobject : LibC::LPWSTR, dwobjinstance : UInt32, ppvpersistence : Void**, fstream : LibC::BOOL) : HRESULT
    @lpVtbl.value.get_object_persistence.unsafe_as(Proc(LibC::LPWSTR, UInt32, Void**, LibC::BOOL, HRESULT)).call(lpwszobject, dwobjinstance, ppvpersistence, fstream)
  end
end
struct LibWin32::IITWordWheel
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open(lpitdb : IITDatabase, lpszmoniker : LibC::LPWSTR, dwflags : WORD_WHEEL_OPEN_FLAGS) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(IITDatabase, LibC::LPWSTR, WORD_WHEEL_OPEN_FLAGS, HRESULT)).call(lpitdb, lpszmoniker, dwflags)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def get_locale_info(pdwcodepageid : UInt32*, plcid : UInt32*) : HRESULT
    @lpVtbl.value.get_locale_info.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwcodepageid, plcid)
  end
  def get_sorter_instance(pdwobjinstance : UInt32*) : HRESULT
    @lpVtbl.value.get_sorter_instance.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwobjinstance)
  end
  def count(pcentries : Int32*) : HRESULT
    @lpVtbl.value.count.unsafe_as(Proc(Int32*, HRESULT)).call(pcentries)
  end
  def lookup(lpcvprefix : Void*, fexactmatch : LibC::BOOL, plentry : Int32*) : HRESULT
    @lpVtbl.value.lookup.unsafe_as(Proc(Void*, LibC::BOOL, Int32*, HRESULT)).call(lpcvprefix, fexactmatch, plentry)
  end
  def lookup2(lentry : Int32, lpitresult : IITResultSet, centries : Int32) : HRESULT
    @lpVtbl.value.lookup2.unsafe_as(Proc(Int32, IITResultSet, Int32, HRESULT)).call(lentry, lpitresult, centries)
  end
  def lookup3(lentry : Int32, lpvkeybuf : Void*, cbkeybuf : UInt32) : HRESULT
    @lpVtbl.value.lookup3.unsafe_as(Proc(Int32, Void*, UInt32, HRESULT)).call(lentry, lpvkeybuf, cbkeybuf)
  end
  def set_group(piitgroup : IITGroup*) : HRESULT
    @lpVtbl.value.set_group.unsafe_as(Proc(IITGroup*, HRESULT)).call(piitgroup)
  end
  def get_group(ppiitgroup : IITGroup**) : HRESULT
    @lpVtbl.value.get_group.unsafe_as(Proc(IITGroup**, HRESULT)).call(ppiitgroup)
  end
  def get_data_count(lentry : Int32, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_data_count.unsafe_as(Proc(Int32, UInt32*, HRESULT)).call(lentry, pdwcount)
  end
  def get_data(lentry : Int32, lpitresult : IITResultSet) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(Int32, IITResultSet, HRESULT)).call(lentry, lpitresult)
  end
  def get_data_columns(prs : IITResultSet) : HRESULT
    @lpVtbl.value.get_data_columns.unsafe_as(Proc(IITResultSet, HRESULT)).call(prs)
  end
end
struct LibWin32::IStemSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def put_alt_word(pwcinbuf : LibC::LPWSTR, cwc : UInt32) : HRESULT
    @lpVtbl.value.put_alt_word.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pwcinbuf, cwc)
  end
  def put_word(pwcinbuf : LibC::LPWSTR, cwc : UInt32) : HRESULT
    @lpVtbl.value.put_word.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pwcinbuf, cwc)
  end
end
struct LibWin32::IStemmerConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_locale_info(dwcodepageid : UInt32, lcid : UInt32) : HRESULT
    @lpVtbl.value.set_locale_info.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwcodepageid, lcid)
  end
  def get_locale_info(pdwcodepageid : UInt32*, plcid : UInt32*) : HRESULT
    @lpVtbl.value.get_locale_info.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwcodepageid, plcid)
  end
  def set_control_info(grfstemflags : UInt32, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.set_control_info.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(grfstemflags, dwreserved)
  end
  def get_control_info(pgrfstemflags : UInt32*, pdwreserved : UInt32*) : HRESULT
    @lpVtbl.value.get_control_info.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pgrfstemflags, pdwreserved)
  end
  def load_external_stemmer_data(pstream : IStream, dwextdatatype : UInt32) : HRESULT
    @lpVtbl.value.load_external_stemmer_data.unsafe_as(Proc(IStream, UInt32, HRESULT)).call(pstream, dwextdatatype)
  end
end
struct LibWin32::IWordBreakerConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_locale_info(dwcodepageid : UInt32, lcid : UInt32) : HRESULT
    @lpVtbl.value.set_locale_info.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwcodepageid, lcid)
  end
  def get_locale_info(pdwcodepageid : UInt32*, plcid : UInt32*) : HRESULT
    @lpVtbl.value.get_locale_info.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwcodepageid, plcid)
  end
  def set_break_word_type(dwbreakwordtype : UInt32) : HRESULT
    @lpVtbl.value.set_break_word_type.unsafe_as(Proc(UInt32, HRESULT)).call(dwbreakwordtype)
  end
  def get_break_word_type(pdwbreakwordtype : UInt32*) : HRESULT
    @lpVtbl.value.get_break_word_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwbreakwordtype)
  end
  def set_control_info(grfbreakflags : UInt32, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.set_control_info.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(grfbreakflags, dwreserved)
  end
  def get_control_info(pgrfbreakflags : UInt32*, pdwreserved : UInt32*) : HRESULT
    @lpVtbl.value.get_control_info.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pgrfbreakflags, pdwreserved)
  end
  def load_external_breaker_data(pstream : IStream, dwextdatatype : UInt32) : HRESULT
    @lpVtbl.value.load_external_breaker_data.unsafe_as(Proc(IStream, UInt32, HRESULT)).call(pstream, dwextdatatype)
  end
  def set_word_stemmer(rclsid : Guid*, pstemmer : IStemmer) : HRESULT
    @lpVtbl.value.set_word_stemmer.unsafe_as(Proc(Guid*, IStemmer, HRESULT)).call(rclsid, pstemmer)
  end
  def get_word_stemmer(ppstemmer : IStemmer*) : HRESULT
    @lpVtbl.value.get_word_stemmer.unsafe_as(Proc(IStemmer*, HRESULT)).call(ppstemmer)
  end
end
struct LibWin32::IITResultSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_column_priority(lcolumnindex : Int32, columnpriority : PRIORITY) : HRESULT
    @lpVtbl.value.set_column_priority.unsafe_as(Proc(Int32, PRIORITY, HRESULT)).call(lcolumnindex, columnpriority)
  end
  def set_column_heap(lcolumnindex : Int32, lpvheap : Void*, pfncolheapfree : PFNCOLHEAPFREE) : HRESULT
    @lpVtbl.value.set_column_heap.unsafe_as(Proc(Int32, Void*, PFNCOLHEAPFREE, HRESULT)).call(lcolumnindex, lpvheap, pfncolheapfree)
  end
  def set_key_prop(propid : UInt32) : HRESULT
    @lpVtbl.value.set_key_prop.unsafe_as(Proc(UInt32, HRESULT)).call(propid)
  end
  def add(propid : UInt32, dwdefaultdata : UInt32, priority : PRIORITY) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt32, UInt32, PRIORITY, HRESULT)).call(propid, dwdefaultdata, priority)
  end
  def add2(propid : UInt32, lpszwdefault : LibC::LPWSTR, priority : PRIORITY) : HRESULT
    @lpVtbl.value.add2.unsafe_as(Proc(UInt32, LibC::LPWSTR, PRIORITY, HRESULT)).call(propid, lpszwdefault, priority)
  end
  def add3(propid : UInt32, lpvdefaultdata : Void*, cbdata : UInt32, priority : PRIORITY) : HRESULT
    @lpVtbl.value.add3.unsafe_as(Proc(UInt32, Void*, UInt32, PRIORITY, HRESULT)).call(propid, lpvdefaultdata, cbdata, priority)
  end
  def add4(lpvhdr : Void*) : HRESULT
    @lpVtbl.value.add4.unsafe_as(Proc(Void*, HRESULT)).call(lpvhdr)
  end
  def append(lpvhdr : Void*, lpvdata : Void*) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(Void*, Void*, HRESULT)).call(lpvhdr, lpvdata)
  end
  def set(lrowindex : Int32, lcolumnindex : Int32, lpvdata : Void*, cbdata : UInt32) : HRESULT
    @lpVtbl.value.set.unsafe_as(Proc(Int32, Int32, Void*, UInt32, HRESULT)).call(lrowindex, lcolumnindex, lpvdata, cbdata)
  end
  def set2(lrowindex : Int32, lcolumnindex : Int32, lpwstr : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set2.unsafe_as(Proc(Int32, Int32, LibC::LPWSTR, HRESULT)).call(lrowindex, lcolumnindex, lpwstr)
  end
  def set3(lrowindex : Int32, lcolumnindex : Int32, dwdata : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.set3.unsafe_as(Proc(Int32, Int32, LibC::UINT_PTR, HRESULT)).call(lrowindex, lcolumnindex, dwdata)
  end
  def set4(lrowindex : Int32, lpvhdr : Void*, lpvdata : Void*) : HRESULT
    @lpVtbl.value.set4.unsafe_as(Proc(Int32, Void*, Void*, HRESULT)).call(lrowindex, lpvhdr, lpvdata)
  end
  def copy(prscopy : IITResultSet) : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(IITResultSet, HRESULT)).call(prscopy)
  end
  def append_rows(pressrc : IITResultSet, lrowsrcfirst : Int32, csrcrows : Int32, lrowfirstdest : Int32*) : HRESULT
    @lpVtbl.value.append_rows.unsafe_as(Proc(IITResultSet, Int32, Int32, Int32*, HRESULT)).call(pressrc, lrowsrcfirst, csrcrows, lrowfirstdest)
  end
  def get(lrowindex : Int32, lcolumnindex : Int32, prop : CProperty*) : HRESULT
    @lpVtbl.value.get.unsafe_as(Proc(Int32, Int32, CProperty*, HRESULT)).call(lrowindex, lcolumnindex, prop)
  end
  def get_key_prop(keypropid : UInt32*) : HRESULT
    @lpVtbl.value.get_key_prop.unsafe_as(Proc(UInt32*, HRESULT)).call(keypropid)
  end
  def get_column_priority(lcolumnindex : Int32, columnpriority : PRIORITY*) : HRESULT
    @lpVtbl.value.get_column_priority.unsafe_as(Proc(Int32, PRIORITY*, HRESULT)).call(lcolumnindex, columnpriority)
  end
  def get_row_count(lnumberofrows : Int32*) : HRESULT
    @lpVtbl.value.get_row_count.unsafe_as(Proc(Int32*, HRESULT)).call(lnumberofrows)
  end
  def get_column_count(lnumberofcolumns : Int32*) : HRESULT
    @lpVtbl.value.get_column_count.unsafe_as(Proc(Int32*, HRESULT)).call(lnumberofcolumns)
  end
  def get_column(lcolumnindex : Int32, propid : UInt32*, dwtype : UInt32*, lpvdefaultvalue : Void**, cbsize : UInt32*, columnpriority : PRIORITY*) : HRESULT
    @lpVtbl.value.get_column.unsafe_as(Proc(Int32, UInt32*, UInt32*, Void**, UInt32*, PRIORITY*, HRESULT)).call(lcolumnindex, propid, dwtype, lpvdefaultvalue, cbsize, columnpriority)
  end
  def get_column2(lcolumnindex : Int32, propid : UInt32*) : HRESULT
    @lpVtbl.value.get_column2.unsafe_as(Proc(Int32, UInt32*, HRESULT)).call(lcolumnindex, propid)
  end
  def get_column_from_prop_id(propid : UInt32, lcolumnindex : Int32*) : HRESULT
    @lpVtbl.value.get_column_from_prop_id.unsafe_as(Proc(UInt32, Int32*, HRESULT)).call(propid, lcolumnindex)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def clear_rows : HRESULT
    @lpVtbl.value.clear_rows.unsafe_as(Proc(HRESULT)).call
  end
  def free : HRESULT
    @lpVtbl.value.free.unsafe_as(Proc(HRESULT)).call
  end
  def is_completed : HRESULT
    @lpVtbl.value.is_completed.unsafe_as(Proc(HRESULT)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def pause(fpause : LibC::BOOL) : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fpause)
  end
  def get_row_status(lrowfirst : Int32, crows : Int32, lprowstatus : ROWSTATUS*) : HRESULT
    @lpVtbl.value.get_row_status.unsafe_as(Proc(Int32, Int32, ROWSTATUS*, HRESULT)).call(lrowfirst, crows, lprowstatus)
  end
  def get_column_status(lpcolstatus : COLUMNSTATUS*) : HRESULT
    @lpVtbl.value.get_column_status.unsafe_as(Proc(COLUMNSTATUS*, HRESULT)).call(lpcolstatus)
  end
end
