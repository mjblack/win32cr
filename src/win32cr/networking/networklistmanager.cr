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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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
