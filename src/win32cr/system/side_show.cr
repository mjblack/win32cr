require "./com.cr"
require "./../foundation.cr"
require "./../ui/windows_and_messaging.cr"
require "./../ui/shell/properties_system.cr"
require "./com/structured_storage.cr"

module Win32cr::System::SideShow
  SIDESHOW_ENDPOINT_SIMPLE_CONTENT_FORMAT = "a9a5353f-2d4b-47ce-93ee-759f3a7dda4f"
  SIDESHOW_ENDPOINT_ICAL = "4dff36b5-9dde-4f76-9a2a-96435047063d"
  SIDESHOW_CAPABILITY_DEVICE_PROPERTIES = "8abc88a8-857b-4ad7-a35a-b5942f492b99"
  SIDESHOW_CAPABILITY_DEVICE_ID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 1_u32)
  SIDESHOW_CAPABILITY_SCREEN_TYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 2_u32)
  SIDESHOW_CAPABILITY_SCREEN_WIDTH = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 3_u32)
  SIDESHOW_CAPABILITY_SCREEN_HEIGHT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 4_u32)
  SIDESHOW_CAPABILITY_COLOR_DEPTH = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 5_u32)
  SIDESHOW_CAPABILITY_COLOR_TYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 6_u32)
  SIDESHOW_CAPABILITY_DATA_CACHE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 7_u32)
  SIDESHOW_CAPABILITY_SUPPORTED_LANGUAGES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 8_u32)
  SIDESHOW_CAPABILITY_CURRENT_LANGUAGE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 9_u32)
  SIDESHOW_CAPABILITY_SUPPORTED_THEMES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 10_u32)
  SIDESHOW_CAPABILITY_SUPPORTED_IMAGE_FORMATS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 14_u32)
  SIDESHOW_CAPABILITY_CLIENT_AREA_WIDTH = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 15_u32)
  SIDESHOW_CAPABILITY_CLIENT_AREA_HEIGHT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 16_u32)
  GUID_DEVINTERFACE_SIDESHOW = "152e5811-feb9-4b00-90f4-d32947ae1681"
  SIDESHOW_CONTENT_MISSING_EVENT = "5007fba8-d313-439f-bea2-a50201d3e9a8"
  SIDESHOW_APPLICATION_EVENT = "4cb572fa-1d3b-49b3-a17a-2e6bff052854"
  SIDESHOW_USER_CHANGE_REQUEST_EVENT = "5009673c-3f7d-4c7e-9971-eaa2e91f1575"
  SIDESHOW_NEW_EVENT_DATA_AVAILABLE = "57813854-2fc1-411c-a59f-f24927608804"
  CONTENT_ID_GLANCE = 0_u32
  SIDESHOW_EVENTID_APPLICATION_ENTER = 4294901760_u32
  SIDESHOW_EVENTID_APPLICATION_EXIT = 4294901761_u32
  CONTENT_ID_HOME = 1_u32
  VERSION_1_WINDOWS_7 = 0_u32

  CLSID_SideShowSession = LibC::GUID.new(0xe20543b9_u32, 0xf785_u16, 0x4ea2_u16, StaticArray[0x98_u8, 0x1e_u8, 0xc4_u8, 0xff_u8, 0xa7_u8, 0x6b_u8, 0xbc_u8, 0x7c_u8])

  CLSID_SideShowNotification = LibC::GUID.new(0xce3e86f_u32, 0xd5cd_u16, 0x4525_u16, StaticArray[0xa7_u8, 0x66_u8, 0x1a_u8, 0xba_u8, 0xb1_u8, 0xa7_u8, 0x52_u8, 0xf5_u8])

  CLSID_SideShowKeyCollection = LibC::GUID.new(0xdfbbdbf8_u32, 0x18de_u16, 0x49b8_u16, StaticArray[0x83_u8, 0xdc_u8, 0xeb_u8, 0xc7_u8, 0x27_u8, 0xc6_u8, 0x2d_u8, 0x94_u8])

  CLSID_SideShowPropVariantCollection = LibC::GUID.new(0xe640f415_u32, 0x539e_u16, 0x4923_u16, StaticArray[0x96_u8, 0xcd_u8, 0x5f_u8, 0x9_u8, 0x3b_u8, 0xc2_u8, 0x50_u8, 0xcd_u8])

  enum SIDESHOW_SCREEN_TYPE
    SIDESHOW_SCREEN_TYPE_BITMAP = 0_i32
    SIDESHOW_SCREEN_TYPE_TEXT = 1_i32
  end
  enum SIDESHOW_COLOR_TYPE
    SIDESHOW_COLOR_TYPE_COLOR = 0_i32
    SIDESHOW_COLOR_TYPE_GREYSCALE = 1_i32
    SIDESHOW_COLOR_TYPE_BLACK_AND_WHITE = 2_i32
  end
  enum SCF_EVENT_IDS
    SCF_EVENT_NAVIGATION = 1_i32
    SCF_EVENT_MENUACTION = 2_i32
    SCF_EVENT_CONTEXTMENU = 3_i32
  end
  enum SCF_BUTTON_IDS
    SCF_BUTTON_MENU = 1_i32
    SCF_BUTTON_SELECT = 2_i32
    SCF_BUTTON_UP = 3_i32
    SCF_BUTTON_DOWN = 4_i32
    SCF_BUTTON_LEFT = 5_i32
    SCF_BUTTON_RIGHT = 6_i32
    SCF_BUTTON_PLAY = 7_i32
    SCF_BUTTON_PAUSE = 8_i32
    SCF_BUTTON_FASTFORWARD = 9_i32
    SCF_BUTTON_REWIND = 10_i32
    SCF_BUTTON_STOP = 11_i32
    SCF_BUTTON_BACK = 65280_i32
  end

  @[Extern]
  record SCF_EVENT_HEADER,
    previous_page : UInt32,
    target_page : UInt32

  @[Extern]
  record SCF_NAVIGATION_EVENT,
    previous_page : UInt32,
    target_page : UInt32,
    button : UInt32

  @[Extern]
  record SCF_MENUACTION_EVENT,
    previous_page : UInt32,
    target_page : UInt32,
    button : UInt32,
    item_id : UInt32

  @[Extern]
  record SCF_CONTEXTMENU_EVENT,
    previous_page : UInt32,
    target_page : UInt32,
    previous_item_id : UInt32,
    menu_page : UInt32,
    menu_item_id : UInt32

  @[Extern]
  record CONTENT_MISSING_EVENT_DATA,
    cbContentMissingEventData : UInt32,
    application_id : LibC::GUID,
    endpoint_id : LibC::GUID,
    content_id : UInt32

  @[Extern]
  record APPLICATION_EVENT_DATA,
    cbApplicationEventData : UInt32,
    application_id : LibC::GUID,
    endpoint_id : LibC::GUID,
    dwEventId : UInt32,
    cbEventData : UInt32,
    bEventData : UInt8*

  @[Extern]
  record DEVICE_USER_CHANGE_EVENT_DATA,
    cbDeviceUserChangeEventData : UInt32,
    wszUser : UInt16

  @[Extern]
  record NEW_EVENT_DATA_AVAILABLE,
    cbNewEventDataAvailable : UInt32,
    dwVersion : UInt32

  @[Extern]
  record EVENT_DATA_HEADER,
    cbEventDataHeader : UInt32,
    guidEventType : LibC::GUID,
    dwVersion : UInt32,
    cbEventDataSid : UInt32

  @[Extern]
  record ISideShowSessionVtbl,
    query_interface : Proc(ISideShowSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowSession*, UInt32),
    release : Proc(ISideShowSession*, UInt32),
    register_content : Proc(ISideShowSession*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    register_notifications : Proc(ISideShowSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e22331ee-9e7d-4922-9fc2-ab7aa41ce491")]
  record ISideShowSession, lpVtbl : ISideShowSessionVtbl* do
    GUID = LibC::GUID.new(0xe22331ee_u32, 0x9e7d_u16, 0x4922_u16, StaticArray[0x9f_u8, 0xc2_u8, 0xab_u8, 0x7a_u8, 0xa4_u8, 0x1c_u8, 0xe4_u8, 0x91_u8])
    def query_interface(this : ISideShowSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_content(this : ISideShowSession*, in_applicationId : LibC::GUID*, in_endpointId : LibC::GUID*, out_ppIContent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_content.call(this, in_applicationId, in_endpointId, out_ppIContent)
    end
    def register_notifications(this : ISideShowSession*, in_applicationId : LibC::GUID*, out_ppINotification : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_notifications.call(this, in_applicationId, out_ppINotification)
    end

  end

  @[Extern]
  record ISideShowNotificationManagerVtbl,
    query_interface : Proc(ISideShowNotificationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowNotificationManager*, UInt32),
    release : Proc(ISideShowNotificationManager*, UInt32),
    show : Proc(ISideShowNotificationManager*, Void*, Win32cr::Foundation::HRESULT),
    revoke : Proc(ISideShowNotificationManager*, UInt32, Win32cr::Foundation::HRESULT),
    revoke_all : Proc(ISideShowNotificationManager*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("63cea909-f2b9-4302-b5e1-c68e6d9ab833")]
  record ISideShowNotificationManager, lpVtbl : ISideShowNotificationManagerVtbl* do
    GUID = LibC::GUID.new(0x63cea909_u32, 0xf2b9_u16, 0x4302_u16, StaticArray[0xb5_u8, 0xe1_u8, 0xc6_u8, 0x8e_u8, 0x6d_u8, 0x9a_u8, 0xb8_u8, 0x33_u8])
    def query_interface(this : ISideShowNotificationManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowNotificationManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowNotificationManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def show(this : ISideShowNotificationManager*, in_pINotification : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, in_pINotification)
    end
    def revoke(this : ISideShowNotificationManager*, in_notificationId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke.call(this, in_notificationId)
    end
    def revoke_all(this : ISideShowNotificationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke_all.call(this)
    end

  end

  @[Extern]
  record ISideShowNotificationVtbl,
    query_interface : Proc(ISideShowNotification*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowNotification*, UInt32),
    release : Proc(ISideShowNotification*, UInt32),
    get_NotificationId : Proc(ISideShowNotification*, UInt32*, Win32cr::Foundation::HRESULT),
    put_NotificationId : Proc(ISideShowNotification*, UInt32, Win32cr::Foundation::HRESULT),
    get_Title : Proc(ISideShowNotification*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_Title : Proc(ISideShowNotification*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_Message : Proc(ISideShowNotification*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_Message : Proc(ISideShowNotification*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_Image : Proc(ISideShowNotification*, Win32cr::UI::WindowsAndMessaging::HICON*, Win32cr::Foundation::HRESULT),
    put_Image : Proc(ISideShowNotification*, Win32cr::UI::WindowsAndMessaging::HICON, Win32cr::Foundation::HRESULT),
    get_ExpirationTime : Proc(ISideShowNotification*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    put_ExpirationTime : Proc(ISideShowNotification*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("03c93300-8ab2-41c5-9b79-46127a30e148")]
  record ISideShowNotification, lpVtbl : ISideShowNotificationVtbl* do
    GUID = LibC::GUID.new(0x3c93300_u32, 0x8ab2_u16, 0x41c5_u16, StaticArray[0x9b_u8, 0x79_u8, 0x46_u8, 0x12_u8, 0x7a_u8, 0x30_u8, 0xe1_u8, 0x48_u8])
    def query_interface(this : ISideShowNotification*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowNotification*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowNotification*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_NotificationId(this : ISideShowNotification*, out_pNotificationId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NotificationId.call(this, out_pNotificationId)
    end
    def put_NotificationId(this : ISideShowNotification*, in_notificationId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NotificationId.call(this, in_notificationId)
    end
    def get_Title(this : ISideShowNotification*, out_ppwszTitle : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, out_ppwszTitle)
    end
    def put_Title(this : ISideShowNotification*, in_pwszTitle : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Title.call(this, in_pwszTitle)
    end
    def get_Message(this : ISideShowNotification*, out_ppwszMessage : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Message.call(this, out_ppwszMessage)
    end
    def put_Message(this : ISideShowNotification*, in_pwszMessage : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Message.call(this, in_pwszMessage)
    end
    def get_Image(this : ISideShowNotification*, out_phIcon : Win32cr::UI::WindowsAndMessaging::HICON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, out_phIcon)
    end
    def put_Image(this : ISideShowNotification*, in_hIcon : Win32cr::UI::WindowsAndMessaging::HICON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Image.call(this, in_hIcon)
    end
    def get_ExpirationTime(this : ISideShowNotification*, out_pTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExpirationTime.call(this, out_pTime)
    end
    def put_ExpirationTime(this : ISideShowNotification*, in_pTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExpirationTime.call(this, in_pTime)
    end

  end

  @[Extern]
  record ISideShowContentManagerVtbl,
    query_interface : Proc(ISideShowContentManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowContentManager*, UInt32),
    release : Proc(ISideShowContentManager*, UInt32),
    add : Proc(ISideShowContentManager*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(ISideShowContentManager*, UInt32, Win32cr::Foundation::HRESULT),
    remove_all : Proc(ISideShowContentManager*, Win32cr::Foundation::HRESULT),
    set_event_sink : Proc(ISideShowContentManager*, Void*, Win32cr::Foundation::HRESULT),
    get_device_capabilities : Proc(ISideShowContentManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a5d5b66b-eef9-41db-8d7e-e17c33ab10b0")]
  record ISideShowContentManager, lpVtbl : ISideShowContentManagerVtbl* do
    GUID = LibC::GUID.new(0xa5d5b66b_u32, 0xeef9_u16, 0x41db_u16, StaticArray[0x8d_u8, 0x7e_u8, 0xe1_u8, 0x7c_u8, 0x33_u8, 0xab_u8, 0x10_u8, 0xb0_u8])
    def query_interface(this : ISideShowContentManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowContentManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowContentManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add(this : ISideShowContentManager*, in_pIContent : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, in_pIContent)
    end
    def remove(this : ISideShowContentManager*, in_contentId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, in_contentId)
    end
    def remove_all(this : ISideShowContentManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all.call(this)
    end
    def set_event_sink(this : ISideShowContentManager*, in_pIEvents : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_sink.call(this, in_pIEvents)
    end
    def get_device_capabilities(this : ISideShowContentManager*, out_ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_capabilities.call(this, out_ppCollection)
    end

  end

  @[Extern]
  record ISideShowContentVtbl,
    query_interface : Proc(ISideShowContent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowContent*, UInt32),
    release : Proc(ISideShowContent*, UInt32),
    get_content : Proc(ISideShowContent*, Void*, UInt32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_ContentId : Proc(ISideShowContent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DifferentiateContent : Proc(ISideShowContent*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c18552ed-74ff-4fec-be07-4cfed29d4887")]
  record ISideShowContent, lpVtbl : ISideShowContentVtbl* do
    GUID = LibC::GUID.new(0xc18552ed_u32, 0x74ff_u16, 0x4fec_u16, StaticArray[0xbe_u8, 0x7_u8, 0x4c_u8, 0xfe_u8, 0xd2_u8, 0x9d_u8, 0x48_u8, 0x87_u8])
    def query_interface(this : ISideShowContent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowContent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowContent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_content(this : ISideShowContent*, in_pICapabilities : Void*, out_pdwSize : UInt32*, out_ppbData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content.call(this, in_pICapabilities, out_pdwSize, out_ppbData)
    end
    def get_ContentId(this : ISideShowContent*, out_pcontentId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentId.call(this, out_pcontentId)
    end
    def get_DifferentiateContent(this : ISideShowContent*, out_pfDifferentiateContent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DifferentiateContent.call(this, out_pfDifferentiateContent)
    end

  end

  @[Extern]
  record ISideShowEventsVtbl,
    query_interface : Proc(ISideShowEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowEvents*, UInt32),
    release : Proc(ISideShowEvents*, UInt32),
    content_missing : Proc(ISideShowEvents*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    application_event : Proc(ISideShowEvents*, Void*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    device_added : Proc(ISideShowEvents*, Void*, Win32cr::Foundation::HRESULT),
    device_removed : Proc(ISideShowEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("61feca4c-deb4-4a7e-8d75-51f1132d615b")]
  record ISideShowEvents, lpVtbl : ISideShowEventsVtbl* do
    GUID = LibC::GUID.new(0x61feca4c_u32, 0xdeb4_u16, 0x4a7e_u16, StaticArray[0x8d_u8, 0x75_u8, 0x51_u8, 0xf1_u8, 0x13_u8, 0x2d_u8, 0x61_u8, 0x5b_u8])
    def query_interface(this : ISideShowEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def content_missing(this : ISideShowEvents*, in_contentId : UInt32, out_ppIContent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.content_missing.call(this, in_contentId, out_ppIContent)
    end
    def application_event(this : ISideShowEvents*, in_pICapabilities : Void*, in_dwEventId : UInt32, in_dwEventSize : UInt32, in_pbEventData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.application_event.call(this, in_pICapabilities, in_dwEventId, in_dwEventSize, in_pbEventData)
    end
    def device_added(this : ISideShowEvents*, in_pIDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_added.call(this, in_pIDevice)
    end
    def device_removed(this : ISideShowEvents*, in_pIDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_removed.call(this, in_pIDevice)
    end

  end

  @[Extern]
  record ISideShowCapabilitiesVtbl,
    query_interface : Proc(ISideShowCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowCapabilities*, UInt32),
    release : Proc(ISideShowCapabilities*, UInt32),
    get_capability : Proc(ISideShowCapabilities*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("535e1379-c09e-4a54-a511-597bab3a72b8")]
  record ISideShowCapabilities, lpVtbl : ISideShowCapabilitiesVtbl* do
    GUID = LibC::GUID.new(0x535e1379_u32, 0xc09e_u16, 0x4a54_u16, StaticArray[0xa5_u8, 0x11_u8, 0x59_u8, 0x7b_u8, 0xab_u8, 0x3a_u8, 0x72_u8, 0xb8_u8])
    def query_interface(this : ISideShowCapabilities*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowCapabilities*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowCapabilities*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_capability(this : ISideShowCapabilities*, in_keyCapability : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, inout_pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capability.call(this, in_keyCapability, inout_pValue)
    end

  end

  @[Extern]
  record ISideShowCapabilitiesCollectionVtbl,
    query_interface : Proc(ISideShowCapabilitiesCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowCapabilitiesCollection*, UInt32),
    release : Proc(ISideShowCapabilitiesCollection*, UInt32),
    get_count : Proc(ISideShowCapabilitiesCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(ISideShowCapabilitiesCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("50305597-5e0d-4ff7-b3af-33d0d9bd52dd")]
  record ISideShowCapabilitiesCollection, lpVtbl : ISideShowCapabilitiesCollectionVtbl* do
    GUID = LibC::GUID.new(0x50305597_u32, 0x5e0d_u16, 0x4ff7_u16, StaticArray[0xb3_u8, 0xaf_u8, 0x33_u8, 0xd0_u8, 0xd9_u8, 0xbd_u8, 0x52_u8, 0xdd_u8])
    def query_interface(this : ISideShowCapabilitiesCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowCapabilitiesCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowCapabilitiesCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : ISideShowCapabilitiesCollection*, out_pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, out_pdwCount)
    end
    def get_at(this : ISideShowCapabilitiesCollection*, in_dwIndex : UInt32, out_ppCapabilities : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, in_dwIndex, out_ppCapabilities)
    end

  end

  @[Extern]
  record ISideShowBulkCapabilitiesVtbl,
    query_interface : Proc(ISideShowBulkCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowBulkCapabilities*, UInt32),
    release : Proc(ISideShowBulkCapabilities*, UInt32),
    get_capability : Proc(ISideShowBulkCapabilities*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_capabilities : Proc(ISideShowBulkCapabilities*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3a2b7fbc-3ad5-48bd-bbf1-0e6cfbd10807")]
  record ISideShowBulkCapabilities, lpVtbl : ISideShowBulkCapabilitiesVtbl* do
    GUID = LibC::GUID.new(0x3a2b7fbc_u32, 0x3ad5_u16, 0x48bd_u16, StaticArray[0xbb_u8, 0xf1_u8, 0xe_u8, 0x6c_u8, 0xfb_u8, 0xd1_u8, 0x8_u8, 0x7_u8])
    def query_interface(this : ISideShowBulkCapabilities*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowBulkCapabilities*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowBulkCapabilities*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_capability(this : ISideShowBulkCapabilities*, in_keyCapability : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, inout_pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capability.call(this, in_keyCapability, inout_pValue)
    end
    def get_capabilities(this : ISideShowBulkCapabilities*, in_keyCollection : Void*, inout_pValues : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, in_keyCollection, inout_pValues)
    end

  end

  @[Extern]
  record ISideShowKeyCollectionVtbl,
    query_interface : Proc(ISideShowKeyCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowKeyCollection*, UInt32),
    release : Proc(ISideShowKeyCollection*, UInt32),
    add : Proc(ISideShowKeyCollection*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    clear : Proc(ISideShowKeyCollection*, Win32cr::Foundation::HRESULT),
    get_at : Proc(ISideShowKeyCollection*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_count : Proc(ISideShowKeyCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(ISideShowKeyCollection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("045473bc-a37b-4957-b144-68105411ed8e")]
  record ISideShowKeyCollection, lpVtbl : ISideShowKeyCollectionVtbl* do
    GUID = LibC::GUID.new(0x45473bc_u32, 0xa37b_u16, 0x4957_u16, StaticArray[0xb1_u8, 0x44_u8, 0x68_u8, 0x10_u8, 0x54_u8, 0x11_u8, 0xed_u8, 0x8e_u8])
    def query_interface(this : ISideShowKeyCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowKeyCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowKeyCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add(this : ISideShowKeyCollection*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, key)
    end
    def clear(this : ISideShowKeyCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def get_at(this : ISideShowKeyCollection*, dwIndex : UInt32, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, dwIndex, pKey)
    end
    def get_count(this : ISideShowKeyCollection*, pcElems : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcElems)
    end
    def remove_at(this : ISideShowKeyCollection*, dwIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, dwIndex)
    end

  end

  @[Extern]
  record ISideShowPropVariantCollectionVtbl,
    query_interface : Proc(ISideShowPropVariantCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISideShowPropVariantCollection*, UInt32),
    release : Proc(ISideShowPropVariantCollection*, UInt32),
    add : Proc(ISideShowPropVariantCollection*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    clear : Proc(ISideShowPropVariantCollection*, Win32cr::Foundation::HRESULT),
    get_at : Proc(ISideShowPropVariantCollection*, UInt32, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_count : Proc(ISideShowPropVariantCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(ISideShowPropVariantCollection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2ea7a549-7bff-4aae-bab0-22d43111de49")]
  record ISideShowPropVariantCollection, lpVtbl : ISideShowPropVariantCollectionVtbl* do
    GUID = LibC::GUID.new(0x2ea7a549_u32, 0x7bff_u16, 0x4aae_u16, StaticArray[0xba_u8, 0xb0_u8, 0x22_u8, 0xd4_u8, 0x31_u8, 0x11_u8, 0xde_u8, 0x49_u8])
    def query_interface(this : ISideShowPropVariantCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISideShowPropVariantCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISideShowPropVariantCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add(this : ISideShowPropVariantCollection*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pValue)
    end
    def clear(this : ISideShowPropVariantCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def get_at(this : ISideShowPropVariantCollection*, dwIndex : UInt32, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, dwIndex, pValue)
    end
    def get_count(this : ISideShowPropVariantCollection*, pcElems : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcElems)
    end
    def remove_at(this : ISideShowPropVariantCollection*, dwIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, dwIndex)
    end

  end

end