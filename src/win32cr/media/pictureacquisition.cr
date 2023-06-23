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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_name : UInt64
    get_thumbnail : UInt64
    get_property : UInt64
    set_property : UInt64
    get_stream : UInt64
    can_delete : UInt64
    delete : UInt64
    get_sub_item_count : UInt64
    get_sub_item_at : UInt64
  end

  IPhotoAcquireItem_GUID = "00f21c97-28bf-4c02-b842-5e4e90139a30"
  IID_IPhotoAcquireItem = LibC::GUID.new(0xf21c97_u32, 0x28bf_u16, 0x4c02_u16, StaticArray[0xb8_u8, 0x42_u8, 0x5e_u8, 0x4e_u8, 0x90_u8, 0x13_u8, 0x9a_u8, 0x30_u8])
  struct IPhotoAcquireItem
    lpVtbl : IPhotoAcquireItemVTbl*
  end

  struct IUserInputStringVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_submit_button_text : UInt64
    get_prompt : UInt64
    get_string_id : UInt64
    get_string_type : UInt64
    get_tooltip_text : UInt64
    get_max_length : UInt64
    get_default : UInt64
    get_mru_count : UInt64
    get_mru_entry_at : UInt64
    get_image : UInt64
  end

  IUserInputString_GUID = "00f243a1-205b-45ba-ae26-abbc53aa7a6f"
  IID_IUserInputString = LibC::GUID.new(0xf243a1_u32, 0x205b_u16, 0x45ba_u16, StaticArray[0xae_u8, 0x26_u8, 0xab_u8, 0xbc_u8, 0x53_u8, 0xaa_u8, 0x7a_u8, 0x6f_u8])
  struct IUserInputString
    lpVtbl : IUserInputStringVTbl*
  end

  struct IPhotoAcquireProgressCBVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cancelled : UInt64
    start_enumeration : UInt64
    found_item : UInt64
    end_enumeration : UInt64
    start_transfer : UInt64
    start_item_transfer : UInt64
    directory_created : UInt64
    update_transfer_percent : UInt64
    end_item_transfer : UInt64
    end_transfer : UInt64
    start_delete : UInt64
    start_item_delete : UInt64
    update_delete_percent : UInt64
    end_item_delete : UInt64
    end_delete : UInt64
    end_session : UInt64
    get_delete_after_acquire : UInt64
    error_advise : UInt64
    get_user_input : UInt64
  end

  IPhotoAcquireProgressCB_GUID = "00f2ce1e-935e-4248-892c-130f32c45cb4"
  IID_IPhotoAcquireProgressCB = LibC::GUID.new(0xf2ce1e_u32, 0x935e_u16, 0x4248_u16, StaticArray[0x89_u8, 0x2c_u8, 0x13_u8, 0xf_u8, 0x32_u8, 0xc4_u8, 0x5c_u8, 0xb4_u8])
  struct IPhotoAcquireProgressCB
    lpVtbl : IPhotoAcquireProgressCBVTbl*
  end

  struct IPhotoProgressActionCBVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    do_action : UInt64
  end

  IPhotoProgressActionCB_GUID = "00f242d0-b206-4e7d-b4c1-4755bcbb9c9f"
  IID_IPhotoProgressActionCB = LibC::GUID.new(0xf242d0_u32, 0xb206_u16, 0x4e7d_u16, StaticArray[0xb4_u8, 0xc1_u8, 0x47_u8, 0x55_u8, 0xbc_u8, 0xbb_u8, 0x9c_u8, 0x9f_u8])
  struct IPhotoProgressActionCB
    lpVtbl : IPhotoProgressActionCBVTbl*
  end

  struct IPhotoProgressDialogVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
    get_window : UInt64
    destroy : UInt64
    set_title : UInt64
    show_checkbox : UInt64
    set_checkbox_text : UInt64
    set_checkbox_check : UInt64
    set_checkbox_tooltip : UInt64
    is_checkbox_checked : UInt64
    set_caption : UInt64
    set_image : UInt64
    set_percent_complete : UInt64
    set_progress_text : UInt64
    set_action_link_callback : UInt64
    set_action_link_text : UInt64
    show_action_link : UInt64
    is_cancelled : UInt64
    get_user_input : UInt64
  end

  IPhotoProgressDialog_GUID = "00f246f9-0750-4f08-9381-2cd8e906a4ae"
  IID_IPhotoProgressDialog = LibC::GUID.new(0xf246f9_u32, 0x750_u16, 0x4f08_u16, StaticArray[0x93_u8, 0x81_u8, 0x2c_u8, 0xd8_u8, 0xe9_u8, 0x6_u8, 0xa4_u8, 0xae_u8])
  struct IPhotoProgressDialog
    lpVtbl : IPhotoProgressDialogVTbl*
  end

  struct IPhotoAcquireSourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_friendly_name : UInt64
    get_device_icons : UInt64
    initialize_item_list : UInt64
    get_item_count : UInt64
    get_item_at : UInt64
    get_photo_acquire_settings : UInt64
    get_device_id : UInt64
    bind_to_object : UInt64
  end

  IPhotoAcquireSource_GUID = "00f2c703-8613-4282-a53b-6ec59c5883ac"
  IID_IPhotoAcquireSource = LibC::GUID.new(0xf2c703_u32, 0x8613_u16, 0x4282_u16, StaticArray[0xa5_u8, 0x3b_u8, 0x6e_u8, 0xc5_u8, 0x9c_u8, 0x58_u8, 0x83_u8, 0xac_u8])
  struct IPhotoAcquireSource
    lpVtbl : IPhotoAcquireSourceVTbl*
  end

  struct IPhotoAcquireVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_photo_source : UInt64
    acquire : UInt64
    enum_results : UInt64
  end

  IPhotoAcquire_GUID = "00f23353-e31b-4955-a8ad-ca5ebf31e2ce"
  IID_IPhotoAcquire = LibC::GUID.new(0xf23353_u32, 0xe31b_u16, 0x4955_u16, StaticArray[0xa8_u8, 0xad_u8, 0xca_u8, 0x5e_u8, 0xbf_u8, 0x31_u8, 0xe2_u8, 0xce_u8])
  struct IPhotoAcquire
    lpVtbl : IPhotoAcquireVTbl*
  end

  struct IPhotoAcquireSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize_from_registry : UInt64
    set_flags : UInt64
    set_output_filename_template : UInt64
    set_sequence_padding_width : UInt64
    set_sequence_zero_padding : UInt64
    set_group_tag : UInt64
    set_acquisition_time : UInt64
    get_flags : UInt64
    get_output_filename_template : UInt64
    get_sequence_padding_width : UInt64
    get_sequence_zero_padding : UInt64
    get_group_tag : UInt64
    get_acquisition_time : UInt64
  end

  IPhotoAcquireSettings_GUID = "00f2b868-dd67-487c-9553-049240767e91"
  IID_IPhotoAcquireSettings = LibC::GUID.new(0xf2b868_u32, 0xdd67_u16, 0x487c_u16, StaticArray[0x95_u8, 0x53_u8, 0x4_u8, 0x92_u8, 0x40_u8, 0x76_u8, 0x7e_u8, 0x91_u8])
  struct IPhotoAcquireSettings
    lpVtbl : IPhotoAcquireSettingsVTbl*
  end

  struct IPhotoAcquireOptionsDialogVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    create : UInt64
    destroy : UInt64
    do_modal : UInt64
    save_data : UInt64
  end

  IPhotoAcquireOptionsDialog_GUID = "00f2b3ee-bf64-47ee-89f4-4dedd79643f2"
  IID_IPhotoAcquireOptionsDialog = LibC::GUID.new(0xf2b3ee_u32, 0xbf64_u16, 0x47ee_u16, StaticArray[0x89_u8, 0xf4_u8, 0x4d_u8, 0xed_u8, 0xd7_u8, 0x96_u8, 0x43_u8, 0xf2_u8])
  struct IPhotoAcquireOptionsDialog
    lpVtbl : IPhotoAcquireOptionsDialogVTbl*
  end

  struct IPhotoAcquireDeviceSelectionDialogVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_title : UInt64
    set_submit_button_text : UInt64
    do_modal : UInt64
  end

  IPhotoAcquireDeviceSelectionDialog_GUID = "00f28837-55dd-4f37-aaf5-6855a9640467"
  IID_IPhotoAcquireDeviceSelectionDialog = LibC::GUID.new(0xf28837_u32, 0x55dd_u16, 0x4f37_u16, StaticArray[0xaa_u8, 0xf5_u8, 0x68_u8, 0x55_u8, 0xa9_u8, 0x64_u8, 0x4_u8, 0x67_u8])
  struct IPhotoAcquireDeviceSelectionDialog
    lpVtbl : IPhotoAcquireDeviceSelectionDialogVTbl*
  end

  struct IPhotoAcquirePluginVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    process_item : UInt64
    transfer_complete : UInt64
    display_configure_dialog : UInt64
  end

  IPhotoAcquirePlugin_GUID = "00f2dceb-ecb8-4f77-8e47-e7a987c83dd0"
  IID_IPhotoAcquirePlugin = LibC::GUID.new(0xf2dceb_u32, 0xecb8_u16, 0x4f77_u16, StaticArray[0x8e_u8, 0x47_u8, 0xe7_u8, 0xa9_u8, 0x87_u8, 0xc8_u8, 0x3d_u8, 0xd0_u8])
  struct IPhotoAcquirePlugin
    lpVtbl : IPhotoAcquirePluginVTbl*
  end

