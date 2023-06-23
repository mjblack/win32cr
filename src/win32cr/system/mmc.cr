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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    query_property_names : UInt64
    properties_changed : UInt64
  end

  ISnapinProperties_GUID = "f7889da9-4a02-4837-bf89-1a6f2a021010"
  IID_ISnapinProperties = LibC::GUID.new(0xf7889da9_u32, 0x4a02_u16, 0x4837_u16, StaticArray[0xbf_u8, 0x89_u8, 0x1a_u8, 0x6f_u8, 0x2a_u8, 0x2_u8, 0x10_u8, 0x10_u8])
  struct ISnapinProperties
    lpVtbl : ISnapinPropertiesVTbl*
  end

  struct ISnapinPropertiesCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_property_name : UInt64
  end

  ISnapinPropertiesCallback_GUID = "a50fa2e5-7e61-45eb-a8d4-9a07b3e851a8"
  IID_ISnapinPropertiesCallback = LibC::GUID.new(0xa50fa2e5_u32, 0x7e61_u16, 0x45eb_u16, StaticArray[0xa8_u8, 0xd4_u8, 0x9a_u8, 0x7_u8, 0xb3_u8, 0xe8_u8, 0x51_u8, 0xa8_u8])
  struct ISnapinPropertiesCallback
    lpVtbl : ISnapinPropertiesCallbackVTbl*
  end

  struct IApplicationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    help : UInt64
    quit : UInt64
    get_document : UInt64
    load : UInt64
    get_frame : UInt64
    get_visible : UInt64
    show : UInt64
    hide : UInt64
    get_user_control : UInt64
    put_user_control : UInt64
    get_version_major : UInt64
    get_version_minor : UInt64
  end

  IApplication_GUID = "a3afb9cc-b653-4741-86ab-f0470ec1384c"
  IID_IApplication = LibC::GUID.new(0xa3afb9cc_u32, 0xb653_u16, 0x4741_u16, StaticArray[0x86_u8, 0xab_u8, 0xf0_u8, 0x47_u8, 0xe_u8, 0xc1_u8, 0x38_u8, 0x4c_u8])
  struct IApplication
    lpVtbl : IApplicationVTbl*
  end

  struct IAppEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    on_quit : UInt64
    on_document_open : UInt64
    on_document_close : UInt64
    on_snap_in_added : UInt64
    on_snap_in_removed : UInt64
    on_new_view : UInt64
    on_view_close : UInt64
    on_view_change : UInt64
    on_selection_change : UInt64
    on_context_menu_executed : UInt64
    on_toolbar_button_clicked : UInt64
    on_list_updated : UInt64
  end

  IAppEvents_GUID = "de46cbdd-53f5-4635-af54-4fe71e923d3f"
  IID_IAppEvents = LibC::GUID.new(0xde46cbdd_u32, 0x53f5_u16, 0x4635_u16, StaticArray[0xaf_u8, 0x54_u8, 0x4f_u8, 0xe7_u8, 0x1e_u8, 0x92_u8, 0x3d_u8, 0x3f_u8])
  struct IAppEvents
    lpVtbl : IAppEventsVTbl*
  end

  struct AppEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  AppEvents_GUID = "fc7a4252-78ac-4532-8c5a-563cfe138863"
  IID_AppEvents = LibC::GUID.new(0xfc7a4252_u32, 0x78ac_u16, 0x4532_u16, StaticArray[0x8c_u8, 0x5a_u8, 0x56_u8, 0x3c_u8, 0xfe_u8, 0x13_u8, 0x88_u8, 0x63_u8])
  struct AppEvents
    lpVtbl : AppEventsVTbl*
  end

  struct IEventConnectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    connect_to : UInt64
    disconnect : UInt64
  end

  IEventConnector_GUID = "c0bccd30-de44-4528-8403-a05a6a1cc8ea"
  IID_IEventConnector = LibC::GUID.new(0xc0bccd30_u32, 0xde44_u16, 0x4528_u16, StaticArray[0x84_u8, 0x3_u8, 0xa0_u8, 0x5a_u8, 0x6a_u8, 0x1c_u8, 0xc8_u8, 0xea_u8])
  struct IEventConnector
    lpVtbl : IEventConnectorVTbl*
  end

  struct FrameVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    maximize : UInt64
    minimize : UInt64
    restore : UInt64
    get_top : UInt64
    put_top : UInt64
    get_bottom : UInt64
    put_bottom : UInt64
    get_left : UInt64
    put_left : UInt64
    get_right : UInt64
    put_right : UInt64
  end

  Frame_GUID = "e5e2d970-5bb3-4306-8804-b0968a31c8e6"
  IID_Frame = LibC::GUID.new(0xe5e2d970_u32, 0x5bb3_u16, 0x4306_u16, StaticArray[0x88_u8, 0x4_u8, 0xb0_u8, 0x96_u8, 0x8a_u8, 0x31_u8, 0xc8_u8, 0xe6_u8])
  struct Frame
    lpVtbl : FrameVTbl*
  end

  struct NodeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_property : UInt64
    get_bookmark : UInt64
    is_scope_node : UInt64
    get_nodetype : UInt64
  end

  Node_GUID = "f81ed800-7839-4447-945d-8e15da59ca55"
  IID_Node = LibC::GUID.new(0xf81ed800_u32, 0x7839_u16, 0x4447_u16, StaticArray[0x94_u8, 0x5d_u8, 0x8e_u8, 0x15_u8, 0xda_u8, 0x59_u8, 0xca_u8, 0x55_u8])
  struct Node
    lpVtbl : NodeVTbl*
  end

  struct ScopeNamespaceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_parent : UInt64
    get_child : UInt64
    get_next : UInt64
    get_root : UInt64
    expand : UInt64
  end

  ScopeNamespace_GUID = "ebbb48dc-1a3b-4d86-b786-c21b28389012"
  IID_ScopeNamespace = LibC::GUID.new(0xebbb48dc_u32, 0x1a3b_u16, 0x4d86_u16, StaticArray[0xb7_u8, 0x86_u8, 0xc2_u8, 0x1b_u8, 0x28_u8, 0x38_u8, 0x90_u8, 0x12_u8])
  struct ScopeNamespace
    lpVtbl : ScopeNamespaceVTbl*
  end

  struct DocumentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    save : UInt64
    save_as : UInt64
    close : UInt64
    get_views : UInt64
    get_snap_ins : UInt64
    get_active_view : UInt64
    get_name : UInt64
    put_name : UInt64
    get_location : UInt64
    get_is_saved : UInt64
    get_mode : UInt64
    put_mode : UInt64
    get_root_node : UInt64
    get_scope_namespace : UInt64
    create_properties : UInt64
    get_application : UInt64
  end

  Document_GUID = "225120d6-1e0f-40a3-93fe-1079e6a8017b"
  IID_Document = LibC::GUID.new(0x225120d6_u32, 0x1e0f_u16, 0x40a3_u16, StaticArray[0x93_u8, 0xfe_u8, 0x10_u8, 0x79_u8, 0xe6_u8, 0xa8_u8, 0x1_u8, 0x7b_u8])
  struct Document
    lpVtbl : DocumentVTbl*
  end

  struct SnapInVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_vendor : UInt64
    get_version : UInt64
    get_extensions : UInt64
    get_snapin_clsid : UInt64
    get_properties : UInt64
    enable_all_extensions : UInt64
  end

  SnapIn_GUID = "3be910f6-3459-49c6-a1bb-41e6be9df3ea"
  IID_SnapIn = LibC::GUID.new(0x3be910f6_u32, 0x3459_u16, 0x49c6_u16, StaticArray[0xa1_u8, 0xbb_u8, 0x41_u8, 0xe6_u8, 0xbe_u8, 0x9d_u8, 0xf3_u8, 0xea_u8])
  struct SnapIn
    lpVtbl : SnapInVTbl*
  end

  struct SnapInsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    item : UInt64
    get_count : UInt64
    add : UInt64
    remove : UInt64
  end

  SnapIns_GUID = "2ef3de1d-b12a-49d1-92c5-0b00798768f1"
  IID_SnapIns = LibC::GUID.new(0x2ef3de1d_u32, 0xb12a_u16, 0x49d1_u16, StaticArray[0x92_u8, 0xc5_u8, 0xb_u8, 0x0_u8, 0x79_u8, 0x87_u8, 0x68_u8, 0xf1_u8])
  struct SnapIns
    lpVtbl : SnapInsVTbl*
  end

  struct ExtensionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_vendor : UInt64
    get_version : UInt64
    get_extensions : UInt64
    get_snapin_clsid : UInt64
    enable_all_extensions : UInt64
    enable : UInt64
  end

  Extension_GUID = "ad4d6ca6-912f-409b-a26e-7fd234aef542"
  IID_Extension = LibC::GUID.new(0xad4d6ca6_u32, 0x912f_u16, 0x409b_u16, StaticArray[0xa2_u8, 0x6e_u8, 0x7f_u8, 0xd2_u8, 0x34_u8, 0xae_u8, 0xf5_u8, 0x42_u8])
  struct Extension
    lpVtbl : ExtensionVTbl*
  end

  struct ExtensionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    item : UInt64
    get_count : UInt64
  end

  Extensions_GUID = "82dbea43-8ca4-44bc-a2ca-d18741059ec8"
  IID_Extensions = LibC::GUID.new(0x82dbea43_u32, 0x8ca4_u16, 0x44bc_u16, StaticArray[0xa2_u8, 0xca_u8, 0xd1_u8, 0x87_u8, 0x41_u8, 0x5_u8, 0x9e_u8, 0xc8_u8])
  struct Extensions
    lpVtbl : ExtensionsVTbl*
  end

  struct ColumnsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    item : UInt64
    get_count : UInt64
    get__new_enum : UInt64
  end

  Columns_GUID = "383d4d97-fc44-478b-b139-6323dc48611c"
  IID_Columns = LibC::GUID.new(0x383d4d97_u32, 0xfc44_u16, 0x478b_u16, StaticArray[0xb1_u8, 0x39_u8, 0x63_u8, 0x23_u8, 0xdc_u8, 0x48_u8, 0x61_u8, 0x1c_u8])
  struct Columns
    lpVtbl : ColumnsVTbl*
  end

  struct ColumnVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    name : UInt64
    get_width : UInt64
    put_width : UInt64
    get_display_position : UInt64
    put_display_position : UInt64
    get_hidden : UInt64
    put_hidden : UInt64
    set_as_sort_column : UInt64
    is_sort_column : UInt64
  end

  Column_GUID = "fd1c5f63-2b16-4d06-9ab3-f45350b940ab"
  IID_Column = LibC::GUID.new(0xfd1c5f63_u32, 0x2b16_u16, 0x4d06_u16, StaticArray[0x9a_u8, 0xb3_u8, 0xf4_u8, 0x53_u8, 0x50_u8, 0xb9_u8, 0x40_u8, 0xab_u8])
  struct Column
    lpVtbl : ColumnVTbl*
  end

  struct ViewsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    item : UInt64
    get_count : UInt64
    add : UInt64
    get__new_enum : UInt64
  end

  Views_GUID = "d6b8c29d-a1ff-4d72-aab0-e381e9b9338d"
  IID_Views = LibC::GUID.new(0xd6b8c29d_u32, 0xa1ff_u16, 0x4d72_u16, StaticArray[0xaa_u8, 0xb0_u8, 0xe3_u8, 0x81_u8, 0xe9_u8, 0xb9_u8, 0x33_u8, 0x8d_u8])
  struct Views
    lpVtbl : ViewsVTbl*
  end

  struct ViewVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_active_scope_node : UInt64
    put_active_scope_node : UInt64
    get_selection : UInt64
    get_list_items : UInt64
    snapin_scope_object : UInt64
    snapin_selection_object : UInt64
    is : UInt64
    get_document : UInt64
    select_all : UInt64
    select : UInt64
    deselect : UInt64
    is_selected : UInt64
    display_scope_node_property_sheet : UInt64
    display_selection_property_sheet : UInt64
    copy_scope_node : UInt64
    copy_selection : UInt64
    delete_scope_node : UInt64
    delete_selection : UInt64
    rename_scope_node : UInt64
    rename_selected_item : UInt64
    get_scope_node_context_menu : UInt64
    get_selection_context_menu : UInt64
    refresh_scope_node : UInt64
    refresh_selection : UInt64
    execute_selection_menu_item : UInt64
    execute_scope_node_menu_item : UInt64
    execute_shell_command : UInt64
    get_frame : UInt64
    close : UInt64
    get_scope_tree_visible : UInt64
    put_scope_tree_visible : UInt64
    back : UInt64
    forward : UInt64
    put_status_bar_text : UInt64
    get_memento : UInt64
    view_memento : UInt64
    get_columns : UInt64
    get_cell_contents : UInt64
    export_list : UInt64
    get_list_view_mode : UInt64
    put_list_view_mode : UInt64
    get_control_object : UInt64
  end

  View_GUID = "6efc2da2-b38c-457e-9abb-ed2d189b8c38"
  IID_View = LibC::GUID.new(0x6efc2da2_u32, 0xb38c_u16, 0x457e_u16, StaticArray[0x9a_u8, 0xbb_u8, 0xed_u8, 0x2d_u8, 0x18_u8, 0x9b_u8, 0x8c_u8, 0x38_u8])
  struct View
    lpVtbl : ViewVTbl*
  end

  struct NodesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    item : UInt64
    get_count : UInt64
  end

  Nodes_GUID = "313b01df-b22f-4d42-b1b8-483cdcf51d35"
  IID_Nodes = LibC::GUID.new(0x313b01df_u32, 0xb22f_u16, 0x4d42_u16, StaticArray[0xb1_u8, 0xb8_u8, 0x48_u8, 0x3c_u8, 0xdc_u8, 0xf5_u8, 0x1d_u8, 0x35_u8])
  struct Nodes
    lpVtbl : NodesVTbl*
  end

  struct ContextMenuVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
  end

  ContextMenu_GUID = "dab39ce0-25e6-4e07-8362-ba9c95706545"
  IID_ContextMenu = LibC::GUID.new(0xdab39ce0_u32, 0x25e6_u16, 0x4e07_u16, StaticArray[0x83_u8, 0x62_u8, 0xba_u8, 0x9c_u8, 0x95_u8, 0x70_u8, 0x65_u8, 0x45_u8])
  struct ContextMenu
    lpVtbl : ContextMenuVTbl*
  end

  struct MenuItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_display_name : UInt64
    get_language_independent_name : UInt64
    get_path : UInt64
    get_language_independent_path : UInt64
    execute : UInt64
    get_enabled : UInt64
  end

  MenuItem_GUID = "0178fad1-b361-4b27-96ad-67c57ebf2e1d"
  IID_MenuItem = LibC::GUID.new(0x178fad1_u32, 0xb361_u16, 0x4b27_u16, StaticArray[0x96_u8, 0xad_u8, 0x67_u8, 0xc5_u8, 0x7e_u8, 0xbf_u8, 0x2e_u8, 0x1d_u8])
  struct MenuItem
    lpVtbl : MenuItemVTbl*
  end

  struct PropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    item : UInt64
    get_count : UInt64
    remove : UInt64
  end

  Properties_GUID = "2886abc2-a425-42b2-91c6-e25c0e04581c"
  IID_Properties = LibC::GUID.new(0x2886abc2_u32, 0xa425_u16, 0x42b2_u16, StaticArray[0x91_u8, 0xc6_u8, 0xe2_u8, 0x5c_u8, 0xe_u8, 0x4_u8, 0x58_u8, 0x1c_u8])
  struct Properties
    lpVtbl : PropertiesVTbl*
  end

  struct PropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_value : UInt64
    put_value : UInt64
    get_name : UInt64
  end

  Property_GUID = "4600c3a5-e301-41d8-b6d0-ef2e4212e0ca"
  IID_Property = LibC::GUID.new(0x4600c3a5_u32, 0xe301_u16, 0x41d8_u16, StaticArray[0xb6_u8, 0xd0_u8, 0xef_u8, 0x2e_u8, 0x42_u8, 0x12_u8, 0xe0_u8, 0xca_u8])
  struct Property
    lpVtbl : PropertyVTbl*
  end

  struct IComponentDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    create_component : UInt64
    notify : UInt64
    destroy : UInt64
    query_data_object : UInt64
    get_display_info : UInt64
    compare_objects : UInt64
  end

  IComponentData_GUID = "955ab28a-5218-11d0-a985-00c04fd8d565"
  IID_IComponentData = LibC::GUID.new(0x955ab28a_u32, 0x5218_u16, 0x11d0_u16, StaticArray[0xa9_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IComponentData
    lpVtbl : IComponentDataVTbl*
  end

  struct IComponentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    notify : UInt64
    destroy : UInt64
    query_data_object : UInt64
    get_result_view_type : UInt64
    get_display_info : UInt64
    compare_objects : UInt64
  end

  IComponent_GUID = "43136eb2-d36c-11cf-adbc-00aa00a80033"
  IID_IComponent = LibC::GUID.new(0x43136eb2_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IComponent
    lpVtbl : IComponentVTbl*
  end

  struct IResultDataCompareVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compare : UInt64
  end

  IResultDataCompare_GUID = "e8315a52-7a1a-11d0-a2d2-00c04fd909dd"
  IID_IResultDataCompare = LibC::GUID.new(0xe8315a52_u32, 0x7a1a_u16, 0x11d0_u16, StaticArray[0xa2_u8, 0xd2_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct IResultDataCompare
    lpVtbl : IResultDataCompareVTbl*
  end

  struct IResultOwnerDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    find_item : UInt64
    cache_hint : UInt64
    sort_items : UInt64
  end

  IResultOwnerData_GUID = "9cb396d8-ea83-11d0-aef1-00c04fb6dd2c"
  IID_IResultOwnerData = LibC::GUID.new(0x9cb396d8_u32, 0xea83_u16, 0x11d0_u16, StaticArray[0xae_u8, 0xf1_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xdd_u8, 0x2c_u8])
  struct IResultOwnerData
    lpVtbl : IResultOwnerDataVTbl*
  end

  struct IConsoleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_header : UInt64
    set_toolbar : UInt64
    query_result_view : UInt64
    query_scope_image_list : UInt64
    query_result_image_list : UInt64
    update_all_views : UInt64
    message_box : UInt64
    query_console_verb : UInt64
    select_scope_item : UInt64
    get_main_window : UInt64
    new_window : UInt64
  end

  IConsole_GUID = "43136eb1-d36c-11cf-adbc-00aa00a80033"
  IID_IConsole = LibC::GUID.new(0x43136eb1_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IConsole
    lpVtbl : IConsoleVTbl*
  end

  struct IHeaderCtrlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert_column : UInt64
    delete_column : UInt64
    set_column_text : UInt64
    get_column_text : UInt64
    set_column_width : UInt64
    get_column_width : UInt64
  end

  IHeaderCtrl_GUID = "43136eb3-d36c-11cf-adbc-00aa00a80033"
  IID_IHeaderCtrl = LibC::GUID.new(0x43136eb3_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IHeaderCtrl
    lpVtbl : IHeaderCtrlVTbl*
  end

  struct IContextMenuCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_item : UInt64
  end

  IContextMenuCallback_GUID = "43136eb7-d36c-11cf-adbc-00aa00a80033"
  IID_IContextMenuCallback = LibC::GUID.new(0x43136eb7_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IContextMenuCallback
    lpVtbl : IContextMenuCallbackVTbl*
  end

  struct IContextMenuProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_item : UInt64
    empty_menu_list : UInt64
    add_primary_extension_items : UInt64
    add_third_party_extension_items : UInt64
    show_context_menu : UInt64
  end

  IContextMenuProvider_GUID = "43136eb6-d36c-11cf-adbc-00aa00a80033"
  IID_IContextMenuProvider = LibC::GUID.new(0x43136eb6_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IContextMenuProvider
    lpVtbl : IContextMenuProviderVTbl*
  end

  struct IExtendContextMenuVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_menu_items : UInt64
    command : UInt64
  end

  IExtendContextMenu_GUID = "4f3b7a4f-cfac-11cf-b8e3-00c04fd8d5b0"
  IID_IExtendContextMenu = LibC::GUID.new(0x4f3b7a4f_u32, 0xcfac_u16, 0x11cf_u16, StaticArray[0xb8_u8, 0xe3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0xb0_u8])
  struct IExtendContextMenu
    lpVtbl : IExtendContextMenuVTbl*
  end

  struct IImageListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    image_list_set_icon : UInt64
    image_list_set_strip : UInt64
  end

  IImageList_GUID = "43136eb8-d36c-11cf-adbc-00aa00a80033"
  IID_IImageList = LibC::GUID.new(0x43136eb8_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IImageList
    lpVtbl : IImageListVTbl*
  end

  struct IResultDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert_item : UInt64
    delete_item : UInt64
    find_item_by_l_param : UInt64
    delete_all_rslt_items : UInt64
    set_item : UInt64
    get_item : UInt64
    get_next_item : UInt64
    modify_item_state : UInt64
    modify_view_style : UInt64
    set_view_mode : UInt64
    get_view_mode : UInt64
    update_item : UInt64
    sort : UInt64
    set_desc_bar_text : UInt64
    set_item_count : UInt64
  end

  IResultData_GUID = "31da5fa0-e0eb-11cf-9f21-00aa003ca9f6"
  IID_IResultData = LibC::GUID.new(0x31da5fa0_u32, 0xe0eb_u16, 0x11cf_u16, StaticArray[0x9f_u8, 0x21_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x3c_u8, 0xa9_u8, 0xf6_u8])
  struct IResultData
    lpVtbl : IResultDataVTbl*
  end

  struct IConsoleNameSpaceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert_item : UInt64
    delete_item : UInt64
    set_item : UInt64
    get_item : UInt64
    get_child_item : UInt64
    get_next_item : UInt64
    get_parent_item : UInt64
  end

  IConsoleNameSpace_GUID = "bedeb620-f24d-11cf-8afc-00aa003ca9f6"
  IID_IConsoleNameSpace = LibC::GUID.new(0xbedeb620_u32, 0xf24d_u16, 0x11cf_u16, StaticArray[0x8a_u8, 0xfc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x3c_u8, 0xa9_u8, 0xf6_u8])
  struct IConsoleNameSpace
    lpVtbl : IConsoleNameSpaceVTbl*
  end

  struct IConsoleNameSpace2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert_item : UInt64
    delete_item : UInt64
    set_item : UInt64
    get_item : UInt64
    get_child_item : UInt64
    get_next_item : UInt64
    get_parent_item : UInt64
    expand : UInt64
    add_extension : UInt64
  end

  IConsoleNameSpace2_GUID = "255f18cc-65db-11d1-a7dc-00c04fd8d565"
  IID_IConsoleNameSpace2 = LibC::GUID.new(0x255f18cc_u32, 0x65db_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xdc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IConsoleNameSpace2
    lpVtbl : IConsoleNameSpace2VTbl*
  end

  struct IPropertySheetCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_page : UInt64
    remove_page : UInt64
  end

  IPropertySheetCallback_GUID = "85de64dd-ef21-11cf-a285-00c04fd8dbe6"
  IID_IPropertySheetCallback = LibC::GUID.new(0x85de64dd_u32, 0xef21_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xdb_u8, 0xe6_u8])
  struct IPropertySheetCallback
    lpVtbl : IPropertySheetCallbackVTbl*
  end

  struct IPropertySheetProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_property_sheet : UInt64
    find_property_sheet : UInt64
    add_primary_pages : UInt64
    add_extension_pages : UInt64
    show : UInt64
  end

  IPropertySheetProvider_GUID = "85de64de-ef21-11cf-a285-00c04fd8dbe6"
  IID_IPropertySheetProvider = LibC::GUID.new(0x85de64de_u32, 0xef21_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xdb_u8, 0xe6_u8])
  struct IPropertySheetProvider
    lpVtbl : IPropertySheetProviderVTbl*
  end

  struct IExtendPropertySheetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_property_pages : UInt64
    query_pages_for : UInt64
  end

  IExtendPropertySheet_GUID = "85de64dc-ef21-11cf-a285-00c04fd8dbe6"
  IID_IExtendPropertySheet = LibC::GUID.new(0x85de64dc_u32, 0xef21_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xdb_u8, 0xe6_u8])
  struct IExtendPropertySheet
    lpVtbl : IExtendPropertySheetVTbl*
  end

  struct IControlbarVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
    attach : UInt64
    detach : UInt64
  end

  IControlbar_GUID = "69fb811e-6c1c-11d0-a2cb-00c04fd909dd"
  IID_IControlbar = LibC::GUID.new(0x69fb811e_u32, 0x6c1c_u16, 0x11d0_u16, StaticArray[0xa2_u8, 0xcb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct IControlbar
    lpVtbl : IControlbarVTbl*
  end

  struct IExtendControlbarVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_controlbar : UInt64
    controlbar_notify : UInt64
  end

  IExtendControlbar_GUID = "49506520-6f40-11d0-a98b-00c04fd8d565"
  IID_IExtendControlbar = LibC::GUID.new(0x49506520_u32, 0x6f40_u16, 0x11d0_u16, StaticArray[0xa9_u8, 0x8b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IExtendControlbar
    lpVtbl : IExtendControlbarVTbl*
  end

  struct IToolbarVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_bitmap : UInt64
    add_buttons : UInt64
    insert_button : UInt64
    delete_button : UInt64
    get_button_state : UInt64
    set_button_state : UInt64
  end

  IToolbar_GUID = "43136eb9-d36c-11cf-adbc-00aa00a80033"
  IID_IToolbar = LibC::GUID.new(0x43136eb9_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
  struct IToolbar
    lpVtbl : IToolbarVTbl*
  end

  struct IConsoleVerbVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_verb_state : UInt64
    set_verb_state : UInt64
    set_default_verb : UInt64
    get_default_verb : UInt64
  end

  IConsoleVerb_GUID = "e49f7a60-74af-11d0-a286-00c04fd8fe93"
  IID_IConsoleVerb = LibC::GUID.new(0xe49f7a60_u32, 0x74af_u16, 0x11d0_u16, StaticArray[0xa2_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xfe_u8, 0x93_u8])
  struct IConsoleVerb
    lpVtbl : IConsoleVerbVTbl*
  end

  struct ISnapinAboutVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_snapin_description : UInt64
    get_provider : UInt64
    get_snapin_version : UInt64
    get_snapin_image : UInt64
    get_static_folder_image : UInt64
  end

  ISnapinAbout_GUID = "1245208c-a151-11d0-a7d7-00c04fd909dd"
  IID_ISnapinAbout = LibC::GUID.new(0x1245208c_u32, 0xa151_u16, 0x11d0_u16, StaticArray[0xa7_u8, 0xd7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct ISnapinAbout
    lpVtbl : ISnapinAboutVTbl*
  end

  struct IMenuButtonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_button : UInt64
    set_button : UInt64
    set_button_state : UInt64
  end

  IMenuButton_GUID = "951ed750-d080-11d0-b197-000000000000"
  IID_IMenuButton = LibC::GUID.new(0x951ed750_u32, 0xd080_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x97_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
  struct IMenuButton
    lpVtbl : IMenuButtonVTbl*
  end

  struct ISnapinHelpVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_help_topic : UInt64
  end

  ISnapinHelp_GUID = "a6b15ace-df59-11d0-a7dd-00c04fd909dd"
  IID_ISnapinHelp = LibC::GUID.new(0xa6b15ace_u32, 0xdf59_u16, 0x11d0_u16, StaticArray[0xa7_u8, 0xdd_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct ISnapinHelp
    lpVtbl : ISnapinHelpVTbl*
  end

  struct IExtendPropertySheet2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_property_pages : UInt64
    query_pages_for : UInt64
    get_watermarks : UInt64
  end

  IExtendPropertySheet2_GUID = "b7a87232-4a51-11d1-a7ea-00c04fd909dd"
  IID_IExtendPropertySheet2 = LibC::GUID.new(0xb7a87232_u32, 0x4a51_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xea_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
  struct IExtendPropertySheet2
    lpVtbl : IExtendPropertySheet2VTbl*
  end

  struct IHeaderCtrl2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert_column : UInt64
    delete_column : UInt64
    set_column_text : UInt64
    get_column_text : UInt64
    set_column_width : UInt64
    get_column_width : UInt64
    set_change_time_out : UInt64
    set_column_filter : UInt64
    get_column_filter : UInt64
  end

  IHeaderCtrl2_GUID = "9757abb8-1b32-11d1-a7ce-00c04fd8d565"
  IID_IHeaderCtrl2 = LibC::GUID.new(0x9757abb8_u32, 0x1b32_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xce_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IHeaderCtrl2
    lpVtbl : IHeaderCtrl2VTbl*
  end

  struct ISnapinHelp2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_help_topic : UInt64
    get_linked_topics : UInt64
  end

  ISnapinHelp2_GUID = "4861a010-20f9-11d2-a510-00c04fb6dd2c"
  IID_ISnapinHelp2 = LibC::GUID.new(0x4861a010_u32, 0x20f9_u16, 0x11d2_u16, StaticArray[0xa5_u8, 0x10_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xdd_u8, 0x2c_u8])
  struct ISnapinHelp2
    lpVtbl : ISnapinHelp2VTbl*
  end

  struct IEnumTASKVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumTASK_GUID = "338698b1-5a02-11d1-9fec-00600832db4a"
  IID_IEnumTASK = LibC::GUID.new(0x338698b1_u32, 0x5a02_u16, 0x11d1_u16, StaticArray[0x9f_u8, 0xec_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x32_u8, 0xdb_u8, 0x4a_u8])
  struct IEnumTASK
    lpVtbl : IEnumTASKVTbl*
  end

  struct IExtendTaskPadVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    task_notify : UInt64
    enum_tasks : UInt64
    get_title : UInt64
    get_descriptive_text : UInt64
    get_background : UInt64
    get_list_pad_info : UInt64
  end

  IExtendTaskPad_GUID = "8dee6511-554d-11d1-9fea-00600832db4a"
  IID_IExtendTaskPad = LibC::GUID.new(0x8dee6511_u32, 0x554d_u16, 0x11d1_u16, StaticArray[0x9f_u8, 0xea_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x32_u8, 0xdb_u8, 0x4a_u8])
  struct IExtendTaskPad
    lpVtbl : IExtendTaskPadVTbl*
  end

  struct IConsole2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_header : UInt64
    set_toolbar : UInt64
    query_result_view : UInt64
    query_scope_image_list : UInt64
    query_result_image_list : UInt64
    update_all_views : UInt64
    message_box : UInt64
    query_console_verb : UInt64
    select_scope_item : UInt64
    get_main_window : UInt64
    new_window : UInt64
    expand : UInt64
    is_taskpad_view_preferred : UInt64
    set_status_text : UInt64
  end

  IConsole2_GUID = "103d842a-aa63-11d1-a7e1-00c04fd8d565"
  IID_IConsole2 = LibC::GUID.new(0x103d842a_u32, 0xaa63_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xe1_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IConsole2
    lpVtbl : IConsole2VTbl*
  end

  struct IDisplayHelpVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    show_topic : UInt64
  end

  IDisplayHelp_GUID = "cc593830-b926-11d1-8063-0000f875a9ce"
  IID_IDisplayHelp = LibC::GUID.new(0xcc593830_u32, 0xb926_u16, 0x11d1_u16, StaticArray[0x80_u8, 0x63_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0xa9_u8, 0xce_u8])
  struct IDisplayHelp
    lpVtbl : IDisplayHelpVTbl*
  end

  struct IRequiredExtensionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enable_all_extensions : UInt64
    get_first_extension : UInt64
    get_next_extension : UInt64
  end

  IRequiredExtensions_GUID = "72782d7a-a4a0-11d1-af0f-00c04fb6dd2c"
  IID_IRequiredExtensions = LibC::GUID.new(0x72782d7a_u32, 0xa4a0_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xdd_u8, 0x2c_u8])
  struct IRequiredExtensions
    lpVtbl : IRequiredExtensionsVTbl*
  end

  struct IStringTableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_string : UInt64
    get_string : UInt64
    get_string_length : UInt64
    delete_string : UInt64
    delete_all_strings : UInt64
    find_string : UInt64
    enumerate : UInt64
  end

  IStringTable_GUID = "de40b7a4-0f65-11d2-8e25-00c04f8ecd78"
  IID_IStringTable = LibC::GUID.new(0xde40b7a4_u32, 0xf65_u16, 0x11d2_u16, StaticArray[0x8e_u8, 0x25_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])
  struct IStringTable
    lpVtbl : IStringTableVTbl*
  end

  struct IColumnDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_column_config_data : UInt64
    get_column_config_data : UInt64
    set_column_sort_data : UInt64
    get_column_sort_data : UInt64
  end

  IColumnData_GUID = "547c1354-024d-11d3-a707-00c04f8ef4cb"
  IID_IColumnData = LibC::GUID.new(0x547c1354_u32, 0x24d_u16, 0x11d3_u16, StaticArray[0xa7_u8, 0x7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf4_u8, 0xcb_u8])
  struct IColumnData
    lpVtbl : IColumnDataVTbl*
  end

  struct IMessageViewVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_title_text : UInt64
    set_body_text : UInt64
    set_icon : UInt64
    clear : UInt64
  end

  IMessageView_GUID = "80f94174-fccc-11d2-b991-00c04f8ecd78"
  IID_IMessageView = LibC::GUID.new(0x80f94174_u32, 0xfccc_u16, 0x11d2_u16, StaticArray[0xb9_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])
  struct IMessageView
    lpVtbl : IMessageViewVTbl*
  end

  struct IResultDataCompareExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compare : UInt64
  end

  IResultDataCompareEx_GUID = "96933476-0251-11d3-aeb0-00c04f8ecd78"
  IID_IResultDataCompareEx = LibC::GUID.new(0x96933476_u32, 0x251_u16, 0x11d3_u16, StaticArray[0xae_u8, 0xb0_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])
  struct IResultDataCompareEx
    lpVtbl : IResultDataCompareExVTbl*
  end

  struct IComponentData2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    create_component : UInt64
    notify : UInt64
    destroy : UInt64
    query_data_object : UInt64
    get_display_info : UInt64
    compare_objects : UInt64
    query_dispatch : UInt64
  end

  IComponentData2_GUID = "cca0f2d2-82de-41b5-bf47-3b2076273d5c"
  IID_IComponentData2 = LibC::GUID.new(0xcca0f2d2_u32, 0x82de_u16, 0x41b5_u16, StaticArray[0xbf_u8, 0x47_u8, 0x3b_u8, 0x20_u8, 0x76_u8, 0x27_u8, 0x3d_u8, 0x5c_u8])
  struct IComponentData2
    lpVtbl : IComponentData2VTbl*
  end

  struct IComponent2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    notify : UInt64
    destroy : UInt64
    query_data_object : UInt64
    get_result_view_type : UInt64
    get_display_info : UInt64
    compare_objects : UInt64
    query_dispatch : UInt64
    get_result_view_type2 : UInt64
    restore_result_view : UInt64
  end

  IComponent2_GUID = "79a2d615-4a10-4ed4-8c65-8633f9335095"
  IID_IComponent2 = LibC::GUID.new(0x79a2d615_u32, 0x4a10_u16, 0x4ed4_u16, StaticArray[0x8c_u8, 0x65_u8, 0x86_u8, 0x33_u8, 0xf9_u8, 0x33_u8, 0x50_u8, 0x95_u8])
  struct IComponent2
    lpVtbl : IComponent2VTbl*
  end

  struct IContextMenuCallback2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_item : UInt64
  end

  IContextMenuCallback2_GUID = "e178bc0e-2ed0-4b5e-8097-42c9087e8b33"
  IID_IContextMenuCallback2 = LibC::GUID.new(0xe178bc0e_u32, 0x2ed0_u16, 0x4b5e_u16, StaticArray[0x80_u8, 0x97_u8, 0x42_u8, 0xc9_u8, 0x8_u8, 0x7e_u8, 0x8b_u8, 0x33_u8])
  struct IContextMenuCallback2
    lpVtbl : IContextMenuCallback2VTbl*
  end

  struct IMMCVersionInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_mmc_version : UInt64
  end

  IMMCVersionInfo_GUID = "a8d2c5fe-cdcb-4b9d-bde5-a27343ff54bc"
  IID_IMMCVersionInfo = LibC::GUID.new(0xa8d2c5fe_u32, 0xcdcb_u16, 0x4b9d_u16, StaticArray[0xbd_u8, 0xe5_u8, 0xa2_u8, 0x73_u8, 0x43_u8, 0xff_u8, 0x54_u8, 0xbc_u8])
  struct IMMCVersionInfo
    lpVtbl : IMMCVersionInfoVTbl*
  end

  struct IExtendViewVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_views : UInt64
  end

  IExtendView_GUID = "89995cee-d2ed-4c0e-ae5e-df7e76f3fa53"
  IID_IExtendView = LibC::GUID.new(0x89995cee_u32, 0xd2ed_u16, 0x4c0e_u16, StaticArray[0xae_u8, 0x5e_u8, 0xdf_u8, 0x7e_u8, 0x76_u8, 0xf3_u8, 0xfa_u8, 0x53_u8])
  struct IExtendView
    lpVtbl : IExtendViewVTbl*
  end

  struct IViewExtensionCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_view : UInt64
  end

  IViewExtensionCallback_GUID = "34dd928a-7599-41e5-9f5e-d6bc3062c2da"
  IID_IViewExtensionCallback = LibC::GUID.new(0x34dd928a_u32, 0x7599_u16, 0x41e5_u16, StaticArray[0x9f_u8, 0x5e_u8, 0xd6_u8, 0xbc_u8, 0x30_u8, 0x62_u8, 0xc2_u8, 0xda_u8])
  struct IViewExtensionCallback
    lpVtbl : IViewExtensionCallbackVTbl*
  end

  struct IConsolePowerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_execution_state : UInt64
    reset_idle_timer : UInt64
  end

  IConsolePower_GUID = "1cfbdd0e-62ca-49ce-a3af-dbb2de61b068"
  IID_IConsolePower = LibC::GUID.new(0x1cfbdd0e_u32, 0x62ca_u16, 0x49ce_u16, StaticArray[0xa3_u8, 0xaf_u8, 0xdb_u8, 0xb2_u8, 0xde_u8, 0x61_u8, 0xb0_u8, 0x68_u8])
  struct IConsolePower
    lpVtbl : IConsolePowerVTbl*
  end

  struct IConsolePowerSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_power_broadcast : UInt64
  end

  IConsolePowerSink_GUID = "3333759f-fe4f-4975-b143-fec0a5dd6d65"
  IID_IConsolePowerSink = LibC::GUID.new(0x3333759f_u32, 0xfe4f_u16, 0x4975_u16, StaticArray[0xb1_u8, 0x43_u8, 0xfe_u8, 0xc0_u8, 0xa5_u8, 0xdd_u8, 0x6d_u8, 0x65_u8])
  struct IConsolePowerSink
    lpVtbl : IConsolePowerSinkVTbl*
  end

  struct INodePropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property : UInt64
  end

  INodeProperties_GUID = "15bc4d24-a522-4406-aa55-0749537a6865"
  IID_INodeProperties = LibC::GUID.new(0x15bc4d24_u32, 0xa522_u16, 0x4406_u16, StaticArray[0xaa_u8, 0x55_u8, 0x7_u8, 0x49_u8, 0x53_u8, 0x7a_u8, 0x68_u8, 0x65_u8])
  struct INodeProperties
    lpVtbl : INodePropertiesVTbl*
  end

  struct IConsole3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_header : UInt64
    set_toolbar : UInt64
    query_result_view : UInt64
    query_scope_image_list : UInt64
    query_result_image_list : UInt64
    update_all_views : UInt64
    message_box : UInt64
    query_console_verb : UInt64
    select_scope_item : UInt64
    get_main_window : UInt64
    new_window : UInt64
    expand : UInt64
    is_taskpad_view_preferred : UInt64
    set_status_text : UInt64
    rename_scope_item : UInt64
  end

  IConsole3_GUID = "4f85efdb-d0e1-498c-8d4a-d010dfdd404f"
  IID_IConsole3 = LibC::GUID.new(0x4f85efdb_u32, 0xd0e1_u16, 0x498c_u16, StaticArray[0x8d_u8, 0x4a_u8, 0xd0_u8, 0x10_u8, 0xdf_u8, 0xdd_u8, 0x40_u8, 0x4f_u8])
  struct IConsole3
    lpVtbl : IConsole3VTbl*
  end

  struct IResultData2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert_item : UInt64
    delete_item : UInt64
    find_item_by_l_param : UInt64
    delete_all_rslt_items : UInt64
    set_item : UInt64
    get_item : UInt64
    get_next_item : UInt64
    modify_item_state : UInt64
    modify_view_style : UInt64
    set_view_mode : UInt64
    get_view_mode : UInt64
    update_item : UInt64
    sort : UInt64
    set_desc_bar_text : UInt64
    set_item_count : UInt64
    rename_result_item : UInt64
  end

  IResultData2_GUID = "0f36e0eb-a7f1-4a81-be5a-9247f7de4b1b"
  IID_IResultData2 = LibC::GUID.new(0xf36e0eb_u32, 0xa7f1_u16, 0x4a81_u16, StaticArray[0xbe_u8, 0x5a_u8, 0x92_u8, 0x47_u8, 0xf7_u8, 0xde_u8, 0x4b_u8, 0x1b_u8])
  struct IResultData2
    lpVtbl : IResultData2VTbl*
  end

end
struct LibWin32::ISnapinProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pproperties : Properties) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(Properties, HRESULT)).call(pproperties)
  end
  def query_property_names(pcallback : ISnapinPropertiesCallback) : HRESULT
    @lpVtbl.value.query_property_names.unsafe_as(Proc(ISnapinPropertiesCallback, HRESULT)).call(pcallback)
  end
  def properties_changed(cproperties : Int32, pproperties : MMC_SNAPIN_PROPERTY*) : HRESULT
    @lpVtbl.value.properties_changed.unsafe_as(Proc(Int32, MMC_SNAPIN_PROPERTY*, HRESULT)).call(cproperties, pproperties)
  end
end
struct LibWin32::ISnapinPropertiesCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_property_name(pszpropname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.add_property_name.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszpropname, dwflags)
  end
end
struct LibWin32::IApplication
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def help : Void
    @lpVtbl.value.help.unsafe_as(Proc(Void)).call
  end
  def quit : Void
    @lpVtbl.value.quit.unsafe_as(Proc(Void)).call
  end
  def get_document(document : Document*) : HRESULT
    @lpVtbl.value.get_document.unsafe_as(Proc(Document*, HRESULT)).call(document)
  end
  def load(filename : UInt8*) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(UInt8*, HRESULT)).call(filename)
  end
  def get_frame(frame : Frame*) : HRESULT
    @lpVtbl.value.get_frame.unsafe_as(Proc(Frame*, HRESULT)).call(frame)
  end
  def get_visible(visible : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_visible.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(visible)
  end
  def show : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(HRESULT)).call
  end
  def hide : HRESULT
    @lpVtbl.value.hide.unsafe_as(Proc(HRESULT)).call
  end
  def get_user_control(usercontrol : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_control.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(usercontrol)
  end
  def put_user_control(usercontrol : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_user_control.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(usercontrol)
  end
  def get_version_major(versionmajor : Int32*) : HRESULT
    @lpVtbl.value.get_version_major.unsafe_as(Proc(Int32*, HRESULT)).call(versionmajor)
  end
  def get_version_minor(versionminor : Int32*) : HRESULT
    @lpVtbl.value.get_version_minor.unsafe_as(Proc(Int32*, HRESULT)).call(versionminor)
  end
end
struct LibWin32::IAppEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_quit(application : Application) : HRESULT
    @lpVtbl.value.on_quit.unsafe_as(Proc(Application, HRESULT)).call(application)
  end
  def on_document_open(document : Document, new : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_document_open.unsafe_as(Proc(Document, LibC::BOOL, HRESULT)).call(document, new)
  end
  def on_document_close(document : Document) : HRESULT
    @lpVtbl.value.on_document_close.unsafe_as(Proc(Document, HRESULT)).call(document)
  end
  def on_snap_in_added(document : Document, snapin : SnapIn) : HRESULT
    @lpVtbl.value.on_snap_in_added.unsafe_as(Proc(Document, SnapIn, HRESULT)).call(document, snapin)
  end
  def on_snap_in_removed(document : Document, snapin : SnapIn) : HRESULT
    @lpVtbl.value.on_snap_in_removed.unsafe_as(Proc(Document, SnapIn, HRESULT)).call(document, snapin)
  end
  def on_new_view(view : View) : HRESULT
    @lpVtbl.value.on_new_view.unsafe_as(Proc(View, HRESULT)).call(view)
  end
  def on_view_close(view : View) : HRESULT
    @lpVtbl.value.on_view_close.unsafe_as(Proc(View, HRESULT)).call(view)
  end
  def on_view_change(view : View, newownernode : Node) : HRESULT
    @lpVtbl.value.on_view_change.unsafe_as(Proc(View, Node, HRESULT)).call(view, newownernode)
  end
  def on_selection_change(view : View, newnodes : Nodes) : HRESULT
    @lpVtbl.value.on_selection_change.unsafe_as(Proc(View, Nodes, HRESULT)).call(view, newnodes)
  end
  def on_context_menu_executed(menuitem : MenuItem) : HRESULT
    @lpVtbl.value.on_context_menu_executed.unsafe_as(Proc(MenuItem, HRESULT)).call(menuitem)
  end
  def on_toolbar_button_clicked : HRESULT
    @lpVtbl.value.on_toolbar_button_clicked.unsafe_as(Proc(HRESULT)).call
  end
  def on_list_updated(view : View) : HRESULT
    @lpVtbl.value.on_list_updated.unsafe_as(Proc(View, HRESULT)).call(view)
  end
end
struct LibWin32::AppEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IEventConnector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connect_to(application : Application) : HRESULT
    @lpVtbl.value.connect_to.unsafe_as(Proc(Application, HRESULT)).call(application)
  end
  def disconnect : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::Frame
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def maximize : HRESULT
    @lpVtbl.value.maximize.unsafe_as(Proc(HRESULT)).call
  end
  def minimize : HRESULT
    @lpVtbl.value.minimize.unsafe_as(Proc(HRESULT)).call
  end
  def restore : HRESULT
    @lpVtbl.value.restore.unsafe_as(Proc(HRESULT)).call
  end
  def get_top(top : Int32*) : HRESULT
    @lpVtbl.value.get_top.unsafe_as(Proc(Int32*, HRESULT)).call(top)
  end
  def put_top(top : Int32) : HRESULT
    @lpVtbl.value.put_top.unsafe_as(Proc(Int32, HRESULT)).call(top)
  end
  def get_bottom(bottom : Int32*) : HRESULT
    @lpVtbl.value.get_bottom.unsafe_as(Proc(Int32*, HRESULT)).call(bottom)
  end
  def put_bottom(bottom : Int32) : HRESULT
    @lpVtbl.value.put_bottom.unsafe_as(Proc(Int32, HRESULT)).call(bottom)
  end
  def get_left(left : Int32*) : HRESULT
    @lpVtbl.value.get_left.unsafe_as(Proc(Int32*, HRESULT)).call(left)
  end
  def put_left(left : Int32) : HRESULT
    @lpVtbl.value.put_left.unsafe_as(Proc(Int32, HRESULT)).call(left)
  end
  def get_right(right : Int32*) : HRESULT
    @lpVtbl.value.get_right.unsafe_as(Proc(Int32*, HRESULT)).call(right)
  end
  def put_right(right : Int32) : HRESULT
    @lpVtbl.value.put_right.unsafe_as(Proc(Int32, HRESULT)).call(right)
  end
end
struct LibWin32::Node
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt16**, HRESULT)).call(name)
  end
  def get_property(propertyname : UInt8*, propertyvalue : UInt16**) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt8*, UInt16**, HRESULT)).call(propertyname, propertyvalue)
  end
  def get_bookmark(bookmark : UInt16**) : HRESULT
    @lpVtbl.value.get_bookmark.unsafe_as(Proc(UInt16**, HRESULT)).call(bookmark)
  end
  def is_scope_node(isscopenode : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_scope_node.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(isscopenode)
  end
  def get_nodetype(nodetype : UInt16**) : HRESULT
    @lpVtbl.value.get_nodetype.unsafe_as(Proc(UInt16**, HRESULT)).call(nodetype)
  end
end
struct LibWin32::ScopeNamespace
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_parent(node : Node, parent : Node*) : HRESULT
    @lpVtbl.value.get_parent.unsafe_as(Proc(Node, Node*, HRESULT)).call(node, parent)
  end
  def get_child(node : Node, child : Node*) : HRESULT
    @lpVtbl.value.get_child.unsafe_as(Proc(Node, Node*, HRESULT)).call(node, child)
  end
  def get_next(node : Node, next : Node*) : HRESULT
    @lpVtbl.value.get_next.unsafe_as(Proc(Node, Node*, HRESULT)).call(node, next)
  end
  def get_root(root : Node*) : HRESULT
    @lpVtbl.value.get_root.unsafe_as(Proc(Node*, HRESULT)).call(root)
  end
  def expand(node : Node) : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(Node, HRESULT)).call(node)
  end
end
struct LibWin32::Document
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def save_as(filename : UInt8*) : HRESULT
    @lpVtbl.value.save_as.unsafe_as(Proc(UInt8*, HRESULT)).call(filename)
  end
  def close(savechanges : LibC::BOOL) : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(savechanges)
  end
  def get_views(views : Views*) : HRESULT
    @lpVtbl.value.get_views.unsafe_as(Proc(Views*, HRESULT)).call(views)
  end
  def get_snap_ins(snapins : SnapIns*) : HRESULT
    @lpVtbl.value.get_snap_ins.unsafe_as(Proc(SnapIns*, HRESULT)).call(snapins)
  end
  def get_active_view(view : View*) : HRESULT
    @lpVtbl.value.get_active_view.unsafe_as(Proc(View*, HRESULT)).call(view)
  end
  def get_name(name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt16**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_location(location : UInt16**) : HRESULT
    @lpVtbl.value.get_location.unsafe_as(Proc(UInt16**, HRESULT)).call(location)
  end
  def get_is_saved(issaved : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_saved.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(issaved)
  end
  def get_mode(mode : DocumentMode*) : HRESULT
    @lpVtbl.value.get_mode.unsafe_as(Proc(DocumentMode*, HRESULT)).call(mode)
  end
  def put_mode(mode : DocumentMode) : HRESULT
    @lpVtbl.value.put_mode.unsafe_as(Proc(DocumentMode, HRESULT)).call(mode)
  end
  def get_root_node(node : Node*) : HRESULT
    @lpVtbl.value.get_root_node.unsafe_as(Proc(Node*, HRESULT)).call(node)
  end
  def get_scope_namespace(scopenamespace : ScopeNamespace*) : HRESULT
    @lpVtbl.value.get_scope_namespace.unsafe_as(Proc(ScopeNamespace*, HRESULT)).call(scopenamespace)
  end
  def create_properties(properties : Properties*) : HRESULT
    @lpVtbl.value.create_properties.unsafe_as(Proc(Properties*, HRESULT)).call(properties)
  end
  def get_application(application : Application*) : HRESULT
    @lpVtbl.value.get_application.unsafe_as(Proc(Application*, HRESULT)).call(application)
  end
end
struct LibWin32::SnapIn
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt16**, HRESULT)).call(name)
  end
  def get_vendor(vendor : UInt16**) : HRESULT
    @lpVtbl.value.get_vendor.unsafe_as(Proc(UInt16**, HRESULT)).call(vendor)
  end
  def get_version(version : UInt16**) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt16**, HRESULT)).call(version)
  end
  def get_extensions(extensions : Extensions*) : HRESULT
    @lpVtbl.value.get_extensions.unsafe_as(Proc(Extensions*, HRESULT)).call(extensions)
  end
  def get_snapin_clsid(snapinclsid : UInt16**) : HRESULT
    @lpVtbl.value.get_snapin_clsid.unsafe_as(Proc(UInt16**, HRESULT)).call(snapinclsid)
  end
  def get_properties(properties : Properties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(Properties*, HRESULT)).call(properties)
  end
  def enable_all_extensions(enable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_all_extensions.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(enable)
  end
end
struct LibWin32::SnapIns
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def item(index : Int32, snapin : SnapIn*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, SnapIn*, HRESULT)).call(index, snapin)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def add(snapinnameorclsid : UInt8*, parentsnapin : VARIANT, properties : VARIANT, snapin : SnapIn*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, VARIANT, VARIANT, SnapIn*, HRESULT)).call(snapinnameorclsid, parentsnapin, properties, snapin)
  end
  def remove(snapin : SnapIn) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(SnapIn, HRESULT)).call(snapin)
  end
end
struct LibWin32::Extension
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt16**, HRESULT)).call(name)
  end
  def get_vendor(vendor : UInt16**) : HRESULT
    @lpVtbl.value.get_vendor.unsafe_as(Proc(UInt16**, HRESULT)).call(vendor)
  end
  def get_version(version : UInt16**) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt16**, HRESULT)).call(version)
  end
  def get_extensions(extensions : Extensions*) : HRESULT
    @lpVtbl.value.get_extensions.unsafe_as(Proc(Extensions*, HRESULT)).call(extensions)
  end
  def get_snapin_clsid(snapinclsid : UInt16**) : HRESULT
    @lpVtbl.value.get_snapin_clsid.unsafe_as(Proc(UInt16**, HRESULT)).call(snapinclsid)
  end
  def enable_all_extensions(enable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_all_extensions.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(enable)
  end
  def enable(enable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(enable)
  end
end
struct LibWin32::Extensions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def item(index : Int32, extension : Extension*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, Extension*, HRESULT)).call(index, extension)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
end
struct LibWin32::Columns
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def item(index : Int32, column : Column*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, Column*, HRESULT)).call(index, column)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
end
struct LibWin32::Column
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def name(name : UInt8**) : HRESULT
    @lpVtbl.value.name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_width(width : Int32*) : HRESULT
    @lpVtbl.value.get_width.unsafe_as(Proc(Int32*, HRESULT)).call(width)
  end
  def put_width(width : Int32) : HRESULT
    @lpVtbl.value.put_width.unsafe_as(Proc(Int32, HRESULT)).call(width)
  end
  def get_display_position(displayposition : Int32*) : HRESULT
    @lpVtbl.value.get_display_position.unsafe_as(Proc(Int32*, HRESULT)).call(displayposition)
  end
  def put_display_position(index : Int32) : HRESULT
    @lpVtbl.value.put_display_position.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def get_hidden(hidden : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_hidden.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(hidden)
  end
  def put_hidden(hidden : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_hidden.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(hidden)
  end
  def set_as_sort_column(sortorder : ColumnSortOrder) : HRESULT
    @lpVtbl.value.set_as_sort_column.unsafe_as(Proc(ColumnSortOrder, HRESULT)).call(sortorder)
  end
  def is_sort_column(issortcolumn : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_sort_column.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(issortcolumn)
  end
end
struct LibWin32::Views
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def item(index : Int32, view : View*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, View*, HRESULT)).call(index, view)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def add(node : Node, viewoptions : ViewOptions) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(Node, ViewOptions, HRESULT)).call(node, viewoptions)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
end
struct LibWin32::View
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_active_scope_node(node : Node*) : HRESULT
    @lpVtbl.value.get_active_scope_node.unsafe_as(Proc(Node*, HRESULT)).call(node)
  end
  def put_active_scope_node(node : Node) : HRESULT
    @lpVtbl.value.put_active_scope_node.unsafe_as(Proc(Node, HRESULT)).call(node)
  end
  def get_selection(nodes : Nodes*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(Nodes*, HRESULT)).call(nodes)
  end
  def get_list_items(nodes : Nodes*) : HRESULT
    @lpVtbl.value.get_list_items.unsafe_as(Proc(Nodes*, HRESULT)).call(nodes)
  end
  def snapin_scope_object(scopenode : VARIANT, scopenodeobject : IDispatch*) : HRESULT
    @lpVtbl.value.snapin_scope_object.unsafe_as(Proc(VARIANT, IDispatch*, HRESULT)).call(scopenode, scopenodeobject)
  end
  def snapin_selection_object(selectionobject : IDispatch*) : HRESULT
    @lpVtbl.value.snapin_selection_object.unsafe_as(Proc(IDispatch*, HRESULT)).call(selectionobject)
  end
  def is(view : View, thesame : Int16*) : HRESULT
    @lpVtbl.value.is.unsafe_as(Proc(View, Int16*, HRESULT)).call(view, thesame)
  end
  def get_document(document : Document*) : HRESULT
    @lpVtbl.value.get_document.unsafe_as(Proc(Document*, HRESULT)).call(document)
  end
  def select_all : HRESULT
    @lpVtbl.value.select_all.unsafe_as(Proc(HRESULT)).call
  end
  def select(node : Node) : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(Node, HRESULT)).call(node)
  end
  def deselect(node : Node) : HRESULT
    @lpVtbl.value.deselect.unsafe_as(Proc(Node, HRESULT)).call(node)
  end
  def is_selected(node : Node, isselected : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_selected.unsafe_as(Proc(Node, LibC::BOOL*, HRESULT)).call(node, isselected)
  end
  def display_scope_node_property_sheet(scopenode : VARIANT) : HRESULT
    @lpVtbl.value.display_scope_node_property_sheet.unsafe_as(Proc(VARIANT, HRESULT)).call(scopenode)
  end
  def display_selection_property_sheet : HRESULT
    @lpVtbl.value.display_selection_property_sheet.unsafe_as(Proc(HRESULT)).call
  end
  def copy_scope_node(scopenode : VARIANT) : HRESULT
    @lpVtbl.value.copy_scope_node.unsafe_as(Proc(VARIANT, HRESULT)).call(scopenode)
  end
  def copy_selection : HRESULT
    @lpVtbl.value.copy_selection.unsafe_as(Proc(HRESULT)).call
  end
  def delete_scope_node(scopenode : VARIANT) : HRESULT
    @lpVtbl.value.delete_scope_node.unsafe_as(Proc(VARIANT, HRESULT)).call(scopenode)
  end
  def delete_selection : HRESULT
    @lpVtbl.value.delete_selection.unsafe_as(Proc(HRESULT)).call
  end
  def rename_scope_node(newname : UInt8*, scopenode : VARIANT) : HRESULT
    @lpVtbl.value.rename_scope_node.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(newname, scopenode)
  end
  def rename_selected_item(newname : UInt8*) : HRESULT
    @lpVtbl.value.rename_selected_item.unsafe_as(Proc(UInt8*, HRESULT)).call(newname)
  end
  def get_scope_node_context_menu(scopenode : VARIANT, contextmenu : ContextMenu*) : HRESULT
    @lpVtbl.value.get_scope_node_context_menu.unsafe_as(Proc(VARIANT, ContextMenu*, HRESULT)).call(scopenode, contextmenu)
  end
  def get_selection_context_menu(contextmenu : ContextMenu*) : HRESULT
    @lpVtbl.value.get_selection_context_menu.unsafe_as(Proc(ContextMenu*, HRESULT)).call(contextmenu)
  end
  def refresh_scope_node(scopenode : VARIANT) : HRESULT
    @lpVtbl.value.refresh_scope_node.unsafe_as(Proc(VARIANT, HRESULT)).call(scopenode)
  end
  def refresh_selection : HRESULT
    @lpVtbl.value.refresh_selection.unsafe_as(Proc(HRESULT)).call
  end
  def execute_selection_menu_item(menuitempath : UInt8*) : HRESULT
    @lpVtbl.value.execute_selection_menu_item.unsafe_as(Proc(UInt8*, HRESULT)).call(menuitempath)
  end
  def execute_scope_node_menu_item(menuitempath : UInt8*, scopenode : VARIANT) : HRESULT
    @lpVtbl.value.execute_scope_node_menu_item.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(menuitempath, scopenode)
  end
  def execute_shell_command(command : UInt8*, directory : UInt8*, parameters : UInt8*, windowstate : UInt8*) : HRESULT
    @lpVtbl.value.execute_shell_command.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)).call(command, directory, parameters, windowstate)
  end
  def get_frame(frame : Frame*) : HRESULT
    @lpVtbl.value.get_frame.unsafe_as(Proc(Frame*, HRESULT)).call(frame)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def get_scope_tree_visible(visible : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_scope_tree_visible.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(visible)
  end
  def put_scope_tree_visible(visible : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_scope_tree_visible.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(visible)
  end
  def back : HRESULT
    @lpVtbl.value.back.unsafe_as(Proc(HRESULT)).call
  end
  def forward : HRESULT
    @lpVtbl.value.forward.unsafe_as(Proc(HRESULT)).call
  end
  def put_status_bar_text(statusbartext : UInt8*) : HRESULT
    @lpVtbl.value.put_status_bar_text.unsafe_as(Proc(UInt8*, HRESULT)).call(statusbartext)
  end
  def get_memento(memento : UInt16**) : HRESULT
    @lpVtbl.value.get_memento.unsafe_as(Proc(UInt16**, HRESULT)).call(memento)
  end
  def view_memento(memento : UInt8*) : HRESULT
    @lpVtbl.value.view_memento.unsafe_as(Proc(UInt8*, HRESULT)).call(memento)
  end
  def get_columns(columns : Columns*) : HRESULT
    @lpVtbl.value.get_columns.unsafe_as(Proc(Columns*, HRESULT)).call(columns)
  end
  def get_cell_contents(node : Node, column : Int32, cellcontents : UInt16**) : HRESULT
    @lpVtbl.value.get_cell_contents.unsafe_as(Proc(Node, Int32, UInt16**, HRESULT)).call(node, column, cellcontents)
  end
  def export_list(file : UInt8*, exportoptions : ExportListOptions) : HRESULT
    @lpVtbl.value.export_list.unsafe_as(Proc(UInt8*, ExportListOptions, HRESULT)).call(file, exportoptions)
  end
  def get_list_view_mode(mode : ListViewMode*) : HRESULT
    @lpVtbl.value.get_list_view_mode.unsafe_as(Proc(ListViewMode*, HRESULT)).call(mode)
  end
  def put_list_view_mode(mode : ListViewMode) : HRESULT
    @lpVtbl.value.put_list_view_mode.unsafe_as(Proc(ListViewMode, HRESULT)).call(mode)
  end
  def get_control_object(control : IDispatch*) : HRESULT
    @lpVtbl.value.get_control_object.unsafe_as(Proc(IDispatch*, HRESULT)).call(control)
  end
end
struct LibWin32::Nodes
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def item(index : Int32, node : Node*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, Node*, HRESULT)).call(index, node)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
end
struct LibWin32::ContextMenu
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_item(indexorpath : VARIANT, menuitem : MenuItem*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, MenuItem*, HRESULT)).call(indexorpath, menuitem)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
end
struct LibWin32::MenuItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(displayname : UInt16**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt16**, HRESULT)).call(displayname)
  end
  def get_language_independent_name(languageindependentname : UInt16**) : HRESULT
    @lpVtbl.value.get_language_independent_name.unsafe_as(Proc(UInt16**, HRESULT)).call(languageindependentname)
  end
  def get_path(path : UInt16**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt16**, HRESULT)).call(path)
  end
  def get_language_independent_path(languageindependentpath : UInt16**) : HRESULT
    @lpVtbl.value.get_language_independent_path.unsafe_as(Proc(UInt16**, HRESULT)).call(languageindependentpath)
  end
  def execute : HRESULT
    @lpVtbl.value.execute.unsafe_as(Proc(HRESULT)).call
  end
  def get_enabled(enabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(enabled)
  end
end
struct LibWin32::Properties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def item(name : UInt8*, property : Property*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(UInt8*, Property*, HRESULT)).call(name, property)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def remove(name : UInt8*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
end
struct LibWin32::Property
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_value(value : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(value)
  end
  def put_value(value : VARIANT) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(VARIANT, HRESULT)).call(value)
  end
  def get_name(name : UInt16**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt16**, HRESULT)).call(name)
  end
end
struct LibWin32::IComponentData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(punknown : IUnknown) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IUnknown, HRESULT)).call(punknown)
  end
  def create_component(ppcomponent : IComponent*) : HRESULT
    @lpVtbl.value.create_component.unsafe_as(Proc(IComponent*, HRESULT)).call(ppcomponent)
  end
  def notify(lpdataobject : IDataObject, event : MMC_NOTIFY_TYPE, arg : LPARAM, param3 : LPARAM) : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)).call(lpdataobject, event, arg, param3)
  end
  def destroy : HRESULT
    @lpVtbl.value.destroy.unsafe_as(Proc(HRESULT)).call
  end
  def query_data_object(cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.query_data_object.unsafe_as(Proc(LibC::IntPtrT, DATA_OBJECT_TYPES, IDataObject*, HRESULT)).call(cookie, type, ppdataobject)
  end
  def get_display_info(pscopedataitem : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.get_display_info.unsafe_as(Proc(SCOPEDATAITEM*, HRESULT)).call(pscopedataitem)
  end
  def compare_objects(lpdataobjecta : IDataObject, lpdataobjectb : IDataObject) : HRESULT
    @lpVtbl.value.compare_objects.unsafe_as(Proc(IDataObject, IDataObject, HRESULT)).call(lpdataobjecta, lpdataobjectb)
  end
end
struct LibWin32::IComponent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(lpconsole : IConsole) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IConsole, HRESULT)).call(lpconsole)
  end
  def notify(lpdataobject : IDataObject, event : MMC_NOTIFY_TYPE, arg : LPARAM, param3 : LPARAM) : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)).call(lpdataobject, event, arg, param3)
  end
  def destroy(cookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.destroy.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(cookie)
  end
  def query_data_object(cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.query_data_object.unsafe_as(Proc(LibC::IntPtrT, DATA_OBJECT_TYPES, IDataObject*, HRESULT)).call(cookie, type, ppdataobject)
  end
  def get_result_view_type(cookie : LibC::IntPtrT, ppviewtype : LibC::LPWSTR*, pviewoptions : Int32*) : HRESULT
    @lpVtbl.value.get_result_view_type.unsafe_as(Proc(LibC::IntPtrT, LibC::LPWSTR*, Int32*, HRESULT)).call(cookie, ppviewtype, pviewoptions)
  end
  def get_display_info(presultdataitem : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_display_info.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(presultdataitem)
  end
  def compare_objects(lpdataobjecta : IDataObject, lpdataobjectb : IDataObject) : HRESULT
    @lpVtbl.value.compare_objects.unsafe_as(Proc(IDataObject, IDataObject, HRESULT)).call(lpdataobjecta, lpdataobjectb)
  end
end
struct LibWin32::IResultDataCompare
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compare(luserparam : LPARAM, cookiea : LibC::IntPtrT, cookieb : LibC::IntPtrT, pnresult : Int32*) : HRESULT
    @lpVtbl.value.compare.unsafe_as(Proc(LPARAM, LibC::IntPtrT, LibC::IntPtrT, Int32*, HRESULT)).call(luserparam, cookiea, cookieb, pnresult)
  end
end
struct LibWin32::IResultOwnerData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def find_item(pfindinfo : RESULTFINDINFO*, pnfoundindex : Int32*) : HRESULT
    @lpVtbl.value.find_item.unsafe_as(Proc(RESULTFINDINFO*, Int32*, HRESULT)).call(pfindinfo, pnfoundindex)
  end
  def cache_hint(nstartindex : Int32, nendindex : Int32) : HRESULT
    @lpVtbl.value.cache_hint.unsafe_as(Proc(Int32, Int32, HRESULT)).call(nstartindex, nendindex)
  end
  def sort_items(ncolumn : Int32, dwsortoptions : UInt32, luserparam : LPARAM) : HRESULT
    @lpVtbl.value.sort_items.unsafe_as(Proc(Int32, UInt32, LPARAM, HRESULT)).call(ncolumn, dwsortoptions, luserparam)
  end
end
struct LibWin32::IConsole
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_header(pheader : IHeaderCtrl) : HRESULT
    @lpVtbl.value.set_header.unsafe_as(Proc(IHeaderCtrl, HRESULT)).call(pheader)
  end
  def set_toolbar(ptoolbar : IToolbar) : HRESULT
    @lpVtbl.value.set_toolbar.unsafe_as(Proc(IToolbar, HRESULT)).call(ptoolbar)
  end
  def query_result_view(punknown : IUnknown*) : HRESULT
    @lpVtbl.value.query_result_view.unsafe_as(Proc(IUnknown*, HRESULT)).call(punknown)
  end
  def query_scope_image_list(ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_scope_image_list.unsafe_as(Proc(IImageList*, HRESULT)).call(ppimagelist)
  end
  def query_result_image_list(ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_result_image_list.unsafe_as(Proc(IImageList*, HRESULT)).call(ppimagelist)
  end
  def update_all_views(lpdataobject : IDataObject, data : LPARAM, hint : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_all_views.unsafe_as(Proc(IDataObject, LPARAM, LibC::IntPtrT, HRESULT)).call(lpdataobject, data, hint)
  end
  def message_box(lpsztext : LibC::LPWSTR, lpsztitle : LibC::LPWSTR, fustyle : UInt32, piretval : Int32*) : HRESULT
    @lpVtbl.value.message_box.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, Int32*, HRESULT)).call(lpsztext, lpsztitle, fustyle, piretval)
  end
  def query_console_verb(ppconsoleverb : IConsoleVerb*) : HRESULT
    @lpVtbl.value.query_console_verb.unsafe_as(Proc(IConsoleVerb*, HRESULT)).call(ppconsoleverb)
  end
  def select_scope_item(hscopeitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.select_scope_item.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(hscopeitem)
  end
  def get_main_window(phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_main_window.unsafe_as(Proc(HANDLE*, HRESULT)).call(phwnd)
  end
  def new_window(hscopeitem : LibC::IntPtrT, loptions : UInt32) : HRESULT
    @lpVtbl.value.new_window.unsafe_as(Proc(LibC::IntPtrT, UInt32, HRESULT)).call(hscopeitem, loptions)
  end
end
struct LibWin32::IHeaderCtrl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert_column(ncol : Int32, title : LibC::LPWSTR, nformat : Int32, nwidth : Int32) : HRESULT
    @lpVtbl.value.insert_column.unsafe_as(Proc(Int32, LibC::LPWSTR, Int32, Int32, HRESULT)).call(ncol, title, nformat, nwidth)
  end
  def delete_column(ncol : Int32) : HRESULT
    @lpVtbl.value.delete_column.unsafe_as(Proc(Int32, HRESULT)).call(ncol)
  end
  def set_column_text(ncol : Int32, title : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_column_text.unsafe_as(Proc(Int32, LibC::LPWSTR, HRESULT)).call(ncol, title)
  end
  def get_column_text(ncol : Int32, ptext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_column_text.unsafe_as(Proc(Int32, LibC::LPWSTR*, HRESULT)).call(ncol, ptext)
  end
  def set_column_width(ncol : Int32, nwidth : Int32) : HRESULT
    @lpVtbl.value.set_column_width.unsafe_as(Proc(Int32, Int32, HRESULT)).call(ncol, nwidth)
  end
  def get_column_width(ncol : Int32, pwidth : Int32*) : HRESULT
    @lpVtbl.value.get_column_width.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(ncol, pwidth)
  end
end
struct LibWin32::IContextMenuCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_item(pitem : CONTEXTMENUITEM*) : HRESULT
    @lpVtbl.value.add_item.unsafe_as(Proc(CONTEXTMENUITEM*, HRESULT)).call(pitem)
  end
end
struct LibWin32::IContextMenuProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_item(pitem : CONTEXTMENUITEM*) : HRESULT
    @lpVtbl.value.add_item.unsafe_as(Proc(CONTEXTMENUITEM*, HRESULT)).call(pitem)
  end
  def empty_menu_list : HRESULT
    @lpVtbl.value.empty_menu_list.unsafe_as(Proc(HRESULT)).call
  end
  def add_primary_extension_items(piextension : IUnknown, pidataobject : IDataObject) : HRESULT
    @lpVtbl.value.add_primary_extension_items.unsafe_as(Proc(IUnknown, IDataObject, HRESULT)).call(piextension, pidataobject)
  end
  def add_third_party_extension_items(pidataobject : IDataObject) : HRESULT
    @lpVtbl.value.add_third_party_extension_items.unsafe_as(Proc(IDataObject, HRESULT)).call(pidataobject)
  end
  def show_context_menu(hwndparent : LibC::HANDLE, xpos : Int32, ypos : Int32, plselected : Int32*) : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(LibC::HANDLE, Int32, Int32, Int32*, HRESULT)).call(hwndparent, xpos, ypos, plselected)
  end
end
struct LibWin32::IExtendContextMenu
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_menu_items(pidataobject : IDataObject, picallback : IContextMenuCallback, pinsertionallowed : Int32*) : HRESULT
    @lpVtbl.value.add_menu_items.unsafe_as(Proc(IDataObject, IContextMenuCallback, Int32*, HRESULT)).call(pidataobject, picallback, pinsertionallowed)
  end
  def command(lcommandid : Int32, pidataobject : IDataObject) : HRESULT
    @lpVtbl.value.command.unsafe_as(Proc(Int32, IDataObject, HRESULT)).call(lcommandid, pidataobject)
  end
end
struct LibWin32::IImageList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def image_list_set_icon(picon : LibC::IntPtrT*, nloc : Int32) : HRESULT
    @lpVtbl.value.image_list_set_icon.unsafe_as(Proc(LibC::IntPtrT*, Int32, HRESULT)).call(picon, nloc)
  end
  def image_list_set_strip(pbmapsm : LibC::IntPtrT*, pbmaplg : LibC::IntPtrT*, nstartloc : Int32, cmask : UInt32) : HRESULT
    @lpVtbl.value.image_list_set_strip.unsafe_as(Proc(LibC::IntPtrT*, LibC::IntPtrT*, Int32, UInt32, HRESULT)).call(pbmapsm, pbmaplg, nstartloc, cmask)
  end
end
struct LibWin32::IResultData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert_item(item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.insert_item.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(item)
  end
  def delete_item(itemid : LibC::IntPtrT, ncol : Int32) : HRESULT
    @lpVtbl.value.delete_item.unsafe_as(Proc(LibC::IntPtrT, Int32, HRESULT)).call(itemid, ncol)
  end
  def find_item_by_l_param(lparam : LPARAM, pitemid : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.find_item_by_l_param.unsafe_as(Proc(LPARAM, LibC::IntPtrT*, HRESULT)).call(lparam, pitemid)
  end
  def delete_all_rslt_items : HRESULT
    @lpVtbl.value.delete_all_rslt_items.unsafe_as(Proc(HRESULT)).call
  end
  def set_item(item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.set_item.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(item)
  end
  def get_item(item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(item)
  end
  def get_next_item(item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_next_item.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(item)
  end
  def modify_item_state(nindex : Int32, itemid : LibC::IntPtrT, uadd : UInt32, uremove : UInt32) : HRESULT
    @lpVtbl.value.modify_item_state.unsafe_as(Proc(Int32, LibC::IntPtrT, UInt32, UInt32, HRESULT)).call(nindex, itemid, uadd, uremove)
  end
  def modify_view_style(add : MMC_RESULT_VIEW_STYLE, remove : MMC_RESULT_VIEW_STYLE) : HRESULT
    @lpVtbl.value.modify_view_style.unsafe_as(Proc(MMC_RESULT_VIEW_STYLE, MMC_RESULT_VIEW_STYLE, HRESULT)).call(add, remove)
  end
  def set_view_mode(lviewmode : Int32) : HRESULT
    @lpVtbl.value.set_view_mode.unsafe_as(Proc(Int32, HRESULT)).call(lviewmode)
  end
  def get_view_mode(lviewmode : Int32*) : HRESULT
    @lpVtbl.value.get_view_mode.unsafe_as(Proc(Int32*, HRESULT)).call(lviewmode)
  end
  def update_item(itemid : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_item.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(itemid)
  end
  def sort(ncolumn : Int32, dwsortoptions : UInt32, luserparam : LPARAM) : HRESULT
    @lpVtbl.value.sort.unsafe_as(Proc(Int32, UInt32, LPARAM, HRESULT)).call(ncolumn, dwsortoptions, luserparam)
  end
  def set_desc_bar_text(desctext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_desc_bar_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(desctext)
  end
  def set_item_count(nitemcount : Int32, dwoptions : UInt32) : HRESULT
    @lpVtbl.value.set_item_count.unsafe_as(Proc(Int32, UInt32, HRESULT)).call(nitemcount, dwoptions)
  end
end
struct LibWin32::IConsoleNameSpace
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert_item(item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.insert_item.unsafe_as(Proc(SCOPEDATAITEM*, HRESULT)).call(item)
  end
  def delete_item(hitem : LibC::IntPtrT, fdeletethis : Int32) : HRESULT
    @lpVtbl.value.delete_item.unsafe_as(Proc(LibC::IntPtrT, Int32, HRESULT)).call(hitem, fdeletethis)
  end
  def set_item(item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.set_item.unsafe_as(Proc(SCOPEDATAITEM*, HRESULT)).call(item)
  end
  def get_item(item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(SCOPEDATAITEM*, HRESULT)).call(item)
  end
  def get_child_item(item : LibC::IntPtrT, pitemchild : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_child_item.unsafe_as(Proc(LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)).call(item, pitemchild, pcookie)
  end
  def get_next_item(item : LibC::IntPtrT, pitemnext : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_next_item.unsafe_as(Proc(LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)).call(item, pitemnext, pcookie)
  end
  def get_parent_item(item : LibC::IntPtrT, pitemparent : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_parent_item.unsafe_as(Proc(LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)).call(item, pitemparent, pcookie)
  end
end
struct LibWin32::IConsoleNameSpace2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert_item(item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.insert_item.unsafe_as(Proc(SCOPEDATAITEM*, HRESULT)).call(item)
  end
  def delete_item(hitem : LibC::IntPtrT, fdeletethis : Int32) : HRESULT
    @lpVtbl.value.delete_item.unsafe_as(Proc(LibC::IntPtrT, Int32, HRESULT)).call(hitem, fdeletethis)
  end
  def set_item(item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.set_item.unsafe_as(Proc(SCOPEDATAITEM*, HRESULT)).call(item)
  end
  def get_item(item : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(SCOPEDATAITEM*, HRESULT)).call(item)
  end
  def get_child_item(item : LibC::IntPtrT, pitemchild : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_child_item.unsafe_as(Proc(LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)).call(item, pitemchild, pcookie)
  end
  def get_next_item(item : LibC::IntPtrT, pitemnext : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_next_item.unsafe_as(Proc(LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)).call(item, pitemnext, pcookie)
  end
  def get_parent_item(item : LibC::IntPtrT, pitemparent : LibC::IntPtrT*, pcookie : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.get_parent_item.unsafe_as(Proc(LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, HRESULT)).call(item, pitemparent, pcookie)
  end
  def expand(hitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(hitem)
  end
  def add_extension(hitem : LibC::IntPtrT, lpclsid : Guid*) : HRESULT
    @lpVtbl.value.add_extension.unsafe_as(Proc(LibC::IntPtrT, Guid*, HRESULT)).call(hitem, lpclsid)
  end
end
struct LibWin32::IPropertySheetCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_page(hpage : HPROPSHEETPAGE) : HRESULT
    @lpVtbl.value.add_page.unsafe_as(Proc(HPROPSHEETPAGE, HRESULT)).call(hpage)
  end
  def remove_page(hpage : HPROPSHEETPAGE) : HRESULT
    @lpVtbl.value.remove_page.unsafe_as(Proc(HPROPSHEETPAGE, HRESULT)).call(hpage)
  end
end
struct LibWin32::IPropertySheetProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_property_sheet(title : LibC::LPWSTR, type : UInt8, cookie : LibC::IntPtrT, pidataobjectm : IDataObject, dwoptions : UInt32) : HRESULT
    @lpVtbl.value.create_property_sheet.unsafe_as(Proc(LibC::LPWSTR, UInt8, LibC::IntPtrT, IDataObject, UInt32, HRESULT)).call(title, type, cookie, pidataobjectm, dwoptions)
  end
  def find_property_sheet(hitem : LibC::IntPtrT, lpcomponent : IComponent, lpdataobject : IDataObject) : HRESULT
    @lpVtbl.value.find_property_sheet.unsafe_as(Proc(LibC::IntPtrT, IComponent, IDataObject, HRESULT)).call(hitem, lpcomponent, lpdataobject)
  end
  def add_primary_pages(lpunknown : IUnknown, bcreatehandle : LibC::BOOL, hnotifywindow : LibC::HANDLE, bscopepane : LibC::BOOL) : HRESULT
    @lpVtbl.value.add_primary_pages.unsafe_as(Proc(IUnknown, LibC::BOOL, LibC::HANDLE, LibC::BOOL, HRESULT)).call(lpunknown, bcreatehandle, hnotifywindow, bscopepane)
  end
  def add_extension_pages : HRESULT
    @lpVtbl.value.add_extension_pages.unsafe_as(Proc(HRESULT)).call
  end
  def show(window : LibC::IntPtrT, page : Int32) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::IntPtrT, Int32, HRESULT)).call(window, page)
  end
end
struct LibWin32::IExtendPropertySheet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_property_pages(lpprovider : IPropertySheetCallback, handle : LibC::IntPtrT, lpidataobject : IDataObject) : HRESULT
    @lpVtbl.value.create_property_pages.unsafe_as(Proc(IPropertySheetCallback, LibC::IntPtrT, IDataObject, HRESULT)).call(lpprovider, handle, lpidataobject)
  end
  def query_pages_for(lpdataobject : IDataObject) : HRESULT
    @lpVtbl.value.query_pages_for.unsafe_as(Proc(IDataObject, HRESULT)).call(lpdataobject)
  end
end
struct LibWin32::IControlbar
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(ntype : MMC_CONTROL_TYPE, pextendcontrolbar : IExtendControlbar, ppunknown : IUnknown*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(MMC_CONTROL_TYPE, IExtendControlbar, IUnknown*, HRESULT)).call(ntype, pextendcontrolbar, ppunknown)
  end
  def attach(ntype : MMC_CONTROL_TYPE, lpunknown : IUnknown) : HRESULT
    @lpVtbl.value.attach.unsafe_as(Proc(MMC_CONTROL_TYPE, IUnknown, HRESULT)).call(ntype, lpunknown)
  end
  def detach(lpunknown : IUnknown) : HRESULT
    @lpVtbl.value.detach.unsafe_as(Proc(IUnknown, HRESULT)).call(lpunknown)
  end
end
struct LibWin32::IExtendControlbar
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_controlbar(pcontrolbar : IControlbar) : HRESULT
    @lpVtbl.value.set_controlbar.unsafe_as(Proc(IControlbar, HRESULT)).call(pcontrolbar)
  end
  def controlbar_notify(event : MMC_NOTIFY_TYPE, arg : LPARAM, param2 : LPARAM) : HRESULT
    @lpVtbl.value.controlbar_notify.unsafe_as(Proc(MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)).call(event, arg, param2)
  end
end
struct LibWin32::IToolbar
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_bitmap(nimages : Int32, hbmp : HBITMAP, cxsize : Int32, cysize : Int32, crmask : UInt32) : HRESULT
    @lpVtbl.value.add_bitmap.unsafe_as(Proc(Int32, HBITMAP, Int32, Int32, UInt32, HRESULT)).call(nimages, hbmp, cxsize, cysize, crmask)
  end
  def add_buttons(nbuttons : Int32, lpbuttons : MMCBUTTON*) : HRESULT
    @lpVtbl.value.add_buttons.unsafe_as(Proc(Int32, MMCBUTTON*, HRESULT)).call(nbuttons, lpbuttons)
  end
  def insert_button(nindex : Int32, lpbutton : MMCBUTTON*) : HRESULT
    @lpVtbl.value.insert_button.unsafe_as(Proc(Int32, MMCBUTTON*, HRESULT)).call(nindex, lpbutton)
  end
  def delete_button(nindex : Int32) : HRESULT
    @lpVtbl.value.delete_button.unsafe_as(Proc(Int32, HRESULT)).call(nindex)
  end
  def get_button_state(idcommand : Int32, nstate : MMC_BUTTON_STATE, pstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_button_state.unsafe_as(Proc(Int32, MMC_BUTTON_STATE, LibC::BOOL*, HRESULT)).call(idcommand, nstate, pstate)
  end
  def set_button_state(idcommand : Int32, nstate : MMC_BUTTON_STATE, bstate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_button_state.unsafe_as(Proc(Int32, MMC_BUTTON_STATE, LibC::BOOL, HRESULT)).call(idcommand, nstate, bstate)
  end
end
struct LibWin32::IConsoleVerb
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_verb_state(ecmdid : MMC_CONSOLE_VERB, nstate : MMC_BUTTON_STATE, pstate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_verb_state.unsafe_as(Proc(MMC_CONSOLE_VERB, MMC_BUTTON_STATE, LibC::BOOL*, HRESULT)).call(ecmdid, nstate, pstate)
  end
  def set_verb_state(ecmdid : MMC_CONSOLE_VERB, nstate : MMC_BUTTON_STATE, bstate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_verb_state.unsafe_as(Proc(MMC_CONSOLE_VERB, MMC_BUTTON_STATE, LibC::BOOL, HRESULT)).call(ecmdid, nstate, bstate)
  end
  def set_default_verb(ecmdid : MMC_CONSOLE_VERB) : HRESULT
    @lpVtbl.value.set_default_verb.unsafe_as(Proc(MMC_CONSOLE_VERB, HRESULT)).call(ecmdid)
  end
  def get_default_verb(pecmdid : MMC_CONSOLE_VERB*) : HRESULT
    @lpVtbl.value.get_default_verb.unsafe_as(Proc(MMC_CONSOLE_VERB*, HRESULT)).call(pecmdid)
  end
end
struct LibWin32::ISnapinAbout
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_snapin_description(lpdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_snapin_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lpdescription)
  end
  def get_provider(lpname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_provider.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lpname)
  end
  def get_snapin_version(lpversion : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_snapin_version.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lpversion)
  end
  def get_snapin_image(happicon : HANDLE*) : HRESULT
    @lpVtbl.value.get_snapin_image.unsafe_as(Proc(HANDLE*, HRESULT)).call(happicon)
  end
  def get_static_folder_image(hsmallimage : HBITMAP*, hsmallimageopen : HBITMAP*, hlargeimage : HBITMAP*, cmask : UInt32*) : HRESULT
    @lpVtbl.value.get_static_folder_image.unsafe_as(Proc(HBITMAP*, HBITMAP*, HBITMAP*, UInt32*, HRESULT)).call(hsmallimage, hsmallimageopen, hlargeimage, cmask)
  end
end
struct LibWin32::IMenuButton
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_button(idcommand : Int32, lpbuttontext : LibC::LPWSTR, lptooltiptext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_button.unsafe_as(Proc(Int32, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(idcommand, lpbuttontext, lptooltiptext)
  end
  def set_button(idcommand : Int32, lpbuttontext : LibC::LPWSTR, lptooltiptext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_button.unsafe_as(Proc(Int32, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(idcommand, lpbuttontext, lptooltiptext)
  end
  def set_button_state(idcommand : Int32, nstate : MMC_BUTTON_STATE, bstate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_button_state.unsafe_as(Proc(Int32, MMC_BUTTON_STATE, LibC::BOOL, HRESULT)).call(idcommand, nstate, bstate)
  end
end
struct LibWin32::ISnapinHelp
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_help_topic(lpcompiledhelpfile : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_help_topic.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lpcompiledhelpfile)
  end
end
struct LibWin32::IExtendPropertySheet2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_property_pages(lpprovider : IPropertySheetCallback, handle : LibC::IntPtrT, lpidataobject : IDataObject) : HRESULT
    @lpVtbl.value.create_property_pages.unsafe_as(Proc(IPropertySheetCallback, LibC::IntPtrT, IDataObject, HRESULT)).call(lpprovider, handle, lpidataobject)
  end
  def query_pages_for(lpdataobject : IDataObject) : HRESULT
    @lpVtbl.value.query_pages_for.unsafe_as(Proc(IDataObject, HRESULT)).call(lpdataobject)
  end
  def get_watermarks(lpidataobject : IDataObject, lphwatermark : HBITMAP*, lphheader : HBITMAP*, lphpalette : HPALETTE*, bstretch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_watermarks.unsafe_as(Proc(IDataObject, HBITMAP*, HBITMAP*, HPALETTE*, LibC::BOOL*, HRESULT)).call(lpidataobject, lphwatermark, lphheader, lphpalette, bstretch)
  end
end
struct LibWin32::IHeaderCtrl2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert_column(ncol : Int32, title : LibC::LPWSTR, nformat : Int32, nwidth : Int32) : HRESULT
    @lpVtbl.value.insert_column.unsafe_as(Proc(Int32, LibC::LPWSTR, Int32, Int32, HRESULT)).call(ncol, title, nformat, nwidth)
  end
  def delete_column(ncol : Int32) : HRESULT
    @lpVtbl.value.delete_column.unsafe_as(Proc(Int32, HRESULT)).call(ncol)
  end
  def set_column_text(ncol : Int32, title : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_column_text.unsafe_as(Proc(Int32, LibC::LPWSTR, HRESULT)).call(ncol, title)
  end
  def get_column_text(ncol : Int32, ptext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_column_text.unsafe_as(Proc(Int32, LibC::LPWSTR*, HRESULT)).call(ncol, ptext)
  end
  def set_column_width(ncol : Int32, nwidth : Int32) : HRESULT
    @lpVtbl.value.set_column_width.unsafe_as(Proc(Int32, Int32, HRESULT)).call(ncol, nwidth)
  end
  def get_column_width(ncol : Int32, pwidth : Int32*) : HRESULT
    @lpVtbl.value.get_column_width.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(ncol, pwidth)
  end
  def set_change_time_out(utimeout : UInt32) : HRESULT
    @lpVtbl.value.set_change_time_out.unsafe_as(Proc(UInt32, HRESULT)).call(utimeout)
  end
  def set_column_filter(ncolumn : UInt32, dwtype : UInt32, pfilterdata : MMC_FILTERDATA*) : HRESULT
    @lpVtbl.value.set_column_filter.unsafe_as(Proc(UInt32, UInt32, MMC_FILTERDATA*, HRESULT)).call(ncolumn, dwtype, pfilterdata)
  end
  def get_column_filter(ncolumn : UInt32, pdwtype : UInt32*, pfilterdata : MMC_FILTERDATA*) : HRESULT
    @lpVtbl.value.get_column_filter.unsafe_as(Proc(UInt32, UInt32*, MMC_FILTERDATA*, HRESULT)).call(ncolumn, pdwtype, pfilterdata)
  end
end
struct LibWin32::ISnapinHelp2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_help_topic(lpcompiledhelpfile : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_help_topic.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lpcompiledhelpfile)
  end
  def get_linked_topics(lpcompiledhelpfiles : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_linked_topics.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(lpcompiledhelpfiles)
  end
end
struct LibWin32::IEnumTASK
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : MMC_TASK*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, MMC_TASK*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumTASK*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTASK*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IExtendTaskPad
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def task_notify(pdo : IDataObject, arg : VARIANT*, param2 : VARIANT*) : HRESULT
    @lpVtbl.value.task_notify.unsafe_as(Proc(IDataObject, VARIANT*, VARIANT*, HRESULT)).call(pdo, arg, param2)
  end
  def enum_tasks(pdo : IDataObject, sztaskgroup : LibC::LPWSTR, ppenumtask : IEnumTASK*) : HRESULT
    @lpVtbl.value.enum_tasks.unsafe_as(Proc(IDataObject, LibC::LPWSTR, IEnumTASK*, HRESULT)).call(pdo, sztaskgroup, ppenumtask)
  end
  def get_title(pszgroup : LibC::LPWSTR, psztitle : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(pszgroup, psztitle)
  end
  def get_descriptive_text(pszgroup : LibC::LPWSTR, pszdescriptivetext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_descriptive_text.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR*, HRESULT)).call(pszgroup, pszdescriptivetext)
  end
  def get_background(pszgroup : LibC::LPWSTR, ptdo : MMC_TASK_DISPLAY_OBJECT*) : HRESULT
    @lpVtbl.value.get_background.unsafe_as(Proc(LibC::LPWSTR, MMC_TASK_DISPLAY_OBJECT*, HRESULT)).call(pszgroup, ptdo)
  end
  def get_list_pad_info(pszgroup : LibC::LPWSTR, lplistpadinfo : MMC_LISTPAD_INFO*) : HRESULT
    @lpVtbl.value.get_list_pad_info.unsafe_as(Proc(LibC::LPWSTR, MMC_LISTPAD_INFO*, HRESULT)).call(pszgroup, lplistpadinfo)
  end
end
struct LibWin32::IConsole2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_header(pheader : IHeaderCtrl) : HRESULT
    @lpVtbl.value.set_header.unsafe_as(Proc(IHeaderCtrl, HRESULT)).call(pheader)
  end
  def set_toolbar(ptoolbar : IToolbar) : HRESULT
    @lpVtbl.value.set_toolbar.unsafe_as(Proc(IToolbar, HRESULT)).call(ptoolbar)
  end
  def query_result_view(punknown : IUnknown*) : HRESULT
    @lpVtbl.value.query_result_view.unsafe_as(Proc(IUnknown*, HRESULT)).call(punknown)
  end
  def query_scope_image_list(ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_scope_image_list.unsafe_as(Proc(IImageList*, HRESULT)).call(ppimagelist)
  end
  def query_result_image_list(ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_result_image_list.unsafe_as(Proc(IImageList*, HRESULT)).call(ppimagelist)
  end
  def update_all_views(lpdataobject : IDataObject, data : LPARAM, hint : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_all_views.unsafe_as(Proc(IDataObject, LPARAM, LibC::IntPtrT, HRESULT)).call(lpdataobject, data, hint)
  end
  def message_box(lpsztext : LibC::LPWSTR, lpsztitle : LibC::LPWSTR, fustyle : UInt32, piretval : Int32*) : HRESULT
    @lpVtbl.value.message_box.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, Int32*, HRESULT)).call(lpsztext, lpsztitle, fustyle, piretval)
  end
  def query_console_verb(ppconsoleverb : IConsoleVerb*) : HRESULT
    @lpVtbl.value.query_console_verb.unsafe_as(Proc(IConsoleVerb*, HRESULT)).call(ppconsoleverb)
  end
  def select_scope_item(hscopeitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.select_scope_item.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(hscopeitem)
  end
  def get_main_window(phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_main_window.unsafe_as(Proc(HANDLE*, HRESULT)).call(phwnd)
  end
  def new_window(hscopeitem : LibC::IntPtrT, loptions : UInt32) : HRESULT
    @lpVtbl.value.new_window.unsafe_as(Proc(LibC::IntPtrT, UInt32, HRESULT)).call(hscopeitem, loptions)
  end
  def expand(hitem : LibC::IntPtrT, bexpand : LibC::BOOL) : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(LibC::IntPtrT, LibC::BOOL, HRESULT)).call(hitem, bexpand)
  end
  def is_taskpad_view_preferred : HRESULT
    @lpVtbl.value.is_taskpad_view_preferred.unsafe_as(Proc(HRESULT)).call
  end
  def set_status_text(pszstatustext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_status_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszstatustext)
  end
end
struct LibWin32::IDisplayHelp
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def show_topic(pszhelptopic : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.show_topic.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszhelptopic)
  end
end
struct LibWin32::IRequiredExtensions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enable_all_extensions : HRESULT
    @lpVtbl.value.enable_all_extensions.unsafe_as(Proc(HRESULT)).call
  end
  def get_first_extension(pextclsid : Guid*) : HRESULT
    @lpVtbl.value.get_first_extension.unsafe_as(Proc(Guid*, HRESULT)).call(pextclsid)
  end
  def get_next_extension(pextclsid : Guid*) : HRESULT
    @lpVtbl.value.get_next_extension.unsafe_as(Proc(Guid*, HRESULT)).call(pextclsid)
  end
end
struct LibWin32::IStringTable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_string(pszadd : LibC::LPWSTR, pstringid : UInt32*) : HRESULT
    @lpVtbl.value.add_string.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pszadd, pstringid)
  end
  def get_string(stringid : UInt32, cchbuffer : UInt32, lpbuffer : Char*, pcchout : UInt32*) : HRESULT
    @lpVtbl.value.get_string.unsafe_as(Proc(UInt32, UInt32, Char*, UInt32*, HRESULT)).call(stringid, cchbuffer, lpbuffer, pcchout)
  end
  def get_string_length(stringid : UInt32, pcchstring : UInt32*) : HRESULT
    @lpVtbl.value.get_string_length.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(stringid, pcchstring)
  end
  def delete_string(stringid : UInt32) : HRESULT
    @lpVtbl.value.delete_string.unsafe_as(Proc(UInt32, HRESULT)).call(stringid)
  end
  def delete_all_strings : HRESULT
    @lpVtbl.value.delete_all_strings.unsafe_as(Proc(HRESULT)).call
  end
  def find_string(pszfind : LibC::LPWSTR, pstringid : UInt32*) : HRESULT
    @lpVtbl.value.find_string.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pszfind, pstringid)
  end
  def enumerate(ppenum : IEnumString*) : HRESULT
    @lpVtbl.value.enumerate.unsafe_as(Proc(IEnumString*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IColumnData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_column_config_data(pcolid : SColumnSetID*, pcolsetdata : MMC_COLUMN_SET_DATA*) : HRESULT
    @lpVtbl.value.set_column_config_data.unsafe_as(Proc(SColumnSetID*, MMC_COLUMN_SET_DATA*, HRESULT)).call(pcolid, pcolsetdata)
  end
  def get_column_config_data(pcolid : SColumnSetID*, ppcolsetdata : MMC_COLUMN_SET_DATA**) : HRESULT
    @lpVtbl.value.get_column_config_data.unsafe_as(Proc(SColumnSetID*, MMC_COLUMN_SET_DATA**, HRESULT)).call(pcolid, ppcolsetdata)
  end
  def set_column_sort_data(pcolid : SColumnSetID*, pcolsortdata : MMC_SORT_SET_DATA*) : HRESULT
    @lpVtbl.value.set_column_sort_data.unsafe_as(Proc(SColumnSetID*, MMC_SORT_SET_DATA*, HRESULT)).call(pcolid, pcolsortdata)
  end
  def get_column_sort_data(pcolid : SColumnSetID*, ppcolsortdata : MMC_SORT_SET_DATA**) : HRESULT
    @lpVtbl.value.get_column_sort_data.unsafe_as(Proc(SColumnSetID*, MMC_SORT_SET_DATA**, HRESULT)).call(pcolid, ppcolsortdata)
  end
end
struct LibWin32::IMessageView
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_title_text(psztitletext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_title_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztitletext)
  end
  def set_body_text(pszbodytext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_body_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszbodytext)
  end
  def set_icon(id : IconIdentifier) : HRESULT
    @lpVtbl.value.set_icon.unsafe_as(Proc(IconIdentifier, HRESULT)).call(id)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IResultDataCompareEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compare(prdc : RDCOMPARE*, pnresult : Int32*) : HRESULT
    @lpVtbl.value.compare.unsafe_as(Proc(RDCOMPARE*, Int32*, HRESULT)).call(prdc, pnresult)
  end
end
struct LibWin32::IComponentData2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(punknown : IUnknown) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IUnknown, HRESULT)).call(punknown)
  end
  def create_component(ppcomponent : IComponent*) : HRESULT
    @lpVtbl.value.create_component.unsafe_as(Proc(IComponent*, HRESULT)).call(ppcomponent)
  end
  def notify(lpdataobject : IDataObject, event : MMC_NOTIFY_TYPE, arg : LPARAM, param3 : LPARAM) : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)).call(lpdataobject, event, arg, param3)
  end
  def destroy : HRESULT
    @lpVtbl.value.destroy.unsafe_as(Proc(HRESULT)).call
  end
  def query_data_object(cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.query_data_object.unsafe_as(Proc(LibC::IntPtrT, DATA_OBJECT_TYPES, IDataObject*, HRESULT)).call(cookie, type, ppdataobject)
  end
  def get_display_info(pscopedataitem : SCOPEDATAITEM*) : HRESULT
    @lpVtbl.value.get_display_info.unsafe_as(Proc(SCOPEDATAITEM*, HRESULT)).call(pscopedataitem)
  end
  def compare_objects(lpdataobjecta : IDataObject, lpdataobjectb : IDataObject) : HRESULT
    @lpVtbl.value.compare_objects.unsafe_as(Proc(IDataObject, IDataObject, HRESULT)).call(lpdataobjecta, lpdataobjectb)
  end
  def query_dispatch(cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdispatch : IDispatch*) : HRESULT
    @lpVtbl.value.query_dispatch.unsafe_as(Proc(LibC::IntPtrT, DATA_OBJECT_TYPES, IDispatch*, HRESULT)).call(cookie, type, ppdispatch)
  end
end
struct LibWin32::IComponent2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(lpconsole : IConsole) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IConsole, HRESULT)).call(lpconsole)
  end
  def notify(lpdataobject : IDataObject, event : MMC_NOTIFY_TYPE, arg : LPARAM, param3 : LPARAM) : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)).call(lpdataobject, event, arg, param3)
  end
  def destroy(cookie : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.destroy.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(cookie)
  end
  def query_data_object(cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.query_data_object.unsafe_as(Proc(LibC::IntPtrT, DATA_OBJECT_TYPES, IDataObject*, HRESULT)).call(cookie, type, ppdataobject)
  end
  def get_result_view_type(cookie : LibC::IntPtrT, ppviewtype : LibC::LPWSTR*, pviewoptions : Int32*) : HRESULT
    @lpVtbl.value.get_result_view_type.unsafe_as(Proc(LibC::IntPtrT, LibC::LPWSTR*, Int32*, HRESULT)).call(cookie, ppviewtype, pviewoptions)
  end
  def get_display_info(presultdataitem : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_display_info.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(presultdataitem)
  end
  def compare_objects(lpdataobjecta : IDataObject, lpdataobjectb : IDataObject) : HRESULT
    @lpVtbl.value.compare_objects.unsafe_as(Proc(IDataObject, IDataObject, HRESULT)).call(lpdataobjecta, lpdataobjectb)
  end
  def query_dispatch(cookie : LibC::IntPtrT, type : DATA_OBJECT_TYPES, ppdispatch : IDispatch*) : HRESULT
    @lpVtbl.value.query_dispatch.unsafe_as(Proc(LibC::IntPtrT, DATA_OBJECT_TYPES, IDispatch*, HRESULT)).call(cookie, type, ppdispatch)
  end
  def get_result_view_type2(cookie : LibC::IntPtrT, presultviewtype : RESULT_VIEW_TYPE_INFO*) : HRESULT
    @lpVtbl.value.get_result_view_type2.unsafe_as(Proc(LibC::IntPtrT, RESULT_VIEW_TYPE_INFO*, HRESULT)).call(cookie, presultviewtype)
  end
  def restore_result_view(cookie : LibC::IntPtrT, presultviewtype : RESULT_VIEW_TYPE_INFO*) : HRESULT
    @lpVtbl.value.restore_result_view.unsafe_as(Proc(LibC::IntPtrT, RESULT_VIEW_TYPE_INFO*, HRESULT)).call(cookie, presultviewtype)
  end
end
struct LibWin32::IContextMenuCallback2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_item(pitem : CONTEXTMENUITEM2*) : HRESULT
    @lpVtbl.value.add_item.unsafe_as(Proc(CONTEXTMENUITEM2*, HRESULT)).call(pitem)
  end
end
struct LibWin32::IMMCVersionInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_mmc_version(pversionmajor : Int32*, pversionminor : Int32*) : HRESULT
    @lpVtbl.value.get_mmc_version.unsafe_as(Proc(Int32*, Int32*, HRESULT)).call(pversionmajor, pversionminor)
  end
end
struct LibWin32::IExtendView
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_views(pdataobject : IDataObject, pviewextensioncallback : IViewExtensionCallback) : HRESULT
    @lpVtbl.value.get_views.unsafe_as(Proc(IDataObject, IViewExtensionCallback, HRESULT)).call(pdataobject, pviewextensioncallback)
  end
end
struct LibWin32::IViewExtensionCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_view(pextviewdata : MMC_EXT_VIEW_DATA*) : HRESULT
    @lpVtbl.value.add_view.unsafe_as(Proc(MMC_EXT_VIEW_DATA*, HRESULT)).call(pextviewdata)
  end
end
struct LibWin32::IConsolePower
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_execution_state(dwadd : UInt32, dwremove : UInt32) : HRESULT
    @lpVtbl.value.set_execution_state.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwadd, dwremove)
  end
  def reset_idle_timer(dwflags : UInt32) : HRESULT
    @lpVtbl.value.reset_idle_timer.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
end
struct LibWin32::IConsolePowerSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_power_broadcast(nevent : UInt32, lparam : LPARAM, plreturn : LRESULT*) : HRESULT
    @lpVtbl.value.on_power_broadcast.unsafe_as(Proc(UInt32, LPARAM, LRESULT*, HRESULT)).call(nevent, lparam, plreturn)
  end
end
struct LibWin32::INodeProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property(pdataobject : IDataObject, szpropertyname : UInt8*, pbstrproperty : UInt16**) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(IDataObject, UInt8*, UInt16**, HRESULT)).call(pdataobject, szpropertyname, pbstrproperty)
  end
end
struct LibWin32::IConsole3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_header(pheader : IHeaderCtrl) : HRESULT
    @lpVtbl.value.set_header.unsafe_as(Proc(IHeaderCtrl, HRESULT)).call(pheader)
  end
  def set_toolbar(ptoolbar : IToolbar) : HRESULT
    @lpVtbl.value.set_toolbar.unsafe_as(Proc(IToolbar, HRESULT)).call(ptoolbar)
  end
  def query_result_view(punknown : IUnknown*) : HRESULT
    @lpVtbl.value.query_result_view.unsafe_as(Proc(IUnknown*, HRESULT)).call(punknown)
  end
  def query_scope_image_list(ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_scope_image_list.unsafe_as(Proc(IImageList*, HRESULT)).call(ppimagelist)
  end
  def query_result_image_list(ppimagelist : IImageList*) : HRESULT
    @lpVtbl.value.query_result_image_list.unsafe_as(Proc(IImageList*, HRESULT)).call(ppimagelist)
  end
  def update_all_views(lpdataobject : IDataObject, data : LPARAM, hint : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_all_views.unsafe_as(Proc(IDataObject, LPARAM, LibC::IntPtrT, HRESULT)).call(lpdataobject, data, hint)
  end
  def message_box(lpsztext : LibC::LPWSTR, lpsztitle : LibC::LPWSTR, fustyle : UInt32, piretval : Int32*) : HRESULT
    @lpVtbl.value.message_box.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, Int32*, HRESULT)).call(lpsztext, lpsztitle, fustyle, piretval)
  end
  def query_console_verb(ppconsoleverb : IConsoleVerb*) : HRESULT
    @lpVtbl.value.query_console_verb.unsafe_as(Proc(IConsoleVerb*, HRESULT)).call(ppconsoleverb)
  end
  def select_scope_item(hscopeitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.select_scope_item.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(hscopeitem)
  end
  def get_main_window(phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_main_window.unsafe_as(Proc(HANDLE*, HRESULT)).call(phwnd)
  end
  def new_window(hscopeitem : LibC::IntPtrT, loptions : UInt32) : HRESULT
    @lpVtbl.value.new_window.unsafe_as(Proc(LibC::IntPtrT, UInt32, HRESULT)).call(hscopeitem, loptions)
  end
  def expand(hitem : LibC::IntPtrT, bexpand : LibC::BOOL) : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(LibC::IntPtrT, LibC::BOOL, HRESULT)).call(hitem, bexpand)
  end
  def is_taskpad_view_preferred : HRESULT
    @lpVtbl.value.is_taskpad_view_preferred.unsafe_as(Proc(HRESULT)).call
  end
  def set_status_text(pszstatustext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_status_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszstatustext)
  end
  def rename_scope_item(hscopeitem : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.rename_scope_item.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(hscopeitem)
  end
end
struct LibWin32::IResultData2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert_item(item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.insert_item.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(item)
  end
  def delete_item(itemid : LibC::IntPtrT, ncol : Int32) : HRESULT
    @lpVtbl.value.delete_item.unsafe_as(Proc(LibC::IntPtrT, Int32, HRESULT)).call(itemid, ncol)
  end
  def find_item_by_l_param(lparam : LPARAM, pitemid : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.find_item_by_l_param.unsafe_as(Proc(LPARAM, LibC::IntPtrT*, HRESULT)).call(lparam, pitemid)
  end
  def delete_all_rslt_items : HRESULT
    @lpVtbl.value.delete_all_rslt_items.unsafe_as(Proc(HRESULT)).call
  end
  def set_item(item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.set_item.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(item)
  end
  def get_item(item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(item)
  end
  def get_next_item(item : RESULTDATAITEM*) : HRESULT
    @lpVtbl.value.get_next_item.unsafe_as(Proc(RESULTDATAITEM*, HRESULT)).call(item)
  end
  def modify_item_state(nindex : Int32, itemid : LibC::IntPtrT, uadd : UInt32, uremove : UInt32) : HRESULT
    @lpVtbl.value.modify_item_state.unsafe_as(Proc(Int32, LibC::IntPtrT, UInt32, UInt32, HRESULT)).call(nindex, itemid, uadd, uremove)
  end
  def modify_view_style(add : MMC_RESULT_VIEW_STYLE, remove : MMC_RESULT_VIEW_STYLE) : HRESULT
    @lpVtbl.value.modify_view_style.unsafe_as(Proc(MMC_RESULT_VIEW_STYLE, MMC_RESULT_VIEW_STYLE, HRESULT)).call(add, remove)
  end
  def set_view_mode(lviewmode : Int32) : HRESULT
    @lpVtbl.value.set_view_mode.unsafe_as(Proc(Int32, HRESULT)).call(lviewmode)
  end
  def get_view_mode(lviewmode : Int32*) : HRESULT
    @lpVtbl.value.get_view_mode.unsafe_as(Proc(Int32*, HRESULT)).call(lviewmode)
  end
  def update_item(itemid : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.update_item.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(itemid)
  end
  def sort(ncolumn : Int32, dwsortoptions : UInt32, luserparam : LPARAM) : HRESULT
    @lpVtbl.value.sort.unsafe_as(Proc(Int32, UInt32, LPARAM, HRESULT)).call(ncolumn, dwsortoptions, luserparam)
  end
  def set_desc_bar_text(desctext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_desc_bar_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(desctext)
  end
  def set_item_count(nitemcount : Int32, dwoptions : UInt32) : HRESULT
    @lpVtbl.value.set_item_count.unsafe_as(Proc(Int32, UInt32, HRESULT)).call(nitemcount, dwoptions)
  end
  def rename_result_item(itemid : LibC::IntPtrT) : HRESULT
    @lpVtbl.value.rename_result_item.unsafe_as(Proc(LibC::IntPtrT, HRESULT)).call(itemid)
  end
end
