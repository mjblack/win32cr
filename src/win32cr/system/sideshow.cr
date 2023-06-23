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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_content : UInt64
    register_notifications : UInt64
  end

  ISideShowSession_GUID = "e22331ee-9e7d-4922-9fc2-ab7aa41ce491"
  IID_ISideShowSession = LibC::GUID.new(0xe22331ee_u32, 0x9e7d_u16, 0x4922_u16, StaticArray[0x9f_u8, 0xc2_u8, 0xab_u8, 0x7a_u8, 0xa4_u8, 0x1c_u8, 0xe4_u8, 0x91_u8])
  struct ISideShowSession
    lpVtbl : ISideShowSessionVTbl*
  end

  struct ISideShowNotificationManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    show : UInt64
    revoke : UInt64
    revoke_all : UInt64
  end

  ISideShowNotificationManager_GUID = "63cea909-f2b9-4302-b5e1-c68e6d9ab833"
  IID_ISideShowNotificationManager = LibC::GUID.new(0x63cea909_u32, 0xf2b9_u16, 0x4302_u16, StaticArray[0xb5_u8, 0xe1_u8, 0xc6_u8, 0x8e_u8, 0x6d_u8, 0x9a_u8, 0xb8_u8, 0x33_u8])
  struct ISideShowNotificationManager
    lpVtbl : ISideShowNotificationManagerVTbl*
  end

  struct ISideShowNotificationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_notification_id : UInt64
    put_notification_id : UInt64
    get_title : UInt64
    put_title : UInt64
    get_message : UInt64
    put_message : UInt64
    get_image : UInt64
    put_image : UInt64
    get_expiration_time : UInt64
    put_expiration_time : UInt64
  end

  ISideShowNotification_GUID = "03c93300-8ab2-41c5-9b79-46127a30e148"
  IID_ISideShowNotification = LibC::GUID.new(0x3c93300_u32, 0x8ab2_u16, 0x41c5_u16, StaticArray[0x9b_u8, 0x79_u8, 0x46_u8, 0x12_u8, 0x7a_u8, 0x30_u8, 0xe1_u8, 0x48_u8])
  struct ISideShowNotification
    lpVtbl : ISideShowNotificationVTbl*
  end

  struct ISideShowContentManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add : UInt64
    remove : UInt64
    remove_all : UInt64
    set_event_sink : UInt64
    get_device_capabilities : UInt64
  end

  ISideShowContentManager_GUID = "a5d5b66b-eef9-41db-8d7e-e17c33ab10b0"
  IID_ISideShowContentManager = LibC::GUID.new(0xa5d5b66b_u32, 0xeef9_u16, 0x41db_u16, StaticArray[0x8d_u8, 0x7e_u8, 0xe1_u8, 0x7c_u8, 0x33_u8, 0xab_u8, 0x10_u8, 0xb0_u8])
  struct ISideShowContentManager
    lpVtbl : ISideShowContentManagerVTbl*
  end

  struct ISideShowContentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_content : UInt64
    get_content_id : UInt64
    get_differentiate_content : UInt64
  end

  ISideShowContent_GUID = "c18552ed-74ff-4fec-be07-4cfed29d4887"
  IID_ISideShowContent = LibC::GUID.new(0xc18552ed_u32, 0x74ff_u16, 0x4fec_u16, StaticArray[0xbe_u8, 0x7_u8, 0x4c_u8, 0xfe_u8, 0xd2_u8, 0x9d_u8, 0x48_u8, 0x87_u8])
  struct ISideShowContent
    lpVtbl : ISideShowContentVTbl*
  end

  struct ISideShowEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    content_missing : UInt64
    application_event : UInt64
    device_added : UInt64
    device_removed : UInt64
  end

  ISideShowEvents_GUID = "61feca4c-deb4-4a7e-8d75-51f1132d615b"
  IID_ISideShowEvents = LibC::GUID.new(0x61feca4c_u32, 0xdeb4_u16, 0x4a7e_u16, StaticArray[0x8d_u8, 0x75_u8, 0x51_u8, 0xf1_u8, 0x13_u8, 0x2d_u8, 0x61_u8, 0x5b_u8])
  struct ISideShowEvents
    lpVtbl : ISideShowEventsVTbl*
  end

  struct ISideShowCapabilitiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_capability : UInt64
  end

  ISideShowCapabilities_GUID = "535e1379-c09e-4a54-a511-597bab3a72b8"
  IID_ISideShowCapabilities = LibC::GUID.new(0x535e1379_u32, 0xc09e_u16, 0x4a54_u16, StaticArray[0xa5_u8, 0x11_u8, 0x59_u8, 0x7b_u8, 0xab_u8, 0x3a_u8, 0x72_u8, 0xb8_u8])
  struct ISideShowCapabilities
    lpVtbl : ISideShowCapabilitiesVTbl*
  end

  struct ISideShowCapabilitiesCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
  end

  ISideShowCapabilitiesCollection_GUID = "50305597-5e0d-4ff7-b3af-33d0d9bd52dd"
  IID_ISideShowCapabilitiesCollection = LibC::GUID.new(0x50305597_u32, 0x5e0d_u16, 0x4ff7_u16, StaticArray[0xb3_u8, 0xaf_u8, 0x33_u8, 0xd0_u8, 0xd9_u8, 0xbd_u8, 0x52_u8, 0xdd_u8])
  struct ISideShowCapabilitiesCollection
    lpVtbl : ISideShowCapabilitiesCollectionVTbl*
  end

  struct ISideShowBulkCapabilitiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_capability : UInt64
    get_capabilities : UInt64
  end

  ISideShowBulkCapabilities_GUID = "3a2b7fbc-3ad5-48bd-bbf1-0e6cfbd10807"
  IID_ISideShowBulkCapabilities = LibC::GUID.new(0x3a2b7fbc_u32, 0x3ad5_u16, 0x48bd_u16, StaticArray[0xbb_u8, 0xf1_u8, 0xe_u8, 0x6c_u8, 0xfb_u8, 0xd1_u8, 0x8_u8, 0x7_u8])
  struct ISideShowBulkCapabilities
    lpVtbl : ISideShowBulkCapabilitiesVTbl*
  end

  struct ISideShowKeyCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add : UInt64
    clear : UInt64
    get_at : UInt64
    get_count : UInt64
    remove_at : UInt64
  end

  ISideShowKeyCollection_GUID = "045473bc-a37b-4957-b144-68105411ed8e"
  IID_ISideShowKeyCollection = LibC::GUID.new(0x45473bc_u32, 0xa37b_u16, 0x4957_u16, StaticArray[0xb1_u8, 0x44_u8, 0x68_u8, 0x10_u8, 0x54_u8, 0x11_u8, 0xed_u8, 0x8e_u8])
  struct ISideShowKeyCollection
    lpVtbl : ISideShowKeyCollectionVTbl*
  end

  struct ISideShowPropVariantCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add : UInt64
    clear : UInt64
    get_at : UInt64
    get_count : UInt64
    remove_at : UInt64
  end

  ISideShowPropVariantCollection_GUID = "2ea7a549-7bff-4aae-bab0-22d43111de49"
  IID_ISideShowPropVariantCollection = LibC::GUID.new(0x2ea7a549_u32, 0x7bff_u16, 0x4aae_u16, StaticArray[0xba_u8, 0xb0_u8, 0x22_u8, 0xd4_u8, 0x31_u8, 0x11_u8, 0xde_u8, 0x49_u8])
  struct ISideShowPropVariantCollection
    lpVtbl : ISideShowPropVariantCollectionVTbl*
  end

