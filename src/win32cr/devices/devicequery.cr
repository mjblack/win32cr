require "../devices/properties.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:cfgmgr32.dll")]
{% else %}
@[Link("cfgmgr32")]
{% end %}
lib LibWin32
  alias PDEV_QUERY_RESULT_CALLBACK = Proc(HDEVQUERY__*, Void*, DEV_QUERY_RESULT_ACTION_DATA*, Void)


  enum DEVPROP_OPERATOR : UInt32
    DEVPROP_OPERATOR_MODIFIER_NOT = 65536
    DEVPROP_OPERATOR_MODIFIER_IGNORE_CASE = 131072
    DEVPROP_OPERATOR_NONE = 0
    DEVPROP_OPERATOR_EXISTS = 1
    DEVPROP_OPERATOR_NOT_EXISTS = 65537
    DEVPROP_OPERATOR_EQUALS = 2
    DEVPROP_OPERATOR_NOT_EQUALS = 65538
    DEVPROP_OPERATOR_GREATER_THAN = 3
    DEVPROP_OPERATOR_LESS_THAN = 4
    DEVPROP_OPERATOR_GREATER_THAN_EQUALS = 5
    DEVPROP_OPERATOR_LESS_THAN_EQUALS = 6
    DEVPROP_OPERATOR_EQUALS_IGNORE_CASE = 131074
    DEVPROP_OPERATOR_NOT_EQUALS_IGNORE_CASE = 196610
    DEVPROP_OPERATOR_BITWISE_AND = 7
    DEVPROP_OPERATOR_BITWISE_OR = 8
    DEVPROP_OPERATOR_BEGINS_WITH = 9
    DEVPROP_OPERATOR_ENDS_WITH = 10
    DEVPROP_OPERATOR_CONTAINS = 11
    DEVPROP_OPERATOR_BEGINS_WITH_IGNORE_CASE = 131081
    DEVPROP_OPERATOR_ENDS_WITH_IGNORE_CASE = 131082
    DEVPROP_OPERATOR_CONTAINS_IGNORE_CASE = 131083
    DEVPROP_OPERATOR_LIST_CONTAINS = 4096
    DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH = 8192
    DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH = 12288
    DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS = 16384
    DEVPROP_OPERATOR_LIST_CONTAINS_IGNORE_CASE = 135168
    DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH_IGNORE_CASE = 139264
    DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH_IGNORE_CASE = 143360
    DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS_IGNORE_CASE = 147456
    DEVPROP_OPERATOR_AND_OPEN = 1048576
    DEVPROP_OPERATOR_AND_CLOSE = 2097152
    DEVPROP_OPERATOR_OR_OPEN = 3145728
    DEVPROP_OPERATOR_OR_CLOSE = 4194304
    DEVPROP_OPERATOR_NOT_OPEN = 5242880
    DEVPROP_OPERATOR_NOT_CLOSE = 6291456
    DEVPROP_OPERATOR_ARRAY_CONTAINS = 268435456
    DEVPROP_OPERATOR_MASK_EVAL = 4095
    DEVPROP_OPERATOR_MASK_LIST = 61440
    DEVPROP_OPERATOR_MASK_MODIFIER = 983040
    DEVPROP_OPERATOR_MASK_NOT_LOGICAL = 4027580415
    DEVPROP_OPERATOR_MASK_LOGICAL = 267386880
    DEVPROP_OPERATOR_MASK_ARRAY = 4026531840
  end

  enum DEV_OBJECT_TYPE : Int32
    DevObjectTypeUnknown = 0
    DevObjectTypeDeviceInterface = 1
    DevObjectTypeDeviceContainer = 2
    DevObjectTypeDevice = 3
    DevObjectTypeDeviceInterfaceClass = 4
    DevObjectTypeAEP = 5
    DevObjectTypeAEPContainer = 6
    DevObjectTypeDeviceInstallerClass = 7
    DevObjectTypeDeviceInterfaceDisplay = 8
    DevObjectTypeDeviceContainerDisplay = 9
    DevObjectTypeAEPService = 10
    DevObjectTypeDevicePanel = 11
  end

  enum DEV_QUERY_FLAGS : Int32
    DevQueryFlagNone = 0
    DevQueryFlagUpdateResults = 1
    DevQueryFlagAllProperties = 2
    DevQueryFlagLocalize = 4
    DevQueryFlagAsyncClose = 8
  end

  enum DEV_QUERY_STATE : Int32
    DevQueryStateInitialized = 0
    DevQueryStateEnumCompleted = 1
    DevQueryStateAborted = 2
    DevQueryStateClosed = 3
  end

  enum DEV_QUERY_RESULT_ACTION : Int32
    DevQueryResultStateChange = 0
    DevQueryResultAdd = 1
    DevQueryResultUpdate = 2
    DevQueryResultRemove = 3
  end

  union DEV_QUERY_RESULT_ACTION_DATA_DEV_QUERY_RESULT_UPDATE_PAYLOAD
    state : DEV_QUERY_STATE
    device_object : DEV_OBJECT
  end

  struct DEVPROP_FILTER_EXPRESSION
    operator : DEVPROP_OPERATOR
    property : DEVPROPERTY
  end
  struct DEV_OBJECT
    object_type : DEV_OBJECT_TYPE
    psz_object_id : LibC::LPWSTR
    c_property_count : UInt32
    p_properties : DEVPROPERTY*
  end
  struct DEV_QUERY_RESULT_ACTION_DATA
    action : DEV_QUERY_RESULT_ACTION
    data : DEV_QUERY_RESULT_ACTION_DATA_DEV_QUERY_RESULT_UPDATE_PAYLOAD
  end
  struct DEV_QUERY_PARAMETER
    key : DEVPROPKEY
    type : UInt32
    buffer_size : UInt32
    buffer : Void*
  end
  struct HDEVQUERY__
    unused : Int32
  end


  # Params # objecttype : DEV_OBJECT_TYPE [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],cfilterexpressioncount : UInt32 [In],pfilter : DEVPROP_FILTER_EXPRESSION* [In],pcallback : PDEV_QUERY_RESULT_CALLBACK [In],pcontext : Void* [In],phdevquery : HDEVQUERY__** [In]
  fun DevCreateObjectQuery(objecttype : DEV_OBJECT_TYPE, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, cfilterexpressioncount : UInt32, pfilter : DEVPROP_FILTER_EXPRESSION*, pcallback : PDEV_QUERY_RESULT_CALLBACK, pcontext : Void*, phdevquery : HDEVQUERY__**) : HRESULT

  # Params # objecttype : DEV_OBJECT_TYPE [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],cfilterexpressioncount : UInt32 [In],pfilter : DEVPROP_FILTER_EXPRESSION* [In],cextendedparametercount : UInt32 [In],pextendedparameters : DEV_QUERY_PARAMETER* [In],pcallback : PDEV_QUERY_RESULT_CALLBACK [In],pcontext : Void* [In],phdevquery : HDEVQUERY__** [In]
  fun DevCreateObjectQueryEx(objecttype : DEV_OBJECT_TYPE, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, cfilterexpressioncount : UInt32, pfilter : DEVPROP_FILTER_EXPRESSION*, cextendedparametercount : UInt32, pextendedparameters : DEV_QUERY_PARAMETER*, pcallback : PDEV_QUERY_RESULT_CALLBACK, pcontext : Void*, phdevquery : HDEVQUERY__**) : HRESULT

  # Params # objecttype : DEV_OBJECT_TYPE [In],pszobjectid : LibC::LPWSTR [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],cfilterexpressioncount : UInt32 [In],pfilter : DEVPROP_FILTER_EXPRESSION* [In],pcallback : PDEV_QUERY_RESULT_CALLBACK [In],pcontext : Void* [In],phdevquery : HDEVQUERY__** [In]
  fun DevCreateObjectQueryFromId(objecttype : DEV_OBJECT_TYPE, pszobjectid : LibC::LPWSTR, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, cfilterexpressioncount : UInt32, pfilter : DEVPROP_FILTER_EXPRESSION*, pcallback : PDEV_QUERY_RESULT_CALLBACK, pcontext : Void*, phdevquery : HDEVQUERY__**) : HRESULT

  # Params # objecttype : DEV_OBJECT_TYPE [In],pszobjectid : LibC::LPWSTR [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],cfilterexpressioncount : UInt32 [In],pfilter : DEVPROP_FILTER_EXPRESSION* [In],cextendedparametercount : UInt32 [In],pextendedparameters : DEV_QUERY_PARAMETER* [In],pcallback : PDEV_QUERY_RESULT_CALLBACK [In],pcontext : Void* [In],phdevquery : HDEVQUERY__** [In]
  fun DevCreateObjectQueryFromIdEx(objecttype : DEV_OBJECT_TYPE, pszobjectid : LibC::LPWSTR, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, cfilterexpressioncount : UInt32, pfilter : DEVPROP_FILTER_EXPRESSION*, cextendedparametercount : UInt32, pextendedparameters : DEV_QUERY_PARAMETER*, pcallback : PDEV_QUERY_RESULT_CALLBACK, pcontext : Void*, phdevquery : HDEVQUERY__**) : HRESULT

  # Params # objecttype : DEV_OBJECT_TYPE [In],pszzobjectids : LibC::LPWSTR [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],cfilterexpressioncount : UInt32 [In],pfilter : DEVPROP_FILTER_EXPRESSION* [In],pcallback : PDEV_QUERY_RESULT_CALLBACK [In],pcontext : Void* [In],phdevquery : HDEVQUERY__** [In]
  fun DevCreateObjectQueryFromIds(objecttype : DEV_OBJECT_TYPE, pszzobjectids : LibC::LPWSTR, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, cfilterexpressioncount : UInt32, pfilter : DEVPROP_FILTER_EXPRESSION*, pcallback : PDEV_QUERY_RESULT_CALLBACK, pcontext : Void*, phdevquery : HDEVQUERY__**) : HRESULT

  # Params # objecttype : DEV_OBJECT_TYPE [In],pszzobjectids : LibC::LPWSTR [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],cfilterexpressioncount : UInt32 [In],pfilter : DEVPROP_FILTER_EXPRESSION* [In],cextendedparametercount : UInt32 [In],pextendedparameters : DEV_QUERY_PARAMETER* [In],pcallback : PDEV_QUERY_RESULT_CALLBACK [In],pcontext : Void* [In],phdevquery : HDEVQUERY__** [In]
  fun DevCreateObjectQueryFromIdsEx(objecttype : DEV_OBJECT_TYPE, pszzobjectids : LibC::LPWSTR, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, cfilterexpressioncount : UInt32, pfilter : DEVPROP_FILTER_EXPRESSION*, cextendedparametercount : UInt32, pextendedparameters : DEV_QUERY_PARAMETER*, pcallback : PDEV_QUERY_RESULT_CALLBACK, pcontext : Void*, phdevquery : HDEVQUERY__**) : HRESULT

  # Params # hdevquery : HDEVQUERY__* [In]
  fun DevCloseObjectQuery(hdevquery : HDEVQUERY__*) : Void

  # Params # objecttype : DEV_OBJECT_TYPE [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],cfilterexpressioncount : UInt32 [In],pfilter : DEVPROP_FILTER_EXPRESSION* [In],pcobjectcount : UInt32* [In],ppobjects : DEV_OBJECT** [In]
  fun DevGetObjects(objecttype : DEV_OBJECT_TYPE, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, cfilterexpressioncount : UInt32, pfilter : DEVPROP_FILTER_EXPRESSION*, pcobjectcount : UInt32*, ppobjects : DEV_OBJECT**) : HRESULT

  # Params # objecttype : DEV_OBJECT_TYPE [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],cfilterexpressioncount : UInt32 [In],pfilter : DEVPROP_FILTER_EXPRESSION* [In],cextendedparametercount : UInt32 [In],pextendedparameters : DEV_QUERY_PARAMETER* [In],pcobjectcount : UInt32* [In],ppobjects : DEV_OBJECT** [In]
  fun DevGetObjectsEx(objecttype : DEV_OBJECT_TYPE, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, cfilterexpressioncount : UInt32, pfilter : DEVPROP_FILTER_EXPRESSION*, cextendedparametercount : UInt32, pextendedparameters : DEV_QUERY_PARAMETER*, pcobjectcount : UInt32*, ppobjects : DEV_OBJECT**) : HRESULT

  # Params # cobjectcount : UInt32 [In],pobjects : DEV_OBJECT* [In]
  fun DevFreeObjects(cobjectcount : UInt32, pobjects : DEV_OBJECT*) : Void

  # Params # objecttype : DEV_OBJECT_TYPE [In],pszobjectid : LibC::LPWSTR [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],pcpropertycount : UInt32* [In],ppproperties : DEVPROPERTY** [In]
  fun DevGetObjectProperties(objecttype : DEV_OBJECT_TYPE, pszobjectid : LibC::LPWSTR, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, pcpropertycount : UInt32*, ppproperties : DEVPROPERTY**) : HRESULT

  # Params # objecttype : DEV_OBJECT_TYPE [In],pszobjectid : LibC::LPWSTR [In],queryflags : UInt32 [In],crequestedproperties : UInt32 [In],prequestedproperties : DEVPROPCOMPKEY* [In],cextendedparametercount : UInt32 [In],pextendedparameters : DEV_QUERY_PARAMETER* [In],pcpropertycount : UInt32* [In],ppproperties : DEVPROPERTY** [In]
  fun DevGetObjectPropertiesEx(objecttype : DEV_OBJECT_TYPE, pszobjectid : LibC::LPWSTR, queryflags : UInt32, crequestedproperties : UInt32, prequestedproperties : DEVPROPCOMPKEY*, cextendedparametercount : UInt32, pextendedparameters : DEV_QUERY_PARAMETER*, pcpropertycount : UInt32*, ppproperties : DEVPROPERTY**) : HRESULT

  # Params # cpropertycount : UInt32 [In],pproperties : DEVPROPERTY* [In]
  fun DevFreeObjectProperties(cpropertycount : UInt32, pproperties : DEVPROPERTY*) : Void

  # Params # pkey : DEVPROPKEY* [In],store : DEVPROPSTORE [In],pszlocalename : LibC::LPWSTR [In],cproperties : UInt32 [In],pproperties : DEVPROPERTY* [In]
  fun DevFindProperty(pkey : DEVPROPKEY*, store : DEVPROPSTORE, pszlocalename : LibC::LPWSTR, cproperties : UInt32, pproperties : DEVPROPERTY*) : DEVPROPERTY*
end