end
struct LibWin32::IPhotoAcquireItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_name(pbstritemname : UInt8**) : HRESULT
    @lpVtbl.value.get_item_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstritemname)
  end
  def get_thumbnail(sizethumbnail : SIZE, phbmpthumbnail : HBITMAP*) : HRESULT
    @lpVtbl.value.get_thumbnail.unsafe_as(Proc(SIZE, HBITMAP*, HRESULT)).call(sizethumbnail, phbmpthumbnail)
  end
  def get_property(key : PROPERTYKEY*, pv : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, pv)
  end
  def set_property(key : PROPERTYKEY*, pv : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, pv)
  end
  def get_stream(ppstream : IStream*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(IStream*, HRESULT)).call(ppstream)
  end
  def can_delete(pfcandelete : LibC::BOOL*) : HRESULT
    @lpVtbl.value.can_delete.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfcandelete)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_sub_item_count(pncount : UInt32*) : HRESULT
    @lpVtbl.value.get_sub_item_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pncount)
  end
  def get_sub_item_at(nitemindex : UInt32, ppphotoacquireitem : IPhotoAcquireItem*) : HRESULT
    @lpVtbl.value.get_sub_item_at.unsafe_as(Proc(UInt32, IPhotoAcquireItem*, HRESULT)).call(nitemindex, ppphotoacquireitem)
  end
