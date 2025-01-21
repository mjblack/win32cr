require "./../system/com.cr"
require "./../foundation.cr"
require "./shell/properties_system.cr"
require "./../system/com/structured_storage.cr"
require "./../graphics/gdi.cr"

module Win32cr::UI::Ribbon
  UI_ALL_COMMANDS = 0_u32
  UI_COLLECTION_INVALIDINDEX = 4294967295_u32
  LIBID_UIRibbon = "942f35c2-e83b-45ef-b085-ac295dd63d5b"

  CLSID_UIRibbonFramework = LibC::GUID.new(0x926749fa_u32, 0x2615_u16, 0x4987_u16, StaticArray[0x88_u8, 0x45_u8, 0xc3_u8, 0x3e_u8, 0x65_u8, 0xf2_u8, 0xb9_u8, 0x57_u8])

  CLSID_UIRibbonImageFromBitmapFactory = LibC::GUID.new(0xf7434b6_u32, 0x59b6_u16, 0x4250_u16, StaticArray[0x99_u8, 0x9e_u8, 0xd1_u8, 0x68_u8, 0xd6_u8, 0xae_u8, 0x42_u8, 0x93_u8])

  enum UI_CONTEXTAVAILABILITY
    UI_CONTEXTAVAILABILITY_NOTAVAILABLE = 0_i32
    UI_CONTEXTAVAILABILITY_AVAILABLE = 1_i32
    UI_CONTEXTAVAILABILITY_ACTIVE = 2_i32
  end
  enum UI_FONTPROPERTIES
    UI_FONTPROPERTIES_NOTAVAILABLE = 0_i32
    UI_FONTPROPERTIES_NOTSET = 1_i32
    UI_FONTPROPERTIES_SET = 2_i32
  end
  enum UI_FONTVERTICALPOSITION
    UI_FONTVERTICALPOSITION_NOTAVAILABLE = 0_i32
    UI_FONTVERTICALPOSITION_NOTSET = 1_i32
    UI_FONTVERTICALPOSITION_SUPERSCRIPT = 2_i32
    UI_FONTVERTICALPOSITION_SUBSCRIPT = 3_i32
  end
  enum UI_FONTUNDERLINE
    UI_FONTUNDERLINE_NOTAVAILABLE = 0_i32
    UI_FONTUNDERLINE_NOTSET = 1_i32
    UI_FONTUNDERLINE_SET = 2_i32
  end
  enum UI_FONTDELTASIZE
    UI_FONTDELTASIZE_GROW = 0_i32
    UI_FONTDELTASIZE_SHRINK = 1_i32
  end
  enum UI_CONTROLDOCK
    UI_CONTROLDOCK_TOP = 1_i32
    UI_CONTROLDOCK_BOTTOM = 3_i32
  end
  enum UI_SWATCHCOLORTYPE
    UI_SWATCHCOLORTYPE_NOCOLOR = 0_i32
    UI_SWATCHCOLORTYPE_AUTOMATIC = 1_i32
    UI_SWATCHCOLORTYPE_RGB = 2_i32
  end
  enum UI_SWATCHCOLORMODE
    UI_SWATCHCOLORMODE_NORMAL = 0_i32
    UI_SWATCHCOLORMODE_MONOCHROME = 1_i32
  end
  enum UI_EVENTTYPE
    UI_EVENTTYPE_ApplicationMenuOpened = 0_i32
    UI_EVENTTYPE_RibbonMinimized = 1_i32
    UI_EVENTTYPE_RibbonExpanded = 2_i32
    UI_EVENTTYPE_ApplicationModeSwitched = 3_i32
    UI_EVENTTYPE_TabActivated = 4_i32
    UI_EVENTTYPE_MenuOpened = 5_i32
    UI_EVENTTYPE_CommandExecuted = 6_i32
    UI_EVENTTYPE_TooltipShown = 7_i32
  end
  enum UI_EVENTLOCATION
    UI_EVENTLOCATION_Ribbon = 0_i32
    UI_EVENTLOCATION_QAT = 1_i32
    UI_EVENTLOCATION_ApplicationMenu = 2_i32
    UI_EVENTLOCATION_ContextPopup = 3_i32
  end
  enum UI_INVALIDATIONS
    UI_INVALIDATIONS_STATE = 1_i32
    UI_INVALIDATIONS_VALUE = 2_i32
    UI_INVALIDATIONS_PROPERTY = 4_i32
    UI_INVALIDATIONS_ALLPROPERTIES = 8_i32
  end
  enum UI_COLLECTIONCHANGE
    UI_COLLECTIONCHANGE_INSERT = 0_i32
    UI_COLLECTIONCHANGE_REMOVE = 1_i32
    UI_COLLECTIONCHANGE_REPLACE = 2_i32
    UI_COLLECTIONCHANGE_RESET = 3_i32
  end
  enum UI_EXECUTIONVERB
    UI_EXECUTIONVERB_EXECUTE = 0_i32
    UI_EXECUTIONVERB_PREVIEW = 1_i32
    UI_EXECUTIONVERB_CANCELPREVIEW = 2_i32
  end
  enum UI_COMMANDTYPE
    UI_COMMANDTYPE_UNKNOWN = 0_i32
    UI_COMMANDTYPE_GROUP = 1_i32
    UI_COMMANDTYPE_ACTION = 2_i32
    UI_COMMANDTYPE_ANCHOR = 3_i32
    UI_COMMANDTYPE_CONTEXT = 4_i32
    UI_COMMANDTYPE_COLLECTION = 5_i32
    UI_COMMANDTYPE_COMMANDCOLLECTION = 6_i32
    UI_COMMANDTYPE_DECIMAL = 7_i32
    UI_COMMANDTYPE_BOOLEAN = 8_i32
    UI_COMMANDTYPE_FONT = 9_i32
    UI_COMMANDTYPE_RECENTITEMS = 10_i32
    UI_COMMANDTYPE_COLORANCHOR = 11_i32
    UI_COMMANDTYPE_COLORCOLLECTION = 12_i32
  end
  enum UI_VIEWTYPE
    UI_VIEWTYPE_RIBBON = 1_i32
  end
  enum UI_VIEWVERB
    UI_VIEWVERB_CREATE = 0_i32
    UI_VIEWVERB_DESTROY = 1_i32
    UI_VIEWVERB_SIZE = 2_i32
    UI_VIEWVERB_ERROR = 3_i32
  end
  enum UI_OWNERSHIP
    UI_OWNERSHIP_TRANSFER = 0_i32
    UI_OWNERSHIP_COPY = 1_i32
  end

  @[Extern]
  record UI_EVENTPARAMS_COMMAND,
    command_id : UInt32,
    command_name : Win32cr::Foundation::PWSTR,
    parent_command_id : UInt32,
    parent_command_name : Win32cr::Foundation::PWSTR,
    selection_index : UInt32,
    location : Win32cr::UI::Ribbon::UI_EVENTLOCATION

  @[Extern]
  record UI_EVENTPARAMS,
    event_type : Win32cr::UI::Ribbon::UI_EVENTTYPE,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      modes : Int32,
      params : Win32cr::UI::Ribbon::UI_EVENTPARAMS_COMMAND

  end

  @[Extern]
  record IUISimplePropertySetVtbl,
    query_interface : Proc(IUISimplePropertySet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUISimplePropertySet*, UInt32),
    release : Proc(IUISimplePropertySet*, UInt32),
    get_value : Proc(IUISimplePropertySet*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c205bb48-5b1c-4219-a106-15bd0a5f24e2")]
  record IUISimplePropertySet, lpVtbl : IUISimplePropertySetVtbl* do
    GUID = LibC::GUID.new(0xc205bb48_u32, 0x5b1c_u16, 0x4219_u16, StaticArray[0xa1_u8, 0x6_u8, 0x15_u8, 0xbd_u8, 0xa_u8, 0x5f_u8, 0x24_u8, 0xe2_u8])
    def query_interface(this : IUISimplePropertySet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUISimplePropertySet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUISimplePropertySet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_value(this : IUISimplePropertySet*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, value : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, key, value)
    end

  end

  @[Extern]
  record IUIRibbonVtbl,
    query_interface : Proc(IUIRibbon*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIRibbon*, UInt32),
    release : Proc(IUIRibbon*, UInt32),
    get_height : Proc(IUIRibbon*, UInt32*, Win32cr::Foundation::HRESULT),
    load_settings_from_stream : Proc(IUIRibbon*, Void*, Win32cr::Foundation::HRESULT),
    save_settings_to_stream : Proc(IUIRibbon*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("803982ab-370a-4f7e-a9e7-8784036a6e26")]
  record IUIRibbon, lpVtbl : IUIRibbonVtbl* do
    GUID = LibC::GUID.new(0x803982ab_u32, 0x370a_u16, 0x4f7e_u16, StaticArray[0xa9_u8, 0xe7_u8, 0x87_u8, 0x84_u8, 0x3_u8, 0x6a_u8, 0x6e_u8, 0x26_u8])
    def query_interface(this : IUIRibbon*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIRibbon*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIRibbon*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_height(this : IUIRibbon*, cy : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_height.call(this, cy)
    end
    def load_settings_from_stream(this : IUIRibbon*, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_settings_from_stream.call(this, pStream)
    end
    def save_settings_to_stream(this : IUIRibbon*, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_settings_to_stream.call(this, pStream)
    end

  end

  @[Extern]
  record IUIFrameworkVtbl,
    query_interface : Proc(IUIFramework*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIFramework*, UInt32),
    release : Proc(IUIFramework*, UInt32),
    initialize__ : Proc(IUIFramework*, Win32cr::Foundation::HWND, Void*, Win32cr::Foundation::HRESULT),
    destroy : Proc(IUIFramework*, Win32cr::Foundation::HRESULT),
    load_ui : Proc(IUIFramework*, Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_view : Proc(IUIFramework*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_ui_command_property : Proc(IUIFramework*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_ui_command_property : Proc(IUIFramework*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    invalidate_ui_command : Proc(IUIFramework*, UInt32, Win32cr::UI::Ribbon::UI_INVALIDATIONS, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    flush_pending_invalidations : Proc(IUIFramework*, Win32cr::Foundation::HRESULT),
    set_modes : Proc(IUIFramework*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f4f0385d-6872-43a8-ad09-4c339cb3f5c5")]
  record IUIFramework, lpVtbl : IUIFrameworkVtbl* do
    GUID = LibC::GUID.new(0xf4f0385d_u32, 0x6872_u16, 0x43a8_u16, StaticArray[0xad_u8, 0x9_u8, 0x4c_u8, 0x33_u8, 0x9c_u8, 0xb3_u8, 0xf5_u8, 0xc5_u8])
    def query_interface(this : IUIFramework*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIFramework*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIFramework*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IUIFramework*, frameWnd : Win32cr::Foundation::HWND, application : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, frameWnd, application)
    end
    def destroy(this : IUIFramework*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy.call(this)
    end
    def load_ui(this : IUIFramework*, instance : Win32cr::Foundation::HINSTANCE, resourceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_ui.call(this, instance, resourceName)
    end
    def get_view(this : IUIFramework*, viewId : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view.call(this, viewId, riid, ppv)
    end
    def get_ui_command_property(this : IUIFramework*, commandId : UInt32, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, value : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ui_command_property.call(this, commandId, key, value)
    end
    def set_ui_command_property(this : IUIFramework*, commandId : UInt32, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, value : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_ui_command_property.call(this, commandId, key, value)
    end
    def invalidate_ui_command(this : IUIFramework*, commandId : UInt32, flags : Win32cr::UI::Ribbon::UI_INVALIDATIONS, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invalidate_ui_command.call(this, commandId, flags, key)
    end
    def flush_pending_invalidations(this : IUIFramework*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush_pending_invalidations.call(this)
    end
    def set_modes(this : IUIFramework*, iModes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_modes.call(this, iModes)
    end

  end

  @[Extern]
  record IUIEventLoggerVtbl,
    query_interface : Proc(IUIEventLogger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIEventLogger*, UInt32),
    release : Proc(IUIEventLogger*, UInt32),
    on_ui_event : Proc(IUIEventLogger*, Win32cr::UI::Ribbon::UI_EVENTPARAMS*, Void)


  @[Extern]
  #@[Com("ec3e1034-dbf4-41a1-95d5-03e0f1026e05")]
  record IUIEventLogger, lpVtbl : IUIEventLoggerVtbl* do
    GUID = LibC::GUID.new(0xec3e1034_u32, 0xdbf4_u16, 0x41a1_u16, StaticArray[0x95_u8, 0xd5_u8, 0x3_u8, 0xe0_u8, 0xf1_u8, 0x2_u8, 0x6e_u8, 0x5_u8])
    def query_interface(this : IUIEventLogger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIEventLogger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIEventLogger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_ui_event(this : IUIEventLogger*, pEventParams : Win32cr::UI::Ribbon::UI_EVENTPARAMS*) : Void
      @lpVtbl.try &.value.on_ui_event.call(this, pEventParams)
    end

  end

  @[Extern]
  record IUIEventingManagerVtbl,
    query_interface : Proc(IUIEventingManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIEventingManager*, UInt32),
    release : Proc(IUIEventingManager*, UInt32),
    set_event_logger : Proc(IUIEventingManager*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3be6ea7f-9a9b-4198-9368-9b0f923bd534")]
  record IUIEventingManager, lpVtbl : IUIEventingManagerVtbl* do
    GUID = LibC::GUID.new(0x3be6ea7f_u32, 0x9a9b_u16, 0x4198_u16, StaticArray[0x93_u8, 0x68_u8, 0x9b_u8, 0xf_u8, 0x92_u8, 0x3b_u8, 0xd5_u8, 0x34_u8])
    def query_interface(this : IUIEventingManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIEventingManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIEventingManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_event_logger(this : IUIEventingManager*, eventLogger : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_logger.call(this, eventLogger)
    end

  end

  @[Extern]
  record IUIContextualUIVtbl,
    query_interface : Proc(IUIContextualUI*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIContextualUI*, UInt32),
    release : Proc(IUIContextualUI*, UInt32),
    show_at_location : Proc(IUIContextualUI*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("eea11f37-7c46-437c-8e55-b52122b29293")]
  record IUIContextualUI, lpVtbl : IUIContextualUIVtbl* do
    GUID = LibC::GUID.new(0xeea11f37_u32, 0x7c46_u16, 0x437c_u16, StaticArray[0x8e_u8, 0x55_u8, 0xb5_u8, 0x21_u8, 0x22_u8, 0xb2_u8, 0x92_u8, 0x93_u8])
    def query_interface(this : IUIContextualUI*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIContextualUI*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIContextualUI*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def show_at_location(this : IUIContextualUI*, x : Int32, y : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_at_location.call(this, x, y)
    end

  end

  @[Extern]
  record IUICollectionVtbl,
    query_interface : Proc(IUICollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUICollection*, UInt32),
    release : Proc(IUICollection*, UInt32),
    get_count : Proc(IUICollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_item : Proc(IUICollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IUICollection*, Void*, Win32cr::Foundation::HRESULT),
    insert : Proc(IUICollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IUICollection*, UInt32, Win32cr::Foundation::HRESULT),
    replace : Proc(IUICollection*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    clear : Proc(IUICollection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("df4f45bf-6f9d-4dd7-9d68-d8f9cd18c4db")]
  record IUICollection, lpVtbl : IUICollectionVtbl* do
    GUID = LibC::GUID.new(0xdf4f45bf_u32, 0x6f9d_u16, 0x4dd7_u16, StaticArray[0x9d_u8, 0x68_u8, 0xd8_u8, 0xf9_u8, 0xcd_u8, 0x18_u8, 0xc4_u8, 0xdb_u8])
    def query_interface(this : IUICollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUICollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUICollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IUICollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, count)
    end
    def get_item(this : IUICollection*, index : UInt32, item : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item.call(this, index, item)
    end
    def add(this : IUICollection*, item : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, item)
    end
    def insert(this : IUICollection*, index : UInt32, item : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert.call(this, index, item)
    end
    def remove_at(this : IUICollection*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end
    def replace(this : IUICollection*, indexReplaced : UInt32, itemReplaceWith : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.replace.call(this, indexReplaced, itemReplaceWith)
    end
    def clear(this : IUICollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]
  record IUICollectionChangedEventVtbl,
    query_interface : Proc(IUICollectionChangedEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUICollectionChangedEvent*, UInt32),
    release : Proc(IUICollectionChangedEvent*, UInt32),
    on_changed : Proc(IUICollectionChangedEvent*, Win32cr::UI::Ribbon::UI_COLLECTIONCHANGE, UInt32, Void*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6502ae91-a14d-44b5-bbd0-62aacc581d52")]
  record IUICollectionChangedEvent, lpVtbl : IUICollectionChangedEventVtbl* do
    GUID = LibC::GUID.new(0x6502ae91_u32, 0xa14d_u16, 0x44b5_u16, StaticArray[0xbb_u8, 0xd0_u8, 0x62_u8, 0xaa_u8, 0xcc_u8, 0x58_u8, 0x1d_u8, 0x52_u8])
    def query_interface(this : IUICollectionChangedEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUICollectionChangedEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUICollectionChangedEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_changed(this : IUICollectionChangedEvent*, action : Win32cr::UI::Ribbon::UI_COLLECTIONCHANGE, oldIndex : UInt32, oldItem : Void*, newIndex : UInt32, newItem : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_changed.call(this, action, oldIndex, oldItem, newIndex, newItem)
    end

  end

  @[Extern]
  record IUICommandHandlerVtbl,
    query_interface : Proc(IUICommandHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUICommandHandler*, UInt32),
    release : Proc(IUICommandHandler*, UInt32),
    execute : Proc(IUICommandHandler*, UInt32, Win32cr::UI::Ribbon::UI_EXECUTIONVERB, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Void*, Win32cr::Foundation::HRESULT),
    update_property : Proc(IUICommandHandler*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("75ae0a2d-dc03-4c9f-8883-069660d0beb6")]
  record IUICommandHandler, lpVtbl : IUICommandHandlerVtbl* do
    GUID = LibC::GUID.new(0x75ae0a2d_u32, 0xdc03_u16, 0x4c9f_u16, StaticArray[0x88_u8, 0x83_u8, 0x6_u8, 0x96_u8, 0x60_u8, 0xd0_u8, 0xbe_u8, 0xb6_u8])
    def query_interface(this : IUICommandHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUICommandHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUICommandHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def execute(this : IUICommandHandler*, commandId : UInt32, verb : Win32cr::UI::Ribbon::UI_EXECUTIONVERB, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, currentValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, commandExecutionProperties : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute.call(this, commandId, verb, key, currentValue, commandExecutionProperties)
    end
    def update_property(this : IUICommandHandler*, commandId : UInt32, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, currentValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, newValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_property.call(this, commandId, key, currentValue, newValue)
    end

  end

  @[Extern]
  record IUIApplicationVtbl,
    query_interface : Proc(IUIApplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIApplication*, UInt32),
    release : Proc(IUIApplication*, UInt32),
    on_view_changed : Proc(IUIApplication*, UInt32, Win32cr::UI::Ribbon::UI_VIEWTYPE, Void*, Win32cr::UI::Ribbon::UI_VIEWVERB, Int32, Win32cr::Foundation::HRESULT),
    on_create_ui_command : Proc(IUIApplication*, UInt32, Win32cr::UI::Ribbon::UI_COMMANDTYPE, Void**, Win32cr::Foundation::HRESULT),
    on_destroy_ui_command : Proc(IUIApplication*, UInt32, Win32cr::UI::Ribbon::UI_COMMANDTYPE, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d428903c-729a-491d-910d-682a08ff2522")]
  record IUIApplication, lpVtbl : IUIApplicationVtbl* do
    GUID = LibC::GUID.new(0xd428903c_u32, 0x729a_u16, 0x491d_u16, StaticArray[0x91_u8, 0xd_u8, 0x68_u8, 0x2a_u8, 0x8_u8, 0xff_u8, 0x25_u8, 0x22_u8])
    def query_interface(this : IUIApplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIApplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIApplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_view_changed(this : IUIApplication*, viewId : UInt32, typeID : Win32cr::UI::Ribbon::UI_VIEWTYPE, view : Void*, verb : Win32cr::UI::Ribbon::UI_VIEWVERB, uReasonCode : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_view_changed.call(this, viewId, typeID, view, verb, uReasonCode)
    end
    def on_create_ui_command(this : IUIApplication*, commandId : UInt32, typeID : Win32cr::UI::Ribbon::UI_COMMANDTYPE, commandHandler : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_create_ui_command.call(this, commandId, typeID, commandHandler)
    end
    def on_destroy_ui_command(this : IUIApplication*, commandId : UInt32, typeID : Win32cr::UI::Ribbon::UI_COMMANDTYPE, commandHandler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_destroy_ui_command.call(this, commandId, typeID, commandHandler)
    end

  end

  @[Extern]
  record IUIImageVtbl,
    query_interface : Proc(IUIImage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIImage*, UInt32),
    release : Proc(IUIImage*, UInt32),
    get_bitmap : Proc(IUIImage*, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("23c8c838-4de6-436b-ab01-5554bb7c30dd")]
  record IUIImage, lpVtbl : IUIImageVtbl* do
    GUID = LibC::GUID.new(0x23c8c838_u32, 0x4de6_u16, 0x436b_u16, StaticArray[0xab_u8, 0x1_u8, 0x55_u8, 0x54_u8, 0xbb_u8, 0x7c_u8, 0x30_u8, 0xdd_u8])
    def query_interface(this : IUIImage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIImage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIImage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_bitmap(this : IUIImage*, bitmap : Win32cr::Graphics::Gdi::HBITMAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bitmap.call(this, bitmap)
    end

  end

  @[Extern]
  record IUIImageFromBitmapVtbl,
    query_interface : Proc(IUIImageFromBitmap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIImageFromBitmap*, UInt32),
    release : Proc(IUIImageFromBitmap*, UInt32),
    create_image : Proc(IUIImageFromBitmap*, Win32cr::Graphics::Gdi::HBITMAP, Win32cr::UI::Ribbon::UI_OWNERSHIP, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("18aba7f3-4c1c-4ba2-bf6c-f5c3326fa816")]
  record IUIImageFromBitmap, lpVtbl : IUIImageFromBitmapVtbl* do
    GUID = LibC::GUID.new(0x18aba7f3_u32, 0x4c1c_u16, 0x4ba2_u16, StaticArray[0xbf_u8, 0x6c_u8, 0xf5_u8, 0xc3_u8, 0x32_u8, 0x6f_u8, 0xa8_u8, 0x16_u8])
    def query_interface(this : IUIImageFromBitmap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIImageFromBitmap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIImageFromBitmap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_image(this : IUIImageFromBitmap*, bitmap : Win32cr::Graphics::Gdi::HBITMAP, options : Win32cr::UI::Ribbon::UI_OWNERSHIP, image : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_image.call(this, bitmap, options, image)
    end

  end

end