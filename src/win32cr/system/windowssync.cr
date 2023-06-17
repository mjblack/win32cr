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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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
    query_interface : Proc(IClockVectorElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(IClockVectorElement*, UInt32)
    release : Proc(IClockVectorElement*, UInt32)
    get_replica_key : Proc(IClockVectorElement*, UInt32*, HRESULT)
    get_tick_count : Proc(IClockVectorElement*, UInt64*, HRESULT)
  end

  IClockVectorElement_GUID = "e71c4250-adf8-4a07-8fae-5669596909c1"
  IID_IClockVectorElement = LibC::GUID.new(0xe71c4250_u32, 0xadf8_u16, 0x4a07_u16, StaticArray[0x8f_u8, 0xae_u8, 0x56_u8, 0x69_u8, 0x59_u8, 0x69_u8, 0x9_u8, 0xc1_u8])
  struct IClockVectorElement
    lpVtbl : IClockVectorElementVTbl*
  end

  struct IFeedClockVectorElementVTbl
    query_interface : Proc(IFeedClockVectorElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFeedClockVectorElement*, UInt32)
    release : Proc(IFeedClockVectorElement*, UInt32)
    get_replica_key : Proc(IFeedClockVectorElement*, UInt32*, HRESULT)
    get_tick_count : Proc(IFeedClockVectorElement*, UInt64*, HRESULT)
    get_sync_time : Proc(IFeedClockVectorElement*, SYNC_TIME*, HRESULT)
    get_flags : Proc(IFeedClockVectorElement*, UInt8*, HRESULT)
  end

  IFeedClockVectorElement_GUID = "a40b46d2-e97b-4156-b6da-991f501b0f05"
  IID_IFeedClockVectorElement = LibC::GUID.new(0xa40b46d2_u32, 0xe97b_u16, 0x4156_u16, StaticArray[0xb6_u8, 0xda_u8, 0x99_u8, 0x1f_u8, 0x50_u8, 0x1b_u8, 0xf_u8, 0x5_u8])
  struct IFeedClockVectorElement
    lpVtbl : IFeedClockVectorElementVTbl*
  end

  struct IClockVectorVTbl
    query_interface : Proc(IClockVector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IClockVector*, UInt32)
    release : Proc(IClockVector*, UInt32)
    get_clock_vector_elements : Proc(IClockVector*, Guid*, Void**, HRESULT)
    get_clock_vector_element_count : Proc(IClockVector*, UInt32*, HRESULT)
  end

  IClockVector_GUID = "14b2274a-8698-4cc6-9333-f89bd1d47bc4"
  IID_IClockVector = LibC::GUID.new(0x14b2274a_u32, 0x8698_u16, 0x4cc6_u16, StaticArray[0x93_u8, 0x33_u8, 0xf8_u8, 0x9b_u8, 0xd1_u8, 0xd4_u8, 0x7b_u8, 0xc4_u8])
  struct IClockVector
    lpVtbl : IClockVectorVTbl*
  end

  struct IFeedClockVectorVTbl
    query_interface : Proc(IFeedClockVector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFeedClockVector*, UInt32)
    release : Proc(IFeedClockVector*, UInt32)
    get_clock_vector_elements : Proc(IFeedClockVector*, Guid*, Void**, HRESULT)
    get_clock_vector_element_count : Proc(IFeedClockVector*, UInt32*, HRESULT)
    get_update_count : Proc(IFeedClockVector*, UInt32*, HRESULT)
    is_no_conflicts_specified : Proc(IFeedClockVector*, LibC::BOOL*, HRESULT)
  end

  IFeedClockVector_GUID = "8d1d98d1-9fb8-4ec9-a553-54dd924e0f67"
  IID_IFeedClockVector = LibC::GUID.new(0x8d1d98d1_u32, 0x9fb8_u16, 0x4ec9_u16, StaticArray[0xa5_u8, 0x53_u8, 0x54_u8, 0xdd_u8, 0x92_u8, 0x4e_u8, 0xf_u8, 0x67_u8])
  struct IFeedClockVector
    lpVtbl : IFeedClockVectorVTbl*
  end

  struct IEnumClockVectorVTbl
    query_interface : Proc(IEnumClockVector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumClockVector*, UInt32)
    release : Proc(IEnumClockVector*, UInt32)
    next : Proc(IEnumClockVector*, UInt32, IClockVectorElement*, UInt32*, HRESULT)
    skip : Proc(IEnumClockVector*, UInt32, HRESULT)
    reset : Proc(IEnumClockVector*, HRESULT)
    clone : Proc(IEnumClockVector*, IEnumClockVector*, HRESULT)
  end

  IEnumClockVector_GUID = "525844db-2837-4799-9e80-81a66e02220c"
  IID_IEnumClockVector = LibC::GUID.new(0x525844db_u32, 0x2837_u16, 0x4799_u16, StaticArray[0x9e_u8, 0x80_u8, 0x81_u8, 0xa6_u8, 0x6e_u8, 0x2_u8, 0x22_u8, 0xc_u8])
  struct IEnumClockVector
    lpVtbl : IEnumClockVectorVTbl*
  end

  struct IEnumFeedClockVectorVTbl
    query_interface : Proc(IEnumFeedClockVector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumFeedClockVector*, UInt32)
    release : Proc(IEnumFeedClockVector*, UInt32)
    next : Proc(IEnumFeedClockVector*, UInt32, IFeedClockVectorElement*, UInt32*, HRESULT)
    skip : Proc(IEnumFeedClockVector*, UInt32, HRESULT)
    reset : Proc(IEnumFeedClockVector*, HRESULT)
    clone : Proc(IEnumFeedClockVector*, IEnumFeedClockVector*, HRESULT)
  end

  IEnumFeedClockVector_GUID = "550f763d-146a-48f6-abeb-6c88c7f70514"
  IID_IEnumFeedClockVector = LibC::GUID.new(0x550f763d_u32, 0x146a_u16, 0x48f6_u16, StaticArray[0xab_u8, 0xeb_u8, 0x6c_u8, 0x88_u8, 0xc7_u8, 0xf7_u8, 0x5_u8, 0x14_u8])
  struct IEnumFeedClockVector
    lpVtbl : IEnumFeedClockVectorVTbl*
  end

  struct ICoreFragmentVTbl
    query_interface : Proc(ICoreFragment*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICoreFragment*, UInt32)
    release : Proc(ICoreFragment*, UInt32)
    next_column : Proc(ICoreFragment*, UInt8*, UInt32*, HRESULT)
    next_range : Proc(ICoreFragment*, UInt8*, UInt32*, IClockVector*, HRESULT)
    reset : Proc(ICoreFragment*, HRESULT)
    get_column_count : Proc(ICoreFragment*, UInt32*, HRESULT)
    get_range_count : Proc(ICoreFragment*, UInt32*, HRESULT)
  end

  ICoreFragment_GUID = "613b2ab5-b304-47d9-9c31-ce6c54401a15"
  IID_ICoreFragment = LibC::GUID.new(0x613b2ab5_u32, 0xb304_u16, 0x47d9_u16, StaticArray[0x9c_u8, 0x31_u8, 0xce_u8, 0x6c_u8, 0x54_u8, 0x40_u8, 0x1a_u8, 0x15_u8])
  struct ICoreFragment
    lpVtbl : ICoreFragmentVTbl*
  end

  struct ICoreFragmentInspectorVTbl
    query_interface : Proc(ICoreFragmentInspector*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICoreFragmentInspector*, UInt32)
    release : Proc(ICoreFragmentInspector*, UInt32)
    next_core_fragments : Proc(ICoreFragmentInspector*, UInt32, ICoreFragment*, UInt32*, HRESULT)
    reset : Proc(ICoreFragmentInspector*, HRESULT)
  end

  ICoreFragmentInspector_GUID = "f7fcc5fd-ae26-4679-ba16-96aac583c134"
  IID_ICoreFragmentInspector = LibC::GUID.new(0xf7fcc5fd_u32, 0xae26_u16, 0x4679_u16, StaticArray[0xba_u8, 0x16_u8, 0x96_u8, 0xaa_u8, 0xc5_u8, 0x83_u8, 0xc1_u8, 0x34_u8])
  struct ICoreFragmentInspector
    lpVtbl : ICoreFragmentInspectorVTbl*
  end

  struct IRangeExceptionVTbl
    query_interface : Proc(IRangeException*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRangeException*, UInt32)
    release : Proc(IRangeException*, UInt32)
    get_closed_range_start : Proc(IRangeException*, UInt8*, UInt32*, HRESULT)
    get_closed_range_end : Proc(IRangeException*, UInt8*, UInt32*, HRESULT)
    get_clock_vector : Proc(IRangeException*, Guid*, Void**, HRESULT)
  end

  IRangeException_GUID = "75ae8777-6848-49f7-956c-a3a92f5096e8"
  IID_IRangeException = LibC::GUID.new(0x75ae8777_u32, 0x6848_u16, 0x49f7_u16, StaticArray[0x95_u8, 0x6c_u8, 0xa3_u8, 0xa9_u8, 0x2f_u8, 0x50_u8, 0x96_u8, 0xe8_u8])
  struct IRangeException
    lpVtbl : IRangeExceptionVTbl*
  end

  struct IEnumRangeExceptionsVTbl
    query_interface : Proc(IEnumRangeExceptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumRangeExceptions*, UInt32)
    release : Proc(IEnumRangeExceptions*, UInt32)
    next : Proc(IEnumRangeExceptions*, UInt32, IRangeException*, UInt32*, HRESULT)
    skip : Proc(IEnumRangeExceptions*, UInt32, HRESULT)
    reset : Proc(IEnumRangeExceptions*, HRESULT)
    clone : Proc(IEnumRangeExceptions*, IEnumRangeExceptions*, HRESULT)
  end

  IEnumRangeExceptions_GUID = "0944439f-ddb1-4176-b703-046ff22a2386"
  IID_IEnumRangeExceptions = LibC::GUID.new(0x944439f_u32, 0xddb1_u16, 0x4176_u16, StaticArray[0xb7_u8, 0x3_u8, 0x4_u8, 0x6f_u8, 0xf2_u8, 0x2a_u8, 0x23_u8, 0x86_u8])
  struct IEnumRangeExceptions
    lpVtbl : IEnumRangeExceptionsVTbl*
  end

  struct ISingleItemExceptionVTbl
    query_interface : Proc(ISingleItemException*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISingleItemException*, UInt32)
    release : Proc(ISingleItemException*, UInt32)
    get_item_id : Proc(ISingleItemException*, UInt8*, UInt32*, HRESULT)
    get_clock_vector : Proc(ISingleItemException*, Guid*, Void**, HRESULT)
  end

  ISingleItemException_GUID = "892fb9b0-7c55-4a18-9316-fdf449569b64"
  IID_ISingleItemException = LibC::GUID.new(0x892fb9b0_u32, 0x7c55_u16, 0x4a18_u16, StaticArray[0x93_u8, 0x16_u8, 0xfd_u8, 0xf4_u8, 0x49_u8, 0x56_u8, 0x9b_u8, 0x64_u8])
  struct ISingleItemException
    lpVtbl : ISingleItemExceptionVTbl*
  end

  struct IEnumSingleItemExceptionsVTbl
    query_interface : Proc(IEnumSingleItemExceptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSingleItemExceptions*, UInt32)
    release : Proc(IEnumSingleItemExceptions*, UInt32)
    next : Proc(IEnumSingleItemExceptions*, UInt32, ISingleItemException*, UInt32*, HRESULT)
    skip : Proc(IEnumSingleItemExceptions*, UInt32, HRESULT)
    reset : Proc(IEnumSingleItemExceptions*, HRESULT)
    clone : Proc(IEnumSingleItemExceptions*, IEnumSingleItemExceptions*, HRESULT)
  end

  IEnumSingleItemExceptions_GUID = "e563381c-1b4d-4c66-9796-c86faccdcd40"
  IID_IEnumSingleItemExceptions = LibC::GUID.new(0xe563381c_u32, 0x1b4d_u16, 0x4c66_u16, StaticArray[0x97_u8, 0x96_u8, 0xc8_u8, 0x6f_u8, 0xac_u8, 0xcd_u8, 0xcd_u8, 0x40_u8])
  struct IEnumSingleItemExceptions
    lpVtbl : IEnumSingleItemExceptionsVTbl*
  end

  struct IChangeUnitExceptionVTbl
    query_interface : Proc(IChangeUnitException*, Guid*, Void**, HRESULT)
    add_ref : Proc(IChangeUnitException*, UInt32)
    release : Proc(IChangeUnitException*, UInt32)
    get_item_id : Proc(IChangeUnitException*, UInt8*, UInt32*, HRESULT)
    get_change_unit_id : Proc(IChangeUnitException*, UInt8*, UInt32*, HRESULT)
    get_clock_vector : Proc(IChangeUnitException*, Guid*, Void**, HRESULT)
  end

  IChangeUnitException_GUID = "0cd7ee7c-fec0-4021-99ee-f0e5348f2a5f"
  IID_IChangeUnitException = LibC::GUID.new(0xcd7ee7c_u32, 0xfec0_u16, 0x4021_u16, StaticArray[0x99_u8, 0xee_u8, 0xf0_u8, 0xe5_u8, 0x34_u8, 0x8f_u8, 0x2a_u8, 0x5f_u8])
  struct IChangeUnitException
    lpVtbl : IChangeUnitExceptionVTbl*
  end

  struct IEnumChangeUnitExceptionsVTbl
    query_interface : Proc(IEnumChangeUnitExceptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumChangeUnitExceptions*, UInt32)
    release : Proc(IEnumChangeUnitExceptions*, UInt32)
    next : Proc(IEnumChangeUnitExceptions*, UInt32, IChangeUnitException*, UInt32*, HRESULT)
    skip : Proc(IEnumChangeUnitExceptions*, UInt32, HRESULT)
    reset : Proc(IEnumChangeUnitExceptions*, HRESULT)
    clone : Proc(IEnumChangeUnitExceptions*, IEnumChangeUnitExceptions*, HRESULT)
  end

  IEnumChangeUnitExceptions_GUID = "3074e802-9319-4420-be21-1022e2e21da8"
  IID_IEnumChangeUnitExceptions = LibC::GUID.new(0x3074e802_u32, 0x9319_u16, 0x4420_u16, StaticArray[0xbe_u8, 0x21_u8, 0x10_u8, 0x22_u8, 0xe2_u8, 0xe2_u8, 0x1d_u8, 0xa8_u8])
  struct IEnumChangeUnitExceptions
    lpVtbl : IEnumChangeUnitExceptionsVTbl*
  end

  struct IReplicaKeyMapVTbl
    query_interface : Proc(IReplicaKeyMap*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReplicaKeyMap*, UInt32)
    release : Proc(IReplicaKeyMap*, UInt32)
    lookup_replica_key : Proc(IReplicaKeyMap*, UInt8*, UInt32*, HRESULT)
    lookup_replica_id : Proc(IReplicaKeyMap*, UInt32, UInt8*, UInt32*, HRESULT)
    serialize : Proc(IReplicaKeyMap*, UInt8*, UInt32*, HRESULT)
  end

  IReplicaKeyMap_GUID = "2209f4fc-fd10-4ff0-84a8-f0a1982e440e"
  IID_IReplicaKeyMap = LibC::GUID.new(0x2209f4fc_u32, 0xfd10_u16, 0x4ff0_u16, StaticArray[0x84_u8, 0xa8_u8, 0xf0_u8, 0xa1_u8, 0x98_u8, 0x2e_u8, 0x44_u8, 0xe_u8])
  struct IReplicaKeyMap
    lpVtbl : IReplicaKeyMapVTbl*
  end

  struct IConstructReplicaKeyMapVTbl
    query_interface : Proc(IConstructReplicaKeyMap*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConstructReplicaKeyMap*, UInt32)
    release : Proc(IConstructReplicaKeyMap*, UInt32)
    find_or_add_replica : Proc(IConstructReplicaKeyMap*, UInt8*, UInt32*, HRESULT)
  end

  IConstructReplicaKeyMap_GUID = "ded10970-ec85-4115-b52c-4405845642a5"
  IID_IConstructReplicaKeyMap = LibC::GUID.new(0xded10970_u32, 0xec85_u16, 0x4115_u16, StaticArray[0xb5_u8, 0x2c_u8, 0x44_u8, 0x5_u8, 0x84_u8, 0x56_u8, 0x42_u8, 0xa5_u8])
  struct IConstructReplicaKeyMap
    lpVtbl : IConstructReplicaKeyMapVTbl*
  end

  struct ISyncKnowledgeVTbl
    query_interface : Proc(ISyncKnowledge*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncKnowledge*, UInt32)
    release : Proc(ISyncKnowledge*, UInt32)
    get_owner_replica_id : Proc(ISyncKnowledge*, UInt8*, UInt32*, HRESULT)
    serialize : Proc(ISyncKnowledge*, LibC::BOOL, UInt8*, UInt32*, HRESULT)
    set_local_tick_count : Proc(ISyncKnowledge*, UInt64, HRESULT)
    contains_change : Proc(ISyncKnowledge*, UInt8*, UInt8*, SYNC_VERSION*, HRESULT)
    contains_change_unit : Proc(ISyncKnowledge*, UInt8*, UInt8*, UInt8*, SYNC_VERSION*, HRESULT)
    get_scope_vector : Proc(ISyncKnowledge*, Guid*, Void**, HRESULT)
    get_replica_key_map : Proc(ISyncKnowledge*, IReplicaKeyMap*, HRESULT)
    clone : Proc(ISyncKnowledge*, ISyncKnowledge*, HRESULT)
    convert_version : Proc(ISyncKnowledge*, ISyncKnowledge, UInt8*, SYNC_VERSION*, UInt8*, UInt32*, SYNC_VERSION*, HRESULT)
    map_remote_to_local : Proc(ISyncKnowledge*, ISyncKnowledge, ISyncKnowledge*, HRESULT)
    union : Proc(ISyncKnowledge*, ISyncKnowledge, HRESULT)
    project_onto_item : Proc(ISyncKnowledge*, UInt8*, ISyncKnowledge*, HRESULT)
    project_onto_change_unit : Proc(ISyncKnowledge*, UInt8*, UInt8*, ISyncKnowledge*, HRESULT)
    project_onto_range : Proc(ISyncKnowledge*, SYNC_RANGE*, ISyncKnowledge*, HRESULT)
    exclude_item : Proc(ISyncKnowledge*, UInt8*, HRESULT)
    exclude_change_unit : Proc(ISyncKnowledge*, UInt8*, UInt8*, HRESULT)
    contains_knowledge : Proc(ISyncKnowledge*, ISyncKnowledge, HRESULT)
    find_min_tick_count_for_replica : Proc(ISyncKnowledge*, UInt8*, UInt64*, HRESULT)
    get_range_exceptions : Proc(ISyncKnowledge*, Guid*, Void**, HRESULT)
    get_single_item_exceptions : Proc(ISyncKnowledge*, Guid*, Void**, HRESULT)
    get_change_unit_exceptions : Proc(ISyncKnowledge*, Guid*, Void**, HRESULT)
    find_clock_vector_for_item : Proc(ISyncKnowledge*, UInt8*, Guid*, Void**, HRESULT)
    find_clock_vector_for_change_unit : Proc(ISyncKnowledge*, UInt8*, UInt8*, Guid*, Void**, HRESULT)
    get_version : Proc(ISyncKnowledge*, UInt32*, HRESULT)
  end

  ISyncKnowledge_GUID = "615bbb53-c945-4203-bf4b-2cb65919a0aa"
  IID_ISyncKnowledge = LibC::GUID.new(0x615bbb53_u32, 0xc945_u16, 0x4203_u16, StaticArray[0xbf_u8, 0x4b_u8, 0x2c_u8, 0xb6_u8, 0x59_u8, 0x19_u8, 0xa0_u8, 0xaa_u8])
  struct ISyncKnowledge
    lpVtbl : ISyncKnowledgeVTbl*
  end

  struct IForgottenKnowledgeVTbl
    query_interface : Proc(IForgottenKnowledge*, Guid*, Void**, HRESULT)
    add_ref : Proc(IForgottenKnowledge*, UInt32)
    release : Proc(IForgottenKnowledge*, UInt32)
    get_owner_replica_id : Proc(IForgottenKnowledge*, UInt8*, UInt32*, HRESULT)
    serialize : Proc(IForgottenKnowledge*, LibC::BOOL, UInt8*, UInt32*, HRESULT)
    set_local_tick_count : Proc(IForgottenKnowledge*, UInt64, HRESULT)
    contains_change : Proc(IForgottenKnowledge*, UInt8*, UInt8*, SYNC_VERSION*, HRESULT)
    contains_change_unit : Proc(IForgottenKnowledge*, UInt8*, UInt8*, UInt8*, SYNC_VERSION*, HRESULT)
    get_scope_vector : Proc(IForgottenKnowledge*, Guid*, Void**, HRESULT)
    get_replica_key_map : Proc(IForgottenKnowledge*, IReplicaKeyMap*, HRESULT)
    clone : Proc(IForgottenKnowledge*, ISyncKnowledge*, HRESULT)
    convert_version : Proc(IForgottenKnowledge*, ISyncKnowledge, UInt8*, SYNC_VERSION*, UInt8*, UInt32*, SYNC_VERSION*, HRESULT)
    map_remote_to_local : Proc(IForgottenKnowledge*, ISyncKnowledge, ISyncKnowledge*, HRESULT)
    union : Proc(IForgottenKnowledge*, ISyncKnowledge, HRESULT)
    project_onto_item : Proc(IForgottenKnowledge*, UInt8*, ISyncKnowledge*, HRESULT)
    project_onto_change_unit : Proc(IForgottenKnowledge*, UInt8*, UInt8*, ISyncKnowledge*, HRESULT)
    project_onto_range : Proc(IForgottenKnowledge*, SYNC_RANGE*, ISyncKnowledge*, HRESULT)
    exclude_item : Proc(IForgottenKnowledge*, UInt8*, HRESULT)
    exclude_change_unit : Proc(IForgottenKnowledge*, UInt8*, UInt8*, HRESULT)
    contains_knowledge : Proc(IForgottenKnowledge*, ISyncKnowledge, HRESULT)
    find_min_tick_count_for_replica : Proc(IForgottenKnowledge*, UInt8*, UInt64*, HRESULT)
    get_range_exceptions : Proc(IForgottenKnowledge*, Guid*, Void**, HRESULT)
    get_single_item_exceptions : Proc(IForgottenKnowledge*, Guid*, Void**, HRESULT)
    get_change_unit_exceptions : Proc(IForgottenKnowledge*, Guid*, Void**, HRESULT)
    find_clock_vector_for_item : Proc(IForgottenKnowledge*, UInt8*, Guid*, Void**, HRESULT)
    find_clock_vector_for_change_unit : Proc(IForgottenKnowledge*, UInt8*, UInt8*, Guid*, Void**, HRESULT)
    get_version : Proc(IForgottenKnowledge*, UInt32*, HRESULT)
    forget_to_version : Proc(IForgottenKnowledge*, ISyncKnowledge, SYNC_VERSION*, HRESULT)
  end

  IForgottenKnowledge_GUID = "456e0f96-6036-452b-9f9d-bcc4b4a85db2"
  IID_IForgottenKnowledge = LibC::GUID.new(0x456e0f96_u32, 0x6036_u16, 0x452b_u16, StaticArray[0x9f_u8, 0x9d_u8, 0xbc_u8, 0xc4_u8, 0xb4_u8, 0xa8_u8, 0x5d_u8, 0xb2_u8])
  struct IForgottenKnowledge
    lpVtbl : IForgottenKnowledgeVTbl*
  end

  struct ISyncKnowledge2VTbl
    query_interface : Proc(ISyncKnowledge2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncKnowledge2*, UInt32)
    release : Proc(ISyncKnowledge2*, UInt32)
    get_owner_replica_id : Proc(ISyncKnowledge2*, UInt8*, UInt32*, HRESULT)
    serialize : Proc(ISyncKnowledge2*, LibC::BOOL, UInt8*, UInt32*, HRESULT)
    set_local_tick_count : Proc(ISyncKnowledge2*, UInt64, HRESULT)
    contains_change : Proc(ISyncKnowledge2*, UInt8*, UInt8*, SYNC_VERSION*, HRESULT)
    contains_change_unit : Proc(ISyncKnowledge2*, UInt8*, UInt8*, UInt8*, SYNC_VERSION*, HRESULT)
    get_scope_vector : Proc(ISyncKnowledge2*, Guid*, Void**, HRESULT)
    get_replica_key_map : Proc(ISyncKnowledge2*, IReplicaKeyMap*, HRESULT)
    clone : Proc(ISyncKnowledge2*, ISyncKnowledge*, HRESULT)
    convert_version : Proc(ISyncKnowledge2*, ISyncKnowledge, UInt8*, SYNC_VERSION*, UInt8*, UInt32*, SYNC_VERSION*, HRESULT)
    map_remote_to_local : Proc(ISyncKnowledge2*, ISyncKnowledge, ISyncKnowledge*, HRESULT)
    union : Proc(ISyncKnowledge2*, ISyncKnowledge, HRESULT)
    project_onto_item : Proc(ISyncKnowledge2*, UInt8*, ISyncKnowledge*, HRESULT)
    project_onto_change_unit : Proc(ISyncKnowledge2*, UInt8*, UInt8*, ISyncKnowledge*, HRESULT)
    project_onto_range : Proc(ISyncKnowledge2*, SYNC_RANGE*, ISyncKnowledge*, HRESULT)
    exclude_item : Proc(ISyncKnowledge2*, UInt8*, HRESULT)
    exclude_change_unit : Proc(ISyncKnowledge2*, UInt8*, UInt8*, HRESULT)
    contains_knowledge : Proc(ISyncKnowledge2*, ISyncKnowledge, HRESULT)
    find_min_tick_count_for_replica : Proc(ISyncKnowledge2*, UInt8*, UInt64*, HRESULT)
    get_range_exceptions : Proc(ISyncKnowledge2*, Guid*, Void**, HRESULT)
    get_single_item_exceptions : Proc(ISyncKnowledge2*, Guid*, Void**, HRESULT)
    get_change_unit_exceptions : Proc(ISyncKnowledge2*, Guid*, Void**, HRESULT)
    find_clock_vector_for_item : Proc(ISyncKnowledge2*, UInt8*, Guid*, Void**, HRESULT)
    find_clock_vector_for_change_unit : Proc(ISyncKnowledge2*, UInt8*, UInt8*, Guid*, Void**, HRESULT)
    get_version : Proc(ISyncKnowledge2*, UInt32*, HRESULT)
    get_id_parameters : Proc(ISyncKnowledge2*, ID_PARAMETERS*, HRESULT)
    project_onto_column_set : Proc(ISyncKnowledge2*, UInt8**, UInt32, ISyncKnowledge2*, HRESULT)
    serialize_with_options : Proc(ISyncKnowledge2*, SYNC_SERIALIZATION_VERSION, UInt32, UInt8*, UInt32*, HRESULT)
    get_lowest_uncontained_id : Proc(ISyncKnowledge2*, ISyncKnowledge2, UInt8*, UInt32*, HRESULT)
    get_inspector : Proc(ISyncKnowledge2*, Guid*, Void**, HRESULT)
    get_minimum_supported_version : Proc(ISyncKnowledge2*, SYNC_SERIALIZATION_VERSION*, HRESULT)
    get_statistics : Proc(ISyncKnowledge2*, SYNC_STATISTICS, UInt32*, HRESULT)
    contains_knowledge_for_item : Proc(ISyncKnowledge2*, ISyncKnowledge, UInt8*, HRESULT)
    contains_knowledge_for_change_unit : Proc(ISyncKnowledge2*, ISyncKnowledge, UInt8*, UInt8*, HRESULT)
    project_onto_knowledge_with_prerequisite : Proc(ISyncKnowledge2*, ISyncKnowledge, ISyncKnowledge, ISyncKnowledge*, HRESULT)
    complement : Proc(ISyncKnowledge2*, ISyncKnowledge, ISyncKnowledge*, HRESULT)
    intersects_with_knowledge : Proc(ISyncKnowledge2*, ISyncKnowledge, HRESULT)
    get_knowledge_cookie : Proc(ISyncKnowledge2*, IUnknown*, HRESULT)
    compare_to_knowledge_cookie : Proc(ISyncKnowledge2*, IUnknown, KNOWLEDGE_COOKIE_COMPARISON_RESULT*, HRESULT)
  end

  ISyncKnowledge2_GUID = "ed0addc0-3b4b-46a1-9a45-45661d2114c8"
  IID_ISyncKnowledge2 = LibC::GUID.new(0xed0addc0_u32, 0x3b4b_u16, 0x46a1_u16, StaticArray[0x9a_u8, 0x45_u8, 0x45_u8, 0x66_u8, 0x1d_u8, 0x21_u8, 0x14_u8, 0xc8_u8])
  struct ISyncKnowledge2
    lpVtbl : ISyncKnowledge2VTbl*
  end

  struct IRecoverableErrorDataVTbl
    query_interface : Proc(IRecoverableErrorData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRecoverableErrorData*, UInt32)
    release : Proc(IRecoverableErrorData*, UInt32)
    initialize : Proc(IRecoverableErrorData*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_item_display_name : Proc(IRecoverableErrorData*, LibC::LPWSTR, UInt32*, HRESULT)
    get_error_description : Proc(IRecoverableErrorData*, LibC::LPWSTR, UInt32*, HRESULT)
  end

  IRecoverableErrorData_GUID = "b37c4a0a-4b7d-4c2d-9711-3b00d119b1c8"
  IID_IRecoverableErrorData = LibC::GUID.new(0xb37c4a0a_u32, 0x4b7d_u16, 0x4c2d_u16, StaticArray[0x97_u8, 0x11_u8, 0x3b_u8, 0x0_u8, 0xd1_u8, 0x19_u8, 0xb1_u8, 0xc8_u8])
  struct IRecoverableErrorData
    lpVtbl : IRecoverableErrorDataVTbl*
  end

  struct IRecoverableErrorVTbl
    query_interface : Proc(IRecoverableError*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRecoverableError*, UInt32)
    release : Proc(IRecoverableError*, UInt32)
    get_stage : Proc(IRecoverableError*, SYNC_PROGRESS_STAGE*, HRESULT)
    get_provider : Proc(IRecoverableError*, SYNC_PROVIDER_ROLE*, HRESULT)
    get_change_with_recoverable_error : Proc(IRecoverableError*, ISyncChange*, HRESULT)
    get_recoverable_error_data_for_change : Proc(IRecoverableError*, HRESULT*, IRecoverableErrorData*, HRESULT)
    get_recoverable_error_data_for_change_unit : Proc(IRecoverableError*, ISyncChangeUnit, HRESULT*, IRecoverableErrorData*, HRESULT)
  end

  IRecoverableError_GUID = "0f5625e8-0a7b-45ee-9637-1ce13645909e"
  IID_IRecoverableError = LibC::GUID.new(0xf5625e8_u32, 0xa7b_u16, 0x45ee_u16, StaticArray[0x96_u8, 0x37_u8, 0x1c_u8, 0xe1_u8, 0x36_u8, 0x45_u8, 0x90_u8, 0x9e_u8])
  struct IRecoverableError
    lpVtbl : IRecoverableErrorVTbl*
  end

  struct IChangeConflictVTbl
    query_interface : Proc(IChangeConflict*, Guid*, Void**, HRESULT)
    add_ref : Proc(IChangeConflict*, UInt32)
    release : Proc(IChangeConflict*, UInt32)
    get_destination_provider_conflicting_change : Proc(IChangeConflict*, ISyncChange*, HRESULT)
    get_source_provider_conflicting_change : Proc(IChangeConflict*, ISyncChange*, HRESULT)
    get_destination_provider_conflicting_data : Proc(IChangeConflict*, IUnknown*, HRESULT)
    get_source_provider_conflicting_data : Proc(IChangeConflict*, IUnknown*, HRESULT)
    get_resolve_action_for_change : Proc(IChangeConflict*, SYNC_RESOLVE_ACTION*, HRESULT)
    set_resolve_action_for_change : Proc(IChangeConflict*, SYNC_RESOLVE_ACTION, HRESULT)
    get_resolve_action_for_change_unit : Proc(IChangeConflict*, ISyncChangeUnit, SYNC_RESOLVE_ACTION*, HRESULT)
    set_resolve_action_for_change_unit : Proc(IChangeConflict*, ISyncChangeUnit, SYNC_RESOLVE_ACTION, HRESULT)
  end

  IChangeConflict_GUID = "014ebf97-9f20-4f7a-bdd4-25979c77c002"
  IID_IChangeConflict = LibC::GUID.new(0x14ebf97_u32, 0x9f20_u16, 0x4f7a_u16, StaticArray[0xbd_u8, 0xd4_u8, 0x25_u8, 0x97_u8, 0x9c_u8, 0x77_u8, 0xc0_u8, 0x2_u8])
  struct IChangeConflict
    lpVtbl : IChangeConflictVTbl*
  end

  struct IConstraintConflictVTbl
    query_interface : Proc(IConstraintConflict*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConstraintConflict*, UInt32)
    release : Proc(IConstraintConflict*, UInt32)
    get_destination_provider_conflicting_change : Proc(IConstraintConflict*, ISyncChange*, HRESULT)
    get_source_provider_conflicting_change : Proc(IConstraintConflict*, ISyncChange*, HRESULT)
    get_destination_provider_original_change : Proc(IConstraintConflict*, ISyncChange*, HRESULT)
    get_destination_provider_conflicting_data : Proc(IConstraintConflict*, IUnknown*, HRESULT)
    get_source_provider_conflicting_data : Proc(IConstraintConflict*, IUnknown*, HRESULT)
    get_destination_provider_original_data : Proc(IConstraintConflict*, IUnknown*, HRESULT)
    get_constraint_resolve_action_for_change : Proc(IConstraintConflict*, SYNC_CONSTRAINT_RESOLVE_ACTION*, HRESULT)
    set_constraint_resolve_action_for_change : Proc(IConstraintConflict*, SYNC_CONSTRAINT_RESOLVE_ACTION, HRESULT)
    get_constraint_resolve_action_for_change_unit : Proc(IConstraintConflict*, ISyncChangeUnit, SYNC_CONSTRAINT_RESOLVE_ACTION*, HRESULT)
    set_constraint_resolve_action_for_change_unit : Proc(IConstraintConflict*, ISyncChangeUnit, SYNC_CONSTRAINT_RESOLVE_ACTION, HRESULT)
    get_constraint_conflict_reason : Proc(IConstraintConflict*, CONSTRAINT_CONFLICT_REASON*, HRESULT)
    is_temporary : Proc(IConstraintConflict*, HRESULT)
  end

  IConstraintConflict_GUID = "00d2302e-1cf8-4835-b85f-b7ca4f799e0a"
  IID_IConstraintConflict = LibC::GUID.new(0xd2302e_u32, 0x1cf8_u16, 0x4835_u16, StaticArray[0xb8_u8, 0x5f_u8, 0xb7_u8, 0xca_u8, 0x4f_u8, 0x79_u8, 0x9e_u8, 0xa_u8])
  struct IConstraintConflict
    lpVtbl : IConstraintConflictVTbl*
  end

  struct ISyncCallbackVTbl
    query_interface : Proc(ISyncCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncCallback*, UInt32)
    release : Proc(ISyncCallback*, UInt32)
    on_progress : Proc(ISyncCallback*, SYNC_PROVIDER_ROLE, SYNC_PROGRESS_STAGE, UInt32, UInt32, HRESULT)
    on_change : Proc(ISyncCallback*, ISyncChange, HRESULT)
    on_conflict : Proc(ISyncCallback*, IChangeConflict, HRESULT)
    on_full_enumeration_needed : Proc(ISyncCallback*, SYNC_FULL_ENUMERATION_ACTION*, HRESULT)
    on_recoverable_error : Proc(ISyncCallback*, IRecoverableError, HRESULT)
  end

  ISyncCallback_GUID = "0599797f-5ed9-485c-ae36-0c5d1bf2e7a5"
  IID_ISyncCallback = LibC::GUID.new(0x599797f_u32, 0x5ed9_u16, 0x485c_u16, StaticArray[0xae_u8, 0x36_u8, 0xc_u8, 0x5d_u8, 0x1b_u8, 0xf2_u8, 0xe7_u8, 0xa5_u8])
  struct ISyncCallback
    lpVtbl : ISyncCallbackVTbl*
  end

  struct ISyncCallback2VTbl
    query_interface : Proc(ISyncCallback2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncCallback2*, UInt32)
    release : Proc(ISyncCallback2*, UInt32)
    on_progress : Proc(ISyncCallback2*, SYNC_PROVIDER_ROLE, SYNC_PROGRESS_STAGE, UInt32, UInt32, HRESULT)
    on_change : Proc(ISyncCallback2*, ISyncChange, HRESULT)
    on_conflict : Proc(ISyncCallback2*, IChangeConflict, HRESULT)
    on_full_enumeration_needed : Proc(ISyncCallback2*, SYNC_FULL_ENUMERATION_ACTION*, HRESULT)
    on_recoverable_error : Proc(ISyncCallback2*, IRecoverableError, HRESULT)
    on_change_applied : Proc(ISyncCallback2*, UInt32, UInt32, HRESULT)
    on_change_failed : Proc(ISyncCallback2*, UInt32, UInt32, HRESULT)
  end

  ISyncCallback2_GUID = "47ce84af-7442-4ead-8630-12015e030ad7"
  IID_ISyncCallback2 = LibC::GUID.new(0x47ce84af_u32, 0x7442_u16, 0x4ead_u16, StaticArray[0x86_u8, 0x30_u8, 0x12_u8, 0x1_u8, 0x5e_u8, 0x3_u8, 0xa_u8, 0xd7_u8])
  struct ISyncCallback2
    lpVtbl : ISyncCallback2VTbl*
  end

  struct ISyncConstraintCallbackVTbl
    query_interface : Proc(ISyncConstraintCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncConstraintCallback*, UInt32)
    release : Proc(ISyncConstraintCallback*, UInt32)
    on_constraint_conflict : Proc(ISyncConstraintCallback*, IConstraintConflict, HRESULT)
  end

  ISyncConstraintCallback_GUID = "8af3843e-75b3-438c-bb51-6f020d70d3cb"
  IID_ISyncConstraintCallback = LibC::GUID.new(0x8af3843e_u32, 0x75b3_u16, 0x438c_u16, StaticArray[0xbb_u8, 0x51_u8, 0x6f_u8, 0x2_u8, 0xd_u8, 0x70_u8, 0xd3_u8, 0xcb_u8])
  struct ISyncConstraintCallback
    lpVtbl : ISyncConstraintCallbackVTbl*
  end

  struct ISyncProviderVTbl
    query_interface : Proc(ISyncProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncProvider*, UInt32)
    release : Proc(ISyncProvider*, UInt32)
    get_id_parameters : Proc(ISyncProvider*, ID_PARAMETERS*, HRESULT)
  end

  ISyncProvider_GUID = "8f657056-2bce-4a17-8c68-c7bb7898b56f"
  IID_ISyncProvider = LibC::GUID.new(0x8f657056_u32, 0x2bce_u16, 0x4a17_u16, StaticArray[0x8c_u8, 0x68_u8, 0xc7_u8, 0xbb_u8, 0x78_u8, 0x98_u8, 0xb5_u8, 0x6f_u8])
  struct ISyncProvider
    lpVtbl : ISyncProviderVTbl*
  end

  struct ISyncSessionStateVTbl
    query_interface : Proc(ISyncSessionState*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncSessionState*, UInt32)
    release : Proc(ISyncSessionState*, UInt32)
    is_canceled : Proc(ISyncSessionState*, LibC::BOOL*, HRESULT)
    get_info_for_change_application : Proc(ISyncSessionState*, UInt8*, UInt32*, HRESULT)
    load_info_from_change_application : Proc(ISyncSessionState*, UInt8*, UInt32, HRESULT)
    get_forgotten_knowledge_recovery_range_start : Proc(ISyncSessionState*, UInt8*, UInt32*, HRESULT)
    get_forgotten_knowledge_recovery_range_end : Proc(ISyncSessionState*, UInt8*, UInt32*, HRESULT)
    set_forgotten_knowledge_recovery_range : Proc(ISyncSessionState*, SYNC_RANGE*, HRESULT)
    on_progress : Proc(ISyncSessionState*, SYNC_PROVIDER_ROLE, SYNC_PROGRESS_STAGE, UInt32, UInt32, HRESULT)
  end

  ISyncSessionState_GUID = "b8a940fe-9f01-483b-9434-c37d361225d9"
  IID_ISyncSessionState = LibC::GUID.new(0xb8a940fe_u32, 0x9f01_u16, 0x483b_u16, StaticArray[0x94_u8, 0x34_u8, 0xc3_u8, 0x7d_u8, 0x36_u8, 0x12_u8, 0x25_u8, 0xd9_u8])
  struct ISyncSessionState
    lpVtbl : ISyncSessionStateVTbl*
  end

  struct ISyncSessionExtendedErrorInfoVTbl
    query_interface : Proc(ISyncSessionExtendedErrorInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncSessionExtendedErrorInfo*, UInt32)
    release : Proc(ISyncSessionExtendedErrorInfo*, UInt32)
    get_sync_provider_with_error : Proc(ISyncSessionExtendedErrorInfo*, ISyncProvider*, HRESULT)
  end

  ISyncSessionExtendedErrorInfo_GUID = "326c6810-790a-409b-b741-6999388761eb"
  IID_ISyncSessionExtendedErrorInfo = LibC::GUID.new(0x326c6810_u32, 0x790a_u16, 0x409b_u16, StaticArray[0xb7_u8, 0x41_u8, 0x69_u8, 0x99_u8, 0x38_u8, 0x87_u8, 0x61_u8, 0xeb_u8])
  struct ISyncSessionExtendedErrorInfo
    lpVtbl : ISyncSessionExtendedErrorInfoVTbl*
  end

  struct ISyncSessionState2VTbl
    query_interface : Proc(ISyncSessionState2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncSessionState2*, UInt32)
    release : Proc(ISyncSessionState2*, UInt32)
    is_canceled : Proc(ISyncSessionState2*, LibC::BOOL*, HRESULT)
    get_info_for_change_application : Proc(ISyncSessionState2*, UInt8*, UInt32*, HRESULT)
    load_info_from_change_application : Proc(ISyncSessionState2*, UInt8*, UInt32, HRESULT)
    get_forgotten_knowledge_recovery_range_start : Proc(ISyncSessionState2*, UInt8*, UInt32*, HRESULT)
    get_forgotten_knowledge_recovery_range_end : Proc(ISyncSessionState2*, UInt8*, UInt32*, HRESULT)
    set_forgotten_knowledge_recovery_range : Proc(ISyncSessionState2*, SYNC_RANGE*, HRESULT)
    on_progress : Proc(ISyncSessionState2*, SYNC_PROVIDER_ROLE, SYNC_PROGRESS_STAGE, UInt32, UInt32, HRESULT)
    set_provider_with_error : Proc(ISyncSessionState2*, LibC::BOOL, HRESULT)
    get_session_error_status : Proc(ISyncSessionState2*, HRESULT*, HRESULT)
  end

  ISyncSessionState2_GUID = "9e37cfa3-9e38-4c61-9ca3-ffe810b45ca2"
  IID_ISyncSessionState2 = LibC::GUID.new(0x9e37cfa3_u32, 0x9e38_u16, 0x4c61_u16, StaticArray[0x9c_u8, 0xa3_u8, 0xff_u8, 0xe8_u8, 0x10_u8, 0xb4_u8, 0x5c_u8, 0xa2_u8])
  struct ISyncSessionState2
    lpVtbl : ISyncSessionState2VTbl*
  end

  struct ISyncFilterInfoVTbl
    query_interface : Proc(ISyncFilterInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncFilterInfo*, UInt32)
    release : Proc(ISyncFilterInfo*, UInt32)
    serialize : Proc(ISyncFilterInfo*, UInt8*, UInt32*, HRESULT)
  end

  ISyncFilterInfo_GUID = "794eaaf8-3f2e-47e6-9728-17e6fcf94cb7"
  IID_ISyncFilterInfo = LibC::GUID.new(0x794eaaf8_u32, 0x3f2e_u16, 0x47e6_u16, StaticArray[0x97_u8, 0x28_u8, 0x17_u8, 0xe6_u8, 0xfc_u8, 0xf9_u8, 0x4c_u8, 0xb7_u8])
  struct ISyncFilterInfo
    lpVtbl : ISyncFilterInfoVTbl*
  end

  struct ISyncFilterInfo2VTbl
    query_interface : Proc(ISyncFilterInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncFilterInfo2*, UInt32)
    release : Proc(ISyncFilterInfo2*, UInt32)
    serialize : Proc(ISyncFilterInfo2*, UInt8*, UInt32*, HRESULT)
    get_flags : Proc(ISyncFilterInfo2*, UInt32*, HRESULT)
  end

  ISyncFilterInfo2_GUID = "19b394ba-e3d0-468c-934d-321968b2ab34"
  IID_ISyncFilterInfo2 = LibC::GUID.new(0x19b394ba_u32, 0xe3d0_u16, 0x468c_u16, StaticArray[0x93_u8, 0x4d_u8, 0x32_u8, 0x19_u8, 0x68_u8, 0xb2_u8, 0xab_u8, 0x34_u8])
  struct ISyncFilterInfo2
    lpVtbl : ISyncFilterInfo2VTbl*
  end

  struct IChangeUnitListFilterInfoVTbl
    query_interface : Proc(IChangeUnitListFilterInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IChangeUnitListFilterInfo*, UInt32)
    release : Proc(IChangeUnitListFilterInfo*, UInt32)
    serialize : Proc(IChangeUnitListFilterInfo*, UInt8*, UInt32*, HRESULT)
    initialize : Proc(IChangeUnitListFilterInfo*, UInt8**, UInt32, HRESULT)
    get_change_unit_id_count : Proc(IChangeUnitListFilterInfo*, UInt32*, HRESULT)
    get_change_unit_id : Proc(IChangeUnitListFilterInfo*, UInt32, UInt8*, UInt32*, HRESULT)
  end

  IChangeUnitListFilterInfo_GUID = "f2837671-0bdf-43fa-b502-232375fb50c2"
  IID_IChangeUnitListFilterInfo = LibC::GUID.new(0xf2837671_u32, 0xbdf_u16, 0x43fa_u16, StaticArray[0xb5_u8, 0x2_u8, 0x23_u8, 0x23_u8, 0x75_u8, 0xfb_u8, 0x50_u8, 0xc2_u8])
  struct IChangeUnitListFilterInfo
    lpVtbl : IChangeUnitListFilterInfoVTbl*
  end

  struct ISyncFilterVTbl
    query_interface : Proc(ISyncFilter*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncFilter*, UInt32)
    release : Proc(ISyncFilter*, UInt32)
    is_identical : Proc(ISyncFilter*, ISyncFilter, HRESULT)
    serialize : Proc(ISyncFilter*, UInt8*, UInt32*, HRESULT)
  end

  ISyncFilter_GUID = "087a3f15-0fcb-44c1-9639-53c14e2b5506"
  IID_ISyncFilter = LibC::GUID.new(0x87a3f15_u32, 0xfcb_u16, 0x44c1_u16, StaticArray[0x96_u8, 0x39_u8, 0x53_u8, 0xc1_u8, 0x4e_u8, 0x2b_u8, 0x55_u8, 0x6_u8])
  struct ISyncFilter
    lpVtbl : ISyncFilterVTbl*
  end

  struct ISyncFilterDeserializerVTbl
    query_interface : Proc(ISyncFilterDeserializer*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncFilterDeserializer*, UInt32)
    release : Proc(ISyncFilterDeserializer*, UInt32)
    deserialize_sync_filter : Proc(ISyncFilterDeserializer*, UInt8*, UInt32, ISyncFilter*, HRESULT)
  end

  ISyncFilterDeserializer_GUID = "b45b7a72-e5c7-46be-9c82-77b8b15dab8a"
  IID_ISyncFilterDeserializer = LibC::GUID.new(0xb45b7a72_u32, 0xe5c7_u16, 0x46be_u16, StaticArray[0x9c_u8, 0x82_u8, 0x77_u8, 0xb8_u8, 0xb1_u8, 0x5d_u8, 0xab_u8, 0x8a_u8])
  struct ISyncFilterDeserializer
    lpVtbl : ISyncFilterDeserializerVTbl*
  end

  struct ICustomFilterInfoVTbl
    query_interface : Proc(ICustomFilterInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICustomFilterInfo*, UInt32)
    release : Proc(ICustomFilterInfo*, UInt32)
    serialize : Proc(ICustomFilterInfo*, UInt8*, UInt32*, HRESULT)
    get_sync_filter : Proc(ICustomFilterInfo*, ISyncFilter*, HRESULT)
  end

  ICustomFilterInfo_GUID = "1d335dff-6f88-4e4d-91a8-a3f351cfd473"
  IID_ICustomFilterInfo = LibC::GUID.new(0x1d335dff_u32, 0x6f88_u16, 0x4e4d_u16, StaticArray[0x91_u8, 0xa8_u8, 0xa3_u8, 0xf3_u8, 0x51_u8, 0xcf_u8, 0xd4_u8, 0x73_u8])
  struct ICustomFilterInfo
    lpVtbl : ICustomFilterInfoVTbl*
  end

  struct ICombinedFilterInfoVTbl
    query_interface : Proc(ICombinedFilterInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICombinedFilterInfo*, UInt32)
    release : Proc(ICombinedFilterInfo*, UInt32)
    serialize : Proc(ICombinedFilterInfo*, UInt8*, UInt32*, HRESULT)
    get_filter_count : Proc(ICombinedFilterInfo*, UInt32*, HRESULT)
    get_filter_info : Proc(ICombinedFilterInfo*, UInt32, ISyncFilterInfo*, HRESULT)
    get_filter_combination_type : Proc(ICombinedFilterInfo*, FILTER_COMBINATION_TYPE*, HRESULT)
  end

  ICombinedFilterInfo_GUID = "11f9de71-2818-4779-b2ac-42d450565f45"
  IID_ICombinedFilterInfo = LibC::GUID.new(0x11f9de71_u32, 0x2818_u16, 0x4779_u16, StaticArray[0xb2_u8, 0xac_u8, 0x42_u8, 0xd4_u8, 0x50_u8, 0x56_u8, 0x5f_u8, 0x45_u8])
  struct ICombinedFilterInfo
    lpVtbl : ICombinedFilterInfoVTbl*
  end

  struct IEnumSyncChangesVTbl
    query_interface : Proc(IEnumSyncChanges*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSyncChanges*, UInt32)
    release : Proc(IEnumSyncChanges*, UInt32)
    next : Proc(IEnumSyncChanges*, UInt32, ISyncChange*, UInt32*, HRESULT)
    skip : Proc(IEnumSyncChanges*, UInt32, HRESULT)
    reset : Proc(IEnumSyncChanges*, HRESULT)
    clone : Proc(IEnumSyncChanges*, IEnumSyncChanges*, HRESULT)
  end

  IEnumSyncChanges_GUID = "5f86be4a-5e78-4e32-ac1c-c24fd223ef85"
  IID_IEnumSyncChanges = LibC::GUID.new(0x5f86be4a_u32, 0x5e78_u16, 0x4e32_u16, StaticArray[0xac_u8, 0x1c_u8, 0xc2_u8, 0x4f_u8, 0xd2_u8, 0x23_u8, 0xef_u8, 0x85_u8])
  struct IEnumSyncChanges
    lpVtbl : IEnumSyncChangesVTbl*
  end

  struct ISyncChangeBuilderVTbl
    query_interface : Proc(ISyncChangeBuilder*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeBuilder*, UInt32)
    release : Proc(ISyncChangeBuilder*, UInt32)
    add_change_unit_metadata : Proc(ISyncChangeBuilder*, UInt8*, SYNC_VERSION*, HRESULT)
  end

  ISyncChangeBuilder_GUID = "56f14771-8677-484f-a170-e386e418a676"
  IID_ISyncChangeBuilder = LibC::GUID.new(0x56f14771_u32, 0x8677_u16, 0x484f_u16, StaticArray[0xa1_u8, 0x70_u8, 0xe3_u8, 0x86_u8, 0xe4_u8, 0x18_u8, 0xa6_u8, 0x76_u8])
  struct ISyncChangeBuilder
    lpVtbl : ISyncChangeBuilderVTbl*
  end

  struct IFilterTrackingSyncChangeBuilderVTbl
    query_interface : Proc(IFilterTrackingSyncChangeBuilder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFilterTrackingSyncChangeBuilder*, UInt32)
    release : Proc(IFilterTrackingSyncChangeBuilder*, UInt32)
    add_filter_change : Proc(IFilterTrackingSyncChangeBuilder*, UInt32, SYNC_FILTER_CHANGE*, HRESULT)
    set_all_change_units_present_flag : Proc(IFilterTrackingSyncChangeBuilder*, HRESULT)
  end

  IFilterTrackingSyncChangeBuilder_GUID = "295024a0-70da-4c58-883c-ce2afb308d0b"
  IID_IFilterTrackingSyncChangeBuilder = LibC::GUID.new(0x295024a0_u32, 0x70da_u16, 0x4c58_u16, StaticArray[0x88_u8, 0x3c_u8, 0xce_u8, 0x2a_u8, 0xfb_u8, 0x30_u8, 0x8d_u8, 0xb_u8])
  struct IFilterTrackingSyncChangeBuilder
    lpVtbl : IFilterTrackingSyncChangeBuilderVTbl*
  end

  struct ISyncChangeBatchBaseVTbl
    query_interface : Proc(ISyncChangeBatchBase*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeBatchBase*, UInt32)
    release : Proc(ISyncChangeBatchBase*, UInt32)
    get_change_enumerator : Proc(ISyncChangeBatchBase*, IEnumSyncChanges*, HRESULT)
    get_is_last_batch : Proc(ISyncChangeBatchBase*, LibC::BOOL*, HRESULT)
    get_work_estimate_for_batch : Proc(ISyncChangeBatchBase*, UInt32*, HRESULT)
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatchBase*, UInt32*, HRESULT)
    begin_ordered_group : Proc(ISyncChangeBatchBase*, UInt8*, HRESULT)
    end_ordered_group : Proc(ISyncChangeBatchBase*, UInt8*, ISyncKnowledge, HRESULT)
    add_item_metadata_to_group : Proc(ISyncChangeBatchBase*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)
    get_learned_knowledge : Proc(ISyncChangeBatchBase*, ISyncKnowledge*, HRESULT)
    get_prerequisite_knowledge : Proc(ISyncChangeBatchBase*, ISyncKnowledge*, HRESULT)
    get_source_forgotten_knowledge : Proc(ISyncChangeBatchBase*, IForgottenKnowledge*, HRESULT)
    set_last_batch : Proc(ISyncChangeBatchBase*, HRESULT)
    set_work_estimate_for_batch : Proc(ISyncChangeBatchBase*, UInt32, HRESULT)
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatchBase*, UInt32, HRESULT)
    serialize : Proc(ISyncChangeBatchBase*, UInt8*, UInt32*, HRESULT)
  end

  ISyncChangeBatchBase_GUID = "52f6e694-6a71-4494-a184-a8311bf5d227"
  IID_ISyncChangeBatchBase = LibC::GUID.new(0x52f6e694_u32, 0x6a71_u16, 0x4494_u16, StaticArray[0xa1_u8, 0x84_u8, 0xa8_u8, 0x31_u8, 0x1b_u8, 0xf5_u8, 0xd2_u8, 0x27_u8])
  struct ISyncChangeBatchBase
    lpVtbl : ISyncChangeBatchBaseVTbl*
  end

  struct ISyncChangeBatchVTbl
    query_interface : Proc(ISyncChangeBatch*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeBatch*, UInt32)
    release : Proc(ISyncChangeBatch*, UInt32)
    get_change_enumerator : Proc(ISyncChangeBatch*, IEnumSyncChanges*, HRESULT)
    get_is_last_batch : Proc(ISyncChangeBatch*, LibC::BOOL*, HRESULT)
    get_work_estimate_for_batch : Proc(ISyncChangeBatch*, UInt32*, HRESULT)
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatch*, UInt32*, HRESULT)
    begin_ordered_group : Proc(ISyncChangeBatch*, UInt8*, HRESULT)
    end_ordered_group : Proc(ISyncChangeBatch*, UInt8*, ISyncKnowledge, HRESULT)
    add_item_metadata_to_group : Proc(ISyncChangeBatch*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)
    get_learned_knowledge : Proc(ISyncChangeBatch*, ISyncKnowledge*, HRESULT)
    get_prerequisite_knowledge : Proc(ISyncChangeBatch*, ISyncKnowledge*, HRESULT)
    get_source_forgotten_knowledge : Proc(ISyncChangeBatch*, IForgottenKnowledge*, HRESULT)
    set_last_batch : Proc(ISyncChangeBatch*, HRESULT)
    set_work_estimate_for_batch : Proc(ISyncChangeBatch*, UInt32, HRESULT)
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatch*, UInt32, HRESULT)
    serialize : Proc(ISyncChangeBatch*, UInt8*, UInt32*, HRESULT)
    begin_unordered_group : Proc(ISyncChangeBatch*, HRESULT)
    end_unordered_group : Proc(ISyncChangeBatch*, ISyncKnowledge, LibC::BOOL, HRESULT)
    add_logged_conflict : Proc(ISyncChangeBatch*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncKnowledge, ISyncChangeBuilder*, HRESULT)
  end

  ISyncChangeBatch_GUID = "70c64dee-380f-4c2e-8f70-31c55bd5f9b3"
  IID_ISyncChangeBatch = LibC::GUID.new(0x70c64dee_u32, 0x380f_u16, 0x4c2e_u16, StaticArray[0x8f_u8, 0x70_u8, 0x31_u8, 0xc5_u8, 0x5b_u8, 0xd5_u8, 0xf9_u8, 0xb3_u8])
  struct ISyncChangeBatch
    lpVtbl : ISyncChangeBatchVTbl*
  end

  struct ISyncFullEnumerationChangeBatchVTbl
    query_interface : Proc(ISyncFullEnumerationChangeBatch*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncFullEnumerationChangeBatch*, UInt32)
    release : Proc(ISyncFullEnumerationChangeBatch*, UInt32)
    get_change_enumerator : Proc(ISyncFullEnumerationChangeBatch*, IEnumSyncChanges*, HRESULT)
    get_is_last_batch : Proc(ISyncFullEnumerationChangeBatch*, LibC::BOOL*, HRESULT)
    get_work_estimate_for_batch : Proc(ISyncFullEnumerationChangeBatch*, UInt32*, HRESULT)
    get_remaining_work_estimate_for_session : Proc(ISyncFullEnumerationChangeBatch*, UInt32*, HRESULT)
    begin_ordered_group : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, HRESULT)
    end_ordered_group : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, ISyncKnowledge, HRESULT)
    add_item_metadata_to_group : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)
    get_learned_knowledge : Proc(ISyncFullEnumerationChangeBatch*, ISyncKnowledge*, HRESULT)
    get_prerequisite_knowledge : Proc(ISyncFullEnumerationChangeBatch*, ISyncKnowledge*, HRESULT)
    get_source_forgotten_knowledge : Proc(ISyncFullEnumerationChangeBatch*, IForgottenKnowledge*, HRESULT)
    set_last_batch : Proc(ISyncFullEnumerationChangeBatch*, HRESULT)
    set_work_estimate_for_batch : Proc(ISyncFullEnumerationChangeBatch*, UInt32, HRESULT)
    set_remaining_work_estimate_for_session : Proc(ISyncFullEnumerationChangeBatch*, UInt32, HRESULT)
    serialize : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, UInt32*, HRESULT)
    get_learned_knowledge_after_recovery_complete : Proc(ISyncFullEnumerationChangeBatch*, ISyncKnowledge*, HRESULT)
    get_closed_lower_bound_item_id : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, UInt32*, HRESULT)
    get_closed_upper_bound_item_id : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, UInt32*, HRESULT)
  end

  ISyncFullEnumerationChangeBatch_GUID = "ef64197d-4f44-4ea2-b355-4524713e3bed"
  IID_ISyncFullEnumerationChangeBatch = LibC::GUID.new(0xef64197d_u32, 0x4f44_u16, 0x4ea2_u16, StaticArray[0xb3_u8, 0x55_u8, 0x45_u8, 0x24_u8, 0x71_u8, 0x3e_u8, 0x3b_u8, 0xed_u8])
  struct ISyncFullEnumerationChangeBatch
    lpVtbl : ISyncFullEnumerationChangeBatchVTbl*
  end

  struct ISyncChangeBatchWithPrerequisiteVTbl
    query_interface : Proc(ISyncChangeBatchWithPrerequisite*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeBatchWithPrerequisite*, UInt32)
    release : Proc(ISyncChangeBatchWithPrerequisite*, UInt32)
    get_change_enumerator : Proc(ISyncChangeBatchWithPrerequisite*, IEnumSyncChanges*, HRESULT)
    get_is_last_batch : Proc(ISyncChangeBatchWithPrerequisite*, LibC::BOOL*, HRESULT)
    get_work_estimate_for_batch : Proc(ISyncChangeBatchWithPrerequisite*, UInt32*, HRESULT)
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatchWithPrerequisite*, UInt32*, HRESULT)
    begin_ordered_group : Proc(ISyncChangeBatchWithPrerequisite*, UInt8*, HRESULT)
    end_ordered_group : Proc(ISyncChangeBatchWithPrerequisite*, UInt8*, ISyncKnowledge, HRESULT)
    add_item_metadata_to_group : Proc(ISyncChangeBatchWithPrerequisite*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)
    get_learned_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, ISyncKnowledge*, HRESULT)
    get_prerequisite_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, ISyncKnowledge*, HRESULT)
    get_source_forgotten_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, IForgottenKnowledge*, HRESULT)
    set_last_batch : Proc(ISyncChangeBatchWithPrerequisite*, HRESULT)
    set_work_estimate_for_batch : Proc(ISyncChangeBatchWithPrerequisite*, UInt32, HRESULT)
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatchWithPrerequisite*, UInt32, HRESULT)
    serialize : Proc(ISyncChangeBatchWithPrerequisite*, UInt8*, UInt32*, HRESULT)
    set_prerequisite_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, ISyncKnowledge, HRESULT)
    get_learned_knowledge_with_prerequisite : Proc(ISyncChangeBatchWithPrerequisite*, ISyncKnowledge, ISyncKnowledge*, HRESULT)
    get_learned_forgotten_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, IForgottenKnowledge*, HRESULT)
  end

  ISyncChangeBatchWithPrerequisite_GUID = "097f13be-5b92-4048-b3f2-7b42a2515e07"
  IID_ISyncChangeBatchWithPrerequisite = LibC::GUID.new(0x97f13be_u32, 0x5b92_u16, 0x4048_u16, StaticArray[0xb3_u8, 0xf2_u8, 0x7b_u8, 0x42_u8, 0xa2_u8, 0x51_u8, 0x5e_u8, 0x7_u8])
  struct ISyncChangeBatchWithPrerequisite
    lpVtbl : ISyncChangeBatchWithPrerequisiteVTbl*
  end

  struct ISyncChangeBatchBase2VTbl
    query_interface : Proc(ISyncChangeBatchBase2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeBatchBase2*, UInt32)
    release : Proc(ISyncChangeBatchBase2*, UInt32)
    get_change_enumerator : Proc(ISyncChangeBatchBase2*, IEnumSyncChanges*, HRESULT)
    get_is_last_batch : Proc(ISyncChangeBatchBase2*, LibC::BOOL*, HRESULT)
    get_work_estimate_for_batch : Proc(ISyncChangeBatchBase2*, UInt32*, HRESULT)
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatchBase2*, UInt32*, HRESULT)
    begin_ordered_group : Proc(ISyncChangeBatchBase2*, UInt8*, HRESULT)
    end_ordered_group : Proc(ISyncChangeBatchBase2*, UInt8*, ISyncKnowledge, HRESULT)
    add_item_metadata_to_group : Proc(ISyncChangeBatchBase2*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)
    get_learned_knowledge : Proc(ISyncChangeBatchBase2*, ISyncKnowledge*, HRESULT)
    get_prerequisite_knowledge : Proc(ISyncChangeBatchBase2*, ISyncKnowledge*, HRESULT)
    get_source_forgotten_knowledge : Proc(ISyncChangeBatchBase2*, IForgottenKnowledge*, HRESULT)
    set_last_batch : Proc(ISyncChangeBatchBase2*, HRESULT)
    set_work_estimate_for_batch : Proc(ISyncChangeBatchBase2*, UInt32, HRESULT)
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatchBase2*, UInt32, HRESULT)
    serialize : Proc(ISyncChangeBatchBase2*, UInt8*, UInt32*, HRESULT)
    serialize_with_options : Proc(ISyncChangeBatchBase2*, SYNC_SERIALIZATION_VERSION, UInt32, UInt8*, UInt32*, HRESULT)
  end

  ISyncChangeBatchBase2_GUID = "6fdb596a-d755-4584-bd0c-c0c23a548fbf"
  IID_ISyncChangeBatchBase2 = LibC::GUID.new(0x6fdb596a_u32, 0xd755_u16, 0x4584_u16, StaticArray[0xbd_u8, 0xc_u8, 0xc0_u8, 0xc2_u8, 0x3a_u8, 0x54_u8, 0x8f_u8, 0xbf_u8])
  struct ISyncChangeBatchBase2
    lpVtbl : ISyncChangeBatchBase2VTbl*
  end

  struct ISyncChangeBatchAdvancedVTbl
    query_interface : Proc(ISyncChangeBatchAdvanced*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeBatchAdvanced*, UInt32)
    release : Proc(ISyncChangeBatchAdvanced*, UInt32)
    get_filter_info : Proc(ISyncChangeBatchAdvanced*, ISyncFilterInfo*, HRESULT)
    convert_full_enumeration_change_batch_to_regular_change_batch : Proc(ISyncChangeBatchAdvanced*, ISyncChangeBatch*, HRESULT)
    get_upper_bound_item_id : Proc(ISyncChangeBatchAdvanced*, UInt8*, UInt32*, HRESULT)
    get_batch_level_knowledge_should_be_applied : Proc(ISyncChangeBatchAdvanced*, LibC::BOOL*, HRESULT)
  end

  ISyncChangeBatchAdvanced_GUID = "0f1a4995-cbc8-421d-b550-5d0bebf3e9a5"
  IID_ISyncChangeBatchAdvanced = LibC::GUID.new(0xf1a4995_u32, 0xcbc8_u16, 0x421d_u16, StaticArray[0xb5_u8, 0x50_u8, 0x5d_u8, 0xb_u8, 0xeb_u8, 0xf3_u8, 0xe9_u8, 0xa5_u8])
  struct ISyncChangeBatchAdvanced
    lpVtbl : ISyncChangeBatchAdvancedVTbl*
  end

  struct ISyncChangeBatch2VTbl
    query_interface : Proc(ISyncChangeBatch2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeBatch2*, UInt32)
    release : Proc(ISyncChangeBatch2*, UInt32)
    get_change_enumerator : Proc(ISyncChangeBatch2*, IEnumSyncChanges*, HRESULT)
    get_is_last_batch : Proc(ISyncChangeBatch2*, LibC::BOOL*, HRESULT)
    get_work_estimate_for_batch : Proc(ISyncChangeBatch2*, UInt32*, HRESULT)
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatch2*, UInt32*, HRESULT)
    begin_ordered_group : Proc(ISyncChangeBatch2*, UInt8*, HRESULT)
    end_ordered_group : Proc(ISyncChangeBatch2*, UInt8*, ISyncKnowledge, HRESULT)
    add_item_metadata_to_group : Proc(ISyncChangeBatch2*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)
    get_learned_knowledge : Proc(ISyncChangeBatch2*, ISyncKnowledge*, HRESULT)
    get_prerequisite_knowledge : Proc(ISyncChangeBatch2*, ISyncKnowledge*, HRESULT)
    get_source_forgotten_knowledge : Proc(ISyncChangeBatch2*, IForgottenKnowledge*, HRESULT)
    set_last_batch : Proc(ISyncChangeBatch2*, HRESULT)
    set_work_estimate_for_batch : Proc(ISyncChangeBatch2*, UInt32, HRESULT)
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatch2*, UInt32, HRESULT)
    serialize : Proc(ISyncChangeBatch2*, UInt8*, UInt32*, HRESULT)
    begin_unordered_group : Proc(ISyncChangeBatch2*, HRESULT)
    end_unordered_group : Proc(ISyncChangeBatch2*, ISyncKnowledge, LibC::BOOL, HRESULT)
    add_logged_conflict : Proc(ISyncChangeBatch2*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncKnowledge, ISyncChangeBuilder*, HRESULT)
    add_merge_tombstone_metadata_to_group : Proc(ISyncChangeBatch2*, UInt8*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, ISyncChangeBuilder*, HRESULT)
    add_merge_tombstone_logged_conflict : Proc(ISyncChangeBatch2*, UInt8*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, ISyncKnowledge, ISyncChangeBuilder*, HRESULT)
  end

  ISyncChangeBatch2_GUID = "225f4a33-f5ee-4cc7-b039-67a262b4b2ac"
  IID_ISyncChangeBatch2 = LibC::GUID.new(0x225f4a33_u32, 0xf5ee_u16, 0x4cc7_u16, StaticArray[0xb0_u8, 0x39_u8, 0x67_u8, 0xa2_u8, 0x62_u8, 0xb4_u8, 0xb2_u8, 0xac_u8])
  struct ISyncChangeBatch2
    lpVtbl : ISyncChangeBatch2VTbl*
  end

  struct ISyncFullEnumerationChangeBatch2VTbl
    query_interface : Proc(ISyncFullEnumerationChangeBatch2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncFullEnumerationChangeBatch2*, UInt32)
    release : Proc(ISyncFullEnumerationChangeBatch2*, UInt32)
    get_change_enumerator : Proc(ISyncFullEnumerationChangeBatch2*, IEnumSyncChanges*, HRESULT)
    get_is_last_batch : Proc(ISyncFullEnumerationChangeBatch2*, LibC::BOOL*, HRESULT)
    get_work_estimate_for_batch : Proc(ISyncFullEnumerationChangeBatch2*, UInt32*, HRESULT)
    get_remaining_work_estimate_for_session : Proc(ISyncFullEnumerationChangeBatch2*, UInt32*, HRESULT)
    begin_ordered_group : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, HRESULT)
    end_ordered_group : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, ISyncKnowledge, HRESULT)
    add_item_metadata_to_group : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, UInt32, ISyncChangeBuilder*, HRESULT)
    get_learned_knowledge : Proc(ISyncFullEnumerationChangeBatch2*, ISyncKnowledge*, HRESULT)
    get_prerequisite_knowledge : Proc(ISyncFullEnumerationChangeBatch2*, ISyncKnowledge*, HRESULT)
    get_source_forgotten_knowledge : Proc(ISyncFullEnumerationChangeBatch2*, IForgottenKnowledge*, HRESULT)
    set_last_batch : Proc(ISyncFullEnumerationChangeBatch2*, HRESULT)
    set_work_estimate_for_batch : Proc(ISyncFullEnumerationChangeBatch2*, UInt32, HRESULT)
    set_remaining_work_estimate_for_session : Proc(ISyncFullEnumerationChangeBatch2*, UInt32, HRESULT)
    serialize : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt32*, HRESULT)
    get_learned_knowledge_after_recovery_complete : Proc(ISyncFullEnumerationChangeBatch2*, ISyncKnowledge*, HRESULT)
    get_closed_lower_bound_item_id : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt32*, HRESULT)
    get_closed_upper_bound_item_id : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt32*, HRESULT)
    add_merge_tombstone_metadata_to_group : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt8*, UInt8*, SYNC_VERSION*, SYNC_VERSION*, UInt32, ISyncChangeBuilder*, HRESULT)
  end

  ISyncFullEnumerationChangeBatch2_GUID = "e06449f4-a205-4b65-9724-01b22101eec1"
  IID_ISyncFullEnumerationChangeBatch2 = LibC::GUID.new(0xe06449f4_u32, 0xa205_u16, 0x4b65_u16, StaticArray[0x97_u8, 0x24_u8, 0x1_u8, 0xb2_u8, 0x21_u8, 0x1_u8, 0xee_u8, 0xc1_u8])
  struct ISyncFullEnumerationChangeBatch2
    lpVtbl : ISyncFullEnumerationChangeBatch2VTbl*
  end

  struct IKnowledgeSyncProviderVTbl
    query_interface : Proc(IKnowledgeSyncProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IKnowledgeSyncProvider*, UInt32)
    release : Proc(IKnowledgeSyncProvider*, UInt32)
    get_id_parameters : Proc(IKnowledgeSyncProvider*, ID_PARAMETERS*, HRESULT)
    begin_session : Proc(IKnowledgeSyncProvider*, SYNC_PROVIDER_ROLE, ISyncSessionState, HRESULT)
    get_sync_batch_parameters : Proc(IKnowledgeSyncProvider*, ISyncKnowledge*, UInt32*, HRESULT)
    get_change_batch : Proc(IKnowledgeSyncProvider*, UInt32, ISyncKnowledge, ISyncChangeBatch*, IUnknown*, HRESULT)
    get_full_enumeration_change_batch : Proc(IKnowledgeSyncProvider*, UInt32, UInt8*, ISyncKnowledge, ISyncFullEnumerationChangeBatch*, IUnknown*, HRESULT)
    process_change_batch : Proc(IKnowledgeSyncProvider*, CONFLICT_RESOLUTION_POLICY, ISyncChangeBatch, IUnknown, ISyncCallback, SYNC_SESSION_STATISTICS*, HRESULT)
    process_full_enumeration_change_batch : Proc(IKnowledgeSyncProvider*, CONFLICT_RESOLUTION_POLICY, ISyncFullEnumerationChangeBatch, IUnknown, ISyncCallback, SYNC_SESSION_STATISTICS*, HRESULT)
    end_session : Proc(IKnowledgeSyncProvider*, ISyncSessionState, HRESULT)
  end

  IKnowledgeSyncProvider_GUID = "43434a49-8da4-47f2-8172-ad7b8b024978"
  IID_IKnowledgeSyncProvider = LibC::GUID.new(0x43434a49_u32, 0x8da4_u16, 0x47f2_u16, StaticArray[0x81_u8, 0x72_u8, 0xad_u8, 0x7b_u8, 0x8b_u8, 0x2_u8, 0x49_u8, 0x78_u8])
  struct IKnowledgeSyncProvider
    lpVtbl : IKnowledgeSyncProviderVTbl*
  end

  struct ISyncChangeUnitVTbl
    query_interface : Proc(ISyncChangeUnit*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeUnit*, UInt32)
    release : Proc(ISyncChangeUnit*, UInt32)
    get_item_change : Proc(ISyncChangeUnit*, ISyncChange*, HRESULT)
    get_change_unit_id : Proc(ISyncChangeUnit*, UInt8*, UInt32*, HRESULT)
    get_change_unit_version : Proc(ISyncChangeUnit*, UInt8*, SYNC_VERSION*, HRESULT)
  end

  ISyncChangeUnit_GUID = "60edd8ca-7341-4bb7-95ce-fab6394b51cb"
  IID_ISyncChangeUnit = LibC::GUID.new(0x60edd8ca_u32, 0x7341_u16, 0x4bb7_u16, StaticArray[0x95_u8, 0xce_u8, 0xfa_u8, 0xb6_u8, 0x39_u8, 0x4b_u8, 0x51_u8, 0xcb_u8])
  struct ISyncChangeUnit
    lpVtbl : ISyncChangeUnitVTbl*
  end

  struct IEnumSyncChangeUnitsVTbl
    query_interface : Proc(IEnumSyncChangeUnits*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSyncChangeUnits*, UInt32)
    release : Proc(IEnumSyncChangeUnits*, UInt32)
    next : Proc(IEnumSyncChangeUnits*, UInt32, ISyncChangeUnit*, UInt32*, HRESULT)
    skip : Proc(IEnumSyncChangeUnits*, UInt32, HRESULT)
    reset : Proc(IEnumSyncChangeUnits*, HRESULT)
    clone : Proc(IEnumSyncChangeUnits*, IEnumSyncChangeUnits*, HRESULT)
  end

  IEnumSyncChangeUnits_GUID = "346b35f1-8703-4c6d-ab1a-4dbca2cff97f"
  IID_IEnumSyncChangeUnits = LibC::GUID.new(0x346b35f1_u32, 0x8703_u16, 0x4c6d_u16, StaticArray[0xab_u8, 0x1a_u8, 0x4d_u8, 0xbc_u8, 0xa2_u8, 0xcf_u8, 0xf9_u8, 0x7f_u8])
  struct IEnumSyncChangeUnits
    lpVtbl : IEnumSyncChangeUnitsVTbl*
  end

  struct ISyncChangeVTbl
    query_interface : Proc(ISyncChange*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChange*, UInt32)
    release : Proc(ISyncChange*, UInt32)
    get_owner_replica_id : Proc(ISyncChange*, UInt8*, UInt32*, HRESULT)
    get_root_item_id : Proc(ISyncChange*, UInt8*, UInt32*, HRESULT)
    get_change_version : Proc(ISyncChange*, UInt8*, SYNC_VERSION*, HRESULT)
    get_creation_version : Proc(ISyncChange*, UInt8*, SYNC_VERSION*, HRESULT)
    get_flags : Proc(ISyncChange*, UInt32*, HRESULT)
    get_work_estimate : Proc(ISyncChange*, UInt32*, HRESULT)
    get_change_units : Proc(ISyncChange*, IEnumSyncChangeUnits*, HRESULT)
    get_made_with_knowledge : Proc(ISyncChange*, ISyncKnowledge*, HRESULT)
    get_learned_knowledge : Proc(ISyncChange*, ISyncKnowledge*, HRESULT)
    set_work_estimate : Proc(ISyncChange*, UInt32, HRESULT)
  end

  ISyncChange_GUID = "a1952beb-0f6b-4711-b136-01da85b968a6"
  IID_ISyncChange = LibC::GUID.new(0xa1952beb_u32, 0xf6b_u16, 0x4711_u16, StaticArray[0xb1_u8, 0x36_u8, 0x1_u8, 0xda_u8, 0x85_u8, 0xb9_u8, 0x68_u8, 0xa6_u8])
  struct ISyncChange
    lpVtbl : ISyncChangeVTbl*
  end

  struct ISyncChangeWithPrerequisiteVTbl
    query_interface : Proc(ISyncChangeWithPrerequisite*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeWithPrerequisite*, UInt32)
    release : Proc(ISyncChangeWithPrerequisite*, UInt32)
    get_prerequisite_knowledge : Proc(ISyncChangeWithPrerequisite*, ISyncKnowledge*, HRESULT)
    get_learned_knowledge_with_prerequisite : Proc(ISyncChangeWithPrerequisite*, ISyncKnowledge, ISyncKnowledge*, HRESULT)
  end

  ISyncChangeWithPrerequisite_GUID = "9e38382f-1589-48c3-92e4-05ecdcb4f3f7"
  IID_ISyncChangeWithPrerequisite = LibC::GUID.new(0x9e38382f_u32, 0x1589_u16, 0x48c3_u16, StaticArray[0x92_u8, 0xe4_u8, 0x5_u8, 0xec_u8, 0xdc_u8, 0xb4_u8, 0xf3_u8, 0xf7_u8])
  struct ISyncChangeWithPrerequisite
    lpVtbl : ISyncChangeWithPrerequisiteVTbl*
  end

  struct ISyncFullEnumerationChangeVTbl
    query_interface : Proc(ISyncFullEnumerationChange*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncFullEnumerationChange*, UInt32)
    release : Proc(ISyncFullEnumerationChange*, UInt32)
    get_learned_knowledge_after_recovery_complete : Proc(ISyncFullEnumerationChange*, ISyncKnowledge*, HRESULT)
    get_learned_forgotten_knowledge : Proc(ISyncFullEnumerationChange*, IForgottenKnowledge*, HRESULT)
  end

  ISyncFullEnumerationChange_GUID = "9785e0bd-bdff-40c4-98c5-b34b2f1991b3"
  IID_ISyncFullEnumerationChange = LibC::GUID.new(0x9785e0bd_u32, 0xbdff_u16, 0x40c4_u16, StaticArray[0x98_u8, 0xc5_u8, 0xb3_u8, 0x4b_u8, 0x2f_u8, 0x19_u8, 0x91_u8, 0xb3_u8])
  struct ISyncFullEnumerationChange
    lpVtbl : ISyncFullEnumerationChangeVTbl*
  end

  struct ISyncMergeTombstoneChangeVTbl
    query_interface : Proc(ISyncMergeTombstoneChange*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncMergeTombstoneChange*, UInt32)
    release : Proc(ISyncMergeTombstoneChange*, UInt32)
    get_winner_item_id : Proc(ISyncMergeTombstoneChange*, UInt8*, UInt32*, HRESULT)
  end

  ISyncMergeTombstoneChange_GUID = "6ec62597-0903-484c-ad61-36d6e938f47b"
  IID_ISyncMergeTombstoneChange = LibC::GUID.new(0x6ec62597_u32, 0x903_u16, 0x484c_u16, StaticArray[0xad_u8, 0x61_u8, 0x36_u8, 0xd6_u8, 0xe9_u8, 0x38_u8, 0xf4_u8, 0x7b_u8])
  struct ISyncMergeTombstoneChange
    lpVtbl : ISyncMergeTombstoneChangeVTbl*
  end

  struct IEnumItemIdsVTbl
    query_interface : Proc(IEnumItemIds*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumItemIds*, UInt32)
    release : Proc(IEnumItemIds*, UInt32)
    next : Proc(IEnumItemIds*, UInt8*, UInt32*, HRESULT)
  end

  IEnumItemIds_GUID = "43aa3f61-4b2e-4b60-83df-b110d3e148f1"
  IID_IEnumItemIds = LibC::GUID.new(0x43aa3f61_u32, 0x4b2e_u16, 0x4b60_u16, StaticArray[0x83_u8, 0xdf_u8, 0xb1_u8, 0x10_u8, 0xd3_u8, 0xe1_u8, 0x48_u8, 0xf1_u8])
  struct IEnumItemIds
    lpVtbl : IEnumItemIdsVTbl*
  end

  struct IFilterKeyMapVTbl
    query_interface : Proc(IFilterKeyMap*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFilterKeyMap*, UInt32)
    release : Proc(IFilterKeyMap*, UInt32)
    get_count : Proc(IFilterKeyMap*, UInt32*, HRESULT)
    add_filter : Proc(IFilterKeyMap*, ISyncFilter, UInt32*, HRESULT)
    get_filter : Proc(IFilterKeyMap*, UInt32, ISyncFilter*, HRESULT)
    serialize : Proc(IFilterKeyMap*, UInt8*, UInt32*, HRESULT)
  end

  IFilterKeyMap_GUID = "ca169652-07c6-4708-a3da-6e4eba8d2297"
  IID_IFilterKeyMap = LibC::GUID.new(0xca169652_u32, 0x7c6_u16, 0x4708_u16, StaticArray[0xa3_u8, 0xda_u8, 0x6e_u8, 0x4e_u8, 0xba_u8, 0x8d_u8, 0x22_u8, 0x97_u8])
  struct IFilterKeyMap
    lpVtbl : IFilterKeyMapVTbl*
  end

  struct ISyncChangeWithFilterKeyMapVTbl
    query_interface : Proc(ISyncChangeWithFilterKeyMap*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeWithFilterKeyMap*, UInt32)
    release : Proc(ISyncChangeWithFilterKeyMap*, UInt32)
    get_filter_count : Proc(ISyncChangeWithFilterKeyMap*, UInt32*, HRESULT)
    get_filter_change : Proc(ISyncChangeWithFilterKeyMap*, UInt32, SYNC_FILTER_CHANGE*, HRESULT)
    get_all_change_units_present_flag : Proc(ISyncChangeWithFilterKeyMap*, LibC::BOOL*, HRESULT)
    get_filter_forgotten_knowledge : Proc(ISyncChangeWithFilterKeyMap*, UInt32, ISyncKnowledge*, HRESULT)
    get_filtered_replica_learned_knowledge : Proc(ISyncChangeWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)
    get_learned_filter_forgotten_knowledge : Proc(ISyncChangeWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, UInt32, ISyncKnowledge*, HRESULT)
    get_filtered_replica_learned_forgotten_knowledge : Proc(ISyncChangeWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)
    get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete : Proc(ISyncChangeWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)
    get_learned_filter_forgotten_knowledge_after_recovery_complete : Proc(ISyncChangeWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, UInt32, ISyncKnowledge*, HRESULT)
  end

  ISyncChangeWithFilterKeyMap_GUID = "bfe1ef00-e87d-42fd-a4e9-242d70414aef"
  IID_ISyncChangeWithFilterKeyMap = LibC::GUID.new(0xbfe1ef00_u32, 0xe87d_u16, 0x42fd_u16, StaticArray[0xa4_u8, 0xe9_u8, 0x24_u8, 0x2d_u8, 0x70_u8, 0x41_u8, 0x4a_u8, 0xef_u8])
  struct ISyncChangeWithFilterKeyMap
    lpVtbl : ISyncChangeWithFilterKeyMapVTbl*
  end

  struct ISyncChangeBatchWithFilterKeyMapVTbl
    query_interface : Proc(ISyncChangeBatchWithFilterKeyMap*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncChangeBatchWithFilterKeyMap*, UInt32)
    release : Proc(ISyncChangeBatchWithFilterKeyMap*, UInt32)
    get_filter_key_map : Proc(ISyncChangeBatchWithFilterKeyMap*, IFilterKeyMap*, HRESULT)
    set_filter_key_map : Proc(ISyncChangeBatchWithFilterKeyMap*, IFilterKeyMap, HRESULT)
    set_filter_forgotten_knowledge : Proc(ISyncChangeBatchWithFilterKeyMap*, UInt32, ISyncKnowledge, HRESULT)
    get_filtered_replica_learned_knowledge : Proc(ISyncChangeBatchWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)
    get_learned_filter_forgotten_knowledge : Proc(ISyncChangeBatchWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, UInt32, ISyncKnowledge*, HRESULT)
    get_filtered_replica_learned_forgotten_knowledge : Proc(ISyncChangeBatchWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)
    get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete : Proc(ISyncChangeBatchWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, ISyncKnowledge*, HRESULT)
    get_learned_filter_forgotten_knowledge_after_recovery_complete : Proc(ISyncChangeBatchWithFilterKeyMap*, ISyncKnowledge, IEnumItemIds, UInt32, ISyncKnowledge*, HRESULT)
  end

  ISyncChangeBatchWithFilterKeyMap_GUID = "de247002-566d-459a-a6ed-a5aab3459fb7"
  IID_ISyncChangeBatchWithFilterKeyMap = LibC::GUID.new(0xde247002_u32, 0x566d_u16, 0x459a_u16, StaticArray[0xa6_u8, 0xed_u8, 0xa5_u8, 0xaa_u8, 0xb3_u8, 0x45_u8, 0x9f_u8, 0xb7_u8])
  struct ISyncChangeBatchWithFilterKeyMap
    lpVtbl : ISyncChangeBatchWithFilterKeyMapVTbl*
  end

  struct IDataRetrieverCallbackVTbl
    query_interface : Proc(IDataRetrieverCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDataRetrieverCallback*, UInt32)
    release : Proc(IDataRetrieverCallback*, UInt32)
    load_change_data_complete : Proc(IDataRetrieverCallback*, IUnknown, HRESULT)
    load_change_data_error : Proc(IDataRetrieverCallback*, HRESULT, HRESULT)
  end

  IDataRetrieverCallback_GUID = "71b4863b-f969-4676-bbc3-3d9fdc3fb2c7"
  IID_IDataRetrieverCallback = LibC::GUID.new(0x71b4863b_u32, 0xf969_u16, 0x4676_u16, StaticArray[0xbb_u8, 0xc3_u8, 0x3d_u8, 0x9f_u8, 0xdc_u8, 0x3f_u8, 0xb2_u8, 0xc7_u8])
  struct IDataRetrieverCallback
    lpVtbl : IDataRetrieverCallbackVTbl*
  end

  struct ILoadChangeContextVTbl
    query_interface : Proc(ILoadChangeContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILoadChangeContext*, UInt32)
    release : Proc(ILoadChangeContext*, UInt32)
    get_sync_change : Proc(ILoadChangeContext*, ISyncChange*, HRESULT)
    set_recoverable_error_on_change : Proc(ILoadChangeContext*, HRESULT, IRecoverableErrorData, HRESULT)
    set_recoverable_error_on_change_unit : Proc(ILoadChangeContext*, HRESULT, ISyncChangeUnit, IRecoverableErrorData, HRESULT)
  end

  ILoadChangeContext_GUID = "44a4aaca-ec39-46d5-b5c9-d633c0ee67e2"
  IID_ILoadChangeContext = LibC::GUID.new(0x44a4aaca_u32, 0xec39_u16, 0x46d5_u16, StaticArray[0xb5_u8, 0xc9_u8, 0xd6_u8, 0x33_u8, 0xc0_u8, 0xee_u8, 0x67_u8, 0xe2_u8])
  struct ILoadChangeContext
    lpVtbl : ILoadChangeContextVTbl*
  end

  struct ISynchronousDataRetrieverVTbl
    query_interface : Proc(ISynchronousDataRetriever*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISynchronousDataRetriever*, UInt32)
    release : Proc(ISynchronousDataRetriever*, UInt32)
    get_id_parameters : Proc(ISynchronousDataRetriever*, ID_PARAMETERS*, HRESULT)
    load_change_data : Proc(ISynchronousDataRetriever*, ILoadChangeContext, IUnknown*, HRESULT)
  end

  ISynchronousDataRetriever_GUID = "9b22f2a9-a4cd-4648-9d8e-3a510d4da04b"
  IID_ISynchronousDataRetriever = LibC::GUID.new(0x9b22f2a9_u32, 0xa4cd_u16, 0x4648_u16, StaticArray[0x9d_u8, 0x8e_u8, 0x3a_u8, 0x51_u8, 0xd_u8, 0x4d_u8, 0xa0_u8, 0x4b_u8])
  struct ISynchronousDataRetriever
    lpVtbl : ISynchronousDataRetrieverVTbl*
  end

  struct IAsynchronousDataRetrieverVTbl
    query_interface : Proc(IAsynchronousDataRetriever*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAsynchronousDataRetriever*, UInt32)
    release : Proc(IAsynchronousDataRetriever*, UInt32)
    get_id_parameters : Proc(IAsynchronousDataRetriever*, ID_PARAMETERS*, HRESULT)
    register_callback : Proc(IAsynchronousDataRetriever*, IDataRetrieverCallback, HRESULT)
    revoke_callback : Proc(IAsynchronousDataRetriever*, IDataRetrieverCallback, HRESULT)
    load_change_data : Proc(IAsynchronousDataRetriever*, ILoadChangeContext, HRESULT)
  end

  IAsynchronousDataRetriever_GUID = "9fc7e470-61ea-4a88-9be4-df56a27cfef2"
  IID_IAsynchronousDataRetriever = LibC::GUID.new(0x9fc7e470_u32, 0x61ea_u16, 0x4a88_u16, StaticArray[0x9b_u8, 0xe4_u8, 0xdf_u8, 0x56_u8, 0xa2_u8, 0x7c_u8, 0xfe_u8, 0xf2_u8])
  struct IAsynchronousDataRetriever
    lpVtbl : IAsynchronousDataRetrieverVTbl*
  end

  struct IFilterRequestCallbackVTbl
    query_interface : Proc(IFilterRequestCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFilterRequestCallback*, UInt32)
    release : Proc(IFilterRequestCallback*, UInt32)
    request_filter : Proc(IFilterRequestCallback*, IUnknown, FILTERING_TYPE, HRESULT)
  end

  IFilterRequestCallback_GUID = "82df8873-6360-463a-a8a1-ede5e1a1594d"
  IID_IFilterRequestCallback = LibC::GUID.new(0x82df8873_u32, 0x6360_u16, 0x463a_u16, StaticArray[0xa8_u8, 0xa1_u8, 0xed_u8, 0xe5_u8, 0xe1_u8, 0xa1_u8, 0x59_u8, 0x4d_u8])
  struct IFilterRequestCallback
    lpVtbl : IFilterRequestCallbackVTbl*
  end

  struct IRequestFilteredSyncVTbl
    query_interface : Proc(IRequestFilteredSync*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRequestFilteredSync*, UInt32)
    release : Proc(IRequestFilteredSync*, UInt32)
    specify_filter : Proc(IRequestFilteredSync*, IFilterRequestCallback, HRESULT)
  end

  IRequestFilteredSync_GUID = "2e020184-6d18-46a7-a32a-da4aeb06696c"
  IID_IRequestFilteredSync = LibC::GUID.new(0x2e020184_u32, 0x6d18_u16, 0x46a7_u16, StaticArray[0xa3_u8, 0x2a_u8, 0xda_u8, 0x4a_u8, 0xeb_u8, 0x6_u8, 0x69_u8, 0x6c_u8])
  struct IRequestFilteredSync
    lpVtbl : IRequestFilteredSyncVTbl*
  end

  struct ISupportFilteredSyncVTbl
    query_interface : Proc(ISupportFilteredSync*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISupportFilteredSync*, UInt32)
    release : Proc(ISupportFilteredSync*, UInt32)
    add_filter : Proc(ISupportFilteredSync*, IUnknown, FILTERING_TYPE, HRESULT)
  end

  ISupportFilteredSync_GUID = "3d128ded-d555-4e0d-bf4b-fb213a8a9302"
  IID_ISupportFilteredSync = LibC::GUID.new(0x3d128ded_u32, 0xd555_u16, 0x4e0d_u16, StaticArray[0xbf_u8, 0x4b_u8, 0xfb_u8, 0x21_u8, 0x3a_u8, 0x8a_u8, 0x93_u8, 0x2_u8])
  struct ISupportFilteredSync
    lpVtbl : ISupportFilteredSyncVTbl*
  end

  struct IFilterTrackingRequestCallbackVTbl
    query_interface : Proc(IFilterTrackingRequestCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFilterTrackingRequestCallback*, UInt32)
    release : Proc(IFilterTrackingRequestCallback*, UInt32)
    request_tracked_filter : Proc(IFilterTrackingRequestCallback*, ISyncFilter, HRESULT)
  end

  IFilterTrackingRequestCallback_GUID = "713ca7bb-c858-4674-b4b6-1122436587a9"
  IID_IFilterTrackingRequestCallback = LibC::GUID.new(0x713ca7bb_u32, 0xc858_u16, 0x4674_u16, StaticArray[0xb4_u8, 0xb6_u8, 0x11_u8, 0x22_u8, 0x43_u8, 0x65_u8, 0x87_u8, 0xa9_u8])
  struct IFilterTrackingRequestCallback
    lpVtbl : IFilterTrackingRequestCallbackVTbl*
  end

  struct IFilterTrackingProviderVTbl
    query_interface : Proc(IFilterTrackingProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFilterTrackingProvider*, UInt32)
    release : Proc(IFilterTrackingProvider*, UInt32)
    specify_tracked_filters : Proc(IFilterTrackingProvider*, IFilterTrackingRequestCallback, HRESULT)
    add_tracked_filter : Proc(IFilterTrackingProvider*, ISyncFilter, HRESULT)
  end

  IFilterTrackingProvider_GUID = "743383c0-fc4e-45ba-ad81-d9d84c7a24f8"
  IID_IFilterTrackingProvider = LibC::GUID.new(0x743383c0_u32, 0xfc4e_u16, 0x45ba_u16, StaticArray[0xad_u8, 0x81_u8, 0xd9_u8, 0xd8_u8, 0x4c_u8, 0x7a_u8, 0x24_u8, 0xf8_u8])
  struct IFilterTrackingProvider
    lpVtbl : IFilterTrackingProviderVTbl*
  end

  struct ISupportLastWriteTimeVTbl
    query_interface : Proc(ISupportLastWriteTime*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISupportLastWriteTime*, UInt32)
    release : Proc(ISupportLastWriteTime*, UInt32)
    get_item_change_time : Proc(ISupportLastWriteTime*, UInt8*, UInt64*, HRESULT)
    get_change_unit_change_time : Proc(ISupportLastWriteTime*, UInt8*, UInt8*, UInt64*, HRESULT)
  end

  ISupportLastWriteTime_GUID = "eadf816f-d0bd-43ca-8f40-5acdc6c06f7a"
  IID_ISupportLastWriteTime = LibC::GUID.new(0xeadf816f_u32, 0xd0bd_u16, 0x43ca_u16, StaticArray[0x8f_u8, 0x40_u8, 0x5a_u8, 0xcd_u8, 0xc6_u8, 0xc0_u8, 0x6f_u8, 0x7a_u8])
  struct ISupportLastWriteTime
    lpVtbl : ISupportLastWriteTimeVTbl*
  end

  struct IProviderConverterVTbl
    query_interface : Proc(IProviderConverter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProviderConverter*, UInt32)
    release : Proc(IProviderConverter*, UInt32)
    initialize : Proc(IProviderConverter*, ISyncProvider, HRESULT)
  end

  IProviderConverter_GUID = "809b7276-98cf-4957-93a5-0ebdd3dddffd"
  IID_IProviderConverter = LibC::GUID.new(0x809b7276_u32, 0x98cf_u16, 0x4957_u16, StaticArray[0x93_u8, 0xa5_u8, 0xe_u8, 0xbd_u8, 0xd3_u8, 0xdd_u8, 0xdf_u8, 0xfd_u8])
  struct IProviderConverter
    lpVtbl : IProviderConverterVTbl*
  end

  struct ISyncDataConverterVTbl
    query_interface : Proc(ISyncDataConverter*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncDataConverter*, UInt32)
    release : Proc(ISyncDataConverter*, UInt32)
    convert_data_retriever_from_provider_format : Proc(ISyncDataConverter*, IUnknown, IEnumSyncChanges, IUnknown*, HRESULT)
    convert_data_retriever_to_provider_format : Proc(ISyncDataConverter*, IUnknown, IEnumSyncChanges, IUnknown*, HRESULT)
    convert_data_from_provider_format : Proc(ISyncDataConverter*, ILoadChangeContext, IUnknown, IUnknown*, HRESULT)
    convert_data_to_provider_format : Proc(ISyncDataConverter*, ILoadChangeContext, IUnknown, IUnknown*, HRESULT)
  end

  ISyncDataConverter_GUID = "435d4861-68d5-44aa-a0f9-72a0b00ef9cf"
  IID_ISyncDataConverter = LibC::GUID.new(0x435d4861_u32, 0x68d5_u16, 0x44aa_u16, StaticArray[0xa0_u8, 0xf9_u8, 0x72_u8, 0xa0_u8, 0xb0_u8, 0xe_u8, 0xf9_u8, 0xcf_u8])
  struct ISyncDataConverter
    lpVtbl : ISyncDataConverterVTbl*
  end

  struct ISyncProviderRegistrationVTbl
    query_interface : Proc(ISyncProviderRegistration*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncProviderRegistration*, UInt32)
    release : Proc(ISyncProviderRegistration*, UInt32)
    create_sync_provider_config_ui_registration_instance : Proc(ISyncProviderRegistration*, SyncProviderConfigUIConfiguration*, ISyncProviderConfigUIInfo*, HRESULT)
    unregister_sync_provider_config_ui : Proc(ISyncProviderRegistration*, Guid*, HRESULT)
    enumerate_sync_provider_config_u_is : Proc(ISyncProviderRegistration*, Guid*, UInt32, IEnumSyncProviderConfigUIInfos*, HRESULT)
    create_sync_provider_registration_instance : Proc(ISyncProviderRegistration*, SyncProviderConfiguration*, ISyncProviderInfo*, HRESULT)
    unregister_sync_provider : Proc(ISyncProviderRegistration*, Guid*, HRESULT)
    get_sync_provider_config_ui_infofor_provider : Proc(ISyncProviderRegistration*, Guid*, ISyncProviderConfigUIInfo*, HRESULT)
    enumerate_sync_providers : Proc(ISyncProviderRegistration*, Guid*, UInt32, UInt32, Guid*, UInt32, IEnumSyncProviderInfos*, HRESULT)
    get_sync_provider_info : Proc(ISyncProviderRegistration*, Guid*, ISyncProviderInfo*, HRESULT)
    get_sync_provider_from_instance_id : Proc(ISyncProviderRegistration*, Guid*, UInt32, IRegisteredSyncProvider*, HRESULT)
    get_sync_provider_config_ui_info : Proc(ISyncProviderRegistration*, Guid*, ISyncProviderConfigUIInfo*, HRESULT)
    get_sync_provider_config_ui_from_instance_id : Proc(ISyncProviderRegistration*, Guid*, UInt32, ISyncProviderConfigUI*, HRESULT)
    get_sync_provider_state : Proc(ISyncProviderRegistration*, Guid*, UInt32*, HRESULT)
    set_sync_provider_state : Proc(ISyncProviderRegistration*, Guid*, UInt32, UInt32, HRESULT)
    register_for_event : Proc(ISyncProviderRegistration*, LibC::HANDLE*, HRESULT)
    revoke_event : Proc(ISyncProviderRegistration*, LibC::HANDLE, HRESULT)
    get_change : Proc(ISyncProviderRegistration*, LibC::HANDLE, ISyncRegistrationChange*, HRESULT)
  end

  ISyncProviderRegistration_GUID = "cb45953b-7624-47bc-a472-eb8cac6b222e"
  IID_ISyncProviderRegistration = LibC::GUID.new(0xcb45953b_u32, 0x7624_u16, 0x47bc_u16, StaticArray[0xa4_u8, 0x72_u8, 0xeb_u8, 0x8c_u8, 0xac_u8, 0x6b_u8, 0x22_u8, 0x2e_u8])
  struct ISyncProviderRegistration
    lpVtbl : ISyncProviderRegistrationVTbl*
  end

  struct IEnumSyncProviderConfigUIInfosVTbl
    query_interface : Proc(IEnumSyncProviderConfigUIInfos*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSyncProviderConfigUIInfos*, UInt32)
    release : Proc(IEnumSyncProviderConfigUIInfos*, UInt32)
    next : Proc(IEnumSyncProviderConfigUIInfos*, UInt32, ISyncProviderConfigUIInfo*, UInt32*, HRESULT)
    skip : Proc(IEnumSyncProviderConfigUIInfos*, UInt32, HRESULT)
    reset : Proc(IEnumSyncProviderConfigUIInfos*, HRESULT)
    clone : Proc(IEnumSyncProviderConfigUIInfos*, IEnumSyncProviderConfigUIInfos*, HRESULT)
  end

  IEnumSyncProviderConfigUIInfos_GUID = "f6be2602-17c6-4658-a2d7-68ed3330f641"
  IID_IEnumSyncProviderConfigUIInfos = LibC::GUID.new(0xf6be2602_u32, 0x17c6_u16, 0x4658_u16, StaticArray[0xa2_u8, 0xd7_u8, 0x68_u8, 0xed_u8, 0x33_u8, 0x30_u8, 0xf6_u8, 0x41_u8])
  struct IEnumSyncProviderConfigUIInfos
    lpVtbl : IEnumSyncProviderConfigUIInfosVTbl*
  end

  struct IEnumSyncProviderInfosVTbl
    query_interface : Proc(IEnumSyncProviderInfos*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSyncProviderInfos*, UInt32)
    release : Proc(IEnumSyncProviderInfos*, UInt32)
    next : Proc(IEnumSyncProviderInfos*, UInt32, ISyncProviderInfo*, UInt32*, HRESULT)
    skip : Proc(IEnumSyncProviderInfos*, UInt32, HRESULT)
    reset : Proc(IEnumSyncProviderInfos*, HRESULT)
    clone : Proc(IEnumSyncProviderInfos*, IEnumSyncProviderInfos*, HRESULT)
  end

  IEnumSyncProviderInfos_GUID = "a04ba850-5eb1-460d-a973-393fcb608a11"
  IID_IEnumSyncProviderInfos = LibC::GUID.new(0xa04ba850_u32, 0x5eb1_u16, 0x460d_u16, StaticArray[0xa9_u8, 0x73_u8, 0x39_u8, 0x3f_u8, 0xcb_u8, 0x60_u8, 0x8a_u8, 0x11_u8])
  struct IEnumSyncProviderInfos
    lpVtbl : IEnumSyncProviderInfosVTbl*
  end

  struct ISyncProviderInfoVTbl
    query_interface : Proc(ISyncProviderInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncProviderInfo*, UInt32)
    release : Proc(ISyncProviderInfo*, UInt32)
    get_count : Proc(ISyncProviderInfo*, UInt32*, HRESULT)
    get_at : Proc(ISyncProviderInfo*, UInt32, PROPERTYKEY*, HRESULT)
    get_value : Proc(ISyncProviderInfo*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    set_value : Proc(ISyncProviderInfo*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    commit : Proc(ISyncProviderInfo*, HRESULT)
    get_sync_provider : Proc(ISyncProviderInfo*, UInt32, IRegisteredSyncProvider*, HRESULT)
  end

  ISyncProviderInfo_GUID = "1ee135de-88a4-4504-b0d0-f7920d7e5ba6"
  IID_ISyncProviderInfo = LibC::GUID.new(0x1ee135de_u32, 0x88a4_u16, 0x4504_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xf7_u8, 0x92_u8, 0xd_u8, 0x7e_u8, 0x5b_u8, 0xa6_u8])
  struct ISyncProviderInfo
    lpVtbl : ISyncProviderInfoVTbl*
  end

  struct ISyncProviderConfigUIInfoVTbl
    query_interface : Proc(ISyncProviderConfigUIInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncProviderConfigUIInfo*, UInt32)
    release : Proc(ISyncProviderConfigUIInfo*, UInt32)
    get_count : Proc(ISyncProviderConfigUIInfo*, UInt32*, HRESULT)
    get_at : Proc(ISyncProviderConfigUIInfo*, UInt32, PROPERTYKEY*, HRESULT)
    get_value : Proc(ISyncProviderConfigUIInfo*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    set_value : Proc(ISyncProviderConfigUIInfo*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    commit : Proc(ISyncProviderConfigUIInfo*, HRESULT)
    get_sync_provider_config_ui : Proc(ISyncProviderConfigUIInfo*, UInt32, ISyncProviderConfigUI*, HRESULT)
  end

  ISyncProviderConfigUIInfo_GUID = "214141ae-33d7-4d8d-8e37-f227e880ce50"
  IID_ISyncProviderConfigUIInfo = LibC::GUID.new(0x214141ae_u32, 0x33d7_u16, 0x4d8d_u16, StaticArray[0x8e_u8, 0x37_u8, 0xf2_u8, 0x27_u8, 0xe8_u8, 0x80_u8, 0xce_u8, 0x50_u8])
  struct ISyncProviderConfigUIInfo
    lpVtbl : ISyncProviderConfigUIInfoVTbl*
  end

  struct ISyncProviderConfigUIVTbl
    query_interface : Proc(ISyncProviderConfigUI*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncProviderConfigUI*, UInt32)
    release : Proc(ISyncProviderConfigUI*, UInt32)
    init : Proc(ISyncProviderConfigUI*, Guid*, Guid*, IPropertyStore, HRESULT)
    get_registered_properties : Proc(ISyncProviderConfigUI*, IPropertyStore*, HRESULT)
    create_and_register_new_sync_provider : Proc(ISyncProviderConfigUI*, LibC::HANDLE, IUnknown, ISyncProviderInfo*, HRESULT)
    modify_sync_provider : Proc(ISyncProviderConfigUI*, LibC::HANDLE, IUnknown, ISyncProviderInfo, HRESULT)
  end

  ISyncProviderConfigUI_GUID = "7b0705f6-cbcd-4071-ab05-3bdc364d4a0c"
  IID_ISyncProviderConfigUI = LibC::GUID.new(0x7b0705f6_u32, 0xcbcd_u16, 0x4071_u16, StaticArray[0xab_u8, 0x5_u8, 0x3b_u8, 0xdc_u8, 0x36_u8, 0x4d_u8, 0x4a_u8, 0xc_u8])
  struct ISyncProviderConfigUI
    lpVtbl : ISyncProviderConfigUIVTbl*
  end

  struct IRegisteredSyncProviderVTbl
    query_interface : Proc(IRegisteredSyncProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRegisteredSyncProvider*, UInt32)
    release : Proc(IRegisteredSyncProvider*, UInt32)
    init : Proc(IRegisteredSyncProvider*, Guid*, Guid*, IPropertyStore, HRESULT)
    get_instance_id : Proc(IRegisteredSyncProvider*, Guid*, HRESULT)
    reset : Proc(IRegisteredSyncProvider*, HRESULT)
  end

  IRegisteredSyncProvider_GUID = "913bcf76-47c1-40b5-a896-5e8a9c414c14"
  IID_IRegisteredSyncProvider = LibC::GUID.new(0x913bcf76_u32, 0x47c1_u16, 0x40b5_u16, StaticArray[0xa8_u8, 0x96_u8, 0x5e_u8, 0x8a_u8, 0x9c_u8, 0x41_u8, 0x4c_u8, 0x14_u8])
  struct IRegisteredSyncProvider
    lpVtbl : IRegisteredSyncProviderVTbl*
  end

  struct ISyncRegistrationChangeVTbl
    query_interface : Proc(ISyncRegistrationChange*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISyncRegistrationChange*, UInt32)
    release : Proc(ISyncRegistrationChange*, UInt32)
    get_event : Proc(ISyncRegistrationChange*, SYNC_REGISTRATION_EVENT*, HRESULT)
    get_instance_id : Proc(ISyncRegistrationChange*, Guid*, HRESULT)
  end

  ISyncRegistrationChange_GUID = "eea0d9ae-6b29-43b4-9e70-e3ae33bb2c3b"
  IID_ISyncRegistrationChange = LibC::GUID.new(0xeea0d9ae_u32, 0x6b29_u16, 0x43b4_u16, StaticArray[0x9e_u8, 0x70_u8, 0xe3_u8, 0xae_u8, 0x33_u8, 0xbb_u8, 0x2c_u8, 0x3b_u8])
  struct ISyncRegistrationChange
    lpVtbl : ISyncRegistrationChangeVTbl*
  end

end