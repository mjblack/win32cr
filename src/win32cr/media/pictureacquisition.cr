require "../system/com.cr"
require "../foundation.cr"
require "../graphics/gdi.cr"
require "../ui/shell/propertiessystem.cr"
require "../system/com/structuredstorage.cr"
require "../ui/windowsandmessaging.cr"

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
  PKEY_PhotoAcquire_RelativePathname = PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 2_u32)
  PKEY_PhotoAcquire_FinalFilename = PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 3_u32)
  PKEY_PhotoAcquire_GroupTag = PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 4_u32)
  PKEY_PhotoAcquire_TransferResult = PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 5_u32)
  PKEY_PhotoAcquire_OriginalFilename = PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 6_u32)
  PKEY_PhotoAcquire_CameraSequenceNumber = PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 7_u32)
  PKEY_PhotoAcquire_IntermediateFile = PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 8_u32)
  PKEY_PhotoAcquire_SkipImport = PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 9_u32)
  PKEY_PhotoAcquire_DuplicateDetectionID = PROPERTYKEY.new(LibC::GUID.new(0xf23377_u32, 0x7ac6_u16, 0x4b7a_u16, StaticArray[0x84_u8, 0x43_u8, 0x34_u8, 0x5e_u8, 0x73_u8, 0x1f_u8, 0xa5_u8, 0x7a_u8]), 10_u32)
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


  enum USER_INPUT_STRING_TYPE : Int32
    USER_INPUT_DEFAULT = 0
    USER_INPUT_PATH_ELEMENT = 1
  end

  enum ERROR_ADVISE_MESSAGE_TYPE : Int32
    PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL = 0
    PHOTOACQUIRE_ERROR_RETRYCANCEL = 1
    PHOTOACQUIRE_ERROR_YESNO = 2
    PHOTOACQUIRE_ERROR_OK = 3
  end

  enum ERROR_ADVISE_RESULT : Int32
    PHOTOACQUIRE_RESULT_YES = 0
    PHOTOACQUIRE_RESULT_NO = 1
    PHOTOACQUIRE_RESULT_OK = 2
    PHOTOACQUIRE_RESULT_SKIP = 3
    PHOTOACQUIRE_RESULT_SKIP_ALL = 4
    PHOTOACQUIRE_RESULT_RETRY = 5
    PHOTOACQUIRE_RESULT_ABORT = 6
  end

  enum PROGRESS_DIALOG_IMAGE_TYPE : Int32
    PROGRESS_DIALOG_ICON_SMALL = 0
    PROGRESS_DIALOG_ICON_LARGE = 1
    PROGRESS_DIALOG_ICON_THUMBNAIL = 2
    PROGRESS_DIALOG_BITMAP_THUMBNAIL = 3
  end

  enum PROGRESS_DIALOG_CHECKBOX_ID : Int32
    PROGRESS_DIALOG_CHECKBOX_ID_DEFAULT = 0
  end

  enum DEVICE_SELECTION_DEVICE_TYPE : Int32
    DST_UNKNOWN_DEVICE = 0
    DST_WPD_DEVICE = 1
    DST_WIA_DEVICE = 2
    DST_STI_DEVICE = 3
    DSF_TWAIN_DEVICE = 4
    DST_FS_DEVICE = 5
    DST_DV_DEVICE = 6
  end


  struct IPhotoAcquireItemVTbl
    query_interface : Proc(IPhotoAcquireItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoAcquireItem*, UInt32)
    release : Proc(IPhotoAcquireItem*, UInt32)
    get_item_name : Proc(IPhotoAcquireItem*, UInt8**, HRESULT)
    get_thumbnail : Proc(IPhotoAcquireItem*, SIZE, HBITMAP*, HRESULT)
    get_property : Proc(IPhotoAcquireItem*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    set_property : Proc(IPhotoAcquireItem*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    get_stream : Proc(IPhotoAcquireItem*, IStream*, HRESULT)
    can_delete : Proc(IPhotoAcquireItem*, LibC::BOOL*, HRESULT)
    delete : Proc(IPhotoAcquireItem*, HRESULT)
    get_sub_item_count : Proc(IPhotoAcquireItem*, UInt32*, HRESULT)
    get_sub_item_at : Proc(IPhotoAcquireItem*, UInt32, IPhotoAcquireItem*, HRESULT)
  end

  IPhotoAcquireItem_GUID = "00f21c97-28bf-4c02-b842-5e4e90139a30"
  IID_IPhotoAcquireItem = LibC::GUID.new(0xf21c97_u32, 0x28bf_u16, 0x4c02_u16, StaticArray[0xb8_u8, 0x42_u8, 0x5e_u8, 0x4e_u8, 0x90_u8, 0x13_u8, 0x9a_u8, 0x30_u8])
  struct IPhotoAcquireItem
    lpVtbl : IPhotoAcquireItemVTbl*
  end

  struct IUserInputStringVTbl
    query_interface : Proc(IUserInputString*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUserInputString*, UInt32)
    release : Proc(IUserInputString*, UInt32)
    get_submit_button_text : Proc(IUserInputString*, UInt8**, HRESULT)
    get_prompt : Proc(IUserInputString*, UInt8**, HRESULT)
    get_string_id : Proc(IUserInputString*, UInt8**, HRESULT)
    get_string_type : Proc(IUserInputString*, USER_INPUT_STRING_TYPE*, HRESULT)
    get_tooltip_text : Proc(IUserInputString*, UInt8**, HRESULT)
    get_max_length : Proc(IUserInputString*, UInt32*, HRESULT)
    get_default : Proc(IUserInputString*, UInt8**, HRESULT)
    get_mru_count : Proc(IUserInputString*, UInt32*, HRESULT)
    get_mru_entry_at : Proc(IUserInputString*, UInt32, UInt8**, HRESULT)
    get_image : Proc(IUserInputString*, UInt32, HBITMAP*, HANDLE*, HRESULT)
  end

  IUserInputString_GUID = "00f243a1-205b-45ba-ae26-abbc53aa7a6f"
  IID_IUserInputString = LibC::GUID.new(0xf243a1_u32, 0x205b_u16, 0x45ba_u16, StaticArray[0xae_u8, 0x26_u8, 0xab_u8, 0xbc_u8, 0x53_u8, 0xaa_u8, 0x7a_u8, 0x6f_u8])
  struct IUserInputString
    lpVtbl : IUserInputStringVTbl*
  end

  struct IPhotoAcquireProgressCBVTbl
    query_interface : Proc(IPhotoAcquireProgressCB*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoAcquireProgressCB*, UInt32)
    release : Proc(IPhotoAcquireProgressCB*, UInt32)
    cancelled : Proc(IPhotoAcquireProgressCB*, LibC::BOOL*, HRESULT)
    start_enumeration : Proc(IPhotoAcquireProgressCB*, IPhotoAcquireSource, HRESULT)
    found_item : Proc(IPhotoAcquireProgressCB*, IPhotoAcquireItem, HRESULT)
    end_enumeration : Proc(IPhotoAcquireProgressCB*, HRESULT, HRESULT)
    start_transfer : Proc(IPhotoAcquireProgressCB*, IPhotoAcquireSource, HRESULT)
    start_item_transfer : Proc(IPhotoAcquireProgressCB*, UInt32, IPhotoAcquireItem, HRESULT)
    directory_created : Proc(IPhotoAcquireProgressCB*, LibC::LPWSTR, HRESULT)
    update_transfer_percent : Proc(IPhotoAcquireProgressCB*, LibC::BOOL, UInt32, HRESULT)
    end_item_transfer : Proc(IPhotoAcquireProgressCB*, UInt32, IPhotoAcquireItem, HRESULT, HRESULT)
    end_transfer : Proc(IPhotoAcquireProgressCB*, HRESULT, HRESULT)
    start_delete : Proc(IPhotoAcquireProgressCB*, IPhotoAcquireSource, HRESULT)
    start_item_delete : Proc(IPhotoAcquireProgressCB*, UInt32, IPhotoAcquireItem, HRESULT)
    update_delete_percent : Proc(IPhotoAcquireProgressCB*, UInt32, HRESULT)
    end_item_delete : Proc(IPhotoAcquireProgressCB*, UInt32, IPhotoAcquireItem, HRESULT, HRESULT)
    end_delete : Proc(IPhotoAcquireProgressCB*, HRESULT, HRESULT)
    end_session : Proc(IPhotoAcquireProgressCB*, HRESULT, HRESULT)
    get_delete_after_acquire : Proc(IPhotoAcquireProgressCB*, LibC::BOOL*, HRESULT)
    error_advise : Proc(IPhotoAcquireProgressCB*, HRESULT, LibC::LPWSTR, ERROR_ADVISE_MESSAGE_TYPE, ERROR_ADVISE_RESULT*, HRESULT)
    get_user_input : Proc(IPhotoAcquireProgressCB*, Guid*, IUnknown, PROPVARIANT*, PROPVARIANT*, HRESULT)
  end

  IPhotoAcquireProgressCB_GUID = "00f2ce1e-935e-4248-892c-130f32c45cb4"
  IID_IPhotoAcquireProgressCB = LibC::GUID.new(0xf2ce1e_u32, 0x935e_u16, 0x4248_u16, StaticArray[0x89_u8, 0x2c_u8, 0x13_u8, 0xf_u8, 0x32_u8, 0xc4_u8, 0x5c_u8, 0xb4_u8])
  struct IPhotoAcquireProgressCB
    lpVtbl : IPhotoAcquireProgressCBVTbl*
  end

  struct IPhotoProgressActionCBVTbl
    query_interface : Proc(IPhotoProgressActionCB*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoProgressActionCB*, UInt32)
    release : Proc(IPhotoProgressActionCB*, UInt32)
    do_action : Proc(IPhotoProgressActionCB*, LibC::HANDLE, HRESULT)
  end

  IPhotoProgressActionCB_GUID = "00f242d0-b206-4e7d-b4c1-4755bcbb9c9f"
  IID_IPhotoProgressActionCB = LibC::GUID.new(0xf242d0_u32, 0xb206_u16, 0x4e7d_u16, StaticArray[0xb4_u8, 0xc1_u8, 0x47_u8, 0x55_u8, 0xbc_u8, 0xbb_u8, 0x9c_u8, 0x9f_u8])
  struct IPhotoProgressActionCB
    lpVtbl : IPhotoProgressActionCBVTbl*
  end

  struct IPhotoProgressDialogVTbl
    query_interface : Proc(IPhotoProgressDialog*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoProgressDialog*, UInt32)
    release : Proc(IPhotoProgressDialog*, UInt32)
    create : Proc(IPhotoProgressDialog*, LibC::HANDLE, HRESULT)
    get_window : Proc(IPhotoProgressDialog*, HANDLE*, HRESULT)
    destroy : Proc(IPhotoProgressDialog*, HRESULT)
    set_title : Proc(IPhotoProgressDialog*, LibC::LPWSTR, HRESULT)
    show_checkbox : Proc(IPhotoProgressDialog*, PROGRESS_DIALOG_CHECKBOX_ID, LibC::BOOL, HRESULT)
    set_checkbox_text : Proc(IPhotoProgressDialog*, PROGRESS_DIALOG_CHECKBOX_ID, LibC::LPWSTR, HRESULT)
    set_checkbox_check : Proc(IPhotoProgressDialog*, PROGRESS_DIALOG_CHECKBOX_ID, LibC::BOOL, HRESULT)
    set_checkbox_tooltip : Proc(IPhotoProgressDialog*, PROGRESS_DIALOG_CHECKBOX_ID, LibC::LPWSTR, HRESULT)
    is_checkbox_checked : Proc(IPhotoProgressDialog*, PROGRESS_DIALOG_CHECKBOX_ID, LibC::BOOL*, HRESULT)
    set_caption : Proc(IPhotoProgressDialog*, LibC::LPWSTR, HRESULT)
    set_image : Proc(IPhotoProgressDialog*, PROGRESS_DIALOG_IMAGE_TYPE, LibC::HANDLE, HBITMAP, HRESULT)
    set_percent_complete : Proc(IPhotoProgressDialog*, Int32, HRESULT)
    set_progress_text : Proc(IPhotoProgressDialog*, LibC::LPWSTR, HRESULT)
    set_action_link_callback : Proc(IPhotoProgressDialog*, IPhotoProgressActionCB, HRESULT)
    set_action_link_text : Proc(IPhotoProgressDialog*, LibC::LPWSTR, HRESULT)
    show_action_link : Proc(IPhotoProgressDialog*, LibC::BOOL, HRESULT)
    is_cancelled : Proc(IPhotoProgressDialog*, LibC::BOOL*, HRESULT)
    get_user_input : Proc(IPhotoProgressDialog*, Guid*, IUnknown, PROPVARIANT*, PROPVARIANT*, HRESULT)
  end

  IPhotoProgressDialog_GUID = "00f246f9-0750-4f08-9381-2cd8e906a4ae"
  IID_IPhotoProgressDialog = LibC::GUID.new(0xf246f9_u32, 0x750_u16, 0x4f08_u16, StaticArray[0x93_u8, 0x81_u8, 0x2c_u8, 0xd8_u8, 0xe9_u8, 0x6_u8, 0xa4_u8, 0xae_u8])
  struct IPhotoProgressDialog
    lpVtbl : IPhotoProgressDialogVTbl*
  end

  struct IPhotoAcquireSourceVTbl
    query_interface : Proc(IPhotoAcquireSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoAcquireSource*, UInt32)
    release : Proc(IPhotoAcquireSource*, UInt32)
    get_friendly_name : Proc(IPhotoAcquireSource*, UInt8**, HRESULT)
    get_device_icons : Proc(IPhotoAcquireSource*, UInt32, HANDLE*, HANDLE*, HRESULT)
    initialize_item_list : Proc(IPhotoAcquireSource*, LibC::BOOL, IPhotoAcquireProgressCB, UInt32*, HRESULT)
    get_item_count : Proc(IPhotoAcquireSource*, UInt32*, HRESULT)
    get_item_at : Proc(IPhotoAcquireSource*, UInt32, IPhotoAcquireItem*, HRESULT)
    get_photo_acquire_settings : Proc(IPhotoAcquireSource*, IPhotoAcquireSettings*, HRESULT)
    get_device_id : Proc(IPhotoAcquireSource*, UInt8**, HRESULT)
    bind_to_object : Proc(IPhotoAcquireSource*, Guid*, Void**, HRESULT)
  end

  IPhotoAcquireSource_GUID = "00f2c703-8613-4282-a53b-6ec59c5883ac"
  IID_IPhotoAcquireSource = LibC::GUID.new(0xf2c703_u32, 0x8613_u16, 0x4282_u16, StaticArray[0xa5_u8, 0x3b_u8, 0x6e_u8, 0xc5_u8, 0x9c_u8, 0x58_u8, 0x83_u8, 0xac_u8])
  struct IPhotoAcquireSource
    lpVtbl : IPhotoAcquireSourceVTbl*
  end

  struct IPhotoAcquireVTbl
    query_interface : Proc(IPhotoAcquire*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoAcquire*, UInt32)
    release : Proc(IPhotoAcquire*, UInt32)
    create_photo_source : Proc(IPhotoAcquire*, LibC::LPWSTR, IPhotoAcquireSource*, HRESULT)
    acquire : Proc(IPhotoAcquire*, IPhotoAcquireSource, LibC::BOOL, LibC::HANDLE, LibC::LPWSTR, IPhotoAcquireProgressCB, HRESULT)
    enum_results : Proc(IPhotoAcquire*, IEnumString*, HRESULT)
  end

  IPhotoAcquire_GUID = "00f23353-e31b-4955-a8ad-ca5ebf31e2ce"
  IID_IPhotoAcquire = LibC::GUID.new(0xf23353_u32, 0xe31b_u16, 0x4955_u16, StaticArray[0xa8_u8, 0xad_u8, 0xca_u8, 0x5e_u8, 0xbf_u8, 0x31_u8, 0xe2_u8, 0xce_u8])
  struct IPhotoAcquire
    lpVtbl : IPhotoAcquireVTbl*
  end

  struct IPhotoAcquireSettingsVTbl
    query_interface : Proc(IPhotoAcquireSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoAcquireSettings*, UInt32)
    release : Proc(IPhotoAcquireSettings*, UInt32)
    initialize_from_registry : Proc(IPhotoAcquireSettings*, LibC::LPWSTR, HRESULT)
    set_flags : Proc(IPhotoAcquireSettings*, UInt32, HRESULT)
    set_output_filename_template : Proc(IPhotoAcquireSettings*, LibC::LPWSTR, HRESULT)
    set_sequence_padding_width : Proc(IPhotoAcquireSettings*, UInt32, HRESULT)
    set_sequence_zero_padding : Proc(IPhotoAcquireSettings*, LibC::BOOL, HRESULT)
    set_group_tag : Proc(IPhotoAcquireSettings*, LibC::LPWSTR, HRESULT)
    set_acquisition_time : Proc(IPhotoAcquireSettings*, FILETIME*, HRESULT)
    get_flags : Proc(IPhotoAcquireSettings*, UInt32*, HRESULT)
    get_output_filename_template : Proc(IPhotoAcquireSettings*, UInt8**, HRESULT)
    get_sequence_padding_width : Proc(IPhotoAcquireSettings*, UInt32*, HRESULT)
    get_sequence_zero_padding : Proc(IPhotoAcquireSettings*, LibC::BOOL*, HRESULT)
    get_group_tag : Proc(IPhotoAcquireSettings*, UInt8**, HRESULT)
    get_acquisition_time : Proc(IPhotoAcquireSettings*, FILETIME*, HRESULT)
  end

  IPhotoAcquireSettings_GUID = "00f2b868-dd67-487c-9553-049240767e91"
  IID_IPhotoAcquireSettings = LibC::GUID.new(0xf2b868_u32, 0xdd67_u16, 0x487c_u16, StaticArray[0x95_u8, 0x53_u8, 0x4_u8, 0x92_u8, 0x40_u8, 0x76_u8, 0x7e_u8, 0x91_u8])
  struct IPhotoAcquireSettings
    lpVtbl : IPhotoAcquireSettingsVTbl*
  end

  struct IPhotoAcquireOptionsDialogVTbl
    query_interface : Proc(IPhotoAcquireOptionsDialog*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoAcquireOptionsDialog*, UInt32)
    release : Proc(IPhotoAcquireOptionsDialog*, UInt32)
    initialize : Proc(IPhotoAcquireOptionsDialog*, LibC::LPWSTR, HRESULT)
    create : Proc(IPhotoAcquireOptionsDialog*, LibC::HANDLE, HANDLE*, HRESULT)
    destroy : Proc(IPhotoAcquireOptionsDialog*, HRESULT)
    do_modal : Proc(IPhotoAcquireOptionsDialog*, LibC::HANDLE, LibC::IntPtrT*, HRESULT)
    save_data : Proc(IPhotoAcquireOptionsDialog*, HRESULT)
  end

  IPhotoAcquireOptionsDialog_GUID = "00f2b3ee-bf64-47ee-89f4-4dedd79643f2"
  IID_IPhotoAcquireOptionsDialog = LibC::GUID.new(0xf2b3ee_u32, 0xbf64_u16, 0x47ee_u16, StaticArray[0x89_u8, 0xf4_u8, 0x4d_u8, 0xed_u8, 0xd7_u8, 0x96_u8, 0x43_u8, 0xf2_u8])
  struct IPhotoAcquireOptionsDialog
    lpVtbl : IPhotoAcquireOptionsDialogVTbl*
  end

  struct IPhotoAcquireDeviceSelectionDialogVTbl
    query_interface : Proc(IPhotoAcquireDeviceSelectionDialog*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoAcquireDeviceSelectionDialog*, UInt32)
    release : Proc(IPhotoAcquireDeviceSelectionDialog*, UInt32)
    set_title : Proc(IPhotoAcquireDeviceSelectionDialog*, LibC::LPWSTR, HRESULT)
    set_submit_button_text : Proc(IPhotoAcquireDeviceSelectionDialog*, LibC::LPWSTR, HRESULT)
    do_modal : Proc(IPhotoAcquireDeviceSelectionDialog*, LibC::HANDLE, UInt32, UInt8**, DEVICE_SELECTION_DEVICE_TYPE*, HRESULT)
  end

  IPhotoAcquireDeviceSelectionDialog_GUID = "00f28837-55dd-4f37-aaf5-6855a9640467"
  IID_IPhotoAcquireDeviceSelectionDialog = LibC::GUID.new(0xf28837_u32, 0x55dd_u16, 0x4f37_u16, StaticArray[0xaa_u8, 0xf5_u8, 0x68_u8, 0x55_u8, 0xa9_u8, 0x64_u8, 0x4_u8, 0x67_u8])
  struct IPhotoAcquireDeviceSelectionDialog
    lpVtbl : IPhotoAcquireDeviceSelectionDialogVTbl*
  end

  struct IPhotoAcquirePluginVTbl
    query_interface : Proc(IPhotoAcquirePlugin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhotoAcquirePlugin*, UInt32)
    release : Proc(IPhotoAcquirePlugin*, UInt32)
    initialize : Proc(IPhotoAcquirePlugin*, IPhotoAcquireSource, IPhotoAcquireProgressCB, HRESULT)
    process_item : Proc(IPhotoAcquirePlugin*, UInt32, IPhotoAcquireItem, IStream, LibC::LPWSTR, IPropertyStore, HRESULT)
    transfer_complete : Proc(IPhotoAcquirePlugin*, HRESULT, HRESULT)
    display_configure_dialog : Proc(IPhotoAcquirePlugin*, LibC::HANDLE, HRESULT)
  end

  IPhotoAcquirePlugin_GUID = "00f2dceb-ecb8-4f77-8e47-e7a987c83dd0"
  IID_IPhotoAcquirePlugin = LibC::GUID.new(0xf2dceb_u32, 0xecb8_u16, 0x4f77_u16, StaticArray[0x8e_u8, 0x47_u8, 0xe7_u8, 0xa9_u8, 0x87_u8, 0xc8_u8, 0x3d_u8, 0xd0_u8])
  struct IPhotoAcquirePlugin
    lpVtbl : IPhotoAcquirePluginVTbl*
  end

end