require "./../foundation.cr"
require "./com.cr"
require "./../ui/controls.cr"
require "./../graphics/gdi.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::System::Mmc
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

  enum MMC_PROPERTY_ACTION
    MMC_PROPACT_DELETING = 1_i32
    MMC_PROPACT_CHANGING = 2_i32
    MMC_PROPACT_INITIALIZED = 3_i32
  end
  enum DocumentMode_
    DocumentMode_Author = 0_i32
    DocumentMode_User = 1_i32
    DocumentMode_User_MDI = 2_i32
    DocumentMode_User_SDI = 3_i32
  end
  enum ListViewMode_
    ListMode_Small_Icons = 0_i32
    ListMode_Large_Icons = 1_i32
    ListMode_List = 2_i32
    ListMode_Detail = 3_i32
    ListMode_Filtered = 4_i32
  end
  enum ViewOptions_
    ViewOption_Default = 0_i32
    ViewOption_ScopeTreeHidden = 1_i32
    ViewOption_NoToolBars = 2_i32
    ViewOption_NotPersistable = 4_i32
    ViewOption_ActionPaneHidden = 8_i32
  end
  enum ExportListOptions_
    ExportListOptions_Default = 0_i32
    ExportListOptions_Unicode = 1_i32
    ExportListOptions_TabDelimited = 2_i32
    ExportListOptions_SelectedItemsOnly = 4_i32
  end
  enum ColumnSortOrder_
    SortOrder_Ascending = 0_i32
    SortOrder_Descending = 1_i32
  end
  enum MMC_RESULT_VIEW_STYLE
    MMC_SINGLESEL = 1_i32
    MMC_SHOWSELALWAYS = 2_i32
    MMC_NOSORTHEADER = 4_i32
    MMC_ENSUREFOCUSVISIBLE = 8_i32
  end
  enum MMC_CONTROL_TYPE
    TOOLBAR = 0_i32
    MENUBUTTON = 1_i32
    COMBOBOXBAR = 2_i32
  end
  enum MMC_CONSOLE_VERB
    MMC_VERB_NONE = 0_i32
    MMC_VERB_OPEN = 32768_i32
    MMC_VERB_COPY = 32769_i32
    MMC_VERB_PASTE = 32770_i32
    MMC_VERB_DELETE = 32771_i32
    MMC_VERB_PROPERTIES = 32772_i32
    MMC_VERB_RENAME = 32773_i32
    MMC_VERB_REFRESH = 32774_i32
    MMC_VERB_PRINT = 32775_i32
    MMC_VERB_CUT = 32776_i32
    MMC_VERB_MAX = 32777_i32
    MMC_VERB_FIRST = 32768_i32
    MMC_VERB_LAST = 32776_i32
  end
  enum MMC_BUTTON_STATE
    ENABLED = 1_i32
    CHECKED = 2_i32
    HIDDEN = 4_i32
    INDETERMINATE = 8_i32
    BUTTONPRESSED = 16_i32
  end
  enum MMC_SCOPE_ITEM_STATE
    MMC_SCOPE_ITEM_STATE_NORMAL = 1_i32
    MMC_SCOPE_ITEM_STATE_BOLD = 2_i32
    MMC_SCOPE_ITEM_STATE_EXPANDEDONCE = 3_i32
  end
  enum MMC_MENU_COMMAND_IDS
    MMCC_STANDARD_VIEW_SELECT = -1_i32
  end
  enum MMC_FILTER_TYPE
    MMC_STRING_FILTER = 0_i32
    MMC_INT_FILTER = 1_i32
    MMC_FILTER_NOVALUE = 32768_i32
  end
  enum MMC_FILTER_CHANGE_CODE
    MFCC_DISABLE = 0_i32
    MFCC_ENABLE = 1_i32
    MFCC_VALUE_CHANGE = 2_i32
  end
  enum MMC_NOTIFY_TYPE
    MMCN_ACTIVATE = 32769_i32
    MMCN_ADD_IMAGES = 32770_i32
    MMCN_BTN_CLICK = 32771_i32
    MMCN_CLICK = 32772_i32
    MMCN_COLUMN_CLICK = 32773_i32
    MMCN_CONTEXTMENU = 32774_i32
    MMCN_CUTORMOVE = 32775_i32
    MMCN_DBLCLICK = 32776_i32
    MMCN_DELETE = 32777_i32
    MMCN_DESELECT_ALL = 32778_i32
    MMCN_EXPAND = 32779_i32
    MMCN_HELP = 32780_i32
    MMCN_MENU_BTNCLICK = 32781_i32
    MMCN_MINIMIZED = 32782_i32
    MMCN_PASTE = 32783_i32
    MMCN_PROPERTY_CHANGE = 32784_i32
    MMCN_QUERY_PASTE = 32785_i32
    MMCN_REFRESH = 32786_i32
    MMCN_REMOVE_CHILDREN = 32787_i32
    MMCN_RENAME = 32788_i32
    MMCN_SELECT = 32789_i32
    MMCN_SHOW = 32790_i32
    MMCN_VIEW_CHANGE = 32791_i32
    MMCN_SNAPINHELP = 32792_i32
    MMCN_CONTEXTHELP = 32793_i32
    MMCN_INITOCX = 32794_i32
    MMCN_FILTER_CHANGE = 32795_i32
    MMCN_FILTERBTN_CLICK = 32796_i32
    MMCN_RESTORE_VIEW = 32797_i32
    MMCN_PRINT = 32798_i32
    MMCN_PRELOAD = 32799_i32
    MMCN_LISTPAD = 32800_i32
    MMCN_EXPANDSYNC = 32801_i32
    MMCN_COLUMNS_CHANGED = 32802_i32
    MMCN_CANPASTE_OUTOFPROC = 32803_i32
  end
  enum DATA_OBJECT_TYPES
    CCT_SCOPE = 32768_i32
    CCT_RESULT = 32769_i32
    CCT_SNAPIN_MANAGER = 32770_i32
    CCT_UNINITIALIZED = 65535_i32
  end
  enum CCM_INSERTIONPOINTID
    CCM_INSERTIONPOINTID_MASK_SPECIAL = -65536_i32
    CCM_INSERTIONPOINTID_MASK_SHARED = -2147483648_i32
    CCM_INSERTIONPOINTID_MASK_CREATE_PRIMARY = 1073741824_i32
    CCM_INSERTIONPOINTID_MASK_ADD_PRIMARY = 536870912_i32
    CCM_INSERTIONPOINTID_MASK_ADD_3RDPARTY = 268435456_i32
    CCM_INSERTIONPOINTID_MASK_RESERVED = 268369920_i32
    CCM_INSERTIONPOINTID_MASK_FLAGINDEX = 31_i32
    CCM_INSERTIONPOINTID_PRIMARY_TOP = -1610612736_i32
    CCM_INSERTIONPOINTID_PRIMARY_NEW = -1610612735_i32
    CCM_INSERTIONPOINTID_PRIMARY_TASK = -1610612734_i32
    CCM_INSERTIONPOINTID_PRIMARY_VIEW = -1610612733_i32
    CCM_INSERTIONPOINTID_PRIMARY_HELP = -1610612732_i32
    CCM_INSERTIONPOINTID_3RDPARTY_NEW = -1879048191_i32
    CCM_INSERTIONPOINTID_3RDPARTY_TASK = -1879048190_i32
    CCM_INSERTIONPOINTID_ROOT_MENU = -2147483648_i32
  end
  enum CCM_INSERTIONALLOWED
    CCM_INSERTIONALLOWED_TOP = 1_i32
    CCM_INSERTIONALLOWED_NEW = 2_i32
    CCM_INSERTIONALLOWED_TASK = 4_i32
    CCM_INSERTIONALLOWED_VIEW = 8_i32
  end
  enum CCM_COMMANDID_MASK_CONSTANTS : UInt32
    CCM_COMMANDID_MASK_RESERVED = 4294901760_u32
  end
  enum CCM_SPECIAL
    CCM_SPECIAL_SEPARATOR = 1_i32
    CCM_SPECIAL_SUBMENU = 2_i32
    CCM_SPECIAL_DEFAULT_ITEM = 4_i32
    CCM_SPECIAL_INSERTION_POINT = 8_i32
    CCM_SPECIAL_TESTONLY = 16_i32
  end
  enum MMC_TASK_DISPLAY_TYPE
    MMC_TASK_DISPLAY_UNINITIALIZED = 0_i32
    MMC_TASK_DISPLAY_TYPE_SYMBOL = 1_i32
    MMC_TASK_DISPLAY_TYPE_VANILLA_GIF = 2_i32
    MMC_TASK_DISPLAY_TYPE_CHOCOLATE_GIF = 3_i32
    MMC_TASK_DISPLAY_TYPE_BITMAP = 4_i32
  end
  enum MMC_ACTION_TYPE
    MMC_ACTION_UNINITIALIZED = -1_i32
    MMC_ACTION_ID = 0_i32
    MMC_ACTION_LINK = 1_i32
    MMC_ACTION_SCRIPT = 2_i32
  end
  enum IconIdentifier
    Icon_None = 0_i32
    Icon_Error = 32513_i32
    Icon_Question = 32514_i32
    Icon_Warning = 32515_i32
    Icon_Information = 32516_i32
    Icon_First = 32513_i32
    Icon_Last = 32516_i32
  end
  enum MMC_VIEW_TYPE
    MMC_VIEW_TYPE_LIST = 0_i32
    MMC_VIEW_TYPE_HTML = 1_i32
    MMC_VIEW_TYPE_OCX = 2_i32
  end

  @[Extern]
  struct MMC_SNAPIN_PROPERTY
    property pszPropName : Win32cr::Foundation::PWSTR
    property varValue : Win32cr::System::Com::VARIANT
    property eAction : Win32cr::System::Mmc::MMC_PROPERTY_ACTION
    def initialize(@pszPropName : Win32cr::Foundation::PWSTR, @varValue : Win32cr::System::Com::VARIANT, @eAction : Win32cr::System::Mmc::MMC_PROPERTY_ACTION)
    end
  end

  @[Extern]
  struct MMCBUTTON
    property nBitmap : Int32
    property idCommand : Int32
    property fsState : UInt8
    property fsType : UInt8
    property lpButtonText : Win32cr::Foundation::PWSTR
    property lpTooltipText : Win32cr::Foundation::PWSTR
    def initialize(@nBitmap : Int32, @idCommand : Int32, @fsState : UInt8, @fsType : UInt8, @lpButtonText : Win32cr::Foundation::PWSTR, @lpTooltipText : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct RESULTDATAITEM
    property mask : UInt32
    property bScopeItem : Win32cr::Foundation::BOOL
    property itemID : LibC::IntPtrT
    property nIndex : Int32
    property nCol : Int32
    property str : Win32cr::Foundation::PWSTR
    property nImage : Int32
    property nState : UInt32
    property lParam : Win32cr::Foundation::LPARAM
    property iIndent : Int32
    def initialize(@mask : UInt32, @bScopeItem : Win32cr::Foundation::BOOL, @itemID : LibC::IntPtrT, @nIndex : Int32, @nCol : Int32, @str : Win32cr::Foundation::PWSTR, @nImage : Int32, @nState : UInt32, @lParam : Win32cr::Foundation::LPARAM, @iIndent : Int32)
    end
  end

  @[Extern]
  struct RESULTFINDINFO
    property psz : Win32cr::Foundation::PWSTR
    property nStart : Int32
    property dwOptions : UInt32
    def initialize(@psz : Win32cr::Foundation::PWSTR, @nStart : Int32, @dwOptions : UInt32)
    end
  end

  @[Extern]
  struct SCOPEDATAITEM
    property mask : UInt32
    property displayname : Win32cr::Foundation::PWSTR
    property nImage : Int32
    property nOpenImage : Int32
    property nState : UInt32
    property cChildren : Int32
    property lParam : Win32cr::Foundation::LPARAM
    property relativeID : LibC::IntPtrT
    property id : LibC::IntPtrT
    def initialize(@mask : UInt32, @displayname : Win32cr::Foundation::PWSTR, @nImage : Int32, @nOpenImage : Int32, @nState : UInt32, @cChildren : Int32, @lParam : Win32cr::Foundation::LPARAM, @relativeID : LibC::IntPtrT, @id : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct CONTEXTMENUITEM
    property strName : Win32cr::Foundation::PWSTR
    property strStatusBarText : Win32cr::Foundation::PWSTR
    property lCommandID : Int32
    property lInsertionPointID : Int32
    property fFlags : Int32
    property fSpecialFlags : Int32
    def initialize(@strName : Win32cr::Foundation::PWSTR, @strStatusBarText : Win32cr::Foundation::PWSTR, @lCommandID : Int32, @lInsertionPointID : Int32, @fFlags : Int32, @fSpecialFlags : Int32)
    end
  end

  @[Extern]
  struct MENUBUTTONDATA
    property idCommand : Int32
    property x : Int32
    property y : Int32
    def initialize(@idCommand : Int32, @x : Int32, @y : Int32)
    end
  end

  @[Extern]
  struct MMC_FILTERDATA
    property pszText : Win32cr::Foundation::PWSTR
    property cchTextMax : Int32
    property lValue : Int32
    def initialize(@pszText : Win32cr::Foundation::PWSTR, @cchTextMax : Int32, @lValue : Int32)
    end
  end

  @[Extern]
  struct MMC_RESTORE_VIEW
    property dwSize : UInt32
    property cookie : LibC::IntPtrT
    property pViewType : Win32cr::Foundation::PWSTR
    property lViewOptions : Int32
    def initialize(@dwSize : UInt32, @cookie : LibC::IntPtrT, @pViewType : Win32cr::Foundation::PWSTR, @lViewOptions : Int32)
    end
  end

  @[Extern]
  struct MMC_EXPANDSYNC_STRUCT
    property bHandled : Win32cr::Foundation::BOOL
    property bExpanding : Win32cr::Foundation::BOOL
    property hItem : LibC::IntPtrT
    def initialize(@bHandled : Win32cr::Foundation::BOOL, @bExpanding : Win32cr::Foundation::BOOL, @hItem : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct MMC_VISIBLE_COLUMNS
    property nVisibleColumns : Int32
    property rgVisibleCols : Int32*
    def initialize(@nVisibleColumns : Int32, @rgVisibleCols : Int32*)
    end
  end

  @[Extern]
  struct SMMCDataObjects
    property count : UInt32
    property lpDataObject : Void**
    def initialize(@count : UInt32, @lpDataObject : Void**)
    end
  end

  @[Extern]
  struct SMMCObjectTypes
    property count : UInt32
    property guid : LibC::GUID*
    def initialize(@count : UInt32, @guid : LibC::GUID*)
    end
  end

  @[Extern]
  struct SNodeID
    property cBytes : UInt32
    property id : UInt8*
    def initialize(@cBytes : UInt32, @id : UInt8*)
    end
  end

  @[Extern]
  struct SNodeID2
    property dwFlags : UInt32
    property cBytes : UInt32
    property id : UInt8*
    def initialize(@dwFlags : UInt32, @cBytes : UInt32, @id : UInt8*)
    end
  end

  @[Extern]
  struct SColumnSetID
    property dwFlags : UInt32
    property cBytes : UInt32
    property id : UInt8*
    def initialize(@dwFlags : UInt32, @cBytes : UInt32, @id : UInt8*)
    end
  end

  @[Extern]
  struct MMC_TASK_DISPLAY_SYMBOL
    property szFontFamilyName : Win32cr::Foundation::PWSTR
    property szURLtoEOT : Win32cr::Foundation::PWSTR
    property szSymbolString : Win32cr::Foundation::PWSTR
    def initialize(@szFontFamilyName : Win32cr::Foundation::PWSTR, @szURLtoEOT : Win32cr::Foundation::PWSTR, @szSymbolString : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct MMC_TASK_DISPLAY_BITMAP
    property szMouseOverBitmap : Win32cr::Foundation::PWSTR
    property szMouseOffBitmap : Win32cr::Foundation::PWSTR
    def initialize(@szMouseOverBitmap : Win32cr::Foundation::PWSTR, @szMouseOffBitmap : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct MMC_TASK_DISPLAY_OBJECT
    property eDisplayType : Win32cr::System::Mmc::MMC_TASK_DISPLAY_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property uBitmap : Win32cr::System::Mmc::MMC_TASK_DISPLAY_BITMAP
    property uSymbol : Win32cr::System::Mmc::MMC_TASK_DISPLAY_SYMBOL
    def initialize(@uBitmap : Win32cr::System::Mmc::MMC_TASK_DISPLAY_BITMAP, @uSymbol : Win32cr::System::Mmc::MMC_TASK_DISPLAY_SYMBOL)
    end
    end

    def initialize(@eDisplayType : Win32cr::System::Mmc::MMC_TASK_DISPLAY_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct MMC_TASK
    property sDisplayObject : Win32cr::System::Mmc::MMC_TASK_DISPLAY_OBJECT
    property szText : Win32cr::Foundation::PWSTR
    property szHelpString : Win32cr::Foundation::PWSTR
    property eActionType : Win32cr::System::Mmc::MMC_ACTION_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property nCommandID : LibC::IntPtrT
    property szActionURL : Win32cr::Foundation::PWSTR
    property szScript : Win32cr::Foundation::PWSTR
    def initialize(@nCommandID : LibC::IntPtrT, @szActionURL : Win32cr::Foundation::PWSTR, @szScript : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@sDisplayObject : Win32cr::System::Mmc::MMC_TASK_DISPLAY_OBJECT, @szText : Win32cr::Foundation::PWSTR, @szHelpString : Win32cr::Foundation::PWSTR, @eActionType : Win32cr::System::Mmc::MMC_ACTION_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct MMC_LISTPAD_INFO
    property szTitle : Win32cr::Foundation::PWSTR
    property szButtonText : Win32cr::Foundation::PWSTR
    property nCommandID : LibC::IntPtrT
    def initialize(@szTitle : Win32cr::Foundation::PWSTR, @szButtonText : Win32cr::Foundation::PWSTR, @nCommandID : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct MMC_COLUMN_DATA
    property nColIndex : Int32
    property dwFlags : UInt32
    property nWidth : Int32
    property ulReserved : LibC::UIntPtrT
    def initialize(@nColIndex : Int32, @dwFlags : UInt32, @nWidth : Int32, @ulReserved : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct MMC_COLUMN_SET_DATA
    property cbSize : Int32
    property nNumCols : Int32
    property pColData : Win32cr::System::Mmc::MMC_COLUMN_DATA*
    def initialize(@cbSize : Int32, @nNumCols : Int32, @pColData : Win32cr::System::Mmc::MMC_COLUMN_DATA*)
    end
  end

  @[Extern]
  struct MMC_SORT_DATA
    property nColIndex : Int32
    property dwSortOptions : UInt32
    property ulReserved : LibC::UIntPtrT
    def initialize(@nColIndex : Int32, @dwSortOptions : UInt32, @ulReserved : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct MMC_SORT_SET_DATA
    property cbSize : Int32
    property nNumItems : Int32
    property pSortData : Win32cr::System::Mmc::MMC_SORT_DATA*
    def initialize(@cbSize : Int32, @nNumItems : Int32, @pSortData : Win32cr::System::Mmc::MMC_SORT_DATA*)
    end
  end

  @[Extern]
  struct RDITEMHDR
    property dwFlags : UInt32
    property cookie : LibC::IntPtrT
    property lpReserved : Win32cr::Foundation::LPARAM
    def initialize(@dwFlags : UInt32, @cookie : LibC::IntPtrT, @lpReserved : Win32cr::Foundation::LPARAM)
    end
  end

  @[Extern]
  struct RDCOMPARE
    property cbSize : UInt32
    property dwFlags : UInt32
    property nColumn : Int32
    property lUserParam : Win32cr::Foundation::LPARAM
    property prdch1 : Win32cr::System::Mmc::RDITEMHDR*
    property prdch2 : Win32cr::System::Mmc::RDITEMHDR*
    def initialize(@cbSize : UInt32, @dwFlags : UInt32, @nColumn : Int32, @lUserParam : Win32cr::Foundation::LPARAM, @prdch1 : Win32cr::System::Mmc::RDITEMHDR*, @prdch2 : Win32cr::System::Mmc::RDITEMHDR*)
    end
  end

  @[Extern]
  struct RESULT_VIEW_TYPE_INFO
    property pstrPersistableViewDescription : Win32cr::Foundation::PWSTR
    property eViewType : Win32cr::System::Mmc::MMC_VIEW_TYPE
    property dwMiscOptions : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property dwListOptions : UInt32
    property anonymous1 : Anonymous1_e__Struct_
    property anonymous2 : Anonymous2_e__Struct_

      # Nested Type Anonymous2_e__Struct_
      @[Extern]
      struct Anonymous2_e__Struct_
    property dwOCXOptions : UInt32
    property pUnkControl : Void*
    def initialize(@dwOCXOptions : UInt32, @pUnkControl : Void*)
    end
      end


      # Nested Type Anonymous1_e__Struct_
      @[Extern]
      struct Anonymous1_e__Struct_
    property dwHTMLOptions : UInt32
    property pstrURL : Win32cr::Foundation::PWSTR
    def initialize(@dwHTMLOptions : UInt32, @pstrURL : Win32cr::Foundation::PWSTR)
    end
      end

    def initialize(@dwListOptions : UInt32, @anonymous1 : Anonymous1_e__Struct_, @anonymous2 : Anonymous2_e__Struct_)
    end
    end

    def initialize(@pstrPersistableViewDescription : Win32cr::Foundation::PWSTR, @eViewType : Win32cr::System::Mmc::MMC_VIEW_TYPE, @dwMiscOptions : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct CONTEXTMENUITEM2
    property strName : Win32cr::Foundation::PWSTR
    property strStatusBarText : Win32cr::Foundation::PWSTR
    property lCommandID : Int32
    property lInsertionPointID : Int32
    property fFlags : Int32
    property fSpecialFlags : Int32
    property strLanguageIndependentName : Win32cr::Foundation::PWSTR
    def initialize(@strName : Win32cr::Foundation::PWSTR, @strStatusBarText : Win32cr::Foundation::PWSTR, @lCommandID : Int32, @lInsertionPointID : Int32, @fFlags : Int32, @fSpecialFlags : Int32, @strLanguageIndependentName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct MMC_EXT_VIEW_DATA
    property viewID : LibC::GUID
    property pszURL : Win32cr::Foundation::PWSTR
    property pszViewTitle : Win32cr::Foundation::PWSTR
    property pszTooltipText : Win32cr::Foundation::PWSTR
    property bReplacesDefaultView : Win32cr::Foundation::BOOL
    def initialize(@viewID : LibC::GUID, @pszURL : Win32cr::Foundation::PWSTR, @pszViewTitle : Win32cr::Foundation::PWSTR, @pszTooltipText : Win32cr::Foundation::PWSTR, @bReplacesDefaultView : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  record ISnapinPropertiesVtbl,
    query_interface : Proc(ISnapinProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISnapinProperties*, UInt32),
    release : Proc(ISnapinProperties*, UInt32),
    initialize__ : Proc(ISnapinProperties*, Void*, Win32cr::Foundation::HRESULT),
    query_property_names : Proc(ISnapinProperties*, Void*, Win32cr::Foundation::HRESULT),
    properties_changed : Proc(ISnapinProperties*, Int32, Win32cr::System::Mmc::MMC_SNAPIN_PROPERTY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISnapinProperties, lpVtbl : ISnapinPropertiesVtbl* do
    GUID = LibC::GUID.new(0xf7889da9_u32, 0x4a02_u16, 0x4837_u16, StaticArray[0xbf_u8, 0x89_u8, 0x1a_u8, 0x6f_u8, 0x2a_u8, 0x2_u8, 0x10_u8, 0x10_u8])
    def query_interface(this : ISnapinProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISnapinProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISnapinProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ISnapinProperties*, pProperties : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pProperties)
    end
    def query_property_names(this : ISnapinProperties*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_property_names.call(this, pCallback)
    end
    def properties_changed(this : ISnapinProperties*, cProperties : Int32, pProperties : Win32cr::System::Mmc::MMC_SNAPIN_PROPERTY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.properties_changed.call(this, cProperties, pProperties)
    end

  end

  @[Extern]
  record ISnapinPropertiesCallbackVtbl,
    query_interface : Proc(ISnapinPropertiesCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISnapinPropertiesCallback*, UInt32),
    release : Proc(ISnapinPropertiesCallback*, UInt32),
    add_property_name : Proc(ISnapinPropertiesCallback*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISnapinPropertiesCallback, lpVtbl : ISnapinPropertiesCallbackVtbl* do
    GUID = LibC::GUID.new(0xa50fa2e5_u32, 0x7e61_u16, 0x45eb_u16, StaticArray[0xa8_u8, 0xd4_u8, 0x9a_u8, 0x7_u8, 0xb3_u8, 0xe8_u8, 0x51_u8, 0xa8_u8])
    def query_interface(this : ISnapinPropertiesCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISnapinPropertiesCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISnapinPropertiesCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_property_name(this : ISnapinPropertiesCallback*, pszPropName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_name.call(this, pszPropName, dwFlags)
    end

  end

  @[Extern]
  record Application_Vtbl,
    query_interface : Proc(Application_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Application_*, UInt32),
    release : Proc(Application_*, UInt32),
    get_type_info_count : Proc(Application_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Application_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Application_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Application_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    help : Proc(Application_*, Void),
    quit : Proc(Application_*, Void),
    get_Document : Proc(Application_*, Void**, Win32cr::Foundation::HRESULT),
    load : Proc(Application_*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Frame : Proc(Application_*, Void**, Win32cr::Foundation::HRESULT),
    get_Visible : Proc(Application_*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    show : Proc(Application_*, Win32cr::Foundation::HRESULT),
    hide : Proc(Application_*, Win32cr::Foundation::HRESULT),
    get_UserControl : Proc(Application_*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_UserControl : Proc(Application_*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_VersionMajor : Proc(Application_*, Int32*, Win32cr::Foundation::HRESULT),
    get_VersionMinor : Proc(Application_*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Application_, lpVtbl : Application_Vtbl* do
    GUID = LibC::GUID.new(0xa3afb9cc_u32, 0xb653_u16, 0x4741_u16, StaticArray[0x86_u8, 0xab_u8, 0xf0_u8, 0x47_u8, 0xe_u8, 0xc1_u8, 0x38_u8, 0x4c_u8])
    def query_interface(this : Application_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Application_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Application_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Application_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Application_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Application_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Application_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def help(this : Application_*) : Void
      @lpVtbl.try &.value.help.call(this)
    end
    def quit(this : Application_*) : Void
      @lpVtbl.try &.value.quit.call(this)
    end
    def get_Document(this : Application_*, document : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Document.call(this, document)
    end
    def load(this : Application_*, filename : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, filename)
    end
    def get_Frame(this : Application_*, frame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Frame.call(this, frame)
    end
    def get_Visible(this : Application_*, visible : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Visible.call(this, visible)
    end
    def show(this : Application_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this)
    end
    def hide(this : Application_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hide.call(this)
    end
    def get_UserControl(this : Application_*, user_control : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserControl.call(this, user_control)
    end
    def put_UserControl(this : Application_*, user_control : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UserControl.call(this, user_control)
    end
    def get_VersionMajor(this : Application_*, version_major : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VersionMajor.call(this, version_major)
    end
    def get_VersionMinor(this : Application_*, version_minor : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VersionMinor.call(this, version_minor)
    end

  end

  @[Extern]
  record AppEvents_Vtbl,
    query_interface : Proc(AppEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AppEvents_*, UInt32),
    release : Proc(AppEvents_*, UInt32),
    get_type_info_count : Proc(AppEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(AppEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(AppEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(AppEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    on_quit : Proc(AppEvents_*, Void*, Win32cr::Foundation::HRESULT),
    on_document_open : Proc(AppEvents_*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    on_document_close : Proc(AppEvents_*, Void*, Win32cr::Foundation::HRESULT),
    on_snap_in_added : Proc(AppEvents_*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_snap_in_removed : Proc(AppEvents_*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_new_view : Proc(AppEvents_*, Void*, Win32cr::Foundation::HRESULT),
    on_view_close : Proc(AppEvents_*, Void*, Win32cr::Foundation::HRESULT),
    on_view_change : Proc(AppEvents_*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_selection_change : Proc(AppEvents_*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_context_menu_executed : Proc(AppEvents_*, Void*, Win32cr::Foundation::HRESULT),
    on_toolbar_button_clicked : Proc(AppEvents_*, Win32cr::Foundation::HRESULT),
    on_list_updated : Proc(AppEvents_*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AppEvents_, lpVtbl : AppEvents_Vtbl* do
    GUID = LibC::GUID.new(0xde46cbdd_u32, 0x53f5_u16, 0x4635_u16, StaticArray[0xaf_u8, 0x54_u8, 0x4f_u8, 0xe7_u8, 0x1e_u8, 0x92_u8, 0x3d_u8, 0x3f_u8])
    def query_interface(this : AppEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AppEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AppEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : AppEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : AppEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : AppEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : AppEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def on_quit(this : AppEvents_*, application : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_quit.call(this, application)
    end
    def on_document_open(this : AppEvents_*, document : Void*, new : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_document_open.call(this, document, new)
    end
    def on_document_close(this : AppEvents_*, document : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_document_close.call(this, document)
    end
    def on_snap_in_added(this : AppEvents_*, document : Void*, snap_in : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_snap_in_added.call(this, document, snap_in)
    end
    def on_snap_in_removed(this : AppEvents_*, document : Void*, snap_in : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_snap_in_removed.call(this, document, snap_in)
    end
    def on_new_view(this : AppEvents_*, view : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_new_view.call(this, view)
    end
    def on_view_close(this : AppEvents_*, view : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_view_close.call(this, view)
    end
    def on_view_change(this : AppEvents_*, view : Void*, new_owner_node : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_view_change.call(this, view, new_owner_node)
    end
    def on_selection_change(this : AppEvents_*, view : Void*, new_nodes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_selection_change.call(this, view, new_nodes)
    end
    def on_context_menu_executed(this : AppEvents_*, menu_item : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_context_menu_executed.call(this, menu_item)
    end
    def on_toolbar_button_clicked(this : AppEvents_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_toolbar_button_clicked.call(this)
    end
    def on_list_updated(this : AppEvents_*, view : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_list_updated.call(this, view)
    end

  end

  @[Extern]
  record AppEventsVtbl,
    query_interface : Proc(AppEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AppEvents*, UInt32),
    release : Proc(AppEvents*, UInt32),
    get_type_info_count : Proc(AppEvents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(AppEvents*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(AppEvents*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(AppEvents*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AppEvents, lpVtbl : AppEventsVtbl* do
    GUID = LibC::GUID.new(0xfc7a4252_u32, 0x78ac_u16, 0x4532_u16, StaticArray[0x8c_u8, 0x5a_u8, 0x56_u8, 0x3c_u8, 0xfe_u8, 0x13_u8, 0x88_u8, 0x63_u8])
    def query_interface(this : AppEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AppEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AppEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : AppEvents*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : AppEvents*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : AppEvents*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : AppEvents*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record EventConnector_Vtbl,
    query_interface : Proc(EventConnector_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(EventConnector_*, UInt32),
    release : Proc(EventConnector_*, UInt32),
    get_type_info_count : Proc(EventConnector_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(EventConnector_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(EventConnector_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(EventConnector_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    connect_to : Proc(EventConnector_*, Void*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(EventConnector_*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record EventConnector_, lpVtbl : EventConnector_Vtbl* do
    GUID = LibC::GUID.new(0xc0bccd30_u32, 0xde44_u16, 0x4528_u16, StaticArray[0x84_u8, 0x3_u8, 0xa0_u8, 0x5a_u8, 0x6a_u8, 0x1c_u8, 0xc8_u8, 0xea_u8])
    def query_interface(this : EventConnector_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : EventConnector_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : EventConnector_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : EventConnector_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : EventConnector_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : EventConnector_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : EventConnector_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def connect_to(this : EventConnector_*, application : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_to.call(this, application)
    end
    def disconnect(this : EventConnector_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end

  end

  @[Extern]
  record FrameVtbl,
    query_interface : Proc(Frame*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Frame*, UInt32),
    release : Proc(Frame*, UInt32),
    get_type_info_count : Proc(Frame*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Frame*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Frame*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Frame*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    maximize : Proc(Frame*, Win32cr::Foundation::HRESULT),
    minimize : Proc(Frame*, Win32cr::Foundation::HRESULT),
    restore : Proc(Frame*, Win32cr::Foundation::HRESULT),
    get_Top : Proc(Frame*, Int32*, Win32cr::Foundation::HRESULT),
    put_Top : Proc(Frame*, Int32, Win32cr::Foundation::HRESULT),
    get_Bottom : Proc(Frame*, Int32*, Win32cr::Foundation::HRESULT),
    put_Bottom : Proc(Frame*, Int32, Win32cr::Foundation::HRESULT),
    get_Left : Proc(Frame*, Int32*, Win32cr::Foundation::HRESULT),
    put_Left : Proc(Frame*, Int32, Win32cr::Foundation::HRESULT),
    get_Right : Proc(Frame*, Int32*, Win32cr::Foundation::HRESULT),
    put_Right : Proc(Frame*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Frame, lpVtbl : FrameVtbl* do
    GUID = LibC::GUID.new(0xe5e2d970_u32, 0x5bb3_u16, 0x4306_u16, StaticArray[0x88_u8, 0x4_u8, 0xb0_u8, 0x96_u8, 0x8a_u8, 0x31_u8, 0xc8_u8, 0xe6_u8])
    def query_interface(this : Frame*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Frame*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Frame*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Frame*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Frame*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Frame*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Frame*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def maximize(this : Frame*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.maximize.call(this)
    end
    def minimize(this : Frame*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.minimize.call(this)
    end
    def restore(this : Frame*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore.call(this)
    end
    def get_Top(this : Frame*, top : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Top.call(this, top)
    end
    def put_Top(this : Frame*, top : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Top.call(this, top)
    end
    def get_Bottom(this : Frame*, bottom : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Bottom.call(this, bottom)
    end
    def put_Bottom(this : Frame*, bottom : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Bottom.call(this, bottom)
    end
    def get_Left(this : Frame*, left : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Left.call(this, left)
    end
    def put_Left(this : Frame*, left : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Left.call(this, left)
    end
    def get_Right(this : Frame*, right : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Right.call(this, right)
    end
    def put_Right(this : Frame*, right : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Right.call(this, right)
    end

  end

  @[Extern]
  record NodeVtbl,
    query_interface : Proc(Node*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Node*, UInt32),
    release : Proc(Node*, UInt32),
    get_type_info_count : Proc(Node*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Node*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Node*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Node*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(Node*, UInt16**, Win32cr::Foundation::HRESULT),
    get_Property : Proc(Node*, Win32cr::Foundation::BSTR, UInt16**, Win32cr::Foundation::HRESULT),
    get_Bookmark : Proc(Node*, UInt16**, Win32cr::Foundation::HRESULT),
    is_scope_node : Proc(Node*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_Nodetype : Proc(Node*, UInt16**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Node, lpVtbl : NodeVtbl* do
    GUID = LibC::GUID.new(0xf81ed800_u32, 0x7839_u16, 0x4447_u16, StaticArray[0x94_u8, 0x5d_u8, 0x8e_u8, 0x15_u8, 0xda_u8, 0x59_u8, 0xca_u8, 0x55_u8])
    def query_interface(this : Node*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Node*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Node*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Node*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Node*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Node*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Node*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : Node*, name : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Property(this : Node*, property_name : Win32cr::Foundation::BSTR, property_value : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Property.call(this, property_name, property_value)
    end
    def get_Bookmark(this : Node*, bookmark : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Bookmark.call(this, bookmark)
    end
    def is_scope_node(this : Node*, is_scope_node : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_scope_node.call(this, is_scope_node)
    end
    def get_Nodetype(this : Node*, nodetype : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Nodetype.call(this, nodetype)
    end

  end

  @[Extern]
  record ScopeNamespaceVtbl,
    query_interface : Proc(ScopeNamespace*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ScopeNamespace*, UInt32),
    release : Proc(ScopeNamespace*, UInt32),
    get_type_info_count : Proc(ScopeNamespace*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ScopeNamespace*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ScopeNamespace*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ScopeNamespace*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(ScopeNamespace*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_child : Proc(ScopeNamespace*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_next : Proc(ScopeNamespace*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_root : Proc(ScopeNamespace*, Void**, Win32cr::Foundation::HRESULT),
    expand : Proc(ScopeNamespace*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ScopeNamespace, lpVtbl : ScopeNamespaceVtbl* do
    GUID = LibC::GUID.new(0xebbb48dc_u32, 0x1a3b_u16, 0x4d86_u16, StaticArray[0xb7_u8, 0x86_u8, 0xc2_u8, 0x1b_u8, 0x28_u8, 0x38_u8, 0x90_u8, 0x12_u8])
    def query_interface(this : ScopeNamespace*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ScopeNamespace*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ScopeNamespace*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ScopeNamespace*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ScopeNamespace*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ScopeNamespace*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ScopeNamespace*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_parent(this : ScopeNamespace*, node : Void*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, node, parent)
    end
    def get_child(this : ScopeNamespace*, node : Void*, child : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_child.call(this, node, child)
    end
    def get_next(this : ScopeNamespace*, node : Void*, next__ : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next.call(this, node, next__)
    end
    def get_root(this : ScopeNamespace*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root.call(this, root)
    end
    def expand(this : ScopeNamespace*, node : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this, node)
    end

  end

  @[Extern]
  record DocumentVtbl,
    query_interface : Proc(Document*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Document*, UInt32),
    release : Proc(Document*, UInt32),
    get_type_info_count : Proc(Document*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Document*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Document*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Document*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    save : Proc(Document*, Win32cr::Foundation::HRESULT),
    save_as : Proc(Document*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    close : Proc(Document*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Views : Proc(Document*, Void**, Win32cr::Foundation::HRESULT),
    get_SnapIns : Proc(Document*, Void**, Win32cr::Foundation::HRESULT),
    get_ActiveView : Proc(Document*, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(Document*, UInt16**, Win32cr::Foundation::HRESULT),
    put_Name : Proc(Document*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Location : Proc(Document*, UInt16**, Win32cr::Foundation::HRESULT),
    get_IsSaved : Proc(Document*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_Mode : Proc(Document*, Win32cr::System::Mmc::DocumentMode_*, Win32cr::Foundation::HRESULT),
    put_Mode : Proc(Document*, Win32cr::System::Mmc::DocumentMode_, Win32cr::Foundation::HRESULT),
    get_RootNode : Proc(Document*, Void**, Win32cr::Foundation::HRESULT),
    get_ScopeNamespace : Proc(Document*, Void**, Win32cr::Foundation::HRESULT),
    create_properties : Proc(Document*, Void**, Win32cr::Foundation::HRESULT),
    get_Application : Proc(Document*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Document, lpVtbl : DocumentVtbl* do
    GUID = LibC::GUID.new(0x225120d6_u32, 0x1e0f_u16, 0x40a3_u16, StaticArray[0x93_u8, 0xfe_u8, 0x10_u8, 0x79_u8, 0xe6_u8, 0xa8_u8, 0x1_u8, 0x7b_u8])
    def query_interface(this : Document*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Document*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Document*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Document*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Document*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Document*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Document*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def save(this : Document*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def save_as(this : Document*, filename : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_as.call(this, filename)
    end
    def close(this : Document*, save_changes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this, save_changes)
    end
    def get_Views(this : Document*, views : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Views.call(this, views)
    end
    def get_SnapIns(this : Document*, snap_ins : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SnapIns.call(this, snap_ins)
    end
    def get_ActiveView(this : Document*, view : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActiveView.call(this, view)
    end
    def get_Name(this : Document*, name : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : Document*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Location(this : Document*, location : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Location.call(this, location)
    end
    def get_IsSaved(this : Document*, is_saved : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsSaved.call(this, is_saved)
    end
    def get_Mode(this : Document*, mode : Win32cr::System::Mmc::DocumentMode_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Mode.call(this, mode)
    end
    def put_Mode(this : Document*, mode : Win32cr::System::Mmc::DocumentMode_) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Mode.call(this, mode)
    end
    def get_RootNode(this : Document*, node : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RootNode.call(this, node)
    end
    def get_ScopeNamespace(this : Document*, scope_namespace : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScopeNamespace.call(this, scope_namespace)
    end
    def create_properties(this : Document*, properties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_properties.call(this, properties)
    end
    def get_Application(this : Document*, application : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Application.call(this, application)
    end

  end

  @[Extern]
  record SnapInVtbl,
    query_interface : Proc(SnapIn*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(SnapIn*, UInt32),
    release : Proc(SnapIn*, UInt32),
    get_type_info_count : Proc(SnapIn*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(SnapIn*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(SnapIn*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(SnapIn*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(SnapIn*, UInt16**, Win32cr::Foundation::HRESULT),
    get_Vendor : Proc(SnapIn*, UInt16**, Win32cr::Foundation::HRESULT),
    get_Version : Proc(SnapIn*, UInt16**, Win32cr::Foundation::HRESULT),
    get_Extensions : Proc(SnapIn*, Void**, Win32cr::Foundation::HRESULT),
    get_SnapinCLSID : Proc(SnapIn*, UInt16**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(SnapIn*, Void**, Win32cr::Foundation::HRESULT),
    enable_all_extensions : Proc(SnapIn*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record SnapIn, lpVtbl : SnapInVtbl* do
    GUID = LibC::GUID.new(0x3be910f6_u32, 0x3459_u16, 0x49c6_u16, StaticArray[0xa1_u8, 0xbb_u8, 0x41_u8, 0xe6_u8, 0xbe_u8, 0x9d_u8, 0xf3_u8, 0xea_u8])
    def query_interface(this : SnapIn*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : SnapIn*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : SnapIn*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : SnapIn*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : SnapIn*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : SnapIn*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : SnapIn*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : SnapIn*, name : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Vendor(this : SnapIn*, vendor : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Vendor.call(this, vendor)
    end
    def get_Version(this : SnapIn*, version : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, version)
    end
    def get_Extensions(this : SnapIn*, extensions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Extensions.call(this, extensions)
    end
    def get_SnapinCLSID(this : SnapIn*, snapin_clsid : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SnapinCLSID.call(this, snapin_clsid)
    end
    def get_Properties(this : SnapIn*, properties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, properties)
    end
    def enable_all_extensions(this : SnapIn*, enable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_all_extensions.call(this, enable)
    end

  end

  @[Extern]
  record SnapInsVtbl,
    query_interface : Proc(SnapIns*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(SnapIns*, UInt32),
    release : Proc(SnapIns*, UInt32),
    get_type_info_count : Proc(SnapIns*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(SnapIns*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(SnapIns*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(SnapIns*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(SnapIns*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(SnapIns*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(SnapIns*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(SnapIns*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(SnapIns*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record SnapIns, lpVtbl : SnapInsVtbl* do
    GUID = LibC::GUID.new(0x2ef3de1d_u32, 0xb12a_u16, 0x49d1_u16, StaticArray[0x92_u8, 0xc5_u8, 0xb_u8, 0x0_u8, 0x79_u8, 0x87_u8, 0x68_u8, 0xf1_u8])
    def query_interface(this : SnapIns*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : SnapIns*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : SnapIns*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : SnapIns*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : SnapIns*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : SnapIns*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : SnapIns*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : SnapIns*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def item(this : SnapIns*, index : Int32, snap_in : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, snap_in)
    end
    def get_Count(this : SnapIns*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def add(this : SnapIns*, snapin_name_or_clsid : Win32cr::Foundation::BSTR, parent_snapin : Win32cr::System::Com::VARIANT, properties : Win32cr::System::Com::VARIANT, snap_in : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, snapin_name_or_clsid, parent_snapin, properties, snap_in)
    end
    def remove(this : SnapIns*, snap_in : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, snap_in)
    end

  end

  @[Extern]
  record ExtensionVtbl,
    query_interface : Proc(Extension*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Extension*, UInt32),
    release : Proc(Extension*, UInt32),
    get_type_info_count : Proc(Extension*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Extension*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Extension*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Extension*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(Extension*, UInt16**, Win32cr::Foundation::HRESULT),
    get_Vendor : Proc(Extension*, UInt16**, Win32cr::Foundation::HRESULT),
    get_Version : Proc(Extension*, UInt16**, Win32cr::Foundation::HRESULT),
    get_Extensions : Proc(Extension*, Void**, Win32cr::Foundation::HRESULT),
    get_SnapinCLSID : Proc(Extension*, UInt16**, Win32cr::Foundation::HRESULT),
    enable_all_extensions : Proc(Extension*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    enable : Proc(Extension*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Extension, lpVtbl : ExtensionVtbl* do
    GUID = LibC::GUID.new(0xad4d6ca6_u32, 0x912f_u16, 0x409b_u16, StaticArray[0xa2_u8, 0x6e_u8, 0x7f_u8, 0xd2_u8, 0x34_u8, 0xae_u8, 0xf5_u8, 0x42_u8])
    def query_interface(this : Extension*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Extension*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Extension*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Extension*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Extension*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Extension*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Extension*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : Extension*, name : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Vendor(this : Extension*, vendor : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Vendor.call(this, vendor)
    end
    def get_Version(this : Extension*, version : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, version)
    end
    def get_Extensions(this : Extension*, extensions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Extensions.call(this, extensions)
    end
    def get_SnapinCLSID(this : Extension*, snapin_clsid : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SnapinCLSID.call(this, snapin_clsid)
    end
    def enable_all_extensions(this : Extension*, enable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_all_extensions.call(this, enable)
    end
    def enable(this : Extension*, enable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this, enable)
    end

  end

  @[Extern]
  record ExtensionsVtbl,
    query_interface : Proc(Extensions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Extensions*, UInt32),
    release : Proc(Extensions*, UInt32),
    get_type_info_count : Proc(Extensions*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Extensions*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Extensions*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Extensions*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(Extensions*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(Extensions*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(Extensions*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Extensions, lpVtbl : ExtensionsVtbl* do
    GUID = LibC::GUID.new(0x82dbea43_u32, 0x8ca4_u16, 0x44bc_u16, StaticArray[0xa2_u8, 0xca_u8, 0xd1_u8, 0x87_u8, 0x41_u8, 0x5_u8, 0x9e_u8, 0xc8_u8])
    def query_interface(this : Extensions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Extensions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Extensions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Extensions*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Extensions*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Extensions*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Extensions*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : Extensions*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def item(this : Extensions*, index : Int32, extension : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, extension)
    end
    def get_Count(this : Extensions*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end

  end

  @[Extern]
  record ColumnsVtbl,
    query_interface : Proc(Columns*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Columns*, UInt32),
    release : Proc(Columns*, UInt32),
    get_type_info_count : Proc(Columns*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Columns*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Columns*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Columns*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    item : Proc(Columns*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(Columns*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(Columns*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Columns, lpVtbl : ColumnsVtbl* do
    GUID = LibC::GUID.new(0x383d4d97_u32, 0xfc44_u16, 0x478b_u16, StaticArray[0xb1_u8, 0x39_u8, 0x63_u8, 0x23_u8, 0xdc_u8, 0x48_u8, 0x61_u8, 0x1c_u8])
    def query_interface(this : Columns*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Columns*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Columns*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Columns*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Columns*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Columns*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Columns*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def item(this : Columns*, index : Int32, column : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, column)
    end
    def get_Count(this : Columns*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get__NewEnum(this : Columns*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end

  end

  @[Extern]
  record ColumnVtbl,
    query_interface : Proc(Column*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Column*, UInt32),
    release : Proc(Column*, UInt32),
    get_type_info_count : Proc(Column*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Column*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Column*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Column*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    name : Proc(Column*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Width : Proc(Column*, Int32*, Win32cr::Foundation::HRESULT),
    put_Width : Proc(Column*, Int32, Win32cr::Foundation::HRESULT),
    get_DisplayPosition : Proc(Column*, Int32*, Win32cr::Foundation::HRESULT),
    put_DisplayPosition : Proc(Column*, Int32, Win32cr::Foundation::HRESULT),
    get_Hidden : Proc(Column*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_Hidden : Proc(Column*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_as_sort_column : Proc(Column*, Win32cr::System::Mmc::ColumnSortOrder_, Win32cr::Foundation::HRESULT),
    is_sort_column : Proc(Column*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Column, lpVtbl : ColumnVtbl* do
    GUID = LibC::GUID.new(0xfd1c5f63_u32, 0x2b16_u16, 0x4d06_u16, StaticArray[0x9a_u8, 0xb3_u8, 0xf4_u8, 0x53_u8, 0x50_u8, 0xb9_u8, 0x40_u8, 0xab_u8])
    def query_interface(this : Column*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Column*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Column*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Column*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Column*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Column*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Column*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def name(this : Column*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.name.call(this, name)
    end
    def get_Width(this : Column*, width : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Width.call(this, width)
    end
    def put_Width(this : Column*, width : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Width.call(this, width)
    end
    def get_DisplayPosition(this : Column*, display_position : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayPosition.call(this, display_position)
    end
    def put_DisplayPosition(this : Column*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayPosition.call(this, index)
    end
    def get_Hidden(this : Column*, hidden : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Hidden.call(this, hidden)
    end
    def put_Hidden(this : Column*, hidden : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Hidden.call(this, hidden)
    end
    def set_as_sort_column(this : Column*, sort_order : Win32cr::System::Mmc::ColumnSortOrder_) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_as_sort_column.call(this, sort_order)
    end
    def is_sort_column(this : Column*, is_sort_column : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_sort_column.call(this, is_sort_column)
    end

  end

  @[Extern]
  record ViewsVtbl,
    query_interface : Proc(Views*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Views*, UInt32),
    release : Proc(Views*, UInt32),
    get_type_info_count : Proc(Views*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Views*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Views*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Views*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    item : Proc(Views*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(Views*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(Views*, Void*, Win32cr::System::Mmc::ViewOptions_, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(Views*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Views, lpVtbl : ViewsVtbl* do
    GUID = LibC::GUID.new(0xd6b8c29d_u32, 0xa1ff_u16, 0x4d72_u16, StaticArray[0xaa_u8, 0xb0_u8, 0xe3_u8, 0x81_u8, 0xe9_u8, 0xb9_u8, 0x33_u8, 0x8d_u8])
    def query_interface(this : Views*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Views*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Views*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Views*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Views*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Views*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Views*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def item(this : Views*, index : Int32, view : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, view)
    end
    def get_Count(this : Views*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def add(this : Views*, node : Void*, viewOptions : Win32cr::System::Mmc::ViewOptions_) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, node, viewOptions)
    end
    def get__NewEnum(this : Views*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end

  end

  @[Extern]
  record ViewVtbl,
    query_interface : Proc(View*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(View*, UInt32),
    release : Proc(View*, UInt32),
    get_type_info_count : Proc(View*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(View*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(View*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(View*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ActiveScopeNode : Proc(View*, Void**, Win32cr::Foundation::HRESULT),
    put_ActiveScopeNode : Proc(View*, Void*, Win32cr::Foundation::HRESULT),
    get_Selection : Proc(View*, Void**, Win32cr::Foundation::HRESULT),
    get_ListItems : Proc(View*, Void**, Win32cr::Foundation::HRESULT),
    snapin_scope_object : Proc(View*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    snapin_selection_object : Proc(View*, Void**, Win32cr::Foundation::HRESULT),
    is : Proc(View*, Void*, Int16*, Win32cr::Foundation::HRESULT),
    get_Document : Proc(View*, Void**, Win32cr::Foundation::HRESULT),
    select_all : Proc(View*, Win32cr::Foundation::HRESULT),
    select__ : Proc(View*, Void*, Win32cr::Foundation::HRESULT),
    deselect : Proc(View*, Void*, Win32cr::Foundation::HRESULT),
    is_selected : Proc(View*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    display_scope_node_property_sheet : Proc(View*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    display_selection_property_sheet : Proc(View*, Win32cr::Foundation::HRESULT),
    copy_scope_node : Proc(View*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    copy_selection : Proc(View*, Win32cr::Foundation::HRESULT),
    delete_scope_node : Proc(View*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete_selection : Proc(View*, Win32cr::Foundation::HRESULT),
    rename_scope_node : Proc(View*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    rename_selected_item : Proc(View*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ScopeNodeContextMenu : Proc(View*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_SelectionContextMenu : Proc(View*, Void**, Win32cr::Foundation::HRESULT),
    refresh_scope_node : Proc(View*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    refresh_selection : Proc(View*, Win32cr::Foundation::HRESULT),
    execute_selection_menu_item : Proc(View*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    execute_scope_node_menu_item : Proc(View*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    execute_shell_command : Proc(View*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Frame : Proc(View*, Void**, Win32cr::Foundation::HRESULT),
    close : Proc(View*, Win32cr::Foundation::HRESULT),
    get_ScopeTreeVisible : Proc(View*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ScopeTreeVisible : Proc(View*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    back : Proc(View*, Win32cr::Foundation::HRESULT),
    forward : Proc(View*, Win32cr::Foundation::HRESULT),
    put_StatusBarText : Proc(View*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Memento : Proc(View*, UInt16**, Win32cr::Foundation::HRESULT),
    view_memento : Proc(View*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Columns : Proc(View*, Void**, Win32cr::Foundation::HRESULT),
    get_CellContents : Proc(View*, Void*, Int32, UInt16**, Win32cr::Foundation::HRESULT),
    export_list : Proc(View*, Win32cr::Foundation::BSTR, Win32cr::System::Mmc::ExportListOptions_, Win32cr::Foundation::HRESULT),
    get_ListViewMode : Proc(View*, Win32cr::System::Mmc::ListViewMode_*, Win32cr::Foundation::HRESULT),
    put_ListViewMode : Proc(View*, Win32cr::System::Mmc::ListViewMode_, Win32cr::Foundation::HRESULT),
    get_ControlObject : Proc(View*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record View, lpVtbl : ViewVtbl* do
    GUID = LibC::GUID.new(0x6efc2da2_u32, 0xb38c_u16, 0x457e_u16, StaticArray[0x9a_u8, 0xbb_u8, 0xed_u8, 0x2d_u8, 0x18_u8, 0x9b_u8, 0x8c_u8, 0x38_u8])
    def query_interface(this : View*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : View*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : View*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : View*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : View*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : View*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : View*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ActiveScopeNode(this : View*, node : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActiveScopeNode.call(this, node)
    end
    def put_ActiveScopeNode(this : View*, node : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ActiveScopeNode.call(this, node)
    end
    def get_Selection(this : View*, nodes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Selection.call(this, nodes)
    end
    def get_ListItems(this : View*, nodes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ListItems.call(this, nodes)
    end
    def snapin_scope_object(this : View*, scope_node : Win32cr::System::Com::VARIANT, scope_node_object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.snapin_scope_object.call(this, scope_node, scope_node_object)
    end
    def snapin_selection_object(this : View*, selection_object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.snapin_selection_object.call(this, selection_object)
    end
    def is(this : View*, view : Void*, the_same : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is.call(this, view, the_same)
    end
    def get_Document(this : View*, document : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Document.call(this, document)
    end
    def select_all(this : View*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select_all.call(this)
    end
    def select__(this : View*, node : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this, node)
    end
    def deselect(this : View*, node : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deselect.call(this, node)
    end
    def is_selected(this : View*, node : Void*, is_selected : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_selected.call(this, node, is_selected)
    end
    def display_scope_node_property_sheet(this : View*, scope_node : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_scope_node_property_sheet.call(this, scope_node)
    end
    def display_selection_property_sheet(this : View*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_selection_property_sheet.call(this)
    end
    def copy_scope_node(this : View*, scope_node : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_scope_node.call(this, scope_node)
    end
    def copy_selection(this : View*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_selection.call(this)
    end
    def delete_scope_node(this : View*, scope_node : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_scope_node.call(this, scope_node)
    end
    def delete_selection(this : View*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_selection.call(this)
    end
    def rename_scope_node(this : View*, new_name : Win32cr::Foundation::BSTR, scope_node : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename_scope_node.call(this, new_name, scope_node)
    end
    def rename_selected_item(this : View*, new_name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename_selected_item.call(this, new_name)
    end
    def get_ScopeNodeContextMenu(this : View*, scope_node : Win32cr::System::Com::VARIANT, context_menu : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScopeNodeContextMenu.call(this, scope_node, context_menu)
    end
    def get_SelectionContextMenu(this : View*, context_menu : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelectionContextMenu.call(this, context_menu)
    end
    def refresh_scope_node(this : View*, scope_node : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_scope_node.call(this, scope_node)
    end
    def refresh_selection(this : View*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_selection.call(this)
    end
    def execute_selection_menu_item(this : View*, menu_item_path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_selection_menu_item.call(this, menu_item_path)
    end
    def execute_scope_node_menu_item(this : View*, menu_item_path : Win32cr::Foundation::BSTR, scope_node : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_scope_node_menu_item.call(this, menu_item_path, scope_node)
    end
    def execute_shell_command(this : View*, command : Win32cr::Foundation::BSTR, directory : Win32cr::Foundation::BSTR, parameters : Win32cr::Foundation::BSTR, window_state : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_shell_command.call(this, command, directory, parameters, window_state)
    end
    def get_Frame(this : View*, frame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Frame.call(this, frame)
    end
    def close(this : View*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_ScopeTreeVisible(this : View*, visible : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScopeTreeVisible.call(this, visible)
    end
    def put_ScopeTreeVisible(this : View*, visible : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScopeTreeVisible.call(this, visible)
    end
    def back(this : View*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.back.call(this)
    end
    def forward(this : View*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.forward.call(this)
    end
    def put_StatusBarText(this : View*, status_bar_text : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StatusBarText.call(this, status_bar_text)
    end
    def get_Memento(this : View*, memento : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Memento.call(this, memento)
    end
    def view_memento(this : View*, memento : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.view_memento.call(this, memento)
    end
    def get_Columns(this : View*, columns : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Columns.call(this, columns)
    end
    def get_CellContents(this : View*, node : Void*, column : Int32, cell_contents : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CellContents.call(this, node, column, cell_contents)
    end
    def export_list(this : View*, file : Win32cr::Foundation::BSTR, exportoptions : Win32cr::System::Mmc::ExportListOptions_) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_list.call(this, file, exportoptions)
    end
    def get_ListViewMode(this : View*, mode : Win32cr::System::Mmc::ListViewMode_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ListViewMode.call(this, mode)
    end
    def put_ListViewMode(this : View*, mode : Win32cr::System::Mmc::ListViewMode_) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ListViewMode.call(this, mode)
    end
    def get_ControlObject(this : View*, control : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlObject.call(this, control)
    end

  end

  @[Extern]
  record NodesVtbl,
    query_interface : Proc(Nodes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Nodes*, UInt32),
    release : Proc(Nodes*, UInt32),
    get_type_info_count : Proc(Nodes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Nodes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Nodes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Nodes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(Nodes*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(Nodes*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(Nodes*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Nodes, lpVtbl : NodesVtbl* do
    GUID = LibC::GUID.new(0x313b01df_u32, 0xb22f_u16, 0x4d42_u16, StaticArray[0xb1_u8, 0xb8_u8, 0x48_u8, 0x3c_u8, 0xdc_u8, 0xf5_u8, 0x1d_u8, 0x35_u8])
    def query_interface(this : Nodes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Nodes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Nodes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Nodes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Nodes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Nodes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Nodes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : Nodes*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def item(this : Nodes*, index : Int32, node : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, node)
    end
    def get_Count(this : Nodes*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end

  end

  @[Extern]
  record ContextMenuVtbl,
    query_interface : Proc(ContextMenu*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ContextMenu*, UInt32),
    release : Proc(ContextMenu*, UInt32),
    get_type_info_count : Proc(ContextMenu*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ContextMenu*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ContextMenu*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ContextMenu*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ContextMenu*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ContextMenu*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ContextMenu*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ContextMenu, lpVtbl : ContextMenuVtbl* do
    GUID = LibC::GUID.new(0xdab39ce0_u32, 0x25e6_u16, 0x4e07_u16, StaticArray[0x83_u8, 0x62_u8, 0xba_u8, 0x9c_u8, 0x95_u8, 0x70_u8, 0x65_u8, 0x45_u8])
    def query_interface(this : ContextMenu*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ContextMenu*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ContextMenu*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ContextMenu*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ContextMenu*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ContextMenu*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ContextMenu*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : ContextMenu*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : ContextMenu*, index_or_path : Win32cr::System::Com::VARIANT, menu_item : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index_or_path, menu_item)
    end
    def get_Count(this : ContextMenu*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end

  end

  @[Extern]
  record MenuItemVtbl,
    query_interface : Proc(MenuItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(MenuItem*, UInt32),
    release : Proc(MenuItem*, UInt32),
    get_type_info_count : Proc(MenuItem*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(MenuItem*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(MenuItem*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(MenuItem*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(MenuItem*, UInt16**, Win32cr::Foundation::HRESULT),
    get_LanguageIndependentName : Proc(MenuItem*, UInt16**, Win32cr::Foundation::HRESULT),
    get_Path : Proc(MenuItem*, UInt16**, Win32cr::Foundation::HRESULT),
    get_LanguageIndependentPath : Proc(MenuItem*, UInt16**, Win32cr::Foundation::HRESULT),
    execute : Proc(MenuItem*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(MenuItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record MenuItem, lpVtbl : MenuItemVtbl* do
    GUID = LibC::GUID.new(0x178fad1_u32, 0xb361_u16, 0x4b27_u16, StaticArray[0x96_u8, 0xad_u8, 0x67_u8, 0xc5_u8, 0x7e_u8, 0xbf_u8, 0x2e_u8, 0x1d_u8])
    def query_interface(this : MenuItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : MenuItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : MenuItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : MenuItem*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : MenuItem*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : MenuItem*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : MenuItem*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DisplayName(this : MenuItem*, display_name : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, display_name)
    end
    def get_LanguageIndependentName(this : MenuItem*, language_independent_name : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LanguageIndependentName.call(this, language_independent_name)
    end
    def get_Path(this : MenuItem*, path : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, path)
    end
    def get_LanguageIndependentPath(this : MenuItem*, language_independent_path : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LanguageIndependentPath.call(this, language_independent_path)
    end
    def execute(this : MenuItem*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute.call(this)
    end
    def get_Enabled(this : MenuItem*, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end

  end

  @[Extern]
  record PropertiesVtbl,
    query_interface : Proc(Properties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Properties*, UInt32),
    release : Proc(Properties*, UInt32),
    get_type_info_count : Proc(Properties*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Properties*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Properties*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Properties*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(Properties*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(Properties*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(Properties*, Int32*, Win32cr::Foundation::HRESULT),
    remove : Proc(Properties*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Properties, lpVtbl : PropertiesVtbl* do
    GUID = LibC::GUID.new(0x2886abc2_u32, 0xa425_u16, 0x42b2_u16, StaticArray[0x91_u8, 0xc6_u8, 0xe2_u8, 0x5c_u8, 0xe_u8, 0x4_u8, 0x58_u8, 0x1c_u8])
    def query_interface(this : Properties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Properties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Properties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Properties*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Properties*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Properties*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Properties*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : Properties*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def item(this : Properties*, name : Win32cr::Foundation::BSTR, property : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, name, property)
    end
    def get_Count(this : Properties*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def remove(this : Properties*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, name)
    end

  end

  @[Extern]
  record PropertyVtbl,
    query_interface : Proc(Property*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(Property*, UInt32),
    release : Proc(Property*, UInt32),
    get_type_info_count : Proc(Property*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(Property*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(Property*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(Property*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(Property*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(Property*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Name : Proc(Property*, UInt16**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record Property, lpVtbl : PropertyVtbl* do
    GUID = LibC::GUID.new(0x4600c3a5_u32, 0xe301_u16, 0x41d8_u16, StaticArray[0xb6_u8, 0xd0_u8, 0xef_u8, 0x2e_u8, 0x42_u8, 0x12_u8, 0xe0_u8, 0xca_u8])
    def query_interface(this : Property*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : Property*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : Property*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : Property*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : Property*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : Property*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : Property*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Value(this : Property*, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, value)
    end
    def put_Value(this : Property*, value : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, value)
    end
    def get_Name(this : Property*, name : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end

  end

  @[Extern]
  record IComponentDataVtbl,
    query_interface : Proc(IComponentData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComponentData*, UInt32),
    release : Proc(IComponentData*, UInt32),
    initialize__ : Proc(IComponentData*, Void*, Win32cr::Foundation::HRESULT),
    create_component : Proc(IComponentData*, Void**, Win32cr::Foundation::HRESULT),
    notify : Proc(IComponentData*, Void*, Win32cr::System::Mmc::MMC_NOTIFY_TYPE, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    destroy : Proc(IComponentData*, Win32cr::Foundation::HRESULT),
    query_data_object : Proc(IComponentData*, LibC::IntPtrT, Win32cr::System::Mmc::DATA_OBJECT_TYPES, Void**, Win32cr::Foundation::HRESULT),
    get_display_info : Proc(IComponentData*, Win32cr::System::Mmc::SCOPEDATAITEM*, Win32cr::Foundation::HRESULT),
    compare_objects : Proc(IComponentData*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IComponentData, lpVtbl : IComponentDataVtbl* do
    GUID = LibC::GUID.new(0x955ab28a_u32, 0x5218_u16, 0x11d0_u16, StaticArray[0xa9_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
    def query_interface(this : IComponentData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComponentData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComponentData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IComponentData*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pUnknown)
    end
    def create_component(this : IComponentData*, ppComponent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_component.call(this, ppComponent)
    end
    def notify(this : IComponentData*, lpDataObject : Void*, event : Win32cr::System::Mmc::MMC_NOTIFY_TYPE, arg : Win32cr::Foundation::LPARAM, param3 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, lpDataObject, event, arg, param3)
    end
    def destroy(this : IComponentData*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy.call(this)
    end
    def query_data_object(this : IComponentData*, cookie : LibC::IntPtrT, type__ : Win32cr::System::Mmc::DATA_OBJECT_TYPES, ppDataObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_data_object.call(this, cookie, type__, ppDataObject)
    end
    def get_display_info(this : IComponentData*, pScopeDataItem : Win32cr::System::Mmc::SCOPEDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_info.call(this, pScopeDataItem)
    end
    def compare_objects(this : IComponentData*, lpDataObjectA : Void*, lpDataObjectB : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_objects.call(this, lpDataObjectA, lpDataObjectB)
    end

  end

  @[Extern]
  record IComponentVtbl,
    query_interface : Proc(IComponent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComponent*, UInt32),
    release : Proc(IComponent*, UInt32),
    initialize__ : Proc(IComponent*, Void*, Win32cr::Foundation::HRESULT),
    notify : Proc(IComponent*, Void*, Win32cr::System::Mmc::MMC_NOTIFY_TYPE, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    destroy : Proc(IComponent*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    query_data_object : Proc(IComponent*, LibC::IntPtrT, Win32cr::System::Mmc::DATA_OBJECT_TYPES, Void**, Win32cr::Foundation::HRESULT),
    get_result_view_type : Proc(IComponent*, LibC::IntPtrT, Win32cr::Foundation::PWSTR*, Int32*, Win32cr::Foundation::HRESULT),
    get_display_info : Proc(IComponent*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    compare_objects : Proc(IComponent*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IComponent, lpVtbl : IComponentVtbl* do
    GUID = LibC::GUID.new(0x43136eb2_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
    def query_interface(this : IComponent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComponent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComponent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IComponent*, lpConsole : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, lpConsole)
    end
    def notify(this : IComponent*, lpDataObject : Void*, event : Win32cr::System::Mmc::MMC_NOTIFY_TYPE, arg : Win32cr::Foundation::LPARAM, param3 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, lpDataObject, event, arg, param3)
    end
    def destroy(this : IComponent*, cookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy.call(this, cookie)
    end
    def query_data_object(this : IComponent*, cookie : LibC::IntPtrT, type__ : Win32cr::System::Mmc::DATA_OBJECT_TYPES, ppDataObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_data_object.call(this, cookie, type__, ppDataObject)
    end
    def get_result_view_type(this : IComponent*, cookie : LibC::IntPtrT, ppViewType : Win32cr::Foundation::PWSTR*, pViewOptions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result_view_type.call(this, cookie, ppViewType, pViewOptions)
    end
    def get_display_info(this : IComponent*, pResultDataItem : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_info.call(this, pResultDataItem)
    end
    def compare_objects(this : IComponent*, lpDataObjectA : Void*, lpDataObjectB : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_objects.call(this, lpDataObjectA, lpDataObjectB)
    end

  end

  @[Extern]
  record IResultDataCompareVtbl,
    query_interface : Proc(IResultDataCompare*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResultDataCompare*, UInt32),
    release : Proc(IResultDataCompare*, UInt32),
    compare : Proc(IResultDataCompare*, Win32cr::Foundation::LPARAM, LibC::IntPtrT, LibC::IntPtrT, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IResultDataCompare, lpVtbl : IResultDataCompareVtbl* do
    GUID = LibC::GUID.new(0xe8315a52_u32, 0x7a1a_u16, 0x11d0_u16, StaticArray[0xa2_u8, 0xd2_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
    def query_interface(this : IResultDataCompare*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResultDataCompare*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResultDataCompare*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compare(this : IResultDataCompare*, lUserParam : Win32cr::Foundation::LPARAM, cookieA : LibC::IntPtrT, cookieB : LibC::IntPtrT, pnResult : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare.call(this, lUserParam, cookieA, cookieB, pnResult)
    end

  end

  @[Extern]
  record IResultOwnerDataVtbl,
    query_interface : Proc(IResultOwnerData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResultOwnerData*, UInt32),
    release : Proc(IResultOwnerData*, UInt32),
    find_item : Proc(IResultOwnerData*, Win32cr::System::Mmc::RESULTFINDINFO*, Int32*, Win32cr::Foundation::HRESULT),
    cache_hint : Proc(IResultOwnerData*, Int32, Int32, Win32cr::Foundation::HRESULT),
    sort_items : Proc(IResultOwnerData*, Int32, UInt32, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IResultOwnerData, lpVtbl : IResultOwnerDataVtbl* do
    GUID = LibC::GUID.new(0x9cb396d8_u32, 0xea83_u16, 0x11d0_u16, StaticArray[0xae_u8, 0xf1_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xdd_u8, 0x2c_u8])
    def query_interface(this : IResultOwnerData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResultOwnerData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResultOwnerData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_item(this : IResultOwnerData*, pFindInfo : Win32cr::System::Mmc::RESULTFINDINFO*, pnFoundIndex : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_item.call(this, pFindInfo, pnFoundIndex)
    end
    def cache_hint(this : IResultOwnerData*, nStartIndex : Int32, nEndIndex : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cache_hint.call(this, nStartIndex, nEndIndex)
    end
    def sort_items(this : IResultOwnerData*, nColumn : Int32, dwSortOptions : UInt32, lUserParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sort_items.call(this, nColumn, dwSortOptions, lUserParam)
    end

  end

  @[Extern]
  record IConsoleVtbl,
    query_interface : Proc(IConsole*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConsole*, UInt32),
    release : Proc(IConsole*, UInt32),
    set_header : Proc(IConsole*, Void*, Win32cr::Foundation::HRESULT),
    set_toolbar : Proc(IConsole*, Void*, Win32cr::Foundation::HRESULT),
    query_result_view : Proc(IConsole*, Void**, Win32cr::Foundation::HRESULT),
    query_scope_image_list : Proc(IConsole*, Void**, Win32cr::Foundation::HRESULT),
    query_result_image_list : Proc(IConsole*, Void**, Win32cr::Foundation::HRESULT),
    update_all_views : Proc(IConsole*, Void*, Win32cr::Foundation::LPARAM, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    message_box : Proc(IConsole*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    query_console_verb : Proc(IConsole*, Void**, Win32cr::Foundation::HRESULT),
    select_scope_item : Proc(IConsole*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_main_window : Proc(IConsole*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    new_window : Proc(IConsole*, LibC::IntPtrT, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConsole, lpVtbl : IConsoleVtbl* do
    GUID = LibC::GUID.new(0x43136eb1_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
    def query_interface(this : IConsole*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConsole*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConsole*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_header(this : IConsole*, pHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_header.call(this, pHeader)
    end
    def set_toolbar(this : IConsole*, pToolbar : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_toolbar.call(this, pToolbar)
    end
    def query_result_view(this : IConsole*, pUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_result_view.call(this, pUnknown)
    end
    def query_scope_image_list(this : IConsole*, ppImageList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_scope_image_list.call(this, ppImageList)
    end
    def query_result_image_list(this : IConsole*, ppImageList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_result_image_list.call(this, ppImageList)
    end
    def update_all_views(this : IConsole*, lpDataObject : Void*, data : Win32cr::Foundation::LPARAM, hint : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_all_views.call(this, lpDataObject, data, hint)
    end
    def message_box(this : IConsole*, lpszText : Win32cr::Foundation::PWSTR, lpszTitle : Win32cr::Foundation::PWSTR, fuStyle : UInt32, piRetval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.message_box.call(this, lpszText, lpszTitle, fuStyle, piRetval)
    end
    def query_console_verb(this : IConsole*, ppConsoleVerb : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_console_verb.call(this, ppConsoleVerb)
    end
    def select_scope_item(this : IConsole*, hScopeItem : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select_scope_item.call(this, hScopeItem)
    end
    def get_main_window(this : IConsole*, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_window.call(this, phwnd)
    end
    def new_window(this : IConsole*, hScopeItem : LibC::IntPtrT, lOptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_window.call(this, hScopeItem, lOptions)
    end

  end

  @[Extern]
  record IHeaderCtrlVtbl,
    query_interface : Proc(IHeaderCtrl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHeaderCtrl*, UInt32),
    release : Proc(IHeaderCtrl*, UInt32),
    insert_column : Proc(IHeaderCtrl*, Int32, Win32cr::Foundation::PWSTR, Int32, Int32, Win32cr::Foundation::HRESULT),
    delete_column : Proc(IHeaderCtrl*, Int32, Win32cr::Foundation::HRESULT),
    set_column_text : Proc(IHeaderCtrl*, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_column_text : Proc(IHeaderCtrl*, Int32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_column_width : Proc(IHeaderCtrl*, Int32, Int32, Win32cr::Foundation::HRESULT),
    get_column_width : Proc(IHeaderCtrl*, Int32, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHeaderCtrl, lpVtbl : IHeaderCtrlVtbl* do
    GUID = LibC::GUID.new(0x43136eb3_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
    def query_interface(this : IHeaderCtrl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHeaderCtrl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHeaderCtrl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert_column(this : IHeaderCtrl*, nCol : Int32, title : Win32cr::Foundation::PWSTR, nFormat : Int32, nWidth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_column.call(this, nCol, title, nFormat, nWidth)
    end
    def delete_column(this : IHeaderCtrl*, nCol : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_column.call(this, nCol)
    end
    def set_column_text(this : IHeaderCtrl*, nCol : Int32, title : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_column_text.call(this, nCol, title)
    end
    def get_column_text(this : IHeaderCtrl*, nCol : Int32, pText : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_text.call(this, nCol, pText)
    end
    def set_column_width(this : IHeaderCtrl*, nCol : Int32, nWidth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_column_width.call(this, nCol, nWidth)
    end
    def get_column_width(this : IHeaderCtrl*, nCol : Int32, pWidth : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_width.call(this, nCol, pWidth)
    end

  end

  @[Extern]
  record IContextMenuCallbackVtbl,
    query_interface : Proc(IContextMenuCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContextMenuCallback*, UInt32),
    release : Proc(IContextMenuCallback*, UInt32),
    add_item : Proc(IContextMenuCallback*, Win32cr::System::Mmc::CONTEXTMENUITEM*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContextMenuCallback, lpVtbl : IContextMenuCallbackVtbl* do
    GUID = LibC::GUID.new(0x43136eb7_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
    def query_interface(this : IContextMenuCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContextMenuCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContextMenuCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_item(this : IContextMenuCallback*, pItem : Win32cr::System::Mmc::CONTEXTMENUITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, pItem)
    end

  end

  @[Extern]
  record IContextMenuProviderVtbl,
    query_interface : Proc(IContextMenuProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContextMenuProvider*, UInt32),
    release : Proc(IContextMenuProvider*, UInt32),
    add_item : Proc(IContextMenuProvider*, Win32cr::System::Mmc::CONTEXTMENUITEM*, Win32cr::Foundation::HRESULT),
    empty_menu_list : Proc(IContextMenuProvider*, Win32cr::Foundation::HRESULT),
    add_primary_extension_items : Proc(IContextMenuProvider*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_third_party_extension_items : Proc(IContextMenuProvider*, Void*, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IContextMenuProvider*, Win32cr::Foundation::HWND, Int32, Int32, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContextMenuProvider, lpVtbl : IContextMenuProviderVtbl* do
    GUID = LibC::GUID.new(0x43136eb6_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
    def query_interface(this : IContextMenuProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContextMenuProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContextMenuProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_item(this : IContextMenuProvider*, pItem : Win32cr::System::Mmc::CONTEXTMENUITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, pItem)
    end
    def empty_menu_list(this : IContextMenuProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.empty_menu_list.call(this)
    end
    def add_primary_extension_items(this : IContextMenuProvider*, piExtension : Void*, piDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_primary_extension_items.call(this, piExtension, piDataObject)
    end
    def add_third_party_extension_items(this : IContextMenuProvider*, piDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_third_party_extension_items.call(this, piDataObject)
    end
    def show_context_menu(this : IContextMenuProvider*, hwndParent : Win32cr::Foundation::HWND, xPos : Int32, yPos : Int32, plSelected : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this, hwndParent, xPos, yPos, plSelected)
    end

  end

  @[Extern]
  record IExtendContextMenuVtbl,
    query_interface : Proc(IExtendContextMenu*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExtendContextMenu*, UInt32),
    release : Proc(IExtendContextMenu*, UInt32),
    add_menu_items : Proc(IExtendContextMenu*, Void*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    command : Proc(IExtendContextMenu*, Int32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IExtendContextMenu, lpVtbl : IExtendContextMenuVtbl* do
    GUID = LibC::GUID.new(0x4f3b7a4f_u32, 0xcfac_u16, 0x11cf_u16, StaticArray[0xb8_u8, 0xe3_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0xb0_u8])
    def query_interface(this : IExtendContextMenu*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExtendContextMenu*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExtendContextMenu*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_menu_items(this : IExtendContextMenu*, piDataObject : Void*, piCallback : Void*, pInsertionAllowed : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_menu_items.call(this, piDataObject, piCallback, pInsertionAllowed)
    end
    def command(this : IExtendContextMenu*, lCommandID : Int32, piDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.command.call(this, lCommandID, piDataObject)
    end

  end

  @[Extern]
  record IImageListVtbl,
    query_interface : Proc(IImageList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImageList*, UInt32),
    release : Proc(IImageList*, UInt32),
    image_list_set_icon : Proc(IImageList*, LibC::IntPtrT*, Int32, Win32cr::Foundation::HRESULT),
    image_list_set_strip : Proc(IImageList*, LibC::IntPtrT*, LibC::IntPtrT*, Int32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IImageList, lpVtbl : IImageListVtbl* do
    GUID = LibC::GUID.new(0x43136eb8_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
    def query_interface(this : IImageList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImageList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImageList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def image_list_set_icon(this : IImageList*, pIcon : LibC::IntPtrT*, nLoc : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.image_list_set_icon.call(this, pIcon, nLoc)
    end
    def image_list_set_strip(this : IImageList*, pBMapSm : LibC::IntPtrT*, pBMapLg : LibC::IntPtrT*, nStartLoc : Int32, cMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.image_list_set_strip.call(this, pBMapSm, pBMapLg, nStartLoc, cMask)
    end

  end

  @[Extern]
  record IResultDataVtbl,
    query_interface : Proc(IResultData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResultData*, UInt32),
    release : Proc(IResultData*, UInt32),
    insert_item : Proc(IResultData*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    delete_item : Proc(IResultData*, LibC::IntPtrT, Int32, Win32cr::Foundation::HRESULT),
    find_item_by_l_param : Proc(IResultData*, Win32cr::Foundation::LPARAM, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    delete_all_rslt_items : Proc(IResultData*, Win32cr::Foundation::HRESULT),
    set_item : Proc(IResultData*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    get_item : Proc(IResultData*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    get_next_item : Proc(IResultData*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    modify_item_state : Proc(IResultData*, Int32, LibC::IntPtrT, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    modify_view_style : Proc(IResultData*, Win32cr::System::Mmc::MMC_RESULT_VIEW_STYLE, Win32cr::System::Mmc::MMC_RESULT_VIEW_STYLE, Win32cr::Foundation::HRESULT),
    set_view_mode : Proc(IResultData*, Int32, Win32cr::Foundation::HRESULT),
    get_view_mode : Proc(IResultData*, Int32*, Win32cr::Foundation::HRESULT),
    update_item : Proc(IResultData*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    sort : Proc(IResultData*, Int32, UInt32, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_desc_bar_text : Proc(IResultData*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_item_count : Proc(IResultData*, Int32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IResultData, lpVtbl : IResultDataVtbl* do
    GUID = LibC::GUID.new(0x31da5fa0_u32, 0xe0eb_u16, 0x11cf_u16, StaticArray[0x9f_u8, 0x21_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x3c_u8, 0xa9_u8, 0xf6_u8])
    def query_interface(this : IResultData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResultData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResultData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert_item(this : IResultData*, item : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_item.call(this, item)
    end
    def delete_item(this : IResultData*, itemID : LibC::IntPtrT, nCol : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, itemID, nCol)
    end
    def find_item_by_l_param(this : IResultData*, lParam : Win32cr::Foundation::LPARAM, pItemID : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_item_by_l_param.call(this, lParam, pItemID)
    end
    def delete_all_rslt_items(this : IResultData*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_all_rslt_items.call(this)
    end
    def set_item(this : IResultData*, item : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_item.call(this, item)
    end
    def get_item(this : IResultData*, item : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item.call(this, item)
    end
    def get_next_item(this : IResultData*, item : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_item.call(this, item)
    end
    def modify_item_state(this : IResultData*, nIndex : Int32, itemID : LibC::IntPtrT, uAdd : UInt32, uRemove : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_item_state.call(this, nIndex, itemID, uAdd, uRemove)
    end
    def modify_view_style(this : IResultData*, add : Win32cr::System::Mmc::MMC_RESULT_VIEW_STYLE, remove : Win32cr::System::Mmc::MMC_RESULT_VIEW_STYLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_view_style.call(this, add, remove)
    end
    def set_view_mode(this : IResultData*, lViewMode : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_view_mode.call(this, lViewMode)
    end
    def get_view_mode(this : IResultData*, lViewMode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_mode.call(this, lViewMode)
    end
    def update_item(this : IResultData*, itemID : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_item.call(this, itemID)
    end
    def sort(this : IResultData*, nColumn : Int32, dwSortOptions : UInt32, lUserParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sort.call(this, nColumn, dwSortOptions, lUserParam)
    end
    def set_desc_bar_text(this : IResultData*, desc_text : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_desc_bar_text.call(this, desc_text)
    end
    def set_item_count(this : IResultData*, nItemCount : Int32, dwOptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_item_count.call(this, nItemCount, dwOptions)
    end

  end

  @[Extern]
  record IConsoleNameSpaceVtbl,
    query_interface : Proc(IConsoleNameSpace*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConsoleNameSpace*, UInt32),
    release : Proc(IConsoleNameSpace*, UInt32),
    insert_item : Proc(IConsoleNameSpace*, Win32cr::System::Mmc::SCOPEDATAITEM*, Win32cr::Foundation::HRESULT),
    delete_item : Proc(IConsoleNameSpace*, LibC::IntPtrT, Int32, Win32cr::Foundation::HRESULT),
    set_item : Proc(IConsoleNameSpace*, Win32cr::System::Mmc::SCOPEDATAITEM*, Win32cr::Foundation::HRESULT),
    get_item : Proc(IConsoleNameSpace*, Win32cr::System::Mmc::SCOPEDATAITEM*, Win32cr::Foundation::HRESULT),
    get_child_item : Proc(IConsoleNameSpace*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_next_item : Proc(IConsoleNameSpace*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_parent_item : Proc(IConsoleNameSpace*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConsoleNameSpace, lpVtbl : IConsoleNameSpaceVtbl* do
    GUID = LibC::GUID.new(0xbedeb620_u32, 0xf24d_u16, 0x11cf_u16, StaticArray[0x8a_u8, 0xfc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x3c_u8, 0xa9_u8, 0xf6_u8])
    def query_interface(this : IConsoleNameSpace*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConsoleNameSpace*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConsoleNameSpace*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert_item(this : IConsoleNameSpace*, item : Win32cr::System::Mmc::SCOPEDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_item.call(this, item)
    end
    def delete_item(this : IConsoleNameSpace*, hItem : LibC::IntPtrT, fDeleteThis : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, hItem, fDeleteThis)
    end
    def set_item(this : IConsoleNameSpace*, item : Win32cr::System::Mmc::SCOPEDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_item.call(this, item)
    end
    def get_item(this : IConsoleNameSpace*, item : Win32cr::System::Mmc::SCOPEDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item.call(this, item)
    end
    def get_child_item(this : IConsoleNameSpace*, item : LibC::IntPtrT, pItemChild : LibC::IntPtrT*, pCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_child_item.call(this, item, pItemChild, pCookie)
    end
    def get_next_item(this : IConsoleNameSpace*, item : LibC::IntPtrT, pItemNext : LibC::IntPtrT*, pCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_item.call(this, item, pItemNext, pCookie)
    end
    def get_parent_item(this : IConsoleNameSpace*, item : LibC::IntPtrT, pItemParent : LibC::IntPtrT*, pCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_item.call(this, item, pItemParent, pCookie)
    end

  end

  @[Extern]
  record IConsoleNameSpace2Vtbl,
    query_interface : Proc(IConsoleNameSpace2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConsoleNameSpace2*, UInt32),
    release : Proc(IConsoleNameSpace2*, UInt32),
    insert_item : Proc(IConsoleNameSpace2*, Win32cr::System::Mmc::SCOPEDATAITEM*, Win32cr::Foundation::HRESULT),
    delete_item : Proc(IConsoleNameSpace2*, LibC::IntPtrT, Int32, Win32cr::Foundation::HRESULT),
    set_item : Proc(IConsoleNameSpace2*, Win32cr::System::Mmc::SCOPEDATAITEM*, Win32cr::Foundation::HRESULT),
    get_item : Proc(IConsoleNameSpace2*, Win32cr::System::Mmc::SCOPEDATAITEM*, Win32cr::Foundation::HRESULT),
    get_child_item : Proc(IConsoleNameSpace2*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_next_item : Proc(IConsoleNameSpace2*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    get_parent_item : Proc(IConsoleNameSpace2*, LibC::IntPtrT, LibC::IntPtrT*, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    expand : Proc(IConsoleNameSpace2*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    add_extension : Proc(IConsoleNameSpace2*, LibC::IntPtrT, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConsoleNameSpace2, lpVtbl : IConsoleNameSpace2Vtbl* do
    GUID = LibC::GUID.new(0x255f18cc_u32, 0x65db_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xdc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
    def query_interface(this : IConsoleNameSpace2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConsoleNameSpace2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConsoleNameSpace2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert_item(this : IConsoleNameSpace2*, item : Win32cr::System::Mmc::SCOPEDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_item.call(this, item)
    end
    def delete_item(this : IConsoleNameSpace2*, hItem : LibC::IntPtrT, fDeleteThis : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, hItem, fDeleteThis)
    end
    def set_item(this : IConsoleNameSpace2*, item : Win32cr::System::Mmc::SCOPEDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_item.call(this, item)
    end
    def get_item(this : IConsoleNameSpace2*, item : Win32cr::System::Mmc::SCOPEDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item.call(this, item)
    end
    def get_child_item(this : IConsoleNameSpace2*, item : LibC::IntPtrT, pItemChild : LibC::IntPtrT*, pCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_child_item.call(this, item, pItemChild, pCookie)
    end
    def get_next_item(this : IConsoleNameSpace2*, item : LibC::IntPtrT, pItemNext : LibC::IntPtrT*, pCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_item.call(this, item, pItemNext, pCookie)
    end
    def get_parent_item(this : IConsoleNameSpace2*, item : LibC::IntPtrT, pItemParent : LibC::IntPtrT*, pCookie : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_item.call(this, item, pItemParent, pCookie)
    end
    def expand(this : IConsoleNameSpace2*, hItem : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this, hItem)
    end
    def add_extension(this : IConsoleNameSpace2*, hItem : LibC::IntPtrT, lpClsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_extension.call(this, hItem, lpClsid)
    end

  end

  @[Extern]
  record IPropertySheetCallbackVtbl,
    query_interface : Proc(IPropertySheetCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertySheetCallback*, UInt32),
    release : Proc(IPropertySheetCallback*, UInt32),
    add_page : Proc(IPropertySheetCallback*, Win32cr::UI::Controls::HPROPSHEETPAGE, Win32cr::Foundation::HRESULT),
    remove_page : Proc(IPropertySheetCallback*, Win32cr::UI::Controls::HPROPSHEETPAGE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertySheetCallback, lpVtbl : IPropertySheetCallbackVtbl* do
    GUID = LibC::GUID.new(0x85de64dd_u32, 0xef21_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xdb_u8, 0xe6_u8])
    def query_interface(this : IPropertySheetCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertySheetCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertySheetCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_page(this : IPropertySheetCallback*, hPage : Win32cr::UI::Controls::HPROPSHEETPAGE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_page.call(this, hPage)
    end
    def remove_page(this : IPropertySheetCallback*, hPage : Win32cr::UI::Controls::HPROPSHEETPAGE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_page.call(this, hPage)
    end

  end

  @[Extern]
  record IPropertySheetProviderVtbl,
    query_interface : Proc(IPropertySheetProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertySheetProvider*, UInt32),
    release : Proc(IPropertySheetProvider*, UInt32),
    create_property_sheet : Proc(IPropertySheetProvider*, Win32cr::Foundation::PWSTR, UInt8, LibC::IntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT),
    find_property_sheet : Proc(IPropertySheetProvider*, LibC::IntPtrT, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_primary_pages : Proc(IPropertySheetProvider*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HWND, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    add_extension_pages : Proc(IPropertySheetProvider*, Win32cr::Foundation::HRESULT),
    show : Proc(IPropertySheetProvider*, LibC::IntPtrT, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertySheetProvider, lpVtbl : IPropertySheetProviderVtbl* do
    GUID = LibC::GUID.new(0x85de64de_u32, 0xef21_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xdb_u8, 0xe6_u8])
    def query_interface(this : IPropertySheetProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertySheetProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertySheetProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_property_sheet(this : IPropertySheetProvider*, title : Win32cr::Foundation::PWSTR, type__ : UInt8, cookie : LibC::IntPtrT, pIDataObjectm : Void*, dwOptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_sheet.call(this, title, type__, cookie, pIDataObjectm, dwOptions)
    end
    def find_property_sheet(this : IPropertySheetProvider*, hItem : LibC::IntPtrT, lpComponent : Void*, lpDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_property_sheet.call(this, hItem, lpComponent, lpDataObject)
    end
    def add_primary_pages(this : IPropertySheetProvider*, lpUnknown : Void*, bCreateHandle : Win32cr::Foundation::BOOL, hNotifyWindow : Win32cr::Foundation::HWND, bScopePane : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_primary_pages.call(this, lpUnknown, bCreateHandle, hNotifyWindow, bScopePane)
    end
    def add_extension_pages(this : IPropertySheetProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_extension_pages.call(this)
    end
    def show(this : IPropertySheetProvider*, window : LibC::IntPtrT, page : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, window, page)
    end

  end

  @[Extern]
  record IExtendPropertySheetVtbl,
    query_interface : Proc(IExtendPropertySheet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExtendPropertySheet*, UInt32),
    release : Proc(IExtendPropertySheet*, UInt32),
    create_property_pages : Proc(IExtendPropertySheet*, Void*, LibC::IntPtrT, Void*, Win32cr::Foundation::HRESULT),
    query_pages_for : Proc(IExtendPropertySheet*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IExtendPropertySheet, lpVtbl : IExtendPropertySheetVtbl* do
    GUID = LibC::GUID.new(0x85de64dc_u32, 0xef21_u16, 0x11cf_u16, StaticArray[0xa2_u8, 0x85_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xdb_u8, 0xe6_u8])
    def query_interface(this : IExtendPropertySheet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExtendPropertySheet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExtendPropertySheet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_property_pages(this : IExtendPropertySheet*, lpProvider : Void*, handle : LibC::IntPtrT, lpIDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_pages.call(this, lpProvider, handle, lpIDataObject)
    end
    def query_pages_for(this : IExtendPropertySheet*, lpDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_pages_for.call(this, lpDataObject)
    end

  end

  @[Extern]
  record IControlbarVtbl,
    query_interface : Proc(IControlbar*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IControlbar*, UInt32),
    release : Proc(IControlbar*, UInt32),
    create : Proc(IControlbar*, Win32cr::System::Mmc::MMC_CONTROL_TYPE, Void*, Void**, Win32cr::Foundation::HRESULT),
    attach : Proc(IControlbar*, Win32cr::System::Mmc::MMC_CONTROL_TYPE, Void*, Win32cr::Foundation::HRESULT),
    detach : Proc(IControlbar*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IControlbar, lpVtbl : IControlbarVtbl* do
    GUID = LibC::GUID.new(0x69fb811e_u32, 0x6c1c_u16, 0x11d0_u16, StaticArray[0xa2_u8, 0xcb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
    def query_interface(this : IControlbar*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IControlbar*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IControlbar*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IControlbar*, nType : Win32cr::System::Mmc::MMC_CONTROL_TYPE, pExtendControlbar : Void*, ppUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, nType, pExtendControlbar, ppUnknown)
    end
    def attach(this : IControlbar*, nType : Win32cr::System::Mmc::MMC_CONTROL_TYPE, lpUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach.call(this, nType, lpUnknown)
    end
    def detach(this : IControlbar*, lpUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.detach.call(this, lpUnknown)
    end

  end

  @[Extern]
  record IExtendControlbarVtbl,
    query_interface : Proc(IExtendControlbar*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExtendControlbar*, UInt32),
    release : Proc(IExtendControlbar*, UInt32),
    set_controlbar : Proc(IExtendControlbar*, Void*, Win32cr::Foundation::HRESULT),
    controlbar_notify : Proc(IExtendControlbar*, Win32cr::System::Mmc::MMC_NOTIFY_TYPE, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IExtendControlbar, lpVtbl : IExtendControlbarVtbl* do
    GUID = LibC::GUID.new(0x49506520_u32, 0x6f40_u16, 0x11d0_u16, StaticArray[0xa9_u8, 0x8b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
    def query_interface(this : IExtendControlbar*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExtendControlbar*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExtendControlbar*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_controlbar(this : IExtendControlbar*, pControlbar : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_controlbar.call(this, pControlbar)
    end
    def controlbar_notify(this : IExtendControlbar*, event : Win32cr::System::Mmc::MMC_NOTIFY_TYPE, arg : Win32cr::Foundation::LPARAM, param2 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.controlbar_notify.call(this, event, arg, param2)
    end

  end

  @[Extern]
  record IToolbarVtbl,
    query_interface : Proc(IToolbar*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IToolbar*, UInt32),
    release : Proc(IToolbar*, UInt32),
    add_bitmap : Proc(IToolbar*, Int32, Win32cr::Graphics::Gdi::HBITMAP, Int32, Int32, UInt32, Win32cr::Foundation::HRESULT),
    add_buttons : Proc(IToolbar*, Int32, Win32cr::System::Mmc::MMCBUTTON*, Win32cr::Foundation::HRESULT),
    insert_button : Proc(IToolbar*, Int32, Win32cr::System::Mmc::MMCBUTTON*, Win32cr::Foundation::HRESULT),
    delete_button : Proc(IToolbar*, Int32, Win32cr::Foundation::HRESULT),
    get_button_state : Proc(IToolbar*, Int32, Win32cr::System::Mmc::MMC_BUTTON_STATE, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_button_state : Proc(IToolbar*, Int32, Win32cr::System::Mmc::MMC_BUTTON_STATE, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IToolbar, lpVtbl : IToolbarVtbl* do
    GUID = LibC::GUID.new(0x43136eb9_u32, 0xd36c_u16, 0x11cf_u16, StaticArray[0xad_u8, 0xbc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa8_u8, 0x0_u8, 0x33_u8])
    def query_interface(this : IToolbar*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IToolbar*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IToolbar*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_bitmap(this : IToolbar*, nImages : Int32, hbmp : Win32cr::Graphics::Gdi::HBITMAP, cxSize : Int32, cySize : Int32, crMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_bitmap.call(this, nImages, hbmp, cxSize, cySize, crMask)
    end
    def add_buttons(this : IToolbar*, nButtons : Int32, lpButtons : Win32cr::System::Mmc::MMCBUTTON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_buttons.call(this, nButtons, lpButtons)
    end
    def insert_button(this : IToolbar*, nIndex : Int32, lpButton : Win32cr::System::Mmc::MMCBUTTON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_button.call(this, nIndex, lpButton)
    end
    def delete_button(this : IToolbar*, nIndex : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_button.call(this, nIndex)
    end
    def get_button_state(this : IToolbar*, idCommand : Int32, nState : Win32cr::System::Mmc::MMC_BUTTON_STATE, pState : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_button_state.call(this, idCommand, nState, pState)
    end
    def set_button_state(this : IToolbar*, idCommand : Int32, nState : Win32cr::System::Mmc::MMC_BUTTON_STATE, bState : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_button_state.call(this, idCommand, nState, bState)
    end

  end

  @[Extern]
  record IConsoleVerbVtbl,
    query_interface : Proc(IConsoleVerb*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConsoleVerb*, UInt32),
    release : Proc(IConsoleVerb*, UInt32),
    get_verb_state : Proc(IConsoleVerb*, Win32cr::System::Mmc::MMC_CONSOLE_VERB, Win32cr::System::Mmc::MMC_BUTTON_STATE, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_verb_state : Proc(IConsoleVerb*, Win32cr::System::Mmc::MMC_CONSOLE_VERB, Win32cr::System::Mmc::MMC_BUTTON_STATE, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_default_verb : Proc(IConsoleVerb*, Win32cr::System::Mmc::MMC_CONSOLE_VERB, Win32cr::Foundation::HRESULT),
    get_default_verb : Proc(IConsoleVerb*, Win32cr::System::Mmc::MMC_CONSOLE_VERB*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConsoleVerb, lpVtbl : IConsoleVerbVtbl* do
    GUID = LibC::GUID.new(0xe49f7a60_u32, 0x74af_u16, 0x11d0_u16, StaticArray[0xa2_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xfe_u8, 0x93_u8])
    def query_interface(this : IConsoleVerb*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConsoleVerb*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConsoleVerb*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_verb_state(this : IConsoleVerb*, eCmdID : Win32cr::System::Mmc::MMC_CONSOLE_VERB, nState : Win32cr::System::Mmc::MMC_BUTTON_STATE, pState : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_verb_state.call(this, eCmdID, nState, pState)
    end
    def set_verb_state(this : IConsoleVerb*, eCmdID : Win32cr::System::Mmc::MMC_CONSOLE_VERB, nState : Win32cr::System::Mmc::MMC_BUTTON_STATE, bState : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_verb_state.call(this, eCmdID, nState, bState)
    end
    def set_default_verb(this : IConsoleVerb*, eCmdID : Win32cr::System::Mmc::MMC_CONSOLE_VERB) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_verb.call(this, eCmdID)
    end
    def get_default_verb(this : IConsoleVerb*, peCmdID : Win32cr::System::Mmc::MMC_CONSOLE_VERB*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_verb.call(this, peCmdID)
    end

  end

  @[Extern]
  record ISnapinAboutVtbl,
    query_interface : Proc(ISnapinAbout*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISnapinAbout*, UInt32),
    release : Proc(ISnapinAbout*, UInt32),
    get_snapin_description : Proc(ISnapinAbout*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_provider : Proc(ISnapinAbout*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_snapin_version : Proc(ISnapinAbout*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_snapin_image : Proc(ISnapinAbout*, Win32cr::UI::WindowsAndMessaging::HICON*, Win32cr::Foundation::HRESULT),
    get_static_folder_image : Proc(ISnapinAbout*, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Graphics::Gdi::HBITMAP*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISnapinAbout, lpVtbl : ISnapinAboutVtbl* do
    GUID = LibC::GUID.new(0x1245208c_u32, 0xa151_u16, 0x11d0_u16, StaticArray[0xa7_u8, 0xd7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
    def query_interface(this : ISnapinAbout*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISnapinAbout*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISnapinAbout*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_snapin_description(this : ISnapinAbout*, lpDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_snapin_description.call(this, lpDescription)
    end
    def get_provider(this : ISnapinAbout*, lpName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider.call(this, lpName)
    end
    def get_snapin_version(this : ISnapinAbout*, lpVersion : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_snapin_version.call(this, lpVersion)
    end
    def get_snapin_image(this : ISnapinAbout*, hAppIcon : Win32cr::UI::WindowsAndMessaging::HICON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_snapin_image.call(this, hAppIcon)
    end
    def get_static_folder_image(this : ISnapinAbout*, hSmallImage : Win32cr::Graphics::Gdi::HBITMAP*, hSmallImageOpen : Win32cr::Graphics::Gdi::HBITMAP*, hLargeImage : Win32cr::Graphics::Gdi::HBITMAP*, cMask : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_folder_image.call(this, hSmallImage, hSmallImageOpen, hLargeImage, cMask)
    end

  end

  @[Extern]
  record IMenuButtonVtbl,
    query_interface : Proc(IMenuButton*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMenuButton*, UInt32),
    release : Proc(IMenuButton*, UInt32),
    add_button : Proc(IMenuButton*, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_button : Proc(IMenuButton*, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_button_state : Proc(IMenuButton*, Int32, Win32cr::System::Mmc::MMC_BUTTON_STATE, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMenuButton, lpVtbl : IMenuButtonVtbl* do
    GUID = LibC::GUID.new(0x951ed750_u32, 0xd080_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x97_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMenuButton*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMenuButton*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMenuButton*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_button(this : IMenuButton*, idCommand : Int32, lpButtonText : Win32cr::Foundation::PWSTR, lpTooltipText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_button.call(this, idCommand, lpButtonText, lpTooltipText)
    end
    def set_button(this : IMenuButton*, idCommand : Int32, lpButtonText : Win32cr::Foundation::PWSTR, lpTooltipText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_button.call(this, idCommand, lpButtonText, lpTooltipText)
    end
    def set_button_state(this : IMenuButton*, idCommand : Int32, nState : Win32cr::System::Mmc::MMC_BUTTON_STATE, bState : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_button_state.call(this, idCommand, nState, bState)
    end

  end

  @[Extern]
  record ISnapinHelpVtbl,
    query_interface : Proc(ISnapinHelp*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISnapinHelp*, UInt32),
    release : Proc(ISnapinHelp*, UInt32),
    get_help_topic : Proc(ISnapinHelp*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISnapinHelp, lpVtbl : ISnapinHelpVtbl* do
    GUID = LibC::GUID.new(0xa6b15ace_u32, 0xdf59_u16, 0x11d0_u16, StaticArray[0xa7_u8, 0xdd_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
    def query_interface(this : ISnapinHelp*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISnapinHelp*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISnapinHelp*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_help_topic(this : ISnapinHelp*, lpCompiledHelpFile : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_help_topic.call(this, lpCompiledHelpFile)
    end

  end

  @[Extern]
  record IExtendPropertySheet2Vtbl,
    query_interface : Proc(IExtendPropertySheet2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExtendPropertySheet2*, UInt32),
    release : Proc(IExtendPropertySheet2*, UInt32),
    create_property_pages : Proc(IExtendPropertySheet2*, Void*, LibC::IntPtrT, Void*, Win32cr::Foundation::HRESULT),
    query_pages_for : Proc(IExtendPropertySheet2*, Void*, Win32cr::Foundation::HRESULT),
    get_watermarks : Proc(IExtendPropertySheet2*, Void*, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Graphics::Gdi::HPALETTE*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IExtendPropertySheet2, lpVtbl : IExtendPropertySheet2Vtbl* do
    GUID = LibC::GUID.new(0xb7a87232_u32, 0x4a51_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xea_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x9_u8, 0xdd_u8])
    def query_interface(this : IExtendPropertySheet2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExtendPropertySheet2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExtendPropertySheet2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_property_pages(this : IExtendPropertySheet2*, lpProvider : Void*, handle : LibC::IntPtrT, lpIDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_pages.call(this, lpProvider, handle, lpIDataObject)
    end
    def query_pages_for(this : IExtendPropertySheet2*, lpDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_pages_for.call(this, lpDataObject)
    end
    def get_watermarks(this : IExtendPropertySheet2*, lpIDataObject : Void*, lphWatermark : Win32cr::Graphics::Gdi::HBITMAP*, lphHeader : Win32cr::Graphics::Gdi::HBITMAP*, lphPalette : Win32cr::Graphics::Gdi::HPALETTE*, bStretch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_watermarks.call(this, lpIDataObject, lphWatermark, lphHeader, lphPalette, bStretch)
    end

  end

  @[Extern]
  record IHeaderCtrl2Vtbl,
    query_interface : Proc(IHeaderCtrl2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHeaderCtrl2*, UInt32),
    release : Proc(IHeaderCtrl2*, UInt32),
    insert_column : Proc(IHeaderCtrl2*, Int32, Win32cr::Foundation::PWSTR, Int32, Int32, Win32cr::Foundation::HRESULT),
    delete_column : Proc(IHeaderCtrl2*, Int32, Win32cr::Foundation::HRESULT),
    set_column_text : Proc(IHeaderCtrl2*, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_column_text : Proc(IHeaderCtrl2*, Int32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_column_width : Proc(IHeaderCtrl2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    get_column_width : Proc(IHeaderCtrl2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    set_change_time_out : Proc(IHeaderCtrl2*, UInt32, Win32cr::Foundation::HRESULT),
    set_column_filter : Proc(IHeaderCtrl2*, UInt32, UInt32, Win32cr::System::Mmc::MMC_FILTERDATA*, Win32cr::Foundation::HRESULT),
    get_column_filter : Proc(IHeaderCtrl2*, UInt32, UInt32*, Win32cr::System::Mmc::MMC_FILTERDATA*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHeaderCtrl2, lpVtbl : IHeaderCtrl2Vtbl* do
    GUID = LibC::GUID.new(0x9757abb8_u32, 0x1b32_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xce_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
    def query_interface(this : IHeaderCtrl2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHeaderCtrl2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHeaderCtrl2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert_column(this : IHeaderCtrl2*, nCol : Int32, title : Win32cr::Foundation::PWSTR, nFormat : Int32, nWidth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_column.call(this, nCol, title, nFormat, nWidth)
    end
    def delete_column(this : IHeaderCtrl2*, nCol : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_column.call(this, nCol)
    end
    def set_column_text(this : IHeaderCtrl2*, nCol : Int32, title : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_column_text.call(this, nCol, title)
    end
    def get_column_text(this : IHeaderCtrl2*, nCol : Int32, pText : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_text.call(this, nCol, pText)
    end
    def set_column_width(this : IHeaderCtrl2*, nCol : Int32, nWidth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_column_width.call(this, nCol, nWidth)
    end
    def get_column_width(this : IHeaderCtrl2*, nCol : Int32, pWidth : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_width.call(this, nCol, pWidth)
    end
    def set_change_time_out(this : IHeaderCtrl2*, uTimeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_change_time_out.call(this, uTimeout)
    end
    def set_column_filter(this : IHeaderCtrl2*, nColumn : UInt32, dwType : UInt32, pFilterData : Win32cr::System::Mmc::MMC_FILTERDATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_column_filter.call(this, nColumn, dwType, pFilterData)
    end
    def get_column_filter(this : IHeaderCtrl2*, nColumn : UInt32, pdwType : UInt32*, pFilterData : Win32cr::System::Mmc::MMC_FILTERDATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_filter.call(this, nColumn, pdwType, pFilterData)
    end

  end

  @[Extern]
  record ISnapinHelp2Vtbl,
    query_interface : Proc(ISnapinHelp2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISnapinHelp2*, UInt32),
    release : Proc(ISnapinHelp2*, UInt32),
    get_help_topic : Proc(ISnapinHelp2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_linked_topics : Proc(ISnapinHelp2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISnapinHelp2, lpVtbl : ISnapinHelp2Vtbl* do
    GUID = LibC::GUID.new(0x4861a010_u32, 0x20f9_u16, 0x11d2_u16, StaticArray[0xa5_u8, 0x10_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xdd_u8, 0x2c_u8])
    def query_interface(this : ISnapinHelp2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISnapinHelp2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISnapinHelp2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_help_topic(this : ISnapinHelp2*, lpCompiledHelpFile : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_help_topic.call(this, lpCompiledHelpFile)
    end
    def get_linked_topics(this : ISnapinHelp2*, lpCompiledHelpFiles : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_linked_topics.call(this, lpCompiledHelpFiles)
    end

  end

  @[Extern]
  record IEnumTASKVtbl,
    query_interface : Proc(IEnumTASK*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTASK*, UInt32),
    release : Proc(IEnumTASK*, UInt32),
    next__ : Proc(IEnumTASK*, UInt32, Win32cr::System::Mmc::MMC_TASK*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTASK*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTASK*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumTASK*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumTASK, lpVtbl : IEnumTASKVtbl* do
    GUID = LibC::GUID.new(0x338698b1_u32, 0x5a02_u16, 0x11d1_u16, StaticArray[0x9f_u8, 0xec_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x32_u8, 0xdb_u8, 0x4a_u8])
    def query_interface(this : IEnumTASK*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTASK*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTASK*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumTASK*, celt : UInt32, rgelt : Win32cr::System::Mmc::MMC_TASK*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumTASK*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumTASK*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumTASK*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IExtendTaskPadVtbl,
    query_interface : Proc(IExtendTaskPad*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExtendTaskPad*, UInt32),
    release : Proc(IExtendTaskPad*, UInt32),
    task_notify : Proc(IExtendTaskPad*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    enum_tasks : Proc(IExtendTaskPad*, Void*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_title : Proc(IExtendTaskPad*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_descriptive_text : Proc(IExtendTaskPad*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_background : Proc(IExtendTaskPad*, Win32cr::Foundation::PWSTR, Win32cr::System::Mmc::MMC_TASK_DISPLAY_OBJECT*, Win32cr::Foundation::HRESULT),
    get_list_pad_info : Proc(IExtendTaskPad*, Win32cr::Foundation::PWSTR, Win32cr::System::Mmc::MMC_LISTPAD_INFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IExtendTaskPad, lpVtbl : IExtendTaskPadVtbl* do
    GUID = LibC::GUID.new(0x8dee6511_u32, 0x554d_u16, 0x11d1_u16, StaticArray[0x9f_u8, 0xea_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x32_u8, 0xdb_u8, 0x4a_u8])
    def query_interface(this : IExtendTaskPad*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExtendTaskPad*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExtendTaskPad*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def task_notify(this : IExtendTaskPad*, pdo : Void*, arg : Win32cr::System::Com::VARIANT*, param2 : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.task_notify.call(this, pdo, arg, param2)
    end
    def enum_tasks(this : IExtendTaskPad*, pdo : Void*, szTaskGroup : Win32cr::Foundation::PWSTR, ppEnumTASK : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_tasks.call(this, pdo, szTaskGroup, ppEnumTASK)
    end
    def get_title(this : IExtendTaskPad*, pszGroup : Win32cr::Foundation::PWSTR, pszTitle : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_title.call(this, pszGroup, pszTitle)
    end
    def get_descriptive_text(this : IExtendTaskPad*, pszGroup : Win32cr::Foundation::PWSTR, pszDescriptiveText : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_descriptive_text.call(this, pszGroup, pszDescriptiveText)
    end
    def get_background(this : IExtendTaskPad*, pszGroup : Win32cr::Foundation::PWSTR, pTDO : Win32cr::System::Mmc::MMC_TASK_DISPLAY_OBJECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_background.call(this, pszGroup, pTDO)
    end
    def get_list_pad_info(this : IExtendTaskPad*, pszGroup : Win32cr::Foundation::PWSTR, lpListPadInfo : Win32cr::System::Mmc::MMC_LISTPAD_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_pad_info.call(this, pszGroup, lpListPadInfo)
    end

  end

  @[Extern]
  record IConsole2Vtbl,
    query_interface : Proc(IConsole2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConsole2*, UInt32),
    release : Proc(IConsole2*, UInt32),
    set_header : Proc(IConsole2*, Void*, Win32cr::Foundation::HRESULT),
    set_toolbar : Proc(IConsole2*, Void*, Win32cr::Foundation::HRESULT),
    query_result_view : Proc(IConsole2*, Void**, Win32cr::Foundation::HRESULT),
    query_scope_image_list : Proc(IConsole2*, Void**, Win32cr::Foundation::HRESULT),
    query_result_image_list : Proc(IConsole2*, Void**, Win32cr::Foundation::HRESULT),
    update_all_views : Proc(IConsole2*, Void*, Win32cr::Foundation::LPARAM, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    message_box : Proc(IConsole2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    query_console_verb : Proc(IConsole2*, Void**, Win32cr::Foundation::HRESULT),
    select_scope_item : Proc(IConsole2*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_main_window : Proc(IConsole2*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    new_window : Proc(IConsole2*, LibC::IntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    expand : Proc(IConsole2*, LibC::IntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_taskpad_view_preferred : Proc(IConsole2*, Win32cr::Foundation::HRESULT),
    set_status_text : Proc(IConsole2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConsole2, lpVtbl : IConsole2Vtbl* do
    GUID = LibC::GUID.new(0x103d842a_u32, 0xaa63_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xe1_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
    def query_interface(this : IConsole2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConsole2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConsole2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_header(this : IConsole2*, pHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_header.call(this, pHeader)
    end
    def set_toolbar(this : IConsole2*, pToolbar : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_toolbar.call(this, pToolbar)
    end
    def query_result_view(this : IConsole2*, pUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_result_view.call(this, pUnknown)
    end
    def query_scope_image_list(this : IConsole2*, ppImageList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_scope_image_list.call(this, ppImageList)
    end
    def query_result_image_list(this : IConsole2*, ppImageList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_result_image_list.call(this, ppImageList)
    end
    def update_all_views(this : IConsole2*, lpDataObject : Void*, data : Win32cr::Foundation::LPARAM, hint : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_all_views.call(this, lpDataObject, data, hint)
    end
    def message_box(this : IConsole2*, lpszText : Win32cr::Foundation::PWSTR, lpszTitle : Win32cr::Foundation::PWSTR, fuStyle : UInt32, piRetval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.message_box.call(this, lpszText, lpszTitle, fuStyle, piRetval)
    end
    def query_console_verb(this : IConsole2*, ppConsoleVerb : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_console_verb.call(this, ppConsoleVerb)
    end
    def select_scope_item(this : IConsole2*, hScopeItem : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select_scope_item.call(this, hScopeItem)
    end
    def get_main_window(this : IConsole2*, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_window.call(this, phwnd)
    end
    def new_window(this : IConsole2*, hScopeItem : LibC::IntPtrT, lOptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_window.call(this, hScopeItem, lOptions)
    end
    def expand(this : IConsole2*, hItem : LibC::IntPtrT, bExpand : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this, hItem, bExpand)
    end
    def is_taskpad_view_preferred(this : IConsole2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_taskpad_view_preferred.call(this)
    end
    def set_status_text(this : IConsole2*, pszStatusText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_status_text.call(this, pszStatusText)
    end

  end

  @[Extern]
  record IDisplayHelpVtbl,
    query_interface : Proc(IDisplayHelp*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDisplayHelp*, UInt32),
    release : Proc(IDisplayHelp*, UInt32),
    show_topic : Proc(IDisplayHelp*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDisplayHelp, lpVtbl : IDisplayHelpVtbl* do
    GUID = LibC::GUID.new(0xcc593830_u32, 0xb926_u16, 0x11d1_u16, StaticArray[0x80_u8, 0x63_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0xa9_u8, 0xce_u8])
    def query_interface(this : IDisplayHelp*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDisplayHelp*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDisplayHelp*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def show_topic(this : IDisplayHelp*, pszHelpTopic : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_topic.call(this, pszHelpTopic)
    end

  end

  @[Extern]
  record IRequiredExtensionsVtbl,
    query_interface : Proc(IRequiredExtensions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRequiredExtensions*, UInt32),
    release : Proc(IRequiredExtensions*, UInt32),
    enable_all_extensions : Proc(IRequiredExtensions*, Win32cr::Foundation::HRESULT),
    get_first_extension : Proc(IRequiredExtensions*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_next_extension : Proc(IRequiredExtensions*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRequiredExtensions, lpVtbl : IRequiredExtensionsVtbl* do
    GUID = LibC::GUID.new(0x72782d7a_u32, 0xa4a0_u16, 0x11d1_u16, StaticArray[0xaf_u8, 0xf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0xdd_u8, 0x2c_u8])
    def query_interface(this : IRequiredExtensions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRequiredExtensions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRequiredExtensions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable_all_extensions(this : IRequiredExtensions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_all_extensions.call(this)
    end
    def get_first_extension(this : IRequiredExtensions*, pExtCLSID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_first_extension.call(this, pExtCLSID)
    end
    def get_next_extension(this : IRequiredExtensions*, pExtCLSID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_extension.call(this, pExtCLSID)
    end

  end

  @[Extern]
  record IStringTableVtbl,
    query_interface : Proc(IStringTable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStringTable*, UInt32),
    release : Proc(IStringTable*, UInt32),
    add_string : Proc(IStringTable*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_string : Proc(IStringTable*, UInt32, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_string_length : Proc(IStringTable*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    delete_string : Proc(IStringTable*, UInt32, Win32cr::Foundation::HRESULT),
    delete_all_strings : Proc(IStringTable*, Win32cr::Foundation::HRESULT),
    find_string : Proc(IStringTable*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    enumerate : Proc(IStringTable*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IStringTable, lpVtbl : IStringTableVtbl* do
    GUID = LibC::GUID.new(0xde40b7a4_u32, 0xf65_u16, 0x11d2_u16, StaticArray[0x8e_u8, 0x25_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])
    def query_interface(this : IStringTable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStringTable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStringTable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_string(this : IStringTable*, pszAdd : Win32cr::Foundation::PWSTR, pStringID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_string.call(this, pszAdd, pStringID)
    end
    def get_string(this : IStringTable*, string_id : UInt32, cchBuffer : UInt32, lpBuffer : UInt16*, pcchOut : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, string_id, cchBuffer, lpBuffer, pcchOut)
    end
    def get_string_length(this : IStringTable*, string_id : UInt32, pcchString : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_length.call(this, string_id, pcchString)
    end
    def delete_string(this : IStringTable*, string_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_string.call(this, string_id)
    end
    def delete_all_strings(this : IStringTable*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_all_strings.call(this)
    end
    def find_string(this : IStringTable*, pszFind : Win32cr::Foundation::PWSTR, pStringID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_string.call(this, pszFind, pStringID)
    end
    def enumerate(this : IStringTable*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate.call(this, ppEnum)
    end

  end

  @[Extern]
  record IColumnDataVtbl,
    query_interface : Proc(IColumnData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IColumnData*, UInt32),
    release : Proc(IColumnData*, UInt32),
    set_column_config_data : Proc(IColumnData*, Win32cr::System::Mmc::SColumnSetID*, Win32cr::System::Mmc::MMC_COLUMN_SET_DATA*, Win32cr::Foundation::HRESULT),
    get_column_config_data : Proc(IColumnData*, Win32cr::System::Mmc::SColumnSetID*, Win32cr::System::Mmc::MMC_COLUMN_SET_DATA**, Win32cr::Foundation::HRESULT),
    set_column_sort_data : Proc(IColumnData*, Win32cr::System::Mmc::SColumnSetID*, Win32cr::System::Mmc::MMC_SORT_SET_DATA*, Win32cr::Foundation::HRESULT),
    get_column_sort_data : Proc(IColumnData*, Win32cr::System::Mmc::SColumnSetID*, Win32cr::System::Mmc::MMC_SORT_SET_DATA**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IColumnData, lpVtbl : IColumnDataVtbl* do
    GUID = LibC::GUID.new(0x547c1354_u32, 0x24d_u16, 0x11d3_u16, StaticArray[0xa7_u8, 0x7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf4_u8, 0xcb_u8])
    def query_interface(this : IColumnData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IColumnData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IColumnData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_column_config_data(this : IColumnData*, pColID : Win32cr::System::Mmc::SColumnSetID*, pColSetData : Win32cr::System::Mmc::MMC_COLUMN_SET_DATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_column_config_data.call(this, pColID, pColSetData)
    end
    def get_column_config_data(this : IColumnData*, pColID : Win32cr::System::Mmc::SColumnSetID*, ppColSetData : Win32cr::System::Mmc::MMC_COLUMN_SET_DATA**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_config_data.call(this, pColID, ppColSetData)
    end
    def set_column_sort_data(this : IColumnData*, pColID : Win32cr::System::Mmc::SColumnSetID*, pColSortData : Win32cr::System::Mmc::MMC_SORT_SET_DATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_column_sort_data.call(this, pColID, pColSortData)
    end
    def get_column_sort_data(this : IColumnData*, pColID : Win32cr::System::Mmc::SColumnSetID*, ppColSortData : Win32cr::System::Mmc::MMC_SORT_SET_DATA**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_sort_data.call(this, pColID, ppColSortData)
    end

  end

  @[Extern]
  record IMessageViewVtbl,
    query_interface : Proc(IMessageView*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMessageView*, UInt32),
    release : Proc(IMessageView*, UInt32),
    set_title_text : Proc(IMessageView*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_body_text : Proc(IMessageView*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_icon : Proc(IMessageView*, Win32cr::System::Mmc::IconIdentifier, Win32cr::Foundation::HRESULT),
    clear : Proc(IMessageView*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMessageView, lpVtbl : IMessageViewVtbl* do
    GUID = LibC::GUID.new(0x80f94174_u32, 0xfccc_u16, 0x11d2_u16, StaticArray[0xb9_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])
    def query_interface(this : IMessageView*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMessageView*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMessageView*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_title_text(this : IMessageView*, pszTitleText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_title_text.call(this, pszTitleText)
    end
    def set_body_text(this : IMessageView*, pszBodyText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_body_text.call(this, pszBodyText)
    end
    def set_icon(this : IMessageView*, id : Win32cr::System::Mmc::IconIdentifier) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_icon.call(this, id)
    end
    def clear(this : IMessageView*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]
  record IResultDataCompareExVtbl,
    query_interface : Proc(IResultDataCompareEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResultDataCompareEx*, UInt32),
    release : Proc(IResultDataCompareEx*, UInt32),
    compare : Proc(IResultDataCompareEx*, Win32cr::System::Mmc::RDCOMPARE*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IResultDataCompareEx, lpVtbl : IResultDataCompareExVtbl* do
    GUID = LibC::GUID.new(0x96933476_u32, 0x251_u16, 0x11d3_u16, StaticArray[0xae_u8, 0xb0_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xcd_u8, 0x78_u8])
    def query_interface(this : IResultDataCompareEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResultDataCompareEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResultDataCompareEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compare(this : IResultDataCompareEx*, prdc : Win32cr::System::Mmc::RDCOMPARE*, pnResult : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare.call(this, prdc, pnResult)
    end

  end

  @[Extern]
  record IComponentData2Vtbl,
    query_interface : Proc(IComponentData2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComponentData2*, UInt32),
    release : Proc(IComponentData2*, UInt32),
    initialize__ : Proc(IComponentData2*, Void*, Win32cr::Foundation::HRESULT),
    create_component : Proc(IComponentData2*, Void**, Win32cr::Foundation::HRESULT),
    notify : Proc(IComponentData2*, Void*, Win32cr::System::Mmc::MMC_NOTIFY_TYPE, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    destroy : Proc(IComponentData2*, Win32cr::Foundation::HRESULT),
    query_data_object : Proc(IComponentData2*, LibC::IntPtrT, Win32cr::System::Mmc::DATA_OBJECT_TYPES, Void**, Win32cr::Foundation::HRESULT),
    get_display_info : Proc(IComponentData2*, Win32cr::System::Mmc::SCOPEDATAITEM*, Win32cr::Foundation::HRESULT),
    compare_objects : Proc(IComponentData2*, Void*, Void*, Win32cr::Foundation::HRESULT),
    query_dispatch : Proc(IComponentData2*, LibC::IntPtrT, Win32cr::System::Mmc::DATA_OBJECT_TYPES, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IComponentData2, lpVtbl : IComponentData2Vtbl* do
    GUID = LibC::GUID.new(0xcca0f2d2_u32, 0x82de_u16, 0x41b5_u16, StaticArray[0xbf_u8, 0x47_u8, 0x3b_u8, 0x20_u8, 0x76_u8, 0x27_u8, 0x3d_u8, 0x5c_u8])
    def query_interface(this : IComponentData2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComponentData2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComponentData2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IComponentData2*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pUnknown)
    end
    def create_component(this : IComponentData2*, ppComponent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_component.call(this, ppComponent)
    end
    def notify(this : IComponentData2*, lpDataObject : Void*, event : Win32cr::System::Mmc::MMC_NOTIFY_TYPE, arg : Win32cr::Foundation::LPARAM, param3 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, lpDataObject, event, arg, param3)
    end
    def destroy(this : IComponentData2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy.call(this)
    end
    def query_data_object(this : IComponentData2*, cookie : LibC::IntPtrT, type__ : Win32cr::System::Mmc::DATA_OBJECT_TYPES, ppDataObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_data_object.call(this, cookie, type__, ppDataObject)
    end
    def get_display_info(this : IComponentData2*, pScopeDataItem : Win32cr::System::Mmc::SCOPEDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_info.call(this, pScopeDataItem)
    end
    def compare_objects(this : IComponentData2*, lpDataObjectA : Void*, lpDataObjectB : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_objects.call(this, lpDataObjectA, lpDataObjectB)
    end
    def query_dispatch(this : IComponentData2*, cookie : LibC::IntPtrT, type__ : Win32cr::System::Mmc::DATA_OBJECT_TYPES, ppDispatch : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_dispatch.call(this, cookie, type__, ppDispatch)
    end

  end

  @[Extern]
  record IComponent2Vtbl,
    query_interface : Proc(IComponent2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComponent2*, UInt32),
    release : Proc(IComponent2*, UInt32),
    initialize__ : Proc(IComponent2*, Void*, Win32cr::Foundation::HRESULT),
    notify : Proc(IComponent2*, Void*, Win32cr::System::Mmc::MMC_NOTIFY_TYPE, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    destroy : Proc(IComponent2*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    query_data_object : Proc(IComponent2*, LibC::IntPtrT, Win32cr::System::Mmc::DATA_OBJECT_TYPES, Void**, Win32cr::Foundation::HRESULT),
    get_result_view_type : Proc(IComponent2*, LibC::IntPtrT, Win32cr::Foundation::PWSTR*, Int32*, Win32cr::Foundation::HRESULT),
    get_display_info : Proc(IComponent2*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    compare_objects : Proc(IComponent2*, Void*, Void*, Win32cr::Foundation::HRESULT),
    query_dispatch : Proc(IComponent2*, LibC::IntPtrT, Win32cr::System::Mmc::DATA_OBJECT_TYPES, Void**, Win32cr::Foundation::HRESULT),
    get_result_view_type2 : Proc(IComponent2*, LibC::IntPtrT, Win32cr::System::Mmc::RESULT_VIEW_TYPE_INFO*, Win32cr::Foundation::HRESULT),
    restore_result_view : Proc(IComponent2*, LibC::IntPtrT, Win32cr::System::Mmc::RESULT_VIEW_TYPE_INFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IComponent2, lpVtbl : IComponent2Vtbl* do
    GUID = LibC::GUID.new(0x79a2d615_u32, 0x4a10_u16, 0x4ed4_u16, StaticArray[0x8c_u8, 0x65_u8, 0x86_u8, 0x33_u8, 0xf9_u8, 0x33_u8, 0x50_u8, 0x95_u8])
    def query_interface(this : IComponent2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComponent2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComponent2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IComponent2*, lpConsole : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, lpConsole)
    end
    def notify(this : IComponent2*, lpDataObject : Void*, event : Win32cr::System::Mmc::MMC_NOTIFY_TYPE, arg : Win32cr::Foundation::LPARAM, param3 : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, lpDataObject, event, arg, param3)
    end
    def destroy(this : IComponent2*, cookie : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy.call(this, cookie)
    end
    def query_data_object(this : IComponent2*, cookie : LibC::IntPtrT, type__ : Win32cr::System::Mmc::DATA_OBJECT_TYPES, ppDataObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_data_object.call(this, cookie, type__, ppDataObject)
    end
    def get_result_view_type(this : IComponent2*, cookie : LibC::IntPtrT, ppViewType : Win32cr::Foundation::PWSTR*, pViewOptions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result_view_type.call(this, cookie, ppViewType, pViewOptions)
    end
    def get_display_info(this : IComponent2*, pResultDataItem : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_info.call(this, pResultDataItem)
    end
    def compare_objects(this : IComponent2*, lpDataObjectA : Void*, lpDataObjectB : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_objects.call(this, lpDataObjectA, lpDataObjectB)
    end
    def query_dispatch(this : IComponent2*, cookie : LibC::IntPtrT, type__ : Win32cr::System::Mmc::DATA_OBJECT_TYPES, ppDispatch : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_dispatch.call(this, cookie, type__, ppDispatch)
    end
    def get_result_view_type2(this : IComponent2*, cookie : LibC::IntPtrT, pResultViewType : Win32cr::System::Mmc::RESULT_VIEW_TYPE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result_view_type2.call(this, cookie, pResultViewType)
    end
    def restore_result_view(this : IComponent2*, cookie : LibC::IntPtrT, pResultViewType : Win32cr::System::Mmc::RESULT_VIEW_TYPE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_result_view.call(this, cookie, pResultViewType)
    end

  end

  @[Extern]
  record IContextMenuCallback2Vtbl,
    query_interface : Proc(IContextMenuCallback2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContextMenuCallback2*, UInt32),
    release : Proc(IContextMenuCallback2*, UInt32),
    add_item : Proc(IContextMenuCallback2*, Win32cr::System::Mmc::CONTEXTMENUITEM2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContextMenuCallback2, lpVtbl : IContextMenuCallback2Vtbl* do
    GUID = LibC::GUID.new(0xe178bc0e_u32, 0x2ed0_u16, 0x4b5e_u16, StaticArray[0x80_u8, 0x97_u8, 0x42_u8, 0xc9_u8, 0x8_u8, 0x7e_u8, 0x8b_u8, 0x33_u8])
    def query_interface(this : IContextMenuCallback2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContextMenuCallback2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContextMenuCallback2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_item(this : IContextMenuCallback2*, pItem : Win32cr::System::Mmc::CONTEXTMENUITEM2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, pItem)
    end

  end

  @[Extern]
  record IMMCVersionInfoVtbl,
    query_interface : Proc(IMMCVersionInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMMCVersionInfo*, UInt32),
    release : Proc(IMMCVersionInfo*, UInt32),
    get_mmc_version : Proc(IMMCVersionInfo*, Int32*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMMCVersionInfo, lpVtbl : IMMCVersionInfoVtbl* do
    GUID = LibC::GUID.new(0xa8d2c5fe_u32, 0xcdcb_u16, 0x4b9d_u16, StaticArray[0xbd_u8, 0xe5_u8, 0xa2_u8, 0x73_u8, 0x43_u8, 0xff_u8, 0x54_u8, 0xbc_u8])
    def query_interface(this : IMMCVersionInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMMCVersionInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMMCVersionInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_mmc_version(this : IMMCVersionInfo*, pVersionMajor : Int32*, pVersionMinor : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mmc_version.call(this, pVersionMajor, pVersionMinor)
    end

  end

  @[Extern]
  record IExtendViewVtbl,
    query_interface : Proc(IExtendView*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExtendView*, UInt32),
    release : Proc(IExtendView*, UInt32),
    get_views : Proc(IExtendView*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IExtendView, lpVtbl : IExtendViewVtbl* do
    GUID = LibC::GUID.new(0x89995cee_u32, 0xd2ed_u16, 0x4c0e_u16, StaticArray[0xae_u8, 0x5e_u8, 0xdf_u8, 0x7e_u8, 0x76_u8, 0xf3_u8, 0xfa_u8, 0x53_u8])
    def query_interface(this : IExtendView*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExtendView*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExtendView*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_views(this : IExtendView*, pDataObject : Void*, pViewExtensionCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_views.call(this, pDataObject, pViewExtensionCallback)
    end

  end

  @[Extern]
  record IViewExtensionCallbackVtbl,
    query_interface : Proc(IViewExtensionCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IViewExtensionCallback*, UInt32),
    release : Proc(IViewExtensionCallback*, UInt32),
    add_view : Proc(IViewExtensionCallback*, Win32cr::System::Mmc::MMC_EXT_VIEW_DATA*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IViewExtensionCallback, lpVtbl : IViewExtensionCallbackVtbl* do
    GUID = LibC::GUID.new(0x34dd928a_u32, 0x7599_u16, 0x41e5_u16, StaticArray[0x9f_u8, 0x5e_u8, 0xd6_u8, 0xbc_u8, 0x30_u8, 0x62_u8, 0xc2_u8, 0xda_u8])
    def query_interface(this : IViewExtensionCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IViewExtensionCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IViewExtensionCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_view(this : IViewExtensionCallback*, pExtViewData : Win32cr::System::Mmc::MMC_EXT_VIEW_DATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_view.call(this, pExtViewData)
    end

  end

  @[Extern]
  record IConsolePowerVtbl,
    query_interface : Proc(IConsolePower*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConsolePower*, UInt32),
    release : Proc(IConsolePower*, UInt32),
    set_execution_state : Proc(IConsolePower*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    reset_idle_timer : Proc(IConsolePower*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConsolePower, lpVtbl : IConsolePowerVtbl* do
    GUID = LibC::GUID.new(0x1cfbdd0e_u32, 0x62ca_u16, 0x49ce_u16, StaticArray[0xa3_u8, 0xaf_u8, 0xdb_u8, 0xb2_u8, 0xde_u8, 0x61_u8, 0xb0_u8, 0x68_u8])
    def query_interface(this : IConsolePower*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConsolePower*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConsolePower*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_execution_state(this : IConsolePower*, dwAdd : UInt32, dwRemove : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_execution_state.call(this, dwAdd, dwRemove)
    end
    def reset_idle_timer(this : IConsolePower*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_idle_timer.call(this, dwFlags)
    end

  end

  @[Extern]
  record IConsolePowerSinkVtbl,
    query_interface : Proc(IConsolePowerSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConsolePowerSink*, UInt32),
    release : Proc(IConsolePowerSink*, UInt32),
    on_power_broadcast : Proc(IConsolePowerSink*, UInt32, Win32cr::Foundation::LPARAM, Win32cr::Foundation::LRESULT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConsolePowerSink, lpVtbl : IConsolePowerSinkVtbl* do
    GUID = LibC::GUID.new(0x3333759f_u32, 0xfe4f_u16, 0x4975_u16, StaticArray[0xb1_u8, 0x43_u8, 0xfe_u8, 0xc0_u8, 0xa5_u8, 0xdd_u8, 0x6d_u8, 0x65_u8])
    def query_interface(this : IConsolePowerSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConsolePowerSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConsolePowerSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_power_broadcast(this : IConsolePowerSink*, nEvent : UInt32, lParam : Win32cr::Foundation::LPARAM, plReturn : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_power_broadcast.call(this, nEvent, lParam, plReturn)
    end

  end

  @[Extern]
  record INodePropertiesVtbl,
    query_interface : Proc(INodeProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INodeProperties*, UInt32),
    release : Proc(INodeProperties*, UInt32),
    get_property : Proc(INodeProperties*, Void*, Win32cr::Foundation::BSTR, UInt16**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INodeProperties, lpVtbl : INodePropertiesVtbl* do
    GUID = LibC::GUID.new(0x15bc4d24_u32, 0xa522_u16, 0x4406_u16, StaticArray[0xaa_u8, 0x55_u8, 0x7_u8, 0x49_u8, 0x53_u8, 0x7a_u8, 0x68_u8, 0x65_u8])
    def query_interface(this : INodeProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INodeProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INodeProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property(this : INodeProperties*, pDataObject : Void*, szPropertyName : Win32cr::Foundation::BSTR, pbstrProperty : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, pDataObject, szPropertyName, pbstrProperty)
    end

  end

  @[Extern]
  record IConsole3Vtbl,
    query_interface : Proc(IConsole3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConsole3*, UInt32),
    release : Proc(IConsole3*, UInt32),
    set_header : Proc(IConsole3*, Void*, Win32cr::Foundation::HRESULT),
    set_toolbar : Proc(IConsole3*, Void*, Win32cr::Foundation::HRESULT),
    query_result_view : Proc(IConsole3*, Void**, Win32cr::Foundation::HRESULT),
    query_scope_image_list : Proc(IConsole3*, Void**, Win32cr::Foundation::HRESULT),
    query_result_image_list : Proc(IConsole3*, Void**, Win32cr::Foundation::HRESULT),
    update_all_views : Proc(IConsole3*, Void*, Win32cr::Foundation::LPARAM, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    message_box : Proc(IConsole3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    query_console_verb : Proc(IConsole3*, Void**, Win32cr::Foundation::HRESULT),
    select_scope_item : Proc(IConsole3*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    get_main_window : Proc(IConsole3*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    new_window : Proc(IConsole3*, LibC::IntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    expand : Proc(IConsole3*, LibC::IntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_taskpad_view_preferred : Proc(IConsole3*, Win32cr::Foundation::HRESULT),
    set_status_text : Proc(IConsole3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    rename_scope_item : Proc(IConsole3*, LibC::IntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConsole3, lpVtbl : IConsole3Vtbl* do
    GUID = LibC::GUID.new(0x4f85efdb_u32, 0xd0e1_u16, 0x498c_u16, StaticArray[0x8d_u8, 0x4a_u8, 0xd0_u8, 0x10_u8, 0xdf_u8, 0xdd_u8, 0x40_u8, 0x4f_u8])
    def query_interface(this : IConsole3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConsole3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConsole3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_header(this : IConsole3*, pHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_header.call(this, pHeader)
    end
    def set_toolbar(this : IConsole3*, pToolbar : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_toolbar.call(this, pToolbar)
    end
    def query_result_view(this : IConsole3*, pUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_result_view.call(this, pUnknown)
    end
    def query_scope_image_list(this : IConsole3*, ppImageList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_scope_image_list.call(this, ppImageList)
    end
    def query_result_image_list(this : IConsole3*, ppImageList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_result_image_list.call(this, ppImageList)
    end
    def update_all_views(this : IConsole3*, lpDataObject : Void*, data : Win32cr::Foundation::LPARAM, hint : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_all_views.call(this, lpDataObject, data, hint)
    end
    def message_box(this : IConsole3*, lpszText : Win32cr::Foundation::PWSTR, lpszTitle : Win32cr::Foundation::PWSTR, fuStyle : UInt32, piRetval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.message_box.call(this, lpszText, lpszTitle, fuStyle, piRetval)
    end
    def query_console_verb(this : IConsole3*, ppConsoleVerb : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_console_verb.call(this, ppConsoleVerb)
    end
    def select_scope_item(this : IConsole3*, hScopeItem : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select_scope_item.call(this, hScopeItem)
    end
    def get_main_window(this : IConsole3*, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_window.call(this, phwnd)
    end
    def new_window(this : IConsole3*, hScopeItem : LibC::IntPtrT, lOptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_window.call(this, hScopeItem, lOptions)
    end
    def expand(this : IConsole3*, hItem : LibC::IntPtrT, bExpand : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this, hItem, bExpand)
    end
    def is_taskpad_view_preferred(this : IConsole3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_taskpad_view_preferred.call(this)
    end
    def set_status_text(this : IConsole3*, pszStatusText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_status_text.call(this, pszStatusText)
    end
    def rename_scope_item(this : IConsole3*, hScopeItem : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename_scope_item.call(this, hScopeItem)
    end

  end

  @[Extern]
  record IResultData2Vtbl,
    query_interface : Proc(IResultData2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResultData2*, UInt32),
    release : Proc(IResultData2*, UInt32),
    insert_item : Proc(IResultData2*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    delete_item : Proc(IResultData2*, LibC::IntPtrT, Int32, Win32cr::Foundation::HRESULT),
    find_item_by_l_param : Proc(IResultData2*, Win32cr::Foundation::LPARAM, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    delete_all_rslt_items : Proc(IResultData2*, Win32cr::Foundation::HRESULT),
    set_item : Proc(IResultData2*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    get_item : Proc(IResultData2*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    get_next_item : Proc(IResultData2*, Win32cr::System::Mmc::RESULTDATAITEM*, Win32cr::Foundation::HRESULT),
    modify_item_state : Proc(IResultData2*, Int32, LibC::IntPtrT, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    modify_view_style : Proc(IResultData2*, Win32cr::System::Mmc::MMC_RESULT_VIEW_STYLE, Win32cr::System::Mmc::MMC_RESULT_VIEW_STYLE, Win32cr::Foundation::HRESULT),
    set_view_mode : Proc(IResultData2*, Int32, Win32cr::Foundation::HRESULT),
    get_view_mode : Proc(IResultData2*, Int32*, Win32cr::Foundation::HRESULT),
    update_item : Proc(IResultData2*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    sort : Proc(IResultData2*, Int32, UInt32, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    set_desc_bar_text : Proc(IResultData2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_item_count : Proc(IResultData2*, Int32, UInt32, Win32cr::Foundation::HRESULT),
    rename_result_item : Proc(IResultData2*, LibC::IntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IResultData2, lpVtbl : IResultData2Vtbl* do
    GUID = LibC::GUID.new(0xf36e0eb_u32, 0xa7f1_u16, 0x4a81_u16, StaticArray[0xbe_u8, 0x5a_u8, 0x92_u8, 0x47_u8, 0xf7_u8, 0xde_u8, 0x4b_u8, 0x1b_u8])
    def query_interface(this : IResultData2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResultData2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResultData2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert_item(this : IResultData2*, item : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_item.call(this, item)
    end
    def delete_item(this : IResultData2*, itemID : LibC::IntPtrT, nCol : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, itemID, nCol)
    end
    def find_item_by_l_param(this : IResultData2*, lParam : Win32cr::Foundation::LPARAM, pItemID : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_item_by_l_param.call(this, lParam, pItemID)
    end
    def delete_all_rslt_items(this : IResultData2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_all_rslt_items.call(this)
    end
    def set_item(this : IResultData2*, item : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_item.call(this, item)
    end
    def get_item(this : IResultData2*, item : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item.call(this, item)
    end
    def get_next_item(this : IResultData2*, item : Win32cr::System::Mmc::RESULTDATAITEM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_item.call(this, item)
    end
    def modify_item_state(this : IResultData2*, nIndex : Int32, itemID : LibC::IntPtrT, uAdd : UInt32, uRemove : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_item_state.call(this, nIndex, itemID, uAdd, uRemove)
    end
    def modify_view_style(this : IResultData2*, add : Win32cr::System::Mmc::MMC_RESULT_VIEW_STYLE, remove : Win32cr::System::Mmc::MMC_RESULT_VIEW_STYLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_view_style.call(this, add, remove)
    end
    def set_view_mode(this : IResultData2*, lViewMode : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_view_mode.call(this, lViewMode)
    end
    def get_view_mode(this : IResultData2*, lViewMode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_mode.call(this, lViewMode)
    end
    def update_item(this : IResultData2*, itemID : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_item.call(this, itemID)
    end
    def sort(this : IResultData2*, nColumn : Int32, dwSortOptions : UInt32, lUserParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sort.call(this, nColumn, dwSortOptions, lUserParam)
    end
    def set_desc_bar_text(this : IResultData2*, desc_text : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_desc_bar_text.call(this, desc_text)
    end
    def set_item_count(this : IResultData2*, nItemCount : Int32, dwOptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_item_count.call(this, nItemCount, dwOptions)
    end
    def rename_result_item(this : IResultData2*, itemID : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename_result_item.call(this, itemID)
    end

  end

end