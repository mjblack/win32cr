require "./../foundation.cr"

module Win32cr::NetworkManagement::WindowsConnectionManager
  alias ONDEMAND_NOTIFICATION_CALLBACK = Proc(Void*, Void)*

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
  record WCM_POLICY_VALUE,
    fValue : Win32cr::Foundation::BOOL,
    fIsGroupPolicy : Win32cr::Foundation::BOOL

  @[Extern]
  record WCM_PROFILE_INFO,
    strProfileName : UInt16[256],
    adapter_guid : LibC::GUID,
    media : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_MEDIA_TYPE

  @[Extern]
  record WCM_PROFILE_INFO_LIST,
    dwNumberOfItems : UInt32,
    profile_info : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROFILE_INFO*

  @[Extern]
  record WCM_CONNECTION_COST_DATA,
    connection_cost : UInt32,
    cost_source : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_CONNECTION_COST_SOURCE

  @[Extern]
  record WCM_TIME_INTERVAL,
    wYear : UInt16,
    wMonth : UInt16,
    wDay : UInt16,
    wHour : UInt16,
    wMinute : UInt16,
    wSecond : UInt16,
    wMilliseconds : UInt16

  @[Extern]
  record WCM_USAGE_DATA,
    usage_in_megabytes : UInt32,
    last_sync_time : Win32cr::Foundation::FILETIME

  @[Extern]
  record WCM_BILLING_CYCLE_INFO,
    start_date : Win32cr::Foundation::FILETIME,
    duration : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_TIME_INTERVAL,
    reset : Win32cr::Foundation::BOOL

  @[Extern]
  record WCM_DATAPLAN_STATUS,
    usage_data : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_USAGE_DATA,
    data_limit_in_megabytes : UInt32,
    inbound_bandwidth_in_kbps : UInt32,
    outbound_bandwidth_in_kbps : UInt32,
    billing_cycle : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_BILLING_CYCLE_INFO,
    max_transfer_size_in_megabytes : UInt32,
    reserved : UInt32

  @[Extern]
  record NET_INTERFACE_CONTEXT,
    interface_index : UInt32,
    configuration_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record NET_INTERFACE_CONTEXT_TABLE,
    interface_context_handle : Win32cr::Foundation::HANDLE,
    number_of_entries : UInt32,
    interface_context_array : Win32cr::NetworkManagement::WindowsConnectionManager::NET_INTERFACE_CONTEXT*

  @[Link("wcmapi")]
  @[Link("ondemandconnroutehelper")]
  lib C
    fun WcmQueryProperty(pInterface : LibC::GUID*, strProfileName : Win32cr::Foundation::PWSTR, property : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROPERTY, pReserved : Void*, pdwDataSize : UInt32*, ppData : UInt8**) : UInt32

    fun WcmSetProperty(pInterface : LibC::GUID*, strProfileName : Win32cr::Foundation::PWSTR, property : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROPERTY, pReserved : Void*, dwDataSize : UInt32, pbData : UInt8*) : UInt32

    fun WcmGetProfileList(pReserved : Void*, ppProfileList : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROFILE_INFO_LIST**) : UInt32

    fun WcmSetProfileList(pProfileList : Win32cr::NetworkManagement::WindowsConnectionManager::WCM_PROFILE_INFO_LIST*, dwPosition : UInt32, fIgnoreUnknownProfiles : Win32cr::Foundation::BOOL, pReserved : Void*) : UInt32

    fun WcmFreeMemory(pMemory : Void*) : Void

    fun OnDemandGetRoutingHint(destinationHostName : Win32cr::Foundation::PWSTR, interfaceIndex : UInt32*) : Win32cr::Foundation::HRESULT

    fun OnDemandRegisterNotification(callback : Win32cr::NetworkManagement::WindowsConnectionManager::ONDEMAND_NOTIFICATION_CALLBACK, callbackContext : Void*, registrationHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun OnDemandUnRegisterNotification(registrationHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun GetInterfaceContextTableForHostName(host_name : Win32cr::Foundation::PWSTR, proxy_name : Win32cr::Foundation::PWSTR, flags : UInt32, connection_profile_filter_raw_data : UInt8*, connection_profile_filter_raw_data_size : UInt32, interface_context_table : Win32cr::NetworkManagement::WindowsConnectionManager::NET_INTERFACE_CONTEXT_TABLE**) : Win32cr::Foundation::HRESULT

    fun FreeInterfaceContextTable(interface_context_table : Win32cr::NetworkManagement::WindowsConnectionManager::NET_INTERFACE_CONTEXT_TABLE*) : Void

  end
end