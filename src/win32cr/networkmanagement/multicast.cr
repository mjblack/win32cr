require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dhcpcsvc.dll")]
{% else %}
@[Link("dhcpcsvc")]
{% end %}
lib LibWin32
  MCAST_CLIENT_ID_LEN = 17_u32
  MCAST_API_CURRENT_VERSION = 1_i32
  MCAST_API_VERSION_0 = 0_i32
  MCAST_API_VERSION_1 = 1_i32

  union IPNG_ADDRESS
    ip_addr_v4 : UInt32
    ip_addr_v6 : UInt8[16]*
  end

  struct MCAST_CLIENT_UID
    client_uid : UInt8*
    client_uid_length : UInt32
  end
  struct MCAST_SCOPE_CTX
    scope_id : IPNG_ADDRESS
    interface : IPNG_ADDRESS
    server_id : IPNG_ADDRESS
  end
  struct MCAST_SCOPE_ENTRY
    scope_ctx : MCAST_SCOPE_CTX
    last_addr : IPNG_ADDRESS
    ttl : UInt32
    scope_desc : UNICODE_STRING
  end
  struct MCAST_LEASE_REQUEST
    lease_start_time : Int32
    max_lease_start_time : Int32
    lease_duration : UInt32
    min_lease_duration : UInt32
    server_address : IPNG_ADDRESS
    min_addr_count : UInt16
    addr_count : UInt16
    p_addr_buf : UInt8*
  end
  struct MCAST_LEASE_RESPONSE
    lease_start_time : Int32
    lease_end_time : Int32
    server_address : IPNG_ADDRESS
    addr_count : UInt16
    p_addr_buf : UInt8*
  end


  # Params # version : UInt32* [In]
  fun McastApiStartup(version : UInt32*) : UInt32

  # Params # 
  fun McastApiCleanup : Void

  # Params # prequestid : MCAST_CLIENT_UID* [In]
  fun McastGenUID(prequestid : MCAST_CLIENT_UID*) : UInt32

  # Params # addrfamily : UInt16 [In],requery : LibC::BOOL [In],pscopelist : MCAST_SCOPE_ENTRY* [In],pscopelen : UInt32* [In],pscopecount : UInt32* [In]
  fun McastEnumerateScopes(addrfamily : UInt16, requery : LibC::BOOL, pscopelist : MCAST_SCOPE_ENTRY*, pscopelen : UInt32*, pscopecount : UInt32*) : UInt32

  # Params # addrfamily : UInt16 [In],prequestid : MCAST_CLIENT_UID* [In],pscopectx : MCAST_SCOPE_CTX* [In],paddrrequest : MCAST_LEASE_REQUEST* [In],paddrresponse : MCAST_LEASE_RESPONSE* [In]
  fun McastRequestAddress(addrfamily : UInt16, prequestid : MCAST_CLIENT_UID*, pscopectx : MCAST_SCOPE_CTX*, paddrrequest : MCAST_LEASE_REQUEST*, paddrresponse : MCAST_LEASE_RESPONSE*) : UInt32

  # Params # addrfamily : UInt16 [In],prequestid : MCAST_CLIENT_UID* [In],prenewrequest : MCAST_LEASE_REQUEST* [In],prenewresponse : MCAST_LEASE_RESPONSE* [In]
  fun McastRenewAddress(addrfamily : UInt16, prequestid : MCAST_CLIENT_UID*, prenewrequest : MCAST_LEASE_REQUEST*, prenewresponse : MCAST_LEASE_RESPONSE*) : UInt32

  # Params # addrfamily : UInt16 [In],prequestid : MCAST_CLIENT_UID* [In],preleaserequest : MCAST_LEASE_REQUEST* [In]
  fun McastReleaseAddress(addrfamily : UInt16, prequestid : MCAST_CLIENT_UID*, preleaserequest : MCAST_LEASE_REQUEST*) : UInt32
end
