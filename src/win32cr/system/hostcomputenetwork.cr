require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:computenetwork.dll")]
lib LibWin32
  alias HCN_NOTIFICATION_CALLBACK = Proc(UInt32, Void*, HRESULT, LibC::LPWSTR, Void)


  enum HCN_NOTIFICATIONS : Int32
    HcnNotificationInvalid = 0
    HcnNotificationNetworkPreCreate = 1
    HcnNotificationNetworkCreate = 2
    HcnNotificationNetworkPreDelete = 3
    HcnNotificationNetworkDelete = 4
    HcnNotificationNamespaceCreate = 5
    HcnNotificationNamespaceDelete = 6
    HcnNotificationGuestNetworkServiceCreate = 7
    HcnNotificationGuestNetworkServiceDelete = 8
    HcnNotificationNetworkEndpointAttached = 9
    HcnNotificationNetworkEndpointDetached = 16
    HcnNotificationGuestNetworkServiceStateChanged = 17
    HcnNotificationGuestNetworkServiceInterfaceStateChanged = 18
    HcnNotificationServiceDisconnect = 16777216
    HcnNotificationFlagsReserved = -268435456
  end

  enum HCN_PORT_PROTOCOL : Int32
    HCN_PORT_PROTOCOL_TCP = 1
    HCN_PORT_PROTOCOL_UDP = 2
    HCN_PORT_PROTOCOL_BOTH = 3
  end

  enum HCN_PORT_ACCESS : Int32
    HCN_PORT_ACCESS_EXCLUSIVE = 1
    HCN_PORT_ACCESS_SHARED = 2
  end

  struct HCN_PORT_RANGE_RESERVATION
    starting_port : UInt16
    ending_port : UInt16
  end
  struct HCN_PORT_RANGE_ENTRY
    owning_partition_id : Guid
    target_partition_id : Guid
    protocol : HCN_PORT_PROTOCOL
    priority : UInt64
    reservation_type : UInt32
    sharing_flags : UInt32
    delivery_mode : UInt32
    starting_port : UInt16
    ending_port : UInt16
  end


  # Params # query : LibC::LPWSTR [In],networks : LibC::LPWSTR* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnEnumerateNetworks(query : LibC::LPWSTR, networks : LibC::LPWSTR*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],settings : LibC::LPWSTR [In],network : Void** [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnCreateNetwork(id : Guid*, settings : LibC::LPWSTR, network : Void**, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],network : Void** [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnOpenNetwork(id : Guid*, network : Void**, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # network : Void* [In],settings : LibC::LPWSTR [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnModifyNetwork(network : Void*, settings : LibC::LPWSTR, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # network : Void* [In],query : LibC::LPWSTR [In],properties : LibC::LPWSTR* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnQueryNetworkProperties(network : Void*, query : LibC::LPWSTR, properties : LibC::LPWSTR*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnDeleteNetwork(id : Guid*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # network : Void* [In]
  fun HcnCloseNetwork(network : Void*) : HRESULT

  # Params # query : LibC::LPWSTR [In],namespaces : LibC::LPWSTR* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnEnumerateNamespaces(query : LibC::LPWSTR, namespaces : LibC::LPWSTR*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],settings : LibC::LPWSTR [In],namespace : Void** [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnCreateNamespace(id : Guid*, settings : LibC::LPWSTR, namespace : Void**, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],namespace : Void** [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnOpenNamespace(id : Guid*, namespace : Void**, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # namespace : Void* [In],settings : LibC::LPWSTR [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnModifyNamespace(namespace : Void*, settings : LibC::LPWSTR, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # namespace : Void* [In],query : LibC::LPWSTR [In],properties : LibC::LPWSTR* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnQueryNamespaceProperties(namespace : Void*, query : LibC::LPWSTR, properties : LibC::LPWSTR*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnDeleteNamespace(id : Guid*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # namespace : Void* [In]
  fun HcnCloseNamespace(namespace : Void*) : HRESULT

  # Params # query : LibC::LPWSTR [In],endpoints : LibC::LPWSTR* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnEnumerateEndpoints(query : LibC::LPWSTR, endpoints : LibC::LPWSTR*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # network : Void* [In],id : Guid* [In],settings : LibC::LPWSTR [In],endpoint : Void** [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnCreateEndpoint(network : Void*, id : Guid*, settings : LibC::LPWSTR, endpoint : Void**, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],endpoint : Void** [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnOpenEndpoint(id : Guid*, endpoint : Void**, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # endpoint : Void* [In],settings : LibC::LPWSTR [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnModifyEndpoint(endpoint : Void*, settings : LibC::LPWSTR, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # endpoint : Void* [In],query : LibC::LPWSTR [In],properties : LibC::LPWSTR* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnQueryEndpointProperties(endpoint : Void*, query : LibC::LPWSTR, properties : LibC::LPWSTR*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnDeleteEndpoint(id : Guid*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # endpoint : Void* [In]
  fun HcnCloseEndpoint(endpoint : Void*) : HRESULT

  # Params # query : LibC::LPWSTR [In],loadbalancer : LibC::LPWSTR* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnEnumerateLoadBalancers(query : LibC::LPWSTR, loadbalancer : LibC::LPWSTR*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],settings : LibC::LPWSTR [In],loadbalancer : Void** [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnCreateLoadBalancer(id : Guid*, settings : LibC::LPWSTR, loadbalancer : Void**, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],loadbalancer : Void** [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnOpenLoadBalancer(id : Guid*, loadbalancer : Void**, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # loadbalancer : Void* [In],settings : LibC::LPWSTR [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnModifyLoadBalancer(loadbalancer : Void*, settings : LibC::LPWSTR, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # loadbalancer : Void* [In],query : LibC::LPWSTR [In],properties : LibC::LPWSTR* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnQueryLoadBalancerProperties(loadbalancer : Void*, query : LibC::LPWSTR, properties : LibC::LPWSTR*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnDeleteLoadBalancer(id : Guid*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # loadbalancer : Void* [In]
  fun HcnCloseLoadBalancer(loadbalancer : Void*) : HRESULT

  # Params # callback : HCN_NOTIFICATION_CALLBACK [In],context : Void* [In],callbackhandle : Void** [In]
  fun HcnRegisterServiceCallback(callback : HCN_NOTIFICATION_CALLBACK, context : Void*, callbackhandle : Void**) : HRESULT

  # Params # callbackhandle : Void* [In]
  fun HcnUnregisterServiceCallback(callbackhandle : Void*) : HRESULT

  # Params # guestnetworkservice : Void* [In],callback : HCN_NOTIFICATION_CALLBACK [In],context : Void* [In],callbackhandle : Void** [In]
  fun HcnRegisterGuestNetworkServiceCallback(guestnetworkservice : Void*, callback : HCN_NOTIFICATION_CALLBACK, context : Void*, callbackhandle : Void**) : HRESULT

  # Params # callbackhandle : Void* [In]
  fun HcnUnregisterGuestNetworkServiceCallback(callbackhandle : Void*) : HRESULT

  # Params # id : Guid* [In],settings : LibC::LPWSTR [In],guestnetworkservice : Void** [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnCreateGuestNetworkService(id : Guid*, settings : LibC::LPWSTR, guestnetworkservice : Void**, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # guestnetworkservice : Void* [In]
  fun HcnCloseGuestNetworkService(guestnetworkservice : Void*) : HRESULT

  # Params # guestnetworkservice : Void* [In],settings : LibC::LPWSTR [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnModifyGuestNetworkService(guestnetworkservice : Void*, settings : LibC::LPWSTR, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # id : Guid* [In],errorrecord : LibC::LPWSTR* [In]
  fun HcnDeleteGuestNetworkService(id : Guid*, errorrecord : LibC::LPWSTR*) : HRESULT

  # Params # guestnetworkservice : Void* [In],protocol : HCN_PORT_PROTOCOL [In],access : HCN_PORT_ACCESS [In],port : UInt16 [In],portreservationhandle : LibC::HANDLE* [In]
  fun HcnReserveGuestNetworkServicePort(guestnetworkservice : Void*, protocol : HCN_PORT_PROTOCOL, access : HCN_PORT_ACCESS, port : UInt16, portreservationhandle : LibC::HANDLE*) : HRESULT

  # Params # guestnetworkservice : Void* [In],portcount : UInt16 [In],portrangereservation : HCN_PORT_RANGE_RESERVATION* [In],portreservationhandle : LibC::HANDLE* [In]
  fun HcnReserveGuestNetworkServicePortRange(guestnetworkservice : Void*, portcount : UInt16, portrangereservation : HCN_PORT_RANGE_RESERVATION*, portreservationhandle : LibC::HANDLE*) : HRESULT

  # Params # portreservationhandle : LibC::HANDLE [In]
  fun HcnReleaseGuestNetworkServicePortReservationHandle(portreservationhandle : LibC::HANDLE) : HRESULT

  # Params # returncount : UInt32* [In],portentries : HCN_PORT_RANGE_ENTRY** [In]
  fun HcnEnumerateGuestNetworkPortReservations(returncount : UInt32*, portentries : HCN_PORT_RANGE_ENTRY**) : HRESULT

  # Params # portentries : HCN_PORT_RANGE_ENTRY* [In]
  fun HcnFreeGuestNetworkPortReservations(portentries : HCN_PORT_RANGE_ENTRY*)
end
