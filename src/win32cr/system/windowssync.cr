require "../foundation.cr"
require "../system/com.cr"
require "../ui/shell/propertiessystem.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  SYNC_VERSION_FLAG_FROM_FEED = 1_u32
  SYNC_VERSION_FLAG_HAS_BY = 2_u32
  SYNC_SERIALIZE_REPLICA_KEY_MAP = 1_u32
  SYNC_FILTER_INFO_FLAG_ITEM_LIST = 1_u32
  SYNC_FILTER_INFO_FLAG_CHANGE_UNIT_LIST = 2_u32
  SYNC_FILTER_INFO_FLAG_CUSTOM = 4_u32
  SYNC_FILTER_INFO_COMBINED = 8_u32
  SYNC_CHANGE_FLAG_DELETED = 1_u32
  SYNC_CHANGE_FLAG_DOES_NOT_EXIST = 2_u32
  SYNC_CHANGE_FLAG_GHOST = 4_u32
  PKEY_PROVIDER_INSTANCEID = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 2_u32)
  PKEY_PROVIDER_CLSID = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 3_u32)
  PKEY_PROVIDER_CONFIGUI = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 4_u32)
  PKEY_PROVIDER_CONTENTTYPE = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 5_u32)
  PKEY_PROVIDER_CAPABILITIES = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 6_u32)
  PKEY_PROVIDER_SUPPORTED_ARCHITECTURE = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 7_u32)
  PKEY_PROVIDER_NAME = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 8_u32)
  PKEY_PROVIDER_DESCRIPTION = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 9_u32)
  PKEY_PROVIDER_TOOLTIPS = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 10_u32)
  PKEY_PROVIDER_ICON = PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 11_u32)
  PKEY_CONFIGUI_INSTANCEID = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 2_u32)
  PKEY_CONFIGUI_CLSID = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 3_u32)
  PKEY_CONFIGUI_CONTENTTYPE = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 4_u32)
  PKEY_CONFIGUI_CAPABILITIES = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 5_u32)
  PKEY_CONFIGUI_SUPPORTED_ARCHITECTURE = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 6_u32)
  PKEY_CONFIGUI_IS_GLOBAL = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 7_u32)
  PKEY_CONFIGUI_NAME = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 8_u32)
  PKEY_CONFIGUI_DESCRIPTION = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 9_u32)
  PKEY_CONFIGUI_TOOLTIPS = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 10_u32)
  PKEY_CONFIGUI_ICON = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 11_u32)
  PKEY_CONFIGUI_MENUITEM_NOUI = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 12_u32)
  PKEY_CONFIGUI_MENUITEM = PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 13_u32)
  CLSID_SyncProviderRegistration = LibC::GUID.new(0xf82b4ef1_u32, 0x93a9_u16, 0x4dde_u16, StaticArray[0x80_u8, 0x15_u8, 0xf7_u8, 0x95_u8, 0xa_u8, 0x1a_u8, 0x6e_u8, 0x31_u8])


  enum SYNC_PROVIDER_ROLE : Int32
    SPR_SOURCE = 0
    SPR_DESTINATION = 1
  end

  enum CONFLICT_RESOLUTION_POLICY : Int32
    CRP_NONE = 0
    CRP_DESTINATION_PROVIDER_WINS = 1
    CRP_SOURCE_PROVIDER_WINS = 2
    CRP_LAST = 3
  end

  enum SYNC_PROGRESS_STAGE : Int32
    SPS_CHANGE_DETECTION = 0
    SPS_CHANGE_ENUMERATION = 1
    SPS_CHANGE_APPLICATION = 2
  end

  enum SYNC_FULL_ENUMERATION_ACTION : Int32
    SFEA_FULL_ENUMERATION = 0
    SFEA_PARTIAL_SYNC = 1
    SFEA_ABORT = 2
  end

  enum SYNC_RESOLVE_ACTION : Int32
    SRA_DEFER = 0
    SRA_ACCEPT_DESTINATION_PROVIDER = 1
    SRA_ACCEPT_SOURCE_PROVIDER = 2
    SRA_MERGE = 3
    SRA_TRANSFER_AND_DEFER = 4
    SRA_LAST = 5
  end

  enum SYNC_STATISTICS : Int32
    SYNC_STATISTICS_RANGE_COUNT = 0
  end

  enum SYNC_SERIALIZATION_VERSION : Int32
    SYNC_SERIALIZATION_VERSION_V1 = 1
    SYNC_SERIALIZATION_VERSION_V2 = 4
    SYNC_SERIALIZATION_VERSION_V3 = 5
  end

  enum FILTERING_TYPE : Int32
    FT_CURRENT_ITEMS_ONLY = 0
    FT_CURRENT_ITEMS_AND_VERSIONS_FOR_MOVED_OUT_ITEMS = 1
  end

  enum SYNC_CONSTRAINT_RESOLVE_ACTION : Int32
    SCRA_DEFER = 0
    SCRA_ACCEPT_DESTINATION_PROVIDER = 1
    SCRA_ACCEPT_SOURCE_PROVIDER = 2
    SCRA_TRANSFER_AND_DEFER = 3
    SCRA_MERGE = 4
    SCRA_RENAME_SOURCE = 5
    SCRA_RENAME_DESTINATION = 6
  end

  enum CONSTRAINT_CONFLICT_REASON : Int32
    CCR_OTHER = 0
    CCR_COLLISION = 1
    CCR_NOPARENT = 2
    CCR_IDENTITY = 3
  end

  enum KNOWLEDGE_COOKIE_COMPARISON_RESULT : Int32
    KCCR_COOKIE_KNOWLEDGE_EQUAL = 0
    KCCR_COOKIE_KNOWLEDGE_CONTAINED = 1
    KCCR_COOKIE_KNOWLEDGE_CONTAINS = 2
    KCCR_COOKIE_KNOWLEDGE_NOT_COMPARABLE = 3
  end

  enum FILTER_COMBINATION_TYPE : Int32
    FCT_INTERSECTION = 0
  end

  enum SYNC_REGISTRATION_EVENT : Int32
    SRE_PROVIDER_ADDED = 0
    SRE_PROVIDER_REMOVED = 1
    SRE_PROVIDER_UPDATED = 2
    SRE_PROVIDER_STATE_CHANGED = 3
    SRE_CONFIGUI_ADDED = 4
    SRE_CONFIGUI_REMOVED = 5
    SRE_CONFIGUI_UPDATED = 6
  end

  struct ID_PARAMETER_PAIR
    f_is_variable : LibC::BOOL
    cb_id_size : UInt16
  end
  struct ID_PARAMETERS
    dw_size : UInt32
    replica_id : ID_PARAMETER_PAIR
    item_id : ID_PARAMETER_PAIR
    change_unit_id : ID_PARAMETER_PAIR
  end
  struct SYNC_SESSION_STATISTICS
    dw_changes_applied : UInt32
    dw_changes_failed : UInt32
  end
  struct SYNC_VERSION
    dw_last_updating_replica_key : UInt32
    ull_tick_count : UInt64
  end
  struct SYNC_RANGE
    pb_closed_lower_bound : UInt8*
    pb_closed_upper_bound : UInt8*
  end
  struct SYNC_TIME
    dw_date : UInt32
    dw_time : UInt32
  end
  struct SYNC_FILTER_CHANGE
    f_move_in : LibC::BOOL
    move_version : SYNC_VERSION
  end
  struct SyncProviderConfiguration
    dw_version : UInt32
    guid_instance_id : Guid
    clsid_provider : Guid
    guid_config_ui_instance_id : Guid
    guid_content_type : Guid
    dw_capabilities : UInt32
    dw_supported_architecture : UInt32
  end
  struct SyncProviderConfigUIConfiguration
    dw_version : UInt32
    guid_instance_id : Guid
    clsid_config_ui : Guid
    guid_content_type : Guid
    dw_capabilities : UInt32
    dw_supported_architecture : UInt32
    f_is_global : LibC::BOOL
  end


  struct IClockVectorElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_replica_key : UInt64
    get_tick_count : UInt64
  end

  IClockVectorElement_GUID = "e71c4250-adf8-4a07-8fae-5669596909c1"
  IID_IClockVectorElement = LibC::GUID.new(0xe71c4250_u32, 0xadf8_u16, 0x4a07_u16, StaticArray[0x8f_u8, 0xae_u8, 0x56_u8, 0x69_u8, 0x59_u8, 0x69_u8, 0x9_u8, 0xc1_u8])
  struct IClockVectorElement
    lpVtbl : IClockVectorElementVTbl*
  end

  struct IFeedClockVectorElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_replica_key : UInt64
    get_tick_count : UInt64
    get_sync_time : UInt64
    get_flags : UInt64
  end

  IFeedClockVectorElement_GUID = "a40b46d2-e97b-4156-b6da-991f501b0f05"
  IID_IFeedClockVectorElement = LibC::GUID.new(0xa40b46d2_u32, 0xe97b_u16, 0x4156_u16, StaticArray[0xb6_u8, 0xda_u8, 0x99_u8, 0x1f_u8, 0x50_u8, 0x1b_u8, 0xf_u8, 0x5_u8])
  struct IFeedClockVectorElement
    lpVtbl : IFeedClockVectorElementVTbl*
  end

  struct IClockVectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_clock_vector_elements : UInt64
    get_clock_vector_element_count : UInt64
  end

  IClockVector_GUID = "14b2274a-8698-4cc6-9333-f89bd1d47bc4"
  IID_IClockVector = LibC::GUID.new(0x14b2274a_u32, 0x8698_u16, 0x4cc6_u16, StaticArray[0x93_u8, 0x33_u8, 0xf8_u8, 0x9b_u8, 0xd1_u8, 0xd4_u8, 0x7b_u8, 0xc4_u8])
  struct IClockVector
    lpVtbl : IClockVectorVTbl*
  end

  struct IFeedClockVectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_clock_vector_elements : UInt64
    get_clock_vector_element_count : UInt64
    get_update_count : UInt64
    is_no_conflicts_specified : UInt64
  end

  IFeedClockVector_GUID = "8d1d98d1-9fb8-4ec9-a553-54dd924e0f67"
  IID_IFeedClockVector = LibC::GUID.new(0x8d1d98d1_u32, 0x9fb8_u16, 0x4ec9_u16, StaticArray[0xa5_u8, 0x53_u8, 0x54_u8, 0xdd_u8, 0x92_u8, 0x4e_u8, 0xf_u8, 0x67_u8])
  struct IFeedClockVector
    lpVtbl : IFeedClockVectorVTbl*
  end

  struct IEnumClockVectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumClockVector_GUID = "525844db-2837-4799-9e80-81a66e02220c"
  IID_IEnumClockVector = LibC::GUID.new(0x525844db_u32, 0x2837_u16, 0x4799_u16, StaticArray[0x9e_u8, 0x80_u8, 0x81_u8, 0xa6_u8, 0x6e_u8, 0x2_u8, 0x22_u8, 0xc_u8])
  struct IEnumClockVector
    lpVtbl : IEnumClockVectorVTbl*
  end

  struct IEnumFeedClockVectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumFeedClockVector_GUID = "550f763d-146a-48f6-abeb-6c88c7f70514"
  IID_IEnumFeedClockVector = LibC::GUID.new(0x550f763d_u32, 0x146a_u16, 0x48f6_u16, StaticArray[0xab_u8, 0xeb_u8, 0x6c_u8, 0x88_u8, 0xc7_u8, 0xf7_u8, 0x5_u8, 0x14_u8])
  struct IEnumFeedClockVector
    lpVtbl : IEnumFeedClockVectorVTbl*
  end

  struct ICoreFragmentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next_column : UInt64
    next_range : UInt64
    reset : UInt64
    get_column_count : UInt64
    get_range_count : UInt64
  end

  ICoreFragment_GUID = "613b2ab5-b304-47d9-9c31-ce6c54401a15"
  IID_ICoreFragment = LibC::GUID.new(0x613b2ab5_u32, 0xb304_u16, 0x47d9_u16, StaticArray[0x9c_u8, 0x31_u8, 0xce_u8, 0x6c_u8, 0x54_u8, 0x40_u8, 0x1a_u8, 0x15_u8])
  struct ICoreFragment
    lpVtbl : ICoreFragmentVTbl*
  end

  struct ICoreFragmentInspectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next_core_fragments : UInt64
    reset : UInt64
  end

  ICoreFragmentInspector_GUID = "f7fcc5fd-ae26-4679-ba16-96aac583c134"
  IID_ICoreFragmentInspector = LibC::GUID.new(0xf7fcc5fd_u32, 0xae26_u16, 0x4679_u16, StaticArray[0xba_u8, 0x16_u8, 0x96_u8, 0xaa_u8, 0xc5_u8, 0x83_u8, 0xc1_u8, 0x34_u8])
  struct ICoreFragmentInspector
    lpVtbl : ICoreFragmentInspectorVTbl*
  end

  struct IRangeExceptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_closed_range_start : UInt64
    get_closed_range_end : UInt64
    get_clock_vector : UInt64
  end

  IRangeException_GUID = "75ae8777-6848-49f7-956c-a3a92f5096e8"
  IID_IRangeException = LibC::GUID.new(0x75ae8777_u32, 0x6848_u16, 0x49f7_u16, StaticArray[0x95_u8, 0x6c_u8, 0xa3_u8, 0xa9_u8, 0x2f_u8, 0x50_u8, 0x96_u8, 0xe8_u8])
  struct IRangeException
    lpVtbl : IRangeExceptionVTbl*
  end

  struct IEnumRangeExceptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumRangeExceptions_GUID = "0944439f-ddb1-4176-b703-046ff22a2386"
  IID_IEnumRangeExceptions = LibC::GUID.new(0x944439f_u32, 0xddb1_u16, 0x4176_u16, StaticArray[0xb7_u8, 0x3_u8, 0x4_u8, 0x6f_u8, 0xf2_u8, 0x2a_u8, 0x23_u8, 0x86_u8])
  struct IEnumRangeExceptions
    lpVtbl : IEnumRangeExceptionsVTbl*
  end

  struct ISingleItemExceptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_id : UInt64
    get_clock_vector : UInt64
  end

  ISingleItemException_GUID = "892fb9b0-7c55-4a18-9316-fdf449569b64"
  IID_ISingleItemException = LibC::GUID.new(0x892fb9b0_u32, 0x7c55_u16, 0x4a18_u16, StaticArray[0x93_u8, 0x16_u8, 0xfd_u8, 0xf4_u8, 0x49_u8, 0x56_u8, 0x9b_u8, 0x64_u8])
  struct ISingleItemException
    lpVtbl : ISingleItemExceptionVTbl*
  end

  struct IEnumSingleItemExceptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumSingleItemExceptions_GUID = "e563381c-1b4d-4c66-9796-c86faccdcd40"
  IID_IEnumSingleItemExceptions = LibC::GUID.new(0xe563381c_u32, 0x1b4d_u16, 0x4c66_u16, StaticArray[0x97_u8, 0x96_u8, 0xc8_u8, 0x6f_u8, 0xac_u8, 0xcd_u8, 0xcd_u8, 0x40_u8])
  struct IEnumSingleItemExceptions
    lpVtbl : IEnumSingleItemExceptionsVTbl*
  end

  struct IChangeUnitExceptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_id : UInt64
    get_change_unit_id : UInt64
    get_clock_vector : UInt64
  end

  IChangeUnitException_GUID = "0cd7ee7c-fec0-4021-99ee-f0e5348f2a5f"
  IID_IChangeUnitException = LibC::GUID.new(0xcd7ee7c_u32, 0xfec0_u16, 0x4021_u16, StaticArray[0x99_u8, 0xee_u8, 0xf0_u8, 0xe5_u8, 0x34_u8, 0x8f_u8, 0x2a_u8, 0x5f_u8])
  struct IChangeUnitException
    lpVtbl : IChangeUnitExceptionVTbl*
  end

  struct IEnumChangeUnitExceptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumChangeUnitExceptions_GUID = "3074e802-9319-4420-be21-1022e2e21da8"
  IID_IEnumChangeUnitExceptions = LibC::GUID.new(0x3074e802_u32, 0x9319_u16, 0x4420_u16, StaticArray[0xbe_u8, 0x21_u8, 0x10_u8, 0x22_u8, 0xe2_u8, 0xe2_u8, 0x1d_u8, 0xa8_u8])
  struct IEnumChangeUnitExceptions
    lpVtbl : IEnumChangeUnitExceptionsVTbl*
  end

  struct IReplicaKeyMapVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    lookup_replica_key : UInt64
    lookup_replica_id : UInt64
    serialize : UInt64
  end

  IReplicaKeyMap_GUID = "2209f4fc-fd10-4ff0-84a8-f0a1982e440e"
  IID_IReplicaKeyMap = LibC::GUID.new(0x2209f4fc_u32, 0xfd10_u16, 0x4ff0_u16, StaticArray[0x84_u8, 0xa8_u8, 0xf0_u8, 0xa1_u8, 0x98_u8, 0x2e_u8, 0x44_u8, 0xe_u8])
  struct IReplicaKeyMap
    lpVtbl : IReplicaKeyMapVTbl*
  end

  struct IConstructReplicaKeyMapVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    find_or_add_replica : UInt64
  end

  IConstructReplicaKeyMap_GUID = "ded10970-ec85-4115-b52c-4405845642a5"
  IID_IConstructReplicaKeyMap = LibC::GUID.new(0xded10970_u32, 0xec85_u16, 0x4115_u16, StaticArray[0xb5_u8, 0x2c_u8, 0x44_u8, 0x5_u8, 0x84_u8, 0x56_u8, 0x42_u8, 0xa5_u8])
  struct IConstructReplicaKeyMap
    lpVtbl : IConstructReplicaKeyMapVTbl*
  end

  struct ISyncKnowledgeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner_replica_id : UInt64
    serialize : UInt64
    set_local_tick_count : UInt64
    contains_change : UInt64
    contains_change_unit : UInt64
    get_scope_vector : UInt64
    get_replica_key_map : UInt64
    clone : UInt64
    convert_version : UInt64
    map_remote_to_local : UInt64
    union : UInt64
    project_onto_item : UInt64
    project_onto_change_unit : UInt64
    project_onto_range : UInt64
    exclude_item : UInt64
    exclude_change_unit : UInt64
    contains_knowledge : UInt64
    find_min_tick_count_for_replica : UInt64
    get_range_exceptions : UInt64
    get_single_item_exceptions : UInt64
    get_change_unit_exceptions : UInt64
    find_clock_vector_for_item : UInt64
    find_clock_vector_for_change_unit : UInt64
    get_version : UInt64
  end

  ISyncKnowledge_GUID = "615bbb53-c945-4203-bf4b-2cb65919a0aa"
  IID_ISyncKnowledge = LibC::GUID.new(0x615bbb53_u32, 0xc945_u16, 0x4203_u16, StaticArray[0xbf_u8, 0x4b_u8, 0x2c_u8, 0xb6_u8, 0x59_u8, 0x19_u8, 0xa0_u8, 0xaa_u8])
  struct ISyncKnowledge
    lpVtbl : ISyncKnowledgeVTbl*
  end

  struct IForgottenKnowledgeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner_replica_id : UInt64
    serialize : UInt64
    set_local_tick_count : UInt64
    contains_change : UInt64
    contains_change_unit : UInt64
    get_scope_vector : UInt64
    get_replica_key_map : UInt64
    clone : UInt64
    convert_version : UInt64
    map_remote_to_local : UInt64
    union : UInt64
    project_onto_item : UInt64
    project_onto_change_unit : UInt64
    project_onto_range : UInt64
    exclude_item : UInt64
    exclude_change_unit : UInt64
    contains_knowledge : UInt64
    find_min_tick_count_for_replica : UInt64
    get_range_exceptions : UInt64
    get_single_item_exceptions : UInt64
    get_change_unit_exceptions : UInt64
    find_clock_vector_for_item : UInt64
    find_clock_vector_for_change_unit : UInt64
    get_version : UInt64
    forget_to_version : UInt64
  end

  IForgottenKnowledge_GUID = "456e0f96-6036-452b-9f9d-bcc4b4a85db2"
  IID_IForgottenKnowledge = LibC::GUID.new(0x456e0f96_u32, 0x6036_u16, 0x452b_u16, StaticArray[0x9f_u8, 0x9d_u8, 0xbc_u8, 0xc4_u8, 0xb4_u8, 0xa8_u8, 0x5d_u8, 0xb2_u8])
  struct IForgottenKnowledge
    lpVtbl : IForgottenKnowledgeVTbl*
  end

  struct ISyncKnowledge2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner_replica_id : UInt64
    serialize : UInt64
    set_local_tick_count : UInt64
    contains_change : UInt64
    contains_change_unit : UInt64
    get_scope_vector : UInt64
    get_replica_key_map : UInt64
    clone : UInt64
    convert_version : UInt64
    map_remote_to_local : UInt64
    union : UInt64
    project_onto_item : UInt64
    project_onto_change_unit : UInt64
    project_onto_range : UInt64
    exclude_item : UInt64
    exclude_change_unit : UInt64
    contains_knowledge : UInt64
    find_min_tick_count_for_replica : UInt64
    get_range_exceptions : UInt64
    get_single_item_exceptions : UInt64
    get_change_unit_exceptions : UInt64
    find_clock_vector_for_item : UInt64
    find_clock_vector_for_change_unit : UInt64
    get_version : UInt64
    get_id_parameters : UInt64
    project_onto_column_set : UInt64
    serialize_with_options : UInt64
    get_lowest_uncontained_id : UInt64
    get_inspector : UInt64
    get_minimum_supported_version : UInt64
    get_statistics : UInt64
    contains_knowledge_for_item : UInt64
    contains_knowledge_for_change_unit : UInt64
    project_onto_knowledge_with_prerequisite : UInt64
    complement : UInt64
    intersects_with_knowledge : UInt64
    get_knowledge_cookie : UInt64
    compare_to_knowledge_cookie : UInt64
  end

  ISyncKnowledge2_GUID = "ed0addc0-3b4b-46a1-9a45-45661d2114c8"
  IID_ISyncKnowledge2 = LibC::GUID.new(0xed0addc0_u32, 0x3b4b_u16, 0x46a1_u16, StaticArray[0x9a_u8, 0x45_u8, 0x45_u8, 0x66_u8, 0x1d_u8, 0x21_u8, 0x14_u8, 0xc8_u8])
  struct ISyncKnowledge2
    lpVtbl : ISyncKnowledge2VTbl*
  end

  struct IRecoverableErrorDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_item_display_name : UInt64
    get_error_description : UInt64
  end

  IRecoverableErrorData_GUID = "b37c4a0a-4b7d-4c2d-9711-3b00d119b1c8"
  IID_IRecoverableErrorData = LibC::GUID.new(0xb37c4a0a_u32, 0x4b7d_u16, 0x4c2d_u16, StaticArray[0x97_u8, 0x11_u8, 0x3b_u8, 0x0_u8, 0xd1_u8, 0x19_u8, 0xb1_u8, 0xc8_u8])
  struct IRecoverableErrorData
    lpVtbl : IRecoverableErrorDataVTbl*
  end

  struct IRecoverableErrorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_stage : UInt64
    get_provider : UInt64
    get_change_with_recoverable_error : UInt64
    get_recoverable_error_data_for_change : UInt64
    get_recoverable_error_data_for_change_unit : UInt64
  end

  IRecoverableError_GUID = "0f5625e8-0a7b-45ee-9637-1ce13645909e"
  IID_IRecoverableError = LibC::GUID.new(0xf5625e8_u32, 0xa7b_u16, 0x45ee_u16, StaticArray[0x96_u8, 0x37_u8, 0x1c_u8, 0xe1_u8, 0x36_u8, 0x45_u8, 0x90_u8, 0x9e_u8])
  struct IRecoverableError
    lpVtbl : IRecoverableErrorVTbl*
  end

  struct IChangeConflictVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_destination_provider_conflicting_change : UInt64
    get_source_provider_conflicting_change : UInt64
    get_destination_provider_conflicting_data : UInt64
    get_source_provider_conflicting_data : UInt64
    get_resolve_action_for_change : UInt64
    set_resolve_action_for_change : UInt64
    get_resolve_action_for_change_unit : UInt64
    set_resolve_action_for_change_unit : UInt64
  end

  IChangeConflict_GUID = "014ebf97-9f20-4f7a-bdd4-25979c77c002"
  IID_IChangeConflict = LibC::GUID.new(0x14ebf97_u32, 0x9f20_u16, 0x4f7a_u16, StaticArray[0xbd_u8, 0xd4_u8, 0x25_u8, 0x97_u8, 0x9c_u8, 0x77_u8, 0xc0_u8, 0x2_u8])
  struct IChangeConflict
    lpVtbl : IChangeConflictVTbl*
  end

  struct IConstraintConflictVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_destination_provider_conflicting_change : UInt64
    get_source_provider_conflicting_change : UInt64
    get_destination_provider_original_change : UInt64
    get_destination_provider_conflicting_data : UInt64
    get_source_provider_conflicting_data : UInt64
    get_destination_provider_original_data : UInt64
    get_constraint_resolve_action_for_change : UInt64
    set_constraint_resolve_action_for_change : UInt64
    get_constraint_resolve_action_for_change_unit : UInt64
    set_constraint_resolve_action_for_change_unit : UInt64
    get_constraint_conflict_reason : UInt64
    is_temporary : UInt64
  end

  IConstraintConflict_GUID = "00d2302e-1cf8-4835-b85f-b7ca4f799e0a"
  IID_IConstraintConflict = LibC::GUID.new(0xd2302e_u32, 0x1cf8_u16, 0x4835_u16, StaticArray[0xb8_u8, 0x5f_u8, 0xb7_u8, 0xca_u8, 0x4f_u8, 0x79_u8, 0x9e_u8, 0xa_u8])
  struct IConstraintConflict
    lpVtbl : IConstraintConflictVTbl*
  end

  struct ISyncCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_progress : UInt64
    on_change : UInt64
    on_conflict : UInt64
    on_full_enumeration_needed : UInt64
    on_recoverable_error : UInt64
  end

  ISyncCallback_GUID = "0599797f-5ed9-485c-ae36-0c5d1bf2e7a5"
  IID_ISyncCallback = LibC::GUID.new(0x599797f_u32, 0x5ed9_u16, 0x485c_u16, StaticArray[0xae_u8, 0x36_u8, 0xc_u8, 0x5d_u8, 0x1b_u8, 0xf2_u8, 0xe7_u8, 0xa5_u8])
  struct ISyncCallback
    lpVtbl : ISyncCallbackVTbl*
  end

  struct ISyncCallback2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_progress : UInt64
    on_change : UInt64
    on_conflict : UInt64
    on_full_enumeration_needed : UInt64
    on_recoverable_error : UInt64
    on_change_applied : UInt64
    on_change_failed : UInt64
  end

  ISyncCallback2_GUID = "47ce84af-7442-4ead-8630-12015e030ad7"
  IID_ISyncCallback2 = LibC::GUID.new(0x47ce84af_u32, 0x7442_u16, 0x4ead_u16, StaticArray[0x86_u8, 0x30_u8, 0x12_u8, 0x1_u8, 0x5e_u8, 0x3_u8, 0xa_u8, 0xd7_u8])
  struct ISyncCallback2
    lpVtbl : ISyncCallback2VTbl*
  end

  struct ISyncConstraintCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_constraint_conflict : UInt64
  end

  ISyncConstraintCallback_GUID = "8af3843e-75b3-438c-bb51-6f020d70d3cb"
  IID_ISyncConstraintCallback = LibC::GUID.new(0x8af3843e_u32, 0x75b3_u16, 0x438c_u16, StaticArray[0xbb_u8, 0x51_u8, 0x6f_u8, 0x2_u8, 0xd_u8, 0x70_u8, 0xd3_u8, 0xcb_u8])
  struct ISyncConstraintCallback
    lpVtbl : ISyncConstraintCallbackVTbl*
  end

  struct ISyncProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_id_parameters : UInt64
  end

  ISyncProvider_GUID = "8f657056-2bce-4a17-8c68-c7bb7898b56f"
  IID_ISyncProvider = LibC::GUID.new(0x8f657056_u32, 0x2bce_u16, 0x4a17_u16, StaticArray[0x8c_u8, 0x68_u8, 0xc7_u8, 0xbb_u8, 0x78_u8, 0x98_u8, 0xb5_u8, 0x6f_u8])
  struct ISyncProvider
    lpVtbl : ISyncProviderVTbl*
  end

  struct ISyncSessionStateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_canceled : UInt64
    get_info_for_change_application : UInt64
    load_info_from_change_application : UInt64
    get_forgotten_knowledge_recovery_range_start : UInt64
    get_forgotten_knowledge_recovery_range_end : UInt64
    set_forgotten_knowledge_recovery_range : UInt64
    on_progress : UInt64
  end

  ISyncSessionState_GUID = "b8a940fe-9f01-483b-9434-c37d361225d9"
  IID_ISyncSessionState = LibC::GUID.new(0xb8a940fe_u32, 0x9f01_u16, 0x483b_u16, StaticArray[0x94_u8, 0x34_u8, 0xc3_u8, 0x7d_u8, 0x36_u8, 0x12_u8, 0x25_u8, 0xd9_u8])
  struct ISyncSessionState
    lpVtbl : ISyncSessionStateVTbl*
  end

  struct ISyncSessionExtendedErrorInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_sync_provider_with_error : UInt64
  end

  ISyncSessionExtendedErrorInfo_GUID = "326c6810-790a-409b-b741-6999388761eb"
  IID_ISyncSessionExtendedErrorInfo = LibC::GUID.new(0x326c6810_u32, 0x790a_u16, 0x409b_u16, StaticArray[0xb7_u8, 0x41_u8, 0x69_u8, 0x99_u8, 0x38_u8, 0x87_u8, 0x61_u8, 0xeb_u8])
  struct ISyncSessionExtendedErrorInfo
    lpVtbl : ISyncSessionExtendedErrorInfoVTbl*
  end

  struct ISyncSessionState2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_canceled : UInt64
    get_info_for_change_application : UInt64
    load_info_from_change_application : UInt64
    get_forgotten_knowledge_recovery_range_start : UInt64
    get_forgotten_knowledge_recovery_range_end : UInt64
    set_forgotten_knowledge_recovery_range : UInt64
    on_progress : UInt64
    set_provider_with_error : UInt64
    get_session_error_status : UInt64
  end

  ISyncSessionState2_GUID = "9e37cfa3-9e38-4c61-9ca3-ffe810b45ca2"
  IID_ISyncSessionState2 = LibC::GUID.new(0x9e37cfa3_u32, 0x9e38_u16, 0x4c61_u16, StaticArray[0x9c_u8, 0xa3_u8, 0xff_u8, 0xe8_u8, 0x10_u8, 0xb4_u8, 0x5c_u8, 0xa2_u8])
  struct ISyncSessionState2
    lpVtbl : ISyncSessionState2VTbl*
  end

  struct ISyncFilterInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
  end

  ISyncFilterInfo_GUID = "794eaaf8-3f2e-47e6-9728-17e6fcf94cb7"
  IID_ISyncFilterInfo = LibC::GUID.new(0x794eaaf8_u32, 0x3f2e_u16, 0x47e6_u16, StaticArray[0x97_u8, 0x28_u8, 0x17_u8, 0xe6_u8, 0xfc_u8, 0xf9_u8, 0x4c_u8, 0xb7_u8])
  struct ISyncFilterInfo
    lpVtbl : ISyncFilterInfoVTbl*
  end

  struct ISyncFilterInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    get_flags : UInt64
  end

  ISyncFilterInfo2_GUID = "19b394ba-e3d0-468c-934d-321968b2ab34"
  IID_ISyncFilterInfo2 = LibC::GUID.new(0x19b394ba_u32, 0xe3d0_u16, 0x468c_u16, StaticArray[0x93_u8, 0x4d_u8, 0x32_u8, 0x19_u8, 0x68_u8, 0xb2_u8, 0xab_u8, 0x34_u8])
  struct ISyncFilterInfo2
    lpVtbl : ISyncFilterInfo2VTbl*
  end

  struct IChangeUnitListFilterInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    initialize : UInt64
    get_change_unit_id_count : UInt64
    get_change_unit_id : UInt64
  end

  IChangeUnitListFilterInfo_GUID = "f2837671-0bdf-43fa-b502-232375fb50c2"
  IID_IChangeUnitListFilterInfo = LibC::GUID.new(0xf2837671_u32, 0xbdf_u16, 0x43fa_u16, StaticArray[0xb5_u8, 0x2_u8, 0x23_u8, 0x23_u8, 0x75_u8, 0xfb_u8, 0x50_u8, 0xc2_u8])
  struct IChangeUnitListFilterInfo
    lpVtbl : IChangeUnitListFilterInfoVTbl*
  end

  struct ISyncFilterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_identical : UInt64
    serialize : UInt64
  end

  ISyncFilter_GUID = "087a3f15-0fcb-44c1-9639-53c14e2b5506"
  IID_ISyncFilter = LibC::GUID.new(0x87a3f15_u32, 0xfcb_u16, 0x44c1_u16, StaticArray[0x96_u8, 0x39_u8, 0x53_u8, 0xc1_u8, 0x4e_u8, 0x2b_u8, 0x55_u8, 0x6_u8])
  struct ISyncFilter
    lpVtbl : ISyncFilterVTbl*
  end

  struct ISyncFilterDeserializerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    deserialize_sync_filter : UInt64
  end

  ISyncFilterDeserializer_GUID = "b45b7a72-e5c7-46be-9c82-77b8b15dab8a"
  IID_ISyncFilterDeserializer = LibC::GUID.new(0xb45b7a72_u32, 0xe5c7_u16, 0x46be_u16, StaticArray[0x9c_u8, 0x82_u8, 0x77_u8, 0xb8_u8, 0xb1_u8, 0x5d_u8, 0xab_u8, 0x8a_u8])
  struct ISyncFilterDeserializer
    lpVtbl : ISyncFilterDeserializerVTbl*
  end

  struct ICustomFilterInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    get_sync_filter : UInt64
  end

  ICustomFilterInfo_GUID = "1d335dff-6f88-4e4d-91a8-a3f351cfd473"
  IID_ICustomFilterInfo = LibC::GUID.new(0x1d335dff_u32, 0x6f88_u16, 0x4e4d_u16, StaticArray[0x91_u8, 0xa8_u8, 0xa3_u8, 0xf3_u8, 0x51_u8, 0xcf_u8, 0xd4_u8, 0x73_u8])
  struct ICustomFilterInfo
    lpVtbl : ICustomFilterInfoVTbl*
  end

  struct ICombinedFilterInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    get_filter_count : UInt64
    get_filter_info : UInt64
    get_filter_combination_type : UInt64
  end

  ICombinedFilterInfo_GUID = "11f9de71-2818-4779-b2ac-42d450565f45"
  IID_ICombinedFilterInfo = LibC::GUID.new(0x11f9de71_u32, 0x2818_u16, 0x4779_u16, StaticArray[0xb2_u8, 0xac_u8, 0x42_u8, 0xd4_u8, 0x50_u8, 0x56_u8, 0x5f_u8, 0x45_u8])
  struct ICombinedFilterInfo
    lpVtbl : ICombinedFilterInfoVTbl*
  end

  struct IEnumSyncChangesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumSyncChanges_GUID = "5f86be4a-5e78-4e32-ac1c-c24fd223ef85"
  IID_IEnumSyncChanges = LibC::GUID.new(0x5f86be4a_u32, 0x5e78_u16, 0x4e32_u16, StaticArray[0xac_u8, 0x1c_u8, 0xc2_u8, 0x4f_u8, 0xd2_u8, 0x23_u8, 0xef_u8, 0x85_u8])
  struct IEnumSyncChanges
    lpVtbl : IEnumSyncChangesVTbl*
  end

  struct ISyncChangeBuilderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_change_unit_metadata : UInt64
  end

  ISyncChangeBuilder_GUID = "56f14771-8677-484f-a170-e386e418a676"
  IID_ISyncChangeBuilder = LibC::GUID.new(0x56f14771_u32, 0x8677_u16, 0x484f_u16, StaticArray[0xa1_u8, 0x70_u8, 0xe3_u8, 0x86_u8, 0xe4_u8, 0x18_u8, 0xa6_u8, 0x76_u8])
  struct ISyncChangeBuilder
    lpVtbl : ISyncChangeBuilderVTbl*
  end

  struct IFilterTrackingSyncChangeBuilderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_filter_change : UInt64
    set_all_change_units_present_flag : UInt64
  end

  IFilterTrackingSyncChangeBuilder_GUID = "295024a0-70da-4c58-883c-ce2afb308d0b"
  IID_IFilterTrackingSyncChangeBuilder = LibC::GUID.new(0x295024a0_u32, 0x70da_u16, 0x4c58_u16, StaticArray[0x88_u8, 0x3c_u8, 0xce_u8, 0x2a_u8, 0xfb_u8, 0x30_u8, 0x8d_u8, 0xb_u8])
  struct IFilterTrackingSyncChangeBuilder
    lpVtbl : IFilterTrackingSyncChangeBuilderVTbl*
  end

  struct ISyncChangeBatchBaseVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_change_enumerator : UInt64
    get_is_last_batch : UInt64
    get_work_estimate_for_batch : UInt64
    get_remaining_work_estimate_for_session : UInt64
    begin_ordered_group : UInt64
    end_ordered_group : UInt64
    add_item_metadata_to_group : UInt64
    get_learned_knowledge : UInt64
    get_prerequisite_knowledge : UInt64
    get_source_forgotten_knowledge : UInt64
    set_last_batch : UInt64
    set_work_estimate_for_batch : UInt64
    set_remaining_work_estimate_for_session : UInt64
    serialize : UInt64
  end

  ISyncChangeBatchBase_GUID = "52f6e694-6a71-4494-a184-a8311bf5d227"
  IID_ISyncChangeBatchBase = LibC::GUID.new(0x52f6e694_u32, 0x6a71_u16, 0x4494_u16, StaticArray[0xa1_u8, 0x84_u8, 0xa8_u8, 0x31_u8, 0x1b_u8, 0xf5_u8, 0xd2_u8, 0x27_u8])
  struct ISyncChangeBatchBase
    lpVtbl : ISyncChangeBatchBaseVTbl*
  end

  struct ISyncChangeBatchVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_change_enumerator : UInt64
    get_is_last_batch : UInt64
    get_work_estimate_for_batch : UInt64
    get_remaining_work_estimate_for_session : UInt64
    begin_ordered_group : UInt64
    end_ordered_group : UInt64
    add_item_metadata_to_group : UInt64
    get_learned_knowledge : UInt64
    get_prerequisite_knowledge : UInt64
    get_source_forgotten_knowledge : UInt64
    set_last_batch : UInt64
    set_work_estimate_for_batch : UInt64
    set_remaining_work_estimate_for_session : UInt64
    serialize : UInt64
    begin_unordered_group : UInt64
    end_unordered_group : UInt64
    add_logged_conflict : UInt64
  end

  ISyncChangeBatch_GUID = "70c64dee-380f-4c2e-8f70-31c55bd5f9b3"
  IID_ISyncChangeBatch = LibC::GUID.new(0x70c64dee_u32, 0x380f_u16, 0x4c2e_u16, StaticArray[0x8f_u8, 0x70_u8, 0x31_u8, 0xc5_u8, 0x5b_u8, 0xd5_u8, 0xf9_u8, 0xb3_u8])
  struct ISyncChangeBatch
    lpVtbl : ISyncChangeBatchVTbl*
  end

  struct ISyncFullEnumerationChangeBatchVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_change_enumerator : UInt64
    get_is_last_batch : UInt64
    get_work_estimate_for_batch : UInt64
    get_remaining_work_estimate_for_session : UInt64
    begin_ordered_group : UInt64
    end_ordered_group : UInt64
    add_item_metadata_to_group : UInt64
    get_learned_knowledge : UInt64
    get_prerequisite_knowledge : UInt64
    get_source_forgotten_knowledge : UInt64
    set_last_batch : UInt64
    set_work_estimate_for_batch : UInt64
    set_remaining_work_estimate_for_session : UInt64
    serialize : UInt64
    get_learned_knowledge_after_recovery_complete : UInt64
    get_closed_lower_bound_item_id : UInt64
    get_closed_upper_bound_item_id : UInt64
  end

  ISyncFullEnumerationChangeBatch_GUID = "ef64197d-4f44-4ea2-b355-4524713e3bed"
  IID_ISyncFullEnumerationChangeBatch = LibC::GUID.new(0xef64197d_u32, 0x4f44_u16, 0x4ea2_u16, StaticArray[0xb3_u8, 0x55_u8, 0x45_u8, 0x24_u8, 0x71_u8, 0x3e_u8, 0x3b_u8, 0xed_u8])
  struct ISyncFullEnumerationChangeBatch
    lpVtbl : ISyncFullEnumerationChangeBatchVTbl*
  end

  struct ISyncChangeBatchWithPrerequisiteVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_change_enumerator : UInt64
    get_is_last_batch : UInt64
    get_work_estimate_for_batch : UInt64
    get_remaining_work_estimate_for_session : UInt64
    begin_ordered_group : UInt64
    end_ordered_group : UInt64
    add_item_metadata_to_group : UInt64
    get_learned_knowledge : UInt64
    get_prerequisite_knowledge : UInt64
    get_source_forgotten_knowledge : UInt64
    set_last_batch : UInt64
    set_work_estimate_for_batch : UInt64
    set_remaining_work_estimate_for_session : UInt64
    serialize : UInt64
    set_prerequisite_knowledge : UInt64
    get_learned_knowledge_with_prerequisite : UInt64
    get_learned_forgotten_knowledge : UInt64
  end

  ISyncChangeBatchWithPrerequisite_GUID = "097f13be-5b92-4048-b3f2-7b42a2515e07"
  IID_ISyncChangeBatchWithPrerequisite = LibC::GUID.new(0x97f13be_u32, 0x5b92_u16, 0x4048_u16, StaticArray[0xb3_u8, 0xf2_u8, 0x7b_u8, 0x42_u8, 0xa2_u8, 0x51_u8, 0x5e_u8, 0x7_u8])
  struct ISyncChangeBatchWithPrerequisite
    lpVtbl : ISyncChangeBatchWithPrerequisiteVTbl*
  end

  struct ISyncChangeBatchBase2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_change_enumerator : UInt64
    get_is_last_batch : UInt64
    get_work_estimate_for_batch : UInt64
    get_remaining_work_estimate_for_session : UInt64
    begin_ordered_group : UInt64
    end_ordered_group : UInt64
    add_item_metadata_to_group : UInt64
    get_learned_knowledge : UInt64
    get_prerequisite_knowledge : UInt64
    get_source_forgotten_knowledge : UInt64
    set_last_batch : UInt64
    set_work_estimate_for_batch : UInt64
    set_remaining_work_estimate_for_session : UInt64
    serialize : UInt64
    serialize_with_options : UInt64
  end

  ISyncChangeBatchBase2_GUID = "6fdb596a-d755-4584-bd0c-c0c23a548fbf"
  IID_ISyncChangeBatchBase2 = LibC::GUID.new(0x6fdb596a_u32, 0xd755_u16, 0x4584_u16, StaticArray[0xbd_u8, 0xc_u8, 0xc0_u8, 0xc2_u8, 0x3a_u8, 0x54_u8, 0x8f_u8, 0xbf_u8])
  struct ISyncChangeBatchBase2
    lpVtbl : ISyncChangeBatchBase2VTbl*
  end

  struct ISyncChangeBatchAdvancedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_filter_info : UInt64
    convert_full_enumeration_change_batch_to_regular_change_batch : UInt64
    get_upper_bound_item_id : UInt64
    get_batch_level_knowledge_should_be_applied : UInt64
  end

  ISyncChangeBatchAdvanced_GUID = "0f1a4995-cbc8-421d-b550-5d0bebf3e9a5"
  IID_ISyncChangeBatchAdvanced = LibC::GUID.new(0xf1a4995_u32, 0xcbc8_u16, 0x421d_u16, StaticArray[0xb5_u8, 0x50_u8, 0x5d_u8, 0xb_u8, 0xeb_u8, 0xf3_u8, 0xe9_u8, 0xa5_u8])
  struct ISyncChangeBatchAdvanced
    lpVtbl : ISyncChangeBatchAdvancedVTbl*
  end

  struct ISyncChangeBatch2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_change_enumerator : UInt64
    get_is_last_batch : UInt64
    get_work_estimate_for_batch : UInt64
    get_remaining_work_estimate_for_session : UInt64
    begin_ordered_group : UInt64
    end_ordered_group : UInt64
    add_item_metadata_to_group : UInt64
    get_learned_knowledge : UInt64
    get_prerequisite_knowledge : UInt64
    get_source_forgotten_knowledge : UInt64
    set_last_batch : UInt64
    set_work_estimate_for_batch : UInt64
    set_remaining_work_estimate_for_session : UInt64
    serialize : UInt64
    begin_unordered_group : UInt64
    end_unordered_group : UInt64
    add_logged_conflict : UInt64
    add_merge_tombstone_metadata_to_group : UInt64
    add_merge_tombstone_logged_conflict : UInt64
  end

  ISyncChangeBatch2_GUID = "225f4a33-f5ee-4cc7-b039-67a262b4b2ac"
  IID_ISyncChangeBatch2 = LibC::GUID.new(0x225f4a33_u32, 0xf5ee_u16, 0x4cc7_u16, StaticArray[0xb0_u8, 0x39_u8, 0x67_u8, 0xa2_u8, 0x62_u8, 0xb4_u8, 0xb2_u8, 0xac_u8])
  struct ISyncChangeBatch2
    lpVtbl : ISyncChangeBatch2VTbl*
  end

  struct ISyncFullEnumerationChangeBatch2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_change_enumerator : UInt64
    get_is_last_batch : UInt64
    get_work_estimate_for_batch : UInt64
    get_remaining_work_estimate_for_session : UInt64
    begin_ordered_group : UInt64
    end_ordered_group : UInt64
    add_item_metadata_to_group : UInt64
    get_learned_knowledge : UInt64
    get_prerequisite_knowledge : UInt64
    get_source_forgotten_knowledge : UInt64
    set_last_batch : UInt64
    set_work_estimate_for_batch : UInt64
    set_remaining_work_estimate_for_session : UInt64
    serialize : UInt64
    get_learned_knowledge_after_recovery_complete : UInt64
    get_closed_lower_bound_item_id : UInt64
    get_closed_upper_bound_item_id : UInt64
    add_merge_tombstone_metadata_to_group : UInt64
  end

  ISyncFullEnumerationChangeBatch2_GUID = "e06449f4-a205-4b65-9724-01b22101eec1"
  IID_ISyncFullEnumerationChangeBatch2 = LibC::GUID.new(0xe06449f4_u32, 0xa205_u16, 0x4b65_u16, StaticArray[0x97_u8, 0x24_u8, 0x1_u8, 0xb2_u8, 0x21_u8, 0x1_u8, 0xee_u8, 0xc1_u8])
  struct ISyncFullEnumerationChangeBatch2
    lpVtbl : ISyncFullEnumerationChangeBatch2VTbl*
  end

  struct IKnowledgeSyncProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_id_parameters : UInt64
    begin_session : UInt64
    get_sync_batch_parameters : UInt64
    get_change_batch : UInt64
    get_full_enumeration_change_batch : UInt64
    process_change_batch : UInt64
    process_full_enumeration_change_batch : UInt64
    end_session : UInt64
  end

  IKnowledgeSyncProvider_GUID = "43434a49-8da4-47f2-8172-ad7b8b024978"
  IID_IKnowledgeSyncProvider = LibC::GUID.new(0x43434a49_u32, 0x8da4_u16, 0x47f2_u16, StaticArray[0x81_u8, 0x72_u8, 0xad_u8, 0x7b_u8, 0x8b_u8, 0x2_u8, 0x49_u8, 0x78_u8])
  struct IKnowledgeSyncProvider
    lpVtbl : IKnowledgeSyncProviderVTbl*
  end

  struct ISyncChangeUnitVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_change : UInt64
    get_change_unit_id : UInt64
    get_change_unit_version : UInt64
  end

  ISyncChangeUnit_GUID = "60edd8ca-7341-4bb7-95ce-fab6394b51cb"
  IID_ISyncChangeUnit = LibC::GUID.new(0x60edd8ca_u32, 0x7341_u16, 0x4bb7_u16, StaticArray[0x95_u8, 0xce_u8, 0xfa_u8, 0xb6_u8, 0x39_u8, 0x4b_u8, 0x51_u8, 0xcb_u8])
  struct ISyncChangeUnit
    lpVtbl : ISyncChangeUnitVTbl*
  end

  struct IEnumSyncChangeUnitsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumSyncChangeUnits_GUID = "346b35f1-8703-4c6d-ab1a-4dbca2cff97f"
  IID_IEnumSyncChangeUnits = LibC::GUID.new(0x346b35f1_u32, 0x8703_u16, 0x4c6d_u16, StaticArray[0xab_u8, 0x1a_u8, 0x4d_u8, 0xbc_u8, 0xa2_u8, 0xcf_u8, 0xf9_u8, 0x7f_u8])
  struct IEnumSyncChangeUnits
    lpVtbl : IEnumSyncChangeUnitsVTbl*
  end

  struct ISyncChangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner_replica_id : UInt64
    get_root_item_id : UInt64
    get_change_version : UInt64
    get_creation_version : UInt64
    get_flags : UInt64
    get_work_estimate : UInt64
    get_change_units : UInt64
    get_made_with_knowledge : UInt64
    get_learned_knowledge : UInt64
    set_work_estimate : UInt64
  end

  ISyncChange_GUID = "a1952beb-0f6b-4711-b136-01da85b968a6"
  IID_ISyncChange = LibC::GUID.new(0xa1952beb_u32, 0xf6b_u16, 0x4711_u16, StaticArray[0xb1_u8, 0x36_u8, 0x1_u8, 0xda_u8, 0x85_u8, 0xb9_u8, 0x68_u8, 0xa6_u8])
  struct ISyncChange
    lpVtbl : ISyncChangeVTbl*
  end

  struct ISyncChangeWithPrerequisiteVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_prerequisite_knowledge : UInt64
    get_learned_knowledge_with_prerequisite : UInt64
  end

  ISyncChangeWithPrerequisite_GUID = "9e38382f-1589-48c3-92e4-05ecdcb4f3f7"
  IID_ISyncChangeWithPrerequisite = LibC::GUID.new(0x9e38382f_u32, 0x1589_u16, 0x48c3_u16, StaticArray[0x92_u8, 0xe4_u8, 0x5_u8, 0xec_u8, 0xdc_u8, 0xb4_u8, 0xf3_u8, 0xf7_u8])
  struct ISyncChangeWithPrerequisite
    lpVtbl : ISyncChangeWithPrerequisiteVTbl*
  end

  struct ISyncFullEnumerationChangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_learned_knowledge_after_recovery_complete : UInt64
    get_learned_forgotten_knowledge : UInt64
  end

  ISyncFullEnumerationChange_GUID = "9785e0bd-bdff-40c4-98c5-b34b2f1991b3"
  IID_ISyncFullEnumerationChange = LibC::GUID.new(0x9785e0bd_u32, 0xbdff_u16, 0x40c4_u16, StaticArray[0x98_u8, 0xc5_u8, 0xb3_u8, 0x4b_u8, 0x2f_u8, 0x19_u8, 0x91_u8, 0xb3_u8])
  struct ISyncFullEnumerationChange
    lpVtbl : ISyncFullEnumerationChangeVTbl*
  end

  struct ISyncMergeTombstoneChangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_winner_item_id : UInt64
  end

  ISyncMergeTombstoneChange_GUID = "6ec62597-0903-484c-ad61-36d6e938f47b"
  IID_ISyncMergeTombstoneChange = LibC::GUID.new(0x6ec62597_u32, 0x903_u16, 0x484c_u16, StaticArray[0xad_u8, 0x61_u8, 0x36_u8, 0xd6_u8, 0xe9_u8, 0x38_u8, 0xf4_u8, 0x7b_u8])
  struct ISyncMergeTombstoneChange
    lpVtbl : ISyncMergeTombstoneChangeVTbl*
  end

  struct IEnumItemIdsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
  end

  IEnumItemIds_GUID = "43aa3f61-4b2e-4b60-83df-b110d3e148f1"
  IID_IEnumItemIds = LibC::GUID.new(0x43aa3f61_u32, 0x4b2e_u16, 0x4b60_u16, StaticArray[0x83_u8, 0xdf_u8, 0xb1_u8, 0x10_u8, 0xd3_u8, 0xe1_u8, 0x48_u8, 0xf1_u8])
  struct IEnumItemIds
    lpVtbl : IEnumItemIdsVTbl*
  end

  struct IFilterKeyMapVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    add_filter : UInt64
    get_filter : UInt64
    serialize : UInt64
  end

  IFilterKeyMap_GUID = "ca169652-07c6-4708-a3da-6e4eba8d2297"
  IID_IFilterKeyMap = LibC::GUID.new(0xca169652_u32, 0x7c6_u16, 0x4708_u16, StaticArray[0xa3_u8, 0xda_u8, 0x6e_u8, 0x4e_u8, 0xba_u8, 0x8d_u8, 0x22_u8, 0x97_u8])
  struct IFilterKeyMap
    lpVtbl : IFilterKeyMapVTbl*
  end

  struct ISyncChangeWithFilterKeyMapVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_filter_count : UInt64
    get_filter_change : UInt64
    get_all_change_units_present_flag : UInt64
    get_filter_forgotten_knowledge : UInt64
    get_filtered_replica_learned_knowledge : UInt64
    get_learned_filter_forgotten_knowledge : UInt64
    get_filtered_replica_learned_forgotten_knowledge : UInt64
    get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete : UInt64
    get_learned_filter_forgotten_knowledge_after_recovery_complete : UInt64
  end

  ISyncChangeWithFilterKeyMap_GUID = "bfe1ef00-e87d-42fd-a4e9-242d70414aef"
  IID_ISyncChangeWithFilterKeyMap = LibC::GUID.new(0xbfe1ef00_u32, 0xe87d_u16, 0x42fd_u16, StaticArray[0xa4_u8, 0xe9_u8, 0x24_u8, 0x2d_u8, 0x70_u8, 0x41_u8, 0x4a_u8, 0xef_u8])
  struct ISyncChangeWithFilterKeyMap
    lpVtbl : ISyncChangeWithFilterKeyMapVTbl*
  end

  struct ISyncChangeBatchWithFilterKeyMapVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_filter_key_map : UInt64
    set_filter_key_map : UInt64
    set_filter_forgotten_knowledge : UInt64
    get_filtered_replica_learned_knowledge : UInt64
    get_learned_filter_forgotten_knowledge : UInt64
    get_filtered_replica_learned_forgotten_knowledge : UInt64
    get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete : UInt64
    get_learned_filter_forgotten_knowledge_after_recovery_complete : UInt64
  end

  ISyncChangeBatchWithFilterKeyMap_GUID = "de247002-566d-459a-a6ed-a5aab3459fb7"
  IID_ISyncChangeBatchWithFilterKeyMap = LibC::GUID.new(0xde247002_u32, 0x566d_u16, 0x459a_u16, StaticArray[0xa6_u8, 0xed_u8, 0xa5_u8, 0xaa_u8, 0xb3_u8, 0x45_u8, 0x9f_u8, 0xb7_u8])
  struct ISyncChangeBatchWithFilterKeyMap
    lpVtbl : ISyncChangeBatchWithFilterKeyMapVTbl*
  end

  struct IDataRetrieverCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load_change_data_complete : UInt64
    load_change_data_error : UInt64
  end

  IDataRetrieverCallback_GUID = "71b4863b-f969-4676-bbc3-3d9fdc3fb2c7"
  IID_IDataRetrieverCallback = LibC::GUID.new(0x71b4863b_u32, 0xf969_u16, 0x4676_u16, StaticArray[0xbb_u8, 0xc3_u8, 0x3d_u8, 0x9f_u8, 0xdc_u8, 0x3f_u8, 0xb2_u8, 0xc7_u8])
  struct IDataRetrieverCallback
    lpVtbl : IDataRetrieverCallbackVTbl*
  end

  struct ILoadChangeContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_sync_change : UInt64
    set_recoverable_error_on_change : UInt64
    set_recoverable_error_on_change_unit : UInt64
  end

  ILoadChangeContext_GUID = "44a4aaca-ec39-46d5-b5c9-d633c0ee67e2"
  IID_ILoadChangeContext = LibC::GUID.new(0x44a4aaca_u32, 0xec39_u16, 0x46d5_u16, StaticArray[0xb5_u8, 0xc9_u8, 0xd6_u8, 0x33_u8, 0xc0_u8, 0xee_u8, 0x67_u8, 0xe2_u8])
  struct ILoadChangeContext
    lpVtbl : ILoadChangeContextVTbl*
  end

  struct ISynchronousDataRetrieverVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_id_parameters : UInt64
    load_change_data : UInt64
  end

  ISynchronousDataRetriever_GUID = "9b22f2a9-a4cd-4648-9d8e-3a510d4da04b"
  IID_ISynchronousDataRetriever = LibC::GUID.new(0x9b22f2a9_u32, 0xa4cd_u16, 0x4648_u16, StaticArray[0x9d_u8, 0x8e_u8, 0x3a_u8, 0x51_u8, 0xd_u8, 0x4d_u8, 0xa0_u8, 0x4b_u8])
  struct ISynchronousDataRetriever
    lpVtbl : ISynchronousDataRetrieverVTbl*
  end

  struct IAsynchronousDataRetrieverVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_id_parameters : UInt64
    register_callback : UInt64
    revoke_callback : UInt64
    load_change_data : UInt64
  end

  IAsynchronousDataRetriever_GUID = "9fc7e470-61ea-4a88-9be4-df56a27cfef2"
  IID_IAsynchronousDataRetriever = LibC::GUID.new(0x9fc7e470_u32, 0x61ea_u16, 0x4a88_u16, StaticArray[0x9b_u8, 0xe4_u8, 0xdf_u8, 0x56_u8, 0xa2_u8, 0x7c_u8, 0xfe_u8, 0xf2_u8])
  struct IAsynchronousDataRetriever
    lpVtbl : IAsynchronousDataRetrieverVTbl*
  end

  struct IFilterRequestCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    request_filter : UInt64
  end

  IFilterRequestCallback_GUID = "82df8873-6360-463a-a8a1-ede5e1a1594d"
  IID_IFilterRequestCallback = LibC::GUID.new(0x82df8873_u32, 0x6360_u16, 0x463a_u16, StaticArray[0xa8_u8, 0xa1_u8, 0xed_u8, 0xe5_u8, 0xe1_u8, 0xa1_u8, 0x59_u8, 0x4d_u8])
  struct IFilterRequestCallback
    lpVtbl : IFilterRequestCallbackVTbl*
  end

  struct IRequestFilteredSyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    specify_filter : UInt64
  end

  IRequestFilteredSync_GUID = "2e020184-6d18-46a7-a32a-da4aeb06696c"
  IID_IRequestFilteredSync = LibC::GUID.new(0x2e020184_u32, 0x6d18_u16, 0x46a7_u16, StaticArray[0xa3_u8, 0x2a_u8, 0xda_u8, 0x4a_u8, 0xeb_u8, 0x6_u8, 0x69_u8, 0x6c_u8])
  struct IRequestFilteredSync
    lpVtbl : IRequestFilteredSyncVTbl*
  end

  struct ISupportFilteredSyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_filter : UInt64
  end

  ISupportFilteredSync_GUID = "3d128ded-d555-4e0d-bf4b-fb213a8a9302"
  IID_ISupportFilteredSync = LibC::GUID.new(0x3d128ded_u32, 0xd555_u16, 0x4e0d_u16, StaticArray[0xbf_u8, 0x4b_u8, 0xfb_u8, 0x21_u8, 0x3a_u8, 0x8a_u8, 0x93_u8, 0x2_u8])
  struct ISupportFilteredSync
    lpVtbl : ISupportFilteredSyncVTbl*
  end

  struct IFilterTrackingRequestCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    request_tracked_filter : UInt64
  end

  IFilterTrackingRequestCallback_GUID = "713ca7bb-c858-4674-b4b6-1122436587a9"
  IID_IFilterTrackingRequestCallback = LibC::GUID.new(0x713ca7bb_u32, 0xc858_u16, 0x4674_u16, StaticArray[0xb4_u8, 0xb6_u8, 0x11_u8, 0x22_u8, 0x43_u8, 0x65_u8, 0x87_u8, 0xa9_u8])
  struct IFilterTrackingRequestCallback
    lpVtbl : IFilterTrackingRequestCallbackVTbl*
  end

  struct IFilterTrackingProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    specify_tracked_filters : UInt64
    add_tracked_filter : UInt64
  end

  IFilterTrackingProvider_GUID = "743383c0-fc4e-45ba-ad81-d9d84c7a24f8"
  IID_IFilterTrackingProvider = LibC::GUID.new(0x743383c0_u32, 0xfc4e_u16, 0x45ba_u16, StaticArray[0xad_u8, 0x81_u8, 0xd9_u8, 0xd8_u8, 0x4c_u8, 0x7a_u8, 0x24_u8, 0xf8_u8])
  struct IFilterTrackingProvider
    lpVtbl : IFilterTrackingProviderVTbl*
  end

  struct ISupportLastWriteTimeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_change_time : UInt64
    get_change_unit_change_time : UInt64
  end

  ISupportLastWriteTime_GUID = "eadf816f-d0bd-43ca-8f40-5acdc6c06f7a"
  IID_ISupportLastWriteTime = LibC::GUID.new(0xeadf816f_u32, 0xd0bd_u16, 0x43ca_u16, StaticArray[0x8f_u8, 0x40_u8, 0x5a_u8, 0xcd_u8, 0xc6_u8, 0xc0_u8, 0x6f_u8, 0x7a_u8])
  struct ISupportLastWriteTime
    lpVtbl : ISupportLastWriteTimeVTbl*
  end

  struct IProviderConverterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
  end

  IProviderConverter_GUID = "809b7276-98cf-4957-93a5-0ebdd3dddffd"
  IID_IProviderConverter = LibC::GUID.new(0x809b7276_u32, 0x98cf_u16, 0x4957_u16, StaticArray[0x93_u8, 0xa5_u8, 0xe_u8, 0xbd_u8, 0xd3_u8, 0xdd_u8, 0xdf_u8, 0xfd_u8])
  struct IProviderConverter
    lpVtbl : IProviderConverterVTbl*
  end

  struct ISyncDataConverterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    convert_data_retriever_from_provider_format : UInt64
    convert_data_retriever_to_provider_format : UInt64
    convert_data_from_provider_format : UInt64
    convert_data_to_provider_format : UInt64
  end

  ISyncDataConverter_GUID = "435d4861-68d5-44aa-a0f9-72a0b00ef9cf"
  IID_ISyncDataConverter = LibC::GUID.new(0x435d4861_u32, 0x68d5_u16, 0x44aa_u16, StaticArray[0xa0_u8, 0xf9_u8, 0x72_u8, 0xa0_u8, 0xb0_u8, 0xe_u8, 0xf9_u8, 0xcf_u8])
  struct ISyncDataConverter
    lpVtbl : ISyncDataConverterVTbl*
  end

  struct ISyncProviderRegistrationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_sync_provider_config_ui_registration_instance : UInt64
    unregister_sync_provider_config_ui : UInt64
    enumerate_sync_provider_config_u_is : UInt64
    create_sync_provider_registration_instance : UInt64
    unregister_sync_provider : UInt64
    get_sync_provider_config_ui_infofor_provider : UInt64
    enumerate_sync_providers : UInt64
    get_sync_provider_info : UInt64
    get_sync_provider_from_instance_id : UInt64
    get_sync_provider_config_ui_info : UInt64
    get_sync_provider_config_ui_from_instance_id : UInt64
    get_sync_provider_state : UInt64
    set_sync_provider_state : UInt64
    register_for_event : UInt64
    revoke_event : UInt64
    get_change : UInt64
  end

  ISyncProviderRegistration_GUID = "cb45953b-7624-47bc-a472-eb8cac6b222e"
  IID_ISyncProviderRegistration = LibC::GUID.new(0xcb45953b_u32, 0x7624_u16, 0x47bc_u16, StaticArray[0xa4_u8, 0x72_u8, 0xeb_u8, 0x8c_u8, 0xac_u8, 0x6b_u8, 0x22_u8, 0x2e_u8])
  struct ISyncProviderRegistration
    lpVtbl : ISyncProviderRegistrationVTbl*
  end

  struct IEnumSyncProviderConfigUIInfosVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumSyncProviderConfigUIInfos_GUID = "f6be2602-17c6-4658-a2d7-68ed3330f641"
  IID_IEnumSyncProviderConfigUIInfos = LibC::GUID.new(0xf6be2602_u32, 0x17c6_u16, 0x4658_u16, StaticArray[0xa2_u8, 0xd7_u8, 0x68_u8, 0xed_u8, 0x33_u8, 0x30_u8, 0xf6_u8, 0x41_u8])
  struct IEnumSyncProviderConfigUIInfos
    lpVtbl : IEnumSyncProviderConfigUIInfosVTbl*
  end

  struct IEnumSyncProviderInfosVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumSyncProviderInfos_GUID = "a04ba850-5eb1-460d-a973-393fcb608a11"
  IID_IEnumSyncProviderInfos = LibC::GUID.new(0xa04ba850_u32, 0x5eb1_u16, 0x460d_u16, StaticArray[0xa9_u8, 0x73_u8, 0x39_u8, 0x3f_u8, 0xcb_u8, 0x60_u8, 0x8a_u8, 0x11_u8])
  struct IEnumSyncProviderInfos
    lpVtbl : IEnumSyncProviderInfosVTbl*
  end

  struct ISyncProviderInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    get_value : UInt64
    set_value : UInt64
    commit : UInt64
    get_sync_provider : UInt64
  end

  ISyncProviderInfo_GUID = "1ee135de-88a4-4504-b0d0-f7920d7e5ba6"
  IID_ISyncProviderInfo = LibC::GUID.new(0x1ee135de_u32, 0x88a4_u16, 0x4504_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xf7_u8, 0x92_u8, 0xd_u8, 0x7e_u8, 0x5b_u8, 0xa6_u8])
  struct ISyncProviderInfo
    lpVtbl : ISyncProviderInfoVTbl*
  end

  struct ISyncProviderConfigUIInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    get_value : UInt64
    set_value : UInt64
    commit : UInt64
    get_sync_provider_config_ui : UInt64
  end

  ISyncProviderConfigUIInfo_GUID = "214141ae-33d7-4d8d-8e37-f227e880ce50"
  IID_ISyncProviderConfigUIInfo = LibC::GUID.new(0x214141ae_u32, 0x33d7_u16, 0x4d8d_u16, StaticArray[0x8e_u8, 0x37_u8, 0xf2_u8, 0x27_u8, 0xe8_u8, 0x80_u8, 0xce_u8, 0x50_u8])
  struct ISyncProviderConfigUIInfo
    lpVtbl : ISyncProviderConfigUIInfoVTbl*
  end

  struct ISyncProviderConfigUIVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    init : UInt64
    get_registered_properties : UInt64
    create_and_register_new_sync_provider : UInt64
    modify_sync_provider : UInt64
  end

  ISyncProviderConfigUI_GUID = "7b0705f6-cbcd-4071-ab05-3bdc364d4a0c"
  IID_ISyncProviderConfigUI = LibC::GUID.new(0x7b0705f6_u32, 0xcbcd_u16, 0x4071_u16, StaticArray[0xab_u8, 0x5_u8, 0x3b_u8, 0xdc_u8, 0x36_u8, 0x4d_u8, 0x4a_u8, 0xc_u8])
  struct ISyncProviderConfigUI
    lpVtbl : ISyncProviderConfigUIVTbl*
  end

  struct IRegisteredSyncProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    init : UInt64
    get_instance_id : UInt64
    reset : UInt64
  end

  IRegisteredSyncProvider_GUID = "913bcf76-47c1-40b5-a896-5e8a9c414c14"
  IID_IRegisteredSyncProvider = LibC::GUID.new(0x913bcf76_u32, 0x47c1_u16, 0x40b5_u16, StaticArray[0xa8_u8, 0x96_u8, 0x5e_u8, 0x8a_u8, 0x9c_u8, 0x41_u8, 0x4c_u8, 0x14_u8])
  struct IRegisteredSyncProvider
    lpVtbl : IRegisteredSyncProviderVTbl*
  end

  struct ISyncRegistrationChangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_event : UInt64
    get_instance_id : UInt64
  end

  ISyncRegistrationChange_GUID = "eea0d9ae-6b29-43b4-9e70-e3ae33bb2c3b"
  IID_ISyncRegistrationChange = LibC::GUID.new(0xeea0d9ae_u32, 0x6b29_u16, 0x43b4_u16, StaticArray[0x9e_u8, 0x70_u8, 0xe3_u8, 0xae_u8, 0x33_u8, 0xbb_u8, 0x2c_u8, 0x3b_u8])
  struct ISyncRegistrationChange
    lpVtbl : ISyncRegistrationChangeVTbl*
  end

