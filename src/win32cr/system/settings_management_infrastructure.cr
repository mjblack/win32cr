require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::SettingsManagementInfrastructure
  WCM_SETTINGS_ID_NAME = "name"
  WCM_SETTINGS_ID_VERSION = "version"
  WCM_SETTINGS_ID_LANGUAGE = "language"
  WCM_SETTINGS_ID_ARCHITECTURE = "architecture"
  WCM_SETTINGS_ID_TOKEN = "token"
  WCM_SETTINGS_ID_URI = "uri"
  WCM_SETTINGS_ID_VERSION_SCOPE = "versionScope"
  WCM_SETTINGS_ID_FLAG_REFERENCE = 0_u32
  WCM_SETTINGS_ID_FLAG_DEFINITION = 1_u32
  LINK_STORE_TO_ENGINE_INSTANCE = 1_u32
  LIMITED_VALIDATION_MODE = 1_u32
  WCM_E_INTERNALERROR = -2145255424_i32
  WCM_E_STATENODENOTFOUND = -2145255423_i32
  WCM_E_STATENODENOTALLOWED = -2145255422_i32
  WCM_E_ATTRIBUTENOTFOUND = -2145255421_i32
  WCM_E_ATTRIBUTENOTALLOWED = -2145255420_i32
  WCM_E_INVALIDVALUE = -2145255419_i32
  WCM_E_INVALIDVALUEFORMAT = -2145255418_i32
  WCM_E_TYPENOTSPECIFIED = -2145255417_i32
  WCM_E_INVALIDDATATYPE = -2145255416_i32
  WCM_E_NOTPOSITIONED = -2145255415_i32
  WCM_E_READONLYITEM = -2145255414_i32
  WCM_E_INVALIDPATH = -2145255413_i32
  WCM_E_WRONGESCAPESTRING = -2145255412_i32
  WCM_E_INVALIDVERSIONFORMAT = -2145255411_i32
  WCM_E_INVALIDLANGUAGEFORMAT = -2145255410_i32
  WCM_E_KEYNOTCHANGEABLE = -2145255409_i32
  WCM_E_EXPRESSIONNOTFOUND = -2145255408_i32
  WCM_E_SUBSTITUTIONNOTFOUND = -2145255407_i32
  WCM_E_USERALREADYREGISTERED = -2145255406_i32
  WCM_E_USERNOTFOUND = -2145255405_i32
  WCM_E_NAMESPACENOTFOUND = -2145255404_i32
  WCM_E_NAMESPACEALREADYREGISTERED = -2145255403_i32
  WCM_E_STORECORRUPTED = -2145255402_i32
  WCM_E_INVALIDEXPRESSIONSYNTAX = -2145255401_i32
  WCM_E_NOTIFICATIONNOTFOUND = -2145255400_i32
  WCM_E_CONFLICTINGASSERTION = -2145255399_i32
  WCM_E_ASSERTIONFAILED = -2145255398_i32
  WCM_E_DUPLICATENAME = -2145255397_i32
  WCM_E_INVALIDKEY = -2145255396_i32
  WCM_E_INVALIDSTREAM = -2145255395_i32
  WCM_E_HANDLERNOTFOUND = -2145255394_i32
  WCM_E_INVALIDHANDLERSYNTAX = -2145255393_i32
  WCM_E_VALIDATIONFAILED = -2145255392_i32
  WCM_E_RESTRICTIONFAILED = -2145255391_i32
  WCM_E_MANIFESTCOMPILATIONFAILED = -2145255390_i32
  WCM_E_CYCLICREFERENCE = -2145255389_i32
  WCM_E_MIXTYPEASSERTION = -2145255388_i32
  WCM_E_NOTSUPPORTEDFUNCTION = -2145255387_i32
  WCM_E_VALUETOOBIG = -2145255386_i32
  WCM_E_INVALIDATTRIBUTECOMBINATION = -2145255385_i32
  WCM_E_ABORTOPERATION = -2145255384_i32
  WCM_E_MISSINGCONFIGURATION = -2145255383_i32
  WCM_E_INVALIDPROCESSORFORMAT = -2145255382_i32
  WCM_E_SOURCEMANEMPTYVALUE = -2145255381_i32
  WCM_S_INTERNALERROR = 2232320_i32
  WCM_S_ATTRIBUTENOTFOUND = 2232321_i32
  WCM_S_LEGACYSETTINGWARNING = 2232322_i32
  WCM_S_INVALIDATTRIBUTECOMBINATION = 2232324_i32
  WCM_S_ATTRIBUTENOTALLOWED = 2232325_i32
  WCM_S_NAMESPACENOTFOUND = 2232326_i32
  WCM_E_UNKNOWNRESULT = -2145251325_i32

  CLSID_SettingsEngine = LibC::GUID.new(0x9f7d7bb5_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])

  enum WcmTargetMode
    OfflineMode = 1_i32
    OnlineMode = 2_i32
  end
  enum WcmNamespaceEnumerationFlags
    SharedEnumeration = 1_i32
    UserEnumeration = 2_i32
    AllEnumeration = 3_i32
  end
  enum WcmDataType
    Datatypebyte = 1_i32
    Datatypesbyte = 2_i32
    Datatypeuint16 = 3_i32
    Datatypeint16 = 4_i32
    Datatypeuint32 = 5_i32
    Datatypeint32 = 6_i32
    Datatypeuint64 = 7_i32
    Datatypeint64 = 8_i32
    Datatypeboolean = 11_i32
    Datatypestring = 12_i32
    Datatypeflagarray = 32768_i32
  end
  enum WcmSettingType
    Settingtypescalar = 1_i32
    Settingtypecomplex = 2_i32
    Settingtypelist = 3_i32
  end
  enum WcmRestrictionFacets
    Restrictionfacetmaxlength = 1_i32
    Restrictionfacetenumeration = 2_i32
    Restrictionfacetmaxinclusive = 4_i32
    Restrictionfacetmininclusive = 8_i32
  end
  enum WcmUserStatus
    UnknownStatus = 0_i32
    UserRegistered = 1_i32
    UserUnregistered = 2_i32
    UserLoaded = 3_i32
    UserUnloaded = 4_i32
  end
  enum WcmNamespaceAccess
    ReadOnlyAccess = 1_i32
    ReadWriteAccess = 2_i32
  end

  @[Extern]
  record IItemEnumeratorVtbl,
    query_interface : Proc(IItemEnumerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IItemEnumerator*, UInt32),
    release : Proc(IItemEnumerator*, UInt32),
    current : Proc(IItemEnumerator*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IItemEnumerator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    reset : Proc(IItemEnumerator*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f7d7bb7-20b3-11da-81a5-0030f1642e3c")]
  record IItemEnumerator, lpVtbl : IItemEnumeratorVtbl* do
    GUID = LibC::GUID.new(0x9f7d7bb7_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
    def query_interface(this : IItemEnumerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IItemEnumerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IItemEnumerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def current(this : IItemEnumerator*, item : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.current.call(this, item)
    end
    def move_next(this : IItemEnumerator*, item_valid : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this, item_valid)
    end
    def reset(this : IItemEnumerator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record ISettingsIdentityVtbl,
    query_interface : Proc(ISettingsIdentity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISettingsIdentity*, UInt32),
    release : Proc(ISettingsIdentity*, UInt32),
    get_attribute : Proc(ISettingsIdentity*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_attribute : Proc(ISettingsIdentity*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_flags : Proc(ISettingsIdentity*, UInt32*, Win32cr::Foundation::HRESULT),
    set_flags : Proc(ISettingsIdentity*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f7d7bb6-20b3-11da-81a5-0030f1642e3c")]
  record ISettingsIdentity, lpVtbl : ISettingsIdentityVtbl* do
    GUID = LibC::GUID.new(0x9f7d7bb6_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
    def query_interface(this : ISettingsIdentity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISettingsIdentity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISettingsIdentity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attribute(this : ISettingsIdentity*, reserved : Void*, name : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, reserved, name, value)
    end
    def set_attribute(this : ISettingsIdentity*, reserved : Void*, name : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attribute.call(this, reserved, name, value)
    end
    def get_flags(this : ISettingsIdentity*, flags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, flags)
    end
    def set_flags(this : ISettingsIdentity*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, flags)
    end

  end

  @[Extern]
  record ITargetInfoVtbl,
    query_interface : Proc(ITargetInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITargetInfo*, UInt32),
    release : Proc(ITargetInfo*, UInt32),
    get_target_mode : Proc(ITargetInfo*, Win32cr::System::SettingsManagementInfrastructure::WcmTargetMode*, Win32cr::Foundation::HRESULT),
    set_target_mode : Proc(ITargetInfo*, Win32cr::System::SettingsManagementInfrastructure::WcmTargetMode, Win32cr::Foundation::HRESULT),
    get_temporary_store_location : Proc(ITargetInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_temporary_store_location : Proc(ITargetInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_target_id : Proc(ITargetInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_target_id : Proc(ITargetInfo*, LibC::GUID, Win32cr::Foundation::HRESULT),
    get_target_processor_architecture : Proc(ITargetInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_target_processor_architecture : Proc(ITargetInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITargetInfo*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_property : Proc(ITargetInfo*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(ITargetInfo*, Void**, Win32cr::Foundation::HRESULT),
    expand_target : Proc(ITargetInfo*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    expand_target_path : Proc(ITargetInfo*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_module_path : Proc(ITargetInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    load_module : Proc(ITargetInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HINSTANCE*, Win32cr::Foundation::HRESULT),
    set_wow64_context : Proc(ITargetInfo*, Win32cr::Foundation::PWSTR, UInt8*, Win32cr::Foundation::HRESULT),
    translate_wow64 : Proc(ITargetInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_schema_hive_location : Proc(ITargetInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_schema_hive_location : Proc(ITargetInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_schema_hive_mount_name : Proc(ITargetInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_schema_hive_mount_name : Proc(ITargetInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f7d7bb8-20b3-11da-81a5-0030f1642e3c")]
  record ITargetInfo, lpVtbl : ITargetInfoVtbl* do
    GUID = LibC::GUID.new(0x9f7d7bb8_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
    def query_interface(this : ITargetInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITargetInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITargetInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_target_mode(this : ITargetInfo*, target_mode : Win32cr::System::SettingsManagementInfrastructure::WcmTargetMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_mode.call(this, target_mode)
    end
    def set_target_mode(this : ITargetInfo*, target_mode : Win32cr::System::SettingsManagementInfrastructure::WcmTargetMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_mode.call(this, target_mode)
    end
    def get_temporary_store_location(this : ITargetInfo*, temporary_store_location : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_temporary_store_location.call(this, temporary_store_location)
    end
    def set_temporary_store_location(this : ITargetInfo*, temporary_store_location : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_temporary_store_location.call(this, temporary_store_location)
    end
    def get_target_id(this : ITargetInfo*, target_id : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_id.call(this, target_id)
    end
    def set_target_id(this : ITargetInfo*, target_id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_id.call(this, target_id)
    end
    def get_target_processor_architecture(this : ITargetInfo*, processor_architecture : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_processor_architecture.call(this, processor_architecture)
    end
    def set_target_processor_architecture(this : ITargetInfo*, processor_architecture : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_processor_architecture.call(this, processor_architecture)
    end
    def get_property(this : ITargetInfo*, offline : Win32cr::Foundation::BOOL, property : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, offline, property, value)
    end
    def set_property(this : ITargetInfo*, offline : Win32cr::Foundation::BOOL, property : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, offline, property, value)
    end
    def get_enumerator(this : ITargetInfo*, enumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, enumerator)
    end
    def expand_target(this : ITargetInfo*, offline : Win32cr::Foundation::BOOL, location : Win32cr::Foundation::PWSTR, expanded_location : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand_target.call(this, offline, location, expanded_location)
    end
    def expand_target_path(this : ITargetInfo*, offline : Win32cr::Foundation::BOOL, location : Win32cr::Foundation::PWSTR, expanded_location : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand_target_path.call(this, offline, location, expanded_location)
    end
    def set_module_path(this : ITargetInfo*, module__ : Win32cr::Foundation::PWSTR, path : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_module_path.call(this, module__, path)
    end
    def load_module(this : ITargetInfo*, module__ : Win32cr::Foundation::PWSTR, module_handle : Win32cr::Foundation::HINSTANCE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_module.call(this, module__, module_handle)
    end
    def set_wow64_context(this : ITargetInfo*, installer_module : Win32cr::Foundation::PWSTR, wow64_context : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wow64_context.call(this, installer_module, wow64_context)
    end
    def translate_wow64(this : ITargetInfo*, client_architecture : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR, translated_value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.translate_wow64.call(this, client_architecture, value, translated_value)
    end
    def set_schema_hive_location(this : ITargetInfo*, pwzHiveDir : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_schema_hive_location.call(this, pwzHiveDir)
    end
    def get_schema_hive_location(this : ITargetInfo*, pHiveLocation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_schema_hive_location.call(this, pHiveLocation)
    end
    def set_schema_hive_mount_name(this : ITargetInfo*, pwzMountName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_schema_hive_mount_name.call(this, pwzMountName)
    end
    def get_schema_hive_mount_name(this : ITargetInfo*, pMountName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_schema_hive_mount_name.call(this, pMountName)
    end

  end

  @[Extern]
  record ISettingsEngineVtbl,
    query_interface : Proc(ISettingsEngine*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISettingsEngine*, UInt32),
    release : Proc(ISettingsEngine*, UInt32),
    get_namespaces : Proc(ISettingsEngine*, Win32cr::System::SettingsManagementInfrastructure::WcmNamespaceEnumerationFlags, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_namespace : Proc(ISettingsEngine*, Void*, Win32cr::System::SettingsManagementInfrastructure::WcmNamespaceAccess, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_error_description : Proc(ISettingsEngine*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_settings_identity : Proc(ISettingsEngine*, Void**, Win32cr::Foundation::HRESULT),
    get_store_status : Proc(ISettingsEngine*, Void*, Win32cr::System::SettingsManagementInfrastructure::WcmUserStatus*, Win32cr::Foundation::HRESULT),
    load_store : Proc(ISettingsEngine*, UInt32, Win32cr::Foundation::HRESULT),
    unload_store : Proc(ISettingsEngine*, Void*, Win32cr::Foundation::HRESULT),
    register_namespace : Proc(ISettingsEngine*, Void*, Void*, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    unregister_namespace : Proc(ISettingsEngine*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    create_target_info : Proc(ISettingsEngine*, Void**, Win32cr::Foundation::HRESULT),
    get_target_info : Proc(ISettingsEngine*, Void**, Win32cr::Foundation::HRESULT),
    set_target_info : Proc(ISettingsEngine*, Void*, Win32cr::Foundation::HRESULT),
    create_settings_context : Proc(ISettingsEngine*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    set_settings_context : Proc(ISettingsEngine*, Void*, Win32cr::Foundation::HRESULT),
    apply_settings_context : Proc(ISettingsEngine*, Void*, Win32cr::Foundation::PWSTR**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_settings_context : Proc(ISettingsEngine*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f7d7bb9-20b3-11da-81a5-0030f1642e3c")]
  record ISettingsEngine, lpVtbl : ISettingsEngineVtbl* do
    GUID = LibC::GUID.new(0x9f7d7bb9_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
    def query_interface(this : ISettingsEngine*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISettingsEngine*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISettingsEngine*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_namespaces(this : ISettingsEngine*, flags : Win32cr::System::SettingsManagementInfrastructure::WcmNamespaceEnumerationFlags, reserved : Void*, namespaces : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_namespaces.call(this, flags, reserved, namespaces)
    end
    def get_namespace(this : ISettingsEngine*, settings_id : Void*, access : Win32cr::System::SettingsManagementInfrastructure::WcmNamespaceAccess, reserved : Void*, namespace_item : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_namespace.call(this, settings_id, access, reserved, namespace_item)
    end
    def get_error_description(this : ISettingsEngine*, h_result : Int32, message : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_description.call(this, h_result, message)
    end
    def create_settings_identity(this : ISettingsEngine*, settings_id : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_settings_identity.call(this, settings_id)
    end
    def get_store_status(this : ISettingsEngine*, reserved : Void*, status : Win32cr::System::SettingsManagementInfrastructure::WcmUserStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_store_status.call(this, reserved, status)
    end
    def load_store(this : ISettingsEngine*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_store.call(this, flags)
    end
    def unload_store(this : ISettingsEngine*, reserved : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unload_store.call(this, reserved)
    end
    def register_namespace(this : ISettingsEngine*, settings_id : Void*, stream : Void*, push_settings : Win32cr::Foundation::BOOL, results : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_namespace.call(this, settings_id, stream, push_settings, results)
    end
    def unregister_namespace(this : ISettingsEngine*, settings_id : Void*, remove_settings : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_namespace.call(this, settings_id, remove_settings)
    end
    def create_target_info(this : ISettingsEngine*, target : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_target_info.call(this, target)
    end
    def get_target_info(this : ISettingsEngine*, target : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_info.call(this, target)
    end
    def set_target_info(this : ISettingsEngine*, target : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_info.call(this, target)
    end
    def create_settings_context(this : ISettingsEngine*, flags : UInt32, reserved : Void*, settings_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_settings_context.call(this, flags, reserved, settings_context)
    end
    def set_settings_context(this : ISettingsEngine*, settings_context : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_settings_context.call(this, settings_context)
    end
    def apply_settings_context(this : ISettingsEngine*, settings_context : Void*, pppwzIdentities : Win32cr::Foundation::PWSTR**, pcIdentities : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_settings_context.call(this, settings_context, pppwzIdentities, pcIdentities)
    end
    def get_settings_context(this : ISettingsEngine*, settings_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_settings_context.call(this, settings_context)
    end

  end

  @[Extern]
  record ISettingsItemVtbl,
    query_interface : Proc(ISettingsItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISettingsItem*, UInt32),
    release : Proc(ISettingsItem*, UInt32),
    get_name : Proc(ISettingsItem*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ISettingsItem*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_value : Proc(ISettingsItem*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_setting_type : Proc(ISettingsItem*, Win32cr::System::SettingsManagementInfrastructure::WcmSettingType*, Win32cr::Foundation::HRESULT),
    get_data_type : Proc(ISettingsItem*, Win32cr::System::SettingsManagementInfrastructure::WcmDataType*, Win32cr::Foundation::HRESULT),
    get_value_raw : Proc(ISettingsItem*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    set_value_raw : Proc(ISettingsItem*, Int32, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    has_child : Proc(ISettingsItem*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    children : Proc(ISettingsItem*, Void**, Win32cr::Foundation::HRESULT),
    get_child : Proc(ISettingsItem*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_setting_by_path : Proc(ISettingsItem*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_setting_by_path : Proc(ISettingsItem*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    remove_setting_by_path : Proc(ISettingsItem*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_list_key_information : Proc(ISettingsItem*, Win32cr::Foundation::BSTR*, Win32cr::System::SettingsManagementInfrastructure::WcmDataType*, Win32cr::Foundation::HRESULT),
    create_list_element : Proc(ISettingsItem*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    remove_list_element : Proc(ISettingsItem*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    attributes : Proc(ISettingsItem*, Void**, Win32cr::Foundation::HRESULT),
    get_attribute : Proc(ISettingsItem*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_path : Proc(ISettingsItem*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restriction_facets : Proc(ISettingsItem*, Win32cr::System::SettingsManagementInfrastructure::WcmRestrictionFacets*, Win32cr::Foundation::HRESULT),
    get_restriction : Proc(ISettingsItem*, Win32cr::System::SettingsManagementInfrastructure::WcmRestrictionFacets, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_key_value : Proc(ISettingsItem*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f7d7bbb-20b3-11da-81a5-0030f1642e3c")]
  record ISettingsItem, lpVtbl : ISettingsItemVtbl* do
    GUID = LibC::GUID.new(0x9f7d7bbb_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
    def query_interface(this : ISettingsItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISettingsItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISettingsItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : ISettingsItem*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, name)
    end
    def get_value(this : ISettingsItem*, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, value)
    end
    def set_value(this : ISettingsItem*, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, value)
    end
    def get_setting_type(this : ISettingsItem*, type__ : Win32cr::System::SettingsManagementInfrastructure::WcmSettingType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_setting_type.call(this, type__)
    end
    def get_data_type(this : ISettingsItem*, type__ : Win32cr::System::SettingsManagementInfrastructure::WcmDataType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_type.call(this, type__)
    end
    def get_value_raw(this : ISettingsItem*, data : UInt8**, data_size : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value_raw.call(this, data, data_size)
    end
    def set_value_raw(this : ISettingsItem*, data_type : Int32, data : UInt8*, data_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value_raw.call(this, data_type, data, data_size)
    end
    def has_child(this : ISettingsItem*, item_has_child : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_child.call(this, item_has_child)
    end
    def children(this : ISettingsItem*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.children.call(this, children)
    end
    def get_child(this : ISettingsItem*, name : Win32cr::Foundation::PWSTR, child : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_child.call(this, name, child)
    end
    def get_setting_by_path(this : ISettingsItem*, path : Win32cr::Foundation::PWSTR, setting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_setting_by_path.call(this, path, setting)
    end
    def create_setting_by_path(this : ISettingsItem*, path : Win32cr::Foundation::PWSTR, setting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_setting_by_path.call(this, path, setting)
    end
    def remove_setting_by_path(this : ISettingsItem*, path : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_setting_by_path.call(this, path)
    end
    def get_list_key_information(this : ISettingsItem*, key_name : Win32cr::Foundation::BSTR*, data_type : Win32cr::System::SettingsManagementInfrastructure::WcmDataType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_list_key_information.call(this, key_name, data_type)
    end
    def create_list_element(this : ISettingsItem*, key_data : Win32cr::System::Com::VARIANT*, child : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_list_element.call(this, key_data, child)
    end
    def remove_list_element(this : ISettingsItem*, element_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_list_element.call(this, element_name)
    end
    def attributes(this : ISettingsItem*, attributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attributes.call(this, attributes)
    end
    def get_attribute(this : ISettingsItem*, name : Win32cr::Foundation::PWSTR, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, name, value)
    end
    def get_path(this : ISettingsItem*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, path)
    end
    def get_restriction_facets(this : ISettingsItem*, restriction_facets : Win32cr::System::SettingsManagementInfrastructure::WcmRestrictionFacets*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restriction_facets.call(this, restriction_facets)
    end
    def get_restriction(this : ISettingsItem*, restriction_facet : Win32cr::System::SettingsManagementInfrastructure::WcmRestrictionFacets, facet_data : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restriction.call(this, restriction_facet, facet_data)
    end
    def get_key_value(this : ISettingsItem*, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_key_value.call(this, value)
    end

  end

  @[Extern]
  record ISettingsNamespaceVtbl,
    query_interface : Proc(ISettingsNamespace*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISettingsNamespace*, UInt32),
    release : Proc(ISettingsNamespace*, UInt32),
    get_identity : Proc(ISettingsNamespace*, Void**, Win32cr::Foundation::HRESULT),
    settings : Proc(ISettingsNamespace*, Void**, Win32cr::Foundation::HRESULT),
    save : Proc(ISettingsNamespace*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    get_setting_by_path : Proc(ISettingsNamespace*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_setting_by_path : Proc(ISettingsNamespace*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    remove_setting_by_path : Proc(ISettingsNamespace*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_attribute : Proc(ISettingsNamespace*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f7d7bba-20b3-11da-81a5-0030f1642e3c")]
  record ISettingsNamespace, lpVtbl : ISettingsNamespaceVtbl* do
    GUID = LibC::GUID.new(0x9f7d7bba_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
    def query_interface(this : ISettingsNamespace*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISettingsNamespace*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISettingsNamespace*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_identity(this : ISettingsNamespace*, settings_id : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_identity.call(this, settings_id)
    end
    def settings(this : ISettingsNamespace*, settings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.settings.call(this, settings)
    end
    def save(this : ISettingsNamespace*, push_settings : Win32cr::Foundation::BOOL, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, push_settings, result)
    end
    def get_setting_by_path(this : ISettingsNamespace*, path : Win32cr::Foundation::PWSTR, setting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_setting_by_path.call(this, path, setting)
    end
    def create_setting_by_path(this : ISettingsNamespace*, path : Win32cr::Foundation::PWSTR, setting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_setting_by_path.call(this, path, setting)
    end
    def remove_setting_by_path(this : ISettingsNamespace*, path : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_setting_by_path.call(this, path)
    end
    def get_attribute(this : ISettingsNamespace*, name : Win32cr::Foundation::PWSTR, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, name, value)
    end

  end

  @[Extern]
  record ISettingsResultVtbl,
    query_interface : Proc(ISettingsResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISettingsResult*, UInt32),
    release : Proc(ISettingsResult*, UInt32),
    get_description : Proc(ISettingsResult*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_error_code : Proc(ISettingsResult*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_context_description : Proc(ISettingsResult*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_line : Proc(ISettingsResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_column : Proc(ISettingsResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_source : Proc(ISettingsResult*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f7d7bbc-20b3-11da-81a5-0030f1642e3c")]
  record ISettingsResult, lpVtbl : ISettingsResultVtbl* do
    GUID = LibC::GUID.new(0x9f7d7bbc_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
    def query_interface(this : ISettingsResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISettingsResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISettingsResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_description(this : ISettingsResult*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, description)
    end
    def get_error_code(this : ISettingsResult*, hrOut : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_code.call(this, hrOut)
    end
    def get_context_description(this : ISettingsResult*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_description.call(this, description)
    end
    def get_line(this : ISettingsResult*, dwLine : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line.call(this, dwLine)
    end
    def get_column(this : ISettingsResult*, dwColumn : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column.call(this, dwColumn)
    end
    def get_source(this : ISettingsResult*, file : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source.call(this, file)
    end

  end

  @[Extern]
  record ISettingsContextVtbl,
    query_interface : Proc(ISettingsContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISettingsContext*, UInt32),
    release : Proc(ISettingsContext*, UInt32),
    serialize : Proc(ISettingsContext*, Void*, Void*, Win32cr::Foundation::HRESULT),
    deserialize : Proc(ISettingsContext*, Void*, Void*, Void***, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_user_data : Proc(ISettingsContext*, Void*, Win32cr::Foundation::HRESULT),
    get_user_data : Proc(ISettingsContext*, Void**, Win32cr::Foundation::HRESULT),
    get_namespaces : Proc(ISettingsContext*, Void**, Win32cr::Foundation::HRESULT),
    get_stored_settings : Proc(ISettingsContext*, Void*, Void**, Void**, Void**, Win32cr::Foundation::HRESULT),
    revert_setting : Proc(ISettingsContext*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f7d7bbd-20b3-11da-81a5-0030f1642e3c")]
  record ISettingsContext, lpVtbl : ISettingsContextVtbl* do
    GUID = LibC::GUID.new(0x9f7d7bbd_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
    def query_interface(this : ISettingsContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISettingsContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISettingsContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : ISettingsContext*, pStream : Void*, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pStream, pTarget)
    end
    def deserialize(this : ISettingsContext*, pStream : Void*, pTarget : Void*, pppResults : Void***, pcResultCount : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deserialize.call(this, pStream, pTarget, pppResults, pcResultCount)
    end
    def set_user_data(this : ISettingsContext*, pUserData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_data.call(this, pUserData)
    end
    def get_user_data(this : ISettingsContext*, pUserData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_data.call(this, pUserData)
    end
    def get_namespaces(this : ISettingsContext*, ppNamespaceIds : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_namespaces.call(this, ppNamespaceIds)
    end
    def get_stored_settings(this : ISettingsContext*, pIdentity : Void*, ppAddedSettings : Void**, ppModifiedSettings : Void**, ppDeletedSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stored_settings.call(this, pIdentity, ppAddedSettings, ppModifiedSettings, ppDeletedSettings)
    end
    def revert_setting(this : ISettingsContext*, pIdentity : Void*, pwzSetting : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert_setting.call(this, pIdentity, pwzSetting)
    end

  end

end