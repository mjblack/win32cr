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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    load : UInt64
    merge_contact_i_ds : UInt64
    get_me_contact : UInt64
    set_me_contact : UInt64
    get_contact_collection : UInt64
  end

  IContactManager_GUID = "ad553d98-deb1-474a-8e17-fc0c2075b738"
  IID_IContactManager = LibC::GUID.new(0xad553d98_u32, 0xdeb1_u16, 0x474a_u16, StaticArray[0x8e_u8, 0x17_u8, 0xfc_u8, 0xc_u8, 0x20_u8, 0x75_u8, 0xb7_u8, 0x38_u8])
  struct IContactManager
    lpVtbl : IContactManagerVTbl*
  end

  struct IContactCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reset : UInt64
    next : UInt64
    get_current : UInt64
  end

  IContactCollection_GUID = "b6afa338-d779-11d9-8bde-f66bad1e3f3a"
  IID_IContactCollection = LibC::GUID.new(0xb6afa338_u32, 0xd779_u16, 0x11d9_u16, StaticArray[0x8b_u8, 0xde_u8, 0xf6_u8, 0x6b_u8, 0xad_u8, 0x1e_u8, 0x3f_u8, 0x3a_u8])
  struct IContactCollection
    lpVtbl : IContactCollectionVTbl*
  end

  struct IContactPropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_string : UInt64
    get_date : UInt64
    get_binary : UInt64
    get_labels : UInt64
    set_string : UInt64
    set_date : UInt64
    set_binary : UInt64
    set_labels : UInt64
    create_array_node : UInt64
    delete_property : UInt64
    delete_array_node : UInt64
    delete_labels : UInt64
    get_property_collection : UInt64
  end

  IContactProperties_GUID = "70dd27dd-5cbd-46e8-bef0-23b6b346288f"
  IID_IContactProperties = LibC::GUID.new(0x70dd27dd_u32, 0x5cbd_u16, 0x46e8_u16, StaticArray[0xbe_u8, 0xf0_u8, 0x23_u8, 0xb6_u8, 0xb3_u8, 0x46_u8, 0x28_u8, 0x8f_u8])
  struct IContactProperties
    lpVtbl : IContactPropertiesVTbl*
  end

  struct IContactVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_contact_id : UInt64
    get_path : UInt64
    commit_changes : UInt64
  end

  IContact_GUID = "f941b671-bda7-4f77-884a-f46462f226a7"
  IID_IContact = LibC::GUID.new(0xf941b671_u32, 0xbda7_u16, 0x4f77_u16, StaticArray[0x88_u8, 0x4a_u8, 0xf4_u8, 0x64_u8, 0x62_u8, 0xf2_u8, 0x26_u8, 0xa7_u8])
  struct IContact
    lpVtbl : IContactVTbl*
  end

  struct IContactPropertyCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reset : UInt64
    next : UInt64
    get_property_name : UInt64
    get_property_type : UInt64
    get_property_version : UInt64
    get_property_modification_date : UInt64
    get_property_array_element_id : UInt64
  end

  IContactPropertyCollection_GUID = "ffd3adf8-fa64-4328-b1b6-2e0db509cb3c"
  IID_IContactPropertyCollection = LibC::GUID.new(0xffd3adf8_u32, 0xfa64_u16, 0x4328_u16, StaticArray[0xb1_u8, 0xb6_u8, 0x2e_u8, 0xd_u8, 0xb5_u8, 0x9_u8, 0xcb_u8, 0x3c_u8])
  struct IContactPropertyCollection
    lpVtbl : IContactPropertyCollectionVTbl*
  end

  struct IContactAggregationManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_version_info : UInt64
    create_or_open_group : UInt64
    create_external_contact : UInt64
    create_server_person : UInt64
    create_server_contact_link : UInt64
    flush : UInt64
    open_aggregate_contact : UInt64
    open_contact : UInt64
    open_server_contact_link : UInt64
    open_server_person : UInt64
    get_contacts : UInt64
    get_aggregate_contacts : UInt64
    get_groups : UInt64
    get_server_persons : UInt64
    get_server_contact_links : UInt64
  end

  IContactAggregationManager_GUID = "1d865989-4b1f-4b60-8f34-c2ad468b2b50"
  IID_IContactAggregationManager = LibC::GUID.new(0x1d865989_u32, 0x4b1f_u16, 0x4b60_u16, StaticArray[0x8f_u8, 0x34_u8, 0xc2_u8, 0xad_u8, 0x46_u8, 0x8b_u8, 0x2b_u8, 0x50_u8])
  struct IContactAggregationManager
    lpVtbl : IContactAggregationManagerVTbl*
  end

  struct IContactAggregationContactVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    delete : UInt64
    save : UInt64
    move_to_aggregate : UInt64
    unlink : UInt64
    get_account_id : UInt64
    put_account_id : UInt64
    get_aggregate_id : UInt64
    get_id : UInt64
    get_is_me : UInt64
    get_is_external : UInt64
    get_network_source_id : UInt64
    put_network_source_id : UInt64
    get_network_source_id_string : UInt64
    put_network_source_id_string : UInt64
    get_remote_object_id : UInt64
    put_remote_object_id : UInt64
    get_sync_identity_hash : UInt64
    put_sync_identity_hash : UInt64
  end

  IContactAggregationContact_GUID = "1eb22e86-4c86-41f0-9f9f-c251e9fda6c3"
  IID_IContactAggregationContact = LibC::GUID.new(0x1eb22e86_u32, 0x4c86_u16, 0x41f0_u16, StaticArray[0x9f_u8, 0x9f_u8, 0xc2_u8, 0x51_u8, 0xe9_u8, 0xfd_u8, 0xa6_u8, 0xc3_u8])
  struct IContactAggregationContact
    lpVtbl : IContactAggregationContactVTbl*
  end

  struct IContactAggregationContactCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    find_first : UInt64
    find_next : UInt64
    find_first_by_identity_hash : UInt64
    get_count : UInt64
    find_first_by_remote_id : UInt64
  end

  IContactAggregationContactCollection_GUID = "826e66fa-81de-43ca-a6fb-8c785cd996c6"
  IID_IContactAggregationContactCollection = LibC::GUID.new(0x826e66fa_u32, 0x81de_u16, 0x43ca_u16, StaticArray[0xa6_u8, 0xfb_u8, 0x8c_u8, 0x78_u8, 0x5c_u8, 0xd9_u8, 0x96_u8, 0xc6_u8])
  struct IContactAggregationContactCollection
    lpVtbl : IContactAggregationContactCollectionVTbl*
  end

  struct IContactAggregationAggregateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    save : UInt64
    get_component_items : UInt64
    link : UInt64
    get_groups : UInt64
    get_anti_link : UInt64
    put_anti_link : UInt64
    get_favorite_order : UInt64
    put_favorite_order : UInt64
    get_id : UInt64
  end

  IContactAggregationAggregate_GUID = "7ed1c814-cd30-43c8-9b8d-2e489e53d54b"
  IID_IContactAggregationAggregate = LibC::GUID.new(0x7ed1c814_u32, 0xcd30_u16, 0x43c8_u16, StaticArray[0x9b_u8, 0x8d_u8, 0x2e_u8, 0x48_u8, 0x9e_u8, 0x53_u8, 0xd5_u8, 0x4b_u8])
  struct IContactAggregationAggregate
    lpVtbl : IContactAggregationAggregateVTbl*
  end

  struct IContactAggregationAggregateCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    find_first : UInt64
    find_first_by_anti_link_id : UInt64
    find_next : UInt64
    get_count : UInt64
  end

  IContactAggregationAggregateCollection_GUID = "2359f3a6-3a68-40af-98db-0f9eb143c3bb"
  IID_IContactAggregationAggregateCollection = LibC::GUID.new(0x2359f3a6_u32, 0x3a68_u16, 0x40af_u16, StaticArray[0x98_u8, 0xdb_u8, 0xf_u8, 0x9e_u8, 0xb1_u8, 0x43_u8, 0xc3_u8, 0xbb_u8])
  struct IContactAggregationAggregateCollection
    lpVtbl : IContactAggregationAggregateCollectionVTbl*
  end

  struct IContactAggregationGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    delete : UInt64
    save : UInt64
    add : UInt64
    remove : UInt64
    get_members : UInt64
    get_global_object_id : UInt64
    put_global_object_id : UInt64
    get_id : UInt64
    get_name : UInt64
    put_name : UInt64
  end

  IContactAggregationGroup_GUID = "c93c545f-1284-499b-96af-07372af473e0"
  IID_IContactAggregationGroup = LibC::GUID.new(0xc93c545f_u32, 0x1284_u16, 0x499b_u16, StaticArray[0x96_u8, 0xaf_u8, 0x7_u8, 0x37_u8, 0x2a_u8, 0xf4_u8, 0x73_u8, 0xe0_u8])
  struct IContactAggregationGroup
    lpVtbl : IContactAggregationGroupVTbl*
  end

  struct IContactAggregationGroupCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    find_first : UInt64
    find_first_by_global_object_id : UInt64
    find_next : UInt64
    get_count : UInt64
  end

  IContactAggregationGroupCollection_GUID = "20a19a9c-d2f3-4b83-9143-beffd2cc226d"
  IID_IContactAggregationGroupCollection = LibC::GUID.new(0x20a19a9c_u32, 0xd2f3_u16, 0x4b83_u16, StaticArray[0x91_u8, 0x43_u8, 0xbe_u8, 0xff_u8, 0xd2_u8, 0xcc_u8, 0x22_u8, 0x6d_u8])
  struct IContactAggregationGroupCollection
    lpVtbl : IContactAggregationGroupCollectionVTbl*
  end

  struct IContactAggregationLinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    delete : UInt64
    save : UInt64
    get_account_id : UInt64
    put_account_id : UInt64
    get_id : UInt64
    get_is_link_resolved : UInt64
    put_is_link_resolved : UInt64
    get_network_source_id_string : UInt64
    put_network_source_id_string : UInt64
    get_remote_object_id : UInt64
    put_remote_object_id : UInt64
    get_server_person : UInt64
    put_server_person : UInt64
    get_server_person_baseline : UInt64
    put_server_person_baseline : UInt64
    get_sync_identity_hash : UInt64
    put_sync_identity_hash : UInt64
  end

  IContactAggregationLink_GUID = "b6813323-a183-4654-8627-79b30de3a0ec"
  IID_IContactAggregationLink = LibC::GUID.new(0xb6813323_u32, 0xa183_u16, 0x4654_u16, StaticArray[0x86_u8, 0x27_u8, 0x79_u8, 0xb3_u8, 0xd_u8, 0xe3_u8, 0xa0_u8, 0xec_u8])
  struct IContactAggregationLink
    lpVtbl : IContactAggregationLinkVTbl*
  end

  struct IContactAggregationLinkCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    find_first : UInt64
    find_first_by_remote_id : UInt64
    find_next : UInt64
    get_count : UInt64
  end

  IContactAggregationLinkCollection_GUID = "f8bc0e93-fb55-4f28-b9fa-b1c274153292"
  IID_IContactAggregationLinkCollection = LibC::GUID.new(0xf8bc0e93_u32, 0xfb55_u16, 0x4f28_u16, StaticArray[0xb9_u8, 0xfa_u8, 0xb1_u8, 0xc2_u8, 0x74_u8, 0x15_u8, 0x32_u8, 0x92_u8])
  struct IContactAggregationLinkCollection
    lpVtbl : IContactAggregationLinkCollectionVTbl*
  end

  struct IContactAggregationServerPersonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    delete : UInt64
    save : UInt64
    get_aggregate_id : UInt64
    put_aggregate_id : UInt64
    get_anti_link : UInt64
    put_anti_link : UInt64
    get_anti_link_baseline : UInt64
    put_anti_link_baseline : UInt64
    get_favorite_order : UInt64
    put_favorite_order : UInt64
    get_favorite_order_baseline : UInt64
    put_favorite_order_baseline : UInt64
    get_groups : UInt64
    put_groups : UInt64
    get_groups_baseline : UInt64
    put_groups_baseline : UInt64
    get_id : UInt64
    get_is_tombstone : UInt64
    put_is_tombstone : UInt64
    get_linked_aggregate_id : UInt64
    put_linked_aggregate_id : UInt64
    get_object_id : UInt64
    put_object_id : UInt64
  end

  IContactAggregationServerPerson_GUID = "7fdc3d4b-1b82-4334-85c5-25184ee5a5f2"
  IID_IContactAggregationServerPerson = LibC::GUID.new(0x7fdc3d4b_u32, 0x1b82_u16, 0x4334_u16, StaticArray[0x85_u8, 0xc5_u8, 0x25_u8, 0x18_u8, 0x4e_u8, 0xe5_u8, 0xa5_u8, 0xf2_u8])
  struct IContactAggregationServerPerson
    lpVtbl : IContactAggregationServerPersonVTbl*
  end

  struct IContactAggregationServerPersonCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    find_first : UInt64
    find_first_by_server_id : UInt64
    find_first_by_aggregate_id : UInt64
    find_first_by_linked_aggregate_id : UInt64
    find_next : UInt64
    get_count : UInt64
  end

  IContactAggregationServerPersonCollection_GUID = "4f730a4a-6604-47b6-a987-669ecf1e5751"
  IID_IContactAggregationServerPersonCollection = LibC::GUID.new(0x4f730a4a_u32, 0x6604_u16, 0x47b6_u16, StaticArray[0xa9_u8, 0x87_u8, 0x66_u8, 0x9e_u8, 0xcf_u8, 0x1e_u8, 0x57_u8, 0x51_u8])
  struct IContactAggregationServerPersonCollection
    lpVtbl : IContactAggregationServerPersonCollectionVTbl*
  end

