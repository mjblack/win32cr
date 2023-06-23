require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wcmapi.dll")]
@[Link(ldflags: "/DELAYLOAD:ondemandconnroutehelper.dll")]
{% else %}
@[Link("wcmapi")]
@[Link("ondemandconnroutehelper")]
{% end %}
lib LibWin32
  WCM_API_VERSION_1_0 = 1_u32
  WCM_API_VERSION = 1_u32
  WCM_UNKNOWN_DATAPLAN_STATUS = 4294967295_u32
  WCM_MAX_PROFILE_NAME = 256_u32
  NET_INTERFACE_FLAG_NONE = 0_u32
  NET_INTERFACE_FLAG_CONNECT_IF_NEEDED = 1_u32

  alias ONDEMAND_NOTIFICATION_CALLBACK = Proc(Void*, Void)


  enum WCM_PROPERTY : Int32
    Wcm_global_property_domain_policy = 0
    Wcm_global_property_minimize_policy = 1
    Wcm_global_property_roaming_policy = 2
    Wcm_global_property_powermanagement_policy = 3
    Wcm_intf_property_connection_cost = 4
    Wcm_intf_property_dataplan_status = 5
    Wcm_intf_property_hotspot_profile = 6
  end

  enum WCM_MEDIA_TYPE : Int32
    Wcm_media_unknown = 0
    Wcm_media_ethernet = 1
    Wcm_media_wlan = 2
    Wcm_media_mbn = 3
    Wcm_media_invalid = 4
    Wcm_media_max = 5
  end

  enum WCM_CONNECTION_COST : Int32
    WCM_CONNECTION_COST_UNKNOWN = 0
    WCM_CONNECTION_COST_UNRESTRICTED = 1
    WCM_CONNECTION_COST_FIXED = 2
    WCM_CONNECTION_COST_VARIABLE = 4
    WCM_CONNECTION_COST_OVERDATALIMIT = 65536
    WCM_CONNECTION_COST_CONGESTED = 131072
    WCM_CONNECTION_COST_ROAMING = 262144
    WCM_CONNECTION_COST_APPROACHINGDATALIMIT = 524288
  end

  enum WCM_CONNECTION_COST_SOURCE : Int32
    WCM_CONNECTION_COST_SOURCE_DEFAULT = 0
    WCM_CONNECTION_COST_SOURCE_GP = 1
    WCM_CONNECTION_COST_SOURCE_USER = 2
    WCM_CONNECTION_COST_SOURCE_OPERATOR = 3
  end

  struct WCM_POLICY_VALUE
    f_value : LibC::BOOL
    f_is_group_policy : LibC::BOOL
  end
  struct WCM_PROFILE_INFO
    str_profile_name : Char[256]*
    adapter_guid : Guid
    media : WCM_MEDIA_TYPE
  end
  struct WCM_PROFILE_INFO_LIST
    dw_number_of_items : UInt32
    profile_info : WCM_PROFILE_INFO[0]*
  end
  struct WCM_CONNECTION_COST_DATA
    connection_cost : UInt32
    cost_source : WCM_CONNECTION_COST_SOURCE
  end
  struct WCM_TIME_INTERVAL
    w_year : UInt16
    w_month : UInt16
    w_day : UInt16
    w_hour : UInt16
    w_minute : UInt16
    w_second : UInt16
    w_milliseconds : UInt16
  end
  struct WCM_USAGE_DATA
    usage_in_megabytes : UInt32
    last_sync_time : FILETIME
  end
  struct WCM_BILLING_CYCLE_INFO
    start_date : FILETIME
    duration : WCM_TIME_INTERVAL
    reset : LibC::BOOL
  end
  struct WCM_DATAPLAN_STATUS
    usage_data : WCM_USAGE_DATA
    data_limit_in_megabytes : UInt32
    inbound_bandwidth_in_kbps : UInt32
    outbound_bandwidth_in_kbps : UInt32
    billing_cycle : WCM_BILLING_CYCLE_INFO
    max_transfer_size_in_megabytes : UInt32
    reserved : UInt32
  end
  struct NET_INTERFACE_CONTEXT
    interface_index : UInt32
    configuration_name : LibC::LPWSTR
  end
  struct NET_INTERFACE_CONTEXT_TABLE
    interface_context_handle : LibC::HANDLE
    number_of_entries : UInt32
    interface_context_array : NET_INTERFACE_CONTEXT*
  end


  # Params # pinterface : Guid* [In],strprofilename : LibC::LPWSTR [In],property : WCM_PROPERTY [In],preserved : Void* [In],pdwdatasize : UInt32* [In],ppdata : UInt8** [In]
  fun WcmQueryProperty(pinterface : Guid*, strprofilename : LibC::LPWSTR, property : WCM_PROPERTY, preserved : Void*, pdwdatasize : UInt32*, ppdata : UInt8**) : UInt32

  # Params # pinterface : Guid* [In],strprofilename : LibC::LPWSTR [In],property : WCM_PROPERTY [In],preserved : Void* [In],dwdatasize : UInt32 [In],pbdata : UInt8* [In]
  fun WcmSetProperty(pinterface : Guid*, strprofilename : LibC::LPWSTR, property : WCM_PROPERTY, preserved : Void*, dwdatasize : UInt32, pbdata : UInt8*) : UInt32

  # Params # preserved : Void* [In],ppprofilelist : WCM_PROFILE_INFO_LIST** [In]
  fun WcmGetProfileList(preserved : Void*, ppprofilelist : WCM_PROFILE_INFO_LIST**) : UInt32

  # Params # pprofilelist : WCM_PROFILE_INFO_LIST* [In],dwposition : UInt32 [In],fignoreunknownprofiles : LibC::BOOL [In],preserved : Void* [In]
  fun WcmSetProfileList(pprofilelist : WCM_PROFILE_INFO_LIST*, dwposition : UInt32, fignoreunknownprofiles : LibC::BOOL, preserved : Void*) : UInt32

  # Params # pmemory : Void* [In]
  fun WcmFreeMemory(pmemory : Void*) : Void

  # Params # destinationhostname : LibC::LPWSTR [In],interfaceindex : UInt32* [In]
  fun OnDemandGetRoutingHint(destinationhostname : LibC::LPWSTR, interfaceindex : UInt32*) : HRESULT

  # Params # callback : ONDEMAND_NOTIFICATION_CALLBACK [In],callbackcontext : Void* [In],registrationhandle : LibC::HANDLE* [In]
  fun OnDemandRegisterNotification(callback : ONDEMAND_NOTIFICATION_CALLBACK, callbackcontext : Void*, registrationhandle : LibC::HANDLE*) : HRESULT

  # Params # registrationhandle : LibC::HANDLE [In]
  fun OnDemandUnRegisterNotification(registrationhandle : LibC::HANDLE) : HRESULT

  # Params # hostname : LibC::LPWSTR [In],proxyname : LibC::LPWSTR [In],flags : UInt32 [In],connectionprofilefilterrawdata : UInt8* [In],connectionprofilefilterrawdatasize : UInt32 [In],interfacecontexttable : NET_INTERFACE_CONTEXT_TABLE** [In]
  fun GetInterfaceContextTableForHostName(hostname : LibC::LPWSTR, proxyname : LibC::LPWSTR, flags : UInt32, connectionprofilefilterrawdata : UInt8*, connectionprofilefilterrawdatasize : UInt32, interfacecontexttable : NET_INTERFACE_CONTEXT_TABLE**) : HRESULT

  # Params # interfacecontexttable : NET_INTERFACE_CONTEXT_TABLE* [In]
  fun FreeInterfaceContextTable(interfacecontexttable : NET_INTERFACE_CONTEXT_TABLE*) : Void
end
