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
{% else %}
{% end %}
lib LibWin32
  CGD_DEFAULT = 0_u32
  CGD_UNKNOWN_PROPERTY = 0_u32
  CGD_STRING_PROPERTY = 1_u32
  CGD_DATE_PROPERTY = 2_u32
  CGD_BINARY_PROPERTY = 4_u32
  CGD_ARRAY_NODE = 8_u32
  CLSID_ContactAggregationManager = "96c8ad95-c199-44de-b34e-ac33c442df39"
  Contact = LibC::GUID.new(0x61b68808_u32, 0x8eee_u16, 0x4fd1_u16, StaticArray[0xac_u8, 0xb8_u8, 0x3d_u8, 0x80_u8, 0x4c_u8, 0x8d_u8, 0xb0_u8, 0x56_u8])
  ContactManager = LibC::GUID.new(0x7165c8ab_u32, 0xaf88_u16, 0x42bd_u16, StaticArray[0x86_u8, 0xfd_u8, 0x53_u8, 0x10_u8, 0xb4_u8, 0x28_u8, 0x5a_u8, 0x2_u8])


  enum CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS : Int32
    CA_CREATE_LOCAL = 0
    CA_CREATE_EXTERNAL = 1
  end

  enum CONTACT_AGGREGATION_COLLECTION_OPTIONS : Int32
    CACO_DEFAULT = 0
    CACO_INCLUDE_EXTERNAL = 1
    CACO_EXTERNAL_ONLY = 2
  end

  struct CONTACT_AGGREGATION_BLOB
    dw_count : UInt32
    lpb : UInt8*
  end


  struct IContactManagerVTbl
    query_interface : Proc(IContactManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactManager*, UInt32)
    release : Proc(IContactManager*, UInt32)
    initialize : Proc(IContactManager*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    load : Proc(IContactManager*, LibC::LPWSTR, IContact*, HRESULT)
    merge_contact_i_ds : Proc(IContactManager*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_me_contact : Proc(IContactManager*, IContact*, HRESULT)
    set_me_contact : Proc(IContactManager*, IContact, HRESULT)
    get_contact_collection : Proc(IContactManager*, IContactCollection*, HRESULT)
  end

  struct IContactManager
    lpVtbl : IContactManagerVTbl*
  end

  struct IContactCollectionVTbl
    query_interface : Proc(IContactCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactCollection*, UInt32)
    release : Proc(IContactCollection*, UInt32)
    reset : Proc(IContactCollection*, HRESULT)
    next : Proc(IContactCollection*, HRESULT)
    get_current : Proc(IContactCollection*, IContact*, HRESULT)
  end

  struct IContactCollection
    lpVtbl : IContactCollectionVTbl*
  end

  struct IContactPropertiesVTbl
    query_interface : Proc(IContactProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactProperties*, UInt32)
    release : Proc(IContactProperties*, UInt32)
    get_string : Proc(IContactProperties*, LibC::LPWSTR, UInt32, Char*, UInt32, UInt32*, HRESULT)
    get_date : Proc(IContactProperties*, LibC::LPWSTR, UInt32, FILETIME*, HRESULT)
    get_binary : Proc(IContactProperties*, LibC::LPWSTR, UInt32, Char*, UInt32, UInt32*, IStream*, HRESULT)
    get_labels : Proc(IContactProperties*, LibC::LPWSTR, UInt32, Char*, UInt32, UInt32*, HRESULT)
    set_string : Proc(IContactProperties*, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    set_date : Proc(IContactProperties*, LibC::LPWSTR, UInt32, FILETIME, HRESULT)
    set_binary : Proc(IContactProperties*, LibC::LPWSTR, UInt32, LibC::LPWSTR, IStream, HRESULT)
    set_labels : Proc(IContactProperties*, LibC::LPWSTR, UInt32, UInt32, LibC::LPWSTR*, HRESULT)
    create_array_node : Proc(IContactProperties*, LibC::LPWSTR, UInt32, LibC::BOOL, Char*, UInt32, UInt32*, HRESULT)
    delete_property : Proc(IContactProperties*, LibC::LPWSTR, UInt32, HRESULT)
    delete_array_node : Proc(IContactProperties*, LibC::LPWSTR, UInt32, HRESULT)
    delete_labels : Proc(IContactProperties*, LibC::LPWSTR, UInt32, HRESULT)
    get_property_collection : Proc(IContactProperties*, IContactPropertyCollection*, UInt32, LibC::LPWSTR, UInt32, LibC::LPWSTR*, LibC::BOOL, HRESULT)
  end

  struct IContactProperties
    lpVtbl : IContactPropertiesVTbl*
  end

  struct IContactVTbl
    query_interface : Proc(IContact*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContact*, UInt32)
    release : Proc(IContact*, UInt32)
    get_contact_id : Proc(IContact*, Char*, UInt32, UInt32*, HRESULT)
    get_path : Proc(IContact*, Char*, UInt32, UInt32*, HRESULT)
    commit_changes : Proc(IContact*, UInt32, HRESULT)
  end

  struct IContact
    lpVtbl : IContactVTbl*
  end

  struct IContactPropertyCollectionVTbl
    query_interface : Proc(IContactPropertyCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactPropertyCollection*, UInt32)
    release : Proc(IContactPropertyCollection*, UInt32)
    reset : Proc(IContactPropertyCollection*, HRESULT)
    next : Proc(IContactPropertyCollection*, HRESULT)
    get_property_name : Proc(IContactPropertyCollection*, Char*, UInt32, UInt32*, HRESULT)
    get_property_type : Proc(IContactPropertyCollection*, UInt32*, HRESULT)
    get_property_version : Proc(IContactPropertyCollection*, UInt32*, HRESULT)
    get_property_modification_date : Proc(IContactPropertyCollection*, FILETIME*, HRESULT)
    get_property_array_element_id : Proc(IContactPropertyCollection*, Char*, UInt32, UInt32*, HRESULT)
  end

  struct IContactPropertyCollection
    lpVtbl : IContactPropertyCollectionVTbl*
  end

  struct IContactAggregationManagerVTbl
    query_interface : Proc(IContactAggregationManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationManager*, UInt32)
    release : Proc(IContactAggregationManager*, UInt32)
    get_version_info : Proc(IContactAggregationManager*, Int32*, Int32*, HRESULT)
    create_or_open_group : Proc(IContactAggregationManager*, LibC::LPWSTR, CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS, LibC::BOOL*, IContactAggregationGroup*, HRESULT)
    create_external_contact : Proc(IContactAggregationManager*, IContactAggregationContact*, HRESULT)
    create_server_person : Proc(IContactAggregationManager*, IContactAggregationServerPerson*, HRESULT)
    create_server_contact_link : Proc(IContactAggregationManager*, IContactAggregationLink*, HRESULT)
    flush : Proc(IContactAggregationManager*, HRESULT)
    open_aggregate_contact : Proc(IContactAggregationManager*, LibC::LPWSTR, IContactAggregationAggregate*, HRESULT)
    open_contact : Proc(IContactAggregationManager*, LibC::LPWSTR, IContactAggregationContact*, HRESULT)
    open_server_contact_link : Proc(IContactAggregationManager*, LibC::LPWSTR, IContactAggregationLink*, HRESULT)
    open_server_person : Proc(IContactAggregationManager*, LibC::LPWSTR, IContactAggregationServerPerson*, HRESULT)
    get_contacts : Proc(IContactAggregationManager*, CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationContactCollection*, HRESULT)
    get_aggregate_contacts : Proc(IContactAggregationManager*, CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationAggregateCollection*, HRESULT)
    get_groups : Proc(IContactAggregationManager*, CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationGroupCollection*, HRESULT)
    get_server_persons : Proc(IContactAggregationManager*, IContactAggregationServerPersonCollection*, HRESULT)
    get_server_contact_links : Proc(IContactAggregationManager*, LibC::LPWSTR, IContactAggregationLinkCollection*, HRESULT)
  end

  struct IContactAggregationManager
    lpVtbl : IContactAggregationManagerVTbl*
  end

  struct IContactAggregationContactVTbl
    query_interface : Proc(IContactAggregationContact*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationContact*, UInt32)
    release : Proc(IContactAggregationContact*, UInt32)
    delete : Proc(IContactAggregationContact*, HRESULT)
    save : Proc(IContactAggregationContact*, HRESULT)
    move_to_aggregate : Proc(IContactAggregationContact*, LibC::LPWSTR, HRESULT)
    unlink : Proc(IContactAggregationContact*, HRESULT)
    get_account_id : Proc(IContactAggregationContact*, LibC::LPWSTR*, HRESULT)
    put_account_id : Proc(IContactAggregationContact*, LibC::LPWSTR, HRESULT)
    get_aggregate_id : Proc(IContactAggregationContact*, LibC::LPWSTR*, HRESULT)
    get_id : Proc(IContactAggregationContact*, LibC::LPWSTR*, HRESULT)
    get_is_me : Proc(IContactAggregationContact*, LibC::BOOL*, HRESULT)
    get_is_external : Proc(IContactAggregationContact*, LibC::BOOL*, HRESULT)
    get_network_source_id : Proc(IContactAggregationContact*, UInt32*, HRESULT)
    put_network_source_id : Proc(IContactAggregationContact*, UInt32, HRESULT)
    get_network_source_id_string : Proc(IContactAggregationContact*, LibC::LPWSTR*, HRESULT)
    put_network_source_id_string : Proc(IContactAggregationContact*, LibC::LPWSTR, HRESULT)
    get_remote_object_id : Proc(IContactAggregationContact*, CONTACT_AGGREGATION_BLOB**, HRESULT)
    put_remote_object_id : Proc(IContactAggregationContact*, CONTACT_AGGREGATION_BLOB*, HRESULT)
    get_sync_identity_hash : Proc(IContactAggregationContact*, CONTACT_AGGREGATION_BLOB**, HRESULT)
    put_sync_identity_hash : Proc(IContactAggregationContact*, CONTACT_AGGREGATION_BLOB*, HRESULT)
  end

  struct IContactAggregationContact
    lpVtbl : IContactAggregationContactVTbl*
  end

  struct IContactAggregationContactCollectionVTbl
    query_interface : Proc(IContactAggregationContactCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationContactCollection*, UInt32)
    release : Proc(IContactAggregationContactCollection*, UInt32)
    find_first : Proc(IContactAggregationContactCollection*, IContactAggregationContact*, HRESULT)
    find_next : Proc(IContactAggregationContactCollection*, IContactAggregationContact*, HRESULT)
    find_first_by_identity_hash : Proc(IContactAggregationContactCollection*, LibC::LPWSTR, LibC::LPWSTR, CONTACT_AGGREGATION_BLOB*, IContactAggregationContact*, HRESULT)
    get_count : Proc(IContactAggregationContactCollection*, Int32*, HRESULT)
    find_first_by_remote_id : Proc(IContactAggregationContactCollection*, LibC::LPWSTR, LibC::LPWSTR, CONTACT_AGGREGATION_BLOB*, IContactAggregationContact*, HRESULT)
  end

  struct IContactAggregationContactCollection
    lpVtbl : IContactAggregationContactCollectionVTbl*
  end

  struct IContactAggregationAggregateVTbl
    query_interface : Proc(IContactAggregationAggregate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationAggregate*, UInt32)
    release : Proc(IContactAggregationAggregate*, UInt32)
    save : Proc(IContactAggregationAggregate*, HRESULT)
    get_component_items : Proc(IContactAggregationAggregate*, IContactAggregationContactCollection*, HRESULT)
    link : Proc(IContactAggregationAggregate*, LibC::LPWSTR, HRESULT)
    get_groups : Proc(IContactAggregationAggregate*, CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationGroupCollection*, HRESULT)
    get_anti_link : Proc(IContactAggregationAggregate*, LibC::LPWSTR*, HRESULT)
    put_anti_link : Proc(IContactAggregationAggregate*, LibC::LPWSTR, HRESULT)
    get_favorite_order : Proc(IContactAggregationAggregate*, UInt32*, HRESULT)
    put_favorite_order : Proc(IContactAggregationAggregate*, UInt32, HRESULT)
    get_id : Proc(IContactAggregationAggregate*, LibC::LPWSTR*, HRESULT)
  end

  struct IContactAggregationAggregate
    lpVtbl : IContactAggregationAggregateVTbl*
  end

  struct IContactAggregationAggregateCollectionVTbl
    query_interface : Proc(IContactAggregationAggregateCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationAggregateCollection*, UInt32)
    release : Proc(IContactAggregationAggregateCollection*, UInt32)
    find_first : Proc(IContactAggregationAggregateCollection*, IContactAggregationAggregate*, HRESULT)
    find_first_by_anti_link_id : Proc(IContactAggregationAggregateCollection*, LibC::LPWSTR, IContactAggregationAggregate*, HRESULT)
    find_next : Proc(IContactAggregationAggregateCollection*, IContactAggregationAggregate*, HRESULT)
    get_count : Proc(IContactAggregationAggregateCollection*, Int32*, HRESULT)
  end

  struct IContactAggregationAggregateCollection
    lpVtbl : IContactAggregationAggregateCollectionVTbl*
  end

  struct IContactAggregationGroupVTbl
    query_interface : Proc(IContactAggregationGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationGroup*, UInt32)
    release : Proc(IContactAggregationGroup*, UInt32)
    delete : Proc(IContactAggregationGroup*, HRESULT)
    save : Proc(IContactAggregationGroup*, HRESULT)
    add : Proc(IContactAggregationGroup*, LibC::LPWSTR, HRESULT)
    remove : Proc(IContactAggregationGroup*, LibC::LPWSTR, HRESULT)
    get_members : Proc(IContactAggregationGroup*, IContactAggregationAggregateCollection*, HRESULT)
    get_global_object_id : Proc(IContactAggregationGroup*, Guid*, HRESULT)
    put_global_object_id : Proc(IContactAggregationGroup*, Guid*, HRESULT)
    get_id : Proc(IContactAggregationGroup*, LibC::LPWSTR*, HRESULT)
    get_name : Proc(IContactAggregationGroup*, LibC::LPWSTR*, HRESULT)
    put_name : Proc(IContactAggregationGroup*, LibC::LPWSTR, HRESULT)
  end

  struct IContactAggregationGroup
    lpVtbl : IContactAggregationGroupVTbl*
  end

  struct IContactAggregationGroupCollectionVTbl
    query_interface : Proc(IContactAggregationGroupCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationGroupCollection*, UInt32)
    release : Proc(IContactAggregationGroupCollection*, UInt32)
    find_first : Proc(IContactAggregationGroupCollection*, IContactAggregationGroup*, HRESULT)
    find_first_by_global_object_id : Proc(IContactAggregationGroupCollection*, Guid*, IContactAggregationGroup*, HRESULT)
    find_next : Proc(IContactAggregationGroupCollection*, IContactAggregationGroup*, HRESULT)
    get_count : Proc(IContactAggregationGroupCollection*, UInt32*, HRESULT)
  end

  struct IContactAggregationGroupCollection
    lpVtbl : IContactAggregationGroupCollectionVTbl*
  end

  struct IContactAggregationLinkVTbl
    query_interface : Proc(IContactAggregationLink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationLink*, UInt32)
    release : Proc(IContactAggregationLink*, UInt32)
    delete : Proc(IContactAggregationLink*, HRESULT)
    save : Proc(IContactAggregationLink*, HRESULT)
    get_account_id : Proc(IContactAggregationLink*, LibC::LPWSTR*, HRESULT)
    put_account_id : Proc(IContactAggregationLink*, LibC::LPWSTR, HRESULT)
    get_id : Proc(IContactAggregationLink*, LibC::LPWSTR*, HRESULT)
    get_is_link_resolved : Proc(IContactAggregationLink*, LibC::BOOL*, HRESULT)
    put_is_link_resolved : Proc(IContactAggregationLink*, LibC::BOOL, HRESULT)
    get_network_source_id_string : Proc(IContactAggregationLink*, LibC::LPWSTR*, HRESULT)
    put_network_source_id_string : Proc(IContactAggregationLink*, LibC::LPWSTR, HRESULT)
    get_remote_object_id : Proc(IContactAggregationLink*, CONTACT_AGGREGATION_BLOB**, HRESULT)
    put_remote_object_id : Proc(IContactAggregationLink*, CONTACT_AGGREGATION_BLOB*, HRESULT)
    get_server_person : Proc(IContactAggregationLink*, LibC::LPWSTR*, HRESULT)
    put_server_person : Proc(IContactAggregationLink*, LibC::LPWSTR, HRESULT)
    get_server_person_baseline : Proc(IContactAggregationLink*, LibC::LPWSTR*, HRESULT)
    put_server_person_baseline : Proc(IContactAggregationLink*, LibC::LPWSTR, HRESULT)
    get_sync_identity_hash : Proc(IContactAggregationLink*, CONTACT_AGGREGATION_BLOB**, HRESULT)
    put_sync_identity_hash : Proc(IContactAggregationLink*, CONTACT_AGGREGATION_BLOB*, HRESULT)
  end

  struct IContactAggregationLink
    lpVtbl : IContactAggregationLinkVTbl*
  end

  struct IContactAggregationLinkCollectionVTbl
    query_interface : Proc(IContactAggregationLinkCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationLinkCollection*, UInt32)
    release : Proc(IContactAggregationLinkCollection*, UInt32)
    find_first : Proc(IContactAggregationLinkCollection*, IContactAggregationLink*, HRESULT)
    find_first_by_remote_id : Proc(IContactAggregationLinkCollection*, LibC::LPWSTR, LibC::LPWSTR, CONTACT_AGGREGATION_BLOB*, IContactAggregationLink*, HRESULT)
    find_next : Proc(IContactAggregationLinkCollection*, IContactAggregationLink*, HRESULT)
    get_count : Proc(IContactAggregationLinkCollection*, UInt32*, HRESULT)
  end

  struct IContactAggregationLinkCollection
    lpVtbl : IContactAggregationLinkCollectionVTbl*
  end

  struct IContactAggregationServerPersonVTbl
    query_interface : Proc(IContactAggregationServerPerson*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationServerPerson*, UInt32)
    release : Proc(IContactAggregationServerPerson*, UInt32)
    delete : Proc(IContactAggregationServerPerson*, HRESULT)
    save : Proc(IContactAggregationServerPerson*, HRESULT)
    get_aggregate_id : Proc(IContactAggregationServerPerson*, LibC::LPWSTR*, HRESULT)
    put_aggregate_id : Proc(IContactAggregationServerPerson*, LibC::LPWSTR, HRESULT)
    get_anti_link : Proc(IContactAggregationServerPerson*, LibC::LPWSTR*, HRESULT)
    put_anti_link : Proc(IContactAggregationServerPerson*, LibC::LPWSTR, HRESULT)
    get_anti_link_baseline : Proc(IContactAggregationServerPerson*, LibC::LPWSTR*, HRESULT)
    put_anti_link_baseline : Proc(IContactAggregationServerPerson*, LibC::LPWSTR, HRESULT)
    get_favorite_order : Proc(IContactAggregationServerPerson*, UInt32*, HRESULT)
    put_favorite_order : Proc(IContactAggregationServerPerson*, UInt32, HRESULT)
    get_favorite_order_baseline : Proc(IContactAggregationServerPerson*, UInt32*, HRESULT)
    put_favorite_order_baseline : Proc(IContactAggregationServerPerson*, UInt32, HRESULT)
    get_groups : Proc(IContactAggregationServerPerson*, CONTACT_AGGREGATION_BLOB**, HRESULT)
    put_groups : Proc(IContactAggregationServerPerson*, CONTACT_AGGREGATION_BLOB*, HRESULT)
    get_groups_baseline : Proc(IContactAggregationServerPerson*, CONTACT_AGGREGATION_BLOB**, HRESULT)
    put_groups_baseline : Proc(IContactAggregationServerPerson*, CONTACT_AGGREGATION_BLOB*, HRESULT)
    get_id : Proc(IContactAggregationServerPerson*, LibC::LPWSTR*, HRESULT)
    get_is_tombstone : Proc(IContactAggregationServerPerson*, LibC::BOOL*, HRESULT)
    put_is_tombstone : Proc(IContactAggregationServerPerson*, LibC::BOOL, HRESULT)
    get_linked_aggregate_id : Proc(IContactAggregationServerPerson*, LibC::LPWSTR*, HRESULT)
    put_linked_aggregate_id : Proc(IContactAggregationServerPerson*, LibC::LPWSTR, HRESULT)
    get_object_id : Proc(IContactAggregationServerPerson*, LibC::LPWSTR*, HRESULT)
    put_object_id : Proc(IContactAggregationServerPerson*, LibC::LPWSTR, HRESULT)
  end

  struct IContactAggregationServerPerson
    lpVtbl : IContactAggregationServerPersonVTbl*
  end

  struct IContactAggregationServerPersonCollectionVTbl
    query_interface : Proc(IContactAggregationServerPersonCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContactAggregationServerPersonCollection*, UInt32)
    release : Proc(IContactAggregationServerPersonCollection*, UInt32)
    find_first : Proc(IContactAggregationServerPersonCollection*, IContactAggregationServerPerson*, HRESULT)
    find_first_by_server_id : Proc(IContactAggregationServerPersonCollection*, LibC::LPWSTR, IContactAggregationServerPerson*, HRESULT)
    find_first_by_aggregate_id : Proc(IContactAggregationServerPersonCollection*, LibC::LPWSTR, IContactAggregationServerPerson*, HRESULT)
    find_first_by_linked_aggregate_id : Proc(IContactAggregationServerPersonCollection*, LibC::LPWSTR, IContactAggregationServerPerson*, HRESULT)
    find_next : Proc(IContactAggregationServerPersonCollection*, IContactAggregationServerPerson*, HRESULT)
    get_count : Proc(IContactAggregationServerPersonCollection*, UInt32*, HRESULT)
  end

  struct IContactAggregationServerPersonCollection
    lpVtbl : IContactAggregationServerPersonCollectionVTbl*
  end

end
