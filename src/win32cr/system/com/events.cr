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

  IEventSystem_GUID = "4e14fb9f-2e22-11d1-9964-00c04fbbb345"
  IID_IEventSystem = LibC::GUID.new(0x4e14fb9f_u32, 0x2e22_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
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

  IEventPublisher_GUID = "e341516b-2e32-11d1-9964-00c04fbbb345"
  IID_IEventPublisher = LibC::GUID.new(0xe341516b_u32, 0x2e32_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
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

  IEventClass_GUID = "fb2b72a0-7a68-11d1-88f9-0080c7d771bf"
  IID_IEventClass = LibC::GUID.new(0xfb2b72a0_u32, 0x7a68_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
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

  IEventClass2_GUID = "fb2b72a1-7a68-11d1-88f9-0080c7d771bf"
  IID_IEventClass2 = LibC::GUID.new(0xfb2b72a1_u32, 0x7a68_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
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

  IEventSubscription_GUID = "4a6b0e15-2e38-11d1-9965-00c04fbbb345"
  IID_IEventSubscription = LibC::GUID.new(0x4a6b0e15_u32, 0x2e38_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x65_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
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

  IFiringControl_GUID = "e0498c93-4efe-11d1-9971-00c04fbbb345"
  IID_IFiringControl = LibC::GUID.new(0xe0498c93_u32, 0x4efe_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x71_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
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

  IPublisherFilter_GUID = "465e5cc0-7b26-11d1-88fb-0080c7d771bf"
  IID_IPublisherFilter = LibC::GUID.new(0x465e5cc0_u32, 0x7b26_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xfb_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
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

  IMultiInterfacePublisherFilter_GUID = "465e5cc1-7b26-11d1-88fb-0080c7d771bf"
  IID_IMultiInterfacePublisherFilter = LibC::GUID.new(0x465e5cc1_u32, 0x7b26_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xfb_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
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

  IEventObjectChange_GUID = "f4a07d70-2e25-11d1-9964-00c04fbbb345"
  IID_IEventObjectChange = LibC::GUID.new(0xf4a07d70_u32, 0x2e25_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
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

  IEventObjectChange2_GUID = "7701a9c3-bd68-438f-83e0-67bf4f53a422"
  IID_IEventObjectChange2 = LibC::GUID.new(0x7701a9c3_u32, 0xbd68_u16, 0x438f_u16, StaticArray[0x83_u8, 0xe0_u8, 0x67_u8, 0xbf_u8, 0x4f_u8, 0x53_u8, 0xa4_u8, 0x22_u8])
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

  IEnumEventObject_GUID = "f4a07d63-2e25-11d1-9964-00c04fbbb345"
  IID_IEnumEventObject = LibC::GUID.new(0xf4a07d63_u32, 0x2e25_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
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

  IEventObjectCollection_GUID = "f89ac270-d4eb-11d1-b682-00805fc79216"
  IID_IEventObjectCollection = LibC::GUID.new(0xf89ac270_u32, 0xd4eb_u16, 0x11d1_u16, StaticArray[0xb6_u8, 0x82_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x16_u8])
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

  IEventProperty_GUID = "da538ee2-f4de-11d1-b6bb-00805fc79216"
  IID_IEventProperty = LibC::GUID.new(0xda538ee2_u32, 0xf4de_u16, 0x11d1_u16, StaticArray[0xb6_u8, 0xbb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x16_u8])
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

  IEventControl_GUID = "0343e2f4-86f6-11d1-b760-00c04fb926af"
  IID_IEventControl = LibC::GUID.new(0x343e2f4_u32, 0x86f6_u16, 0x11d1_u16, StaticArray[0xb7_u8, 0x60_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x26_u8, 0xaf_u8])
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

  IMultiInterfaceEventControl_GUID = "0343e2f5-86f6-11d1-b760-00c04fb926af"
  IID_IMultiInterfaceEventControl = LibC::GUID.new(0x343e2f5_u32, 0x86f6_u16, 0x11d1_u16, StaticArray[0xb7_u8, 0x60_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x26_u8, 0xaf_u8])
  struct IMultiInterfaceEventControl
    lpVtbl : IMultiInterfaceEventControlVTbl*
  end

  struct IDontSupportEventSubscriptionVTbl
    query_interface : Proc(IDontSupportEventSubscription*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDontSupportEventSubscription*, UInt32)
    release : Proc(IDontSupportEventSubscription*, UInt32)
  end

  IDontSupportEventSubscription_GUID = "784121f1-62a6-4b89-855f-d65f296de83a"
  IID_IDontSupportEventSubscription = LibC::GUID.new(0x784121f1_u32, 0x62a6_u16, 0x4b89_u16, StaticArray[0x85_u8, 0x5f_u8, 0xd6_u8, 0x5f_u8, 0x29_u8, 0x6d_u8, 0xe8_u8, 0x3a_u8])
  struct IDontSupportEventSubscription
    lpVtbl : IDontSupportEventSubscriptionVTbl*
  end

end
struct LibWin32::IEventSystem
  def query_interface(this : IEventSystem*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventSystem*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventSystem*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventSystem*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventSystem*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventSystem*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventSystem*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def query(this : IEventSystem*, progid : UInt8*, querycriteria : UInt8*, errorindex : Int32*, ppinterface : IUnknown*) : HRESULT
    @lpVtbl.value.query.call(this, progid, querycriteria, errorindex, ppinterface)
  end
  def store(this : IEventSystem*, progid : UInt8*, pinterface : IUnknown) : HRESULT
    @lpVtbl.value.store.call(this, progid, pinterface)
  end
  def remove(this : IEventSystem*, progid : UInt8*, querycriteria : UInt8*, errorindex : Int32*) : HRESULT
    @lpVtbl.value.remove.call(this, progid, querycriteria, errorindex)
  end
  def get_event_object_change_event_class_id(this : IEventSystem*, pbstreventclassid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_object_change_event_class_id.call(this, pbstreventclassid)
  end
  def query_s(this : IEventSystem*, progid : UInt8*, querycriteria : UInt8*, ppinterface : IUnknown*) : HRESULT
    @lpVtbl.value.query_s.call(this, progid, querycriteria, ppinterface)
  end
  def remove_s(this : IEventSystem*, progid : UInt8*, querycriteria : UInt8*) : HRESULT
    @lpVtbl.value.remove_s.call(this, progid, querycriteria)
  end
end
struct LibWin32::IEventPublisher
  def query_interface(this : IEventPublisher*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventPublisher*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventPublisher*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventPublisher*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventPublisher*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventPublisher*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventPublisher*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_publisher_id(this : IEventPublisher*, pbstrpublisherid : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_id.call(this, pbstrpublisherid)
  end
  def put_publisher_id(this : IEventPublisher*, bstrpublisherid : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_id.call(this, bstrpublisherid)
  end
  def get_publisher_name(this : IEventPublisher*, pbstrpublishername : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_name.call(this, pbstrpublishername)
  end
  def put_publisher_name(this : IEventPublisher*, bstrpublishername : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_name.call(this, bstrpublishername)
  end
  def get_publisher_type(this : IEventPublisher*, pbstrpublishertype : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_type.call(this, pbstrpublishertype)
  end
  def put_publisher_type(this : IEventPublisher*, bstrpublishertype : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_type.call(this, bstrpublishertype)
  end
  def get_owner_sid(this : IEventPublisher*, pbstrownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.call(this, pbstrownersid)
  end
  def put_owner_sid(this : IEventPublisher*, bstrownersid : UInt8*) : HRESULT
    @lpVtbl.value.put_owner_sid.call(this, bstrownersid)
  end
  def get_description(this : IEventPublisher*, pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbstrdescription)
  end
  def put_description(this : IEventPublisher*, bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bstrdescription)
  end
  def get_default_property(this : IEventPublisher*, bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_default_property.call(this, bstrpropertyname, propertyvalue)
  end
  def put_default_property(this : IEventPublisher*, bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_default_property.call(this, bstrpropertyname, propertyvalue)
  end
  def remove_default_property(this : IEventPublisher*, bstrpropertyname : UInt8*) : HRESULT
    @lpVtbl.value.remove_default_property.call(this, bstrpropertyname)
  end
  def get_default_property_collection(this : IEventPublisher*, collection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_default_property_collection.call(this, collection)
  end
end
struct LibWin32::IEventClass
  def query_interface(this : IEventClass*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventClass*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventClass*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventClass*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventClass*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventClass*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventClass*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_class_id(this : IEventClass*, pbstreventclassid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_id.call(this, pbstreventclassid)
  end
  def put_event_class_id(this : IEventClass*, bstreventclassid : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_id.call(this, bstreventclassid)
  end
  def get_event_class_name(this : IEventClass*, pbstreventclassname : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_name.call(this, pbstreventclassname)
  end
  def put_event_class_name(this : IEventClass*, bstreventclassname : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_name.call(this, bstreventclassname)
  end
  def get_owner_sid(this : IEventClass*, pbstrownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.call(this, pbstrownersid)
  end
  def put_owner_sid(this : IEventClass*, bstrownersid : UInt8*) : HRESULT
    @lpVtbl.value.put_owner_sid.call(this, bstrownersid)
  end
  def get_firing_interface_id(this : IEventClass*, pbstrfiringinterfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_firing_interface_id.call(this, pbstrfiringinterfaceid)
  end
  def put_firing_interface_id(this : IEventClass*, bstrfiringinterfaceid : UInt8*) : HRESULT
    @lpVtbl.value.put_firing_interface_id.call(this, bstrfiringinterfaceid)
  end
  def get_description(this : IEventClass*, pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbstrdescription)
  end
  def put_description(this : IEventClass*, bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bstrdescription)
  end
  def get_custom_config_clsid(this : IEventClass*, pbstrcustomconfigclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_custom_config_clsid.call(this, pbstrcustomconfigclsid)
  end
  def put_custom_config_clsid(this : IEventClass*, bstrcustomconfigclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_custom_config_clsid.call(this, bstrcustomconfigclsid)
  end
  def get_type_lib(this : IEventClass*, pbstrtypelib : UInt8**) : HRESULT
    @lpVtbl.value.get_type_lib.call(this, pbstrtypelib)
  end
  def put_type_lib(this : IEventClass*, bstrtypelib : UInt8*) : HRESULT
    @lpVtbl.value.put_type_lib.call(this, bstrtypelib)
  end
end
struct LibWin32::IEventClass2
  def query_interface(this : IEventClass2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventClass2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventClass2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventClass2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventClass2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventClass2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventClass2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_class_id(this : IEventClass2*, pbstreventclassid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_id.call(this, pbstreventclassid)
  end
  def put_event_class_id(this : IEventClass2*, bstreventclassid : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_id.call(this, bstreventclassid)
  end
  def get_event_class_name(this : IEventClass2*, pbstreventclassname : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_name.call(this, pbstreventclassname)
  end
  def put_event_class_name(this : IEventClass2*, bstreventclassname : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_name.call(this, bstreventclassname)
  end
  def get_owner_sid(this : IEventClass2*, pbstrownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.call(this, pbstrownersid)
  end
  def put_owner_sid(this : IEventClass2*, bstrownersid : UInt8*) : HRESULT
    @lpVtbl.value.put_owner_sid.call(this, bstrownersid)
  end
  def get_firing_interface_id(this : IEventClass2*, pbstrfiringinterfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_firing_interface_id.call(this, pbstrfiringinterfaceid)
  end
  def put_firing_interface_id(this : IEventClass2*, bstrfiringinterfaceid : UInt8*) : HRESULT
    @lpVtbl.value.put_firing_interface_id.call(this, bstrfiringinterfaceid)
  end
  def get_description(this : IEventClass2*, pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbstrdescription)
  end
  def put_description(this : IEventClass2*, bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bstrdescription)
  end
  def get_custom_config_clsid(this : IEventClass2*, pbstrcustomconfigclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_custom_config_clsid.call(this, pbstrcustomconfigclsid)
  end
  def put_custom_config_clsid(this : IEventClass2*, bstrcustomconfigclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_custom_config_clsid.call(this, bstrcustomconfigclsid)
  end
  def get_type_lib(this : IEventClass2*, pbstrtypelib : UInt8**) : HRESULT
    @lpVtbl.value.get_type_lib.call(this, pbstrtypelib)
  end
  def put_type_lib(this : IEventClass2*, bstrtypelib : UInt8*) : HRESULT
    @lpVtbl.value.put_type_lib.call(this, bstrtypelib)
  end
  def get_publisher_id(this : IEventClass2*, pbstrpublisherid : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_id.call(this, pbstrpublisherid)
  end
  def put_publisher_id(this : IEventClass2*, bstrpublisherid : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_id.call(this, bstrpublisherid)
  end
  def get_multi_interface_publisher_filter_clsid(this : IEventClass2*, pbstrpubfilclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_multi_interface_publisher_filter_clsid.call(this, pbstrpubfilclsid)
  end
  def put_multi_interface_publisher_filter_clsid(this : IEventClass2*, bstrpubfilclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_multi_interface_publisher_filter_clsid.call(this, bstrpubfilclsid)
  end
  def get_allow_inproc_activation(this : IEventClass2*, pfallowinprocactivation : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allow_inproc_activation.call(this, pfallowinprocactivation)
  end
  def put_allow_inproc_activation(this : IEventClass2*, fallowinprocactivation : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_allow_inproc_activation.call(this, fallowinprocactivation)
  end
  def get_fire_in_parallel(this : IEventClass2*, pffireinparallel : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_fire_in_parallel.call(this, pffireinparallel)
  end
  def put_fire_in_parallel(this : IEventClass2*, ffireinparallel : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_fire_in_parallel.call(this, ffireinparallel)
  end
end
struct LibWin32::IEventSubscription
  def query_interface(this : IEventSubscription*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventSubscription*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventSubscription*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventSubscription*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventSubscription*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventSubscription*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventSubscription*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_subscription_id(this : IEventSubscription*, pbstrsubscriptionid : UInt8**) : HRESULT
    @lpVtbl.value.get_subscription_id.call(this, pbstrsubscriptionid)
  end
  def put_subscription_id(this : IEventSubscription*, bstrsubscriptionid : UInt8*) : HRESULT
    @lpVtbl.value.put_subscription_id.call(this, bstrsubscriptionid)
  end
  def get_subscription_name(this : IEventSubscription*, pbstrsubscriptionname : UInt8**) : HRESULT
    @lpVtbl.value.get_subscription_name.call(this, pbstrsubscriptionname)
  end
  def put_subscription_name(this : IEventSubscription*, bstrsubscriptionname : UInt8*) : HRESULT
    @lpVtbl.value.put_subscription_name.call(this, bstrsubscriptionname)
  end
  def get_publisher_id(this : IEventSubscription*, pbstrpublisherid : UInt8**) : HRESULT
    @lpVtbl.value.get_publisher_id.call(this, pbstrpublisherid)
  end
  def put_publisher_id(this : IEventSubscription*, bstrpublisherid : UInt8*) : HRESULT
    @lpVtbl.value.put_publisher_id.call(this, bstrpublisherid)
  end
  def get_event_class_id(this : IEventSubscription*, pbstreventclassid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_class_id.call(this, pbstreventclassid)
  end
  def put_event_class_id(this : IEventSubscription*, bstreventclassid : UInt8*) : HRESULT
    @lpVtbl.value.put_event_class_id.call(this, bstreventclassid)
  end
  def get_method_name(this : IEventSubscription*, pbstrmethodname : UInt8**) : HRESULT
    @lpVtbl.value.get_method_name.call(this, pbstrmethodname)
  end
  def put_method_name(this : IEventSubscription*, bstrmethodname : UInt8*) : HRESULT
    @lpVtbl.value.put_method_name.call(this, bstrmethodname)
  end
  def get_subscriber_clsid(this : IEventSubscription*, pbstrsubscriberclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_subscriber_clsid.call(this, pbstrsubscriberclsid)
  end
  def put_subscriber_clsid(this : IEventSubscription*, bstrsubscriberclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_subscriber_clsid.call(this, bstrsubscriberclsid)
  end
  def get_subscriber_interface(this : IEventSubscription*, ppsubscriberinterface : IUnknown*) : HRESULT
    @lpVtbl.value.get_subscriber_interface.call(this, ppsubscriberinterface)
  end
  def put_subscriber_interface(this : IEventSubscription*, psubscriberinterface : IUnknown) : HRESULT
    @lpVtbl.value.put_subscriber_interface.call(this, psubscriberinterface)
  end
  def get_per_user(this : IEventSubscription*, pfperuser : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_per_user.call(this, pfperuser)
  end
  def put_per_user(this : IEventSubscription*, fperuser : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_per_user.call(this, fperuser)
  end
  def get_owner_sid(this : IEventSubscription*, pbstrownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.call(this, pbstrownersid)
  end
  def put_owner_sid(this : IEventSubscription*, bstrownersid : UInt8*) : HRESULT
    @lpVtbl.value.put_owner_sid.call(this, bstrownersid)
  end
  def get_enabled(this : IEventSubscription*, pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pfenabled)
  end
  def put_enabled(this : IEventSubscription*, fenabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_enabled.call(this, fenabled)
  end
  def get_description(this : IEventSubscription*, pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbstrdescription)
  end
  def put_description(this : IEventSubscription*, bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, bstrdescription)
  end
  def get_machine_name(this : IEventSubscription*, pbstrmachinename : UInt8**) : HRESULT
    @lpVtbl.value.get_machine_name.call(this, pbstrmachinename)
  end
  def put_machine_name(this : IEventSubscription*, bstrmachinename : UInt8*) : HRESULT
    @lpVtbl.value.put_machine_name.call(this, bstrmachinename)
  end
  def get_publisher_property(this : IEventSubscription*, bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_publisher_property.call(this, bstrpropertyname, propertyvalue)
  end
  def put_publisher_property(this : IEventSubscription*, bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_publisher_property.call(this, bstrpropertyname, propertyvalue)
  end
  def remove_publisher_property(this : IEventSubscription*, bstrpropertyname : UInt8*) : HRESULT
    @lpVtbl.value.remove_publisher_property.call(this, bstrpropertyname)
  end
  def get_publisher_property_collection(this : IEventSubscription*, collection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_publisher_property_collection.call(this, collection)
  end
  def get_subscriber_property(this : IEventSubscription*, bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_subscriber_property.call(this, bstrpropertyname, propertyvalue)
  end
  def put_subscriber_property(this : IEventSubscription*, bstrpropertyname : UInt8*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_subscriber_property.call(this, bstrpropertyname, propertyvalue)
  end
  def remove_subscriber_property(this : IEventSubscription*, bstrpropertyname : UInt8*) : HRESULT
    @lpVtbl.value.remove_subscriber_property.call(this, bstrpropertyname)
  end
  def get_subscriber_property_collection(this : IEventSubscription*, collection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_subscriber_property_collection.call(this, collection)
  end
  def get_interface_id(this : IEventSubscription*, pbstrinterfaceid : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_id.call(this, pbstrinterfaceid)
  end
  def put_interface_id(this : IEventSubscription*, bstrinterfaceid : UInt8*) : HRESULT
    @lpVtbl.value.put_interface_id.call(this, bstrinterfaceid)
  end
end
struct LibWin32::IFiringControl
  def query_interface(this : IFiringControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFiringControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFiringControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFiringControl*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFiringControl*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFiringControl*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFiringControl*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def fire_subscription(this : IFiringControl*, subscription : IEventSubscription) : HRESULT
    @lpVtbl.value.fire_subscription.call(this, subscription)
  end
end
struct LibWin32::IPublisherFilter
  def query_interface(this : IPublisherFilter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPublisherFilter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPublisherFilter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IPublisherFilter*, methodname : UInt8*, dispuserdefined : IDispatch) : HRESULT
    @lpVtbl.value.initialize.call(this, methodname, dispuserdefined)
  end
  def prepare_to_fire(this : IPublisherFilter*, methodname : UInt8*, firingcontrol : IFiringControl) : HRESULT
    @lpVtbl.value.prepare_to_fire.call(this, methodname, firingcontrol)
  end
end
struct LibWin32::IMultiInterfacePublisherFilter
  def query_interface(this : IMultiInterfacePublisherFilter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMultiInterfacePublisherFilter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMultiInterfacePublisherFilter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IMultiInterfacePublisherFilter*, peic : IMultiInterfaceEventControl) : HRESULT
    @lpVtbl.value.initialize.call(this, peic)
  end
  def prepare_to_fire(this : IMultiInterfacePublisherFilter*, iid : Guid*, methodname : UInt8*, firingcontrol : IFiringControl) : HRESULT
    @lpVtbl.value.prepare_to_fire.call(this, iid, methodname, firingcontrol)
  end
end
struct LibWin32::IEventObjectChange
  def query_interface(this : IEventObjectChange*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventObjectChange*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventObjectChange*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def changed_subscription(this : IEventObjectChange*, changetype : EOC_ChangeType, bstrsubscriptionid : UInt8*) : HRESULT
    @lpVtbl.value.changed_subscription.call(this, changetype, bstrsubscriptionid)
  end
  def changed_event_class(this : IEventObjectChange*, changetype : EOC_ChangeType, bstreventclassid : UInt8*) : HRESULT
    @lpVtbl.value.changed_event_class.call(this, changetype, bstreventclassid)
  end
  def changed_publisher(this : IEventObjectChange*, changetype : EOC_ChangeType, bstrpublisherid : UInt8*) : HRESULT
    @lpVtbl.value.changed_publisher.call(this, changetype, bstrpublisherid)
  end
end
struct LibWin32::IEventObjectChange2
  def query_interface(this : IEventObjectChange2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventObjectChange2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventObjectChange2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def changed_subscription(this : IEventObjectChange2*, pinfo : COMEVENTSYSCHANGEINFO*) : HRESULT
    @lpVtbl.value.changed_subscription.call(this, pinfo)
  end
  def changed_event_class(this : IEventObjectChange2*, pinfo : COMEVENTSYSCHANGEINFO*) : HRESULT
    @lpVtbl.value.changed_event_class.call(this, pinfo)
  end
end
struct LibWin32::IEnumEventObject
  def query_interface(this : IEnumEventObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumEventObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumEventObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def clone(this : IEnumEventObject*, ppinterface : IEnumEventObject*) : HRESULT
    @lpVtbl.value.clone.call(this, ppinterface)
  end
  def next(this : IEnumEventObject*, creqelem : UInt32, ppinterface : IUnknown*, cretelem : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, creqelem, ppinterface, cretelem)
  end
  def reset(this : IEnumEventObject*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def skip(this : IEnumEventObject*, cskipelem : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, cskipelem)
  end
end
struct LibWin32::IEventObjectCollection
  def query_interface(this : IEventObjectCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventObjectCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventObjectCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventObjectCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventObjectCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventObjectCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventObjectCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IEventObjectCollection*, ppunkenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunkenum)
  end
  def get_item(this : IEventObjectCollection*, objectid : UInt8*, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, objectid, pitem)
  end
  def get_new_enum(this : IEventObjectCollection*, ppenum : IEnumEventObject*) : HRESULT
    @lpVtbl.value.get_new_enum.call(this, ppenum)
  end
  def get_count(this : IEventObjectCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def add(this : IEventObjectCollection*, item : VARIANT*, objectid : UInt8*) : HRESULT
    @lpVtbl.value.add.call(this, item, objectid)
  end
  def remove(this : IEventObjectCollection*, objectid : UInt8*) : HRESULT
    @lpVtbl.value.remove.call(this, objectid)
  end
end
struct LibWin32::IEventProperty
  def query_interface(this : IEventProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventProperty*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventProperty*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventProperty*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventProperty*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IEventProperty*, propertyname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, propertyname)
  end
  def put_name(this : IEventProperty*, propertyname : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, propertyname)
  end
  def get_value(this : IEventProperty*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, propertyvalue)
  end
  def put_value(this : IEventProperty*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.put_value.call(this, propertyvalue)
  end
end
struct LibWin32::IEventControl
  def query_interface(this : IEventControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventControl*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventControl*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventControl*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventControl*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def set_publisher_filter(this : IEventControl*, methodname : UInt8*, ppublisherfilter : IPublisherFilter) : HRESULT
    @lpVtbl.value.set_publisher_filter.call(this, methodname, ppublisherfilter)
  end
  def get_allow_inproc_activation(this : IEventControl*, pfallowinprocactivation : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allow_inproc_activation.call(this, pfallowinprocactivation)
  end
  def put_allow_inproc_activation(this : IEventControl*, fallowinprocactivation : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_allow_inproc_activation.call(this, fallowinprocactivation)
  end
  def get_subscriptions(this : IEventControl*, methodname : UInt8*, optionalcriteria : UInt8*, optionalerrorindex : Int32*, ppcollection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_subscriptions.call(this, methodname, optionalcriteria, optionalerrorindex, ppcollection)
  end
  def set_default_query(this : IEventControl*, methodname : UInt8*, criteria : UInt8*, errorindex : Int32*) : HRESULT
    @lpVtbl.value.set_default_query.call(this, methodname, criteria, errorindex)
  end
end
struct LibWin32::IMultiInterfaceEventControl
  def query_interface(this : IMultiInterfaceEventControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMultiInterfaceEventControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMultiInterfaceEventControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_multi_interface_publisher_filter(this : IMultiInterfaceEventControl*, classfilter : IMultiInterfacePublisherFilter) : HRESULT
    @lpVtbl.value.set_multi_interface_publisher_filter.call(this, classfilter)
  end
  def get_subscriptions(this : IMultiInterfaceEventControl*, eventiid : Guid*, bstrmethodname : UInt8*, optionalcriteria : UInt8*, optionalerrorindex : Int32*, ppcollection : IEventObjectCollection*) : HRESULT
    @lpVtbl.value.get_subscriptions.call(this, eventiid, bstrmethodname, optionalcriteria, optionalerrorindex, ppcollection)
  end
  def set_default_query(this : IMultiInterfaceEventControl*, eventiid : Guid*, bstrmethodname : UInt8*, bstrcriteria : UInt8*, errorindex : Int32*) : HRESULT
    @lpVtbl.value.set_default_query.call(this, eventiid, bstrmethodname, bstrcriteria, errorindex)
  end
  def get_allow_inproc_activation(this : IMultiInterfaceEventControl*, pfallowinprocactivation : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allow_inproc_activation.call(this, pfallowinprocactivation)
  end
  def put_allow_inproc_activation(this : IMultiInterfaceEventControl*, fallowinprocactivation : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_allow_inproc_activation.call(this, fallowinprocactivation)
  end
  def get_fire_in_parallel(this : IMultiInterfaceEventControl*, pffireinparallel : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_fire_in_parallel.call(this, pffireinparallel)
  end
  def put_fire_in_parallel(this : IMultiInterfaceEventControl*, ffireinparallel : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_fire_in_parallel.call(this, ffireinparallel)
  end
end
struct LibWin32::IDontSupportEventSubscription
  def query_interface(this : IDontSupportEventSubscription*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDontSupportEventSubscription*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDontSupportEventSubscription*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