end
struct LibWin32::IClockVectorElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_replica_key(pdwreplicakey : UInt32*) : HRESULT
    @lpVtbl.value.get_replica_key.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwreplicakey)
  end
  def get_tick_count(pulltickcount : UInt64*) : HRESULT
    @lpVtbl.value.get_tick_count.unsafe_as(Proc(UInt64*, HRESULT)).call(pulltickcount)
  end
end
struct LibWin32::IFeedClockVectorElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_replica_key(pdwreplicakey : UInt32*) : HRESULT
    @lpVtbl.value.get_replica_key.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwreplicakey)
  end
  def get_tick_count(pulltickcount : UInt64*) : HRESULT
    @lpVtbl.value.get_tick_count.unsafe_as(Proc(UInt64*, HRESULT)).call(pulltickcount)
  end
  def get_sync_time(psynctime : SYNC_TIME*) : HRESULT
    @lpVtbl.value.get_sync_time.unsafe_as(Proc(SYNC_TIME*, HRESULT)).call(psynctime)
  end
  def get_flags(pbflags : UInt8*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt8*, HRESULT)).call(pbflags)
  end
end
struct LibWin32::IClockVector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_clock_vector_elements(riid : Guid*, ppienumclockvector : Void**) : HRESULT
    @lpVtbl.value.get_clock_vector_elements.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppienumclockvector)
  end
  def get_clock_vector_element_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_clock_vector_element_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
