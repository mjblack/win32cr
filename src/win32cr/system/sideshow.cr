require "../system/com.cr"
require "../foundation.cr"
require "../ui/windowsandmessaging.cr"
require "../ui/shell/propertiessystem.cr"
require "../system/com/structuredstorage.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
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
  CLSID_SideShowSession = LibC::GUID.new(0xe20543b9_u32, 0xf785_u16, 0x4ea2_u16, StaticArray[0x98_u8, 0x1e_u8, 0xc4_u8, 0xff_u8, 0xa7_u8, 0x6b_u8, 0xbc_u8, 0x7c_u8])
  CLSID_SideShowNotification = LibC::GUID.new(0xce3e86f_u32, 0xd5cd_u16, 0x4525_u16, StaticArray[0xa7_u8, 0x66_u8, 0x1a_u8, 0xba_u8, 0xb1_u8, 0xa7_u8, 0x52_u8, 0xf5_u8])
  CLSID_SideShowKeyCollection = LibC::GUID.new(0xdfbbdbf8_u32, 0x18de_u16, 0x49b8_u16, StaticArray[0x83_u8, 0xdc_u8, 0xeb_u8, 0xc7_u8, 0x27_u8, 0xc6_u8, 0x2d_u8, 0x94_u8])
  CLSID_SideShowPropVariantCollection = LibC::GUID.new(0xe640f415_u32, 0x539e_u16, 0x4923_u16, StaticArray[0x96_u8, 0xcd_u8, 0x5f_u8, 0x9_u8, 0x3b_u8, 0xc2_u8, 0x50_u8, 0xcd_u8])


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

  ISideShowSession_GUID = "e22331ee-9e7d-4922-9fc2-ab7aa41ce491"
  IID_ISideShowSession = LibC::GUID.new(0xe22331ee_u32, 0x9e7d_u16, 0x4922_u16, StaticArray[0x9f_u8, 0xc2_u8, 0xab_u8, 0x7a_u8, 0xa4_u8, 0x1c_u8, 0xe4_u8, 0x91_u8])
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

  ISideShowNotificationManager_GUID = "63cea909-f2b9-4302-b5e1-c68e6d9ab833"
  IID_ISideShowNotificationManager = LibC::GUID.new(0x63cea909_u32, 0xf2b9_u16, 0x4302_u16, StaticArray[0xb5_u8, 0xe1_u8, 0xc6_u8, 0x8e_u8, 0x6d_u8, 0x9a_u8, 0xb8_u8, 0x33_u8])
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

  ISideShowNotification_GUID = "03c93300-8ab2-41c5-9b79-46127a30e148"
  IID_ISideShowNotification = LibC::GUID.new(0x3c93300_u32, 0x8ab2_u16, 0x41c5_u16, StaticArray[0x9b_u8, 0x79_u8, 0x46_u8, 0x12_u8, 0x7a_u8, 0x30_u8, 0xe1_u8, 0x48_u8])
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

  ISideShowContentManager_GUID = "a5d5b66b-eef9-41db-8d7e-e17c33ab10b0"
  IID_ISideShowContentManager = LibC::GUID.new(0xa5d5b66b_u32, 0xeef9_u16, 0x41db_u16, StaticArray[0x8d_u8, 0x7e_u8, 0xe1_u8, 0x7c_u8, 0x33_u8, 0xab_u8, 0x10_u8, 0xb0_u8])
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

  ISideShowContent_GUID = "c18552ed-74ff-4fec-be07-4cfed29d4887"
  IID_ISideShowContent = LibC::GUID.new(0xc18552ed_u32, 0x74ff_u16, 0x4fec_u16, StaticArray[0xbe_u8, 0x7_u8, 0x4c_u8, 0xfe_u8, 0xd2_u8, 0x9d_u8, 0x48_u8, 0x87_u8])
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

  ISideShowEvents_GUID = "61feca4c-deb4-4a7e-8d75-51f1132d615b"
  IID_ISideShowEvents = LibC::GUID.new(0x61feca4c_u32, 0xdeb4_u16, 0x4a7e_u16, StaticArray[0x8d_u8, 0x75_u8, 0x51_u8, 0xf1_u8, 0x13_u8, 0x2d_u8, 0x61_u8, 0x5b_u8])
  struct ISideShowEvents
    lpVtbl : ISideShowEventsVTbl*
  end

  struct ISideShowCapabilitiesVTbl
    query_interface : Proc(ISideShowCapabilities*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISideShowCapabilities*, UInt32)
    release : Proc(ISideShowCapabilities*, UInt32)
    get_capability : Proc(ISideShowCapabilities*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
  end

  ISideShowCapabilities_GUID = "535e1379-c09e-4a54-a511-597bab3a72b8"
  IID_ISideShowCapabilities = LibC::GUID.new(0x535e1379_u32, 0xc09e_u16, 0x4a54_u16, StaticArray[0xa5_u8, 0x11_u8, 0x59_u8, 0x7b_u8, 0xab_u8, 0x3a_u8, 0x72_u8, 0xb8_u8])
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

  ISideShowCapabilitiesCollection_GUID = "50305597-5e0d-4ff7-b3af-33d0d9bd52dd"
  IID_ISideShowCapabilitiesCollection = LibC::GUID.new(0x50305597_u32, 0x5e0d_u16, 0x4ff7_u16, StaticArray[0xb3_u8, 0xaf_u8, 0x33_u8, 0xd0_u8, 0xd9_u8, 0xbd_u8, 0x52_u8, 0xdd_u8])
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

  ISideShowBulkCapabilities_GUID = "3a2b7fbc-3ad5-48bd-bbf1-0e6cfbd10807"
  IID_ISideShowBulkCapabilities = LibC::GUID.new(0x3a2b7fbc_u32, 0x3ad5_u16, 0x48bd_u16, StaticArray[0xbb_u8, 0xf1_u8, 0xe_u8, 0x6c_u8, 0xfb_u8, 0xd1_u8, 0x8_u8, 0x7_u8])
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

  ISideShowKeyCollection_GUID = "045473bc-a37b-4957-b144-68105411ed8e"
  IID_ISideShowKeyCollection = LibC::GUID.new(0x45473bc_u32, 0xa37b_u16, 0x4957_u16, StaticArray[0xb1_u8, 0x44_u8, 0x68_u8, 0x10_u8, 0x54_u8, 0x11_u8, 0xed_u8, 0x8e_u8])
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

  ISideShowPropVariantCollection_GUID = "2ea7a549-7bff-4aae-bab0-22d43111de49"
  IID_ISideShowPropVariantCollection = LibC::GUID.new(0x2ea7a549_u32, 0x7bff_u16, 0x4aae_u16, StaticArray[0xba_u8, 0xb0_u8, 0x22_u8, 0xd4_u8, 0x31_u8, 0x11_u8, 0xde_u8, 0x49_u8])
  struct ISideShowPropVariantCollection
    lpVtbl : ISideShowPropVariantCollectionVTbl*
  end

end
struct LibWin32::ISideShowSession
  def query_interface(this : ISideShowSession*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowSession*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowSession*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_content(this : ISideShowSession*, in_applicationid : Guid*, in_endpointid : Guid*, out_ppicontent : ISideShowContentManager*) : HRESULT
    @lpVtbl.value.register_content.call(this, in_applicationid, in_endpointid, out_ppicontent)
  end
  def register_notifications(this : ISideShowSession*, in_applicationid : Guid*, out_ppinotification : ISideShowNotificationManager*) : HRESULT
    @lpVtbl.value.register_notifications.call(this, in_applicationid, out_ppinotification)
  end
end
struct LibWin32::ISideShowNotificationManager
  def query_interface(this : ISideShowNotificationManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowNotificationManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowNotificationManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def show(this : ISideShowNotificationManager*, in_pinotification : ISideShowNotification) : HRESULT
    @lpVtbl.value.show.call(this, in_pinotification)
  end
  def revoke(this : ISideShowNotificationManager*, in_notificationid : UInt32) : HRESULT
    @lpVtbl.value.revoke.call(this, in_notificationid)
  end
  def revoke_all(this : ISideShowNotificationManager*) : HRESULT
    @lpVtbl.value.revoke_all.call(this)
  end
end
struct LibWin32::ISideShowNotification
  def query_interface(this : ISideShowNotification*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowNotification*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowNotification*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_notification_id(this : ISideShowNotification*, out_pnotificationid : UInt32*) : HRESULT
    @lpVtbl.value.get_notification_id.call(this, out_pnotificationid)
  end
  def put_notification_id(this : ISideShowNotification*, in_notificationid : UInt32) : HRESULT
    @lpVtbl.value.put_notification_id.call(this, in_notificationid)
  end
  def get_title(this : ISideShowNotification*, out_ppwsztitle : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_title.call(this, out_ppwsztitle)
  end
  def put_title(this : ISideShowNotification*, in_pwsztitle : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_title.call(this, in_pwsztitle)
  end
  def get_message(this : ISideShowNotification*, out_ppwszmessage : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_message.call(this, out_ppwszmessage)
  end
  def put_message(this : ISideShowNotification*, in_pwszmessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_message.call(this, in_pwszmessage)
  end
  def get_image(this : ISideShowNotification*, out_phicon : HANDLE*) : HRESULT
    @lpVtbl.value.get_image.call(this, out_phicon)
  end
  def put_image(this : ISideShowNotification*, in_hicon : LibC::HANDLE) : HRESULT
    @lpVtbl.value.put_image.call(this, in_hicon)
  end
  def get_expiration_time(this : ISideShowNotification*, out_ptime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_expiration_time.call(this, out_ptime)
  end
  def put_expiration_time(this : ISideShowNotification*, in_ptime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.put_expiration_time.call(this, in_ptime)
  end
end
struct LibWin32::ISideShowContentManager
  def query_interface(this : ISideShowContentManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowContentManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowContentManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add(this : ISideShowContentManager*, in_picontent : ISideShowContent) : HRESULT
    @lpVtbl.value.add.call(this, in_picontent)
  end
  def remove(this : ISideShowContentManager*, in_contentid : UInt32) : HRESULT
    @lpVtbl.value.remove.call(this, in_contentid)
  end
  def remove_all(this : ISideShowContentManager*) : HRESULT
    @lpVtbl.value.remove_all.call(this)
  end
  def set_event_sink(this : ISideShowContentManager*, in_pievents : ISideShowEvents) : HRESULT
    @lpVtbl.value.set_event_sink.call(this, in_pievents)
  end
  def get_device_capabilities(this : ISideShowContentManager*, out_ppcollection : ISideShowCapabilitiesCollection*) : HRESULT
    @lpVtbl.value.get_device_capabilities.call(this, out_ppcollection)
  end
end
struct LibWin32::ISideShowContent
  def query_interface(this : ISideShowContent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowContent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowContent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_content(this : ISideShowContent*, in_picapabilities : ISideShowCapabilities, out_pdwsize : UInt32*, out_ppbdata : UInt8**) : HRESULT
    @lpVtbl.value.get_content.call(this, in_picapabilities, out_pdwsize, out_ppbdata)
  end
  def get_content_id(this : ISideShowContent*, out_pcontentid : UInt32*) : HRESULT
    @lpVtbl.value.get_content_id.call(this, out_pcontentid)
  end
  def get_differentiate_content(this : ISideShowContent*, out_pfdifferentiatecontent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_differentiate_content.call(this, out_pfdifferentiatecontent)
  end
end
struct LibWin32::ISideShowEvents
  def query_interface(this : ISideShowEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def content_missing(this : ISideShowEvents*, in_contentid : UInt32, out_ppicontent : ISideShowContent*) : HRESULT
    @lpVtbl.value.content_missing.call(this, in_contentid, out_ppicontent)
  end
  def application_event(this : ISideShowEvents*, in_picapabilities : ISideShowCapabilities, in_dweventid : UInt32, in_dweventsize : UInt32, in_pbeventdata : UInt8*) : HRESULT
    @lpVtbl.value.application_event.call(this, in_picapabilities, in_dweventid, in_dweventsize, in_pbeventdata)
  end
  def device_added(this : ISideShowEvents*, in_pidevice : ISideShowCapabilities) : HRESULT
    @lpVtbl.value.device_added.call(this, in_pidevice)
  end
  def device_removed(this : ISideShowEvents*, in_pidevice : ISideShowCapabilities) : HRESULT
    @lpVtbl.value.device_removed.call(this, in_pidevice)
  end
end
struct LibWin32::ISideShowCapabilities
  def query_interface(this : ISideShowCapabilities*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowCapabilities*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowCapabilities*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_capability(this : ISideShowCapabilities*, in_keycapability : PROPERTYKEY*, inout_pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_capability.call(this, in_keycapability, inout_pvalue)
  end
end
struct LibWin32::ISideShowCapabilitiesCollection
  def query_interface(this : ISideShowCapabilitiesCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowCapabilitiesCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowCapabilitiesCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_count(this : ISideShowCapabilitiesCollection*, out_pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, out_pdwcount)
  end
  def get_at(this : ISideShowCapabilitiesCollection*, in_dwindex : UInt32, out_ppcapabilities : ISideShowCapabilities*) : HRESULT
    @lpVtbl.value.get_at.call(this, in_dwindex, out_ppcapabilities)
  end
end
struct LibWin32::ISideShowBulkCapabilities
  def query_interface(this : ISideShowBulkCapabilities*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowBulkCapabilities*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowBulkCapabilities*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_capability(this : ISideShowBulkCapabilities*, in_keycapability : PROPERTYKEY*, inout_pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_capability.call(this, in_keycapability, inout_pvalue)
  end
  def get_capabilities(this : ISideShowBulkCapabilities*, in_keycollection : ISideShowKeyCollection, inout_pvalues : ISideShowPropVariantCollection*) : HRESULT
    @lpVtbl.value.get_capabilities.call(this, in_keycollection, inout_pvalues)
  end
end
struct LibWin32::ISideShowKeyCollection
  def query_interface(this : ISideShowKeyCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowKeyCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowKeyCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add(this : ISideShowKeyCollection*, key : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.add.call(this, key)
  end
  def clear(this : ISideShowKeyCollection*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
  def get_at(this : ISideShowKeyCollection*, dwindex : UInt32, pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_at.call(this, dwindex, pkey)
  end
  def get_count(this : ISideShowKeyCollection*, pcelems : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcelems)
  end
  def remove_at(this : ISideShowKeyCollection*, dwindex : UInt32) : HRESULT
    @lpVtbl.value.remove_at.call(this, dwindex)
  end
end
struct LibWin32::ISideShowPropVariantCollection
  def query_interface(this : ISideShowPropVariantCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISideShowPropVariantCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISideShowPropVariantCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add(this : ISideShowPropVariantCollection*, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.add.call(this, pvalue)
  end
  def clear(this : ISideShowPropVariantCollection*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
  def get_at(this : ISideShowPropVariantCollection*, dwindex : UInt32, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_at.call(this, dwindex, pvalue)
  end
  def get_count(this : ISideShowPropVariantCollection*, pcelems : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcelems)
  end
  def remove_at(this : ISideShowPropVariantCollection*, dwindex : UInt32) : HRESULT
    @lpVtbl.value.remove_at.call(this, dwindex)
  end
end
