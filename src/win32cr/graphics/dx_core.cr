require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::Graphics::DXCore
  alias PFN_DXCORE_NOTIFICATION_CALLBACK = Proc(Win32cr::Graphics::DXCore::DXCoreNotificationType, Void*, Void*, Void)

  FACDXCORE_ = 2176_u32
  DXCORE_ADAPTER_ATTRIBUTE_D3D11_GRAPHICS = "8c47866b-7583-450d-f0f0-6bada895af4b"
  DXCORE_ADAPTER_ATTRIBUTE_D3D12_GRAPHICS = "0c9ece4d-2f6e-4f01-8c96-e89e331b47b1"
  DXCORE_ADAPTER_ATTRIBUTE_D3D12_CORE_COMPUTE = "248e2800-a793-4724-abaa-23a6de1be090"

  enum DXCoreAdapterProperty : UInt32
    InstanceLuid = 0_u32
    DriverVersion = 1_u32
    DriverDescription = 2_u32
    HardwareID = 3_u32
    KmdModelVersion = 4_u32
    ComputePreemptionGranularity = 5_u32
    GraphicsPreemptionGranularity = 6_u32
    DedicatedAdapterMemory = 7_u32
    DedicatedSystemMemory = 8_u32
    SharedSystemMemory = 9_u32
    AcgCompatible = 10_u32
    IsHardware = 11_u32
    IsIntegrated = 12_u32
    IsDetachable = 13_u32
    HardwareIDParts = 14_u32
  end
  enum DXCoreAdapterState : UInt32
    IsDriverUpdateInProgress = 0_u32
    AdapterMemoryBudget = 1_u32
  end
  enum DXCoreSegmentGroup : UInt32
    Local = 0_u32
    NonLocal = 1_u32
  end
  enum DXCoreNotificationType : UInt32
    AdapterListStale = 0_u32
    AdapterNoLongerValid = 1_u32
    AdapterBudgetChange = 2_u32
    AdapterHardwareContentProtectionTeardown = 3_u32
  end
  enum DXCoreAdapterPreference : UInt32
    Hardware = 0_u32
    MinimumPower = 1_u32
    HighPerformance = 2_u32
  end

  @[Extern]
  struct DXCoreHardwareID
    property vendorID : UInt32
    property deviceID : UInt32
    property subSysID : UInt32
    property revision : UInt32
    def initialize(@vendorID : UInt32, @deviceID : UInt32, @subSysID : UInt32, @revision : UInt32)
    end
  end

  @[Extern]
  struct DXCoreHardwareIDParts
    property vendorID : UInt32
    property deviceID : UInt32
    property subSystemID : UInt32
    property subVendorID : UInt32
    property revisionID : UInt32
    def initialize(@vendorID : UInt32, @deviceID : UInt32, @subSystemID : UInt32, @subVendorID : UInt32, @revisionID : UInt32)
    end
  end

  @[Extern]
  struct DXCoreAdapterMemoryBudgetNodeSegmentGroup
    property nodeIndex : UInt32
    property segmentGroup : Win32cr::Graphics::DXCore::DXCoreSegmentGroup
    def initialize(@nodeIndex : UInt32, @segmentGroup : Win32cr::Graphics::DXCore::DXCoreSegmentGroup)
    end
  end

  @[Extern]
  struct DXCoreAdapterMemoryBudget
    property budget : UInt64
    property currentUsage : UInt64
    property availableForReservation : UInt64
    property currentReservation : UInt64
    def initialize(@budget : UInt64, @currentUsage : UInt64, @availableForReservation : UInt64, @currentReservation : UInt64)
    end
  end

  @[Extern]
  record IDXCoreAdapterVtbl,
    query_interface : Proc(IDXCoreAdapter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXCoreAdapter*, UInt32),
    release : Proc(IDXCoreAdapter*, UInt32),
    is_valid : Proc(IDXCoreAdapter*, Bool),
    is_attribute_supported : Proc(IDXCoreAdapter*, LibC::GUID*, Bool),
    is_property_supported : Proc(IDXCoreAdapter*, Win32cr::Graphics::DXCore::DXCoreAdapterProperty, Bool),
    get_property : Proc(IDXCoreAdapter*, Win32cr::Graphics::DXCore::DXCoreAdapterProperty, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    get_property_size : Proc(IDXCoreAdapter*, Win32cr::Graphics::DXCore::DXCoreAdapterProperty, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    is_query_state_supported : Proc(IDXCoreAdapter*, Win32cr::Graphics::DXCore::DXCoreAdapterState, Bool),
    query_state : Proc(IDXCoreAdapter*, Win32cr::Graphics::DXCore::DXCoreAdapterState, LibC::UIntPtrT, Void*, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    is_set_state_supported : Proc(IDXCoreAdapter*, Win32cr::Graphics::DXCore::DXCoreAdapterState, Bool),
    set_state : Proc(IDXCoreAdapter*, Win32cr::Graphics::DXCore::DXCoreAdapterState, LibC::UIntPtrT, Void*, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    get_factory : Proc(IDXCoreAdapter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDXCoreAdapter, lpVtbl : IDXCoreAdapterVtbl* do
    GUID = LibC::GUID.new(0xf0db4c7f_u32, 0xfe5a_u16, 0x42a2_u16, StaticArray[0xbd_u8, 0x62_u8, 0xf2_u8, 0xa6_u8, 0xcf_u8, 0x6f_u8, 0xc8_u8, 0x3e_u8])
    def query_interface(this : IDXCoreAdapter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXCoreAdapter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXCoreAdapter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_valid(this : IDXCoreAdapter*) : Bool
      @lpVtbl.try &.value.is_valid.call(this)
    end
    def is_attribute_supported(this : IDXCoreAdapter*, attributeGUID : LibC::GUID*) : Bool
      @lpVtbl.try &.value.is_attribute_supported.call(this, attributeGUID)
    end
    def is_property_supported(this : IDXCoreAdapter*, property : Win32cr::Graphics::DXCore::DXCoreAdapterProperty) : Bool
      @lpVtbl.try &.value.is_property_supported.call(this, property)
    end
    def get_property(this : IDXCoreAdapter*, property : Win32cr::Graphics::DXCore::DXCoreAdapterProperty, bufferSize : LibC::UIntPtrT, propertyData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, property, bufferSize, propertyData)
    end
    def get_property_size(this : IDXCoreAdapter*, property : Win32cr::Graphics::DXCore::DXCoreAdapterProperty, bufferSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_size.call(this, property, bufferSize)
    end
    def is_query_state_supported(this : IDXCoreAdapter*, property : Win32cr::Graphics::DXCore::DXCoreAdapterState) : Bool
      @lpVtbl.try &.value.is_query_state_supported.call(this, property)
    end
    def query_state(this : IDXCoreAdapter*, state : Win32cr::Graphics::DXCore::DXCoreAdapterState, inputStateDetailsSize : LibC::UIntPtrT, inputStateDetails : Void*, outputBufferSize : LibC::UIntPtrT, outputBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_state.call(this, state, inputStateDetailsSize, inputStateDetails, outputBufferSize, outputBuffer)
    end
    def is_set_state_supported(this : IDXCoreAdapter*, property : Win32cr::Graphics::DXCore::DXCoreAdapterState) : Bool
      @lpVtbl.try &.value.is_set_state_supported.call(this, property)
    end
    def set_state(this : IDXCoreAdapter*, state : Win32cr::Graphics::DXCore::DXCoreAdapterState, inputStateDetailsSize : LibC::UIntPtrT, inputStateDetails : Void*, inputDataSize : LibC::UIntPtrT, inputData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state.call(this, state, inputStateDetailsSize, inputStateDetails, inputDataSize, inputData)
    end
    def get_factory(this : IDXCoreAdapter*, riid : LibC::GUID*, ppvFactory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_factory.call(this, riid, ppvFactory)
    end

  end

  @[Extern]
  record IDXCoreAdapterListVtbl,
    query_interface : Proc(IDXCoreAdapterList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXCoreAdapterList*, UInt32),
    release : Proc(IDXCoreAdapterList*, UInt32),
    get_adapter : Proc(IDXCoreAdapterList*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_adapter_count : Proc(IDXCoreAdapterList*, UInt32),
    is_stale : Proc(IDXCoreAdapterList*, Bool),
    get_factory : Proc(IDXCoreAdapterList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    sort : Proc(IDXCoreAdapterList*, UInt32, Win32cr::Graphics::DXCore::DXCoreAdapterPreference*, Win32cr::Foundation::HRESULT),
    is_adapter_preference_supported : Proc(IDXCoreAdapterList*, Win32cr::Graphics::DXCore::DXCoreAdapterPreference, Bool)


  @[Extern]
  record IDXCoreAdapterList, lpVtbl : IDXCoreAdapterListVtbl* do
    GUID = LibC::GUID.new(0x526c7776_u32, 0x40e9_u16, 0x459b_u16, StaticArray[0xb7_u8, 0x11_u8, 0xf3_u8, 0x2a_u8, 0xd7_u8, 0x6d_u8, 0xfc_u8, 0x28_u8])
    def query_interface(this : IDXCoreAdapterList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXCoreAdapterList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXCoreAdapterList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_adapter(this : IDXCoreAdapterList*, index : UInt32, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adapter.call(this, index, riid, ppvAdapter)
    end
    def get_adapter_count(this : IDXCoreAdapterList*) : UInt32
      @lpVtbl.try &.value.get_adapter_count.call(this)
    end
    def is_stale(this : IDXCoreAdapterList*) : Bool
      @lpVtbl.try &.value.is_stale.call(this)
    end
    def get_factory(this : IDXCoreAdapterList*, riid : LibC::GUID*, ppvFactory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_factory.call(this, riid, ppvFactory)
    end
    def sort(this : IDXCoreAdapterList*, numPreferences : UInt32, preferences : Win32cr::Graphics::DXCore::DXCoreAdapterPreference*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sort.call(this, numPreferences, preferences)
    end
    def is_adapter_preference_supported(this : IDXCoreAdapterList*, preference : Win32cr::Graphics::DXCore::DXCoreAdapterPreference) : Bool
      @lpVtbl.try &.value.is_adapter_preference_supported.call(this, preference)
    end

  end

  @[Extern]
  record IDXCoreAdapterFactoryVtbl,
    query_interface : Proc(IDXCoreAdapterFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXCoreAdapterFactory*, UInt32),
    release : Proc(IDXCoreAdapterFactory*, UInt32),
    create_adapter_list : Proc(IDXCoreAdapterFactory*, UInt32, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_adapter_by_luid : Proc(IDXCoreAdapterFactory*, Win32cr::Foundation::LUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    is_notification_type_supported : Proc(IDXCoreAdapterFactory*, Win32cr::Graphics::DXCore::DXCoreNotificationType, Bool),
    register_event_notification : Proc(IDXCoreAdapterFactory*, Void*, Win32cr::Graphics::DXCore::DXCoreNotificationType, Win32cr::Graphics::DXCore::PFN_DXCORE_NOTIFICATION_CALLBACK, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_event_notification : Proc(IDXCoreAdapterFactory*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDXCoreAdapterFactory, lpVtbl : IDXCoreAdapterFactoryVtbl* do
    GUID = LibC::GUID.new(0x78ee5945_u32, 0xc36e_u16, 0x4b13_u16, StaticArray[0xa6_u8, 0x69_u8, 0x0_u8, 0x5d_u8, 0xd1_u8, 0x1c_u8, 0xf_u8, 0x6_u8])
    def query_interface(this : IDXCoreAdapterFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXCoreAdapterFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXCoreAdapterFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_adapter_list(this : IDXCoreAdapterFactory*, numAttributes : UInt32, filterAttributes : LibC::GUID*, riid : LibC::GUID*, ppvAdapterList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_adapter_list.call(this, numAttributes, filterAttributes, riid, ppvAdapterList)
    end
    def get_adapter_by_luid(this : IDXCoreAdapterFactory*, adapterLUID : Win32cr::Foundation::LUID*, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adapter_by_luid.call(this, adapterLUID, riid, ppvAdapter)
    end
    def is_notification_type_supported(this : IDXCoreAdapterFactory*, notificationType : Win32cr::Graphics::DXCore::DXCoreNotificationType) : Bool
      @lpVtbl.try &.value.is_notification_type_supported.call(this, notificationType)
    end
    def register_event_notification(this : IDXCoreAdapterFactory*, dxCoreObject : Void*, notificationType : Win32cr::Graphics::DXCore::DXCoreNotificationType, callbackFunction : Win32cr::Graphics::DXCore::PFN_DXCORE_NOTIFICATION_CALLBACK, callbackContext : Void*, eventCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_event_notification.call(this, dxCoreObject, notificationType, callbackFunction, callbackContext, eventCookie)
    end
    def unregister_event_notification(this : IDXCoreAdapterFactory*, eventCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_event_notification.call(this, eventCookie)
    end

  end

  @[Link("dxcore")]
  lib C
    fun DXCoreCreateAdapterFactory(riid : LibC::GUID*, ppvFactory : Void**) : Win32cr::Foundation::HRESULT

  end
end