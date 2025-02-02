require "./../foundation.cr"

module Win32cr::NetworkManagement::WindowsConnectionManager
  extend self
  alias ONDEMAND_NOTIFICATION_CALLBACK = Proc(Void*, Void)

  WCM_API_VERSION_1_0 = 1_u32
  WCM_API_VERSION = 1_u32
  WCM_UNKNOWN_DATAPLAN_STATUS = 4294967295_u32
  WCM_MAX_PROFILE_NAME = 256_u32
  NET_INTERFACE_FLAG_NONE = 0_u32
  NET_INTERFACE_FLAG_CONNECT_IF_NEEDED = 1_u32

  enum WCM_PROPERTY
    Wcm_global_property_domain_policy = 0_i32
    Wcm_global_property_minimize_policy = 1_i32
    Wcm_global_property_roaming_policy = 2_i32
    Wcm_global_property_powermanagement_policy = 3_i32
    Wcm_intf_property_connection_cost = 4_i32
    Wcm_intf_property_dataplan_status = 5_i32
    Wcm_intf_property_hotspot_profile = 6_i32
  end
  enum WCM_MEDIA_TYPE
    Wcm_media_unknown = 0_i32
    Wcm_media_ethernet = 1_i32
    Wcm_media_wlan = 2_i32
    Wcm_media_mbn = 3_i32
    Wcm_media_invalid = 4_i32
    Wcm_media_max = 5_i32
  end
  enum WCM_CONNECTION_COST
    WCM_CONNECTION_COST_UNKNOWN = 0_i32
    WCM_CONNECTION_COST_UNRESTRICTED = 1_i32
    WCM_CONNECTION_COST_FIXED = 2_i32
    WCM_CONNECTION_COST_VARIABLE = 4_i32
    WCM_CONNECTION_COST_OVERDATALIMIT = 65536_i32
    WCM_CONNECTION_COST_CONGESTED = 131072_i32
    WCM_CONNECTION_COST_ROAMING = 262144_i32
    WCM_CONNECTION_COST_APPROACHINGDATALIMIT = 524288_i32
  end
  enum WCM_CONNECTION_COST_SOURCE
    WCM_CONNECTION_COST_SOURCE_DEFAULT = 0_i32
    WCM_CONNECTION_COST_SOURCE_GP = 1_i32
    WCM_CONNECTION_COST_SOURCE_USER = 2_i32
    WCM_CONNECTION_COST_SOURCE_OPERATOR = 3_i32
  end

  @[Extern]
  struct WCM_POLICY_VALUE
    property fValue : Win32cr::Foundation::BOOL
    property fIsGroupPolicy : Win32cr::Foundation::BOOL
    def initialize(@fValue : Win32cr::Foundation::BOOL, @fIsGroupPolicy : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WCM_PROFILE_INFO
    property strProfileName : UInt16[256]
    property adapter_guid : LibC::GUID
    property media : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_MEDIA_TYPE
    def initialize(@strProfileName : UInt16[256], @adapter_guid : LibC::GUID, @media : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_MEDIA_TYPE)
    end
  end

  @[Extern]
  struct WCM_PROFILE_INFO_LIST
    property dwNumberOfItems : UInt32
    property profile_info : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROFILE_INFO*
    def initialize(@dwNumberOfItems : UInt32, @profile_info : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROFILE_INFO*)
    end
  end

  @[Extern]
  struct WCM_CONNECTION_COST_DATA
    property connection_cost : UInt32
    property cost_source : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_CONNECTION_COST_SOURCE
    def initialize(@connection_cost : UInt32, @cost_source : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_CONNECTION_COST_SOURCE)
    end
  end

  @[Extern]
  struct WCM_TIME_INTERVAL
    property wYear : UInt16
    property wMonth : UInt16
    property wDay : UInt16
    property wHour : UInt16
    property wMinute : UInt16
    property wSecond : UInt16
    property wMilliseconds : UInt16
    def initialize(@wYear : UInt16, @wMonth : UInt16, @wDay : UInt16, @wHour : UInt16, @wMinute : UInt16, @wSecond : UInt16, @wMilliseconds : UInt16)
    end
  end

  @[Extern]
  struct WCM_USAGE_DATA
    property usage_in_megabytes : UInt32
    property last_sync_time : Win32cr::Foundation::FILETIME
    def initialize(@usage_in_megabytes : UInt32, @last_sync_time : Win32cr::Foundation::FILETIME)
    end
  end

  @[Extern]
  struct WCM_BILLING_CYCLE_INFO
    property start_date : Win32cr::Foundation::FILETIME
    property duration : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_TIME_INTERVAL
    property reset : Win32cr::Foundation::BOOL
    def initialize(@start_date : Win32cr::Foundation::FILETIME, @duration : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_TIME_INTERVAL, @reset : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WCM_DATAPLAN_STATUS
    property usage_data : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_USAGE_DATA
    property data_limit_in_megabytes : UInt32
    property inbound_bandwidth_in_kbps : UInt32
    property outbound_bandwidth_in_kbps : UInt32
    property billing_cycle : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_BILLING_CYCLE_INFO
    property max_transfer_size_in_megabytes : UInt32
    property reserved : UInt32
    def initialize(@usage_data : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_USAGE_DATA, @data_limit_in_megabytes : UInt32, @inbound_bandwidth_in_kbps : UInt32, @outbound_bandwidth_in_kbps : UInt32, @billing_cycle : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_BILLING_CYCLE_INFO, @max_transfer_size_in_megabytes : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct NET_INTERFACE_CONTEXT
    property interface_index : UInt32
    property configuration_name : Win32cr::Foundation::PWSTR
    def initialize(@interface_index : UInt32, @configuration_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct NET_INTERFACE_CONTEXT_TABLE
    property interface_context_handle : Win32cr::Foundation::HANDLE
    property number_of_entries : UInt32
    property interface_context_array : Win32cr::NetworkManagement::WindowsConnectionManager::NET_INTERFACE_CONTEXT*
    def initialize(@interface_context_handle : Win32cr::Foundation::HANDLE, @number_of_entries : UInt32, @interface_context_array : Win32cr::NetworkManagement::WindowsConnectionManager::NET_INTERFACE_CONTEXT*)
    end
  end

  def wcmQueryProperty(pInterface : LibC::GUID*, strProfileName : Win32cr::Foundation::PWSTR, property : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROPERTY, pReserved : Void*, pdwDataSize : UInt32*, ppData : UInt8**) : UInt32
    C.WcmQueryProperty(pInterface, strProfileName, property, pReserved, pdwDataSize, ppData)
  end

  def wcmSetProperty(pInterface : LibC::GUID*, strProfileName : Win32cr::Foundation::PWSTR, property : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROPERTY, pReserved : Void*, dwDataSize : UInt32, pbData : UInt8*) : UInt32
    C.WcmSetProperty(pInterface, strProfileName, property, pReserved, dwDataSize, pbData)
  end

  def wcmGetProfileList(pReserved : Void*, ppProfileList : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROFILE_INFO_LIST**) : UInt32
    C.WcmGetProfileList(pReserved, ppProfileList)
  end

  def wcmSetProfileList(pProfileList : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROFILE_INFO_LIST*, dwPosition : UInt32, fIgnoreUnknownProfiles : Win32cr::Foundation::BOOL, pReserved : Void*) : UInt32
    C.WcmSetProfileList(pProfileList, dwPosition, fIgnoreUnknownProfiles, pReserved)
  end

  def wcmFreeMemory(pMemory : Void*) : Void
    C.WcmFreeMemory(pMemory)
  end

  def onDemandGetRoutingHint(destinationHostName : Win32cr::Foundation::PWSTR, interfaceIndex : UInt32*) : Win32cr::Foundation::HRESULT
    C.OnDemandGetRoutingHint(destinationHostName, interfaceIndex)
  end

  def onDemandRegisterNotification(callback : Win32cr::NetworkManagement::WindowsConnectionManager::ONDEMAND_NOTIFICATION_CALLBACK, callbackContext : Void*, registrationHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    C.OnDemandRegisterNotification(callback, callbackContext, registrationHandle)
  end

  def onDemandUnRegisterNotification(registrationHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.OnDemandUnRegisterNotification(registrationHandle)
  end

  def getInterfaceContextTableForHostName(host_name : Win32cr::Foundation::PWSTR, proxy_name : Win32cr::Foundation::PWSTR, flags : UInt32, connection_profile_filter_raw_data : UInt8*, connection_profile_filter_raw_data_size : UInt32, interface_context_table : Win32cr::NetworkManagement::WindowsConnectionManager::NET_INTERFACE_CONTEXT_TABLE**) : Win32cr::Foundation::HRESULT
    C.GetInterfaceContextTableForHostName(host_name, proxy_name, flags, connection_profile_filter_raw_data, connection_profile_filter_raw_data_size, interface_context_table)
  end

  def freeInterfaceContextTable(interface_context_table : Win32cr::NetworkManagement::WindowsConnectionManager::NET_INTERFACE_CONTEXT_TABLE*) : Void
    C.FreeInterfaceContextTable(interface_context_table)
  end

  @[Link("wcmapi")]
  @[Link("ondemandconnroutehelper")]
  lib C
    # :nodoc:
    fun WcmQueryProperty(pInterface : LibC::GUID*, strProfileName : Win32cr::Foundation::PWSTR, property : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROPERTY, pReserved : Void*, pdwDataSize : UInt32*, ppData : UInt8**) : UInt32

    # :nodoc:
    fun WcmSetProperty(pInterface : LibC::GUID*, strProfileName : Win32cr::Foundation::PWSTR, property : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROPERTY, pReserved : Void*, dwDataSize : UInt32, pbData : UInt8*) : UInt32

    # :nodoc:
    fun WcmGetProfileList(pReserved : Void*, ppProfileList : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROFILE_INFO_LIST**) : UInt32

    # :nodoc:
    fun WcmSetProfileList(pProfileList : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROFILE_INFO_LIST*, dwPosition : UInt32, fIgnoreUnknownProfiles : Win32cr::Foundation::BOOL, pReserved : Void*) : UInt32

    # :nodoc:
    fun WcmFreeMemory(pMemory : Void*) : Void

    # :nodoc:
    fun OnDemandGetRoutingHint(destinationHostName : Win32cr::Foundation::PWSTR, interfaceIndex : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun OnDemandRegisterNotification(callback : Win32cr::NetworkManagement::WindowsConnectionManager::ONDEMAND_NOTIFICATION_CALLBACK, callbackContext : Void*, registrationHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun OnDemandUnRegisterNotification(registrationHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetInterfaceContextTableForHostName(host_name : Win32cr::Foundation::PWSTR, proxy_name : Win32cr::Foundation::PWSTR, flags : UInt32, connection_profile_filter_raw_data : UInt8*, connection_profile_filter_raw_data_size : UInt32, interface_context_table : Win32cr::NetworkManagement::WindowsConnectionManager::NET_INTERFACE_CONTEXT_TABLE**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FreeInterfaceContextTable(interface_context_table : Win32cr::NetworkManagement::WindowsConnectionManager::NET_INTERFACE_CONTEXT_TABLE*) : Void

  end
end