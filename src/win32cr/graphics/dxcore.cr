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

  IDXCoreAdapter_GUID = "f0db4c7f-fe5a-42a2-bd62-f2a6cf6fc83e"
  IID_IDXCoreAdapter = LibC::GUID.new(0xf0db4c7f_u32, 0xfe5a_u16, 0x42a2_u16, StaticArray[0xbd_u8, 0x62_u8, 0xf2_u8, 0xa6_u8, 0xcf_u8, 0x6f_u8, 0xc8_u8, 0x3e_u8])
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

  IDXCoreAdapterList_GUID = "526c7776-40e9-459b-b711-f32ad76dfc28"
  IID_IDXCoreAdapterList = LibC::GUID.new(0x526c7776_u32, 0x40e9_u16, 0x459b_u16, StaticArray[0xb7_u8, 0x11_u8, 0xf3_u8, 0x2a_u8, 0xd7_u8, 0x6d_u8, 0xfc_u8, 0x28_u8])
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

  IDXCoreAdapterFactory_GUID = "78ee5945-c36e-4b13-a669-005dd11c0f06"
  IID_IDXCoreAdapterFactory = LibC::GUID.new(0x78ee5945_u32, 0xc36e_u16, 0x4b13_u16, StaticArray[0xa6_u8, 0x69_u8, 0x0_u8, 0x5d_u8, 0xd1_u8, 0x1c_u8, 0xf_u8, 0x6_u8])
  struct IDXCoreAdapterFactory
    lpVtbl : IDXCoreAdapterFactoryVTbl*
  end


  # Params # riid : Guid* [In],ppvfactory : Void** [In]
  fun DXCoreCreateAdapterFactory(riid : Guid*, ppvfactory : Void**) : HRESULT
end
struct LibWin32::IDXCoreAdapter
  def query_interface(this : IDXCoreAdapter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDXCoreAdapter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDXCoreAdapter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_valid(this : IDXCoreAdapter*) : Bool
    @lpVtbl.value.is_valid.call(this)
  end
  def is_attribute_supported(this : IDXCoreAdapter*, attributeguid : Guid*) : Bool
    @lpVtbl.value.is_attribute_supported.call(this, attributeguid)
  end
  def is_property_supported(this : IDXCoreAdapter*, property : DXCoreAdapterProperty) : Bool
    @lpVtbl.value.is_property_supported.call(this, property)
  end
  def get_property(this : IDXCoreAdapter*, property : DXCoreAdapterProperty, buffersize : LibC::UINT_PTR, propertydata : Void*) : HRESULT
    @lpVtbl.value.get_property.call(this, property, buffersize, propertydata)
  end
  def get_property_size(this : IDXCoreAdapter*, property : DXCoreAdapterProperty, buffersize : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.get_property_size.call(this, property, buffersize)
  end
  def is_query_state_supported(this : IDXCoreAdapter*, property : DXCoreAdapterState) : Bool
    @lpVtbl.value.is_query_state_supported.call(this, property)
  end
  def query_state(this : IDXCoreAdapter*, state : DXCoreAdapterState, inputstatedetailssize : LibC::UINT_PTR, inputstatedetails : Void*, outputbuffersize : LibC::UINT_PTR, outputbuffer : Void*) : HRESULT
    @lpVtbl.value.query_state.call(this, state, inputstatedetailssize, inputstatedetails, outputbuffersize, outputbuffer)
  end
  def is_set_state_supported(this : IDXCoreAdapter*, property : DXCoreAdapterState) : Bool
    @lpVtbl.value.is_set_state_supported.call(this, property)
  end
  def set_state(this : IDXCoreAdapter*, state : DXCoreAdapterState, inputstatedetailssize : LibC::UINT_PTR, inputstatedetails : Void*, inputdatasize : LibC::UINT_PTR, inputdata : Void*) : HRESULT
    @lpVtbl.value.set_state.call(this, state, inputstatedetailssize, inputstatedetails, inputdatasize, inputdata)
  end
  def get_factory(this : IDXCoreAdapter*, riid : Guid*, ppvfactory : Void**) : HRESULT
    @lpVtbl.value.get_factory.call(this, riid, ppvfactory)
  end
end
struct LibWin32::IDXCoreAdapterList
  def query_interface(this : IDXCoreAdapterList*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDXCoreAdapterList*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDXCoreAdapterList*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_adapter(this : IDXCoreAdapterList*, index : UInt32, riid : Guid*, ppvadapter : Void**) : HRESULT
    @lpVtbl.value.get_adapter.call(this, index, riid, ppvadapter)
  end
  def get_adapter_count(this : IDXCoreAdapterList*) : UInt32
    @lpVtbl.value.get_adapter_count.call(this)
  end
  def is_stale(this : IDXCoreAdapterList*) : Bool
    @lpVtbl.value.is_stale.call(this)
  end
  def get_factory(this : IDXCoreAdapterList*, riid : Guid*, ppvfactory : Void**) : HRESULT
    @lpVtbl.value.get_factory.call(this, riid, ppvfactory)
  end
  def sort(this : IDXCoreAdapterList*, numpreferences : UInt32, preferences : DXCoreAdapterPreference*) : HRESULT
    @lpVtbl.value.sort.call(this, numpreferences, preferences)
  end
  def is_adapter_preference_supported(this : IDXCoreAdapterList*, preference : DXCoreAdapterPreference) : Bool
    @lpVtbl.value.is_adapter_preference_supported.call(this, preference)
  end
end
struct LibWin32::IDXCoreAdapterFactory
  def query_interface(this : IDXCoreAdapterFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDXCoreAdapterFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDXCoreAdapterFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_adapter_list(this : IDXCoreAdapterFactory*, numattributes : UInt32, filterattributes : Guid*, riid : Guid*, ppvadapterlist : Void**) : HRESULT
    @lpVtbl.value.create_adapter_list.call(this, numattributes, filterattributes, riid, ppvadapterlist)
  end
  def get_adapter_by_luid(this : IDXCoreAdapterFactory*, adapterluid : LUID*, riid : Guid*, ppvadapter : Void**) : HRESULT
    @lpVtbl.value.get_adapter_by_luid.call(this, adapterluid, riid, ppvadapter)
  end
  def is_notification_type_supported(this : IDXCoreAdapterFactory*, notificationtype : DXCoreNotificationType) : Bool
    @lpVtbl.value.is_notification_type_supported.call(this, notificationtype)
  end
  def register_event_notification(this : IDXCoreAdapterFactory*, dxcoreobject : IUnknown, notificationtype : DXCoreNotificationType, callbackfunction : PFN_DXCORE_NOTIFICATION_CALLBACK, callbackcontext : Void*, eventcookie : UInt32*) : HRESULT
    @lpVtbl.value.register_event_notification.call(this, dxcoreobject, notificationtype, callbackfunction, callbackcontext, eventcookie)
  end
  def unregister_event_notification(this : IDXCoreAdapterFactory*, eventcookie : UInt32) : HRESULT
    @lpVtbl.value.unregister_event_notification.call(this, eventcookie)
  end
end
