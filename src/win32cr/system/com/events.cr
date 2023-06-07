require "../../system/com.cr"
require "../../foundation.cr"

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
  CEventSystem = LibC::GUID.new(0x4e14fba2_u32, 0x2e22_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
  CEventPublisher = LibC::GUID.new(0xab944620_u32, 0x79c6_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  CEventClass = LibC::GUID.new(0xcdbec9c0_u32, 0x7a68_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  CEventSubscription = LibC::GUID.new(0x7542e960_u32, 0x79c7_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
  EventObjectChange = LibC::GUID.new(0xd0565000_u32, 0x9df4_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x81_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xca_u8, 0xa_u8, 0xa7_u8])
  EventObjectChange2 = LibC::GUID.new(0xbb07bacd_u32, 0xcd56_u16, 0x4e63_u16, StaticArray[0xa8_u8, 0xff_u8, 0xcb_u8, 0xf0_u8, 0x35_u8, 0x5f_u8, 0xb9_u8, 0xf4_u8])


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
    query_interface : Proc(IEventSystem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventSystem*, UInt32)
    release : Proc(IEventSystem*, UInt32)
    get_type_info_count : Proc(IEventSystem*, UInt32*, HRESULT)
    get_type_info : Proc(IEventSystem*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventSystem*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventSystem*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    query : Proc(IEventSystem*, UInt8*, UInt8*, Int32*, IUnknown*, HRESULT)
    store : Proc(IEventSystem*, UInt8*, IUnknown, HRESULT)
    remove : Proc(IEventSystem*, UInt8*, UInt8*, Int32*, HRESULT)
    get_event_object_change_event_class_id : Proc(IEventSystem*, UInt8**, HRESULT)
    query_s : Proc(IEventSystem*, UInt8*, UInt8*, IUnknown*, HRESULT)
    remove_s : Proc(IEventSystem*, UInt8*, UInt8*, HRESULT)
  end

  struct IEventSystem
    lpVtbl : IEventSystemVTbl*
  end

  struct IEventPublisherVTbl
    query_interface : Proc(IEventPublisher*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventPublisher*, UInt32)
    release : Proc(IEventPublisher*, UInt32)
    get_type_info_count : Proc(IEventPublisher*, UInt32*, HRESULT)
    get_type_info : Proc(IEventPublisher*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventPublisher*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventPublisher*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_publisher_id : Proc(IEventPublisher*, UInt8**, HRESULT)
    put_publisher_id : Proc(IEventPublisher*, UInt8*, HRESULT)
    get_publisher_name : Proc(IEventPublisher*, UInt8**, HRESULT)
    put_publisher_name : Proc(IEventPublisher*, UInt8*, HRESULT)
    get_publisher_type : Proc(IEventPublisher*, UInt8**, HRESULT)
    put_publisher_type : Proc(IEventPublisher*, UInt8*, HRESULT)
    get_owner_sid : Proc(IEventPublisher*, UInt8**, HRESULT)
    put_owner_sid : Proc(IEventPublisher*, UInt8*, HRESULT)
    get_description : Proc(IEventPublisher*, UInt8**, HRESULT)
    put_description : Proc(IEventPublisher*, UInt8*, HRESULT)
    get_default_property : Proc(IEventPublisher*, UInt8*, VARIANT*, HRESULT)
    put_default_property : Proc(IEventPublisher*, UInt8*, VARIANT*, HRESULT)
    remove_default_property : Proc(IEventPublisher*, UInt8*, HRESULT)
    get_default_property_collection : Proc(IEventPublisher*, IEventObjectCollection*, HRESULT)
  end

  struct IEventPublisher
    lpVtbl : IEventPublisherVTbl*
  end

  struct IEventClassVTbl
    query_interface : Proc(IEventClass*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventClass*, UInt32)
    release : Proc(IEventClass*, UInt32)
    get_type_info_count : Proc(IEventClass*, UInt32*, HRESULT)
    get_type_info : Proc(IEventClass*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventClass*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventClass*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_event_class_id : Proc(IEventClass*, UInt8**, HRESULT)
    put_event_class_id : Proc(IEventClass*, UInt8*, HRESULT)
    get_event_class_name : Proc(IEventClass*, UInt8**, HRESULT)
    put_event_class_name : Proc(IEventClass*, UInt8*, HRESULT)
    get_owner_sid : Proc(IEventClass*, UInt8**, HRESULT)
    put_owner_sid : Proc(IEventClass*, UInt8*, HRESULT)
    get_firing_interface_id : Proc(IEventClass*, UInt8**, HRESULT)
    put_firing_interface_id : Proc(IEventClass*, UInt8*, HRESULT)
    get_description : Proc(IEventClass*, UInt8**, HRESULT)
    put_description : Proc(IEventClass*, UInt8*, HRESULT)
    get_custom_config_clsid : Proc(IEventClass*, UInt8**, HRESULT)
    put_custom_config_clsid : Proc(IEventClass*, UInt8*, HRESULT)
    get_type_lib : Proc(IEventClass*, UInt8**, HRESULT)
    put_type_lib : Proc(IEventClass*, UInt8*, HRESULT)
  end

  struct IEventClass
    lpVtbl : IEventClassVTbl*
  end

  struct IEventClass2VTbl
    query_interface : Proc(IEventClass2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventClass2*, UInt32)
    release : Proc(IEventClass2*, UInt32)
    get_type_info_count : Proc(IEventClass2*, UInt32*, HRESULT)
    get_type_info : Proc(IEventClass2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventClass2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventClass2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_event_class_id : Proc(IEventClass2*, UInt8**, HRESULT)
    put_event_class_id : Proc(IEventClass2*, UInt8*, HRESULT)
    get_event_class_name : Proc(IEventClass2*, UInt8**, HRESULT)
    put_event_class_name : Proc(IEventClass2*, UInt8*, HRESULT)
    get_owner_sid : Proc(IEventClass2*, UInt8**, HRESULT)
    put_owner_sid : Proc(IEventClass2*, UInt8*, HRESULT)
    get_firing_interface_id : Proc(IEventClass2*, UInt8**, HRESULT)
    put_firing_interface_id : Proc(IEventClass2*, UInt8*, HRESULT)
    get_description : Proc(IEventClass2*, UInt8**, HRESULT)
    put_description : Proc(IEventClass2*, UInt8*, HRESULT)
    get_custom_config_clsid : Proc(IEventClass2*, UInt8**, HRESULT)
    put_custom_config_clsid : Proc(IEventClass2*, UInt8*, HRESULT)
    get_type_lib : Proc(IEventClass2*, UInt8**, HRESULT)
    put_type_lib : Proc(IEventClass2*, UInt8*, HRESULT)
    get_publisher_id : Proc(IEventClass2*, UInt8**, HRESULT)
    put_publisher_id : Proc(IEventClass2*, UInt8*, HRESULT)
    get_multi_interface_publisher_filter_clsid : Proc(IEventClass2*, UInt8**, HRESULT)
    put_multi_interface_publisher_filter_clsid : Proc(IEventClass2*, UInt8*, HRESULT)
    get_allow_inproc_activation : Proc(IEventClass2*, LibC::BOOL*, HRESULT)
    put_allow_inproc_activation : Proc(IEventClass2*, LibC::BOOL, HRESULT)
    get_fire_in_parallel : Proc(IEventClass2*, LibC::BOOL*, HRESULT)
    put_fire_in_parallel : Proc(IEventClass2*, LibC::BOOL, HRESULT)
  end

  struct IEventClass2
    lpVtbl : IEventClass2VTbl*
  end

  struct IEventSubscriptionVTbl
    query_interface : Proc(IEventSubscription*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventSubscription*, UInt32)
    release : Proc(IEventSubscription*, UInt32)
    get_type_info_count : Proc(IEventSubscription*, UInt32*, HRESULT)
    get_type_info : Proc(IEventSubscription*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventSubscription*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventSubscription*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_subscription_id : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_subscription_id : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_subscription_name : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_subscription_name : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_publisher_id : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_publisher_id : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_event_class_id : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_event_class_id : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_method_name : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_method_name : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_subscriber_clsid : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_subscriber_clsid : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_subscriber_interface : Proc(IEventSubscription*, IUnknown*, HRESULT)
    put_subscriber_interface : Proc(IEventSubscription*, IUnknown, HRESULT)
    get_per_user : Proc(IEventSubscription*, LibC::BOOL*, HRESULT)
    put_per_user : Proc(IEventSubscription*, LibC::BOOL, HRESULT)
    get_owner_sid : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_owner_sid : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_enabled : Proc(IEventSubscription*, LibC::BOOL*, HRESULT)
    put_enabled : Proc(IEventSubscription*, LibC::BOOL, HRESULT)
    get_description : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_description : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_machine_name : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_machine_name : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_publisher_property : Proc(IEventSubscription*, UInt8*, VARIANT*, HRESULT)
    put_publisher_property : Proc(IEventSubscription*, UInt8*, VARIANT*, HRESULT)
    remove_publisher_property : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_publisher_property_collection : Proc(IEventSubscription*, IEventObjectCollection*, HRESULT)
    get_subscriber_property : Proc(IEventSubscription*, UInt8*, VARIANT*, HRESULT)
    put_subscriber_property : Proc(IEventSubscription*, UInt8*, VARIANT*, HRESULT)
    remove_subscriber_property : Proc(IEventSubscription*, UInt8*, HRESULT)
    get_subscriber_property_collection : Proc(IEventSubscription*, IEventObjectCollection*, HRESULT)
    get_interface_id : Proc(IEventSubscription*, UInt8**, HRESULT)
    put_interface_id : Proc(IEventSubscription*, UInt8*, HRESULT)
  end

  struct IEventSubscription
    lpVtbl : IEventSubscriptionVTbl*
  end

  struct IFiringControlVTbl
    query_interface : Proc(IFiringControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFiringControl*, UInt32)
    release : Proc(IFiringControl*, UInt32)
    get_type_info_count : Proc(IFiringControl*, UInt32*, HRESULT)
    get_type_info : Proc(IFiringControl*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFiringControl*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFiringControl*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    fire_subscription : Proc(IFiringControl*, IEventSubscription, HRESULT)
  end

  struct IFiringControl
    lpVtbl : IFiringControlVTbl*
  end

  struct IPublisherFilterVTbl
    query_interface : Proc(IPublisherFilter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPublisherFilter*, UInt32)
    release : Proc(IPublisherFilter*, UInt32)
    initialize : Proc(IPublisherFilter*, UInt8*, IDispatch, HRESULT)
    prepare_to_fire : Proc(IPublisherFilter*, UInt8*, IFiringControl, HRESULT)
  end

  struct IPublisherFilter
    lpVtbl : IPublisherFilterVTbl*
  end

  struct IMultiInterfacePublisherFilterVTbl
    query_interface : Proc(IMultiInterfacePublisherFilter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMultiInterfacePublisherFilter*, UInt32)
    release : Proc(IMultiInterfacePublisherFilter*, UInt32)
    initialize : Proc(IMultiInterfacePublisherFilter*, IMultiInterfaceEventControl, HRESULT)
    prepare_to_fire : Proc(IMultiInterfacePublisherFilter*, Guid*, UInt8*, IFiringControl, HRESULT)
  end

  struct IMultiInterfacePublisherFilter
    lpVtbl : IMultiInterfacePublisherFilterVTbl*
  end

  struct IEventObjectChangeVTbl
    query_interface : Proc(IEventObjectChange*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventObjectChange*, UInt32)
    release : Proc(IEventObjectChange*, UInt32)
    changed_subscription : Proc(IEventObjectChange*, EOC_ChangeType, UInt8*, HRESULT)
    changed_event_class : Proc(IEventObjectChange*, EOC_ChangeType, UInt8*, HRESULT)
    changed_publisher : Proc(IEventObjectChange*, EOC_ChangeType, UInt8*, HRESULT)
  end

  struct IEventObjectChange
    lpVtbl : IEventObjectChangeVTbl*
  end

  struct IEventObjectChange2VTbl
    query_interface : Proc(IEventObjectChange2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventObjectChange2*, UInt32)
    release : Proc(IEventObjectChange2*, UInt32)
    changed_subscription : Proc(IEventObjectChange2*, COMEVENTSYSCHANGEINFO*, HRESULT)
    changed_event_class : Proc(IEventObjectChange2*, COMEVENTSYSCHANGEINFO*, HRESULT)
  end

  struct IEventObjectChange2
    lpVtbl : IEventObjectChange2VTbl*
  end

  struct IEnumEventObjectVTbl
    query_interface : Proc(IEnumEventObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumEventObject*, UInt32)
    release : Proc(IEnumEventObject*, UInt32)
    clone : Proc(IEnumEventObject*, IEnumEventObject*, HRESULT)
    next : Proc(IEnumEventObject*, UInt32, IUnknown*, UInt32*, HRESULT)
    reset : Proc(IEnumEventObject*, HRESULT)
    skip : Proc(IEnumEventObject*, UInt32, HRESULT)
  end

  struct IEnumEventObject
    lpVtbl : IEnumEventObjectVTbl*
  end

  struct IEventObjectCollectionVTbl
    query_interface : Proc(IEventObjectCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventObjectCollection*, UInt32)
    release : Proc(IEventObjectCollection*, UInt32)
    get_type_info_count : Proc(IEventObjectCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IEventObjectCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventObjectCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventObjectCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IEventObjectCollection*, IUnknown*, HRESULT)
    get_item : Proc(IEventObjectCollection*, UInt8*, VARIANT*, HRESULT)
    get_new_enum : Proc(IEventObjectCollection*, IEnumEventObject*, HRESULT)
    get_count : Proc(IEventObjectCollection*, Int32*, HRESULT)
    add : Proc(IEventObjectCollection*, VARIANT*, UInt8*, HRESULT)
    remove : Proc(IEventObjectCollection*, UInt8*, HRESULT)
  end

  struct IEventObjectCollection
    lpVtbl : IEventObjectCollectionVTbl*
  end

  struct IEventPropertyVTbl
    query_interface : Proc(IEventProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventProperty*, UInt32)
    release : Proc(IEventProperty*, UInt32)
    get_type_info_count : Proc(IEventProperty*, UInt32*, HRESULT)
    get_type_info : Proc(IEventProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IEventProperty*, UInt8**, HRESULT)
    put_name : Proc(IEventProperty*, UInt8*, HRESULT)
    get_value : Proc(IEventProperty*, VARIANT*, HRESULT)
    put_value : Proc(IEventProperty*, VARIANT*, HRESULT)
  end

  struct IEventProperty
    lpVtbl : IEventPropertyVTbl*
  end

  struct IEventControlVTbl
    query_interface : Proc(IEventControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventControl*, UInt32)
    release : Proc(IEventControl*, UInt32)
    get_type_info_count : Proc(IEventControl*, UInt32*, HRESULT)
    get_type_info : Proc(IEventControl*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventControl*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventControl*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    set_publisher_filter : Proc(IEventControl*, UInt8*, IPublisherFilter, HRESULT)
    get_allow_inproc_activation : Proc(IEventControl*, LibC::BOOL*, HRESULT)
    put_allow_inproc_activation : Proc(IEventControl*, LibC::BOOL, HRESULT)
    get_subscriptions : Proc(IEventControl*, UInt8*, UInt8*, Int32*, IEventObjectCollection*, HRESULT)
    set_default_query : Proc(IEventControl*, UInt8*, UInt8*, Int32*, HRESULT)
  end

  struct IEventControl
    lpVtbl : IEventControlVTbl*
  end

  struct IMultiInterfaceEventControlVTbl
    query_interface : Proc(IMultiInterfaceEventControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMultiInterfaceEventControl*, UInt32)
    release : Proc(IMultiInterfaceEventControl*, UInt32)
    set_multi_interface_publisher_filter : Proc(IMultiInterfaceEventControl*, IMultiInterfacePublisherFilter, HRESULT)
    get_subscriptions : Proc(IMultiInterfaceEventControl*, Guid*, UInt8*, UInt8*, Int32*, IEventObjectCollection*, HRESULT)
    set_default_query : Proc(IMultiInterfaceEventControl*, Guid*, UInt8*, UInt8*, Int32*, HRESULT)
    get_allow_inproc_activation : Proc(IMultiInterfaceEventControl*, LibC::BOOL*, HRESULT)
    put_allow_inproc_activation : Proc(IMultiInterfaceEventControl*, LibC::BOOL, HRESULT)
    get_fire_in_parallel : Proc(IMultiInterfaceEventControl*, LibC::BOOL*, HRESULT)
    put_fire_in_parallel : Proc(IMultiInterfaceEventControl*, LibC::BOOL, HRESULT)
  end

  struct IMultiInterfaceEventControl
    lpVtbl : IMultiInterfaceEventControlVTbl*
  end

  struct IDontSupportEventSubscriptionVTbl
    query_interface : Proc(IDontSupportEventSubscription*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDontSupportEventSubscription*, UInt32)
    release : Proc(IDontSupportEventSubscription*, UInt32)
  end

  struct IDontSupportEventSubscription
    lpVtbl : IDontSupportEventSubscriptionVTbl*
  end

end
