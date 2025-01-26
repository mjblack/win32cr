require "./../foundation.cr"
require "./../system/com.cr"
require "./../system/ole.cr"

module Win32cr::Networking::NetworkListManager
  NA_DomainAuthenticationFailed = "NA_DomainAuthenticationFailed"
  NA_NetworkClass = "NA_NetworkClass"
  NA_NameSetByPolicy = "NA_NameSetByPolicy"
  NA_IconSetByPolicy = "NA_IconSetByPolicy"
  NA_DescriptionSetByPolicy = "NA_DescriptionSetByPolicy"
  NA_CategorySetByPolicy = "NA_CategorySetByPolicy"
  NA_NameReadOnly = "NA_NameReadOnly"
  NA_IconReadOnly = "NA_IconReadOnly"
  NA_DescriptionReadOnly = "NA_DescriptionReadOnly"
  NA_CategoryReadOnly = "NA_CategoryReadOnly"
  NA_AllowMerge = "NA_AllowMerge"
  NA_InternetConnectivityV4 = "NA_InternetConnectivityV4"
  NA_InternetConnectivityV6 = "NA_InternetConnectivityV6"
  NLM_MAX_ADDRESS_LIST_SIZE = 10_u32
  NLM_UNKNOWN_DATAPLAN_STATUS = 4294967295_u32

  CLSID_NetworkListManager = LibC::GUID.new(0xdcb00c01_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])

  enum NLM_CONNECTION_COST
    NLM_CONNECTION_COST_UNKNOWN = 0_i32
    NLM_CONNECTION_COST_UNRESTRICTED = 1_i32
    NLM_CONNECTION_COST_FIXED = 2_i32
    NLM_CONNECTION_COST_VARIABLE = 4_i32
    NLM_CONNECTION_COST_OVERDATALIMIT = 65536_i32
    NLM_CONNECTION_COST_CONGESTED = 131072_i32
    NLM_CONNECTION_COST_ROAMING = 262144_i32
    NLM_CONNECTION_COST_APPROACHINGDATALIMIT = 524288_i32
  end
  enum NLM_NETWORK_CLASS
    NLM_NETWORK_IDENTIFYING = 1_i32
    NLM_NETWORK_IDENTIFIED = 2_i32
    NLM_NETWORK_UNIDENTIFIED = 3_i32
  end
  enum NLM_INTERNET_CONNECTIVITY
    NLM_INTERNET_CONNECTIVITY_WEBHIJACK = 1_i32
    NLM_INTERNET_CONNECTIVITY_PROXIED = 2_i32
    NLM_INTERNET_CONNECTIVITY_CORPORATE = 4_i32
  end
  enum NLM_CONNECTIVITY
    NLM_CONNECTIVITY_DISCONNECTED = 0_i32
    NLM_CONNECTIVITY_IPV4_NOTRAFFIC = 1_i32
    NLM_CONNECTIVITY_IPV6_NOTRAFFIC = 2_i32
    NLM_CONNECTIVITY_IPV4_SUBNET = 16_i32
    NLM_CONNECTIVITY_IPV4_LOCALNETWORK = 32_i32
    NLM_CONNECTIVITY_IPV4_INTERNET = 64_i32
    NLM_CONNECTIVITY_IPV6_SUBNET = 256_i32
    NLM_CONNECTIVITY_IPV6_LOCALNETWORK = 512_i32
    NLM_CONNECTIVITY_IPV6_INTERNET = 1024_i32
  end
  enum NLM_DOMAIN_TYPE
    NLM_DOMAIN_TYPE_NON_DOMAIN_NETWORK = 0_i32
    NLM_DOMAIN_TYPE_DOMAIN_NETWORK = 1_i32
    NLM_DOMAIN_TYPE_DOMAIN_AUTHENTICATED = 2_i32
  end
  enum NLM_ENUM_NETWORK
    NLM_ENUM_NETWORK_CONNECTED = 1_i32
    NLM_ENUM_NETWORK_DISCONNECTED = 2_i32
    NLM_ENUM_NETWORK_ALL = 3_i32
  end
  enum NLM_NETWORK_CATEGORY
    NLM_NETWORK_CATEGORY_PUBLIC = 0_i32
    NLM_NETWORK_CATEGORY_PRIVATE = 1_i32
    NLM_NETWORK_CATEGORY_DOMAIN_AUTHENTICATED = 2_i32
  end
  enum NLM_NETWORK_PROPERTY_CHANGE
    NLM_NETWORK_PROPERTY_CHANGE_CONNECTION = 1_i32
    NLM_NETWORK_PROPERTY_CHANGE_DESCRIPTION = 2_i32
    NLM_NETWORK_PROPERTY_CHANGE_NAME = 4_i32
    NLM_NETWORK_PROPERTY_CHANGE_ICON = 8_i32
    NLM_NETWORK_PROPERTY_CHANGE_CATEGORY_VALUE = 16_i32
  end
  enum NLM_CONNECTION_PROPERTY_CHANGE
    NLM_CONNECTION_PROPERTY_CHANGE_AUTHENTICATION = 1_i32
  end

  @[Extern]
  struct NLM_USAGE_DATA
    property usage_in_megabytes : UInt32
    property last_sync_time : Win32cr::Foundation::FILETIME
    def initialize(@usage_in_megabytes : UInt32, @last_sync_time : Win32cr::Foundation::FILETIME)
    end
  end

  @[Extern]
  struct NLM_DATAPLAN_STATUS
    property interface_guid : LibC::GUID
    property usage_data : Win32cr::Networking::NetworkListManager::NLM_USAGE_DATA
    property data_limit_in_megabytes : UInt32
    property inbound_bandwidth_in_kbps : UInt32
    property outbound_bandwidth_in_kbps : UInt32
    property next_billing_cycle : Win32cr::Foundation::FILETIME
    property max_transfer_size_in_megabytes : UInt32
    property reserved : UInt32
    def initialize(@interface_guid : LibC::GUID, @usage_data : Win32cr::Networking::NetworkListManager::NLM_USAGE_DATA, @data_limit_in_megabytes : UInt32, @inbound_bandwidth_in_kbps : UInt32, @outbound_bandwidth_in_kbps : UInt32, @next_billing_cycle : Win32cr::Foundation::FILETIME, @max_transfer_size_in_megabytes : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct NLM_SOCKADDR
    property data : UInt8[128]
    def initialize(@data : UInt8[128])
    end
  end

  @[Extern]
  struct NLM_SIMULATED_PROFILE_INFO
    property profile_name : UInt16[256]
    property cost : Win32cr::Networking::NetworkListManager::NLM_CONNECTION_COST
    property usage_in_megabytes : UInt32
    property data_limit_in_megabytes : UInt32
    def initialize(@profile_name : UInt16[256], @cost : Win32cr::Networking::NetworkListManager::NLM_CONNECTION_COST, @usage_in_megabytes : UInt32, @data_limit_in_megabytes : UInt32)
    end
  end

  @[Extern]
  record INetworkListManagerVtbl,
    query_interface : Proc(INetworkListManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkListManager*, UInt32),
    release : Proc(INetworkListManager*, UInt32),
    get_type_info_count : Proc(INetworkListManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetworkListManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetworkListManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetworkListManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_networks : Proc(INetworkListManager*, Win32cr::Networking::NetworkListManager::NLM_ENUM_NETWORK, Void**, Win32cr::Foundation::HRESULT),
    get_network : Proc(INetworkListManager*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT),
    get_network_connections : Proc(INetworkListManager*, Void**, Win32cr::Foundation::HRESULT),
    get_network_connection : Proc(INetworkListManager*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT),
    get_IsConnectedToInternet : Proc(INetworkListManager*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsConnected : Proc(INetworkListManager*, Int16*, Win32cr::Foundation::HRESULT),
    get_connectivity : Proc(INetworkListManager*, Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY*, Win32cr::Foundation::HRESULT),
    set_simulated_profile_info : Proc(INetworkListManager*, Win32cr::Networking::NetworkListManager::NLM_SIMULATED_PROFILE_INFO*, Win32cr::Foundation::HRESULT),
    clear_simulated_profile_info : Proc(INetworkListManager*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkListManager, lpVtbl : INetworkListManagerVtbl* do
    GUID = LibC::GUID.new(0xdcb00000_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetworkListManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkListManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkListManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetworkListManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetworkListManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetworkListManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetworkListManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_networks(this : INetworkListManager*, flags : Win32cr::Networking::NetworkListManager::NLM_ENUM_NETWORK, ppEnumNetwork : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_networks.call(this, flags, ppEnumNetwork)
    end
    def get_network(this : INetworkListManager*, gdNetworkId : LibC::GUID, ppNetwork : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network.call(this, gdNetworkId, ppNetwork)
    end
    def get_network_connections(this : INetworkListManager*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_connections.call(this, ppEnum)
    end
    def get_network_connection(this : INetworkListManager*, gdNetworkConnectionId : LibC::GUID, ppNetworkConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_connection.call(this, gdNetworkConnectionId, ppNetworkConnection)
    end
    def get_IsConnectedToInternet(this : INetworkListManager*, pbIsConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsConnectedToInternet.call(this, pbIsConnected)
    end
    def get_IsConnected(this : INetworkListManager*, pbIsConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsConnected.call(this, pbIsConnected)
    end
    def get_connectivity(this : INetworkListManager*, pConnectivity : Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connectivity.call(this, pConnectivity)
    end
    def set_simulated_profile_info(this : INetworkListManager*, pSimulatedInfo : Win32cr::Networking::NetworkListManager::NLM_SIMULATED_PROFILE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_simulated_profile_info.call(this, pSimulatedInfo)
    end
    def clear_simulated_profile_info(this : INetworkListManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_simulated_profile_info.call(this)
    end

  end

  @[Extern]
  record INetworkListManagerEventsVtbl,
    query_interface : Proc(INetworkListManagerEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkListManagerEvents*, UInt32),
    release : Proc(INetworkListManagerEvents*, UInt32),
    connectivity_changed : Proc(INetworkListManagerEvents*, Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkListManagerEvents, lpVtbl : INetworkListManagerEventsVtbl* do
    GUID = LibC::GUID.new(0xdcb00001_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetworkListManagerEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkListManagerEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkListManagerEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connectivity_changed(this : INetworkListManagerEvents*, newConnectivity : Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connectivity_changed.call(this, newConnectivity)
    end

  end

  @[Extern]
  record INetworkVtbl,
    query_interface : Proc(INetwork*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetwork*, UInt32),
    release : Proc(INetwork*, UInt32),
    get_type_info_count : Proc(INetwork*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetwork*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetwork*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetwork*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_name : Proc(INetwork*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(INetwork*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(INetwork*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_description : Proc(INetwork*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_network_id : Proc(INetwork*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_domain_type : Proc(INetwork*, Win32cr::Networking::NetworkListManager::NLM_DOMAIN_TYPE*, Win32cr::Foundation::HRESULT),
    get_network_connections : Proc(INetwork*, Void**, Win32cr::Foundation::HRESULT),
    get_time_created_and_connected : Proc(INetwork*, UInt32*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_IsConnectedToInternet : Proc(INetwork*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsConnected : Proc(INetwork*, Int16*, Win32cr::Foundation::HRESULT),
    get_connectivity : Proc(INetwork*, Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY*, Win32cr::Foundation::HRESULT),
    get_category : Proc(INetwork*, Win32cr::Networking::NetworkListManager::NLM_NETWORK_CATEGORY*, Win32cr::Foundation::HRESULT),
    set_category : Proc(INetwork*, Win32cr::Networking::NetworkListManager::NLM_NETWORK_CATEGORY, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetwork, lpVtbl : INetworkVtbl* do
    GUID = LibC::GUID.new(0xdcb00002_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetwork*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetwork*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetwork*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetwork*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetwork*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetwork*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetwork*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_name(this : INetwork*, pszNetworkName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pszNetworkName)
    end
    def set_name(this : INetwork*, szNetworkNewName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, szNetworkNewName)
    end
    def get_description(this : INetwork*, pszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pszDescription)
    end
    def set_description(this : INetwork*, szDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, szDescription)
    end
    def get_network_id(this : INetwork*, pgdGuidNetworkId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_id.call(this, pgdGuidNetworkId)
    end
    def get_domain_type(this : INetwork*, pNetworkType : Win32cr::Networking::NetworkListManager::NLM_DOMAIN_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_domain_type.call(this, pNetworkType)
    end
    def get_network_connections(this : INetwork*, ppEnumNetworkConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_connections.call(this, ppEnumNetworkConnection)
    end
    def get_time_created_and_connected(this : INetwork*, pdwLowDateTimeCreated : UInt32*, pdwHighDateTimeCreated : UInt32*, pdwLowDateTimeConnected : UInt32*, pdwHighDateTimeConnected : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time_created_and_connected.call(this, pdwLowDateTimeCreated, pdwHighDateTimeCreated, pdwLowDateTimeConnected, pdwHighDateTimeConnected)
    end
    def get_IsConnectedToInternet(this : INetwork*, pbIsConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsConnectedToInternet.call(this, pbIsConnected)
    end
    def get_IsConnected(this : INetwork*, pbIsConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsConnected.call(this, pbIsConnected)
    end
    def get_connectivity(this : INetwork*, pConnectivity : Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connectivity.call(this, pConnectivity)
    end
    def get_category(this : INetwork*, pCategory : Win32cr::Networking::NetworkListManager::NLM_NETWORK_CATEGORY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category.call(this, pCategory)
    end
    def set_category(this : INetwork*, new_category : Win32cr::Networking::NetworkListManager::NLM_NETWORK_CATEGORY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_category.call(this, new_category)
    end

  end

  @[Extern]
  record IEnumNetworksVtbl,
    query_interface : Proc(IEnumNetworks*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumNetworks*, UInt32),
    release : Proc(IEnumNetworks*, UInt32),
    get_type_info_count : Proc(IEnumNetworks*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEnumNetworks*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEnumNetworks*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEnumNetworks*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IEnumNetworks*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumNetworks*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumNetworks*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumNetworks*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumNetworks*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumNetworks, lpVtbl : IEnumNetworksVtbl* do
    GUID = LibC::GUID.new(0xdcb00003_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : IEnumNetworks*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumNetworks*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumNetworks*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEnumNetworks*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEnumNetworks*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEnumNetworks*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEnumNetworks*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IEnumNetworks*, ppEnumVar : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumVar)
    end
    def next__(this : IEnumNetworks*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumNetworks*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumNetworks*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumNetworks*, ppEnumNetwork : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnumNetwork)
    end

  end

  @[Extern]
  record INetworkEventsVtbl,
    query_interface : Proc(INetworkEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkEvents*, UInt32),
    release : Proc(INetworkEvents*, UInt32),
    network_added : Proc(INetworkEvents*, LibC::GUID, Win32cr::Foundation::HRESULT),
    network_deleted : Proc(INetworkEvents*, LibC::GUID, Win32cr::Foundation::HRESULT),
    network_connectivity_changed : Proc(INetworkEvents*, LibC::GUID, Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY, Win32cr::Foundation::HRESULT),
    network_property_changed : Proc(INetworkEvents*, LibC::GUID, Win32cr::Networking::NetworkListManager::NLM_NETWORK_PROPERTY_CHANGE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkEvents, lpVtbl : INetworkEventsVtbl* do
    GUID = LibC::GUID.new(0xdcb00004_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetworkEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def network_added(this : INetworkEvents*, networkId : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.network_added.call(this, networkId)
    end
    def network_deleted(this : INetworkEvents*, networkId : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.network_deleted.call(this, networkId)
    end
    def network_connectivity_changed(this : INetworkEvents*, networkId : LibC::GUID, newConnectivity : Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.network_connectivity_changed.call(this, networkId, newConnectivity)
    end
    def network_property_changed(this : INetworkEvents*, networkId : LibC::GUID, flags : Win32cr::Networking::NetworkListManager::NLM_NETWORK_PROPERTY_CHANGE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.network_property_changed.call(this, networkId, flags)
    end

  end

  @[Extern]
  record INetworkConnectionVtbl,
    query_interface : Proc(INetworkConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkConnection*, UInt32),
    release : Proc(INetworkConnection*, UInt32),
    get_type_info_count : Proc(INetworkConnection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetworkConnection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetworkConnection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetworkConnection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_network : Proc(INetworkConnection*, Void**, Win32cr::Foundation::HRESULT),
    get_IsConnectedToInternet : Proc(INetworkConnection*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsConnected : Proc(INetworkConnection*, Int16*, Win32cr::Foundation::HRESULT),
    get_connectivity : Proc(INetworkConnection*, Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY*, Win32cr::Foundation::HRESULT),
    get_connection_id : Proc(INetworkConnection*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_adapter_id : Proc(INetworkConnection*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_domain_type : Proc(INetworkConnection*, Win32cr::Networking::NetworkListManager::NLM_DOMAIN_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkConnection, lpVtbl : INetworkConnectionVtbl* do
    GUID = LibC::GUID.new(0xdcb00005_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetworkConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetworkConnection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetworkConnection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetworkConnection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetworkConnection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_network(this : INetworkConnection*, ppNetwork : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network.call(this, ppNetwork)
    end
    def get_IsConnectedToInternet(this : INetworkConnection*, pbIsConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsConnectedToInternet.call(this, pbIsConnected)
    end
    def get_IsConnected(this : INetworkConnection*, pbIsConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsConnected.call(this, pbIsConnected)
    end
    def get_connectivity(this : INetworkConnection*, pConnectivity : Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connectivity.call(this, pConnectivity)
    end
    def get_connection_id(this : INetworkConnection*, pgdConnectionId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_id.call(this, pgdConnectionId)
    end
    def get_adapter_id(this : INetworkConnection*, pgdAdapterId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adapter_id.call(this, pgdAdapterId)
    end
    def get_domain_type(this : INetworkConnection*, pDomainType : Win32cr::Networking::NetworkListManager::NLM_DOMAIN_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_domain_type.call(this, pDomainType)
    end

  end

  @[Extern]
  record IEnumNetworkConnectionsVtbl,
    query_interface : Proc(IEnumNetworkConnections*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumNetworkConnections*, UInt32),
    release : Proc(IEnumNetworkConnections*, UInt32),
    get_type_info_count : Proc(IEnumNetworkConnections*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEnumNetworkConnections*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEnumNetworkConnections*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEnumNetworkConnections*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IEnumNetworkConnections*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumNetworkConnections*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumNetworkConnections*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumNetworkConnections*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumNetworkConnections*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumNetworkConnections, lpVtbl : IEnumNetworkConnectionsVtbl* do
    GUID = LibC::GUID.new(0xdcb00006_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : IEnumNetworkConnections*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumNetworkConnections*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumNetworkConnections*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEnumNetworkConnections*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEnumNetworkConnections*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEnumNetworkConnections*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEnumNetworkConnections*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IEnumNetworkConnections*, ppEnumVar : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumVar)
    end
    def next__(this : IEnumNetworkConnections*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumNetworkConnections*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumNetworkConnections*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumNetworkConnections*, ppEnumNetwork : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnumNetwork)
    end

  end

  @[Extern]
  record INetworkConnectionEventsVtbl,
    query_interface : Proc(INetworkConnectionEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkConnectionEvents*, UInt32),
    release : Proc(INetworkConnectionEvents*, UInt32),
    network_connection_connectivity_changed : Proc(INetworkConnectionEvents*, LibC::GUID, Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY, Win32cr::Foundation::HRESULT),
    network_connection_property_changed : Proc(INetworkConnectionEvents*, LibC::GUID, Win32cr::Networking::NetworkListManager::NLM_CONNECTION_PROPERTY_CHANGE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkConnectionEvents, lpVtbl : INetworkConnectionEventsVtbl* do
    GUID = LibC::GUID.new(0xdcb00007_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetworkConnectionEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkConnectionEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkConnectionEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def network_connection_connectivity_changed(this : INetworkConnectionEvents*, connectionId : LibC::GUID, newConnectivity : Win32cr::Networking::NetworkListManager::NLM_CONNECTIVITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.network_connection_connectivity_changed.call(this, connectionId, newConnectivity)
    end
    def network_connection_property_changed(this : INetworkConnectionEvents*, connectionId : LibC::GUID, flags : Win32cr::Networking::NetworkListManager::NLM_CONNECTION_PROPERTY_CHANGE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.network_connection_property_changed.call(this, connectionId, flags)
    end

  end

  @[Extern]
  record INetworkCostManagerVtbl,
    query_interface : Proc(INetworkCostManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkCostManager*, UInt32),
    release : Proc(INetworkCostManager*, UInt32),
    get_cost : Proc(INetworkCostManager*, UInt32*, Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*, Win32cr::Foundation::HRESULT),
    get_data_plan_status : Proc(INetworkCostManager*, Win32cr::Networking::NetworkListManager::NLM_DATAPLAN_STATUS*, Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*, Win32cr::Foundation::HRESULT),
    set_destination_addresses : Proc(INetworkCostManager*, UInt32, Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkCostManager, lpVtbl : INetworkCostManagerVtbl* do
    GUID = LibC::GUID.new(0xdcb00008_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetworkCostManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkCostManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkCostManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_cost(this : INetworkCostManager*, pCost : UInt32*, pDestIPAddr : Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cost.call(this, pCost, pDestIPAddr)
    end
    def get_data_plan_status(this : INetworkCostManager*, pDataPlanStatus : Win32cr::Networking::NetworkListManager::NLM_DATAPLAN_STATUS*, pDestIPAddr : Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_plan_status.call(this, pDataPlanStatus, pDestIPAddr)
    end
    def set_destination_addresses(this : INetworkCostManager*, length : UInt32, pDestIPAddrList : Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*, bAppend : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_destination_addresses.call(this, length, pDestIPAddrList, bAppend)
    end

  end

  @[Extern]
  record INetworkCostManagerEventsVtbl,
    query_interface : Proc(INetworkCostManagerEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkCostManagerEvents*, UInt32),
    release : Proc(INetworkCostManagerEvents*, UInt32),
    cost_changed : Proc(INetworkCostManagerEvents*, UInt32, Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*, Win32cr::Foundation::HRESULT),
    data_plan_status_changed : Proc(INetworkCostManagerEvents*, Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkCostManagerEvents, lpVtbl : INetworkCostManagerEventsVtbl* do
    GUID = LibC::GUID.new(0xdcb00009_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetworkCostManagerEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkCostManagerEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkCostManagerEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cost_changed(this : INetworkCostManagerEvents*, newCost : UInt32, pDestAddr : Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cost_changed.call(this, newCost, pDestAddr)
    end
    def data_plan_status_changed(this : INetworkCostManagerEvents*, pDestAddr : Win32cr::Networking::NetworkListManager::NLM_SOCKADDR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.data_plan_status_changed.call(this, pDestAddr)
    end

  end

  @[Extern]
  record INetworkConnectionCostVtbl,
    query_interface : Proc(INetworkConnectionCost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkConnectionCost*, UInt32),
    release : Proc(INetworkConnectionCost*, UInt32),
    get_cost : Proc(INetworkConnectionCost*, UInt32*, Win32cr::Foundation::HRESULT),
    get_data_plan_status : Proc(INetworkConnectionCost*, Win32cr::Networking::NetworkListManager::NLM_DATAPLAN_STATUS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkConnectionCost, lpVtbl : INetworkConnectionCostVtbl* do
    GUID = LibC::GUID.new(0xdcb0000a_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetworkConnectionCost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkConnectionCost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkConnectionCost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_cost(this : INetworkConnectionCost*, pCost : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cost.call(this, pCost)
    end
    def get_data_plan_status(this : INetworkConnectionCost*, pDataPlanStatus : Win32cr::Networking::NetworkListManager::NLM_DATAPLAN_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_plan_status.call(this, pDataPlanStatus)
    end

  end

  @[Extern]
  record INetworkConnectionCostEventsVtbl,
    query_interface : Proc(INetworkConnectionCostEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkConnectionCostEvents*, UInt32),
    release : Proc(INetworkConnectionCostEvents*, UInt32),
    connection_cost_changed : Proc(INetworkConnectionCostEvents*, LibC::GUID, UInt32, Win32cr::Foundation::HRESULT),
    connection_data_plan_status_changed : Proc(INetworkConnectionCostEvents*, LibC::GUID, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetworkConnectionCostEvents, lpVtbl : INetworkConnectionCostEventsVtbl* do
    GUID = LibC::GUID.new(0xdcb0000b_u32, 0x570f_u16, 0x4a9b_u16, StaticArray[0x8d_u8, 0x69_u8, 0x19_u8, 0x9f_u8, 0xdb_u8, 0xa5_u8, 0x72_u8, 0x3b_u8])
    def query_interface(this : INetworkConnectionCostEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkConnectionCostEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkConnectionCostEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connection_cost_changed(this : INetworkConnectionCostEvents*, connectionId : LibC::GUID, newCost : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connection_cost_changed.call(this, connectionId, newCost)
    end
    def connection_data_plan_status_changed(this : INetworkConnectionCostEvents*, connectionId : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connection_data_plan_status_changed.call(this, connectionId)
    end

  end

end