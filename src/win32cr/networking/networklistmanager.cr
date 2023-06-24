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
    query_interface : Proc(INetworkListManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkListManager*, UInt32)
    release : Proc(INetworkListManager*, UInt32)
    get_type_info_count : Proc(INetworkListManager*, UInt32*, HRESULT)
    get_type_info : Proc(INetworkListManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetworkListManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetworkListManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_networks : Proc(INetworkListManager*, NLM_ENUM_NETWORK, IEnumNetworks*, HRESULT)
    get_network : Proc(INetworkListManager*, Guid, INetwork*, HRESULT)
    get_network_connections : Proc(INetworkListManager*, IEnumNetworkConnections*, HRESULT)
    get_network_connection : Proc(INetworkListManager*, Guid, INetworkConnection*, HRESULT)
    get_is_connected_to_internet : Proc(INetworkListManager*, Int16*, HRESULT)
    get_is_connected : Proc(INetworkListManager*, Int16*, HRESULT)
    get_connectivity : Proc(INetworkListManager*, NLM_CONNECTIVITY*, HRESULT)
    set_simulated_profile_info : Proc(INetworkListManager*, NLM_SIMULATED_PROFILE_INFO*, HRESULT)
    clear_simulated_profile_info : Proc(INetworkListManager*, HRESULT)
  end

  INetworkListManager_GUID = "dcb00000-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkListManager = LibC::GUID.new(0xdcb00000_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkListManager
    lpVtbl : INetworkListManagerVTbl*
  end

  struct INetworkListManagerEventsVTbl
    query_interface : Proc(INetworkListManagerEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkListManagerEvents*, UInt32)
    release : Proc(INetworkListManagerEvents*, UInt32)
    connectivity_changed : Proc(INetworkListManagerEvents*, NLM_CONNECTIVITY, HRESULT)
  end

  INetworkListManagerEvents_GUID = "dcb00001-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkListManagerEvents = LibC::GUID.new(0xdcb00001_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkListManagerEvents
    lpVtbl : INetworkListManagerEventsVTbl*
  end

  struct INetworkVTbl
    query_interface : Proc(INetwork*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetwork*, UInt32)
    release : Proc(INetwork*, UInt32)
    get_type_info_count : Proc(INetwork*, UInt32*, HRESULT)
    get_type_info : Proc(INetwork*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetwork*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetwork*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(INetwork*, UInt8**, HRESULT)
    set_name : Proc(INetwork*, UInt8*, HRESULT)
    get_description : Proc(INetwork*, UInt8**, HRESULT)
    set_description : Proc(INetwork*, UInt8*, HRESULT)
    get_network_id : Proc(INetwork*, Guid*, HRESULT)
    get_domain_type : Proc(INetwork*, NLM_DOMAIN_TYPE*, HRESULT)
    get_network_connections : Proc(INetwork*, IEnumNetworkConnections*, HRESULT)
    get_time_created_and_connected : Proc(INetwork*, UInt32*, UInt32*, UInt32*, UInt32*, HRESULT)
    get_is_connected_to_internet : Proc(INetwork*, Int16*, HRESULT)
    get_is_connected : Proc(INetwork*, Int16*, HRESULT)
    get_connectivity : Proc(INetwork*, NLM_CONNECTIVITY*, HRESULT)
    get_category : Proc(INetwork*, NLM_NETWORK_CATEGORY*, HRESULT)
    set_category : Proc(INetwork*, NLM_NETWORK_CATEGORY, HRESULT)
  end

  INetwork_GUID = "dcb00002-570f-4a9b-8d69-199fdba5723b"
  IID_INetwork = LibC::GUID.new(0xdcb00002_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetwork
    lpVtbl : INetworkVTbl*
  end

  struct IEnumNetworksVTbl
    query_interface : Proc(IEnumNetworks*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetworks*, UInt32)
    release : Proc(IEnumNetworks*, UInt32)
    get_type_info_count : Proc(IEnumNetworks*, UInt32*, HRESULT)
    get_type_info : Proc(IEnumNetworks*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEnumNetworks*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEnumNetworks*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IEnumNetworks*, IEnumVARIANT*, HRESULT)
    next : Proc(IEnumNetworks*, UInt32, INetwork*, UInt32*, HRESULT)
    skip : Proc(IEnumNetworks*, UInt32, HRESULT)
    reset : Proc(IEnumNetworks*, HRESULT)
    clone : Proc(IEnumNetworks*, IEnumNetworks*, HRESULT)
  end

  IEnumNetworks_GUID = "dcb00003-570f-4a9b-8d69-199fdba5723b"
  IID_IEnumNetworks = LibC::GUID.new(0xdcb00003_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct IEnumNetworks
    lpVtbl : IEnumNetworksVTbl*
  end

  struct INetworkEventsVTbl
    query_interface : Proc(INetworkEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkEvents*, UInt32)
    release : Proc(INetworkEvents*, UInt32)
    network_added : Proc(INetworkEvents*, Guid, HRESULT)
    network_deleted : Proc(INetworkEvents*, Guid, HRESULT)
    network_connectivity_changed : Proc(INetworkEvents*, Guid, NLM_CONNECTIVITY, HRESULT)
    network_property_changed : Proc(INetworkEvents*, Guid, NLM_NETWORK_PROPERTY_CHANGE, HRESULT)
  end

  INetworkEvents_GUID = "dcb00004-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkEvents = LibC::GUID.new(0xdcb00004_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkEvents
    lpVtbl : INetworkEventsVTbl*
  end

  struct INetworkConnectionVTbl
    query_interface : Proc(INetworkConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkConnection*, UInt32)
    release : Proc(INetworkConnection*, UInt32)
    get_type_info_count : Proc(INetworkConnection*, UInt32*, HRESULT)
    get_type_info : Proc(INetworkConnection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetworkConnection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetworkConnection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_network : Proc(INetworkConnection*, INetwork*, HRESULT)
    get_is_connected_to_internet : Proc(INetworkConnection*, Int16*, HRESULT)
    get_is_connected : Proc(INetworkConnection*, Int16*, HRESULT)
    get_connectivity : Proc(INetworkConnection*, NLM_CONNECTIVITY*, HRESULT)
    get_connection_id : Proc(INetworkConnection*, Guid*, HRESULT)
    get_adapter_id : Proc(INetworkConnection*, Guid*, HRESULT)
    get_domain_type : Proc(INetworkConnection*, NLM_DOMAIN_TYPE*, HRESULT)
  end

  INetworkConnection_GUID = "dcb00005-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkConnection = LibC::GUID.new(0xdcb00005_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkConnection
    lpVtbl : INetworkConnectionVTbl*
  end

  struct IEnumNetworkConnectionsVTbl
    query_interface : Proc(IEnumNetworkConnections*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetworkConnections*, UInt32)
    release : Proc(IEnumNetworkConnections*, UInt32)
    get_type_info_count : Proc(IEnumNetworkConnections*, UInt32*, HRESULT)
    get_type_info : Proc(IEnumNetworkConnections*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEnumNetworkConnections*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEnumNetworkConnections*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IEnumNetworkConnections*, IEnumVARIANT*, HRESULT)
    next : Proc(IEnumNetworkConnections*, UInt32, INetworkConnection*, UInt32*, HRESULT)
    skip : Proc(IEnumNetworkConnections*, UInt32, HRESULT)
    reset : Proc(IEnumNetworkConnections*, HRESULT)
    clone : Proc(IEnumNetworkConnections*, IEnumNetworkConnections*, HRESULT)
  end

  IEnumNetworkConnections_GUID = "dcb00006-570f-4a9b-8d69-199fdba5723b"
  IID_IEnumNetworkConnections = LibC::GUID.new(0xdcb00006_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct IEnumNetworkConnections
    lpVtbl : IEnumNetworkConnectionsVTbl*
  end

  struct INetworkConnectionEventsVTbl
    query_interface : Proc(INetworkConnectionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkConnectionEvents*, UInt32)
    release : Proc(INetworkConnectionEvents*, UInt32)
    network_connection_connectivity_changed : Proc(INetworkConnectionEvents*, Guid, NLM_CONNECTIVITY, HRESULT)
    network_connection_property_changed : Proc(INetworkConnectionEvents*, Guid, NLM_CONNECTION_PROPERTY_CHANGE, HRESULT)
  end

  INetworkConnectionEvents_GUID = "dcb00007-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkConnectionEvents = LibC::GUID.new(0xdcb00007_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkConnectionEvents
    lpVtbl : INetworkConnectionEventsVTbl*
  end

  struct INetworkCostManagerVTbl
    query_interface : Proc(INetworkCostManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkCostManager*, UInt32)
    release : Proc(INetworkCostManager*, UInt32)
    get_cost : Proc(INetworkCostManager*, UInt32*, NLM_SOCKADDR*, HRESULT)
    get_data_plan_status : Proc(INetworkCostManager*, NLM_DATAPLAN_STATUS*, NLM_SOCKADDR*, HRESULT)
    set_destination_addresses : Proc(INetworkCostManager*, UInt32, NLM_SOCKADDR*, Int16, HRESULT)
  end

  INetworkCostManager_GUID = "dcb00008-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkCostManager = LibC::GUID.new(0xdcb00008_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkCostManager
    lpVtbl : INetworkCostManagerVTbl*
  end

  struct INetworkCostManagerEventsVTbl
    query_interface : Proc(INetworkCostManagerEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkCostManagerEvents*, UInt32)
    release : Proc(INetworkCostManagerEvents*, UInt32)
    cost_changed : Proc(INetworkCostManagerEvents*, UInt32, NLM_SOCKADDR*, HRESULT)
    data_plan_status_changed : Proc(INetworkCostManagerEvents*, NLM_SOCKADDR*, HRESULT)
  end

  INetworkCostManagerEvents_GUID = "dcb00009-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkCostManagerEvents = LibC::GUID.new(0xdcb00009_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkCostManagerEvents
    lpVtbl : INetworkCostManagerEventsVTbl*
  end

  struct INetworkConnectionCostVTbl
    query_interface : Proc(INetworkConnectionCost*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkConnectionCost*, UInt32)
    release : Proc(INetworkConnectionCost*, UInt32)
    get_cost : Proc(INetworkConnectionCost*, UInt32*, HRESULT)
    get_data_plan_status : Proc(INetworkConnectionCost*, NLM_DATAPLAN_STATUS*, HRESULT)
  end

  INetworkConnectionCost_GUID = "dcb0000a-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkConnectionCost = LibC::GUID.new(0xdcb0000a_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkConnectionCost
    lpVtbl : INetworkConnectionCostVTbl*
  end

  struct INetworkConnectionCostEventsVTbl
    query_interface : Proc(INetworkConnectionCostEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkConnectionCostEvents*, UInt32)
    release : Proc(INetworkConnectionCostEvents*, UInt32)
    connection_cost_changed : Proc(INetworkConnectionCostEvents*, Guid, UInt32, HRESULT)
    connection_data_plan_status_changed : Proc(INetworkConnectionCostEvents*, Guid, HRESULT)
  end

  INetworkConnectionCostEvents_GUID = "dcb0000b-570f-4a9b-8d69-199fdba5723b"
  IID_INetworkConnectionCostEvents = LibC::GUID.new(0xdcb0000b_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
  struct INetworkConnectionCostEvents
    lpVtbl : INetworkConnectionCostEventsVTbl*
  end

end
struct LibWin32::INetworkListManager
  def query_interface(this : INetworkListManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkListManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkListManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetworkListManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetworkListManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetworkListManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetworkListManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_networks(this : INetworkListManager*, flags : NLM_ENUM_NETWORK, ppenumnetwork : IEnumNetworks*) : HRESULT
    @lpVtbl.value.get_networks.call(this, flags, ppenumnetwork)
  end
  def get_network(this : INetworkListManager*, gdnetworkid : Guid, ppnetwork : INetwork*) : HRESULT
    @lpVtbl.value.get_network.call(this, gdnetworkid, ppnetwork)
  end
  def get_network_connections(this : INetworkListManager*, ppenum : IEnumNetworkConnections*) : HRESULT
    @lpVtbl.value.get_network_connections.call(this, ppenum)
  end
  def get_network_connection(this : INetworkListManager*, gdnetworkconnectionid : Guid, ppnetworkconnection : INetworkConnection*) : HRESULT
    @lpVtbl.value.get_network_connection.call(this, gdnetworkconnectionid, ppnetworkconnection)
  end
  def get_is_connected_to_internet(this : INetworkListManager*, pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected_to_internet.call(this, pbisconnected)
  end
  def get_is_connected(this : INetworkListManager*, pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected.call(this, pbisconnected)
  end
  def get_connectivity(this : INetworkListManager*, pconnectivity : NLM_CONNECTIVITY*) : HRESULT
    @lpVtbl.value.get_connectivity.call(this, pconnectivity)
  end
  def set_simulated_profile_info(this : INetworkListManager*, psimulatedinfo : NLM_SIMULATED_PROFILE_INFO*) : HRESULT
    @lpVtbl.value.set_simulated_profile_info.call(this, psimulatedinfo)
  end
  def clear_simulated_profile_info(this : INetworkListManager*) : HRESULT
    @lpVtbl.value.clear_simulated_profile_info.call(this)
  end
end
struct LibWin32::INetworkListManagerEvents
  def query_interface(this : INetworkListManagerEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkListManagerEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkListManagerEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def connectivity_changed(this : INetworkListManagerEvents*, newconnectivity : NLM_CONNECTIVITY) : HRESULT
    @lpVtbl.value.connectivity_changed.call(this, newconnectivity)
  end
end
struct LibWin32::INetwork
  def query_interface(this : INetwork*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetwork*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetwork*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetwork*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetwork*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetwork*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetwork*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : INetwork*, psznetworkname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, psznetworkname)
  end
  def set_name(this : INetwork*, sznetworknewname : UInt8*) : HRESULT
    @lpVtbl.value.set_name.call(this, sznetworknewname)
  end
  def get_description(this : INetwork*, pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pszdescription)
  end
  def set_description(this : INetwork*, szdescription : UInt8*) : HRESULT
    @lpVtbl.value.set_description.call(this, szdescription)
  end
  def get_network_id(this : INetwork*, pgdguidnetworkid : Guid*) : HRESULT
    @lpVtbl.value.get_network_id.call(this, pgdguidnetworkid)
  end
  def get_domain_type(this : INetwork*, pnetworktype : NLM_DOMAIN_TYPE*) : HRESULT
    @lpVtbl.value.get_domain_type.call(this, pnetworktype)
  end
  def get_network_connections(this : INetwork*, ppenumnetworkconnection : IEnumNetworkConnections*) : HRESULT
    @lpVtbl.value.get_network_connections.call(this, ppenumnetworkconnection)
  end
  def get_time_created_and_connected(this : INetwork*, pdwlowdatetimecreated : UInt32*, pdwhighdatetimecreated : UInt32*, pdwlowdatetimeconnected : UInt32*, pdwhighdatetimeconnected : UInt32*) : HRESULT
    @lpVtbl.value.get_time_created_and_connected.call(this, pdwlowdatetimecreated, pdwhighdatetimecreated, pdwlowdatetimeconnected, pdwhighdatetimeconnected)
  end
  def get_is_connected_to_internet(this : INetwork*, pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected_to_internet.call(this, pbisconnected)
  end
  def get_is_connected(this : INetwork*, pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected.call(this, pbisconnected)
  end
  def get_connectivity(this : INetwork*, pconnectivity : NLM_CONNECTIVITY*) : HRESULT
    @lpVtbl.value.get_connectivity.call(this, pconnectivity)
  end
  def get_category(this : INetwork*, pcategory : NLM_NETWORK_CATEGORY*) : HRESULT
    @lpVtbl.value.get_category.call(this, pcategory)
  end
  def set_category(this : INetwork*, newcategory : NLM_NETWORK_CATEGORY) : HRESULT
    @lpVtbl.value.set_category.call(this, newcategory)
  end
end
struct LibWin32::IEnumNetworks
  def query_interface(this : IEnumNetworks*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetworks*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetworks*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEnumNetworks*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEnumNetworks*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEnumNetworks*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEnumNetworks*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IEnumNetworks*, ppenumvar : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenumvar)
  end
  def next(this : IEnumNetworks*, celt : UInt32, rgelt : INetwork*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumNetworks*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetworks*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetworks*, ppenumnetwork : IEnumNetworks*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenumnetwork)
  end
end
struct LibWin32::INetworkEvents
  def query_interface(this : INetworkEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def network_added(this : INetworkEvents*, networkid : Guid) : HRESULT
    @lpVtbl.value.network_added.call(this, networkid)
  end
  def network_deleted(this : INetworkEvents*, networkid : Guid) : HRESULT
    @lpVtbl.value.network_deleted.call(this, networkid)
  end
  def network_connectivity_changed(this : INetworkEvents*, networkid : Guid, newconnectivity : NLM_CONNECTIVITY) : HRESULT
    @lpVtbl.value.network_connectivity_changed.call(this, networkid, newconnectivity)
  end
  def network_property_changed(this : INetworkEvents*, networkid : Guid, flags : NLM_NETWORK_PROPERTY_CHANGE) : HRESULT
    @lpVtbl.value.network_property_changed.call(this, networkid, flags)
  end
end
struct LibWin32::INetworkConnection
  def query_interface(this : INetworkConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetworkConnection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetworkConnection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetworkConnection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetworkConnection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_network(this : INetworkConnection*, ppnetwork : INetwork*) : HRESULT
    @lpVtbl.value.get_network.call(this, ppnetwork)
  end
  def get_is_connected_to_internet(this : INetworkConnection*, pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected_to_internet.call(this, pbisconnected)
  end
  def get_is_connected(this : INetworkConnection*, pbisconnected : Int16*) : HRESULT
    @lpVtbl.value.get_is_connected.call(this, pbisconnected)
  end
  def get_connectivity(this : INetworkConnection*, pconnectivity : NLM_CONNECTIVITY*) : HRESULT
    @lpVtbl.value.get_connectivity.call(this, pconnectivity)
  end
  def get_connection_id(this : INetworkConnection*, pgdconnectionid : Guid*) : HRESULT
    @lpVtbl.value.get_connection_id.call(this, pgdconnectionid)
  end
  def get_adapter_id(this : INetworkConnection*, pgdadapterid : Guid*) : HRESULT
    @lpVtbl.value.get_adapter_id.call(this, pgdadapterid)
  end
  def get_domain_type(this : INetworkConnection*, pdomaintype : NLM_DOMAIN_TYPE*) : HRESULT
    @lpVtbl.value.get_domain_type.call(this, pdomaintype)
  end
end
struct LibWin32::IEnumNetworkConnections
  def query_interface(this : IEnumNetworkConnections*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetworkConnections*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetworkConnections*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEnumNetworkConnections*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEnumNetworkConnections*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEnumNetworkConnections*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEnumNetworkConnections*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IEnumNetworkConnections*, ppenumvar : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenumvar)
  end
  def next(this : IEnumNetworkConnections*, celt : UInt32, rgelt : INetworkConnection*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumNetworkConnections*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetworkConnections*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetworkConnections*, ppenumnetwork : IEnumNetworkConnections*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenumnetwork)
  end
end
struct LibWin32::INetworkConnectionEvents
  def query_interface(this : INetworkConnectionEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkConnectionEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkConnectionEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def network_connection_connectivity_changed(this : INetworkConnectionEvents*, connectionid : Guid, newconnectivity : NLM_CONNECTIVITY) : HRESULT
    @lpVtbl.value.network_connection_connectivity_changed.call(this, connectionid, newconnectivity)
  end
  def network_connection_property_changed(this : INetworkConnectionEvents*, connectionid : Guid, flags : NLM_CONNECTION_PROPERTY_CHANGE) : HRESULT
    @lpVtbl.value.network_connection_property_changed.call(this, connectionid, flags)
  end
end
struct LibWin32::INetworkCostManager
  def query_interface(this : INetworkCostManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkCostManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkCostManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_cost(this : INetworkCostManager*, pcost : UInt32*, pdestipaddr : NLM_SOCKADDR*) : HRESULT
    @lpVtbl.value.get_cost.call(this, pcost, pdestipaddr)
  end
  def get_data_plan_status(this : INetworkCostManager*, pdataplanstatus : NLM_DATAPLAN_STATUS*, pdestipaddr : NLM_SOCKADDR*) : HRESULT
    @lpVtbl.value.get_data_plan_status.call(this, pdataplanstatus, pdestipaddr)
  end
  def set_destination_addresses(this : INetworkCostManager*, length : UInt32, pdestipaddrlist : NLM_SOCKADDR*, bappend : Int16) : HRESULT
    @lpVtbl.value.set_destination_addresses.call(this, length, pdestipaddrlist, bappend)
  end
end
struct LibWin32::INetworkCostManagerEvents
  def query_interface(this : INetworkCostManagerEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkCostManagerEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkCostManagerEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def cost_changed(this : INetworkCostManagerEvents*, newcost : UInt32, pdestaddr : NLM_SOCKADDR*) : HRESULT
    @lpVtbl.value.cost_changed.call(this, newcost, pdestaddr)
  end
  def data_plan_status_changed(this : INetworkCostManagerEvents*, pdestaddr : NLM_SOCKADDR*) : HRESULT
    @lpVtbl.value.data_plan_status_changed.call(this, pdestaddr)
  end
end
struct LibWin32::INetworkConnectionCost
  def query_interface(this : INetworkConnectionCost*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkConnectionCost*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkConnectionCost*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_cost(this : INetworkConnectionCost*, pcost : UInt32*) : HRESULT
    @lpVtbl.value.get_cost.call(this, pcost)
  end
  def get_data_plan_status(this : INetworkConnectionCost*, pdataplanstatus : NLM_DATAPLAN_STATUS*) : HRESULT
    @lpVtbl.value.get_data_plan_status.call(this, pdataplanstatus)
  end
end
struct LibWin32::INetworkConnectionCostEvents
  def query_interface(this : INetworkConnectionCostEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkConnectionCostEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkConnectionCostEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def connection_cost_changed(this : INetworkConnectionCostEvents*, connectionid : Guid, newcost : UInt32) : HRESULT
    @lpVtbl.value.connection_cost_changed.call(this, connectionid, newcost)
  end
  def connection_data_plan_status_changed(this : INetworkConnectionCostEvents*, connectionid : Guid) : HRESULT
    @lpVtbl.value.connection_data_plan_status_changed.call(this, connectionid)
  end
end