end
struct LibWin32::IFeedClockVector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_clock_vector_elements(riid : Guid*, ppienumclockvector : Void**) : HRESULT
    @lpVtbl.value.get_clock_vector_elements.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppienumclockvector)
  end
  def get_clock_vector_element_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_clock_vector_element_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def get_update_count(pdwupdatecount : UInt32*) : HRESULT
    @lpVtbl.value.get_update_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwupdatecount)
  end
  def is_no_conflicts_specified(pfisnoconflictsspecified : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_no_conflicts_specified.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfisnoconflictsspecified)
  end
end
struct LibWin32::IEnumClockVector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cclockvectorelements : UInt32, ppiclockvectorelements : IClockVectorElement*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IClockVectorElement*, UInt32*, HRESULT)).call(cclockvectorelements, ppiclockvectorelements, pcfetched)
  end
  def skip(csyncversions : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(csyncversions)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppienum : IEnumClockVector*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumClockVector*, HRESULT)).call(ppienum)
  end
end
struct LibWin32::IEnumFeedClockVector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cclockvectorelements : UInt32, ppiclockvectorelements : IFeedClockVectorElement*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IFeedClockVectorElement*, UInt32*, HRESULT)).call(cclockvectorelements, ppiclockvectorelements, pcfetched)
  end
  def skip(csyncversions : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(csyncversions)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppienum : IEnumFeedClockVector*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumFeedClockVector*, HRESULT)).call(ppienum)
  end
