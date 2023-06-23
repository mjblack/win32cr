require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  CLSID_CEventSystem = LibC::GUID.new(0x4e14fba2_u32, 0x2e22_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
  CLSID_CEventPublisher = LibC::GUID.new(0xab944620_u32, 0x79c6_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  CLSID_CEventClass = LibC::GUID.new(0xcdbec9c0_u32, 0x7a68_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  CLSID_CEventSubscription = LibC::GUID.new(0x7542e960_u32, 0x79c7_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  CLSID_EventObjectChange = LibC::GUID.new(0xd0565000_u32, 0x9df4_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x81_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xca_u8, 0xa_u8, 0xa7_u8])
  CLSID_EventObjectChange2 = LibC::GUID.new(0xbb07bacd_u32, 0xcd56_u16, 0x4e63_u16, StaticArray[0xa8_u8, 0xff_u8, 0xcb_u8, 0xf0_u8, 0x35_u8, 0x5f_u8, 0xb9_u8, 0xf4_u8])


  enum EOC_ChangeType : Int32
    EOC_NewObject = 0
    EOC_ModifiedObject = 1
    EOC_DeletedObject = 2
  end

  struct COMEVENTSYSCHANGEINFO
    cb_size : UInt32
    change_type : EOC_ChangeType
    object_id : UInt8*
    partition_id : UInt8*
    application_id : UInt8*
    reserved : Guid[10]*
  end


  struct IEventSystemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    query : UInt64
    store : UInt64
    remove : UInt64
    get_event_object_change_event_class_id : UInt64
    query_s : UInt64
    remove_s : UInt64
  end

  IEventSystem_GUID = "4e14fb9f-2e22-11d1-9964-00c04fbbb345"
  IID_IEventSystem = LibC::GUID.new(0x4e14fb9f_u32, 0x2e22_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
  struct IEventSystem
    lpVtbl : IEventSystemVTbl*
  end

  struct IEventPublisherVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_publisher_id : UInt64
    put_publisher_id : UInt64
    get_publisher_name : UInt64
    put_publisher_name : UInt64
    get_publisher_type : UInt64
    put_publisher_type : UInt64
    get_owner_sid : UInt64
    put_owner_sid : UInt64
    get_description : UInt64
    put_description : UInt64
    get_default_property : UInt64
    put_default_property : UInt64
    remove_default_property : UInt64
    get_default_property_collection : UInt64
  end

  IEventPublisher_GUID = "e341516b-2e32-11d1-9964-00c04fbbb345"
  IID_IEventPublisher = LibC::GUID.new(0xe341516b_u32, 0x2e32_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
  struct IEventPublisher
    lpVtbl : IEventPublisherVTbl*
  end

  struct IEventClassVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_event_class_id : UInt64
    put_event_class_id : UInt64
    get_event_class_name : UInt64
    put_event_class_name : UInt64
    get_owner_sid : UInt64
    put_owner_sid : UInt64
    get_firing_interface_id : UInt64
    put_firing_interface_id : UInt64
    get_description : UInt64
    put_description : UInt64
    get_custom_config_clsid : UInt64
    put_custom_config_clsid : UInt64
    get_type_lib : UInt64
    put_type_lib : UInt64
  end

  IEventClass_GUID = "fb2b72a0-7a68-11d1-88f9-0080c7d771bf"
  IID_IEventClass = LibC::GUID.new(0xfb2b72a0_u32, 0x7a68_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  struct IEventClass
    lpVtbl : IEventClassVTbl*
  end

  struct IEventClass2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_event_class_id : UInt64
    put_event_class_id : UInt64
    get_event_class_name : UInt64
    put_event_class_name : UInt64
    get_owner_sid : UInt64
    put_owner_sid : UInt64
    get_firing_interface_id : UInt64
    put_firing_interface_id : UInt64
    get_description : UInt64
    put_description : UInt64
    get_custom_config_clsid : UInt64
    put_custom_config_clsid : UInt64
    get_type_lib : UInt64
    put_type_lib : UInt64
    get_publisher_id : UInt64
    put_publisher_id : UInt64
    get_multi_interface_publisher_filter_clsid : UInt64
    put_multi_interface_publisher_filter_clsid : UInt64
    get_allow_inproc_activation : UInt64
    put_allow_inproc_activation : UInt64
    get_fire_in_parallel : UInt64
    put_fire_in_parallel : UInt64
  end

  IEventClass2_GUID = "fb2b72a1-7a68-11d1-88f9-0080c7d771bf"
  IID_IEventClass2 = LibC::GUID.new(0xfb2b72a1_u32, 0x7a68_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  struct IEventClass2
    lpVtbl : IEventClass2VTbl*
  end

  struct IEventSubscriptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_subscription_id : UInt64
    put_subscription_id : UInt64
    get_subscription_name : UInt64
    put_subscription_name : UInt64
    get_publisher_id : UInt64
    put_publisher_id : UInt64
    get_event_class_id : UInt64
    put_event_class_id : UInt64
    get_method_name : UInt64
    put_method_name : UInt64
    get_subscriber_clsid : UInt64
    put_subscriber_clsid : UInt64
    get_subscriber_interface : UInt64
    put_subscriber_interface : UInt64
    get_per_user : UInt64
    put_per_user : UInt64
    get_owner_sid : UInt64
    put_owner_sid : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_description : UInt64
    put_description : UInt64
    get_machine_name : UInt64
    put_machine_name : UInt64
    get_publisher_property : UInt64
    put_publisher_property : UInt64
    remove_publisher_property : UInt64
    get_publisher_property_collection : UInt64
    get_subscriber_property : UInt64
    put_subscriber_property : UInt64
    remove_subscriber_property : UInt64
    get_subscriber_property_collection : UInt64
    get_interface_id : UInt64
    put_interface_id : UInt64
  end

  IEventSubscription_GUID = "4a6b0e15-2e38-11d1-9965-00c04fbbb345"
  IID_IEventSubscription = LibC::GUID.new(0x4a6b0e15_u32, 0x2e38_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x65_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
  struct IEventSubscription
    lpVtbl : IEventSubscriptionVTbl*
  end

  struct IFiringControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    fire_subscription : UInt64
  end

  IFiringControl_GUID = "e0498c93-4efe-11d1-9971-00c04fbbb345"
  IID_IFiringControl = LibC::GUID.new(0xe0498c93_u32, 0x4efe_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x71_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
  struct IFiringControl
    lpVtbl : IFiringControlVTbl*
  end

  struct IPublisherFilterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    prepare_to_fire : UInt64
  end

  IPublisherFilter_GUID = "465e5cc0-7b26-11d1-88fb-0080c7d771bf"
  IID_IPublisherFilter = LibC::GUID.new(0x465e5cc0_u32, 0x7b26_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xfb_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  struct IPublisherFilter
    lpVtbl : IPublisherFilterVTbl*
  end

  struct IMultiInterfacePublisherFilterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    prepare_to_fire : UInt64
  end

  IMultiInterfacePublisherFilter_GUID = "465e5cc1-7b26-11d1-88fb-0080c7d771bf"
  IID_IMultiInterfacePublisherFilter = LibC::GUID.new(0x465e5cc1_u32, 0x7b26_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xfb_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  struct IMultiInterfacePublisherFilter
    lpVtbl : IMultiInterfacePublisherFilterVTbl*
  end

  struct IEventObjectChangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    changed_subscription : UInt64
    changed_event_class : UInt64
    changed_publisher : UInt64
  end

  IEventObjectChange_GUID = "f4a07d70-2e25-11d1-9964-00c04fbbb345"
  IID_IEventObjectChange = LibC::GUID.new(0xf4a07d70_u32, 0x2e25_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
  struct IEventObjectChange
    lpVtbl : IEventObjectChangeVTbl*
  end

  struct IEventObjectChange2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    changed_subscription : UInt64
    changed_event_class : UInt64
  end

  IEventObjectChange2_GUID = "7701a9c3-bd68-438f-83e0-67bf4f53a422"
  IID_IEventObjectChange2 = LibC::GUID.new(0x7701a9c3_u32, 0xbd68_u16, 0x438f_u16, StaticArray[0x83_u8, 0xe0_u8, 0x67_u8, 0xbf_u8, 0x4f_u8, 0x53_u8, 0xa4_u8, 0x22_u8])
  struct IEventObjectChange2
    lpVtbl : IEventObjectChange2VTbl*
  end

  struct IEnumEventObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumEventObject_GUID = "f4a07d63-2e25-11d1-9964-00c04fbbb345"
  IID_IEnumEventObject = LibC::GUID.new(0xf4a07d63_u32, 0x2e25_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
  struct IEnumEventObject
    lpVtbl : IEnumEventObjectVTbl*
  end

  struct IEventObjectCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_new_enum : UInt64
    get_count : UInt64
    add : UInt64
    remove : UInt64
  end

  IEventObjectCollection_GUID = "f89ac270-d4eb-11d1-b682-00805fc79216"
  IID_IEventObjectCollection = LibC::GUID.new(0xf89ac270_u32, 0xd4eb_u16, 0x11d1_u16, StaticArray[0xb6_u8, 0x82_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x16_u8])
  struct IEventObjectCollection
    lpVtbl : IEventObjectCollectionVTbl*
  end

  struct IEventPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    put_name : UInt64
    get_value : UInt64
    put_value : UInt64
  end

  IEventProperty_GUID = "da538ee2-f4de-11d1-b6bb-00805fc79216"
  IID_IEventProperty = LibC::GUID.new(0xda538ee2_u32, 0xf4de_u16, 0x11d1_u16, StaticArray[0xb6_u8, 0xbb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x16_u8])
  struct IEventProperty
    lpVtbl : IEventPropertyVTbl*
  end

  struct IEventControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    set_publisher_filter : UInt64
    get_allow_inproc_activation : UInt64
    put_allow_inproc_activation : UInt64
    get_subscriptions : UInt64
    set_default_query : UInt64
  end

  IEventControl_GUID = "0343e2f4-86f6-11d1-b760-00c04fb926af"
  IID_IEventControl = LibC::GUID.new(0x343e2f4_u32, 0x86f6_u16, 0x11d1_u16, StaticArray[0xb7_u8, 0x60_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x26_u8, 0xaf_u8])
  struct IEventControl
    lpVtbl : IEventControlVTbl*
  end

  struct IMultiInterfaceEventControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_multi_interface_publisher_filter : UInt64
    get_subscriptions : UInt64
    set_default_query : UInt64
    get_allow_inproc_activation : UInt64
    put_allow_inproc_activation : UInt64
    get_fire_in_parallel : UInt64
    put_fire_in_parallel : UInt64
  end

  IMultiInterfaceEventControl_GUID = "0343e2f5-86f6-11d1-b760-00c04fb926af"
  IID_IMultiInterfaceEventControl = LibC::GUID.new(0x343e2f5_u32, 0x86f6_u16, 0x11d1_u16, StaticArray[0xb7_u8, 0x60_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x26_u8, 0xaf_u8])
  struct IMultiInterfaceEventControl
    lpVtbl : IMultiInterfaceEventControlVTbl*
  end

  struct IDontSupportEventSubscriptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IDontSupportEventSubscription_GUID = "784121f1-62a6-4b89-855f-d65f296de83a"
  IID_IDontSupportEventSubscription = LibC::GUID.new(0x784121f1_u32, 0x62a6_u16, 0x4b89_u16, StaticArray[0x85_u8, 0x5f_u8, 0xd6_u8, 0x5f_u8, 0x29_u8, 0x6d_u8, 0xe8_u8, 0x3a_u8])
  struct IDontSupportEventSubscription
    lpVtbl : IDontSupportEventSubscriptionVTbl*
  end

end
struct LibWin32::IEventSystem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def query(progid : UInt8*, querycriteria : UInt8*, errorindex : Int32*, ppinterface : IUnknown*) : HRESULT
    @lpVtbl.value.query.unsafe_as(Proc(UInt8*, UInt8*, Int32*, IUnknown*, HRESULT)).call(progid, querycriteria, errorindex, ppinterface)
  end
  def store(progid : UInt8*, pinterface : IUnknown) : HRESULT
    @lpVtbl.value.store.unsafe_as(Proc(UInt8*, IUnknown, HRESULT)).call(progid, pinterface)
  end
  def remove(progid : UInt8*, querycriteria : UInt8*, errorindex : Int32*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(UInt8*, UInt8*, Int32*, HRESULT)).call(progid, querycriteria, errorindex)
  end
  def get_event_object_change_event_class_id(pbstreventclassid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_object_change_event_class_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstreventclassid)
  end
  def query_s(progid : UInt8*, querycriteria : UInt8*, ppinterface : IUnknown*) : HRESULT
    @lpVtbl.value.query_s.unsafe_as(Proc(UInt8*, UInt8*, IUnknown*, HRESULT)).call(progid, querycriteria, ppinterface)
  end
  def remove_s(progid : UInt8*, querycriteria : UInt8*) : HRESULT
    @lpVtbl.value.remove_s.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(progid, querycriteria)
  end
end
struct LibWin32::IEventPublisher
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_publisher_id(pbstrpublisherid : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpublisherid)
  end
  def put_publisher_id(bstrpublisherid : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpublisherid)
  end
  def get_publisher_name(pbstrpublishername : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpublishername)
  end
  def put_publisher_name(bstrpublishername : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpublishername)
  end
  def get_publisher_type(pbstrpublishertype : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_type.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpublishertype)
  end
  def put_publisher_type(bstrpublishertype : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_type.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpublishertype)
  end
  def get_owner_sid(pbstrownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrownersid)
  end
  def put_owner_sid(bstrownersid : UInt8*) : HRESULT
    @lpVtbl.value.put_owner_sid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrownersid)
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def put_description(bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdescription)
  end
  def get_default_property(bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_default_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrpropertyname, propertyvalue)
  end
  def put_default_property(bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_default_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrpropertyname, propertyvalue)
  end
  def remove_default_property(bstrpropertyname : UInt8*) : HRESULT
    @lpVtbl.value.remove_default_property.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpropertyname)
  end
  def get_default_property_collection(collection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_default_property_collection.unsafe_as(Proc(IEventObjectCollection*, HRESULT)).call(collection)
  end
end
struct LibWin32::IEventClass
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_class_id(pbstreventclassid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstreventclassid)
  end
  def put_event_class_id(bstreventclassid : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstreventclassid)
  end
  def get_event_class_name(pbstreventclassname : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstreventclassname)
  end
  def put_event_class_name(bstreventclassname : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstreventclassname)
  end
  def get_owner_sid(pbstrownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrownersid)
  end
  def put_owner_sid(bstrownersid : UInt8*) : HRESULT
    @lpVtbl.value.put_owner_sid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrownersid)
  end
  def get_firing_interface_id(pbstrfiringinterfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_firing_interface_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfiringinterfaceid)
  end
  def put_firing_interface_id(bstrfiringinterfaceid : UInt8*) : HRESULT
    @lpVtbl.value.put_firing_interface_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrfiringinterfaceid)
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def put_description(bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdescription)
  end
  def get_custom_config_clsid(pbstrcustomconfigclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_custom_config_clsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcustomconfigclsid)
  end
  def put_custom_config_clsid(bstrcustomconfigclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_custom_config_clsid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrcustomconfigclsid)
  end
  def get_type_lib(pbstrtypelib : UInt8**) : HRESULT
    @lpVtbl.value.get_type_lib.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtypelib)
  end
  def put_type_lib(bstrtypelib : UInt8*) : HRESULT
    @lpVtbl.value.put_type_lib.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtypelib)
  end
end
struct LibWin32::IEventClass2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_class_id(pbstreventclassid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstreventclassid)
  end
  def put_event_class_id(bstreventclassid : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstreventclassid)
  end
  def get_event_class_name(pbstreventclassname : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstreventclassname)
  end
  def put_event_class_name(bstreventclassname : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstreventclassname)
  end
  def get_owner_sid(pbstrownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrownersid)
  end
  def put_owner_sid(bstrownersid : UInt8*) : HRESULT
    @lpVtbl.value.put_owner_sid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrownersid)
  end
  def get_firing_interface_id(pbstrfiringinterfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_firing_interface_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfiringinterfaceid)
  end
  def put_firing_interface_id(bstrfiringinterfaceid : UInt8*) : HRESULT
    @lpVtbl.value.put_firing_interface_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrfiringinterfaceid)
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def put_description(bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdescription)
  end
  def get_custom_config_clsid(pbstrcustomconfigclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_custom_config_clsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcustomconfigclsid)
  end
  def put_custom_config_clsid(bstrcustomconfigclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_custom_config_clsid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrcustomconfigclsid)
  end
  def get_type_lib(pbstrtypelib : UInt8**) : HRESULT
    @lpVtbl.value.get_type_lib.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtypelib)
  end
  def put_type_lib(bstrtypelib : UInt8*) : HRESULT
    @lpVtbl.value.put_type_lib.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtypelib)
  end
  def get_publisher_id(pbstrpublisherid : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpublisherid)
  end
  def put_publisher_id(bstrpublisherid : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpublisherid)
  end
  def get_multi_interface_publisher_filter_clsid(pbstrpubfilclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_multi_interface_publisher_filter_clsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpubfilclsid)
  end
  def put_multi_interface_publisher_filter_clsid(bstrpubfilclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_multi_interface_publisher_filter_clsid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpubfilclsid)
  end
  def get_allow_inproc_activation(pfallowinprocactivation : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allow_inproc_activation.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfallowinprocactivation)
  end
  def put_allow_inproc_activation(fallowinprocactivation : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_allow_inproc_activation.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fallowinprocactivation)
  end
  def get_fire_in_parallel(pffireinparallel : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_fire_in_parallel.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pffireinparallel)
  end
  def put_fire_in_parallel(ffireinparallel : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_fire_in_parallel.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(ffireinparallel)
  end
end
struct LibWin32::IEventSubscription
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_subscription_id(pbstrsubscriptionid : UInt8**) : HRESULT
    @lpVtbl.value.get_subscription_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubscriptionid)
  end
  def put_subscription_id(bstrsubscriptionid : UInt8*) : HRESULT
    @lpVtbl.value.put_subscription_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsubscriptionid)
  end
  def get_subscription_name(pbstrsubscriptionname : UInt8**) : HRESULT
    @lpVtbl.value.get_subscription_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubscriptionname)
  end
  def put_subscription_name(bstrsubscriptionname : UInt8*) : HRESULT
    @lpVtbl.value.put_subscription_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsubscriptionname)
  end
  def get_publisher_id(pbstrpublisherid : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpublisherid)
  end
  def put_publisher_id(bstrpublisherid : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpublisherid)
  end
  def get_event_class_id(pbstreventclassid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstreventclassid)
  end
  def put_event_class_id(bstreventclassid : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstreventclassid)
  end
  def get_method_name(pbstrmethodname : UInt8**) : HRESULT
    @lpVtbl.value.get_method_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmethodname)
  end
  def put_method_name(bstrmethodname : UInt8*) : HRESULT
    @lpVtbl.value.put_method_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrmethodname)
  end
  def get_subscriber_clsid(pbstrsubscriberclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_subscriber_clsid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsubscriberclsid)
  end
  def put_subscriber_clsid(bstrsubscriberclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_subscriber_clsid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsubscriberclsid)
  end
  def get_subscriber_interface(ppsubscriberinterface : IUnknown*) : HRESULT
    @lpVtbl.value.get_subscriber_interface.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppsubscriberinterface)
  end
  def put_subscriber_interface(psubscriberinterface : IUnknown) : HRESULT
    @lpVtbl.value.put_subscriber_interface.unsafe_as(Proc(IUnknown, HRESULT)).call(psubscriberinterface)
  end
  def get_per_user(pfperuser : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_per_user.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfperuser)
  end
  def put_per_user(fperuser : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_per_user.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fperuser)
  end
  def get_owner_sid(pbstrownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrownersid)
  end
  def put_owner_sid(bstrownersid : UInt8*) : HRESULT
    @lpVtbl.value.put_owner_sid.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrownersid)
  end
  def get_enabled(pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenabled)
  end
  def put_enabled(fenabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenabled)
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def put_description(bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdescription)
  end
  def get_machine_name(pbstrmachinename : UInt8**) : HRESULT
    @lpVtbl.value.get_machine_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrmachinename)
  end
  def put_machine_name(bstrmachinename : UInt8*) : HRESULT
    @lpVtbl.value.put_machine_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrmachinename)
  end
  def get_publisher_property(bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_publisher_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrpropertyname, propertyvalue)
  end
  def put_publisher_property(bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_publisher_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrpropertyname, propertyvalue)
  end
  def remove_publisher_property(bstrpropertyname : UInt8*) : HRESULT
    @lpVtbl.value.remove_publisher_property.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpropertyname)
  end
  def get_publisher_property_collection(collection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_publisher_property_collection.unsafe_as(Proc(IEventObjectCollection*, HRESULT)).call(collection)
  end
  def get_subscriber_property(bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_subscriber_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrpropertyname, propertyvalue)
  end
  def put_subscriber_property(bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_subscriber_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrpropertyname, propertyvalue)
  end
  def remove_subscriber_property(bstrpropertyname : UInt8*) : HRESULT
    @lpVtbl.value.remove_subscriber_property.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpropertyname)
  end
  def get_subscriber_property_collection(collection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_subscriber_property_collection.unsafe_as(Proc(IEventObjectCollection*, HRESULT)).call(collection)
  end
  def get_interface_id(pbstrinterfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrinterfaceid)
  end
  def put_interface_id(bstrinterfaceid : UInt8*) : HRESULT
    @lpVtbl.value.put_interface_id.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrinterfaceid)
  end