end
struct LibWin32::IContactManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pszappname : LibC::LPWSTR, pszappversion : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pszappname, pszappversion)
  end
  def load(pszcontactid : LibC::LPWSTR, ppcontact : IContact*) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(LibC::LPWSTR, IContact*, HRESULT)).call(pszcontactid, ppcontact)
  end
  def merge_contact_i_ds(psznewcontactid : LibC::LPWSTR, pszoldcontactid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.merge_contact_i_ds.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(psznewcontactid, pszoldcontactid)
  end
  def get_me_contact(ppmecontact : IContact*) : HRESULT
    @lpVtbl.value.get_me_contact.unsafe_as(Proc(IContact*, HRESULT)).call(ppmecontact)
  end
  def set_me_contact(pmecontact : IContact) : HRESULT
    @lpVtbl.value.set_me_contact.unsafe_as(Proc(IContact, HRESULT)).call(pmecontact)
  end
  def get_contact_collection(ppcontactcollection : IContactCollection*) : HRESULT
    @lpVtbl.value.get_contact_collection.unsafe_as(Proc(IContactCollection*, HRESULT)).call(ppcontactcollection)
  end
end
struct LibWin32::IContactCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def next : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(HRESULT)).call
  end
  def get_current(ppcontact : IContact*) : HRESULT
    @lpVtbl.value.get_current.unsafe_as(Proc(IContact*, HRESULT)).call(ppcontact)
  end
