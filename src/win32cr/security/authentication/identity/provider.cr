require "../../../system/com.cr"
require "../../../foundation.cr"
require "../../../ui/shell/propertiessystem.cr"
require "../../../system/com/structuredstorage.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  OID_OAssociatedIdentityProviderObject = "98c5a3dd-db68-4f1a-8d2b-9079cdfeaf61"
  CLSID_CoClassIdentityStore = LibC::GUID.new(0x30d49246_u32, 0xd217_u16, 0x465f_u16, StaticArray[0xb0_u8, 0xb_u8, 0xac_u8, 0x9d_u8, 0xdd_u8, 0x65_u8, 0x2e_u8, 0xb7_u8])
  CLSID_CIdentityProfileHandler = LibC::GUID.new(0xecf5bf46_u32, 0xe3b6_u16, 0x449a_u16, StaticArray[0xb5_u8, 0x6b_u8, 0x43_u8, 0xf5_u8, 0x8f_u8, 0x86_u8, 0x78_u8, 0x14_u8])


  enum IDENTITY_TYPE : Int32
    IDENTITIES_ALL = 0
    IDENTITIES_ME_ONLY = 1
  end

  enum IdentityUpdateEvent : UInt32
    IDENTITY_ASSOCIATED = 1
    IDENTITY_DISASSOCIATED = 2
    IDENTITY_CREATED = 4
    IDENTITY_IMPORTED = 8
    IDENTITY_DELETED = 16
    IDENTITY_PROPCHANGED = 32
    IDENTITY_CONNECTED = 64
    IDENTITY_DISCONNECTED = 128
  end

  enum IDENTITY_URL : Int32
    IDENTITY_URL_CREATE_ACCOUNT_WIZARD = 0
    IDENTITY_URL_SIGN_IN_WIZARD = 1
    IDENTITY_URL_CHANGE_PASSWORD_WIZARD = 2
    IDENTITY_URL_IFEXISTS_WIZARD = 3
    IDENTITY_URL_ACCOUNT_SETTINGS = 4
    IDENTITY_URL_RESTORE_WIZARD = 5
    IDENTITY_URL_CONNECT_WIZARD = 6
  end

  enum ACCOUNT_STATE : Int32
    NOT_CONNECTED = 0
    CONNECTING = 1
    CONNECT_COMPLETED = 2
  end


  struct IIdentityAdviseVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    identity_updated : UInt64
  end

  IIdentityAdvise_GUID = "4e982fed-d14b-440c-b8d6-bb386453d386"
  IID_IIdentityAdvise = LibC::GUID.new(0x4e982fed_u32, 0xd14b_u16, 0x440c_u16, StaticArray[0xb8_u8, 0xd6_u8, 0xbb_u8, 0x38_u8, 0x64_u8, 0x53_u8, 0xd3_u8, 0x86_u8])
  struct IIdentityAdvise
    lpVtbl : IIdentityAdviseVTbl*
  end

  struct AsyncIIdentityAdviseVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_identity_updated : UInt64
    finish_identity_updated : UInt64
  end

  AsyncIIdentityAdvise_GUID = "3ab4c8da-d038-4830-8dd9-3253c55a127f"
  IID_AsyncIIdentityAdvise = LibC::GUID.new(0x3ab4c8da_u32, 0xd038_u16, 0x4830_u16, StaticArray[0x8d_u8, 0xd9_u8, 0x32_u8, 0x53_u8, 0xc5_u8, 0x5a_u8, 0x12_u8, 0x7f_u8])
  struct AsyncIIdentityAdvise
    lpVtbl : AsyncIIdentityAdviseVTbl*
  end

  struct IIdentityProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_identity_enum : UInt64
    create : UInt64
    import : UInt64
    delete : UInt64
    find_by_unique_id : UInt64
    get_provider_property_store : UInt64
    advise : UInt64
    un_advise : UInt64
  end

  IIdentityProvider_GUID = "0d1b9e0c-e8ba-4f55-a81b-bce934b948f5"
  IID_IIdentityProvider = LibC::GUID.new(0xd1b9e0c_u32, 0xe8ba_u16, 0x4f55_u16, StaticArray[0xa8_u8, 0x1b_u8, 0xbc_u8, 0xe9_u8, 0x34_u8, 0xb9_u8, 0x48_u8, 0xf5_u8])
  struct IIdentityProvider
    lpVtbl : IIdentityProviderVTbl*
  end

  struct AsyncIIdentityProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_get_identity_enum : UInt64
    finish_get_identity_enum : UInt64
    begin_create : UInt64
    finish_create : UInt64
    begin_import : UInt64
    finish_import : UInt64
    begin_delete : UInt64
    finish_delete : UInt64
    begin_find_by_unique_id : UInt64
    finish_find_by_unique_id : UInt64
    begin_get_provider_property_store : UInt64
    finish_get_provider_property_store : UInt64
    begin_advise : UInt64
    finish_advise : UInt64
    begin_un_advise : UInt64
    finish_un_advise : UInt64
  end

  AsyncIIdentityProvider_GUID = "c6fc9901-c433-4646-8f48-4e4687aae2a0"
  IID_AsyncIIdentityProvider = LibC::GUID.new(0xc6fc9901_u32, 0xc433_u16, 0x4646_u16, StaticArray[0x8f_u8, 0x48_u8, 0x4e_u8, 0x46_u8, 0x87_u8, 0xaa_u8, 0xe2_u8, 0xa0_u8])
  struct AsyncIIdentityProvider
    lpVtbl : AsyncIIdentityProviderVTbl*
  end

  struct IAssociatedIdentityProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    associate_identity : UInt64
    disassociate_identity : UInt64
    change_credential : UInt64
  end

  IAssociatedIdentityProvider_GUID = "2af066b3-4cbb-4cba-a798-204b6af68cc0"
  IID_IAssociatedIdentityProvider = LibC::GUID.new(0x2af066b3_u32, 0x4cbb_u16, 0x4cba_u16, StaticArray[0xa7_u8, 0x98_u8, 0x20_u8, 0x4b_u8, 0x6a_u8, 0xf6_u8, 0x8c_u8, 0xc0_u8])
  struct IAssociatedIdentityProvider
    lpVtbl : IAssociatedIdentityProviderVTbl*
  end

  struct AsyncIAssociatedIdentityProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_associate_identity : UInt64
    finish_associate_identity : UInt64
    begin_disassociate_identity : UInt64
    finish_disassociate_identity : UInt64
    begin_change_credential : UInt64
    finish_change_credential : UInt64
  end

  AsyncIAssociatedIdentityProvider_GUID = "2834d6ed-297e-4e72-8a51-961e86f05152"
  IID_AsyncIAssociatedIdentityProvider = LibC::GUID.new(0x2834d6ed_u32, 0x297e_u16, 0x4e72_u16, StaticArray[0x8a_u8, 0x51_u8, 0x96_u8, 0x1e_u8, 0x86_u8, 0xf0_u8, 0x51_u8, 0x52_u8])
  struct AsyncIAssociatedIdentityProvider
    lpVtbl : AsyncIAssociatedIdentityProviderVTbl*
  end

  struct IConnectedIdentityProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    connect_identity : UInt64
    disconnect_identity : UInt64
    is_connected : UInt64
    get_url : UInt64
    get_account_state : UInt64
  end

  IConnectedIdentityProvider_GUID = "b7417b54-e08c-429b-96c8-678d1369ecb1"
  IID_IConnectedIdentityProvider = LibC::GUID.new(0xb7417b54_u32, 0xe08c_u16, 0x429b_u16, StaticArray[0x96_u8, 0xc8_u8, 0x67_u8, 0x8d_u8, 0x13_u8, 0x69_u8, 0xec_u8, 0xb1_u8])
  struct IConnectedIdentityProvider
    lpVtbl : IConnectedIdentityProviderVTbl*
  end

  struct AsyncIConnectedIdentityProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_connect_identity : UInt64
    finish_connect_identity : UInt64
    begin_disconnect_identity : UInt64
    finish_disconnect_identity : UInt64
    begin_is_connected : UInt64
    finish_is_connected : UInt64
    begin_get_url : UInt64
    finish_get_url : UInt64
    begin_get_account_state : UInt64
    finish_get_account_state : UInt64
  end

  AsyncIConnectedIdentityProvider_GUID = "9ce55141-bce9-4e15-824d-43d79f512f93"
  IID_AsyncIConnectedIdentityProvider = LibC::GUID.new(0x9ce55141_u32, 0xbce9_u16, 0x4e15_u16, StaticArray[0x82_u8, 0x4d_u8, 0x43_u8, 0xd7_u8, 0x9f_u8, 0x51_u8, 0x2f_u8, 0x93_u8])
  struct AsyncIConnectedIdentityProvider
    lpVtbl : AsyncIConnectedIdentityProviderVTbl*
  end

  struct IIdentityAuthenticationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_identity_credential : UInt64
    validate_identity_credential : UInt64
  end

  IIdentityAuthentication_GUID = "5e7ef254-979f-43b5-b74e-06e4eb7df0f9"
  IID_IIdentityAuthentication = LibC::GUID.new(0x5e7ef254_u32, 0x979f_u16, 0x43b5_u16, StaticArray[0xb7_u8, 0x4e_u8, 0x6_u8, 0xe4_u8, 0xeb_u8, 0x7d_u8, 0xf0_u8, 0xf9_u8])
  struct IIdentityAuthentication
    lpVtbl : IIdentityAuthenticationVTbl*
  end

  struct AsyncIIdentityAuthenticationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_set_identity_credential : UInt64
    finish_set_identity_credential : UInt64
    begin_validate_identity_credential : UInt64
    finish_validate_identity_credential : UInt64
  end

  AsyncIIdentityAuthentication_GUID = "f9a2f918-feca-4e9c-9633-61cbf13ed34d"
  IID_AsyncIIdentityAuthentication = LibC::GUID.new(0xf9a2f918_u32, 0xfeca_u16, 0x4e9c_u16, StaticArray[0x96_u8, 0x33_u8, 0x61_u8, 0xcb_u8, 0xf1_u8, 0x3e_u8, 0xd3_u8, 0x4d_u8])
  struct AsyncIIdentityAuthentication
    lpVtbl : AsyncIIdentityAuthenticationVTbl*
  end

  struct IIdentityStoreVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    add_to_cache : UInt64
    convert_to_sid : UInt64
    enumerate_identities : UInt64
    reset : UInt64
  end

  IIdentityStore_GUID = "df586fa5-6f35-44f1-b209-b38e169772eb"
  IID_IIdentityStore = LibC::GUID.new(0xdf586fa5_u32, 0x6f35_u16, 0x44f1_u16, StaticArray[0xb2_u8, 0x9_u8, 0xb3_u8, 0x8e_u8, 0x16_u8, 0x97_u8, 0x72_u8, 0xeb_u8])
  struct IIdentityStore
    lpVtbl : IIdentityStoreVTbl*
  end

  struct AsyncIIdentityStoreVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_get_count : UInt64
    finish_get_count : UInt64
    begin_get_at : UInt64
    finish_get_at : UInt64
    begin_add_to_cache : UInt64
    finish_add_to_cache : UInt64
    begin_convert_to_sid : UInt64
    finish_convert_to_sid : UInt64
    begin_enumerate_identities : UInt64
    finish_enumerate_identities : UInt64
    begin_reset : UInt64
    finish_reset : UInt64
  end

  AsyncIIdentityStore_GUID = "eefa1616-48de-4872-aa64-6e6206535a51"
  IID_AsyncIIdentityStore = LibC::GUID.new(0xeefa1616_u32, 0x48de_u16, 0x4872_u16, StaticArray[0xaa_u8, 0x64_u8, 0x6e_u8, 0x62_u8, 0x6_u8, 0x53_u8, 0x5a_u8, 0x51_u8])
  struct AsyncIIdentityStore
    lpVtbl : AsyncIIdentityStoreVTbl*
  end

  struct IIdentityStoreExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_connected_identity : UInt64
    delete_connected_identity : UInt64
  end

  IIdentityStoreEx_GUID = "f9f9eb98-8f7f-4e38-9577-6980114ce32b"
  IID_IIdentityStoreEx = LibC::GUID.new(0xf9f9eb98_u32, 0x8f7f_u16, 0x4e38_u16, StaticArray[0x95_u8, 0x77_u8, 0x69_u8, 0x80_u8, 0x11_u8, 0x4c_u8, 0xe3_u8, 0x2b_u8])
  struct IIdentityStoreEx
    lpVtbl : IIdentityStoreExVTbl*
  end

  struct AsyncIIdentityStoreExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_create_connected_identity : UInt64
    finish_create_connected_identity : UInt64
    begin_delete_connected_identity : UInt64
    finish_delete_connected_identity : UInt64
  end

  AsyncIIdentityStoreEx_GUID = "fca3af9a-8a07-4eae-8632-ec3de658a36a"
  IID_AsyncIIdentityStoreEx = LibC::GUID.new(0xfca3af9a_u32, 0x8a07_u16, 0x4eae_u16, StaticArray[0x86_u8, 0x32_u8, 0xec_u8, 0x3d_u8, 0xe6_u8, 0x58_u8, 0xa3_u8, 0x6a_u8])
  struct AsyncIIdentityStoreEx
    lpVtbl : AsyncIIdentityStoreExVTbl*
  end