end
struct LibWin32::IFiringControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def fire_subscription(subscription : IEventSubscription) : HRESULT
    @lpVtbl.value.fire_subscription.unsafe_as(Proc(IEventSubscription, HRESULT)).call(subscription)
  end
end
struct LibWin32::IPublisherFilter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(methodname : UInt8*, dispuserdefined : IDispatch) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(UInt8*, IDispatch, HRESULT)).call(methodname, dispuserdefined)
  end
  def prepare_to_fire(methodname : UInt8*, firingcontrol : IFiringControl) : HRESULT
    @lpVtbl.value.prepare_to_fire.unsafe_as(Proc(UInt8*, IFiringControl, HRESULT)).call(methodname, firingcontrol)
  end
end
struct LibWin32::IMultiInterfacePublisherFilter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(peic : IMultiInterfaceEventControl) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IMultiInterfaceEventControl, HRESULT)).call(peic)
  end
  def prepare_to_fire(iid : Guid*, methodname : UInt8*, firingcontrol : IFiringControl) : HRESULT
    @lpVtbl.value.prepare_to_fire.unsafe_as(Proc(Guid*, UInt8*, IFiringControl, HRESULT)).call(iid, methodname, firingcontrol)
  end
end
struct LibWin32::IEventObjectChange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def changed_subscription(changetype : EOC_ChangeType, bstrsubscriptionid : UInt8*) : HRESULT
    @lpVtbl.value.changed_subscription.unsafe_as(Proc(EOC_ChangeType, UInt8*, HRESULT)).call(changetype, bstrsubscriptionid)
  end
  def changed_event_class(changetype : EOC_ChangeType, bstreventclassid : UInt8*) : HRESULT
    @lpVtbl.value.changed_event_class.unsafe_as(Proc(EOC_ChangeType, UInt8*, HRESULT)).call(changetype, bstreventclassid)
  end
  def changed_publisher(changetype : EOC_ChangeType, bstrpublisherid : UInt8*) : HRESULT
    @lpVtbl.value.changed_publisher.unsafe_as(Proc(EOC_ChangeType, UInt8*, HRESULT)).call(changetype, bstrpublisherid)
  end
