require "./../foundation.cr"
require "./com.cr"
require "./../ui/shell/properties_system.cr"

module Win32cr::System::WindowsSync
  extend self
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
  PKEY_PROVIDER_INSTANCEID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 2_u32)
  PKEY_PROVIDER_CLSID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 3_u32)
  PKEY_PROVIDER_CONFIGUI = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 4_u32)
  PKEY_PROVIDER_CONTENTTYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 5_u32)
  PKEY_PROVIDER_CAPABILITIES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 6_u32)
  PKEY_PROVIDER_SUPPORTED_ARCHITECTURE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 7_u32)
  PKEY_PROVIDER_NAME = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 8_u32)
  PKEY_PROVIDER_DESCRIPTION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 9_u32)
  PKEY_PROVIDER_TOOLTIPS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 10_u32)
  PKEY_PROVIDER_ICON = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84179e61_u32, 0x60f6_u16, 0x4c1c_u16, StaticArray[0x88_u8, 0xed_u8, 0xf1_u8, 0xc5_u8, 0x31_u8, 0xb3_u8, 0x2b_u8, 0xda_u8]), 11_u32)
  PKEY_CONFIGUI_INSTANCEID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 2_u32)
  PKEY_CONFIGUI_CLSID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 3_u32)
  PKEY_CONFIGUI_CONTENTTYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 4_u32)
  PKEY_CONFIGUI_CAPABILITIES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 5_u32)
  PKEY_CONFIGUI_SUPPORTED_ARCHITECTURE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 6_u32)
  PKEY_CONFIGUI_IS_GLOBAL = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 7_u32)
  PKEY_CONFIGUI_NAME = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 8_u32)
  PKEY_CONFIGUI_DESCRIPTION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 9_u32)
  PKEY_CONFIGUI_TOOLTIPS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 10_u32)
  PKEY_CONFIGUI_ICON = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 11_u32)
  PKEY_CONFIGUI_MENUITEM_NOUI = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 12_u32)
  PKEY_CONFIGUI_MENUITEM = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x554b24ea_u32, 0xe8e3_u16, 0x45ba_u16, StaticArray[0x93_u8, 0x52_u8, 0xdf_u8, 0xb5_u8, 0x61_u8, 0xe1_u8, 0x71_u8, 0xe4_u8]), 13_u32)

  CLSID_SyncProviderRegistration = LibC::GUID.new(0xf82b4ef1_u32, 0x93a9_u16, 0x4dde_u16, StaticArray[0x80_u8, 0x15_u8, 0xf7_u8, 0x95_u8, 0xa_u8, 0x1a_u8, 0x6e_u8, 0x31_u8])

  enum SYNC_PROVIDER_ROLE
    SPR_SOURCE = 0_i32
    SPR_DESTINATION = 1_i32
  end
  enum CONFLICT_RESOLUTION_POLICY
    CRP_NONE = 0_i32
    CRP_DESTINATION_PROVIDER_WINS = 1_i32
    CRP_SOURCE_PROVIDER_WINS = 2_i32
    CRP_LAST = 3_i32
  end
  enum SYNC_PROGRESS_STAGE
    SPS_CHANGE_DETECTION = 0_i32
    SPS_CHANGE_ENUMERATION = 1_i32
    SPS_CHANGE_APPLICATION = 2_i32
  end
  enum SYNC_FULL_ENUMERATION_ACTION
    SFEA_FULL_ENUMERATION = 0_i32
    SFEA_PARTIAL_SYNC = 1_i32
    SFEA_ABORT = 2_i32
  end
  enum SYNC_RESOLVE_ACTION
    SRA_DEFER = 0_i32
    SRA_ACCEPT_DESTINATION_PROVIDER = 1_i32
    SRA_ACCEPT_SOURCE_PROVIDER = 2_i32
    SRA_MERGE = 3_i32
    SRA_TRANSFER_AND_DEFER = 4_i32
    SRA_LAST = 5_i32
  end
  enum SYNC_STATISTICS
    SYNC_STATISTICS_RANGE_COUNT = 0_i32
  end
  enum SYNC_SERIALIZATION_VERSION
    SYNC_SERIALIZATION_VERSION_V1 = 1_i32
    SYNC_SERIALIZATION_VERSION_V2 = 4_i32
    SYNC_SERIALIZATION_VERSION_V3 = 5_i32
  end
  enum FILTERING_TYPE
    FT_CURRENT_ITEMS_ONLY = 0_i32
    FT_CURRENT_ITEMS_AND_VERSIONS_FOR_MOVED_OUT_ITEMS = 1_i32
  end
  enum SYNC_CONSTRAINT_RESOLVE_ACTION
    SCRA_DEFER = 0_i32
    SCRA_ACCEPT_DESTINATION_PROVIDER = 1_i32
    SCRA_ACCEPT_SOURCE_PROVIDER = 2_i32
    SCRA_TRANSFER_AND_DEFER = 3_i32
    SCRA_MERGE = 4_i32
    SCRA_RENAME_SOURCE = 5_i32
    SCRA_RENAME_DESTINATION = 6_i32
  end
  enum CONSTRAINT_CONFLICT_REASON
    CCR_OTHER = 0_i32
    CCR_COLLISION = 1_i32
    CCR_NOPARENT = 2_i32
    CCR_IDENTITY = 3_i32
  end
  enum KNOWLEDGE_COOKIE_COMPARISON_RESULT
    KCCR_COOKIE_KNOWLEDGE_EQUAL = 0_i32
    KCCR_COOKIE_KNOWLEDGE_CONTAINED = 1_i32
    KCCR_COOKIE_KNOWLEDGE_CONTAINS = 2_i32
    KCCR_COOKIE_KNOWLEDGE_NOT_COMPARABLE = 3_i32
  end
  enum FILTER_COMBINATION_TYPE
    FCT_INTERSECTION = 0_i32
  end
  enum SYNC_REGISTRATION_EVENT
    SRE_PROVIDER_ADDED = 0_i32
    SRE_PROVIDER_REMOVED = 1_i32
    SRE_PROVIDER_UPDATED = 2_i32
    SRE_PROVIDER_STATE_CHANGED = 3_i32
    SRE_CONFIGUI_ADDED = 4_i32
    SRE_CONFIGUI_REMOVED = 5_i32
    SRE_CONFIGUI_UPDATED = 6_i32
  end

  @[Extern]
  struct ID_PARAMETER_PAIR
    property fIsVariable : Win32cr::Foundation::BOOL
    property cbIdSize : UInt16
    def initialize(@fIsVariable : Win32cr::Foundation::BOOL, @cbIdSize : UInt16)
    end
  end

  @[Extern]
  struct ID_PARAMETERS
    property dwSize : UInt32
    property replicaId : Win32cr::System::WindowsSync::ID_PARAMETER_PAIR
    property itemId : Win32cr::System::WindowsSync::ID_PARAMETER_PAIR
    property changeUnitId : Win32cr::System::WindowsSync::ID_PARAMETER_PAIR
    def initialize(@dwSize : UInt32, @replicaId : Win32cr::System::WindowsSync::ID_PARAMETER_PAIR, @itemId : Win32cr::System::WindowsSync::ID_PARAMETER_PAIR, @changeUnitId : Win32cr::System::WindowsSync::ID_PARAMETER_PAIR)
    end
  end

  @[Extern]
  struct SYNC_SESSION_STATISTICS
    property dwChangesApplied : UInt32
    property dwChangesFailed : UInt32
    def initialize(@dwChangesApplied : UInt32, @dwChangesFailed : UInt32)
    end
  end

  @[Extern]
  struct SYNC_VERSION
    property dwLastUpdatingReplicaKey : UInt32
    property ullTickCount : UInt64
    def initialize(@dwLastUpdatingReplicaKey : UInt32, @ullTickCount : UInt64)
    end
  end

  @[Extern]
  struct SYNC_RANGE
    property pbClosedLowerBound : UInt8*
    property pbClosedUpperBound : UInt8*
    def initialize(@pbClosedLowerBound : UInt8*, @pbClosedUpperBound : UInt8*)
    end
  end

  @[Extern]
  struct SYNC_TIME
    property dwDate : UInt32
    property dwTime : UInt32
    def initialize(@dwDate : UInt32, @dwTime : UInt32)
    end
  end

  @[Extern]
  struct SYNC_FILTER_CHANGE
    property fMoveIn : Win32cr::Foundation::BOOL
    property moveVersion : Win32cr::System::WindowsSync::SYNC_VERSION
    def initialize(@fMoveIn : Win32cr::Foundation::BOOL, @moveVersion : Win32cr::System::WindowsSync::SYNC_VERSION)
    end
  end

  @[Extern]
  struct SyncProviderConfiguration
    property dwVersion : UInt32
    property guidInstanceId : LibC::GUID
    property clsidProvider : LibC::GUID
    property guidConfigUIInstanceId : LibC::GUID
    property guidContentType : LibC::GUID
    property dwCapabilities : UInt32
    property dwSupportedArchitecture : UInt32
    def initialize(@dwVersion : UInt32, @guidInstanceId : LibC::GUID, @clsidProvider : LibC::GUID, @guidConfigUIInstanceId : LibC::GUID, @guidContentType : LibC::GUID, @dwCapabilities : UInt32, @dwSupportedArchitecture : UInt32)
    end
  end

  @[Extern]
  struct SyncProviderConfigUIConfiguration
    property dwVersion : UInt32
    property guidInstanceId : LibC::GUID
    property clsidConfigUI : LibC::GUID
    property guidContentType : LibC::GUID
    property dwCapabilities : UInt32
    property dwSupportedArchitecture : UInt32
    property fIsGlobal : Win32cr::Foundation::BOOL
    def initialize(@dwVersion : UInt32, @guidInstanceId : LibC::GUID, @clsidConfigUI : LibC::GUID, @guidContentType : LibC::GUID, @dwCapabilities : UInt32, @dwSupportedArchitecture : UInt32, @fIsGlobal : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  record IClockVectorElementVtbl,
    query_interface : Proc(IClockVectorElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IClockVectorElement*, UInt32),
    release : Proc(IClockVectorElement*, UInt32),
    get_replica_key : Proc(IClockVectorElement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_tick_count : Proc(IClockVectorElement*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IClockVectorElement, lpVtbl : IClockVectorElementVtbl* do
    GUID = LibC::GUID.new(0xe71c4250_u32, 0xadf8_u16, 0x4a07_u16, StaticArray[0x8f_u8, 0xae_u8, 0x56_u8, 0x69_u8, 0x59_u8, 0x69_u8, 0x9_u8, 0xc1_u8])
    def query_interface(this : IClockVectorElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IClockVectorElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IClockVectorElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_replica_key(this : IClockVectorElement*, pdwReplicaKey : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_replica_key.call(this, pdwReplicaKey)
    end
    def get_tick_count(this : IClockVectorElement*, pullTickCount : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tick_count.call(this, pullTickCount)
    end

  end

  @[Extern]
  record IFeedClockVectorElementVtbl,
    query_interface : Proc(IFeedClockVectorElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFeedClockVectorElement*, UInt32),
    release : Proc(IFeedClockVectorElement*, UInt32),
    get_replica_key : Proc(IFeedClockVectorElement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_tick_count : Proc(IFeedClockVectorElement*, UInt64*, Win32cr::Foundation::HRESULT),
    get_sync_time : Proc(IFeedClockVectorElement*, Win32cr::System::WindowsSync::SYNC_TIME*, Win32cr::Foundation::HRESULT),
    get_flags : Proc(IFeedClockVectorElement*, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFeedClockVectorElement, lpVtbl : IFeedClockVectorElementVtbl* do
    GUID = LibC::GUID.new(0xa40b46d2_u32, 0xe97b_u16, 0x4156_u16, StaticArray[0xb6_u8, 0xda_u8, 0x99_u8, 0x1f_u8, 0x50_u8, 0x1b_u8, 0xf_u8, 0x5_u8])
    def query_interface(this : IFeedClockVectorElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFeedClockVectorElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFeedClockVectorElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_replica_key(this : IFeedClockVectorElement*, pdwReplicaKey : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_replica_key.call(this, pdwReplicaKey)
    end
    def get_tick_count(this : IFeedClockVectorElement*, pullTickCount : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tick_count.call(this, pullTickCount)
    end
    def get_sync_time(this : IFeedClockVectorElement*, pSyncTime : Win32cr::System::WindowsSync::SYNC_TIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_time.call(this, pSyncTime)
    end
    def get_flags(this : IFeedClockVectorElement*, pbFlags : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pbFlags)
    end

  end

  @[Extern]
  record IClockVectorVtbl,
    query_interface : Proc(IClockVector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IClockVector*, UInt32),
    release : Proc(IClockVector*, UInt32),
    get_clock_vector_elements : Proc(IClockVector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_clock_vector_element_count : Proc(IClockVector*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IClockVector, lpVtbl : IClockVectorVtbl* do
    GUID = LibC::GUID.new(0x14b2274a_u32, 0x8698_u16, 0x4cc6_u16, StaticArray[0x93_u8, 0x33_u8, 0xf8_u8, 0x9b_u8, 0xd1_u8, 0xd4_u8, 0x7b_u8, 0xc4_u8])
    def query_interface(this : IClockVector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IClockVector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IClockVector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_clock_vector_elements(this : IClockVector*, riid : LibC::GUID*, ppiEnumClockVector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clock_vector_elements.call(this, riid, ppiEnumClockVector)
    end
    def get_clock_vector_element_count(this : IClockVector*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clock_vector_element_count.call(this, pdwCount)
    end

  end

  @[Extern]
  record IFeedClockVectorVtbl,
    query_interface : Proc(IFeedClockVector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFeedClockVector*, UInt32),
    release : Proc(IFeedClockVector*, UInt32),
    get_clock_vector_elements : Proc(IFeedClockVector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_clock_vector_element_count : Proc(IFeedClockVector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_update_count : Proc(IFeedClockVector*, UInt32*, Win32cr::Foundation::HRESULT),
    is_no_conflicts_specified : Proc(IFeedClockVector*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFeedClockVector, lpVtbl : IFeedClockVectorVtbl* do
    GUID = LibC::GUID.new(0x8d1d98d1_u32, 0x9fb8_u16, 0x4ec9_u16, StaticArray[0xa5_u8, 0x53_u8, 0x54_u8, 0xdd_u8, 0x92_u8, 0x4e_u8, 0xf_u8, 0x67_u8])
    def query_interface(this : IFeedClockVector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFeedClockVector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFeedClockVector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_clock_vector_elements(this : IFeedClockVector*, riid : LibC::GUID*, ppiEnumClockVector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clock_vector_elements.call(this, riid, ppiEnumClockVector)
    end
    def get_clock_vector_element_count(this : IFeedClockVector*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clock_vector_element_count.call(this, pdwCount)
    end
    def get_update_count(this : IFeedClockVector*, pdwUpdateCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_count.call(this, pdwUpdateCount)
    end
    def is_no_conflicts_specified(this : IFeedClockVector*, pfIsNoConflictsSpecified : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_no_conflicts_specified.call(this, pfIsNoConflictsSpecified)
    end

  end

  @[Extern]
  record IEnumClockVectorVtbl,
    query_interface : Proc(IEnumClockVector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumClockVector*, UInt32),
    release : Proc(IEnumClockVector*, UInt32),
    next__ : Proc(IEnumClockVector*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumClockVector*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumClockVector*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumClockVector*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumClockVector, lpVtbl : IEnumClockVectorVtbl* do
    GUID = LibC::GUID.new(0x525844db_u32, 0x2837_u16, 0x4799_u16, StaticArray[0x9e_u8, 0x80_u8, 0x81_u8, 0xa6_u8, 0x6e_u8, 0x2_u8, 0x22_u8, 0xc_u8])
    def query_interface(this : IEnumClockVector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumClockVector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumClockVector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumClockVector*, cClockVectorElements : UInt32, ppiClockVectorElements : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cClockVectorElements, ppiClockVectorElements, pcFetched)
    end
    def skip(this : IEnumClockVector*, cSyncVersions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cSyncVersions)
    end
    def reset(this : IEnumClockVector*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumClockVector*, ppiEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppiEnum)
    end

  end

  @[Extern]
  record IEnumFeedClockVectorVtbl,
    query_interface : Proc(IEnumFeedClockVector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumFeedClockVector*, UInt32),
    release : Proc(IEnumFeedClockVector*, UInt32),
    next__ : Proc(IEnumFeedClockVector*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumFeedClockVector*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumFeedClockVector*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumFeedClockVector*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumFeedClockVector, lpVtbl : IEnumFeedClockVectorVtbl* do
    GUID = LibC::GUID.new(0x550f763d_u32, 0x146a_u16, 0x48f6_u16, StaticArray[0xab_u8, 0xeb_u8, 0x6c_u8, 0x88_u8, 0xc7_u8, 0xf7_u8, 0x5_u8, 0x14_u8])
    def query_interface(this : IEnumFeedClockVector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumFeedClockVector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumFeedClockVector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumFeedClockVector*, cClockVectorElements : UInt32, ppiClockVectorElements : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cClockVectorElements, ppiClockVectorElements, pcFetched)
    end
    def skip(this : IEnumFeedClockVector*, cSyncVersions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cSyncVersions)
    end
    def reset(this : IEnumFeedClockVector*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumFeedClockVector*, ppiEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppiEnum)
    end

  end

  @[Extern]
  record ICoreFragmentVtbl,
    query_interface : Proc(ICoreFragment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICoreFragment*, UInt32),
    release : Proc(ICoreFragment*, UInt32),
    next_column : Proc(ICoreFragment*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    next_range : Proc(ICoreFragment*, UInt8*, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    reset : Proc(ICoreFragment*, Win32cr::Foundation::HRESULT),
    get_column_count : Proc(ICoreFragment*, UInt32*, Win32cr::Foundation::HRESULT),
    get_range_count : Proc(ICoreFragment*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICoreFragment, lpVtbl : ICoreFragmentVtbl* do
    GUID = LibC::GUID.new(0x613b2ab5_u32, 0xb304_u16, 0x47d9_u16, StaticArray[0x9c_u8, 0x31_u8, 0xce_u8, 0x6c_u8, 0x54_u8, 0x40_u8, 0x1a_u8, 0x15_u8])
    def query_interface(this : ICoreFragment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICoreFragment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICoreFragment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next_column(this : ICoreFragment*, pChangeUnitId : UInt8*, pChangeUnitIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next_column.call(this, pChangeUnitId, pChangeUnitIdSize)
    end
    def next_range(this : ICoreFragment*, pItemId : UInt8*, pItemIdSize : UInt32*, piClockVector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next_range.call(this, pItemId, pItemIdSize, piClockVector)
    end
    def reset(this : ICoreFragment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def get_column_count(this : ICoreFragment*, pColumnCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_count.call(this, pColumnCount)
    end
    def get_range_count(this : ICoreFragment*, pRangeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range_count.call(this, pRangeCount)
    end

  end

  @[Extern]
  record ICoreFragmentInspectorVtbl,
    query_interface : Proc(ICoreFragmentInspector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICoreFragmentInspector*, UInt32),
    release : Proc(ICoreFragmentInspector*, UInt32),
    next_core_fragments : Proc(ICoreFragmentInspector*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(ICoreFragmentInspector*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICoreFragmentInspector, lpVtbl : ICoreFragmentInspectorVtbl* do
    GUID = LibC::GUID.new(0xf7fcc5fd_u32, 0xae26_u16, 0x4679_u16, StaticArray[0xba_u8, 0x16_u8, 0x96_u8, 0xaa_u8, 0xc5_u8, 0x83_u8, 0xc1_u8, 0x34_u8])
    def query_interface(this : ICoreFragmentInspector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICoreFragmentInspector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICoreFragmentInspector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next_core_fragments(this : ICoreFragmentInspector*, requestedCount : UInt32, ppiCoreFragments : Void**, pFetchedCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next_core_fragments.call(this, requestedCount, ppiCoreFragments, pFetchedCount)
    end
    def reset(this : ICoreFragmentInspector*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record IRangeExceptionVtbl,
    query_interface : Proc(IRangeException*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRangeException*, UInt32),
    release : Proc(IRangeException*, UInt32),
    get_closed_range_start : Proc(IRangeException*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_closed_range_end : Proc(IRangeException*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_clock_vector : Proc(IRangeException*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRangeException, lpVtbl : IRangeExceptionVtbl* do
    GUID = LibC::GUID.new(0x75ae8777_u32, 0x6848_u16, 0x49f7_u16, StaticArray[0x95_u8, 0x6c_u8, 0xa3_u8, 0xa9_u8, 0x2f_u8, 0x50_u8, 0x96_u8, 0xe8_u8])
    def query_interface(this : IRangeException*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRangeException*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRangeException*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_closed_range_start(this : IRangeException*, pbClosedRangeStart : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closed_range_start.call(this, pbClosedRangeStart, pcbIdSize)
    end
    def get_closed_range_end(this : IRangeException*, pbClosedRangeEnd : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closed_range_end.call(this, pbClosedRangeEnd, pcbIdSize)
    end
    def get_clock_vector(this : IRangeException*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clock_vector.call(this, riid, ppUnk)
    end

  end

  @[Extern]
  record IEnumRangeExceptionsVtbl,
    query_interface : Proc(IEnumRangeExceptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumRangeExceptions*, UInt32),
    release : Proc(IEnumRangeExceptions*, UInt32),
    next__ : Proc(IEnumRangeExceptions*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumRangeExceptions*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumRangeExceptions*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumRangeExceptions*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumRangeExceptions, lpVtbl : IEnumRangeExceptionsVtbl* do
    GUID = LibC::GUID.new(0x944439f_u32, 0xddb1_u16, 0x4176_u16, StaticArray[0xb7_u8, 0x3_u8, 0x4_u8, 0x6f_u8, 0xf2_u8, 0x2a_u8, 0x23_u8, 0x86_u8])
    def query_interface(this : IEnumRangeExceptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumRangeExceptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumRangeExceptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumRangeExceptions*, cExceptions : UInt32, ppRangeException : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cExceptions, ppRangeException, pcFetched)
    end
    def skip(this : IEnumRangeExceptions*, cExceptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cExceptions)
    end
    def reset(this : IEnumRangeExceptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumRangeExceptions*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record ISingleItemExceptionVtbl,
    query_interface : Proc(ISingleItemException*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISingleItemException*, UInt32),
    release : Proc(ISingleItemException*, UInt32),
    get_item_id : Proc(ISingleItemException*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_clock_vector : Proc(ISingleItemException*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISingleItemException, lpVtbl : ISingleItemExceptionVtbl* do
    GUID = LibC::GUID.new(0x892fb9b0_u32, 0x7c55_u16, 0x4a18_u16, StaticArray[0x93_u8, 0x16_u8, 0xfd_u8, 0xf4_u8, 0x49_u8, 0x56_u8, 0x9b_u8, 0x64_u8])
    def query_interface(this : ISingleItemException*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISingleItemException*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISingleItemException*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_id(this : ISingleItemException*, pbItemId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_id.call(this, pbItemId, pcbIdSize)
    end
    def get_clock_vector(this : ISingleItemException*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clock_vector.call(this, riid, ppUnk)
    end

  end

  @[Extern]
  record IEnumSingleItemExceptionsVtbl,
    query_interface : Proc(IEnumSingleItemExceptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSingleItemExceptions*, UInt32),
    release : Proc(IEnumSingleItemExceptions*, UInt32),
    next__ : Proc(IEnumSingleItemExceptions*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSingleItemExceptions*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSingleItemExceptions*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSingleItemExceptions*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSingleItemExceptions, lpVtbl : IEnumSingleItemExceptionsVtbl* do
    GUID = LibC::GUID.new(0xe563381c_u32, 0x1b4d_u16, 0x4c66_u16, StaticArray[0x97_u8, 0x96_u8, 0xc8_u8, 0x6f_u8, 0xac_u8, 0xcd_u8, 0xcd_u8, 0x40_u8])
    def query_interface(this : IEnumSingleItemExceptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSingleItemExceptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSingleItemExceptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSingleItemExceptions*, cExceptions : UInt32, ppSingleItemException : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cExceptions, ppSingleItemException, pcFetched)
    end
    def skip(this : IEnumSingleItemExceptions*, cExceptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cExceptions)
    end
    def reset(this : IEnumSingleItemExceptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSingleItemExceptions*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IChangeUnitExceptionVtbl,
    query_interface : Proc(IChangeUnitException*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IChangeUnitException*, UInt32),
    release : Proc(IChangeUnitException*, UInt32),
    get_item_id : Proc(IChangeUnitException*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_change_unit_id : Proc(IChangeUnitException*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_clock_vector : Proc(IChangeUnitException*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IChangeUnitException, lpVtbl : IChangeUnitExceptionVtbl* do
    GUID = LibC::GUID.new(0xcd7ee7c_u32, 0xfec0_u16, 0x4021_u16, StaticArray[0x99_u8, 0xee_u8, 0xf0_u8, 0xe5_u8, 0x34_u8, 0x8f_u8, 0x2a_u8, 0x5f_u8])
    def query_interface(this : IChangeUnitException*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IChangeUnitException*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IChangeUnitException*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_id(this : IChangeUnitException*, pbItemId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_id.call(this, pbItemId, pcbIdSize)
    end
    def get_change_unit_id(this : IChangeUnitException*, pbChangeUnitId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_unit_id.call(this, pbChangeUnitId, pcbIdSize)
    end
    def get_clock_vector(this : IChangeUnitException*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clock_vector.call(this, riid, ppUnk)
    end

  end

  @[Extern]
  record IEnumChangeUnitExceptionsVtbl,
    query_interface : Proc(IEnumChangeUnitExceptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumChangeUnitExceptions*, UInt32),
    release : Proc(IEnumChangeUnitExceptions*, UInt32),
    next__ : Proc(IEnumChangeUnitExceptions*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumChangeUnitExceptions*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumChangeUnitExceptions*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumChangeUnitExceptions*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumChangeUnitExceptions, lpVtbl : IEnumChangeUnitExceptionsVtbl* do
    GUID = LibC::GUID.new(0x3074e802_u32, 0x9319_u16, 0x4420_u16, StaticArray[0xbe_u8, 0x21_u8, 0x10_u8, 0x22_u8, 0xe2_u8, 0xe2_u8, 0x1d_u8, 0xa8_u8])
    def query_interface(this : IEnumChangeUnitExceptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumChangeUnitExceptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumChangeUnitExceptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumChangeUnitExceptions*, cExceptions : UInt32, ppChangeUnitException : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cExceptions, ppChangeUnitException, pcFetched)
    end
    def skip(this : IEnumChangeUnitExceptions*, cExceptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cExceptions)
    end
    def reset(this : IEnumChangeUnitExceptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumChangeUnitExceptions*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IReplicaKeyMapVtbl,
    query_interface : Proc(IReplicaKeyMap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReplicaKeyMap*, UInt32),
    release : Proc(IReplicaKeyMap*, UInt32),
    lookup_replica_key : Proc(IReplicaKeyMap*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    lookup_replica_id : Proc(IReplicaKeyMap*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    serialize : Proc(IReplicaKeyMap*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IReplicaKeyMap, lpVtbl : IReplicaKeyMapVtbl* do
    GUID = LibC::GUID.new(0x2209f4fc_u32, 0xfd10_u16, 0x4ff0_u16, StaticArray[0x84_u8, 0xa8_u8, 0xf0_u8, 0xa1_u8, 0x98_u8, 0x2e_u8, 0x44_u8, 0xe_u8])
    def query_interface(this : IReplicaKeyMap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReplicaKeyMap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReplicaKeyMap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def lookup_replica_key(this : IReplicaKeyMap*, pbReplicaId : UInt8*, pdwReplicaKey : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_replica_key.call(this, pbReplicaId, pdwReplicaKey)
    end
    def lookup_replica_id(this : IReplicaKeyMap*, dwReplicaKey : UInt32, pbReplicaId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_replica_id.call(this, dwReplicaKey, pbReplicaId, pcbIdSize)
    end
    def serialize(this : IReplicaKeyMap*, pbReplicaKeyMap : UInt8*, pcbReplicaKeyMap : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbReplicaKeyMap, pcbReplicaKeyMap)
    end

  end

  @[Extern]
  record IConstructReplicaKeyMapVtbl,
    query_interface : Proc(IConstructReplicaKeyMap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConstructReplicaKeyMap*, UInt32),
    release : Proc(IConstructReplicaKeyMap*, UInt32),
    find_or_add_replica : Proc(IConstructReplicaKeyMap*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConstructReplicaKeyMap, lpVtbl : IConstructReplicaKeyMapVtbl* do
    GUID = LibC::GUID.new(0xded10970_u32, 0xec85_u16, 0x4115_u16, StaticArray[0xb5_u8, 0x2c_u8, 0x44_u8, 0x5_u8, 0x84_u8, 0x56_u8, 0x42_u8, 0xa5_u8])
    def query_interface(this : IConstructReplicaKeyMap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConstructReplicaKeyMap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConstructReplicaKeyMap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_or_add_replica(this : IConstructReplicaKeyMap*, pbReplicaId : UInt8*, pdwReplicaKey : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_or_add_replica.call(this, pbReplicaId, pdwReplicaKey)
    end

  end

  @[Extern]
  record ISyncKnowledgeVtbl,
    query_interface : Proc(ISyncKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncKnowledge*, UInt32),
    release : Proc(ISyncKnowledge*, UInt32),
    get_owner_replica_id : Proc(ISyncKnowledge*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncKnowledge*, Win32cr::Foundation::BOOL, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_local_tick_count : Proc(ISyncKnowledge*, UInt64, Win32cr::Foundation::HRESULT),
    contains_change : Proc(ISyncKnowledge*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    contains_change_unit : Proc(ISyncKnowledge*, UInt8*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    get_scope_vector : Proc(ISyncKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_replica_key_map : Proc(ISyncKnowledge*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(ISyncKnowledge*, Void**, Win32cr::Foundation::HRESULT),
    convert_version : Proc(ISyncKnowledge*, Void*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt8*, UInt32*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    map_remote_to_local : Proc(ISyncKnowledge*, Void*, Void**, Win32cr::Foundation::HRESULT),
    union__ : Proc(ISyncKnowledge*, Void*, Win32cr::Foundation::HRESULT),
    project_onto_item : Proc(ISyncKnowledge*, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    project_onto_change_unit : Proc(ISyncKnowledge*, UInt8*, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    project_onto_range : Proc(ISyncKnowledge*, Win32cr::System::WindowsSync::SYNC_RANGE*, Void**, Win32cr::Foundation::HRESULT),
    exclude_item : Proc(ISyncKnowledge*, UInt8*, Win32cr::Foundation::HRESULT),
    exclude_change_unit : Proc(ISyncKnowledge*, UInt8*, UInt8*, Win32cr::Foundation::HRESULT),
    contains_knowledge : Proc(ISyncKnowledge*, Void*, Win32cr::Foundation::HRESULT),
    find_min_tick_count_for_replica : Proc(ISyncKnowledge*, UInt8*, UInt64*, Win32cr::Foundation::HRESULT),
    get_range_exceptions : Proc(ISyncKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_single_item_exceptions : Proc(ISyncKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_change_unit_exceptions : Proc(ISyncKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    find_clock_vector_for_item : Proc(ISyncKnowledge*, UInt8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    find_clock_vector_for_change_unit : Proc(ISyncKnowledge*, UInt8*, UInt8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_version : Proc(ISyncKnowledge*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncKnowledge, lpVtbl : ISyncKnowledgeVtbl* do
    GUID = LibC::GUID.new(0x615bbb53_u32, 0xc945_u16, 0x4203_u16, StaticArray[0xbf_u8, 0x4b_u8, 0x2c_u8, 0xb6_u8, 0x59_u8, 0x19_u8, 0xa0_u8, 0xaa_u8])
    def query_interface(this : ISyncKnowledge*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncKnowledge*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncKnowledge*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner_replica_id(this : ISyncKnowledge*, pbReplicaId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner_replica_id.call(this, pbReplicaId, pcbIdSize)
    end
    def serialize(this : ISyncKnowledge*, fSerializeReplicaKeyMap : Win32cr::Foundation::BOOL, pbKnowledge : UInt8*, pcbKnowledge : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, fSerializeReplicaKeyMap, pbKnowledge, pcbKnowledge)
    end
    def set_local_tick_count(this : ISyncKnowledge*, ullTickCount : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_tick_count.call(this, ullTickCount)
    end
    def contains_change(this : ISyncKnowledge*, pbVersionOwnerReplicaId : UInt8*, pgidItemId : UInt8*, pSyncVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_change.call(this, pbVersionOwnerReplicaId, pgidItemId, pSyncVersion)
    end
    def contains_change_unit(this : ISyncKnowledge*, pbVersionOwnerReplicaId : UInt8*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, pSyncVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_change_unit.call(this, pbVersionOwnerReplicaId, pbItemId, pbChangeUnitId, pSyncVersion)
    end
    def get_scope_vector(this : ISyncKnowledge*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scope_vector.call(this, riid, ppUnk)
    end
    def get_replica_key_map(this : ISyncKnowledge*, ppReplicaKeyMap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_replica_key_map.call(this, ppReplicaKeyMap)
    end
    def clone(this : ISyncKnowledge*, ppClonedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppClonedKnowledge)
    end
    def convert_version(this : ISyncKnowledge*, pKnowledgeIn : Void*, pbCurrentOwnerId : UInt8*, pVersionIn : Win32cr::System::WindowsSync::SYNC_VERSION*, pbNewOwnerId : UInt8*, pcbIdSize : UInt32*, pVersionOut : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_version.call(this, pKnowledgeIn, pbCurrentOwnerId, pVersionIn, pbNewOwnerId, pcbIdSize, pVersionOut)
    end
    def map_remote_to_local(this : ISyncKnowledge*, pRemoteKnowledge : Void*, ppMappedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map_remote_to_local.call(this, pRemoteKnowledge, ppMappedKnowledge)
    end
    def union__(this : ISyncKnowledge*, pKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.union__.call(this, pKnowledge)
    end
    def project_onto_item(this : ISyncKnowledge*, pbItemId : UInt8*, ppKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_item.call(this, pbItemId, ppKnowledgeOut)
    end
    def project_onto_change_unit(this : ISyncKnowledge*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, ppKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_change_unit.call(this, pbItemId, pbChangeUnitId, ppKnowledgeOut)
    end
    def project_onto_range(this : ISyncKnowledge*, psrngSyncRange : Win32cr::System::WindowsSync::SYNC_RANGE*, ppKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_range.call(this, psrngSyncRange, ppKnowledgeOut)
    end
    def exclude_item(this : ISyncKnowledge*, pbItemId : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exclude_item.call(this, pbItemId)
    end
    def exclude_change_unit(this : ISyncKnowledge*, pbItemId : UInt8*, pbChangeUnitId : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exclude_change_unit.call(this, pbItemId, pbChangeUnitId)
    end
    def contains_knowledge(this : ISyncKnowledge*, pKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_knowledge.call(this, pKnowledge)
    end
    def find_min_tick_count_for_replica(this : ISyncKnowledge*, pbReplicaId : UInt8*, pullReplicaTickCount : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_min_tick_count_for_replica.call(this, pbReplicaId, pullReplicaTickCount)
    end
    def get_range_exceptions(this : ISyncKnowledge*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range_exceptions.call(this, riid, ppUnk)
    end
    def get_single_item_exceptions(this : ISyncKnowledge*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_single_item_exceptions.call(this, riid, ppUnk)
    end
    def get_change_unit_exceptions(this : ISyncKnowledge*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_unit_exceptions.call(this, riid, ppUnk)
    end
    def find_clock_vector_for_item(this : ISyncKnowledge*, pbItemId : UInt8*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_clock_vector_for_item.call(this, pbItemId, riid, ppUnk)
    end
    def find_clock_vector_for_change_unit(this : ISyncKnowledge*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_clock_vector_for_change_unit.call(this, pbItemId, pbChangeUnitId, riid, ppUnk)
    end
    def get_version(this : ISyncKnowledge*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end

  end

  @[Extern]
  record IForgottenKnowledgeVtbl,
    query_interface : Proc(IForgottenKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IForgottenKnowledge*, UInt32),
    release : Proc(IForgottenKnowledge*, UInt32),
    get_owner_replica_id : Proc(IForgottenKnowledge*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    serialize : Proc(IForgottenKnowledge*, Win32cr::Foundation::BOOL, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_local_tick_count : Proc(IForgottenKnowledge*, UInt64, Win32cr::Foundation::HRESULT),
    contains_change : Proc(IForgottenKnowledge*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    contains_change_unit : Proc(IForgottenKnowledge*, UInt8*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    get_scope_vector : Proc(IForgottenKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_replica_key_map : Proc(IForgottenKnowledge*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(IForgottenKnowledge*, Void**, Win32cr::Foundation::HRESULT),
    convert_version : Proc(IForgottenKnowledge*, Void*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt8*, UInt32*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    map_remote_to_local : Proc(IForgottenKnowledge*, Void*, Void**, Win32cr::Foundation::HRESULT),
    union__ : Proc(IForgottenKnowledge*, Void*, Win32cr::Foundation::HRESULT),
    project_onto_item : Proc(IForgottenKnowledge*, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    project_onto_change_unit : Proc(IForgottenKnowledge*, UInt8*, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    project_onto_range : Proc(IForgottenKnowledge*, Win32cr::System::WindowsSync::SYNC_RANGE*, Void**, Win32cr::Foundation::HRESULT),
    exclude_item : Proc(IForgottenKnowledge*, UInt8*, Win32cr::Foundation::HRESULT),
    exclude_change_unit : Proc(IForgottenKnowledge*, UInt8*, UInt8*, Win32cr::Foundation::HRESULT),
    contains_knowledge : Proc(IForgottenKnowledge*, Void*, Win32cr::Foundation::HRESULT),
    find_min_tick_count_for_replica : Proc(IForgottenKnowledge*, UInt8*, UInt64*, Win32cr::Foundation::HRESULT),
    get_range_exceptions : Proc(IForgottenKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_single_item_exceptions : Proc(IForgottenKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_change_unit_exceptions : Proc(IForgottenKnowledge*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    find_clock_vector_for_item : Proc(IForgottenKnowledge*, UInt8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    find_clock_vector_for_change_unit : Proc(IForgottenKnowledge*, UInt8*, UInt8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_version : Proc(IForgottenKnowledge*, UInt32*, Win32cr::Foundation::HRESULT),
    forget_to_version : Proc(IForgottenKnowledge*, Void*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IForgottenKnowledge, lpVtbl : IForgottenKnowledgeVtbl* do
    GUID = LibC::GUID.new(0x456e0f96_u32, 0x6036_u16, 0x452b_u16, StaticArray[0x9f_u8, 0x9d_u8, 0xbc_u8, 0xc4_u8, 0xb4_u8, 0xa8_u8, 0x5d_u8, 0xb2_u8])
    def query_interface(this : IForgottenKnowledge*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IForgottenKnowledge*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IForgottenKnowledge*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner_replica_id(this : IForgottenKnowledge*, pbReplicaId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner_replica_id.call(this, pbReplicaId, pcbIdSize)
    end
    def serialize(this : IForgottenKnowledge*, fSerializeReplicaKeyMap : Win32cr::Foundation::BOOL, pbKnowledge : UInt8*, pcbKnowledge : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, fSerializeReplicaKeyMap, pbKnowledge, pcbKnowledge)
    end
    def set_local_tick_count(this : IForgottenKnowledge*, ullTickCount : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_tick_count.call(this, ullTickCount)
    end
    def contains_change(this : IForgottenKnowledge*, pbVersionOwnerReplicaId : UInt8*, pgidItemId : UInt8*, pSyncVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_change.call(this, pbVersionOwnerReplicaId, pgidItemId, pSyncVersion)
    end
    def contains_change_unit(this : IForgottenKnowledge*, pbVersionOwnerReplicaId : UInt8*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, pSyncVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_change_unit.call(this, pbVersionOwnerReplicaId, pbItemId, pbChangeUnitId, pSyncVersion)
    end
    def get_scope_vector(this : IForgottenKnowledge*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scope_vector.call(this, riid, ppUnk)
    end
    def get_replica_key_map(this : IForgottenKnowledge*, ppReplicaKeyMap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_replica_key_map.call(this, ppReplicaKeyMap)
    end
    def clone(this : IForgottenKnowledge*, ppClonedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppClonedKnowledge)
    end
    def convert_version(this : IForgottenKnowledge*, pKnowledgeIn : Void*, pbCurrentOwnerId : UInt8*, pVersionIn : Win32cr::System::WindowsSync::SYNC_VERSION*, pbNewOwnerId : UInt8*, pcbIdSize : UInt32*, pVersionOut : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_version.call(this, pKnowledgeIn, pbCurrentOwnerId, pVersionIn, pbNewOwnerId, pcbIdSize, pVersionOut)
    end
    def map_remote_to_local(this : IForgottenKnowledge*, pRemoteKnowledge : Void*, ppMappedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map_remote_to_local.call(this, pRemoteKnowledge, ppMappedKnowledge)
    end
    def union__(this : IForgottenKnowledge*, pKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.union__.call(this, pKnowledge)
    end
    def project_onto_item(this : IForgottenKnowledge*, pbItemId : UInt8*, ppKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_item.call(this, pbItemId, ppKnowledgeOut)
    end
    def project_onto_change_unit(this : IForgottenKnowledge*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, ppKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_change_unit.call(this, pbItemId, pbChangeUnitId, ppKnowledgeOut)
    end
    def project_onto_range(this : IForgottenKnowledge*, psrngSyncRange : Win32cr::System::WindowsSync::SYNC_RANGE*, ppKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_range.call(this, psrngSyncRange, ppKnowledgeOut)
    end
    def exclude_item(this : IForgottenKnowledge*, pbItemId : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exclude_item.call(this, pbItemId)
    end
    def exclude_change_unit(this : IForgottenKnowledge*, pbItemId : UInt8*, pbChangeUnitId : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exclude_change_unit.call(this, pbItemId, pbChangeUnitId)
    end
    def contains_knowledge(this : IForgottenKnowledge*, pKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_knowledge.call(this, pKnowledge)
    end
    def find_min_tick_count_for_replica(this : IForgottenKnowledge*, pbReplicaId : UInt8*, pullReplicaTickCount : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_min_tick_count_for_replica.call(this, pbReplicaId, pullReplicaTickCount)
    end
    def get_range_exceptions(this : IForgottenKnowledge*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range_exceptions.call(this, riid, ppUnk)
    end
    def get_single_item_exceptions(this : IForgottenKnowledge*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_single_item_exceptions.call(this, riid, ppUnk)
    end
    def get_change_unit_exceptions(this : IForgottenKnowledge*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_unit_exceptions.call(this, riid, ppUnk)
    end
    def find_clock_vector_for_item(this : IForgottenKnowledge*, pbItemId : UInt8*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_clock_vector_for_item.call(this, pbItemId, riid, ppUnk)
    end
    def find_clock_vector_for_change_unit(this : IForgottenKnowledge*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_clock_vector_for_change_unit.call(this, pbItemId, pbChangeUnitId, riid, ppUnk)
    end
    def get_version(this : IForgottenKnowledge*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def forget_to_version(this : IForgottenKnowledge*, pKnowledge : Void*, pVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.forget_to_version.call(this, pKnowledge, pVersion)
    end

  end

  @[Extern]
  record ISyncKnowledge2Vtbl,
    query_interface : Proc(ISyncKnowledge2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncKnowledge2*, UInt32),
    release : Proc(ISyncKnowledge2*, UInt32),
    get_owner_replica_id : Proc(ISyncKnowledge2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncKnowledge2*, Win32cr::Foundation::BOOL, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_local_tick_count : Proc(ISyncKnowledge2*, UInt64, Win32cr::Foundation::HRESULT),
    contains_change : Proc(ISyncKnowledge2*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    contains_change_unit : Proc(ISyncKnowledge2*, UInt8*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    get_scope_vector : Proc(ISyncKnowledge2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_replica_key_map : Proc(ISyncKnowledge2*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(ISyncKnowledge2*, Void**, Win32cr::Foundation::HRESULT),
    convert_version : Proc(ISyncKnowledge2*, Void*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt8*, UInt32*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    map_remote_to_local : Proc(ISyncKnowledge2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    union__ : Proc(ISyncKnowledge2*, Void*, Win32cr::Foundation::HRESULT),
    project_onto_item : Proc(ISyncKnowledge2*, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    project_onto_change_unit : Proc(ISyncKnowledge2*, UInt8*, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    project_onto_range : Proc(ISyncKnowledge2*, Win32cr::System::WindowsSync::SYNC_RANGE*, Void**, Win32cr::Foundation::HRESULT),
    exclude_item : Proc(ISyncKnowledge2*, UInt8*, Win32cr::Foundation::HRESULT),
    exclude_change_unit : Proc(ISyncKnowledge2*, UInt8*, UInt8*, Win32cr::Foundation::HRESULT),
    contains_knowledge : Proc(ISyncKnowledge2*, Void*, Win32cr::Foundation::HRESULT),
    find_min_tick_count_for_replica : Proc(ISyncKnowledge2*, UInt8*, UInt64*, Win32cr::Foundation::HRESULT),
    get_range_exceptions : Proc(ISyncKnowledge2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_single_item_exceptions : Proc(ISyncKnowledge2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_change_unit_exceptions : Proc(ISyncKnowledge2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    find_clock_vector_for_item : Proc(ISyncKnowledge2*, UInt8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    find_clock_vector_for_change_unit : Proc(ISyncKnowledge2*, UInt8*, UInt8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_version : Proc(ISyncKnowledge2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_id_parameters : Proc(ISyncKnowledge2*, Win32cr::System::WindowsSync::ID_PARAMETERS*, Win32cr::Foundation::HRESULT),
    project_onto_column_set : Proc(ISyncKnowledge2*, UInt8**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    serialize_with_options : Proc(ISyncKnowledge2*, Win32cr::System::WindowsSync::SYNC_SERIALIZATION_VERSION, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_lowest_uncontained_id : Proc(ISyncKnowledge2*, Void*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_inspector : Proc(ISyncKnowledge2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_minimum_supported_version : Proc(ISyncKnowledge2*, Win32cr::System::WindowsSync::SYNC_SERIALIZATION_VERSION*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(ISyncKnowledge2*, Win32cr::System::WindowsSync::SYNC_STATISTICS, UInt32*, Win32cr::Foundation::HRESULT),
    contains_knowledge_for_item : Proc(ISyncKnowledge2*, Void*, UInt8*, Win32cr::Foundation::HRESULT),
    contains_knowledge_for_change_unit : Proc(ISyncKnowledge2*, Void*, UInt8*, UInt8*, Win32cr::Foundation::HRESULT),
    project_onto_knowledge_with_prerequisite : Proc(ISyncKnowledge2*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    complement : Proc(ISyncKnowledge2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    intersects_with_knowledge : Proc(ISyncKnowledge2*, Void*, Win32cr::Foundation::HRESULT),
    get_knowledge_cookie : Proc(ISyncKnowledge2*, Void**, Win32cr::Foundation::HRESULT),
    compare_to_knowledge_cookie : Proc(ISyncKnowledge2*, Void*, Win32cr::System::WindowsSync::KNOWLEDGE_COOKIE_COMPARISON_RESULT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncKnowledge2, lpVtbl : ISyncKnowledge2Vtbl* do
    GUID = LibC::GUID.new(0xed0addc0_u32, 0x3b4b_u16, 0x46a1_u16, StaticArray[0x9a_u8, 0x45_u8, 0x45_u8, 0x66_u8, 0x1d_u8, 0x21_u8, 0x14_u8, 0xc8_u8])
    def query_interface(this : ISyncKnowledge2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncKnowledge2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncKnowledge2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner_replica_id(this : ISyncKnowledge2*, pbReplicaId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner_replica_id.call(this, pbReplicaId, pcbIdSize)
    end
    def serialize(this : ISyncKnowledge2*, fSerializeReplicaKeyMap : Win32cr::Foundation::BOOL, pbKnowledge : UInt8*, pcbKnowledge : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, fSerializeReplicaKeyMap, pbKnowledge, pcbKnowledge)
    end
    def set_local_tick_count(this : ISyncKnowledge2*, ullTickCount : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_tick_count.call(this, ullTickCount)
    end
    def contains_change(this : ISyncKnowledge2*, pbVersionOwnerReplicaId : UInt8*, pgidItemId : UInt8*, pSyncVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_change.call(this, pbVersionOwnerReplicaId, pgidItemId, pSyncVersion)
    end
    def contains_change_unit(this : ISyncKnowledge2*, pbVersionOwnerReplicaId : UInt8*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, pSyncVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_change_unit.call(this, pbVersionOwnerReplicaId, pbItemId, pbChangeUnitId, pSyncVersion)
    end
    def get_scope_vector(this : ISyncKnowledge2*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scope_vector.call(this, riid, ppUnk)
    end
    def get_replica_key_map(this : ISyncKnowledge2*, ppReplicaKeyMap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_replica_key_map.call(this, ppReplicaKeyMap)
    end
    def clone(this : ISyncKnowledge2*, ppClonedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppClonedKnowledge)
    end
    def convert_version(this : ISyncKnowledge2*, pKnowledgeIn : Void*, pbCurrentOwnerId : UInt8*, pVersionIn : Win32cr::System::WindowsSync::SYNC_VERSION*, pbNewOwnerId : UInt8*, pcbIdSize : UInt32*, pVersionOut : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_version.call(this, pKnowledgeIn, pbCurrentOwnerId, pVersionIn, pbNewOwnerId, pcbIdSize, pVersionOut)
    end
    def map_remote_to_local(this : ISyncKnowledge2*, pRemoteKnowledge : Void*, ppMappedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map_remote_to_local.call(this, pRemoteKnowledge, ppMappedKnowledge)
    end
    def union__(this : ISyncKnowledge2*, pKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.union__.call(this, pKnowledge)
    end
    def project_onto_item(this : ISyncKnowledge2*, pbItemId : UInt8*, ppKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_item.call(this, pbItemId, ppKnowledgeOut)
    end
    def project_onto_change_unit(this : ISyncKnowledge2*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, ppKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_change_unit.call(this, pbItemId, pbChangeUnitId, ppKnowledgeOut)
    end
    def project_onto_range(this : ISyncKnowledge2*, psrngSyncRange : Win32cr::System::WindowsSync::SYNC_RANGE*, ppKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_range.call(this, psrngSyncRange, ppKnowledgeOut)
    end
    def exclude_item(this : ISyncKnowledge2*, pbItemId : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exclude_item.call(this, pbItemId)
    end
    def exclude_change_unit(this : ISyncKnowledge2*, pbItemId : UInt8*, pbChangeUnitId : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exclude_change_unit.call(this, pbItemId, pbChangeUnitId)
    end
    def contains_knowledge(this : ISyncKnowledge2*, pKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_knowledge.call(this, pKnowledge)
    end
    def find_min_tick_count_for_replica(this : ISyncKnowledge2*, pbReplicaId : UInt8*, pullReplicaTickCount : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_min_tick_count_for_replica.call(this, pbReplicaId, pullReplicaTickCount)
    end
    def get_range_exceptions(this : ISyncKnowledge2*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range_exceptions.call(this, riid, ppUnk)
    end
    def get_single_item_exceptions(this : ISyncKnowledge2*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_single_item_exceptions.call(this, riid, ppUnk)
    end
    def get_change_unit_exceptions(this : ISyncKnowledge2*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_unit_exceptions.call(this, riid, ppUnk)
    end
    def find_clock_vector_for_item(this : ISyncKnowledge2*, pbItemId : UInt8*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_clock_vector_for_item.call(this, pbItemId, riid, ppUnk)
    end
    def find_clock_vector_for_change_unit(this : ISyncKnowledge2*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_clock_vector_for_change_unit.call(this, pbItemId, pbChangeUnitId, riid, ppUnk)
    end
    def get_version(this : ISyncKnowledge2*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_id_parameters(this : ISyncKnowledge2*, pIdParameters : Win32cr::System::WindowsSync::ID_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id_parameters.call(this, pIdParameters)
    end
    def project_onto_column_set(this : ISyncKnowledge2*, ppColumns : UInt8**, count : UInt32, ppiKnowledgeOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_column_set.call(this, ppColumns, count, ppiKnowledgeOut)
    end
    def serialize_with_options(this : ISyncKnowledge2*, targetFormatVersion : Win32cr::System::WindowsSync::SYNC_SERIALIZATION_VERSION, dwFlags : UInt32, pbBuffer : UInt8*, pdwSerializedSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize_with_options.call(this, targetFormatVersion, dwFlags, pbBuffer, pdwSerializedSize)
    end
    def get_lowest_uncontained_id(this : ISyncKnowledge2*, piSyncKnowledge : Void*, pbItemId : UInt8*, pcbItemIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lowest_uncontained_id.call(this, piSyncKnowledge, pbItemId, pcbItemIdSize)
    end
    def get_inspector(this : ISyncKnowledge2*, riid : LibC::GUID*, ppiInspector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inspector.call(this, riid, ppiInspector)
    end
    def get_minimum_supported_version(this : ISyncKnowledge2*, pVersion : Win32cr::System::WindowsSync::SYNC_SERIALIZATION_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_minimum_supported_version.call(this, pVersion)
    end
    def get_statistics(this : ISyncKnowledge2*, which : Win32cr::System::WindowsSync::SYNC_STATISTICS, pValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, which, pValue)
    end
    def contains_knowledge_for_item(this : ISyncKnowledge2*, pKnowledge : Void*, pbItemId : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_knowledge_for_item.call(this, pKnowledge, pbItemId)
    end
    def contains_knowledge_for_change_unit(this : ISyncKnowledge2*, pKnowledge : Void*, pbItemId : UInt8*, pbChangeUnitId : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.contains_knowledge_for_change_unit.call(this, pKnowledge, pbItemId, pbChangeUnitId)
    end
    def project_onto_knowledge_with_prerequisite(this : ISyncKnowledge2*, pPrerequisiteKnowledge : Void*, pTemplateKnowledge : Void*, ppProjectedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.project_onto_knowledge_with_prerequisite.call(this, pPrerequisiteKnowledge, pTemplateKnowledge, ppProjectedKnowledge)
    end
    def complement(this : ISyncKnowledge2*, pSyncKnowledge : Void*, ppComplementedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complement.call(this, pSyncKnowledge, ppComplementedKnowledge)
    end
    def intersects_with_knowledge(this : ISyncKnowledge2*, pSyncKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.intersects_with_knowledge.call(this, pSyncKnowledge)
    end
    def get_knowledge_cookie(this : ISyncKnowledge2*, ppKnowledgeCookie : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_knowledge_cookie.call(this, ppKnowledgeCookie)
    end
    def compare_to_knowledge_cookie(this : ISyncKnowledge2*, pKnowledgeCookie : Void*, pResult : Win32cr::System::WindowsSync::KNOWLEDGE_COOKIE_COMPARISON_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_to_knowledge_cookie.call(this, pKnowledgeCookie, pResult)
    end

  end

  @[Extern]
  record IRecoverableErrorDataVtbl,
    query_interface : Proc(IRecoverableErrorData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRecoverableErrorData*, UInt32),
    release : Proc(IRecoverableErrorData*, UInt32),
    initialize__ : Proc(IRecoverableErrorData*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_item_display_name : Proc(IRecoverableErrorData*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_error_description : Proc(IRecoverableErrorData*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRecoverableErrorData, lpVtbl : IRecoverableErrorDataVtbl* do
    GUID = LibC::GUID.new(0xb37c4a0a_u32, 0x4b7d_u16, 0x4c2d_u16, StaticArray[0x97_u8, 0x11_u8, 0x3b_u8, 0x0_u8, 0xd1_u8, 0x19_u8, 0xb1_u8, 0xc8_u8])
    def query_interface(this : IRecoverableErrorData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRecoverableErrorData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRecoverableErrorData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IRecoverableErrorData*, pcszItemDisplayName : Win32cr::Foundation::PWSTR, pcszErrorDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pcszItemDisplayName, pcszErrorDescription)
    end
    def get_item_display_name(this : IRecoverableErrorData*, pszItemDisplayName : Win32cr::Foundation::PWSTR, pcchItemDisplayName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_display_name.call(this, pszItemDisplayName, pcchItemDisplayName)
    end
    def get_error_description(this : IRecoverableErrorData*, pszErrorDescription : Win32cr::Foundation::PWSTR, pcchErrorDescription : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_description.call(this, pszErrorDescription, pcchErrorDescription)
    end

  end

  @[Extern]
  record IRecoverableErrorVtbl,
    query_interface : Proc(IRecoverableError*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRecoverableError*, UInt32),
    release : Proc(IRecoverableError*, UInt32),
    get_stage : Proc(IRecoverableError*, Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE*, Win32cr::Foundation::HRESULT),
    get_provider : Proc(IRecoverableError*, Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE*, Win32cr::Foundation::HRESULT),
    get_change_with_recoverable_error : Proc(IRecoverableError*, Void**, Win32cr::Foundation::HRESULT),
    get_recoverable_error_data_for_change : Proc(IRecoverableError*, Win32cr::Foundation::HRESULT*, Void**, Win32cr::Foundation::HRESULT),
    get_recoverable_error_data_for_change_unit : Proc(IRecoverableError*, Void*, Win32cr::Foundation::HRESULT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRecoverableError, lpVtbl : IRecoverableErrorVtbl* do
    GUID = LibC::GUID.new(0xf5625e8_u32, 0xa7b_u16, 0x45ee_u16, StaticArray[0x96_u8, 0x37_u8, 0x1c_u8, 0xe1_u8, 0x36_u8, 0x45_u8, 0x90_u8, 0x9e_u8])
    def query_interface(this : IRecoverableError*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRecoverableError*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRecoverableError*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_stage(this : IRecoverableError*, pStage : Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stage.call(this, pStage)
    end
    def get_provider(this : IRecoverableError*, pProviderRole : Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider.call(this, pProviderRole)
    end
    def get_change_with_recoverable_error(this : IRecoverableError*, ppChangeWithRecoverableError : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_with_recoverable_error.call(this, ppChangeWithRecoverableError)
    end
    def get_recoverable_error_data_for_change(this : IRecoverableError*, phrError : Win32cr::Foundation::HRESULT*, ppErrorData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_recoverable_error_data_for_change.call(this, phrError, ppErrorData)
    end
    def get_recoverable_error_data_for_change_unit(this : IRecoverableError*, pChangeUnit : Void*, phrError : Win32cr::Foundation::HRESULT*, ppErrorData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_recoverable_error_data_for_change_unit.call(this, pChangeUnit, phrError, ppErrorData)
    end

  end

  @[Extern]
  record IChangeConflictVtbl,
    query_interface : Proc(IChangeConflict*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IChangeConflict*, UInt32),
    release : Proc(IChangeConflict*, UInt32),
    get_destination_provider_conflicting_change : Proc(IChangeConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_source_provider_conflicting_change : Proc(IChangeConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_destination_provider_conflicting_data : Proc(IChangeConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_source_provider_conflicting_data : Proc(IChangeConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_resolve_action_for_change : Proc(IChangeConflict*, Win32cr::System::WindowsSync::SYNC_RESOLVE_ACTION*, Win32cr::Foundation::HRESULT),
    set_resolve_action_for_change : Proc(IChangeConflict*, Win32cr::System::WindowsSync::SYNC_RESOLVE_ACTION, Win32cr::Foundation::HRESULT),
    get_resolve_action_for_change_unit : Proc(IChangeConflict*, Void*, Win32cr::System::WindowsSync::SYNC_RESOLVE_ACTION*, Win32cr::Foundation::HRESULT),
    set_resolve_action_for_change_unit : Proc(IChangeConflict*, Void*, Win32cr::System::WindowsSync::SYNC_RESOLVE_ACTION, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IChangeConflict, lpVtbl : IChangeConflictVtbl* do
    GUID = LibC::GUID.new(0x14ebf97_u32, 0x9f20_u16, 0x4f7a_u16, StaticArray[0xbd_u8, 0xd4_u8, 0x25_u8, 0x97_u8, 0x9c_u8, 0x77_u8, 0xc0_u8, 0x2_u8])
    def query_interface(this : IChangeConflict*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IChangeConflict*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IChangeConflict*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_destination_provider_conflicting_change(this : IChangeConflict*, ppConflictingChange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_destination_provider_conflicting_change.call(this, ppConflictingChange)
    end
    def get_source_provider_conflicting_change(this : IChangeConflict*, ppConflictingChange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_provider_conflicting_change.call(this, ppConflictingChange)
    end
    def get_destination_provider_conflicting_data(this : IChangeConflict*, ppConflictingData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_destination_provider_conflicting_data.call(this, ppConflictingData)
    end
    def get_source_provider_conflicting_data(this : IChangeConflict*, ppConflictingData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_provider_conflicting_data.call(this, ppConflictingData)
    end
    def get_resolve_action_for_change(this : IChangeConflict*, pResolveAction : Win32cr::System::WindowsSync::SYNC_RESOLVE_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolve_action_for_change.call(this, pResolveAction)
    end
    def set_resolve_action_for_change(this : IChangeConflict*, resolveAction : Win32cr::System::WindowsSync::SYNC_RESOLVE_ACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_resolve_action_for_change.call(this, resolveAction)
    end
    def get_resolve_action_for_change_unit(this : IChangeConflict*, pChangeUnit : Void*, pResolveAction : Win32cr::System::WindowsSync::SYNC_RESOLVE_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolve_action_for_change_unit.call(this, pChangeUnit, pResolveAction)
    end
    def set_resolve_action_for_change_unit(this : IChangeConflict*, pChangeUnit : Void*, resolveAction : Win32cr::System::WindowsSync::SYNC_RESOLVE_ACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_resolve_action_for_change_unit.call(this, pChangeUnit, resolveAction)
    end

  end

  @[Extern]
  record IConstraintConflictVtbl,
    query_interface : Proc(IConstraintConflict*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConstraintConflict*, UInt32),
    release : Proc(IConstraintConflict*, UInt32),
    get_destination_provider_conflicting_change : Proc(IConstraintConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_source_provider_conflicting_change : Proc(IConstraintConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_destination_provider_original_change : Proc(IConstraintConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_destination_provider_conflicting_data : Proc(IConstraintConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_source_provider_conflicting_data : Proc(IConstraintConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_destination_provider_original_data : Proc(IConstraintConflict*, Void**, Win32cr::Foundation::HRESULT),
    get_constraint_resolve_action_for_change : Proc(IConstraintConflict*, Win32cr::System::WindowsSync::SYNC_CONSTRAINT_RESOLVE_ACTION*, Win32cr::Foundation::HRESULT),
    set_constraint_resolve_action_for_change : Proc(IConstraintConflict*, Win32cr::System::WindowsSync::SYNC_CONSTRAINT_RESOLVE_ACTION, Win32cr::Foundation::HRESULT),
    get_constraint_resolve_action_for_change_unit : Proc(IConstraintConflict*, Void*, Win32cr::System::WindowsSync::SYNC_CONSTRAINT_RESOLVE_ACTION*, Win32cr::Foundation::HRESULT),
    set_constraint_resolve_action_for_change_unit : Proc(IConstraintConflict*, Void*, Win32cr::System::WindowsSync::SYNC_CONSTRAINT_RESOLVE_ACTION, Win32cr::Foundation::HRESULT),
    get_constraint_conflict_reason : Proc(IConstraintConflict*, Win32cr::System::WindowsSync::CONSTRAINT_CONFLICT_REASON*, Win32cr::Foundation::HRESULT),
    is_temporary : Proc(IConstraintConflict*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConstraintConflict, lpVtbl : IConstraintConflictVtbl* do
    GUID = LibC::GUID.new(0xd2302e_u32, 0x1cf8_u16, 0x4835_u16, StaticArray[0xb8_u8, 0x5f_u8, 0xb7_u8, 0xca_u8, 0x4f_u8, 0x79_u8, 0x9e_u8, 0xa_u8])
    def query_interface(this : IConstraintConflict*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConstraintConflict*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConstraintConflict*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_destination_provider_conflicting_change(this : IConstraintConflict*, ppConflictingChange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_destination_provider_conflicting_change.call(this, ppConflictingChange)
    end
    def get_source_provider_conflicting_change(this : IConstraintConflict*, ppConflictingChange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_provider_conflicting_change.call(this, ppConflictingChange)
    end
    def get_destination_provider_original_change(this : IConstraintConflict*, ppOriginalChange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_destination_provider_original_change.call(this, ppOriginalChange)
    end
    def get_destination_provider_conflicting_data(this : IConstraintConflict*, ppConflictingData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_destination_provider_conflicting_data.call(this, ppConflictingData)
    end
    def get_source_provider_conflicting_data(this : IConstraintConflict*, ppConflictingData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_provider_conflicting_data.call(this, ppConflictingData)
    end
    def get_destination_provider_original_data(this : IConstraintConflict*, ppOriginalData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_destination_provider_original_data.call(this, ppOriginalData)
    end
    def get_constraint_resolve_action_for_change(this : IConstraintConflict*, pConstraintResolveAction : Win32cr::System::WindowsSync::SYNC_CONSTRAINT_RESOLVE_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_constraint_resolve_action_for_change.call(this, pConstraintResolveAction)
    end
    def set_constraint_resolve_action_for_change(this : IConstraintConflict*, constraintResolveAction : Win32cr::System::WindowsSync::SYNC_CONSTRAINT_RESOLVE_ACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_constraint_resolve_action_for_change.call(this, constraintResolveAction)
    end
    def get_constraint_resolve_action_for_change_unit(this : IConstraintConflict*, pChangeUnit : Void*, pConstraintResolveAction : Win32cr::System::WindowsSync::SYNC_CONSTRAINT_RESOLVE_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_constraint_resolve_action_for_change_unit.call(this, pChangeUnit, pConstraintResolveAction)
    end
    def set_constraint_resolve_action_for_change_unit(this : IConstraintConflict*, pChangeUnit : Void*, constraintResolveAction : Win32cr::System::WindowsSync::SYNC_CONSTRAINT_RESOLVE_ACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_constraint_resolve_action_for_change_unit.call(this, pChangeUnit, constraintResolveAction)
    end
    def get_constraint_conflict_reason(this : IConstraintConflict*, pConstraintConflictReason : Win32cr::System::WindowsSync::CONSTRAINT_CONFLICT_REASON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_constraint_conflict_reason.call(this, pConstraintConflictReason)
    end
    def is_temporary(this : IConstraintConflict*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_temporary.call(this)
    end

  end

  @[Extern]
  record ISyncCallbackVtbl,
    query_interface : Proc(ISyncCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncCallback*, UInt32),
    release : Proc(ISyncCallback*, UInt32),
    on_progress : Proc(ISyncCallback*, Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_change : Proc(ISyncCallback*, Void*, Win32cr::Foundation::HRESULT),
    on_conflict : Proc(ISyncCallback*, Void*, Win32cr::Foundation::HRESULT),
    on_full_enumeration_needed : Proc(ISyncCallback*, Win32cr::System::WindowsSync::SYNC_FULL_ENUMERATION_ACTION*, Win32cr::Foundation::HRESULT),
    on_recoverable_error : Proc(ISyncCallback*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncCallback, lpVtbl : ISyncCallbackVtbl* do
    GUID = LibC::GUID.new(0x599797f_u32, 0x5ed9_u16, 0x485c_u16, StaticArray[0xae_u8, 0x36_u8, 0xc_u8, 0x5d_u8, 0x1b_u8, 0xf2_u8, 0xe7_u8, 0xa5_u8])
    def query_interface(this : ISyncCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_progress(this : ISyncCallback*, provider : Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, syncStage : Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE, dwCompletedWork : UInt32, dwTotalWork : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, provider, syncStage, dwCompletedWork, dwTotalWork)
    end
    def on_change(this : ISyncCallback*, pSyncChange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_change.call(this, pSyncChange)
    end
    def on_conflict(this : ISyncCallback*, pConflict : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_conflict.call(this, pConflict)
    end
    def on_full_enumeration_needed(this : ISyncCallback*, pFullEnumerationAction : Win32cr::System::WindowsSync::SYNC_FULL_ENUMERATION_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_full_enumeration_needed.call(this, pFullEnumerationAction)
    end
    def on_recoverable_error(this : ISyncCallback*, pRecoverableError : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_recoverable_error.call(this, pRecoverableError)
    end

  end

  @[Extern]
  record ISyncCallback2Vtbl,
    query_interface : Proc(ISyncCallback2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncCallback2*, UInt32),
    release : Proc(ISyncCallback2*, UInt32),
    on_progress : Proc(ISyncCallback2*, Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_change : Proc(ISyncCallback2*, Void*, Win32cr::Foundation::HRESULT),
    on_conflict : Proc(ISyncCallback2*, Void*, Win32cr::Foundation::HRESULT),
    on_full_enumeration_needed : Proc(ISyncCallback2*, Win32cr::System::WindowsSync::SYNC_FULL_ENUMERATION_ACTION*, Win32cr::Foundation::HRESULT),
    on_recoverable_error : Proc(ISyncCallback2*, Void*, Win32cr::Foundation::HRESULT),
    on_change_applied : Proc(ISyncCallback2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_change_failed : Proc(ISyncCallback2*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncCallback2, lpVtbl : ISyncCallback2Vtbl* do
    GUID = LibC::GUID.new(0x47ce84af_u32, 0x7442_u16, 0x4ead_u16, StaticArray[0x86_u8, 0x30_u8, 0x12_u8, 0x1_u8, 0x5e_u8, 0x3_u8, 0xa_u8, 0xd7_u8])
    def query_interface(this : ISyncCallback2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncCallback2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncCallback2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_progress(this : ISyncCallback2*, provider : Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, syncStage : Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE, dwCompletedWork : UInt32, dwTotalWork : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, provider, syncStage, dwCompletedWork, dwTotalWork)
    end
    def on_change(this : ISyncCallback2*, pSyncChange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_change.call(this, pSyncChange)
    end
    def on_conflict(this : ISyncCallback2*, pConflict : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_conflict.call(this, pConflict)
    end
    def on_full_enumeration_needed(this : ISyncCallback2*, pFullEnumerationAction : Win32cr::System::WindowsSync::SYNC_FULL_ENUMERATION_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_full_enumeration_needed.call(this, pFullEnumerationAction)
    end
    def on_recoverable_error(this : ISyncCallback2*, pRecoverableError : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_recoverable_error.call(this, pRecoverableError)
    end
    def on_change_applied(this : ISyncCallback2*, dwChangesApplied : UInt32, dwChangesFailed : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_change_applied.call(this, dwChangesApplied, dwChangesFailed)
    end
    def on_change_failed(this : ISyncCallback2*, dwChangesApplied : UInt32, dwChangesFailed : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_change_failed.call(this, dwChangesApplied, dwChangesFailed)
    end

  end

  @[Extern]
  record ISyncConstraintCallbackVtbl,
    query_interface : Proc(ISyncConstraintCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncConstraintCallback*, UInt32),
    release : Proc(ISyncConstraintCallback*, UInt32),
    on_constraint_conflict : Proc(ISyncConstraintCallback*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncConstraintCallback, lpVtbl : ISyncConstraintCallbackVtbl* do
    GUID = LibC::GUID.new(0x8af3843e_u32, 0x75b3_u16, 0x438c_u16, StaticArray[0xbb_u8, 0x51_u8, 0x6f_u8, 0x2_u8, 0xd_u8, 0x70_u8, 0xd3_u8, 0xcb_u8])
    def query_interface(this : ISyncConstraintCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncConstraintCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncConstraintCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_constraint_conflict(this : ISyncConstraintCallback*, pConflict : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_constraint_conflict.call(this, pConflict)
    end

  end

  @[Extern]
  record ISyncProviderVtbl,
    query_interface : Proc(ISyncProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncProvider*, UInt32),
    release : Proc(ISyncProvider*, UInt32),
    get_id_parameters : Proc(ISyncProvider*, Win32cr::System::WindowsSync::ID_PARAMETERS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncProvider, lpVtbl : ISyncProviderVtbl* do
    GUID = LibC::GUID.new(0x8f657056_u32, 0x2bce_u16, 0x4a17_u16, StaticArray[0x8c_u8, 0x68_u8, 0xc7_u8, 0xbb_u8, 0x78_u8, 0x98_u8, 0xb5_u8, 0x6f_u8])
    def query_interface(this : ISyncProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_id_parameters(this : ISyncProvider*, pIdParameters : Win32cr::System::WindowsSync::ID_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id_parameters.call(this, pIdParameters)
    end

  end

  @[Extern]
  record ISyncSessionStateVtbl,
    query_interface : Proc(ISyncSessionState*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncSessionState*, UInt32),
    release : Proc(ISyncSessionState*, UInt32),
    is_canceled : Proc(ISyncSessionState*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_info_for_change_application : Proc(ISyncSessionState*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    load_info_from_change_application : Proc(ISyncSessionState*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_forgotten_knowledge_recovery_range_start : Proc(ISyncSessionState*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_forgotten_knowledge_recovery_range_end : Proc(ISyncSessionState*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_forgotten_knowledge_recovery_range : Proc(ISyncSessionState*, Win32cr::System::WindowsSync::SYNC_RANGE*, Win32cr::Foundation::HRESULT),
    on_progress : Proc(ISyncSessionState*, Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncSessionState, lpVtbl : ISyncSessionStateVtbl* do
    GUID = LibC::GUID.new(0xb8a940fe_u32, 0x9f01_u16, 0x483b_u16, StaticArray[0x94_u8, 0x34_u8, 0xc3_u8, 0x7d_u8, 0x36_u8, 0x12_u8, 0x25_u8, 0xd9_u8])
    def query_interface(this : ISyncSessionState*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncSessionState*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncSessionState*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_canceled(this : ISyncSessionState*, pfIsCanceled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_canceled.call(this, pfIsCanceled)
    end
    def get_info_for_change_application(this : ISyncSessionState*, pbChangeApplierInfo : UInt8*, pcbChangeApplierInfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info_for_change_application.call(this, pbChangeApplierInfo, pcbChangeApplierInfo)
    end
    def load_info_from_change_application(this : ISyncSessionState*, pbChangeApplierInfo : UInt8*, cbChangeApplierInfo : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_info_from_change_application.call(this, pbChangeApplierInfo, cbChangeApplierInfo)
    end
    def get_forgotten_knowledge_recovery_range_start(this : ISyncSessionState*, pbRangeStart : UInt8*, pcbRangeStart : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_forgotten_knowledge_recovery_range_start.call(this, pbRangeStart, pcbRangeStart)
    end
    def get_forgotten_knowledge_recovery_range_end(this : ISyncSessionState*, pbRangeEnd : UInt8*, pcbRangeEnd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_forgotten_knowledge_recovery_range_end.call(this, pbRangeEnd, pcbRangeEnd)
    end
    def set_forgotten_knowledge_recovery_range(this : ISyncSessionState*, pRange : Win32cr::System::WindowsSync::SYNC_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_forgotten_knowledge_recovery_range.call(this, pRange)
    end
    def on_progress(this : ISyncSessionState*, provider : Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, syncStage : Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE, dwCompletedWork : UInt32, dwTotalWork : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, provider, syncStage, dwCompletedWork, dwTotalWork)
    end

  end

  @[Extern]
  record ISyncSessionExtendedErrorInfoVtbl,
    query_interface : Proc(ISyncSessionExtendedErrorInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncSessionExtendedErrorInfo*, UInt32),
    release : Proc(ISyncSessionExtendedErrorInfo*, UInt32),
    get_sync_provider_with_error : Proc(ISyncSessionExtendedErrorInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncSessionExtendedErrorInfo, lpVtbl : ISyncSessionExtendedErrorInfoVtbl* do
    GUID = LibC::GUID.new(0x326c6810_u32, 0x790a_u16, 0x409b_u16, StaticArray[0xb7_u8, 0x41_u8, 0x69_u8, 0x99_u8, 0x38_u8, 0x87_u8, 0x61_u8, 0xeb_u8])
    def query_interface(this : ISyncSessionExtendedErrorInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncSessionExtendedErrorInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncSessionExtendedErrorInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sync_provider_with_error(this : ISyncSessionExtendedErrorInfo*, ppProviderWithError : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_provider_with_error.call(this, ppProviderWithError)
    end

  end

  @[Extern]
  record ISyncSessionState2Vtbl,
    query_interface : Proc(ISyncSessionState2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncSessionState2*, UInt32),
    release : Proc(ISyncSessionState2*, UInt32),
    is_canceled : Proc(ISyncSessionState2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_info_for_change_application : Proc(ISyncSessionState2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    load_info_from_change_application : Proc(ISyncSessionState2*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_forgotten_knowledge_recovery_range_start : Proc(ISyncSessionState2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_forgotten_knowledge_recovery_range_end : Proc(ISyncSessionState2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_forgotten_knowledge_recovery_range : Proc(ISyncSessionState2*, Win32cr::System::WindowsSync::SYNC_RANGE*, Win32cr::Foundation::HRESULT),
    on_progress : Proc(ISyncSessionState2*, Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_provider_with_error : Proc(ISyncSessionState2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_session_error_status : Proc(ISyncSessionState2*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncSessionState2, lpVtbl : ISyncSessionState2Vtbl* do
    GUID = LibC::GUID.new(0x9e37cfa3_u32, 0x9e38_u16, 0x4c61_u16, StaticArray[0x9c_u8, 0xa3_u8, 0xff_u8, 0xe8_u8, 0x10_u8, 0xb4_u8, 0x5c_u8, 0xa2_u8])
    def query_interface(this : ISyncSessionState2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncSessionState2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncSessionState2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_canceled(this : ISyncSessionState2*, pfIsCanceled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_canceled.call(this, pfIsCanceled)
    end
    def get_info_for_change_application(this : ISyncSessionState2*, pbChangeApplierInfo : UInt8*, pcbChangeApplierInfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info_for_change_application.call(this, pbChangeApplierInfo, pcbChangeApplierInfo)
    end
    def load_info_from_change_application(this : ISyncSessionState2*, pbChangeApplierInfo : UInt8*, cbChangeApplierInfo : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_info_from_change_application.call(this, pbChangeApplierInfo, cbChangeApplierInfo)
    end
    def get_forgotten_knowledge_recovery_range_start(this : ISyncSessionState2*, pbRangeStart : UInt8*, pcbRangeStart : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_forgotten_knowledge_recovery_range_start.call(this, pbRangeStart, pcbRangeStart)
    end
    def get_forgotten_knowledge_recovery_range_end(this : ISyncSessionState2*, pbRangeEnd : UInt8*, pcbRangeEnd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_forgotten_knowledge_recovery_range_end.call(this, pbRangeEnd, pcbRangeEnd)
    end
    def set_forgotten_knowledge_recovery_range(this : ISyncSessionState2*, pRange : Win32cr::System::WindowsSync::SYNC_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_forgotten_knowledge_recovery_range.call(this, pRange)
    end
    def on_progress(this : ISyncSessionState2*, provider : Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, syncStage : Win32cr::System::WindowsSync::SYNC_PROGRESS_STAGE, dwCompletedWork : UInt32, dwTotalWork : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, provider, syncStage, dwCompletedWork, dwTotalWork)
    end
    def set_provider_with_error(this : ISyncSessionState2*, fSelf : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_provider_with_error.call(this, fSelf)
    end
    def get_session_error_status(this : ISyncSessionState2*, phrSessionError : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_session_error_status.call(this, phrSessionError)
    end

  end

  @[Extern]
  record ISyncFilterInfoVtbl,
    query_interface : Proc(ISyncFilterInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncFilterInfo*, UInt32),
    release : Proc(ISyncFilterInfo*, UInt32),
    serialize : Proc(ISyncFilterInfo*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncFilterInfo, lpVtbl : ISyncFilterInfoVtbl* do
    GUID = LibC::GUID.new(0x794eaaf8_u32, 0x3f2e_u16, 0x47e6_u16, StaticArray[0x97_u8, 0x28_u8, 0x17_u8, 0xe6_u8, 0xfc_u8, 0xf9_u8, 0x4c_u8, 0xb7_u8])
    def query_interface(this : ISyncFilterInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncFilterInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncFilterInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : ISyncFilterInfo*, pbBuffer : UInt8*, pcbBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbBuffer, pcbBuffer)
    end

  end

  @[Extern]
  record ISyncFilterInfo2Vtbl,
    query_interface : Proc(ISyncFilterInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncFilterInfo2*, UInt32),
    release : Proc(ISyncFilterInfo2*, UInt32),
    serialize : Proc(ISyncFilterInfo2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_flags : Proc(ISyncFilterInfo2*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncFilterInfo2, lpVtbl : ISyncFilterInfo2Vtbl* do
    GUID = LibC::GUID.new(0x19b394ba_u32, 0xe3d0_u16, 0x468c_u16, StaticArray[0x93_u8, 0x4d_u8, 0x32_u8, 0x19_u8, 0x68_u8, 0xb2_u8, 0xab_u8, 0x34_u8])
    def query_interface(this : ISyncFilterInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncFilterInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncFilterInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : ISyncFilterInfo2*, pbBuffer : UInt8*, pcbBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbBuffer, pcbBuffer)
    end
    def get_flags(this : ISyncFilterInfo2*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pdwFlags)
    end

  end

  @[Extern]
  record IChangeUnitListFilterInfoVtbl,
    query_interface : Proc(IChangeUnitListFilterInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IChangeUnitListFilterInfo*, UInt32),
    release : Proc(IChangeUnitListFilterInfo*, UInt32),
    serialize : Proc(IChangeUnitListFilterInfo*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IChangeUnitListFilterInfo*, UInt8**, UInt32, Win32cr::Foundation::HRESULT),
    get_change_unit_id_count : Proc(IChangeUnitListFilterInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_change_unit_id : Proc(IChangeUnitListFilterInfo*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IChangeUnitListFilterInfo, lpVtbl : IChangeUnitListFilterInfoVtbl* do
    GUID = LibC::GUID.new(0xf2837671_u32, 0xbdf_u16, 0x43fa_u16, StaticArray[0xb5_u8, 0x2_u8, 0x23_u8, 0x23_u8, 0x75_u8, 0xfb_u8, 0x50_u8, 0xc2_u8])
    def query_interface(this : IChangeUnitListFilterInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IChangeUnitListFilterInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IChangeUnitListFilterInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : IChangeUnitListFilterInfo*, pbBuffer : UInt8*, pcbBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbBuffer, pcbBuffer)
    end
    def initialize__(this : IChangeUnitListFilterInfo*, ppbChangeUnitIds : UInt8**, dwChangeUnitCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, ppbChangeUnitIds, dwChangeUnitCount)
    end
    def get_change_unit_id_count(this : IChangeUnitListFilterInfo*, pdwChangeUnitIdCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_unit_id_count.call(this, pdwChangeUnitIdCount)
    end
    def get_change_unit_id(this : IChangeUnitListFilterInfo*, dwChangeUnitIdIndex : UInt32, pbChangeUnitId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_unit_id.call(this, dwChangeUnitIdIndex, pbChangeUnitId, pcbIdSize)
    end

  end

  @[Extern]
  record ISyncFilterVtbl,
    query_interface : Proc(ISyncFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncFilter*, UInt32),
    release : Proc(ISyncFilter*, UInt32),
    is_identical : Proc(ISyncFilter*, Void*, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncFilter*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncFilter, lpVtbl : ISyncFilterVtbl* do
    GUID = LibC::GUID.new(0x87a3f15_u32, 0xfcb_u16, 0x44c1_u16, StaticArray[0x96_u8, 0x39_u8, 0x53_u8, 0xc1_u8, 0x4e_u8, 0x2b_u8, 0x55_u8, 0x6_u8])
    def query_interface(this : ISyncFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_identical(this : ISyncFilter*, pSyncFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_identical.call(this, pSyncFilter)
    end
    def serialize(this : ISyncFilter*, pbSyncFilter : UInt8*, pcbSyncFilter : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbSyncFilter, pcbSyncFilter)
    end

  end

  @[Extern]
  record ISyncFilterDeserializerVtbl,
    query_interface : Proc(ISyncFilterDeserializer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncFilterDeserializer*, UInt32),
    release : Proc(ISyncFilterDeserializer*, UInt32),
    deserialize_sync_filter : Proc(ISyncFilterDeserializer*, UInt8*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncFilterDeserializer, lpVtbl : ISyncFilterDeserializerVtbl* do
    GUID = LibC::GUID.new(0xb45b7a72_u32, 0xe5c7_u16, 0x46be_u16, StaticArray[0x9c_u8, 0x82_u8, 0x77_u8, 0xb8_u8, 0xb1_u8, 0x5d_u8, 0xab_u8, 0x8a_u8])
    def query_interface(this : ISyncFilterDeserializer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncFilterDeserializer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncFilterDeserializer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def deserialize_sync_filter(this : ISyncFilterDeserializer*, pbSyncFilter : UInt8*, dwCbSyncFilter : UInt32, ppISyncFilter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deserialize_sync_filter.call(this, pbSyncFilter, dwCbSyncFilter, ppISyncFilter)
    end

  end

  @[Extern]
  record ICustomFilterInfoVtbl,
    query_interface : Proc(ICustomFilterInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICustomFilterInfo*, UInt32),
    release : Proc(ICustomFilterInfo*, UInt32),
    serialize : Proc(ICustomFilterInfo*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_sync_filter : Proc(ICustomFilterInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICustomFilterInfo, lpVtbl : ICustomFilterInfoVtbl* do
    GUID = LibC::GUID.new(0x1d335dff_u32, 0x6f88_u16, 0x4e4d_u16, StaticArray[0x91_u8, 0xa8_u8, 0xa3_u8, 0xf3_u8, 0x51_u8, 0xcf_u8, 0xd4_u8, 0x73_u8])
    def query_interface(this : ICustomFilterInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICustomFilterInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICustomFilterInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : ICustomFilterInfo*, pbBuffer : UInt8*, pcbBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbBuffer, pcbBuffer)
    end
    def get_sync_filter(this : ICustomFilterInfo*, pISyncFilter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_filter.call(this, pISyncFilter)
    end

  end

  @[Extern]
  record ICombinedFilterInfoVtbl,
    query_interface : Proc(ICombinedFilterInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICombinedFilterInfo*, UInt32),
    release : Proc(ICombinedFilterInfo*, UInt32),
    serialize : Proc(ICombinedFilterInfo*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_filter_count : Proc(ICombinedFilterInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_filter_info : Proc(ICombinedFilterInfo*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_filter_combination_type : Proc(ICombinedFilterInfo*, Win32cr::System::WindowsSync::FILTER_COMBINATION_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICombinedFilterInfo, lpVtbl : ICombinedFilterInfoVtbl* do
    GUID = LibC::GUID.new(0x11f9de71_u32, 0x2818_u16, 0x4779_u16, StaticArray[0xb2_u8, 0xac_u8, 0x42_u8, 0xd4_u8, 0x50_u8, 0x56_u8, 0x5f_u8, 0x45_u8])
    def query_interface(this : ICombinedFilterInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICombinedFilterInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICombinedFilterInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : ICombinedFilterInfo*, pbBuffer : UInt8*, pcbBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbBuffer, pcbBuffer)
    end
    def get_filter_count(this : ICombinedFilterInfo*, pdwFilterCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_count.call(this, pdwFilterCount)
    end
    def get_filter_info(this : ICombinedFilterInfo*, dwFilterIndex : UInt32, ppIFilterInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_info.call(this, dwFilterIndex, ppIFilterInfo)
    end
    def get_filter_combination_type(this : ICombinedFilterInfo*, pFilterCombinationType : Win32cr::System::WindowsSync::FILTER_COMBINATION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_combination_type.call(this, pFilterCombinationType)
    end

  end

  @[Extern]
  record IEnumSyncChangesVtbl,
    query_interface : Proc(IEnumSyncChanges*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSyncChanges*, UInt32),
    release : Proc(IEnumSyncChanges*, UInt32),
    next__ : Proc(IEnumSyncChanges*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSyncChanges*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSyncChanges*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSyncChanges*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSyncChanges, lpVtbl : IEnumSyncChangesVtbl* do
    GUID = LibC::GUID.new(0x5f86be4a_u32, 0x5e78_u16, 0x4e32_u16, StaticArray[0xac_u8, 0x1c_u8, 0xc2_u8, 0x4f_u8, 0xd2_u8, 0x23_u8, 0xef_u8, 0x85_u8])
    def query_interface(this : IEnumSyncChanges*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSyncChanges*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSyncChanges*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSyncChanges*, cChanges : UInt32, ppChange : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cChanges, ppChange, pcFetched)
    end
    def skip(this : IEnumSyncChanges*, cChanges : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cChanges)
    end
    def reset(this : IEnumSyncChanges*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSyncChanges*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record ISyncChangeBuilderVtbl,
    query_interface : Proc(ISyncChangeBuilder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeBuilder*, UInt32),
    release : Proc(ISyncChangeBuilder*, UInt32),
    add_change_unit_metadata : Proc(ISyncChangeBuilder*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeBuilder, lpVtbl : ISyncChangeBuilderVtbl* do
    GUID = LibC::GUID.new(0x56f14771_u32, 0x8677_u16, 0x484f_u16, StaticArray[0xa1_u8, 0x70_u8, 0xe3_u8, 0x86_u8, 0xe4_u8, 0x18_u8, 0xa6_u8, 0x76_u8])
    def query_interface(this : ISyncChangeBuilder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeBuilder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeBuilder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_change_unit_metadata(this : ISyncChangeBuilder*, pbChangeUnitId : UInt8*, pChangeUnitVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_change_unit_metadata.call(this, pbChangeUnitId, pChangeUnitVersion)
    end

  end

  @[Extern]
  record IFilterTrackingSyncChangeBuilderVtbl,
    query_interface : Proc(IFilterTrackingSyncChangeBuilder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFilterTrackingSyncChangeBuilder*, UInt32),
    release : Proc(IFilterTrackingSyncChangeBuilder*, UInt32),
    add_filter_change : Proc(IFilterTrackingSyncChangeBuilder*, UInt32, Win32cr::System::WindowsSync::SYNC_FILTER_CHANGE*, Win32cr::Foundation::HRESULT),
    set_all_change_units_present_flag : Proc(IFilterTrackingSyncChangeBuilder*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFilterTrackingSyncChangeBuilder, lpVtbl : IFilterTrackingSyncChangeBuilderVtbl* do
    GUID = LibC::GUID.new(0x295024a0_u32, 0x70da_u16, 0x4c58_u16, StaticArray[0x88_u8, 0x3c_u8, 0xce_u8, 0x2a_u8, 0xfb_u8, 0x30_u8, 0x8d_u8, 0xb_u8])
    def query_interface(this : IFilterTrackingSyncChangeBuilder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFilterTrackingSyncChangeBuilder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFilterTrackingSyncChangeBuilder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_filter_change(this : IFilterTrackingSyncChangeBuilder*, dwFilterKey : UInt32, pFilterChange : Win32cr::System::WindowsSync::SYNC_FILTER_CHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_filter_change.call(this, dwFilterKey, pFilterChange)
    end
    def set_all_change_units_present_flag(this : IFilterTrackingSyncChangeBuilder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_all_change_units_present_flag.call(this)
    end

  end

  @[Extern]
  record ISyncChangeBatchBaseVtbl,
    query_interface : Proc(ISyncChangeBatchBase*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeBatchBase*, UInt32),
    release : Proc(ISyncChangeBatchBase*, UInt32),
    get_change_enumerator : Proc(ISyncChangeBatchBase*, Void**, Win32cr::Foundation::HRESULT),
    get_is_last_batch : Proc(ISyncChangeBatchBase*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_work_estimate_for_batch : Proc(ISyncChangeBatchBase*, UInt32*, Win32cr::Foundation::HRESULT),
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatchBase*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_ordered_group : Proc(ISyncChangeBatchBase*, UInt8*, Win32cr::Foundation::HRESULT),
    end_ordered_group : Proc(ISyncChangeBatchBase*, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    add_item_metadata_to_group : Proc(ISyncChangeBatchBase*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_learned_knowledge : Proc(ISyncChangeBatchBase*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite_knowledge : Proc(ISyncChangeBatchBase*, Void**, Win32cr::Foundation::HRESULT),
    get_source_forgotten_knowledge : Proc(ISyncChangeBatchBase*, Void**, Win32cr::Foundation::HRESULT),
    set_last_batch : Proc(ISyncChangeBatchBase*, Win32cr::Foundation::HRESULT),
    set_work_estimate_for_batch : Proc(ISyncChangeBatchBase*, UInt32, Win32cr::Foundation::HRESULT),
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatchBase*, UInt32, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncChangeBatchBase*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeBatchBase, lpVtbl : ISyncChangeBatchBaseVtbl* do
    GUID = LibC::GUID.new(0x52f6e694_u32, 0x6a71_u16, 0x4494_u16, StaticArray[0xa1_u8, 0x84_u8, 0xa8_u8, 0x31_u8, 0x1b_u8, 0xf5_u8, 0xd2_u8, 0x27_u8])
    def query_interface(this : ISyncChangeBatchBase*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeBatchBase*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeBatchBase*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_change_enumerator(this : ISyncChangeBatchBase*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_enumerator.call(this, ppEnum)
    end
    def get_is_last_batch(this : ISyncChangeBatchBase*, pfLastBatch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_last_batch.call(this, pfLastBatch)
    end
    def get_work_estimate_for_batch(this : ISyncChangeBatchBase*, pdwWorkForBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_estimate_for_batch.call(this, pdwWorkForBatch)
    end
    def get_remaining_work_estimate_for_session(this : ISyncChangeBatchBase*, pdwRemainingWorkForSession : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remaining_work_estimate_for_session.call(this, pdwRemainingWorkForSession)
    end
    def begin_ordered_group(this : ISyncChangeBatchBase*, pbLowerBound : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_ordered_group.call(this, pbLowerBound)
    end
    def end_ordered_group(this : ISyncChangeBatchBase*, pbUpperBound : UInt8*, pMadeWithKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ordered_group.call(this, pbUpperBound, pMadeWithKnowledge)
    end
    def add_item_metadata_to_group(this : ISyncChangeBatchBase*, pbOwnerReplicaId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwFlags : UInt32, dwWorkForChange : UInt32, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item_metadata_to_group.call(this, pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, ppChangeBuilder)
    end
    def get_learned_knowledge(this : ISyncChangeBatchBase*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge.call(this, ppLearnedKnowledge)
    end
    def get_prerequisite_knowledge(this : ISyncChangeBatchBase*, ppPrerequisteKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite_knowledge.call(this, ppPrerequisteKnowledge)
    end
    def get_source_forgotten_knowledge(this : ISyncChangeBatchBase*, ppSourceForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_forgotten_knowledge.call(this, ppSourceForgottenKnowledge)
    end
    def set_last_batch(this : ISyncChangeBatchBase*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_batch.call(this)
    end
    def set_work_estimate_for_batch(this : ISyncChangeBatchBase*, dwWorkForBatch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_estimate_for_batch.call(this, dwWorkForBatch)
    end
    def set_remaining_work_estimate_for_session(this : ISyncChangeBatchBase*, dwRemainingWorkForSession : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remaining_work_estimate_for_session.call(this, dwRemainingWorkForSession)
    end
    def serialize(this : ISyncChangeBatchBase*, pbChangeBatch : UInt8*, pcbChangeBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbChangeBatch, pcbChangeBatch)
    end

  end

  @[Extern]
  record ISyncChangeBatchVtbl,
    query_interface : Proc(ISyncChangeBatch*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeBatch*, UInt32),
    release : Proc(ISyncChangeBatch*, UInt32),
    get_change_enumerator : Proc(ISyncChangeBatch*, Void**, Win32cr::Foundation::HRESULT),
    get_is_last_batch : Proc(ISyncChangeBatch*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_work_estimate_for_batch : Proc(ISyncChangeBatch*, UInt32*, Win32cr::Foundation::HRESULT),
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatch*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_ordered_group : Proc(ISyncChangeBatch*, UInt8*, Win32cr::Foundation::HRESULT),
    end_ordered_group : Proc(ISyncChangeBatch*, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    add_item_metadata_to_group : Proc(ISyncChangeBatch*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_learned_knowledge : Proc(ISyncChangeBatch*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite_knowledge : Proc(ISyncChangeBatch*, Void**, Win32cr::Foundation::HRESULT),
    get_source_forgotten_knowledge : Proc(ISyncChangeBatch*, Void**, Win32cr::Foundation::HRESULT),
    set_last_batch : Proc(ISyncChangeBatch*, Win32cr::Foundation::HRESULT),
    set_work_estimate_for_batch : Proc(ISyncChangeBatch*, UInt32, Win32cr::Foundation::HRESULT),
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatch*, UInt32, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncChangeBatch*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_unordered_group : Proc(ISyncChangeBatch*, Win32cr::Foundation::HRESULT),
    end_unordered_group : Proc(ISyncChangeBatch*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    add_logged_conflict : Proc(ISyncChangeBatch*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeBatch, lpVtbl : ISyncChangeBatchVtbl* do
    GUID = LibC::GUID.new(0x70c64dee_u32, 0x380f_u16, 0x4c2e_u16, StaticArray[0x8f_u8, 0x70_u8, 0x31_u8, 0xc5_u8, 0x5b_u8, 0xd5_u8, 0xf9_u8, 0xb3_u8])
    def query_interface(this : ISyncChangeBatch*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeBatch*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeBatch*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_change_enumerator(this : ISyncChangeBatch*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_enumerator.call(this, ppEnum)
    end
    def get_is_last_batch(this : ISyncChangeBatch*, pfLastBatch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_last_batch.call(this, pfLastBatch)
    end
    def get_work_estimate_for_batch(this : ISyncChangeBatch*, pdwWorkForBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_estimate_for_batch.call(this, pdwWorkForBatch)
    end
    def get_remaining_work_estimate_for_session(this : ISyncChangeBatch*, pdwRemainingWorkForSession : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remaining_work_estimate_for_session.call(this, pdwRemainingWorkForSession)
    end
    def begin_ordered_group(this : ISyncChangeBatch*, pbLowerBound : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_ordered_group.call(this, pbLowerBound)
    end
    def end_ordered_group(this : ISyncChangeBatch*, pbUpperBound : UInt8*, pMadeWithKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ordered_group.call(this, pbUpperBound, pMadeWithKnowledge)
    end
    def add_item_metadata_to_group(this : ISyncChangeBatch*, pbOwnerReplicaId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwFlags : UInt32, dwWorkForChange : UInt32, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item_metadata_to_group.call(this, pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, ppChangeBuilder)
    end
    def get_learned_knowledge(this : ISyncChangeBatch*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge.call(this, ppLearnedKnowledge)
    end
    def get_prerequisite_knowledge(this : ISyncChangeBatch*, ppPrerequisteKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite_knowledge.call(this, ppPrerequisteKnowledge)
    end
    def get_source_forgotten_knowledge(this : ISyncChangeBatch*, ppSourceForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_forgotten_knowledge.call(this, ppSourceForgottenKnowledge)
    end
    def set_last_batch(this : ISyncChangeBatch*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_batch.call(this)
    end
    def set_work_estimate_for_batch(this : ISyncChangeBatch*, dwWorkForBatch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_estimate_for_batch.call(this, dwWorkForBatch)
    end
    def set_remaining_work_estimate_for_session(this : ISyncChangeBatch*, dwRemainingWorkForSession : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remaining_work_estimate_for_session.call(this, dwRemainingWorkForSession)
    end
    def serialize(this : ISyncChangeBatch*, pbChangeBatch : UInt8*, pcbChangeBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbChangeBatch, pcbChangeBatch)
    end
    def begin_unordered_group(this : ISyncChangeBatch*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_unordered_group.call(this)
    end
    def end_unordered_group(this : ISyncChangeBatch*, pMadeWithKnowledge : Void*, fAllChangesForKnowledge : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_unordered_group.call(this, pMadeWithKnowledge, fAllChangesForKnowledge)
    end
    def add_logged_conflict(this : ISyncChangeBatch*, pbOwnerReplicaId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwFlags : UInt32, dwWorkForChange : UInt32, pConflictKnowledge : Void*, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_logged_conflict.call(this, pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, pConflictKnowledge, ppChangeBuilder)
    end

  end

  @[Extern]
  record ISyncFullEnumerationChangeBatchVtbl,
    query_interface : Proc(ISyncFullEnumerationChangeBatch*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncFullEnumerationChangeBatch*, UInt32),
    release : Proc(ISyncFullEnumerationChangeBatch*, UInt32),
    get_change_enumerator : Proc(ISyncFullEnumerationChangeBatch*, Void**, Win32cr::Foundation::HRESULT),
    get_is_last_batch : Proc(ISyncFullEnumerationChangeBatch*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_work_estimate_for_batch : Proc(ISyncFullEnumerationChangeBatch*, UInt32*, Win32cr::Foundation::HRESULT),
    get_remaining_work_estimate_for_session : Proc(ISyncFullEnumerationChangeBatch*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_ordered_group : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, Win32cr::Foundation::HRESULT),
    end_ordered_group : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    add_item_metadata_to_group : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_learned_knowledge : Proc(ISyncFullEnumerationChangeBatch*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite_knowledge : Proc(ISyncFullEnumerationChangeBatch*, Void**, Win32cr::Foundation::HRESULT),
    get_source_forgotten_knowledge : Proc(ISyncFullEnumerationChangeBatch*, Void**, Win32cr::Foundation::HRESULT),
    set_last_batch : Proc(ISyncFullEnumerationChangeBatch*, Win32cr::Foundation::HRESULT),
    set_work_estimate_for_batch : Proc(ISyncFullEnumerationChangeBatch*, UInt32, Win32cr::Foundation::HRESULT),
    set_remaining_work_estimate_for_session : Proc(ISyncFullEnumerationChangeBatch*, UInt32, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_learned_knowledge_after_recovery_complete : Proc(ISyncFullEnumerationChangeBatch*, Void**, Win32cr::Foundation::HRESULT),
    get_closed_lower_bound_item_id : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_closed_upper_bound_item_id : Proc(ISyncFullEnumerationChangeBatch*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncFullEnumerationChangeBatch, lpVtbl : ISyncFullEnumerationChangeBatchVtbl* do
    GUID = LibC::GUID.new(0xef64197d_u32, 0x4f44_u16, 0x4ea2_u16, StaticArray[0xb3_u8, 0x55_u8, 0x45_u8, 0x24_u8, 0x71_u8, 0x3e_u8, 0x3b_u8, 0xed_u8])
    def query_interface(this : ISyncFullEnumerationChangeBatch*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncFullEnumerationChangeBatch*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncFullEnumerationChangeBatch*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_change_enumerator(this : ISyncFullEnumerationChangeBatch*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_enumerator.call(this, ppEnum)
    end
    def get_is_last_batch(this : ISyncFullEnumerationChangeBatch*, pfLastBatch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_last_batch.call(this, pfLastBatch)
    end
    def get_work_estimate_for_batch(this : ISyncFullEnumerationChangeBatch*, pdwWorkForBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_estimate_for_batch.call(this, pdwWorkForBatch)
    end
    def get_remaining_work_estimate_for_session(this : ISyncFullEnumerationChangeBatch*, pdwRemainingWorkForSession : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remaining_work_estimate_for_session.call(this, pdwRemainingWorkForSession)
    end
    def begin_ordered_group(this : ISyncFullEnumerationChangeBatch*, pbLowerBound : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_ordered_group.call(this, pbLowerBound)
    end
    def end_ordered_group(this : ISyncFullEnumerationChangeBatch*, pbUpperBound : UInt8*, pMadeWithKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ordered_group.call(this, pbUpperBound, pMadeWithKnowledge)
    end
    def add_item_metadata_to_group(this : ISyncFullEnumerationChangeBatch*, pbOwnerReplicaId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwFlags : UInt32, dwWorkForChange : UInt32, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item_metadata_to_group.call(this, pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, ppChangeBuilder)
    end
    def get_learned_knowledge(this : ISyncFullEnumerationChangeBatch*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge.call(this, ppLearnedKnowledge)
    end
    def get_prerequisite_knowledge(this : ISyncFullEnumerationChangeBatch*, ppPrerequisteKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite_knowledge.call(this, ppPrerequisteKnowledge)
    end
    def get_source_forgotten_knowledge(this : ISyncFullEnumerationChangeBatch*, ppSourceForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_forgotten_knowledge.call(this, ppSourceForgottenKnowledge)
    end
    def set_last_batch(this : ISyncFullEnumerationChangeBatch*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_batch.call(this)
    end
    def set_work_estimate_for_batch(this : ISyncFullEnumerationChangeBatch*, dwWorkForBatch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_estimate_for_batch.call(this, dwWorkForBatch)
    end
    def set_remaining_work_estimate_for_session(this : ISyncFullEnumerationChangeBatch*, dwRemainingWorkForSession : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remaining_work_estimate_for_session.call(this, dwRemainingWorkForSession)
    end
    def serialize(this : ISyncFullEnumerationChangeBatch*, pbChangeBatch : UInt8*, pcbChangeBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbChangeBatch, pcbChangeBatch)
    end
    def get_learned_knowledge_after_recovery_complete(this : ISyncFullEnumerationChangeBatch*, ppLearnedKnowledgeAfterRecoveryComplete : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge_after_recovery_complete.call(this, ppLearnedKnowledgeAfterRecoveryComplete)
    end
    def get_closed_lower_bound_item_id(this : ISyncFullEnumerationChangeBatch*, pbClosedLowerBoundItemId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closed_lower_bound_item_id.call(this, pbClosedLowerBoundItemId, pcbIdSize)
    end
    def get_closed_upper_bound_item_id(this : ISyncFullEnumerationChangeBatch*, pbClosedUpperBoundItemId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closed_upper_bound_item_id.call(this, pbClosedUpperBoundItemId, pcbIdSize)
    end

  end

  @[Extern]
  record ISyncChangeBatchWithPrerequisiteVtbl,
    query_interface : Proc(ISyncChangeBatchWithPrerequisite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeBatchWithPrerequisite*, UInt32),
    release : Proc(ISyncChangeBatchWithPrerequisite*, UInt32),
    get_change_enumerator : Proc(ISyncChangeBatchWithPrerequisite*, Void**, Win32cr::Foundation::HRESULT),
    get_is_last_batch : Proc(ISyncChangeBatchWithPrerequisite*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_work_estimate_for_batch : Proc(ISyncChangeBatchWithPrerequisite*, UInt32*, Win32cr::Foundation::HRESULT),
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatchWithPrerequisite*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_ordered_group : Proc(ISyncChangeBatchWithPrerequisite*, UInt8*, Win32cr::Foundation::HRESULT),
    end_ordered_group : Proc(ISyncChangeBatchWithPrerequisite*, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    add_item_metadata_to_group : Proc(ISyncChangeBatchWithPrerequisite*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_learned_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, Void**, Win32cr::Foundation::HRESULT),
    get_source_forgotten_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, Void**, Win32cr::Foundation::HRESULT),
    set_last_batch : Proc(ISyncChangeBatchWithPrerequisite*, Win32cr::Foundation::HRESULT),
    set_work_estimate_for_batch : Proc(ISyncChangeBatchWithPrerequisite*, UInt32, Win32cr::Foundation::HRESULT),
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatchWithPrerequisite*, UInt32, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncChangeBatchWithPrerequisite*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_prerequisite_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, Void*, Win32cr::Foundation::HRESULT),
    get_learned_knowledge_with_prerequisite : Proc(ISyncChangeBatchWithPrerequisite*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_learned_forgotten_knowledge : Proc(ISyncChangeBatchWithPrerequisite*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeBatchWithPrerequisite, lpVtbl : ISyncChangeBatchWithPrerequisiteVtbl* do
    GUID = LibC::GUID.new(0x97f13be_u32, 0x5b92_u16, 0x4048_u16, StaticArray[0xb3_u8, 0xf2_u8, 0x7b_u8, 0x42_u8, 0xa2_u8, 0x51_u8, 0x5e_u8, 0x7_u8])
    def query_interface(this : ISyncChangeBatchWithPrerequisite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeBatchWithPrerequisite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeBatchWithPrerequisite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_change_enumerator(this : ISyncChangeBatchWithPrerequisite*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_enumerator.call(this, ppEnum)
    end
    def get_is_last_batch(this : ISyncChangeBatchWithPrerequisite*, pfLastBatch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_last_batch.call(this, pfLastBatch)
    end
    def get_work_estimate_for_batch(this : ISyncChangeBatchWithPrerequisite*, pdwWorkForBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_estimate_for_batch.call(this, pdwWorkForBatch)
    end
    def get_remaining_work_estimate_for_session(this : ISyncChangeBatchWithPrerequisite*, pdwRemainingWorkForSession : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remaining_work_estimate_for_session.call(this, pdwRemainingWorkForSession)
    end
    def begin_ordered_group(this : ISyncChangeBatchWithPrerequisite*, pbLowerBound : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_ordered_group.call(this, pbLowerBound)
    end
    def end_ordered_group(this : ISyncChangeBatchWithPrerequisite*, pbUpperBound : UInt8*, pMadeWithKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ordered_group.call(this, pbUpperBound, pMadeWithKnowledge)
    end
    def add_item_metadata_to_group(this : ISyncChangeBatchWithPrerequisite*, pbOwnerReplicaId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwFlags : UInt32, dwWorkForChange : UInt32, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item_metadata_to_group.call(this, pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, ppChangeBuilder)
    end
    def get_learned_knowledge(this : ISyncChangeBatchWithPrerequisite*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge.call(this, ppLearnedKnowledge)
    end
    def get_prerequisite_knowledge(this : ISyncChangeBatchWithPrerequisite*, ppPrerequisteKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite_knowledge.call(this, ppPrerequisteKnowledge)
    end
    def get_source_forgotten_knowledge(this : ISyncChangeBatchWithPrerequisite*, ppSourceForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_forgotten_knowledge.call(this, ppSourceForgottenKnowledge)
    end
    def set_last_batch(this : ISyncChangeBatchWithPrerequisite*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_batch.call(this)
    end
    def set_work_estimate_for_batch(this : ISyncChangeBatchWithPrerequisite*, dwWorkForBatch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_estimate_for_batch.call(this, dwWorkForBatch)
    end
    def set_remaining_work_estimate_for_session(this : ISyncChangeBatchWithPrerequisite*, dwRemainingWorkForSession : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remaining_work_estimate_for_session.call(this, dwRemainingWorkForSession)
    end
    def serialize(this : ISyncChangeBatchWithPrerequisite*, pbChangeBatch : UInt8*, pcbChangeBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbChangeBatch, pcbChangeBatch)
    end
    def set_prerequisite_knowledge(this : ISyncChangeBatchWithPrerequisite*, pPrerequisiteKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_prerequisite_knowledge.call(this, pPrerequisiteKnowledge)
    end
    def get_learned_knowledge_with_prerequisite(this : ISyncChangeBatchWithPrerequisite*, pDestinationKnowledge : Void*, ppLearnedWithPrerequisiteKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge_with_prerequisite.call(this, pDestinationKnowledge, ppLearnedWithPrerequisiteKnowledge)
    end
    def get_learned_forgotten_knowledge(this : ISyncChangeBatchWithPrerequisite*, ppLearnedForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_forgotten_knowledge.call(this, ppLearnedForgottenKnowledge)
    end

  end

  @[Extern]
  record ISyncChangeBatchBase2Vtbl,
    query_interface : Proc(ISyncChangeBatchBase2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeBatchBase2*, UInt32),
    release : Proc(ISyncChangeBatchBase2*, UInt32),
    get_change_enumerator : Proc(ISyncChangeBatchBase2*, Void**, Win32cr::Foundation::HRESULT),
    get_is_last_batch : Proc(ISyncChangeBatchBase2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_work_estimate_for_batch : Proc(ISyncChangeBatchBase2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatchBase2*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_ordered_group : Proc(ISyncChangeBatchBase2*, UInt8*, Win32cr::Foundation::HRESULT),
    end_ordered_group : Proc(ISyncChangeBatchBase2*, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    add_item_metadata_to_group : Proc(ISyncChangeBatchBase2*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_learned_knowledge : Proc(ISyncChangeBatchBase2*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite_knowledge : Proc(ISyncChangeBatchBase2*, Void**, Win32cr::Foundation::HRESULT),
    get_source_forgotten_knowledge : Proc(ISyncChangeBatchBase2*, Void**, Win32cr::Foundation::HRESULT),
    set_last_batch : Proc(ISyncChangeBatchBase2*, Win32cr::Foundation::HRESULT),
    set_work_estimate_for_batch : Proc(ISyncChangeBatchBase2*, UInt32, Win32cr::Foundation::HRESULT),
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatchBase2*, UInt32, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncChangeBatchBase2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    serialize_with_options : Proc(ISyncChangeBatchBase2*, Win32cr::System::WindowsSync::SYNC_SERIALIZATION_VERSION, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeBatchBase2, lpVtbl : ISyncChangeBatchBase2Vtbl* do
    GUID = LibC::GUID.new(0x6fdb596a_u32, 0xd755_u16, 0x4584_u16, StaticArray[0xbd_u8, 0xc_u8, 0xc0_u8, 0xc2_u8, 0x3a_u8, 0x54_u8, 0x8f_u8, 0xbf_u8])
    def query_interface(this : ISyncChangeBatchBase2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeBatchBase2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeBatchBase2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_change_enumerator(this : ISyncChangeBatchBase2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_enumerator.call(this, ppEnum)
    end
    def get_is_last_batch(this : ISyncChangeBatchBase2*, pfLastBatch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_last_batch.call(this, pfLastBatch)
    end
    def get_work_estimate_for_batch(this : ISyncChangeBatchBase2*, pdwWorkForBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_estimate_for_batch.call(this, pdwWorkForBatch)
    end
    def get_remaining_work_estimate_for_session(this : ISyncChangeBatchBase2*, pdwRemainingWorkForSession : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remaining_work_estimate_for_session.call(this, pdwRemainingWorkForSession)
    end
    def begin_ordered_group(this : ISyncChangeBatchBase2*, pbLowerBound : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_ordered_group.call(this, pbLowerBound)
    end
    def end_ordered_group(this : ISyncChangeBatchBase2*, pbUpperBound : UInt8*, pMadeWithKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ordered_group.call(this, pbUpperBound, pMadeWithKnowledge)
    end
    def add_item_metadata_to_group(this : ISyncChangeBatchBase2*, pbOwnerReplicaId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwFlags : UInt32, dwWorkForChange : UInt32, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item_metadata_to_group.call(this, pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, ppChangeBuilder)
    end
    def get_learned_knowledge(this : ISyncChangeBatchBase2*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge.call(this, ppLearnedKnowledge)
    end
    def get_prerequisite_knowledge(this : ISyncChangeBatchBase2*, ppPrerequisteKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite_knowledge.call(this, ppPrerequisteKnowledge)
    end
    def get_source_forgotten_knowledge(this : ISyncChangeBatchBase2*, ppSourceForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_forgotten_knowledge.call(this, ppSourceForgottenKnowledge)
    end
    def set_last_batch(this : ISyncChangeBatchBase2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_batch.call(this)
    end
    def set_work_estimate_for_batch(this : ISyncChangeBatchBase2*, dwWorkForBatch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_estimate_for_batch.call(this, dwWorkForBatch)
    end
    def set_remaining_work_estimate_for_session(this : ISyncChangeBatchBase2*, dwRemainingWorkForSession : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remaining_work_estimate_for_session.call(this, dwRemainingWorkForSession)
    end
    def serialize(this : ISyncChangeBatchBase2*, pbChangeBatch : UInt8*, pcbChangeBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbChangeBatch, pcbChangeBatch)
    end
    def serialize_with_options(this : ISyncChangeBatchBase2*, targetFormatVersion : Win32cr::System::WindowsSync::SYNC_SERIALIZATION_VERSION, dwFlags : UInt32, pbBuffer : UInt8*, pdwSerializedSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize_with_options.call(this, targetFormatVersion, dwFlags, pbBuffer, pdwSerializedSize)
    end

  end

  @[Extern]
  record ISyncChangeBatchAdvancedVtbl,
    query_interface : Proc(ISyncChangeBatchAdvanced*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeBatchAdvanced*, UInt32),
    release : Proc(ISyncChangeBatchAdvanced*, UInt32),
    get_filter_info : Proc(ISyncChangeBatchAdvanced*, Void**, Win32cr::Foundation::HRESULT),
    convert_full_enumeration_change_batch_to_regular_change_batch : Proc(ISyncChangeBatchAdvanced*, Void**, Win32cr::Foundation::HRESULT),
    get_upper_bound_item_id : Proc(ISyncChangeBatchAdvanced*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_batch_level_knowledge_should_be_applied : Proc(ISyncChangeBatchAdvanced*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeBatchAdvanced, lpVtbl : ISyncChangeBatchAdvancedVtbl* do
    GUID = LibC::GUID.new(0xf1a4995_u32, 0xcbc8_u16, 0x421d_u16, StaticArray[0xb5_u8, 0x50_u8, 0x5d_u8, 0xb_u8, 0xeb_u8, 0xf3_u8, 0xe9_u8, 0xa5_u8])
    def query_interface(this : ISyncChangeBatchAdvanced*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeBatchAdvanced*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeBatchAdvanced*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_filter_info(this : ISyncChangeBatchAdvanced*, ppFilterInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_info.call(this, ppFilterInfo)
    end
    def convert_full_enumeration_change_batch_to_regular_change_batch(this : ISyncChangeBatchAdvanced*, ppChangeBatch : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_full_enumeration_change_batch_to_regular_change_batch.call(this, ppChangeBatch)
    end
    def get_upper_bound_item_id(this : ISyncChangeBatchAdvanced*, pbItemId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_upper_bound_item_id.call(this, pbItemId, pcbIdSize)
    end
    def get_batch_level_knowledge_should_be_applied(this : ISyncChangeBatchAdvanced*, pfBatchKnowledgeShouldBeApplied : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_batch_level_knowledge_should_be_applied.call(this, pfBatchKnowledgeShouldBeApplied)
    end

  end

  @[Extern]
  record ISyncChangeBatch2Vtbl,
    query_interface : Proc(ISyncChangeBatch2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeBatch2*, UInt32),
    release : Proc(ISyncChangeBatch2*, UInt32),
    get_change_enumerator : Proc(ISyncChangeBatch2*, Void**, Win32cr::Foundation::HRESULT),
    get_is_last_batch : Proc(ISyncChangeBatch2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_work_estimate_for_batch : Proc(ISyncChangeBatch2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_remaining_work_estimate_for_session : Proc(ISyncChangeBatch2*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_ordered_group : Proc(ISyncChangeBatch2*, UInt8*, Win32cr::Foundation::HRESULT),
    end_ordered_group : Proc(ISyncChangeBatch2*, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    add_item_metadata_to_group : Proc(ISyncChangeBatch2*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_learned_knowledge : Proc(ISyncChangeBatch2*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite_knowledge : Proc(ISyncChangeBatch2*, Void**, Win32cr::Foundation::HRESULT),
    get_source_forgotten_knowledge : Proc(ISyncChangeBatch2*, Void**, Win32cr::Foundation::HRESULT),
    set_last_batch : Proc(ISyncChangeBatch2*, Win32cr::Foundation::HRESULT),
    set_work_estimate_for_batch : Proc(ISyncChangeBatch2*, UInt32, Win32cr::Foundation::HRESULT),
    set_remaining_work_estimate_for_session : Proc(ISyncChangeBatch2*, UInt32, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncChangeBatch2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_unordered_group : Proc(ISyncChangeBatch2*, Win32cr::Foundation::HRESULT),
    end_unordered_group : Proc(ISyncChangeBatch2*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    add_logged_conflict : Proc(ISyncChangeBatch2*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_merge_tombstone_metadata_to_group : Proc(ISyncChangeBatch2*, UInt8*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add_merge_tombstone_logged_conflict : Proc(ISyncChangeBatch2*, UInt8*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeBatch2, lpVtbl : ISyncChangeBatch2Vtbl* do
    GUID = LibC::GUID.new(0x225f4a33_u32, 0xf5ee_u16, 0x4cc7_u16, StaticArray[0xb0_u8, 0x39_u8, 0x67_u8, 0xa2_u8, 0x62_u8, 0xb4_u8, 0xb2_u8, 0xac_u8])
    def query_interface(this : ISyncChangeBatch2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeBatch2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeBatch2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_change_enumerator(this : ISyncChangeBatch2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_enumerator.call(this, ppEnum)
    end
    def get_is_last_batch(this : ISyncChangeBatch2*, pfLastBatch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_last_batch.call(this, pfLastBatch)
    end
    def get_work_estimate_for_batch(this : ISyncChangeBatch2*, pdwWorkForBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_estimate_for_batch.call(this, pdwWorkForBatch)
    end
    def get_remaining_work_estimate_for_session(this : ISyncChangeBatch2*, pdwRemainingWorkForSession : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remaining_work_estimate_for_session.call(this, pdwRemainingWorkForSession)
    end
    def begin_ordered_group(this : ISyncChangeBatch2*, pbLowerBound : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_ordered_group.call(this, pbLowerBound)
    end
    def end_ordered_group(this : ISyncChangeBatch2*, pbUpperBound : UInt8*, pMadeWithKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ordered_group.call(this, pbUpperBound, pMadeWithKnowledge)
    end
    def add_item_metadata_to_group(this : ISyncChangeBatch2*, pbOwnerReplicaId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwFlags : UInt32, dwWorkForChange : UInt32, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item_metadata_to_group.call(this, pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, ppChangeBuilder)
    end
    def get_learned_knowledge(this : ISyncChangeBatch2*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge.call(this, ppLearnedKnowledge)
    end
    def get_prerequisite_knowledge(this : ISyncChangeBatch2*, ppPrerequisteKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite_knowledge.call(this, ppPrerequisteKnowledge)
    end
    def get_source_forgotten_knowledge(this : ISyncChangeBatch2*, ppSourceForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_forgotten_knowledge.call(this, ppSourceForgottenKnowledge)
    end
    def set_last_batch(this : ISyncChangeBatch2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_batch.call(this)
    end
    def set_work_estimate_for_batch(this : ISyncChangeBatch2*, dwWorkForBatch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_estimate_for_batch.call(this, dwWorkForBatch)
    end
    def set_remaining_work_estimate_for_session(this : ISyncChangeBatch2*, dwRemainingWorkForSession : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remaining_work_estimate_for_session.call(this, dwRemainingWorkForSession)
    end
    def serialize(this : ISyncChangeBatch2*, pbChangeBatch : UInt8*, pcbChangeBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbChangeBatch, pcbChangeBatch)
    end
    def begin_unordered_group(this : ISyncChangeBatch2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_unordered_group.call(this)
    end
    def end_unordered_group(this : ISyncChangeBatch2*, pMadeWithKnowledge : Void*, fAllChangesForKnowledge : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_unordered_group.call(this, pMadeWithKnowledge, fAllChangesForKnowledge)
    end
    def add_logged_conflict(this : ISyncChangeBatch2*, pbOwnerReplicaId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwFlags : UInt32, dwWorkForChange : UInt32, pConflictKnowledge : Void*, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_logged_conflict.call(this, pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, pConflictKnowledge, ppChangeBuilder)
    end
    def add_merge_tombstone_metadata_to_group(this : ISyncChangeBatch2*, pbOwnerReplicaId : UInt8*, pbWinnerItemId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwWorkForChange : UInt32, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_merge_tombstone_metadata_to_group.call(this, pbOwnerReplicaId, pbWinnerItemId, pbItemId, pChangeVersion, pCreationVersion, dwWorkForChange, ppChangeBuilder)
    end
    def add_merge_tombstone_logged_conflict(this : ISyncChangeBatch2*, pbOwnerReplicaId : UInt8*, pbWinnerItemId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwWorkForChange : UInt32, pConflictKnowledge : Void*, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_merge_tombstone_logged_conflict.call(this, pbOwnerReplicaId, pbWinnerItemId, pbItemId, pChangeVersion, pCreationVersion, dwWorkForChange, pConflictKnowledge, ppChangeBuilder)
    end

  end

  @[Extern]
  record ISyncFullEnumerationChangeBatch2Vtbl,
    query_interface : Proc(ISyncFullEnumerationChangeBatch2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncFullEnumerationChangeBatch2*, UInt32),
    release : Proc(ISyncFullEnumerationChangeBatch2*, UInt32),
    get_change_enumerator : Proc(ISyncFullEnumerationChangeBatch2*, Void**, Win32cr::Foundation::HRESULT),
    get_is_last_batch : Proc(ISyncFullEnumerationChangeBatch2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_work_estimate_for_batch : Proc(ISyncFullEnumerationChangeBatch2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_remaining_work_estimate_for_session : Proc(ISyncFullEnumerationChangeBatch2*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_ordered_group : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, Win32cr::Foundation::HRESULT),
    end_ordered_group : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    add_item_metadata_to_group : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_learned_knowledge : Proc(ISyncFullEnumerationChangeBatch2*, Void**, Win32cr::Foundation::HRESULT),
    get_prerequisite_knowledge : Proc(ISyncFullEnumerationChangeBatch2*, Void**, Win32cr::Foundation::HRESULT),
    get_source_forgotten_knowledge : Proc(ISyncFullEnumerationChangeBatch2*, Void**, Win32cr::Foundation::HRESULT),
    set_last_batch : Proc(ISyncFullEnumerationChangeBatch2*, Win32cr::Foundation::HRESULT),
    set_work_estimate_for_batch : Proc(ISyncFullEnumerationChangeBatch2*, UInt32, Win32cr::Foundation::HRESULT),
    set_remaining_work_estimate_for_session : Proc(ISyncFullEnumerationChangeBatch2*, UInt32, Win32cr::Foundation::HRESULT),
    serialize : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_learned_knowledge_after_recovery_complete : Proc(ISyncFullEnumerationChangeBatch2*, Void**, Win32cr::Foundation::HRESULT),
    get_closed_lower_bound_item_id : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_closed_upper_bound_item_id : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    add_merge_tombstone_metadata_to_group : Proc(ISyncFullEnumerationChangeBatch2*, UInt8*, UInt8*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::System::WindowsSync::SYNC_VERSION*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncFullEnumerationChangeBatch2, lpVtbl : ISyncFullEnumerationChangeBatch2Vtbl* do
    GUID = LibC::GUID.new(0xe06449f4_u32, 0xa205_u16, 0x4b65_u16, StaticArray[0x97_u8, 0x24_u8, 0x1_u8, 0xb2_u8, 0x21_u8, 0x1_u8, 0xee_u8, 0xc1_u8])
    def query_interface(this : ISyncFullEnumerationChangeBatch2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncFullEnumerationChangeBatch2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncFullEnumerationChangeBatch2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_change_enumerator(this : ISyncFullEnumerationChangeBatch2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_enumerator.call(this, ppEnum)
    end
    def get_is_last_batch(this : ISyncFullEnumerationChangeBatch2*, pfLastBatch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_is_last_batch.call(this, pfLastBatch)
    end
    def get_work_estimate_for_batch(this : ISyncFullEnumerationChangeBatch2*, pdwWorkForBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_estimate_for_batch.call(this, pdwWorkForBatch)
    end
    def get_remaining_work_estimate_for_session(this : ISyncFullEnumerationChangeBatch2*, pdwRemainingWorkForSession : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remaining_work_estimate_for_session.call(this, pdwRemainingWorkForSession)
    end
    def begin_ordered_group(this : ISyncFullEnumerationChangeBatch2*, pbLowerBound : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_ordered_group.call(this, pbLowerBound)
    end
    def end_ordered_group(this : ISyncFullEnumerationChangeBatch2*, pbUpperBound : UInt8*, pMadeWithKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ordered_group.call(this, pbUpperBound, pMadeWithKnowledge)
    end
    def add_item_metadata_to_group(this : ISyncFullEnumerationChangeBatch2*, pbOwnerReplicaId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwFlags : UInt32, dwWorkForChange : UInt32, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item_metadata_to_group.call(this, pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, ppChangeBuilder)
    end
    def get_learned_knowledge(this : ISyncFullEnumerationChangeBatch2*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge.call(this, ppLearnedKnowledge)
    end
    def get_prerequisite_knowledge(this : ISyncFullEnumerationChangeBatch2*, ppPrerequisteKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite_knowledge.call(this, ppPrerequisteKnowledge)
    end
    def get_source_forgotten_knowledge(this : ISyncFullEnumerationChangeBatch2*, ppSourceForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_forgotten_knowledge.call(this, ppSourceForgottenKnowledge)
    end
    def set_last_batch(this : ISyncFullEnumerationChangeBatch2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_batch.call(this)
    end
    def set_work_estimate_for_batch(this : ISyncFullEnumerationChangeBatch2*, dwWorkForBatch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_estimate_for_batch.call(this, dwWorkForBatch)
    end
    def set_remaining_work_estimate_for_session(this : ISyncFullEnumerationChangeBatch2*, dwRemainingWorkForSession : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_remaining_work_estimate_for_session.call(this, dwRemainingWorkForSession)
    end
    def serialize(this : ISyncFullEnumerationChangeBatch2*, pbChangeBatch : UInt8*, pcbChangeBatch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbChangeBatch, pcbChangeBatch)
    end
    def get_learned_knowledge_after_recovery_complete(this : ISyncFullEnumerationChangeBatch2*, ppLearnedKnowledgeAfterRecoveryComplete : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge_after_recovery_complete.call(this, ppLearnedKnowledgeAfterRecoveryComplete)
    end
    def get_closed_lower_bound_item_id(this : ISyncFullEnumerationChangeBatch2*, pbClosedLowerBoundItemId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closed_lower_bound_item_id.call(this, pbClosedLowerBoundItemId, pcbIdSize)
    end
    def get_closed_upper_bound_item_id(this : ISyncFullEnumerationChangeBatch2*, pbClosedUpperBoundItemId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closed_upper_bound_item_id.call(this, pbClosedUpperBoundItemId, pcbIdSize)
    end
    def add_merge_tombstone_metadata_to_group(this : ISyncFullEnumerationChangeBatch2*, pbOwnerReplicaId : UInt8*, pbWinnerItemId : UInt8*, pbItemId : UInt8*, pChangeVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, pCreationVersion : Win32cr::System::WindowsSync::SYNC_VERSION*, dwWorkForChange : UInt32, ppChangeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_merge_tombstone_metadata_to_group.call(this, pbOwnerReplicaId, pbWinnerItemId, pbItemId, pChangeVersion, pCreationVersion, dwWorkForChange, ppChangeBuilder)
    end

  end

  @[Extern]
  record IKnowledgeSyncProviderVtbl,
    query_interface : Proc(IKnowledgeSyncProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IKnowledgeSyncProvider*, UInt32),
    release : Proc(IKnowledgeSyncProvider*, UInt32),
    get_id_parameters : Proc(IKnowledgeSyncProvider*, Win32cr::System::WindowsSync::ID_PARAMETERS*, Win32cr::Foundation::HRESULT),
    begin_session : Proc(IKnowledgeSyncProvider*, Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, Void*, Win32cr::Foundation::HRESULT),
    get_sync_batch_parameters : Proc(IKnowledgeSyncProvider*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_change_batch : Proc(IKnowledgeSyncProvider*, UInt32, Void*, Void**, Void**, Win32cr::Foundation::HRESULT),
    get_full_enumeration_change_batch : Proc(IKnowledgeSyncProvider*, UInt32, UInt8*, Void*, Void**, Void**, Win32cr::Foundation::HRESULT),
    process_change_batch : Proc(IKnowledgeSyncProvider*, Win32cr::System::WindowsSync::CONFLICT_RESOLUTION_POLICY, Void*, Void*, Void*, Win32cr::System::WindowsSync::SYNC_SESSION_STATISTICS*, Win32cr::Foundation::HRESULT),
    process_full_enumeration_change_batch : Proc(IKnowledgeSyncProvider*, Win32cr::System::WindowsSync::CONFLICT_RESOLUTION_POLICY, Void*, Void*, Void*, Win32cr::System::WindowsSync::SYNC_SESSION_STATISTICS*, Win32cr::Foundation::HRESULT),
    end_session : Proc(IKnowledgeSyncProvider*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IKnowledgeSyncProvider, lpVtbl : IKnowledgeSyncProviderVtbl* do
    GUID = LibC::GUID.new(0x43434a49_u32, 0x8da4_u16, 0x47f2_u16, StaticArray[0x81_u8, 0x72_u8, 0xad_u8, 0x7b_u8, 0x8b_u8, 0x2_u8, 0x49_u8, 0x78_u8])
    def query_interface(this : IKnowledgeSyncProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IKnowledgeSyncProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IKnowledgeSyncProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_id_parameters(this : IKnowledgeSyncProvider*, pIdParameters : Win32cr::System::WindowsSync::ID_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id_parameters.call(this, pIdParameters)
    end
    def begin_session(this : IKnowledgeSyncProvider*, role : Win32cr::System::WindowsSync::SYNC_PROVIDER_ROLE, pSessionState : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_session.call(this, role, pSessionState)
    end
    def get_sync_batch_parameters(this : IKnowledgeSyncProvider*, ppSyncKnowledge : Void**, pdwRequestedBatchSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_batch_parameters.call(this, ppSyncKnowledge, pdwRequestedBatchSize)
    end
    def get_change_batch(this : IKnowledgeSyncProvider*, dwBatchSize : UInt32, pSyncKnowledge : Void*, ppSyncChangeBatch : Void**, ppUnkDataRetriever : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_batch.call(this, dwBatchSize, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever)
    end
    def get_full_enumeration_change_batch(this : IKnowledgeSyncProvider*, dwBatchSize : UInt32, pbLowerEnumerationBound : UInt8*, pSyncKnowledge : Void*, ppSyncChangeBatch : Void**, ppUnkDataRetriever : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_full_enumeration_change_batch.call(this, dwBatchSize, pbLowerEnumerationBound, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever)
    end
    def process_change_batch(this : IKnowledgeSyncProvider*, resolutionPolicy : Win32cr::System::WindowsSync::CONFLICT_RESOLUTION_POLICY, pSourceChangeBatch : Void*, pUnkDataRetriever : Void*, pCallback : Void*, pSyncSessionStatistics : Win32cr::System::WindowsSync::SYNC_SESSION_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_change_batch.call(this, resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics)
    end
    def process_full_enumeration_change_batch(this : IKnowledgeSyncProvider*, resolutionPolicy : Win32cr::System::WindowsSync::CONFLICT_RESOLUTION_POLICY, pSourceChangeBatch : Void*, pUnkDataRetriever : Void*, pCallback : Void*, pSyncSessionStatistics : Win32cr::System::WindowsSync::SYNC_SESSION_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_full_enumeration_change_batch.call(this, resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics)
    end
    def end_session(this : IKnowledgeSyncProvider*, pSessionState : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_session.call(this, pSessionState)
    end

  end

  @[Extern]
  record ISyncChangeUnitVtbl,
    query_interface : Proc(ISyncChangeUnit*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeUnit*, UInt32),
    release : Proc(ISyncChangeUnit*, UInt32),
    get_item_change : Proc(ISyncChangeUnit*, Void**, Win32cr::Foundation::HRESULT),
    get_change_unit_id : Proc(ISyncChangeUnit*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_change_unit_version : Proc(ISyncChangeUnit*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeUnit, lpVtbl : ISyncChangeUnitVtbl* do
    GUID = LibC::GUID.new(0x60edd8ca_u32, 0x7341_u16, 0x4bb7_u16, StaticArray[0x95_u8, 0xce_u8, 0xfa_u8, 0xb6_u8, 0x39_u8, 0x4b_u8, 0x51_u8, 0xcb_u8])
    def query_interface(this : ISyncChangeUnit*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeUnit*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeUnit*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_change(this : ISyncChangeUnit*, ppSyncChange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_change.call(this, ppSyncChange)
    end
    def get_change_unit_id(this : ISyncChangeUnit*, pbChangeUnitId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_unit_id.call(this, pbChangeUnitId, pcbIdSize)
    end
    def get_change_unit_version(this : ISyncChangeUnit*, pbCurrentReplicaId : UInt8*, pVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_unit_version.call(this, pbCurrentReplicaId, pVersion)
    end

  end

  @[Extern]
  record IEnumSyncChangeUnitsVtbl,
    query_interface : Proc(IEnumSyncChangeUnits*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSyncChangeUnits*, UInt32),
    release : Proc(IEnumSyncChangeUnits*, UInt32),
    next__ : Proc(IEnumSyncChangeUnits*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSyncChangeUnits*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSyncChangeUnits*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSyncChangeUnits*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSyncChangeUnits, lpVtbl : IEnumSyncChangeUnitsVtbl* do
    GUID = LibC::GUID.new(0x346b35f1_u32, 0x8703_u16, 0x4c6d_u16, StaticArray[0xab_u8, 0x1a_u8, 0x4d_u8, 0xbc_u8, 0xa2_u8, 0xcf_u8, 0xf9_u8, 0x7f_u8])
    def query_interface(this : IEnumSyncChangeUnits*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSyncChangeUnits*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSyncChangeUnits*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSyncChangeUnits*, cChanges : UInt32, ppChangeUnit : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cChanges, ppChangeUnit, pcFetched)
    end
    def skip(this : IEnumSyncChangeUnits*, cChanges : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cChanges)
    end
    def reset(this : IEnumSyncChangeUnits*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSyncChangeUnits*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record ISyncChangeVtbl,
    query_interface : Proc(ISyncChange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChange*, UInt32),
    release : Proc(ISyncChange*, UInt32),
    get_owner_replica_id : Proc(ISyncChange*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_root_item_id : Proc(ISyncChange*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_change_version : Proc(ISyncChange*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    get_creation_version : Proc(ISyncChange*, UInt8*, Win32cr::System::WindowsSync::SYNC_VERSION*, Win32cr::Foundation::HRESULT),
    get_flags : Proc(ISyncChange*, UInt32*, Win32cr::Foundation::HRESULT),
    get_work_estimate : Proc(ISyncChange*, UInt32*, Win32cr::Foundation::HRESULT),
    get_change_units : Proc(ISyncChange*, Void**, Win32cr::Foundation::HRESULT),
    get_made_with_knowledge : Proc(ISyncChange*, Void**, Win32cr::Foundation::HRESULT),
    get_learned_knowledge : Proc(ISyncChange*, Void**, Win32cr::Foundation::HRESULT),
    set_work_estimate : Proc(ISyncChange*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChange, lpVtbl : ISyncChangeVtbl* do
    GUID = LibC::GUID.new(0xa1952beb_u32, 0xf6b_u16, 0x4711_u16, StaticArray[0xb1_u8, 0x36_u8, 0x1_u8, 0xda_u8, 0x85_u8, 0xb9_u8, 0x68_u8, 0xa6_u8])
    def query_interface(this : ISyncChange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner_replica_id(this : ISyncChange*, pbReplicaId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner_replica_id.call(this, pbReplicaId, pcbIdSize)
    end
    def get_root_item_id(this : ISyncChange*, pbRootItemId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_item_id.call(this, pbRootItemId, pcbIdSize)
    end
    def get_change_version(this : ISyncChange*, pbCurrentReplicaId : UInt8*, pVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_version.call(this, pbCurrentReplicaId, pVersion)
    end
    def get_creation_version(this : ISyncChange*, pbCurrentReplicaId : UInt8*, pVersion : Win32cr::System::WindowsSync::SYNC_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_creation_version.call(this, pbCurrentReplicaId, pVersion)
    end
    def get_flags(this : ISyncChange*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pdwFlags)
    end
    def get_work_estimate(this : ISyncChange*, pdwWork : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_estimate.call(this, pdwWork)
    end
    def get_change_units(this : ISyncChange*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_units.call(this, ppEnum)
    end
    def get_made_with_knowledge(this : ISyncChange*, ppMadeWithKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_made_with_knowledge.call(this, ppMadeWithKnowledge)
    end
    def get_learned_knowledge(this : ISyncChange*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge.call(this, ppLearnedKnowledge)
    end
    def set_work_estimate(this : ISyncChange*, dwWork : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_estimate.call(this, dwWork)
    end

  end

  @[Extern]
  record ISyncChangeWithPrerequisiteVtbl,
    query_interface : Proc(ISyncChangeWithPrerequisite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeWithPrerequisite*, UInt32),
    release : Proc(ISyncChangeWithPrerequisite*, UInt32),
    get_prerequisite_knowledge : Proc(ISyncChangeWithPrerequisite*, Void**, Win32cr::Foundation::HRESULT),
    get_learned_knowledge_with_prerequisite : Proc(ISyncChangeWithPrerequisite*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeWithPrerequisite, lpVtbl : ISyncChangeWithPrerequisiteVtbl* do
    GUID = LibC::GUID.new(0x9e38382f_u32, 0x1589_u16, 0x48c3_u16, StaticArray[0x92_u8, 0xe4_u8, 0x5_u8, 0xec_u8, 0xdc_u8, 0xb4_u8, 0xf3_u8, 0xf7_u8])
    def query_interface(this : ISyncChangeWithPrerequisite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeWithPrerequisite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeWithPrerequisite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_prerequisite_knowledge(this : ISyncChangeWithPrerequisite*, ppPrerequisiteKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prerequisite_knowledge.call(this, ppPrerequisiteKnowledge)
    end
    def get_learned_knowledge_with_prerequisite(this : ISyncChangeWithPrerequisite*, pDestinationKnowledge : Void*, ppLearnedKnowledgeWithPrerequisite : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge_with_prerequisite.call(this, pDestinationKnowledge, ppLearnedKnowledgeWithPrerequisite)
    end

  end

  @[Extern]
  record ISyncFullEnumerationChangeVtbl,
    query_interface : Proc(ISyncFullEnumerationChange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncFullEnumerationChange*, UInt32),
    release : Proc(ISyncFullEnumerationChange*, UInt32),
    get_learned_knowledge_after_recovery_complete : Proc(ISyncFullEnumerationChange*, Void**, Win32cr::Foundation::HRESULT),
    get_learned_forgotten_knowledge : Proc(ISyncFullEnumerationChange*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncFullEnumerationChange, lpVtbl : ISyncFullEnumerationChangeVtbl* do
    GUID = LibC::GUID.new(0x9785e0bd_u32, 0xbdff_u16, 0x40c4_u16, StaticArray[0x98_u8, 0xc5_u8, 0xb3_u8, 0x4b_u8, 0x2f_u8, 0x19_u8, 0x91_u8, 0xb3_u8])
    def query_interface(this : ISyncFullEnumerationChange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncFullEnumerationChange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncFullEnumerationChange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_learned_knowledge_after_recovery_complete(this : ISyncFullEnumerationChange*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_knowledge_after_recovery_complete.call(this, ppLearnedKnowledge)
    end
    def get_learned_forgotten_knowledge(this : ISyncFullEnumerationChange*, ppLearnedForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_forgotten_knowledge.call(this, ppLearnedForgottenKnowledge)
    end

  end

  @[Extern]
  record ISyncMergeTombstoneChangeVtbl,
    query_interface : Proc(ISyncMergeTombstoneChange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncMergeTombstoneChange*, UInt32),
    release : Proc(ISyncMergeTombstoneChange*, UInt32),
    get_winner_item_id : Proc(ISyncMergeTombstoneChange*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncMergeTombstoneChange, lpVtbl : ISyncMergeTombstoneChangeVtbl* do
    GUID = LibC::GUID.new(0x6ec62597_u32, 0x903_u16, 0x484c_u16, StaticArray[0xad_u8, 0x61_u8, 0x36_u8, 0xd6_u8, 0xe9_u8, 0x38_u8, 0xf4_u8, 0x7b_u8])
    def query_interface(this : ISyncMergeTombstoneChange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncMergeTombstoneChange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncMergeTombstoneChange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_winner_item_id(this : ISyncMergeTombstoneChange*, pbWinnerItemId : UInt8*, pcbIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_winner_item_id.call(this, pbWinnerItemId, pcbIdSize)
    end

  end

  @[Extern]
  record IEnumItemIdsVtbl,
    query_interface : Proc(IEnumItemIds*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumItemIds*, UInt32),
    release : Proc(IEnumItemIds*, UInt32),
    next__ : Proc(IEnumItemIds*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumItemIds, lpVtbl : IEnumItemIdsVtbl* do
    GUID = LibC::GUID.new(0x43aa3f61_u32, 0x4b2e_u16, 0x4b60_u16, StaticArray[0x83_u8, 0xdf_u8, 0xb1_u8, 0x10_u8, 0xd3_u8, 0xe1_u8, 0x48_u8, 0xf1_u8])
    def query_interface(this : IEnumItemIds*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumItemIds*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumItemIds*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumItemIds*, pbItemId : UInt8*, pcbItemIdSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, pbItemId, pcbItemIdSize)
    end

  end

  @[Extern]
  record IFilterKeyMapVtbl,
    query_interface : Proc(IFilterKeyMap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFilterKeyMap*, UInt32),
    release : Proc(IFilterKeyMap*, UInt32),
    get_count : Proc(IFilterKeyMap*, UInt32*, Win32cr::Foundation::HRESULT),
    add_filter : Proc(IFilterKeyMap*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_filter : Proc(IFilterKeyMap*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    serialize : Proc(IFilterKeyMap*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFilterKeyMap, lpVtbl : IFilterKeyMapVtbl* do
    GUID = LibC::GUID.new(0xca169652_u32, 0x7c6_u16, 0x4708_u16, StaticArray[0xa3_u8, 0xda_u8, 0x6e_u8, 0x4e_u8, 0xba_u8, 0x8d_u8, 0x22_u8, 0x97_u8])
    def query_interface(this : IFilterKeyMap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFilterKeyMap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFilterKeyMap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IFilterKeyMap*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pdwCount)
    end
    def add_filter(this : IFilterKeyMap*, pISyncFilter : Void*, pdwFilterKey : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_filter.call(this, pISyncFilter, pdwFilterKey)
    end
    def get_filter(this : IFilterKeyMap*, dwFilterKey : UInt32, ppISyncFilter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter.call(this, dwFilterKey, ppISyncFilter)
    end
    def serialize(this : IFilterKeyMap*, pbFilterKeyMap : UInt8*, pcbFilterKeyMap : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pbFilterKeyMap, pcbFilterKeyMap)
    end

  end

  @[Extern]
  record ISyncChangeWithFilterKeyMapVtbl,
    query_interface : Proc(ISyncChangeWithFilterKeyMap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeWithFilterKeyMap*, UInt32),
    release : Proc(ISyncChangeWithFilterKeyMap*, UInt32),
    get_filter_count : Proc(ISyncChangeWithFilterKeyMap*, UInt32*, Win32cr::Foundation::HRESULT),
    get_filter_change : Proc(ISyncChangeWithFilterKeyMap*, UInt32, Win32cr::System::WindowsSync::SYNC_FILTER_CHANGE*, Win32cr::Foundation::HRESULT),
    get_all_change_units_present_flag : Proc(ISyncChangeWithFilterKeyMap*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_filter_forgotten_knowledge : Proc(ISyncChangeWithFilterKeyMap*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_filtered_replica_learned_knowledge : Proc(ISyncChangeWithFilterKeyMap*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_learned_filter_forgotten_knowledge : Proc(ISyncChangeWithFilterKeyMap*, Void*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_filtered_replica_learned_forgotten_knowledge : Proc(ISyncChangeWithFilterKeyMap*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete : Proc(ISyncChangeWithFilterKeyMap*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_learned_filter_forgotten_knowledge_after_recovery_complete : Proc(ISyncChangeWithFilterKeyMap*, Void*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeWithFilterKeyMap, lpVtbl : ISyncChangeWithFilterKeyMapVtbl* do
    GUID = LibC::GUID.new(0xbfe1ef00_u32, 0xe87d_u16, 0x42fd_u16, StaticArray[0xa4_u8, 0xe9_u8, 0x24_u8, 0x2d_u8, 0x70_u8, 0x41_u8, 0x4a_u8, 0xef_u8])
    def query_interface(this : ISyncChangeWithFilterKeyMap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeWithFilterKeyMap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeWithFilterKeyMap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_filter_count(this : ISyncChangeWithFilterKeyMap*, pdwFilterCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_count.call(this, pdwFilterCount)
    end
    def get_filter_change(this : ISyncChangeWithFilterKeyMap*, dwFilterKey : UInt32, pFilterChange : Win32cr::System::WindowsSync::SYNC_FILTER_CHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_change.call(this, dwFilterKey, pFilterChange)
    end
    def get_all_change_units_present_flag(this : ISyncChangeWithFilterKeyMap*, pfAllChangeUnitsPresent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_all_change_units_present_flag.call(this, pfAllChangeUnitsPresent)
    end
    def get_filter_forgotten_knowledge(this : ISyncChangeWithFilterKeyMap*, dwFilterKey : UInt32, ppIFilterForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_forgotten_knowledge.call(this, dwFilterKey, ppIFilterForgottenKnowledge)
    end
    def get_filtered_replica_learned_knowledge(this : ISyncChangeWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, ppLearnedKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filtered_replica_learned_knowledge.call(this, pDestinationKnowledge, pNewMoveins, ppLearnedKnowledge)
    end
    def get_learned_filter_forgotten_knowledge(this : ISyncChangeWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, dwFilterKey : UInt32, ppLearnedFilterForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_filter_forgotten_knowledge.call(this, pDestinationKnowledge, pNewMoveins, dwFilterKey, ppLearnedFilterForgottenKnowledge)
    end
    def get_filtered_replica_learned_forgotten_knowledge(this : ISyncChangeWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, ppLearnedForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filtered_replica_learned_forgotten_knowledge.call(this, pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge)
    end
    def get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete(this : ISyncChangeWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, ppLearnedForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete.call(this, pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge)
    end
    def get_learned_filter_forgotten_knowledge_after_recovery_complete(this : ISyncChangeWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, dwFilterKey : UInt32, ppLearnedFilterForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_filter_forgotten_knowledge_after_recovery_complete.call(this, pDestinationKnowledge, pNewMoveins, dwFilterKey, ppLearnedFilterForgottenKnowledge)
    end

  end

  @[Extern]
  record ISyncChangeBatchWithFilterKeyMapVtbl,
    query_interface : Proc(ISyncChangeBatchWithFilterKeyMap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncChangeBatchWithFilterKeyMap*, UInt32),
    release : Proc(ISyncChangeBatchWithFilterKeyMap*, UInt32),
    get_filter_key_map : Proc(ISyncChangeBatchWithFilterKeyMap*, Void**, Win32cr::Foundation::HRESULT),
    set_filter_key_map : Proc(ISyncChangeBatchWithFilterKeyMap*, Void*, Win32cr::Foundation::HRESULT),
    set_filter_forgotten_knowledge : Proc(ISyncChangeBatchWithFilterKeyMap*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_filtered_replica_learned_knowledge : Proc(ISyncChangeBatchWithFilterKeyMap*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_learned_filter_forgotten_knowledge : Proc(ISyncChangeBatchWithFilterKeyMap*, Void*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_filtered_replica_learned_forgotten_knowledge : Proc(ISyncChangeBatchWithFilterKeyMap*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete : Proc(ISyncChangeBatchWithFilterKeyMap*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_learned_filter_forgotten_knowledge_after_recovery_complete : Proc(ISyncChangeBatchWithFilterKeyMap*, Void*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncChangeBatchWithFilterKeyMap, lpVtbl : ISyncChangeBatchWithFilterKeyMapVtbl* do
    GUID = LibC::GUID.new(0xde247002_u32, 0x566d_u16, 0x459a_u16, StaticArray[0xa6_u8, 0xed_u8, 0xa5_u8, 0xaa_u8, 0xb3_u8, 0x45_u8, 0x9f_u8, 0xb7_u8])
    def query_interface(this : ISyncChangeBatchWithFilterKeyMap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncChangeBatchWithFilterKeyMap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncChangeBatchWithFilterKeyMap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_filter_key_map(this : ISyncChangeBatchWithFilterKeyMap*, ppIFilterKeyMap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter_key_map.call(this, ppIFilterKeyMap)
    end
    def set_filter_key_map(this : ISyncChangeBatchWithFilterKeyMap*, pIFilterKeyMap : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_filter_key_map.call(this, pIFilterKeyMap)
    end
    def set_filter_forgotten_knowledge(this : ISyncChangeBatchWithFilterKeyMap*, dwFilterKey : UInt32, pFilterForgottenKnowledge : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_filter_forgotten_knowledge.call(this, dwFilterKey, pFilterForgottenKnowledge)
    end
    def get_filtered_replica_learned_knowledge(this : ISyncChangeBatchWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, ppLearnedForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filtered_replica_learned_knowledge.call(this, pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge)
    end
    def get_learned_filter_forgotten_knowledge(this : ISyncChangeBatchWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, dwFilterKey : UInt32, ppLearnedFilterForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_filter_forgotten_knowledge.call(this, pDestinationKnowledge, pNewMoveins, dwFilterKey, ppLearnedFilterForgottenKnowledge)
    end
    def get_filtered_replica_learned_forgotten_knowledge(this : ISyncChangeBatchWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, ppLearnedForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filtered_replica_learned_forgotten_knowledge.call(this, pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge)
    end
    def get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete(this : ISyncChangeBatchWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, ppLearnedForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filtered_replica_learned_forgotten_knowledge_after_recovery_complete.call(this, pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge)
    end
    def get_learned_filter_forgotten_knowledge_after_recovery_complete(this : ISyncChangeBatchWithFilterKeyMap*, pDestinationKnowledge : Void*, pNewMoveins : Void*, dwFilterKey : UInt32, ppLearnedFilterForgottenKnowledge : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_learned_filter_forgotten_knowledge_after_recovery_complete.call(this, pDestinationKnowledge, pNewMoveins, dwFilterKey, ppLearnedFilterForgottenKnowledge)
    end

  end

  @[Extern]
  record IDataRetrieverCallbackVtbl,
    query_interface : Proc(IDataRetrieverCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDataRetrieverCallback*, UInt32),
    release : Proc(IDataRetrieverCallback*, UInt32),
    load_change_data_complete : Proc(IDataRetrieverCallback*, Void*, Win32cr::Foundation::HRESULT),
    load_change_data_error : Proc(IDataRetrieverCallback*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDataRetrieverCallback, lpVtbl : IDataRetrieverCallbackVtbl* do
    GUID = LibC::GUID.new(0x71b4863b_u32, 0xf969_u16, 0x4676_u16, StaticArray[0xbb_u8, 0xc3_u8, 0x3d_u8, 0x9f_u8, 0xdc_u8, 0x3f_u8, 0xb2_u8, 0xc7_u8])
    def query_interface(this : IDataRetrieverCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDataRetrieverCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDataRetrieverCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load_change_data_complete(this : IDataRetrieverCallback*, pUnkData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_change_data_complete.call(this, pUnkData)
    end
    def load_change_data_error(this : IDataRetrieverCallback*, hrError : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_change_data_error.call(this, hrError)
    end

  end

  @[Extern]
  record ILoadChangeContextVtbl,
    query_interface : Proc(ILoadChangeContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILoadChangeContext*, UInt32),
    release : Proc(ILoadChangeContext*, UInt32),
    get_sync_change : Proc(ILoadChangeContext*, Void**, Win32cr::Foundation::HRESULT),
    set_recoverable_error_on_change : Proc(ILoadChangeContext*, Win32cr::Foundation::HRESULT, Void*, Win32cr::Foundation::HRESULT),
    set_recoverable_error_on_change_unit : Proc(ILoadChangeContext*, Win32cr::Foundation::HRESULT, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILoadChangeContext, lpVtbl : ILoadChangeContextVtbl* do
    GUID = LibC::GUID.new(0x44a4aaca_u32, 0xec39_u16, 0x46d5_u16, StaticArray[0xb5_u8, 0xc9_u8, 0xd6_u8, 0x33_u8, 0xc0_u8, 0xee_u8, 0x67_u8, 0xe2_u8])
    def query_interface(this : ILoadChangeContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILoadChangeContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILoadChangeContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sync_change(this : ILoadChangeContext*, ppSyncChange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_change.call(this, ppSyncChange)
    end
    def set_recoverable_error_on_change(this : ILoadChangeContext*, hrError : Win32cr::Foundation::HRESULT, pErrorData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_recoverable_error_on_change.call(this, hrError, pErrorData)
    end
    def set_recoverable_error_on_change_unit(this : ILoadChangeContext*, hrError : Win32cr::Foundation::HRESULT, pChangeUnit : Void*, pErrorData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_recoverable_error_on_change_unit.call(this, hrError, pChangeUnit, pErrorData)
    end

  end

  @[Extern]
  record ISynchronousDataRetrieverVtbl,
    query_interface : Proc(ISynchronousDataRetriever*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISynchronousDataRetriever*, UInt32),
    release : Proc(ISynchronousDataRetriever*, UInt32),
    get_id_parameters : Proc(ISynchronousDataRetriever*, Win32cr::System::WindowsSync::ID_PARAMETERS*, Win32cr::Foundation::HRESULT),
    load_change_data : Proc(ISynchronousDataRetriever*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISynchronousDataRetriever, lpVtbl : ISynchronousDataRetrieverVtbl* do
    GUID = LibC::GUID.new(0x9b22f2a9_u32, 0xa4cd_u16, 0x4648_u16, StaticArray[0x9d_u8, 0x8e_u8, 0x3a_u8, 0x51_u8, 0xd_u8, 0x4d_u8, 0xa0_u8, 0x4b_u8])
    def query_interface(this : ISynchronousDataRetriever*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISynchronousDataRetriever*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISynchronousDataRetriever*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_id_parameters(this : ISynchronousDataRetriever*, pIdParameters : Win32cr::System::WindowsSync::ID_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id_parameters.call(this, pIdParameters)
    end
    def load_change_data(this : ISynchronousDataRetriever*, pLoadChangeContext : Void*, ppUnkData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_change_data.call(this, pLoadChangeContext, ppUnkData)
    end

  end

  @[Extern]
  record IAsynchronousDataRetrieverVtbl,
    query_interface : Proc(IAsynchronousDataRetriever*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAsynchronousDataRetriever*, UInt32),
    release : Proc(IAsynchronousDataRetriever*, UInt32),
    get_id_parameters : Proc(IAsynchronousDataRetriever*, Win32cr::System::WindowsSync::ID_PARAMETERS*, Win32cr::Foundation::HRESULT),
    register_callback : Proc(IAsynchronousDataRetriever*, Void*, Win32cr::Foundation::HRESULT),
    revoke_callback : Proc(IAsynchronousDataRetriever*, Void*, Win32cr::Foundation::HRESULT),
    load_change_data : Proc(IAsynchronousDataRetriever*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAsynchronousDataRetriever, lpVtbl : IAsynchronousDataRetrieverVtbl* do
    GUID = LibC::GUID.new(0x9fc7e470_u32, 0x61ea_u16, 0x4a88_u16, StaticArray[0x9b_u8, 0xe4_u8, 0xdf_u8, 0x56_u8, 0xa2_u8, 0x7c_u8, 0xfe_u8, 0xf2_u8])
    def query_interface(this : IAsynchronousDataRetriever*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAsynchronousDataRetriever*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAsynchronousDataRetriever*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_id_parameters(this : IAsynchronousDataRetriever*, pIdParameters : Win32cr::System::WindowsSync::ID_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id_parameters.call(this, pIdParameters)
    end
    def register_callback(this : IAsynchronousDataRetriever*, pDataRetrieverCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_callback.call(this, pDataRetrieverCallback)
    end
    def revoke_callback(this : IAsynchronousDataRetriever*, pDataRetrieverCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke_callback.call(this, pDataRetrieverCallback)
    end
    def load_change_data(this : IAsynchronousDataRetriever*, pLoadChangeContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_change_data.call(this, pLoadChangeContext)
    end

  end

  @[Extern]
  record IFilterRequestCallbackVtbl,
    query_interface : Proc(IFilterRequestCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFilterRequestCallback*, UInt32),
    release : Proc(IFilterRequestCallback*, UInt32),
    request_filter : Proc(IFilterRequestCallback*, Void*, Win32cr::System::WindowsSync::FILTERING_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFilterRequestCallback, lpVtbl : IFilterRequestCallbackVtbl* do
    GUID = LibC::GUID.new(0x82df8873_u32, 0x6360_u16, 0x463a_u16, StaticArray[0xa8_u8, 0xa1_u8, 0xed_u8, 0xe5_u8, 0xe1_u8, 0xa1_u8, 0x59_u8, 0x4d_u8])
    def query_interface(this : IFilterRequestCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFilterRequestCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFilterRequestCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def request_filter(this : IFilterRequestCallback*, pFilter : Void*, filteringType : Win32cr::System::WindowsSync::FILTERING_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_filter.call(this, pFilter, filteringType)
    end

  end

  @[Extern]
  record IRequestFilteredSyncVtbl,
    query_interface : Proc(IRequestFilteredSync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRequestFilteredSync*, UInt32),
    release : Proc(IRequestFilteredSync*, UInt32),
    specify_filter : Proc(IRequestFilteredSync*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRequestFilteredSync, lpVtbl : IRequestFilteredSyncVtbl* do
    GUID = LibC::GUID.new(0x2e020184_u32, 0x6d18_u16, 0x46a7_u16, StaticArray[0xa3_u8, 0x2a_u8, 0xda_u8, 0x4a_u8, 0xeb_u8, 0x6_u8, 0x69_u8, 0x6c_u8])
    def query_interface(this : IRequestFilteredSync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRequestFilteredSync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRequestFilteredSync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def specify_filter(this : IRequestFilteredSync*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.specify_filter.call(this, pCallback)
    end

  end

  @[Extern]
  record ISupportFilteredSyncVtbl,
    query_interface : Proc(ISupportFilteredSync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISupportFilteredSync*, UInt32),
    release : Proc(ISupportFilteredSync*, UInt32),
    add_filter : Proc(ISupportFilteredSync*, Void*, Win32cr::System::WindowsSync::FILTERING_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISupportFilteredSync, lpVtbl : ISupportFilteredSyncVtbl* do
    GUID = LibC::GUID.new(0x3d128ded_u32, 0xd555_u16, 0x4e0d_u16, StaticArray[0xbf_u8, 0x4b_u8, 0xfb_u8, 0x21_u8, 0x3a_u8, 0x8a_u8, 0x93_u8, 0x2_u8])
    def query_interface(this : ISupportFilteredSync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISupportFilteredSync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISupportFilteredSync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_filter(this : ISupportFilteredSync*, pFilter : Void*, filteringType : Win32cr::System::WindowsSync::FILTERING_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_filter.call(this, pFilter, filteringType)
    end

  end

  @[Extern]
  record IFilterTrackingRequestCallbackVtbl,
    query_interface : Proc(IFilterTrackingRequestCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFilterTrackingRequestCallback*, UInt32),
    release : Proc(IFilterTrackingRequestCallback*, UInt32),
    request_tracked_filter : Proc(IFilterTrackingRequestCallback*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFilterTrackingRequestCallback, lpVtbl : IFilterTrackingRequestCallbackVtbl* do
    GUID = LibC::GUID.new(0x713ca7bb_u32, 0xc858_u16, 0x4674_u16, StaticArray[0xb4_u8, 0xb6_u8, 0x11_u8, 0x22_u8, 0x43_u8, 0x65_u8, 0x87_u8, 0xa9_u8])
    def query_interface(this : IFilterTrackingRequestCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFilterTrackingRequestCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFilterTrackingRequestCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def request_tracked_filter(this : IFilterTrackingRequestCallback*, pFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_tracked_filter.call(this, pFilter)
    end

  end

  @[Extern]
  record IFilterTrackingProviderVtbl,
    query_interface : Proc(IFilterTrackingProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFilterTrackingProvider*, UInt32),
    release : Proc(IFilterTrackingProvider*, UInt32),
    specify_tracked_filters : Proc(IFilterTrackingProvider*, Void*, Win32cr::Foundation::HRESULT),
    add_tracked_filter : Proc(IFilterTrackingProvider*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFilterTrackingProvider, lpVtbl : IFilterTrackingProviderVtbl* do
    GUID = LibC::GUID.new(0x743383c0_u32, 0xfc4e_u16, 0x45ba_u16, StaticArray[0xad_u8, 0x81_u8, 0xd9_u8, 0xd8_u8, 0x4c_u8, 0x7a_u8, 0x24_u8, 0xf8_u8])
    def query_interface(this : IFilterTrackingProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFilterTrackingProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFilterTrackingProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def specify_tracked_filters(this : IFilterTrackingProvider*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.specify_tracked_filters.call(this, pCallback)
    end
    def add_tracked_filter(this : IFilterTrackingProvider*, pFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_tracked_filter.call(this, pFilter)
    end

  end

  @[Extern]
  record ISupportLastWriteTimeVtbl,
    query_interface : Proc(ISupportLastWriteTime*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISupportLastWriteTime*, UInt32),
    release : Proc(ISupportLastWriteTime*, UInt32),
    get_item_change_time : Proc(ISupportLastWriteTime*, UInt8*, UInt64*, Win32cr::Foundation::HRESULT),
    get_change_unit_change_time : Proc(ISupportLastWriteTime*, UInt8*, UInt8*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISupportLastWriteTime, lpVtbl : ISupportLastWriteTimeVtbl* do
    GUID = LibC::GUID.new(0xeadf816f_u32, 0xd0bd_u16, 0x43ca_u16, StaticArray[0x8f_u8, 0x40_u8, 0x5a_u8, 0xcd_u8, 0xc6_u8, 0xc0_u8, 0x6f_u8, 0x7a_u8])
    def query_interface(this : ISupportLastWriteTime*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISupportLastWriteTime*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISupportLastWriteTime*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_change_time(this : ISupportLastWriteTime*, pbItemId : UInt8*, pullTimestamp : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_change_time.call(this, pbItemId, pullTimestamp)
    end
    def get_change_unit_change_time(this : ISupportLastWriteTime*, pbItemId : UInt8*, pbChangeUnitId : UInt8*, pullTimestamp : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_unit_change_time.call(this, pbItemId, pbChangeUnitId, pullTimestamp)
    end

  end

  @[Extern]
  record IProviderConverterVtbl,
    query_interface : Proc(IProviderConverter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProviderConverter*, UInt32),
    release : Proc(IProviderConverter*, UInt32),
    initialize__ : Proc(IProviderConverter*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProviderConverter, lpVtbl : IProviderConverterVtbl* do
    GUID = LibC::GUID.new(0x809b7276_u32, 0x98cf_u16, 0x4957_u16, StaticArray[0x93_u8, 0xa5_u8, 0xe_u8, 0xbd_u8, 0xd3_u8, 0xdd_u8, 0xdf_u8, 0xfd_u8])
    def query_interface(this : IProviderConverter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProviderConverter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProviderConverter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IProviderConverter*, pISyncProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pISyncProvider)
    end

  end

  @[Extern]
  record ISyncDataConverterVtbl,
    query_interface : Proc(ISyncDataConverter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncDataConverter*, UInt32),
    release : Proc(ISyncDataConverter*, UInt32),
    convert_data_retriever_from_provider_format : Proc(ISyncDataConverter*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    convert_data_retriever_to_provider_format : Proc(ISyncDataConverter*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    convert_data_from_provider_format : Proc(ISyncDataConverter*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    convert_data_to_provider_format : Proc(ISyncDataConverter*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncDataConverter, lpVtbl : ISyncDataConverterVtbl* do
    GUID = LibC::GUID.new(0x435d4861_u32, 0x68d5_u16, 0x44aa_u16, StaticArray[0xa0_u8, 0xf9_u8, 0x72_u8, 0xa0_u8, 0xb0_u8, 0xe_u8, 0xf9_u8, 0xcf_u8])
    def query_interface(this : ISyncDataConverter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncDataConverter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncDataConverter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def convert_data_retriever_from_provider_format(this : ISyncDataConverter*, pUnkDataRetrieverIn : Void*, pEnumSyncChanges : Void*, ppUnkDataOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_data_retriever_from_provider_format.call(this, pUnkDataRetrieverIn, pEnumSyncChanges, ppUnkDataOut)
    end
    def convert_data_retriever_to_provider_format(this : ISyncDataConverter*, pUnkDataRetrieverIn : Void*, pEnumSyncChanges : Void*, ppUnkDataOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_data_retriever_to_provider_format.call(this, pUnkDataRetrieverIn, pEnumSyncChanges, ppUnkDataOut)
    end
    def convert_data_from_provider_format(this : ISyncDataConverter*, pDataContext : Void*, pUnkDataIn : Void*, ppUnkDataOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_data_from_provider_format.call(this, pDataContext, pUnkDataIn, ppUnkDataOut)
    end
    def convert_data_to_provider_format(this : ISyncDataConverter*, pDataContext : Void*, pUnkDataOut : Void*, ppUnkDataout : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_data_to_provider_format.call(this, pDataContext, pUnkDataOut, ppUnkDataout)
    end

  end

  @[Extern]
  record ISyncProviderRegistrationVtbl,
    query_interface : Proc(ISyncProviderRegistration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncProviderRegistration*, UInt32),
    release : Proc(ISyncProviderRegistration*, UInt32),
    create_sync_provider_config_ui_registration_instance : Proc(ISyncProviderRegistration*, Win32cr::System::WindowsSync::SyncProviderConfigUIConfiguration*, Void**, Win32cr::Foundation::HRESULT),
    unregister_sync_provider_config_ui : Proc(ISyncProviderRegistration*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    enumerate_sync_provider_config_u_is : Proc(ISyncProviderRegistration*, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_sync_provider_registration_instance : Proc(ISyncProviderRegistration*, Win32cr::System::WindowsSync::SyncProviderConfiguration*, Void**, Win32cr::Foundation::HRESULT),
    unregister_sync_provider : Proc(ISyncProviderRegistration*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_sync_provider_config_ui_infofor_provider : Proc(ISyncProviderRegistration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enumerate_sync_providers : Proc(ISyncProviderRegistration*, LibC::GUID*, UInt32, UInt32, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_sync_provider_info : Proc(ISyncProviderRegistration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_sync_provider_from_instance_id : Proc(ISyncProviderRegistration*, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_sync_provider_config_ui_info : Proc(ISyncProviderRegistration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_sync_provider_config_ui_from_instance_id : Proc(ISyncProviderRegistration*, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_sync_provider_state : Proc(ISyncProviderRegistration*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    set_sync_provider_state : Proc(ISyncProviderRegistration*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    register_for_event : Proc(ISyncProviderRegistration*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    revoke_event : Proc(ISyncProviderRegistration*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    get_change : Proc(ISyncProviderRegistration*, Win32cr::Foundation::HANDLE, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncProviderRegistration, lpVtbl : ISyncProviderRegistrationVtbl* do
    GUID = LibC::GUID.new(0xcb45953b_u32, 0x7624_u16, 0x47bc_u16, StaticArray[0xa4_u8, 0x72_u8, 0xeb_u8, 0x8c_u8, 0xac_u8, 0x6b_u8, 0x22_u8, 0x2e_u8])
    def query_interface(this : ISyncProviderRegistration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncProviderRegistration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncProviderRegistration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_sync_provider_config_ui_registration_instance(this : ISyncProviderRegistration*, pConfigUIConfig : Win32cr::System::WindowsSync::SyncProviderConfigUIConfiguration*, ppConfigUIInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_sync_provider_config_ui_registration_instance.call(this, pConfigUIConfig, ppConfigUIInfo)
    end
    def unregister_sync_provider_config_ui(this : ISyncProviderRegistration*, pguidInstanceId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_sync_provider_config_ui.call(this, pguidInstanceId)
    end
    def enumerate_sync_provider_config_u_is(this : ISyncProviderRegistration*, pguidContentType : LibC::GUID*, dwSupportedArchitecture : UInt32, ppEnumSyncProviderConfigUIInfos : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_sync_provider_config_u_is.call(this, pguidContentType, dwSupportedArchitecture, ppEnumSyncProviderConfigUIInfos)
    end
    def create_sync_provider_registration_instance(this : ISyncProviderRegistration*, pProviderConfiguration : Win32cr::System::WindowsSync::SyncProviderConfiguration*, ppProviderInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_sync_provider_registration_instance.call(this, pProviderConfiguration, ppProviderInfo)
    end
    def unregister_sync_provider(this : ISyncProviderRegistration*, pguidInstanceId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_sync_provider.call(this, pguidInstanceId)
    end
    def get_sync_provider_config_ui_infofor_provider(this : ISyncProviderRegistration*, pguidProviderInstanceId : LibC::GUID*, ppProviderConfigUIInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_provider_config_ui_infofor_provider.call(this, pguidProviderInstanceId, ppProviderConfigUIInfo)
    end
    def enumerate_sync_providers(this : ISyncProviderRegistration*, pguidContentType : LibC::GUID*, dwStateFlagsToFilterMask : UInt32, dwStateFlagsToFilter : UInt32, refProviderClsId : LibC::GUID*, dwSupportedArchitecture : UInt32, ppEnumSyncProviderInfos : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_sync_providers.call(this, pguidContentType, dwStateFlagsToFilterMask, dwStateFlagsToFilter, refProviderClsId, dwSupportedArchitecture, ppEnumSyncProviderInfos)
    end
    def get_sync_provider_info(this : ISyncProviderRegistration*, pguidInstanceId : LibC::GUID*, ppProviderInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_provider_info.call(this, pguidInstanceId, ppProviderInfo)
    end
    def get_sync_provider_from_instance_id(this : ISyncProviderRegistration*, pguidInstanceId : LibC::GUID*, dwClsContext : UInt32, ppSyncProvider : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_provider_from_instance_id.call(this, pguidInstanceId, dwClsContext, ppSyncProvider)
    end
    def get_sync_provider_config_ui_info(this : ISyncProviderRegistration*, pguidInstanceId : LibC::GUID*, ppConfigUIInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_provider_config_ui_info.call(this, pguidInstanceId, ppConfigUIInfo)
    end
    def get_sync_provider_config_ui_from_instance_id(this : ISyncProviderRegistration*, pguidInstanceId : LibC::GUID*, dwClsContext : UInt32, ppConfigUI : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_provider_config_ui_from_instance_id.call(this, pguidInstanceId, dwClsContext, ppConfigUI)
    end
    def get_sync_provider_state(this : ISyncProviderRegistration*, pguidInstanceId : LibC::GUID*, pdwStateFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_provider_state.call(this, pguidInstanceId, pdwStateFlags)
    end
    def set_sync_provider_state(this : ISyncProviderRegistration*, pguidInstanceId : LibC::GUID*, dwStateFlagsMask : UInt32, dwStateFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sync_provider_state.call(this, pguidInstanceId, dwStateFlagsMask, dwStateFlags)
    end
    def register_for_event(this : ISyncProviderRegistration*, phEvent : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_for_event.call(this, phEvent)
    end
    def revoke_event(this : ISyncProviderRegistration*, hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke_event.call(this, hEvent)
    end
    def get_change(this : ISyncProviderRegistration*, hEvent : Win32cr::Foundation::HANDLE, ppChange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change.call(this, hEvent, ppChange)
    end

  end

  @[Extern]
  record IEnumSyncProviderConfigUIInfosVtbl,
    query_interface : Proc(IEnumSyncProviderConfigUIInfos*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSyncProviderConfigUIInfos*, UInt32),
    release : Proc(IEnumSyncProviderConfigUIInfos*, UInt32),
    next__ : Proc(IEnumSyncProviderConfigUIInfos*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSyncProviderConfigUIInfos*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSyncProviderConfigUIInfos*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSyncProviderConfigUIInfos*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSyncProviderConfigUIInfos, lpVtbl : IEnumSyncProviderConfigUIInfosVtbl* do
    GUID = LibC::GUID.new(0xf6be2602_u32, 0x17c6_u16, 0x4658_u16, StaticArray[0xa2_u8, 0xd7_u8, 0x68_u8, 0xed_u8, 0x33_u8, 0x30_u8, 0xf6_u8, 0x41_u8])
    def query_interface(this : IEnumSyncProviderConfigUIInfos*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSyncProviderConfigUIInfos*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSyncProviderConfigUIInfos*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSyncProviderConfigUIInfos*, cFactories : UInt32, ppSyncProviderConfigUIInfo : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cFactories, ppSyncProviderConfigUIInfo, pcFetched)
    end
    def skip(this : IEnumSyncProviderConfigUIInfos*, cFactories : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cFactories)
    end
    def reset(this : IEnumSyncProviderConfigUIInfos*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSyncProviderConfigUIInfos*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record IEnumSyncProviderInfosVtbl,
    query_interface : Proc(IEnumSyncProviderInfos*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSyncProviderInfos*, UInt32),
    release : Proc(IEnumSyncProviderInfos*, UInt32),
    next__ : Proc(IEnumSyncProviderInfos*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSyncProviderInfos*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSyncProviderInfos*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSyncProviderInfos*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSyncProviderInfos, lpVtbl : IEnumSyncProviderInfosVtbl* do
    GUID = LibC::GUID.new(0xa04ba850_u32, 0x5eb1_u16, 0x460d_u16, StaticArray[0xa9_u8, 0x73_u8, 0x39_u8, 0x3f_u8, 0xcb_u8, 0x60_u8, 0x8a_u8, 0x11_u8])
    def query_interface(this : IEnumSyncProviderInfos*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSyncProviderInfos*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSyncProviderInfos*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSyncProviderInfos*, cInstances : UInt32, ppSyncProviderInfo : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cInstances, ppSyncProviderInfo, pcFetched)
    end
    def skip(this : IEnumSyncProviderInfos*, cInstances : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cInstances)
    end
    def reset(this : IEnumSyncProviderInfos*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSyncProviderInfos*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]
  record ISyncProviderInfoVtbl,
    query_interface : Proc(ISyncProviderInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncProviderInfo*, UInt32),
    release : Proc(ISyncProviderInfo*, UInt32),
    get_count : Proc(ISyncProviderInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(ISyncProviderInfo*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ISyncProviderInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_value : Proc(ISyncProviderInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    commit : Proc(ISyncProviderInfo*, Win32cr::Foundation::HRESULT),
    get_sync_provider : Proc(ISyncProviderInfo*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncProviderInfo, lpVtbl : ISyncProviderInfoVtbl* do
    GUID = LibC::GUID.new(0x1ee135de_u32, 0x88a4_u16, 0x4504_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xf7_u8, 0x92_u8, 0xd_u8, 0x7e_u8, 0x5b_u8, 0xa6_u8])
    def query_interface(this : ISyncProviderInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncProviderInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncProviderInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : ISyncProviderInfo*, cProps : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, cProps)
    end
    def get_at(this : ISyncProviderInfo*, iProp : UInt32, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, iProp, pkey)
    end
    def get_value(this : ISyncProviderInfo*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pv : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, key, pv)
    end
    def set_value(this : ISyncProviderInfo*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, key, propvar)
    end
    def commit(this : ISyncProviderInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_sync_provider(this : ISyncProviderInfo*, dwClsContext : UInt32, ppSyncProvider : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_provider.call(this, dwClsContext, ppSyncProvider)
    end

  end

  @[Extern]
  record ISyncProviderConfigUIInfoVtbl,
    query_interface : Proc(ISyncProviderConfigUIInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncProviderConfigUIInfo*, UInt32),
    release : Proc(ISyncProviderConfigUIInfo*, UInt32),
    get_count : Proc(ISyncProviderConfigUIInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(ISyncProviderConfigUIInfo*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ISyncProviderConfigUIInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_value : Proc(ISyncProviderConfigUIInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    commit : Proc(ISyncProviderConfigUIInfo*, Win32cr::Foundation::HRESULT),
    get_sync_provider_config_ui : Proc(ISyncProviderConfigUIInfo*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncProviderConfigUIInfo, lpVtbl : ISyncProviderConfigUIInfoVtbl* do
    GUID = LibC::GUID.new(0x214141ae_u32, 0x33d7_u16, 0x4d8d_u16, StaticArray[0x8e_u8, 0x37_u8, 0xf2_u8, 0x27_u8, 0xe8_u8, 0x80_u8, 0xce_u8, 0x50_u8])
    def query_interface(this : ISyncProviderConfigUIInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncProviderConfigUIInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncProviderConfigUIInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : ISyncProviderConfigUIInfo*, cProps : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, cProps)
    end
    def get_at(this : ISyncProviderConfigUIInfo*, iProp : UInt32, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, iProp, pkey)
    end
    def get_value(this : ISyncProviderConfigUIInfo*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pv : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, key, pv)
    end
    def set_value(this : ISyncProviderConfigUIInfo*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, key, propvar)
    end
    def commit(this : ISyncProviderConfigUIInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_sync_provider_config_ui(this : ISyncProviderConfigUIInfo*, dwClsContext : UInt32, ppSyncProviderConfigUI : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_provider_config_ui.call(this, dwClsContext, ppSyncProviderConfigUI)
    end

  end

  @[Extern]
  record ISyncProviderConfigUIVtbl,
    query_interface : Proc(ISyncProviderConfigUI*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncProviderConfigUI*, UInt32),
    release : Proc(ISyncProviderConfigUI*, UInt32),
    init : Proc(ISyncProviderConfigUI*, LibC::GUID*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_registered_properties : Proc(ISyncProviderConfigUI*, Void**, Win32cr::Foundation::HRESULT),
    create_and_register_new_sync_provider : Proc(ISyncProviderConfigUI*, Win32cr::Foundation::HWND, Void*, Void**, Win32cr::Foundation::HRESULT),
    modify_sync_provider : Proc(ISyncProviderConfigUI*, Win32cr::Foundation::HWND, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncProviderConfigUI, lpVtbl : ISyncProviderConfigUIVtbl* do
    GUID = LibC::GUID.new(0x7b0705f6_u32, 0xcbcd_u16, 0x4071_u16, StaticArray[0xab_u8, 0x5_u8, 0x3b_u8, 0xdc_u8, 0x36_u8, 0x4d_u8, 0x4a_u8, 0xc_u8])
    def query_interface(this : ISyncProviderConfigUI*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncProviderConfigUI*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncProviderConfigUI*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : ISyncProviderConfigUI*, pguidInstanceId : LibC::GUID*, pguidContentType : LibC::GUID*, pConfigurationProperties : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, pguidInstanceId, pguidContentType, pConfigurationProperties)
    end
    def get_registered_properties(this : ISyncProviderConfigUI*, ppConfigUIProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registered_properties.call(this, ppConfigUIProperties)
    end
    def create_and_register_new_sync_provider(this : ISyncProviderConfigUI*, hwndParent : Win32cr::Foundation::HWND, pUnkContext : Void*, ppProviderInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_register_new_sync_provider.call(this, hwndParent, pUnkContext, ppProviderInfo)
    end
    def modify_sync_provider(this : ISyncProviderConfigUI*, hwndParent : Win32cr::Foundation::HWND, pUnkContext : Void*, pProviderInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_sync_provider.call(this, hwndParent, pUnkContext, pProviderInfo)
    end

  end

  @[Extern]
  record IRegisteredSyncProviderVtbl,
    query_interface : Proc(IRegisteredSyncProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRegisteredSyncProvider*, UInt32),
    release : Proc(IRegisteredSyncProvider*, UInt32),
    init : Proc(IRegisteredSyncProvider*, LibC::GUID*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_instance_id : Proc(IRegisteredSyncProvider*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    reset : Proc(IRegisteredSyncProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRegisteredSyncProvider, lpVtbl : IRegisteredSyncProviderVtbl* do
    GUID = LibC::GUID.new(0x913bcf76_u32, 0x47c1_u16, 0x40b5_u16, StaticArray[0xa8_u8, 0x96_u8, 0x5e_u8, 0x8a_u8, 0x9c_u8, 0x41_u8, 0x4c_u8, 0x14_u8])
    def query_interface(this : IRegisteredSyncProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRegisteredSyncProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRegisteredSyncProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : IRegisteredSyncProvider*, pguidInstanceId : LibC::GUID*, pguidContentType : LibC::GUID*, pContextPropertyStore : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, pguidInstanceId, pguidContentType, pContextPropertyStore)
    end
    def get_instance_id(this : IRegisteredSyncProvider*, pguidInstanceId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instance_id.call(this, pguidInstanceId)
    end
    def reset(this : IRegisteredSyncProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record ISyncRegistrationChangeVtbl,
    query_interface : Proc(ISyncRegistrationChange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISyncRegistrationChange*, UInt32),
    release : Proc(ISyncRegistrationChange*, UInt32),
    get_event : Proc(ISyncRegistrationChange*, Win32cr::System::WindowsSync::SYNC_REGISTRATION_EVENT*, Win32cr::Foundation::HRESULT),
    get_instance_id : Proc(ISyncRegistrationChange*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISyncRegistrationChange, lpVtbl : ISyncRegistrationChangeVtbl* do
    GUID = LibC::GUID.new(0xeea0d9ae_u32, 0x6b29_u16, 0x43b4_u16, StaticArray[0x9e_u8, 0x70_u8, 0xe3_u8, 0xae_u8, 0x33_u8, 0xbb_u8, 0x2c_u8, 0x3b_u8])
    def query_interface(this : ISyncRegistrationChange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISyncRegistrationChange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISyncRegistrationChange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_event(this : ISyncRegistrationChange*, psreEvent : Win32cr::System::WindowsSync::SYNC_REGISTRATION_EVENT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event.call(this, psreEvent)
    end
    def get_instance_id(this : ISyncRegistrationChange*, pguidInstanceId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instance_id.call(this, pguidInstanceId)
    end

  end

end