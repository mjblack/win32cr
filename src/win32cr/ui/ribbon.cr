require "../system/com.cr"
require "../foundation.cr"
require "../ui/shell/propertiessystem.cr"
require "../system/com/structuredstorage.cr"
require "../graphics/gdi.cr"

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
  UI_ALL_COMMANDS = 0_u32
  UI_COLLECTION_INVALIDINDEX = 4294967295_u32
  LIBID_UIRibbon = "942f35c2-e83b-45ef-b085-ac295dd63d5b"
  CLSID_UIRibbonFramework = LibC::GUID.new(0x926749fa_u32, 0x2615_u16, 0x4987_u16, StaticArray[0x88_u8, 0x45_u8, 0xc3_u8, 0x3e_u8, 0x65_u8, 0xf2_u8, 0xb9_u8, 0x57_u8])
  CLSID_UIRibbonImageFromBitmapFactory = LibC::GUID.new(0xf7434b6_u32, 0x59b6_u16, 0x4250_u16, StaticArray[0x99_u8, 0x9e_u8, 0xd1_u8, 0x68_u8, 0xd6_u8, 0xae_u8, 0x42_u8, 0x93_u8])


  enum UI_CONTEXTAVAILABILITY : Int32
    UI_CONTEXTAVAILABILITY_NOTAVAILABLE = 0
    UI_CONTEXTAVAILABILITY_AVAILABLE = 1
    UI_CONTEXTAVAILABILITY_ACTIVE = 2
  end

  enum UI_FONTPROPERTIES : Int32
    UI_FONTPROPERTIES_NOTAVAILABLE = 0
    UI_FONTPROPERTIES_NOTSET = 1
    UI_FONTPROPERTIES_SET = 2
  end

  enum UI_FONTVERTICALPOSITION : Int32
    UI_FONTVERTICALPOSITION_NOTAVAILABLE = 0
    UI_FONTVERTICALPOSITION_NOTSET = 1
    UI_FONTVERTICALPOSITION_SUPERSCRIPT = 2
    UI_FONTVERTICALPOSITION_SUBSCRIPT = 3
  end

  enum UI_FONTUNDERLINE : Int32
    UI_FONTUNDERLINE_NOTAVAILABLE = 0
    UI_FONTUNDERLINE_NOTSET = 1
    UI_FONTUNDERLINE_SET = 2
  end

  enum UI_FONTDELTASIZE : Int32
    UI_FONTDELTASIZE_GROW = 0
    UI_FONTDELTASIZE_SHRINK = 1
  end

  enum UI_CONTROLDOCK : Int32
    UI_CONTROLDOCK_TOP = 1
    UI_CONTROLDOCK_BOTTOM = 3
  end

  enum UI_SWATCHCOLORTYPE : Int32
    UI_SWATCHCOLORTYPE_NOCOLOR = 0
    UI_SWATCHCOLORTYPE_AUTOMATIC = 1
    UI_SWATCHCOLORTYPE_RGB = 2
  end

  enum UI_SWATCHCOLORMODE : Int32
    UI_SWATCHCOLORMODE_NORMAL = 0
    UI_SWATCHCOLORMODE_MONOCHROME = 1
  end

  enum UI_EVENTTYPE : Int32
    UI_EVENTTYPE_ApplicationMenuOpened = 0
    UI_EVENTTYPE_RibbonMinimized = 1
    UI_EVENTTYPE_RibbonExpanded = 2
    UI_EVENTTYPE_ApplicationModeSwitched = 3
    UI_EVENTTYPE_TabActivated = 4
    UI_EVENTTYPE_MenuOpened = 5
    UI_EVENTTYPE_CommandExecuted = 6
    UI_EVENTTYPE_TooltipShown = 7
  end

  enum UI_EVENTLOCATION : Int32
    UI_EVENTLOCATION_Ribbon = 0
    UI_EVENTLOCATION_QAT = 1
    UI_EVENTLOCATION_ApplicationMenu = 2
    UI_EVENTLOCATION_ContextPopup = 3
  end

  enum UI_INVALIDATIONS : Int32
    UI_INVALIDATIONS_STATE = 1
    UI_INVALIDATIONS_VALUE = 2
    UI_INVALIDATIONS_PROPERTY = 4
    UI_INVALIDATIONS_ALLPROPERTIES = 8
  end

  enum UI_COLLECTIONCHANGE : Int32
    UI_COLLECTIONCHANGE_INSERT = 0
    UI_COLLECTIONCHANGE_REMOVE = 1
    UI_COLLECTIONCHANGE_REPLACE = 2
    UI_COLLECTIONCHANGE_RESET = 3
  end

  enum UI_EXECUTIONVERB : Int32
    UI_EXECUTIONVERB_EXECUTE = 0
    UI_EXECUTIONVERB_PREVIEW = 1
    UI_EXECUTIONVERB_CANCELPREVIEW = 2
  end

  enum UI_COMMANDTYPE : Int32
    UI_COMMANDTYPE_UNKNOWN = 0
    UI_COMMANDTYPE_GROUP = 1
    UI_COMMANDTYPE_ACTION = 2
    UI_COMMANDTYPE_ANCHOR = 3
    UI_COMMANDTYPE_CONTEXT = 4
    UI_COMMANDTYPE_COLLECTION = 5
    UI_COMMANDTYPE_COMMANDCOLLECTION = 6
    UI_COMMANDTYPE_DECIMAL = 7
    UI_COMMANDTYPE_BOOLEAN = 8
    UI_COMMANDTYPE_FONT = 9
    UI_COMMANDTYPE_RECENTITEMS = 10
    UI_COMMANDTYPE_COLORANCHOR = 11
    UI_COMMANDTYPE_COLORCOLLECTION = 12
  end

  enum UI_VIEWTYPE : Int32
    UI_VIEWTYPE_RIBBON = 1
  end

  enum UI_VIEWVERB : Int32
    UI_VIEWVERB_CREATE = 0
    UI_VIEWVERB_DESTROY = 1
    UI_VIEWVERB_SIZE = 2
    UI_VIEWVERB_ERROR = 3
  end

  enum UI_OWNERSHIP : Int32
    UI_OWNERSHIP_TRANSFER = 0
    UI_OWNERSHIP_COPY = 1
  end

  union UI_EVENTPARAMS_Anonymous_e__Union
    modes : Int32
    params : UI_EVENTPARAMS_COMMAND
  end

  struct UI_EVENTPARAMS_COMMAND
    command_id : UInt32
    command_name : LibC::LPWSTR
    parent_command_id : UInt32
    parent_command_name : LibC::LPWSTR
    selection_index : UInt32
    location : UI_EVENTLOCATION
  end
  struct UI_EVENTPARAMS
    event_type : UI_EVENTTYPE
    anonymous : UI_EVENTPARAMS_Anonymous_e__Union
  end


  struct IUISimplePropertySetVTbl
    query_interface : Proc(IUISimplePropertySet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUISimplePropertySet*, UInt32)
    release : Proc(IUISimplePropertySet*, UInt32)
    get_value : Proc(IUISimplePropertySet*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
  end

  IUISimplePropertySet_GUID = "c205bb48-5b1c-4219-a106-15bd0a5f24e2"
  IID_IUISimplePropertySet = LibC::GUID.new(0xc205bb48_u32, 0x5b1c_u16, 0x4219_u16, StaticArray[0xa1_u8, 0x6_u8, 0x15_u8, 0xbd_u8, 0xa_u8, 0x5f_u8, 0x24_u8, 0xe2_u8])
  struct IUISimplePropertySet
    lpVtbl : IUISimplePropertySetVTbl*
  end

  struct IUIRibbonVTbl
    query_interface : Proc(IUIRibbon*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIRibbon*, UInt32)
    release : Proc(IUIRibbon*, UInt32)
    get_height : Proc(IUIRibbon*, UInt32*, HRESULT)
    load_settings_from_stream : Proc(IUIRibbon*, IStream, HRESULT)
    save_settings_to_stream : Proc(IUIRibbon*, IStream, HRESULT)
  end

  IUIRibbon_GUID = "803982ab-370a-4f7e-a9e7-8784036a6e26"
  IID_IUIRibbon = LibC::GUID.new(0x803982ab_u32, 0x370a_u16, 0x4f7e_u16, StaticArray[0xa9_u8, 0xe7_u8, 0x87_u8, 0x84_u8, 0x3_u8, 0x6a_u8, 0x6e_u8, 0x26_u8])
  struct IUIRibbon
    lpVtbl : IUIRibbonVTbl*
  end

  struct IUIFrameworkVTbl
    query_interface : Proc(IUIFramework*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIFramework*, UInt32)
    release : Proc(IUIFramework*, UInt32)
    initialize : Proc(IUIFramework*, LibC::HANDLE, IUIApplication, HRESULT)
    destroy : Proc(IUIFramework*, HRESULT)
    load_ui : Proc(IUIFramework*, HINSTANCE, LibC::LPWSTR, HRESULT)
    get_view : Proc(IUIFramework*, UInt32, Guid*, Void**, HRESULT)
    get_ui_command_property : Proc(IUIFramework*, UInt32, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    set_ui_command_property : Proc(IUIFramework*, UInt32, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    invalidate_ui_command : Proc(IUIFramework*, UInt32, UI_INVALIDATIONS, PROPERTYKEY*, HRESULT)
    flush_pending_invalidations : Proc(IUIFramework*, HRESULT)
    set_modes : Proc(IUIFramework*, Int32, HRESULT)
  end

  IUIFramework_GUID = "f4f0385d-6872-43a8-ad09-4c339cb3f5c5"
  IID_IUIFramework = LibC::GUID.new(0xf4f0385d_u32, 0x6872_u16, 0x43a8_u16, StaticArray[0xad_u8, 0x9_u8, 0x4c_u8, 0x33_u8, 0x9c_u8, 0xb3_u8, 0xf5_u8, 0xc5_u8])
  struct IUIFramework
    lpVtbl : IUIFrameworkVTbl*
  end

  struct IUIEventLoggerVTbl
    query_interface : Proc(IUIEventLogger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIEventLogger*, UInt32)
    release : Proc(IUIEventLogger*, UInt32)
    on_ui_event : Proc(IUIEventLogger*, UI_EVENTPARAMS*, Void)
  end

  IUIEventLogger_GUID = "ec3e1034-dbf4-41a1-95d5-03e0f1026e05"
  IID_IUIEventLogger = LibC::GUID.new(0xec3e1034_u32, 0xdbf4_u16, 0x41a1_u16, StaticArray[0x95_u8, 0xd5_u8, 0x3_u8, 0xe0_u8, 0xf1_u8, 0x2_u8, 0x6e_u8, 0x5_u8])
  struct IUIEventLogger
    lpVtbl : IUIEventLoggerVTbl*
  end

  struct IUIEventingManagerVTbl
    query_interface : Proc(IUIEventingManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIEventingManager*, UInt32)
    release : Proc(IUIEventingManager*, UInt32)
    set_event_logger : Proc(IUIEventingManager*, IUIEventLogger, HRESULT)
  end

  IUIEventingManager_GUID = "3be6ea7f-9a9b-4198-9368-9b0f923bd534"
  IID_IUIEventingManager = LibC::GUID.new(0x3be6ea7f_u32, 0x9a9b_u16, 0x4198_u16, StaticArray[0x93_u8, 0x68_u8, 0x9b_u8, 0xf_u8, 0x92_u8, 0x3b_u8, 0xd5_u8, 0x34_u8])
  struct IUIEventingManager
    lpVtbl : IUIEventingManagerVTbl*
  end

  struct IUIContextualUIVTbl
    query_interface : Proc(IUIContextualUI*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIContextualUI*, UInt32)
    release : Proc(IUIContextualUI*, UInt32)
    show_at_location : Proc(IUIContextualUI*, Int32, Int32, HRESULT)
  end

  IUIContextualUI_GUID = "eea11f37-7c46-437c-8e55-b52122b29293"
  IID_IUIContextualUI = LibC::GUID.new(0xeea11f37_u32, 0x7c46_u16, 0x437c_u16, StaticArray[0x8e_u8, 0x55_u8, 0xb5_u8, 0x21_u8, 0x22_u8, 0xb2_u8, 0x92_u8, 0x93_u8])
  struct IUIContextualUI
    lpVtbl : IUIContextualUIVTbl*
  end

  struct IUICollectionVTbl
    query_interface : Proc(IUICollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUICollection*, UInt32)
    release : Proc(IUICollection*, UInt32)
    get_count : Proc(IUICollection*, UInt32*, HRESULT)
    get_item : Proc(IUICollection*, UInt32, IUnknown*, HRESULT)
    add : Proc(IUICollection*, IUnknown, HRESULT)
    insert : Proc(IUICollection*, UInt32, IUnknown, HRESULT)
    remove_at : Proc(IUICollection*, UInt32, HRESULT)
    replace : Proc(IUICollection*, UInt32, IUnknown, HRESULT)
    clear : Proc(IUICollection*, HRESULT)
  end

  IUICollection_GUID = "df4f45bf-6f9d-4dd7-9d68-d8f9cd18c4db"
  IID_IUICollection = LibC::GUID.new(0xdf4f45bf_u32, 0x6f9d_u16, 0x4dd7_u16, StaticArray[0x9d_u8, 0x68_u8, 0xd8_u8, 0xf9_u8, 0xcd_u8, 0x18_u8, 0xc4_u8, 0xdb_u8])
  struct IUICollection
    lpVtbl : IUICollectionVTbl*
  end

  struct IUICollectionChangedEventVTbl
    query_interface : Proc(IUICollectionChangedEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUICollectionChangedEvent*, UInt32)
    release : Proc(IUICollectionChangedEvent*, UInt32)
    on_changed : Proc(IUICollectionChangedEvent*, UI_COLLECTIONCHANGE, UInt32, IUnknown, UInt32, IUnknown, HRESULT)
  end

  IUICollectionChangedEvent_GUID = "6502ae91-a14d-44b5-bbd0-62aacc581d52"
  IID_IUICollectionChangedEvent = LibC::GUID.new(0x6502ae91_u32, 0xa14d_u16, 0x44b5_u16, StaticArray[0xbb_u8, 0xd0_u8, 0x62_u8, 0xaa_u8, 0xcc_u8, 0x58_u8, 0x1d_u8, 0x52_u8])
  struct IUICollectionChangedEvent
    lpVtbl : IUICollectionChangedEventVTbl*
  end

  struct IUICommandHandlerVTbl
    query_interface : Proc(IUICommandHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUICommandHandler*, UInt32)
    release : Proc(IUICommandHandler*, UInt32)
    execute : Proc(IUICommandHandler*, UInt32, UI_EXECUTIONVERB, PROPERTYKEY*, PROPVARIANT*, IUISimplePropertySet, HRESULT)
    update_property : Proc(IUICommandHandler*, UInt32, PROPERTYKEY*, PROPVARIANT*, PROPVARIANT*, HRESULT)
  end

  IUICommandHandler_GUID = "75ae0a2d-dc03-4c9f-8883-069660d0beb6"
  IID_IUICommandHandler = LibC::GUID.new(0x75ae0a2d_u32, 0xdc03_u16, 0x4c9f_u16, StaticArray[0x88_u8, 0x83_u8, 0x6_u8, 0x96_u8, 0x60_u8, 0xd0_u8, 0xbe_u8, 0xb6_u8])
  struct IUICommandHandler
    lpVtbl : IUICommandHandlerVTbl*
  end

  struct IUIApplicationVTbl
    query_interface : Proc(IUIApplication*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIApplication*, UInt32)
    release : Proc(IUIApplication*, UInt32)
    on_view_changed : Proc(IUIApplication*, UInt32, UI_VIEWTYPE, IUnknown, UI_VIEWVERB, Int32, HRESULT)
    on_create_ui_command : Proc(IUIApplication*, UInt32, UI_COMMANDTYPE, IUICommandHandler*, HRESULT)
    on_destroy_ui_command : Proc(IUIApplication*, UInt32, UI_COMMANDTYPE, IUICommandHandler, HRESULT)
  end

  IUIApplication_GUID = "d428903c-729a-491d-910d-682a08ff2522"
  IID_IUIApplication = LibC::GUID.new(0xd428903c_u32, 0x729a_u16, 0x491d_u16, StaticArray[0x91_u8, 0xd_u8, 0x68_u8, 0x2a_u8, 0x8_u8, 0xff_u8, 0x25_u8, 0x22_u8])
  struct IUIApplication
    lpVtbl : IUIApplicationVTbl*
  end

  struct IUIImageVTbl
    query_interface : Proc(IUIImage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIImage*, UInt32)
    release : Proc(IUIImage*, UInt32)
    get_bitmap : Proc(IUIImage*, HBITMAP*, HRESULT)
  end

  IUIImage_GUID = "23c8c838-4de6-436b-ab01-5554bb7c30dd"
  IID_IUIImage = LibC::GUID.new(0x23c8c838_u32, 0x4de6_u16, 0x436b_u16, StaticArray[0xab_u8, 0x1_u8, 0x55_u8, 0x54_u8, 0xbb_u8, 0x7c_u8, 0x30_u8, 0xdd_u8])
  struct IUIImage
    lpVtbl : IUIImageVTbl*
  end

  struct IUIImageFromBitmapVTbl
    query_interface : Proc(IUIImageFromBitmap*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIImageFromBitmap*, UInt32)
    release : Proc(IUIImageFromBitmap*, UInt32)
    create_image : Proc(IUIImageFromBitmap*, HBITMAP, UI_OWNERSHIP, IUIImage*, HRESULT)
  end

  IUIImageFromBitmap_GUID = "18aba7f3-4c1c-4ba2-bf6c-f5c3326fa816"
  IID_IUIImageFromBitmap = LibC::GUID.new(0x18aba7f3_u32, 0x4c1c_u16, 0x4ba2_u16, StaticArray[0xbf_u8, 0x6c_u8, 0xf5_u8, 0xc3_u8, 0x32_u8, 0x6f_u8, 0xa8_u8, 0x16_u8])
  struct IUIImageFromBitmap
    lpVtbl : IUIImageFromBitmapVTbl*
  end

end