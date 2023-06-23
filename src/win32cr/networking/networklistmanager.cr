require "../foundation.cr"
require "../system/com.cr"
require "../system/ole.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  NLM_MAX_ADDRESS_LIST_SIZE = 10_u32
  NLM_UNKNOWN_DATAPLAN_STATUS = 4294967295_u32
  CLSID_NetworkListManager = LibC::GUID.new(0xdcb00c01_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])


  enum NLM_CONNECTION_COST : Int32
    NLM_CONNECTION_COST_UNKNOWN = 0
    NLM_CONNECTION_COST_UNRESTRICTED = 1
    NLM_CONNECTION_COST_FIXED = 2
    NLM_CONNECTION_COST_VARIABLE = 4
    NLM_CONNECTION_COST_OVERDATALIMIT = 65536
    NLM_CONNECTION_COST_CONGESTED = 131072
    NLM_CONNECTION_COST_ROAMING = 262144
    NLM_CONNECTION_COST_APPROACHINGDATALIMIT = 524288
  end

  enum NLM_NETWORK_CLASS : Int32
    NLM_NETWORK_IDENTIFYING = 1
    NLM_NETWORK_IDENTIFIED = 2
    NLM_NETWORK_UNIDENTIFIED = 3
  end

  enum NLM_INTERNET_CONNECTIVITY : Int32
    NLM_INTERNET_CONNECTIVITY_WEBHIJACK = 1
    NLM_INTERNET_CONNECTIVITY_PROXIED = 2
    NLM_INTERNET_CONNECTIVITY_CORPORATE = 4
  end

  enum NLM_CONNECTIVITY : Int32
    NLM_CONNECTIVITY_DISCONNECTED = 0
    NLM_CONNECTIVITY_IPV4_NOTRAFFIC = 1
    NLM_CONNECTIVITY_IPV6_NOTRAFFIC = 2
    NLM_CONNECTIVITY_IPV4_SUBNET = 16
    NLM_CONNECTIVITY_IPV4_LOCALNETWORK = 32
    NLM_CONNECTIVITY_IPV4_INTERNET = 64
    NLM_CONNECTIVITY_IPV6_SUBNET = 256
    NLM_CONNECTIVITY_IPV6_LOCALNETWORK = 512
    NLM_CONNECTIVITY_IPV6_INTERNET = 1024
  end

  enum NLM_DOMAIN_TYPE : Int32
    NLM_DOMAIN_TYPE_NON_DOMAIN_NETWORK = 0
    NLM_DOMAIN_TYPE_DOMAIN_NETWORK = 1
    NLM_DOMAIN_TYPE_DOMAIN_AUTHENTICATED = 2
  end

  enum NLM_ENUM_NETWORK : Int32
    NLM_ENUM_NETWORK_CONNECTED = 1
    NLM_ENUM_NETWORK_DISCONNECTED = 2
    NLM_ENUM_NETWORK_ALL = 3
  end

  enum NLM_NETWORK_CATEGORY : Int32
    NLM_NETWORK_CATEGORY_PUBLIC = 0
    NLM_NETWORK_CATEGORY_PRIVATE = 1
    NLM_NETWORK_CATEGORY_DOMAIN_AUTHENTICATED = 2
  end

  enum NLM_NETWORK_PROPERTY_CHANGE : Int32
    NLM_NETWORK_PROPERTY_CHANGE_CONNECTION = 1
    NLM_NETWORK_PROPERTY_CHANGE_DESCRIPTION = 2
    NLM_NETWORK_PROPERTY_CHANGE_NAME = 4
    NLM_NETWORK_PROPERTY_CHANGE_ICON = 8
    NLM_NETWORK_PROPERTY_CHANGE_CATEGORY_VALUE = 16
  end

  enum NLM_CONNECTION_PROPERTY_CHANGE : Int32
    NLM_CONNECTION_PROPERTY_CHANGE_AUTHENTICATION = 1
  end

  struct NLM_USAGE_DATA
    usage_in_megabytes : UInt32
    last_sync_time : FILETIME
  end
  struct NLM_DATAPLAN_STATUS
    interface_guid : Guid
    usage_data : NLM_USAGE_DATA
    data_limit_in_megabytes : UInt32
    inbound_bandwidth_in_kbps : UInt32
    outbound_bandwidth_in_kbps : UInt32
    next_billing_cycle : FILETIME
    max_transfer_size_in_megabytes : UInt32
    reserved : UInt32
  end
  struct NLM_SOCKADDR
    data : UInt8[128]*
  end
  struct NLM_SIMULATED_PROFILE_INFO
    profile_name : Char[256]*
    cost : NLM_CONNECTION_COST
    usage_in_megabytes : UInt32
    data_limit_in_megabytes : UInt32
  end


  struct INetworkListManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_networks : UInt64
    get_network : UInt64
    get_network_connections : UInt64
    get_network_connection : UInt64
    get_is_connected_to_internet : UInt64
    get_is_connected : UInt64
    get_connectivity : UInt64
    set_simulated_profile_info : UInt64
    clear_simulated_profile_info : UInt64
  end

  INetworkListManager_GUID = "dcb00000-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkListManager = LibC::GUID.new(0xdcb00000_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkListManager
    lpVtbl : INetworkListManagerVTbl*
  end

  struct INetworkListManagerEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    connectivity_changed : UInt64
  end

  INetworkListManagerEvents_GUID = "dcb00001-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkListManagerEvents = LibC::GUID.new(0xdcb00001_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkListManagerEvents
    lpVtbl : INetworkListManagerEventsVTbl*
  end

  struct INetworkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    set_name : UInt64
    get_description : UInt64
    set_description : UInt64
    get_network_id : UInt64
    get_domain_type : UInt64
    get_network_connections : UInt64
    get_time_created_and_connected : UInt64
    get_is_connected_to_internet : UInt64
    get_is_connected : UInt64
    get_connectivity : UInt64
    get_category : UInt64
    set_category : UInt64
  end

  INetwork_GUID = "dcb00002-570f-4a9b-8d69-199fdba5723b"
  IID_INetwork = LibC::GUID.new(0xdcb00002_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetwork
    lpVtbl : INetworkVTbl*
  end

  struct IEnumNetworksVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumNetworks_GUID = "dcb00003-570f-4a9b-8d69-199fdba5723b"
  IID_IEnumNetworks = LibC::GUID.new(0xdcb00003_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct IEnumNetworks
    lpVtbl : IEnumNetworksVTbl*
  end

  struct INetworkEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    network_added : UInt64
    network_deleted : UInt64
    network_connectivity_changed : UInt64
    network_property_changed : UInt64
  end

  INetworkEvents_GUID = "dcb00004-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkEvents = LibC::GUID.new(0xdcb00004_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkEvents
    lpVtbl : INetworkEventsVTbl*
  end

  struct INetworkConnectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_network : UInt64
    get_is_connected_to_internet : UInt64
    get_is_connected : UInt64
    get_connectivity : UInt64
    get_connection_id : UInt64
    get_adapter_id : UInt64
    get_domain_type : UInt64
  end

  INetworkConnection_GUID = "dcb00005-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkConnection = LibC::GUID.new(0xdcb00005_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkConnection
    lpVtbl : INetworkConnectionVTbl*
  end

  struct IEnumNetworkConnectionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumNetworkConnections_GUID = "dcb00006-570f-4a9b-8d69-199fdba5723b"
  IID_IEnumNetworkConnections = LibC::GUID.new(0xdcb00006_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct IEnumNetworkConnections
    lpVtbl : IEnumNetworkConnectionsVTbl*
  end

  struct INetworkConnectionEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    network_connection_connectivity_changed : UInt64
    network_connection_property_changed : UInt64
  end

  INetworkConnectionEvents_GUID = "dcb00007-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkConnectionEvents = LibC::GUID.new(0xdcb00007_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkConnectionEvents
    lpVtbl : INetworkConnectionEventsVTbl*
  end

  struct INetworkCostManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_cost : UInt64
    get_data_plan_status : UInt64
    set_destination_addresses : UInt64
  end

  INetworkCostManager_GUID = "dcb00008-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkCostManager = LibC::GUID.new(0xdcb00008_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkCostManager
    lpVtbl : INetworkCostManagerVTbl*
  end

  struct INetworkCostManagerEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cost_changed : UInt64
    data_plan_status_changed : UInt64
  end

  INetworkCostManagerEvents_GUID = "dcb00009-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkCostManagerEvents = LibC::GUID.new(0xdcb00009_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkCostManagerEvents
    lpVtbl : INetworkCostManagerEventsVTbl*
  end

  struct INetworkConnectionCostVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_cost : UInt64
    get_data_plan_status : UInt64
  end

  INetworkConnectionCost_GUID = "dcb0000a-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkConnectionCost = LibC::GUID.new(0xdcb0000a_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkConnectionCost
    lpVtbl : INetworkConnectionCostVTbl*
  end

  struct INetworkConnectionCostEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    connection_cost_changed : UInt64
    connection_data_plan_status_changed : UInt64
  end

  INetworkConnectionCostEvents_GUID = "dcb0000b-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkConnectionCostEvents = LibC::GUID.new(0xdcb0000b_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkConnectionCostEvents
    lpVtbl : INetworkConnectionCostEventsVTbl*
  end

end
struct LibWin32::INetworkListManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_networks(flags : NLM_ENUM_NETWORK, ppenumnetwork : IEnumNetworks*) : HRESULT
    @lpVtbl.value.get_networks.unsafe_as(Proc(NLM_ENUM_NETWORK, IEnumNetworks*, HRESULT)).call(flags, ppenumnetwork)
  end
  def get_network(gdnetworkid : Guid, ppnetwork : INetwork*) : HRESULT
    @lpVtbl.value.get_network.unsafe_as(Proc(Guid, INetwork*, HRESULT)).call(gdnetworkid, ppnetwork)
  end
  def get_network_connections(ppenum : IEnumNetworkConnections*) : HRESULT
    @lpVtbl.value.get_network_connections.unsafe_as(Proc(IEnumNetworkConnections*, HRESULT)).call(ppenum)
  end
  def get_network_connection(gdnetworkconnectionid : Guid, ppnetworkconnection : INetworkConnection*) : HRESULT
    @lpVtbl.value.get_network_connection.unsafe_as(Proc(Guid, INetworkConnection*, HRESULT)).call(gdnetworkconnectionid, ppnetworkconnection)
  end
  def get_is_connected_to_internet(pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected_to_internet.unsafe_as(Proc(Int16*, HRESULT)).call(pbisconnected)
  end
  def get_is_connected(pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected.unsafe_as(Proc(Int16*, HRESULT)).call(pbisconnected)
  end
  def get_connectivity(pconnectivity : NLM_CONNECTIVITY*) : HRESULT
    @lpVtbl.value.get_connectivity.unsafe_as(Proc(NLM_CONNECTIVITY*, HRESULT)).call(pconnectivity)
  end
  def set_simulated_profile_info(psimulatedinfo : NLM_SIMULATED_PROFILE_INFO*) : HRESULT
    @lpVtbl.value.set_simulated_profile_info.unsafe_as(Proc(NLM_SIMULATED_PROFILE_INFO*, HRESULT)).call(psimulatedinfo)
  end
  def clear_simulated_profile_info : HRESULT
    @lpVtbl.value.clear_simulated_profile_info.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::INetworkListManagerEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def connectivity_changed(newconnectivity : NLM_CONNECTIVITY) : HRESULT
    @lpVtbl.value.connectivity_changed.unsafe_as(Proc(NLM_CONNECTIVITY, HRESULT)).call(newconnectivity)
  end
end
struct LibWin32::INetwork
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(psznetworkname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(psznetworkname)
  end
  def set_name(sznetworknewname : UInt8*) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(UInt8*, HRESULT)).call(sznetworknewname)
  end
  def get_description(pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pszdescription)
  end
  def set_description(szdescription : UInt8*) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(UInt8*, HRESULT)).call(szdescription)
  end
  def get_network_id(pgdguidnetworkid : Guid*) : HRESULT
    @lpVtbl.value.get_network_id.unsafe_as(Proc(Guid*, HRESULT)).call(pgdguidnetworkid)
  end
  def get_domain_type(pnetworktype : NLM_DOMAIN_TYPE*) : HRESULT
    @lpVtbl.value.get_domain_type.unsafe_as(Proc(NLM_DOMAIN_TYPE*, HRESULT)).call(pnetworktype)
  end
  def get_network_connections(ppenumnetworkconnection : IEnumNetworkConnections*) : HRESULT
    @lpVtbl.value.get_network_connections.unsafe_as(Proc(IEnumNetworkConnections*, HRESULT)).call(ppenumnetworkconnection)
  end
  def get_time_created_and_connected(pdwlowdatetimecreated : UInt32*, pdwhighdatetimecreated : UInt32*, pdwlowdatetimeconnected : UInt32*, pdwhighdatetimeconnected : UInt32*) : HRESULT
    @lpVtbl.value.get_time_created_and_connected.unsafe_as(Proc(UInt32*, UInt32*, UInt32*, UInt32*, HRESULT)).call(pdwlowdatetimecreated, pdwhighdatetimecreated, pdwlowdatetimeconnected, pdwhighdatetimeconnected)
  end
  def get_is_connected_to_internet(pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected_to_internet.unsafe_as(Proc(Int16*, HRESULT)).call(pbisconnected)
  end
  def get_is_connected(pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected.unsafe_as(Proc(Int16*, HRESULT)).call(pbisconnected)
  end
  def get_connectivity(pconnectivity : NLM_CONNECTIVITY*) : HRESULT
    @lpVtbl.value.get_connectivity.unsafe_as(Proc(NLM_CONNECTIVITY*, HRESULT)).call(pconnectivity)
  end
  def get_category(pcategory : NLM_NETWORK_CATEGORY*) : HRESULT
    @lpVtbl.value.get_category.unsafe_as(Proc(NLM_NETWORK_CATEGORY*, HRESULT)).call(pcategory)
  end
  def set_category(newcategory : NLM_NETWORK_CATEGORY) : HRESULT
    @lpVtbl.value.set_category.unsafe_as(Proc(NLM_NETWORK_CATEGORY, HRESULT)).call(newcategory)
  end
end
struct LibWin32::IEnumNetworks
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppenumvar : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppenumvar)
  end
  def next(celt : UInt32, rgelt : INetwork*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, INetwork*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenumnetwork : IEnumNetworks*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumNetworks*, HRESULT)).call(ppenumnetwork)
  end
end
struct LibWin32::INetworkEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def network_added(networkid : Guid) : HRESULT
    @lpVtbl.value.network_added.unsafe_as(Proc(Guid, HRESULT)).call(networkid)
  end
  def network_deleted(networkid : Guid) : HRESULT
    @lpVtbl.value.network_deleted.unsafe_as(Proc(Guid, HRESULT)).call(networkid)
  end
  def network_connectivity_changed(networkid : Guid, newconnectivity : NLM_CONNECTIVITY) : HRESULT
    @lpVtbl.value.network_connectivity_changed.unsafe_as(Proc(Guid, NLM_CONNECTIVITY, HRESULT)).call(networkid, newconnectivity)
  end
  def network_property_changed(networkid : Guid, flags : NLM_NETWORK_PROPERTY_CHANGE) : HRESULT
    @lpVtbl.value.network_property_changed.unsafe_as(Proc(Guid, NLM_NETWORK_PROPERTY_CHANGE, HRESULT)).call(networkid, flags)
  end
end
struct LibWin32::INetworkConnection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_network(ppnetwork : INetwork*) : HRESULT
    @lpVtbl.value.get_network.unsafe_as(Proc(INetwork*, HRESULT)).call(ppnetwork)
  end
  def get_is_connected_to_internet(pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected_to_internet.unsafe_as(Proc(Int16*, HRESULT)).call(pbisconnected)
  end
  def get_is_connected(pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected.unsafe_as(Proc(Int16*, HRESULT)).call(pbisconnected)
  end
  def get_connectivity(pconnectivity : NLM_CONNECTIVITY*) : HRESULT
    @lpVtbl.value.get_connectivity.unsafe_as(Proc(NLM_CONNECTIVITY*, HRESULT)).call(pconnectivity)
  end
  def get_connection_id(pgdconnectionid : Guid*) : HRESULT
    @lpVtbl.value.get_connection_id.unsafe_as(Proc(Guid*, HRESULT)).call(pgdconnectionid)
  end
  def get_adapter_id(pgdadapterid : Guid*) : HRESULT
    @lpVtbl.value.get_adapter_id.unsafe_as(Proc(Guid*, HRESULT)).call(pgdadapterid)
  end
  def get_domain_type(pdomaintype : NLM_DOMAIN_TYPE*) : HRESULT
    @lpVtbl.value.get_domain_type.unsafe_as(Proc(NLM_DOMAIN_TYPE*, HRESULT)).call(pdomaintype)
  end
end
struct LibWin32::IEnumNetworkConnections
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppenumvar : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppenumvar)
  end
  def next(celt : UInt32, rgelt : INetworkConnection*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, INetworkConnection*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenumnetwork : IEnumNetworkConnections*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumNetworkConnections*, HRESULT)).call(ppenumnetwork)
  end
end
struct LibWin32::INetworkConnectionEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def network_connection_connectivity_changed(connectionid : Guid, newconnectivity : NLM_CONNECTIVITY) : HRESULT
    @lpVtbl.value.network_connection_connectivity_changed.unsafe_as(Proc(Guid, NLM_CONNECTIVITY, HRESULT)).call(connectionid, newconnectivity)
  end
  def network_connection_property_changed(connectionid : Guid, flags : NLM_CONNECTION_PROPERTY_CHANGE) : HRESULT
    @lpVtbl.value.network_connection_property_changed.unsafe_as(Proc(Guid, NLM_CONNECTION_PROPERTY_CHANGE, HRESULT)).call(connectionid, flags)
  end
end
struct LibWin32::INetworkCostManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_cost(pcost : UInt32*, pdestipaddr : NLM_SOCKADDR*) : HRESULT
    @lpVtbl.value.get_cost.unsafe_as(Proc(UInt32*, NLM_SOCKADDR*, HRESULT)).call(pcost, pdestipaddr)
  end
  def get_data_plan_status(pdataplanstatus : NLM_DATAPLAN_STATUS*, pdestipaddr : NLM_SOCKADDR*) : HRESULT
    @lpVtbl.value.get_data_plan_status.unsafe_as(Proc(NLM_DATAPLAN_STATUS*, NLM_SOCKADDR*, HRESULT)).call(pdataplanstatus, pdestipaddr)
  end
  def set_destination_addresses(length : UInt32, pdestipaddrlist : NLM_SOCKADDR*, bappend : Int16) : HRESULT
    @lpVtbl.value.set_destination_addresses.unsafe_as(Proc(UInt32, NLM_SOCKADDR*, Int16, HRESULT)).call(length, pdestipaddrlist, bappend)
  end
end
struct LibWin32::INetworkCostManagerEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cost_changed(newcost : UInt32, pdestaddr : NLM_SOCKADDR*) : HRESULT
    @lpVtbl.value.cost_changed.unsafe_as(Proc(UInt32, NLM_SOCKADDR*, HRESULT)).call(newcost, pdestaddr)
  end
  def data_plan_status_changed(pdestaddr : NLM_SOCKADDR*) : HRESULT
    @lpVtbl.value.data_plan_status_changed.unsafe_as(Proc(NLM_SOCKADDR*, HRESULT)).call(pdestaddr)
  end
end
struct LibWin32::INetworkConnectionCost
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_cost(pcost : UInt32*) : HRESULT
    @lpVtbl.value.get_cost.unsafe_as(Proc(UInt32*, HRESULT)).call(pcost)
  end
  def get_data_plan_status(pdataplanstatus : NLM_DATAPLAN_STATUS*) : HRESULT
    @lpVtbl.value.get_data_plan_status.unsafe_as(Proc(NLM_DATAPLAN_STATUS*, HRESULT)).call(pdataplanstatus)
  end
end
struct LibWin32::INetworkConnectionCostEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def connection_cost_changed(connectionid : Guid, newcost : UInt32) : HRESULT
    @lpVtbl.value.connection_cost_changed.unsafe_as(Proc(Guid, UInt32, HRESULT)).call(connectionid, newcost)
  end
  def connection_data_plan_status_changed(connectionid : Guid) : HRESULT
    @lpVtbl.value.connection_data_plan_status_changed.unsafe_as(Proc(Guid, HRESULT)).call(connectionid)
  end
end