end
struct LibWin32::IUserInputString
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_submit_button_text(pbstrsubmitbuttontext : UInt8**) : HRESULT
    @lpVtbl.value.get_submit_button_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubmitbuttontext)
  end
  def get_prompt(pbstrprompttitle : UInt8**) : HRESULT
    @lpVtbl.value.get_prompt.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrprompttitle)
  end
  def get_string_id(pbstrstringid : UInt8**) : HRESULT
    @lpVtbl.value.get_string_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrstringid)
  end
  def get_string_type(pnstringtype : USER_INPUT_STRING_TYPE*) : HRESULT
    @lpVtbl.value.get_string_type.unsafe_as(Proc(USER_INPUT_STRING_TYPE*, HRESULT)).call(pnstringtype)
  end
  def get_tooltip_text(pbstrtooltiptext : UInt8**) : HRESULT
    @lpVtbl.value.get_tooltip_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtooltiptext)
  end
  def get_max_length(pcchmaxlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pcchmaxlength)
  end
  def get_default(pbstrdefault : UInt8**) : HRESULT
    @lpVtbl.value.get_default.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdefault)
  end
  def get_mru_count(pnmrucount : UInt32*) : HRESULT
    @lpVtbl.value.get_mru_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pnmrucount)
  end
  def get_mru_entry_at(nindex : UInt32, pbstrmruentry : UInt8**) : HRESULT
    @lpVtbl.value.get_mru_entry_at.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(nindex, pbstrmruentry)
  end
  def get_image(nsize : UInt32, phbitmap : HBITMAP*, phicon : HANDLE*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(UInt32, HBITMAP*, HANDLE*, HRESULT)).call(nsize, phbitmap, phicon)
  end
