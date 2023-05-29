require "../system/com.cr"
require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:dxcore.dll")]
lib LibWin32
  FACDXCORE = 2176_u32
  DXCORE_ADAPTER_ATTRIBUTE_D3D11_GRAPHICS = "8c47866b-7583-450d-f0f0-6bada895af4b"
  DXCORE_ADAPTER_ATTRIBUTE_D3D12_GRAPHICS = "0c9ece4d-2f6e-4f01-8c96-e89e331b47b1"
  DXCORE_ADAPTER_ATTRIBUTE_D3D12_CORE_COMPUTE = "248e2800-a793-4724-abaa-23a6de1be090"

  alias PFN_DXCORE_NOTIFICATION_CALLBACK = Proc(DXCoreNotificationType, IUnknown, Void*, Void)


  enum DXCoreAdapterProperty : UInt32
    InstanceLuid = 0
    DriverVersion = 1
    DriverDescription = 2
    HardwareID = 3
    KmdModelVersion = 4
    ComputePreemptionGranularity = 5
    GraphicsPreemptionGranularity = 6
    DedicatedAdapterMemory = 7
    DedicatedSystemMemory = 8
    SharedSystemMemory = 9
    AcgCompatible = 10
    IsHardware = 11
    IsIntegrated = 12
    IsDetachable = 13
    HardwareIDParts = 14
  end

  enum DXCoreAdapterState : UInt32
    IsDriverUpdateInProgress = 0
    AdapterMemoryBudget = 1
  end

  enum DXCoreSegmentGroup : UInt32
    Local = 0
    NonLocal = 1
  end

  enum DXCoreNotificationType : UInt32
    AdapterListStale = 0
    AdapterNoLongerValid = 1
    AdapterBudgetChange = 2
    AdapterHardwareContentProtectionTeardown = 3
  end

  enum DXCoreAdapterPreference : UInt32
    Hardware = 0
    MinimumPower = 1
    HighPerformance = 2
  end

  struct DXCoreHardwareID
    vendor_id : UInt32
    device_id : UInt32
    sub_sys_id : UInt32
    revision : UInt32
  end
  struct DXCoreHardwareIDParts
    vendor_id : UInt32
    device_id : UInt32
    sub_system_id : UInt32
    sub_vendor_id : UInt32
    revision_id : UInt32
  end
  struct DXCoreAdapterMemoryBudgetNodeSegmentGroup
    node_index : UInt32
    segment_group : DXCoreSegmentGroup
  end
  struct DXCoreAdapterMemoryBudget
    budget : UInt64
    current_usage : UInt64
    available_for_reservation : UInt64
    current_reservation : UInt64
  end


  struct IDXCoreAdapterVTbl
    query_interface : Proc(IDXCoreAdapter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXCoreAdapter*, UInt32)
    release : Proc(IDXCoreAdapter*, UInt32)
    is_valid : Proc(IDXCoreAdapter*, Bool)
    is_attribute_supported : Proc(IDXCoreAdapter*, Guid*, Bool)
    is_property_supported : Proc(IDXCoreAdapter*, DXCoreAdapterProperty, Bool)
    get_property : Proc(IDXCoreAdapter*, DXCoreAdapterProperty, LibC::UINT_PTR, Void*, HRESULT)
    get_property_size : Proc(IDXCoreAdapter*, DXCoreAdapterProperty, LibC::UINT_PTR*, HRESULT)
    is_query_state_supported : Proc(IDXCoreAdapter*, DXCoreAdapterState, Bool)
    query_state : Proc(IDXCoreAdapter*, DXCoreAdapterState, LibC::UINT_PTR, Void*, LibC::UINT_PTR, Void*, HRESULT)
    is_set_state_supported : Proc(IDXCoreAdapter*, DXCoreAdapterState, Bool)
    set_state : Proc(IDXCoreAdapter*, DXCoreAdapterState, LibC::UINT_PTR, Void*, LibC::UINT_PTR, Void*, HRESULT)
    get_factory : Proc(IDXCoreAdapter*, Guid*, Void**, HRESULT)
  end

  struct IDXCoreAdapter
    lpVtbl : IDXCoreAdapterVTbl*
  end

  struct IDXCoreAdapterListVTbl
    query_interface : Proc(IDXCoreAdapterList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXCoreAdapterList*, UInt32)
    release : Proc(IDXCoreAdapterList*, UInt32)
    get_adapter : Proc(IDXCoreAdapterList*, UInt32, Guid*, Void**, HRESULT)
    get_adapter_count : Proc(IDXCoreAdapterList*, UInt32)
    is_stale : Proc(IDXCoreAdapterList*, Bool)
    get_factory : Proc(IDXCoreAdapterList*, Guid*, Void**, HRESULT)
    sort : Proc(IDXCoreAdapterList*, UInt32, DXCoreAdapterPreference*, HRESULT)
    is_adapter_preference_supported : Proc(IDXCoreAdapterList*, DXCoreAdapterPreference, Bool)
  end

  struct IDXCoreAdapterList
    lpVtbl : IDXCoreAdapterListVTbl*
  end

  struct IDXCoreAdapterFactoryVTbl
    query_interface : Proc(IDXCoreAdapterFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXCoreAdapterFactory*, UInt32)
    release : Proc(IDXCoreAdapterFactory*, UInt32)
    create_adapter_list : Proc(IDXCoreAdapterFactory*, UInt32, Guid*, Guid*, Void**, HRESULT)
    get_adapter_by_luid : Proc(IDXCoreAdapterFactory*, LUID*, Guid*, Void**, HRESULT)
    is_notification_type_supported : Proc(IDXCoreAdapterFactory*, DXCoreNotificationType, Bool)
    register_event_notification : Proc(IDXCoreAdapterFactory*, IUnknown, DXCoreNotificationType, PFN_DXCORE_NOTIFICATION_CALLBACK, Void*, UInt32*, HRESULT)
    unregister_event_notification : Proc(IDXCoreAdapterFactory*, UInt32, HRESULT)
  end

  struct IDXCoreAdapterFactory
    lpVtbl : IDXCoreAdapterFactoryVTbl*
  end


  # Params # riid : Guid* [In],ppvfactory : Void** [In]
  fun DXCoreCreateAdapterFactory(riid : Guid*, ppvfactory : Void**) : HRESULT
end
