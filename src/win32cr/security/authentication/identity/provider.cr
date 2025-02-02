require "./../../../system/com.cr"
require "./../../../foundation.cr"
require "./../../../ui/shell/properties_system.cr"
require "./../../../system/com/structured_storage.cr"

module Win32cr::Security::Authentication::Identity::Provider
  extend self
  IDENTITY_KEYWORD_ASSOCIATED = "associated"
  IDENTITY_KEYWORD_LOCAL = "local"
  IDENTITY_KEYWORD_HOMEGROUP = "homegroup"
  IDENTITY_KEYWORD_CONNECTED = "connected"
  OID_OAssociatedIdentityProviderObject = "98c5a3dd-db68-4f1a-8d2b-9079cdfeaf61"
  STR_OUT_OF_BOX_EXPERIENCE = "OutOfBoxExperience"
  STR_MODERN_SETTINGS_ADD_USER = "ModernSettingsAddUser"
  STR_OUT_OF_BOX_UPGRADE_EXPERIENCE = "OutOfBoxUpgradeExperience"
  STR_COMPLETE_ACCOUNT = "CompleteAccount"
  STR_NTH_USER_FIRST_AUTH = "NthUserFirstAuth"
  STR_USER_NAME = "Username"
  STR_PROPERTY_STORE = "PropertyStore"

  CLSID_CoClassIdentityStore = LibC::GUID.new(0x30d49246_u32, 0xd217_u16, 0x465f_u16, StaticArray[0xb0_u8, 0xb_u8, 0xac_u8, 0x9d_u8, 0xdd_u8, 0x65_u8, 0x2e_u8, 0xb7_u8])

  CLSID_CIdentityProfileHandler = LibC::GUID.new(0xecf5bf46_u32, 0xe3b6_u16, 0x449a_u16, StaticArray[0xb5_u8, 0x6b_u8, 0x43_u8, 0xf5_u8, 0x8f_u8, 0x86_u8, 0x78_u8, 0x14_u8])

  enum IDENTITY_TYPE
    IDENTITIES_ALL = 0_i32
    IDENTITIES_ME_ONLY = 1_i32
  end
  @[Flags]
  enum IdentityUpdateEvent : UInt32
    IDENTITY_ASSOCIATED = 1_u32
    IDENTITY_DISASSOCIATED = 2_u32
    IDENTITY_CREATED = 4_u32
    IDENTITY_IMPORTED = 8_u32
    IDENTITY_DELETED = 16_u32
    IDENTITY_PROPCHANGED = 32_u32
    IDENTITY_CONNECTED = 64_u32
    IDENTITY_DISCONNECTED = 128_u32
  end
  enum IDENTITY_URL
    IDENTITY_URL_CREATE_ACCOUNT_WIZARD = 0_i32
    IDENTITY_URL_SIGN_IN_WIZARD = 1_i32
    IDENTITY_URL_CHANGE_PASSWORD_WIZARD = 2_i32
    IDENTITY_URL_IFEXISTS_WIZARD = 3_i32
    IDENTITY_URL_ACCOUNT_SETTINGS = 4_i32
    IDENTITY_URL_RESTORE_WIZARD = 5_i32
    IDENTITY_URL_CONNECT_WIZARD = 6_i32
  end
  enum ACCOUNT_STATE
    NOT_CONNECTED = 0_i32
    CONNECTING = 1_i32
    CONNECT_COMPLETED = 2_i32
  end

  @[Extern]
  record IIdentityAdviseVtbl,
    query_interface : Proc(IIdentityAdvise*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIdentityAdvise*, UInt32),
    release : Proc(IIdentityAdvise*, UInt32),
    identity_updated : Proc(IIdentityAdvise*, Win32cr::Security::Authentication::Identity::Provider::IdentityUpdateEvent, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIdentityAdvise, lpVtbl : IIdentityAdviseVtbl* do
    GUID = LibC::GUID.new(0x4e982fed_u32, 0xd14b_u16, 0x440c_u16, StaticArray[0xb8_u8, 0xd6_u8, 0xbb_u8, 0x38_u8, 0x64_u8, 0x53_u8, 0xd3_u8, 0x86_u8])
    def query_interface(this : IIdentityAdvise*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIdentityAdvise*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIdentityAdvise*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def identity_updated(this : IIdentityAdvise*, dwIdentityUpdateEvents : Win32cr::Security::Authentication::Identity::Provider::IdentityUpdateEvent, lpszUniqueID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.identity_updated.call(this, dwIdentityUpdateEvents, lpszUniqueID)
    end

  end

  @[Extern]
  record AsyncIIdentityAdviseVtbl,
    query_interface : Proc(AsyncIIdentityAdvise*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIIdentityAdvise*, UInt32),
    release : Proc(AsyncIIdentityAdvise*, UInt32),
    begin_identity_updated : Proc(AsyncIIdentityAdvise*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    finish_identity_updated : Proc(AsyncIIdentityAdvise*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AsyncIIdentityAdvise, lpVtbl : AsyncIIdentityAdviseVtbl* do
    GUID = LibC::GUID.new(0x3ab4c8da_u32, 0xd038_u16, 0x4830_u16, StaticArray[0x8d_u8, 0xd9_u8, 0x32_u8, 0x53_u8, 0xc5_u8, 0x5a_u8, 0x12_u8, 0x7f_u8])
    def query_interface(this : AsyncIIdentityAdvise*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIIdentityAdvise*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIIdentityAdvise*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_identity_updated(this : AsyncIIdentityAdvise*, dwIdentityUpdateEvents : UInt32, lpszUniqueID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_identity_updated.call(this, dwIdentityUpdateEvents, lpszUniqueID)
    end
    def finish_identity_updated(this : AsyncIIdentityAdvise*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_identity_updated.call(this)
    end

  end

  @[Extern]
  record IIdentityProviderVtbl,
    query_interface : Proc(IIdentityProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIdentityProvider*, UInt32),
    release : Proc(IIdentityProvider*, UInt32),
    get_identity_enum : Proc(IIdentityProvider*, Win32cr::Security::Authentication::Identity::Provider::IDENTITY_TYPE, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Void**, Win32cr::Foundation::HRESULT),
    create : Proc(IIdentityProvider*, Win32cr::Foundation::PWSTR, Void**, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    import : Proc(IIdentityProvider*, Void*, Win32cr::Foundation::HRESULT),
    delete : Proc(IIdentityProvider*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    find_by_unique_id : Proc(IIdentityProvider*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_provider_property_store : Proc(IIdentityProvider*, Void**, Win32cr::Foundation::HRESULT),
    advise : Proc(IIdentityProvider*, Void*, Win32cr::Security::Authentication::Identity::Provider::IdentityUpdateEvent, UInt32*, Win32cr::Foundation::HRESULT),
    un_advise : Proc(IIdentityProvider*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIdentityProvider, lpVtbl : IIdentityProviderVtbl* do
    GUID = LibC::GUID.new(0xd1b9e0c_u32, 0xe8ba_u16, 0x4f55_u16, StaticArray[0xa8_u8, 0x1b_u8, 0xbc_u8, 0xe9_u8, 0x34_u8, 0xb9_u8, 0x48_u8, 0xf5_u8])
    def query_interface(this : IIdentityProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIdentityProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIdentityProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_identity_enum(this : IIdentityProvider*, eIdentityType : Win32cr::Security::Authentication::Identity::Provider::IDENTITY_TYPE, pFilterkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pFilterPropVarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppIdentityEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_identity_enum.call(this, eIdentityType, pFilterkey, pFilterPropVarValue, ppIdentityEnum)
    end
    def create(this : IIdentityProvider*, lpszUserName : Win32cr::Foundation::PWSTR, ppPropertyStore : Void**, pKeywordsToAdd : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, lpszUserName, ppPropertyStore, pKeywordsToAdd)
    end
    def import(this : IIdentityProvider*, pPropertyStore : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import.call(this, pPropertyStore)
    end
    def delete(this : IIdentityProvider*, lpszUniqueID : Win32cr::Foundation::PWSTR, pKeywordsToDelete : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, lpszUniqueID, pKeywordsToDelete)
    end
    def find_by_unique_id(this : IIdentityProvider*, lpszUniqueID : Win32cr::Foundation::PWSTR, ppPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_by_unique_id.call(this, lpszUniqueID, ppPropertyStore)
    end
    def get_provider_property_store(this : IIdentityProvider*, ppPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider_property_store.call(this, ppPropertyStore)
    end
    def advise(this : IIdentityProvider*, pIdentityAdvise : Void*, dwIdentityUpdateEvents : Win32cr::Security::Authentication::Identity::Provider::IdentityUpdateEvent, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, pIdentityAdvise, dwIdentityUpdateEvents, pdwCookie)
    end
    def un_advise(this : IIdentityProvider*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_advise.call(this, dwCookie)
    end

  end

  @[Extern]
  record AsyncIIdentityProviderVtbl,
    query_interface : Proc(AsyncIIdentityProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIIdentityProvider*, UInt32),
    release : Proc(AsyncIIdentityProvider*, UInt32),
    begin_get_identity_enum : Proc(AsyncIIdentityProvider*, Win32cr::Security::Authentication::Identity::Provider::IDENTITY_TYPE, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    finish_get_identity_enum : Proc(AsyncIIdentityProvider*, Void**, Win32cr::Foundation::HRESULT),
    begin_create : Proc(AsyncIIdentityProvider*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    finish_create : Proc(AsyncIIdentityProvider*, Void**, Win32cr::Foundation::HRESULT),
    begin_import : Proc(AsyncIIdentityProvider*, Void*, Win32cr::Foundation::HRESULT),
    finish_import : Proc(AsyncIIdentityProvider*, Win32cr::Foundation::HRESULT),
    begin_delete : Proc(AsyncIIdentityProvider*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    finish_delete : Proc(AsyncIIdentityProvider*, Win32cr::Foundation::HRESULT),
    begin_find_by_unique_id : Proc(AsyncIIdentityProvider*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    finish_find_by_unique_id : Proc(AsyncIIdentityProvider*, Void**, Win32cr::Foundation::HRESULT),
    begin_get_provider_property_store : Proc(AsyncIIdentityProvider*, Win32cr::Foundation::HRESULT),
    finish_get_provider_property_store : Proc(AsyncIIdentityProvider*, Void**, Win32cr::Foundation::HRESULT),
    begin_advise : Proc(AsyncIIdentityProvider*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    finish_advise : Proc(AsyncIIdentityProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_un_advise : Proc(AsyncIIdentityProvider*, UInt32, Win32cr::Foundation::HRESULT),
    finish_un_advise : Proc(AsyncIIdentityProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AsyncIIdentityProvider, lpVtbl : AsyncIIdentityProviderVtbl* do
    GUID = LibC::GUID.new(0xc6fc9901_u32, 0xc433_u16, 0x4646_u16, StaticArray[0x8f_u8, 0x48_u8, 0x4e_u8, 0x46_u8, 0x87_u8, 0xaa_u8, 0xe2_u8, 0xa0_u8])
    def query_interface(this : AsyncIIdentityProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIIdentityProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIIdentityProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_get_identity_enum(this : AsyncIIdentityProvider*, eIdentityType : Win32cr::Security::Authentication::Identity::Provider::IDENTITY_TYPE, pFilterkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pFilterPropVarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_identity_enum.call(this, eIdentityType, pFilterkey, pFilterPropVarValue)
    end
    def finish_get_identity_enum(this : AsyncIIdentityProvider*, ppIdentityEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_get_identity_enum.call(this, ppIdentityEnum)
    end
    def begin_create(this : AsyncIIdentityProvider*, lpszUserName : Win32cr::Foundation::PWSTR, pKeywordsToAdd : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_create.call(this, lpszUserName, pKeywordsToAdd)
    end
    def finish_create(this : AsyncIIdentityProvider*, ppPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_create.call(this, ppPropertyStore)
    end
    def begin_import(this : AsyncIIdentityProvider*, pPropertyStore : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_import.call(this, pPropertyStore)
    end
    def finish_import(this : AsyncIIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_import.call(this)
    end
    def begin_delete(this : AsyncIIdentityProvider*, lpszUniqueID : Win32cr::Foundation::PWSTR, pKeywordsToDelete : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_delete.call(this, lpszUniqueID, pKeywordsToDelete)
    end
    def finish_delete(this : AsyncIIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_delete.call(this)
    end
    def begin_find_by_unique_id(this : AsyncIIdentityProvider*, lpszUniqueID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_find_by_unique_id.call(this, lpszUniqueID)
    end
    def finish_find_by_unique_id(this : AsyncIIdentityProvider*, ppPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_find_by_unique_id.call(this, ppPropertyStore)
    end
    def begin_get_provider_property_store(this : AsyncIIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_provider_property_store.call(this)
    end
    def finish_get_provider_property_store(this : AsyncIIdentityProvider*, ppPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_get_provider_property_store.call(this, ppPropertyStore)
    end
    def begin_advise(this : AsyncIIdentityProvider*, pIdentityAdvise : Void*, dwIdentityUpdateEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_advise.call(this, pIdentityAdvise, dwIdentityUpdateEvents)
    end
    def finish_advise(this : AsyncIIdentityProvider*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_advise.call(this, pdwCookie)
    end
    def begin_un_advise(this : AsyncIIdentityProvider*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_un_advise.call(this, dwCookie)
    end
    def finish_un_advise(this : AsyncIIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_un_advise.call(this)
    end

  end

  @[Extern]
  record IAssociatedIdentityProviderVtbl,
    query_interface : Proc(IAssociatedIdentityProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAssociatedIdentityProvider*, UInt32),
    release : Proc(IAssociatedIdentityProvider*, UInt32),
    associate_identity : Proc(IAssociatedIdentityProvider*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT),
    disassociate_identity : Proc(IAssociatedIdentityProvider*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    change_credential : Proc(IAssociatedIdentityProvider*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAssociatedIdentityProvider, lpVtbl : IAssociatedIdentityProviderVtbl* do
    GUID = LibC::GUID.new(0x2af066b3_u32, 0x4cbb_u16, 0x4cba_u16, StaticArray[0xa7_u8, 0x98_u8, 0x20_u8, 0x4b_u8, 0x6a_u8, 0xf6_u8, 0x8c_u8, 0xc0_u8])
    def query_interface(this : IAssociatedIdentityProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAssociatedIdentityProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAssociatedIdentityProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def associate_identity(this : IAssociatedIdentityProvider*, hwndParent : Win32cr::Foundation::HWND, ppPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate_identity.call(this, hwndParent, ppPropertyStore)
    end
    def disassociate_identity(this : IAssociatedIdentityProvider*, hwndParent : Win32cr::Foundation::HWND, lpszUniqueID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disassociate_identity.call(this, hwndParent, lpszUniqueID)
    end
    def change_credential(this : IAssociatedIdentityProvider*, hwndParent : Win32cr::Foundation::HWND, lpszUniqueID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_credential.call(this, hwndParent, lpszUniqueID)
    end

  end

  @[Extern]
  record AsyncIAssociatedIdentityProviderVtbl,
    query_interface : Proc(AsyncIAssociatedIdentityProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIAssociatedIdentityProvider*, UInt32),
    release : Proc(AsyncIAssociatedIdentityProvider*, UInt32),
    begin_associate_identity : Proc(AsyncIAssociatedIdentityProvider*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    finish_associate_identity : Proc(AsyncIAssociatedIdentityProvider*, Void**, Win32cr::Foundation::HRESULT),
    begin_disassociate_identity : Proc(AsyncIAssociatedIdentityProvider*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    finish_disassociate_identity : Proc(AsyncIAssociatedIdentityProvider*, Win32cr::Foundation::HRESULT),
    begin_change_credential : Proc(AsyncIAssociatedIdentityProvider*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    finish_change_credential : Proc(AsyncIAssociatedIdentityProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AsyncIAssociatedIdentityProvider, lpVtbl : AsyncIAssociatedIdentityProviderVtbl* do
    GUID = LibC::GUID.new(0x2834d6ed_u32, 0x297e_u16, 0x4e72_u16, StaticArray[0x8a_u8, 0x51_u8, 0x96_u8, 0x1e_u8, 0x86_u8, 0xf0_u8, 0x51_u8, 0x52_u8])
    def query_interface(this : AsyncIAssociatedIdentityProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIAssociatedIdentityProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIAssociatedIdentityProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_associate_identity(this : AsyncIAssociatedIdentityProvider*, hwndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_associate_identity.call(this, hwndParent)
    end
    def finish_associate_identity(this : AsyncIAssociatedIdentityProvider*, ppPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_associate_identity.call(this, ppPropertyStore)
    end
    def begin_disassociate_identity(this : AsyncIAssociatedIdentityProvider*, hwndParent : Win32cr::Foundation::HWND, lpszUniqueID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_disassociate_identity.call(this, hwndParent, lpszUniqueID)
    end
    def finish_disassociate_identity(this : AsyncIAssociatedIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_disassociate_identity.call(this)
    end
    def begin_change_credential(this : AsyncIAssociatedIdentityProvider*, hwndParent : Win32cr::Foundation::HWND, lpszUniqueID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_change_credential.call(this, hwndParent, lpszUniqueID)
    end
    def finish_change_credential(this : AsyncIAssociatedIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_change_credential.call(this)
    end

  end

  @[Extern]
  record IConnectedIdentityProviderVtbl,
    query_interface : Proc(IConnectedIdentityProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConnectedIdentityProvider*, UInt32),
    release : Proc(IConnectedIdentityProvider*, UInt32),
    connect_identity : Proc(IConnectedIdentityProvider*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    disconnect_identity : Proc(IConnectedIdentityProvider*, Win32cr::Foundation::HRESULT),
    is_connected : Proc(IConnectedIdentityProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_url : Proc(IConnectedIdentityProvider*, Win32cr::Security::Authentication::Identity::Provider::IDENTITY_URL, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_account_state : Proc(IConnectedIdentityProvider*, Win32cr::Security::Authentication::Identity::Provider::ACCOUNT_STATE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConnectedIdentityProvider, lpVtbl : IConnectedIdentityProviderVtbl* do
    GUID = LibC::GUID.new(0xb7417b54_u32, 0xe08c_u16, 0x429b_u16, StaticArray[0x96_u8, 0xc8_u8, 0x67_u8, 0x8d_u8, 0x13_u8, 0x69_u8, 0xec_u8, 0xb1_u8])
    def query_interface(this : IConnectedIdentityProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConnectedIdentityProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConnectedIdentityProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connect_identity(this : IConnectedIdentityProvider*, auth_buffer : UInt8*, auth_buffer_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_identity.call(this, auth_buffer, auth_buffer_size)
    end
    def disconnect_identity(this : IConnectedIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_identity.call(this)
    end
    def is_connected(this : IConnectedIdentityProvider*, connected : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_connected.call(this, connected)
    end
    def get_url(this : IConnectedIdentityProvider*, identifier : Win32cr::Security::Authentication::Identity::Provider::IDENTITY_URL, context : Void*, post_data : Win32cr::System::Com::VARIANT*, url : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_url.call(this, identifier, context, post_data, url)
    end
    def get_account_state(this : IConnectedIdentityProvider*, pState : Win32cr::Security::Authentication::Identity::Provider::ACCOUNT_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_account_state.call(this, pState)
    end

  end

  @[Extern]
  record AsyncIConnectedIdentityProviderVtbl,
    query_interface : Proc(AsyncIConnectedIdentityProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIConnectedIdentityProvider*, UInt32),
    release : Proc(AsyncIConnectedIdentityProvider*, UInt32),
    begin_connect_identity : Proc(AsyncIConnectedIdentityProvider*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    finish_connect_identity : Proc(AsyncIConnectedIdentityProvider*, Win32cr::Foundation::HRESULT),
    begin_disconnect_identity : Proc(AsyncIConnectedIdentityProvider*, Win32cr::Foundation::HRESULT),
    finish_disconnect_identity : Proc(AsyncIConnectedIdentityProvider*, Win32cr::Foundation::HRESULT),
    begin_is_connected : Proc(AsyncIConnectedIdentityProvider*, Win32cr::Foundation::HRESULT),
    finish_is_connected : Proc(AsyncIConnectedIdentityProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    begin_get_url : Proc(AsyncIConnectedIdentityProvider*, Win32cr::Security::Authentication::Identity::Provider::IDENTITY_URL, Void*, Win32cr::Foundation::HRESULT),
    finish_get_url : Proc(AsyncIConnectedIdentityProvider*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    begin_get_account_state : Proc(AsyncIConnectedIdentityProvider*, Win32cr::Foundation::HRESULT),
    finish_get_account_state : Proc(AsyncIConnectedIdentityProvider*, Win32cr::Security::Authentication::Identity::Provider::ACCOUNT_STATE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AsyncIConnectedIdentityProvider, lpVtbl : AsyncIConnectedIdentityProviderVtbl* do
    GUID = LibC::GUID.new(0x9ce55141_u32, 0xbce9_u16, 0x4e15_u16, StaticArray[0x82_u8, 0x4d_u8, 0x43_u8, 0xd7_u8, 0x9f_u8, 0x51_u8, 0x2f_u8, 0x93_u8])
    def query_interface(this : AsyncIConnectedIdentityProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIConnectedIdentityProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIConnectedIdentityProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_connect_identity(this : AsyncIConnectedIdentityProvider*, auth_buffer : UInt8*, auth_buffer_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_connect_identity.call(this, auth_buffer, auth_buffer_size)
    end
    def finish_connect_identity(this : AsyncIConnectedIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_connect_identity.call(this)
    end
    def begin_disconnect_identity(this : AsyncIConnectedIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_disconnect_identity.call(this)
    end
    def finish_disconnect_identity(this : AsyncIConnectedIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_disconnect_identity.call(this)
    end
    def begin_is_connected(this : AsyncIConnectedIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_is_connected.call(this)
    end
    def finish_is_connected(this : AsyncIConnectedIdentityProvider*, connected : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_is_connected.call(this, connected)
    end
    def begin_get_url(this : AsyncIConnectedIdentityProvider*, identifier : Win32cr::Security::Authentication::Identity::Provider::IDENTITY_URL, context : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_url.call(this, identifier, context)
    end
    def finish_get_url(this : AsyncIConnectedIdentityProvider*, post_data : Win32cr::System::Com::VARIANT*, url : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_get_url.call(this, post_data, url)
    end
    def begin_get_account_state(this : AsyncIConnectedIdentityProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_account_state.call(this)
    end
    def finish_get_account_state(this : AsyncIConnectedIdentityProvider*, pState : Win32cr::Security::Authentication::Identity::Provider::ACCOUNT_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_get_account_state.call(this, pState)
    end

  end

  @[Extern]
  record IIdentityAuthenticationVtbl,
    query_interface : Proc(IIdentityAuthentication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIdentityAuthentication*, UInt32),
    release : Proc(IIdentityAuthentication*, UInt32),
    set_identity_credential : Proc(IIdentityAuthentication*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    validate_identity_credential : Proc(IIdentityAuthentication*, UInt8*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIdentityAuthentication, lpVtbl : IIdentityAuthenticationVtbl* do
    GUID = LibC::GUID.new(0x5e7ef254_u32, 0x979f_u16, 0x43b5_u16, StaticArray[0xb7_u8, 0x4e_u8, 0x6_u8, 0xe4_u8, 0xeb_u8, 0x7d_u8, 0xf0_u8, 0xf9_u8])
    def query_interface(this : IIdentityAuthentication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIdentityAuthentication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIdentityAuthentication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_identity_credential(this : IIdentityAuthentication*, cred_buffer : UInt8*, cred_buffer_length : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_identity_credential.call(this, cred_buffer, cred_buffer_length)
    end
    def validate_identity_credential(this : IIdentityAuthentication*, cred_buffer : UInt8*, cred_buffer_length : UInt32, ppIdentityProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate_identity_credential.call(this, cred_buffer, cred_buffer_length, ppIdentityProperties)
    end

  end

  @[Extern]
  record AsyncIIdentityAuthenticationVtbl,
    query_interface : Proc(AsyncIIdentityAuthentication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIIdentityAuthentication*, UInt32),
    release : Proc(AsyncIIdentityAuthentication*, UInt32),
    begin_set_identity_credential : Proc(AsyncIIdentityAuthentication*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    finish_set_identity_credential : Proc(AsyncIIdentityAuthentication*, Win32cr::Foundation::HRESULT),
    begin_validate_identity_credential : Proc(AsyncIIdentityAuthentication*, UInt8*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    finish_validate_identity_credential : Proc(AsyncIIdentityAuthentication*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AsyncIIdentityAuthentication, lpVtbl : AsyncIIdentityAuthenticationVtbl* do
    GUID = LibC::GUID.new(0xf9a2f918_u32, 0xfeca_u16, 0x4e9c_u16, StaticArray[0x96_u8, 0x33_u8, 0x61_u8, 0xcb_u8, 0xf1_u8, 0x3e_u8, 0xd3_u8, 0x4d_u8])
    def query_interface(this : AsyncIIdentityAuthentication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIIdentityAuthentication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIIdentityAuthentication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_set_identity_credential(this : AsyncIIdentityAuthentication*, cred_buffer : UInt8*, cred_buffer_length : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_set_identity_credential.call(this, cred_buffer, cred_buffer_length)
    end
    def finish_set_identity_credential(this : AsyncIIdentityAuthentication*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_set_identity_credential.call(this)
    end
    def begin_validate_identity_credential(this : AsyncIIdentityAuthentication*, cred_buffer : UInt8*, cred_buffer_length : UInt32, ppIdentityProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_validate_identity_credential.call(this, cred_buffer, cred_buffer_length, ppIdentityProperties)
    end
    def finish_validate_identity_credential(this : AsyncIIdentityAuthentication*, ppIdentityProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_validate_identity_credential.call(this, ppIdentityProperties)
    end

  end

  @[Extern]
  record IIdentityStoreVtbl,
    query_interface : Proc(IIdentityStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIdentityStore*, UInt32),
    release : Proc(IIdentityStore*, UInt32),
    get_count : Proc(IIdentityStore*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IIdentityStore*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_to_cache : Proc(IIdentityStore*, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    convert_to_sid : Proc(IIdentityStore*, Win32cr::Foundation::PWSTR, LibC::GUID*, UInt16, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    enumerate_identities : Proc(IIdentityStore*, Win32cr::Security::Authentication::Identity::Provider::IDENTITY_TYPE, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Void**, Win32cr::Foundation::HRESULT),
    reset : Proc(IIdentityStore*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIdentityStore, lpVtbl : IIdentityStoreVtbl* do
    GUID = LibC::GUID.new(0xdf586fa5_u32, 0x6f35_u16, 0x44f1_u16, StaticArray[0xb2_u8, 0x9_u8, 0xb3_u8, 0x8e_u8, 0x16_u8, 0x97_u8, 0x72_u8, 0xeb_u8])
    def query_interface(this : IIdentityStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIdentityStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIdentityStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IIdentityStore*, pdwProviders : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pdwProviders)
    end
    def get_at(this : IIdentityStore*, dwProvider : UInt32, pProvGuid : LibC::GUID*, ppIdentityProvider : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, dwProvider, pProvGuid, ppIdentityProvider)
    end
    def add_to_cache(this : IIdentityStore*, lpszUniqueID : Win32cr::Foundation::PWSTR, provider_guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_cache.call(this, lpszUniqueID, provider_guid)
    end
    def convert_to_sid(this : IIdentityStore*, lpszUniqueID : Win32cr::Foundation::PWSTR, provider_guid : LibC::GUID*, cbSid : UInt16, pSid : UInt8*, pcbRequiredSid : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_to_sid.call(this, lpszUniqueID, provider_guid, cbSid, pSid, pcbRequiredSid)
    end
    def enumerate_identities(this : IIdentityStore*, eIdentityType : Win32cr::Security::Authentication::Identity::Provider::IDENTITY_TYPE, pFilterkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pFilterPropVarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppIdentityEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_identities.call(this, eIdentityType, pFilterkey, pFilterPropVarValue, ppIdentityEnum)
    end
    def reset(this : IIdentityStore*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record AsyncIIdentityStoreVtbl,
    query_interface : Proc(AsyncIIdentityStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIIdentityStore*, UInt32),
    release : Proc(AsyncIIdentityStore*, UInt32),
    begin_get_count : Proc(AsyncIIdentityStore*, Win32cr::Foundation::HRESULT),
    finish_get_count : Proc(AsyncIIdentityStore*, UInt32*, Win32cr::Foundation::HRESULT),
    begin_get_at : Proc(AsyncIIdentityStore*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    finish_get_at : Proc(AsyncIIdentityStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    begin_add_to_cache : Proc(AsyncIIdentityStore*, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    finish_add_to_cache : Proc(AsyncIIdentityStore*, Win32cr::Foundation::HRESULT),
    begin_convert_to_sid : Proc(AsyncIIdentityStore*, Win32cr::Foundation::PWSTR, LibC::GUID*, UInt16, UInt8*, Win32cr::Foundation::HRESULT),
    finish_convert_to_sid : Proc(AsyncIIdentityStore*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    begin_enumerate_identities : Proc(AsyncIIdentityStore*, Win32cr::Security::Authentication::Identity::Provider::IDENTITY_TYPE, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    finish_enumerate_identities : Proc(AsyncIIdentityStore*, Void**, Win32cr::Foundation::HRESULT),
    begin_reset : Proc(AsyncIIdentityStore*, Win32cr::Foundation::HRESULT),
    finish_reset : Proc(AsyncIIdentityStore*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AsyncIIdentityStore, lpVtbl : AsyncIIdentityStoreVtbl* do
    GUID = LibC::GUID.new(0xeefa1616_u32, 0x48de_u16, 0x4872_u16, StaticArray[0xaa_u8, 0x64_u8, 0x6e_u8, 0x62_u8, 0x6_u8, 0x53_u8, 0x5a_u8, 0x51_u8])
    def query_interface(this : AsyncIIdentityStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIIdentityStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIIdentityStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_get_count(this : AsyncIIdentityStore*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_count.call(this)
    end
    def finish_get_count(this : AsyncIIdentityStore*, pdwProviders : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_get_count.call(this, pdwProviders)
    end
    def begin_get_at(this : AsyncIIdentityStore*, dwProvider : UInt32, pProvGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_get_at.call(this, dwProvider, pProvGuid)
    end
    def finish_get_at(this : AsyncIIdentityStore*, pProvGuid : LibC::GUID*, ppIdentityProvider : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_get_at.call(this, pProvGuid, ppIdentityProvider)
    end
    def begin_add_to_cache(this : AsyncIIdentityStore*, lpszUniqueID : Win32cr::Foundation::PWSTR, provider_guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_add_to_cache.call(this, lpszUniqueID, provider_guid)
    end
    def finish_add_to_cache(this : AsyncIIdentityStore*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_add_to_cache.call(this)
    end
    def begin_convert_to_sid(this : AsyncIIdentityStore*, lpszUniqueID : Win32cr::Foundation::PWSTR, provider_guid : LibC::GUID*, cbSid : UInt16, pSid : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_convert_to_sid.call(this, lpszUniqueID, provider_guid, cbSid, pSid)
    end
    def finish_convert_to_sid(this : AsyncIIdentityStore*, pSid : UInt8*, pcbRequiredSid : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_convert_to_sid.call(this, pSid, pcbRequiredSid)
    end
    def begin_enumerate_identities(this : AsyncIIdentityStore*, eIdentityType : Win32cr::Security::Authentication::Identity::Provider::IDENTITY_TYPE, pFilterkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pFilterPropVarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_enumerate_identities.call(this, eIdentityType, pFilterkey, pFilterPropVarValue)
    end
    def finish_enumerate_identities(this : AsyncIIdentityStore*, ppIdentityEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_enumerate_identities.call(this, ppIdentityEnum)
    end
    def begin_reset(this : AsyncIIdentityStore*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_reset.call(this)
    end
    def finish_reset(this : AsyncIIdentityStore*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_reset.call(this)
    end

  end

  @[Extern]
  record IIdentityStoreExVtbl,
    query_interface : Proc(IIdentityStoreEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIdentityStoreEx*, UInt32),
    release : Proc(IIdentityStoreEx*, UInt32),
    create_connected_identity : Proc(IIdentityStoreEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    delete_connected_identity : Proc(IIdentityStoreEx*, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIdentityStoreEx, lpVtbl : IIdentityStoreExVtbl* do
    GUID = LibC::GUID.new(0xf9f9eb98_u32, 0x8f7f_u16, 0x4e38_u16, StaticArray[0x95_u8, 0x77_u8, 0x69_u8, 0x80_u8, 0x11_u8, 0x4c_u8, 0xe3_u8, 0x2b_u8])
    def query_interface(this : IIdentityStoreEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIdentityStoreEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIdentityStoreEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_connected_identity(this : IIdentityStoreEx*, local_name : Win32cr::Foundation::PWSTR, connected_name : Win32cr::Foundation::PWSTR, provider_guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_connected_identity.call(this, local_name, connected_name, provider_guid)
    end
    def delete_connected_identity(this : IIdentityStoreEx*, connected_name : Win32cr::Foundation::PWSTR, provider_guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_connected_identity.call(this, connected_name, provider_guid)
    end

  end

  @[Extern]
  record AsyncIIdentityStoreExVtbl,
    query_interface : Proc(AsyncIIdentityStoreEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIIdentityStoreEx*, UInt32),
    release : Proc(AsyncIIdentityStoreEx*, UInt32),
    begin_create_connected_identity : Proc(AsyncIIdentityStoreEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    finish_create_connected_identity : Proc(AsyncIIdentityStoreEx*, Win32cr::Foundation::HRESULT),
    begin_delete_connected_identity : Proc(AsyncIIdentityStoreEx*, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    finish_delete_connected_identity : Proc(AsyncIIdentityStoreEx*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AsyncIIdentityStoreEx, lpVtbl : AsyncIIdentityStoreExVtbl* do
    GUID = LibC::GUID.new(0xfca3af9a_u32, 0x8a07_u16, 0x4eae_u16, StaticArray[0x86_u8, 0x32_u8, 0xec_u8, 0x3d_u8, 0xe6_u8, 0x58_u8, 0xa3_u8, 0x6a_u8])
    def query_interface(this : AsyncIIdentityStoreEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIIdentityStoreEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIIdentityStoreEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_create_connected_identity(this : AsyncIIdentityStoreEx*, local_name : Win32cr::Foundation::PWSTR, connected_name : Win32cr::Foundation::PWSTR, provider_guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_create_connected_identity.call(this, local_name, connected_name, provider_guid)
    end
    def finish_create_connected_identity(this : AsyncIIdentityStoreEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_create_connected_identity.call(this)
    end
    def begin_delete_connected_identity(this : AsyncIIdentityStoreEx*, connected_name : Win32cr::Foundation::PWSTR, provider_guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_delete_connected_identity.call(this, connected_name, provider_guid)
    end
    def finish_delete_connected_identity(this : AsyncIIdentityStoreEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_delete_connected_identity.call(this)
    end

  end

end