end
struct LibWin32::IEventObjectChange2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def changed_subscription(pinfo : COMEVENTSYSCHANGEINFO*) : HRESULT
    @lpVtbl.value.changed_subscription.unsafe_as(Proc(COMEVENTSYSCHANGEINFO*, HRESULT)).call(pinfo)
  end
  def changed_event_class(pinfo : COMEVENTSYSCHANGEINFO*) : HRESULT
    @lpVtbl.value.changed_event_class.unsafe_as(Proc(COMEVENTSYSCHANGEINFO*, HRESULT)).call(pinfo)
  end
end
struct LibWin32::IEnumEventObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppinterface : IEnumEventObject*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumEventObject*, HRESULT)).call(ppinterface)
  end
  def next(creqelem : UInt32, ppinterface : IUnknown*, cretelem : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IUnknown*, UInt32*, HRESULT)).call(creqelem, ppinterface, cretelem)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(cskipelem : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(cskipelem)
  end
end
struct LibWin32::IEventObjectCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppunkenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunkenum)
  end
  def get_item(objectid : UInt8*, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(objectid, pitem)
  end
  def get_new_enum(ppenum : IEnumEventObject*) : HRESULT
    @lpVtbl.value.get_new_enum.unsafe_as(Proc(IEnumEventObject*, HRESULT)).call(ppenum)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def add(item : VARIANT*, objectid : UInt8*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(VARIANT*, UInt8*, HRESULT)).call(item, objectid)
  end
  def remove(objectid : UInt8*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(UInt8*, HRESULT)).call(objectid)
  end
end
struct LibWin32::IEventProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(propertyname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(propertyname)
  end
  def put_name(propertyname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(propertyname)
  end
  def get_value(propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(propertyvalue)
  end
  def put_value(propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(propertyvalue)
  end
end
struct LibWin32::IEventControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def set_publisher_filter(methodname : UInt8*, ppublisherfilter : IPublisherFilter) : HRESULT
    @lpVtbl.value.set_publisher_filter.unsafe_as(Proc(UInt8*, IPublisherFilter, HRESULT)).call(methodname, ppublisherfilter)
  end
  def get_allow_inproc_activation(pfallowinprocactivation : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allow_inproc_activation.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfallowinprocactivation)
  end
  def put_allow_inproc_activation(fallowinprocactivation : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_allow_inproc_activation.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fallowinprocactivation)
  end
  def get_subscriptions(methodname : UInt8*, optionalcriteria : UInt8*, optionalerrorindex : Int32*, ppcollection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_subscriptions.unsafe_as(Proc(UInt8*, UInt8*, Int32*, IEventObjectCollection*, HRESULT)).call(methodname, optionalcriteria, optionalerrorindex, ppcollection)
  end
  def set_default_query(methodname : UInt8*, criteria : UInt8*, errorindex : Int32*) : HRESULT
    @lpVtbl.value.set_default_query.unsafe_as(Proc(UInt8*, UInt8*, Int32*, HRESULT)).call(methodname, criteria, errorindex)
  end
end
struct LibWin32::IMultiInterfaceEventControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_multi_interface_publisher_filter(classfilter : IMultiInterfacePublisherFilter) : HRESULT
    @lpVtbl.value.set_multi_interface_publisher_filter.unsafe_as(Proc(IMultiInterfacePublisherFilter, HRESULT)).call(classfilter)
  end
  def get_subscriptions(eventiid : Guid*, bstrmethodname : UInt8*, optionalcriteria : UInt8*, optionalerrorindex : Int32*, ppcollection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_subscriptions.unsafe_as(Proc(Guid*, UInt8*, UInt8*, Int32*, IEventObjectCollection*, HRESULT)).call(eventiid, bstrmethodname, optionalcriteria, optionalerrorindex, ppcollection)
  end
  def set_default_query(eventiid : Guid*, bstrmethodname : UInt8*, bstrcriteria : UInt8*, errorindex : Int32*) : HRESULT
    @lpVtbl.value.set_default_query.unsafe_as(Proc(Guid*, UInt8*, UInt8*, Int32*, HRESULT)).call(eventiid, bstrmethodname, bstrcriteria, errorindex)
  end
  def get_allow_inproc_activation(pfallowinprocactivation : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allow_inproc_activation.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfallowinprocactivation)
  end
  def put_allow_inproc_activation(fallowinprocactivation : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_allow_inproc_activation.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fallowinprocactivation)
  end
  def get_fire_in_parallel(pffireinparallel : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_fire_in_parallel.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pffireinparallel)
  end
  def put_fire_in_parallel(ffireinparallel : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_fire_in_parallel.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(ffireinparallel)
  end
end
struct LibWin32::IDontSupportEventSubscription
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
