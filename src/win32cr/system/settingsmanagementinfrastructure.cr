require "../system/com.cr"
require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
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
  SettingsEngine = LibC::GUID.new(0x9f7d7bb5_u32, 0x20b3_u16, 0x11da_u16, StaticArray[0x81_u8, 0xa5_u8, 0x0_u8, 0x30_u8, 0xf1_u8, 0x64_u8, 0x2e_u8, 0x3c_u8])


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

  struct ISettingsContext
    lpVtbl : ISettingsContextVTbl*
  end

end
