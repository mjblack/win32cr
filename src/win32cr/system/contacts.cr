require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  CGD_DEFAULT = 0_u32
  CGD_UNKNOWN_PROPERTY = 0_u32
  CGD_STRING_PROPERTY = 1_u32
  CGD_DATE_PROPERTY = 2_u32
  CGD_BINARY_PROPERTY = 4_u32
  CGD_ARRAY_NODE = 8_u32
  CLSID_ContactAggregationManager = "96c8ad95-c199-44de-b34e-ac33c442df39"
  CLSID_Contact = LibC::GUID.new(0x61b68808_u32, 0x8eee_u16, 0x4fd1_u16, StaticArray[0xac_u8, 0xb8_u8, 0x3d_u8, 0x80_u8, 0x4c_u8, 0x8d_u8, 0xb0_u8, 0x56_u8])
  CLSID_ContactManager = LibC::GUID.new(0x7165c8ab_u32, 0xaf88_u16, 0x42bd_u16, StaticArray[0x86_u8, 0xfd_u8, 0x53_u8, 0x10_u8, 0xb4_u8, 0x28_u8, 0x5a_u8, 0x2_u8])


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

  IContactManager_GUID = "ad553d98-deb1-474a-8e17-fc0c2075b738"
  IID_IContactManager = LibC::GUID.new(0xad553d98_u32, 0xdeb1_u16, 0x474a_u16, StaticArray[0x8e_u8, 0x17_u8, 0xfc_u8, 0xc_u8, 0x20_u8, 0x75_u8, 0xb7_u8, 0x38_u8])
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

  IContactCollection_GUID = "b6afa338-d779-11d9-8bde-f66bad1e3f3a"
  IID_IContactCollection = LibC::GUID.new(0xb6afa338_u32, 0xd779_u16, 0x11d9_u16, StaticArray[0x8b_u8, 0xde_u8, 0xf6_u8, 0x6b_u8, 0xad_u8, 0x1e_u8, 0x3f_u8, 0x3a_u8])
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

  IContactProperties_GUID = "70dd27dd-5cbd-46e8-bef0-23b6b346288f"
  IID_IContactProperties = LibC::GUID.new(0x70dd27dd_u32, 0x5cbd_u16, 0x46e8_u16, StaticArray[0xbe_u8, 0xf0_u8, 0x23_u8, 0xb6_u8, 0xb3_u8, 0x46_u8, 0x28_u8, 0x8f_u8])
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

  IContact_GUID = "f941b671-bda7-4f77-884a-f46462f226a7"
  IID_IContact = LibC::GUID.new(0xf941b671_u32, 0xbda7_u16, 0x4f77_u16, StaticArray[0x88_u8, 0x4a_u8, 0xf4_u8, 0x64_u8, 0x62_u8, 0xf2_u8, 0x26_u8, 0xa7_u8])
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

  IContactPropertyCollection_GUID = "ffd3adf8-fa64-4328-b1b6-2e0db509cb3c"
  IID_IContactPropertyCollection = LibC::GUID.new(0xffd3adf8_u32, 0xfa64_u16, 0x4328_u16, StaticArray[0xb1_u8, 0xb6_u8, 0x2e_u8, 0xd_u8, 0xb5_u8, 0x9_u8, 0xcb_u8, 0x3c_u8])
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

  IContactAggregationManager_GUID = "1d865989-4b1f-4b60-8f34-c2ad468b2b50"
  IID_IContactAggregationManager = LibC::GUID.new(0x1d865989_u32, 0x4b1f_u16, 0x4b60_u16, StaticArray[0x8f_u8, 0x34_u8, 0xc2_u8, 0xad_u8, 0x46_u8, 0x8b_u8, 0x2b_u8, 0x50_u8])
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

  IContactAggregationContact_GUID = "1eb22e86-4c86-41f0-9f9f-c251e9fda6c3"
  IID_IContactAggregationContact = LibC::GUID.new(0x1eb22e86_u32, 0x4c86_u16, 0x41f0_u16, StaticArray[0x9f_u8, 0x9f_u8, 0xc2_u8, 0x51_u8, 0xe9_u8, 0xfd_u8, 0xa6_u8, 0xc3_u8])
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

  IContactAggregationContactCollection_GUID = "826e66fa-81de-43ca-a6fb-8c785cd996c6"
  IID_IContactAggregationContactCollection = LibC::GUID.new(0x826e66fa_u32, 0x81de_u16, 0x43ca_u16, StaticArray[0xa6_u8, 0xfb_u8, 0x8c_u8, 0x78_u8, 0x5c_u8, 0xd9_u8, 0x96_u8, 0xc6_u8])
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

  IContactAggregationAggregate_GUID = "7ed1c814-cd30-43c8-9b8d-2e489e53d54b"
  IID_IContactAggregationAggregate = LibC::GUID.new(0x7ed1c814_u32, 0xcd30_u16, 0x43c8_u16, StaticArray[0x9b_u8, 0x8d_u8, 0x2e_u8, 0x48_u8, 0x9e_u8, 0x53_u8, 0xd5_u8, 0x4b_u8])
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

  IContactAggregationAggregateCollection_GUID = "2359f3a6-3a68-40af-98db-0f9eb143c3bb"
  IID_IContactAggregationAggregateCollection = LibC::GUID.new(0x2359f3a6_u32, 0x3a68_u16, 0x40af_u16, StaticArray[0x98_u8, 0xdb_u8, 0xf_u8, 0x9e_u8, 0xb1_u8, 0x43_u8, 0xc3_u8, 0xbb_u8])
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

  IContactAggregationGroup_GUID = "c93c545f-1284-499b-96af-07372af473e0"
  IID_IContactAggregationGroup = LibC::GUID.new(0xc93c545f_u32, 0x1284_u16, 0x499b_u16, StaticArray[0x96_u8, 0xaf_u8, 0x7_u8, 0x37_u8, 0x2a_u8, 0xf4_u8, 0x73_u8, 0xe0_u8])
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

  IContactAggregationGroupCollection_GUID = "20a19a9c-d2f3-4b83-9143-beffd2cc226d"
  IID_IContactAggregationGroupCollection = LibC::GUID.new(0x20a19a9c_u32, 0xd2f3_u16, 0x4b83_u16, StaticArray[0x91_u8, 0x43_u8, 0xbe_u8, 0xff_u8, 0xd2_u8, 0xcc_u8, 0x22_u8, 0x6d_u8])
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

  IContactAggregationLink_GUID = "b6813323-a183-4654-8627-79b30de3a0ec"
  IID_IContactAggregationLink = LibC::GUID.new(0xb6813323_u32, 0xa183_u16, 0x4654_u16, StaticArray[0x86_u8, 0x27_u8, 0x79_u8, 0xb3_u8, 0xd_u8, 0xe3_u8, 0xa0_u8, 0xec_u8])
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

  IContactAggregationLinkCollection_GUID = "f8bc0e93-fb55-4f28-b9fa-b1c274153292"
  IID_IContactAggregationLinkCollection = LibC::GUID.new(0xf8bc0e93_u32, 0xfb55_u16, 0x4f28_u16, StaticArray[0xb9_u8, 0xfa_u8, 0xb1_u8, 0xc2_u8, 0x74_u8, 0x15_u8, 0x32_u8, 0x92_u8])
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

  IContactAggregationServerPerson_GUID = "7fdc3d4b-1b82-4334-85c5-25184ee5a5f2"
  IID_IContactAggregationServerPerson = LibC::GUID.new(0x7fdc3d4b_u32, 0x1b82_u16, 0x4334_u16, StaticArray[0x85_u8, 0xc5_u8, 0x25_u8, 0x18_u8, 0x4e_u8, 0xe5_u8, 0xa5_u8, 0xf2_u8])
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

  IContactAggregationServerPersonCollection_GUID = "4f730a4a-6604-47b6-a987-669ecf1e5751"
  IID_IContactAggregationServerPersonCollection = LibC::GUID.new(0x4f730a4a_u32, 0x6604_u16, 0x47b6_u16, StaticArray[0xa9_u8, 0x87_u8, 0x66_u8, 0x9e_u8, 0xcf_u8, 0x1e_u8, 0x57_u8, 0x51_u8])
  struct IContactAggregationServerPersonCollection
    lpVtbl : IContactAggregationServerPersonCollectionVTbl*
  end

