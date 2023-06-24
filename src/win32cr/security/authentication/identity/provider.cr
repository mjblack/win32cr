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
    query_interface : Proc(IIdentityAdvise*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIdentityAdvise*, UInt32)
    release : Proc(IIdentityAdvise*, UInt32)
    identity_updated : Proc(IIdentityAdvise*, IdentityUpdateEvent, LibC::LPWSTR, HRESULT)
  end

  IIdentityAdvise_GUID = "4e982fed-d14b-440c-b8d6-bb386453d386"
  IID_IIdentityAdvise = LibC::GUID.new(0x4e982fed_u32, 0xd14b_u16, 0x440c_u16, StaticArray[0xb8_u8, 0xd6_u8, 0xbb_u8, 0x38_u8, 0x64_u8, 0x53_u8, 0xd3_u8, 0x86_u8])
  struct IIdentityAdvise
    lpVtbl : IIdentityAdviseVTbl*
  end

  struct AsyncIIdentityAdviseVTbl
    query_interface : Proc(AsyncIIdentityAdvise*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIIdentityAdvise*, UInt32)
    release : Proc(AsyncIIdentityAdvise*, UInt32)
    begin_identity_updated : Proc(AsyncIIdentityAdvise*, UInt32, LibC::LPWSTR, HRESULT)
    finish_identity_updated : Proc(AsyncIIdentityAdvise*, HRESULT)
  end

  AsyncIIdentityAdvise_GUID = "3ab4c8da-d038-4830-8dd9-3253c55a127f"
  IID_AsyncIIdentityAdvise = LibC::GUID.new(0x3ab4c8da_u32, 0xd038_u16, 0x4830_u16, StaticArray[0x8d_u8, 0xd9_u8, 0x32_u8, 0x53_u8, 0xc5_u8, 0x5a_u8, 0x12_u8, 0x7f_u8])
  struct AsyncIIdentityAdvise
    lpVtbl : AsyncIIdentityAdviseVTbl*
  end

  struct IIdentityProviderVTbl
    query_interface : Proc(IIdentityProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIdentityProvider*, UInt32)
    release : Proc(IIdentityProvider*, UInt32)
    get_identity_enum : Proc(IIdentityProvider*, IDENTITY_TYPE, PROPERTYKEY*, PROPVARIANT*, IEnumUnknown*, HRESULT)
    create : Proc(IIdentityProvider*, LibC::LPWSTR, IPropertyStore*, PROPVARIANT*, HRESULT)
    import : Proc(IIdentityProvider*, IPropertyStore, HRESULT)
    delete : Proc(IIdentityProvider*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    find_by_unique_id : Proc(IIdentityProvider*, LibC::LPWSTR, IPropertyStore*, HRESULT)
    get_provider_property_store : Proc(IIdentityProvider*, IPropertyStore*, HRESULT)
    advise : Proc(IIdentityProvider*, IIdentityAdvise, IdentityUpdateEvent, UInt32*, HRESULT)
    un_advise : Proc(IIdentityProvider*, UInt32, HRESULT)
  end

  IIdentityProvider_GUID = "0d1b9e0c-e8ba-4f55-a81b-bce934b948f5"
  IID_IIdentityProvider = LibC::GUID.new(0xd1b9e0c_u32, 0xe8ba_u16, 0x4f55_u16, StaticArray[0xa8_u8, 0x1b_u8, 0xbc_u8, 0xe9_u8, 0x34_u8, 0xb9_u8, 0x48_u8, 0xf5_u8])
  struct IIdentityProvider
    lpVtbl : IIdentityProviderVTbl*
  end

  struct AsyncIIdentityProviderVTbl
    query_interface : Proc(AsyncIIdentityProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIIdentityProvider*, UInt32)
    release : Proc(AsyncIIdentityProvider*, UInt32)
    begin_get_identity_enum : Proc(AsyncIIdentityProvider*, IDENTITY_TYPE, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    finish_get_identity_enum : Proc(AsyncIIdentityProvider*, IEnumUnknown*, HRESULT)
    begin_create : Proc(AsyncIIdentityProvider*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    finish_create : Proc(AsyncIIdentityProvider*, IPropertyStore*, HRESULT)
    begin_import : Proc(AsyncIIdentityProvider*, IPropertyStore, HRESULT)
    finish_import : Proc(AsyncIIdentityProvider*, HRESULT)
    begin_delete : Proc(AsyncIIdentityProvider*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    finish_delete : Proc(AsyncIIdentityProvider*, HRESULT)
    begin_find_by_unique_id : Proc(AsyncIIdentityProvider*, LibC::LPWSTR, HRESULT)
    finish_find_by_unique_id : Proc(AsyncIIdentityProvider*, IPropertyStore*, HRESULT)
    begin_get_provider_property_store : Proc(AsyncIIdentityProvider*, HRESULT)
    finish_get_provider_property_store : Proc(AsyncIIdentityProvider*, IPropertyStore*, HRESULT)
    begin_advise : Proc(AsyncIIdentityProvider*, IIdentityAdvise, UInt32, HRESULT)
    finish_advise : Proc(AsyncIIdentityProvider*, UInt32*, HRESULT)
    begin_un_advise : Proc(AsyncIIdentityProvider*, UInt32, HRESULT)
    finish_un_advise : Proc(AsyncIIdentityProvider*, HRESULT)
  end

  AsyncIIdentityProvider_GUID = "c6fc9901-c433-4646-8f48-4e4687aae2a0"
  IID_AsyncIIdentityProvider = LibC::GUID.new(0xc6fc9901_u32, 0xc433_u16, 0x4646_u16, StaticArray[0x8f_u8, 0x48_u8, 0x4e_u8, 0x46_u8, 0x87_u8, 0xaa_u8, 0xe2_u8, 0xa0_u8])
  struct AsyncIIdentityProvider
    lpVtbl : AsyncIIdentityProviderVTbl*
  end

  struct IAssociatedIdentityProviderVTbl
    query_interface : Proc(IAssociatedIdentityProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAssociatedIdentityProvider*, UInt32)
    release : Proc(IAssociatedIdentityProvider*, UInt32)
    associate_identity : Proc(IAssociatedIdentityProvider*, LibC::HANDLE, IPropertyStore*, HRESULT)
    disassociate_identity : Proc(IAssociatedIdentityProvider*, LibC::HANDLE, LibC::LPWSTR, HRESULT)
    change_credential : Proc(IAssociatedIdentityProvider*, LibC::HANDLE, LibC::LPWSTR, HRESULT)
  end

  IAssociatedIdentityProvider_GUID = "2af066b3-4cbb-4cba-a798-204b6af68cc0"
  IID_IAssociatedIdentityProvider = LibC::GUID.new(0x2af066b3_u32, 0x4cbb_u16, 0x4cba_u16, StaticArray[0xa7_u8, 0x98_u8, 0x20_u8, 0x4b_u8, 0x6a_u8, 0xf6_u8, 0x8c_u8, 0xc0_u8])
  struct IAssociatedIdentityProvider
    lpVtbl : IAssociatedIdentityProviderVTbl*
  end

  struct AsyncIAssociatedIdentityProviderVTbl
    query_interface : Proc(AsyncIAssociatedIdentityProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIAssociatedIdentityProvider*, UInt32)
    release : Proc(AsyncIAssociatedIdentityProvider*, UInt32)
    begin_associate_identity : Proc(AsyncIAssociatedIdentityProvider*, LibC::HANDLE, HRESULT)
    finish_associate_identity : Proc(AsyncIAssociatedIdentityProvider*, IPropertyStore*, HRESULT)
    begin_disassociate_identity : Proc(AsyncIAssociatedIdentityProvider*, LibC::HANDLE, LibC::LPWSTR, HRESULT)
    finish_disassociate_identity : Proc(AsyncIAssociatedIdentityProvider*, HRESULT)
    begin_change_credential : Proc(AsyncIAssociatedIdentityProvider*, LibC::HANDLE, LibC::LPWSTR, HRESULT)
    finish_change_credential : Proc(AsyncIAssociatedIdentityProvider*, HRESULT)
  end

  AsyncIAssociatedIdentityProvider_GUID = "2834d6ed-297e-4e72-8a51-961e86f05152"
  IID_AsyncIAssociatedIdentityProvider = LibC::GUID.new(0x2834d6ed_u32, 0x297e_u16, 0x4e72_u16, StaticArray[0x8a_u8, 0x51_u8, 0x96_u8, 0x1e_u8, 0x86_u8, 0xf0_u8, 0x51_u8, 0x52_u8])
  struct AsyncIAssociatedIdentityProvider
    lpVtbl : AsyncIAssociatedIdentityProviderVTbl*
  end

  struct IConnectedIdentityProviderVTbl
    query_interface : Proc(IConnectedIdentityProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConnectedIdentityProvider*, UInt32)
    release : Proc(IConnectedIdentityProvider*, UInt32)
    connect_identity : Proc(IConnectedIdentityProvider*, UInt8*, UInt32, HRESULT)
    disconnect_identity : Proc(IConnectedIdentityProvider*, HRESULT)
    is_connected : Proc(IConnectedIdentityProvider*, LibC::BOOL*, HRESULT)
    get_url : Proc(IConnectedIdentityProvider*, IDENTITY_URL, IBindCtx, VARIANT*, LibC::LPWSTR*, HRESULT)
    get_account_state : Proc(IConnectedIdentityProvider*, ACCOUNT_STATE*, HRESULT)
  end

  IConnectedIdentityProvider_GUID = "b7417b54-e08c-429b-96c8-678d1369ecb1"
  IID_IConnectedIdentityProvider = LibC::GUID.new(0xb7417b54_u32, 0xe08c_u16, 0x429b_u16, StaticArray[0x96_u8, 0xc8_u8, 0x67_u8, 0x8d_u8, 0x13_u8, 0x69_u8, 0xec_u8, 0xb1_u8])
  struct IConnectedIdentityProvider
    lpVtbl : IConnectedIdentityProviderVTbl*
  end

  struct AsyncIConnectedIdentityProviderVTbl
    query_interface : Proc(AsyncIConnectedIdentityProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIConnectedIdentityProvider*, UInt32)
    release : Proc(AsyncIConnectedIdentityProvider*, UInt32)
    begin_connect_identity : Proc(AsyncIConnectedIdentityProvider*, UInt8*, UInt32, HRESULT)
    finish_connect_identity : Proc(AsyncIConnectedIdentityProvider*, HRESULT)
    begin_disconnect_identity : Proc(AsyncIConnectedIdentityProvider*, HRESULT)
    finish_disconnect_identity : Proc(AsyncIConnectedIdentityProvider*, HRESULT)
    begin_is_connected : Proc(AsyncIConnectedIdentityProvider*, HRESULT)
    finish_is_connected : Proc(AsyncIConnectedIdentityProvider*, LibC::BOOL*, HRESULT)
    begin_get_url : Proc(AsyncIConnectedIdentityProvider*, IDENTITY_URL, IBindCtx, HRESULT)
    finish_get_url : Proc(AsyncIConnectedIdentityProvider*, VARIANT*, LibC::LPWSTR*, HRESULT)
    begin_get_account_state : Proc(AsyncIConnectedIdentityProvider*, HRESULT)
    finish_get_account_state : Proc(AsyncIConnectedIdentityProvider*, ACCOUNT_STATE*, HRESULT)
  end

  AsyncIConnectedIdentityProvider_GUID = "9ce55141-bce9-4e15-824d-43d79f512f93"
  IID_AsyncIConnectedIdentityProvider = LibC::GUID.new(0x9ce55141_u32, 0xbce9_u16, 0x4e15_u16, StaticArray[0x82_u8, 0x4d_u8, 0x43_u8, 0xd7_u8, 0x9f_u8, 0x51_u8, 0x2f_u8, 0x93_u8])
  struct AsyncIConnectedIdentityProvider
    lpVtbl : AsyncIConnectedIdentityProviderVTbl*
  end

  struct IIdentityAuthenticationVTbl
    query_interface : Proc(IIdentityAuthentication*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIdentityAuthentication*, UInt32)
    release : Proc(IIdentityAuthentication*, UInt32)
    set_identity_credential : Proc(IIdentityAuthentication*, UInt8*, UInt32, HRESULT)
    validate_identity_credential : Proc(IIdentityAuthentication*, UInt8*, UInt32, IPropertyStore*, HRESULT)
  end

  IIdentityAuthentication_GUID = "5e7ef254-979f-43b5-b74e-06e4eb7df0f9"
  IID_IIdentityAuthentication = LibC::GUID.new(0x5e7ef254_u32, 0x979f_u16, 0x43b5_u16, StaticArray[0xb7_u8, 0x4e_u8, 0x6_u8, 0xe4_u8, 0xeb_u8, 0x7d_u8, 0xf0_u8, 0xf9_u8])
  struct IIdentityAuthentication
    lpVtbl : IIdentityAuthenticationVTbl*
  end

  struct AsyncIIdentityAuthenticationVTbl
    query_interface : Proc(AsyncIIdentityAuthentication*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIIdentityAuthentication*, UInt32)
    release : Proc(AsyncIIdentityAuthentication*, UInt32)
    begin_set_identity_credential : Proc(AsyncIIdentityAuthentication*, UInt8*, UInt32, HRESULT)
    finish_set_identity_credential : Proc(AsyncIIdentityAuthentication*, HRESULT)
    begin_validate_identity_credential : Proc(AsyncIIdentityAuthentication*, UInt8*, UInt32, IPropertyStore*, HRESULT)
    finish_validate_identity_credential : Proc(AsyncIIdentityAuthentication*, IPropertyStore*, HRESULT)
  end

  AsyncIIdentityAuthentication_GUID = "f9a2f918-feca-4e9c-9633-61cbf13ed34d"
  IID_AsyncIIdentityAuthentication = LibC::GUID.new(0xf9a2f918_u32, 0xfeca_u16, 0x4e9c_u16, StaticArray[0x96_u8, 0x33_u8, 0x61_u8, 0xcb_u8, 0xf1_u8, 0x3e_u8, 0xd3_u8, 0x4d_u8])
  struct AsyncIIdentityAuthentication
    lpVtbl : AsyncIIdentityAuthenticationVTbl*
  end

  struct IIdentityStoreVTbl
    query_interface : Proc(IIdentityStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIdentityStore*, UInt32)
    release : Proc(IIdentityStore*, UInt32)
    get_count : Proc(IIdentityStore*, UInt32*, HRESULT)
    get_at : Proc(IIdentityStore*, UInt32, Guid*, IUnknown*, HRESULT)
    add_to_cache : Proc(IIdentityStore*, LibC::LPWSTR, Guid*, HRESULT)
    convert_to_sid : Proc(IIdentityStore*, LibC::LPWSTR, Guid*, UInt16, UInt8*, UInt16*, HRESULT)
    enumerate_identities : Proc(IIdentityStore*, IDENTITY_TYPE, PROPERTYKEY*, PROPVARIANT*, IEnumUnknown*, HRESULT)
    reset : Proc(IIdentityStore*, HRESULT)
  end

  IIdentityStore_GUID = "df586fa5-6f35-44f1-b209-b38e169772eb"
  IID_IIdentityStore = LibC::GUID.new(0xdf586fa5_u32, 0x6f35_u16, 0x44f1_u16, StaticArray[0xb2_u8, 0x9_u8, 0xb3_u8, 0x8e_u8, 0x16_u8, 0x97_u8, 0x72_u8, 0xeb_u8])
  struct IIdentityStore
    lpVtbl : IIdentityStoreVTbl*
  end

  struct AsyncIIdentityStoreVTbl
    query_interface : Proc(AsyncIIdentityStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIIdentityStore*, UInt32)
    release : Proc(AsyncIIdentityStore*, UInt32)
    begin_get_count : Proc(AsyncIIdentityStore*, HRESULT)
    finish_get_count : Proc(AsyncIIdentityStore*, UInt32*, HRESULT)
    begin_get_at : Proc(AsyncIIdentityStore*, UInt32, Guid*, HRESULT)
    finish_get_at : Proc(AsyncIIdentityStore*, Guid*, IUnknown*, HRESULT)
    begin_add_to_cache : Proc(AsyncIIdentityStore*, LibC::LPWSTR, Guid*, HRESULT)
    finish_add_to_cache : Proc(AsyncIIdentityStore*, HRESULT)
    begin_convert_to_sid : Proc(AsyncIIdentityStore*, LibC::LPWSTR, Guid*, UInt16, UInt8*, HRESULT)
    finish_convert_to_sid : Proc(AsyncIIdentityStore*, UInt8*, UInt16*, HRESULT)
    begin_enumerate_identities : Proc(AsyncIIdentityStore*, IDENTITY_TYPE, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    finish_enumerate_identities : Proc(AsyncIIdentityStore*, IEnumUnknown*, HRESULT)
    begin_reset : Proc(AsyncIIdentityStore*, HRESULT)
    finish_reset : Proc(AsyncIIdentityStore*, HRESULT)
  end

  AsyncIIdentityStore_GUID = "eefa1616-48de-4872-aa64-6e6206535a51"
  IID_AsyncIIdentityStore = LibC::GUID.new(0xeefa1616_u32, 0x48de_u16, 0x4872_u16, StaticArray[0xaa_u8, 0x64_u8, 0x6e_u8, 0x62_u8, 0x6_u8, 0x53_u8, 0x5a_u8, 0x51_u8])
  struct AsyncIIdentityStore
    lpVtbl : AsyncIIdentityStoreVTbl*
  end

  struct IIdentityStoreExVTbl
    query_interface : Proc(IIdentityStoreEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIdentityStoreEx*, UInt32)
    release : Proc(IIdentityStoreEx*, UInt32)
    create_connected_identity : Proc(IIdentityStoreEx*, LibC::LPWSTR, LibC::LPWSTR, Guid*, HRESULT)
    delete_connected_identity : Proc(IIdentityStoreEx*, LibC::LPWSTR, Guid*, HRESULT)
  end

  IIdentityStoreEx_GUID = "f9f9eb98-8f7f-4e38-9577-6980114ce32b"
  IID_IIdentityStoreEx = LibC::GUID.new(0xf9f9eb98_u32, 0x8f7f_u16, 0x4e38_u16, StaticArray[0x95_u8, 0x77_u8, 0x69_u8, 0x80_u8, 0x11_u8, 0x4c_u8, 0xe3_u8, 0x2b_u8])
  struct IIdentityStoreEx
    lpVtbl : IIdentityStoreExVTbl*
  end

  struct AsyncIIdentityStoreExVTbl
    query_interface : Proc(AsyncIIdentityStoreEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(AsyncIIdentityStoreEx*, UInt32)
    release : Proc(AsyncIIdentityStoreEx*, UInt32)
    begin_create_connected_identity : Proc(AsyncIIdentityStoreEx*, LibC::LPWSTR, LibC::LPWSTR, Guid*, HRESULT)
    finish_create_connected_identity : Proc(AsyncIIdentityStoreEx*, HRESULT)
    begin_delete_connected_identity : Proc(AsyncIIdentityStoreEx*, LibC::LPWSTR, Guid*, HRESULT)
    finish_delete_connected_identity : Proc(AsyncIIdentityStoreEx*, HRESULT)
  end

  AsyncIIdentityStoreEx_GUID = "fca3af9a-8a07-4eae-8632-ec3de658a36a"
  IID_AsyncIIdentityStoreEx = LibC::GUID.new(0xfca3af9a_u32, 0x8a07_u16, 0x4eae_u16, StaticArray[0x86_u8, 0x32_u8, 0xec_u8, 0x3d_u8, 0xe6_u8, 0x58_u8, 0xa3_u8, 0x6a_u8])
  struct AsyncIIdentityStoreEx
    lpVtbl : AsyncIIdentityStoreExVTbl*
  end

end
struct LibWin32::IIdentityAdvise
  def query_interface(this : IIdentityAdvise*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIdentityAdvise*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIdentityAdvise*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def identity_updated(this : IIdentityAdvise*, dwidentityupdateevents : IdentityUpdateEvent, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.identity_updated.call(this, dwidentityupdateevents, lpszuniqueid)
  end
end
struct LibWin32::AsyncIIdentityAdvise
  def query_interface(this : AsyncIIdentityAdvise*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIIdentityAdvise*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIIdentityAdvise*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_identity_updated(this : AsyncIIdentityAdvise*, dwidentityupdateevents : UInt32, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.begin_identity_updated.call(this, dwidentityupdateevents, lpszuniqueid)
  end
  def finish_identity_updated(this : AsyncIIdentityAdvise*) : HRESULT
    @lpVtbl.value.finish_identity_updated.call(this)
  end
end
struct LibWin32::IIdentityProvider
  def query_interface(this : IIdentityProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIdentityProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIdentityProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_identity_enum(this : IIdentityProvider*, eidentitytype : IDENTITY_TYPE, pfilterkey : PROPERTYKEY*, pfilterpropvarvalue : PROPVARIANT*, ppidentityenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.get_identity_enum.call(this, eidentitytype, pfilterkey, pfilterpropvarvalue, ppidentityenum)
  end
  def create(this : IIdentityProvider*, lpszusername : LibC::LPWSTR, pppropertystore : IPropertyStore*, pkeywordstoadd : PROPVARIANT*) : HRESULT
    @lpVtbl.value.create.call(this, lpszusername, pppropertystore, pkeywordstoadd)
  end
  def import(this : IIdentityProvider*, ppropertystore : IPropertyStore) : HRESULT
    @lpVtbl.value.import.call(this, ppropertystore)
  end
  def delete(this : IIdentityProvider*, lpszuniqueid : LibC::LPWSTR, pkeywordstodelete : PROPVARIANT*) : HRESULT
    @lpVtbl.value.delete.call(this, lpszuniqueid, pkeywordstodelete)
  end
  def find_by_unique_id(this : IIdentityProvider*, lpszuniqueid : LibC::LPWSTR, pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.find_by_unique_id.call(this, lpszuniqueid, pppropertystore)
  end
  def get_provider_property_store(this : IIdentityProvider*, pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.get_provider_property_store.call(this, pppropertystore)
  end
  def advise(this : IIdentityProvider*, pidentityadvise : IIdentityAdvise, dwidentityupdateevents : IdentityUpdateEvent, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.advise.call(this, pidentityadvise, dwidentityupdateevents, pdwcookie)
  end
  def un_advise(this : IIdentityProvider*, dwcookie : UInt32) : HRESULT
    @lpVtbl.value.un_advise.call(this, dwcookie)
  end
end
struct LibWin32::AsyncIIdentityProvider
  def query_interface(this : AsyncIIdentityProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIIdentityProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIIdentityProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_get_identity_enum(this : AsyncIIdentityProvider*, eidentitytype : IDENTITY_TYPE, pfilterkey : PROPERTYKEY*, pfilterpropvarvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.begin_get_identity_enum.call(this, eidentitytype, pfilterkey, pfilterpropvarvalue)
  end
  def finish_get_identity_enum(this : AsyncIIdentityProvider*, ppidentityenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.finish_get_identity_enum.call(this, ppidentityenum)
  end
  def begin_create(this : AsyncIIdentityProvider*, lpszusername : LibC::LPWSTR, pkeywordstoadd : PROPVARIANT*) : HRESULT
    @lpVtbl.value.begin_create.call(this, lpszusername, pkeywordstoadd)
  end
  def finish_create(this : AsyncIIdentityProvider*, pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_create.call(this, pppropertystore)
  end
  def begin_import(this : AsyncIIdentityProvider*, ppropertystore : IPropertyStore) : HRESULT
    @lpVtbl.value.begin_import.call(this, ppropertystore)
  end
  def finish_import(this : AsyncIIdentityProvider*) : HRESULT
    @lpVtbl.value.finish_import.call(this)
  end
  def begin_delete(this : AsyncIIdentityProvider*, lpszuniqueid : LibC::LPWSTR, pkeywordstodelete : PROPVARIANT*) : HRESULT
    @lpVtbl.value.begin_delete.call(this, lpszuniqueid, pkeywordstodelete)
  end
  def finish_delete(this : AsyncIIdentityProvider*) : HRESULT
    @lpVtbl.value.finish_delete.call(this)
  end
  def begin_find_by_unique_id(this : AsyncIIdentityProvider*, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.begin_find_by_unique_id.call(this, lpszuniqueid)
  end
  def finish_find_by_unique_id(this : AsyncIIdentityProvider*, pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_find_by_unique_id.call(this, pppropertystore)
  end
  def begin_get_provider_property_store(this : AsyncIIdentityProvider*) : HRESULT
    @lpVtbl.value.begin_get_provider_property_store.call(this)
  end
  def finish_get_provider_property_store(this : AsyncIIdentityProvider*, pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_get_provider_property_store.call(this, pppropertystore)
  end
  def begin_advise(this : AsyncIIdentityProvider*, pidentityadvise : IIdentityAdvise, dwidentityupdateevents : UInt32) : HRESULT
    @lpVtbl.value.begin_advise.call(this, pidentityadvise, dwidentityupdateevents)
  end
  def finish_advise(this : AsyncIIdentityProvider*, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.finish_advise.call(this, pdwcookie)
  end
  def begin_un_advise(this : AsyncIIdentityProvider*, dwcookie : UInt32) : HRESULT
    @lpVtbl.value.begin_un_advise.call(this, dwcookie)
  end
  def finish_un_advise(this : AsyncIIdentityProvider*) : HRESULT
    @lpVtbl.value.finish_un_advise.call(this)
  end
end
struct LibWin32::IAssociatedIdentityProvider
  def query_interface(this : IAssociatedIdentityProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAssociatedIdentityProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAssociatedIdentityProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def associate_identity(this : IAssociatedIdentityProvider*, hwndparent : LibC::HANDLE, pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.associate_identity.call(this, hwndparent, pppropertystore)
  end
  def disassociate_identity(this : IAssociatedIdentityProvider*, hwndparent : LibC::HANDLE, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.disassociate_identity.call(this, hwndparent, lpszuniqueid)
  end
  def change_credential(this : IAssociatedIdentityProvider*, hwndparent : LibC::HANDLE, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.change_credential.call(this, hwndparent, lpszuniqueid)
  end
end
struct LibWin32::AsyncIAssociatedIdentityProvider
  def query_interface(this : AsyncIAssociatedIdentityProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIAssociatedIdentityProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIAssociatedIdentityProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_associate_identity(this : AsyncIAssociatedIdentityProvider*, hwndparent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.begin_associate_identity.call(this, hwndparent)
  end
  def finish_associate_identity(this : AsyncIAssociatedIdentityProvider*, pppropertystore : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_associate_identity.call(this, pppropertystore)
  end
  def begin_disassociate_identity(this : AsyncIAssociatedIdentityProvider*, hwndparent : LibC::HANDLE, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.begin_disassociate_identity.call(this, hwndparent, lpszuniqueid)
  end
  def finish_disassociate_identity(this : AsyncIAssociatedIdentityProvider*) : HRESULT
    @lpVtbl.value.finish_disassociate_identity.call(this)
  end
  def begin_change_credential(this : AsyncIAssociatedIdentityProvider*, hwndparent : LibC::HANDLE, lpszuniqueid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.begin_change_credential.call(this, hwndparent, lpszuniqueid)
  end
  def finish_change_credential(this : AsyncIAssociatedIdentityProvider*) : HRESULT
    @lpVtbl.value.finish_change_credential.call(this)
  end
end
struct LibWin32::IConnectedIdentityProvider
  def query_interface(this : IConnectedIdentityProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IConnectedIdentityProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IConnectedIdentityProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def connect_identity(this : IConnectedIdentityProvider*, authbuffer : UInt8*, authbuffersize : UInt32) : HRESULT
    @lpVtbl.value.connect_identity.call(this, authbuffer, authbuffersize)
  end
  def disconnect_identity(this : IConnectedIdentityProvider*) : HRESULT
    @lpVtbl.value.disconnect_identity.call(this)
  end
  def is_connected(this : IConnectedIdentityProvider*, connected : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_connected.call(this, connected)
  end
  def get_url(this : IConnectedIdentityProvider*, identifier : IDENTITY_URL, context : IBindCtx, postdata : VARIANT*, url : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_url.call(this, identifier, context, postdata, url)
  end
  def get_account_state(this : IConnectedIdentityProvider*, pstate : ACCOUNT_STATE*) : HRESULT
    @lpVtbl.value.get_account_state.call(this, pstate)
  end
end
struct LibWin32::AsyncIConnectedIdentityProvider
  def query_interface(this : AsyncIConnectedIdentityProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIConnectedIdentityProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIConnectedIdentityProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_connect_identity(this : AsyncIConnectedIdentityProvider*, authbuffer : UInt8*, authbuffersize : UInt32) : HRESULT
    @lpVtbl.value.begin_connect_identity.call(this, authbuffer, authbuffersize)
  end
  def finish_connect_identity(this : AsyncIConnectedIdentityProvider*) : HRESULT
    @lpVtbl.value.finish_connect_identity.call(this)
  end
  def begin_disconnect_identity(this : AsyncIConnectedIdentityProvider*) : HRESULT
    @lpVtbl.value.begin_disconnect_identity.call(this)
  end
  def finish_disconnect_identity(this : AsyncIConnectedIdentityProvider*) : HRESULT
    @lpVtbl.value.finish_disconnect_identity.call(this)
  end
  def begin_is_connected(this : AsyncIConnectedIdentityProvider*) : HRESULT
    @lpVtbl.value.begin_is_connected.call(this)
  end
  def finish_is_connected(this : AsyncIConnectedIdentityProvider*, connected : LibC::BOOL*) : HRESULT
    @lpVtbl.value.finish_is_connected.call(this, connected)
  end
  def begin_get_url(this : AsyncIConnectedIdentityProvider*, identifier : IDENTITY_URL, context : IBindCtx) : HRESULT
    @lpVtbl.value.begin_get_url.call(this, identifier, context)
  end
  def finish_get_url(this : AsyncIConnectedIdentityProvider*, postdata : VARIANT*, url : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.finish_get_url.call(this, postdata, url)
  end
  def begin_get_account_state(this : AsyncIConnectedIdentityProvider*) : HRESULT
    @lpVtbl.value.begin_get_account_state.call(this)
  end
  def finish_get_account_state(this : AsyncIConnectedIdentityProvider*, pstate : ACCOUNT_STATE*) : HRESULT
    @lpVtbl.value.finish_get_account_state.call(this, pstate)
  end
end
struct LibWin32::IIdentityAuthentication
  def query_interface(this : IIdentityAuthentication*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIdentityAuthentication*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIdentityAuthentication*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_identity_credential(this : IIdentityAuthentication*, credbuffer : UInt8*, credbufferlength : UInt32) : HRESULT
    @lpVtbl.value.set_identity_credential.call(this, credbuffer, credbufferlength)
  end
  def validate_identity_credential(this : IIdentityAuthentication*, credbuffer : UInt8*, credbufferlength : UInt32, ppidentityproperties : IPropertyStore*) : HRESULT
    @lpVtbl.value.validate_identity_credential.call(this, credbuffer, credbufferlength, ppidentityproperties)
  end
end
struct LibWin32::AsyncIIdentityAuthentication
  def query_interface(this : AsyncIIdentityAuthentication*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIIdentityAuthentication*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIIdentityAuthentication*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_set_identity_credential(this : AsyncIIdentityAuthentication*, credbuffer : UInt8*, credbufferlength : UInt32) : HRESULT
    @lpVtbl.value.begin_set_identity_credential.call(this, credbuffer, credbufferlength)
  end
  def finish_set_identity_credential(this : AsyncIIdentityAuthentication*) : HRESULT
    @lpVtbl.value.finish_set_identity_credential.call(this)
  end
  def begin_validate_identity_credential(this : AsyncIIdentityAuthentication*, credbuffer : UInt8*, credbufferlength : UInt32, ppidentityproperties : IPropertyStore*) : HRESULT
    @lpVtbl.value.begin_validate_identity_credential.call(this, credbuffer, credbufferlength, ppidentityproperties)
  end
  def finish_validate_identity_credential(this : AsyncIIdentityAuthentication*, ppidentityproperties : IPropertyStore*) : HRESULT
    @lpVtbl.value.finish_validate_identity_credential.call(this, ppidentityproperties)
  end
end
struct LibWin32::IIdentityStore
  def query_interface(this : IIdentityStore*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIdentityStore*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIdentityStore*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_count(this : IIdentityStore*, pdwproviders : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pdwproviders)
  end
  def get_at(this : IIdentityStore*, dwprovider : UInt32, pprovguid : Guid*, ppidentityprovider : IUnknown*) : HRESULT
    @lpVtbl.value.get_at.call(this, dwprovider, pprovguid, ppidentityprovider)
  end
  def add_to_cache(this : IIdentityStore*, lpszuniqueid : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.add_to_cache.call(this, lpszuniqueid, providerguid)
  end
  def convert_to_sid(this : IIdentityStore*, lpszuniqueid : LibC::LPWSTR, providerguid : Guid*, cbsid : UInt16, psid : UInt8*, pcbrequiredsid : UInt16*) : HRESULT
    @lpVtbl.value.convert_to_sid.call(this, lpszuniqueid, providerguid, cbsid, psid, pcbrequiredsid)
  end
  def enumerate_identities(this : IIdentityStore*, eidentitytype : IDENTITY_TYPE, pfilterkey : PROPERTYKEY*, pfilterpropvarvalue : PROPVARIANT*, ppidentityenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.enumerate_identities.call(this, eidentitytype, pfilterkey, pfilterpropvarvalue, ppidentityenum)
  end
  def reset(this : IIdentityStore*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
end
struct LibWin32::AsyncIIdentityStore
  def query_interface(this : AsyncIIdentityStore*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIIdentityStore*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIIdentityStore*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_get_count(this : AsyncIIdentityStore*) : HRESULT
    @lpVtbl.value.begin_get_count.call(this)
  end
  def finish_get_count(this : AsyncIIdentityStore*, pdwproviders : UInt32*) : HRESULT
    @lpVtbl.value.finish_get_count.call(this, pdwproviders)
  end
  def begin_get_at(this : AsyncIIdentityStore*, dwprovider : UInt32, pprovguid : Guid*) : HRESULT
    @lpVtbl.value.begin_get_at.call(this, dwprovider, pprovguid)
  end
  def finish_get_at(this : AsyncIIdentityStore*, pprovguid : Guid*, ppidentityprovider : IUnknown*) : HRESULT
    @lpVtbl.value.finish_get_at.call(this, pprovguid, ppidentityprovider)
  end
  def begin_add_to_cache(this : AsyncIIdentityStore*, lpszuniqueid : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.begin_add_to_cache.call(this, lpszuniqueid, providerguid)
  end
  def finish_add_to_cache(this : AsyncIIdentityStore*) : HRESULT
    @lpVtbl.value.finish_add_to_cache.call(this)
  end
  def begin_convert_to_sid(this : AsyncIIdentityStore*, lpszuniqueid : LibC::LPWSTR, providerguid : Guid*, cbsid : UInt16, psid : UInt8*) : HRESULT
    @lpVtbl.value.begin_convert_to_sid.call(this, lpszuniqueid, providerguid, cbsid, psid)
  end
  def finish_convert_to_sid(this : AsyncIIdentityStore*, psid : UInt8*, pcbrequiredsid : UInt16*) : HRESULT
    @lpVtbl.value.finish_convert_to_sid.call(this, psid, pcbrequiredsid)
  end
  def begin_enumerate_identities(this : AsyncIIdentityStore*, eidentitytype : IDENTITY_TYPE, pfilterkey : PROPERTYKEY*, pfilterpropvarvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.begin_enumerate_identities.call(this, eidentitytype, pfilterkey, pfilterpropvarvalue)
  end
  def finish_enumerate_identities(this : AsyncIIdentityStore*, ppidentityenum : IEnumUnknown*) : HRESULT
    @lpVtbl.value.finish_enumerate_identities.call(this, ppidentityenum)
  end
  def begin_reset(this : AsyncIIdentityStore*) : HRESULT
    @lpVtbl.value.begin_reset.call(this)
  end
  def finish_reset(this : AsyncIIdentityStore*) : HRESULT
    @lpVtbl.value.finish_reset.call(this)
  end
end
struct LibWin32::IIdentityStoreEx
  def query_interface(this : IIdentityStoreEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIdentityStoreEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIdentityStoreEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_connected_identity(this : IIdentityStoreEx*, localname : LibC::LPWSTR, connectedname : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.create_connected_identity.call(this, localname, connectedname, providerguid)
  end
  def delete_connected_identity(this : IIdentityStoreEx*, connectedname : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.delete_connected_identity.call(this, connectedname, providerguid)
  end
end
struct LibWin32::AsyncIIdentityStoreEx
  def query_interface(this : AsyncIIdentityStoreEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : AsyncIIdentityStoreEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : AsyncIIdentityStoreEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_create_connected_identity(this : AsyncIIdentityStoreEx*, localname : LibC::LPWSTR, connectedname : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.begin_create_connected_identity.call(this, localname, connectedname, providerguid)
  end
  def finish_create_connected_identity(this : AsyncIIdentityStoreEx*) : HRESULT
    @lpVtbl.value.finish_create_connected_identity.call(this)
  end
  def begin_delete_connected_identity(this : AsyncIIdentityStoreEx*, connectedname : LibC::LPWSTR, providerguid : Guid*) : HRESULT
    @lpVtbl.value.begin_delete_connected_identity.call(this, connectedname, providerguid)
  end
  def finish_delete_connected_identity(this : AsyncIIdentityStoreEx*) : HRESULT
    @lpVtbl.value.finish_delete_connected_identity.call(this)
  end
end
