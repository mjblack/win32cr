require "./../system/com.cr"
require "./../foundation.cr"
require "./../graphics/gdi.cr"
require "./../ui/shell/properties_system.cr"
require "./../system/com/structured_storage.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::Media::PictureAcquisition
  PKEY_PhotoAcquire_RelativePathname = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 2_u32)
  PKEY_PhotoAcquire_FinalFilename = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 3_u32)
  PKEY_PhotoAcquire_GroupTag = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 4_u32)
  PKEY_PhotoAcquire_TransferResult = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 5_u32)
  PKEY_PhotoAcquire_OriginalFilename = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 6_u32)
  PKEY_PhotoAcquire_CameraSequenceNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 7_u32)
  PKEY_PhotoAcquire_IntermediateFile = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 8_u32)
  PKEY_PhotoAcquire_SkipImport = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 9_u32)
  PKEY_PhotoAcquire_DuplicateDetectionID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 10_u32)
  PROGRESS_INDETERMINATE = -1_i32
  PHOTOACQ_ERROR_RESTART_REQUIRED = -2147180543_i32
  PHOTOACQ_RUN_DEFAULT = 0_u32
  PHOTOACQ_NO_GALLERY_LAUNCH = 1_u32
  PHOTOACQ_DISABLE_AUTO_ROTATE = 2_u32
  PHOTOACQ_DISABLE_PLUGINS = 4_u32
  PHOTOACQ_DISABLE_GROUP_TAG_PROMPT = 8_u32
  PHOTOACQ_DISABLE_DB_INTEGRATION = 16_u32
  PHOTOACQ_DELETE_AFTER_ACQUIRE = 32_u32
  PHOTOACQ_DISABLE_DUPLICATE_DETECTION = 64_u32
  PHOTOACQ_ENABLE_THUMBNAIL_CACHING = 128_u32
  PHOTOACQ_DISABLE_METADATA_WRITE = 256_u32
  PHOTOACQ_DISABLE_THUMBNAIL_PROGRESS = 512_u32
  PHOTOACQ_DISABLE_SETTINGS_LINK = 1024_u32
  PHOTOACQ_ABORT_ON_SETTINGS_UPDATE = 2048_u32
  PHOTOACQ_IMPORT_VIDEO_AS_MULTIPLE_FILES = 4096_u32
  DSF_WPD_DEVICES = 1_u32
  DSF_WIA_CAMERAS = 2_u32
  DSF_WIA_SCANNERS = 4_u32
  DSF_STI_DEVICES = 8_u32
  DSF_TWAIN_DEVICES = 16_u32
  DSF_FS_DEVICES = 32_u32
  DSF_DV_DEVICES = 64_u32
  DSF_ALL_DEVICES = 65535_u32
  DSF_CPL_MODE = 65536_u32
  DSF_SHOW_OFFLINE = 131072_u32
  PAPS_PRESAVE = 0_u32
  PAPS_POSTSAVE = 1_u32
  PAPS_CLEANUP = 2_u32

  CLSID_PhotoAcquire = LibC::GUID.new(0xf26e02_u32, 0xe9f2_u16, 0x4a9f_u16, StaticArray[0x9f_u8, 0xdd_u8, 0x5a_u8, 0x96_u8, 0x2f_u8, 0xb2_u8, 0x6a_u8, 0x98_u8])

  CLSID_PhotoAcquireAutoPlayDropTarget = LibC::GUID.new(0xf20eb5_u32, 0x8fd6_u16, 0x4d9d_u16, StaticArray[0xb7_u8, 0x5e_u8, 0x36_u8, 0x80_u8, 0x17_u8, 0x66_u8, 0xc8_u8, 0xf1_u8])

  CLSID_PhotoAcquireAutoPlayHWEventHandler = LibC::GUID.new(0xf2b433_u32, 0x44e4_u16, 0x4d88_u16, StaticArray[0xb2_u8, 0xb0_u8, 0x26_u8, 0x98_u8, 0xa0_u8, 0xa9_u8, 0x1d_u8, 0xba_u8])

  CLSID_PhotoAcquireOptionsDialog = LibC::GUID.new(0xf210a1_u32, 0x62f0_u16, 0x438b_u16, StaticArray[0x9f_u8, 0x7e_u8, 0x96_u8, 0x18_u8, 0xd7_u8, 0x2a_u8, 0x18_u8, 0x31_u8])

  CLSID_PhotoProgressDialog = LibC::GUID.new(0xf24ca0_u32, 0x748f_u16, 0x4e8a_u16, StaticArray[0x89_u8, 0x4f_u8, 0xe_u8, 0x3_u8, 0x57_u8, 0xc6_u8, 0x79_u8, 0x9f_u8])

  CLSID_PhotoAcquireDeviceSelectionDialog = LibC::GUID.new(0xf29a34_u32, 0xb8a1_u16, 0x482c_u16, StaticArray[0xbc_u8, 0xf8_u8, 0x3a_u8, 0xc7_u8, 0xb0_u8, 0xfe_u8, 0x8f_u8, 0x62_u8])

  enum USER_INPUT_STRING_TYPE
    USER_INPUT_DEFAULT = 0_i32
    USER_INPUT_PATH_ELEMENT = 1_i32
  end
  enum ERROR_ADVISE_MESSAGE_TYPE
    PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL = 0_i32
    PHOTOACQUIRE_ERROR_RETRYCANCEL = 1_i32
    PHOTOACQUIRE_ERROR_YESNO = 2_i32
    PHOTOACQUIRE_ERROR_OK = 3_i32
  end
  enum ERROR_ADVISE_RESULT
    PHOTOACQUIRE_RESULT_YES = 0_i32
    PHOTOACQUIRE_RESULT_NO = 1_i32
    PHOTOACQUIRE_RESULT_OK = 2_i32
    PHOTOACQUIRE_RESULT_SKIP = 3_i32
    PHOTOACQUIRE_RESULT_SKIP_ALL = 4_i32
    PHOTOACQUIRE_RESULT_RETRY = 5_i32
    PHOTOACQUIRE_RESULT_ABORT = 6_i32
  end
  enum PROGRESS_DIALOG_IMAGE_TYPE
    PROGRESS_DIALOG_ICON_SMALL = 0_i32
    PROGRESS_DIALOG_ICON_LARGE = 1_i32
    PROGRESS_DIALOG_ICON_THUMBNAIL = 2_i32
    PROGRESS_DIALOG_BITMAP_THUMBNAIL = 3_i32
  end
  enum PROGRESS_DIALOG_CHECKBOX_ID
    PROGRESS_DIALOG_CHECKBOX_ID_DEFAULT = 0_i32
  end
  enum DEVICE_SELECTION_DEVICE_TYPE
    DST_UNKNOWN_DEVICE = 0_i32
    DST_WPD_DEVICE = 1_i32
    DST_WIA_DEVICE = 2_i32
    DST_STI_DEVICE = 3_i32
    DSF_TWAIN_DEVICE = 4_i32
    DST_FS_DEVICE = 5_i32
    DST_DV_DEVICE = 6_i32
  end

  @[Extern]
  record IPhotoAcquireItemVtbl,
    query_interface : Proc(IPhotoAcquireItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoAcquireItem*, UInt32),
    release : Proc(IPhotoAcquireItem*, UInt32),
    get_item_name : Proc(IPhotoAcquireItem*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_thumbnail : Proc(IPhotoAcquireItem*, Win32cr::Foundation::SIZE, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IPhotoAcquireItem*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IPhotoAcquireItem*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IPhotoAcquireItem*, Void**, Win32cr::Foundation::HRESULT),
    can_delete : Proc(IPhotoAcquireItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    delete : Proc(IPhotoAcquireItem*, Win32cr::Foundation::HRESULT),
    get_sub_item_count : Proc(IPhotoAcquireItem*, UInt32*, Win32cr::Foundation::HRESULT),
    get_sub_item_at : Proc(IPhotoAcquireItem*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoAcquireItem, lpVtbl : IPhotoAcquireItemVtbl* do
    GUID = LibC::GUID.new(0xf21c97_u32, 0x28bf_u16, 0x4c02_u16, StaticArray[0xb8_u8, 0x42_u8, 0x5e_u8, 0x4e_u8, 0x90_u8, 0x13_u8, 0x9a_u8, 0x30_u8])
    def query_interface(this : IPhotoAcquireItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoAcquireItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoAcquireItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_name(this : IPhotoAcquireItem*, pbstrItemName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_name.call(this, pbstrItemName)
    end
    def get_thumbnail(this : IPhotoAcquireItem*, sizeThumbnail : Win32cr::Foundation::SIZE, phbmpThumbnail : Win32cr::Graphics::Gdi::HBITMAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thumbnail.call(this, sizeThumbnail, phbmpThumbnail)
    end
    def get_property(this : IPhotoAcquireItem*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pv : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, key, pv)
    end
    def set_property(this : IPhotoAcquireItem*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pv : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, key, pv)
    end
    def get_stream(this : IPhotoAcquireItem*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, ppStream)
    end
    def can_delete(this : IPhotoAcquireItem*, pfCanDelete : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_delete.call(this, pfCanDelete)
    end
    def delete(this : IPhotoAcquireItem*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_sub_item_count(this : IPhotoAcquireItem*, pnCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sub_item_count.call(this, pnCount)
    end
    def get_sub_item_at(this : IPhotoAcquireItem*, nItemIndex : UInt32, ppPhotoAcquireItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sub_item_at.call(this, nItemIndex, ppPhotoAcquireItem)
    end

  end

  @[Extern]
  record IUserInputStringVtbl,
    query_interface : Proc(IUserInputString*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUserInputString*, UInt32),
    release : Proc(IUserInputString*, UInt32),
    get_submit_button_text : Proc(IUserInputString*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_prompt : Proc(IUserInputString*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_string_id : Proc(IUserInputString*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_string_type : Proc(IUserInputString*, Win32cr::Media::PictureAcquisition::USER_INPUT_STRING_TYPE*, Win32cr::Foundation::HRESULT),
    get_tooltip_text : Proc(IUserInputString*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_max_length : Proc(IUserInputString*, UInt32*, Win32cr::Foundation::HRESULT),
    get_default : Proc(IUserInputString*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_mru_count : Proc(IUserInputString*, UInt32*, Win32cr::Foundation::HRESULT),
    get_mru_entry_at : Proc(IUserInputString*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_image : Proc(IUserInputString*, UInt32, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::UI::WindowsAndMessaging::HICON*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUserInputString, lpVtbl : IUserInputStringVtbl* do
    GUID = LibC::GUID.new(0xf243a1_u32, 0x205b_u16, 0x45ba_u16, StaticArray[0xae_u8, 0x26_u8, 0xab_u8, 0xbc_u8, 0x53_u8, 0xaa_u8, 0x7a_u8, 0x6f_u8])
    def query_interface(this : IUserInputString*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUserInputString*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUserInputString*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_submit_button_text(this : IUserInputString*, pbstrSubmitButtonText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_submit_button_text.call(this, pbstrSubmitButtonText)
    end
    def get_prompt(this : IUserInputString*, pbstrPromptTitle : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prompt.call(this, pbstrPromptTitle)
    end
    def get_string_id(this : IUserInputString*, pbstrStringId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_id.call(this, pbstrStringId)
    end
    def get_string_type(this : IUserInputString*, pnStringType : Win32cr::Media::PictureAcquisition::USER_INPUT_STRING_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_type.call(this, pnStringType)
    end
    def get_tooltip_text(this : IUserInputString*, pbstrTooltipText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tooltip_text.call(this, pbstrTooltipText)
    end
    def get_max_length(this : IUserInputString*, pcchMaxLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_length.call(this, pcchMaxLength)
    end
    def get_default(this : IUserInputString*, pbstrDefault : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default.call(this, pbstrDefault)
    end
    def get_mru_count(this : IUserInputString*, pnMruCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mru_count.call(this, pnMruCount)
    end
    def get_mru_entry_at(this : IUserInputString*, nIndex : UInt32, pbstrMruEntry : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mru_entry_at.call(this, nIndex, pbstrMruEntry)
    end
    def get_image(this : IUserInputString*, nSize : UInt32, phBitmap : Win32cr::Graphics::Gdi::HBITMAP*, phIcon : Win32cr::UI::WindowsAndMessaging::HICON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_image.call(this, nSize, phBitmap, phIcon)
    end

  end

  @[Extern]
  record IPhotoAcquireProgressCBVtbl,
    query_interface : Proc(IPhotoAcquireProgressCB*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoAcquireProgressCB*, UInt32),
    release : Proc(IPhotoAcquireProgressCB*, UInt32),
    cancelled : Proc(IPhotoAcquireProgressCB*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    start_enumeration : Proc(IPhotoAcquireProgressCB*, Void*, Win32cr::Foundation::HRESULT),
    found_item : Proc(IPhotoAcquireProgressCB*, Void*, Win32cr::Foundation::HRESULT),
    end_enumeration : Proc(IPhotoAcquireProgressCB*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    start_transfer : Proc(IPhotoAcquireProgressCB*, Void*, Win32cr::Foundation::HRESULT),
    start_item_transfer : Proc(IPhotoAcquireProgressCB*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    directory_created : Proc(IPhotoAcquireProgressCB*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    update_transfer_percent : Proc(IPhotoAcquireProgressCB*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::HRESULT),
    end_item_transfer : Proc(IPhotoAcquireProgressCB*, UInt32, Void*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    end_transfer : Proc(IPhotoAcquireProgressCB*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    start_delete : Proc(IPhotoAcquireProgressCB*, Void*, Win32cr::Foundation::HRESULT),
    start_item_delete : Proc(IPhotoAcquireProgressCB*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    update_delete_percent : Proc(IPhotoAcquireProgressCB*, UInt32, Win32cr::Foundation::HRESULT),
    end_item_delete : Proc(IPhotoAcquireProgressCB*, UInt32, Void*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    end_delete : Proc(IPhotoAcquireProgressCB*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    end_session : Proc(IPhotoAcquireProgressCB*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    get_delete_after_acquire : Proc(IPhotoAcquireProgressCB*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    error_advise : Proc(IPhotoAcquireProgressCB*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Win32cr::Media::PictureAcquisition::ERROR_ADVISE_MESSAGE_TYPE, Win32cr::Media::PictureAcquisition::ERROR_ADVISE_RESULT*, Win32cr::Foundation::HRESULT),
    get_user_input : Proc(IPhotoAcquireProgressCB*, LibC::GUID*, Void*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoAcquireProgressCB, lpVtbl : IPhotoAcquireProgressCBVtbl* do
    GUID = LibC::GUID.new(0xf2ce1e_u32, 0x935e_u16, 0x4248_u16, StaticArray[0x89_u8, 0x2c_u8, 0x13_u8, 0xf_u8, 0x32_u8, 0xc4_u8, 0x5c_u8, 0xb4_u8])
    def query_interface(this : IPhotoAcquireProgressCB*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoAcquireProgressCB*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoAcquireProgressCB*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cancelled(this : IPhotoAcquireProgressCB*, pfCancelled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancelled.call(this, pfCancelled)
    end
    def start_enumeration(this : IPhotoAcquireProgressCB*, pPhotoAcquireSource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_enumeration.call(this, pPhotoAcquireSource)
    end
    def found_item(this : IPhotoAcquireProgressCB*, pPhotoAcquireItem : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.found_item.call(this, pPhotoAcquireItem)
    end
    def end_enumeration(this : IPhotoAcquireProgressCB*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_enumeration.call(this, hr)
    end
    def start_transfer(this : IPhotoAcquireProgressCB*, pPhotoAcquireSource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_transfer.call(this, pPhotoAcquireSource)
    end
    def start_item_transfer(this : IPhotoAcquireProgressCB*, nItemIndex : UInt32, pPhotoAcquireItem : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_item_transfer.call(this, nItemIndex, pPhotoAcquireItem)
    end
    def directory_created(this : IPhotoAcquireProgressCB*, pszDirectory : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.directory_created.call(this, pszDirectory)
    end
    def update_transfer_percent(this : IPhotoAcquireProgressCB*, fOverall : Win32cr::Foundation::BOOL, nPercent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_transfer_percent.call(this, fOverall, nPercent)
    end
    def end_item_transfer(this : IPhotoAcquireProgressCB*, nItemIndex : UInt32, pPhotoAcquireItem : Void*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_item_transfer.call(this, nItemIndex, pPhotoAcquireItem, hr)
    end
    def end_transfer(this : IPhotoAcquireProgressCB*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_transfer.call(this, hr)
    end
    def start_delete(this : IPhotoAcquireProgressCB*, pPhotoAcquireSource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_delete.call(this, pPhotoAcquireSource)
    end
    def start_item_delete(this : IPhotoAcquireProgressCB*, nItemIndex : UInt32, pPhotoAcquireItem : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_item_delete.call(this, nItemIndex, pPhotoAcquireItem)
    end
    def update_delete_percent(this : IPhotoAcquireProgressCB*, nPercent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_delete_percent.call(this, nPercent)
    end
    def end_item_delete(this : IPhotoAcquireProgressCB*, nItemIndex : UInt32, pPhotoAcquireItem : Void*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_item_delete.call(this, nItemIndex, pPhotoAcquireItem, hr)
    end
    def end_delete(this : IPhotoAcquireProgressCB*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_delete.call(this, hr)
    end
    def end_session(this : IPhotoAcquireProgressCB*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_session.call(this, hr)
    end
    def get_delete_after_acquire(this : IPhotoAcquireProgressCB*, pfDeleteAfterAcquire : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_delete_after_acquire.call(this, pfDeleteAfterAcquire)
    end
    def error_advise(this : IPhotoAcquireProgressCB*, hr : Win32cr::Foundation::HRESULT, pszErrorMessage : Win32cr::Foundation::PWSTR, nMessageType : Win32cr::Media::PictureAcquisition::ERROR_ADVISE_MESSAGE_TYPE, pnErrorAdviseResult : Win32cr::Media::PictureAcquisition::ERROR_ADVISE_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.error_advise.call(this, hr, pszErrorMessage, nMessageType, pnErrorAdviseResult)
    end
    def get_user_input(this : IPhotoAcquireProgressCB*, riidType : LibC::GUID*, pUnknown : Void*, pPropVarResult : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pPropVarDefault : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_input.call(this, riidType, pUnknown, pPropVarResult, pPropVarDefault)
    end

  end

  @[Extern]
  record IPhotoProgressActionCBVtbl,
    query_interface : Proc(IPhotoProgressActionCB*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoProgressActionCB*, UInt32),
    release : Proc(IPhotoProgressActionCB*, UInt32),
    do_action : Proc(IPhotoProgressActionCB*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoProgressActionCB, lpVtbl : IPhotoProgressActionCBVtbl* do
    GUID = LibC::GUID.new(0xf242d0_u32, 0xb206_u16, 0x4e7d_u16, StaticArray[0xb4_u8, 0xc1_u8, 0x47_u8, 0x55_u8, 0xbc_u8, 0xbb_u8, 0x9c_u8, 0x9f_u8])
    def query_interface(this : IPhotoProgressActionCB*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoProgressActionCB*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoProgressActionCB*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def do_action(this : IPhotoProgressActionCB*, hWndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_action.call(this, hWndParent)
    end

  end

  @[Extern]
  record IPhotoProgressDialogVtbl,
    query_interface : Proc(IPhotoProgressDialog*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoProgressDialog*, UInt32),
    release : Proc(IPhotoProgressDialog*, UInt32),
    create : Proc(IPhotoProgressDialog*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    get_window : Proc(IPhotoProgressDialog*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    destroy : Proc(IPhotoProgressDialog*, Win32cr::Foundation::HRESULT),
    set_title : Proc(IPhotoProgressDialog*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    show_checkbox : Proc(IPhotoProgressDialog*, Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_checkbox_text : Proc(IPhotoProgressDialog*, Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_checkbox_check : Proc(IPhotoProgressDialog*, Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_checkbox_tooltip : Proc(IPhotoProgressDialog*, Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    is_checkbox_checked : Proc(IPhotoProgressDialog*, Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_caption : Proc(IPhotoProgressDialog*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_image : Proc(IPhotoProgressDialog*, Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_IMAGE_TYPE, Win32cr::UI::WindowsAndMessaging::HICON, Win32cr::Graphics::Gdi::HBITMAP, Win32cr::Foundation::HRESULT),
    set_percent_complete : Proc(IPhotoProgressDialog*, Int32, Win32cr::Foundation::HRESULT),
    set_progress_text : Proc(IPhotoProgressDialog*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_action_link_callback : Proc(IPhotoProgressDialog*, Void*, Win32cr::Foundation::HRESULT),
    set_action_link_text : Proc(IPhotoProgressDialog*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    show_action_link : Proc(IPhotoProgressDialog*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_cancelled : Proc(IPhotoProgressDialog*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_user_input : Proc(IPhotoProgressDialog*, LibC::GUID*, Void*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoProgressDialog, lpVtbl : IPhotoProgressDialogVtbl* do
    GUID = LibC::GUID.new(0xf246f9_u32, 0x750_u16, 0x4f08_u16, StaticArray[0x93_u8, 0x81_u8, 0x2c_u8, 0xd8_u8, 0xe9_u8, 0x6_u8, 0xa4_u8, 0xae_u8])
    def query_interface(this : IPhotoProgressDialog*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoProgressDialog*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoProgressDialog*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IPhotoProgressDialog*, hwndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, hwndParent)
    end
    def get_window(this : IPhotoProgressDialog*, phwndProgressDialog : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window.call(this, phwndProgressDialog)
    end
    def destroy(this : IPhotoProgressDialog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy.call(this)
    end
    def set_title(this : IPhotoProgressDialog*, pszTitle : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_title.call(this, pszTitle)
    end
    def show_checkbox(this : IPhotoProgressDialog*, nCheckboxId : Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_checkbox.call(this, nCheckboxId, fShow)
    end
    def set_checkbox_text(this : IPhotoProgressDialog*, nCheckboxId : Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, pszCheckboxText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_checkbox_text.call(this, nCheckboxId, pszCheckboxText)
    end
    def set_checkbox_check(this : IPhotoProgressDialog*, nCheckboxId : Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, fChecked : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_checkbox_check.call(this, nCheckboxId, fChecked)
    end
    def set_checkbox_tooltip(this : IPhotoProgressDialog*, nCheckboxId : Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, pszCheckboxTooltipText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_checkbox_tooltip.call(this, nCheckboxId, pszCheckboxTooltipText)
    end
    def is_checkbox_checked(this : IPhotoProgressDialog*, nCheckboxId : Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_CHECKBOX_ID, pfChecked : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_checkbox_checked.call(this, nCheckboxId, pfChecked)
    end
    def set_caption(this : IPhotoProgressDialog*, pszTitle : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_caption.call(this, pszTitle)
    end
    def set_image(this : IPhotoProgressDialog*, nImageType : Win32cr::Media::PictureAcquisition::PROGRESS_DIALOG_IMAGE_TYPE, hIcon : Win32cr::UI::WindowsAndMessaging::HICON, hBitmap : Win32cr::Graphics::Gdi::HBITMAP) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_image.call(this, nImageType, hIcon, hBitmap)
    end
    def set_percent_complete(this : IPhotoProgressDialog*, nPercent : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_percent_complete.call(this, nPercent)
    end
    def set_progress_text(this : IPhotoProgressDialog*, pszProgressText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_progress_text.call(this, pszProgressText)
    end
    def set_action_link_callback(this : IPhotoProgressDialog*, pPhotoProgressActionCB : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_action_link_callback.call(this, pPhotoProgressActionCB)
    end
    def set_action_link_text(this : IPhotoProgressDialog*, pszCaption : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_action_link_text.call(this, pszCaption)
    end
    def show_action_link(this : IPhotoProgressDialog*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_action_link.call(this, fShow)
    end
    def is_cancelled(this : IPhotoProgressDialog*, pfCancelled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_cancelled.call(this, pfCancelled)
    end
    def get_user_input(this : IPhotoProgressDialog*, riidType : LibC::GUID*, pUnknown : Void*, pPropVarResult : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pPropVarDefault : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_input.call(this, riidType, pUnknown, pPropVarResult, pPropVarDefault)
    end

  end

  @[Extern]
  record IPhotoAcquireSourceVtbl,
    query_interface : Proc(IPhotoAcquireSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoAcquireSource*, UInt32),
    release : Proc(IPhotoAcquireSource*, UInt32),
    get_friendly_name : Proc(IPhotoAcquireSource*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_device_icons : Proc(IPhotoAcquireSource*, UInt32, Win32cr::UI::WindowsAndMessaging::HICON*, Win32cr::UI::WindowsAndMessaging::HICON*, Win32cr::Foundation::HRESULT),
    initialize_item_list : Proc(IPhotoAcquireSource*, Win32cr::Foundation::BOOL, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_item_count : Proc(IPhotoAcquireSource*, UInt32*, Win32cr::Foundation::HRESULT),
    get_item_at : Proc(IPhotoAcquireSource*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_photo_acquire_settings : Proc(IPhotoAcquireSource*, Void**, Win32cr::Foundation::HRESULT),
    get_device_id : Proc(IPhotoAcquireSource*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    bind_to_object : Proc(IPhotoAcquireSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoAcquireSource, lpVtbl : IPhotoAcquireSourceVtbl* do
    GUID = LibC::GUID.new(0xf2c703_u32, 0x8613_u16, 0x4282_u16, StaticArray[0xa5_u8, 0x3b_u8, 0x6e_u8, 0xc5_u8, 0x9c_u8, 0x58_u8, 0x83_u8, 0xac_u8])
    def query_interface(this : IPhotoAcquireSource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoAcquireSource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoAcquireSource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_friendly_name(this : IPhotoAcquireSource*, pbstrFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, pbstrFriendlyName)
    end
    def get_device_icons(this : IPhotoAcquireSource*, nSize : UInt32, phLargeIcon : Win32cr::UI::WindowsAndMessaging::HICON*, phSmallIcon : Win32cr::UI::WindowsAndMessaging::HICON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_icons.call(this, nSize, phLargeIcon, phSmallIcon)
    end
    def initialize_item_list(this : IPhotoAcquireSource*, fForceEnumeration : Win32cr::Foundation::BOOL, pPhotoAcquireProgressCB : Void*, pnItemCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_item_list.call(this, fForceEnumeration, pPhotoAcquireProgressCB, pnItemCount)
    end
    def get_item_count(this : IPhotoAcquireSource*, pnItemCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_count.call(this, pnItemCount)
    end
    def get_item_at(this : IPhotoAcquireSource*, nIndex : UInt32, ppPhotoAcquireItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_at.call(this, nIndex, ppPhotoAcquireItem)
    end
    def get_photo_acquire_settings(this : IPhotoAcquireSource*, ppPhotoAcquireSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_photo_acquire_settings.call(this, ppPhotoAcquireSettings)
    end
    def get_device_id(this : IPhotoAcquireSource*, pbstrDeviceId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_id.call(this, pbstrDeviceId)
    end
    def bind_to_object(this : IPhotoAcquireSource*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_to_object.call(this, riid, ppv)
    end

  end

  @[Extern]
  record IPhotoAcquireVtbl,
    query_interface : Proc(IPhotoAcquire*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoAcquire*, UInt32),
    release : Proc(IPhotoAcquire*, UInt32),
    create_photo_source : Proc(IPhotoAcquire*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    acquire : Proc(IPhotoAcquire*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    enum_results : Proc(IPhotoAcquire*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoAcquire, lpVtbl : IPhotoAcquireVtbl* do
    GUID = LibC::GUID.new(0xf23353_u32, 0xe31b_u16, 0x4955_u16, StaticArray[0xa8_u8, 0xad_u8, 0xca_u8, 0x5e_u8, 0xbf_u8, 0x31_u8, 0xe2_u8, 0xce_u8])
    def query_interface(this : IPhotoAcquire*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoAcquire*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoAcquire*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_photo_source(this : IPhotoAcquire*, pszDevice : Win32cr::Foundation::PWSTR, ppPhotoAcquireSource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_photo_source.call(this, pszDevice, ppPhotoAcquireSource)
    end
    def acquire(this : IPhotoAcquire*, pPhotoAcquireSource : Void*, fShowProgress : Win32cr::Foundation::BOOL, hWndParent : Win32cr::Foundation::HWND, pszApplicationName : Win32cr::Foundation::PWSTR, pPhotoAcquireProgressCB : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire.call(this, pPhotoAcquireSource, fShowProgress, hWndParent, pszApplicationName, pPhotoAcquireProgressCB)
    end
    def enum_results(this : IPhotoAcquire*, ppEnumFilePaths : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_results.call(this, ppEnumFilePaths)
    end

  end

  @[Extern]
  record IPhotoAcquireSettingsVtbl,
    query_interface : Proc(IPhotoAcquireSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoAcquireSettings*, UInt32),
    release : Proc(IPhotoAcquireSettings*, UInt32),
    initialize_from_registry : Proc(IPhotoAcquireSettings*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_flags : Proc(IPhotoAcquireSettings*, UInt32, Win32cr::Foundation::HRESULT),
    set_output_filename_template : Proc(IPhotoAcquireSettings*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_sequence_padding_width : Proc(IPhotoAcquireSettings*, UInt32, Win32cr::Foundation::HRESULT),
    set_sequence_zero_padding : Proc(IPhotoAcquireSettings*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_group_tag : Proc(IPhotoAcquireSettings*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_acquisition_time : Proc(IPhotoAcquireSettings*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_flags : Proc(IPhotoAcquireSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_filename_template : Proc(IPhotoAcquireSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_sequence_padding_width : Proc(IPhotoAcquireSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_sequence_zero_padding : Proc(IPhotoAcquireSettings*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_group_tag : Proc(IPhotoAcquireSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_acquisition_time : Proc(IPhotoAcquireSettings*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoAcquireSettings, lpVtbl : IPhotoAcquireSettingsVtbl* do
    GUID = LibC::GUID.new(0xf2b868_u32, 0xdd67_u16, 0x487c_u16, StaticArray[0x95_u8, 0x53_u8, 0x4_u8, 0x92_u8, 0x40_u8, 0x76_u8, 0x7e_u8, 0x91_u8])
    def query_interface(this : IPhotoAcquireSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoAcquireSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoAcquireSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize_from_registry(this : IPhotoAcquireSettings*, pszRegistryKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_registry.call(this, pszRegistryKey)
    end
    def set_flags(this : IPhotoAcquireSettings*, dwPhotoAcquireFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, dwPhotoAcquireFlags)
    end
    def set_output_filename_template(this : IPhotoAcquireSettings*, pszTemplate : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_filename_template.call(this, pszTemplate)
    end
    def set_sequence_padding_width(this : IPhotoAcquireSettings*, dwWidth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sequence_padding_width.call(this, dwWidth)
    end
    def set_sequence_zero_padding(this : IPhotoAcquireSettings*, fZeroPad : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sequence_zero_padding.call(this, fZeroPad)
    end
    def set_group_tag(this : IPhotoAcquireSettings*, pszGroupTag : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_group_tag.call(this, pszGroupTag)
    end
    def set_acquisition_time(this : IPhotoAcquireSettings*, pftAcquisitionTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_acquisition_time.call(this, pftAcquisitionTime)
    end
    def get_flags(this : IPhotoAcquireSettings*, pdwPhotoAcquireFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pdwPhotoAcquireFlags)
    end
    def get_output_filename_template(this : IPhotoAcquireSettings*, pbstrTemplate : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_filename_template.call(this, pbstrTemplate)
    end
    def get_sequence_padding_width(this : IPhotoAcquireSettings*, pdwWidth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sequence_padding_width.call(this, pdwWidth)
    end
    def get_sequence_zero_padding(this : IPhotoAcquireSettings*, pfZeroPad : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sequence_zero_padding.call(this, pfZeroPad)
    end
    def get_group_tag(this : IPhotoAcquireSettings*, pbstrGroupTag : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_group_tag.call(this, pbstrGroupTag)
    end
    def get_acquisition_time(this : IPhotoAcquireSettings*, pftAcquisitionTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_acquisition_time.call(this, pftAcquisitionTime)
    end

  end

  @[Extern]
  record IPhotoAcquireOptionsDialogVtbl,
    query_interface : Proc(IPhotoAcquireOptionsDialog*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoAcquireOptionsDialog*, UInt32),
    release : Proc(IPhotoAcquireOptionsDialog*, UInt32),
    initialize__ : Proc(IPhotoAcquireOptionsDialog*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    create : Proc(IPhotoAcquireOptionsDialog*, Win32cr::Foundation::HWND, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    destroy : Proc(IPhotoAcquireOptionsDialog*, Win32cr::Foundation::HRESULT),
    do_modal : Proc(IPhotoAcquireOptionsDialog*, Win32cr::Foundation::HWND, LibC::IntPtrT*, Win32cr::Foundation::HRESULT),
    save_data : Proc(IPhotoAcquireOptionsDialog*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoAcquireOptionsDialog, lpVtbl : IPhotoAcquireOptionsDialogVtbl* do
    GUID = LibC::GUID.new(0xf2b3ee_u32, 0xbf64_u16, 0x47ee_u16, StaticArray[0x89_u8, 0xf4_u8, 0x4d_u8, 0xed_u8, 0xd7_u8, 0x96_u8, 0x43_u8, 0xf2_u8])
    def query_interface(this : IPhotoAcquireOptionsDialog*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoAcquireOptionsDialog*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoAcquireOptionsDialog*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IPhotoAcquireOptionsDialog*, pszRegistryRoot : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pszRegistryRoot)
    end
    def create(this : IPhotoAcquireOptionsDialog*, hWndParent : Win32cr::Foundation::HWND, phWndDialog : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, hWndParent, phWndDialog)
    end
    def destroy(this : IPhotoAcquireOptionsDialog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy.call(this)
    end
    def do_modal(this : IPhotoAcquireOptionsDialog*, hWndParent : Win32cr::Foundation::HWND, ppnReturnCode : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_modal.call(this, hWndParent, ppnReturnCode)
    end
    def save_data(this : IPhotoAcquireOptionsDialog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_data.call(this)
    end

  end

  @[Extern]
  record IPhotoAcquireDeviceSelectionDialogVtbl,
    query_interface : Proc(IPhotoAcquireDeviceSelectionDialog*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoAcquireDeviceSelectionDialog*, UInt32),
    release : Proc(IPhotoAcquireDeviceSelectionDialog*, UInt32),
    set_title : Proc(IPhotoAcquireDeviceSelectionDialog*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_submit_button_text : Proc(IPhotoAcquireDeviceSelectionDialog*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    do_modal : Proc(IPhotoAcquireDeviceSelectionDialog*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Media::PictureAcquisition::DEVICE_SELECTION_DEVICE_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoAcquireDeviceSelectionDialog, lpVtbl : IPhotoAcquireDeviceSelectionDialogVtbl* do
    GUID = LibC::GUID.new(0xf28837_u32, 0x55dd_u16, 0x4f37_u16, StaticArray[0xaa_u8, 0xf5_u8, 0x68_u8, 0x55_u8, 0xa9_u8, 0x64_u8, 0x4_u8, 0x67_u8])
    def query_interface(this : IPhotoAcquireDeviceSelectionDialog*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoAcquireDeviceSelectionDialog*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoAcquireDeviceSelectionDialog*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_title(this : IPhotoAcquireDeviceSelectionDialog*, pszTitle : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_title.call(this, pszTitle)
    end
    def set_submit_button_text(this : IPhotoAcquireDeviceSelectionDialog*, pszSubmitButtonText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_submit_button_text.call(this, pszSubmitButtonText)
    end
    def do_modal(this : IPhotoAcquireDeviceSelectionDialog*, hWndParent : Win32cr::Foundation::HWND, dwDeviceFlags : UInt32, pbstrDeviceId : Win32cr::Foundation::BSTR*, pnDeviceType : Win32cr::Media::PictureAcquisition::DEVICE_SELECTION_DEVICE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_modal.call(this, hWndParent, dwDeviceFlags, pbstrDeviceId, pnDeviceType)
    end

  end

  @[Extern]
  record IPhotoAcquirePluginVtbl,
    query_interface : Proc(IPhotoAcquirePlugin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhotoAcquirePlugin*, UInt32),
    release : Proc(IPhotoAcquirePlugin*, UInt32),
    initialize__ : Proc(IPhotoAcquirePlugin*, Void*, Void*, Win32cr::Foundation::HRESULT),
    process_item : Proc(IPhotoAcquirePlugin*, UInt32, Void*, Void*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    transfer_complete : Proc(IPhotoAcquirePlugin*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    display_configure_dialog : Proc(IPhotoAcquirePlugin*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhotoAcquirePlugin, lpVtbl : IPhotoAcquirePluginVtbl* do
    GUID = LibC::GUID.new(0xf2dceb_u32, 0xecb8_u16, 0x4f77_u16, StaticArray[0x8e_u8, 0x47_u8, 0xe7_u8, 0xa9_u8, 0x87_u8, 0xc8_u8, 0x3d_u8, 0xd0_u8])
    def query_interface(this : IPhotoAcquirePlugin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhotoAcquirePlugin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhotoAcquirePlugin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IPhotoAcquirePlugin*, pPhotoAcquireSource : Void*, pPhotoAcquireProgressCB : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pPhotoAcquireSource, pPhotoAcquireProgressCB)
    end
    def process_item(this : IPhotoAcquirePlugin*, dwAcquireStage : UInt32, pPhotoAcquireItem : Void*, pOriginalItemStream : Void*, pszFinalFilename : Win32cr::Foundation::PWSTR, pPropertyStore : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_item.call(this, dwAcquireStage, pPhotoAcquireItem, pOriginalItemStream, pszFinalFilename, pPropertyStore)
    end
    def transfer_complete(this : IPhotoAcquirePlugin*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_complete.call(this, hr)
    end
    def display_configure_dialog(this : IPhotoAcquirePlugin*, hWndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_configure_dialog.call(this, hWndParent)
    end

  end

end