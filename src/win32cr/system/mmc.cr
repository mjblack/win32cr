require "../foundation.cr"
require "../system/com.cr"
require "../ui/controls.cr"
require "../graphics/gdi.cr"
require "../ui/windowsandmessaging.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
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
  Application = LibC::GUID.new(0x49b2791a_u32, 0xb1ae_u16, 0x4c90_u16, StaticArray[0x9b_u8, 0x8e_u8, 0xe8_u8, 0x60_u8, 0xba_u8, 0x7_u8, 0xf8_u8, 0x89_u8])
  AppEventsDHTMLConnector = LibC::GUID.new(0xade6444b_u32, 0xc91f_u16, 0x4e37_u16, StaticArray[0x92_u8, 0xa4_u8, 0x5b_u8, 0xb4_u8, 0x30_u8, 0xa3_u8, 0x33_u8, 0x40_u8])
  MMCVersionInfo = LibC::GUID.new(0xd6fedb1d_u32, 0xcf21_u16, 0x4bd9_u16, StaticArray[0xaf_u8, 0x3b_u8, 0xc5_u8, 0x46_u8, 0x8e_u8, 0x9c_u8, 0x66_u8, 0x84_u8])
  ConsolePower = LibC::GUID.new(0xf0285374_u32, 0xdff1_u16, 0x11d3_u16, StaticArray[0xb4_u8, 0x33_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])


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

  struct ISnapinProperties
    lpVtbl : ISnapinPropertiesVTbl*
  end

  struct ISnapinPropertiesCallbackVTbl
    query_interface : Proc(ISnapinPropertiesCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISnapinPropertiesCallback*, UInt32)
    release : Proc(ISnapinPropertiesCallback*, UInt32)
    add_property_name : Proc(ISnapinPropertiesCallback*, LibC::LPWSTR, UInt32, HRESULT)
  end

  struct ISnapinPropertiesCallback
    lpVtbl : ISnapinPropertiesCallbackVTbl*
  end

  struct ApplicationVTbl
    query_interface : Proc(Application*, Guid*, Void**, HRESULT)
    add_ref : Proc(Application*, UInt32)
    release : Proc(Application*, UInt32)
    get_type_info_count : Proc(Application*, UInt32*, HRESULT)
    get_type_info : Proc(Application*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(Application*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(Application*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    help : Proc(Application*, Void)
    quit : Proc(Application*, Void)
    get_document : Proc(Application*, Document*, HRESULT)
    load : Proc(Application*, UInt8, HRESULT)
    get_frame : Proc(Application*, Frame*, HRESULT)
    get_visible : Proc(Application*, LibC::BOOL*, HRESULT)
    show : Proc(Application*, HRESULT)
    hide : Proc(Application*, HRESULT)
    get_user_control : Proc(Application*, LibC::BOOL*, HRESULT)
    put_user_control : Proc(Application*, LibC::BOOL, HRESULT)
    get_version_major : Proc(Application*, Int32*, HRESULT)
    get_version_minor : Proc(Application*, Int32*, HRESULT)
  end

  struct Application
    lpVtbl : ApplicationVTbl*
  end

  struct AppEventsVTbl
    query_interface : Proc(AppEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(AppEvents*, UInt32)
    release : Proc(AppEvents*, UInt32)
    get_type_info_count : Proc(AppEvents*, UInt32*, HRESULT)
    get_type_info : Proc(AppEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(AppEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(AppEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_quit : Proc(AppEvents*, Application, HRESULT)
    on_document_open : Proc(AppEvents*, Document, LibC::BOOL, HRESULT)
    on_document_close : Proc(AppEvents*, Document, HRESULT)
    on_snap_in_added : Proc(AppEvents*, Document, SnapIn, HRESULT)
    on_snap_in_removed : Proc(AppEvents*, Document, SnapIn, HRESULT)
    on_new_view : Proc(AppEvents*, View, HRESULT)
    on_view_close : Proc(AppEvents*, View, HRESULT)
    on_view_change : Proc(AppEvents*, View, Node, HRESULT)
    on_selection_change : Proc(AppEvents*, View, Nodes, HRESULT)
    on_context_menu_executed : Proc(AppEvents*, MenuItem, HRESULT)
    on_toolbar_button_clicked : Proc(AppEvents*, HRESULT)
    on_list_updated : Proc(AppEvents*, View, HRESULT)
  end

  struct AppEvents
    lpVtbl : AppEventsVTbl*
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

  struct AppEvents
    lpVtbl : AppEventsVTbl*
  end

  struct EventConnectorVTbl
    query_interface : Proc(EventConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(EventConnector*, UInt32)
    release : Proc(EventConnector*, UInt32)
    get_type_info_count : Proc(EventConnector*, UInt32*, HRESULT)
    get_type_info : Proc(EventConnector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(EventConnector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(EventConnector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    connect_to : Proc(EventConnector*, Application, HRESULT)
    disconnect : Proc(EventConnector*, HRESULT)
  end

  struct EventConnector
    lpVtbl : EventConnectorVTbl*
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
    get_property : Proc(Node*, UInt8, UInt16**, HRESULT)
    get_bookmark : Proc(Node*, UInt16**, HRESULT)
    is_scope_node : Proc(Node*, LibC::BOOL*, HRESULT)
    get_nodetype : Proc(Node*, UInt16**, HRESULT)
  end

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
    save_as : Proc(Document*, UInt8, HRESULT)
    close : Proc(Document*, LibC::BOOL, HRESULT)
    get_views : Proc(Document*, Views*, HRESULT)
    get_snap_ins : Proc(Document*, SnapIns*, HRESULT)
    get_active_view : Proc(Document*, View*, HRESULT)
    get_name : Proc(Document*, UInt16**, HRESULT)
    put_name : Proc(Document*, UInt8, HRESULT)
    get_location : Proc(Document*, UInt16**, HRESULT)
    get_is_saved : Proc(Document*, LibC::BOOL*, HRESULT)
    get_mode : Proc(Document*, DocumentMode*, HRESULT)
    put_mode : Proc(Document*, DocumentMode, HRESULT)
    get_root_node : Proc(Document*, Node*, HRESULT)
    get_scope_namespace : Proc(Document*, ScopeNamespace*, HRESULT)
    create_properties : Proc(Document*, Properties*, HRESULT)
    get_application : Proc(Document*, Application*, HRESULT)
  end

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
    add : Proc(SnapIns*, UInt8, VARIANT, VARIANT, SnapIn*, HRESULT)
    remove : Proc(SnapIns*, SnapIn, HRESULT)
  end

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
    name : Proc(Column*, UInt8*, HRESULT)
    get_width : Proc(Column*, Int32*, HRESULT)
    put_width : Proc(Column*, Int32, HRESULT)
    get_display_position : Proc(Column*, Int32*, HRESULT)
    put_display_position : Proc(Column*, Int32, HRESULT)
    get_hidden : Proc(Column*, LibC::BOOL*, HRESULT)
    put_hidden : Proc(Column*, LibC::BOOL, HRESULT)
    set_as_sort_column : Proc(Column*, ColumnSortOrder, HRESULT)
    is_sort_column : Proc(Column*, LibC::BOOL*, HRESULT)
  end

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
    rename_scope_node : Proc(View*, UInt8, VARIANT, HRESULT)
    rename_selected_item : Proc(View*, UInt8, HRESULT)
    get_scope_node_context_menu : Proc(View*, VARIANT, ContextMenu*, HRESULT)
    get_selection_context_menu : Proc(View*, ContextMenu*, HRESULT)
    refresh_scope_node : Proc(View*, VARIANT, HRESULT)
    refresh_selection : Proc(View*, HRESULT)
    execute_selection_menu_item : Proc(View*, UInt8, HRESULT)
    execute_scope_node_menu_item : Proc(View*, UInt8, VARIANT, HRESULT)
    execute_shell_command : Proc(View*, UInt8, UInt8, UInt8, UInt8, HRESULT)
    get_frame : Proc(View*, Frame*, HRESULT)
    close : Proc(View*, HRESULT)
    get_scope_tree_visible : Proc(View*, LibC::BOOL*, HRESULT)
    put_scope_tree_visible : Proc(View*, LibC::BOOL, HRESULT)
    back : Proc(View*, HRESULT)
    forward : Proc(View*, HRESULT)
    put_status_bar_text : Proc(View*, UInt8, HRESULT)
    get_memento : Proc(View*, UInt16**, HRESULT)
    view_memento : Proc(View*, UInt8, HRESULT)
    get_columns : Proc(View*, Columns*, HRESULT)
    get_cell_contents : Proc(View*, Node, Int32, UInt16**, HRESULT)
    export_list : Proc(View*, UInt8, ExportListOptions, HRESULT)
    get_list_view_mode : Proc(View*, ListViewMode*, HRESULT)
    put_list_view_mode : Proc(View*, ListViewMode, HRESULT)
    get_control_object : Proc(View*, IDispatch*, HRESULT)
  end

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
    item : Proc(Properties*, UInt8, Property*, HRESULT)
    get_count : Proc(Properties*, Int32*, HRESULT)
    remove : Proc(Properties*, UInt8, HRESULT)
  end

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

  struct IComponentData
    lpVtbl : IComponentDataVTbl*
  end

  struct IComponentVTbl
    query_interface : Proc(IComponent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComponent*, UInt32)
    release : Proc(IComponent*, UInt32)
    initialize : Proc(IComponent*, IConsole, HRESULT)
    notify : Proc(IComponent*, IDataObject, MMC_NOTIFY_TYPE, LPARAM, LPARAM, HRESULT)
    destroy : Proc(IComponent*, LibC::IntPtrT, HRESULT)
    query_data_object : Proc(IComponent*, LibC::IntPtrT, DATA_OBJECT_TYPES, IDataObject*, HRESULT)
    get_result_view_type : Proc(IComponent*, LibC::IntPtrT, LibC::LPWSTR*, Int32*, HRESULT)
    get_display_info : Proc(IComponent*, RESULTDATAITEM*, HRESULT)
    compare_objects : Proc(IComponent*, IDataObject, IDataObject, HRESULT)
  end

  struct IComponent
    lpVtbl : IComponentVTbl*
  end

  struct IResultDataCompareVTbl
    query_interface : Proc(IResultDataCompare*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResultDataCompare*, UInt32)
    release : Proc(IResultDataCompare*, UInt32)
    compare : Proc(IResultDataCompare*, LPARAM, LibC::IntPtrT, LibC::IntPtrT, Int32*, HRESULT)
  end

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

  struct IHeaderCtrl
    lpVtbl : IHeaderCtrlVTbl*
  end

  struct IContextMenuCallbackVTbl
    query_interface : Proc(IContextMenuCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContextMenuCallback*, UInt32)
    release : Proc(IContextMenuCallback*, UInt32)
    add_item : Proc(IContextMenuCallback*, CONTEXTMENUITEM*, HRESULT)
  end

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

  struct IExtendContextMenu
    lpVtbl : IExtendContextMenuVTbl*
  end

  struct IImageListVTbl
    query_interface : Proc(IImageList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IImageList*, UInt32)
    release : Proc(IImageList*, UInt32)
    image_list_set_icon : Proc(IImageList*, LibC::IntPtrT*, Int32, HRESULT)
    image_list_set_strip : Proc(IImageList*, LibC::IntPtrT*, LibC::IntPtrT*, Int32, UInt32, HRESULT)
  end

  struct IImageList
    lpVtbl : IImageListVTbl*
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

  struct IMenuButton
    lpVtbl : IMenuButtonVTbl*
  end

  struct ISnapinHelpVTbl
    query_interface : Proc(ISnapinHelp*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISnapinHelp*, UInt32)
    release : Proc(ISnapinHelp*, UInt32)
    get_help_topic : Proc(ISnapinHelp*, LibC::LPWSTR*, HRESULT)
  end

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

  struct ISnapinHelp2
    lpVtbl : ISnapinHelp2VTbl*
  end

  struct IEnumTASKVTbl
    query_interface : Proc(IEnumTASK*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTASK*, UInt32)
    release : Proc(IEnumTASK*, UInt32)
    next : Proc(IEnumTASK*, UInt32, MMC_TASK*, UInt32*, HRESULT)
    skip : Proc(IEnumTASK*, UInt32, HRESULT)
    reset : Proc(IEnumTASK*, HRESULT)
    clone : Proc(IEnumTASK*, IEnumTASK*, HRESULT)
  end

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

  struct IConsole2
    lpVtbl : IConsole2VTbl*
  end

  struct IDisplayHelpVTbl
    query_interface : Proc(IDisplayHelp*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDisplayHelp*, UInt32)
    release : Proc(IDisplayHelp*, UInt32)
    show_topic : Proc(IDisplayHelp*, LibC::LPWSTR, HRESULT)
  end

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

  struct IMessageView
    lpVtbl : IMessageViewVTbl*
  end

  struct IResultDataCompareExVTbl
    query_interface : Proc(IResultDataCompareEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResultDataCompareEx*, UInt32)
    release : Proc(IResultDataCompareEx*, UInt32)
    compare : Proc(IResultDataCompareEx*, RDCOMPARE*, Int32*, HRESULT)
  end

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

  struct IComponent2
    lpVtbl : IComponent2VTbl*
  end

  struct IContextMenuCallback2VTbl
    query_interface : Proc(IContextMenuCallback2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContextMenuCallback2*, UInt32)
    release : Proc(IContextMenuCallback2*, UInt32)
    add_item : Proc(IContextMenuCallback2*, CONTEXTMENUITEM2*, HRESULT)
  end

  struct IContextMenuCallback2
    lpVtbl : IContextMenuCallback2VTbl*
  end

  struct IMMCVersionInfoVTbl
    query_interface : Proc(IMMCVersionInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMMCVersionInfo*, UInt32)
    release : Proc(IMMCVersionInfo*, UInt32)
    get_mmc_version : Proc(IMMCVersionInfo*, Int32*, Int32*, HRESULT)
  end

  struct IMMCVersionInfo
    lpVtbl : IMMCVersionInfoVTbl*
  end

  struct IExtendViewVTbl
    query_interface : Proc(IExtendView*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExtendView*, UInt32)
    release : Proc(IExtendView*, UInt32)
    get_views : Proc(IExtendView*, IDataObject, IViewExtensionCallback, HRESULT)
  end

  struct IExtendView
    lpVtbl : IExtendViewVTbl*
  end

  struct IViewExtensionCallbackVTbl
    query_interface : Proc(IViewExtensionCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IViewExtensionCallback*, UInt32)
    release : Proc(IViewExtensionCallback*, UInt32)
    add_view : Proc(IViewExtensionCallback*, MMC_EXT_VIEW_DATA*, HRESULT)
  end

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

  struct IConsolePower
    lpVtbl : IConsolePowerVTbl*
  end

  struct IConsolePowerSinkVTbl
    query_interface : Proc(IConsolePowerSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConsolePowerSink*, UInt32)
    release : Proc(IConsolePowerSink*, UInt32)
    on_power_broadcast : Proc(IConsolePowerSink*, UInt32, LPARAM, LRESULT*, HRESULT)
  end

  struct IConsolePowerSink
    lpVtbl : IConsolePowerSinkVTbl*
  end

  struct INodePropertiesVTbl
    query_interface : Proc(INodeProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(INodeProperties*, UInt32)
    release : Proc(INodeProperties*, UInt32)
    get_property : Proc(INodeProperties*, IDataObject, UInt8, UInt16**, HRESULT)
  end

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

  struct IResultData2
    lpVtbl : IResultData2VTbl*
  end

end
