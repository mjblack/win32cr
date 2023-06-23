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
    query_interface : Proc(IItemEnumerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IItemEnumerator*, UInt32)
    release : Proc(IItemEnumerator*, UInt32)
    current : Proc(IItemEnumerator*, VARIANT*, HRESULT)
    move_next : Proc(IItemEnumerator*, LibC::BOOL*, HRESULT)
    reset : Proc(IItemEnumerator*, HRESULT)
  end

  IItemEnumerator_GUID = "9f7d7bb7-20b3-11da-81a5-0030f1642e3c"
  IID_IItemEnumerator = LibC::GUID.new(0x9f7d7bb7_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct IItemEnumerator
    lpVtbl : IItemEnumeratorVTbl*
  end

  struct ISettingsIdentityVTbl
    query_interface : Proc(ISettingsIdentity*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISettingsIdentity*, UInt32)
    release : Proc(ISettingsIdentity*, UInt32)
    get_attribute : Proc(ISettingsIdentity*, Void*, LibC::LPWSTR, UInt8**, HRESULT)
    set_attribute : Proc(ISettingsIdentity*, Void*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_flags : Proc(ISettingsIdentity*, UInt32*, HRESULT)
    set_flags : Proc(ISettingsIdentity*, UInt32, HRESULT)
  end

  ISettingsIdentity_GUID = "9f7d7bb6-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsIdentity = LibC::GUID.new(0x9f7d7bb6_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsIdentity
    lpVtbl : ISettingsIdentityVTbl*
  end

  struct ITargetInfoVTbl
    query_interface : Proc(ITargetInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITargetInfo*, UInt32)
    release : Proc(ITargetInfo*, UInt32)
    get_target_mode : Proc(ITargetInfo*, WcmTargetMode*, HRESULT)
    set_target_mode : Proc(ITargetInfo*, WcmTargetMode, HRESULT)
    get_temporary_store_location : Proc(ITargetInfo*, UInt8**, HRESULT)
    set_temporary_store_location : Proc(ITargetInfo*, LibC::LPWSTR, HRESULT)
    get_target_id : Proc(ITargetInfo*, UInt8**, HRESULT)
    set_target_id : Proc(ITargetInfo*, Guid, HRESULT)
    get_target_processor_architecture : Proc(ITargetInfo*, UInt8**, HRESULT)
    set_target_processor_architecture : Proc(ITargetInfo*, LibC::LPWSTR, HRESULT)
    get_property : Proc(ITargetInfo*, LibC::BOOL, LibC::LPWSTR, UInt8**, HRESULT)
    set_property : Proc(ITargetInfo*, LibC::BOOL, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_enumerator : Proc(ITargetInfo*, IItemEnumerator*, HRESULT)
    expand_target : Proc(ITargetInfo*, LibC::BOOL, LibC::LPWSTR, UInt8**, HRESULT)
    expand_target_path : Proc(ITargetInfo*, LibC::BOOL, LibC::LPWSTR, UInt8**, HRESULT)
    set_module_path : Proc(ITargetInfo*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    load_module : Proc(ITargetInfo*, LibC::LPWSTR, HINSTANCE*, HRESULT)
    set_wow64_context : Proc(ITargetInfo*, LibC::LPWSTR, UInt8*, HRESULT)
    translate_wow64 : Proc(ITargetInfo*, LibC::LPWSTR, LibC::LPWSTR, UInt8**, HRESULT)
    set_schema_hive_location : Proc(ITargetInfo*, LibC::LPWSTR, HRESULT)
    get_schema_hive_location : Proc(ITargetInfo*, UInt8**, HRESULT)
    set_schema_hive_mount_name : Proc(ITargetInfo*, LibC::LPWSTR, HRESULT)
    get_schema_hive_mount_name : Proc(ITargetInfo*, UInt8**, HRESULT)
  end

  ITargetInfo_GUID = "9f7d7bb8-20b3-11da-81a5-0030f1642e3c"
  IID_ITargetInfo = LibC::GUID.new(0x9f7d7bb8_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ITargetInfo
    lpVtbl : ITargetInfoVTbl*
  end

  struct ISettingsEngineVTbl
    query_interface : Proc(ISettingsEngine*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISettingsEngine*, UInt32)
    release : Proc(ISettingsEngine*, UInt32)
    get_namespaces : Proc(ISettingsEngine*, WcmNamespaceEnumerationFlags, Void*, IItemEnumerator*, HRESULT)
    get_namespace : Proc(ISettingsEngine*, ISettingsIdentity, WcmNamespaceAccess, Void*, ISettingsNamespace*, HRESULT)
    get_error_description : Proc(ISettingsEngine*, Int32, UInt8**, HRESULT)
    create_settings_identity : Proc(ISettingsEngine*, ISettingsIdentity*, HRESULT)
    get_store_status : Proc(ISettingsEngine*, Void*, WcmUserStatus*, HRESULT)
    load_store : Proc(ISettingsEngine*, UInt32, HRESULT)
    unload_store : Proc(ISettingsEngine*, Void*, HRESULT)
    register_namespace : Proc(ISettingsEngine*, ISettingsIdentity, IStream, LibC::BOOL, VARIANT*, HRESULT)
    unregister_namespace : Proc(ISettingsEngine*, ISettingsIdentity, LibC::BOOL, HRESULT)
    create_target_info : Proc(ISettingsEngine*, ITargetInfo*, HRESULT)
    get_target_info : Proc(ISettingsEngine*, ITargetInfo*, HRESULT)
    set_target_info : Proc(ISettingsEngine*, ITargetInfo, HRESULT)
    create_settings_context : Proc(ISettingsEngine*, UInt32, Void*, ISettingsContext*, HRESULT)
    set_settings_context : Proc(ISettingsEngine*, ISettingsContext, HRESULT)
    apply_settings_context : Proc(ISettingsEngine*, ISettingsContext, LibC::LPWSTR**, LibC::UINT_PTR*, HRESULT)
    get_settings_context : Proc(ISettingsEngine*, ISettingsContext*, HRESULT)
  end

  ISettingsEngine_GUID = "9f7d7bb9-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsEngine = LibC::GUID.new(0x9f7d7bb9_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsEngine
    lpVtbl : ISettingsEngineVTbl*
  end

  struct ISettingsItemVTbl
    query_interface : Proc(ISettingsItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISettingsItem*, UInt32)
    release : Proc(ISettingsItem*, UInt32)
    get_name : Proc(ISettingsItem*, UInt8**, HRESULT)
    get_value : Proc(ISettingsItem*, VARIANT*, HRESULT)
    set_value : Proc(ISettingsItem*, VARIANT*, HRESULT)
    get_setting_type : Proc(ISettingsItem*, WcmSettingType*, HRESULT)
    get_data_type : Proc(ISettingsItem*, WcmDataType*, HRESULT)
    get_value_raw : Proc(ISettingsItem*, UInt8**, UInt32*, HRESULT)
    set_value_raw : Proc(ISettingsItem*, Int32, UInt8*, UInt32, HRESULT)
    has_child : Proc(ISettingsItem*, LibC::BOOL*, HRESULT)
    children : Proc(ISettingsItem*, IItemEnumerator*, HRESULT)
    get_child : Proc(ISettingsItem*, LibC::LPWSTR, ISettingsItem*, HRESULT)
    get_setting_by_path : Proc(ISettingsItem*, LibC::LPWSTR, ISettingsItem*, HRESULT)
    create_setting_by_path : Proc(ISettingsItem*, LibC::LPWSTR, ISettingsItem*, HRESULT)
    remove_setting_by_path : Proc(ISettingsItem*, LibC::LPWSTR, HRESULT)
    get_list_key_information : Proc(ISettingsItem*, UInt8**, WcmDataType*, HRESULT)
    create_list_element : Proc(ISettingsItem*, VARIANT*, ISettingsItem*, HRESULT)
    remove_list_element : Proc(ISettingsItem*, LibC::LPWSTR, HRESULT)
    attributes : Proc(ISettingsItem*, IItemEnumerator*, HRESULT)
    get_attribute : Proc(ISettingsItem*, LibC::LPWSTR, VARIANT*, HRESULT)
    get_path : Proc(ISettingsItem*, UInt8**, HRESULT)
    get_restriction_facets : Proc(ISettingsItem*, WcmRestrictionFacets*, HRESULT)
    get_restriction : Proc(ISettingsItem*, WcmRestrictionFacets, VARIANT*, HRESULT)
    get_key_value : Proc(ISettingsItem*, VARIANT*, HRESULT)
  end

  ISettingsItem_GUID = "9f7d7bbb-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsItem = LibC::GUID.new(0x9f7d7bbb_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsItem
    lpVtbl : ISettingsItemVTbl*
  end

  struct ISettingsNamespaceVTbl
    query_interface : Proc(ISettingsNamespace*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISettingsNamespace*, UInt32)
    release : Proc(ISettingsNamespace*, UInt32)
    get_identity : Proc(ISettingsNamespace*, ISettingsIdentity*, HRESULT)
    settings : Proc(ISettingsNamespace*, IItemEnumerator*, HRESULT)
    save : Proc(ISettingsNamespace*, LibC::BOOL, ISettingsResult*, HRESULT)
    get_setting_by_path : Proc(ISettingsNamespace*, LibC::LPWSTR, ISettingsItem*, HRESULT)
    create_setting_by_path : Proc(ISettingsNamespace*, LibC::LPWSTR, ISettingsItem*, HRESULT)
    remove_setting_by_path : Proc(ISettingsNamespace*, LibC::LPWSTR, HRESULT)
    get_attribute : Proc(ISettingsNamespace*, LibC::LPWSTR, VARIANT*, HRESULT)
  end

  ISettingsNamespace_GUID = "9f7d7bba-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsNamespace = LibC::GUID.new(0x9f7d7bba_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsNamespace
    lpVtbl : ISettingsNamespaceVTbl*
  end

  struct ISettingsResultVTbl
    query_interface : Proc(ISettingsResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISettingsResult*, UInt32)
    release : Proc(ISettingsResult*, UInt32)
    get_description : Proc(ISettingsResult*, UInt8**, HRESULT)
    get_error_code : Proc(ISettingsResult*, HRESULT*, HRESULT)
    get_context_description : Proc(ISettingsResult*, UInt8**, HRESULT)
    get_line : Proc(ISettingsResult*, UInt32*, HRESULT)
    get_column : Proc(ISettingsResult*, UInt32*, HRESULT)
    get_source : Proc(ISettingsResult*, UInt8**, HRESULT)
  end

  ISettingsResult_GUID = "9f7d7bbc-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsResult = LibC::GUID.new(0x9f7d7bbc_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsResult
    lpVtbl : ISettingsResultVTbl*
  end

  struct ISettingsContextVTbl
    query_interface : Proc(ISettingsContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISettingsContext*, UInt32)
    release : Proc(ISettingsContext*, UInt32)
    serialize : Proc(ISettingsContext*, IStream, ITargetInfo, HRESULT)
    deserialize : Proc(ISettingsContext*, IStream, ITargetInfo, ISettingsResult**, LibC::UINT_PTR*, HRESULT)
    set_user_data : Proc(ISettingsContext*, Void*, HRESULT)
    get_user_data : Proc(ISettingsContext*, Void**, HRESULT)
    get_namespaces : Proc(ISettingsContext*, IItemEnumerator*, HRESULT)
    get_stored_settings : Proc(ISettingsContext*, ISettingsIdentity, IItemEnumerator*, IItemEnumerator*, IItemEnumerator*, HRESULT)
    revert_setting : Proc(ISettingsContext*, ISettingsIdentity, LibC::LPWSTR, HRESULT)
  end

  ISettingsContext_GUID = "9f7d7bbd-20b3-11da-81a5-0030f1642e3c"
  IID_ISettingsContext = LibC::GUID.new(0x9f7d7bbd_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])
  struct ISettingsContext
    lpVtbl : ISettingsContextVTbl*
  end

end
struct LibWin32::IItemEnumerator
  def query_interface(this : IItemEnumerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IItemEnumerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IItemEnumerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def current(this : IItemEnumerator*, item : VARIANT*) : HRESULT
    @lpVtbl.value.current.call(this, item)
  end
  def move_next(this : IItemEnumerator*, itemvalid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.move_next.call(this, itemvalid)
  end
  def reset(this : IItemEnumerator*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
end
struct LibWin32::ISettingsIdentity
  def query_interface(this : ISettingsIdentity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISettingsIdentity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISettingsIdentity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_attribute(this : ISettingsIdentity*, reserved : Void*, name : LibC::LPWSTR, value : UInt8**) : HRESULT
    @lpVtbl.value.get_attribute.call(this, reserved, name, value)
  end
  def set_attribute(this : ISettingsIdentity*, reserved : Void*, name : LibC::LPWSTR, value : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_attribute.call(this, reserved, name, value)
  end
  def get_flags(this : ISettingsIdentity*, flags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.call(this, flags)
  end
  def set_flags(this : ISettingsIdentity*, flags : UInt32) : HRESULT
    @lpVtbl.value.set_flags.call(this, flags)
  end
end
struct LibWin32::ITargetInfo
  def query_interface(this : ITargetInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITargetInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITargetInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_target_mode(this : ITargetInfo*, targetmode : WcmTargetMode*) : HRESULT
    @lpVtbl.value.get_target_mode.call(this, targetmode)
  end
  def set_target_mode(this : ITargetInfo*, targetmode : WcmTargetMode) : HRESULT
    @lpVtbl.value.set_target_mode.call(this, targetmode)
  end
  def get_temporary_store_location(this : ITargetInfo*, temporarystorelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_temporary_store_location.call(this, temporarystorelocation)
  end
  def set_temporary_store_location(this : ITargetInfo*, temporarystorelocation : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_temporary_store_location.call(this, temporarystorelocation)
  end
  def get_target_id(this : ITargetInfo*, targetid : UInt8**) : HRESULT
    @lpVtbl.value.get_target_id.call(this, targetid)
  end
  def set_target_id(this : ITargetInfo*, targetid : Guid) : HRESULT
    @lpVtbl.value.set_target_id.call(this, targetid)
  end
  def get_target_processor_architecture(this : ITargetInfo*, processorarchitecture : UInt8**) : HRESULT
    @lpVtbl.value.get_target_processor_architecture.call(this, processorarchitecture)
  end
  def set_target_processor_architecture(this : ITargetInfo*, processorarchitecture : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_target_processor_architecture.call(this, processorarchitecture)
  end
  def get_property(this : ITargetInfo*, offline : LibC::BOOL, property : LibC::LPWSTR, value : UInt8**) : HRESULT
    @lpVtbl.value.get_property.call(this, offline, property, value)
  end
  def set_property(this : ITargetInfo*, offline : LibC::BOOL, property : LibC::LPWSTR, value : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_property.call(this, offline, property, value)
  end
  def get_enumerator(this : ITargetInfo*, enumerator : IItemEnumerator*) : HRESULT
    @lpVtbl.value.get_enumerator.call(this, enumerator)
  end
  def expand_target(this : ITargetInfo*, offline : LibC::BOOL, location : LibC::LPWSTR, expandedlocation : UInt8**) : HRESULT
    @lpVtbl.value.expand_target.call(this, offline, location, expandedlocation)
  end
  def expand_target_path(this : ITargetInfo*, offline : LibC::BOOL, location : LibC::LPWSTR, expandedlocation : UInt8**) : HRESULT
    @lpVtbl.value.expand_target_path.call(this, offline, location, expandedlocation)
  end
  def set_module_path(this : ITargetInfo*, module_ : LibC::LPWSTR, path : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_module_path.call(this, module_, path)
  end
  def load_module(this : ITargetInfo*, module_ : LibC::LPWSTR, modulehandle : HINSTANCE*) : HRESULT
    @lpVtbl.value.load_module.call(this, module_, modulehandle)
  end
  def set_wow64_context(this : ITargetInfo*, installermodule : LibC::LPWSTR, wow64context : UInt8*) : HRESULT
    @lpVtbl.value.set_wow64_context.call(this, installermodule, wow64context)
  end
  def translate_wow64(this : ITargetInfo*, clientarchitecture : LibC::LPWSTR, value : LibC::LPWSTR, translatedvalue : UInt8**) : HRESULT
    @lpVtbl.value.translate_wow64.call(this, clientarchitecture, value, translatedvalue)
  end
  def set_schema_hive_location(this : ITargetInfo*, pwzhivedir : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_schema_hive_location.call(this, pwzhivedir)
  end
  def get_schema_hive_location(this : ITargetInfo*, phivelocation : UInt8**) : HRESULT
    @lpVtbl.value.get_schema_hive_location.call(this, phivelocation)
  end
  def set_schema_hive_mount_name(this : ITargetInfo*, pwzmountname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_schema_hive_mount_name.call(this, pwzmountname)
  end
  def get_schema_hive_mount_name(this : ITargetInfo*, pmountname : UInt8**) : HRESULT
    @lpVtbl.value.get_schema_hive_mount_name.call(this, pmountname)
  end
end
struct LibWin32::ISettingsEngine
  def query_interface(this : ISettingsEngine*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISettingsEngine*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISettingsEngine*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_namespaces(this : ISettingsEngine*, flags : WcmNamespaceEnumerationFlags, reserved : Void*, namespaces : IItemEnumerator*) : HRESULT
    @lpVtbl.value.get_namespaces.call(this, flags, reserved, namespaces)
  end
  def get_namespace(this : ISettingsEngine*, settingsid : ISettingsIdentity, access : WcmNamespaceAccess, reserved : Void*, namespaceitem : ISettingsNamespace*) : HRESULT
    @lpVtbl.value.get_namespace.call(this, settingsid, access, reserved, namespaceitem)
  end
  def get_error_description(this : ISettingsEngine*, hresult : Int32, message : UInt8**) : HRESULT
    @lpVtbl.value.get_error_description.call(this, hresult, message)
  end
  def create_settings_identity(this : ISettingsEngine*, settingsid : ISettingsIdentity*) : HRESULT
    @lpVtbl.value.create_settings_identity.call(this, settingsid)
  end
  def get_store_status(this : ISettingsEngine*, reserved : Void*, status : WcmUserStatus*) : HRESULT
    @lpVtbl.value.get_store_status.call(this, reserved, status)
  end
  def load_store(this : ISettingsEngine*, flags : UInt32) : HRESULT
    @lpVtbl.value.load_store.call(this, flags)
  end
  def unload_store(this : ISettingsEngine*, reserved : Void*) : HRESULT
    @lpVtbl.value.unload_store.call(this, reserved)
  end
  def register_namespace(this : ISettingsEngine*, settingsid : ISettingsIdentity, stream : IStream, pushsettings : LibC::BOOL, results : VARIANT*) : HRESULT
    @lpVtbl.value.register_namespace.call(this, settingsid, stream, pushsettings, results)
  end
  def unregister_namespace(this : ISettingsEngine*, settingsid : ISettingsIdentity, removesettings : LibC::BOOL) : HRESULT
    @lpVtbl.value.unregister_namespace.call(this, settingsid, removesettings)
  end
  def create_target_info(this : ISettingsEngine*, target : ITargetInfo*) : HRESULT
    @lpVtbl.value.create_target_info.call(this, target)
  end
  def get_target_info(this : ISettingsEngine*, target : ITargetInfo*) : HRESULT
    @lpVtbl.value.get_target_info.call(this, target)
  end
  def set_target_info(this : ISettingsEngine*, target : ITargetInfo) : HRESULT
    @lpVtbl.value.set_target_info.call(this, target)
  end
  def create_settings_context(this : ISettingsEngine*, flags : UInt32, reserved : Void*, settingscontext : ISettingsContext*) : HRESULT
    @lpVtbl.value.create_settings_context.call(this, flags, reserved, settingscontext)
  end
  def set_settings_context(this : ISettingsEngine*, settingscontext : ISettingsContext) : HRESULT
    @lpVtbl.value.set_settings_context.call(this, settingscontext)
  end
  def apply_settings_context(this : ISettingsEngine*, settingscontext : ISettingsContext, pppwzidentities : LibC::LPWSTR**, pcidentities : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.apply_settings_context.call(this, settingscontext, pppwzidentities, pcidentities)
  end
  def get_settings_context(this : ISettingsEngine*, settingscontext : ISettingsContext*) : HRESULT
    @lpVtbl.value.get_settings_context.call(this, settingscontext)
  end
end
struct LibWin32::ISettingsItem
  def query_interface(this : ISettingsItem*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISettingsItem*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISettingsItem*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : ISettingsItem*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_value(this : ISettingsItem*, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, value)
  end
  def set_value(this : ISettingsItem*, value : VARIANT*) : HRESULT
    @lpVtbl.value.set_value.call(this, value)
  end
  def get_setting_type(this : ISettingsItem*, type : WcmSettingType*) : HRESULT
    @lpVtbl.value.get_setting_type.call(this, type)
  end
  def get_data_type(this : ISettingsItem*, type : WcmDataType*) : HRESULT
    @lpVtbl.value.get_data_type.call(this, type)
  end
  def get_value_raw(this : ISettingsItem*, data : UInt8**, datasize : UInt32*) : HRESULT
    @lpVtbl.value.get_value_raw.call(this, data, datasize)
  end
  def set_value_raw(this : ISettingsItem*, datatype : Int32, data : UInt8*, datasize : UInt32) : HRESULT
    @lpVtbl.value.set_value_raw.call(this, datatype, data, datasize)
  end
  def has_child(this : ISettingsItem*, itemhaschild : LibC::BOOL*) : HRESULT
    @lpVtbl.value.has_child.call(this, itemhaschild)
  end
  def children(this : ISettingsItem*, children : IItemEnumerator*) : HRESULT
    @lpVtbl.value.children.call(this, children)
  end
  def get_child(this : ISettingsItem*, name : LibC::LPWSTR, child : ISettingsItem*) : HRESULT
    @lpVtbl.value.get_child.call(this, name, child)
  end
  def get_setting_by_path(this : ISettingsItem*, path : LibC::LPWSTR, setting : ISettingsItem*) : HRESULT
    @lpVtbl.value.get_setting_by_path.call(this, path, setting)
  end
  def create_setting_by_path(this : ISettingsItem*, path : LibC::LPWSTR, setting : ISettingsItem*) : HRESULT
    @lpVtbl.value.create_setting_by_path.call(this, path, setting)
  end
  def remove_setting_by_path(this : ISettingsItem*, path : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_setting_by_path.call(this, path)
  end
  def get_list_key_information(this : ISettingsItem*, keyname : UInt8**, datatype : WcmDataType*) : HRESULT
    @lpVtbl.value.get_list_key_information.call(this, keyname, datatype)
  end
  def create_list_element(this : ISettingsItem*, keydata : VARIANT*, child : ISettingsItem*) : HRESULT
    @lpVtbl.value.create_list_element.call(this, keydata, child)
  end
  def remove_list_element(this : ISettingsItem*, elementname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_list_element.call(this, elementname)
  end
  def attributes(this : ISettingsItem*, attributes : IItemEnumerator*) : HRESULT
    @lpVtbl.value.attributes.call(this, attributes)
  end
  def get_attribute(this : ISettingsItem*, name : LibC::LPWSTR, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute.call(this, name, value)
  end
  def get_path(this : ISettingsItem*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, path)
  end
  def get_restriction_facets(this : ISettingsItem*, restrictionfacets : WcmRestrictionFacets*) : HRESULT
    @lpVtbl.value.get_restriction_facets.call(this, restrictionfacets)
  end
  def get_restriction(this : ISettingsItem*, restrictionfacet : WcmRestrictionFacets, facetdata : VARIANT*) : HRESULT
    @lpVtbl.value.get_restriction.call(this, restrictionfacet, facetdata)
  end
  def get_key_value(this : ISettingsItem*, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_key_value.call(this, value)
  end
end
struct LibWin32::ISettingsNamespace
  def query_interface(this : ISettingsNamespace*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISettingsNamespace*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISettingsNamespace*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_identity(this : ISettingsNamespace*, settingsid : ISettingsIdentity*) : HRESULT
    @lpVtbl.value.get_identity.call(this, settingsid)
  end
  def settings(this : ISettingsNamespace*, settings : IItemEnumerator*) : HRESULT
    @lpVtbl.value.settings.call(this, settings)
  end
  def save(this : ISettingsNamespace*, pushsettings : LibC::BOOL, result : ISettingsResult*) : HRESULT
    @lpVtbl.value.save.call(this, pushsettings, result)
  end
  def get_setting_by_path(this : ISettingsNamespace*, path : LibC::LPWSTR, setting : ISettingsItem*) : HRESULT
    @lpVtbl.value.get_setting_by_path.call(this, path, setting)
  end
  def create_setting_by_path(this : ISettingsNamespace*, path : LibC::LPWSTR, setting : ISettingsItem*) : HRESULT
    @lpVtbl.value.create_setting_by_path.call(this, path, setting)
  end
  def remove_setting_by_path(this : ISettingsNamespace*, path : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_setting_by_path.call(this, path)
  end
  def get_attribute(this : ISettingsNamespace*, name : LibC::LPWSTR, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute.call(this, name, value)
  end
end
struct LibWin32::ISettingsResult
  def query_interface(this : ISettingsResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISettingsResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISettingsResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_description(this : ISettingsResult*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def get_error_code(this : ISettingsResult*, hrout : HRESULT*) : HRESULT
    @lpVtbl.value.get_error_code.call(this, hrout)
  end
  def get_context_description(this : ISettingsResult*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_context_description.call(this, description)
  end
  def get_line(this : ISettingsResult*, dwline : UInt32*) : HRESULT
    @lpVtbl.value.get_line.call(this, dwline)
  end
  def get_column(this : ISettingsResult*, dwcolumn : UInt32*) : HRESULT
    @lpVtbl.value.get_column.call(this, dwcolumn)
  end
  def get_source(this : ISettingsResult*, file : UInt8**) : HRESULT
    @lpVtbl.value.get_source.call(this, file)
  end
end
struct LibWin32::ISettingsContext
  def query_interface(this : ISettingsContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISettingsContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISettingsContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def serialize(this : ISettingsContext*, pstream : IStream, ptarget : ITargetInfo) : HRESULT
    @lpVtbl.value.serialize.call(this, pstream, ptarget)
  end
  def deserialize(this : ISettingsContext*, pstream : IStream, ptarget : ITargetInfo, pppresults : ISettingsResult**, pcresultcount : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.deserialize.call(this, pstream, ptarget, pppresults, pcresultcount)
  end
  def set_user_data(this : ISettingsContext*, puserdata : Void*) : HRESULT
    @lpVtbl.value.set_user_data.call(this, puserdata)
  end
  def get_user_data(this : ISettingsContext*, puserdata : Void**) : HRESULT
    @lpVtbl.value.get_user_data.call(this, puserdata)
  end
  def get_namespaces(this : ISettingsContext*, ppnamespaceids : IItemEnumerator*) : HRESULT
    @lpVtbl.value.get_namespaces.call(this, ppnamespaceids)
  end
  def get_stored_settings(this : ISettingsContext*, pidentity : ISettingsIdentity, ppaddedsettings : IItemEnumerator*, ppmodifiedsettings : IItemEnumerator*, ppdeletedsettings : IItemEnumerator*) : HRESULT
    @lpVtbl.value.get_stored_settings.call(this, pidentity, ppaddedsettings, ppmodifiedsettings, ppdeletedsettings)
  end
  def revert_setting(this : ISettingsContext*, pidentity : ISettingsIdentity, pwzsetting : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.revert_setting.call(this, pidentity, pwzsetting)
  end
end