end
struct LibWin32::ICoreFragment
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next_column(pchangeunitid : UInt8*, pchangeunitidsize : UInt32*) : HRESULT
    @lpVtbl.value.next_column.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pchangeunitid, pchangeunitidsize)
  end
  def next_range(pitemid : UInt8*, pitemidsize : UInt32*, piclockvector : IClockVector*) : HRESULT
    @lpVtbl.value.next_range.unsafe_as(Proc(UInt8*, UInt32*, IClockVector*, HRESULT)).call(pitemid, pitemidsize, piclockvector)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def get_column_count(pcolumncount : UInt32*) : HRESULT
    @lpVtbl.value.get_column_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolumncount)
  end
  def get_range_count(prangecount : UInt32*) : HRESULT
    @lpVtbl.value.get_range_count.unsafe_as(Proc(UInt32*, HRESULT)).call(prangecount)
  end
end
struct LibWin32::ICoreFragmentInspector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next_core_fragments(requestedcount : UInt32, ppicorefragments : ICoreFragment*, pfetchedcount : UInt32*) : HRESULT
    @lpVtbl.value.next_core_fragments.unsafe_as(Proc(UInt32, ICoreFragment*, UInt32*, HRESULT)).call(requestedcount, ppicorefragments, pfetchedcount)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IRangeException
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_closed_range_start(pbclosedrangestart : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_closed_range_start.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbclosedrangestart, pcbidsize)
  end
  def get_closed_range_end(pbclosedrangeend : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_closed_range_end.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbclosedrangeend, pcbidsize)
  end
  def get_clock_vector(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_clock_vector.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
end
struct LibWin32::IEnumRangeExceptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cexceptions : UInt32, pprangeexception : IRangeException*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IRangeException*, UInt32*, HRESULT)).call(cexceptions, pprangeexception, pcfetched)
  end
  def skip(cexceptions : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cexceptions)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumRangeExceptions*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumRangeExceptions*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ISingleItemException
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_id(pbitemid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_item_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbitemid, pcbidsize)
  end
  def get_clock_vector(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_clock_vector.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
end
struct LibWin32::IEnumSingleItemExceptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cexceptions : UInt32, ppsingleitemexception : ISingleItemException*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ISingleItemException*, UInt32*, HRESULT)).call(cexceptions, ppsingleitemexception, pcfetched)
  end
  def skip(cexceptions : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cexceptions)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSingleItemExceptions*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSingleItemExceptions*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IChangeUnitException
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_id(pbitemid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_item_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbitemid, pcbidsize)
  end
  def get_change_unit_id(pbchangeunitid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_change_unit_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangeunitid, pcbidsize)
  end
  def get_clock_vector(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_clock_vector.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
end
struct LibWin32::IEnumChangeUnitExceptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cexceptions : UInt32, ppchangeunitexception : IChangeUnitException*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IChangeUnitException*, UInt32*, HRESULT)).call(cexceptions, ppchangeunitexception, pcfetched)
  end
  def skip(cexceptions : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cexceptions)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumChangeUnitExceptions*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumChangeUnitExceptions*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IReplicaKeyMap
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def lookup_replica_key(pbreplicaid : UInt8*, pdwreplicakey : UInt32*) : HRESULT
    @lpVtbl.value.lookup_replica_key.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbreplicaid, pdwreplicakey)
  end
  def lookup_replica_id(dwreplicakey : UInt32, pbreplicaid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.lookup_replica_id.unsafe_as(Proc(UInt32, UInt8*, UInt32*, HRESULT)).call(dwreplicakey, pbreplicaid, pcbidsize)
  end
  def serialize(pbreplicakeymap : UInt8*, pcbreplicakeymap : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbreplicakeymap, pcbreplicakeymap)
  end
end
struct LibWin32::IConstructReplicaKeyMap
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def find_or_add_replica(pbreplicaid : UInt8*, pdwreplicakey : UInt32*) : HRESULT
    @lpVtbl.value.find_or_add_replica.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbreplicaid, pdwreplicakey)
  end
