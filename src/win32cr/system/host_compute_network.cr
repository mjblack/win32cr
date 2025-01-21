require "./../foundation.cr"

module Win32cr::System::HostComputeNetwork
  alias HCN_NOTIFICATION_CALLBACK = Proc(UInt32, Void*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Void)*


  enum HCN_NOTIFICATIONS
    HcnNotificationInvalid = 0_i32
    HcnNotificationNetworkPreCreate = 1_i32
    HcnNotificationNetworkCreate = 2_i32
    HcnNotificationNetworkPreDelete = 3_i32
    HcnNotificationNetworkDelete = 4_i32
    HcnNotificationNamespaceCreate = 5_i32
    HcnNotificationNamespaceDelete = 6_i32
    HcnNotificationGuestNetworkServiceCreate = 7_i32
    HcnNotificationGuestNetworkServiceDelete = 8_i32
    HcnNotificationNetworkEndpointAttached = 9_i32
    HcnNotificationNetworkEndpointDetached = 16_i32
    HcnNotificationGuestNetworkServiceStateChanged = 17_i32
    HcnNotificationGuestNetworkServiceInterfaceStateChanged = 18_i32
    HcnNotificationServiceDisconnect = 16777216_i32
    HcnNotificationFlagsReserved = -268435456_i32
  end
  enum HCN_PORT_PROTOCOL
    HCN_PORT_PROTOCOL_TCP = 1_i32
    HCN_PORT_PROTOCOL_UDP = 2_i32
    HCN_PORT_PROTOCOL_BOTH = 3_i32
  end
  enum HCN_PORT_ACCESS
    HCN_PORT_ACCESS_EXCLUSIVE = 1_i32
    HCN_PORT_ACCESS_SHARED = 2_i32
  end

  @[Extern]
  record HCN_PORT_RANGE_RESERVATION,
    startingPort : UInt16,
    endingPort : UInt16

  @[Extern]
  record HCN_PORT_RANGE_ENTRY,
    owning_partition_id : LibC::GUID,
    target_partition_id : LibC::GUID,
    protocol : Win32cr::System::HostComputeNetwork::HCN_PORT_PROTOCOL,
    priority : UInt64,
    reservation_type : UInt32,
    sharing_flags : UInt32,
    delivery_mode : UInt32,
    starting_port : UInt16,
    ending_port : UInt16

  @[Link("computenetwork")]
  lib C
    fun HcnEnumerateNetworks(query : Win32cr::Foundation::PWSTR, networks : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnCreateNetwork(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, network : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnOpenNetwork(id : LibC::GUID*, network : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnModifyNetwork(network : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnQueryNetworkProperties(network : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnDeleteNetwork(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnCloseNetwork(network : Void*) : Win32cr::Foundation::HRESULT

    fun HcnEnumerateNamespaces(query : Win32cr::Foundation::PWSTR, namespaces : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnCreateNamespace(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, namespace : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnOpenNamespace(id : LibC::GUID*, namespace : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnModifyNamespace(namespace : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnQueryNamespaceProperties(namespace : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnDeleteNamespace(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnCloseNamespace(namespace : Void*) : Win32cr::Foundation::HRESULT

    fun HcnEnumerateEndpoints(query : Win32cr::Foundation::PWSTR, endpoints : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnCreateEndpoint(network : Void*, id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, endpoint : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnOpenEndpoint(id : LibC::GUID*, endpoint : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnModifyEndpoint(endpoint : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnQueryEndpointProperties(endpoint : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnDeleteEndpoint(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnCloseEndpoint(endpoint : Void*) : Win32cr::Foundation::HRESULT

    fun HcnEnumerateLoadBalancers(query : Win32cr::Foundation::PWSTR, load_balancer : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnCreateLoadBalancer(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, load_balancer : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnOpenLoadBalancer(id : LibC::GUID*, load_balancer : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnModifyLoadBalancer(load_balancer : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnQueryLoadBalancerProperties(load_balancer : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnDeleteLoadBalancer(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnCloseLoadBalancer(load_balancer : Void*) : Win32cr::Foundation::HRESULT

    fun HcnRegisterServiceCallback(callback : Win32cr::System::HostComputeNetwork::HCN_NOTIFICATION_CALLBACK, context : Void*, callback_handle : Void**) : Win32cr::Foundation::HRESULT

    fun HcnUnregisterServiceCallback(callback_handle : Void*) : Win32cr::Foundation::HRESULT

    fun HcnRegisterGuestNetworkServiceCallback(guest_network_service : Void*, callback : Win32cr::System::HostComputeNetwork::HCN_NOTIFICATION_CALLBACK, context : Void*, callback_handle : Void**) : Win32cr::Foundation::HRESULT

    fun HcnUnregisterGuestNetworkServiceCallback(callback_handle : Void*) : Win32cr::Foundation::HRESULT

    fun HcnCreateGuestNetworkService(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, guest_network_service : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnCloseGuestNetworkService(guest_network_service : Void*) : Win32cr::Foundation::HRESULT

    fun HcnModifyGuestNetworkService(guest_network_service : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnDeleteGuestNetworkService(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcnReserveGuestNetworkServicePort(guest_network_service : Void*, protocol : Win32cr::System::HostComputeNetwork::HCN_PORT_PROTOCOL, access : Win32cr::System::HostComputeNetwork::HCN_PORT_ACCESS, port : UInt16, port_reservation_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun HcnReserveGuestNetworkServicePortRange(guest_network_service : Void*, port_count : UInt16, port_range_reservation : Win32cr::System::HostComputeNetwork::HCN_PORT_RANGE_RESERVATION*, port_reservation_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun HcnReleaseGuestNetworkServicePortReservationHandle(port_reservation_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun HcnEnumerateGuestNetworkPortReservations(return_count : UInt32*, port_entries : Win32cr::System::HostComputeNetwork::HCN_PORT_RANGE_ENTRY**) : Win32cr::Foundation::HRESULT

    fun HcnFreeGuestNetworkPortReservations(port_entries : Win32cr::System::HostComputeNetwork::HCN_PORT_RANGE_ENTRY*) : Void

  end
end