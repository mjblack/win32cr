require "./../foundation.cr"

module Win32cr::NetworkManagement::Multicast
  MCAST_CLIENT_ID_LEN = 17_u32
  MCAST_API_CURRENT_VERSION = 1_i32
  MCAST_API_VERSION_0 = 0_i32
  MCAST_API_VERSION_1 = 1_i32


  @[Extern(union: true)]
  struct IPNG_ADDRESS
    property ip_addr_v4 : UInt32
    property ip_addr_v6 : UInt8[16]
    def initialize(@ip_addr_v4 : UInt32, @ip_addr_v6 : UInt8[16])
    end
  end

  @[Extern]
  struct MCAST_CLIENT_UID
    property client_uid : UInt8*
    property client_uid_length : UInt32
    def initialize(@client_uid : UInt8*, @client_uid_length : UInt32)
    end
  end

  @[Extern]
  struct MCAST_SCOPE_CTX
    property scope_id : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS
    property interface : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS
    property server_id : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS
    def initialize(@scope_id : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS, @interface : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS, @server_id : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS)
    end
  end

  @[Extern]
  struct MCAST_SCOPE_ENTRY
    property scope_ctx : Win32cr::NetworkManagement::Multicast::MCAST_SCOPE_CTX
    property last_addr : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS
    property ttl : UInt32
    property scope_desc : Win32cr::Foundation::UNICODE_STRING
    def initialize(@scope_ctx : Win32cr::NetworkManagement::Multicast::MCAST_SCOPE_CTX, @last_addr : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS, @ttl : UInt32, @scope_desc : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct MCAST_LEASE_REQUEST
    property lease_start_time : Int32
    property max_lease_start_time : Int32
    property lease_duration : UInt32
    property min_lease_duration : UInt32
    property server_address : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS
    property min_addr_count : UInt16
    property addr_count : UInt16
    property pAddrBuf : UInt8*
    def initialize(@lease_start_time : Int32, @max_lease_start_time : Int32, @lease_duration : UInt32, @min_lease_duration : UInt32, @server_address : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS, @min_addr_count : UInt16, @addr_count : UInt16, @pAddrBuf : UInt8*)
    end
  end

  @[Extern]
  struct MCAST_LEASE_RESPONSE
    property lease_start_time : Int32
    property lease_end_time : Int32
    property server_address : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS
    property addr_count : UInt16
    property pAddrBuf : UInt8*
    def initialize(@lease_start_time : Int32, @lease_end_time : Int32, @server_address : Win32cr::NetworkManagement::Multicast::IPNG_ADDRESS, @addr_count : UInt16, @pAddrBuf : UInt8*)
    end
  end

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