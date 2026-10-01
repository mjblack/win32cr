require "./../foundation.cr"
require "./../system/com.cr"

module Win32cr::Graphics::DXCore
  extend self
  alias PFN_DXCORE_NOTIFICATION_CALLBACK = Proc(Win32cr::Graphics::DXCore::DXCoreNotificationType, Void*, Void*, Void)

  FACDXCORE_ = 2176_u32
  DXCORE_ADAPTER_ATTRIBUTE_D3D11_GRAPHICS = LibC::GUID.new(0x8c47866b_u32, 0x7583_u16, 0x450d_u16, StaticArray[0xf0_u8, 0xf0_u8, 0x6b_u8, 0xad_u8, 0xa8_u8, 0x95_u8, 0xaf_u8, 0x4b_u8])
  DXCORE_ADAPTER_ATTRIBUTE_D3D12_GRAPHICS = LibC::GUID.new(0xc9ece4d_u32, 0x2f6e_u16, 0x4f01_u16, StaticArray[0x8c_u8, 0x96_u8, 0xe8_u8, 0x9e_u8, 0x33_u8, 0x1b_u8, 0x47_u8, 0xb1_u8])
  DXCORE_ADAPTER_ATTRIBUTE_D3D12_CORE_COMPUTE = LibC::GUID.new(0x248e2800_u32, 0xa793_u16, 0x4724_u16, StaticArray[0xab_u8, 0xaa_u8, 0x23_u8, 0xa6_u8, 0xde_u8, 0x1b_u8, 0xe0_u8, 0x90_u8])
  DXCORE_ADAPTER_ATTRIBUTE_D3D12_GENERIC_ML = LibC::GUID.new(0xb71b0d41_u32, 0x1088_u16, 0x422f_u16, StaticArray[0xa2_u8, 0x7c_u8, 0x2_u8, 0x50_u8, 0xb7_u8, 0xd3_u8, 0xa9_u8, 0x88_u8])
  DXCORE_ADAPTER_ATTRIBUTE_D3D12_GENERIC_MEDIA = LibC::GUID.new(0x8eb2c848_u32, 0x82f6_u16, 0x4b49_u16, StaticArray[0xaa_u8, 0x87_u8, 0xae_u8, 0xcf_u8, 0xcf_u8, 0x1_u8, 0x74_u8, 0xc6_u8])
  DXCORE_HARDWARE_TYPE_ATTRIBUTE_GPU = LibC::GUID.new(0xb69eb219_u32, 0x3ded_u16, 0x4464_u16, StaticArray[0x97_u8, 0x9f_u8, 0xa0_u8, 0xb_u8, 0xd4_u8, 0x68_u8, 0x70_u8, 0x6_u8])
  DXCORE_HARDWARE_TYPE_ATTRIBUTE_COMPUTE_ACCELERATOR = LibC::GUID.new(0xe0b195da_u32, 0x58ef_u16, 0x4a22_u16, StaticArray[0x90_u8, 0xf1_u8, 0x1f_u8, 0x28_u8, 0x16_u8, 0x9c_u8, 0xab_u8, 0x8d_u8])
  DXCORE_HARDWARE_TYPE_ATTRIBUTE_NPU = LibC::GUID.new(0xd46140c4_u32, 0xadd7_u16, 0x451b_u16, StaticArray[0x9e_u8, 0x56_u8, 0x6_u8, 0xfe_u8, 0x8c_u8, 0x3b_u8, 0x58_u8, 0xed_u8])
  DXCORE_HARDWARE_TYPE_ATTRIBUTE_MEDIA_ACCELERATOR = LibC::GUID.new(0x66bdb96a_u32, 0x50b_u16, 0x44c7_u16, StaticArray[0xa4_u8, 0xfd_u8, 0xd1_u8, 0x44_u8, 0xce_u8, 0xa_u8, 0xb4_u8, 0x43_u8])

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
    PhysicalAdapterCount = 15_u32
    AdapterEngineCount = 16_u32
    AdapterEngineName = 17_u32
  end
  enum DXCoreAdapterState : UInt32
    IsDriverUpdateInProgress = 0_u32
    AdapterMemoryBudget = 1_u32
    AdapterMemoryUsageBytes = 2_u32
    AdapterMemoryUsageByProcessBytes = 3_u32
    AdapterEngineRunningTimeMicroseconds = 4_u32
    AdapterEngineRunningTimeByProcessMicroseconds = 5_u32
    AdapterTemperatureCelsius = 6_u32
    AdapterInUseProcessCount = 7_u32
    AdapterInUseProcessSet = 8_u32
    AdapterEngineFrequencyHertz = 9_u32
    AdapterMemoryFrequencyHertz = 10_u32
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
  enum DXCoreWorkload : UInt32
    Graphics = 0_u32
    Compute = 1_u32
    Media = 2_u32
    MachineLearning = 3_u32
  end
  @[Flags]
  enum DXCoreRuntimeFilterFlags : UInt32
    None = 0_u32
    D3D11 = 1_u32
    D3D12 = 2_u32
  end
  @[Flags]
  enum DXCoreHardwareTypeFilterFlags : UInt32
    None = 0_u32
    GPU = 1_u32
    ComputeAccelerator = 2_u32
    NPU = 4_u32
    MediaAccelerator = 8_u32
  end
  enum DXCoreMemoryType : UInt32
    Dedicated = 0_u32
    Shared = 1_u32
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
  struct DXCoreAdapterEngineIndex
    property physicalAdapterIndex : UInt32
    property engineIndex : UInt32
    def initialize(@physicalAdapterIndex : UInt32, @engineIndex : UInt32)
    end
  end

  @[Extern]
  struct DXCoreEngineQueryInput
    property adapterEngineIndex : Win32cr::Graphics::DXCore::DXCoreAdapterEngineIndex
    property processId : UInt32
    def initialize(@adapterEngineIndex : Win32cr::Graphics::DXCore::DXCoreAdapterEngineIndex, @processId : UInt32)
    end
  end

  @[Extern]
  struct DXCoreEngineQueryOutput
    property runningTime : UInt64
    property processQuerySucceeded : UInt8
    def initialize(@runningTime : UInt64, @processQuerySucceeded : UInt8)
    end
  end

  @[Extern]
  struct DXCoreMemoryUsage
    property committed : UInt64
    property resident : UInt64
    def initialize(@committed : UInt64, @resident : UInt64)
    end
  end

  @[Extern]
  struct DXCoreMemoryQueryInput
    property physicalAdapterIndex : UInt32
    property memoryType : Win32cr::Graphics::DXCore::DXCoreMemoryType
    def initialize(@physicalAdapterIndex : UInt32, @memoryType : Win32cr::Graphics::DXCore::DXCoreMemoryType)
    end
  end

  @[Extern]
  struct DXCoreProcessMemoryQueryInput
    property physicalAdapterIndex : UInt32
    property memoryType : Win32cr::Graphics::DXCore::DXCoreMemoryType
    property processId : UInt32
    def initialize(@physicalAdapterIndex : UInt32, @memoryType : Win32cr::Graphics::DXCore::DXCoreMemoryType, @processId : UInt32)
    end
  end

  @[Extern]
  struct DXCoreProcessMemoryQueryOutput
    property memoryUsage : Win32cr::Graphics::DXCore::DXCoreMemoryUsage
    property processQuerySucceeded : UInt8
    def initialize(@memoryUsage : Win32cr::Graphics::DXCore::DXCoreMemoryUsage, @processQuerySucceeded : UInt8)
    end
  end

  @[Extern]
  struct DXCoreAdapterProcessSetQueryInput
    property arraySize : UInt32
    property processIds : UInt32*
    def initialize(@arraySize : UInt32, @processIds : UInt32*)
    end
  end

  @[Extern]
  struct DXCoreAdapterProcessSetQueryOutput
    property processesWritten : UInt32
    property processesTotal : UInt32
    def initialize(@processesWritten : UInt32, @processesTotal : UInt32)
    end
  end

  @[Extern]
  struct DXCoreEngineNamePropertyInput
    property adapterEngineIndex : Win32cr::Graphics::DXCore::DXCoreAdapterEngineIndex
    property engineNameLength : UInt32
    property engineName : Win32cr::Foundation::PWSTR
    def initialize(@adapterEngineIndex : Win32cr::Graphics::DXCore::DXCoreAdapterEngineIndex, @engineNameLength : UInt32, @engineName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DXCoreEngineNamePropertyOutput
    property engineNameLength : UInt32
    def initialize(@engineNameLength : UInt32)
    end
  end

  @[Extern]
  struct DXCoreFrequencyQueryOutput
    property frequency : UInt64
    property maxFrequency : UInt64
    property maxOverclockedFrequency : UInt64
    def initialize(@frequency : UInt64, @maxFrequency : UInt64, @maxOverclockedFrequency : UInt64)
    end
  end

  @[Extern]

  record IDXCoreAdapterVtable,
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
  record IDXCoreAdapter, lpVtbl : IDXCoreAdapterVtable* do
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

  record IDXCoreAdapter1Vtable,
    query_interface : Proc(IDXCoreAdapter1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXCoreAdapter1*, UInt32),
    release : Proc(IDXCoreAdapter1*, UInt32),
    is_valid : Proc(IDXCoreAdapter1*, Bool),
    is_attribute_supported : Proc(IDXCoreAdapter1*, LibC::GUID*, Bool),
    is_property_supported : Proc(IDXCoreAdapter1*, Win32cr::Graphics::DXCore::DXCoreAdapterProperty, Bool),
    get_property : Proc(IDXCoreAdapter1*, Win32cr::Graphics::DXCore::DXCoreAdapterProperty, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    get_property_size : Proc(IDXCoreAdapter1*, Win32cr::Graphics::DXCore::DXCoreAdapterProperty, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    is_query_state_supported : Proc(IDXCoreAdapter1*, Win32cr::Graphics::DXCore::DXCoreAdapterState, Bool),
    query_state : Proc(IDXCoreAdapter1*, Win32cr::Graphics::DXCore::DXCoreAdapterState, LibC::UIntPtrT, Void*, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    is_set_state_supported : Proc(IDXCoreAdapter1*, Win32cr::Graphics::DXCore::DXCoreAdapterState, Bool),
    set_state : Proc(IDXCoreAdapter1*, Win32cr::Graphics::DXCore::DXCoreAdapterState, LibC::UIntPtrT, Void*, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    get_factory : Proc(IDXCoreAdapter1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_property_with_input : Proc(IDXCoreAdapter1*, Win32cr::Graphics::DXCore::DXCoreAdapterProperty, LibC::UIntPtrT, Void*, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDXCoreAdapter1, lpVtbl : IDXCoreAdapter1Vtable* do
    GUID = LibC::GUID.new(0xa0783366_u32, 0xcfa3_u16, 0x43be_u16, StaticArray[0x9d_u8, 0x79_u8, 0x55_u8, 0xb2_u8, 0xda_u8, 0x97_u8, 0xc6_u8, 0x3c_u8])
    def query_interface(this : IDXCoreAdapter1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXCoreAdapter1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXCoreAdapter1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_valid(this : IDXCoreAdapter1*) : Bool
      @lpVtbl.try &.value.is_valid.call(this)
    end
    def is_attribute_supported(this : IDXCoreAdapter1*, attributeGUID : LibC::GUID*) : Bool
      @lpVtbl.try &.value.is_attribute_supported.call(this, attributeGUID)
    end
    def is_property_supported(this : IDXCoreAdapter1*, property : Win32cr::Graphics::DXCore::DXCoreAdapterProperty) : Bool
      @lpVtbl.try &.value.is_property_supported.call(this, property)
    end
    def get_property(this : IDXCoreAdapter1*, property : Win32cr::Graphics::DXCore::DXCoreAdapterProperty, bufferSize : LibC::UIntPtrT, propertyData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, property, bufferSize, propertyData)
    end
    def get_property_size(this : IDXCoreAdapter1*, property : Win32cr::Graphics::DXCore::DXCoreAdapterProperty, bufferSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_size.call(this, property, bufferSize)
    end
    def is_query_state_supported(this : IDXCoreAdapter1*, property : Win32cr::Graphics::DXCore::DXCoreAdapterState) : Bool
      @lpVtbl.try &.value.is_query_state_supported.call(this, property)
    end
    def query_state(this : IDXCoreAdapter1*, state : Win32cr::Graphics::DXCore::DXCoreAdapterState, inputStateDetailsSize : LibC::UIntPtrT, inputStateDetails : Void*, outputBufferSize : LibC::UIntPtrT, outputBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_state.call(this, state, inputStateDetailsSize, inputStateDetails, outputBufferSize, outputBuffer)
    end
    def is_set_state_supported(this : IDXCoreAdapter1*, property : Win32cr::Graphics::DXCore::DXCoreAdapterState) : Bool
      @lpVtbl.try &.value.is_set_state_supported.call(this, property)
    end
    def set_state(this : IDXCoreAdapter1*, state : Win32cr::Graphics::DXCore::DXCoreAdapterState, inputStateDetailsSize : LibC::UIntPtrT, inputStateDetails : Void*, inputDataSize : LibC::UIntPtrT, inputData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state.call(this, state, inputStateDetailsSize, inputStateDetails, inputDataSize, inputData)
    end
    def get_factory(this : IDXCoreAdapter1*, riid : LibC::GUID*, ppvFactory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_factory.call(this, riid, ppvFactory)
    end
    def get_property_with_input(this : IDXCoreAdapter1*, property : Win32cr::Graphics::DXCore::DXCoreAdapterProperty, inputPropertyDetailsSize : LibC::UIntPtrT, inputPropertyDetails : Void*, outputBufferSize : LibC::UIntPtrT, outputBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_with_input.call(this, property, inputPropertyDetailsSize, inputPropertyDetails, outputBufferSize, outputBuffer)
    end

  end

  @[Extern]

  record IDXCoreAdapterListVtable,
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
  record IDXCoreAdapterList, lpVtbl : IDXCoreAdapterListVtable* do
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

  record IDXCoreAdapterFactoryVtable,
    query_interface : Proc(IDXCoreAdapterFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXCoreAdapterFactory*, UInt32),
    release : Proc(IDXCoreAdapterFactory*, UInt32),
    create_adapter_list : Proc(IDXCoreAdapterFactory*, UInt32, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_adapter_by_luid : Proc(IDXCoreAdapterFactory*, Win32cr::Foundation::LUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    is_notification_type_supported : Proc(IDXCoreAdapterFactory*, Win32cr::Graphics::DXCore::DXCoreNotificationType, Bool),
    register_event_notification : Proc(IDXCoreAdapterFactory*, Void*, Win32cr::Graphics::DXCore::DXCoreNotificationType, Win32cr::Graphics::DXCore::PFN_DXCORE_NOTIFICATION_CALLBACK, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_event_notification : Proc(IDXCoreAdapterFactory*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDXCoreAdapterFactory, lpVtbl : IDXCoreAdapterFactoryVtable* do
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

  @[Extern]

  record IDXCoreAdapterFactory1Vtable,
    query_interface : Proc(IDXCoreAdapterFactory1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXCoreAdapterFactory1*, UInt32),
    release : Proc(IDXCoreAdapterFactory1*, UInt32),
    create_adapter_list : Proc(IDXCoreAdapterFactory1*, UInt32, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_adapter_by_luid : Proc(IDXCoreAdapterFactory1*, Win32cr::Foundation::LUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    is_notification_type_supported : Proc(IDXCoreAdapterFactory1*, Win32cr::Graphics::DXCore::DXCoreNotificationType, Bool),
    register_event_notification : Proc(IDXCoreAdapterFactory1*, Void*, Win32cr::Graphics::DXCore::DXCoreNotificationType, Win32cr::Graphics::DXCore::PFN_DXCORE_NOTIFICATION_CALLBACK, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_event_notification : Proc(IDXCoreAdapterFactory1*, UInt32, Win32cr::Foundation::HRESULT),
    create_adapter_list_by_workload : Proc(IDXCoreAdapterFactory1*, Win32cr::Graphics::DXCore::DXCoreWorkload, Win32cr::Graphics::DXCore::DXCoreRuntimeFilterFlags, Win32cr::Graphics::DXCore::DXCoreHardwareTypeFilterFlags, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDXCoreAdapterFactory1, lpVtbl : IDXCoreAdapterFactory1Vtable* do
    GUID = LibC::GUID.new(0xd5682e19_u32, 0x6d21_u16, 0x401c_u16, StaticArray[0x82_u8, 0x7a_u8, 0x9a_u8, 0x51_u8, 0xa4_u8, 0xea_u8, 0x35_u8, 0xd7_u8])
    def query_interface(this : IDXCoreAdapterFactory1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXCoreAdapterFactory1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXCoreAdapterFactory1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_adapter_list(this : IDXCoreAdapterFactory1*, numAttributes : UInt32, filterAttributes : LibC::GUID*, riid : LibC::GUID*, ppvAdapterList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_adapter_list.call(this, numAttributes, filterAttributes, riid, ppvAdapterList)
    end
    def get_adapter_by_luid(this : IDXCoreAdapterFactory1*, adapterLUID : Win32cr::Foundation::LUID*, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adapter_by_luid.call(this, adapterLUID, riid, ppvAdapter)
    end
    def is_notification_type_supported(this : IDXCoreAdapterFactory1*, notificationType : Win32cr::Graphics::DXCore::DXCoreNotificationType) : Bool
      @lpVtbl.try &.value.is_notification_type_supported.call(this, notificationType)
    end
    def register_event_notification(this : IDXCoreAdapterFactory1*, dxCoreObject : Void*, notificationType : Win32cr::Graphics::DXCore::DXCoreNotificationType, callbackFunction : Win32cr::Graphics::DXCore::PFN_DXCORE_NOTIFICATION_CALLBACK, callbackContext : Void*, eventCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_event_notification.call(this, dxCoreObject, notificationType, callbackFunction, callbackContext, eventCookie)
    end
    def unregister_event_notification(this : IDXCoreAdapterFactory1*, eventCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_event_notification.call(this, eventCookie)
    end
    def create_adapter_list_by_workload(this : IDXCoreAdapterFactory1*, workload : Win32cr::Graphics::DXCore::DXCoreWorkload, runtimeFilter : Win32cr::Graphics::DXCore::DXCoreRuntimeFilterFlags, hardwareTypeFilter : Win32cr::Graphics::DXCore::DXCoreHardwareTypeFilterFlags, riid : LibC::GUID*, ppvAdapterList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_adapter_list_by_workload.call(this, workload, runtimeFilter, hardwareTypeFilter, riid, ppvAdapterList)
    end

  end

  def dXCoreCreateAdapterFactory(riid : LibC::GUID*, ppvFactory : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DXCoreCreateAdapterFactory(riid, ppvFactory)
    {% end %}
  end

  @[Link("dxcore")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun DXCoreCreateAdapterFactory(riid : LibC::GUID*, ppvFactory : Void**) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end