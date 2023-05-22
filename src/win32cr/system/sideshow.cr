require "../system/com.cr"
require "../foundation.cr"
require "../ui/windowsandmessaging.cr"
require "../ui/shell/propertiessystem.cr"
require "../system/com/structuredstorage.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  SIDESHOW_ENDPOINT_SIMPLE_CONTENT_FORMAT = "a9a5353f-2d4b-47ce-93ee-759f3a7dda4f"
  SIDESHOW_ENDPOINT_ICAL = "4dff36b5-9dde-4f76-9a2a-96435047063d"
  SIDESHOW_CAPABILITY_DEVICE_PROPERTIES = "8abc88a8-857b-4ad7-a35a-b5942f492b99"
  SIDESHOW_CAPABILITY_DEVICE_ID = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 1_u32)
  SIDESHOW_CAPABILITY_SCREEN_TYPE = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 2_u32)
  SIDESHOW_CAPABILITY_SCREEN_WIDTH = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 3_u32)
  SIDESHOW_CAPABILITY_SCREEN_HEIGHT = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 4_u32)
  SIDESHOW_CAPABILITY_COLOR_DEPTH = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 5_u32)
  SIDESHOW_CAPABILITY_COLOR_TYPE = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 6_u32)
  SIDESHOW_CAPABILITY_DATA_CACHE = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 7_u32)
  SIDESHOW_CAPABILITY_SUPPORTED_LANGUAGES = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 8_u32)
  SIDESHOW_CAPABILITY_CURRENT_LANGUAGE = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 9_u32)
  SIDESHOW_CAPABILITY_SUPPORTED_THEMES = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 10_u32)
  SIDESHOW_CAPABILITY_SUPPORTED_IMAGE_FORMATS = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 14_u32)
  SIDESHOW_CAPABILITY_CLIENT_AREA_WIDTH = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 15_u32)
  SIDESHOW_CAPABILITY_CLIENT_AREA_HEIGHT = PROPERTYKEY.new(LibC::GUID.new(0x8abc88a8_u32, 0x857b_u16, 0x4ad7_u16, StaticArray[0xa3_u8, 0x5a_u8, 0xb5_u8, 0x94_u8, 0x2f_u8, 0x49_u8, 0x2b_u8, 0x99_u8]), 16_u32)
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
  SideShowSession = LibC::GUID.new(0xe20543b9_u32, 0xf785_u16, 0x4ea2_u16, StaticArray[0x98_u8, 0x1e_u8, 0xc4_u8, 0xff_u8, 0xa7_u8, 0x6b_u8, 0xbc_u8, 0x7c_u8])
  SideShowNotification = LibC::GUID.new(0xce3e86f_u32, 0xd5cd_u16, 0x4525_u16, StaticArray[0xa7_u8, 0x66_u8, 0x1a_u8, 0xba_u8, 0xb1_u8, 0xa7_u8, 0x52_u8, 0xf5_u8])
  SideShowKeyCollection = LibC::GUID.new(0xdfbbdbf8_u32, 0x18de_u16, 0x49b8_u16, StaticArray[0x83_u8, 0xdc_u8, 0xeb_u8, 0xc7_u8, 0x27_u8, 0xc6_u8, 0x2d_u8, 0x94_u8])
  SideShowPropVariantCollection = LibC::GUID.new(0xe640f415_u32, 0x539e_u16, 0x4923_u16, StaticArray[0x96_u8, 0xcd_u8, 0x5f_u8, 0x9_u8, 0x3b_u8, 0xc2_u8, 0x50_u8, 0xcd_u8])


  enum SIDESHOW_SCREEN_TYPE : Int32
    SIDESHOW_SCREEN_TYPE_BITMAP = 0
    SIDESHOW_SCREEN_TYPE_TEXT = 1
  end

  enum SIDESHOW_COLOR_TYPE : Int32
    SIDESHOW_COLOR_TYPE_COLOR = 0
    SIDESHOW_COLOR_TYPE_GREYSCALE = 1
    SIDESHOW_COLOR_TYPE_BLACK_AND_WHITE = 2
  end

  enum SCF_EVENT_IDS : Int32
    SCF_EVENT_NAVIGATION = 1
    SCF_EVENT_MENUACTION = 2
    SCF_EVENT_CONTEXTMENU = 3
  end

  enum SCF_BUTTON_IDS : Int32
    SCF_BUTTON_MENU = 1
    SCF_BUTTON_SELECT = 2
    SCF_BUTTON_UP = 3
    SCF_BUTTON_DOWN = 4
    SCF_BUTTON_LEFT = 5
    SCF_BUTTON_RIGHT = 6
    SCF_BUTTON_PLAY = 7
    SCF_BUTTON_PAUSE = 8
    SCF_BUTTON_FASTFORWARD = 9
    SCF_BUTTON_REWIND = 10
    SCF_BUTTON_STOP = 11
    SCF_BUTTON_BACK = 65280
  end

  struct SCF_EVENT_HEADER
    previous_page : UInt32
    target_page : UInt32
  end
  struct SCF_NAVIGATION_EVENT
    previous_page : UInt32
    target_page : UInt32
    button : UInt32
  end
  struct SCF_MENUACTION_EVENT
    previous_page : UInt32
    target_page : UInt32
    button : UInt32
    item_id : UInt32
  end
  struct SCF_CONTEXTMENU_EVENT
    previous_page : UInt32
    target_page : UInt32
    previous_item_id : UInt32
    menu_page : UInt32
    menu_item_id : UInt32
  end
  struct CONTENT_MISSING_EVENT_DATA
    cb_content_missing_event_data : UInt32
    application_id : Guid
    endpoint_id : Guid
    content_id : UInt32
  end
  struct APPLICATION_EVENT_DATA
    cb_application_event_data : UInt32
    application_id : Guid
    endpoint_id : Guid
    dw_event_id : UInt32
    cb_event_data : UInt32
    b_event_data : UInt8[0]*
  end
  struct DEVICE_USER_CHANGE_EVENT_DATA
    cb_device_user_change_event_data : UInt32
    wsz_user : Char
  end
  struct NEW_EVENT_DATA_AVAILABLE
    cb_new_event_data_available : UInt32
    dw_version : UInt32
  end
  struct EVENT_DATA_HEADER
    cb_event_data_header : UInt32
    guid_event_type : Guid
    dw_version : UInt32
    cb_event_data_sid : UInt32
  end


  struct ISideShowSessionVTbl
    query_interface : Proc(ISideShowSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowSession*, UInt32)
    release : Proc(ISideShowSession*, UInt32)
    register_content : Proc(ISideShowSession*, Guid*, Guid*, ISideShowContentManager*, HRESULT)
    register_notifications : Proc(ISideShowSession*, Guid*, ISideShowNotificationManager*, HRESULT)
  end

  struct ISideShowSession
    lpVtbl : ISideShowSessionVTbl*
  end

  struct ISideShowNotificationManagerVTbl
    query_interface : Proc(ISideShowNotificationManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowNotificationManager*, UInt32)
    release : Proc(ISideShowNotificationManager*, UInt32)
    show : Proc(ISideShowNotificationManager*, ISideShowNotification, HRESULT)
    revoke : Proc(ISideShowNotificationManager*, UInt32, HRESULT)
    revoke_all : Proc(ISideShowNotificationManager*, HRESULT)
  end

  struct ISideShowNotificationManager
    lpVtbl : ISideShowNotificationManagerVTbl*
  end

  struct ISideShowNotificationVTbl
    query_interface : Proc(ISideShowNotification*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowNotification*, UInt32)
    release : Proc(ISideShowNotification*, UInt32)
    get_notification_id : Proc(ISideShowNotification*, UInt32*, HRESULT)
    put_notification_id : Proc(ISideShowNotification*, UInt32, HRESULT)
    get_title : Proc(ISideShowNotification*, LibC::LPWSTR*, HRESULT)
    put_title : Proc(ISideShowNotification*, LibC::LPWSTR, HRESULT)
    get_message : Proc(ISideShowNotification*, LibC::LPWSTR*, HRESULT)
    put_message : Proc(ISideShowNotification*, LibC::LPWSTR, HRESULT)
    get_image : Proc(ISideShowNotification*, HANDLE*, HRESULT)
    put_image : Proc(ISideShowNotification*, LibC::HANDLE, HRESULT)
    get_expiration_time : Proc(ISideShowNotification*, SYSTEMTIME*, HRESULT)
    put_expiration_time : Proc(ISideShowNotification*, SYSTEMTIME*, HRESULT)
  end

  struct ISideShowNotification
    lpVtbl : ISideShowNotificationVTbl*
  end

  struct ISideShowContentManagerVTbl
    query_interface : Proc(ISideShowContentManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowContentManager*, UInt32)
    release : Proc(ISideShowContentManager*, UInt32)
    add : Proc(ISideShowContentManager*, ISideShowContent, HRESULT)
    remove : Proc(ISideShowContentManager*, UInt32, HRESULT)
    remove_all : Proc(ISideShowContentManager*, HRESULT)
    set_event_sink : Proc(ISideShowContentManager*, ISideShowEvents, HRESULT)
    get_device_capabilities : Proc(ISideShowContentManager*, ISideShowCapabilitiesCollection*, HRESULT)
  end

  struct ISideShowContentManager
    lpVtbl : ISideShowContentManagerVTbl*
  end

  struct ISideShowContentVTbl
    query_interface : Proc(ISideShowContent*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowContent*, UInt32)
    release : Proc(ISideShowContent*, UInt32)
    get_content : Proc(ISideShowContent*, ISideShowCapabilities, UInt32*, UInt8**, HRESULT)
    get_content_id : Proc(ISideShowContent*, UInt32*, HRESULT)
    get_differentiate_content : Proc(ISideShowContent*, LibC::BOOL*, HRESULT)
  end

  struct ISideShowContent
    lpVtbl : ISideShowContentVTbl*
  end

  struct ISideShowEventsVTbl
    query_interface : Proc(ISideShowEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowEvents*, UInt32)
    release : Proc(ISideShowEvents*, UInt32)
    content_missing : Proc(ISideShowEvents*, UInt32, ISideShowContent*, HRESULT)
    application_event : Proc(ISideShowEvents*, ISideShowCapabilities, UInt32, UInt32, UInt8*, HRESULT)
    device_added : Proc(ISideShowEvents*, ISideShowCapabilities, HRESULT)
    device_removed : Proc(ISideShowEvents*, ISideShowCapabilities, HRESULT)
  end

  struct ISideShowEvents
    lpVtbl : ISideShowEventsVTbl*
  end

  struct ISideShowCapabilitiesVTbl
    query_interface : Proc(ISideShowCapabilities*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowCapabilities*, UInt32)
    release : Proc(ISideShowCapabilities*, UInt32)
    get_capability : Proc(ISideShowCapabilities*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
  end

  struct ISideShowCapabilities
    lpVtbl : ISideShowCapabilitiesVTbl*
  end

  struct ISideShowCapabilitiesCollectionVTbl
    query_interface : Proc(ISideShowCapabilitiesCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowCapabilitiesCollection*, UInt32)
    release : Proc(ISideShowCapabilitiesCollection*, UInt32)
    get_count : Proc(ISideShowCapabilitiesCollection*, UInt32*, HRESULT)
    get_at : Proc(ISideShowCapabilitiesCollection*, UInt32, ISideShowCapabilities*, HRESULT)
  end

  struct ISideShowCapabilitiesCollection
    lpVtbl : ISideShowCapabilitiesCollectionVTbl*
  end

  struct ISideShowBulkCapabilitiesVTbl
    query_interface : Proc(ISideShowBulkCapabilities*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowBulkCapabilities*, UInt32)
    release : Proc(ISideShowBulkCapabilities*, UInt32)
    get_capability : Proc(ISideShowBulkCapabilities*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    get_capabilities : Proc(ISideShowBulkCapabilities*, ISideShowKeyCollection, ISideShowPropVariantCollection*, HRESULT)
  end

  struct ISideShowBulkCapabilities
    lpVtbl : ISideShowBulkCapabilitiesVTbl*
  end

  struct ISideShowKeyCollectionVTbl
    query_interface : Proc(ISideShowKeyCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowKeyCollection*, UInt32)
    release : Proc(ISideShowKeyCollection*, UInt32)
    add : Proc(ISideShowKeyCollection*, PROPERTYKEY*, HRESULT)
    clear : Proc(ISideShowKeyCollection*, HRESULT)
    get_at : Proc(ISideShowKeyCollection*, UInt32, PROPERTYKEY*, HRESULT)
    get_count : Proc(ISideShowKeyCollection*, UInt32*, HRESULT)
    remove_at : Proc(ISideShowKeyCollection*, UInt32, HRESULT)
  end

  struct ISideShowKeyCollection
    lpVtbl : ISideShowKeyCollectionVTbl*
  end

  struct ISideShowPropVariantCollectionVTbl
    query_interface : Proc(ISideShowPropVariantCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowPropVariantCollection*, UInt32)
    release : Proc(ISideShowPropVariantCollection*, UInt32)
    add : Proc(ISideShowPropVariantCollection*, PROPVARIANT*, HRESULT)
    clear : Proc(ISideShowPropVariantCollection*, HRESULT)
    get_at : Proc(ISideShowPropVariantCollection*, UInt32, PROPVARIANT*, HRESULT)
    get_count : Proc(ISideShowPropVariantCollection*, UInt32*, HRESULT)
    remove_at : Proc(ISideShowPropVariantCollection*, UInt32, HRESULT)
  end

  struct ISideShowPropVariantCollection
    lpVtbl : ISideShowPropVariantCollectionVTbl*
  end

end