end
struct LibWin32::ISyncKnowledge
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner_replica_id(pbreplicaid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_owner_replica_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbreplicaid, pcbidsize)
  end
  def serialize(fserializereplicakeymap : LibC::BOOL, pbknowledge : UInt8*, pcbknowledge : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(LibC::BOOL, UInt8*, UInt32*, HRESULT)).call(fserializereplicakeymap, pbknowledge, pcbknowledge)
  end
  def set_local_tick_count(ulltickcount : UInt64) : HRESULT
    @lpVtbl.value.set_local_tick_count.unsafe_as(Proc(UInt64, HRESULT)).call(ulltickcount)
  end
  def contains_change(pbversionownerreplicaid : UInt8*, pgiditemid : UInt8*, psyncversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.contains_change.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, HRESULT)).call(pbversionownerreplicaid, pgiditemid, psyncversion)
  end
  def contains_change_unit(pbversionownerreplicaid : UInt8*, pbitemid : UInt8*, pbchangeunitid : UInt8*, psyncversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.contains_change_unit.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, SYNC_VERSION*, HRESULT)).call(pbversionownerreplicaid, pbitemid, pbchangeunitid, psyncversion)
  end
  def get_scope_vector(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_scope_vector.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def get_replica_key_map(ppreplicakeymap : IReplicaKeyMap*) : HRESULT
    @lpVtbl.value.get_replica_key_map.unsafe_as(Proc(IReplicaKeyMap*, HRESULT)).call(ppreplicakeymap)
  end
  def clone(ppclonedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppclonedknowledge)
  end
  def convert_version(pknowledgein : ISyncKnowledge, pbcurrentownerid : UInt8*, pversionin : SYNC_VERSION*, pbnewownerid : UInt8*, pcbidsize : UInt32*, pversionout : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.convert_version.unsafe_as(Proc(ISyncKnowledge, UInt8*, SYNC_VERSION*, UInt8*, UInt32*, SYNC_VERSION*, HRESULT)).call(pknowledgein, pbcurrentownerid, pversionin, pbnewownerid, pcbidsize, pversionout)
  end
  def map_remote_to_local(premoteknowledge : ISyncKnowledge, ppmappedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.map_remote_to_local.unsafe_as(Proc(ISyncKnowledge, ISyncKnowledge*, HRESULT)).call(premoteknowledge, ppmappedknowledge)
  end
  def union(pknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.union.unsafe_as(Proc(ISyncKnowledge, HRESULT)).call(pknowledge)
  end
  def project_onto_item(pbitemid : UInt8*, ppknowledgeout : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_item.unsafe_as(Proc(UInt8*, ISyncKnowledge*, HRESULT)).call(pbitemid, ppknowledgeout)
  end
  def project_onto_change_unit(pbitemid : UInt8*, pbchangeunitid : UInt8*, ppknowledgeout : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_change_unit.unsafe_as(Proc(UInt8*, UInt8*, ISyncKnowledge*, HRESULT)).call(pbitemid, pbchangeunitid, ppknowledgeout)
  end
  def project_onto_range(psrngsyncrange : SYNC_RANGE*, ppknowledgeout : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_range.unsafe_as(Proc(SYNC_RANGE*, ISyncKnowledge*, HRESULT)).call(psrngsyncrange, ppknowledgeout)
  end
  def exclude_item(pbitemid : UInt8*) : HRESULT
    @lpVtbl.value.exclude_item.unsafe_as(Proc(UInt8*, HRESULT)).call(pbitemid)
  end
  def exclude_change_unit(pbitemid : UInt8*, pbchangeunitid : UInt8*) : HRESULT
    @lpVtbl.value.exclude_change_unit.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(pbitemid, pbchangeunitid)
  end
  def contains_knowledge(pknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.contains_knowledge.unsafe_as(Proc(ISyncKnowledge, HRESULT)).call(pknowledge)
  end
  def find_min_tick_count_for_replica(pbreplicaid : UInt8*, pullreplicatickcount : UInt64*) : HRESULT
    @lpVtbl.value.find_min_tick_count_for_replica.unsafe_as(Proc(UInt8*, UInt64*, HRESULT)).call(pbreplicaid, pullreplicatickcount)
  end
  def get_range_exceptions(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_range_exceptions.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def get_single_item_exceptions(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_single_item_exceptions.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def get_change_unit_exceptions(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_change_unit_exceptions.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def find_clock_vector_for_item(pbitemid : UInt8*, riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.find_clock_vector_for_item.unsafe_as(Proc(UInt8*, Guid*, Void**, HRESULT)).call(pbitemid, riid, ppunk)
  end
  def find_clock_vector_for_change_unit(pbitemid : UInt8*, pbchangeunitid : UInt8*, riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.find_clock_vector_for_change_unit.unsafe_as(Proc(UInt8*, UInt8*, Guid*, Void**, HRESULT)).call(pbitemid, pbchangeunitid, riid, ppunk)
  end
  def get_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
end
struct LibWin32::IForgottenKnowledge
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner_replica_id(pbreplicaid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_owner_replica_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbreplicaid, pcbidsize)
  end
  def serialize(fserializereplicakeymap : LibC::BOOL, pbknowledge : UInt8*, pcbknowledge : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(LibC::BOOL, UInt8*, UInt32*, HRESULT)).call(fserializereplicakeymap, pbknowledge, pcbknowledge)
  end
  def set_local_tick_count(ulltickcount : UInt64) : HRESULT
    @lpVtbl.value.set_local_tick_count.unsafe_as(Proc(UInt64, HRESULT)).call(ulltickcount)
  end
  def contains_change(pbversionownerreplicaid : UInt8*, pgiditemid : UInt8*, psyncversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.contains_change.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, HRESULT)).call(pbversionownerreplicaid, pgiditemid, psyncversion)
  end
  def contains_change_unit(pbversionownerreplicaid : UInt8*, pbitemid : UInt8*, pbchangeunitid : UInt8*, psyncversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.contains_change_unit.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, SYNC_VERSION*, HRESULT)).call(pbversionownerreplicaid, pbitemid, pbchangeunitid, psyncversion)
  end
  def get_scope_vector(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_scope_vector.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def get_replica_key_map(ppreplicakeymap : IReplicaKeyMap*) : HRESULT
    @lpVtbl.value.get_replica_key_map.unsafe_as(Proc(IReplicaKeyMap*, HRESULT)).call(ppreplicakeymap)
  end
  def clone(ppclonedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppclonedknowledge)
  end
  def convert_version(pknowledgein : ISyncKnowledge, pbcurrentownerid : UInt8*, pversionin : SYNC_VERSION*, pbnewownerid : UInt8*, pcbidsize : UInt32*, pversionout : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.convert_version.unsafe_as(Proc(ISyncKnowledge, UInt8*, SYNC_VERSION*, UInt8*, UInt32*, SYNC_VERSION*, HRESULT)).call(pknowledgein, pbcurrentownerid, pversionin, pbnewownerid, pcbidsize, pversionout)
  end
  def map_remote_to_local(premoteknowledge : ISyncKnowledge, ppmappedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.map_remote_to_local.unsafe_as(Proc(ISyncKnowledge, ISyncKnowledge*, HRESULT)).call(premoteknowledge, ppmappedknowledge)
  end
  def union(pknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.union.unsafe_as(Proc(ISyncKnowledge, HRESULT)).call(pknowledge)
  end
  def project_onto_item(pbitemid : UInt8*, ppknowledgeout : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_item.unsafe_as(Proc(UInt8*, ISyncKnowledge*, HRESULT)).call(pbitemid, ppknowledgeout)
  end
  def project_onto_change_unit(pbitemid : UInt8*, pbchangeunitid : UInt8*, ppknowledgeout : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_change_unit.unsafe_as(Proc(UInt8*, UInt8*, ISyncKnowledge*, HRESULT)).call(pbitemid, pbchangeunitid, ppknowledgeout)
  end
  def project_onto_range(psrngsyncrange : SYNC_RANGE*, ppknowledgeout : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_range.unsafe_as(Proc(SYNC_RANGE*, ISyncKnowledge*, HRESULT)).call(psrngsyncrange, ppknowledgeout)
  end
  def exclude_item(pbitemid : UInt8*) : HRESULT
    @lpVtbl.value.exclude_item.unsafe_as(Proc(UInt8*, HRESULT)).call(pbitemid)
  end
  def exclude_change_unit(pbitemid : UInt8*, pbchangeunitid : UInt8*) : HRESULT
    @lpVtbl.value.exclude_change_unit.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(pbitemid, pbchangeunitid)
  end
  def contains_knowledge(pknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.contains_knowledge.unsafe_as(Proc(ISyncKnowledge, HRESULT)).call(pknowledge)
  end
  def find_min_tick_count_for_replica(pbreplicaid : UInt8*, pullreplicatickcount : UInt64*) : HRESULT
    @lpVtbl.value.find_min_tick_count_for_replica.unsafe_as(Proc(UInt8*, UInt64*, HRESULT)).call(pbreplicaid, pullreplicatickcount)
  end
  def get_range_exceptions(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_range_exceptions.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def get_single_item_exceptions(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_single_item_exceptions.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def get_change_unit_exceptions(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_change_unit_exceptions.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def find_clock_vector_for_item(pbitemid : UInt8*, riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.find_clock_vector_for_item.unsafe_as(Proc(UInt8*, Guid*, Void**, HRESULT)).call(pbitemid, riid, ppunk)
  end
  def find_clock_vector_for_change_unit(pbitemid : UInt8*, pbchangeunitid : UInt8*, riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.find_clock_vector_for_change_unit.unsafe_as(Proc(UInt8*, UInt8*, Guid*, Void**, HRESULT)).call(pbitemid, pbchangeunitid, riid, ppunk)
  end
  def get_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def forget_to_version(pknowledge : ISyncKnowledge, pversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.forget_to_version.unsafe_as(Proc(ISyncKnowledge, SYNC_VERSION*, HRESULT)).call(pknowledge, pversion)
  end
end
struct LibWin32::ISyncKnowledge2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner_replica_id(pbreplicaid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_owner_replica_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbreplicaid, pcbidsize)
  end
  def serialize(fserializereplicakeymap : LibC::BOOL, pbknowledge : UInt8*, pcbknowledge : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(LibC::BOOL, UInt8*, UInt32*, HRESULT)).call(fserializereplicakeymap, pbknowledge, pcbknowledge)
  end
  def set_local_tick_count(ulltickcount : UInt64) : HRESULT
    @lpVtbl.value.set_local_tick_count.unsafe_as(Proc(UInt64, HRESULT)).call(ulltickcount)
  end
  def contains_change(pbversionownerreplicaid : UInt8*, pgiditemid : UInt8*, psyncversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.contains_change.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, HRESULT)).call(pbversionownerreplicaid, pgiditemid, psyncversion)
  end
  def contains_change_unit(pbversionownerreplicaid : UInt8*, pbitemid : UInt8*, pbchangeunitid : UInt8*, psyncversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.contains_change_unit.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, SYNC_VERSION*, HRESULT)).call(pbversionownerreplicaid, pbitemid, pbchangeunitid, psyncversion)
  end
  def get_scope_vector(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_scope_vector.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def get_replica_key_map(ppreplicakeymap : IReplicaKeyMap*) : HRESULT
    @lpVtbl.value.get_replica_key_map.unsafe_as(Proc(IReplicaKeyMap*, HRESULT)).call(ppreplicakeymap)
  end
  def clone(ppclonedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppclonedknowledge)
  end
  def convert_version(pknowledgein : ISyncKnowledge, pbcurrentownerid : UInt8*, pversionin : SYNC_VERSION*, pbnewownerid : UInt8*, pcbidsize : UInt32*, pversionout : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.convert_version.unsafe_as(Proc(ISyncKnowledge, UInt8*, SYNC_VERSION*, UInt8*, UInt32*, SYNC_VERSION*, HRESULT)).call(pknowledgein, pbcurrentownerid, pversionin, pbnewownerid, pcbidsize, pversionout)
  end
  def map_remote_to_local(premoteknowledge : ISyncKnowledge, ppmappedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.map_remote_to_local.unsafe_as(Proc(ISyncKnowledge, ISyncKnowledge*, HRESULT)).call(premoteknowledge, ppmappedknowledge)
  end
  def union(pknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.union.unsafe_as(Proc(ISyncKnowledge, HRESULT)).call(pknowledge)
  end
  def project_onto_item(pbitemid : UInt8*, ppknowledgeout : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_item.unsafe_as(Proc(UInt8*, ISyncKnowledge*, HRESULT)).call(pbitemid, ppknowledgeout)
  end
  def project_onto_change_unit(pbitemid : UInt8*, pbchangeunitid : UInt8*, ppknowledgeout : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_change_unit.unsafe_as(Proc(UInt8*, UInt8*, ISyncKnowledge*, HRESULT)).call(pbitemid, pbchangeunitid, ppknowledgeout)
  end
  def project_onto_range(psrngsyncrange : SYNC_RANGE*, ppknowledgeout : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_range.unsafe_as(Proc(SYNC_RANGE*, ISyncKnowledge*, HRESULT)).call(psrngsyncrange, ppknowledgeout)
  end
  def exclude_item(pbitemid : UInt8*) : HRESULT
    @lpVtbl.value.exclude_item.unsafe_as(Proc(UInt8*, HRESULT)).call(pbitemid)
  end
  def exclude_change_unit(pbitemid : UInt8*, pbchangeunitid : UInt8*) : HRESULT
    @lpVtbl.value.exclude_change_unit.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(pbitemid, pbchangeunitid)
  end
  def contains_knowledge(pknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.contains_knowledge.unsafe_as(Proc(ISyncKnowledge, HRESULT)).call(pknowledge)
  end
  def find_min_tick_count_for_replica(pbreplicaid : UInt8*, pullreplicatickcount : UInt64*) : HRESULT
    @lpVtbl.value.find_min_tick_count_for_replica.unsafe_as(Proc(UInt8*, UInt64*, HRESULT)).call(pbreplicaid, pullreplicatickcount)
  end
  def get_range_exceptions(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_range_exceptions.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def get_single_item_exceptions(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_single_item_exceptions.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def get_change_unit_exceptions(riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.get_change_unit_exceptions.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppunk)
  end
  def find_clock_vector_for_item(pbitemid : UInt8*, riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.find_clock_vector_for_item.unsafe_as(Proc(UInt8*, Guid*, Void**, HRESULT)).call(pbitemid, riid, ppunk)
  end
  def find_clock_vector_for_change_unit(pbitemid : UInt8*, pbchangeunitid : UInt8*, riid : Guid*, ppunk : Void**) : HRESULT
    @lpVtbl.value.find_clock_vector_for_change_unit.unsafe_as(Proc(UInt8*, UInt8*, Guid*, Void**, HRESULT)).call(pbitemid, pbchangeunitid, riid, ppunk)
  end
  def get_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def get_id_parameters(pidparameters : ID_PARAMETERS*) : HRESULT
    @lpVtbl.value.get_id_parameters.unsafe_as(Proc(ID_PARAMETERS*, HRESULT)).call(pidparameters)
  end
  def project_onto_column_set(ppcolumns : UInt8**, count : UInt32, ppiknowledgeout : ISyncKnowledge2*) : HRESULT
    @lpVtbl.value.project_onto_column_set.unsafe_as(Proc(UInt8**, UInt32, ISyncKnowledge2*, HRESULT)).call(ppcolumns, count, ppiknowledgeout)
  end
  def serialize_with_options(targetformatversion : SYNC_SERIALIZATION_VERSION, dwflags : UInt32, pbbuffer : UInt8*, pdwserializedsize : UInt32*) : HRESULT
    @lpVtbl.value.serialize_with_options.unsafe_as(Proc(SYNC_SERIALIZATION_VERSION, UInt32, UInt8*, UInt32*, HRESULT)).call(targetformatversion, dwflags, pbbuffer, pdwserializedsize)
  end
  def get_lowest_uncontained_id(pisyncknowledge : ISyncKnowledge2, pbitemid : UInt8*, pcbitemidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_lowest_uncontained_id.unsafe_as(Proc(ISyncKnowledge2, UInt8*, UInt32*, HRESULT)).call(pisyncknowledge, pbitemid, pcbitemidsize)
  end
  def get_inspector(riid : Guid*, ppiinspector : Void**) : HRESULT
    @lpVtbl.value.get_inspector.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppiinspector)
  end
  def get_minimum_supported_version(pversion : SYNC_SERIALIZATION_VERSION*) : HRESULT
    @lpVtbl.value.get_minimum_supported_version.unsafe_as(Proc(SYNC_SERIALIZATION_VERSION*, HRESULT)).call(pversion)
  end
  def get_statistics(which : SYNC_STATISTICS, pvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(SYNC_STATISTICS, UInt32*, HRESULT)).call(which, pvalue)
  end
  def contains_knowledge_for_item(pknowledge : ISyncKnowledge, pbitemid : UInt8*) : HRESULT
    @lpVtbl.value.contains_knowledge_for_item.unsafe_as(Proc(ISyncKnowledge, UInt8*, HRESULT)).call(pknowledge, pbitemid)
  end
  def contains_knowledge_for_change_unit(pknowledge : ISyncKnowledge, pbitemid : UInt8*, pbchangeunitid : UInt8*) : HRESULT
    @lpVtbl.value.contains_knowledge_for_change_unit.unsafe_as(Proc(ISyncKnowledge, UInt8*, UInt8*, HRESULT)).call(pknowledge, pbitemid, pbchangeunitid)
  end
  def project_onto_knowledge_with_prerequisite(pprerequisiteknowledge : ISyncKnowledge, ptemplateknowledge : ISyncKnowledge, ppprojectedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.project_onto_knowledge_with_prerequisite.unsafe_as(Proc(ISyncKnowledge, ISyncKnowledge, ISyncKnowledge*, HRESULT)).call(pprerequisiteknowledge, ptemplateknowledge, ppprojectedknowledge)
  end
  def complement(psyncknowledge : ISyncKnowledge, ppcomplementedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.complement.unsafe_as(Proc(ISyncKnowledge, ISyncKnowledge*, HRESULT)).call(psyncknowledge, ppcomplementedknowledge)
  end
  def intersects_with_knowledge(psyncknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.intersects_with_knowledge.unsafe_as(Proc(ISyncKnowledge, HRESULT)).call(psyncknowledge)
  end
  def get_knowledge_cookie(ppknowledgecookie : IUnknown*) : HRESULT
    @lpVtbl.value.get_knowledge_cookie.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppknowledgecookie)
  end
  def compare_to_knowledge_cookie(pknowledgecookie : IUnknown, presult : KNOWLEDGE_COOKIE_COMPARISON_RESULT*) : HRESULT
    @lpVtbl.value.compare_to_knowledge_cookie.unsafe_as(Proc(IUnknown, KNOWLEDGE_COOKIE_COMPARISON_RESULT*, HRESULT)).call(pknowledgecookie, presult)
  end
end
struct LibWin32::IRecoverableErrorData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pcszitemdisplayname : LibC::LPWSTR, pcszerrordescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pcszitemdisplayname, pcszerrordescription)
  end
  def get_item_display_name(pszitemdisplayname : LibC::LPWSTR, pcchitemdisplayname : UInt32*) : HRESULT
    @lpVtbl.value.get_item_display_name.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pszitemdisplayname, pcchitemdisplayname)
  end
  def get_error_description(pszerrordescription : LibC::LPWSTR, pccherrordescription : UInt32*) : HRESULT
    @lpVtbl.value.get_error_description.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pszerrordescription, pccherrordescription)
  end
end
struct LibWin32::IRecoverableError
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_stage(pstage : SYNC_PROGRESS_STAGE*) : HRESULT
    @lpVtbl.value.get_stage.unsafe_as(Proc(SYNC_PROGRESS_STAGE*, HRESULT)).call(pstage)
  end
  def get_provider(pproviderrole : SYNC_PROVIDER_ROLE*) : HRESULT
    @lpVtbl.value.get_provider.unsafe_as(Proc(SYNC_PROVIDER_ROLE*, HRESULT)).call(pproviderrole)
  end
  def get_change_with_recoverable_error(ppchangewithrecoverableerror : ISyncChange*) : HRESULT
    @lpVtbl.value.get_change_with_recoverable_error.unsafe_as(Proc(ISyncChange*, HRESULT)).call(ppchangewithrecoverableerror)
  end
  def get_recoverable_error_data_for_change(phrerror : HRESULT*, pperrordata : IRecoverableErrorData*) : HRESULT
    @lpVtbl.value.get_recoverable_error_data_for_change.unsafe_as(Proc(HRESULT*, IRecoverableErrorData*, HRESULT)).call(phrerror, pperrordata)
  end
  def get_recoverable_error_data_for_change_unit(pchangeunit : ISyncChangeUnit, phrerror : HRESULT*, pperrordata : IRecoverableErrorData*) : HRESULT
    @lpVtbl.value.get_recoverable_error_data_for_change_unit.unsafe_as(Proc(ISyncChangeUnit, HRESULT*, IRecoverableErrorData*, HRESULT)).call(pchangeunit, phrerror, pperrordata)
  end
end
struct LibWin32::IChangeConflict
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_destination_provider_conflicting_change(ppconflictingchange : ISyncChange*) : HRESULT
    @lpVtbl.value.get_destination_provider_conflicting_change.unsafe_as(Proc(ISyncChange*, HRESULT)).call(ppconflictingchange)
  end
  def get_source_provider_conflicting_change(ppconflictingchange : ISyncChange*) : HRESULT
    @lpVtbl.value.get_source_provider_conflicting_change.unsafe_as(Proc(ISyncChange*, HRESULT)).call(ppconflictingchange)
  end
  def get_destination_provider_conflicting_data(ppconflictingdata : IUnknown*) : HRESULT
    @lpVtbl.value.get_destination_provider_conflicting_data.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppconflictingdata)
  end
  def get_source_provider_conflicting_data(ppconflictingdata : IUnknown*) : HRESULT
    @lpVtbl.value.get_source_provider_conflicting_data.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppconflictingdata)
  end
  def get_resolve_action_for_change(presolveaction : SYNC_RESOLVE_ACTION*) : HRESULT
    @lpVtbl.value.get_resolve_action_for_change.unsafe_as(Proc(SYNC_RESOLVE_ACTION*, HRESULT)).call(presolveaction)
  end
  def set_resolve_action_for_change(resolveaction : SYNC_RESOLVE_ACTION) : HRESULT
    @lpVtbl.value.set_resolve_action_for_change.unsafe_as(Proc(SYNC_RESOLVE_ACTION, HRESULT)).call(resolveaction)
  end
  def get_resolve_action_for_change_unit(pchangeunit : ISyncChangeUnit, presolveaction : SYNC_RESOLVE_ACTION*) : HRESULT
    @lpVtbl.value.get_resolve_action_for_change_unit.unsafe_as(Proc(ISyncChangeUnit, SYNC_RESOLVE_ACTION*, HRESULT)).call(pchangeunit, presolveaction)
  end
  def set_resolve_action_for_change_unit(pchangeunit : ISyncChangeUnit, resolveaction : SYNC_RESOLVE_ACTION) : HRESULT
    @lpVtbl.value.set_resolve_action_for_change_unit.unsafe_as(Proc(ISyncChangeUnit, SYNC_RESOLVE_ACTION, HRESULT)).call(pchangeunit, resolveaction)
  end
end
struct LibWin32::IConstraintConflict
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_destination_provider_conflicting_change(ppconflictingchange : ISyncChange*) : HRESULT
    @lpVtbl.value.get_destination_provider_conflicting_change.unsafe_as(Proc(ISyncChange*, HRESULT)).call(ppconflictingchange)
  end
  def get_source_provider_conflicting_change(ppconflictingchange : ISyncChange*) : HRESULT
    @lpVtbl.value.get_source_provider_conflicting_change.unsafe_as(Proc(ISyncChange*, HRESULT)).call(ppconflictingchange)
  end
  def get_destination_provider_original_change(pporiginalchange : ISyncChange*) : HRESULT
    @lpVtbl.value.get_destination_provider_original_change.unsafe_as(Proc(ISyncChange*, HRESULT)).call(pporiginalchange)
  end
  def get_destination_provider_conflicting_data(ppconflictingdata : IUnknown*) : HRESULT
    @lpVtbl.value.get_destination_provider_conflicting_data.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppconflictingdata)
  end
  def get_source_provider_conflicting_data(ppconflictingdata : IUnknown*) : HRESULT
    @lpVtbl.value.get_source_provider_conflicting_data.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppconflictingdata)
  end
  def get_destination_provider_original_data(pporiginaldata : IUnknown*) : HRESULT
    @lpVtbl.value.get_destination_provider_original_data.unsafe_as(Proc(IUnknown*, HRESULT)).call(pporiginaldata)
  end
  def get_constraint_resolve_action_for_change(pconstraintresolveaction : SYNC_CONSTRAINT_RESOLVE_ACTION*) : HRESULT
    @lpVtbl.value.get_constraint_resolve_action_for_change.unsafe_as(Proc(SYNC_CONSTRAINT_RESOLVE_ACTION*, HRESULT)).call(pconstraintresolveaction)
  end
  def set_constraint_resolve_action_for_change(constraintresolveaction : SYNC_CONSTRAINT_RESOLVE_ACTION) : HRESULT
    @lpVtbl.value.set_constraint_resolve_action_for_change.unsafe_as(Proc(SYNC_CONSTRAINT_RESOLVE_ACTION, HRESULT)).call(constraintresolveaction)
  end
  def get_constraint_resolve_action_for_change_unit(pchangeunit : ISyncChangeUnit, pconstraintresolveaction : SYNC_CONSTRAINT_RESOLVE_ACTION*) : HRESULT
    @lpVtbl.value.get_constraint_resolve_action_for_change_unit.unsafe_as(Proc(ISyncChangeUnit, SYNC_CONSTRAINT_RESOLVE_ACTION*, HRESULT)).call(pchangeunit, pconstraintresolveaction)
  end
  def set_constraint_resolve_action_for_change_unit(pchangeunit : ISyncChangeUnit, constraintresolveaction : SYNC_CONSTRAINT_RESOLVE_ACTION) : HRESULT
    @lpVtbl.value.set_constraint_resolve_action_for_change_unit.unsafe_as(Proc(ISyncChangeUnit, SYNC_CONSTRAINT_RESOLVE_ACTION, HRESULT)).call(pchangeunit, constraintresolveaction)
  end
  def get_constraint_conflict_reason(pconstraintconflictreason : CONSTRAINT_CONFLICT_REASON*) : HRESULT
    @lpVtbl.value.get_constraint_conflict_reason.unsafe_as(Proc(CONSTRAINT_CONFLICT_REASON*, HRESULT)).call(pconstraintconflictreason)
  end
  def is_temporary : HRESULT
    @lpVtbl.value.is_temporary.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISyncCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_progress(provider : SYNC_PROVIDER_ROLE, syncstage : SYNC_PROGRESS_STAGE, dwcompletedwork : UInt32, dwtotalwork : UInt32) : HRESULT
    @lpVtbl.value.on_progress.unsafe_as(Proc(SYNC_PROVIDER_ROLE, SYNC_PROGRESS_STAGE, UInt32, UInt32, HRESULT)).call(provider, syncstage, dwcompletedwork, dwtotalwork)
  end
  def on_change(psyncchange : ISyncChange) : HRESULT
    @lpVtbl.value.on_change.unsafe_as(Proc(ISyncChange, HRESULT)).call(psyncchange)
  end
  def on_conflict(pconflict : IChangeConflict) : HRESULT
    @lpVtbl.value.on_conflict.unsafe_as(Proc(IChangeConflict, HRESULT)).call(pconflict)
  end
  def on_full_enumeration_needed(pfullenumerationaction : SYNC_FULL_ENUMERATION_ACTION*) : HRESULT
    @lpVtbl.value.on_full_enumeration_needed.unsafe_as(Proc(SYNC_FULL_ENUMERATION_ACTION*, HRESULT)).call(pfullenumerationaction)
  end
  def on_recoverable_error(precoverableerror : IRecoverableError) : HRESULT
    @lpVtbl.value.on_recoverable_error.unsafe_as(Proc(IRecoverableError, HRESULT)).call(precoverableerror)
  end
end
struct LibWin32::ISyncCallback2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_progress(provider : SYNC_PROVIDER_ROLE, syncstage : SYNC_PROGRESS_STAGE, dwcompletedwork : UInt32, dwtotalwork : UInt32) : HRESULT
    @lpVtbl.value.on_progress.unsafe_as(Proc(SYNC_PROVIDER_ROLE, SYNC_PROGRESS_STAGE, UInt32, UInt32, HRESULT)).call(provider, syncstage, dwcompletedwork, dwtotalwork)
  end
  def on_change(psyncchange : ISyncChange) : HRESULT
    @lpVtbl.value.on_change.unsafe_as(Proc(ISyncChange, HRESULT)).call(psyncchange)
  end
  def on_conflict(pconflict : IChangeConflict) : HRESULT
    @lpVtbl.value.on_conflict.unsafe_as(Proc(IChangeConflict, HRESULT)).call(pconflict)
  end
  def on_full_enumeration_needed(pfullenumerationaction : SYNC_FULL_ENUMERATION_ACTION*) : HRESULT
    @lpVtbl.value.on_full_enumeration_needed.unsafe_as(Proc(SYNC_FULL_ENUMERATION_ACTION*, HRESULT)).call(pfullenumerationaction)
  end
  def on_recoverable_error(precoverableerror : IRecoverableError) : HRESULT
    @lpVtbl.value.on_recoverable_error.unsafe_as(Proc(IRecoverableError, HRESULT)).call(precoverableerror)
  end
  def on_change_applied(dwchangesapplied : UInt32, dwchangesfailed : UInt32) : HRESULT
    @lpVtbl.value.on_change_applied.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwchangesapplied, dwchangesfailed)
  end
  def on_change_failed(dwchangesapplied : UInt32, dwchangesfailed : UInt32) : HRESULT
    @lpVtbl.value.on_change_failed.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwchangesapplied, dwchangesfailed)
  end
end
struct LibWin32::ISyncConstraintCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_constraint_conflict(pconflict : IConstraintConflict) : HRESULT
    @lpVtbl.value.on_constraint_conflict.unsafe_as(Proc(IConstraintConflict, HRESULT)).call(pconflict)
  end
end
struct LibWin32::ISyncProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_id_parameters(pidparameters : ID_PARAMETERS*) : HRESULT
    @lpVtbl.value.get_id_parameters.unsafe_as(Proc(ID_PARAMETERS*, HRESULT)).call(pidparameters)
  end
end
struct LibWin32::ISyncSessionState
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_canceled(pfiscanceled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_canceled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfiscanceled)
  end
  def get_info_for_change_application(pbchangeapplierinfo : UInt8*, pcbchangeapplierinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_info_for_change_application.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangeapplierinfo, pcbchangeapplierinfo)
  end
  def load_info_from_change_application(pbchangeapplierinfo : UInt8*, cbchangeapplierinfo : UInt32) : HRESULT
    @lpVtbl.value.load_info_from_change_application.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(pbchangeapplierinfo, cbchangeapplierinfo)
  end
  def get_forgotten_knowledge_recovery_range_start(pbrangestart : UInt8*, pcbrangestart : UInt32*) : HRESULT
    @lpVtbl.value.get_forgotten_knowledge_recovery_range_start.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbrangestart, pcbrangestart)
  end
  def get_forgotten_knowledge_recovery_range_end(pbrangeend : UInt8*, pcbrangeend : UInt32*) : HRESULT
    @lpVtbl.value.get_forgotten_knowledge_recovery_range_end.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbrangeend, pcbrangeend)
  end
  def set_forgotten_knowledge_recovery_range(prange : SYNC_RANGE*) : HRESULT
    @lpVtbl.value.set_forgotten_knowledge_recovery_range.unsafe_as(Proc(SYNC_RANGE*, HRESULT)).call(prange)
  end
  def on_progress(provider : SYNC_PROVIDER_ROLE, syncstage : SYNC_PROGRESS_STAGE, dwcompletedwork : UInt32, dwtotalwork : UInt32) : HRESULT
    @lpVtbl.value.on_progress.unsafe_as(Proc(SYNC_PROVIDER_ROLE, SYNC_PROGRESS_STAGE, UInt32, UInt32, HRESULT)).call(provider, syncstage, dwcompletedwork, dwtotalwork)
  end
end
struct LibWin32::ISyncSessionExtendedErrorInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_sync_provider_with_error(ppproviderwitherror : ISyncProvider*) : HRESULT
    @lpVtbl.value.get_sync_provider_with_error.unsafe_as(Proc(ISyncProvider*, HRESULT)).call(ppproviderwitherror)
  end
end
struct LibWin32::ISyncSessionState2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_canceled(pfiscanceled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_canceled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfiscanceled)
  end
  def get_info_for_change_application(pbchangeapplierinfo : UInt8*, pcbchangeapplierinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_info_for_change_application.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangeapplierinfo, pcbchangeapplierinfo)
  end
  def load_info_from_change_application(pbchangeapplierinfo : UInt8*, cbchangeapplierinfo : UInt32) : HRESULT
    @lpVtbl.value.load_info_from_change_application.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(pbchangeapplierinfo, cbchangeapplierinfo)
  end
  def get_forgotten_knowledge_recovery_range_start(pbrangestart : UInt8*, pcbrangestart : UInt32*) : HRESULT
    @lpVtbl.value.get_forgotten_knowledge_recovery_range_start.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbrangestart, pcbrangestart)
  end
  def get_forgotten_knowledge_recovery_range_end(pbrangeend : UInt8*, pcbrangeend : UInt32*) : HRESULT
    @lpVtbl.value.get_forgotten_knowledge_recovery_range_end.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbrangeend, pcbrangeend)
  end
  def set_forgotten_knowledge_recovery_range(prange : SYNC_RANGE*) : HRESULT
    @lpVtbl.value.set_forgotten_knowledge_recovery_range.unsafe_as(Proc(SYNC_RANGE*, HRESULT)).call(prange)
  end
  def on_progress(provider : SYNC_PROVIDER_ROLE, syncstage : SYNC_PROGRESS_STAGE, dwcompletedwork : UInt32, dwtotalwork : UInt32) : HRESULT
    @lpVtbl.value.on_progress.unsafe_as(Proc(SYNC_PROVIDER_ROLE, SYNC_PROGRESS_STAGE, UInt32, UInt32, HRESULT)).call(provider, syncstage, dwcompletedwork, dwtotalwork)
  end
  def set_provider_with_error(fself : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_provider_with_error.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fself)
  end
  def get_session_error_status(phrsessionerror : HRESULT*) : HRESULT
    @lpVtbl.value.get_session_error_status.unsafe_as(Proc(HRESULT*, HRESULT)).call(phrsessionerror)
  end
end
struct LibWin32::ISyncFilterInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pbbuffer : UInt8*, pcbbuffer : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbbuffer, pcbbuffer)
  end
end
struct LibWin32::ISyncFilterInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pbbuffer : UInt8*, pcbbuffer : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbbuffer, pcbbuffer)
  end
  def get_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
end
struct LibWin32::IChangeUnitListFilterInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pbbuffer : UInt8*, pcbbuffer : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbbuffer, pcbbuffer)
  end
  def initialize(ppbchangeunitids : UInt8**, dwchangeunitcount : UInt32) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(UInt8**, UInt32, HRESULT)).call(ppbchangeunitids, dwchangeunitcount)
  end
  def get_change_unit_id_count(pdwchangeunitidcount : UInt32*) : HRESULT
    @lpVtbl.value.get_change_unit_id_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwchangeunitidcount)
  end
  def get_change_unit_id(dwchangeunitidindex : UInt32, pbchangeunitid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_change_unit_id.unsafe_as(Proc(UInt32, UInt8*, UInt32*, HRESULT)).call(dwchangeunitidindex, pbchangeunitid, pcbidsize)
  end
end
struct LibWin32::ISyncFilter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_identical(psyncfilter : ISyncFilter) : HRESULT
    @lpVtbl.value.is_identical.unsafe_as(Proc(ISyncFilter, HRESULT)).call(psyncfilter)
  end
  def serialize(pbsyncfilter : UInt8*, pcbsyncfilter : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbsyncfilter, pcbsyncfilter)
  end
end
struct LibWin32::ISyncFilterDeserializer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def deserialize_sync_filter(pbsyncfilter : UInt8*, dwcbsyncfilter : UInt32, ppisyncfilter : ISyncFilter*) : HRESULT
    @lpVtbl.value.deserialize_sync_filter.unsafe_as(Proc(UInt8*, UInt32, ISyncFilter*, HRESULT)).call(pbsyncfilter, dwcbsyncfilter, ppisyncfilter)
  end
end
struct LibWin32::ICustomFilterInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pbbuffer : UInt8*, pcbbuffer : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbbuffer, pcbbuffer)
  end
  def get_sync_filter(pisyncfilter : ISyncFilter*) : HRESULT
    @lpVtbl.value.get_sync_filter.unsafe_as(Proc(ISyncFilter*, HRESULT)).call(pisyncfilter)
  end
end
struct LibWin32::ICombinedFilterInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pbbuffer : UInt8*, pcbbuffer : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbbuffer, pcbbuffer)
  end
  def get_filter_count(pdwfiltercount : UInt32*) : HRESULT
    @lpVtbl.value.get_filter_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwfiltercount)
  end
  def get_filter_info(dwfilterindex : UInt32, ppifilterinfo : ISyncFilterInfo*) : HRESULT
    @lpVtbl.value.get_filter_info.unsafe_as(Proc(UInt32, ISyncFilterInfo*, HRESULT)).call(dwfilterindex, ppifilterinfo)
  end
  def get_filter_combination_type(pfiltercombinationtype : FILTER_COMBINATION_TYPE*) : HRESULT
    @lpVtbl.value.get_filter_combination_type.unsafe_as(Proc(FILTER_COMBINATION_TYPE*, HRESULT)).call(pfiltercombinationtype)
  end
end
struct LibWin32::IEnumSyncChanges
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cchanges : UInt32, ppchange : ISyncChange*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ISyncChange*, UInt32*, HRESULT)).call(cchanges, ppchange, pcfetched)
  end
  def skip(cchanges : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cchanges)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSyncChanges*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSyncChanges*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ISyncChangeBuilder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_change_unit_metadata(pbchangeunitid : UInt8*, pchangeunitversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.add_change_unit_metadata.unsafe_as(Proc(UInt8*, SYNC_VERSION*, HRESULT)).call(pbchangeunitid, pchangeunitversion)
  end
end
struct LibWin32::IFilterTrackingSyncChangeBuilder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_filter_change(dwfilterkey : UInt32, pfilterchange : SYNC_FILTER_CHANGE*) : HRESULT
    @lpVtbl.value.add_filter_change.unsafe_as(Proc(UInt32, SYNC_FILTER_CHANGE*, HRESULT)).call(dwfilterkey, pfilterchange)
  end
  def set_all_change_units_present_flag : HRESULT
    @lpVtbl.value.set_all_change_units_present_flag.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISyncChangeBatchBase
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_change_enumerator(ppenum : IEnumSyncChanges*) : HRESULT
    @lpVtbl.value.get_change_enumerator.unsafe_as(Proc(IEnumSyncChanges*, HRESULT)).call(ppenum)
  end
  def get_is_last_batch(pflastbatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_last_batch.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflastbatch)
  end
  def get_work_estimate_for_batch(pdwworkforbatch : UInt32*) : HRESULT
    @lpVtbl.value.get_work_estimate_for_batch.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwworkforbatch)
  end
  def get_remaining_work_estimate_for_session(pdwremainingworkforsession : UInt32*) : HRESULT
    @lpVtbl.value.get_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwremainingworkforsession)
  end
  def begin_ordered_group(pblowerbound : UInt8*) : HRESULT
    @lpVtbl.value.begin_ordered_group.unsafe_as(Proc(UInt8*, HRESULT)).call(pblowerbound)
  end
  def end_ordered_group(pbupperbound : UInt8*, pmadewithknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.end_ordered_group.unsafe_as(Proc(UInt8*, ISyncKnowledge, HRESULT)).call(pbupperbound, pmadewithknowledge)
  end
  def add_item_metadata_to_group(pbownerreplicaid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwflags : UInt32, dwworkforchange : UInt32, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_item_metadata_to_group.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbitemid, pchangeversion, pcreationversion, dwflags, dwworkforchange, ppchangebuilder)
  end
  def get_learned_knowledge(pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledge)
  end
  def get_prerequisite_knowledge(ppprerequisteknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_prerequisite_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppprerequisteknowledge)
  end
  def get_source_forgotten_knowledge(ppsourceforgottenknowledge : IForgottenKnowledge*) : HRESULT
    @lpVtbl.value.get_source_forgotten_knowledge.unsafe_as(Proc(IForgottenKnowledge*, HRESULT)).call(ppsourceforgottenknowledge)
  end
  def set_last_batch : HRESULT
    @lpVtbl.value.set_last_batch.unsafe_as(Proc(HRESULT)).call
  end
  def set_work_estimate_for_batch(dwworkforbatch : UInt32) : HRESULT
    @lpVtbl.value.set_work_estimate_for_batch.unsafe_as(Proc(UInt32, HRESULT)).call(dwworkforbatch)
  end
  def set_remaining_work_estimate_for_session(dwremainingworkforsession : UInt32) : HRESULT
    @lpVtbl.value.set_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32, HRESULT)).call(dwremainingworkforsession)
  end
  def serialize(pbchangebatch : UInt8*, pcbchangebatch : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangebatch, pcbchangebatch)
  end
end
struct LibWin32::ISyncChangeBatch
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_change_enumerator(ppenum : IEnumSyncChanges*) : HRESULT
    @lpVtbl.value.get_change_enumerator.unsafe_as(Proc(IEnumSyncChanges*, HRESULT)).call(ppenum)
  end
  def get_is_last_batch(pflastbatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_last_batch.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflastbatch)
  end
  def get_work_estimate_for_batch(pdwworkforbatch : UInt32*) : HRESULT
    @lpVtbl.value.get_work_estimate_for_batch.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwworkforbatch)
  end
  def get_remaining_work_estimate_for_session(pdwremainingworkforsession : UInt32*) : HRESULT
    @lpVtbl.value.get_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwremainingworkforsession)
  end
  def begin_ordered_group(pblowerbound : UInt8*) : HRESULT
    @lpVtbl.value.begin_ordered_group.unsafe_as(Proc(UInt8*, HRESULT)).call(pblowerbound)
  end
  def end_ordered_group(pbupperbound : UInt8*, pmadewithknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.end_ordered_group.unsafe_as(Proc(UInt8*, ISyncKnowledge, HRESULT)).call(pbupperbound, pmadewithknowledge)
  end
  def add_item_metadata_to_group(pbownerreplicaid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwflags : UInt32, dwworkforchange : UInt32, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_item_metadata_to_group.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbitemid, pchangeversion, pcreationversion, dwflags, dwworkforchange, ppchangebuilder)
  end
  def get_learned_knowledge(pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledge)
  end
  def get_prerequisite_knowledge(ppprerequisteknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_prerequisite_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppprerequisteknowledge)
  end
  def get_source_forgotten_knowledge(ppsourceforgottenknowledge : IForgottenKnowledge*) : HRESULT
    @lpVtbl.value.get_source_forgotten_knowledge.unsafe_as(Proc(IForgottenKnowledge*, HRESULT)).call(ppsourceforgottenknowledge)
  end
  def set_last_batch : HRESULT
    @lpVtbl.value.set_last_batch.unsafe_as(Proc(HRESULT)).call
  end
  def set_work_estimate_for_batch(dwworkforbatch : UInt32) : HRESULT
    @lpVtbl.value.set_work_estimate_for_batch.unsafe_as(Proc(UInt32, HRESULT)).call(dwworkforbatch)
  end
  def set_remaining_work_estimate_for_session(dwremainingworkforsession : UInt32) : HRESULT
    @lpVtbl.value.set_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32, HRESULT)).call(dwremainingworkforsession)
  end
  def serialize(pbchangebatch : UInt8*, pcbchangebatch : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangebatch, pcbchangebatch)
  end
  def begin_unordered_group : HRESULT
    @lpVtbl.value.begin_unordered_group.unsafe_as(Proc(HRESULT)).call
  end
  def end_unordered_group(pmadewithknowledge : ISyncKnowledge, fallchangesforknowledge : LibC::BOOL) : HRESULT
    @lpVtbl.value.end_unordered_group.unsafe_as(Proc(ISyncKnowledge, LibC::BOOL, HRESULT)).call(pmadewithknowledge, fallchangesforknowledge)
  end
  def add_logged_conflict(pbownerreplicaid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwflags : UInt32, dwworkforchange : UInt32, pconflictknowledge : ISyncKnowledge, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_logged_conflict.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncKnowledge, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbitemid, pchangeversion, pcreationversion, dwflags, dwworkforchange, pconflictknowledge, ppchangebuilder)
  end
end
struct LibWin32::ISyncFullEnumerationChangeBatch
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_change_enumerator(ppenum : IEnumSyncChanges*) : HRESULT
    @lpVtbl.value.get_change_enumerator.unsafe_as(Proc(IEnumSyncChanges*, HRESULT)).call(ppenum)
  end
  def get_is_last_batch(pflastbatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_last_batch.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflastbatch)
  end
  def get_work_estimate_for_batch(pdwworkforbatch : UInt32*) : HRESULT
    @lpVtbl.value.get_work_estimate_for_batch.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwworkforbatch)
  end
  def get_remaining_work_estimate_for_session(pdwremainingworkforsession : UInt32*) : HRESULT
    @lpVtbl.value.get_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwremainingworkforsession)
  end
  def begin_ordered_group(pblowerbound : UInt8*) : HRESULT
    @lpVtbl.value.begin_ordered_group.unsafe_as(Proc(UInt8*, HRESULT)).call(pblowerbound)
  end
  def end_ordered_group(pbupperbound : UInt8*, pmadewithknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.end_ordered_group.unsafe_as(Proc(UInt8*, ISyncKnowledge, HRESULT)).call(pbupperbound, pmadewithknowledge)
  end
  def add_item_metadata_to_group(pbownerreplicaid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwflags : UInt32, dwworkforchange : UInt32, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_item_metadata_to_group.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbitemid, pchangeversion, pcreationversion, dwflags, dwworkforchange, ppchangebuilder)
  end
  def get_learned_knowledge(pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledge)
  end
  def get_prerequisite_knowledge(ppprerequisteknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_prerequisite_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppprerequisteknowledge)
  end
  def get_source_forgotten_knowledge(ppsourceforgottenknowledge : IForgottenKnowledge*) : HRESULT
    @lpVtbl.value.get_source_forgotten_knowledge.unsafe_as(Proc(IForgottenKnowledge*, HRESULT)).call(ppsourceforgottenknowledge)
  end
  def set_last_batch : HRESULT
    @lpVtbl.value.set_last_batch.unsafe_as(Proc(HRESULT)).call
  end
  def set_work_estimate_for_batch(dwworkforbatch : UInt32) : HRESULT
    @lpVtbl.value.set_work_estimate_for_batch.unsafe_as(Proc(UInt32, HRESULT)).call(dwworkforbatch)
  end
  def set_remaining_work_estimate_for_session(dwremainingworkforsession : UInt32) : HRESULT
    @lpVtbl.value.set_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32, HRESULT)).call(dwremainingworkforsession)
  end
  def serialize(pbchangebatch : UInt8*, pcbchangebatch : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangebatch, pcbchangebatch)
  end
  def get_learned_knowledge_after_recovery_complete(pplearnedknowledgeafterrecoverycomplete : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge_after_recovery_complete.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledgeafterrecoverycomplete)
  end
  def get_closed_lower_bound_item_id(pbclosedlowerbounditemid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_closed_lower_bound_item_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbclosedlowerbounditemid, pcbidsize)
  end
  def get_closed_upper_bound_item_id(pbclosedupperbounditemid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_closed_upper_bound_item_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbclosedupperbounditemid, pcbidsize)
  end
end
struct LibWin32::ISyncChangeBatchWithPrerequisite
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_change_enumerator(ppenum : IEnumSyncChanges*) : HRESULT
    @lpVtbl.value.get_change_enumerator.unsafe_as(Proc(IEnumSyncChanges*, HRESULT)).call(ppenum)
  end
  def get_is_last_batch(pflastbatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_last_batch.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflastbatch)
  end
  def get_work_estimate_for_batch(pdwworkforbatch : UInt32*) : HRESULT
    @lpVtbl.value.get_work_estimate_for_batch.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwworkforbatch)
  end
  def get_remaining_work_estimate_for_session(pdwremainingworkforsession : UInt32*) : HRESULT
    @lpVtbl.value.get_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwremainingworkforsession)
  end
  def begin_ordered_group(pblowerbound : UInt8*) : HRESULT
    @lpVtbl.value.begin_ordered_group.unsafe_as(Proc(UInt8*, HRESULT)).call(pblowerbound)
  end
  def end_ordered_group(pbupperbound : UInt8*, pmadewithknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.end_ordered_group.unsafe_as(Proc(UInt8*, ISyncKnowledge, HRESULT)).call(pbupperbound, pmadewithknowledge)
  end
  def add_item_metadata_to_group(pbownerreplicaid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwflags : UInt32, dwworkforchange : UInt32, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_item_metadata_to_group.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbitemid, pchangeversion, pcreationversion, dwflags, dwworkforchange, ppchangebuilder)
  end
  def get_learned_knowledge(pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledge)
  end
  def get_prerequisite_knowledge(ppprerequisteknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_prerequisite_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppprerequisteknowledge)
  end
  def get_source_forgotten_knowledge(ppsourceforgottenknowledge : IForgottenKnowledge*) : HRESULT
    @lpVtbl.value.get_source_forgotten_knowledge.unsafe_as(Proc(IForgottenKnowledge*, HRESULT)).call(ppsourceforgottenknowledge)
  end
  def set_last_batch : HRESULT
    @lpVtbl.value.set_last_batch.unsafe_as(Proc(HRESULT)).call
  end
  def set_work_estimate_for_batch(dwworkforbatch : UInt32) : HRESULT
    @lpVtbl.value.set_work_estimate_for_batch.unsafe_as(Proc(UInt32, HRESULT)).call(dwworkforbatch)
  end
  def set_remaining_work_estimate_for_session(dwremainingworkforsession : UInt32) : HRESULT
    @lpVtbl.value.set_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32, HRESULT)).call(dwremainingworkforsession)
  end
  def serialize(pbchangebatch : UInt8*, pcbchangebatch : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangebatch, pcbchangebatch)
  end
  def set_prerequisite_knowledge(pprerequisiteknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.set_prerequisite_knowledge.unsafe_as(Proc(ISyncKnowledge, HRESULT)).call(pprerequisiteknowledge)
  end
  def get_learned_knowledge_with_prerequisite(pdestinationknowledge : ISyncKnowledge, pplearnedwithprerequisiteknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge_with_prerequisite.unsafe_as(Proc(ISyncKnowledge, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pplearnedwithprerequisiteknowledge)
  end
  def get_learned_forgotten_knowledge(pplearnedforgottenknowledge : IForgottenKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_forgotten_knowledge.unsafe_as(Proc(IForgottenKnowledge*, HRESULT)).call(pplearnedforgottenknowledge)
  end
end
struct LibWin32::ISyncChangeBatchBase2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_change_enumerator(ppenum : IEnumSyncChanges*) : HRESULT
    @lpVtbl.value.get_change_enumerator.unsafe_as(Proc(IEnumSyncChanges*, HRESULT)).call(ppenum)
  end
  def get_is_last_batch(pflastbatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_last_batch.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflastbatch)
  end
  def get_work_estimate_for_batch(pdwworkforbatch : UInt32*) : HRESULT
    @lpVtbl.value.get_work_estimate_for_batch.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwworkforbatch)
  end
  def get_remaining_work_estimate_for_session(pdwremainingworkforsession : UInt32*) : HRESULT
    @lpVtbl.value.get_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwremainingworkforsession)
  end
  def begin_ordered_group(pblowerbound : UInt8*) : HRESULT
    @lpVtbl.value.begin_ordered_group.unsafe_as(Proc(UInt8*, HRESULT)).call(pblowerbound)
  end
  def end_ordered_group(pbupperbound : UInt8*, pmadewithknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.end_ordered_group.unsafe_as(Proc(UInt8*, ISyncKnowledge, HRESULT)).call(pbupperbound, pmadewithknowledge)
  end
  def add_item_metadata_to_group(pbownerreplicaid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwflags : UInt32, dwworkforchange : UInt32, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_item_metadata_to_group.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbitemid, pchangeversion, pcreationversion, dwflags, dwworkforchange, ppchangebuilder)
  end
  def get_learned_knowledge(pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledge)
  end
  def get_prerequisite_knowledge(ppprerequisteknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_prerequisite_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppprerequisteknowledge)
  end
  def get_source_forgotten_knowledge(ppsourceforgottenknowledge : IForgottenKnowledge*) : HRESULT
    @lpVtbl.value.get_source_forgotten_knowledge.unsafe_as(Proc(IForgottenKnowledge*, HRESULT)).call(ppsourceforgottenknowledge)
  end
  def set_last_batch : HRESULT
    @lpVtbl.value.set_last_batch.unsafe_as(Proc(HRESULT)).call
  end
  def set_work_estimate_for_batch(dwworkforbatch : UInt32) : HRESULT
    @lpVtbl.value.set_work_estimate_for_batch.unsafe_as(Proc(UInt32, HRESULT)).call(dwworkforbatch)
  end
  def set_remaining_work_estimate_for_session(dwremainingworkforsession : UInt32) : HRESULT
    @lpVtbl.value.set_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32, HRESULT)).call(dwremainingworkforsession)
  end
  def serialize(pbchangebatch : UInt8*, pcbchangebatch : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangebatch, pcbchangebatch)
  end
  def serialize_with_options(targetformatversion : SYNC_SERIALIZATION_VERSION, dwflags : UInt32, pbbuffer : UInt8*, pdwserializedsize : UInt32*) : HRESULT
    @lpVtbl.value.serialize_with_options.unsafe_as(Proc(SYNC_SERIALIZATION_VERSION, UInt32, UInt8*, UInt32*, HRESULT)).call(targetformatversion, dwflags, pbbuffer, pdwserializedsize)
  end
end
struct LibWin32::ISyncChangeBatchAdvanced
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_filter_info(ppfilterinfo : ISyncFilterInfo*) : HRESULT
    @lpVtbl.value.get_filter_info.unsafe_as(Proc(ISyncFilterInfo*, HRESULT)).call(ppfilterinfo)
  end
  def convert_full_enumeration_change_batch_to_regular_change_batch(ppchangebatch : ISyncChangeBatch*) : HRESULT
    @lpVtbl.value.convert_full_enumeration_change_batch_to_regular_change_batch.unsafe_as(Proc(ISyncChangeBatch*, HRESULT)).call(ppchangebatch)
  end
  def get_upper_bound_item_id(pbitemid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_upper_bound_item_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbitemid, pcbidsize)
  end
  def get_batch_level_knowledge_should_be_applied(pfbatchknowledgeshouldbeapplied : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_batch_level_knowledge_should_be_applied.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfbatchknowledgeshouldbeapplied)
  end
end
struct LibWin32::ISyncChangeBatch2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_change_enumerator(ppenum : IEnumSyncChanges*) : HRESULT
    @lpVtbl.value.get_change_enumerator.unsafe_as(Proc(IEnumSyncChanges*, HRESULT)).call(ppenum)
  end
  def get_is_last_batch(pflastbatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_last_batch.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflastbatch)
  end
  def get_work_estimate_for_batch(pdwworkforbatch : UInt32*) : HRESULT
    @lpVtbl.value.get_work_estimate_for_batch.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwworkforbatch)
  end
  def get_remaining_work_estimate_for_session(pdwremainingworkforsession : UInt32*) : HRESULT
    @lpVtbl.value.get_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwremainingworkforsession)
  end
  def begin_ordered_group(pblowerbound : UInt8*) : HRESULT
    @lpVtbl.value.begin_ordered_group.unsafe_as(Proc(UInt8*, HRESULT)).call(pblowerbound)
  end
  def end_ordered_group(pbupperbound : UInt8*, pmadewithknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.end_ordered_group.unsafe_as(Proc(UInt8*, ISyncKnowledge, HRESULT)).call(pbupperbound, pmadewithknowledge)
  end
  def add_item_metadata_to_group(pbownerreplicaid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwflags : UInt32, dwworkforchange : UInt32, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_item_metadata_to_group.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbitemid, pchangeversion, pcreationversion, dwflags, dwworkforchange, ppchangebuilder)
  end
  def get_learned_knowledge(pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledge)
  end
  def get_prerequisite_knowledge(ppprerequisteknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_prerequisite_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppprerequisteknowledge)
  end
  def get_source_forgotten_knowledge(ppsourceforgottenknowledge : IForgottenKnowledge*) : HRESULT
    @lpVtbl.value.get_source_forgotten_knowledge.unsafe_as(Proc(IForgottenKnowledge*, HRESULT)).call(ppsourceforgottenknowledge)
  end
  def set_last_batch : HRESULT
    @lpVtbl.value.set_last_batch.unsafe_as(Proc(HRESULT)).call
  end
  def set_work_estimate_for_batch(dwworkforbatch : UInt32) : HRESULT
    @lpVtbl.value.set_work_estimate_for_batch.unsafe_as(Proc(UInt32, HRESULT)).call(dwworkforbatch)
  end
  def set_remaining_work_estimate_for_session(dwremainingworkforsession : UInt32) : HRESULT
    @lpVtbl.value.set_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32, HRESULT)).call(dwremainingworkforsession)
  end
  def serialize(pbchangebatch : UInt8*, pcbchangebatch : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangebatch, pcbchangebatch)
  end
  def begin_unordered_group : HRESULT
    @lpVtbl.value.begin_unordered_group.unsafe_as(Proc(HRESULT)).call
  end
  def end_unordered_group(pmadewithknowledge : ISyncKnowledge, fallchangesforknowledge : LibC::BOOL) : HRESULT
    @lpVtbl.value.end_unordered_group.unsafe_as(Proc(ISyncKnowledge, LibC::BOOL, HRESULT)).call(pmadewithknowledge, fallchangesforknowledge)
  end
  def add_logged_conflict(pbownerreplicaid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwflags : UInt32, dwworkforchange : UInt32, pconflictknowledge : ISyncKnowledge, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_logged_conflict.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncKnowledge, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbitemid, pchangeversion, pcreationversion, dwflags, dwworkforchange, pconflictknowledge, ppchangebuilder)
  end
  def add_merge_tombstone_metadata_to_group(pbownerreplicaid : UInt8*, pbwinneritemid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwworkforchange : UInt32, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_merge_tombstone_metadata_to_group.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbwinneritemid, pbitemid, pchangeversion, pcreationversion, dwworkforchange, ppchangebuilder)
  end
  def add_merge_tombstone_logged_conflict(pbownerreplicaid : UInt8*, pbwinneritemid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwworkforchange : UInt32, pconflictknowledge : ISyncKnowledge, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_merge_tombstone_logged_conflict.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, ISyncKnowledge, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbwinneritemid, pbitemid, pchangeversion, pcreationversion, dwworkforchange, pconflictknowledge, ppchangebuilder)
  end
end
struct LibWin32::ISyncFullEnumerationChangeBatch2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_change_enumerator(ppenum : IEnumSyncChanges*) : HRESULT
    @lpVtbl.value.get_change_enumerator.unsafe_as(Proc(IEnumSyncChanges*, HRESULT)).call(ppenum)
  end
  def get_is_last_batch(pflastbatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_last_batch.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflastbatch)
  end
  def get_work_estimate_for_batch(pdwworkforbatch : UInt32*) : HRESULT
    @lpVtbl.value.get_work_estimate_for_batch.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwworkforbatch)
  end
  def get_remaining_work_estimate_for_session(pdwremainingworkforsession : UInt32*) : HRESULT
    @lpVtbl.value.get_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwremainingworkforsession)
  end
  def begin_ordered_group(pblowerbound : UInt8*) : HRESULT
    @lpVtbl.value.begin_ordered_group.unsafe_as(Proc(UInt8*, HRESULT)).call(pblowerbound)
  end
  def end_ordered_group(pbupperbound : UInt8*, pmadewithknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.end_ordered_group.unsafe_as(Proc(UInt8*, ISyncKnowledge, HRESULT)).call(pbupperbound, pmadewithknowledge)
  end
  def add_item_metadata_to_group(pbownerreplicaid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwflags : UInt32, dwworkforchange : UInt32, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_item_metadata_to_group.unsafe_as(Proc(UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbitemid, pchangeversion, pcreationversion, dwflags, dwworkforchange, ppchangebuilder)
  end
  def get_learned_knowledge(pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledge)
  end
  def get_prerequisite_knowledge(ppprerequisteknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_prerequisite_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppprerequisteknowledge)
  end
  def get_source_forgotten_knowledge(ppsourceforgottenknowledge : IForgottenKnowledge*) : HRESULT
    @lpVtbl.value.get_source_forgotten_knowledge.unsafe_as(Proc(IForgottenKnowledge*, HRESULT)).call(ppsourceforgottenknowledge)
  end
  def set_last_batch : HRESULT
    @lpVtbl.value.set_last_batch.unsafe_as(Proc(HRESULT)).call
  end
  def set_work_estimate_for_batch(dwworkforbatch : UInt32) : HRESULT
    @lpVtbl.value.set_work_estimate_for_batch.unsafe_as(Proc(UInt32, HRESULT)).call(dwworkforbatch)
  end
  def set_remaining_work_estimate_for_session(dwremainingworkforsession : UInt32) : HRESULT
    @lpVtbl.value.set_remaining_work_estimate_for_session.unsafe_as(Proc(UInt32, HRESULT)).call(dwremainingworkforsession)
  end
  def serialize(pbchangebatch : UInt8*, pcbchangebatch : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangebatch, pcbchangebatch)
  end
  def get_learned_knowledge_after_recovery_complete(pplearnedknowledgeafterrecoverycomplete : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge_after_recovery_complete.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledgeafterrecoverycomplete)
  end
  def get_closed_lower_bound_item_id(pbclosedlowerbounditemid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_closed_lower_bound_item_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbclosedlowerbounditemid, pcbidsize)
  end
  def get_closed_upper_bound_item_id(pbclosedupperbounditemid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_closed_upper_bound_item_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbclosedupperbounditemid, pcbidsize)
  end
  def add_merge_tombstone_metadata_to_group(pbownerreplicaid : UInt8*, pbwinneritemid : UInt8*, pbitemid : UInt8*, pchangeversion : SYNC_VERSION*, pcreationversion : SYNC_VERSION*, dwworkforchange : UInt32, ppchangebuilder : ISyncChangeBuilder*) : HRESULT
    @lpVtbl.value.add_merge_tombstone_metadata_to_group.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, ISyncChangeBuilder*, HRESULT)).call(pbownerreplicaid, pbwinneritemid, pbitemid, pchangeversion, pcreationversion, dwworkforchange, ppchangebuilder)
  end
end
struct LibWin32::IKnowledgeSyncProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_id_parameters(pidparameters : ID_PARAMETERS*) : HRESULT
    @lpVtbl.value.get_id_parameters.unsafe_as(Proc(ID_PARAMETERS*, HRESULT)).call(pidparameters)
  end
  def begin_session(role : SYNC_PROVIDER_ROLE, psessionstate : ISyncSessionState) : HRESULT
    @lpVtbl.value.begin_session.unsafe_as(Proc(SYNC_PROVIDER_ROLE, ISyncSessionState, HRESULT)).call(role, psessionstate)
  end
  def get_sync_batch_parameters(ppsyncknowledge : ISyncKnowledge*, pdwrequestedbatchsize : UInt32*) : HRESULT
    @lpVtbl.value.get_sync_batch_parameters.unsafe_as(Proc(ISyncKnowledge*, UInt32*, HRESULT)).call(ppsyncknowledge, pdwrequestedbatchsize)
  end
  def get_change_batch(dwbatchsize : UInt32, psyncknowledge : ISyncKnowledge, ppsyncchangebatch : ISyncChangeBatch*, ppunkdataretriever : IUnknown*) : HRESULT
    @lpVtbl.value.get_change_batch.unsafe_as(Proc(UInt32, ISyncKnowledge, ISyncChangeBatch*, IUnknown*, HRESULT)).call(dwbatchsize, psyncknowledge, ppsyncchangebatch, ppunkdataretriever)
  end
  def get_full_enumeration_change_batch(dwbatchsize : UInt32, pblowerenumerationbound : UInt8*, psyncknowledge : ISyncKnowledge, ppsyncchangebatch : ISyncFullEnumerationChangeBatch*, ppunkdataretriever : IUnknown*) : HRESULT
    @lpVtbl.value.get_full_enumeration_change_batch.unsafe_as(Proc(UInt32, UInt8*, ISyncKnowledge, ISyncFullEnumerationChangeBatch*, IUnknown*, HRESULT)).call(dwbatchsize, pblowerenumerationbound, psyncknowledge, ppsyncchangebatch, ppunkdataretriever)
  end
  def process_change_batch(resolutionpolicy : CONFLICT_RESOLUTION_POLICY, psourcechangebatch : ISyncChangeBatch, punkdataretriever : IUnknown, pcallback : ISyncCallback, psyncsessionstatistics : SYNC_SESSION_STATISTICS*) : HRESULT
    @lpVtbl.value.process_change_batch.unsafe_as(Proc(CONFLICT_RESOLUTION_POLICY, ISyncChangeBatch, IUnknown, ISyncCallback, SYNC_SESSION_STATISTICS*, HRESULT)).call(resolutionpolicy, psourcechangebatch, punkdataretriever, pcallback, psyncsessionstatistics)
  end
  def process_full_enumeration_change_batch(resolutionpolicy : CONFLICT_RESOLUTION_POLICY, psourcechangebatch : ISyncFullEnumerationChangeBatch, punkdataretriever : IUnknown, pcallback : ISyncCallback, psyncsessionstatistics : SYNC_SESSION_STATISTICS*) : HRESULT
    @lpVtbl.value.process_full_enumeration_change_batch.unsafe_as(Proc(CONFLICT_RESOLUTION_POLICY, ISyncFullEnumerationChangeBatch, IUnknown, ISyncCallback, SYNC_SESSION_STATISTICS*, HRESULT)).call(resolutionpolicy, psourcechangebatch, punkdataretriever, pcallback, psyncsessionstatistics)
  end
  def end_session(psessionstate : ISyncSessionState) : HRESULT
    @lpVtbl.value.end_session.unsafe_as(Proc(ISyncSessionState, HRESULT)).call(psessionstate)
  end
end
struct LibWin32::ISyncChangeUnit
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_change(ppsyncchange : ISyncChange*) : HRESULT
    @lpVtbl.value.get_item_change.unsafe_as(Proc(ISyncChange*, HRESULT)).call(ppsyncchange)
  end
  def get_change_unit_id(pbchangeunitid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_change_unit_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbchangeunitid, pcbidsize)
  end
  def get_change_unit_version(pbcurrentreplicaid : UInt8*, pversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.get_change_unit_version.unsafe_as(Proc(UInt8*, SYNC_VERSION*, HRESULT)).call(pbcurrentreplicaid, pversion)
  end
end
struct LibWin32::IEnumSyncChangeUnits
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cchanges : UInt32, ppchangeunit : ISyncChangeUnit*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ISyncChangeUnit*, UInt32*, HRESULT)).call(cchanges, ppchangeunit, pcfetched)
  end
  def skip(cchanges : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cchanges)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSyncChangeUnits*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSyncChangeUnits*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ISyncChange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner_replica_id(pbreplicaid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_owner_replica_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbreplicaid, pcbidsize)
  end
  def get_root_item_id(pbrootitemid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_root_item_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbrootitemid, pcbidsize)
  end
  def get_change_version(pbcurrentreplicaid : UInt8*, pversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.get_change_version.unsafe_as(Proc(UInt8*, SYNC_VERSION*, HRESULT)).call(pbcurrentreplicaid, pversion)
  end
  def get_creation_version(pbcurrentreplicaid : UInt8*, pversion : SYNC_VERSION*) : HRESULT
    @lpVtbl.value.get_creation_version.unsafe_as(Proc(UInt8*, SYNC_VERSION*, HRESULT)).call(pbcurrentreplicaid, pversion)
  end
  def get_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def get_work_estimate(pdwwork : UInt32*) : HRESULT
    @lpVtbl.value.get_work_estimate.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwwork)
  end
  def get_change_units(ppenum : IEnumSyncChangeUnits*) : HRESULT
    @lpVtbl.value.get_change_units.unsafe_as(Proc(IEnumSyncChangeUnits*, HRESULT)).call(ppenum)
  end
  def get_made_with_knowledge(ppmadewithknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_made_with_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppmadewithknowledge)
  end
  def get_learned_knowledge(pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledge)
  end
  def set_work_estimate(dwwork : UInt32) : HRESULT
    @lpVtbl.value.set_work_estimate.unsafe_as(Proc(UInt32, HRESULT)).call(dwwork)
  end
