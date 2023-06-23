require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dxcore.dll")]
{% else %}
@[Link("dxcore")]
{% end %}
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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_valid : UInt64
    is_attribute_supported : UInt64
    is_property_supported : UInt64
    get_property : UInt64
    get_property_size : UInt64
    is_query_state_supported : UInt64
    query_state : UInt64
    is_set_state_supported : UInt64
    set_state : UInt64
    get_factory : UInt64
  end

  IDXCoreAdapter_GUID = "f0db4c7f-fe5a-42a2-bd62-f2a6cf6fc83e"
  IID_IDXCoreAdapter = LibC::GUID.new(0xf0db4c7f_u32, 0xfe5a_u16, 0x42a2_u16, StaticArray[0xbd_u8, 0x62_u8, 0xf2_u8, 0xa6_u8, 0xcf_u8, 0x6f_u8, 0xc8_u8, 0x3e_u8])
  struct IDXCoreAdapter
    lpVtbl : IDXCoreAdapterVTbl*
  end

  struct IDXCoreAdapterListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_adapter : UInt64
    get_adapter_count : UInt64
    is_stale : UInt64
    get_factory : UInt64
    sort : UInt64
    is_adapter_preference_supported : UInt64
  end

  IDXCoreAdapterList_GUID = "526c7776-40e9-459b-b711-f32ad76dfc28"
  IID_IDXCoreAdapterList = LibC::GUID.new(0x526c7776_u32, 0x40e9_u16, 0x459b_u16, StaticArray[0xb7_u8, 0x11_u8, 0xf3_u8, 0x2a_u8, 0xd7_u8, 0x6d_u8, 0xfc_u8, 0x28_u8])
  struct IDXCoreAdapterList
    lpVtbl : IDXCoreAdapterListVTbl*
  end

  struct IDXCoreAdapterFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_adapter_list : UInt64
    get_adapter_by_luid : UInt64
    is_notification_type_supported : UInt64
    register_event_notification : UInt64
    unregister_event_notification : UInt64
  end

  IDXCoreAdapterFactory_GUID = "78ee5945-c36e-4b13-a669-005dd11c0f06"
  IID_IDXCoreAdapterFactory = LibC::GUID.new(0x78ee5945_u32, 0xc36e_u16, 0x4b13_u16, StaticArray[0xa6_u8, 0x69_u8, 0x0_u8, 0x5d_u8, 0xd1_u8, 0x1c_u8, 0xf_u8, 0x6_u8])
  struct IDXCoreAdapterFactory
    lpVtbl : IDXCoreAdapterFactoryVTbl*
  end


  # Params # riid : Guid* [In],ppvfactory : Void** [In]
  fun DXCoreCreateAdapterFactory(riid : Guid*, ppvfactory : Void**) : HRESULT
end
struct LibWin32::IDXCoreAdapter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_valid : Bool
    @lpVtbl.value.is_valid.unsafe_as(Proc(Bool)).call
  end
  def is_attribute_supported(attributeguid : Guid*) : Bool
    @lpVtbl.value.is_attribute_supported.unsafe_as(Proc(Guid*, Bool)).call(attributeguid)
  end
  def is_property_supported(property : DXCoreAdapterProperty) : Bool
    @lpVtbl.value.is_property_supported.unsafe_as(Proc(DXCoreAdapterProperty, Bool)).call(property)
  end
  def get_property(property : DXCoreAdapterProperty, buffersize : LibC::UINT_PTR, propertydata : Void*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(DXCoreAdapterProperty, LibC::UINT_PTR, Void*, HRESULT)).call(property, buffersize, propertydata)
  end
  def get_property_size(property : DXCoreAdapterProperty, buffersize : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.get_property_size.unsafe_as(Proc(DXCoreAdapterProperty, LibC::UINT_PTR*, HRESULT)).call(property, buffersize)
  end
  def is_query_state_supported(property : DXCoreAdapterState) : Bool
    @lpVtbl.value.is_query_state_supported.unsafe_as(Proc(DXCoreAdapterState, Bool)).call(property)
  end
  def query_state(state : DXCoreAdapterState, inputstatedetailssize : LibC::UINT_PTR, inputstatedetails : Void*, outputbuffersize : LibC::UINT_PTR, outputbuffer : Void*) : HRESULT
    @lpVtbl.value.query_state.unsafe_as(Proc(DXCoreAdapterState, LibC::UINT_PTR, Void*, LibC::UINT_PTR, Void*, HRESULT)).call(state, inputstatedetailssize, inputstatedetails, outputbuffersize, outputbuffer)
  end
  def is_set_state_supported(property : DXCoreAdapterState) : Bool
    @lpVtbl.value.is_set_state_supported.unsafe_as(Proc(DXCoreAdapterState, Bool)).call(property)
  end
  def set_state(state : DXCoreAdapterState, inputstatedetailssize : LibC::UINT_PTR, inputstatedetails : Void*, inputdatasize : LibC::UINT_PTR, inputdata : Void*) : HRESULT
    @lpVtbl.value.set_state.unsafe_as(Proc(DXCoreAdapterState, LibC::UINT_PTR, Void*, LibC::UINT_PTR, Void*, HRESULT)).call(state, inputstatedetailssize, inputstatedetails, inputdatasize, inputdata)
  end
  def get_factory(riid : Guid*, ppvfactory : Void**) : HRESULT
    @lpVtbl.value.get_factory.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvfactory)
  end