end
struct LibWin32::IContactProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_string(pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pszvalue : Char*, cchvalue : UInt32, pdwcchpropertyvaluerequired : UInt32*) : HRESULT
    @lpVtbl.value.get_string.unsafe_as(Proc(LibC::LPWSTR, UInt32, Char*, UInt32, UInt32*, HRESULT)).call(pszpropertyname, dwflags, pszvalue, cchvalue, pdwcchpropertyvaluerequired)
  end
  def get_date(pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pftdatetime : FILETIME*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(LibC::LPWSTR, UInt32, FILETIME*, HRESULT)).call(pszpropertyname, dwflags, pftdatetime)
  end
  def get_binary(pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pszcontenttype : Char*, cchcontenttype : UInt32, pdwcchcontenttyperequired : UInt32*, ppstream : IStream*) : HRESULT
    @lpVtbl.value.get_binary.unsafe_as(Proc(LibC::LPWSTR, UInt32, Char*, UInt32, UInt32*, IStream*, HRESULT)).call(pszpropertyname, dwflags, pszcontenttype, cchcontenttype, pdwcchcontenttyperequired, ppstream)
  end
  def get_labels(pszarrayelementname : LibC::LPWSTR, dwflags : UInt32, pszlabels : Char*, cchlabels : UInt32, pdwcchlabelsrequired : UInt32*) : HRESULT
    @lpVtbl.value.get_labels.unsafe_as(Proc(LibC::LPWSTR, UInt32, Char*, UInt32, UInt32*, HRESULT)).call(pszarrayelementname, dwflags, pszlabels, cchlabels, pdwcchlabelsrequired)
  end
  def set_string(pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_string.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)).call(pszpropertyname, dwflags, pszvalue)
  end
  def set_date(pszpropertyname : LibC::LPWSTR, dwflags : UInt32, ftdatetime : FILETIME) : HRESULT
    @lpVtbl.value.set_date.unsafe_as(Proc(LibC::LPWSTR, UInt32, FILETIME, HRESULT)).call(pszpropertyname, dwflags, ftdatetime)
  end
  def set_binary(pszpropertyname : LibC::LPWSTR, dwflags : UInt32, pszcontenttype : LibC::LPWSTR, pstream : IStream) : HRESULT
    @lpVtbl.value.set_binary.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::LPWSTR, IStream, HRESULT)).call(pszpropertyname, dwflags, pszcontenttype, pstream)
  end
  def set_labels(pszarrayelementname : LibC::LPWSTR, dwflags : UInt32, dwlabelcount : UInt32, ppszlabels : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.set_labels.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, LibC::LPWSTR*, HRESULT)).call(pszarrayelementname, dwflags, dwlabelcount, ppszlabels)
  end
  def create_array_node(pszarrayname : LibC::LPWSTR, dwflags : UInt32, fappend : LibC::BOOL, psznewarrayelementname : Char*, cchnewarrayelementname : UInt32, pdwcchnewarrayelementnamerequired : UInt32*) : HRESULT
    @lpVtbl.value.create_array_node.unsafe_as(Proc(LibC::LPWSTR, UInt32, LibC::BOOL, Char*, UInt32, UInt32*, HRESULT)).call(pszarrayname, dwflags, fappend, psznewarrayelementname, cchnewarrayelementname, pdwcchnewarrayelementnamerequired)
  end
  def delete_property(pszpropertyname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.delete_property.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszpropertyname, dwflags)
  end
  def delete_array_node(pszarrayelementname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.delete_array_node.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszarrayelementname, dwflags)
  end
  def delete_labels(pszarrayelementname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.delete_labels.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszarrayelementname, dwflags)
  end
  def get_property_collection(pppropertycollection : IContactPropertyCollection*, dwflags : UInt32, pszmultivaluename : LibC::LPWSTR, dwlabelcount : UInt32, ppszlabels : LibC::LPWSTR*, fanylabelmatches : LibC::BOOL) : HRESULT
    @lpVtbl.value.get_property_collection.unsafe_as(Proc(IContactPropertyCollection*, UInt32, LibC::LPWSTR, UInt32, LibC::LPWSTR*, LibC::BOOL, HRESULT)).call(pppropertycollection, dwflags, pszmultivaluename, dwlabelcount, ppszlabels, fanylabelmatches)
  end