end
struct LibWin32::ISyncChangeWithPrerequisite
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_prerequisite_knowledge(ppprerequisiteknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_prerequisite_knowledge.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(ppprerequisiteknowledge)
  end
  def get_learned_knowledge_with_prerequisite(pdestinationknowledge : ISyncKnowledge, pplearnedknowledgewithprerequisite : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge_with_prerequisite.unsafe_as(Proc(ISyncKnowledge, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pplearnedknowledgewithprerequisite)
  end
end
struct LibWin32::ISyncFullEnumerationChange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_learned_knowledge_after_recovery_complete(pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_knowledge_after_recovery_complete.unsafe_as(Proc(ISyncKnowledge*, HRESULT)).call(pplearnedknowledge)
  end
  def get_learned_forgotten_knowledge(pplearnedforgottenknowledge : IForgottenKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_forgotten_knowledge.unsafe_as(Proc(IForgottenKnowledge*, HRESULT)).call(pplearnedforgottenknowledge)
  end
end
struct LibWin32::ISyncMergeTombstoneChange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_winner_item_id(pbwinneritemid : UInt8*, pcbidsize : UInt32*) : HRESULT
    @lpVtbl.value.get_winner_item_id.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbwinneritemid, pcbidsize)
  end
end
struct LibWin32::IEnumItemIds
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(pbitemid : UInt8*, pcbitemidsize : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbitemid, pcbitemidsize)
  end
end
struct LibWin32::IFilterKeyMap
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def add_filter(pisyncfilter : ISyncFilter, pdwfilterkey : UInt32*) : HRESULT
    @lpVtbl.value.add_filter.unsafe_as(Proc(ISyncFilter, UInt32*, HRESULT)).call(pisyncfilter, pdwfilterkey)
  end
  def get_filter(dwfilterkey : UInt32, ppisyncfilter : ISyncFilter*) : HRESULT
    @lpVtbl.value.get_filter.unsafe_as(Proc(UInt32, ISyncFilter*, HRESULT)).call(dwfilterkey, ppisyncfilter)
  end
  def serialize(pbfilterkeymap : UInt8*, pcbfilterkeymap : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbfilterkeymap, pcbfilterkeymap)
  end
end
struct LibWin32::ISyncChangeWithFilterKeyMap
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_filter_count(pdwfiltercount : UInt32*) : HRESULT
    @lpVtbl.value.get_filter_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwfiltercount)
  end
  def get_filter_change(dwfilterkey : UInt32, pfilterchange : SYNC_FILTER_CHANGE*) : HRESULT
    @lpVtbl.value.get_filter_change.unsafe_as(Proc(UInt32, SYNC_FILTER_CHANGE*, HRESULT)).call(dwfilterkey, pfilterchange)
  end
  def get_all_change_units_present_flag(pfallchangeunitspresent : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_all_change_units_present_flag.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfallchangeunitspresent)
  end
  def get_filter_forgotten_knowledge(dwfilterkey : UInt32, ppifilterforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_filter_forgotten_knowledge.unsafe_as(Proc(UInt32, ISyncKnowledge*, HRESULT)).call(dwfilterkey, ppifilterforgottenknowledge)
  end
  def get_filtered_replica_learned_knowledge(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, pplearnedknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_filtered_replica_learned_knowledge.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, pplearnedknowledge)
  end
  def get_learned_filter_forgotten_knowledge(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, dwfilterkey : UInt32, pplearnedfilterforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_filter_forgotten_knowledge.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, UInt32, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, dwfilterkey, pplearnedfilterforgottenknowledge)
  end
  def get_filtered_replica_learned_forgotten_knowledge(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, pplearnedforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_filtered_replica_learned_forgotten_knowledge.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, pplearnedforgottenknowledge)
  end
  def get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, pplearnedforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, pplearnedforgottenknowledge)
  end
  def get_learned_filter_forgotten_knowledge_after_recovery_complete(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, dwfilterkey : UInt32, pplearnedfilterforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_filter_forgotten_knowledge_after_recovery_complete.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, UInt32, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, dwfilterkey, pplearnedfilterforgottenknowledge)
  end
end
struct LibWin32::ISyncChangeBatchWithFilterKeyMap
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_filter_key_map(ppifilterkeymap : IFilterKeyMap*) : HRESULT
    @lpVtbl.value.get_filter_key_map.unsafe_as(Proc(IFilterKeyMap*, HRESULT)).call(ppifilterkeymap)
  end
  def set_filter_key_map(pifilterkeymap : IFilterKeyMap) : HRESULT
    @lpVtbl.value.set_filter_key_map.unsafe_as(Proc(IFilterKeyMap, HRESULT)).call(pifilterkeymap)
  end
  def set_filter_forgotten_knowledge(dwfilterkey : UInt32, pfilterforgottenknowledge : ISyncKnowledge) : HRESULT
    @lpVtbl.value.set_filter_forgotten_knowledge.unsafe_as(Proc(UInt32, ISyncKnowledge, HRESULT)).call(dwfilterkey, pfilterforgottenknowledge)
  end
  def get_filtered_replica_learned_knowledge(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, pplearnedforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_filtered_replica_learned_knowledge.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, pplearnedforgottenknowledge)
  end
  def get_learned_filter_forgotten_knowledge(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, dwfilterkey : UInt32, pplearnedfilterforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_filter_forgotten_knowledge.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, UInt32, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, dwfilterkey, pplearnedfilterforgottenknowledge)
  end
  def get_filtered_replica_learned_forgotten_knowledge(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, pplearnedforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_filtered_replica_learned_forgotten_knowledge.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, pplearnedforgottenknowledge)
  end
  def get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, pplearnedforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, pplearnedforgottenknowledge)
  end
  def get_learned_filter_forgotten_knowledge_after_recovery_complete(pdestinationknowledge : ISyncKnowledge, pnewmoveins : IEnumItemIds, dwfilterkey : UInt32, pplearnedfilterforgottenknowledge : ISyncKnowledge*) : HRESULT
    @lpVtbl.value.get_learned_filter_forgotten_knowledge_after_recovery_complete.unsafe_as(Proc(ISyncKnowledge, IEnumItemIds, UInt32, ISyncKnowledge*, HRESULT)).call(pdestinationknowledge, pnewmoveins, dwfilterkey, pplearnedfilterforgottenknowledge)
  end
end
struct LibWin32::IDataRetrieverCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load_change_data_complete(punkdata : IUnknown) : HRESULT
    @lpVtbl.value.load_change_data_complete.unsafe_as(Proc(IUnknown, HRESULT)).call(punkdata)
  end
  def load_change_data_error(hrerror : HRESULT) : HRESULT
    @lpVtbl.value.load_change_data_error.unsafe_as(Proc(HRESULT, HRESULT)).call(hrerror)
  end
end
struct LibWin32::ILoadChangeContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_sync_change(ppsyncchange : ISyncChange*) : HRESULT
    @lpVtbl.value.get_sync_change.unsafe_as(Proc(ISyncChange*, HRESULT)).call(ppsyncchange)
  end
  def set_recoverable_error_on_change(hrerror : HRESULT, perrordata : IRecoverableErrorData) : HRESULT
    @lpVtbl.value.set_recoverable_error_on_change.unsafe_as(Proc(HRESULT, IRecoverableErrorData, HRESULT)).call(hrerror, perrordata)
  end
  def set_recoverable_error_on_change_unit(hrerror : HRESULT, pchangeunit : ISyncChangeUnit, perrordata : IRecoverableErrorData) : HRESULT
    @lpVtbl.value.set_recoverable_error_on_change_unit.unsafe_as(Proc(HRESULT, ISyncChangeUnit, IRecoverableErrorData, HRESULT)).call(hrerror, pchangeunit, perrordata)
  end
end
struct LibWin32::ISynchronousDataRetriever
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_id_parameters(pidparameters : ID_PARAMETERS*) : HRESULT
    @lpVtbl.value.get_id_parameters.unsafe_as(Proc(ID_PARAMETERS*, HRESULT)).call(pidparameters)
  end
  def load_change_data(ploadchangecontext : ILoadChangeContext, ppunkdata : IUnknown*) : HRESULT
    @lpVtbl.value.load_change_data.unsafe_as(Proc(ILoadChangeContext, IUnknown*, HRESULT)).call(ploadchangecontext, ppunkdata)
  end
end
struct LibWin32::IAsynchronousDataRetriever
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_id_parameters(pidparameters : ID_PARAMETERS*) : HRESULT
    @lpVtbl.value.get_id_parameters.unsafe_as(Proc(ID_PARAMETERS*, HRESULT)).call(pidparameters)
  end
  def register_callback(pdataretrievercallback : IDataRetrieverCallback) : HRESULT
    @lpVtbl.value.register_callback.unsafe_as(Proc(IDataRetrieverCallback, HRESULT)).call(pdataretrievercallback)
  end
  def revoke_callback(pdataretrievercallback : IDataRetrieverCallback) : HRESULT
    @lpVtbl.value.revoke_callback.unsafe_as(Proc(IDataRetrieverCallback, HRESULT)).call(pdataretrievercallback)
  end
  def load_change_data(ploadchangecontext : ILoadChangeContext) : HRESULT
    @lpVtbl.value.load_change_data.unsafe_as(Proc(ILoadChangeContext, HRESULT)).call(ploadchangecontext)
  end
end
struct LibWin32::IFilterRequestCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def request_filter(pfilter : IUnknown, filteringtype : FILTERING_TYPE) : HRESULT
    @lpVtbl.value.request_filter.unsafe_as(Proc(IUnknown, FILTERING_TYPE, HRESULT)).call(pfilter, filteringtype)
  end
end
struct LibWin32::IRequestFilteredSync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def specify_filter(pcallback : IFilterRequestCallback) : HRESULT
    @lpVtbl.value.specify_filter.unsafe_as(Proc(IFilterRequestCallback, HRESULT)).call(pcallback)
  end
end
struct LibWin32::ISupportFilteredSync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_filter(pfilter : IUnknown, filteringtype : FILTERING_TYPE) : HRESULT
    @lpVtbl.value.add_filter.unsafe_as(Proc(IUnknown, FILTERING_TYPE, HRESULT)).call(pfilter, filteringtype)
  end
end
struct LibWin32::IFilterTrackingRequestCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def request_tracked_filter(pfilter : ISyncFilter) : HRESULT
    @lpVtbl.value.request_tracked_filter.unsafe_as(Proc(ISyncFilter, HRESULT)).call(pfilter)
  end
end
struct LibWin32::IFilterTrackingProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def specify_tracked_filters(pcallback : IFilterTrackingRequestCallback) : HRESULT
    @lpVtbl.value.specify_tracked_filters.unsafe_as(Proc(IFilterTrackingRequestCallback, HRESULT)).call(pcallback)
  end
  def add_tracked_filter(pfilter : ISyncFilter) : HRESULT
    @lpVtbl.value.add_tracked_filter.unsafe_as(Proc(ISyncFilter, HRESULT)).call(pfilter)
  end
end
struct LibWin32::ISupportLastWriteTime
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_change_time(pbitemid : UInt8*, pulltimestamp : UInt64*) : HRESULT
    @lpVtbl.value.get_item_change_time.unsafe_as(Proc(UInt8*, UInt64*, HRESULT)).call(pbitemid, pulltimestamp)
  end
  def get_change_unit_change_time(pbitemid : UInt8*, pbchangeunitid : UInt8*, pulltimestamp : UInt64*) : HRESULT
    @lpVtbl.value.get_change_unit_change_time.unsafe_as(Proc(UInt8*, UInt8*, UInt64*, HRESULT)).call(pbitemid, pbchangeunitid, pulltimestamp)
  end
end
struct LibWin32::IProviderConverter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pisyncprovider : ISyncProvider) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(ISyncProvider, HRESULT)).call(pisyncprovider)
  end
