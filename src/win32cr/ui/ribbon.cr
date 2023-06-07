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
  UIRibbonFramework = LibC::GUID.new(0x926749fa_u32, 0x2615_u16, 0x4987_u16, StaticArray[0x88_u8, 0x45_u8, 0xc3_u8, 0x3e_u8, 0x65_u8, 0xf2_u8, 0xb9_u8, 0x57_u8])
  UIRibbonImageFromBitmapFactory = LibC::GUID.new(0xf7434b6_u32, 0x59b6_u16, 0x4250_u16, StaticArray[0x99_u8, 0x9e_u8, 0xd1_u8, 0x68_u8, 0xd6_u8, 0xae_u8, 0x42_u8, 0x93_u8])


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

  struct IUIFramework
    lpVtbl : IUIFrameworkVTbl*
  end

  struct IUIEventLoggerVTbl
    query_interface : Proc(IUIEventLogger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIEventLogger*, UInt32)
    release : Proc(IUIEventLogger*, UInt32)
    on_ui_event : Proc(IUIEventLogger*, UI_EVENTPARAMS*, Void)
  end

  struct IUIEventLogger
    lpVtbl : IUIEventLoggerVTbl*
  end

  struct IUIEventingManagerVTbl
    query_interface : Proc(IUIEventingManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIEventingManager*, UInt32)
    release : Proc(IUIEventingManager*, UInt32)
    set_event_logger : Proc(IUIEventingManager*, IUIEventLogger, HRESULT)
  end

  struct IUIEventingManager
    lpVtbl : IUIEventingManagerVTbl*
  end

  struct IUIContextualUIVTbl
    query_interface : Proc(IUIContextualUI*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIContextualUI*, UInt32)
    release : Proc(IUIContextualUI*, UInt32)
    show_at_location : Proc(IUIContextualUI*, Int32, Int32, HRESULT)
  end

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

  struct IUICollection
    lpVtbl : IUICollectionVTbl*
  end

  struct IUICollectionChangedEventVTbl
    query_interface : Proc(IUICollectionChangedEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUICollectionChangedEvent*, UInt32)
    release : Proc(IUICollectionChangedEvent*, UInt32)
    on_changed : Proc(IUICollectionChangedEvent*, UI_COLLECTIONCHANGE, UInt32, IUnknown, UInt32, IUnknown, HRESULT)
  end

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

  struct IUIApplication
    lpVtbl : IUIApplicationVTbl*
  end

  struct IUIImageVTbl
    query_interface : Proc(IUIImage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIImage*, UInt32)
    release : Proc(IUIImage*, UInt32)
    get_bitmap : Proc(IUIImage*, HBITMAP*, HRESULT)
  end

  struct IUIImage
    lpVtbl : IUIImageVTbl*
  end

  struct IUIImageFromBitmapVTbl
    query_interface : Proc(IUIImageFromBitmap*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIImageFromBitmap*, UInt32)
    release : Proc(IUIImageFromBitmap*, UInt32)
    create_image : Proc(IUIImageFromBitmap*, HBITMAP, UI_OWNERSHIP, IUIImage*, HRESULT)
  end

  struct IUIImageFromBitmap
    lpVtbl : IUIImageFromBitmapVTbl*
  end

end