end
struct LibWin32::ISideShowSession
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_content(in_applicationid : Guid*, in_endpointid : Guid*, out_ppicontent : ISideShowContentManager*) : HRESULT
    @lpVtbl.value.register_content.unsafe_as(Proc(Guid*, Guid*, ISideShowContentManager*, HRESULT)).call(in_applicationid, in_endpointid, out_ppicontent)
  end
  def register_notifications(in_applicationid : Guid*, out_ppinotification : ISideShowNotificationManager*) : HRESULT
    @lpVtbl.value.register_notifications.unsafe_as(Proc(Guid*, ISideShowNotificationManager*, HRESULT)).call(in_applicationid, out_ppinotification)
  end
end
struct LibWin32::ISideShowNotificationManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def show(in_pinotification : ISideShowNotification) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(ISideShowNotification, HRESULT)).call(in_pinotification)
  end
  def revoke(in_notificationid : UInt32) : HRESULT
    @lpVtbl.value.revoke.unsafe_as(Proc(UInt32, HRESULT)).call(in_notificationid)
  end
  def revoke_all : HRESULT
    @lpVtbl.value.revoke_all.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISideShowNotification
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_notification_id(out_pnotificationid : UInt32*) : HRESULT
    @lpVtbl.value.get_notification_id.unsafe_as(Proc(UInt32*, HRESULT)).call(out_pnotificationid)
  end
  def put_notification_id(in_notificationid : UInt32) : HRESULT
    @lpVtbl.value.put_notification_id.unsafe_as(Proc(UInt32, HRESULT)).call(in_notificationid)
  end
  def get_title(out_ppwsztitle : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(out_ppwsztitle)
  end
  def put_title(in_pwsztitle : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_title.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(in_pwsztitle)
  end
  def get_message(out_ppwszmessage : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(out_ppwszmessage)
  end
  def put_message(in_pwszmessage : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_message.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(in_pwszmessage)
  end
  def get_image(out_phicon : HANDLE*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(HANDLE*, HRESULT)).call(out_phicon)
  end
  def put_image(in_hicon : LibC::HANDLE) : HRESULT
    @lpVtbl.value.put_image.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(in_hicon)
  end
  def get_expiration_time(out_ptime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_expiration_time.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(out_ptime)
  end
  def put_expiration_time(in_ptime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.put_expiration_time.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(in_ptime)
  end
end
struct LibWin32::ISideShowContentManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add(in_picontent : ISideShowContent) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(ISideShowContent, HRESULT)).call(in_picontent)
  end
  def remove(in_contentid : UInt32) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(UInt32, HRESULT)).call(in_contentid)
  end
  def remove_all : HRESULT
    @lpVtbl.value.remove_all.unsafe_as(Proc(HRESULT)).call
  end
  def set_event_sink(in_pievents : ISideShowEvents) : HRESULT
    @lpVtbl.value.set_event_sink.unsafe_as(Proc(ISideShowEvents, HRESULT)).call(in_pievents)
  end
  def get_device_capabilities(out_ppcollection : ISideShowCapabilitiesCollection*) : HRESULT
    @lpVtbl.value.get_device_capabilities.unsafe_as(Proc(ISideShowCapabilitiesCollection*, HRESULT)).call(out_ppcollection)
  end
end
struct LibWin32::ISideShowContent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_content(in_picapabilities : ISideShowCapabilities, out_pdwsize : UInt32*, out_ppbdata : UInt8**) : HRESULT
    @lpVtbl.value.get_content.unsafe_as(Proc(ISideShowCapabilities, UInt32*, UInt8**, HRESULT)).call(in_picapabilities, out_pdwsize, out_ppbdata)
  end
  def get_content_id(out_pcontentid : UInt32*) : HRESULT
    @lpVtbl.value.get_content_id.unsafe_as(Proc(UInt32*, HRESULT)).call(out_pcontentid)
  end
  def get_differentiate_content(out_pfdifferentiatecontent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_differentiate_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(out_pfdifferentiatecontent)
  end
end
struct LibWin32::ISideShowEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def content_missing(in_contentid : UInt32, out_ppicontent : ISideShowContent*) : HRESULT
    @lpVtbl.value.content_missing.unsafe_as(Proc(UInt32, ISideShowContent*, HRESULT)).call(in_contentid, out_ppicontent)
  end
  def application_event(in_picapabilities : ISideShowCapabilities, in_dweventid : UInt32, in_dweventsize : UInt32, in_pbeventdata : UInt8*) : HRESULT
    @lpVtbl.value.application_event.unsafe_as(Proc(ISideShowCapabilities, UInt32, UInt32, UInt8*, HRESULT)).call(in_picapabilities, in_dweventid, in_dweventsize, in_pbeventdata)
  end
  def device_added(in_pidevice : ISideShowCapabilities) : HRESULT
    @lpVtbl.value.device_added.unsafe_as(Proc(ISideShowCapabilities, HRESULT)).call(in_pidevice)
  end
  def device_removed(in_pidevice : ISideShowCapabilities) : HRESULT
    @lpVtbl.value.device_removed.unsafe_as(Proc(ISideShowCapabilities, HRESULT)).call(in_pidevice)
  end
end
struct LibWin32::ISideShowCapabilities
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_capability(in_keycapability : PROPERTYKEY*, inout_pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_capability.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(in_keycapability, inout_pvalue)
  end
end
struct LibWin32::ISideShowCapabilitiesCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(out_pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(out_pdwcount)
  end
  def get_at(in_dwindex : UInt32, out_ppcapabilities : ISideShowCapabilities*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, ISideShowCapabilities*, HRESULT)).call(in_dwindex, out_ppcapabilities)
  end
end
struct LibWin32::ISideShowBulkCapabilities
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_capability(in_keycapability : PROPERTYKEY*, inout_pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_capability.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(in_keycapability, inout_pvalue)
  end
  def get_capabilities(in_keycollection : ISideShowKeyCollection, inout_pvalues : ISideShowPropVariantCollection*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(ISideShowKeyCollection, ISideShowPropVariantCollection*, HRESULT)).call(in_keycollection, inout_pvalues)
  end
end
struct LibWin32::ISideShowKeyCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add(key : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(key)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def get_at(dwindex : UInt32, pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, PROPERTYKEY*, HRESULT)).call(dwindex, pkey)
  end
  def get_count(pcelems : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcelems)
  end
  def remove_at(dwindex : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(dwindex)
  end
end
struct LibWin32::ISideShowPropVariantCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add(pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(pvalue)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def get_at(dwindex : UInt32, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, PROPVARIANT*, HRESULT)).call(dwindex, pvalue)
  end
  def get_count(pcelems : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcelems)
  end
  def remove_at(dwindex : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(dwindex)
  end
end
