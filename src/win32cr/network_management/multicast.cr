require "./../foundation.cr"

module Win32cr::NetworkManagement::Multicast
  MCAST_CLIENT_ID_LEN = 17_u32
  MCAST_API_CURRENT_VERSION = 1_i32
  MCAST_API_VERSION_0 = 0_i32
  MCAST_API_VERSION_1 = 1_i32


  @[Extern(union: true)]
  record IPNG_ADDRESS,
    ip_addr_v4 : UInt32,
    ip_addr_v6 : UInt8[16]

  @[Extern]
  record MCAST_CLIENT_UID,
    client_uid : UInt8*,
    client_uid_length : UInt32

  @[Extern]
  record MCAST_SCOPE_CTX,
    scope_id : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS,
    interface : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS,
    server_id : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS

  @[Extern]
  record MCAST_SCOPE_ENTRY,
    scope_ctx : Win32cr::NetworkManagement::Multicast::MCAST_SCOPE_CTX,
    last_addr : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS,
    ttl : UInt32,
    scope_desc : Win32cr::Foundation::UNICODE_STRING

  @[Extern]
  record MCAST_LEASE_REQUEST,
    lease_start_time : Int32,
    max_lease_start_time : Int32,
    lease_duration : UInt32,
    min_lease_duration : UInt32,
    server_address : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS,
    min_addr_count : UInt16,
    addr_count : UInt16,
    pAddrBuf : UInt8*

  @[Extern]
  record MCAST_LEASE_RESPONSE,
    lease_start_time : Int32,
    lease_end_time : Int32,
    server_address : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS,
    addr_count : UInt16,
    pAddrBuf : UInt8*

  @[Link("dhcpcsvc")]
  lib C
    fun McastApiStartup(version : UInt32*) : UInt32

    fun McastApiCleanup : Void

    fun McastGenUID(pRequestID : Win32cr::NetworkManagement::Multicast::MCAST_CLIENT_UID*) : UInt32

    fun McastEnumerateScopes(addr_family : UInt16, re_query : Win32cr::Foundation::BOOL, pScopeList : Win32cr::NetworkManagement::Multicast::MCAST_SCOPE_ENTRY*, pScopeLen : UInt32*, pScopeCount : UInt32*) : UInt32

    fun McastRequestAddress(addr_family : UInt16, pRequestID : Win32cr::NetworkManagement::Multicast::MCAST_CLIENT_UID*, pScopeCtx : Win32cr::NetworkManagement::Multicast::MCAST_SCOPE_CTX*, pAddrRequest : Win32cr::NetworkManagement::Multicast::MCAST_LEASE_REQUEST*, pAddrResponse : Win32cr::NetworkManagement::Multicast::MCAST_LEASE_RESPONSE*) : UInt32

    fun McastRenewAddress(addr_family : UInt16, pRequestID : Win32cr::NetworkManagement::Multicast::MCAST_CLIENT_UID*, pRenewRequest : Win32cr::NetworkManagement::Multicast::MCAST_LEASE_REQUEST*, pRenewResponse : Win32cr::NetworkManagement::Multicast::MCAST_LEASE_RESPONSE*) : UInt32

    fun McastReleaseAddress(addr_family : UInt16, pRequestID : Win32cr::NetworkManagement::Multicast::MCAST_CLIENT_UID*, pReleaseRequest : Win32cr::NetworkManagement::Multicast::MCAST_LEASE_REQUEST*) : UInt32

  end
end