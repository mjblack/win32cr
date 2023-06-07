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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
  OID_OAssociatedIdentityProviderObject = "98c5a3dd-db68-4f1a-8d2b-9079cdfeaf61"
  CoClassIdentityStore = LibC::GUID.new(0x30d49246_u32, 0xd217_u16, 0x465f_u16, StaticArray[0xb0_u8, 0xb_u8, 0xac_u8, 0x9d_u8, 0xdd_u8, 0x65_u8, 0x2e_u8, 0xb7_u8])
  CIdentityProfileHandler = LibC::GUID.new(0xecf5bf46_u32, 0xe3b6_u16, 0x449a_u16, StaticArray[0xb5_u8, 0x6b_u8, 0x43_u8, 0xf5_u8, 0x8f_u8, 0x86_u8, 0x78_u8, 0x14_u8])


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

  struct AsyncIIdentityStoreEx
    lpVtbl : AsyncIIdentityStoreExVTbl*
  end

end