end
struct LibWin32::IDXCoreAdapterList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_adapter(index : UInt32, riid : Guid*, ppvadapter : Void**) : HRESULT
    @lpVtbl.value.get_adapter.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(index, riid, ppvadapter)
  end
  def get_adapter_count : UInt32
    @lpVtbl.value.get_adapter_count.unsafe_as(Proc(UInt32)).call
  end
  def is_stale : Bool
    @lpVtbl.value.is_stale.unsafe_as(Proc(Bool)).call
  end
  def get_factory(riid : Guid*, ppvfactory : Void**) : HRESULT
    @lpVtbl.value.get_factory.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvfactory)
  end
  def sort(numpreferences : UInt32, preferences : DXCoreAdapterPreference*) : HRESULT
    @lpVtbl.value.sort.unsafe_as(Proc(UInt32, DXCoreAdapterPreference*, HRESULT)).call(numpreferences, preferences)
  end
  def is_adapter_preference_supported(preference : DXCoreAdapterPreference) : Bool
    @lpVtbl.value.is_adapter_preference_supported.unsafe_as(Proc(DXCoreAdapterPreference, Bool)).call(preference)
  end
end
struct LibWin32::IDXCoreAdapterFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_adapter_list(numattributes : UInt32, filterattributes : Guid*, riid : Guid*, ppvadapterlist : Void**) : HRESULT
    @lpVtbl.value.create_adapter_list.unsafe_as(Proc(UInt32, Guid*, Guid*, Void**, HRESULT)).call(numattributes, filterattributes, riid, ppvadapterlist)
  end
  def get_adapter_by_luid(adapterluid : LUID*, riid : Guid*, ppvadapter : Void**) : HRESULT
    @lpVtbl.value.get_adapter_by_luid.unsafe_as(Proc(LUID*, Guid*, Void**, HRESULT)).call(adapterluid, riid, ppvadapter)
  end
  def is_notification_type_supported(notificationtype : DXCoreNotificationType) : Bool
    @lpVtbl.value.is_notification_type_supported.unsafe_as(Proc(DXCoreNotificationType, Bool)).call(notificationtype)
  end
  def register_event_notification(dxcoreobject : IUnknown, notificationtype : DXCoreNotificationType, callbackfunction : PFN_DXCORE_NOTIFICATION_CALLBACK, callbackcontext : Void*, eventcookie : UInt32*) : HRESULT
    @lpVtbl.value.register_event_notification.unsafe_as(Proc(IUnknown, DXCoreNotificationType, PFN_DXCORE_NOTIFICATION_CALLBACK, Void*, UInt32*, HRESULT)).call(dxcoreobject, notificationtype, callbackfunction, callbackcontext, eventcookie)
  end
  def unregister_event_notification(eventcookie : UInt32) : HRESULT
    @lpVtbl.value.unregister_event_notification.unsafe_as(Proc(UInt32, HRESULT)).call(eventcookie)
  end
end
