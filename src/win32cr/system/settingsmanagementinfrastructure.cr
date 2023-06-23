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


  enum WcmTargetMode : Int32
    OfflineMode = 1
    OnlineMode = 2
  end

  enum WcmNamespaceEnumerationFlags : Int32
    SharedEnumeration = 1
    UserEnumeration = 2
    AllEnumeration = 3
  end

  enum WcmDataType : Int32
    Datatypebyte = 1
    Datatypesbyte = 2
    Datatypeuint16 = 3
    Datatypeint16 = 4
    Datatypeuint32 = 5
    Datatypeint32 = 6
    Datatypeuint64 = 7
    Datatypeint64 = 8
    Datatypeboolean = 11
    Datatypestring = 12
    Datatypeflagarray = 32768
  end

  enum WcmSettingType : Int32
    Settingtypescalar = 1
    Settingtypecomplex = 2
    Settingtypelist = 3
  end

  enum WcmRestrictionFacets : Int32
    Restrictionfacetmaxlength = 1
    Restrictionfacetenumeration = 2
    Restrictionfacetmaxinclusive = 4
    Restrictionfacetmininclusive = 8
  end

  enum WcmUserStatus : Int32
    UnknownStatus = 0
    UserRegistered = 1
    UserUnregistered = 2
    UserLoaded = 3
    UserUnloaded = 4
  end

  enum WcmNamespaceAccess : Int32
    ReadOnlyAccess = 1
    ReadWriteAccess = 2
  end


  struct IItemEnumeratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    current : UInt64
    move_next : UInt64
    reset : UInt64
  end

  IItemEnumerator_GUID = "9f7d7bb7-20b3-11da-81a5-0030f1642e3c"
  IID_IItemEnumerator = LibC::GUID.new(0x9f7d7bb7_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct IItemEnumerator
    lpVtbl : IItemEnumeratorVTbl*
  end

  struct ISettingsIdentityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attribute : UInt64
    set_attribute : UInt64
    get_flags : UInt64
    set_flags : UInt64
  end

  ISettingsIdentity_GUID = "9f7d7bb6-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsIdentity = LibC::GUID.new(0x9f7d7bb6_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsIdentity
    lpVtbl : ISettingsIdentityVTbl*
  end

  struct ITargetInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_target_mode : UInt64
    set_target_mode : UInt64
    get_temporary_store_location : UInt64
    set_temporary_store_location : UInt64
    get_target_id : UInt64
    set_target_id : UInt64
    get_target_processor_architecture : UInt64
    set_target_processor_architecture : UInt64
    get_property : UInt64
    set_property : UInt64
    get_enumerator : UInt64
    expand_target : UInt64
    expand_target_path : UInt64
    set_module_path : UInt64
    load_module : UInt64
    set_wow64_context : UInt64
    translate_wow64 : UInt64
    set_schema_hive_location : UInt64
    get_schema_hive_location : UInt64
    set_schema_hive_mount_name : UInt64
    get_schema_hive_mount_name : UInt64
  end

  ITargetInfo_GUID = "9f7d7bb8-20b3-11da-81a5-0030f1642e3c"
  IID_ITargetInfo = LibC::GUID.new(0x9f7d7bb8_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ITargetInfo
    lpVtbl : ITargetInfoVTbl*
  end

  struct ISettingsEngineVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_namespaces : UInt64
    get_namespace : UInt64
    get_error_description : UInt64
    create_settings_identity : UInt64
    get_store_status : UInt64
    load_store : UInt64
    unload_store : UInt64
    register_namespace : UInt64
    unregister_namespace : UInt64
    create_target_info : UInt64
    get_target_info : UInt64
    set_target_info : UInt64
    create_settings_context : UInt64
    set_settings_context : UInt64
    apply_settings_context : UInt64
    get_settings_context : UInt64
  end

  ISettingsEngine_GUID = "9f7d7bb9-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsEngine = LibC::GUID.new(0x9f7d7bb9_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsEngine
    lpVtbl : ISettingsEngineVTbl*
  end

  struct ISettingsItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_value : UInt64
    set_value : UInt64
    get_setting_type : UInt64
    get_data_type : UInt64
    get_value_raw : UInt64
    set_value_raw : UInt64
    has_child : UInt64
    children : UInt64
    get_child : UInt64
    get_setting_by_path : UInt64
    create_setting_by_path : UInt64
    remove_setting_by_path : UInt64
    get_list_key_information : UInt64
    create_list_element : UInt64
    remove_list_element : UInt64
    attributes : UInt64
    get_attribute : UInt64
    get_path : UInt64
    get_restriction_facets : UInt64
    get_restriction : UInt64
    get_key_value : UInt64
  end

  ISettingsItem_GUID = "9f7d7bbb-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsItem = LibC::GUID.new(0x9f7d7bbb_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsItem
    lpVtbl : ISettingsItemVTbl*
  end

  struct ISettingsNamespaceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_identity : UInt64
    settings : UInt64
    save : UInt64
    get_setting_by_path : UInt64
    create_setting_by_path : UInt64
    remove_setting_by_path : UInt64
    get_attribute : UInt64
  end

  ISettingsNamespace_GUID = "9f7d7bba-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsNamespace = LibC::GUID.new(0x9f7d7bba_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsNamespace
    lpVtbl : ISettingsNamespaceVTbl*
  end

  struct ISettingsResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_description : UInt64
    get_error_code : UInt64
    get_context_description : UInt64
    get_line : UInt64
    get_column : UInt64
    get_source : UInt64
  end

  ISettingsResult_GUID = "9f7d7bbc-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsResult = LibC::GUID.new(0x9f7d7bbc_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsResult
    lpVtbl : ISettingsResultVTbl*
  end

  struct ISettingsContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    deserialize : UInt64
    set_user_data : UInt64
    get_user_data : UInt64
    get_namespaces : UInt64
    get_stored_settings : UInt64
    revert_setting : UInt64
  end

  ISettingsContext_GUID = "9f7d7bbd-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsContext = LibC::GUID.new(0x9f7d7bbd_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsContext
    lpVtbl : ISettingsContextVTbl*
  end

end
struct LibWin32::IItemEnumerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def current(item : VARIANT*) : HRESULT
    @lpVtbl.value.current.unsafe_as(Proc(VARIANT*, HRESULT)).call(item)
  end
  def move_next(itemvalid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(itemvalid)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISettingsIdentity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attribute(reserved : Void*, name : LibC::LPWSTR, value : UInt8**) : HRESULT
    @lpVtbl.value.get_attribute.unsafe_as(Proc(Void*, LibC::LPWSTR, UInt8**, HRESULT)).call(reserved, name, value)
  end
  def set_attribute(reserved : Void*, name : LibC::LPWSTR, value : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_attribute.unsafe_as(Proc(Void*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(reserved, name, value)
  end
  def get_flags(flags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(flags)
  end
  def set_flags(flags : UInt32) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
end
struct LibWin32::ITargetInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_target_mode(targetmode : WcmTargetMode*) : HRESULT
    @lpVtbl.value.get_target_mode.unsafe_as(Proc(WcmTargetMode*, HRESULT)).call(targetmode)
  end
  def set_target_mode(targetmode : WcmTargetMode) : HRESULT
    @lpVtbl.value.set_target_mode.unsafe_as(Proc(WcmTargetMode, HRESULT)).call(targetmode)
  end
  def get_temporary_store_location(temporarystorelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_temporary_store_location.unsafe_as(Proc(UInt8**, HRESULT)).call(temporarystorelocation)
  end
  def set_temporary_store_location(temporarystorelocation : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_temporary_store_location.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(temporarystorelocation)
  end
  def get_target_id(targetid : UInt8**) : HRESULT
    @lpVtbl.value.get_target_id.unsafe_as(Proc(UInt8**, HRESULT)).call(targetid)
  end
  def set_target_id(targetid : Guid) : HRESULT
    @lpVtbl.value.set_target_id.unsafe_as(Proc(Guid, HRESULT)).call(targetid)
  end
  def get_target_processor_architecture(processorarchitecture : UInt8**) : HRESULT
    @lpVtbl.value.get_target_processor_architecture.unsafe_as(Proc(UInt8**, HRESULT)).call(processorarchitecture)
  end
  def set_target_processor_architecture(processorarchitecture : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_target_processor_architecture.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(processorarchitecture)
  end
  def get_property(offline : LibC::BOOL, property : LibC::LPWSTR, value : UInt8**) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR, UInt8**, HRESULT)).call(offline, property, value)
  end
  def set_property(offline : LibC::BOOL, property : LibC::LPWSTR, value : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(offline, property, value)
  end
  def get_enumerator(enumerator : IItemEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.unsafe_as(Proc(IItemEnumerator*, HRESULT)).call(enumerator)
  end
  def expand_target(offline : LibC::BOOL, location : LibC::LPWSTR, expandedlocation : UInt8**) : HRESULT
    @lpVtbl.value.expand_target.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR, UInt8**, HRESULT)).call(offline, location, expandedlocation)
  end
  def expand_target_path(offline : LibC::BOOL, location : LibC::LPWSTR, expandedlocation : UInt8**) : HRESULT
    @lpVtbl.value.expand_target_path.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR, UInt8**, HRESULT)).call(offline, location, expandedlocation)
  end
  def set_module_path(module_ : LibC::LPWSTR, path : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_module_path.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(module_, path)
  end
  def load_module(module_ : LibC::LPWSTR, modulehandle : HINSTANCE*) : HRESULT
    @lpVtbl.value.load_module.unsafe_as(Proc(LibC::LPWSTR, HINSTANCE*, HRESULT)).call(module_, modulehandle)
  end
  def set_wow64_context(installermodule : LibC::LPWSTR, wow64context : UInt8*) : HRESULT
    @lpVtbl.value.set_wow64_context.unsafe_as(Proc(LibC::LPWSTR, UInt8*, HRESULT)).call(installermodule, wow64context)
  end
  def translate_wow64(clientarchitecture : LibC::LPWSTR, value : LibC::LPWSTR, translatedvalue : UInt8**) : HRESULT
    @lpVtbl.value.translate_wow64.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt8**, HRESULT)).call(clientarchitecture, value, translatedvalue)
  end
  def set_schema_hive_location(pwzhivedir : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_schema_hive_location.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwzhivedir)
  end
  def get_schema_hive_location(phivelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_schema_hive_location.unsafe_as(Proc(UInt8**, HRESULT)).call(phivelocation)
  end
  def set_schema_hive_mount_name(pwzmountname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_schema_hive_mount_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwzmountname)
  end
  def get_schema_hive_mount_name(pmountname : UInt8**) : HRESULT
    @lpVtbl.value.get_schema_hive_mount_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pmountname)
  end
end
struct LibWin32::ISettingsEngine
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_namespaces(flags : WcmNamespaceEnumerationFlags, reserved : Void*, namespaces : IItemEnumerator*) : HRESULT
    @lpVtbl.value.get_namespaces.unsafe_as(Proc(WcmNamespaceEnumerationFlags, Void*, IItemEnumerator*, HRESULT)).call(flags, reserved, namespaces)
  end
  def get_namespace(settingsid : ISettingsIdentity, access : WcmNamespaceAccess, reserved : Void*, namespaceitem : ISettingsNamespace*) : HRESULT
    @lpVtbl.value.get_namespace.unsafe_as(Proc(ISettingsIdentity, WcmNamespaceAccess, Void*, ISettingsNamespace*, HRESULT)).call(settingsid, access, reserved, namespaceitem)
  end
  def get_error_description(hresult : Int32, message : UInt8**) : HRESULT
    @lpVtbl.value.get_error_description.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(hresult, message)
  end
  def create_settings_identity(settingsid : ISettingsIdentity*) : HRESULT
    @lpVtbl.value.create_settings_identity.unsafe_as(Proc(ISettingsIdentity*, HRESULT)).call(settingsid)
  end
  def get_store_status(reserved : Void*, status : WcmUserStatus*) : HRESULT
    @lpVtbl.value.get_store_status.unsafe_as(Proc(Void*, WcmUserStatus*, HRESULT)).call(reserved, status)
  end
  def load_store(flags : UInt32) : HRESULT
    @lpVtbl.value.load_store.unsafe_as(Proc(UInt32, HRESULT)).call(flags)
  end
  def unload_store(reserved : Void*) : HRESULT
    @lpVtbl.value.unload_store.unsafe_as(Proc(Void*, HRESULT)).call(reserved)
  end
  def register_namespace(settingsid : ISettingsIdentity, stream : IStream, pushsettings : LibC::BOOL, results : VARIANT*) : HRESULT
    @lpVtbl.value.register_namespace.unsafe_as(Proc(ISettingsIdentity, IStream, LibC::BOOL, VARIANT*, HRESULT)).call(settingsid, stream, pushsettings, results)
  end
  def unregister_namespace(settingsid : ISettingsIdentity, removesettings : LibC::BOOL) : HRESULT
    @lpVtbl.value.unregister_namespace.unsafe_as(Proc(ISettingsIdentity, LibC::BOOL, HRESULT)).call(settingsid, removesettings)
  end
  def create_target_info(target : ITargetInfo*) : HRESULT
    @lpVtbl.value.create_target_info.unsafe_as(Proc(ITargetInfo*, HRESULT)).call(target)
  end
  def get_target_info(target : ITargetInfo*) : HRESULT
    @lpVtbl.value.get_target_info.unsafe_as(Proc(ITargetInfo*, HRESULT)).call(target)
  end
  def set_target_info(target : ITargetInfo) : HRESULT
    @lpVtbl.value.set_target_info.unsafe_as(Proc(ITargetInfo, HRESULT)).call(target)
  end
  def create_settings_context(flags : UInt32, reserved : Void*, settingscontext : ISettingsContext*) : HRESULT
    @lpVtbl.value.create_settings_context.unsafe_as(Proc(UInt32, Void*, ISettingsContext*, HRESULT)).call(flags, reserved, settingscontext)
  end
  def set_settings_context(settingscontext : ISettingsContext) : HRESULT
    @lpVtbl.value.set_settings_context.unsafe_as(Proc(ISettingsContext, HRESULT)).call(settingscontext)
  end
  def apply_settings_context(settingscontext : ISettingsContext, pppwzidentities : LibC::LPWSTR**, pcidentities : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.apply_settings_context.unsafe_as(Proc(ISettingsContext, LibC::LPWSTR**, LibC::UINT_PTR*, HRESULT)).call(settingscontext, pppwzidentities, pcidentities)
  end
  def get_settings_context(settingscontext : ISettingsContext*) : HRESULT
    @lpVtbl.value.get_settings_context.unsafe_as(Proc(ISettingsContext*, HRESULT)).call(settingscontext)
  end
end
struct LibWin32::ISettingsItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_value(value : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(value)
  end
  def set_value(value : VARIANT*) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(value)
  end
  def get_setting_type(type : WcmSettingType*) : HRESULT
    @lpVtbl.value.get_setting_type.unsafe_as(Proc(WcmSettingType*, HRESULT)).call(type)
  end
  def get_data_type(type : WcmDataType*) : HRESULT
    @lpVtbl.value.get_data_type.unsafe_as(Proc(WcmDataType*, HRESULT)).call(type)
  end
  def get_value_raw(data : UInt8**, datasize : UInt32*) : HRESULT
    @lpVtbl.value.get_value_raw.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(data, datasize)
  end
  def set_value_raw(datatype : Int32, data : UInt8*, datasize : UInt32) : HRESULT
    @lpVtbl.value.set_value_raw.unsafe_as(Proc(Int32, UInt8*, UInt32, HRESULT)).call(datatype, data, datasize)
  end
  def has_child(itemhaschild : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_child.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(itemhaschild)
  end
  def children(children : IItemEnumerator*) : HRESULT
    @lpVtbl.value.children.unsafe_as(Proc(IItemEnumerator*, HRESULT)).call(children)
  end
  def get_child(name : LibC::LPWSTR, child : ISettingsItem*) : HRESULT
    @lpVtbl.value.get_child.unsafe_as(Proc(LibC::LPWSTR, ISettingsItem*, HRESULT)).call(name, child)
  end
  def get_setting_by_path(path : LibC::LPWSTR, setting : ISettingsItem*) : HRESULT
    @lpVtbl.value.get_setting_by_path.unsafe_as(Proc(LibC::LPWSTR, ISettingsItem*, HRESULT)).call(path, setting)
  end
  def create_setting_by_path(path : LibC::LPWSTR, setting : ISettingsItem*) : HRESULT
    @lpVtbl.value.create_setting_by_path.unsafe_as(Proc(LibC::LPWSTR, ISettingsItem*, HRESULT)).call(path, setting)
  end
  def remove_setting_by_path(path : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_setting_by_path.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(path)
  end
  def get_list_key_information(keyname : UInt8**, datatype : WcmDataType*) : HRESULT
    @lpVtbl.value.get_list_key_information.unsafe_as(Proc(UInt8**, WcmDataType*, HRESULT)).call(keyname, datatype)
  end
  def create_list_element(keydata : VARIANT*, child : ISettingsItem*) : HRESULT
    @lpVtbl.value.create_list_element.unsafe_as(Proc(VARIANT*, ISettingsItem*, HRESULT)).call(keydata, child)
  end
  def remove_list_element(elementname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_list_element.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(elementname)
  end
  def attributes(attributes : IItemEnumerator*) : HRESULT
    @lpVtbl.value.attributes.unsafe_as(Proc(IItemEnumerator*, HRESULT)).call(attributes)
  end
  def get_attribute(name : LibC::LPWSTR, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute.unsafe_as(Proc(LibC::LPWSTR, VARIANT*, HRESULT)).call(name, value)
  end
  def get_path(path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_restriction_facets(restrictionfacets : WcmRestrictionFacets*) : HRESULT
    @lpVtbl.value.get_restriction_facets.unsafe_as(Proc(WcmRestrictionFacets*, HRESULT)).call(restrictionfacets)
  end
  def get_restriction(restrictionfacet : WcmRestrictionFacets, facetdata : VARIANT*) : HRESULT
    @lpVtbl.value.get_restriction.unsafe_as(Proc(WcmRestrictionFacets, VARIANT*, HRESULT)).call(restrictionfacet, facetdata)
  end
  def get_key_value(value : VARIANT*) : HRESULT
    @lpVtbl.value.get_key_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(value)
  end
end
struct LibWin32::ISettingsNamespace
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_identity(settingsid : ISettingsIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(ISettingsIdentity*, HRESULT)).call(settingsid)
  end
  def settings(settings : IItemEnumerator*) : HRESULT
    @lpVtbl.value.settings.unsafe_as(Proc(IItemEnumerator*, HRESULT)).call(settings)
  end
  def save(pushsettings : LibC::BOOL, result : ISettingsResult*) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(LibC::BOOL, ISettingsResult*, HRESULT)).call(pushsettings, result)
  end
  def get_setting_by_path(path : LibC::LPWSTR, setting : ISettingsItem*) : HRESULT
    @lpVtbl.value.get_setting_by_path.unsafe_as(Proc(LibC::LPWSTR, ISettingsItem*, HRESULT)).call(path, setting)
  end
  def create_setting_by_path(path : LibC::LPWSTR, setting : ISettingsItem*) : HRESULT
    @lpVtbl.value.create_setting_by_path.unsafe_as(Proc(LibC::LPWSTR, ISettingsItem*, HRESULT)).call(path, setting)
  end
  def remove_setting_by_path(path : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_setting_by_path.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(path)
  end
  def get_attribute(name : LibC::LPWSTR, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute.unsafe_as(Proc(LibC::LPWSTR, VARIANT*, HRESULT)).call(name, value)
  end
end
struct LibWin32::ISettingsResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def get_error_code(hrout : HRESULT*) : HRESULT
    @lpVtbl.value.get_error_code.unsafe_as(Proc(HRESULT*, HRESULT)).call(hrout)
  end
  def get_context_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_context_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def get_line(dwline : UInt32*) : HRESULT
    @lpVtbl.value.get_line.unsafe_as(Proc(UInt32*, HRESULT)).call(dwline)
  end
  def get_column(dwcolumn : UInt32*) : HRESULT
    @lpVtbl.value.get_column.unsafe_as(Proc(UInt32*, HRESULT)).call(dwcolumn)
  end
  def get_source(file : UInt8**) : HRESULT
    @lpVtbl.value.get_source.unsafe_as(Proc(UInt8**, HRESULT)).call(file)
  end
end
struct LibWin32::ISettingsContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pstream : IStream, ptarget : ITargetInfo) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(IStream, ITargetInfo, HRESULT)).call(pstream, ptarget)
  end
  def deserialize(pstream : IStream, ptarget : ITargetInfo, pppresults : ISettingsResult**, pcresultcount : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.deserialize.unsafe_as(Proc(IStream, ITargetInfo, ISettingsResult**, LibC::UINT_PTR*, HRESULT)).call(pstream, ptarget, pppresults, pcresultcount)
  end
  def set_user_data(puserdata : Void*) : HRESULT
    @lpVtbl.value.set_user_data.unsafe_as(Proc(Void*, HRESULT)).call(puserdata)
  end
  def get_user_data(puserdata : Void**) : HRESULT
    @lpVtbl.value.get_user_data.unsafe_as(Proc(Void**, HRESULT)).call(puserdata)
  end
  def get_namespaces(ppnamespaceids : IItemEnumerator*) : HRESULT
    @lpVtbl.value.get_namespaces.unsafe_as(Proc(IItemEnumerator*, HRESULT)).call(ppnamespaceids)
  end
  def get_stored_settings(pidentity : ISettingsIdentity, ppaddedsettings : IItemEnumerator*, ppmodifiedsettings : IItemEnumerator*, ppdeletedsettings : IItemEnumerator*) : HRESULT
    @lpVtbl.value.get_stored_settings.unsafe_as(Proc(ISettingsIdentity, IItemEnumerator*, IItemEnumerator*, IItemEnumerator*, HRESULT)).call(pidentity, ppaddedsettings, ppmodifiedsettings, ppdeletedsettings)
  end
  def revert_setting(pidentity : ISettingsIdentity, pwzsetting : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.revert_setting.unsafe_as(Proc(ISettingsIdentity, LibC::LPWSTR, HRESULT)).call(pidentity, pwzsetting)
  end
end