end
struct LibWin32::ISyncDataConverter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def convert_data_retriever_from_provider_format(punkdataretrieverin : IUnknown, penumsyncchanges : IEnumSyncChanges, ppunkdataout : IUnknown*) : HRESULT
    @lpVtbl.value.convert_data_retriever_from_provider_format.unsafe_as(Proc(IUnknown, IEnumSyncChanges, IUnknown*, HRESULT)).call(punkdataretrieverin, penumsyncchanges, ppunkdataout)
  end
  def convert_data_retriever_to_provider_format(punkdataretrieverin : IUnknown, penumsyncchanges : IEnumSyncChanges, ppunkdataout : IUnknown*) : HRESULT
    @lpVtbl.value.convert_data_retriever_to_provider_format.unsafe_as(Proc(IUnknown, IEnumSyncChanges, IUnknown*, HRESULT)).call(punkdataretrieverin, penumsyncchanges, ppunkdataout)
  end
  def convert_data_from_provider_format(pdatacontext : ILoadChangeContext, punkdatain : IUnknown, ppunkdataout : IUnknown*) : HRESULT
    @lpVtbl.value.convert_data_from_provider_format.unsafe_as(Proc(ILoadChangeContext, IUnknown, IUnknown*, HRESULT)).call(pdatacontext, punkdatain, ppunkdataout)
  end
  def convert_data_to_provider_format(pdatacontext : ILoadChangeContext, punkdataout : IUnknown, ppunkdataout : IUnknown*) : HRESULT
    @lpVtbl.value.convert_data_to_provider_format.unsafe_as(Proc(ILoadChangeContext, IUnknown, IUnknown*, HRESULT)).call(pdatacontext, punkdataout, ppunkdataout)
  end