end
struct LibWin32::IContact
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_contact_id(pszcontactid : Char*, cchcontactid : UInt32, pdwcchcontactidrequired : UInt32*) : HRESULT
    @lpVtbl.value.get_contact_id.unsafe_as(Proc(Char*, UInt32, UInt32*, HRESULT)).call(pszcontactid, cchcontactid, pdwcchcontactidrequired)
  end
  def get_path(pszpath : Char*, cchpath : UInt32, pdwcchpathrequired : UInt32*) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(Char*, UInt32, UInt32*, HRESULT)).call(pszpath, cchpath, pdwcchpathrequired)
  end
  def commit_changes(dwcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit_changes.unsafe_as(Proc(UInt32, HRESULT)).call(dwcommitflags)
  end
end
struct LibWin32::IContactPropertyCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def next : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(HRESULT)).call
  end
  def get_property_name(pszpropertyname : Char*, cchpropertyname : UInt32, pdwcchpropertynamerequired : UInt32*) : HRESULT
    @lpVtbl.value.get_property_name.unsafe_as(Proc(Char*, UInt32, UInt32*, HRESULT)).call(pszpropertyname, cchpropertyname, pdwcchpropertynamerequired)
  end
  def get_property_type(pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_property_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwtype)
  end
  def get_property_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_property_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def get_property_modification_date(pftmodificationdate : FILETIME*) : HRESULT
    @lpVtbl.value.get_property_modification_date.unsafe_as(Proc(FILETIME*, HRESULT)).call(pftmodificationdate)
  end
  def get_property_array_element_id(pszarrayelementid : Char*, ccharrayelementid : UInt32, pdwccharrayelementidrequired : UInt32*) : HRESULT
    @lpVtbl.value.get_property_array_element_id.unsafe_as(Proc(Char*, UInt32, UInt32*, HRESULT)).call(pszarrayelementid, ccharrayelementid, pdwccharrayelementidrequired)
  end
