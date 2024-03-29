require "../foundation.cr"
require "../system/com.cr"
require "../ui/controls.cr"
require "../graphics/gdi.cr"
require "../ui/windowsandmessaging.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  MMC_VER = 512_u32
  MMC_PROP_CHANGEAFFECTSUI = 1_u32
  MMC_PROP_MODIFIABLE = 2_u32
  MMC_PROP_REMOVABLE = 4_u32
  MMC_PROP_PERSIST = 8_u32
  MMCLV_AUTO = -1_i32
  MMCLV_NOPARAM = -2_i32
  MMCLV_NOICON = -1_i32
  MMCLV_VIEWSTYLE_ICON = 0_u32
  MMCLV_VIEWSTYLE_SMALLICON = 2_u32
  MMCLV_VIEWSTYLE_LIST = 3_u32
  MMCLV_VIEWSTYLE_REPORT = 1_u32
  MMCLV_VIEWSTYLE_FILTERED = 4_u32
  MMCLV_NOPTR = 0_u32
  MMCLV_UPDATE_NOINVALIDATEALL = 1_u32
  MMCLV_UPDATE_NOSCROLL = 2_u32
  MMC_IMAGECALLBACK = -1_i32
  RDI_STR = 2_u32
  RDI_IMAGE = 4_u32
  RDI_STATE = 8_u32
  RDI_PARAM = 16_u32
  RDI_INDEX = 32_u32
  RDI_INDENT = 64_u32
  MMC_VIEW_OPTIONS_NONE = 0_u32
  MMC_VIEW_OPTIONS_NOLISTVIEWS = 1_u32
  MMC_VIEW_OPTIONS_MULTISELECT = 2_u32
  MMC_VIEW_OPTIONS_OWNERDATALIST = 4_u32
  MMC_VIEW_OPTIONS_FILTERED = 8_u32
  MMC_VIEW_OPTIONS_CREATENEW = 16_u32
  MMC_VIEW_OPTIONS_USEFONTLINKING = 32_u32
  MMC_VIEW_OPTIONS_EXCLUDE_SCOPE_ITEMS_FROM_LIST = 64_u32
  MMC_VIEW_OPTIONS_LEXICAL_SORT = 128_u32
  MMC_PSO_NOAPPLYNOW = 1_u32
  MMC_PSO_HASHELP = 2_u32
  MMC_PSO_NEWWIZARDTYPE = 4_u32
  MMC_PSO_NO_PROPTITLE = 8_u32
  RFI_PARTIAL = 1_u32
  RFI_WRAP = 2_u32
  RSI_DESCENDING = 1_u32
  RSI_NOSORTICON = 2_u32
  SDI_STR = 2_u32
  SDI_IMAGE = 4_u32
  SDI_OPENIMAGE = 8_u32
  SDI_STATE = 16_u32
  SDI_PARAM = 32_u32
  SDI_CHILDREN = 64_u32
  SDI_PARENT = 0_u32
  SDI_PREVIOUS = 268435456_u32
  SDI_NEXT = 536870912_u32
  SDI_FIRST = 134217728_u32
  MMC_MULTI_SELECT_COOKIE = -2_i32
  MMC_WINDOW_COOKIE = -3_i32
  SPECIAL_COOKIE_MIN = -10_i32
  SPECIAL_COOKIE_MAX = -1_i32
  MMC_NW_OPTION_NONE = 0_u32
  MMC_NW_OPTION_NOSCOPEPANE = 1_u32
  MMC_NW_OPTION_NOTOOLBARS = 2_u32
  MMC_NW_OPTION_SHORTTITLE = 4_u32
  MMC_NW_OPTION_CUSTOMTITLE = 8_u32
  MMC_NW_OPTION_NOPERSIST = 16_u32
  MMC_NW_OPTION_NOACTIONPANE = 32_u32
  MMC_NODEID_SLOW_RETRIEVAL = 1_u32
  SPECIAL_DOBJ_MIN = -10_i32
  SPECIAL_DOBJ_MAX = 0_u32
  AUTO_WIDTH = -1_i32
  HIDE_COLUMN = -4_i32
  ILSIF_LEAVE_LARGE_ICON = 1073741824_u32
  ILSIF_LEAVE_SMALL_ICON = 536870912_u32
  HDI_HIDDEN = 1_u32
  RDCI_ScopeItem = 2147483648_u32
  RVTI_MISC_OPTIONS_NOLISTVIEWS = 1_u32
  RVTI_LIST_OPTIONS_NONE = 0_u32
  RVTI_LIST_OPTIONS_OWNERDATALIST = 2_u32
  RVTI_LIST_OPTIONS_MULTISELECT = 4_u32
  RVTI_LIST_OPTIONS_FILTERED = 8_u32
  RVTI_LIST_OPTIONS_USEFONTLINKING = 32_u32
  RVTI_LIST_OPTIONS_EXCLUDE_SCOPE_ITEMS_FROM_LIST = 64_u32
  RVTI_LIST_OPTIONS_LEXICAL_SORT = 128_u32
  RVTI_LIST_OPTIONS_ALLOWPASTE = 256_u32
  RVTI_HTML_OPTIONS_NONE = 0_u32
  RVTI_HTML_OPTIONS_NOLISTVIEW = 1_u32
  RVTI_OCX_OPTIONS_NONE = 0_u32
  RVTI_OCX_OPTIONS_NOLISTVIEW = 1_u32
  RVTI_OCX_OPTIONS_CACHE_OCX = 2_u32
  MMC_DEFAULT_OPERATION_COPY = 1_u32
  MMC_ITEM_OVERLAY_STATE_MASK = 3840_u32
  MMC_ITEM_OVERLAY_STATE_SHIFT = 8_u32
  MMC_ITEM_STATE_MASK = 255_u32
  CLSID_Application = LibC::GUID.new(0x49b2791a_u32, 0xb1ae_u16, 0x4c90_u16, StaticArray[0x9b_u8, 0x8e_u8, 0xe8_u8, 0x60_u8, 0xba_u8, 0x7_u8, 0xf8_u8, 0x89_u8])
  CLSID_AppEventsDHTMLConnector = LibC::GUID.new(0xade6444b_u32, 0xc91f_u16, 0x4e37_u16, StaticArray[0x92_u8, 0xa4_u8, 0x5b_u8, 0xb4_u8, 0x30_u8, 0xa3_u8, 0x33_u8, 0x40_u8])
  CLSID_MMCVersionInfo = LibC::GUID.new(0xd6fedb1d_u32, 0xcf21_u16, 0x4bd9_u16, StaticArray[0xaf_u8, 0x3b_u8, 0xc5_u8, 0x46_u8, 0x8e_u8, 0x9c_u8, 0x66_u8, 0x84_u8])
  CLSID_ConsolePower = LibC::GUID.new(0xf0285374_u32, 0xdff1_u16, 0x11d3_u16, StaticArray[0xb4_u8, 0x33_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])


  enum MMC_PROPERTY_ACTION : Int32
    MMC_PROPACT_DELETING = 1
    MMC_PROPACT_CHANGING = 2
    MMC_PROPACT_INITIALIZED = 3
  end

  enum DocumentMode : Int32
    DocumentMode_Author = 0
    DocumentMode_User = 1
    DocumentMode_User_MDI = 2
    DocumentMode_User_SDI = 3
  end

  enum ListViewMode : Int32
    ListMode_Small_Icons = 0
    ListMode_Large_Icons = 1
    ListMode_List = 2
    ListMode_Detail = 3
    ListMode_Filtered = 4
  end

  enum ViewOptions : Int32
    ViewOption_Default = 0
    ViewOption_ScopeTreeHidden = 1
    ViewOption_NoToolBars = 2
    ViewOption_NotPersistable = 4
    ViewOption_ActionPaneHidden = 8
  end

  enum ExportListOptions : Int32
    ExportListOptions_Default = 0
    ExportListOptions_Unicode = 1
    ExportListOptions_TabDelimited = 2
    ExportListOptions_SelectedItemsOnly = 4
  end

  enum ColumnSortOrder : Int32
    SortOrder_Ascending = 0
    SortOrder_Descending = 1
  end

  enum MMC_RESULT_VIEW_STYLE : Int32
    MMC_SINGLESEL = 1
    MMC_SHOWSELALWAYS = 2
    MMC_NOSORTHEADER = 4
    MMC_ENSUREFOCUSVISIBLE = 8
  end

  enum MMC_CONTROL_TYPE : Int32
    TOOLBAR = 0
    MENUBUTTON = 1
    COMBOBOXBAR = 2
  end

  enum MMC_CONSOLE_VERB : Int32
    MMC_VERB_NONE = 0
    MMC_VERB_OPEN = 32768
    MMC_VERB_COPY = 32769
    MMC_VERB_PASTE = 32770
    MMC_VERB_DELETE = 32771
    MMC_VERB_PROPERTIES = 32772
    MMC_VERB_RENAME = 32773
    MMC_VERB_REFRESH = 32774
    MMC_VERB_PRINT = 32775
    MMC_VERB_CUT = 32776
    MMC_VERB_MAX = 32777
    MMC_VERB_FIRST = 32768
    MMC_VERB_LAST = 32776
  end

  enum MMC_BUTTON_STATE : Int32
    ENABLED = 1
    CHECKED = 2
    HIDDEN = 4
    INDETERMINATE = 8
    BUTTONPRESSED = 16
  end

  enum MMC_SCOPE_ITEM_STATE : Int32
    MMC_SCOPE_ITEM_STATE_NORMAL = 1
    MMC_SCOPE_ITEM_STATE_BOLD = 2
    MMC_SCOPE_ITEM_STATE_EXPANDEDONCE = 3
  end

  enum MMC_MENU_COMMAND_IDS : Int32
    MMCC_STANDARD_VIEW_SELECT = -1
  end

  enum MMC_FILTER_TYPE : Int32
    MMC_STRING_FILTER = 0
    MMC_INT_FILTER = 1
    MMC_FILTER_NOVALUE = 32768
  end

  enum MMC_FILTER_CHANGE_CODE : Int32
    MFCC_DISABLE = 0
    MFCC_ENABLE = 1
    MFCC_VALUE_CHANGE = 2
  end

  enum MMC_NOTIFY_TYPE : Int32
    MMCN_ACTIVATE = 32769
    MMCN_ADD_IMAGES = 32770
    MMCN_BTN_CLICK = 32771
    MMCN_CLICK = 32772
    MMCN_COLUMN_CLICK = 32773
    MMCN_CONTEXTMENU = 32774
    MMCN_CUTORMOVE = 32775
    MMCN_DBLCLICK = 32776
    MMCN_DELETE = 32777
    MMCN_DESELECT_ALL = 32778
    MMCN_EXPAND = 32779
    MMCN_HELP = 32780
    MMCN_MENU_BTNCLICK = 32781
    MMCN_MINIMIZED = 32782
    MMCN_PASTE = 32783
    MMCN_PROPERTY_CHANGE = 32784
    MMCN_QUERY_PASTE = 32785
    MMCN_REFRESH = 32786
    MMCN_REMOVE_CHILDREN = 32787
    MMCN_RENAME = 32788
    MMCN_SELECT = 32789
    MMCN_SHOW = 32790
    MMCN_VIEW_CHANGE = 32791
    MMCN_SNAPINHELP = 32792
    MMCN_CONTEXTHELP = 32793
    MMCN_INITOCX = 32794
    MMCN_FILTER_CHANGE = 32795
    MMCN_FILTERBTN_CLICK = 32796
    MMCN_RESTORE_VIEW = 32797
    MMCN_PRINT = 32798
    MMCN_PRELOAD = 32799
    MMCN_LISTPAD = 32800
    MMCN_EXPANDSYNC = 32801
    MMCN_COLUMNS_CHANGED = 32802
    MMCN_CANPASTE_OUTOFPROC = 32803
  end

  enum DATA_OBJECT_TYPES : Int32
    CCT_SCOPE = 32768
    CCT_RESULT = 32769
    CCT_SNAPIN_MANAGER = 32770
    CCT_UNINITIALIZED = 65535
  end

  enum CCM_INSERTIONPOINTID : Int32
    CCM_INSERTIONPOINTID_MASK_SPECIAL = -65536
    CCM_INSERTIONPOINTID_MASK_SHARED = -2147483648
    CCM_INSERTIONPOINTID_MASK_CREATE_PRIMARY = 1073741824
    CCM_INSERTIONPOINTID_MASK_ADD_PRIMARY = 536870912
    CCM_INSERTIONPOINTID_MASK_ADD_3RDPARTY = 268435456
    CCM_INSERTIONPOINTID_MASK_RESERVED = 268369920
    CCM_INSERTIONPOINTID_MASK_FLAGINDEX = 31
    CCM_INSERTIONPOINTID_PRIMARY_TOP = -1610612736
    CCM_INSERTIONPOINTID_PRIMARY_NEW = -1610612735
    CCM_INSERTIONPOINTID_PRIMARY_TASK = -1610612734
    CCM_INSERTIONPOINTID_PRIMARY_VIEW = -1610612733
    CCM_INSERTIONPOINTID_PRIMARY_HELP = -1610612732
    CCM_INSERTIONPOINTID_3RDPARTY_NEW = -1879048191
    CCM_INSERTIONPOINTID_3RDPARTY_TASK = -1879048190
    CCM_INSERTIONPOINTID_ROOT_MENU = -2147483648
  end

  enum CCM_INSERTIONALLOWED : Int32
    CCM_INSERTIONALLOWED_TOP = 1
    CCM_INSERTIONALLOWED_NEW = 2
    CCM_INSERTIONALLOWED_TASK = 4
    CCM_INSERTIONALLOWED_VIEW = 8
  end

  enum CCM_COMMANDID_MASK_CONSTANTS : UInt32
    CCM_COMMANDID_MASK_RESERVED = 4294901760
  end

  enum CCM_SPECIAL : Int32
    CCM_SPECIAL_SEPARATOR = 1
    CCM_SPECIAL_SUBMENU = 2
    CCM_SPECIAL_DEFAULT_ITEM = 4
    CCM_SPECIAL_INSERTION_POINT = 8
    CCM_SPECIAL_TESTONLY = 16
  end

  enum MMC_TASK_DISPLAY_TYPE : Int32
    MMC_TASK_DISPLAY_UNINITIALIZED = 0
    MMC_TASK_DISPLAY_TYPE_SYMBOL = 1
    MMC_TASK_DISPLAY_TYPE_VANILLA_GIF = 2
    MMC_TASK_DISPLAY_TYPE_CHOCOLATE_GIF = 3
    MMC_TASK_DISPLAY_TYPE_BITMAP = 4
  end

  enum MMC_ACTION_TYPE : Int32
    MMC_ACTION_UNINITIALIZED = -1
    MMC_ACTION_ID = 0
    MMC_ACTION_LINK = 1
    MMC_ACTION_SCRIPT = 2
  end

  enum IconIdentifier : Int32
    Icon_None = 0
    Icon_Error = 32513
    Icon_Question = 32514
    Icon_Warning = 32515
    Icon_Information = 32516
    Icon_First = 32513
    Icon_Last = 32516
  end

  enum MMC_VIEW_TYPE : Int32
    MMC_VIEW_TYPE_LIST = 0
    MMC_VIEW_TYPE_HTML = 1
    MMC_VIEW_TYPE_OCX = 2
  end

  union MMC_TASK_DISPLAY_OBJECT_Anonymous_e__Union
    u_bitmap : MMC_TASK_DISPLAY_BITMAP
    u_symbol : MMC_TASK_DISPLAY_SYMBOL
  end
  union MMC_TASK_Anonymous_e__Union
    n_command_id : LibC::IntPtrT
    sz_action_url : LibC::LPWSTR
    sz_script : LibC::LPWSTR
  end
  union RESULT_VIEW_TYPE_INFO_Anonymous_e__Union
    dw_list_options : UInt32
    anonymous1 : RESULT_VIEW_TYPE_INFO_Anonymous_e__Union_Anonymous1_e__Struct
    anonymous2 : RESULT_VIEW_TYPE_INFO_Anonymous_e__Union_Anonymous2_e__Struct
  end

  struct MMC_SNAPIN_PROPERTY
    psz_prop_name : LibC::LPWSTR
    var_value : VARIANT
    e_action : MMC_PROPERTY_ACTION
  end
  struct MMCBUTTON
    n_bitmap : Int32
    id_command : Int32
    fs_state : UInt8
    fs_type : UInt8
    lp_button_text : LibC::LPWSTR
    lp_tooltip_text : LibC::LPWSTR
  end
  struct RESULTDATAITEM
    mask : UInt32
    b_scope_item : LibC::BOOL
    item_id : LibC::IntPtrT
    n_index : Int32
    n_col : Int32
    str : LibC::LPWSTR
    n_image : Int32
    n_state : UInt32
    l_param : LPARAM
    i_indent : Int32
  end
  struct RESULTFINDINFO
    psz : LibC::LPWSTR
    n_start : Int32
    dw_options : UInt32
  end
  struct SCOPEDATAITEM
    mask : UInt32
    displayname : LibC::LPWSTR
    n_image : Int32
    n_open_image : Int32
    n_state : UInt32
    c_children : Int32
    l_param : LPARAM
    relative_id : LibC::IntPtrT
    id : LibC::IntPtrT
  end
  struct CONTEXTMENUITEM
    str_name : LibC::LPWSTR
    str_status_bar_text : LibC::LPWSTR
    l_command_id : Int32
    l_insertion_point_id : Int32
    f_flags : Int32
    f_special_flags : Int32
  end
  struct MENUBUTTONDATA
    id_command : Int32
    x : Int32
    y : Int32
  end
  struct MMC_FILTERDATA
    psz_text : LibC::LPWSTR
    cch_text_max : Int32
    l_value : Int32
  end
  struct MMC_RESTORE_VIEW
    dw_size : UInt32
    cookie : LibC::IntPtrT
    p_view_type : LibC::LPWSTR
    l_view_options : Int32
  end
  struct MMC_EXPANDSYNC_STRUCT
    b_handled : LibC::BOOL
    b_expanding : LibC::BOOL
    h_item : LibC::IntPtrT
  end
  struct MMC_VISIBLE_COLUMNS
    n_visible_columns : Int32
    rg_visible_cols : Int32[0]*
  end
  struct SMMCDataObjects
    count : UInt32
    lp_data_object : IDataObject[0]*
  end
  struct SMMCObjectTypes
    count : UInt32
    guid : Guid[0]*
  end
  struct SNodeID
    c_bytes : UInt32
    id : UInt8[0]*
  end
  struct SNodeID2
    dw_flags : UInt32
    c_bytes : UInt32
    id : UInt8[0]*
  end
  struct SColumnSetID
    dw_flags : UInt32
    c_bytes : UInt32
    id : UInt8[0]*
  end
  struct MMC_TASK_DISPLAY_SYMBOL
    sz_font_family_name : LibC::LPWSTR
    sz_ur_lto_eot : LibC::LPWSTR
    sz_symbol_string : LibC::LPWSTR
  end
  struct MMC_TASK_DISPLAY_BITMAP
    sz_mouse_over_bitmap : LibC::LPWSTR
    sz_mouse_off_bitmap : LibC::LPWSTR
  end
  struct MMC_TASK_DISPLAY_OBJECT
    e_display_type : MMC_TASK_DISPLAY_TYPE
    anonymous : MMC_TASK_DISPLAY_OBJECT_Anonymous_e__Union
  end
  struct MMC_TASK
    s_display_object : MMC_TASK_DISPLAY_OBJECT
    sz_text : LibC::LPWSTR
    sz_help_string : LibC::LPWSTR
    e_action_type : MMC_ACTION_TYPE
    anonymous : MMC_TASK_Anonymous_e__Union
  end
  struct MMC_LISTPAD_INFO
    sz_title : LibC::LPWSTR
    sz_button_text : LibC::LPWSTR
    n_command_id : LibC::IntPtrT
  end
  struct MMC_COLUMN_DATA
    n_col_index : Int32
    dw_flags : UInt32
    n_width : Int32
    ul_reserved : LibC::UINT_PTR
  end
  struct MMC_COLUMN_SET_DATA
    cb_size : Int32
    n_num_cols : Int32
    p_col_data : MMC_COLUMN_DATA*
  end
  struct MMC_SORT_DATA
    n_col_index : Int32
    dw_sort_options : UInt32
    ul_reserved : LibC::UINT_PTR
  end
  struct MMC_SORT_SET_DATA
    cb_size : Int32
    n_num_items : Int32
    p_sort_data : MMC_SORT_DATA*
  end
  struct RDITEMHDR
    dw_flags : UInt32
    cookie : LibC::IntPtrT
    lp_reserved : LPARAM
  end
  struct RDCOMPARE
    cb_size : UInt32
    dw_flags : UInt32
    n_column : Int32
    l_user_param : LPARAM
    prdch1 : RDITEMHDR*
    prdch2 : RDITEMHDR*
  end
  struct RESULT_VIEW_TYPE_INFO
    pstr_persistable_view_description : LibC::LPWSTR
    e_view_type : MMC_VIEW_TYPE
    dw_misc_options : UInt32
    anonymous : RESULT_VIEW_TYPE_INFO_Anonymous_e__Union
  end
  struct RESULT_VIEW_TYPE_INFO_Anonymous_e__Union_Anonymous2_e__Struct
    dw_ocx_options : UInt32
    p_unk_control : IUnknown
  end
  struct RESULT_VIEW_TYPE_INFO_Anonymous_e__Union_Anonymous1_e__Struct
    dw_html_options : UInt32
    pstr_url : LibC::LPWSTR
  end
  struct CONTEXTMENUITEM2
    str_name : LibC::LPWSTR
    str_status_bar_text : LibC::LPWSTR
    l_command_id : Int32
    l_insertion_point_id : Int32
    f_flags : Int32
    f_special_flags : Int32
    str_language_independent_name : LibC::LPWSTR
  end
  struct MMC_EXT_VIEW_DATA
    view_id : Guid
    psz_url : LibC::LPWSTR
    psz_view_title : LibC::LPWSTR
    psz_tooltip_text : LibC::LPWSTR
    b_replaces_default_view : LibC::BOOL
  end


  struct ISnapinPropertiesVTbl
    query_interface : Proc(ISnapinProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISnapinProperties*, UInt32)
    release : Proc(ISnapinProperties*, UInt32)
    initialize : Proc(ISnapinProperties*, Properties, HRESULT)
    query_property_names : Proc(ISnapinProperties*, ISnapinPropertiesCallback, HRESULT)
    properties_changed : Proc(ISnapinProperties*, Int32, MMC_SNAPIN_PROPERTY*, HRESULT)
  end

  ISnapinProperties_GUID = "f7889da9-4a02-4837-bf89-1a6f2a021010"
  IID_ISnapinProperties = LibC::GUID.new(0xf7889da9_u32, 0x4a02_u16, 0x4837_u16, StaticArray[0xbf_u8, 0x89_u8, 0x1a_u8, 0x6f_u8, 0x2a_u8, 0x2_u8, 0x10_u8, 0x10_u8])
  struct ISnapinProperties
    lpVtbl : ISnapinPropertiesVTbl*
  end

  struct ISnapinPropertiesCallbackVTbl
    query_interface : Proc(ISnapinPropertiesCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISnapinPropertiesCallback*, UInt32)
    release : Proc(ISnapinPropertiesCallback*, UInt32)
    add_property_name : Proc(ISnapinPropertiesCallback*, LibC::LPWSTR, UInt32, HRESULT)
  end

  ISnapinPropertiesCallback_GUID = "a50fa2e5-7e61-45eb-a8d4-9a07b3e851a8"
  IID_ISnapinPropertiesCallback = LibC::GUID.new(0xa50fa2e5_u32, 0x7e61_u16, 0x45eb_u16, StaticArray[0xa8_u8, 0xd4_u8, 0x9a_u8, 0x7_u8, 0xb3_u8, 0xe8_u8, 0x51_u8, 0xa8_u8])
  struct ISnapinPropertiesCallback
    lpVtbl : ISnapinPropertiesCallbackVTbl*
  end

  struct IApplicationVTbl
    query_interface : Proc(IApplication*, Guid*, Void**, HRESULT)
    add_ref : Proc(IApplication*, UInt32)
    release : Proc(IApplication*, UInt32)
    get_type_info_count : Proc(IApplication*, UInt32*, HRESULT)
    get_type_info : Proc(IApplication*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IApplication*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IApplication*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    help : Proc(IApplication*, Void)
    quit : Proc(IApplication*, Void)
    get_document : Proc(IApplication*, Document*, HRESULT)
    load : Proc(IApplication*, UInt8*, HRESULT)
    get_frame : Proc(IApplication*, Frame*, HRESULT)
    get_visible : Proc(IApplication*, LibC::BOOL*, HRESULT)
    show : Proc(IApplication*, HRESULT)
    hide : Proc(IApplication*, HRESULT)
    get_user_control : Proc(IApplication*, LibC::BOOL*, HRESULT)
    put_user_control : Proc(IApplication*, LibC::BOOL, HRESULT)
    get_version_major : Proc(IApplication*, Int32*, HRESULT)
    get_version_minor : Proc(IApplication*, Int32*, HRESULT)
  end

  IApplication_GUID = "a3afb9cc-b653-4741-86ab-f0470ec1384c"
  IID_IApplication = LibC::GUID.new(0xa3afb9cc_u32, 0xb653_u16, 0x4741_u16, StaticArray[0x86_u8, 0xab_u8, 0xf0_u8, 0x47_u8, 0xe_u8, 0xc1_u8, 0x38_u8, 0x4c_u8])
  struct IApplication
    lpVtbl : IApplicationVTbl*
  end

  struct IAppEventsVTbl
    query_interface : Proc(IAppEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppEvents*, UInt32)
    release : Proc(IAppEvents*, UInt32)
    get_type_info_count : Proc(IAppEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IAppEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAppEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAppEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_quit : Proc(IAppEvents*, IApplication, HRESULT)
    on_document_open : Proc(IAppEvents*, Document, LibC::BOOL, HRESULT)
    on_document_close : Proc(IAppEvents*, Document, HRESULT)
    on_snap_in_added : Proc(IAppEvents*, Document, SnapIn, HRESULT)
    on_snap_in_removed : Proc(IAppEvents*, Document, SnapIn, HRESULT)
    on_new_view : Proc(IAppEvents*, View, HRESULT)
    on_view_close : Proc(IAppEvents*, View, HRESULT)
    on_view_change : Proc(IAppEvents*, View, Node, HRESULT)
    on_selection_change : Proc(IAppEvents*, View, Nodes, HRESULT)
    on_context_menu_executed : Proc(IAppEvents*, MenuItem, HRESULT)
    on_toolbar_button_clicked : Proc(IAppEvents*, HRESULT)
    on_list_updated : Proc(IAppEvents*, View, HRESULT)
  end

  IAppEvents_GUID = "de46cbdd-53f5-4635-af54-4fe71e923d3f"
  IID_IAppEvents = LibC::GUID.new(0xde46cbdd_u32, 0x53f5_u16, 0x4635_u16, StaticArray[0xaf_u8, 0x54_u8, 0x4f_u8, 0xe7_u8, 0x1e_u8, 0x92_u8, 0x3d_u8, 0x3f_u8])
  struct IAppEvents
    lpVtbl : IAppEventsVTbl*
  end

  struct AppEventsVTbl
    query_interface : Proc(AppEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(AppEvents*, UInt32)
    release : Proc(AppEvents*, UInt32)
    get_type_info_count : Proc(AppEvents*, UInt32*, HRESULT)
    get_type_info : Proc(AppEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(AppEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(AppEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  AppEvents_GUID = "fc7a4252-78ac-4532-8c5a-563cfe138863"
  IID_AppEvents = LibC::GUID.new(0xfc7a4252_u32, 0x78ac_u16, 0x4532_u16, StaticArray[0x8c_u8, 0x5a_u8, 0x56_u8, 0x3c_u8, 0xfe_u8, 0x13_u8, 0x88_u8, 0x63_u8])
  struct AppEvents
    lpVtbl : AppEventsVTbl*
  end

  struct IEventConnectorVTbl
    query_interface : Proc(IEventConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventConnector*, UInt32)
    release : Proc(IEventConnector*, UInt32)
    get_type_info_count : Proc(IEventConnector*, UInt32*, HRESULT)
    get_type_info : Proc(IEventConnector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventConnector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventConnector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    connect_to : Proc(IEventConnector*, IApplication, HRESULT)
    disconnect : Proc(IEventConnector*, HRESULT)
  end

  IEventConnector_GUID = "c0bccd30-de44-4528-8403-a05a6a1cc8ea"
  IID_IEventConnector = LibC::GUID.new(0xc0bccd30_u32, 0xde44_u16, 0x4528_u16, StaticArray[0x84_u8, 0x3_u8, 0xa0_u8, 0x5a_u8, 0x6a_u8, 0x1c_u8, 0xc8_u8, 0xea_u8])
  struct IEventConnector
    lpVtbl : IEventConnectorVTbl*
  end

  struct FrameVTbl
    query_interface : Proc(Frame*, Guid*, Void**, HRESULT)
    add_ref : Proc(Frame*, UInt32)
    release : Proc(Frame*, UInt32)
    get_type_info_count : Proc(Frame*, UInt32*, HRESULT)
    get_type_info : Proc(Frame*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Frame*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Frame*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    maximize : Proc(Frame*, HRESULT)
    minimize : Proc(Frame*, HRESULT)
    restore : Proc(Frame*, HRESULT)
    get_top : Proc(Frame*, Int32*, HRESULT)
    put_top : Proc(Frame*, Int32, HRESULT)
    get_bottom : Proc(Frame*, Int32*, HRESULT)
    put_bottom : Proc(Frame*, Int32, HRESULT)
    get_left : Proc(Frame*, Int32*, HRESULT)
    put_left : Proc(Frame*, Int32, HRESULT)
    get_right : Proc(Frame*, Int32*, HRESULT)
    put_right : Proc(Frame*, Int32, HRESULT)
  end

  Frame_GUID = "e5e2d970-5bb3-4306-8804-b0968a31c8e6"
  IID_Frame = LibC::GUID.new(0xe5e2d970_u32, 0x5bb3_u16, 0x4306_u16, StaticArray[0x88_u8, 0x4_u8, 0xb0_u8, 0x96_u8, 0x8a_u8, 0x31_u8, 0xc8_u8, 0xe6_u8])
  struct Frame
    lpVtbl : FrameVTbl*
  end

  struct NodeVTbl
    query_interface : Proc(Node*, Guid*, Void**, HRESULT)
    add_ref : Proc(Node*, UInt32)
    release : Proc(Node*, UInt32)
    get_type_info_count : Proc(Node*, UInt32*, HRESULT)
    get_type_info : Proc(Node*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Node*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Node*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(Node*, UInt16**, HRESULT)
    get_property : Proc(Node*, UInt8*, UInt16**, HRESULT)
    get_bookmark : Proc(Node*, UInt16**, HRESULT)
    is_scope_node : Proc(Node*, LibC::BOOL*, HRESULT)
    get_nodetype : Proc(Node*, UInt16**, HRESULT)
  end

  Node_GUID = "f81ed800-7839-4447-945d-8e15da59ca55"
  IID_Node = LibC::GUID.new(0xf81ed800_u32, 0x7839_u16, 0x4447_u16, StaticArray[0x94_u8, 0x5d_u8, 0x8e_u8, 0x15_u8, 0xda_u8, 0x59_u8, 0xca_u8, 0x55_u8])
  struct Node
    lpVtbl : NodeVTbl*
  end

  struct ScopeNamespaceVTbl
    query_interface : Proc(ScopeNamespace*, Guid*, Void**, HRESULT)
    add_ref : Proc(ScopeNamespace*, UInt32)
    release : Proc(ScopeNamespace*, UInt32)
    get_type_info_count : Proc(ScopeNamespace*, UInt32*, HRESULT)
    get_type_info : Proc(ScopeNamespace*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ScopeNamespace*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ScopeNamespace*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_parent : Proc(ScopeNamespace*, Node, Node*, HRESULT)
    get_child : Proc(ScopeNamespace*, Node, Node*, HRESULT)
    get_next : Proc(ScopeNamespace*, Node, Node*, HRESULT)
    get_root : Proc(ScopeNamespace*, Node*, HRESULT)
    expand : Proc(ScopeNamespace*, Node, HRESULT)
  end

  ScopeNamespace_GUID = "ebbb48dc-1a3b-4d86-b786-c21b28389012"
  IID_ScopeNamespace = LibC::GUID.new(0xebbb48dc_u32, 0x1a3b_u16, 0x4d86_u16, StaticArray[0xb7_u8, 0x86_u8, 0xc2_u8, 0x1b_u8, 0x28_u8, 0x38_u8, 0x90_u8, 0x12_u8])
  struct ScopeNamespace
    lpVtbl : ScopeNamespaceVTbl*
  end

  struct DocumentVTbl
    query_interface : Proc(Document*, Guid*, Void**, HRESULT)
    add_ref : Proc(Document*, UInt32)
    release : Proc(Document*, UInt32)
    get_type_info_count : Proc(Document*, UInt32*, HRESULT)
    get_type_info : Proc(Document*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Document*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Document*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    save : Proc(Document*, HRESULT)
    save_as : Proc(Document*, UInt8*, HRESULT)
    close : Proc(Document*, LibC::BOOL, HRESULT)
    get_views : Proc(Document*, Views*, HRESULT)
    get_snap_ins : Proc(Document*, SnapIns*, HRESULT)
    get_active_view : Proc(Document*, View*, HRESULT)
    get_name : Proc(Document*, UInt16**, HRESULT)
    put_name : Proc(Document*, UInt8*, HRESULT)
    get_location : Proc(Document*, UInt16**, HRESULT)
    get_is_saved : Proc(Document*, LibC::BOOL*, HRESULT)
    get_mode : Proc(Document*, DocumentMode*, HRESULT)
    put_mode : Proc(Document*, DocumentMode, HRESULT)
    get_root_node : Proc(Document*, Node*, HRESULT)
    get_scope_namespace : Proc(Document*, ScopeNamespace*, HRESULT)
    create_properties : Proc(Document*, Properties*, HRESULT)
    get_application : Proc(Document*, IApplication*, HRESULT)
  end

  Document_GUID = "225120d6-1e0f-40a3-93fe-1079e6a8017b"
  IID_Document = LibC::GUID.new(0x225120d6_u32, 0x1e0f_u16, 0x40a3_u16, StaticArray[0x93_u8, 0xfe_u8, 0x10_u8, 0x79_u8, 0xe6_u8, 0xa8_u8, 0x1_u8, 0x7b_u8])
  struct Document
    lpVtbl : DocumentVTbl*
  end

  struct SnapInVTbl
    query_interface : Proc(SnapIn*, Guid*, Void**, HRESULT)
    add_ref : Proc(SnapIn*, UInt32)
    release : Proc(SnapIn*, UInt32)
    get_type_info_count : Proc(SnapIn*, UInt32*, HRESULT)
    get_type_info : Proc(SnapIn*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(SnapIn*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(SnapIn*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(SnapIn*, UInt16**, HRESULT)
    get_vendor : Proc(SnapIn*, UInt16**, HRESULT)
    get_version : Proc(SnapIn*, UInt16**, HRESULT)
    get_extensions : Proc(SnapIn*, Extensions*, HRESULT)
    get_snapin_clsid : Proc(SnapIn*, UInt16**, HRESULT)
    get_properties : Proc(SnapIn*, Properties*, HRESULT)
    enable_all_extensions : Proc(SnapIn*, LibC::BOOL, HRESULT)
  end

  SnapIn_GUID = "3be910f6-3459-49c6-a1bb-41e6be9df3ea"
  IID_SnapIn = LibC::GUID.new(0x3be910f6_u32, 0x3459_u16, 0x49c6_u16, StaticArray[0xa1_u8, 0xbb_u8, 0x41_u8, 0xe6_u8, 0xbe_u8, 0x9d_u8, 0xf3_u8, 0xea_u8])
  struct SnapIn
    lpVtbl : SnapInVTbl*
  end

  struct SnapInsVTbl
    query_interface : Proc(SnapIns*, Guid*, Void**, HRESULT)
    add_ref : Proc(SnapIns*, UInt32)
    release : Proc(SnapIns*, UInt32)
    get_type_info_count : Proc(SnapIns*, UInt32*, HRESULT)
    get_type_info : Proc(SnapIns*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(SnapIns*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(SnapIns*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(SnapIns*, IUnknown*, HRESULT)
    item : Proc(SnapIns*, Int32, SnapIn*, HRESULT)
    get_count : Proc(SnapIns*, Int32*, HRESULT)
    add : Proc(SnapIns*, UInt8*, VARIANT, VARIANT, SnapIn*, HRESULT)
    remove : Proc(SnapIns*, SnapIn, HRESULT)
  end

  SnapIns_GUID = "2ef3de1d-b12a-49d1-92c5-0b00798768f1"
  IID_SnapIns = LibC::GUID.new(0x2ef3de1d_u32, 0xb12a_u16, 0x49d1_u16, StaticArray[0x92_u8, 0xc5_u8, 0xb_u8, 0x0_u8, 0x79_u8, 0x87_u8, 0x68_u8, 0xf1_u8])
  struct SnapIns
    lpVtbl : SnapInsVTbl*
  end

  struct ExtensionVTbl
    query_interface : Proc(Extension*, Guid*, Void**, HRESULT)
    add_ref : Proc(Extension*, UInt32)
    release : Proc(Extension*, UInt32)
    get_type_info_count : Proc(Extension*, UInt32*, HRESULT)
    get_type_info : Proc(Extension*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Extension*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Extension*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(Extension*, UInt16**, HRESULT)
    get_vendor : Proc(Extension*, UInt16**, HRESULT)
    get_version : Proc(Extension*, UInt16**, HRESULT)
    get_extensions : Proc(Extension*, Extensions*, HRESULT)
    get_snapin_clsid : Proc(Extension*, UInt16**, HRESULT)
    enable_all_extensions : Proc(Extension*, LibC::BOOL, HRESULT)
    enable : Proc(Extension*, LibC::BOOL, HRESULT)
  end

  Extension_GUID = "ad4d6ca6-912f-409b-a26e-7fd234aef542"
  IID_Extension = LibC::GUID.new(0xad4d6ca6_u32, 0x912f_u16, 0x409b_u16, StaticArray[0xa2_u8, 0x6e_u8, 0x7f_u8, 0xd2_u8, 0x34_u8, 0xae_u8, 0xf5_u8, 0x42_u8])
  struct Extension
    lpVtbl : ExtensionVTbl*
  end

  struct ExtensionsVTbl
    query_interface : Proc(Extensions*, Guid*, Void**, HRESULT)
    add_ref : Proc(Extensions*, UInt32)
    release : Proc(Extensions*, UInt32)
    get_type_info_count : Proc(Extensions*, UInt32*, HRESULT)
    get_type_info : Proc(Extensions*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Extensions*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Extensions*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(Extensions*, IUnknown*, HRESULT)
    item : Proc(Extensions*, Int32, Extension*, HRESULT)
    get_count : Proc(Extensions*, Int32*, HRESULT)
  end

  Extensions_GUID = "82dbea43-8ca4-44bc-a2ca-d18741059ec8"
  IID_Extensions = LibC::GUID.new(0x82dbea43_u32, 0x8ca4_u16, 0x44bc_u16, StaticArray[0xa2_u8, 0xca_u8, 0xd1_u8, 0x87_u8, 0x41_u8, 0x5_u8, 0x9e_u8, 0xc8_u8])
  struct Extensions
    lpVtbl : ExtensionsVTbl*
  end

  struct ColumnsVTbl
    query_interface : Proc(Columns*, Guid*, Void**, HRESULT)
    add_ref : Proc(Columns*, UInt32)
    release : Proc(Columns*, UInt32)
    get_type_info_count : Proc(Columns*, UInt32*, HRESULT)
    get_type_info : Proc(Columns*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Columns*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Columns*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    item : Proc(Columns*, Int32, Column*, HRESULT)
    get_count : Proc(Columns*, Int32*, HRESULT)
    get__new_enum : Proc(Columns*, IUnknown*, HRESULT)
  end

  Columns_GUID = "383d4d97-fc44-478b-b139-6323dc48611c"
  IID_Columns = LibC::GUID.new(0x383d4d97_u32, 0xfc44_u16, 0x478b_u16, StaticArray[0xb1_u8, 0x39_u8, 0x63_u8, 0x23_u8, 0xdc_u8, 0x48_u8, 0x61_u8, 0x1c_u8])
  struct Columns
    lpVtbl : ColumnsVTbl*
  end

  struct ColumnVTbl
    query_interface : Proc(Column*, Guid*, Void**, HRESULT)
    add_ref : Proc(Column*, UInt32)
    release : Proc(Column*, UInt32)
    get_type_info_count : Proc(Column*, UInt32*, HRESULT)
    get_type_info : Proc(Column*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Column*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Column*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    name : Proc(Column*, UInt8**, HRESULT)
    get_width : Proc(Column*, Int32*, HRESULT)
    put_width : Proc(Column*, Int32, HRESULT)
    get_display_position : Proc(Column*, Int32*, HRESULT)
    put_display_position : Proc(Column*, Int32, HRESULT)
    get_hidden : Proc(Column*, LibC::BOOL*, HRESULT)
    put_hidden : Proc(Column*, LibC::BOOL, HRESULT)
    set_as_sort_column : Proc(Column*, ColumnSortOrder, HRESULT)
    is_sort_column : Proc(Column*, LibC::BOOL*, HRESULT)
  end

  Column_GUID = "fd1c5f63-2b16-4d06-9ab3-f45350b940ab"
  IID_Column = LibC::GUID.new(0xfd1c5f63_u32, 0x2b16_u16, 0x4d06_u16, StaticArray[0x9a_u8, 0xb3_u8, 0xf4_u8, 0x53_u8, 0x50_u8, 0xb9_u8, 0x40_u8, 0xab_u8])
  struct Column
    lpVtbl : ColumnVTbl*
  end

  struct ViewsVTbl
    query_interface : Proc(Views*, Guid*, Void**, HRESULT)
    add_ref : Proc(Views*, UInt32)
    release : Proc(Views*, UInt32)
    get_type_info_count : Proc(Views*, UInt32*, HRESULT)
    get_type_info : Proc(Views*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Views*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Views*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    item : Proc(Views*, Int32, View*, HRESULT)
    get_count : Proc(Views*, Int32*, HRESULT)
    add : Proc(Views*, Node, ViewOptions, HRESULT)
    get__new_enum : Proc(Views*, IUnknown*, HRESULT)
  end

  Views_GUID = "d6b8c29d-a1ff-4d72-aab0-e381e9b9338d"
  IID_Views = LibC::GUID.new(0xd6b8c29d_u32, 0xa1ff_u16, 0x4d72_u16, StaticArray[0xaa_u8, 0xb0_u8, 0xe3_u8, 0x81_u8, 0xe9_u8, 0xb9_u8, 0x33_u8, 0x8d_u8])
  struct Views
    lpVtbl : ViewsVTbl*
  end

  struct ViewVTbl
    query_interface : Proc(View*, Guid*, Void**, HRESULT)
    add_ref : Proc(View*, UInt32)
    release : Proc(View*, UInt32)
    get_type_info_count : Proc(View*, UInt32*, HRESULT)
    get_type_info : Proc(View*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(View*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(View*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_active_scope_node : Proc(View*, Node*, HRESULT)
    put_active_scope_node : Proc(View*, Node, HRESULT)
    get_selection : Proc(View*, Nodes*, HRESULT)
    get_list_items : Proc(View*, Nodes*, HRESULT)
    snapin_scope_object : Proc(View*, VARIANT, IDispatch*, HRESULT)
    snapin_selection_object : Proc(View*, IDispatch*, HRESULT)
    is : Proc(View*, View, Int16*, HRESULT)
    get_document : Proc(View*, Document*, HRESULT)
    select_all : Proc(View*, HRESULT)
    select : Proc(View*, Node, HRESULT)
    deselect : Proc(View*, Node, HRESULT)
    is_selected : Proc(View*, Node, LibC::BOOL*, HRESULT)
    display_scope_node_property_sheet : Proc(View*, VARIANT, HRESULT)
    display_selection_property_sheet : Proc(View*, HRESULT)
    copy_scope_node : Proc(View*, VARIANT, HRESULT)
    copy_selection : Proc(View*, HRESULT)
    delete_scope_node : Proc(View*, VARIANT, HRESULT)
    delete_selection : Proc(View*, HRESULT)
    rename_scope_node : Proc(View*, UInt8*, VARIANT, HRESULT)
    rename_selected_item : Proc(View*, UInt8*, HRESULT)
    get_scope_node_context_menu : Proc(View*, VARIANT, ContextMenu*, HRESULT)
    get_selection_context_menu : Proc(View*, ContextMenu*, HRESULT)
    refresh_scope_node : Proc(View*, VARIANT, HRESULT)
    refresh_selection : Proc(View*, HRESULT)
    execute_selection_menu_item : Proc(View*, UInt8*, HRESULT)
    execute_scope_node_menu_item : Proc(View*, UInt8*, VARIANT, HRESULT)
    execute_shell_command : Proc(View*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    get_frame : Proc(View*, Frame*, HRESULT)
    close : Proc(View*, HRESULT)
    get_scope_tree_visible : Proc(View*, LibC::BOOL*, HRESULT)
    put_scope_tree_visible : Proc(View*, LibC::BOOL, HRESULT)
    back : Proc(View*, HRESULT)
    forward : Proc(View*, HRESULT)
    put_status_bar_text : Proc(View*, UInt8*, HRESULT)
    get_memento : Proc(View*, UInt16**, HRESULT)
    view_memento : Proc(View*, UInt8*, HRESULT)
    get_columns : Proc(View*, Columns*, HRESULT)
    get_cell_contents : Proc(View*, Node, Int32, UInt16**, HRESULT)
    export_list : Proc(View*, UInt8*, ExportListOptions, HRESULT)
    get_list_view_mode : Proc(View*, ListViewMode*, HRESULT)
    put_list_view_mode : Proc(View*, ListViewMode, HRESULT)
    get_control_object : Proc(View*, IDispatch*, HRESULT)
  end

  View_GUID = "6efc2da2-b38c-457e-9abb-ed2d189b8c38"
  IID_View = LibC::GUID.new(0x6efc2da2_u32, 0xb38c_u16, 0x457e_u16, StaticArray[0x9a_u8, 0xbb_u8, 0xed_u8, 0x2d_u8, 0x18_u8, 0x9b_u8, 0x8c_u8, 0x38_u8])
  struct View
    lpVtbl : ViewVTbl*
  end

  struct NodesVTbl
    query_interface : Proc(Nodes*, Guid*, Void**, HRESULT)
    add_ref : Proc(Nodes*, UInt32)
    release : Proc(Nodes*, UInt32)
    get_type_info_count : Proc(Nodes*, UInt32*, HRESULT)
    get_type_info : Proc(Nodes*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Nodes*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Nodes*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(Nodes*, IUnknown*, HRESULT)
    item : Proc(Nodes*, Int32, Node*, HRESULT)
    get_count : Proc(Nodes*, Int32*, HRESULT)
  end

  Nodes_GUID = "313b01df-b22f-4d42-b1b8-483cdcf51d35"
  IID_Nodes = LibC::GUID.new(0x313b01df_u32, 0xb22f_u16, 0x4d42_u16, StaticArray[0xb1_u8, 0xb8_u8, 0x48_u8, 0x3c_u8, 0xdc_u8, 0xf5_u8, 0x1d_u8, 0x35_u8])
  struct Nodes
    lpVtbl : NodesVTbl*
  end

  struct ContextMenuVTbl
    query_interface : Proc(ContextMenu*, Guid*, Void**, HRESULT)
    add_ref : Proc(ContextMenu*, UInt32)
    release : Proc(ContextMenu*, UInt32)
    get_type_info_count : Proc(ContextMenu*, UInt32*, HRESULT)
    get_type_info : Proc(ContextMenu*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ContextMenu*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ContextMenu*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(ContextMenu*, IUnknown*, HRESULT)
    get_item : Proc(ContextMenu*, VARIANT, MenuItem*, HRESULT)
    get_count : Proc(ContextMenu*, Int32*, HRESULT)
  end

  ContextMenu_GUID = "dab39ce0-25e6-4e07-8362-ba9c95706545"
  IID_ContextMenu = LibC::GUID.new(0xdab39ce0_u32, 0x25e6_u16, 0x4e07_u16, StaticArray[0x83_u8, 0x62_u8, 0xba_u8, 0x9c_u8, 0x95_u8, 0x70_u8, 0x65_u8, 0x45_u8])
  struct ContextMenu
    lpVtbl : ContextMenuVTbl*
  end

  struct MenuItemVTbl
    query_interface : Proc(MenuItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(MenuItem*, UInt32)
    release : Proc(MenuItem*, UInt32)
    get_type_info_count : Proc(MenuItem*, UInt32*, HRESULT)
    get_type_info : Proc(MenuItem*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(MenuItem*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(MenuItem*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_display_name : Proc(MenuItem*, UInt16**, HRESULT)
    get_language_independent_name : Proc(MenuItem*, UInt16**, HRESULT)
    get_path : Proc(MenuItem*, UInt16**, HRESULT)
    get_language_independent_path : Proc(MenuItem*, UInt16**, HRESULT)
    execute : Proc(MenuItem*, HRESULT)
    get_enabled : Proc(MenuItem*, LibC::BOOL*, HRESULT)
  end

  MenuItem_GUID = "0178fad1-b361-4b27-96ad-67c57ebf2e1d"
  IID_MenuItem = LibC::GUID.new(0x178fad1_u32, 0xb361_u16, 0x4b27_u16, StaticArray[0x96_u8, 0xad_u8, 0x67_u8, 0xc5_u8, 0x7e_u8, 0xbf_u8, 0x2e_u8, 0x1d_u8])
  struct MenuItem
    lpVtbl : MenuItemVTbl*
  end

  struct PropertiesVTbl
    query_interface : Proc(Properties*, Guid*, Void**, HRESULT)
    add_ref : Proc(Properties*, UInt32)
    release : Proc(Properties*, UInt32)
    get_type_info_count : Proc(Properties*, UInt32*, HRESULT)
    get_type_info : Proc(Properties*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Properties*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Properties*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(Properties*, IUnknown*, HRESULT)
    item : Proc(Properties*, UInt8*, Property*, HRESULT)
    get_count : Proc(Properties*, Int32*, HRESULT)
    remove : Proc(Properties*, UInt8*, HRESULT)
  end

  Properties_GUID = "2886abc2-a425-42b2-91c6-e25c0e04581c"
  IID_Properties = LibC::GUID.new(0x2886abc2_u32, 0xa425_u16, 0x42b2_u16, StaticArray[0x91_u8, 0xc6_u8, 0xe2_u8, 0x5c_u8, 0xe_u8, 0x4_u8, 0x58_u8, 0x1c_u8])
  struct Properties
    lpVtbl : PropertiesVTbl*
  end

  struct PropertyVTbl
    query_interface : Proc(Property*, Guid*, Void**, HRESULT)
    add_ref : Proc(Property*, UInt32)
    release : Proc(Property*, UInt32)
    get_type_info_count : Proc(Property*, UInt32*, HRESULT)
    get_type_info : Proc(Property*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Property*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Property*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_value : Proc(Property*, VARIANT*, HRESULT)
    put_value : Proc(Property*, VARIANT, HRESULT)
    get_name : Proc(Property*, UInt16**, HRESULT)
  end

  Property_GUID = "4600c3a5-e301-41d8-b6d0-ef2e4212e0ca"
  IID_Property = LibC::GUID.new(0x4600c3a5_u32, 0xe301_u16, 0x41d8_u16, StaticArray[0xb6_u8, 0xd0_u8, 0xef_u8, 0x2e_u8, 0x42_u8, 0x12_u8, 0xe0_u8, 0xca_u8])
  struct Property
    lpVtbl : PropertyVTbl*
  end

  struct IComponentDataVTbl
    query_interface : Proc(IComponentData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComponentData*, UInt32)
    release : Proc(IComponentData*, UInt32)
    initialize : Proc(IComponentData*, IUnknown, HRESULT)
    create_component : Proc(IComponentData*, IComponent*, HRESULT)
    notify : Proc(IComponentData*, IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)
    destroy : Proc(IComponentData*, HRESULT)
    query_data_object : Proc(IComponentData*, LibC::IntPtrT, DATA_OBJECT_TYPES, IDataObject*, HRESULT)
    get_display_info : Proc(IComponentData*, SCOPEDATAITEM*, HRESULT)
    compare_objects : Proc(IComponentData*, IDataObject, IDataObject, HRESULT)
  end

  IComponentData_GUID = "955ab28a-5218-11d0-a985-00c04fd8d565"
  IID_IComponentData = LibC::GUID.new(0x955ab28a_u32, 0x5218_u16, 0x11d0_u16, StaticArray[0xa9_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IComponentData
    lpVtbl : IComponentDataVTbl*
  end

  struct IComponent1VTbl
    query_interface : Proc(IComponent1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComponent1*, UInt32)
    release : Proc(IComponent1*, UInt32)
    initialize : Proc(IComponent1*, IConsole, HRESULT)
    notify : Proc(IComponent1*, IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)
    destroy : Proc(IComponent1*, LibC::IntPtrT, HRESULT)
    query_data_object : Proc(IComponent1*, LibC::IntPtrT, DATA_OBJECT_TYPES, IDataObject*, HRESULT)
    get_result_view_type : Proc(IComponent1*, LibC::IntPtrT, LibC::LPWSTR*, Int32*, HRESULT)
    get_display_info : Proc(IComponent1*, RESULTDATAITEM*, HRESULT)
    compare_objects : Proc(IComponent1*, IDataObject, IDataObject, HRESULT)
  end

  IComponent1_GUID = "43136eb2-d36c-11cf-adbc-00aa00a80033"
  IID_IComponent1 = LibC::GUID.new(0x43136eb2_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IComponent1
    lpVtbl : IComponent1VTbl*
  end

  struct IResultDataCompareVTbl
    query_interface : Proc(IResultDataCompare*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResultDataCompare*, UInt32)
    release : Proc(IResultDataCompare*, UInt32)
    compare : Proc(IResultDataCompare*, LPARAM, LibC::IntPtrT, LibC::IntPtrT, Int32*, HRESULT)
  end

  IResultDataCompare_GUID = "e8315a52-7a1a-11d0-a2d2-00c04fd909dd"
  IID_IResultDataCompare = LibC::GUID.new(0xe8315a52_u32, 0x7a1a_u16, 0x11d0_u16, StaticArray[0xa2_u8, 0xd2_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct IResultDataCompare
    lpVtbl : IResultDataCompareVTbl*
  end

  struct IResultOwnerDataVTbl
    query_interface : Proc(IResultOwnerData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResultOwnerData*, UInt32)
    release : Proc(IResultOwnerData*, UInt32)
    find_item : Proc(IResultOwnerData*, RESULTFINDINFO*, Int32*, HRESULT)
    cache_hint : Proc(IResultOwnerData*, Int32, Int32, HRESULT)
    sort_items : Proc(IResultOwnerData*, Int32, UInt32, LPARAM, HRESULT)
  end

  IResultOwnerData_GUID = "9cb396d8-ea83-11d0-aef1-00c04fb6dd2c"
  IID_IResultOwnerData = LibC::GUID.new(0x9cb396d8_u32, 0xea83_u16, 0x11d0_u16, StaticArray[0xae_u8, 0xf1_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xdd_u8, 0x2c_u8])
  struct IResultOwnerData
    lpVtbl : IResultOwnerDataVTbl*
  end

  struct IConsoleVTbl
    query_interface : Proc(IConsole*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConsole*, UInt32)
    release : Proc(IConsole*, UInt32)
    set_header : Proc(IConsole*, IHeaderCtrl, HRESULT)
    set_toolbar : Proc(IConsole*, IToolbar, HRESULT)
    query_result_view : Proc(IConsole*, IUnknown*, HRESULT)
    query_scope_image_list : Proc(IConsole*, IImageList*, HRESULT)
    query_result_image_list : Proc(IConsole*, IImageList*, HRESULT)
    update_all_views : Proc(IConsole*, IDataObject, LPARAM, LibC::IntPtrT, HRESULT)
    message_box : Proc(IConsole*, LibC::LPWSTR, LibC::LPWSTR, UInt32, Int32*, HRESULT)
    query_console_verb : Proc(IConsole*, IConsoleVerb*, HRESULT)
    select_scope_item : Proc(IConsole*, LibC::IntPtrT, HRESULT)
    get_main_window : Proc(IConsole*, HANDLE*, HRESULT)
    new_window : Proc(IConsole*, LibC::IntPtrT, UInt32, HRESULT)
  end

  IConsole_GUID = "43136eb1-d36c-11cf-adbc-00aa00a80033"
  IID_IConsole = LibC::GUID.new(0x43136eb1_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IConsole
    lpVtbl : IConsoleVTbl*
  end

  struct IHeaderCtrlVTbl
    query_interface : Proc(IHeaderCtrl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHeaderCtrl*, UInt32)
    release : Proc(IHeaderCtrl*, UInt32)
    insert_column : Proc(IHeaderCtrl*, Int32, LibC::LPWSTR, Int32, Int32, HRESULT)
    delete_column : Proc(IHeaderCtrl*, Int32, HRESULT)
    set_column_text : Proc(IHeaderCtrl*, Int32, LibC::LPWSTR, HRESULT)
    get_column_text : Proc(IHeaderCtrl*, Int32, LibC::LPWSTR*, HRESULT)
    set_column_width : Proc(IHeaderCtrl*, Int32, Int32, HRESULT)
    get_column_width : Proc(IHeaderCtrl*, Int32, Int32*, HRESULT)
  end

  IHeaderCtrl_GUID = "43136eb3-d36c-11cf-adbc-00aa00a80033"
  IID_IHeaderCtrl = LibC::GUID.new(0x43136eb3_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IHeaderCtrl
    lpVtbl : IHeaderCtrlVTbl*
  end

  struct IContextMenuCallbackVTbl
    query_interface : Proc(IContextMenuCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContextMenuCallback*, UInt32)
    release : Proc(IContextMenuCallback*, UInt32)
    add_item : Proc(IContextMenuCallback*, CONTEXTMENUITEM*, HRESULT)
  end

  IContextMenuCallback_GUID = "43136eb7-d36c-11cf-adbc-00aa00a80033"
  IID_IContextMenuCallback = LibC::GUID.new(0x43136eb7_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IContextMenuCallback
    lpVtbl : IContextMenuCallbackVTbl*
  end

  struct IContextMenuProviderVTbl
    query_interface : Proc(IContextMenuProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContextMenuProvider*, UInt32)
    release : Proc(IContextMenuProvider*, UInt32)
    add_item : Proc(IContextMenuProvider*, CONTEXTMENUITEM*, HRESULT)
    empty_menu_list : Proc(IContextMenuProvider*, HRESULT)
    add_primary_extension_items : Proc(IContextMenuProvider*, IUnknown, IDataObject, HRESULT)
    add_third_party_extension_items : Proc(IContextMenuProvider*, IDataObject, HRESULT)
    show_context_menu : Proc(IContextMenuProvider*, LibC::HANDLE, Int32, Int32, Int32*, HRESULT)
  end

  IContextMenuProvider_GUID = "43136eb6-d36c-11cf-adbc-00aa00a80033"
  IID_IContextMenuProvider = LibC::GUID.new(0x43136eb6_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IContextMenuProvider
    lpVtbl : IContextMenuProviderVTbl*
  end

  struct IExtendContextMenuVTbl
    query_interface : Proc(IExtendContextMenu*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExtendContextMenu*, UInt32)
    release : Proc(IExtendContextMenu*, UInt32)
    add_menu_items : Proc(IExtendContextMenu*, IDataObject, IContextMenuCallback, Int32*, HRESULT)
    command : Proc(IExtendContextMenu*, Int32, IDataObject, HRESULT)
  end

  IExtendContextMenu_GUID = "4f3b7a4f-cfac-11cf-b8e3-00c04fd8d5b0"
  IID_IExtendContextMenu = LibC::GUID.new(0x4f3b7a4f_u32, 0xcfac_u16, 0x11cf_u16, StaticArray[0xb8_u8, 0xe3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0xb0_u8])
  struct IExtendContextMenu
    lpVtbl : IExtendContextMenuVTbl*
  end

  struct IImageList1VTbl
    query_interface : Proc(IImageList1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IImageList1*, UInt32)
    release : Proc(IImageList1*, UInt32)
    image_list_set_icon : Proc(IImageList1*, LibC::IntPtrT*, Int32, HRESULT)
    image_list_set_strip : Proc(IImageList1*, LibC::IntPtrT*, LibC::IntPtrT*, Int32, UInt32, HRESULT)
  end

  IImageList1_GUID = "43136eb8-d36c-11cf-adbc-00aa00a80033"
  IID_IImageList1 = LibC::GUID.new(0x43136eb8_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IImageList1
    lpVtbl : IImageList1VTbl*
  end

  struct IResultDataVTbl
    query_interface : Proc(IResultData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResultData*, UInt32)
    release : Proc(IResultData*, UInt32)
    insert_item : Proc(IResultData*, RESULTDATAITEM*, HRESULT)
    delete_item : Proc(IResultData*, LibC::IntPtrT, Int32, HRESULT)
    find_item_by_l_param : Proc(IResultData*, LPARAM, LibC::IntPtrT*, HRESULT)
    delete_all_rslt_items : Proc(IResultData*, HRESULT)
    set_item : Proc(IResultData*, RESULTDATAITEM*, HRESULT)
    get_item : Proc(IResultData*, RESULTDATAITEM*, HRESULT)
    get_next_item : Proc(IResultData*, RESULTDATAITEM*, HRESULT)
    modify_item_state : Proc(IResultData*, Int32, LibC::IntPtrT, UInt32, UInt32, HRESULT)
    modify_view_style : Proc(IResultData*, MMC_RESULT_VIEW_STYLE, MMC_RESULT_VIEW_STYLE, HRESULT)
    set_view_mode : Proc(IResultData*, Int32, HRESULT)
    get_view_mode : Proc(IResultData*, Int32*, HRESULT)
    update_item : Proc(IResultData*, LibC::IntPtrT, HRESULT)
    sort : Proc(IResultData*, Int32, UInt32, LPARAM, HRESULT)
    set_desc_bar_text : Proc(IResultData*, LibC::LPWSTR, HRESULT)
    set_item_count : Proc(IResultData*, Int32, UInt32, HRESULT)
  end

  IResultData_GUID = "31da5fa0-e0eb-11cf-9f21-00aa003ca9f6"
  IID_IResultData = LibC::GUID.new(0x31da5fa0_u32, 0xe0eb_u16, 0x11cf_u16, StaticArray[0x9f_u8, 0x21_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x3c_u8, 0xa9_u8, 0xf6_u8])
  struct IResultData
    lpVtbl : IResultDataVTbl*
  end

  struct IConsoleNameSpaceVTbl
    query_interface : Proc(IConsoleNameSpace*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConsoleNameSpace*, UInt32)
    release : Proc(IConsoleNameSpace*, UInt32)
    insert_item : Proc(IConsoleNameSpace*, SCOPEDATAITEM*, HRESULT)
    delete_item : Proc(IConsoleNameSpace*, LibC::IntPtrT, Int32, HRESULT)
    set_item : Proc(IConsoleNameSpace*, SCOPEDATAITEM*, HRESULT)
    get_item : Proc(IConsoleNameSpace*, SCOPEDATAITEM*, HRESULT)
    get_child_item : Proc(IConsoleNameSpace*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)
    get_next_item : Proc(IConsoleNameSpace*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)
    get_parent_item : Proc(IConsoleNameSpace*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)
  end

  IConsoleNameSpace_GUID = "bedeb620-f24d-11cf-8afc-00aa003ca9f6"
  IID_IConsoleNameSpace = LibC::GUID.new(0xbedeb620_u32, 0xf24d_u16, 0x11cf_u16, StaticArray[0x8a_u8, 0xfc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x3c_u8, 0xa9_u8, 0xf6_u8])
  struct IConsoleNameSpace
    lpVtbl : IConsoleNameSpaceVTbl*
  end

  struct IConsoleNameSpace2VTbl
    query_interface : Proc(IConsoleNameSpace2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConsoleNameSpace2*, UInt32)
    release : Proc(IConsoleNameSpace2*, UInt32)
    insert_item : Proc(IConsoleNameSpace2*, SCOPEDATAITEM*, HRESULT)
    delete_item : Proc(IConsoleNameSpace2*, LibC::IntPtrT, Int32, HRESULT)
    set_item : Proc(IConsoleNameSpace2*, SCOPEDATAITEM*, HRESULT)
    get_item : Proc(IConsoleNameSpace2*, SCOPEDATAITEM*, HRESULT)
    get_child_item : Proc(IConsoleNameSpace2*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)
    get_next_item : Proc(IConsoleNameSpace2*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)
    get_parent_item : Proc(IConsoleNameSpace2*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)
    expand : Proc(IConsoleNameSpace2*, LibC::IntPtrT, HRESULT)
    add_extension : Proc(IConsoleNameSpace2*, LibC::IntPtrT, Guid*, HRESULT)
  end

  IConsoleNameSpace2_GUID = "255f18cc-65db-11d1-a7dc-00c04fd8d565"
  IID_IConsoleNameSpace2 = LibC::GUID.new(0x255f18cc_u32, 0x65db_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xdc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IConsoleNameSpace2
    lpVtbl : IConsoleNameSpace2VTbl*
  end

  struct IPropertySheetCallbackVTbl
    query_interface : Proc(IPropertySheetCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertySheetCallback*, UInt32)
    release : Proc(IPropertySheetCallback*, UInt32)
    add_page : Proc(IPropertySheetCallback*, HPROPSHEETPAGE, HRESULT)
    remove_page : Proc(IPropertySheetCallback*, HPROPSHEETPAGE, HRESULT)
  end

  IPropertySheetCallback_GUID = "85de64dd-ef21-11cf-a285-00c04fd8dbe6"
  IID_IPropertySheetCallback = LibC::GUID.new(0x85de64dd_u32, 0xef21_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xdb_u8, 0xe6_u8])
  struct IPropertySheetCallback
    lpVtbl : IPropertySheetCallbackVTbl*
  end

  struct IPropertySheetProviderVTbl
    query_interface : Proc(IPropertySheetProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertySheetProvider*, UInt32)
    release : Proc(IPropertySheetProvider*, UInt32)
    create_property_sheet : Proc(IPropertySheetProvider*, LibC::LPWSTR, UInt8, LibC::IntPtrT, IDataObject, UInt32, HRESULT)
    find_property_sheet : Proc(IPropertySheetProvider*, LibC::IntPtrT, IComponent, IDataObject, HRESULT)
    add_primary_pages : Proc(IPropertySheetProvider*, IUnknown, LibC::BOOL, LibC::HANDLE, LibC::BOOL, HRESULT)
    add_extension_pages : Proc(IPropertySheetProvider*, HRESULT)
    show : Proc(IPropertySheetProvider*, LibC::IntPtrT, Int32, HRESULT)
  end

  IPropertySheetProvider_GUID = "85de64de-ef21-11cf-a285-00c04fd8dbe6"
  IID_IPropertySheetProvider = LibC::GUID.new(0x85de64de_u32, 0xef21_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xdb_u8, 0xe6_u8])
  struct IPropertySheetProvider
    lpVtbl : IPropertySheetProviderVTbl*
  end

  struct IExtendPropertySheetVTbl
    query_interface : Proc(IExtendPropertySheet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExtendPropertySheet*, UInt32)
    release : Proc(IExtendPropertySheet*, UInt32)
    create_property_pages : Proc(IExtendPropertySheet*, IPropertySheetCallback, LibC::IntPtrT, IDataObject, HRESULT)
    query_pages_for : Proc(IExtendPropertySheet*, IDataObject, HRESULT)
  end

  IExtendPropertySheet_GUID = "85de64dc-ef21-11cf-a285-00c04fd8dbe6"
  IID_IExtendPropertySheet = LibC::GUID.new(0x85de64dc_u32, 0xef21_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xdb_u8, 0xe6_u8])
  struct IExtendPropertySheet
    lpVtbl : IExtendPropertySheetVTbl*
  end

  struct IControlbarVTbl
    query_interface : Proc(IControlbar*, Guid*, Void**, HRESULT)
    add_ref : Proc(IControlbar*, UInt32)
    release : Proc(IControlbar*, UInt32)
    create : Proc(IControlbar*, MMC_CONTROL_TYPE, IExtendControlbar, IUnknown*, HRESULT)
    attach : Proc(IControlbar*, MMC_CONTROL_TYPE, IUnknown, HRESULT)
    detach : Proc(IControlbar*, IUnknown, HRESULT)
  end

  IControlbar_GUID = "69fb811e-6c1c-11d0-a2cb-00c04fd909dd"
  IID_IControlbar = LibC::GUID.new(0x69fb811e_u32, 0x6c1c_u16, 0x11d0_u16, StaticArray[0xa2_u8, 0xcb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct IControlbar
    lpVtbl : IControlbarVTbl*
  end

  struct IExtendControlbarVTbl
    query_interface : Proc(IExtendControlbar*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExtendControlbar*, UInt32)
    release : Proc(IExtendControlbar*, UInt32)
    set_controlbar : Proc(IExtendControlbar*, IControlbar, HRESULT)
    controlbar_notify : Proc(IExtendControlbar*, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)
  end

  IExtendControlbar_GUID = "49506520-6f40-11d0-a98b-00c04fd8d565"
  IID_IExtendControlbar = LibC::GUID.new(0x49506520_u32, 0x6f40_u16, 0x11d0_u16, StaticArray[0xa9_u8, 0x8b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IExtendControlbar
    lpVtbl : IExtendControlbarVTbl*
  end

  struct IToolbarVTbl
    query_interface : Proc(IToolbar*, Guid*, Void**, HRESULT)
    add_ref : Proc(IToolbar*, UInt32)
    release : Proc(IToolbar*, UInt32)
    add_bitmap : Proc(IToolbar*, Int32, HBITMAP, Int32, Int32, UInt32, HRESULT)
    add_buttons : Proc(IToolbar*, Int32, MMCBUTTON*, HRESULT)
    insert_button : Proc(IToolbar*, Int32, MMCBUTTON*, HRESULT)
    delete_button : Proc(IToolbar*, Int32, HRESULT)
    get_button_state : Proc(IToolbar*, Int32, MMC_BUTTON_STATE, LibC::BOOL*, HRESULT)
    set_button_state : Proc(IToolbar*, Int32, MMC_BUTTON_STATE, LibC::BOOL, HRESULT)
  end

  IToolbar_GUID = "43136eb9-d36c-11cf-adbc-00aa00a80033"
  IID_IToolbar = LibC::GUID.new(0x43136eb9_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IToolbar
    lpVtbl : IToolbarVTbl*
  end

  struct IConsoleVerbVTbl
    query_interface : Proc(IConsoleVerb*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConsoleVerb*, UInt32)
    release : Proc(IConsoleVerb*, UInt32)
    get_verb_state : Proc(IConsoleVerb*, MMC_CONSOLE_VERB, MMC_BUTTON_STATE, LibC::BOOL*, HRESULT)
    set_verb_state : Proc(IConsoleVerb*, MMC_CONSOLE_VERB, MMC_BUTTON_STATE, LibC::BOOL, HRESULT)
    set_default_verb : Proc(IConsoleVerb*, MMC_CONSOLE_VERB, HRESULT)
    get_default_verb : Proc(IConsoleVerb*, MMC_CONSOLE_VERB*, HRESULT)
  end

  IConsoleVerb_GUID = "e49f7a60-74af-11d0-a286-00c04fd8fe93"
  IID_IConsoleVerb = LibC::GUID.new(0xe49f7a60_u32, 0x74af_u16, 0x11d0_u16, StaticArray[0xa2_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xfe_u8, 0x93_u8])
  struct IConsoleVerb
    lpVtbl : IConsoleVerbVTbl*
  end

  struct ISnapinAboutVTbl
    query_interface : Proc(ISnapinAbout*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISnapinAbout*, UInt32)
    release : Proc(ISnapinAbout*, UInt32)
    get_snapin_description : Proc(ISnapinAbout*, LibC::LPWSTR*, HRESULT)
    get_provider : Proc(ISnapinAbout*, LibC::LPWSTR*, HRESULT)
    get_snapin_version : Proc(ISnapinAbout*, LibC::LPWSTR*, HRESULT)
    get_snapin_image : Proc(ISnapinAbout*, HANDLE*, HRESULT)
    get_static_folder_image : Proc(ISnapinAbout*, HBITMAP*, HBITMAP*, HBITMAP*, UInt32*, HRESULT)
  end

  ISnapinAbout_GUID = "1245208c-a151-11d0-a7d7-00c04fd909dd"
  IID_ISnapinAbout = LibC::GUID.new(0x1245208c_u32, 0xa151_u16, 0x11d0_u16, StaticArray[0xa7_u8, 0xd7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct ISnapinAbout
    lpVtbl : ISnapinAboutVTbl*
  end

  struct IMenuButtonVTbl
    query_interface : Proc(IMenuButton*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMenuButton*, UInt32)
    release : Proc(IMenuButton*, UInt32)
    add_button : Proc(IMenuButton*, Int32, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    set_button : Proc(IMenuButton*, Int32, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    set_button_state : Proc(IMenuButton*, Int32, MMC_BUTTON_STATE, LibC::BOOL, HRESULT)
  end

  IMenuButton_GUID = "951ed750-d080-11d0-b197-000000000000"
  IID_IMenuButton = LibC::GUID.new(0x951ed750_u32, 0xd080_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x97_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
  struct IMenuButton
    lpVtbl : IMenuButtonVTbl*
  end

  struct ISnapinHelpVTbl
    query_interface : Proc(ISnapinHelp*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISnapinHelp*, UInt32)
    release : Proc(ISnapinHelp*, UInt32)
    get_help_topic : Proc(ISnapinHelp*, LibC::LPWSTR*, HRESULT)
  end

  ISnapinHelp_GUID = "a6b15ace-df59-11d0-a7dd-00c04fd909dd"
  IID_ISnapinHelp = LibC::GUID.new(0xa6b15ace_u32, 0xdf59_u16, 0x11d0_u16, StaticArray[0xa7_u8, 0xdd_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct ISnapinHelp
    lpVtbl : ISnapinHelpVTbl*
  end

  struct IExtendPropertySheet2VTbl
    query_interface : Proc(IExtendPropertySheet2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExtendPropertySheet2*, UInt32)
    release : Proc(IExtendPropertySheet2*, UInt32)
    create_property_pages : Proc(IExtendPropertySheet2*, IPropertySheetCallback, LibC::IntPtrT, IDataObject, HRESULT)
    query_pages_for : Proc(IExtendPropertySheet2*, IDataObject, HRESULT)
    get_watermarks : Proc(IExtendPropertySheet2*, IDataObject, HBITMAP*, HBITMAP*, HPALETTE*, LibC::BOOL*, HRESULT)
  end

  IExtendPropertySheet2_GUID = "b7a87232-4a51-11d1-a7ea-00c04fd909dd"
  IID_IExtendPropertySheet2 = LibC::GUID.new(0xb7a87232_u32, 0x4a51_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xea_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct IExtendPropertySheet2
    lpVtbl : IExtendPropertySheet2VTbl*
  end

  struct IHeaderCtrl2VTbl
    query_interface : Proc(IHeaderCtrl2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHeaderCtrl2*, UInt32)
    release : Proc(IHeaderCtrl2*, UInt32)
    insert_column : Proc(IHeaderCtrl2*, Int32, LibC::LPWSTR, Int32, Int32, HRESULT)
    delete_column : Proc(IHeaderCtrl2*, Int32, HRESULT)
    set_column_text : Proc(IHeaderCtrl2*, Int32, LibC::LPWSTR, HRESULT)
    get_column_text : Proc(IHeaderCtrl2*, Int32, LibC::LPWSTR*, HRESULT)
    set_column_width : Proc(IHeaderCtrl2*, Int32, Int32, HRESULT)
    get_column_width : Proc(IHeaderCtrl2*, Int32, Int32*, HRESULT)
    set_change_time_out : Proc(IHeaderCtrl2*, UInt32, HRESULT)
    set_column_filter : Proc(IHeaderCtrl2*, UInt32, UInt32, MMC_FILTERDATA*, HRESULT)
    get_column_filter : Proc(IHeaderCtrl2*, UInt32, UInt32*, MMC_FILTERDATA*, HRESULT)
  end

  IHeaderCtrl2_GUID = "9757abb8-1b32-11d1-a7ce-00c04fd8d565"
  IID_IHeaderCtrl2 = LibC::GUID.new(0x9757abb8_u32, 0x1b32_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xce_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IHeaderCtrl2
    lpVtbl : IHeaderCtrl2VTbl*
  end

  struct ISnapinHelp2VTbl
    query_interface : Proc(ISnapinHelp2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISnapinHelp2*, UInt32)
    release : Proc(ISnapinHelp2*, UInt32)
    get_help_topic : Proc(ISnapinHelp2*, LibC::LPWSTR*, HRESULT)
    get_linked_topics : Proc(ISnapinHelp2*, LibC::LPWSTR*, HRESULT)
  end

  ISnapinHelp2_GUID = "4861a010-20f9-11d2-a510-00c04fb6dd2c"
  IID_ISnapinHelp2 = LibC::GUID.new(0x4861a010_u32, 0x20f9_u16, 0x11d2_u16, StaticArray[0xa5_u8, 0x10_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xdd_u8, 0x2c_u8])
  struct ISnapinHelp2
    lpVtbl : ISnapinHelp2VTbl*
  end

  struct IEnumTASKVTbl
    query_interface : Proc(IEnumTASK*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTASK*, UInt32)
    release : Proc(IEnumTASK*, UInt32)
    next_ : Proc(IEnumTASK*, UInt32, MMC_TASK*, UInt32*, HRESULT)
    skip : Proc(IEnumTASK*, UInt32, HRESULT)
    reset : Proc(IEnumTASK*, HRESULT)
    clone : Proc(IEnumTASK*, IEnumTASK*, HRESULT)
  end

  IEnumTASK_GUID = "338698b1-5a02-11d1-9fec-00600832db4a"
  IID_IEnumTASK = LibC::GUID.new(0x338698b1_u32, 0x5a02_u16, 0x11d1_u16, StaticArray[0x9f_u8, 0xec_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x32_u8, 0xdb_u8, 0x4a_u8])
  struct IEnumTASK
    lpVtbl : IEnumTASKVTbl*
  end

  struct IExtendTaskPadVTbl
    query_interface : Proc(IExtendTaskPad*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExtendTaskPad*, UInt32)
    release : Proc(IExtendTaskPad*, UInt32)
    task_notify : Proc(IExtendTaskPad*, IDataObject, VARIANT*, VARIANT*, HRESULT)
    enum_tasks : Proc(IExtendTaskPad*, IDataObject, LibC::LPWSTR, IEnumTASK*, HRESULT)
    get_title : Proc(IExtendTaskPad*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    get_descriptive_text : Proc(IExtendTaskPad*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    get_background : Proc(IExtendTaskPad*, LibC::LPWSTR, MMC_TASK_DISPLAY_OBJECT*, HRESULT)
    get_list_pad_info : Proc(IExtendTaskPad*, LibC::LPWSTR, MMC_LISTPAD_INFO*, HRESULT)
  end

  IExtendTaskPad_GUID = "8dee6511-554d-11d1-9fea-00600832db4a"
  IID_IExtendTaskPad = LibC::GUID.new(0x8dee6511_u32, 0x554d_u16, 0x11d1_u16, StaticArray[0x9f_u8, 0xea_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x32_u8, 0xdb_u8, 0x4a_u8])
  struct IExtendTaskPad
    lpVtbl : IExtendTaskPadVTbl*
  end

  struct IConsole2VTbl
    query_interface : Proc(IConsole2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConsole2*, UInt32)
    release : Proc(IConsole2*, UInt32)
    set_header : Proc(IConsole2*, IHeaderCtrl, HRESULT)
    set_toolbar : Proc(IConsole2*, IToolbar, HRESULT)
    query_result_view : Proc(IConsole2*, IUnknown*, HRESULT)
    query_scope_image_list : Proc(IConsole2*, IImageList*, HRESULT)
    query_result_image_list : Proc(IConsole2*, IImageList*, HRESULT)
    update_all_views : Proc(IConsole2*, IDataObject, LPARAM, LibC::IntPtrT, HRESULT)
    message_box : Proc(IConsole2*, LibC::LPWSTR, LibC::LPWSTR, UInt32, Int32*, HRESULT)
    query_console_verb : Proc(IConsole2*, IConsoleVerb*, HRESULT)
    select_scope_item : Proc(IConsole2*, LibC::IntPtrT, HRESULT)
    get_main_window : Proc(IConsole2*, HANDLE*, HRESULT)
    new_window : Proc(IConsole2*, LibC::IntPtrT, UInt32, HRESULT)
    expand : Proc(IConsole2*, LibC::IntPtrT, LibC::BOOL, HRESULT)
    is_taskpad_view_preferred : Proc(IConsole2*, HRESULT)
    set_status_text : Proc(IConsole2*, LibC::LPWSTR, HRESULT)
  end

  IConsole2_GUID = "103d842a-aa63-11d1-a7e1-00c04fd8d565"
  IID_IConsole2 = LibC::GUID.new(0x103d842a_u32, 0xaa63_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xe1_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IConsole2
    lpVtbl : IConsole2VTbl*
  end

  struct IDisplayHelpVTbl
    query_interface : Proc(IDisplayHelp*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDisplayHelp*, UInt32)
    release : Proc(IDisplayHelp*, UInt32)
    show_topic : Proc(IDisplayHelp*, LibC::LPWSTR, HRESULT)
  end

  IDisplayHelp_GUID = "cc593830-b926-11d1-8063-0000f875a9ce"
  IID_IDisplayHelp = LibC::GUID.new(0xcc593830_u32, 0xb926_u16, 0x11d1_u16, StaticArray[0x80_u8, 0x63_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0xa9_u8, 0xce_u8])
  struct IDisplayHelp
    lpVtbl : IDisplayHelpVTbl*
  end

  struct IRequiredExtensionsVTbl
    query_interface : Proc(IRequiredExtensions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRequiredExtensions*, UInt32)
    release : Proc(IRequiredExtensions*, UInt32)
    enable_all_extensions : Proc(IRequiredExtensions*, HRESULT)
    get_first_extension : Proc(IRequiredExtensions*, Guid*, HRESULT)
    get_next_extension : Proc(IRequiredExtensions*, Guid*, HRESULT)
  end

  IRequiredExtensions_GUID = "72782d7a-a4a0-11d1-af0f-00c04fb6dd2c"
  IID_IRequiredExtensions = LibC::GUID.new(0x72782d7a_u32, 0xa4a0_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xdd_u8, 0x2c_u8])
  struct IRequiredExtensions
    lpVtbl : IRequiredExtensionsVTbl*
  end

  struct IStringTableVTbl
    query_interface : Proc(IStringTable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStringTable*, UInt32)
    release : Proc(IStringTable*, UInt32)
    add_string : Proc(IStringTable*, LibC::LPWSTR, UInt32*, HRESULT)
    get_string : Proc(IStringTable*, UInt32, UInt32, Char*, UInt32*, HRESULT)
    get_string_length : Proc(IStringTable*, UInt32, UInt32*, HRESULT)
    delete_string : Proc(IStringTable*, UInt32, HRESULT)
    delete_all_strings : Proc(IStringTable*, HRESULT)
    find_string : Proc(IStringTable*, LibC::LPWSTR, UInt32*, HRESULT)
    enumerate : Proc(IStringTable*, IEnumString*, HRESULT)
  end

  IStringTable_GUID = "de40b7a4-0f65-11d2-8e25-00c04f8ecd78"
  IID_IStringTable = LibC::GUID.new(0xde40b7a4_u32, 0xf65_u16, 0x11d2_u16, StaticArray[0x8e_u8, 0x25_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])
  struct IStringTable
    lpVtbl : IStringTableVTbl*
  end

  struct IColumnDataVTbl
    query_interface : Proc(IColumnData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IColumnData*, UInt32)
    release : Proc(IColumnData*, UInt32)
    set_column_config_data : Proc(IColumnData*, SColumnSetID*, MMC_COLUMN_SET_DATA*, HRESULT)
    get_column_config_data : Proc(IColumnData*, SColumnSetID*, MMC_COLUMN_SET_DATA**, HRESULT)
    set_column_sort_data : Proc(IColumnData*, SColumnSetID*, MMC_SORT_SET_DATA*, HRESULT)
    get_column_sort_data : Proc(IColumnData*, SColumnSetID*, MMC_SORT_SET_DATA**, HRESULT)
  end

  IColumnData_GUID = "547c1354-024d-11d3-a707-00c04f8ef4cb"
  IID_IColumnData = LibC::GUID.new(0x547c1354_u32, 0x24d_u16, 0x11d3_u16, StaticArray[0xa7_u8, 0x7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf4_u8, 0xcb_u8])
  struct IColumnData
    lpVtbl : IColumnDataVTbl*
  end

  struct IMessageViewVTbl
    query_interface : Proc(IMessageView*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMessageView*, UInt32)
    release : Proc(IMessageView*, UInt32)
    set_title_text : Proc(IMessageView*, LibC::LPWSTR, HRESULT)
    set_body_text : Proc(IMessageView*, LibC::LPWSTR, HRESULT)
    set_icon : Proc(IMessageView*, IconIdentifier, HRESULT)
    clear : Proc(IMessageView*, HRESULT)
  end

  IMessageView_GUID = "80f94174-fccc-11d2-b991-00c04f8ecd78"
  IID_IMessageView = LibC::GUID.new(0x80f94174_u32, 0xfccc_u16, 0x11d2_u16, StaticArray[0xb9_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])
  struct IMessageView
    lpVtbl : IMessageViewVTbl*
  end

  struct IResultDataCompareExVTbl
    query_interface : Proc(IResultDataCompareEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResultDataCompareEx*, UInt32)
    release : Proc(IResultDataCompareEx*, UInt32)
    compare : Proc(IResultDataCompareEx*, RDCOMPARE*, Int32*, HRESULT)
  end

  IResultDataCompareEx_GUID = "96933476-0251-11d3-aeb0-00c04f8ecd78"
  IID_IResultDataCompareEx = LibC::GUID.new(0x96933476_u32, 0x251_u16, 0x11d3_u16, StaticArray[0xae_u8, 0xb0_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])
  struct IResultDataCompareEx
    lpVtbl : IResultDataCompareExVTbl*
  end

  struct IComponentData2VTbl
    query_interface : Proc(IComponentData2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComponentData2*, UInt32)
    release : Proc(IComponentData2*, UInt32)
    initialize : Proc(IComponentData2*, IUnknown, HRESULT)
    create_component : Proc(IComponentData2*, IComponent*, HRESULT)
    notify : Proc(IComponentData2*, IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)
    destroy : Proc(IComponentData2*, HRESULT)
    query_data_object : Proc(IComponentData2*, LibC::IntPtrT, DATA_OBJECT_TYPES, IDataObject*, HRESULT)
    get_display_info : Proc(IComponentData2*, SCOPEDATAITEM*, HRESULT)
    compare_objects : Proc(IComponentData2*, IDataObject, IDataObject, HRESULT)
    query_dispatch : Proc(IComponentData2*, LibC::IntPtrT, DATA_OBJECT_TYPES, IDispatch*, HRESULT)
  end

  IComponentData2_GUID = "cca0f2d2-82de-41b5-bf47-3b2076273d5c"
  IID_IComponentData2 = LibC::GUID.new(0xcca0f2d2_u32, 0x82de_u16, 0x41b5_u16, StaticArray[0xbf_u8, 0x47_u8, 0x3b_u8, 0x20_u8, 0x76_u8, 0x27_u8, 0x3d_u8, 0x5c_u8])
  struct IComponentData2
    lpVtbl : IComponentData2VTbl*
  end

  struct IComponent2VTbl
    query_interface : Proc(IComponent2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComponent2*, UInt32)
    release : Proc(IComponent2*, UInt32)
    initialize : Proc(IComponent2*, IConsole, HRESULT)
    notify : Proc(IComponent2*, IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)
    destroy : Proc(IComponent2*, LibC::IntPtrT, HRESULT)
    query_data_object : Proc(IComponent2*, LibC::IntPtrT, DATA_OBJECT_TYPES, IDataObject*, HRESULT)
    get_result_view_type : Proc(IComponent2*, LibC::IntPtrT, LibC::LPWSTR*, Int32*, HRESULT)
    get_display_info : Proc(IComponent2*, RESULTDATAITEM*, HRESULT)
    compare_objects : Proc(IComponent2*, IDataObject, IDataObject, HRESULT)
    query_dispatch : Proc(IComponent2*, LibC::IntPtrT, DATA_OBJECT_TYPES, IDispatch*, HRESULT)
    get_result_view_type2 : Proc(IComponent2*, LibC::IntPtrT, RESULT_VIEW_TYPE_INFO*, HRESULT)
    restore_result_view : Proc(IComponent2*, LibC::IntPtrT, RESULT_VIEW_TYPE_INFO*, HRESULT)
  end

  IComponent2_GUID = "79a2d615-4a10-4ed4-8c65-8633f9335095"
  IID_IComponent2 = LibC::GUID.new(0x79a2d615_u32, 0x4a10_u16, 0x4ed4_u16, StaticArray[0x8c_u8, 0x65_u8, 0x86_u8, 0x33_u8, 0xf9_u8, 0x33_u8, 0x50_u8, 0x95_u8])
  struct IComponent2
    lpVtbl : IComponent2VTbl*
  end

  struct IContextMenuCallback2VTbl
    query_interface : Proc(IContextMenuCallback2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContextMenuCallback2*, UInt32)
    release : Proc(IContextMenuCallback2*, UInt32)
    add_item : Proc(IContextMenuCallback2*, CONTEXTMENUITEM2*, HRESULT)
  end

  IContextMenuCallback2_GUID = "e178bc0e-2ed0-4b5e-8097-42c9087e8b33"
  IID_IContextMenuCallback2 = LibC::GUID.new(0xe178bc0e_u32, 0x2ed0_u16, 0x4b5e_u16, StaticArray[0x80_u8, 0x97_u8, 0x42_u8, 0xc9_u8, 0x8_u8, 0x7e_u8, 0x8b_u8, 0x33_u8])
  struct IContextMenuCallback2
    lpVtbl : IContextMenuCallback2VTbl*
  end

  struct IMMCVersionInfoVTbl
    query_interface : Proc(IMMCVersionInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMMCVersionInfo*, UInt32)
    release : Proc(IMMCVersionInfo*, UInt32)
    get_mmc_version : Proc(IMMCVersionInfo*, Int32*, Int32*, HRESULT)
  end

  IMMCVersionInfo_GUID = "a8d2c5fe-cdcb-4b9d-bde5-a27343ff54bc"
  IID_IMMCVersionInfo = LibC::GUID.new(0xa8d2c5fe_u32, 0xcdcb_u16, 0x4b9d_u16, StaticArray[0xbd_u8, 0xe5_u8, 0xa2_u8, 0x73_u8, 0x43_u8, 0xff_u8, 0x54_u8, 0xbc_u8])
  struct IMMCVersionInfo
    lpVtbl : IMMCVersionInfoVTbl*
  end

  struct IExtendViewVTbl
    query_interface : Proc(IExtendView*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExtendView*, UInt32)
    release : Proc(IExtendView*, UInt32)
    get_views : Proc(IExtendView*, IDataObject, IViewExtensionCallback, HRESULT)
  end

  IExtendView_GUID = "89995cee-d2ed-4c0e-ae5e-df7e76f3fa53"
  IID_IExtendView = LibC::GUID.new(0x89995cee_u32, 0xd2ed_u16, 0x4c0e_u16, StaticArray[0xae_u8, 0x5e_u8, 0xdf_u8, 0x7e_u8, 0x76_u8, 0xf3_u8, 0xfa_u8, 0x53_u8])
  struct IExtendView
    lpVtbl : IExtendViewVTbl*
  end

  struct IViewExtensionCallbackVTbl
    query_interface : Proc(IViewExtensionCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IViewExtensionCallback*, UInt32)
    release : Proc(IViewExtensionCallback*, UInt32)
    add_view : Proc(IViewExtensionCallback*, MMC_EXT_VIEW_DATA*, HRESULT)
  end

  IViewExtensionCallback_GUID = "34dd928a-7599-41e5-9f5e-d6bc3062c2da"
  IID_IViewExtensionCallback = LibC::GUID.new(0x34dd928a_u32, 0x7599_u16, 0x41e5_u16, StaticArray[0x9f_u8, 0x5e_u8, 0xd6_u8, 0xbc_u8, 0x30_u8, 0x62_u8, 0xc2_u8, 0xda_u8])
  struct IViewExtensionCallback
    lpVtbl : IViewExtensionCallbackVTbl*
  end

  struct IConsolePowerVTbl
    query_interface : Proc(IConsolePower*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConsolePower*, UInt32)
    release : Proc(IConsolePower*, UInt32)
    set_execution_state : Proc(IConsolePower*, UInt32, UInt32, HRESULT)
    reset_idle_timer : Proc(IConsolePower*, UInt32, HRESULT)
  end

  IConsolePower_GUID = "1cfbdd0e-62ca-49ce-a3af-dbb2de61b068"
  IID_IConsolePower = LibC::GUID.new(0x1cfbdd0e_u32, 0x62ca_u16, 0x49ce_u16, StaticArray[0xa3_u8, 0xaf_u8, 0xdb_u8, 0xb2_u8, 0xde_u8, 0x61_u8, 0xb0_u8, 0x68_u8])
  struct IConsolePower
    lpVtbl : IConsolePowerVTbl*
  end

  struct IConsolePowerSinkVTbl
    query_interface : Proc(IConsolePowerSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConsolePowerSink*, UInt32)
    release : Proc(IConsolePowerSink*, UInt32)
    on_power_broadcast : Proc(IConsolePowerSink*, UInt32, LPARAM, LRESULT*, HRESULT)
  end

  IConsolePowerSink_GUID = "3333759f-fe4f-4975-b143-fec0a5dd6d65"
  IID_IConsolePowerSink = LibC::GUID.new(0x3333759f_u32, 0xfe4f_u16, 0x4975_u16, StaticArray[0xb1_u8, 0x43_u8, 0xfe_u8, 0xc0_u8, 0xa5_u8, 0xdd_u8, 0x6d_u8, 0x65_u8])
  struct IConsolePowerSink
    lpVtbl : IConsolePowerSinkVTbl*
  end

  struct INodePropertiesVTbl
    query_interface : Proc(INodeProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(INodeProperties*, UInt32)
    release : Proc(INodeProperties*, UInt32)
    get_property : Proc(INodeProperties*, IDataObject, UInt8*, UInt16**, HRESULT)
  end

  INodeProperties_GUID = "15bc4d24-a522-4406-aa55-0749537a6865"
  IID_INodeProperties = LibC::GUID.new(0x15bc4d24_u32, 0xa522_u16, 0x4406_u16, StaticArray[0xaa_u8, 0x55_u8, 0x7_u8, 0x49_u8, 0x53_u8, 0x7a_u8, 0x68_u8, 0x65_u8])
  struct INodeProperties
    lpVtbl : INodePropertiesVTbl*
  end

  struct IConsole3VTbl
    query_interface : Proc(IConsole3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConsole3*, UInt32)
    release : Proc(IConsole3*, UInt32)
    set_header : Proc(IConsole3*, IHeaderCtrl, HRESULT)
    set_toolbar : Proc(IConsole3*, IToolbar, HRESULT)
    query_result_view : Proc(IConsole3*, IUnknown*, HRESULT)
    query_scope_image_list : Proc(IConsole3*, IImageList*, HRESULT)
    query_result_image_list : Proc(IConsole3*, IImageList*, HRESULT)
    update_all_views : Proc(IConsole3*, IDataObject, LPARAM, LibC::IntPtrT, HRESULT)
    message_box : Proc(IConsole3*, LibC::LPWSTR, LibC::LPWSTR, UInt32, Int32*, HRESULT)
    query_console_verb : Proc(IConsole3*, IConsoleVerb*, HRESULT)
    select_scope_item : Proc(IConsole3*, LibC::IntPtrT, HRESULT)
    get_main_window : Proc(IConsole3*, HANDLE*, HRESULT)
    new_window : Proc(IConsole3*, LibC::IntPtrT, UInt32, HRESULT)
    expand : Proc(IConsole3*, LibC::IntPtrT, LibC::BOOL, HRESULT)
    is_taskpad_view_preferred : Proc(IConsole3*, HRESULT)
    set_status_text : Proc(IConsole3*, LibC::LPWSTR, HRESULT)
    rename_scope_item : Proc(IConsole3*, LibC::IntPtrT, HRESULT)
  end

  IConsole3_GUID = "4f85efdb-d0e1-498c-8d4a-d010dfdd404f"
  IID_IConsole3 = LibC::GUID.new(0x4f85efdb_u32, 0xd0e1_u16, 0x498c_u16, StaticArray[0x8d_u8, 0x4a_u8, 0xd0_u8, 0x10_u8, 0xdf_u8, 0xdd_u8, 0x40_u8, 0x4f_u8])
  struct IConsole3
    lpVtbl : IConsole3VTbl*
  end

  struct IResultData2VTbl
    query_interface : Proc(IResultData2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResultData2*, UInt32)
    release : Proc(IResultData2*, UInt32)
    insert_item : Proc(IResultData2*, RESULTDATAITEM*, HRESULT)
    delete_item : Proc(IResultData2*, LibC::IntPtrT, Int32, HRESULT)
    find_item_by_l_param : Proc(IResultData2*, LPARAM, LibC::IntPtrT*, HRESULT)
    delete_all_rslt_items : Proc(IResultData2*, HRESULT)
    set_item : Proc(IResultData2*, RESULTDATAITEM*, HRESULT)
    get_item : Proc(IResultData2*, RESULTDATAITEM*, HRESULT)
    get_next_item : Proc(IResultData2*, RESULTDATAITEM*, HRESULT)
    modify_item_state : Proc(IResultData2*, Int32, LibC::IntPtrT, UInt32, UInt32, HRESULT)
    modify_view_style : Proc(IResultData2*, MMC_RESULT_VIEW_STYLE, MMC_RESULT_VIEW_STYLE, HRESULT)
    set_view_mode : Proc(IResultData2*, Int32, HRESULT)
    get_view_mode : Proc(IResultData2*, Int32*, HRESULT)
    update_item : Proc(IResultData2*, LibC::IntPtrT, HRESULT)
    sort : Proc(IResultData2*, Int32, UInt32, LPARAM, HRESULT)
    set_desc_bar_text : Proc(IResultData2*, LibC::LPWSTR, HRESULT)
    set_item_count : Proc(IResultData2*, Int32, UInt32, HRESULT)
    rename_result_item : Proc(IResultData2*, LibC::IntPtrT, HRESULT)
  end

  IResultData2_GUID = "0f36e0eb-a7f1-4a81-be5a-9247f7de4b1b"
  IID_IResultData2 = LibC::GUID.new(0xf36e0eb_u32, 0xa7f1_u16, 0x4a81_u16, StaticArray[0xbe_u8, 0x5a_u8, 0x92_u8, 0x47_u8, 0xf7_u8, 0xde_u8, 0x4b_u8, 0x1b_u8])
  struct IResultData2
    lpVtbl : IResultData2VTbl*
  end

end
struct LibWin32::ISnapinProperties
  def query_interface(this : ISnapinProperties*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISnapinProperties*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISnapinProperties*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : ISnapinProperties*, pproperties : Properties) : HRESULT
    @lpVtbl.value.initialize.call(this, pproperties)
  end
  def query_property_names(this : ISnapinProperties*, pcallback : ISnapinPropertiesCallback) : HRESULT
    @lpVtbl.value.query_property_names.call(this, pcallback)
  end
  def properties_changed(this : ISnapinProperties*, cproperties : Int32, pproperties : MMC_SNAPIN_PROPERTY*) : HRESULT
    @lpVtbl.value.properties_changed.call(this, cproperties, pproperties)
  end
end
struct LibWin32::ISnapinPropertiesCallback
  def query_interface(this : ISnapinPropertiesCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISnapinPropertiesCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISnapinPropertiesCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_property_name(this : ISnapinPropertiesCallback*, pszpropname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.add_property_name.call(this, pszpropname, dwflags)
  end
end
struct LibWin32::IApplication
  def query_interface(this : IApplication*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IApplication*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IApplication*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IApplication*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IApplication*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IApplication*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IApplication*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def help(this : IApplication*) : Void
    @lpVtbl.value.help.call(this)
  end
  def quit(this : IApplication*) : Void
    @lpVtbl.value.quit.call(this)
  end
  def get_document(this : IApplication*, document : Document*) : HRESULT
    @lpVtbl.value.get_document.call(this, document)
  end
  def load(this : IApplication*, filename : UInt8*) : HRESULT
    @lpVtbl.value.load.call(this, filename)
  end
  def get_frame(this : IApplication*, frame : Frame*) : HRESULT
    @lpVtbl.value.get_frame.call(this, frame)
  end
  def get_visible(this : IApplication*, visible : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_visible.call(this, visible)
  end
  def show(this : IApplication*) : HRESULT
    @lpVtbl.value.show.call(this)
  end
  def hide(this : IApplication*) : HRESULT
    @lpVtbl.value.hide.call(this)
  end
  def get_user_control(this : IApplication*, usercontrol : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_control.call(this, usercontrol)
  end
  def put_user_control(this : IApplication*, usercontrol : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_user_control.call(this, usercontrol)
  end
  def get_version_major(this : IApplication*, versionmajor : Int32*) : HRESULT
    @lpVtbl.value.get_version_major.call(this, versionmajor)
  end
  def get_version_minor(this : IApplication*, versionminor : Int32*) : HRESULT
    @lpVtbl.value.get_version_minor.call(this, versionminor)
  end
end
struct LibWin32::IAppEvents
  def query_interface(this : IAppEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAppEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAppEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IAppEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IAppEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IAppEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IAppEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_quit(this : IAppEvents*, application : IApplication) : HRESULT
    @lpVtbl.value.on_quit.call(this, application)
  end
  def on_document_open(this : IAppEvents*, document : Document, new : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_document_open.call(this, document, new)
  end
  def on_document_close(this : IAppEvents*, document : Document) : HRESULT
    @lpVtbl.value.on_document_close.call(this, document)
  end
  def on_snap_in_added(this : IAppEvents*, document : Document, snapin : SnapIn) : HRESULT
    @lpVtbl.value.on_snap_in_added.call(this, document, snapin)
  end
  def on_snap_in_removed(this : IAppEvents*, document : Document, snapin : SnapIn) : HRESULT
    @lpVtbl.value.on_snap_in_removed.call(this, document, snapin)
  end
  def on_new_view(this : IAppEvents*, view : View) : HRESULT
    @lpVtbl.value.on_new_view.call(this, view)
  end
  def on_view_close(this : IAppEvents*, view : View) : HRESULT
    @lpVtbl.value.on_view_close.call(this, view)
  end
  def on_view_change(this : IAppEvents*, view : View, newownernode : Node) : HRESULT
    @lpVtbl.value.on_view_change.call(this, view, newownernode)
  end
  def on_selection_change(this : IAppEvents*, view : View, newnodes : Nodes) : HRESULT
    @lpVtbl.value.on_selection_change.call(this, view, newnodes)
  end
  def on_context_menu_executed(this : IAppEvents*, menuitem : MenuItem) : HRESULT
    @lpVtbl.value.on_context_menu_executed.call(this, menuitem)
  end
  def on_toolbar_button_clicked(this : IAppEvents*) : HRESULT
    @lpVtbl.value.on_toolbar_button_clicked.call(this)
  end
  def on_list_updated(this : IAppEvents*, view : View) : HRESULT
    @lpVtbl.value.on_list_updated.call(this, view)
  end
end
struct LibWin32::AppEvents
  def query_interface(this : AppEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AppEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AppEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : AppEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : AppEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : AppEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : AppEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IEventConnector
  def query_interface(this : IEventConnector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventConnector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventConnector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventConnector*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventConnector*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventConnector*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventConnector*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connect_to(this : IEventConnector*, application : IApplication) : HRESULT
    @lpVtbl.value.connect_to.call(this, application)
  end
  def disconnect(this : IEventConnector*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
end
struct LibWin32::Frame
  def query_interface(this : Frame*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Frame*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Frame*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Frame*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Frame*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Frame*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Frame*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def maximize(this : Frame*) : HRESULT
    @lpVtbl.value.maximize.call(this)
  end
  def minimize(this : Frame*) : HRESULT
    @lpVtbl.value.minimize.call(this)
  end
  def restore(this : Frame*) : HRESULT
    @lpVtbl.value.restore.call(this)
  end
  def get_top(this : Frame*, top : Int32*) : HRESULT
    @lpVtbl.value.get_top.call(this, top)
  end
  def put_top(this : Frame*, top : Int32) : HRESULT
    @lpVtbl.value.put_top.call(this, top)
  end
  def get_bottom(this : Frame*, bottom : Int32*) : HRESULT
    @lpVtbl.value.get_bottom.call(this, bottom)
  end
  def put_bottom(this : Frame*, bottom : Int32) : HRESULT
    @lpVtbl.value.put_bottom.call(this, bottom)
  end
  def get_left(this : Frame*, left : Int32*) : HRESULT
    @lpVtbl.value.get_left.call(this, left)
  end
  def put_left(this : Frame*, left : Int32) : HRESULT
    @lpVtbl.value.put_left.call(this, left)
  end
  def get_right(this : Frame*, right : Int32*) : HRESULT
    @lpVtbl.value.get_right.call(this, right)
  end
  def put_right(this : Frame*, right : Int32) : HRESULT
    @lpVtbl.value.put_right.call(this, right)
  end
end
struct LibWin32::Node
  def query_interface(this : Node*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Node*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Node*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Node*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Node*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Node*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Node*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : Node*, name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_property(this : Node*, propertyname : UInt8*, propertyvalue : UInt16**) : HRESULT
    @lpVtbl.value.get_property.call(this, propertyname, propertyvalue)
  end
  def get_bookmark(this : Node*, bookmark : UInt16**) : HRESULT
    @lpVtbl.value.get_bookmark.call(this, bookmark)
  end
  def is_scope_node(this : Node*, isscopenode : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_scope_node.call(this, isscopenode)
  end
  def get_nodetype(this : Node*, nodetype : UInt16**) : HRESULT
    @lpVtbl.value.get_nodetype.call(this, nodetype)
  end
end
struct LibWin32::ScopeNamespace
  def query_interface(this : ScopeNamespace*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ScopeNamespace*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ScopeNamespace*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ScopeNamespace*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ScopeNamespace*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ScopeNamespace*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ScopeNamespace*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_parent(this : ScopeNamespace*, node : Node, parent : Node*) : HRESULT
    @lpVtbl.value.get_parent.call(this, node, parent)
  end
  def get_child(this : ScopeNamespace*, node : Node, child : Node*) : HRESULT
    @lpVtbl.value.get_child.call(this, node, child)
  end
  def get_next(this : ScopeNamespace*, node : Node, _next : Node*) : HRESULT
    @lpVtbl.value.get_next.call(this, node, _next)
  end
  def get_root(this : ScopeNamespace*, root : Node*) : HRESULT
    @lpVtbl.value.get_root.call(this, root)
  end
  def expand(this : ScopeNamespace*, node : Node) : HRESULT
    @lpVtbl.value.expand.call(this, node)
  end
end
struct LibWin32::Document
  def query_interface(this : Document*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Document*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Document*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Document*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Document*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Document*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Document*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def save(this : Document*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def save_as(this : Document*, filename : UInt8*) : HRESULT
    @lpVtbl.value.save_as.call(this, filename)
  end
  def close(this : Document*, savechanges : LibC::BOOL) : HRESULT
    @lpVtbl.value.close.call(this, savechanges)
  end
  def get_views(this : Document*, views : Views*) : HRESULT
    @lpVtbl.value.get_views.call(this, views)
  end
  def get_snap_ins(this : Document*, snapins : SnapIns*) : HRESULT
    @lpVtbl.value.get_snap_ins.call(this, snapins)
  end
  def get_active_view(this : Document*, view : View*) : HRESULT
    @lpVtbl.value.get_active_view.call(this, view)
  end
  def get_name(this : Document*, name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : Document*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_location(this : Document*, location : UInt16**) : HRESULT
    @lpVtbl.value.get_location.call(this, location)
  end
  def get_is_saved(this : Document*, issaved : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_saved.call(this, issaved)
  end
  def get_mode(this : Document*, mode : DocumentMode*) : HRESULT
    @lpVtbl.value.get_mode.call(this, mode)
  end
  def put_mode(this : Document*, mode : DocumentMode) : HRESULT
    @lpVtbl.value.put_mode.call(this, mode)
  end
  def get_root_node(this : Document*, node : Node*) : HRESULT
    @lpVtbl.value.get_root_node.call(this, node)
  end
  def get_scope_namespace(this : Document*, scopenamespace : ScopeNamespace*) : HRESULT
    @lpVtbl.value.get_scope_namespace.call(this, scopenamespace)
  end
  def create_properties(this : Document*, properties : Properties*) : HRESULT
    @lpVtbl.value.create_properties.call(this, properties)
  end
  def get_application(this : Document*, application : IApplication*) : HRESULT
    @lpVtbl.value.get_application.call(this, application)
  end
end
struct LibWin32::SnapIn
  def query_interface(this : SnapIn*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : SnapIn*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : SnapIn*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : SnapIn*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : SnapIn*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : SnapIn*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : SnapIn*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : SnapIn*, name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_vendor(this : SnapIn*, vendor : UInt16**) : HRESULT
    @lpVtbl.value.get_vendor.call(this, vendor)
  end
  def get_version(this : SnapIn*, version : UInt16**) : HRESULT
    @lpVtbl.value.get_version.call(this, version)
  end
  def get_extensions(this : SnapIn*, extensions : Extensions*) : HRESULT
    @lpVtbl.value.get_extensions.call(this, extensions)
  end
  def get_snapin_clsid(this : SnapIn*, snapinclsid : UInt16**) : HRESULT
    @lpVtbl.value.get_snapin_clsid.call(this, snapinclsid)
  end
  def get_properties(this : SnapIn*, properties : Properties*) : HRESULT
    @lpVtbl.value.get_properties.call(this, properties)
  end
  def enable_all_extensions(this : SnapIn*, enable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_all_extensions.call(this, enable)
  end
end
struct LibWin32::SnapIns
  def query_interface(this : SnapIns*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : SnapIns*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : SnapIns*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : SnapIns*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : SnapIns*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : SnapIns*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : SnapIns*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : SnapIns*, retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, retval)
  end
  def item(this : SnapIns*, index : Int32, snapin : SnapIn*) : HRESULT
    @lpVtbl.value.item.call(this, index, snapin)
  end
  def get_count(this : SnapIns*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def add(this : SnapIns*, snapinnameorclsid : UInt8*, parentsnapin : VARIANT, properties : VARIANT, snapin : SnapIn*) : HRESULT
    @lpVtbl.value.add.call(this, snapinnameorclsid, parentsnapin, properties, snapin)
  end
  def remove(this : SnapIns*, snapin : SnapIn) : HRESULT
    @lpVtbl.value.remove.call(this, snapin)
  end
end
struct LibWin32::Extension
  def query_interface(this : Extension*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Extension*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Extension*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Extension*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Extension*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Extension*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Extension*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : Extension*, name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_vendor(this : Extension*, vendor : UInt16**) : HRESULT
    @lpVtbl.value.get_vendor.call(this, vendor)
  end
  def get_version(this : Extension*, version : UInt16**) : HRESULT
    @lpVtbl.value.get_version.call(this, version)
  end
  def get_extensions(this : Extension*, extensions : Extensions*) : HRESULT
    @lpVtbl.value.get_extensions.call(this, extensions)
  end
  def get_snapin_clsid(this : Extension*, snapinclsid : UInt16**) : HRESULT
    @lpVtbl.value.get_snapin_clsid.call(this, snapinclsid)
  end
  def enable_all_extensions(this : Extension*, enable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_all_extensions.call(this, enable)
  end
  def enable(this : Extension*, enable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable.call(this, enable)
  end
end
struct LibWin32::Extensions
  def query_interface(this : Extensions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Extensions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Extensions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Extensions*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Extensions*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Extensions*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Extensions*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : Extensions*, retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, retval)
  end
  def item(this : Extensions*, index : Int32, extension : Extension*) : HRESULT
    @lpVtbl.value.item.call(this, index, extension)
  end
  def get_count(this : Extensions*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
end
struct LibWin32::Columns
  def query_interface(this : Columns*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Columns*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Columns*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Columns*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Columns*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Columns*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Columns*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def item(this : Columns*, index : Int32, column : Column*) : HRESULT
    @lpVtbl.value.item.call(this, index, column)
  end
  def get_count(this : Columns*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get__new_enum(this : Columns*, retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, retval)
  end
end
struct LibWin32::Column
  def query_interface(this : Column*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Column*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Column*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Column*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Column*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Column*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Column*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def name(this : Column*, name : UInt8**) : HRESULT
    @lpVtbl.value.name.call(this, name)
  end
  def get_width(this : Column*, width : Int32*) : HRESULT
    @lpVtbl.value.get_width.call(this, width)
  end
  def put_width(this : Column*, width : Int32) : HRESULT
    @lpVtbl.value.put_width.call(this, width)
  end
  def get_display_position(this : Column*, displayposition : Int32*) : HRESULT
    @lpVtbl.value.get_display_position.call(this, displayposition)
  end
  def put_display_position(this : Column*, index : Int32) : HRESULT
    @lpVtbl.value.put_display_position.call(this, index)
  end
  def get_hidden(this : Column*, hidden : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_hidden.call(this, hidden)
  end
  def put_hidden(this : Column*, hidden : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_hidden.call(this, hidden)
  end
  def set_as_sort_column(this : Column*, sortorder : ColumnSortOrder) : HRESULT
    @lpVtbl.value.set_as_sort_column.call(this, sortorder)
  end
  def is_sort_column(this : Column*, issortcolumn : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_sort_column.call(this, issortcolumn)
  end
end
struct LibWin32::Views
  def query_interface(this : Views*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Views*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Views*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Views*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Views*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Views*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Views*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def item(this : Views*, index : Int32, view : View*) : HRESULT
    @lpVtbl.value.item.call(this, index, view)
  end
  def get_count(this : Views*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def add(this : Views*, node : Node, viewoptions : ViewOptions) : HRESULT
    @lpVtbl.value.add.call(this, node, viewoptions)
  end
  def get__new_enum(this : Views*, retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, retval)
  end
end
struct LibWin32::View
  def query_interface(this : View*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : View*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : View*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : View*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : View*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : View*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : View*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_active_scope_node(this : View*, node : Node*) : HRESULT
    @lpVtbl.value.get_active_scope_node.call(this, node)
  end
  def put_active_scope_node(this : View*, node : Node) : HRESULT
    @lpVtbl.value.put_active_scope_node.call(this, node)
  end
  def get_selection(this : View*, nodes : Nodes*) : HRESULT
    @lpVtbl.value.get_selection.call(this, nodes)
  end
  def get_list_items(this : View*, nodes : Nodes*) : HRESULT
    @lpVtbl.value.get_list_items.call(this, nodes)
  end
  def snapin_scope_object(this : View*, scopenode : VARIANT, scopenodeobject : IDispatch*) : HRESULT
    @lpVtbl.value.snapin_scope_object.call(this, scopenode, scopenodeobject)
  end
  def snapin_selection_object(this : View*, selectionobject : IDispatch*) : HRESULT
    @lpVtbl.value.snapin_selection_object.call(this, selectionobject)
  end
  def is(this : View*, view : View, thesame : Int16*) : HRESULT
    @lpVtbl.value.is.call(this, view, thesame)
  end
  def get_document(this : View*, document : Document*) : HRESULT
    @lpVtbl.value.get_document.call(this, document)
  end
  def select_all(this : View*) : HRESULT
    @lpVtbl.value.select_all.call(this)
  end
  def select(this : View*, node : Node) : HRESULT
    @lpVtbl.value.select.call(this, node)
  end
  def deselect(this : View*, node : Node) : HRESULT
    @lpVtbl.value.deselect.call(this, node)
  end
  def is_selected(this : View*, node : Node, isselected : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_selected.call(this, node, isselected)
  end
  def display_scope_node_property_sheet(this : View*, scopenode : VARIANT) : HRESULT
    @lpVtbl.value.display_scope_node_property_sheet.call(this, scopenode)
  end
  def display_selection_property_sheet(this : View*) : HRESULT
    @lpVtbl.value.display_selection_property_sheet.call(this)
  end
  def copy_scope_node(this : View*, scopenode : VARIANT) : HRESULT
    @lpVtbl.value.copy_scope_node.call(this, scopenode)
  end
  def copy_selection(this : View*) : HRESULT
    @lpVtbl.value.copy_selection.call(this)
  end
  def delete_scope_node(this : View*, scopenode : VARIANT) : HRESULT
    @lpVtbl.value.delete_scope_node.call(this, scopenode)
  end
  def delete_selection(this : View*) : HRESULT
    @lpVtbl.value.delete_selection.call(this)
  end
  def rename_scope_node(this : View*, newname : UInt8*, scopenode : VARIANT) : HRESULT
    @lpVtbl.value.rename_scope_node.call(this, newname, scopenode)
  end
  def rename_selected_item(this : View*, newname : UInt8*) : HRESULT
    @lpVtbl.value.rename_selected_item.call(this, newname)
  end
  def get_scope_node_context_menu(this : View*, scopenode : VARIANT, contextmenu : ContextMenu*) : HRESULT
    @lpVtbl.value.get_scope_node_context_menu.call(this, scopenode, contextmenu)
  end
  def get_selection_context_menu(this : View*, contextmenu : ContextMenu*) : HRESULT
    @lpVtbl.value.get_selection_context_menu.call(this, contextmenu)
  end
  def refresh_scope_node(this : View*, scopenode : VARIANT) : HRESULT
    @lpVtbl.value.refresh_scope_node.call(this, scopenode)
  end
  def refresh_selection(this : View*) : HRESULT
    @lpVtbl.value.refresh_selection.call(this)
  end
  def execute_selection_menu_item(this : View*, menuitempath : UInt8*) : HRESULT
    @lpVtbl.value.execute_selection_menu_item.call(this, menuitempath)
  end
  def execute_scope_node_menu_item(this : View*, menuitempath : UInt8*, scopenode : VARIANT) : HRESULT
    @lpVtbl.value.execute_scope_node_menu_item.call(this, menuitempath, scopenode)
  end
  def execute_shell_command(this : View*, command : UInt8*, directory : UInt8*, parameters : UInt8*, windowstate : UInt8*) : HRESULT
    @lpVtbl.value.execute_shell_command.call(this, command, directory, parameters, windowstate)
  end
  def get_frame(this : View*, frame : Frame*) : HRESULT
    @lpVtbl.value.get_frame.call(this, frame)
  end
  def close(this : View*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def get_scope_tree_visible(this : View*, visible : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_scope_tree_visible.call(this, visible)
  end
  def put_scope_tree_visible(this : View*, visible : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_scope_tree_visible.call(this, visible)
  end
  def back(this : View*) : HRESULT
    @lpVtbl.value.back.call(this)
  end
  def forward(this : View*) : HRESULT
    @lpVtbl.value.forward.call(this)
  end
  def put_status_bar_text(this : View*, statusbartext : UInt8*) : HRESULT
    @lpVtbl.value.put_status_bar_text.call(this, statusbartext)
  end
  def get_memento(this : View*, memento : UInt16**) : HRESULT
    @lpVtbl.value.get_memento.call(this, memento)
  end
  def view_memento(this : View*, memento : UInt8*) : HRESULT
    @lpVtbl.value.view_memento.call(this, memento)
  end
  def get_columns(this : View*, columns : Columns*) : HRESULT
    @lpVtbl.value.get_columns.call(this, columns)
  end
  def get_cell_contents(this : View*, node : Node, column : Int32, cellcontents : UInt16**) : HRESULT
    @lpVtbl.value.get_cell_contents.call(this, node, column, cellcontents)
  end
  def export_list(this : View*, file : UInt8*, exportoptions : ExportListOptions) : HRESULT
    @lpVtbl.value.export_list.call(this, file, exportoptions)
  end
  def get_list_view_mode(this : View*, mode : ListViewMode*) : HRESULT
    @lpVtbl.value.get_list_view_mode.call(this, mode)
  end
  def put_list_view_mode(this : View*, mode : ListViewMode) : HRESULT
    @lpVtbl.value.put_list_view_mode.call(this, mode)
  end
  def get_control_object(this : View*, control : IDispatch*) : HRESULT
    @lpVtbl.value.get_control_object.call(this, control)
  end
end
struct LibWin32::Nodes
  def query_interface(this : Nodes*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Nodes*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Nodes*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Nodes*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Nodes*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Nodes*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Nodes*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : Nodes*, retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, retval)
  end
  def item(this : Nodes*, index : Int32, node : Node*) : HRESULT
    @lpVtbl.value.item.call(this, index, node)
  end
  def get_count(this : Nodes*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
end
struct LibWin32::ContextMenu
  def query_interface(this : ContextMenu*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ContextMenu*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ContextMenu*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ContextMenu*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ContextMenu*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ContextMenu*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ContextMenu*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : ContextMenu*, retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, retval)
  end
  def get_item(this : ContextMenu*, indexorpath : VARIANT, menuitem : MenuItem*) : HRESULT
    @lpVtbl.value.get_item.call(this, indexorpath, menuitem)
  end
  def get_count(this : ContextMenu*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
end
struct LibWin32::MenuItem
  def query_interface(this : MenuItem*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : MenuItem*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : MenuItem*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : MenuItem*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : MenuItem*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : MenuItem*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : MenuItem*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(this : MenuItem*, displayname : UInt16**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, displayname)
  end
  def get_language_independent_name(this : MenuItem*, languageindependentname : UInt16**) : HRESULT
    @lpVtbl.value.get_language_independent_name.call(this, languageindependentname)
  end
  def get_path(this : MenuItem*, path : UInt16**) : HRESULT
    @lpVtbl.value.get_path.call(this, path)
  end
  def get_language_independent_path(this : MenuItem*, languageindependentpath : UInt16**) : HRESULT
    @lpVtbl.value.get_language_independent_path.call(this, languageindependentpath)
  end
  def execute(this : MenuItem*) : HRESULT
    @lpVtbl.value.execute.call(this)
  end
  def get_enabled(this : MenuItem*, enabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
end
struct LibWin32::Properties
  def query_interface(this : Properties*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Properties*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Properties*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Properties*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Properties*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Properties*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Properties*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : Properties*, retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, retval)
  end
  def item(this : Properties*, name : UInt8*, property : Property*) : HRESULT
    @lpVtbl.value.item.call(this, name, property)
  end
  def get_count(this : Properties*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def remove(this : Properties*, name : UInt8*) : HRESULT
    @lpVtbl.value.remove.call(this, name)
  end
end
struct LibWin32::Property
  def query_interface(this : Property*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : Property*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : Property*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : Property*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : Property*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : Property*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : Property*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_value(this : Property*, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, value)
  end
  def put_value(this : Property*, value : VARIANT) : HRESULT
    @lpVtbl.value.put_value.call(this, value)
  end
  def get_name(this : Property*, name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
end
struct LibWin32::IComponentData
  def query_interface(this : IComponentData*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComponentData*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComponentData*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IComponentData*, punknown : IUnknown) : HRESULT
    @lpVtbl.value.initialize.call(this, punknown)
  end
  def create_component(this : IComponentData*, ppcomponent : IComponent*) : HRESULT
    @lpVtbl.value.create_component.call(this, ppcomponent)
  end
  def notify(this : IComponentData*, lpdataobject : IDataObject, event : MMC_NOTIFY_TYPE, arg : LPARAM, param3 : LPARAM) : HRESULT
    @lpVtbl.value.notify.call(this, lpdataobject, event, arg, param3)
  end
  def destroy(this : IComponentData*) : HRESULT
    @lpVtbl.value.destroy.call(this)
  end
  def query_data_object(this : IComponentData*, cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.query_data_object.call(this, cookie, type, ppdataobject)
  end
  def get_display_info(this : IComponentData*, pscopedataitem : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.get_display_info.call(this, pscopedataitem)
  end
  def compare_objects(this : IComponentData*, lpdataobjecta : IDataObject, lpdataobjectb : IDataObject) : HRESULT
    @lpVtbl.value.compare_objects.call(this, lpdataobjecta, lpdataobjectb)
  end
end
struct LibWin32::IComponent
  def query_interface(this : IComponent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComponent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComponent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IComponent*, lpconsole : IConsole) : HRESULT
    @lpVtbl.value.initialize.call(this, lpconsole)
  end
  def notify(this : IComponent*, lpdataobject : IDataObject, event : MMC_NOTIFY_TYPE, arg : LPARAM, param3 : LPARAM) : HRESULT
    @lpVtbl.value.notify.call(this, lpdataobject, event, arg, param3)
  end
  def destroy(this : IComponent*, cookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.destroy.call(this, cookie)
  end
  def query_data_object(this : IComponent*, cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.query_data_object.call(this, cookie, type, ppdataobject)
  end
  def get_result_view_type(this : IComponent*, cookie : LibC::IntPtrT, ppviewtype : LibC::LPWSTR*, pviewoptions : Int32*) : HRESULT
    @lpVtbl.value.get_result_view_type.call(this, cookie, ppviewtype, pviewoptions)
  end
  def get_display_info(this : IComponent*, presultdataitem : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_display_info.call(this, presultdataitem)
  end
  def compare_objects(this : IComponent*, lpdataobjecta : IDataObject, lpdataobjectb : IDataObject) : HRESULT
    @lpVtbl.value.compare_objects.call(this, lpdataobjecta, lpdataobjectb)
  end
end
struct LibWin32::IResultDataCompare
  def query_interface(this : IResultDataCompare*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResultDataCompare*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResultDataCompare*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compare(this : IResultDataCompare*, luserparam : LPARAM, cookiea : LibC::IntPtrT, cookieb : LibC::IntPtrT, pnresult : Int32*) : HRESULT
    @lpVtbl.value.compare.call(this, luserparam, cookiea, cookieb, pnresult)
  end
end
struct LibWin32::IResultOwnerData
  def query_interface(this : IResultOwnerData*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResultOwnerData*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResultOwnerData*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def find_item(this : IResultOwnerData*, pfindinfo : RESULTFINDINFO*, pnfoundindex : Int32*) : HRESULT
    @lpVtbl.value.find_item.call(this, pfindinfo, pnfoundindex)
  end
  def cache_hint(this : IResultOwnerData*, nstartindex : Int32, nendindex : Int32) : HRESULT
    @lpVtbl.value.cache_hint.call(this, nstartindex, nendindex)
  end
  def sort_items(this : IResultOwnerData*, ncolumn : Int32, dwsortoptions : UInt32, luserparam : LPARAM) : HRESULT
    @lpVtbl.value.sort_items.call(this, ncolumn, dwsortoptions, luserparam)
  end
end
struct LibWin32::IConsole
  def query_interface(this : IConsole*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConsole*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConsole*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_header(this : IConsole*, pheader : IHeaderCtrl) : HRESULT
    @lpVtbl.value.set_header.call(this, pheader)
  end
  def set_toolbar(this : IConsole*, ptoolbar : IToolbar) : HRESULT
    @lpVtbl.value.set_toolbar.call(this, ptoolbar)
  end
  def query_result_view(this : IConsole*, punknown : IUnknown*) : HRESULT
    @lpVtbl.value.query_result_view.call(this, punknown)
  end
  def query_scope_image_list(this : IConsole*, ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_scope_image_list.call(this, ppimagelist)
  end
  def query_result_image_list(this : IConsole*, ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_result_image_list.call(this, ppimagelist)
  end
  def update_all_views(this : IConsole*, lpdataobject : IDataObject, data : LPARAM, hint : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_all_views.call(this, lpdataobject, data, hint)
  end
  def message_box(this : IConsole*, lpsztext : LibC::LPWSTR, lpsztitle : LibC::LPWSTR, fustyle : UInt32, piretval : Int32*) : HRESULT
    @lpVtbl.value.message_box.call(this, lpsztext, lpsztitle, fustyle, piretval)
  end
  def query_console_verb(this : IConsole*, ppconsoleverb : IConsoleVerb*) : HRESULT
    @lpVtbl.value.query_console_verb.call(this, ppconsoleverb)
  end
  def select_scope_item(this : IConsole*, hscopeitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.select_scope_item.call(this, hscopeitem)
  end
  def get_main_window(this : IConsole*, phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_main_window.call(this, phwnd)
  end
  def new_window(this : IConsole*, hscopeitem : LibC::IntPtrT, loptions : UInt32) : HRESULT
    @lpVtbl.value.new_window.call(this, hscopeitem, loptions)
  end
end
struct LibWin32::IHeaderCtrl
  def query_interface(this : IHeaderCtrl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHeaderCtrl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHeaderCtrl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert_column(this : IHeaderCtrl*, ncol : Int32, title : LibC::LPWSTR, nformat : Int32, nwidth : Int32) : HRESULT
    @lpVtbl.value.insert_column.call(this, ncol, title, nformat, nwidth)
  end
  def delete_column(this : IHeaderCtrl*, ncol : Int32) : HRESULT
    @lpVtbl.value.delete_column.call(this, ncol)
  end
  def set_column_text(this : IHeaderCtrl*, ncol : Int32, title : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_column_text.call(this, ncol, title)
  end
  def get_column_text(this : IHeaderCtrl*, ncol : Int32, ptext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_column_text.call(this, ncol, ptext)
  end
  def set_column_width(this : IHeaderCtrl*, ncol : Int32, nwidth : Int32) : HRESULT
    @lpVtbl.value.set_column_width.call(this, ncol, nwidth)
  end
  def get_column_width(this : IHeaderCtrl*, ncol : Int32, pwidth : Int32*) : HRESULT
    @lpVtbl.value.get_column_width.call(this, ncol, pwidth)
  end
end
struct LibWin32::IContextMenuCallback
  def query_interface(this : IContextMenuCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContextMenuCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContextMenuCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_item(this : IContextMenuCallback*, pitem : CONTEXTMENUITEM*) : HRESULT
    @lpVtbl.value.add_item.call(this, pitem)
  end
end
struct LibWin32::IContextMenuProvider
  def query_interface(this : IContextMenuProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContextMenuProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContextMenuProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_item(this : IContextMenuProvider*, pitem : CONTEXTMENUITEM*) : HRESULT
    @lpVtbl.value.add_item.call(this, pitem)
  end
  def empty_menu_list(this : IContextMenuProvider*) : HRESULT
    @lpVtbl.value.empty_menu_list.call(this)
  end
  def add_primary_extension_items(this : IContextMenuProvider*, piextension : IUnknown, pidataobject : IDataObject) : HRESULT
    @lpVtbl.value.add_primary_extension_items.call(this, piextension, pidataobject)
  end
  def add_third_party_extension_items(this : IContextMenuProvider*, pidataobject : IDataObject) : HRESULT
    @lpVtbl.value.add_third_party_extension_items.call(this, pidataobject)
  end
  def show_context_menu(this : IContextMenuProvider*, hwndparent : LibC::HANDLE, xpos : Int32, ypos : Int32, plselected : Int32*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this, hwndparent, xpos, ypos, plselected)
  end
end
struct LibWin32::IExtendContextMenu
  def query_interface(this : IExtendContextMenu*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExtendContextMenu*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExtendContextMenu*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_menu_items(this : IExtendContextMenu*, pidataobject : IDataObject, picallback : IContextMenuCallback, pinsertionallowed : Int32*) : HRESULT
    @lpVtbl.value.add_menu_items.call(this, pidataobject, picallback, pinsertionallowed)
  end
  def command(this : IExtendContextMenu*, lcommandid : Int32, pidataobject : IDataObject) : HRESULT
    @lpVtbl.value.command.call(this, lcommandid, pidataobject)
  end
end
struct LibWin32::IImageList
  def query_interface(this : IImageList*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IImageList*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IImageList*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def image_list_set_icon(this : IImageList*, picon : LibC::IntPtrT*, nloc : Int32) : HRESULT
    @lpVtbl.value.image_list_set_icon.call(this, picon, nloc)
  end
  def image_list_set_strip(this : IImageList*, pbmapsm : LibC::IntPtrT*, pbmaplg : LibC::IntPtrT*, nstartloc : Int32, cmask : UInt32) : HRESULT
    @lpVtbl.value.image_list_set_strip.call(this, pbmapsm, pbmaplg, nstartloc, cmask)
  end
end
struct LibWin32::IResultData
  def query_interface(this : IResultData*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResultData*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResultData*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert_item(this : IResultData*, item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.insert_item.call(this, item)
  end
  def delete_item(this : IResultData*, itemid : LibC::IntPtrT, ncol : Int32) : HRESULT
    @lpVtbl.value.delete_item.call(this, itemid, ncol)
  end
  def find_item_by_l_param(this : IResultData*, lparam : LPARAM, pitemid : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.find_item_by_l_param.call(this, lparam, pitemid)
  end
  def delete_all_rslt_items(this : IResultData*) : HRESULT
    @lpVtbl.value.delete_all_rslt_items.call(this)
  end
  def set_item(this : IResultData*, item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.set_item.call(this, item)
  end
  def get_item(this : IResultData*, item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_item.call(this, item)
  end
  def get_next_item(this : IResultData*, item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_next_item.call(this, item)
  end
  def modify_item_state(this : IResultData*, nindex : Int32, itemid : LibC::IntPtrT, uadd : UInt32, uremove : UInt32) : HRESULT
    @lpVtbl.value.modify_item_state.call(this, nindex, itemid, uadd, uremove)
  end
  def modify_view_style(this : IResultData*, add : MMC_RESULT_VIEW_STYLE, remove : MMC_RESULT_VIEW_STYLE) : HRESULT
    @lpVtbl.value.modify_view_style.call(this, add, remove)
  end
  def set_view_mode(this : IResultData*, lviewmode : Int32) : HRESULT
    @lpVtbl.value.set_view_mode.call(this, lviewmode)
  end
  def get_view_mode(this : IResultData*, lviewmode : Int32*) : HRESULT
    @lpVtbl.value.get_view_mode.call(this, lviewmode)
  end
  def update_item(this : IResultData*, itemid : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_item.call(this, itemid)
  end
  def sort(this : IResultData*, ncolumn : Int32, dwsortoptions : UInt32, luserparam : LPARAM) : HRESULT
    @lpVtbl.value.sort.call(this, ncolumn, dwsortoptions, luserparam)
  end
  def set_desc_bar_text(this : IResultData*, desctext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_desc_bar_text.call(this, desctext)
  end
  def set_item_count(this : IResultData*, nitemcount : Int32, dwoptions : UInt32) : HRESULT
    @lpVtbl.value.set_item_count.call(this, nitemcount, dwoptions)
  end
end
struct LibWin32::IConsoleNameSpace
  def query_interface(this : IConsoleNameSpace*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConsoleNameSpace*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConsoleNameSpace*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert_item(this : IConsoleNameSpace*, item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.insert_item.call(this, item)
  end
  def delete_item(this : IConsoleNameSpace*, hitem : LibC::IntPtrT, fdeletethis : Int32) : HRESULT
    @lpVtbl.value.delete_item.call(this, hitem, fdeletethis)
  end
  def set_item(this : IConsoleNameSpace*, item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.set_item.call(this, item)
  end
  def get_item(this : IConsoleNameSpace*, item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.get_item.call(this, item)
  end
  def get_child_item(this : IConsoleNameSpace*, item : LibC::IntPtrT, pitemchild : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_child_item.call(this, item, pitemchild, pcookie)
  end
  def get_next_item(this : IConsoleNameSpace*, item : LibC::IntPtrT, pitemnext : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_next_item.call(this, item, pitemnext, pcookie)
  end
  def get_parent_item(this : IConsoleNameSpace*, item : LibC::IntPtrT, pitemparent : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_parent_item.call(this, item, pitemparent, pcookie)
  end
end
struct LibWin32::IConsoleNameSpace2
  def query_interface(this : IConsoleNameSpace2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConsoleNameSpace2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConsoleNameSpace2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert_item(this : IConsoleNameSpace2*, item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.insert_item.call(this, item)
  end
  def delete_item(this : IConsoleNameSpace2*, hitem : LibC::IntPtrT, fdeletethis : Int32) : HRESULT
    @lpVtbl.value.delete_item.call(this, hitem, fdeletethis)
  end
  def set_item(this : IConsoleNameSpace2*, item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.set_item.call(this, item)
  end
  def get_item(this : IConsoleNameSpace2*, item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.get_item.call(this, item)
  end
  def get_child_item(this : IConsoleNameSpace2*, item : LibC::IntPtrT, pitemchild : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_child_item.call(this, item, pitemchild, pcookie)
  end
  def get_next_item(this : IConsoleNameSpace2*, item : LibC::IntPtrT, pitemnext : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_next_item.call(this, item, pitemnext, pcookie)
  end
  def get_parent_item(this : IConsoleNameSpace2*, item : LibC::IntPtrT, pitemparent : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_parent_item.call(this, item, pitemparent, pcookie)
  end
  def expand(this : IConsoleNameSpace2*, hitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.expand.call(this, hitem)
  end
  def add_extension(this : IConsoleNameSpace2*, hitem : LibC::IntPtrT, lpclsid : Guid*) : HRESULT
    @lpVtbl.value.add_extension.call(this, hitem, lpclsid)
  end
end
struct LibWin32::IPropertySheetCallback
  def query_interface(this : IPropertySheetCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPropertySheetCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPropertySheetCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_page(this : IPropertySheetCallback*, hpage : HPROPSHEETPAGE) : HRESULT
    @lpVtbl.value.add_page.call(this, hpage)
  end
  def remove_page(this : IPropertySheetCallback*, hpage : HPROPSHEETPAGE) : HRESULT
    @lpVtbl.value.remove_page.call(this, hpage)
  end
end
struct LibWin32::IPropertySheetProvider
  def query_interface(this : IPropertySheetProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPropertySheetProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPropertySheetProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_property_sheet(this : IPropertySheetProvider*, title : LibC::LPWSTR, type : UInt8, cookie : LibC::IntPtrT, pidataobjectm : IDataObject, dwoptions : UInt32) : HRESULT
    @lpVtbl.value.create_property_sheet.call(this, title, type, cookie, pidataobjectm, dwoptions)
  end
  def find_property_sheet(this : IPropertySheetProvider*, hitem : LibC::IntPtrT, lpcomponent : IComponent, lpdataobject : IDataObject) : HRESULT
    @lpVtbl.value.find_property_sheet.call(this, hitem, lpcomponent, lpdataobject)
  end
  def add_primary_pages(this : IPropertySheetProvider*, lpunknown : IUnknown, bcreatehandle : LibC::BOOL, hnotifywindow : LibC::HANDLE, bscopepane : LibC::BOOL) : HRESULT
    @lpVtbl.value.add_primary_pages.call(this, lpunknown, bcreatehandle, hnotifywindow, bscopepane)
  end
  def add_extension_pages(this : IPropertySheetProvider*) : HRESULT
    @lpVtbl.value.add_extension_pages.call(this)
  end
  def show(this : IPropertySheetProvider*, window : LibC::IntPtrT, page : Int32) : HRESULT
    @lpVtbl.value.show.call(this, window, page)
  end
end
struct LibWin32::IExtendPropertySheet
  def query_interface(this : IExtendPropertySheet*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExtendPropertySheet*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExtendPropertySheet*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_property_pages(this : IExtendPropertySheet*, lpprovider : IPropertySheetCallback, handle : LibC::IntPtrT, lpidataobject : IDataObject) : HRESULT
    @lpVtbl.value.create_property_pages.call(this, lpprovider, handle, lpidataobject)
  end
  def query_pages_for(this : IExtendPropertySheet*, lpdataobject : IDataObject) : HRESULT
    @lpVtbl.value.query_pages_for.call(this, lpdataobject)
  end
end
struct LibWin32::IControlbar
  def query_interface(this : IControlbar*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IControlbar*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IControlbar*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IControlbar*, ntype : MMC_CONTROL_TYPE, pextendcontrolbar : IExtendControlbar, ppunknown : IUnknown*) : HRESULT
    @lpVtbl.value.create.call(this, ntype, pextendcontrolbar, ppunknown)
  end
  def attach(this : IControlbar*, ntype : MMC_CONTROL_TYPE, lpunknown : IUnknown) : HRESULT
    @lpVtbl.value.attach.call(this, ntype, lpunknown)
  end
  def detach(this : IControlbar*, lpunknown : IUnknown) : HRESULT
    @lpVtbl.value.detach.call(this, lpunknown)
  end
end
struct LibWin32::IExtendControlbar
  def query_interface(this : IExtendControlbar*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExtendControlbar*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExtendControlbar*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_controlbar(this : IExtendControlbar*, pcontrolbar : IControlbar) : HRESULT
    @lpVtbl.value.set_controlbar.call(this, pcontrolbar)
  end
  def controlbar_notify(this : IExtendControlbar*, event : MMC_NOTIFY_TYPE, arg : LPARAM, param2 : LPARAM) : HRESULT
    @lpVtbl.value.controlbar_notify.call(this, event, arg, param2)
  end
end
struct LibWin32::IToolbar
  def query_interface(this : IToolbar*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IToolbar*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IToolbar*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_bitmap(this : IToolbar*, nimages : Int32, hbmp : HBITMAP, cxsize : Int32, cysize : Int32, crmask : UInt32) : HRESULT
    @lpVtbl.value.add_bitmap.call(this, nimages, hbmp, cxsize, cysize, crmask)
  end
  def add_buttons(this : IToolbar*, nbuttons : Int32, lpbuttons : MMCBUTTON*) : HRESULT
    @lpVtbl.value.add_buttons.call(this, nbuttons, lpbuttons)
  end
  def insert_button(this : IToolbar*, nindex : Int32, lpbutton : MMCBUTTON*) : HRESULT
    @lpVtbl.value.insert_button.call(this, nindex, lpbutton)
  end
  def delete_button(this : IToolbar*, nindex : Int32) : HRESULT
    @lpVtbl.value.delete_button.call(this, nindex)
  end
  def get_button_state(this : IToolbar*, idcommand : Int32, nstate : MMC_BUTTON_STATE, pstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_button_state.call(this, idcommand, nstate, pstate)
  end
  def set_button_state(this : IToolbar*, idcommand : Int32, nstate : MMC_BUTTON_STATE, bstate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_button_state.call(this, idcommand, nstate, bstate)
  end
end
struct LibWin32::IConsoleVerb
  def query_interface(this : IConsoleVerb*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConsoleVerb*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConsoleVerb*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_verb_state(this : IConsoleVerb*, ecmdid : MMC_CONSOLE_VERB, nstate : MMC_BUTTON_STATE, pstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_verb_state.call(this, ecmdid, nstate, pstate)
  end
  def set_verb_state(this : IConsoleVerb*, ecmdid : MMC_CONSOLE_VERB, nstate : MMC_BUTTON_STATE, bstate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_verb_state.call(this, ecmdid, nstate, bstate)
  end
  def set_default_verb(this : IConsoleVerb*, ecmdid : MMC_CONSOLE_VERB) : HRESULT
    @lpVtbl.value.set_default_verb.call(this, ecmdid)
  end
  def get_default_verb(this : IConsoleVerb*, pecmdid : MMC_CONSOLE_VERB*) : HRESULT
    @lpVtbl.value.get_default_verb.call(this, pecmdid)
  end
end
struct LibWin32::ISnapinAbout
  def query_interface(this : ISnapinAbout*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISnapinAbout*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISnapinAbout*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_snapin_description(this : ISnapinAbout*, lpdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_snapin_description.call(this, lpdescription)
  end
  def get_provider(this : ISnapinAbout*, lpname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_provider.call(this, lpname)
  end
  def get_snapin_version(this : ISnapinAbout*, lpversion : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_snapin_version.call(this, lpversion)
  end
  def get_snapin_image(this : ISnapinAbout*, happicon : HANDLE*) : HRESULT
    @lpVtbl.value.get_snapin_image.call(this, happicon)
  end
  def get_static_folder_image(this : ISnapinAbout*, hsmallimage : HBITMAP*, hsmallimageopen : HBITMAP*, hlargeimage : HBITMAP*, cmask : UInt32*) : HRESULT
    @lpVtbl.value.get_static_folder_image.call(this, hsmallimage, hsmallimageopen, hlargeimage, cmask)
  end
end
struct LibWin32::IMenuButton
  def query_interface(this : IMenuButton*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMenuButton*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMenuButton*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_button(this : IMenuButton*, idcommand : Int32, lpbuttontext : LibC::LPWSTR, lptooltiptext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_button.call(this, idcommand, lpbuttontext, lptooltiptext)
  end
  def set_button(this : IMenuButton*, idcommand : Int32, lpbuttontext : LibC::LPWSTR, lptooltiptext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_button.call(this, idcommand, lpbuttontext, lptooltiptext)
  end
  def set_button_state(this : IMenuButton*, idcommand : Int32, nstate : MMC_BUTTON_STATE, bstate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_button_state.call(this, idcommand, nstate, bstate)
  end
end
struct LibWin32::ISnapinHelp
  def query_interface(this : ISnapinHelp*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISnapinHelp*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISnapinHelp*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_help_topic(this : ISnapinHelp*, lpcompiledhelpfile : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_help_topic.call(this, lpcompiledhelpfile)
  end
end
struct LibWin32::IExtendPropertySheet2
  def query_interface(this : IExtendPropertySheet2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExtendPropertySheet2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExtendPropertySheet2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_property_pages(this : IExtendPropertySheet2*, lpprovider : IPropertySheetCallback, handle : LibC::IntPtrT, lpidataobject : IDataObject) : HRESULT
    @lpVtbl.value.create_property_pages.call(this, lpprovider, handle, lpidataobject)
  end
  def query_pages_for(this : IExtendPropertySheet2*, lpdataobject : IDataObject) : HRESULT
    @lpVtbl.value.query_pages_for.call(this, lpdataobject)
  end
  def get_watermarks(this : IExtendPropertySheet2*, lpidataobject : IDataObject, lphwatermark : HBITMAP*, lphheader : HBITMAP*, lphpalette : HPALETTE*, bstretch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_watermarks.call(this, lpidataobject, lphwatermark, lphheader, lphpalette, bstretch)
  end
end
struct LibWin32::IHeaderCtrl2
  def query_interface(this : IHeaderCtrl2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHeaderCtrl2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHeaderCtrl2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert_column(this : IHeaderCtrl2*, ncol : Int32, title : LibC::LPWSTR, nformat : Int32, nwidth : Int32) : HRESULT
    @lpVtbl.value.insert_column.call(this, ncol, title, nformat, nwidth)
  end
  def delete_column(this : IHeaderCtrl2*, ncol : Int32) : HRESULT
    @lpVtbl.value.delete_column.call(this, ncol)
  end
  def set_column_text(this : IHeaderCtrl2*, ncol : Int32, title : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_column_text.call(this, ncol, title)
  end
  def get_column_text(this : IHeaderCtrl2*, ncol : Int32, ptext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_column_text.call(this, ncol, ptext)
  end
  def set_column_width(this : IHeaderCtrl2*, ncol : Int32, nwidth : Int32) : HRESULT
    @lpVtbl.value.set_column_width.call(this, ncol, nwidth)
  end
  def get_column_width(this : IHeaderCtrl2*, ncol : Int32, pwidth : Int32*) : HRESULT
    @lpVtbl.value.get_column_width.call(this, ncol, pwidth)
  end
  def set_change_time_out(this : IHeaderCtrl2*, utimeout : UInt32) : HRESULT
    @lpVtbl.value.set_change_time_out.call(this, utimeout)
  end
  def set_column_filter(this : IHeaderCtrl2*, ncolumn : UInt32, dwtype : UInt32, pfilterdata : MMC_FILTERDATA*) : HRESULT
    @lpVtbl.value.set_column_filter.call(this, ncolumn, dwtype, pfilterdata)
  end
  def get_column_filter(this : IHeaderCtrl2*, ncolumn : UInt32, pdwtype : UInt32*, pfilterdata : MMC_FILTERDATA*) : HRESULT
    @lpVtbl.value.get_column_filter.call(this, ncolumn, pdwtype, pfilterdata)
  end
end
struct LibWin32::ISnapinHelp2
  def query_interface(this : ISnapinHelp2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISnapinHelp2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISnapinHelp2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_help_topic(this : ISnapinHelp2*, lpcompiledhelpfile : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_help_topic.call(this, lpcompiledhelpfile)
  end
  def get_linked_topics(this : ISnapinHelp2*, lpcompiledhelpfiles : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_linked_topics.call(this, lpcompiledhelpfiles)
  end
end
struct LibWin32::IEnumTASK
  def query_interface(this : IEnumTASK*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumTASK*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumTASK*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next_(this : IEnumTASK*, celt : UInt32, rgelt : MMC_TASK*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next_.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumTASK*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumTASK*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumTASK*, ppenum : IEnumTASK*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IExtendTaskPad
  def query_interface(this : IExtendTaskPad*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExtendTaskPad*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExtendTaskPad*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def task_notify(this : IExtendTaskPad*, pdo : IDataObject, arg : VARIANT*, param2 : VARIANT*) : HRESULT
    @lpVtbl.value.task_notify.call(this, pdo, arg, param2)
  end
  def enum_tasks(this : IExtendTaskPad*, pdo : IDataObject, sztaskgroup : LibC::LPWSTR, ppenumtask : IEnumTASK*) : HRESULT
    @lpVtbl.value.enum_tasks.call(this, pdo, sztaskgroup, ppenumtask)
  end
  def get_title(this : IExtendTaskPad*, pszgroup : LibC::LPWSTR, psztitle : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_title.call(this, pszgroup, psztitle)
  end
  def get_descriptive_text(this : IExtendTaskPad*, pszgroup : LibC::LPWSTR, pszdescriptivetext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_descriptive_text.call(this, pszgroup, pszdescriptivetext)
  end
  def get_background(this : IExtendTaskPad*, pszgroup : LibC::LPWSTR, ptdo : MMC_TASK_DISPLAY_OBJECT*) : HRESULT
    @lpVtbl.value.get_background.call(this, pszgroup, ptdo)
  end
  def get_list_pad_info(this : IExtendTaskPad*, pszgroup : LibC::LPWSTR, lplistpadinfo : MMC_LISTPAD_INFO*) : HRESULT
    @lpVtbl.value.get_list_pad_info.call(this, pszgroup, lplistpadinfo)
  end
end
struct LibWin32::IConsole2
  def query_interface(this : IConsole2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConsole2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConsole2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_header(this : IConsole2*, pheader : IHeaderCtrl) : HRESULT
    @lpVtbl.value.set_header.call(this, pheader)
  end
  def set_toolbar(this : IConsole2*, ptoolbar : IToolbar) : HRESULT
    @lpVtbl.value.set_toolbar.call(this, ptoolbar)
  end
  def query_result_view(this : IConsole2*, punknown : IUnknown*) : HRESULT
    @lpVtbl.value.query_result_view.call(this, punknown)
  end
  def query_scope_image_list(this : IConsole2*, ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_scope_image_list.call(this, ppimagelist)
  end
  def query_result_image_list(this : IConsole2*, ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_result_image_list.call(this, ppimagelist)
  end
  def update_all_views(this : IConsole2*, lpdataobject : IDataObject, data : LPARAM, hint : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_all_views.call(this, lpdataobject, data, hint)
  end
  def message_box(this : IConsole2*, lpsztext : LibC::LPWSTR, lpsztitle : LibC::LPWSTR, fustyle : UInt32, piretval : Int32*) : HRESULT
    @lpVtbl.value.message_box.call(this, lpsztext, lpsztitle, fustyle, piretval)
  end
  def query_console_verb(this : IConsole2*, ppconsoleverb : IConsoleVerb*) : HRESULT
    @lpVtbl.value.query_console_verb.call(this, ppconsoleverb)
  end
  def select_scope_item(this : IConsole2*, hscopeitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.select_scope_item.call(this, hscopeitem)
  end
  def get_main_window(this : IConsole2*, phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_main_window.call(this, phwnd)
  end
  def new_window(this : IConsole2*, hscopeitem : LibC::IntPtrT, loptions : UInt32) : HRESULT
    @lpVtbl.value.new_window.call(this, hscopeitem, loptions)
  end
  def expand(this : IConsole2*, hitem : LibC::IntPtrT, bexpand : LibC::BOOL) : HRESULT
    @lpVtbl.value.expand.call(this, hitem, bexpand)
  end
  def is_taskpad_view_preferred(this : IConsole2*) : HRESULT
    @lpVtbl.value.is_taskpad_view_preferred.call(this)
  end
  def set_status_text(this : IConsole2*, pszstatustext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_status_text.call(this, pszstatustext)
  end
end
struct LibWin32::IDisplayHelp
  def query_interface(this : IDisplayHelp*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDisplayHelp*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDisplayHelp*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def show_topic(this : IDisplayHelp*, pszhelptopic : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.show_topic.call(this, pszhelptopic)
  end
end
struct LibWin32::IRequiredExtensions
  def query_interface(this : IRequiredExtensions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRequiredExtensions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRequiredExtensions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enable_all_extensions(this : IRequiredExtensions*) : HRESULT
    @lpVtbl.value.enable_all_extensions.call(this)
  end
  def get_first_extension(this : IRequiredExtensions*, pextclsid : Guid*) : HRESULT
    @lpVtbl.value.get_first_extension.call(this, pextclsid)
  end
  def get_next_extension(this : IRequiredExtensions*, pextclsid : Guid*) : HRESULT
    @lpVtbl.value.get_next_extension.call(this, pextclsid)
  end
end
struct LibWin32::IStringTable
  def query_interface(this : IStringTable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStringTable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStringTable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_string(this : IStringTable*, pszadd : LibC::LPWSTR, pstringid : UInt32*) : HRESULT
    @lpVtbl.value.add_string.call(this, pszadd, pstringid)
  end
  def get_string(this : IStringTable*, stringid : UInt32, cchbuffer : UInt32, lpbuffer : Char*, pcchout : UInt32*) : HRESULT
    @lpVtbl.value.get_string.call(this, stringid, cchbuffer, lpbuffer, pcchout)
  end
  def get_string_length(this : IStringTable*, stringid : UInt32, pcchstring : UInt32*) : HRESULT
    @lpVtbl.value.get_string_length.call(this, stringid, pcchstring)
  end
  def delete_string(this : IStringTable*, stringid : UInt32) : HRESULT
    @lpVtbl.value.delete_string.call(this, stringid)
  end
  def delete_all_strings(this : IStringTable*) : HRESULT
    @lpVtbl.value.delete_all_strings.call(this)
  end
  def find_string(this : IStringTable*, pszfind : LibC::LPWSTR, pstringid : UInt32*) : HRESULT
    @lpVtbl.value.find_string.call(this, pszfind, pstringid)
  end
  def enumerate(this : IStringTable*, ppenum : IEnumString*) : HRESULT
    @lpVtbl.value.enumerate.call(this, ppenum)
  end
end
struct LibWin32::IColumnData
  def query_interface(this : IColumnData*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IColumnData*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IColumnData*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_column_config_data(this : IColumnData*, pcolid : SColumnSetID*, pcolsetdata : MMC_COLUMN_SET_DATA*) : HRESULT
    @lpVtbl.value.set_column_config_data.call(this, pcolid, pcolsetdata)
  end
  def get_column_config_data(this : IColumnData*, pcolid : SColumnSetID*, ppcolsetdata : MMC_COLUMN_SET_DATA**) : HRESULT
    @lpVtbl.value.get_column_config_data.call(this, pcolid, ppcolsetdata)
  end
  def set_column_sort_data(this : IColumnData*, pcolid : SColumnSetID*, pcolsortdata : MMC_SORT_SET_DATA*) : HRESULT
    @lpVtbl.value.set_column_sort_data.call(this, pcolid, pcolsortdata)
  end
  def get_column_sort_data(this : IColumnData*, pcolid : SColumnSetID*, ppcolsortdata : MMC_SORT_SET_DATA**) : HRESULT
    @lpVtbl.value.get_column_sort_data.call(this, pcolid, ppcolsortdata)
  end
end
struct LibWin32::IMessageView
  def query_interface(this : IMessageView*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMessageView*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMessageView*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_title_text(this : IMessageView*, psztitletext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_title_text.call(this, psztitletext)
  end
  def set_body_text(this : IMessageView*, pszbodytext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_body_text.call(this, pszbodytext)
  end
  def set_icon(this : IMessageView*, id : IconIdentifier) : HRESULT
    @lpVtbl.value.set_icon.call(this, id)
  end
  def clear(this : IMessageView*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
end
struct LibWin32::IResultDataCompareEx
  def query_interface(this : IResultDataCompareEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResultDataCompareEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResultDataCompareEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compare(this : IResultDataCompareEx*, prdc : RDCOMPARE*, pnresult : Int32*) : HRESULT
    @lpVtbl.value.compare.call(this, prdc, pnresult)
  end
end
struct LibWin32::IComponentData2
  def query_interface(this : IComponentData2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComponentData2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComponentData2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IComponentData2*, punknown : IUnknown) : HRESULT
    @lpVtbl.value.initialize.call(this, punknown)
  end
  def create_component(this : IComponentData2*, ppcomponent : IComponent*) : HRESULT
    @lpVtbl.value.create_component.call(this, ppcomponent)
  end
  def notify(this : IComponentData2*, lpdataobject : IDataObject, event : MMC_NOTIFY_TYPE, arg : LPARAM, param3 : LPARAM) : HRESULT
    @lpVtbl.value.notify.call(this, lpdataobject, event, arg, param3)
  end
  def destroy(this : IComponentData2*) : HRESULT
    @lpVtbl.value.destroy.call(this)
  end
  def query_data_object(this : IComponentData2*, cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.query_data_object.call(this, cookie, type, ppdataobject)
  end
  def get_display_info(this : IComponentData2*, pscopedataitem : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.get_display_info.call(this, pscopedataitem)
  end
  def compare_objects(this : IComponentData2*, lpdataobjecta : IDataObject, lpdataobjectb : IDataObject) : HRESULT
    @lpVtbl.value.compare_objects.call(this, lpdataobjecta, lpdataobjectb)
  end
  def query_dispatch(this : IComponentData2*, cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdispatch : IDispatch*) : HRESULT
    @lpVtbl.value.query_dispatch.call(this, cookie, type, ppdispatch)
  end
end
struct LibWin32::IComponent2
  def query_interface(this : IComponent2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComponent2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComponent2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IComponent2*, lpconsole : IConsole) : HRESULT
    @lpVtbl.value.initialize.call(this, lpconsole)
  end
  def notify(this : IComponent2*, lpdataobject : IDataObject, event : MMC_NOTIFY_TYPE, arg : LPARAM, param3 : LPARAM) : HRESULT
    @lpVtbl.value.notify.call(this, lpdataobject, event, arg, param3)
  end
  def destroy(this : IComponent2*, cookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.destroy.call(this, cookie)
  end
  def query_data_object(this : IComponent2*, cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.query_data_object.call(this, cookie, type, ppdataobject)
  end
  def get_result_view_type(this : IComponent2*, cookie : LibC::IntPtrT, ppviewtype : LibC::LPWSTR*, pviewoptions : Int32*) : HRESULT
    @lpVtbl.value.get_result_view_type.call(this, cookie, ppviewtype, pviewoptions)
  end
  def get_display_info(this : IComponent2*, presultdataitem : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_display_info.call(this, presultdataitem)
  end
  def compare_objects(this : IComponent2*, lpdataobjecta : IDataObject, lpdataobjectb : IDataObject) : HRESULT
    @lpVtbl.value.compare_objects.call(this, lpdataobjecta, lpdataobjectb)
  end
  def query_dispatch(this : IComponent2*, cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdispatch : IDispatch*) : HRESULT
    @lpVtbl.value.query_dispatch.call(this, cookie, type, ppdispatch)
  end
  def get_result_view_type2(this : IComponent2*, cookie : LibC::IntPtrT, presultviewtype : RESULT_VIEW_TYPE_INFO*) : HRESULT
    @lpVtbl.value.get_result_view_type2.call(this, cookie, presultviewtype)
  end
  def restore_result_view(this : IComponent2*, cookie : LibC::IntPtrT, presultviewtype : RESULT_VIEW_TYPE_INFO*) : HRESULT
    @lpVtbl.value.restore_result_view.call(this, cookie, presultviewtype)
  end
end
struct LibWin32::IContextMenuCallback2
  def query_interface(this : IContextMenuCallback2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContextMenuCallback2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContextMenuCallback2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_item(this : IContextMenuCallback2*, pitem : CONTEXTMENUITEM2*) : HRESULT
    @lpVtbl.value.add_item.call(this, pitem)
  end
end
struct LibWin32::IMMCVersionInfo
  def query_interface(this : IMMCVersionInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMMCVersionInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMMCVersionInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_mmc_version(this : IMMCVersionInfo*, pversionmajor : Int32*, pversionminor : Int32*) : HRESULT
    @lpVtbl.value.get_mmc_version.call(this, pversionmajor, pversionminor)
  end
end
struct LibWin32::IExtendView
  def query_interface(this : IExtendView*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExtendView*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExtendView*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_views(this : IExtendView*, pdataobject : IDataObject, pviewextensioncallback : IViewExtensionCallback) : HRESULT
    @lpVtbl.value.get_views.call(this, pdataobject, pviewextensioncallback)
  end
end
struct LibWin32::IViewExtensionCallback
  def query_interface(this : IViewExtensionCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IViewExtensionCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IViewExtensionCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_view(this : IViewExtensionCallback*, pextviewdata : MMC_EXT_VIEW_DATA*) : HRESULT
    @lpVtbl.value.add_view.call(this, pextviewdata)
  end
end
struct LibWin32::IConsolePower
  def query_interface(this : IConsolePower*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConsolePower*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConsolePower*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_execution_state(this : IConsolePower*, dwadd : UInt32, dwremove : UInt32) : HRESULT
    @lpVtbl.value.set_execution_state.call(this, dwadd, dwremove)
  end
  def reset_idle_timer(this : IConsolePower*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.reset_idle_timer.call(this, dwflags)
  end
end
struct LibWin32::IConsolePowerSink
  def query_interface(this : IConsolePowerSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConsolePowerSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConsolePowerSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_power_broadcast(this : IConsolePowerSink*, nevent : UInt32, lparam : LPARAM, plreturn : LRESULT*) : HRESULT
    @lpVtbl.value.on_power_broadcast.call(this, nevent, lparam, plreturn)
  end
end
struct LibWin32::INodeProperties
  def query_interface(this : INodeProperties*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INodeProperties*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INodeProperties*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_property(this : INodeProperties*, pdataobject : IDataObject, szpropertyname : UInt8*, pbstrproperty : UInt16**) : HRESULT
    @lpVtbl.value.get_property.call(this, pdataobject, szpropertyname, pbstrproperty)
  end
end
struct LibWin32::IConsole3
  def query_interface(this : IConsole3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConsole3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConsole3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_header(this : IConsole3*, pheader : IHeaderCtrl) : HRESULT
    @lpVtbl.value.set_header.call(this, pheader)
  end
  def set_toolbar(this : IConsole3*, ptoolbar : IToolbar) : HRESULT
    @lpVtbl.value.set_toolbar.call(this, ptoolbar)
  end
  def query_result_view(this : IConsole3*, punknown : IUnknown*) : HRESULT
    @lpVtbl.value.query_result_view.call(this, punknown)
  end
  def query_scope_image_list(this : IConsole3*, ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_scope_image_list.call(this, ppimagelist)
  end
  def query_result_image_list(this : IConsole3*, ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_result_image_list.call(this, ppimagelist)
  end
  def update_all_views(this : IConsole3*, lpdataobject : IDataObject, data : LPARAM, hint : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_all_views.call(this, lpdataobject, data, hint)
  end
  def message_box(this : IConsole3*, lpsztext : LibC::LPWSTR, lpsztitle : LibC::LPWSTR, fustyle : UInt32, piretval : Int32*) : HRESULT
    @lpVtbl.value.message_box.call(this, lpsztext, lpsztitle, fustyle, piretval)
  end
  def query_console_verb(this : IConsole3*, ppconsoleverb : IConsoleVerb*) : HRESULT
    @lpVtbl.value.query_console_verb.call(this, ppconsoleverb)
  end
  def select_scope_item(this : IConsole3*, hscopeitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.select_scope_item.call(this, hscopeitem)
  end
  def get_main_window(this : IConsole3*, phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_main_window.call(this, phwnd)
  end
  def new_window(this : IConsole3*, hscopeitem : LibC::IntPtrT, loptions : UInt32) : HRESULT
    @lpVtbl.value.new_window.call(this, hscopeitem, loptions)
  end
  def expand(this : IConsole3*, hitem : LibC::IntPtrT, bexpand : LibC::BOOL) : HRESULT
    @lpVtbl.value.expand.call(this, hitem, bexpand)
  end
  def is_taskpad_view_preferred(this : IConsole3*) : HRESULT
    @lpVtbl.value.is_taskpad_view_preferred.call(this)
  end
  def set_status_text(this : IConsole3*, pszstatustext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_status_text.call(this, pszstatustext)
  end
  def rename_scope_item(this : IConsole3*, hscopeitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.rename_scope_item.call(this, hscopeitem)
  end
end
struct LibWin32::IResultData2
  def query_interface(this : IResultData2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResultData2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResultData2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert_item(this : IResultData2*, item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.insert_item.call(this, item)
  end
  def delete_item(this : IResultData2*, itemid : LibC::IntPtrT, ncol : Int32) : HRESULT
    @lpVtbl.value.delete_item.call(this, itemid, ncol)
  end
  def find_item_by_l_param(this : IResultData2*, lparam : LPARAM, pitemid : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.find_item_by_l_param.call(this, lparam, pitemid)
  end
  def delete_all_rslt_items(this : IResultData2*) : HRESULT
    @lpVtbl.value.delete_all_rslt_items.call(this)
  end
  def set_item(this : IResultData2*, item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.set_item.call(this, item)
  end
  def get_item(this : IResultData2*, item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_item.call(this, item)
  end
  def get_next_item(this : IResultData2*, item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_next_item.call(this, item)
  end
  def modify_item_state(this : IResultData2*, nindex : Int32, itemid : LibC::IntPtrT, uadd : UInt32, uremove : UInt32) : HRESULT
    @lpVtbl.value.modify_item_state.call(this, nindex, itemid, uadd, uremove)
  end
  def modify_view_style(this : IResultData2*, add : MMC_RESULT_VIEW_STYLE, remove : MMC_RESULT_VIEW_STYLE) : HRESULT
    @lpVtbl.value.modify_view_style.call(this, add, remove)
  end
  def set_view_mode(this : IResultData2*, lviewmode : Int32) : HRESULT
    @lpVtbl.value.set_view_mode.call(this, lviewmode)
  end
  def get_view_mode(this : IResultData2*, lviewmode : Int32*) : HRESULT
    @lpVtbl.value.get_view_mode.call(this, lviewmode)
  end
  def update_item(this : IResultData2*, itemid : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_item.call(this, itemid)
  end
  def sort(this : IResultData2*, ncolumn : Int32, dwsortoptions : UInt32, luserparam : LPARAM) : HRESULT
    @lpVtbl.value.sort.call(this, ncolumn, dwsortoptions, luserparam)
  end
  def set_desc_bar_text(this : IResultData2*, desctext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_desc_bar_text.call(this, desctext)
  end
  def set_item_count(this : IResultData2*, nitemcount : Int32, dwoptions : UInt32) : HRESULT
    @lpVtbl.value.set_item_count.call(this, nitemcount, dwoptions)
  end
  def rename_result_item(this : IResultData2*, itemid : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.rename_result_item.call(this, itemid)
  end
end