end
struct LibWin32::IIdentityAdvise
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def identity_updated(dwidentityupdateevents : IdentityUpdateEvent, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.identity_updated.unsafe_as(Proc(IdentityUpdateEvent, LibC::LPWSTR, HRESULT)).call(dwidentityupdateevents, lpszuniqueid)
  end
end
struct LibWin32::AsyncIIdentityAdvise
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_identity_updated(dwidentityupdateevents : UInt32, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.begin_identity_updated.unsafe_as(Proc(UInt32, LibC::LPWSTR, HRESULT)).call(dwidentityupdateevents, lpszuniqueid)
  end
  def finish_identity_updated : HRESULT
    @lpVtbl.value.finish_identity_updated.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IIdentityProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_identity_enum(eidentitytype : IDENTITY_TYPE, pfilterkey : PROPERTYKEY*, pfilterpropvarvalue : PROPVARIANT*, ppidentityenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.get_identity_enum.unsafe_as(Proc(IDENTITY_TYPE, PROPERTYKEY*, PROPVARIANT*, IEnumUnknown*, HRESULT)).call(eidentitytype, pfilterkey, pfilterpropvarvalue, ppidentityenum)
  end
  def create(lpszusername : LibC::LPWSTR, pppropertystore : IPropertyStore*, pkeywordstoadd : PROPVARIANT*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(LibC::LPWSTR, IPropertyStore*, PROPVARIANT*, HRESULT)).call(lpszusername, pppropertystore, pkeywordstoadd)
  end
  def import(ppropertystore : IPropertyStore) : HRESULT
    @lpVtbl.value.import.unsafe_as(Proc(IPropertyStore, HRESULT)).call(ppropertystore)
  end
  def delete(lpszuniqueid : LibC::LPWSTR, pkeywordstodelete : PROPVARIANT*) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(LibC::LPWSTR, PROPVARIANT*, HRESULT)).call(lpszuniqueid, pkeywordstodelete)
  end
  def find_by_unique_id(lpszuniqueid : LibC::LPWSTR, pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.find_by_unique_id.unsafe_as(Proc(LibC::LPWSTR, IPropertyStore*, HRESULT)).call(lpszuniqueid, pppropertystore)
  end
  def get_provider_property_store(pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.get_provider_property_store.unsafe_as(Proc(IPropertyStore*, HRESULT)).call(pppropertystore)
  end
  def advise(pidentityadvise : IIdentityAdvise, dwidentityupdateevents : IdentityUpdateEvent, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(IIdentityAdvise, IdentityUpdateEvent, UInt32*, HRESULT)).call(pidentityadvise, dwidentityupdateevents, pdwcookie)
  end
  def un_advise(dwcookie : UInt32) : HRESULT
    @lpVtbl.value.un_advise.unsafe_as(Proc(UInt32, HRESULT)).call(dwcookie)
  end
end
struct LibWin32::AsyncIIdentityProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_get_identity_enum(eidentitytype : IDENTITY_TYPE, pfilterkey : PROPERTYKEY*, pfilterpropvarvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.begin_get_identity_enum.unsafe_as(Proc(IDENTITY_TYPE, PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(eidentitytype, pfilterkey, pfilterpropvarvalue)
  end
  def finish_get_identity_enum(ppidentityenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.finish_get_identity_enum.unsafe_as(Proc(IEnumUnknown*, HRESULT)).call(ppidentityenum)
  end
  def begin_create(lpszusername : LibC::LPWSTR, pkeywordstoadd : PROPVARIANT*) : HRESULT
    @lpVtbl.value.begin_create.unsafe_as(Proc(LibC::LPWSTR, PROPVARIANT*, HRESULT)).call(lpszusername, pkeywordstoadd)
  end
  def finish_create(pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_create.unsafe_as(Proc(IPropertyStore*, HRESULT)).call(pppropertystore)
  end
  def begin_import(ppropertystore : IPropertyStore) : HRESULT
    @lpVtbl.value.begin_import.unsafe_as(Proc(IPropertyStore, HRESULT)).call(ppropertystore)
  end
  def finish_import : HRESULT
    @lpVtbl.value.finish_import.unsafe_as(Proc(HRESULT)).call
  end
  def begin_delete(lpszuniqueid : LibC::LPWSTR, pkeywordstodelete : PROPVARIANT*) : HRESULT
    @lpVtbl.value.begin_delete.unsafe_as(Proc(LibC::LPWSTR, PROPVARIANT*, HRESULT)).call(lpszuniqueid, pkeywordstodelete)
  end
  def finish_delete : HRESULT
    @lpVtbl.value.finish_delete.unsafe_as(Proc(HRESULT)).call
  end
  def begin_find_by_unique_id(lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.begin_find_by_unique_id.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(lpszuniqueid)
  end
  def finish_find_by_unique_id(pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_find_by_unique_id.unsafe_as(Proc(IPropertyStore*, HRESULT)).call(pppropertystore)
  end
  def begin_get_provider_property_store : HRESULT
    @lpVtbl.value.begin_get_provider_property_store.unsafe_as(Proc(HRESULT)).call
  end
  def finish_get_provider_property_store(pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_get_provider_property_store.unsafe_as(Proc(IPropertyStore*, HRESULT)).call(pppropertystore)
  end
  def begin_advise(pidentityadvise : IIdentityAdvise, dwidentityupdateevents : UInt32) : HRESULT
    @lpVtbl.value.begin_advise.unsafe_as(Proc(IIdentityAdvise, UInt32, HRESULT)).call(pidentityadvise, dwidentityupdateevents)
  end
  def finish_advise(pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.finish_advise.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcookie)
  end
  def begin_un_advise(dwcookie : UInt32) : HRESULT
    @lpVtbl.value.begin_un_advise.unsafe_as(Proc(UInt32, HRESULT)).call(dwcookie)
  end
  def finish_un_advise : HRESULT
    @lpVtbl.value.finish_un_advise.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAssociatedIdentityProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def associate_identity(hwndparent : LibC::HANDLE, pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.associate_identity.unsafe_as(Proc(LibC::HANDLE, IPropertyStore*, HRESULT)).call(hwndparent, pppropertystore)
  end
  def disassociate_identity(hwndparent : LibC::HANDLE, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.disassociate_identity.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR, HRESULT)).call(hwndparent, lpszuniqueid)
  end
  def change_credential(hwndparent : LibC::HANDLE, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.change_credential.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR, HRESULT)).call(hwndparent, lpszuniqueid)
  end
end
struct LibWin32::AsyncIAssociatedIdentityProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_associate_identity(hwndparent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.begin_associate_identity.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hwndparent)
  end
  def finish_associate_identity(pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_associate_identity.unsafe_as(Proc(IPropertyStore*, HRESULT)).call(pppropertystore)
  end
  def begin_disassociate_identity(hwndparent : LibC::HANDLE, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.begin_disassociate_identity.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR, HRESULT)).call(hwndparent, lpszuniqueid)
  end
  def finish_disassociate_identity : HRESULT
    @lpVtbl.value.finish_disassociate_identity.unsafe_as(Proc(HRESULT)).call
  end
  def begin_change_credential(hwndparent : LibC::HANDLE, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.begin_change_credential.unsafe_as(Proc(LibC::HANDLE, LibC::LPWSTR, HRESULT)).call(hwndparent, lpszuniqueid)
  end
  def finish_change_credential : HRESULT
    @lpVtbl.value.finish_change_credential.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IConnectedIdentityProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def connect_identity(authbuffer : UInt8*, authbuffersize : UInt32) : HRESULT
    @lpVtbl.value.connect_identity.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(authbuffer, authbuffersize)
  end
  def disconnect_identity : HRESULT
    @lpVtbl.value.disconnect_identity.unsafe_as(Proc(HRESULT)).call
  end
  def is_connected(connected : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_connected.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(connected)
  end
  def get_url(identifier : IDENTITY_URL, context : IBindCtx, postdata : VARIANT*, url : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_url.unsafe_as(Proc(IDENTITY_URL, IBindCtx, VARIANT*, LibC::LPWSTR*, HRESULT)).call(identifier, context, postdata, url)
  end
  def get_account_state(pstate : ACCOUNT_STATE*) : HRESULT
    @lpVtbl.value.get_account_state.unsafe_as(Proc(ACCOUNT_STATE*, HRESULT)).call(pstate)
  end
end
struct LibWin32::AsyncIConnectedIdentityProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_connect_identity(authbuffer : UInt8*, authbuffersize : UInt32) : HRESULT
    @lpVtbl.value.begin_connect_identity.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(authbuffer, authbuffersize)
  end
  def finish_connect_identity : HRESULT
    @lpVtbl.value.finish_connect_identity.unsafe_as(Proc(HRESULT)).call
  end
  def begin_disconnect_identity : HRESULT
    @lpVtbl.value.begin_disconnect_identity.unsafe_as(Proc(HRESULT)).call
  end
  def finish_disconnect_identity : HRESULT
    @lpVtbl.value.finish_disconnect_identity.unsafe_as(Proc(HRESULT)).call
  end
  def begin_is_connected : HRESULT
    @lpVtbl.value.begin_is_connected.unsafe_as(Proc(HRESULT)).call
  end
  def finish_is_connected(connected : LibC::BOOL*) : HRESULT
    @lpVtbl.value.finish_is_connected.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(connected)
  end
  def begin_get_url(identifier : IDENTITY_URL, context : IBindCtx) : HRESULT
    @lpVtbl.value.begin_get_url.unsafe_as(Proc(IDENTITY_URL, IBindCtx, HRESULT)).call(identifier, context)
  end
  def finish_get_url(postdata : VARIANT*, url : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.finish_get_url.unsafe_as(Proc(VARIANT*, LibC::LPWSTR*, HRESULT)).call(postdata, url)
  end
  def begin_get_account_state : HRESULT
    @lpVtbl.value.begin_get_account_state.unsafe_as(Proc(HRESULT)).call
  end
  def finish_get_account_state(pstate : ACCOUNT_STATE*) : HRESULT
    @lpVtbl.value.finish_get_account_state.unsafe_as(Proc(ACCOUNT_STATE*, HRESULT)).call(pstate)
  end
end
struct LibWin32::IIdentityAuthentication
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_identity_credential(credbuffer : UInt8*, credbufferlength : UInt32) : HRESULT
    @lpVtbl.value.set_identity_credential.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(credbuffer, credbufferlength)
  end
  def validate_identity_credential(credbuffer : UInt8*, credbufferlength : UInt32, ppidentityproperties : IPropertyStore*) : HRESULT
    @lpVtbl.value.validate_identity_credential.unsafe_as(Proc(UInt8*, UInt32, IPropertyStore*, HRESULT)).call(credbuffer, credbufferlength, ppidentityproperties)
  end
end
struct LibWin32::AsyncIIdentityAuthentication
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_set_identity_credential(credbuffer : UInt8*, credbufferlength : UInt32) : HRESULT
    @lpVtbl.value.begin_set_identity_credential.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(credbuffer, credbufferlength)
  end
  def finish_set_identity_credential : HRESULT
    @lpVtbl.value.finish_set_identity_credential.unsafe_as(Proc(HRESULT)).call
  end
  def begin_validate_identity_credential(credbuffer : UInt8*, credbufferlength : UInt32, ppidentityproperties : IPropertyStore*) : HRESULT
    @lpVtbl.value.begin_validate_identity_credential.unsafe_as(Proc(UInt8*, UInt32, IPropertyStore*, HRESULT)).call(credbuffer, credbufferlength, ppidentityproperties)
  end
  def finish_validate_identity_credential(ppidentityproperties : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_validate_identity_credential.unsafe_as(Proc(IPropertyStore*, HRESULT)).call(ppidentityproperties)
  end
end
struct LibWin32::IIdentityStore
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(pdwproviders : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwproviders)
  end
  def get_at(dwprovider : UInt32, pprovguid : Guid*, ppidentityprovider : IUnknown*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, Guid*, IUnknown*, HRESULT)).call(dwprovider, pprovguid, ppidentityprovider)
  end
  def add_to_cache(lpszuniqueid : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.add_to_cache.unsafe_as(Proc(LibC::LPWSTR, Guid*, HRESULT)).call(lpszuniqueid, providerguid)
  end
  def convert_to_sid(lpszuniqueid : LibC::LPWSTR, providerguid : Guid*, cbsid : UInt16, psid : UInt8*, pcbrequiredsid : UInt16*) : HRESULT
    @lpVtbl.value.convert_to_sid.unsafe_as(Proc(LibC::LPWSTR, Guid*, UInt16, UInt8*, UInt16*, HRESULT)).call(lpszuniqueid, providerguid, cbsid, psid, pcbrequiredsid)
  end
  def enumerate_identities(eidentitytype : IDENTITY_TYPE, pfilterkey : PROPERTYKEY*, pfilterpropvarvalue : PROPVARIANT*, ppidentityenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.enumerate_identities.unsafe_as(Proc(IDENTITY_TYPE, PROPERTYKEY*, PROPVARIANT*, IEnumUnknown*, HRESULT)).call(eidentitytype, pfilterkey, pfilterpropvarvalue, ppidentityenum)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::AsyncIIdentityStore
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_get_count : HRESULT
    @lpVtbl.value.begin_get_count.unsafe_as(Proc(HRESULT)).call
  end
  def finish_get_count(pdwproviders : UInt32*) : HRESULT
    @lpVtbl.value.finish_get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwproviders)
  end
  def begin_get_at(dwprovider : UInt32, pprovguid : Guid*) : HRESULT
    @lpVtbl.value.begin_get_at.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(dwprovider, pprovguid)
  end
  def finish_get_at(pprovguid : Guid*, ppidentityprovider : IUnknown*) : HRESULT
    @lpVtbl.value.finish_get_at.unsafe_as(Proc(Guid*, IUnknown*, HRESULT)).call(pprovguid, ppidentityprovider)
  end
  def begin_add_to_cache(lpszuniqueid : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.begin_add_to_cache.unsafe_as(Proc(LibC::LPWSTR, Guid*, HRESULT)).call(lpszuniqueid, providerguid)
  end
  def finish_add_to_cache : HRESULT
    @lpVtbl.value.finish_add_to_cache.unsafe_as(Proc(HRESULT)).call
  end
  def begin_convert_to_sid(lpszuniqueid : LibC::LPWSTR, providerguid : Guid*, cbsid : UInt16, psid : UInt8*) : HRESULT
    @lpVtbl.value.begin_convert_to_sid.unsafe_as(Proc(LibC::LPWSTR, Guid*, UInt16, UInt8*, HRESULT)).call(lpszuniqueid, providerguid, cbsid, psid)
  end
  def finish_convert_to_sid(psid : UInt8*, pcbrequiredsid : UInt16*) : HRESULT
    @lpVtbl.value.finish_convert_to_sid.unsafe_as(Proc(UInt8*, UInt16*, HRESULT)).call(psid, pcbrequiredsid)
  end
  def begin_enumerate_identities(eidentitytype : IDENTITY_TYPE, pfilterkey : PROPERTYKEY*, pfilterpropvarvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.begin_enumerate_identities.unsafe_as(Proc(IDENTITY_TYPE, PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(eidentitytype, pfilterkey, pfilterpropvarvalue)
  end
  def finish_enumerate_identities(ppidentityenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.finish_enumerate_identities.unsafe_as(Proc(IEnumUnknown*, HRESULT)).call(ppidentityenum)
  end
  def begin_reset : HRESULT
    @lpVtbl.value.begin_reset.unsafe_as(Proc(HRESULT)).call
  end
  def finish_reset : HRESULT
    @lpVtbl.value.finish_reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IIdentityStoreEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_connected_identity(localname : LibC::LPWSTR, connectedname : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.create_connected_identity.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, Guid*, HRESULT)).call(localname, connectedname, providerguid)
  end
  def delete_connected_identity(connectedname : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.delete_connected_identity.unsafe_as(Proc(LibC::LPWSTR, Guid*, HRESULT)).call(connectedname, providerguid)
  end
end
struct LibWin32::AsyncIIdentityStoreEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_create_connected_identity(localname : LibC::LPWSTR, connectedname : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.begin_create_connected_identity.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, Guid*, HRESULT)).call(localname, connectedname, providerguid)
  end
  def finish_create_connected_identity : HRESULT
    @lpVtbl.value.finish_create_connected_identity.unsafe_as(Proc(HRESULT)).call
  end
  def begin_delete_connected_identity(connectedname : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.begin_delete_connected_identity.unsafe_as(Proc(LibC::LPWSTR, Guid*, HRESULT)).call(connectedname, providerguid)
  end
  def finish_delete_connected_identity : HRESULT
    @lpVtbl.value.finish_delete_connected_identity.unsafe_as(Proc(HRESULT)).call
  end
end