end
struct LibWin32::ISyncProviderRegistration
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_sync_provider_config_ui_registration_instance(pconfiguiconfig : SyncProviderConfigUIConfiguration*, ppconfiguiinfo : ISyncProviderConfigUIInfo*) : HRESULT
    @lpVtbl.value.create_sync_provider_config_ui_registration_instance.unsafe_as(Proc(SyncProviderConfigUIConfiguration*, ISyncProviderConfigUIInfo*, HRESULT)).call(pconfiguiconfig, ppconfiguiinfo)
  end
  def unregister_sync_provider_config_ui(pguidinstanceid : Guid*) : HRESULT
    @lpVtbl.value.unregister_sync_provider_config_ui.unsafe_as(Proc(Guid*, HRESULT)).call(pguidinstanceid)
  end
  def enumerate_sync_provider_config_u_is(pguidcontenttype : Guid*, dwsupportedarchitecture : UInt32, ppenumsyncproviderconfiguiinfos : IEnumSyncProviderConfigUIInfos*) : HRESULT
    @lpVtbl.value.enumerate_sync_provider_config_u_is.unsafe_as(Proc(Guid*, UInt32, IEnumSyncProviderConfigUIInfos*, HRESULT)).call(pguidcontenttype, dwsupportedarchitecture, ppenumsyncproviderconfiguiinfos)
  end
  def create_sync_provider_registration_instance(pproviderconfiguration : SyncProviderConfiguration*, ppproviderinfo : ISyncProviderInfo*) : HRESULT
    @lpVtbl.value.create_sync_provider_registration_instance.unsafe_as(Proc(SyncProviderConfiguration*, ISyncProviderInfo*, HRESULT)).call(pproviderconfiguration, ppproviderinfo)
  end
  def unregister_sync_provider(pguidinstanceid : Guid*) : HRESULT
    @lpVtbl.value.unregister_sync_provider.unsafe_as(Proc(Guid*, HRESULT)).call(pguidinstanceid)
  end
  def get_sync_provider_config_ui_infofor_provider(pguidproviderinstanceid : Guid*, ppproviderconfiguiinfo : ISyncProviderConfigUIInfo*) : HRESULT
    @lpVtbl.value.get_sync_provider_config_ui_infofor_provider.unsafe_as(Proc(Guid*, ISyncProviderConfigUIInfo*, HRESULT)).call(pguidproviderinstanceid, ppproviderconfiguiinfo)
  end
  def enumerate_sync_providers(pguidcontenttype : Guid*, dwstateflagstofiltermask : UInt32, dwstateflagstofilter : UInt32, refproviderclsid : Guid*, dwsupportedarchitecture : UInt32, ppenumsyncproviderinfos : IEnumSyncProviderInfos*) : HRESULT
    @lpVtbl.value.enumerate_sync_providers.unsafe_as(Proc(Guid*, UInt32, UInt32, Guid*, UInt32, IEnumSyncProviderInfos*, HRESULT)).call(pguidcontenttype, dwstateflagstofiltermask, dwstateflagstofilter, refproviderclsid, dwsupportedarchitecture, ppenumsyncproviderinfos)
  end
  def get_sync_provider_info(pguidinstanceid : Guid*, ppproviderinfo : ISyncProviderInfo*) : HRESULT
    @lpVtbl.value.get_sync_provider_info.unsafe_as(Proc(Guid*, ISyncProviderInfo*, HRESULT)).call(pguidinstanceid, ppproviderinfo)
  end
  def get_sync_provider_from_instance_id(pguidinstanceid : Guid*, dwclscontext : UInt32, ppsyncprovider : IRegisteredSyncProvider*) : HRESULT
    @lpVtbl.value.get_sync_provider_from_instance_id.unsafe_as(Proc(Guid*, UInt32, IRegisteredSyncProvider*, HRESULT)).call(pguidinstanceid, dwclscontext, ppsyncprovider)
  end
  def get_sync_provider_config_ui_info(pguidinstanceid : Guid*, ppconfiguiinfo : ISyncProviderConfigUIInfo*) : HRESULT
    @lpVtbl.value.get_sync_provider_config_ui_info.unsafe_as(Proc(Guid*, ISyncProviderConfigUIInfo*, HRESULT)).call(pguidinstanceid, ppconfiguiinfo)
  end
  def get_sync_provider_config_ui_from_instance_id(pguidinstanceid : Guid*, dwclscontext : UInt32, ppconfigui : ISyncProviderConfigUI*) : HRESULT
    @lpVtbl.value.get_sync_provider_config_ui_from_instance_id.unsafe_as(Proc(Guid*, UInt32, ISyncProviderConfigUI*, HRESULT)).call(pguidinstanceid, dwclscontext, ppconfigui)
  end
  def get_sync_provider_state(pguidinstanceid : Guid*, pdwstateflags : UInt32*) : HRESULT
    @lpVtbl.value.get_sync_provider_state.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(pguidinstanceid, pdwstateflags)
  end
  def set_sync_provider_state(pguidinstanceid : Guid*, dwstateflagsmask : UInt32, dwstateflags : UInt32) : HRESULT
    @lpVtbl.value.set_sync_provider_state.unsafe_as(Proc(Guid*, UInt32, UInt32, HRESULT)).call(pguidinstanceid, dwstateflagsmask, dwstateflags)
  end
  def register_for_event(phevent : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.register_for_event.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(phevent)
  end
  def revoke_event(hevent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.revoke_event.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hevent)
  end
  def get_change(hevent : LibC::HANDLE, ppchange : ISyncRegistrationChange*) : HRESULT
    @lpVtbl.value.get_change.unsafe_as(Proc(LibC::HANDLE, ISyncRegistrationChange*, HRESULT)).call(hevent, ppchange)
  end
end
struct LibWin32::IEnumSyncProviderConfigUIInfos
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cfactories : UInt32, ppsyncproviderconfiguiinfo : ISyncProviderConfigUIInfo*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ISyncProviderConfigUIInfo*, UInt32*, HRESULT)).call(cfactories, ppsyncproviderconfiguiinfo, pcfetched)
  end
  def skip(cfactories : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cfactories)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSyncProviderConfigUIInfos*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSyncProviderConfigUIInfos*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumSyncProviderInfos
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(cinstances : UInt32, ppsyncproviderinfo : ISyncProviderInfo*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ISyncProviderInfo*, UInt32*, HRESULT)).call(cinstances, ppsyncproviderinfo, pcfetched)
  end
  def skip(cinstances : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cinstances)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSyncProviderInfos*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSyncProviderInfos*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ISyncProviderInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(cprops : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(cprops)
  end
  def get_at(iprop : UInt32, pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, PROPERTYKEY*, HRESULT)).call(iprop, pkey)
  end
  def get_value(key : PROPERTYKEY*, pv : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, pv)
  end
  def set_value(key : PROPERTYKEY*, propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, propvar)
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_sync_provider(dwclscontext : UInt32, ppsyncprovider : IRegisteredSyncProvider*) : HRESULT
    @lpVtbl.value.get_sync_provider.unsafe_as(Proc(UInt32, IRegisteredSyncProvider*, HRESULT)).call(dwclscontext, ppsyncprovider)
  end
end
struct LibWin32::ISyncProviderConfigUIInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(cprops : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(cprops)
  end
  def get_at(iprop : UInt32, pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, PROPERTYKEY*, HRESULT)).call(iprop, pkey)
  end
  def get_value(key : PROPERTYKEY*, pv : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, pv)
  end
  def set_value(key : PROPERTYKEY*, propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, propvar)
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_sync_provider_config_ui(dwclscontext : UInt32, ppsyncproviderconfigui : ISyncProviderConfigUI*) : HRESULT
    @lpVtbl.value.get_sync_provider_config_ui.unsafe_as(Proc(UInt32, ISyncProviderConfigUI*, HRESULT)).call(dwclscontext, ppsyncproviderconfigui)
  end
end
struct LibWin32::ISyncProviderConfigUI
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def init(pguidinstanceid : Guid*, pguidcontenttype : Guid*, pconfigurationproperties : IPropertyStore) : HRESULT
    @lpVtbl.value.init.unsafe_as(Proc(Guid*, Guid*, IPropertyStore, HRESULT)).call(pguidinstanceid, pguidcontenttype, pconfigurationproperties)
  end
  def get_registered_properties(ppconfiguiproperties : IPropertyStore*) : HRESULT
    @lpVtbl.value.get_registered_properties.unsafe_as(Proc(IPropertyStore*, HRESULT)).call(ppconfiguiproperties)
  end
  def create_and_register_new_sync_provider(hwndparent : LibC::HANDLE, punkcontext : IUnknown, ppproviderinfo : ISyncProviderInfo*) : HRESULT
    @lpVtbl.value.create_and_register_new_sync_provider.unsafe_as(Proc(LibC::HANDLE, IUnknown, ISyncProviderInfo*, HRESULT)).call(hwndparent, punkcontext, ppproviderinfo)
  end
  def modify_sync_provider(hwndparent : LibC::HANDLE, punkcontext : IUnknown, pproviderinfo : ISyncProviderInfo) : HRESULT
    @lpVtbl.value.modify_sync_provider.unsafe_as(Proc(LibC::HANDLE, IUnknown, ISyncProviderInfo, HRESULT)).call(hwndparent, punkcontext, pproviderinfo)
  end
end
struct LibWin32::IRegisteredSyncProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def init(pguidinstanceid : Guid*, pguidcontenttype : Guid*, pcontextpropertystore : IPropertyStore) : HRESULT
    @lpVtbl.value.init.unsafe_as(Proc(Guid*, Guid*, IPropertyStore, HRESULT)).call(pguidinstanceid, pguidcontenttype, pcontextpropertystore)
  end
  def get_instance_id(pguidinstanceid : Guid*) : HRESULT
    @lpVtbl.value.get_instance_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguidinstanceid)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISyncRegistrationChange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_event(psreevent : SYNC_REGISTRATION_EVENT*) : HRESULT
    @lpVtbl.value.get_event.unsafe_as(Proc(SYNC_REGISTRATION_EVENT*, HRESULT)).call(psreevent)
  end
  def get_instance_id(pguidinstanceid : Guid*) : HRESULT
    @lpVtbl.value.get_instance_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguidinstanceid)
  end
end
