require "./../foundation.cr"

module Win32cr::System::HostComputeNetwork
  extend self
  alias HCN_NOTIFICATION_CALLBACK = Proc(UInt32, Void*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Void)


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
  struct HCN_PORT_RANGE_RESERVATION
    property startingPort : UInt16
    property endingPort : UInt16
    def initialize(@startingPort : UInt16, @endingPort : UInt16)
    end
  end

  @[Extern]
  struct HCN_PORT_RANGE_ENTRY
    property owning_partition_id : LibC::GUID
    property target_partition_id : LibC::GUID
    property protocol : Win32cr::System::HostComputeNetwork::HCN_PORT_PROTOCOL
    property priority : UInt64
    property reservation_type : UInt32
    property sharing_flags : UInt32
    property delivery_mode : UInt32
    property starting_port : UInt16
    property ending_port : UInt16
    def initialize(@owning_partition_id : LibC::GUID, @target_partition_id : LibC::GUID, @protocol : Win32cr::System::HostComputeNetwork::HCN_PORT_PROTOCOL, @priority : UInt64, @reservation_type : UInt32, @sharing_flags : UInt32, @delivery_mode : UInt32, @starting_port : UInt16, @ending_port : UInt16)
    end
  end

  def hcnEnumerateNetworks(query : Win32cr::Foundation::PWSTR, networks : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnEnumerateNetworks(query, networks, error_record)
    {% end %}
  end

  def hcnCreateNetwork(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, network : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCreateNetwork(id, settings, network, error_record)
    {% end %}
  end

  def hcnOpenNetwork(id : LibC::GUID*, network : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnOpenNetwork(id, network, error_record)
    {% end %}
  end

  def hcnModifyNetwork(network : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnModifyNetwork(network, settings, error_record)
    {% end %}
  end

  def hcnQueryNetworkProperties(network : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnQueryNetworkProperties(network, query, properties, error_record)
    {% end %}
  end

  def hcnDeleteNetwork(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnDeleteNetwork(id, error_record)
    {% end %}
  end

  def hcnCloseNetwork(network : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCloseNetwork(network)
    {% end %}
  end

  def hcnEnumerateNamespaces(query : Win32cr::Foundation::PWSTR, namespaces : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnEnumerateNamespaces(query, namespaces, error_record)
    {% end %}
  end

  def hcnCreateNamespace(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, namespace : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCreateNamespace(id, settings, namespace, error_record)
    {% end %}
  end

  def hcnOpenNamespace(id : LibC::GUID*, namespace : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnOpenNamespace(id, namespace, error_record)
    {% end %}
  end

  def hcnModifyNamespace(namespace : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnModifyNamespace(namespace, settings, error_record)
    {% end %}
  end

  def hcnQueryNamespaceProperties(namespace : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnQueryNamespaceProperties(namespace, query, properties, error_record)
    {% end %}
  end

  def hcnDeleteNamespace(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnDeleteNamespace(id, error_record)
    {% end %}
  end

  def hcnCloseNamespace(namespace : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCloseNamespace(namespace)
    {% end %}
  end

  def hcnEnumerateEndpoints(query : Win32cr::Foundation::PWSTR, endpoints : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnEnumerateEndpoints(query, endpoints, error_record)
    {% end %}
  end

  def hcnCreateEndpoint(network : Void*, id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, endpoint : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCreateEndpoint(network, id, settings, endpoint, error_record)
    {% end %}
  end

  def hcnOpenEndpoint(id : LibC::GUID*, endpoint : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnOpenEndpoint(id, endpoint, error_record)
    {% end %}
  end

  def hcnModifyEndpoint(endpoint : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnModifyEndpoint(endpoint, settings, error_record)
    {% end %}
  end

  def hcnQueryEndpointProperties(endpoint : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnQueryEndpointProperties(endpoint, query, properties, error_record)
    {% end %}
  end

  def hcnDeleteEndpoint(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnDeleteEndpoint(id, error_record)
    {% end %}
  end

  def hcnCloseEndpoint(endpoint : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCloseEndpoint(endpoint)
    {% end %}
  end

  def hcnEnumerateLoadBalancers(query : Win32cr::Foundation::PWSTR, load_balancer : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnEnumerateLoadBalancers(query, load_balancer, error_record)
    {% end %}
  end

  def hcnCreateLoadBalancer(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, load_balancer : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCreateLoadBalancer(id, settings, load_balancer, error_record)
    {% end %}
  end

  def hcnOpenLoadBalancer(id : LibC::GUID*, load_balancer : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnOpenLoadBalancer(id, load_balancer, error_record)
    {% end %}
  end

  def hcnModifyLoadBalancer(load_balancer : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnModifyLoadBalancer(load_balancer, settings, error_record)
    {% end %}
  end

  def hcnQueryLoadBalancerProperties(load_balancer : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnQueryLoadBalancerProperties(load_balancer, query, properties, error_record)
    {% end %}
  end

  def hcnDeleteLoadBalancer(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnDeleteLoadBalancer(id, error_record)
    {% end %}
  end

  def hcnCloseLoadBalancer(load_balancer : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCloseLoadBalancer(load_balancer)
    {% end %}
  end

  def hcnRegisterServiceCallback(callback : Win32cr::System::HostComputeNetwork::HCN_NOTIFICATION_CALLBACK, context : Void*, callback_handle : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnRegisterServiceCallback(callback, context, callback_handle)
    {% end %}
  end

  def hcnUnregisterServiceCallback(callback_handle : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnUnregisterServiceCallback(callback_handle)
    {% end %}
  end

  def hcnRegisterGuestNetworkServiceCallback(guest_network_service : Void*, callback : Win32cr::System::HostComputeNetwork::HCN_NOTIFICATION_CALLBACK, context : Void*, callback_handle : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnRegisterGuestNetworkServiceCallback(guest_network_service, callback, context, callback_handle)
    {% end %}
  end

  def hcnUnregisterGuestNetworkServiceCallback(callback_handle : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnUnregisterGuestNetworkServiceCallback(callback_handle)
    {% end %}
  end

  def hcnCreateGuestNetworkService(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, guest_network_service : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCreateGuestNetworkService(id, settings, guest_network_service, error_record)
    {% end %}
  end

  def hcnCloseGuestNetworkService(guest_network_service : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnCloseGuestNetworkService(guest_network_service)
    {% end %}
  end

  def hcnModifyGuestNetworkService(guest_network_service : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnModifyGuestNetworkService(guest_network_service, settings, error_record)
    {% end %}
  end

  def hcnDeleteGuestNetworkService(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnDeleteGuestNetworkService(id, error_record)
    {% end %}
  end

  def hcnReserveGuestNetworkServicePort(guest_network_service : Void*, protocol : Win32cr::System::HostComputeNetwork::HCN_PORT_PROTOCOL, access : Win32cr::System::HostComputeNetwork::HCN_PORT_ACCESS, port : UInt16, port_reservation_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnReserveGuestNetworkServicePort(guest_network_service, protocol, access, port, port_reservation_handle)
    {% end %}
  end

  def hcnReserveGuestNetworkServicePortRange(guest_network_service : Void*, port_count : UInt16, port_range_reservation : Win32cr::System::HostComputeNetwork::HCN_PORT_RANGE_RESERVATION*, port_reservation_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnReserveGuestNetworkServicePortRange(guest_network_service, port_count, port_range_reservation, port_reservation_handle)
    {% end %}
  end

  def hcnReleaseGuestNetworkServicePortReservationHandle(port_reservation_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnReleaseGuestNetworkServicePortReservationHandle(port_reservation_handle)
    {% end %}
  end

  def hcnEnumerateGuestNetworkPortReservations(return_count : UInt32*, port_entries : Win32cr::System::HostComputeNetwork::HCN_PORT_RANGE_ENTRY**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HcnEnumerateGuestNetworkPortReservations(return_count, port_entries)
    {% end %}
  end

  def hcnFreeGuestNetworkPortReservations(port_entries : Win32cr::System::HostComputeNetwork::HCN_PORT_RANGE_ENTRY*) : Void
    {% if !flag?(:docs) %}
    C.HcnFreeGuestNetworkPortReservations(port_entries)
    {% end %}
  end

  @[Link("computenetwork")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun HcnEnumerateNetworks(query : Win32cr::Foundation::PWSTR, networks : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCreateNetwork(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, network : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnOpenNetwork(id : LibC::GUID*, network : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnModifyNetwork(network : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnQueryNetworkProperties(network : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnDeleteNetwork(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCloseNetwork(network : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnEnumerateNamespaces(query : Win32cr::Foundation::PWSTR, namespaces : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCreateNamespace(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, namespace : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnOpenNamespace(id : LibC::GUID*, namespace : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnModifyNamespace(namespace : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnQueryNamespaceProperties(namespace : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnDeleteNamespace(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCloseNamespace(namespace : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnEnumerateEndpoints(query : Win32cr::Foundation::PWSTR, endpoints : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCreateEndpoint(network : Void*, id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, endpoint : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnOpenEndpoint(id : LibC::GUID*, endpoint : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnModifyEndpoint(endpoint : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnQueryEndpointProperties(endpoint : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnDeleteEndpoint(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCloseEndpoint(endpoint : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnEnumerateLoadBalancers(query : Win32cr::Foundation::PWSTR, load_balancer : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCreateLoadBalancer(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, load_balancer : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnOpenLoadBalancer(id : LibC::GUID*, load_balancer : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnModifyLoadBalancer(load_balancer : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnQueryLoadBalancerProperties(load_balancer : Void*, query : Win32cr::Foundation::PWSTR, properties : Win32cr::Foundation::PWSTR*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnDeleteLoadBalancer(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCloseLoadBalancer(load_balancer : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnRegisterServiceCallback(callback : Win32cr::System::HostComputeNetwork::HCN_NOTIFICATION_CALLBACK, context : Void*, callback_handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnUnregisterServiceCallback(callback_handle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnRegisterGuestNetworkServiceCallback(guest_network_service : Void*, callback : Win32cr::System::HostComputeNetwork::HCN_NOTIFICATION_CALLBACK, context : Void*, callback_handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnUnregisterGuestNetworkServiceCallback(callback_handle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCreateGuestNetworkService(id : LibC::GUID*, settings : Win32cr::Foundation::PWSTR, guest_network_service : Void**, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnCloseGuestNetworkService(guest_network_service : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnModifyGuestNetworkService(guest_network_service : Void*, settings : Win32cr::Foundation::PWSTR, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnDeleteGuestNetworkService(id : LibC::GUID*, error_record : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnReserveGuestNetworkServicePort(guest_network_service : Void*, protocol : Win32cr::System::HostComputeNetwork::HCN_PORT_PROTOCOL, access : Win32cr::System::HostComputeNetwork::HCN_PORT_ACCESS, port : UInt16, port_reservation_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnReserveGuestNetworkServicePortRange(guest_network_service : Void*, port_count : UInt16, port_range_reservation : Win32cr::System::HostComputeNetwork::HCN_PORT_RANGE_RESERVATION*, port_reservation_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnReleaseGuestNetworkServicePortReservationHandle(port_reservation_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnEnumerateGuestNetworkPortReservations(return_count : UInt32*, port_entries : Win32cr::System::HostComputeNetwork::HCN_PORT_RANGE_ENTRY**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcnFreeGuestNetworkPortReservations(port_entries : Win32cr::System::HostComputeNetwork::HCN_PORT_RANGE_ENTRY*) : Void

  end
  {% end %}
end