end
struct LibWin32::IPhotoAcquireProgressCB
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cancelled(pfcancelled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.cancelled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfcancelled)
  end
  def start_enumeration(pphotoacquiresource : IPhotoAcquireSource) : HRESULT
    @lpVtbl.value.start_enumeration.unsafe_as(Proc(IPhotoAcquireSource, HRESULT)).call(pphotoacquiresource)
  end
  def found_item(pphotoacquireitem : IPhotoAcquireItem) : HRESULT
    @lpVtbl.value.found_item.unsafe_as(Proc(IPhotoAcquireItem, HRESULT)).call(pphotoacquireitem)
  end
  def end_enumeration(hr : HRESULT) : HRESULT
    @lpVtbl.value.end_enumeration.unsafe_as(Proc(HRESULT, HRESULT)).call(hr)
  end
  def start_transfer(pphotoacquiresource : IPhotoAcquireSource) : HRESULT
    @lpVtbl.value.start_transfer.unsafe_as(Proc(IPhotoAcquireSource, HRESULT)).call(pphotoacquiresource)
  end
  def start_item_transfer(nitemindex : UInt32, pphotoacquireitem : IPhotoAcquireItem) : HRESULT
    @lpVtbl.value.start_item_transfer.unsafe_as(Proc(UInt32, IPhotoAcquireItem, HRESULT)).call(nitemindex, pphotoacquireitem)
  end
  def directory_created(pszdirectory : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.directory_created.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszdirectory)
  end
  def update_transfer_percent(foverall : LibC::BOOL, npercent : UInt32) : HRESULT
    @lpVtbl.value.update_transfer_percent.unsafe_as(Proc(LibC::BOOL, UInt32, HRESULT)).call(foverall, npercent)
  end
  def end_item_transfer(nitemindex : UInt32, pphotoacquireitem : IPhotoAcquireItem, hr : HRESULT) : HRESULT
    @lpVtbl.value.end_item_transfer.unsafe_as(Proc(UInt32, IPhotoAcquireItem, HRESULT, HRESULT)).call(nitemindex, pphotoacquireitem, hr)
  end
  def end_transfer(hr : HRESULT) : HRESULT
    @lpVtbl.value.end_transfer.unsafe_as(Proc(HRESULT, HRESULT)).call(hr)
  end
  def start_delete(pphotoacquiresource : IPhotoAcquireSource) : HRESULT
    @lpVtbl.value.start_delete.unsafe_as(Proc(IPhotoAcquireSource, HRESULT)).call(pphotoacquiresource)
  end
  def start_item_delete(nitemindex : UInt32, pphotoacquireitem : IPhotoAcquireItem) : HRESULT
    @lpVtbl.value.start_item_delete.unsafe_as(Proc(UInt32, IPhotoAcquireItem, HRESULT)).call(nitemindex, pphotoacquireitem)
  end
  def update_delete_percent(npercent : UInt32) : HRESULT
    @lpVtbl.value.update_delete_percent.unsafe_as(Proc(UInt32, HRESULT)).call(npercent)
  end
  def end_item_delete(nitemindex : UInt32, pphotoacquireitem : IPhotoAcquireItem, hr : HRESULT) : HRESULT
    @lpVtbl.value.end_item_delete.unsafe_as(Proc(UInt32, IPhotoAcquireItem, HRESULT, HRESULT)).call(nitemindex, pphotoacquireitem, hr)
  end
  def end_delete(hr : HRESULT) : HRESULT
    @lpVtbl.value.end_delete.unsafe_as(Proc(HRESULT, HRESULT)).call(hr)
  end
  def end_session(hr : HRESULT) : HRESULT
    @lpVtbl.value.end_session.unsafe_as(Proc(HRESULT, HRESULT)).call(hr)
  end
  def get_delete_after_acquire(pfdeleteafteracquire : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_delete_after_acquire.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfdeleteafteracquire)
  end
  def error_advise(hr : HRESULT, pszerrormessage : LibC::LPWSTR, nmessagetype : ERROR_ADVISE_MESSAGE_TYPE, pnerroradviseresult : ERROR_ADVISE_RESULT*) : HRESULT
    @lpVtbl.value.error_advise.unsafe_as(Proc(HRESULT, LibC::LPWSTR, ERROR_ADVISE_MESSAGE_TYPE, ERROR_ADVISE_RESULT*, HRESULT)).call(hr, pszerrormessage, nmessagetype, pnerroradviseresult)
  end
  def get_user_input(riidtype : Guid*, punknown : IUnknown, ppropvarresult : PROPVARIANT*, ppropvardefault : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_user_input.unsafe_as(Proc(Guid*, IUnknown, PROPVARIANT*, PROPVARIANT*, HRESULT)).call(riidtype, punknown, ppropvarresult, ppropvardefault)
  end
end
struct LibWin32::IPhotoProgressActionCB
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def do_action(hwndparent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.do_action.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hwndparent)
  end
end
struct LibWin32::IPhotoProgressDialog
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(hwndparent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hwndparent)
  end
  def get_window(phwndprogressdialog : HANDLE*) : HRESULT
    @lpVtbl.value.get_window.unsafe_as(Proc(HANDLE*, HRESULT)).call(phwndprogressdialog)
  end
  def destroy : HRESULT
    @lpVtbl.value.destroy.unsafe_as(Proc(HRESULT)).call
  end
  def set_title(psztitle : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_title.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztitle)
  end
  def show_checkbox(ncheckboxid : PROGRESS_DIALOG_CHECKBOX_ID, fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show_checkbox.unsafe_as(Proc(PROGRESS_DIALOG_CHECKBOX_ID, LibC::BOOL, HRESULT)).call(ncheckboxid, fshow)
  end
  def set_checkbox_text(ncheckboxid : PROGRESS_DIALOG_CHECKBOX_ID, pszcheckboxtext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_checkbox_text.unsafe_as(Proc(PROGRESS_DIALOG_CHECKBOX_ID, LibC::LPWSTR, HRESULT)).call(ncheckboxid, pszcheckboxtext)
  end
  def set_checkbox_check(ncheckboxid : PROGRESS_DIALOG_CHECKBOX_ID, fchecked : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_checkbox_check.unsafe_as(Proc(PROGRESS_DIALOG_CHECKBOX_ID, LibC::BOOL, HRESULT)).call(ncheckboxid, fchecked)
  end
  def set_checkbox_tooltip(ncheckboxid : PROGRESS_DIALOG_CHECKBOX_ID, pszcheckboxtooltiptext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_checkbox_tooltip.unsafe_as(Proc(PROGRESS_DIALOG_CHECKBOX_ID, LibC::LPWSTR, HRESULT)).call(ncheckboxid, pszcheckboxtooltiptext)
  end
  def is_checkbox_checked(ncheckboxid : PROGRESS_DIALOG_CHECKBOX_ID, pfchecked : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_checkbox_checked.unsafe_as(Proc(PROGRESS_DIALOG_CHECKBOX_ID, LibC::BOOL*, HRESULT)).call(ncheckboxid, pfchecked)
  end
  def set_caption(psztitle : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_caption.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztitle)
  end
  def set_image(nimagetype : PROGRESS_DIALOG_IMAGE_TYPE, hicon : LibC::HANDLE, hbitmap : HBITMAP) : HRESULT
    @lpVtbl.value.set_image.unsafe_as(Proc(PROGRESS_DIALOG_IMAGE_TYPE, LibC::HANDLE, HBITMAP, HRESULT)).call(nimagetype, hicon, hbitmap)
  end
  def set_percent_complete(npercent : Int32) : HRESULT
    @lpVtbl.value.set_percent_complete.unsafe_as(Proc(Int32, HRESULT)).call(npercent)
  end
  def set_progress_text(pszprogresstext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_progress_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszprogresstext)
  end
  def set_action_link_callback(pphotoprogressactioncb : IPhotoProgressActionCB) : HRESULT
    @lpVtbl.value.set_action_link_callback.unsafe_as(Proc(IPhotoProgressActionCB, HRESULT)).call(pphotoprogressactioncb)
  end
  def set_action_link_text(pszcaption : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_action_link_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszcaption)
  end
  def show_action_link(fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show_action_link.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fshow)
  end
  def is_cancelled(pfcancelled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_cancelled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfcancelled)
  end
  def get_user_input(riidtype : Guid*, punknown : IUnknown, ppropvarresult : PROPVARIANT*, ppropvardefault : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_user_input.unsafe_as(Proc(Guid*, IUnknown, PROPVARIANT*, PROPVARIANT*, HRESULT)).call(riidtype, punknown, ppropvarresult, ppropvardefault)
  end
end
struct LibWin32::IPhotoAcquireSource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_friendly_name(pbstrfriendlyname : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfriendlyname)
  end
  def get_device_icons(nsize : UInt32, phlargeicon : HANDLE*, phsmallicon : HANDLE*) : HRESULT
    @lpVtbl.value.get_device_icons.unsafe_as(Proc(UInt32, HANDLE*, HANDLE*, HRESULT)).call(nsize, phlargeicon, phsmallicon)
  end
  def initialize_item_list(fforceenumeration : LibC::BOOL, pphotoacquireprogresscb : IPhotoAcquireProgressCB, pnitemcount : UInt32*) : HRESULT
    @lpVtbl.value.initialize_item_list.unsafe_as(Proc(LibC::BOOL, IPhotoAcquireProgressCB, UInt32*, HRESULT)).call(fforceenumeration, pphotoacquireprogresscb, pnitemcount)
  end
  def get_item_count(pnitemcount : UInt32*) : HRESULT
    @lpVtbl.value.get_item_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pnitemcount)
  end
  def get_item_at(nindex : UInt32, ppphotoacquireitem : IPhotoAcquireItem*) : HRESULT
    @lpVtbl.value.get_item_at.unsafe_as(Proc(UInt32, IPhotoAcquireItem*, HRESULT)).call(nindex, ppphotoacquireitem)
  end
  def get_photo_acquire_settings(ppphotoacquiresettings : IPhotoAcquireSettings*) : HRESULT
    @lpVtbl.value.get_photo_acquire_settings.unsafe_as(Proc(IPhotoAcquireSettings*, HRESULT)).call(ppphotoacquiresettings)
  end
  def get_device_id(pbstrdeviceid : UInt8**) : HRESULT
    @lpVtbl.value.get_device_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdeviceid)
  end
  def bind_to_object(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.bind_to_object.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::IPhotoAcquire
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_photo_source(pszdevice : LibC::LPWSTR, ppphotoacquiresource : IPhotoAcquireSource*) : HRESULT
    @lpVtbl.value.create_photo_source.unsafe_as(Proc(LibC::LPWSTR, IPhotoAcquireSource*, HRESULT)).call(pszdevice, ppphotoacquiresource)
  end
  def acquire(pphotoacquiresource : IPhotoAcquireSource, fshowprogress : LibC::BOOL, hwndparent : LibC::HANDLE, pszapplicationname : LibC::LPWSTR, pphotoacquireprogresscb : IPhotoAcquireProgressCB) : HRESULT
    @lpVtbl.value.acquire.unsafe_as(Proc(IPhotoAcquireSource, LibC::BOOL, LibC::HANDLE, LibC::LPWSTR, IPhotoAcquireProgressCB, HRESULT)).call(pphotoacquiresource, fshowprogress, hwndparent, pszapplicationname, pphotoacquireprogresscb)
  end
  def enum_results(ppenumfilepaths : IEnumString*) : HRESULT
    @lpVtbl.value.enum_results.unsafe_as(Proc(IEnumString*, HRESULT)).call(ppenumfilepaths)
  end
end
struct LibWin32::IPhotoAcquireSettings
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize_from_registry(pszregistrykey : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.initialize_from_registry.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszregistrykey)
  end
  def set_flags(dwphotoacquireflags : UInt32) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(UInt32, HRESULT)).call(dwphotoacquireflags)
  end
  def set_output_filename_template(psztemplate : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_output_filename_template.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztemplate)
  end
  def set_sequence_padding_width(dwwidth : UInt32) : HRESULT
    @lpVtbl.value.set_sequence_padding_width.unsafe_as(Proc(UInt32, HRESULT)).call(dwwidth)
  end
  def set_sequence_zero_padding(fzeropad : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_sequence_zero_padding.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fzeropad)
  end
  def set_group_tag(pszgrouptag : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_group_tag.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszgrouptag)
  end
  def set_acquisition_time(pftacquisitiontime : FILETIME*) : HRESULT
    @lpVtbl.value.set_acquisition_time.unsafe_as(Proc(FILETIME*, HRESULT)).call(pftacquisitiontime)
  end
  def get_flags(pdwphotoacquireflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwphotoacquireflags)
  end
  def get_output_filename_template(pbstrtemplate : UInt8**) : HRESULT
    @lpVtbl.value.get_output_filename_template.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtemplate)
  end
  def get_sequence_padding_width(pdwwidth : UInt32*) : HRESULT
    @lpVtbl.value.get_sequence_padding_width.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwwidth)
  end
  def get_sequence_zero_padding(pfzeropad : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_sequence_zero_padding.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfzeropad)
  end
  def get_group_tag(pbstrgrouptag : UInt8**) : HRESULT
    @lpVtbl.value.get_group_tag.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrgrouptag)
  end
  def get_acquisition_time(pftacquisitiontime : FILETIME*) : HRESULT
    @lpVtbl.value.get_acquisition_time.unsafe_as(Proc(FILETIME*, HRESULT)).call(pftacquisitiontime)
  end
end
struct LibWin32::IPhotoAcquireOptionsDialog
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pszregistryroot : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszregistryroot)
  end
  def create(hwndparent : LibC::HANDLE, phwnddialog : HANDLE*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(LibC::HANDLE, HANDLE*, HRESULT)).call(hwndparent, phwnddialog)
  end
  def destroy : HRESULT
    @lpVtbl.value.destroy.unsafe_as(Proc(HRESULT)).call
  end
  def do_modal(hwndparent : LibC::HANDLE, ppnreturncode : LibC::IntPtrT*) : HRESULT
    @lpVtbl.value.do_modal.unsafe_as(Proc(LibC::HANDLE, LibC::IntPtrT*, HRESULT)).call(hwndparent, ppnreturncode)
  end
  def save_data : HRESULT
    @lpVtbl.value.save_data.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IPhotoAcquireDeviceSelectionDialog
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_title(psztitle : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_title.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(psztitle)
  end
  def set_submit_button_text(pszsubmitbuttontext : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_submit_button_text.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszsubmitbuttontext)
  end
  def do_modal(hwndparent : LibC::HANDLE, dwdeviceflags : UInt32, pbstrdeviceid : UInt8**, pndevicetype : DEVICE_SELECTION_DEVICE_TYPE*) : HRESULT
    @lpVtbl.value.do_modal.unsafe_as(Proc(LibC::HANDLE, UInt32, UInt8**, DEVICE_SELECTION_DEVICE_TYPE*, HRESULT)).call(hwndparent, dwdeviceflags, pbstrdeviceid, pndevicetype)
  end
end
struct LibWin32::IPhotoAcquirePlugin
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pphotoacquiresource : IPhotoAcquireSource, pphotoacquireprogresscb : IPhotoAcquireProgressCB) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IPhotoAcquireSource, IPhotoAcquireProgressCB, HRESULT)).call(pphotoacquiresource, pphotoacquireprogresscb)
  end
  def process_item(dwacquirestage : UInt32, pphotoacquireitem : IPhotoAcquireItem, poriginalitemstream : IStream, pszfinalfilename : LibC::LPWSTR, ppropertystore : IPropertyStore) : HRESULT
    @lpVtbl.value.process_item.unsafe_as(Proc(UInt32, IPhotoAcquireItem, IStream, LibC::LPWSTR, IPropertyStore, HRESULT)).call(dwacquirestage, pphotoacquireitem, poriginalitemstream, pszfinalfilename, ppropertystore)
  end
  def transfer_complete(hr : HRESULT) : HRESULT
    @lpVtbl.value.transfer_complete.unsafe_as(Proc(HRESULT, HRESULT)).call(hr)
  end
  def display_configure_dialog(hwndparent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.display_configure_dialog.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hwndparent)
  end
end