end
struct LibWin32::IContactAggregationManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_version_info(plmajorversion : Int32*, plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_version_info.unsafe_as(Proc(Int32*, Int32*, HRESULT)).call(plmajorversion, plminorversion)
  end
  def create_or_open_group(pgroupname : LibC::LPWSTR, options : CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS, pcreatedgroup : LibC::BOOL*, ppgroup : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.create_or_open_group.unsafe_as(Proc(LibC::LPWSTR, CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS, LibC::BOOL*, IContactAggregationGroup*, HRESULT)).call(pgroupname, options, pcreatedgroup, ppgroup)
  end
  def create_external_contact(ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.create_external_contact.unsafe_as(Proc(IContactAggregationContact*, HRESULT)).call(ppitem)
  end
  def create_server_person(ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.create_server_person.unsafe_as(Proc(IContactAggregationServerPerson*, HRESULT)).call(ppserverperson)
  end
  def create_server_contact_link(ppservercontactlink : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.create_server_contact_link.unsafe_as(Proc(IContactAggregationLink*, HRESULT)).call(ppservercontactlink)
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
  def open_aggregate_contact(pitemid : LibC::LPWSTR, ppitem : IContactAggregationAggregate*) : HRESULT
    @lpVtbl.value.open_aggregate_contact.unsafe_as(Proc(LibC::LPWSTR, IContactAggregationAggregate*, HRESULT)).call(pitemid, ppitem)
  end
  def open_contact(pitemid : LibC::LPWSTR, ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.open_contact.unsafe_as(Proc(LibC::LPWSTR, IContactAggregationContact*, HRESULT)).call(pitemid, ppitem)
  end
  def open_server_contact_link(pitemid : LibC::LPWSTR, ppitem : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.open_server_contact_link.unsafe_as(Proc(LibC::LPWSTR, IContactAggregationLink*, HRESULT)).call(pitemid, ppitem)
  end
  def open_server_person(pitemid : LibC::LPWSTR, ppitem : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.open_server_person.unsafe_as(Proc(LibC::LPWSTR, IContactAggregationServerPerson*, HRESULT)).call(pitemid, ppitem)
  end
  def get_contacts(options : CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppitems : IContactAggregationContactCollection*) : HRESULT
    @lpVtbl.value.get_contacts.unsafe_as(Proc(CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationContactCollection*, HRESULT)).call(options, ppitems)
  end
  def get_aggregate_contacts(options : CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppaggregates : IContactAggregationAggregateCollection*) : HRESULT
    @lpVtbl.value.get_aggregate_contacts.unsafe_as(Proc(CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationAggregateCollection*, HRESULT)).call(options, ppaggregates)
  end
  def get_groups(options : CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppgroups : IContactAggregationGroupCollection*) : HRESULT
    @lpVtbl.value.get_groups.unsafe_as(Proc(CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationGroupCollection*, HRESULT)).call(options, ppgroups)
  end
  def get_server_persons(ppserverpersoncollection : IContactAggregationServerPersonCollection*) : HRESULT
    @lpVtbl.value.get_server_persons.unsafe_as(Proc(IContactAggregationServerPersonCollection*, HRESULT)).call(ppserverpersoncollection)
  end
  def get_server_contact_links(ppersonitemid : LibC::LPWSTR, ppservercontactlinkcollection : IContactAggregationLinkCollection*) : HRESULT
    @lpVtbl.value.get_server_contact_links.unsafe_as(Proc(LibC::LPWSTR, IContactAggregationLinkCollection*, HRESULT)).call(ppersonitemid, ppservercontactlinkcollection)
  end
end
struct LibWin32::IContactAggregationContact
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def move_to_aggregate(paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.move_to_aggregate.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(paggregateid)
  end
  def unlink : HRESULT
    @lpVtbl.value.unlink.unsafe_as(Proc(HRESULT)).call
  end
  def get_account_id(ppaccountid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_account_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppaccountid)
  end
  def put_account_id(paccountid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_account_id.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(paccountid)
  end
  def get_aggregate_id(ppaggregateid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_aggregate_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppaggregateid)
  end
  def get_id(ppitemid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppitemid)
  end
  def get_is_me(pisme : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_me.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pisme)
  end
  def get_is_external(pisexternal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_external.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pisexternal)
  end
  def get_network_source_id(pnetworksourceid : UInt32*) : HRESULT
    @lpVtbl.value.get_network_source_id.unsafe_as(Proc(UInt32*, HRESULT)).call(pnetworksourceid)
  end
  def put_network_source_id(networksourceid : UInt32) : HRESULT
    @lpVtbl.value.put_network_source_id.unsafe_as(Proc(UInt32, HRESULT)).call(networksourceid)
  end
  def get_network_source_id_string(ppnetworksourceid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_network_source_id_string.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppnetworksourceid)
  end
  def put_network_source_id_string(pnetworksourceid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_network_source_id_string.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pnetworksourceid)
  end
  def get_remote_object_id(ppremoteobjectid : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_remote_object_id.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB**, HRESULT)).call(ppremoteobjectid)
  end
  def put_remote_object_id(premoteobjectid : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_remote_object_id.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB*, HRESULT)).call(premoteobjectid)
  end
  def get_sync_identity_hash(ppsyncidentityhash : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_sync_identity_hash.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB**, HRESULT)).call(ppsyncidentityhash)
  end
  def put_sync_identity_hash(psyncidentityhash : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_sync_identity_hash.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB*, HRESULT)).call(psyncidentityhash)
  end
end
struct LibWin32::IContactAggregationContactCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def find_first(ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(IContactAggregationContact*, HRESULT)).call(ppitem)
  end
  def find_next(ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.find_next.unsafe_as(Proc(IContactAggregationContact*, HRESULT)).call(ppitem)
  end
  def find_first_by_identity_hash(psourcetype : LibC::LPWSTR, paccountid : LibC::LPWSTR, pidentityhash : CONTACT_AGGREGATION_BLOB*, ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.find_first_by_identity_hash.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, CONTACT_AGGREGATION_BLOB*, IContactAggregationContact*, HRESULT)).call(psourcetype, paccountid, pidentityhash, ppitem)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def find_first_by_remote_id(psourcetype : LibC::LPWSTR, paccountid : LibC::LPWSTR, premoteobjectid : CONTACT_AGGREGATION_BLOB*, ppitem : IContactAggregationContact*) : HRESULT
    @lpVtbl.value.find_first_by_remote_id.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, CONTACT_AGGREGATION_BLOB*, IContactAggregationContact*, HRESULT)).call(psourcetype, paccountid, premoteobjectid, ppitem)
  end
end
struct LibWin32::IContactAggregationAggregate
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_component_items(pcomponentitems : IContactAggregationContactCollection*) : HRESULT
    @lpVtbl.value.get_component_items.unsafe_as(Proc(IContactAggregationContactCollection*, HRESULT)).call(pcomponentitems)
  end
  def link(paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.link.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(paggregateid)
  end
  def get_groups(options : CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppgroups : IContactAggregationGroupCollection*) : HRESULT
    @lpVtbl.value.get_groups.unsafe_as(Proc(CONTACT_AGGREGATION_COLLECTION_OPTIONS, IContactAggregationGroupCollection*, HRESULT)).call(options, ppgroups)
  end
  def get_anti_link(ppantilink : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_anti_link.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppantilink)
  end
  def put_anti_link(pantilink : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_anti_link.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pantilink)
  end
  def get_favorite_order(pfavoriteorder : UInt32*) : HRESULT
    @lpVtbl.value.get_favorite_order.unsafe_as(Proc(UInt32*, HRESULT)).call(pfavoriteorder)
  end
  def put_favorite_order(favoriteorder : UInt32) : HRESULT
    @lpVtbl.value.put_favorite_order.unsafe_as(Proc(UInt32, HRESULT)).call(favoriteorder)
  end
  def get_id(ppitemid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppitemid)
  end
end
struct LibWin32::IContactAggregationAggregateCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def find_first(ppaggregate : IContactAggregationAggregate*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(IContactAggregationAggregate*, HRESULT)).call(ppaggregate)
  end
  def find_first_by_anti_link_id(pantilinkid : LibC::LPWSTR, ppaggregate : IContactAggregationAggregate*) : HRESULT
    @lpVtbl.value.find_first_by_anti_link_id.unsafe_as(Proc(LibC::LPWSTR, IContactAggregationAggregate*, HRESULT)).call(pantilinkid, ppaggregate)
  end
  def find_next(ppaggregate : IContactAggregationAggregate*) : HRESULT
    @lpVtbl.value.find_next.unsafe_as(Proc(IContactAggregationAggregate*, HRESULT)).call(ppaggregate)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
end
struct LibWin32::IContactAggregationGroup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def add(paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(paggregateid)
  end
  def remove(paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(paggregateid)
  end
  def get_members(ppaggregatecontactcollection : IContactAggregationAggregateCollection*) : HRESULT
    @lpVtbl.value.get_members.unsafe_as(Proc(IContactAggregationAggregateCollection*, HRESULT)).call(ppaggregatecontactcollection)
  end
  def get_global_object_id(pglobalobjectid : Guid*) : HRESULT
    @lpVtbl.value.get_global_object_id.unsafe_as(Proc(Guid*, HRESULT)).call(pglobalobjectid)
  end
  def put_global_object_id(pglobalobjectid : Guid*) : HRESULT
    @lpVtbl.value.put_global_object_id.unsafe_as(Proc(Guid*, HRESULT)).call(pglobalobjectid)
  end
  def get_id(ppitemid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppitemid)
  end
  def get_name(ppname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppname)
  end
  def put_name(pname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pname)
  end
end
struct LibWin32::IContactAggregationGroupCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def find_first(ppgroup : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(IContactAggregationGroup*, HRESULT)).call(ppgroup)
  end
  def find_first_by_global_object_id(pglobalobjectid : Guid*, ppgroup : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.find_first_by_global_object_id.unsafe_as(Proc(Guid*, IContactAggregationGroup*, HRESULT)).call(pglobalobjectid, ppgroup)
  end
  def find_next(ppgroup : IContactAggregationGroup*) : HRESULT
    @lpVtbl.value.find_next.unsafe_as(Proc(IContactAggregationGroup*, HRESULT)).call(ppgroup)
  end
  def get_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
end
struct LibWin32::IContactAggregationLink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_account_id(ppaccountid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_account_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppaccountid)
  end
  def put_account_id(paccountid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_account_id.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(paccountid)
  end
  def get_id(ppitemid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppitemid)
  end
  def get_is_link_resolved(pislinkresolved : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_link_resolved.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pislinkresolved)
  end
  def put_is_link_resolved(islinkresolved : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_is_link_resolved.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(islinkresolved)
  end
  def get_network_source_id_string(ppnetworksourceid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_network_source_id_string.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppnetworksourceid)
  end
  def put_network_source_id_string(pnetworksourceid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_network_source_id_string.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pnetworksourceid)
  end
  def get_remote_object_id(ppremoteobjectid : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_remote_object_id.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB**, HRESULT)).call(ppremoteobjectid)
  end
  def put_remote_object_id(premoteobjectid : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_remote_object_id.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB*, HRESULT)).call(premoteobjectid)
  end
  def get_server_person(ppserverpersonid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_server_person.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppserverpersonid)
  end
  def put_server_person(pserverpersonid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_server_person.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pserverpersonid)
  end
  def get_server_person_baseline(ppserverpersonid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_server_person_baseline.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppserverpersonid)
  end
  def put_server_person_baseline(pserverpersonid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_server_person_baseline.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pserverpersonid)
  end
  def get_sync_identity_hash(ppsyncidentityhash : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_sync_identity_hash.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB**, HRESULT)).call(ppsyncidentityhash)
  end
  def put_sync_identity_hash(psyncidentityhash : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_sync_identity_hash.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB*, HRESULT)).call(psyncidentityhash)
  end
end
struct LibWin32::IContactAggregationLinkCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def find_first(ppservercontactlink : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(IContactAggregationLink*, HRESULT)).call(ppservercontactlink)
  end
  def find_first_by_remote_id(psourcetype : LibC::LPWSTR, paccountid : LibC::LPWSTR, premoteid : CONTACT_AGGREGATION_BLOB*, ppservercontactlink : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.find_first_by_remote_id.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, CONTACT_AGGREGATION_BLOB*, IContactAggregationLink*, HRESULT)).call(psourcetype, paccountid, premoteid, ppservercontactlink)
  end
  def find_next(ppservercontactlink : IContactAggregationLink*) : HRESULT
    @lpVtbl.value.find_next.unsafe_as(Proc(IContactAggregationLink*, HRESULT)).call(ppservercontactlink)
  end
  def get_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
end
struct LibWin32::IContactAggregationServerPerson
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_aggregate_id(ppaggregateid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_aggregate_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppaggregateid)
  end
  def put_aggregate_id(paggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_aggregate_id.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(paggregateid)
  end
  def get_anti_link(ppantilink : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_anti_link.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppantilink)
  end
  def put_anti_link(pantilink : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_anti_link.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pantilink)
  end
  def get_anti_link_baseline(ppantilink : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_anti_link_baseline.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppantilink)
  end
  def put_anti_link_baseline(pantilink : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_anti_link_baseline.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pantilink)
  end
  def get_favorite_order(pfavoriteorder : UInt32*) : HRESULT
    @lpVtbl.value.get_favorite_order.unsafe_as(Proc(UInt32*, HRESULT)).call(pfavoriteorder)
  end
  def put_favorite_order(favoriteorder : UInt32) : HRESULT
    @lpVtbl.value.put_favorite_order.unsafe_as(Proc(UInt32, HRESULT)).call(favoriteorder)
  end
  def get_favorite_order_baseline(pfavoriteorder : UInt32*) : HRESULT
    @lpVtbl.value.get_favorite_order_baseline.unsafe_as(Proc(UInt32*, HRESULT)).call(pfavoriteorder)
  end
  def put_favorite_order_baseline(favoriteorder : UInt32) : HRESULT
    @lpVtbl.value.put_favorite_order_baseline.unsafe_as(Proc(UInt32, HRESULT)).call(favoriteorder)
  end
  def get_groups(pgroups : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_groups.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB**, HRESULT)).call(pgroups)
  end
  def put_groups(pgroups : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_groups.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB*, HRESULT)).call(pgroups)
  end
  def get_groups_baseline(ppgroups : CONTACT_AGGREGATION_BLOB**) : HRESULT
    @lpVtbl.value.get_groups_baseline.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB**, HRESULT)).call(ppgroups)
  end
  def put_groups_baseline(pgroups : CONTACT_AGGREGATION_BLOB*) : HRESULT
    @lpVtbl.value.put_groups_baseline.unsafe_as(Proc(CONTACT_AGGREGATION_BLOB*, HRESULT)).call(pgroups)
  end
  def get_id(ppid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppid)
  end
  def get_is_tombstone(pistombstone : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_tombstone.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pistombstone)
  end
  def put_is_tombstone(istombstone : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_is_tombstone.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(istombstone)
  end
  def get_linked_aggregate_id(pplinkedaggregateid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_linked_aggregate_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(pplinkedaggregateid)
  end
  def put_linked_aggregate_id(plinkedaggregateid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_linked_aggregate_id.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(plinkedaggregateid)
  end
  def get_object_id(ppobjectid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_object_id.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppobjectid)
  end
  def put_object_id(pobjectid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_object_id.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pobjectid)
  end
end
struct LibWin32::IContactAggregationServerPersonCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def find_first(ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(IContactAggregationServerPerson*, HRESULT)).call(ppserverperson)
  end
  def find_first_by_server_id(pserverid : LibC::LPWSTR, ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_first_by_server_id.unsafe_as(Proc(LibC::LPWSTR, IContactAggregationServerPerson*, HRESULT)).call(pserverid, ppserverperson)
  end
  def find_first_by_aggregate_id(paggregateid : LibC::LPWSTR, ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_first_by_aggregate_id.unsafe_as(Proc(LibC::LPWSTR, IContactAggregationServerPerson*, HRESULT)).call(paggregateid, ppserverperson)
  end
  def find_first_by_linked_aggregate_id(paggregateid : LibC::LPWSTR, ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_first_by_linked_aggregate_id.unsafe_as(Proc(LibC::LPWSTR, IContactAggregationServerPerson*, HRESULT)).call(paggregateid, ppserverperson)
  end
  def find_next(ppserverperson : IContactAggregationServerPerson*) : HRESULT
    @lpVtbl.value.find_next.unsafe_as(Proc(IContactAggregationServerPerson*, HRESULT)).call(ppserverperson)
  end
  def get_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
end
