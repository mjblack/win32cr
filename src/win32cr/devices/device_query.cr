require "./properties.cr"
require "./../foundation.cr"

module Win32cr::Devices::DeviceQuery
  alias PDEV_QUERY_RESULT_CALLBACK = Proc(Win32cr::Devices::DeviceQuery::HDEVQUERY__*, Void*, Win32cr::Devices::DeviceQuery::DEV_QUERY_RESULT_ACTION_DATA*, Void)


  @[Flags]
  enum DEVPROP_OPERATOR : UInt32
    DEVPROP_OPERATOR_MODIFIER_NOT = 65536_u32
    DEVPROP_OPERATOR_MODIFIER_IGNORE_CASE = 131072_u32
    DEVPROP_OPERATOR_NONE = 0_u32
    DEVPROP_OPERATOR_EXISTS = 1_u32
    DEVPROP_OPERATOR_NOT_EXISTS = 65537_u32
    DEVPROP_OPERATOR_EQUALS = 2_u32
    DEVPROP_OPERATOR_NOT_EQUALS = 65538_u32
    DEVPROP_OPERATOR_GREATER_THAN = 3_u32
    DEVPROP_OPERATOR_LESS_THAN = 4_u32
    DEVPROP_OPERATOR_GREATER_THAN_EQUALS = 5_u32
    DEVPROP_OPERATOR_LESS_THAN_EQUALS = 6_u32
    DEVPROP_OPERATOR_EQUALS_IGNORE_CASE = 131074_u32
    DEVPROP_OPERATOR_NOT_EQUALS_IGNORE_CASE = 196610_u32
    DEVPROP_OPERATOR_BITWISE_AND = 7_u32
    DEVPROP_OPERATOR_BITWISE_OR = 8_u32
    DEVPROP_OPERATOR_BEGINS_WITH = 9_u32
    DEVPROP_OPERATOR_ENDS_WITH = 10_u32
    DEVPROP_OPERATOR_CONTAINS = 11_u32
    DEVPROP_OPERATOR_BEGINS_WITH_IGNORE_CASE = 131081_u32
    DEVPROP_OPERATOR_ENDS_WITH_IGNORE_CASE = 131082_u32
    DEVPROP_OPERATOR_CONTAINS_IGNORE_CASE = 131083_u32
    DEVPROP_OPERATOR_LIST_CONTAINS = 4096_u32
    DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH = 8192_u32
    DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH = 12288_u32
    DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS = 16384_u32
    DEVPROP_OPERATOR_LIST_CONTAINS_IGNORE_CASE = 135168_u32
    DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH_IGNORE_CASE = 139264_u32
    DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH_IGNORE_CASE = 143360_u32
    DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS_IGNORE_CASE = 147456_u32
    DEVPROP_OPERATOR_AND_OPEN = 1048576_u32
    DEVPROP_OPERATOR_AND_CLOSE = 2097152_u32
    DEVPROP_OPERATOR_OR_OPEN = 3145728_u32
    DEVPROP_OPERATOR_OR_CLOSE = 4194304_u32
    DEVPROP_OPERATOR_NOT_OPEN = 5242880_u32
    DEVPROP_OPERATOR_NOT_CLOSE = 6291456_u32
    DEVPROP_OPERATOR_ARRAY_CONTAINS = 268435456_u32
    DEVPROP_OPERATOR_MASK_EVAL = 4095_u32
    DEVPROP_OPERATOR_MASK_LIST = 61440_u32
    DEVPROP_OPERATOR_MASK_MODIFIER = 983040_u32
    DEVPROP_OPERATOR_MASK_NOT_LOGICAL = 4027580415_u32
    DEVPROP_OPERATOR_MASK_LOGICAL = 267386880_u32
    DEVPROP_OPERATOR_MASK_ARRAY = 4026531840_u32
  end
  enum DEV_OBJECT_TYPE
    DevObjectTypeUnknown = 0_i32
    DevObjectTypeDeviceInterface = 1_i32
    DevObjectTypeDeviceContainer = 2_i32
    DevObjectTypeDevice = 3_i32
    DevObjectTypeDeviceInterfaceClass = 4_i32
    DevObjectTypeAEP = 5_i32
    DevObjectTypeAEPContainer = 6_i32
    DevObjectTypeDeviceInstallerClass = 7_i32
    DevObjectTypeDeviceInterfaceDisplay = 8_i32
    DevObjectTypeDeviceContainerDisplay = 9_i32
    DevObjectTypeAEPService = 10_i32
    DevObjectTypeDevicePanel = 11_i32
  end
  enum DEV_QUERY_FLAGS
    DevQueryFlagNone = 0_i32
    DevQueryFlagUpdateResults = 1_i32
    DevQueryFlagAllProperties = 2_i32
    DevQueryFlagLocalize = 4_i32
    DevQueryFlagAsyncClose = 8_i32
  end
  enum DEV_QUERY_STATE
    DevQueryStateInitialized = 0_i32
    DevQueryStateEnumCompleted = 1_i32
    DevQueryStateAborted = 2_i32
    DevQueryStateClosed = 3_i32
  end
  enum DEV_QUERY_RESULT_ACTION
    DevQueryResultStateChange = 0_i32
    DevQueryResultAdd = 1_i32
    DevQueryResultUpdate = 2_i32
    DevQueryResultRemove = 3_i32
  end

  @[Extern]
  struct DEVPROP_FILTER_EXPRESSION
    property operator : Win32cr::Devices::DeviceQuery::DEVPROP_OPERATOR
    property property : Win32cr::Devices::Properties::DEVPROPERTY
    def initialize(@operator : Win32cr::Devices::DeviceQuery::DEVPROP_OPERATOR, @property : Win32cr::Devices::Properties::DEVPROPERTY)
    end
  end

  @[Extern]
  struct DEV_OBJECT
    property object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE
    property pszObjectId : Win32cr::Foundation::PWSTR
    property cPropertyCount : UInt32
    property pProperties : Win32cr::Devices::Properties::DEVPROPERTY*
    def initialize(@object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, @pszObjectId : Win32cr::Foundation::PWSTR, @cPropertyCount : UInt32, @pProperties : Win32cr::Devices::Properties::DEVPROPERTY*)
    end
  end

  @[Extern]
  struct DEV_QUERY_RESULT_ACTION_DATA
    property action : Win32cr::Devices::DeviceQuery::DEV_QUERY_RESULT_ACTION
    property data : DEV_QUERY_RESULT_UPDATE_PAYLOAD_

    # Nested Type DEV_QUERY_RESULT_UPDATE_PAYLOAD_
    @[Extern(union: true)]
    struct DEV_QUERY_RESULT_UPDATE_PAYLOAD_
    property state : Win32cr::Devices::DeviceQuery::DEV_QUERY_STATE
    property device_object : Win32cr::Devices::DeviceQuery::DEV_OBJECT
    def initialize(@state : Win32cr::Devices::DeviceQuery::DEV_QUERY_STATE, @device_object : Win32cr::Devices::DeviceQuery::DEV_OBJECT)
    end
    end

    def initialize(@action : Win32cr::Devices::DeviceQuery::DEV_QUERY_RESULT_ACTION, @data : DEV_QUERY_RESULT_UPDATE_PAYLOAD_)
    end
  end

  @[Extern]
  struct DEV_QUERY_PARAMETER
    property key : Win32cr::Devices::Properties::DEVPROPKEY
    property type__ : UInt32
    property buffer_size : UInt32
    property buffer : Void*
    def initialize(@key : Win32cr::Devices::Properties::DEVPROPKEY, @type__ : UInt32, @buffer_size : UInt32, @buffer : Void*)
    end
  end

  @[Extern]
  struct HDEVQUERY__
    property unused : Int32
    def initialize(@unused : Int32)
    end
  end

  lib C
    fun DevCreateObjectQuery(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, cFilterExpressionCount : UInt32, pFilter : Win32cr::Devices::DeviceQuery::DEVPROP_FILTER_EXPRESSION*, pCallback : Win32cr::Devices::DeviceQuery::PDEV_QUERY_RESULT_CALLBACK, pContext : Void*, phDevQuery : Win32cr::Devices::DeviceQuery::HDEVQUERY__**) : Win32cr::Foundation::HRESULT

    fun DevCreateObjectQueryEx(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, cFilterExpressionCount : UInt32, pFilter : Win32cr::Devices::DeviceQuery::DEVPROP_FILTER_EXPRESSION*, cExtendedParameterCount : UInt32, pExtendedParameters : Win32cr::Devices::DeviceQuery::DEV_QUERY_PARAMETER*, pCallback : Win32cr::Devices::DeviceQuery::PDEV_QUERY_RESULT_CALLBACK, pContext : Void*, phDevQuery : Win32cr::Devices::DeviceQuery::HDEVQUERY__**) : Win32cr::Foundation::HRESULT

    fun DevCreateObjectQueryFromId(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, pszObjectId : Win32cr::Foundation::PWSTR, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, cFilterExpressionCount : UInt32, pFilter : Win32cr::Devices::DeviceQuery::DEVPROP_FILTER_EXPRESSION*, pCallback : Win32cr::Devices::DeviceQuery::PDEV_QUERY_RESULT_CALLBACK, pContext : Void*, phDevQuery : Win32cr::Devices::DeviceQuery::HDEVQUERY__**) : Win32cr::Foundation::HRESULT

    fun DevCreateObjectQueryFromIdEx(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, pszObjectId : Win32cr::Foundation::PWSTR, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, cFilterExpressionCount : UInt32, pFilter : Win32cr::Devices::DeviceQuery::DEVPROP_FILTER_EXPRESSION*, cExtendedParameterCount : UInt32, pExtendedParameters : Win32cr::Devices::DeviceQuery::DEV_QUERY_PARAMETER*, pCallback : Win32cr::Devices::DeviceQuery::PDEV_QUERY_RESULT_CALLBACK, pContext : Void*, phDevQuery : Win32cr::Devices::DeviceQuery::HDEVQUERY__**) : Win32cr::Foundation::HRESULT

    fun DevCreateObjectQueryFromIds(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, pszzObjectIds : Win32cr::Foundation::PWSTR, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, cFilterExpressionCount : UInt32, pFilter : Win32cr::Devices::DeviceQuery::DEVPROP_FILTER_EXPRESSION*, pCallback : Win32cr::Devices::DeviceQuery::PDEV_QUERY_RESULT_CALLBACK, pContext : Void*, phDevQuery : Win32cr::Devices::DeviceQuery::HDEVQUERY__**) : Win32cr::Foundation::HRESULT

    fun DevCreateObjectQueryFromIdsEx(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, pszzObjectIds : Win32cr::Foundation::PWSTR, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, cFilterExpressionCount : UInt32, pFilter : Win32cr::Devices::DeviceQuery::DEVPROP_FILTER_EXPRESSION*, cExtendedParameterCount : UInt32, pExtendedParameters : Win32cr::Devices::DeviceQuery::DEV_QUERY_PARAMETER*, pCallback : Win32cr::Devices::DeviceQuery::PDEV_QUERY_RESULT_CALLBACK, pContext : Void*, phDevQuery : Win32cr::Devices::DeviceQuery::HDEVQUERY__**) : Win32cr::Foundation::HRESULT

    fun DevCloseObjectQuery(hDevQuery : Win32cr::Devices::DeviceQuery::HDEVQUERY__*) : Void

    fun DevGetObjects(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, cFilterExpressionCount : UInt32, pFilter : Win32cr::Devices::DeviceQuery::DEVPROP_FILTER_EXPRESSION*, pcObjectCount : UInt32*, ppObjects : Win32cr::Devices::DeviceQuery::DEV_OBJECT**) : Win32cr::Foundation::HRESULT

    fun DevGetObjectsEx(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, cFilterExpressionCount : UInt32, pFilter : Win32cr::Devices::DeviceQuery::DEVPROP_FILTER_EXPRESSION*, cExtendedParameterCount : UInt32, pExtendedParameters : Win32cr::Devices::DeviceQuery::DEV_QUERY_PARAMETER*, pcObjectCount : UInt32*, ppObjects : Win32cr::Devices::DeviceQuery::DEV_OBJECT**) : Win32cr::Foundation::HRESULT

    fun DevFreeObjects(cObjectCount : UInt32, pObjects : Win32cr::Devices::DeviceQuery::DEV_OBJECT*) : Void

    fun DevGetObjectProperties(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, pszObjectId : Win32cr::Foundation::PWSTR, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, pcPropertyCount : UInt32*, ppProperties : Win32cr::Devices::Properties::DEVPROPERTY**) : Win32cr::Foundation::HRESULT

    fun DevGetObjectPropertiesEx(object_type : Win32cr::Devices::DeviceQuery::DEV_OBJECT_TYPE, pszObjectId : Win32cr::Foundation::PWSTR, query_flags : UInt32, cRequestedProperties : UInt32, pRequestedProperties : Win32cr::Devices::Properties::DEVPROPCOMPKEY*, cExtendedParameterCount : UInt32, pExtendedParameters : Win32cr::Devices::DeviceQuery::DEV_QUERY_PARAMETER*, pcPropertyCount : UInt32*, ppProperties : Win32cr::Devices::Properties::DEVPROPERTY**) : Win32cr::Foundation::HRESULT

    fun DevFreeObjectProperties(cPropertyCount : UInt32, pProperties : Win32cr::Devices::Properties::DEVPROPERTY*) : Void

    fun DevFindProperty(pKey : Win32cr::Devices::Properties::DEVPROPKEY*, store : Win32cr::Devices::Properties::DEVPROPSTORE, pszLocaleName : Win32cr::Foundation::PWSTR, cProperties : UInt32, pProperties : Win32cr::Devices::Properties::DEVPROPERTY*) : Win32cr::Devices::Properties::DEVPROPERTY*

  end
end