end
struct LibWin32::IContactManager
  def query_interface(this : IContactManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IContactManager*, pszappname : LibC::LPWSTR, pszappversion : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.initialize.call(this, pszappname, pszappversion)
  end
  def load(this : IContactManager*, pszcontactid : LibC::LPWSTR, ppcontact : IContact*) : HRESULT
    @lpVtbl.value.load.call(this, pszcontactid, ppcontact)
  end
  def merge_contact_i_ds(this : IContactManager*, psznewcontactid : LibC::LPWSTR, pszoldcontactid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.merge_contact_i_ds.call(this, psznewcontactid, pszoldcontactid)
  end
  def get_me_contact(this : IContactManager*, ppmecontact : IContact*) : HRESULT
    @lpVtbl.value.get_me_contact.call(this, ppmecontact)
  end
  def set_me_contact(this : IContactManager*, pmecontact : IContact) : HRESULT
    @lpVtbl.value.set_me_contact.call(this, pmecontact)
  end
  def get_contact_collection(this : IContactManager*, ppcontactcollection : IContactCollection*) : HRESULT
    @lpVtbl.value.get_contact_collection.call(this, ppcontactcollection)
  end
end
struct LibWin32::IContactCollection
  def query_interface(this : IContactCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def reset(this : IContactCollection*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def next(this : IContactCollection*) : HRESULT
    @lpVtbl.value.next.call(this)
  end
  def get_current(this : IContactCollection*, ppcontact : IContact*) : HRESULT
    @lpVtbl.value.get_current.call(this, ppcontact)
  end
end
struct LibWin32::IContactProperties
  def query_interface(this : IContactProperties*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactProperties*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactProperties*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_string(this : IContactProperties*, pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pszvalue : Char*, cchvalue : UInt32, pdwcchpropertyvaluerequired : UInt32*) : HRESULT
    @lpVtbl.value.get_string.call(this, pszpropertyname, dwflags, pszvalue, cchvalue, pdwcchpropertyvaluerequired)
  end
  def get_date(this : IContactProperties*, pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pftdatetime : FILETIME*) : HRESULT
    @lpVtbl.value.get_date.call(this, pszpropertyname, dwflags, pftdatetime)
  end
  def get_binary(this : IContactProperties*, pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pszcontenttype : Char*, cchcontenttype : UInt32, pdwcchcontenttyperequired : UInt32*, ppstream : IStream*) : HRESULT
    @lpVtbl.value.get_binary.call(this, pszpropertyname, dwflags, pszcontenttype, cchcontenttype, pdwcchcontenttyperequired, ppstream)
  end
  def get_labels(this : IContactProperties*, pszarrayelementname : LibC::LPWSTR, dwflags : UInt32, pszlabels : Char*, cchlabels : UInt32, pdwcchlabelsrequired : UInt32*) : HRESULT
    @lpVtbl.value.get_labels.call(this, pszarrayelementname, dwflags, pszlabels, cchlabels, pdwcchlabelsrequired)
  end
  def set_string(this : IContactProperties*, pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_string.call(this, pszpropertyname, dwflags, pszvalue)
  end
  def set_date(this : IContactProperties*, pszpropertyname : LibC::LPWSTR, dwflags : UInt32, ftdatetime : FILETIME) : HRESULT
    @lpVtbl.value.set_date.call(this, pszpropertyname, dwflags, ftdatetime)
  end
  def set_binary(this : IContactProperties*, pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pszcontenttype : LibC::LPWSTR, pstream : IStream) : HRESULT
    @lpVtbl.value.set_binary.call(this, pszpropertyname, dwflags, pszcontenttype, pstream)
  end
  def set_labels(this : IContactProperties*, pszarrayelementname : LibC::LPWSTR, dwflags : UInt32, dwlabelcount : UInt32, ppszlabels : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.set_labels.call(this, pszarrayelementname, dwflags, dwlabelcount, ppszlabels)
  end
  def create_array_node(this : IContactProperties*, pszarrayname : LibC::LPWSTR, dwflags : UInt32, fappend : LibC::BOOL, psznewarrayelementname : Char*, cchnewarrayelementname : UInt32, pdwcchnewarrayelementnamerequired : UInt32*) : HRESULT
    @lpVtbl.value.create_array_node.call(this, pszarrayname, dwflags, fappend, psznewarrayelementname, cchnewarrayelementname, pdwcchnewarrayelementnamerequired)
  end
  def delete_property(this : IContactProperties*, pszpropertyname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.delete_property.call(this, pszpropertyname, dwflags)
  end
  def delete_array_node(this : IContactProperties*, pszarrayelementname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.delete_array_node.call(this, pszarrayelementname, dwflags)
  end
  def delete_labels(this : IContactProperties*, pszarrayelementname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.delete_labels.call(this, pszarrayelementname, dwflags)
  end
  def get_property_collection(this : IContactProperties*, pppropertycollection : IContactPropertyCollection*, dwflags : UInt32, pszmultivaluename : LibC::LPWSTR, dwlabelcount : UInt32, ppszlabels : LibC::LPWSTR*, fanylabelmatches : LibC::BOOL) : HRESULT
    @lpVtbl.value.get_property_collection.call(this, pppropertycollection, dwflags, pszmultivaluename, dwlabelcount, ppszlabels, fanylabelmatches)
  end
end
struct LibWin32::IContact
  def query_interface(this : IContact*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContact*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContact*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_contact_id(this : IContact*, pszcontactid : Char*, cchcontactid : UInt32, pdwcchcontactidrequired : UInt32*) : HRESULT
    @lpVtbl.value.get_contact_id.call(this, pszcontactid, cchcontactid, pdwcchcontactidrequired)
  end
  def get_path(this : IContact*, pszpath : Char*, cchpath : UInt32, pdwcchpathrequired : UInt32*) : HRESULT
    @lpVtbl.value.get_path.call(this, pszpath, cchpath, pdwcchpathrequired)
  end
  def commit_changes(this : IContact*, dwcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit_changes.call(this, dwcommitflags)
  end
end
struct LibWin32::IContactPropertyCollection
  def query_interface(this : IContactPropertyCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactPropertyCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactPropertyCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def reset(this : IContactPropertyCollection*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def next(this : IContactPropertyCollection*) : HRESULT
    @lpVtbl.value.next.call(this)
  end
  def get_property_name(this : IContactPropertyCollection*, pszpropertyname : Char*, cchpropertyname : UInt32, pdwcchpropertynamerequired : UInt32*) : HRESULT
    @lpVtbl.value.get_property_name.call(this, pszpropertyname, cchpropertyname, pdwcchpropertynamerequired)
  end
  def get_property_type(this : IContactPropertyCollection*, pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_property_type.call(this, pdwtype)
  end
  def get_property_version(this : IContactPropertyCollection*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_property_version.call(this, pdwversion)
  end
  def get_property_modification_date(this : IContactPropertyCollection*, pftmodificationdate : FILETIME*) : HRESULT
    @lpVtbl.value.get_property_modification_date.call(this, pftmodificationdate)
  end
  def get_property_array_element_id(this : IContactPropertyCollection*, pszarrayelementid : Char*, ccharrayelementid : UInt32, pdwccharrayelementidrequired : UInt32*) : HRESULT
    @lpVtbl.value.get_property_array_element_id.call(this, pszarrayelementid, ccharrayelementid, pdwccharrayelementidrequired)
  end
end
struct LibWin32::IContactAggregationManager
  def query_interface(this : IContactAggregationManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_version_info(this : IContactAggregationManager*, plmajorversion : Int32*, plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_version_info.call(this, plmajorversion, plminorversion)
  end
  def create_or_open_group(this : IContactAggregationManager*, pgroupname : LibC::LPWSTR, options : CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS, pcreatedgroup : LibC::BOOL*, ppgroup : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.create_or_open_group.call(this, pgroupname, options, pcreatedgroup, ppgroup)
  end
  def create_external_contact(this : IContactAggregationManager*, ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.create_external_contact.call(this, ppitem)
  end
  def create_server_person(this : IContactAggregationManager*, ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.create_server_person.call(this, ppserverperson)
  end
  def create_server_contact_link(this : IContactAggregationManager*, ppservercontactlink : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.create_server_contact_link.call(this, ppservercontactlink)
  end
  def flush(this : IContactAggregationManager*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
  def open_aggregate_contact(this : IContactAggregationManager*, pitemid : LibC::LPWSTR, ppitem : IContactAggregationAggregate*) : HRESULT
    @lpVtbl.value.open_aggregate_contact.call(this, pitemid, ppitem)
  end
  def open_contact(this : IContactAggregationManager*, pitemid : LibC::LPWSTR, ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.open_contact.call(this, pitemid, ppitem)
  end
  def open_server_contact_link(this : IContactAggregationManager*, pitemid : LibC::LPWSTR, ppitem : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.open_server_contact_link.call(this, pitemid, ppitem)
  end
  def open_server_person(this : IContactAggregationManager*, pitemid : LibC::LPWSTR, ppitem : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.open_server_person.call(this, pitemid, ppitem)
  end
  def get_contacts(this : IContactAggregationManager*, options : CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppitems : IContactAggregationContactCollection*) : HRESULT
    @lpVtbl.value.get_contacts.call(this, options, ppitems)
  end
  def get_aggregate_contacts(this : IContactAggregationManager*, options : CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppaggregates : IContactAggregationAggregateCollection*) : HRESULT
    @lpVtbl.value.get_aggregate_contacts.call(this, options, ppaggregates)
  end
  def get_groups(this : IContactAggregationManager*, options : CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppgroups : IContactAggregationGroupCollection*) : HRESULT
    @lpVtbl.value.get_groups.call(this, options, ppgroups)
  end
  def get_server_persons(this : IContactAggregationManager*, ppserverpersoncollection : IContactAggregationServerPersonCollection*) : HRESULT
    @lpVtbl.value.get_server_persons.call(this, ppserverpersoncollection)
  end
  def get_server_contact_links(this : IContactAggregationManager*, ppersonitemid : LibC::LPWSTR, ppservercontactlinkcollection : IContactAggregationLinkCollection*) : HRESULT
    @lpVtbl.value.get_server_contact_links.call(this, ppersonitemid, ppservercontactlinkcollection)
  end
end
struct LibWin32::IContactAggregationContact
  def query_interface(this : IContactAggregationContact*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationContact*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationContact*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def delete(this : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def save(this : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def move_to_aggregate(this : IContactAggregationContact*, paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.move_to_aggregate.call(this, paggregateid)
  end
  def unlink(this : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.unlink.call(this)
  end
  def get_account_id(this : IContactAggregationContact*, ppaccountid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_account_id.call(this, ppaccountid)
  end
  def put_account_id(this : IContactAggregationContact*, paccountid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_account_id.call(this, paccountid)
  end
  def get_aggregate_id(this : IContactAggregationContact*, ppaggregateid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_aggregate_id.call(this, ppaggregateid)
  end
  def get_id(this : IContactAggregationContact*, ppitemid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.call(this, ppitemid)
  end
  def get_is_me(this : IContactAggregationContact*, pisme : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_me.call(this, pisme)
  end
  def get_is_external(this : IContactAggregationContact*, pisexternal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_external.call(this, pisexternal)
  end
  def get_network_source_id(this : IContactAggregationContact*, pnetworksourceid : UInt32*) : HRESULT
    @lpVtbl.value.get_network_source_id.call(this, pnetworksourceid)
  end
  def put_network_source_id(this : IContactAggregationContact*, networksourceid : UInt32) : HRESULT
    @lpVtbl.value.put_network_source_id.call(this, networksourceid)
  end
  def get_network_source_id_string(this : IContactAggregationContact*, ppnetworksourceid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_network_source_id_string.call(this, ppnetworksourceid)
  end
  def put_network_source_id_string(this : IContactAggregationContact*, pnetworksourceid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_network_source_id_string.call(this, pnetworksourceid)
  end
  def get_remote_object_id(this : IContactAggregationContact*, ppremoteobjectid : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_remote_object_id.call(this, ppremoteobjectid)
  end
  def put_remote_object_id(this : IContactAggregationContact*, premoteobjectid : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_remote_object_id.call(this, premoteobjectid)
  end
  def get_sync_identity_hash(this : IContactAggregationContact*, ppsyncidentityhash : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_sync_identity_hash.call(this, ppsyncidentityhash)
  end
  def put_sync_identity_hash(this : IContactAggregationContact*, psyncidentityhash : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_sync_identity_hash.call(this, psyncidentityhash)
  end
end
struct LibWin32::IContactAggregationContactCollection
  def query_interface(this : IContactAggregationContactCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationContactCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationContactCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def find_first(this : IContactAggregationContactCollection*, ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.find_first.call(this, ppitem)
  end
  def find_next(this : IContactAggregationContactCollection*, ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.find_next.call(this, ppitem)
  end
  def find_first_by_identity_hash(this : IContactAggregationContactCollection*, psourcetype : LibC::LPWSTR, paccountid : LibC::LPWSTR, pidentityhash : CONTACT_AGGREGATION_BLOB*, ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.find_first_by_identity_hash.call(this, psourcetype, paccountid, pidentityhash, ppitem)
  end
  def get_count(this : IContactAggregationContactCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def find_first_by_remote_id(this : IContactAggregationContactCollection*, psourcetype : LibC::LPWSTR, paccountid : LibC::LPWSTR, premoteobjectid : CONTACT_AGGREGATION_BLOB*, ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.find_first_by_remote_id.call(this, psourcetype, paccountid, premoteobjectid, ppitem)
  end
end
struct LibWin32::IContactAggregationAggregate
  def query_interface(this : IContactAggregationAggregate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationAggregate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationAggregate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def save(this : IContactAggregationAggregate*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_component_items(this : IContactAggregationAggregate*, pcomponentitems : IContactAggregationContactCollection*) : HRESULT
    @lpVtbl.value.get_component_items.call(this, pcomponentitems)
  end
  def link(this : IContactAggregationAggregate*, paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.link.call(this, paggregateid)
  end
  def get_groups(this : IContactAggregationAggregate*, options : CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppgroups : IContactAggregationGroupCollection*) : HRESULT
    @lpVtbl.value.get_groups.call(this, options, ppgroups)
  end
  def get_anti_link(this : IContactAggregationAggregate*, ppantilink : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_anti_link.call(this, ppantilink)
  end
  def put_anti_link(this : IContactAggregationAggregate*, pantilink : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_anti_link.call(this, pantilink)
  end
  def get_favorite_order(this : IContactAggregationAggregate*, pfavoriteorder : UInt32*) : HRESULT
    @lpVtbl.value.get_favorite_order.call(this, pfavoriteorder)
  end
  def put_favorite_order(this : IContactAggregationAggregate*, favoriteorder : UInt32) : HRESULT
    @lpVtbl.value.put_favorite_order.call(this, favoriteorder)
  end
  def get_id(this : IContactAggregationAggregate*, ppitemid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.call(this, ppitemid)
  end
end
struct LibWin32::IContactAggregationAggregateCollection
  def query_interface(this : IContactAggregationAggregateCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationAggregateCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationAggregateCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def find_first(this : IContactAggregationAggregateCollection*, ppaggregate : IContactAggregationAggregate*) : HRESULT
    @lpVtbl.value.find_first.call(this, ppaggregate)
  end
  def find_first_by_anti_link_id(this : IContactAggregationAggregateCollection*, pantilinkid : LibC::LPWSTR, ppaggregate : IContactAggregationAggregate*) : HRESULT
    @lpVtbl.value.find_first_by_anti_link_id.call(this, pantilinkid, ppaggregate)
  end
  def find_next(this : IContactAggregationAggregateCollection*, ppaggregate : IContactAggregationAggregate*) : HRESULT
    @lpVtbl.value.find_next.call(this, ppaggregate)
  end
  def get_count(this : IContactAggregationAggregateCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
end
struct LibWin32::IContactAggregationGroup
  def query_interface(this : IContactAggregationGroup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationGroup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationGroup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def delete(this : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def save(this : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def add(this : IContactAggregationGroup*, paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add.call(this, paggregateid)
  end
  def remove(this : IContactAggregationGroup*, paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove.call(this, paggregateid)
  end
  def get_members(this : IContactAggregationGroup*, ppaggregatecontactcollection : IContactAggregationAggregateCollection*) : HRESULT
    @lpVtbl.value.get_members.call(this, ppaggregatecontactcollection)
  end
  def get_global_object_id(this : IContactAggregationGroup*, pglobalobjectid : Guid*) : HRESULT
    @lpVtbl.value.get_global_object_id.call(this, pglobalobjectid)
  end
  def put_global_object_id(this : IContactAggregationGroup*, pglobalobjectid : Guid*) : HRESULT
    @lpVtbl.value.put_global_object_id.call(this, pglobalobjectid)
  end
  def get_id(this : IContactAggregationGroup*, ppitemid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.call(this, ppitemid)
  end
  def get_name(this : IContactAggregationGroup*, ppname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.call(this, ppname)
  end
  def put_name(this : IContactAggregationGroup*, pname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_name.call(this, pname)
  end
end
struct LibWin32::IContactAggregationGroupCollection
  def query_interface(this : IContactAggregationGroupCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationGroupCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationGroupCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def find_first(this : IContactAggregationGroupCollection*, ppgroup : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.find_first.call(this, ppgroup)
  end
  def find_first_by_global_object_id(this : IContactAggregationGroupCollection*, pglobalobjectid : Guid*, ppgroup : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.find_first_by_global_object_id.call(this, pglobalobjectid, ppgroup)
  end
  def find_next(this : IContactAggregationGroupCollection*, ppgroup : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.find_next.call(this, ppgroup)
  end
  def get_count(this : IContactAggregationGroupCollection*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
end
struct LibWin32::IContactAggregationLink
  def query_interface(this : IContactAggregationLink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationLink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationLink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def delete(this : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def save(this : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_account_id(this : IContactAggregationLink*, ppaccountid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_account_id.call(this, ppaccountid)
  end
  def put_account_id(this : IContactAggregationLink*, paccountid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_account_id.call(this, paccountid)
  end
  def get_id(this : IContactAggregationLink*, ppitemid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.call(this, ppitemid)
  end
  def get_is_link_resolved(this : IContactAggregationLink*, pislinkresolved : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_link_resolved.call(this, pislinkresolved)
  end
  def put_is_link_resolved(this : IContactAggregationLink*, islinkresolved : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_is_link_resolved.call(this, islinkresolved)
  end
  def get_network_source_id_string(this : IContactAggregationLink*, ppnetworksourceid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_network_source_id_string.call(this, ppnetworksourceid)
  end
  def put_network_source_id_string(this : IContactAggregationLink*, pnetworksourceid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_network_source_id_string.call(this, pnetworksourceid)
  end
  def get_remote_object_id(this : IContactAggregationLink*, ppremoteobjectid : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_remote_object_id.call(this, ppremoteobjectid)
  end
  def put_remote_object_id(this : IContactAggregationLink*, premoteobjectid : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_remote_object_id.call(this, premoteobjectid)
  end
  def get_server_person(this : IContactAggregationLink*, ppserverpersonid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_server_person.call(this, ppserverpersonid)
  end
  def put_server_person(this : IContactAggregationLink*, pserverpersonid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_server_person.call(this, pserverpersonid)
  end
  def get_server_person_baseline(this : IContactAggregationLink*, ppserverpersonid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_server_person_baseline.call(this, ppserverpersonid)
  end
  def put_server_person_baseline(this : IContactAggregationLink*, pserverpersonid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_server_person_baseline.call(this, pserverpersonid)
  end
  def get_sync_identity_hash(this : IContactAggregationLink*, ppsyncidentityhash : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_sync_identity_hash.call(this, ppsyncidentityhash)
  end
  def put_sync_identity_hash(this : IContactAggregationLink*, psyncidentityhash : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_sync_identity_hash.call(this, psyncidentityhash)
  end
end
struct LibWin32::IContactAggregationLinkCollection
  def query_interface(this : IContactAggregationLinkCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationLinkCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationLinkCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def find_first(this : IContactAggregationLinkCollection*, ppservercontactlink : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.find_first.call(this, ppservercontactlink)
  end
  def find_first_by_remote_id(this : IContactAggregationLinkCollection*, psourcetype : LibC::LPWSTR, paccountid : LibC::LPWSTR, premoteid : CONTACT_AGGREGATION_BLOB*, ppservercontactlink : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.find_first_by_remote_id.call(this, psourcetype, paccountid, premoteid, ppservercontactlink)
  end
  def find_next(this : IContactAggregationLinkCollection*, ppservercontactlink : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.find_next.call(this, ppservercontactlink)
  end
  def get_count(this : IContactAggregationLinkCollection*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
end
struct LibWin32::IContactAggregationServerPerson
  def query_interface(this : IContactAggregationServerPerson*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationServerPerson*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationServerPerson*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def delete(this : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def save(this : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.save.call(this)
  end
  def get_aggregate_id(this : IContactAggregationServerPerson*, ppaggregateid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_aggregate_id.call(this, ppaggregateid)
  end
  def put_aggregate_id(this : IContactAggregationServerPerson*, paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_aggregate_id.call(this, paggregateid)
  end
  def get_anti_link(this : IContactAggregationServerPerson*, ppantilink : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_anti_link.call(this, ppantilink)
  end
  def put_anti_link(this : IContactAggregationServerPerson*, pantilink : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_anti_link.call(this, pantilink)
  end
  def get_anti_link_baseline(this : IContactAggregationServerPerson*, ppantilink : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_anti_link_baseline.call(this, ppantilink)
  end
  def put_anti_link_baseline(this : IContactAggregationServerPerson*, pantilink : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_anti_link_baseline.call(this, pantilink)
  end
  def get_favorite_order(this : IContactAggregationServerPerson*, pfavoriteorder : UInt32*) : HRESULT
    @lpVtbl.value.get_favorite_order.call(this, pfavoriteorder)
  end
  def put_favorite_order(this : IContactAggregationServerPerson*, favoriteorder : UInt32) : HRESULT
    @lpVtbl.value.put_favorite_order.call(this, favoriteorder)
  end
  def get_favorite_order_baseline(this : IContactAggregationServerPerson*, pfavoriteorder : UInt32*) : HRESULT
    @lpVtbl.value.get_favorite_order_baseline.call(this, pfavoriteorder)
  end
  def put_favorite_order_baseline(this : IContactAggregationServerPerson*, favoriteorder : UInt32) : HRESULT
    @lpVtbl.value.put_favorite_order_baseline.call(this, favoriteorder)
  end
  def get_groups(this : IContactAggregationServerPerson*, pgroups : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_groups.call(this, pgroups)
  end
  def put_groups(this : IContactAggregationServerPerson*, pgroups : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_groups.call(this, pgroups)
  end
  def get_groups_baseline(this : IContactAggregationServerPerson*, ppgroups : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_groups_baseline.call(this, ppgroups)
  end
  def put_groups_baseline(this : IContactAggregationServerPerson*, pgroups : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_groups_baseline.call(this, pgroups)
  end
  def get_id(this : IContactAggregationServerPerson*, ppid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.call(this, ppid)
  end
  def get_is_tombstone(this : IContactAggregationServerPerson*, pistombstone : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_tombstone.call(this, pistombstone)
  end
  def put_is_tombstone(this : IContactAggregationServerPerson*, istombstone : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_is_tombstone.call(this, istombstone)
  end
  def get_linked_aggregate_id(this : IContactAggregationServerPerson*, pplinkedaggregateid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_linked_aggregate_id.call(this, pplinkedaggregateid)
  end
  def put_linked_aggregate_id(this : IContactAggregationServerPerson*, plinkedaggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_linked_aggregate_id.call(this, plinkedaggregateid)
  end
  def get_object_id(this : IContactAggregationServerPerson*, ppobjectid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_object_id.call(this, ppobjectid)
  end
  def put_object_id(this : IContactAggregationServerPerson*, pobjectid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_object_id.call(this, pobjectid)
  end
end
struct LibWin32::IContactAggregationServerPersonCollection
  def query_interface(this : IContactAggregationServerPersonCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContactAggregationServerPersonCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContactAggregationServerPersonCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def find_first(this : IContactAggregationServerPersonCollection*, ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_first.call(this, ppserverperson)
  end
  def find_first_by_server_id(this : IContactAggregationServerPersonCollection*, pserverid : LibC::LPWSTR, ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_first_by_server_id.call(this, pserverid, ppserverperson)
  end
  def find_first_by_aggregate_id(this : IContactAggregationServerPersonCollection*, paggregateid : LibC::LPWSTR, ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_first_by_aggregate_id.call(this, paggregateid, ppserverperson)
  end
  def find_first_by_linked_aggregate_id(this : IContactAggregationServerPersonCollection*, paggregateid : LibC::LPWSTR, ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_first_by_linked_aggregate_id.call(this, paggregateid, ppserverperson)
  end
  def find_next(this : IContactAggregationServerPersonCollection*, ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_next.call(this, ppserverperson)
  end
  def get_count(this : IContactAggregationServerPersonCollection*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
end
