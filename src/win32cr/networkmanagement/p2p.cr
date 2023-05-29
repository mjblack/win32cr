require "../foundation.cr"
require "../networking/winsock.cr"
require "../system/com.cr"
require "../security/cryptography.cr"
require "../system/io.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:p2pgraph.dll")]
@[Link(ldflags: "/DELAYLOAD:p2p.dll")]
@[Link(ldflags: "/DELAYLOAD:drtprov.dll")]
@[Link(ldflags: "/DELAYLOAD:drttransport.dll")]
@[Link(ldflags: "/DELAYLOAD:drt.dll")]
@[Link(ldflags: "/DELAYLOAD:peerdist.dll")]
lib LibWin32
  NS_PNRPNAME = 38_u32
  NS_PNRPCLOUD = 39_u32
  PNRPINFO_HINT = 1_u32
  NS_PROVIDER_PNRPNAME = "03fe89cd-766d-4976-b9c1-bb9bc42c7b4d"
  NS_PROVIDER_PNRPCLOUD = "03fe89ce-766d-4976-b9c1-bb9bc42c7b4d"
  SVCID_PNRPCLOUD = "c2239ce6-00c0-4fbf-bad6-18139385a49a"
  SVCID_PNRPNAME_V1 = "c2239ce5-00c0-4fbf-bad6-18139385a49a"
  SVCID_PNRPNAME_V2 = "c2239ce7-00c0-4fbf-bad6-18139385a49a"
  PNRP_MAX_ENDPOINT_ADDRESSES = 10_u32
  PNRP_MAX_EXTENDED_PAYLOAD_BYTES = 4096_u32
  WSA_PNRP_ERROR_BASE = 11500_u32
  WSA_PNRP_CLOUD_NOT_FOUND = 11501_u32
  WSA_PNRP_CLOUD_DISABLED = 11502_u32
  WSA_PNRP_INVALID_IDENTITY = 11503_u32
  WSA_PNRP_TOO_MUCH_LOAD = 11504_u32
  WSA_PNRP_CLOUD_IS_SEARCH_ONLY = 11505_u32
  WSA_PNRP_CLIENT_INVALID_COMPARTMENT_ID = 11506_u32
  WSA_PNRP_DUPLICATE_PEER_NAME = 11508_u32
  WSA_PNRP_CLOUD_IS_DEAD = 11509_u32
  PEER_E_CLOUD_NOT_FOUND = -2147013395_i32
  PEER_E_CLOUD_DISABLED = -2147013394_i32
  PEER_E_INVALID_IDENTITY = -2147013393_i32
  PEER_E_TOO_MUCH_LOAD = -2147013392_i32
  PEER_E_CLOUD_IS_SEARCH_ONLY = -2147013391_i32
  PEER_E_CLIENT_INVALID_COMPARTMENT_ID = -2147013390_i32
  PEER_E_DUPLICATE_PEER_NAME = -2147013388_i32
  PEER_E_CLOUD_IS_DEAD = -2147013387_i32
  PEER_E_NOT_FOUND = -2147023728_i32
  PEER_E_DISK_FULL = -2147024784_i32
  PEER_E_ALREADY_EXISTS = -2147024713_i32
  PEER_GROUP_ROLE_ADMIN = "04387127-aa56-450a-8ce5-4f565c6790f4"
  PEER_GROUP_ROLE_MEMBER = "f12dc4c7-0857-4ca0-93fc-b1bb19a3d8c2"
  PEER_GROUP_ROLE_INVITING_MEMBER = "4370fd89-dc18-4cfb-8dbf-9853a8a9f905"
  PEER_COLLAB_OBJECTID_USER_PICTURE = "dd15f41f-fc4e-4922-b035-4c06a754d01d"
  FACILITY_DRT = 98_u32
  DRT_E_TIMEOUT = -2141057023_i32
  DRT_E_INVALID_KEY_SIZE = -2141057022_i32
  DRT_E_INVALID_CERT_CHAIN = -2141057020_i32
  DRT_E_INVALID_MESSAGE = -2141057019_i32
  DRT_E_NO_MORE = -2141057018_i32
  DRT_E_INVALID_MAX_ADDRESSES = -2141057017_i32
  DRT_E_SEARCH_IN_PROGRESS = -2141057016_i32
  DRT_E_INVALID_KEY = -2141057015_i32
  DRT_S_RETRY = 6426640_i32
  DRT_E_INVALID_MAX_ENDPOINTS = -2141057007_i32
  DRT_E_INVALID_SEARCH_RANGE = -2141057006_i32
  DRT_E_INVALID_PORT = -2141052928_i32
  DRT_E_INVALID_TRANSPORT_PROVIDER = -2141052927_i32
  DRT_E_INVALID_SECURITY_PROVIDER = -2141052926_i32
  DRT_E_STILL_IN_USE = -2141052925_i32
  DRT_E_INVALID_BOOTSTRAP_PROVIDER = -2141052924_i32
  DRT_E_INVALID_ADDRESS = -2141052923_i32
  DRT_E_INVALID_SCOPE = -2141052922_i32
  DRT_E_TRANSPORT_SHUTTING_DOWN = -2141052921_i32
  DRT_E_NO_ADDRESSES_AVAILABLE = -2141052920_i32
  DRT_E_DUPLICATE_KEY = -2141052919_i32
  DRT_E_TRANSPORTPROVIDER_IN_USE = -2141052918_i32
  DRT_E_TRANSPORTPROVIDER_NOT_ATTACHED = -2141052917_i32
  DRT_E_SECURITYPROVIDER_IN_USE = -2141052916_i32
  DRT_E_SECURITYPROVIDER_NOT_ATTACHED = -2141052915_i32
  DRT_E_BOOTSTRAPPROVIDER_IN_USE = -2141052914_i32
  DRT_E_BOOTSTRAPPROVIDER_NOT_ATTACHED = -2141052913_i32
  DRT_E_TRANSPORT_ALREADY_BOUND = -2141052671_i32
  DRT_E_TRANSPORT_NOT_BOUND = -2141052670_i32
  DRT_E_TRANSPORT_UNEXPECTED = -2141052669_i32
  DRT_E_TRANSPORT_INVALID_ARGUMENT = -2141052668_i32
  DRT_E_TRANSPORT_NO_DEST_ADDRESSES = -2141052667_i32
  DRT_E_TRANSPORT_EXECUTING_CALLBACK = -2141052666_i32
  DRT_E_TRANSPORT_ALREADY_EXISTS_FOR_SCOPE = -2141052665_i32
  DRT_E_INVALID_SETTINGS = -2141052664_i32
  DRT_E_INVALID_SEARCH_INFO = -2141052663_i32
  DRT_E_FAULTED = -2141052662_i32
  DRT_E_TRANSPORT_STILL_BOUND = -2141052661_i32
  DRT_E_INSUFFICIENT_BUFFER = -2141052660_i32
  DRT_E_INVALID_INSTANCE_PREFIX = -2141052659_i32
  DRT_E_INVALID_SECURITY_MODE = -2141052658_i32
  DRT_E_CAPABILITY_MISMATCH = -2141052657_i32
  DRT_PAYLOAD_REVOKED = 1_u32
  DRT_MIN_ROUTING_ADDRESSES = 1_u32
  DRT_MAX_ROUTING_ADDRESSES = 20_u32
  DRT_MAX_PAYLOAD_SIZE = 5120_u32
  DRT_MAX_INSTANCE_PREFIX_LEN = 128_u32
  DRT_LINK_LOCAL_ISATAP_SCOPEID = 4294967295_u32
  PEERDIST_PUBLICATION_OPTIONS_VERSION_1 = 1_i32
  PEERDIST_PUBLICATION_OPTIONS_VERSION = 2_i32
  PEERDIST_PUBLICATION_OPTIONS_VERSION_2 = 2_i32
  PEERDIST_READ_TIMEOUT_LOCAL_CACHE_ONLY = 0_u32
  PEERDIST_READ_TIMEOUT_DEFAULT = 4294967294_u32

  alias PFNPEER_VALIDATE_RECORD = Proc(Void*, Void*, PEER_RECORD*, PEER_RECORD_CHANGE_TYPE, HRESULT)
  alias PFNPEER_SECURE_RECORD = Proc(Void*, Void*, PEER_RECORD*, PEER_RECORD_CHANGE_TYPE, PEER_DATA**, HRESULT)
  alias PFNPEER_FREE_SECURITY_DATA = Proc(Void*, Void*, PEER_DATA*, HRESULT)
  alias PFNPEER_ON_PASSWORD_AUTH_FAILED = Proc(Void*, Void*, HRESULT)
  alias DRT_BOOTSTRAP_RESOLVE_CALLBACK = Proc(HRESULT, Void*, SOCKET_ADDRESS_LIST*, LibC::BOOL, Void)


  enum PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE : UInt32
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_1 = 1
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_2 = 2
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION = 2
  end

  enum PNRP_SCOPE : Int32
    PNRP_SCOPE_ANY = 0
    PNRP_GLOBAL_SCOPE = 1
    PNRP_SITE_LOCAL_SCOPE = 2
    PNRP_LINK_LOCAL_SCOPE = 3
  end

  enum PNRP_CLOUD_STATE : Int32
    PNRP_CLOUD_STATE_VIRTUAL = 0
    PNRP_CLOUD_STATE_SYNCHRONISING = 1
    PNRP_CLOUD_STATE_ACTIVE = 2
    PNRP_CLOUD_STATE_DEAD = 3
    PNRP_CLOUD_STATE_DISABLED = 4
    PNRP_CLOUD_STATE_NO_NET = 5
    PNRP_CLOUD_STATE_ALONE = 6
  end

  enum PNRP_CLOUD_FLAGS : Int32
    PNRP_CLOUD_NO_FLAGS = 0
    PNRP_CLOUD_NAME_LOCAL = 1
    PNRP_CLOUD_RESOLVE_ONLY = 2
    PNRP_CLOUD_FULL_PARTICIPANT = 4
  end

  enum PNRP_REGISTERED_ID_STATE : Int32
    PNRP_REGISTERED_ID_STATE_OK = 1
    PNRP_REGISTERED_ID_STATE_PROBLEM = 2
  end

  enum PNRP_RESOLVE_CRITERIA : Int32
    PNRP_RESOLVE_CRITERIA_DEFAULT = 0
    PNRP_RESOLVE_CRITERIA_REMOTE_PEER_NAME = 1
    PNRP_RESOLVE_CRITERIA_NEAREST_REMOTE_PEER_NAME = 2
    PNRP_RESOLVE_CRITERIA_NON_CURRENT_PROCESS_PEER_NAME = 3
    PNRP_RESOLVE_CRITERIA_NEAREST_NON_CURRENT_PROCESS_PEER_NAME = 4
    PNRP_RESOLVE_CRITERIA_ANY_PEER_NAME = 5
    PNRP_RESOLVE_CRITERIA_NEAREST_PEER_NAME = 6
  end

  enum PNRP_EXTENDED_PAYLOAD_TYPE : Int32
    PNRP_EXTENDED_PAYLOAD_TYPE_NONE = 0
    PNRP_EXTENDED_PAYLOAD_TYPE_BINARY = 1
    PNRP_EXTENDED_PAYLOAD_TYPE_STRING = 2
  end

  enum PEER_RECORD_CHANGE_TYPE : Int32
    PEER_RECORD_ADDED = 1
    PEER_RECORD_UPDATED = 2
    PEER_RECORD_DELETED = 3
    PEER_RECORD_EXPIRED = 4
  end

  enum PEER_CONNECTION_STATUS : Int32
    PEER_CONNECTED = 1
    PEER_DISCONNECTED = 2
    PEER_CONNECTION_FAILED = 3
  end

  enum PEER_CONNECTION_FLAGS : Int32
    PEER_CONNECTION_NEIGHBOR = 1
    PEER_CONNECTION_DIRECT = 2
  end

  enum PEER_RECORD_FLAGS : Int32
    PEER_RECORD_FLAG_AUTOREFRESH = 1
    PEER_RECORD_FLAG_DELETED = 2
  end

  enum PEER_GRAPH_EVENT_TYPE : Int32
    PEER_GRAPH_EVENT_STATUS_CHANGED = 1
    PEER_GRAPH_EVENT_PROPERTY_CHANGED = 2
    PEER_GRAPH_EVENT_RECORD_CHANGED = 3
    PEER_GRAPH_EVENT_DIRECT_CONNECTION = 4
    PEER_GRAPH_EVENT_NEIGHBOR_CONNECTION = 5
    PEER_GRAPH_EVENT_INCOMING_DATA = 6
    PEER_GRAPH_EVENT_CONNECTION_REQUIRED = 7
    PEER_GRAPH_EVENT_NODE_CHANGED = 8
    PEER_GRAPH_EVENT_SYNCHRONIZED = 9
  end

  enum PEER_NODE_CHANGE_TYPE : Int32
    PEER_NODE_CHANGE_CONNECTED = 1
    PEER_NODE_CHANGE_DISCONNECTED = 2
    PEER_NODE_CHANGE_UPDATED = 3
  end

  enum PEER_GRAPH_STATUS_FLAGS : Int32
    PEER_GRAPH_STATUS_LISTENING = 1
    PEER_GRAPH_STATUS_HAS_CONNECTIONS = 2
    PEER_GRAPH_STATUS_SYNCHRONIZED = 4
  end

  enum PEER_GRAPH_PROPERTY_FLAGS : Int32
    PEER_GRAPH_PROPERTY_HEARTBEATS = 1
    PEER_GRAPH_PROPERTY_DEFER_EXPIRATION = 2
  end

  enum PEER_GRAPH_SCOPE : Int32
    PEER_GRAPH_SCOPE_ANY = 0
    PEER_GRAPH_SCOPE_GLOBAL = 1
    PEER_GRAPH_SCOPE_SITELOCAL = 2
    PEER_GRAPH_SCOPE_LINKLOCAL = 3
    PEER_GRAPH_SCOPE_LOOPBACK = 4
  end

  enum PEER_GROUP_EVENT_TYPE : Int32
    PEER_GROUP_EVENT_STATUS_CHANGED = 1
    PEER_GROUP_EVENT_PROPERTY_CHANGED = 2
    PEER_GROUP_EVENT_RECORD_CHANGED = 3
    PEER_GROUP_EVENT_DIRECT_CONNECTION = 4
    PEER_GROUP_EVENT_NEIGHBOR_CONNECTION = 5
    PEER_GROUP_EVENT_INCOMING_DATA = 6
    PEER_GROUP_EVENT_MEMBER_CHANGED = 8
    PEER_GROUP_EVENT_CONNECTION_FAILED = 10
    PEER_GROUP_EVENT_AUTHENTICATION_FAILED = 11
  end

  enum PEER_GROUP_STATUS : Int32
    PEER_GROUP_STATUS_LISTENING = 1
    PEER_GROUP_STATUS_HAS_CONNECTIONS = 2
  end

  enum PEER_GROUP_PROPERTY_FLAGS : Int32
    PEER_MEMBER_DATA_OPTIONAL = 1
    PEER_DISABLE_PRESENCE = 2
    PEER_DEFER_EXPIRATION = 4
  end

  enum PEER_GROUP_AUTHENTICATION_SCHEME : Int32
    PEER_GROUP_GMC_AUTHENTICATION = 1
    PEER_GROUP_PASSWORD_AUTHENTICATION = 2
  end

  enum PEER_MEMBER_FLAGS : Int32
    PEER_MEMBER_PRESENT = 1
  end

  enum PEER_MEMBER_CHANGE_TYPE : Int32
    PEER_MEMBER_CONNECTED = 1
    PEER_MEMBER_DISCONNECTED = 2
    PEER_MEMBER_UPDATED = 3
    PEER_MEMBER_JOINED = 4
    PEER_MEMBER_LEFT = 5
  end

  enum PEER_GROUP_ISSUE_CREDENTIAL_FLAGS : Int32
    PEER_GROUP_STORE_CREDENTIALS = 1
  end

  enum PEER_SIGNIN_FLAGS : Int32
    PEER_SIGNIN_NONE = 0
    PEER_SIGNIN_NEAR_ME = 1
    PEER_SIGNIN_INTERNET = 2
    PEER_SIGNIN_ALL = 3
  end

  enum PEER_WATCH_PERMISSION : Int32
    PEER_WATCH_BLOCKED = 0
    PEER_WATCH_ALLOWED = 1
  end

  enum PEER_PUBLICATION_SCOPE : Int32
    PEER_PUBLICATION_SCOPE_NONE = 0
    PEER_PUBLICATION_SCOPE_NEAR_ME = 1
    PEER_PUBLICATION_SCOPE_INTERNET = 2
    PEER_PUBLICATION_SCOPE_ALL = 3
  end

  enum PEER_INVITATION_RESPONSE_TYPE : Int32
    PEER_INVITATION_RESPONSE_DECLINED = 0
    PEER_INVITATION_RESPONSE_ACCEPTED = 1
    PEER_INVITATION_RESPONSE_EXPIRED = 2
    PEER_INVITATION_RESPONSE_ERROR = 3
  end

  enum PEER_APPLICATION_REGISTRATION_TYPE : Int32
    PEER_APPLICATION_CURRENT_USER = 0
    PEER_APPLICATION_ALL_USERS = 1
  end

  enum PEER_PRESENCE_STATUS : Int32
    PEER_PRESENCE_OFFLINE = 0
    PEER_PRESENCE_OUT_TO_LUNCH = 1
    PEER_PRESENCE_AWAY = 2
    PEER_PRESENCE_BE_RIGHT_BACK = 3
    PEER_PRESENCE_IDLE = 4
    PEER_PRESENCE_BUSY = 5
    PEER_PRESENCE_ON_THE_PHONE = 6
    PEER_PRESENCE_ONLINE = 7
  end

  enum PEER_CHANGE_TYPE : Int32
    PEER_CHANGE_ADDED = 0
    PEER_CHANGE_DELETED = 1
    PEER_CHANGE_UPDATED = 2
  end

  enum PEER_COLLAB_EVENT_TYPE : Int32
    PEER_EVENT_WATCHLIST_CHANGED = 1
    PEER_EVENT_ENDPOINT_CHANGED = 2
    PEER_EVENT_ENDPOINT_PRESENCE_CHANGED = 3
    PEER_EVENT_ENDPOINT_APPLICATION_CHANGED = 4
    PEER_EVENT_ENDPOINT_OBJECT_CHANGED = 5
    PEER_EVENT_MY_ENDPOINT_CHANGED = 6
    PEER_EVENT_MY_PRESENCE_CHANGED = 7
    PEER_EVENT_MY_APPLICATION_CHANGED = 8
    PEER_EVENT_MY_OBJECT_CHANGED = 9
    PEER_EVENT_PEOPLE_NEAR_ME_CHANGED = 10
    PEER_EVENT_REQUEST_STATUS_CHANGED = 11
  end

  enum DRT_SCOPE : Int32
    DRT_GLOBAL_SCOPE = 1
    DRT_SITE_LOCAL_SCOPE = 2
    DRT_LINK_LOCAL_SCOPE = 3
  end

  enum DRT_STATUS : Int32
    DRT_ACTIVE = 0
    DRT_ALONE = 1
    DRT_NO_NETWORK = 10
    DRT_FAULTED = 20
  end

  enum DRT_MATCH_TYPE : Int32
    DRT_MATCH_EXACT = 0
    DRT_MATCH_NEAR = 1
    DRT_MATCH_INTERMEDIATE = 2
  end

  enum DRT_LEAFSET_KEY_CHANGE_TYPE : Int32
    DRT_LEAFSET_KEY_ADDED = 0
    DRT_LEAFSET_KEY_DELETED = 1
  end

  enum DRT_EVENT_TYPE : Int32
    DRT_EVENT_STATUS_CHANGED = 0
    DRT_EVENT_LEAFSET_KEY_CHANGED = 1
    DRT_EVENT_REGISTRATION_STATE_CHANGED = 2
  end

  enum DRT_SECURITY_MODE : Int32
    DRT_SECURE_RESOLVE = 0
    DRT_SECURE_MEMBERSHIP = 1
    DRT_SECURE_CONFIDENTIALPAYLOAD = 2
  end

  enum DRT_REGISTRATION_STATE : Int32
    DRT_REGISTRATION_STATE_UNRESOLVEABLE = 1
  end

  enum DRT_ADDRESS_FLAGS : Int32
    DRT_ADDRESS_FLAG_ACCEPTED = 1
    DRT_ADDRESS_FLAG_REJECTED = 2
    DRT_ADDRESS_FLAG_UNREACHABLE = 4
    DRT_ADDRESS_FLAG_LOOP = 8
    DRT_ADDRESS_FLAG_TOO_BUSY = 16
    DRT_ADDRESS_FLAG_BAD_VALIDATE_ID = 32
    DRT_ADDRESS_FLAG_SUSPECT_UNREGISTERED_ID = 64
    DRT_ADDRESS_FLAG_INQUIRE = 128
  end

  enum PEERDIST_STATUS : Int32
    PEERDIST_STATUS_DISABLED = 0
    PEERDIST_STATUS_UNAVAILABLE = 1
    PEERDIST_STATUS_AVAILABLE = 2
  end

  enum PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS : Int32
    PeerDistClientBasicInfo = 0
    MaximumPeerDistClientInfoByHandlesClass = 1
  end

  union PNRPINFO_V2_Anonymous_e__Union
    blob_payload : BLOB
    pwsz_payload : LibC::LPWSTR
  end
  union PEER_GRAPH_EVENT_DATA_Anonymous_e__Union
    dw_status : PEER_GRAPH_STATUS_FLAGS
    incoming_data : PEER_EVENT_INCOMING_DATA
    record_change_data : PEER_EVENT_RECORD_CHANGE_DATA
    connection_change_data : PEER_EVENT_CONNECTION_CHANGE_DATA
    node_change_data : PEER_EVENT_NODE_CHANGE_DATA
    synchronized_data : PEER_EVENT_SYNCHRONIZED_DATA
  end
  union PEER_GROUP_EVENT_DATA_Anonymous_e__Union
    dw_status : PEER_GROUP_STATUS
    incoming_data : PEER_EVENT_INCOMING_DATA
    record_change_data : PEER_EVENT_RECORD_CHANGE_DATA
    connection_change_data : PEER_EVENT_CONNECTION_CHANGE_DATA
    member_change_data : PEER_EVENT_MEMBER_CHANGE_DATA
    hr_connection_failed_reason : HRESULT
  end
  union PEER_COLLAB_EVENT_DATA_Anonymous_e__Union
    watch_list_changed_data : PEER_EVENT_WATCHLIST_CHANGED_DATA
    presence_changed_data : PEER_EVENT_PRESENCE_CHANGED_DATA
    application_changed_data : PEER_EVENT_APPLICATION_CHANGED_DATA
    object_changed_data : PEER_EVENT_OBJECT_CHANGED_DATA
    endpoint_changed_data : PEER_EVENT_ENDPOINT_CHANGED_DATA
    people_near_me_changed_data : PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA
    request_status_changed_data : PEER_EVENT_REQUEST_STATUS_CHANGED_DATA
  end
  union DRT_EVENT_DATA_Anonymous_e__Union
    leafset_key_change : DRT_EVENT_DATA_Anonymous_e__Union_leafsetKeyChange_e__Struct
    registration_state_change : DRT_EVENT_DATA_Anonymous_e__Union_registrationStateChange_e__Struct
    status_change : DRT_EVENT_DATA_Anonymous_e__Union_statusChange_e__Struct
  end

  struct PNRP_CLOUD_ID
    address_family : Int32
    scope : PNRP_SCOPE
    scope_id : UInt32
  end
  struct PNRPINFO_V1
    dw_size : UInt32
    lpwsz_identity : LibC::LPWSTR
    n_max_resolve : UInt32
    dw_timeout : UInt32
    dw_lifetime : UInt32
    en_resolve_criteria : PNRP_RESOLVE_CRITERIA
    dw_flags : UInt32
    sa_hint : SOCKET_ADDRESS
    en_name_state : PNRP_REGISTERED_ID_STATE
  end
  struct PNRPINFO_V2
    dw_size : UInt32
    lpwsz_identity : LibC::LPWSTR
    n_max_resolve : UInt32
    dw_timeout : UInt32
    dw_lifetime : UInt32
    en_resolve_criteria : PNRP_RESOLVE_CRITERIA
    dw_flags : UInt32
    sa_hint : SOCKET_ADDRESS
    en_name_state : PNRP_REGISTERED_ID_STATE
    en_extended_payload_type : PNRP_EXTENDED_PAYLOAD_TYPE
    anonymous : PNRPINFO_V2_Anonymous_e__Union
  end
  struct PNRPCLOUDINFO
    dw_size : UInt32
    cloud : PNRP_CLOUD_ID
    en_cloud_state : PNRP_CLOUD_STATE
    en_cloud_flags : PNRP_CLOUD_FLAGS
  end
  struct PEER_VERSION_DATA
    w_version : UInt16
    w_highest_version : UInt16
  end
  struct PEER_DATA
    cb_data : UInt32
    pb_data : UInt8*
  end
  struct PEER_RECORD
    dw_size : UInt32
    type : Guid
    id : Guid
    dw_version : UInt32
    dw_flags : UInt32
    pwz_creator_id : LibC::LPWSTR
    pwz_modified_by_id : LibC::LPWSTR
    pwz_attributes : LibC::LPWSTR
    ft_creation : FILETIME
    ft_expiration : FILETIME
    ft_last_modified : FILETIME
    security_data : PEER_DATA
    data : PEER_DATA
  end
  struct PEER_ADDRESS
    dw_size : UInt32
    sin6 : SOCKADDR_IN6
  end
  struct PEER_CONNECTION_INFO
    dw_size : UInt32
    dw_flags : UInt32
    ull_connection_id : UInt64
    ull_node_id : UInt64
    pwz_peer_id : LibC::LPWSTR
    address : PEER_ADDRESS
  end
  struct PEER_EVENT_INCOMING_DATA
    dw_size : UInt32
    ull_connection_id : UInt64
    type : Guid
    data : PEER_DATA
  end
  struct PEER_EVENT_RECORD_CHANGE_DATA
    dw_size : UInt32
    change_type : PEER_RECORD_CHANGE_TYPE
    record_id : Guid
    record_type : Guid
  end
  struct PEER_EVENT_CONNECTION_CHANGE_DATA
    dw_size : UInt32
    status : PEER_CONNECTION_STATUS
    ull_connection_id : UInt64
    ull_node_id : UInt64
    ull_next_connection_id : UInt64
    hr_connection_failed_reason : HRESULT
  end
  struct PEER_EVENT_SYNCHRONIZED_DATA
    dw_size : UInt32
    record_type : Guid
  end
  struct PEER_GRAPH_PROPERTIES
    dw_size : UInt32
    dw_flags : UInt32
    dw_scope : UInt32
    dw_max_record_size : UInt32
    pwz_graph_id : LibC::LPWSTR
    pwz_creator_id : LibC::LPWSTR
    pwz_friendly_name : LibC::LPWSTR
    pwz_comment : LibC::LPWSTR
    ul_presence_lifetime : UInt32
    c_presence_max : UInt32
  end
  struct PEER_NODE_INFO
    dw_size : UInt32
    ull_node_id : UInt64
    pwz_peer_id : LibC::LPWSTR
    c_addresses : UInt32
    p_addresses : PEER_ADDRESS*
    pwz_attributes : LibC::LPWSTR
  end
  struct PEER_EVENT_NODE_CHANGE_DATA
    dw_size : UInt32
    change_type : PEER_NODE_CHANGE_TYPE
    ull_node_id : UInt64
    pwz_peer_id : LibC::LPWSTR
  end
  struct PEER_GRAPH_EVENT_REGISTRATION
    event_type : PEER_GRAPH_EVENT_TYPE
    p_type : Guid*
  end
  struct PEER_GRAPH_EVENT_DATA
    event_type : PEER_GRAPH_EVENT_TYPE
    anonymous : PEER_GRAPH_EVENT_DATA_Anonymous_e__Union
  end
  struct PEER_SECURITY_INTERFACE
    dw_size : UInt32
    pwz_ssp_filename : LibC::LPWSTR
    pwz_package_name : LibC::LPWSTR
    cb_security_info : UInt32
    pb_security_info : UInt8*
    pv_context : Void*
    pfn_validate_record : PFNPEER_VALIDATE_RECORD
    pfn_secure_record : PFNPEER_SECURE_RECORD
    pfn_free_security_data : PFNPEER_FREE_SECURITY_DATA
    pfn_auth_failed : PFNPEER_ON_PASSWORD_AUTH_FAILED
  end
  struct PEER_CREDENTIAL_INFO
    dw_size : UInt32
    dw_flags : UInt32
    pwz_friendly_name : LibC::LPWSTR
    p_public_key : CERT_PUBLIC_KEY_INFO*
    pwz_issuer_peer_name : LibC::LPWSTR
    pwz_issuer_friendly_name : LibC::LPWSTR
    ft_validity_start : FILETIME
    ft_validity_end : FILETIME
    c_roles : UInt32
    p_roles : Guid*
  end
  struct PEER_MEMBER
    dw_size : UInt32
    dw_flags : UInt32
    pwz_identity : LibC::LPWSTR
    pwz_attributes : LibC::LPWSTR
    ull_node_id : UInt64
    c_addresses : UInt32
    p_addresses : PEER_ADDRESS*
    p_credential_info : PEER_CREDENTIAL_INFO*
  end
  struct PEER_INVITATION_INFO
    dw_size : UInt32
    dw_flags : UInt32
    pwz_cloud_name : LibC::LPWSTR
    dw_scope : UInt32
    dw_cloud_flags : UInt32
    pwz_group_peer_name : LibC::LPWSTR
    pwz_issuer_peer_name : LibC::LPWSTR
    pwz_subject_peer_name : LibC::LPWSTR
    pwz_group_friendly_name : LibC::LPWSTR
    pwz_issuer_friendly_name : LibC::LPWSTR
    pwz_subject_friendly_name : LibC::LPWSTR
    ft_validity_start : FILETIME
    ft_validity_end : FILETIME
    c_roles : UInt32
    p_roles : Guid*
    c_classifiers : UInt32
    ppwz_classifiers : LibC::LPWSTR*
    p_subject_public_key : CERT_PUBLIC_KEY_INFO*
    auth_scheme : PEER_GROUP_AUTHENTICATION_SCHEME
  end
  struct PEER_GROUP_PROPERTIES
    dw_size : UInt32
    dw_flags : UInt32
    pwz_cloud : LibC::LPWSTR
    pwz_classifier : LibC::LPWSTR
    pwz_group_peer_name : LibC::LPWSTR
    pwz_creator_peer_name : LibC::LPWSTR
    pwz_friendly_name : LibC::LPWSTR
    pwz_comment : LibC::LPWSTR
    ul_member_data_lifetime : UInt32
    ul_presence_lifetime : UInt32
    dw_authentication_schemes : UInt32
    pwz_group_password : LibC::LPWSTR
    group_password_role : Guid
  end
  struct PEER_EVENT_MEMBER_CHANGE_DATA
    dw_size : UInt32
    change_type : PEER_MEMBER_CHANGE_TYPE
    pwz_identity : LibC::LPWSTR
  end
  struct PEER_GROUP_EVENT_REGISTRATION
    event_type : PEER_GROUP_EVENT_TYPE
    p_type : Guid*
  end
  struct PEER_GROUP_EVENT_DATA
    event_type : PEER_GROUP_EVENT_TYPE
    anonymous : PEER_GROUP_EVENT_DATA_Anonymous_e__Union
  end
  struct PEER_NAME_PAIR
    dw_size : UInt32
    pwz_peer_name : LibC::LPWSTR
    pwz_friendly_name : LibC::LPWSTR
  end
  struct PEER_APPLICATION
    id : Guid
    data : PEER_DATA
    pwz_description : LibC::LPWSTR
  end
  struct PEER_OBJECT
    id : Guid
    data : PEER_DATA
    dw_publication_scope : UInt32
  end
  struct PEER_CONTACT
    pwz_peer_name : LibC::LPWSTR
    pwz_nick_name : LibC::LPWSTR
    pwz_display_name : LibC::LPWSTR
    pwz_email_address : LibC::LPWSTR
    f_watch : LibC::BOOL
    watcher_permissions : PEER_WATCH_PERMISSION
    credentials : PEER_DATA
  end
  struct PEER_ENDPOINT
    address : PEER_ADDRESS
    pwz_endpoint_name : LibC::LPWSTR
  end
  struct PEER_PEOPLE_NEAR_ME
    pwz_nick_name : LibC::LPWSTR
    endpoint : PEER_ENDPOINT
    id : Guid
  end
  struct PEER_INVITATION
    application_id : Guid
    application_data : PEER_DATA
    pwz_message : LibC::LPWSTR
  end
  struct PEER_INVITATION_RESPONSE
    action : PEER_INVITATION_RESPONSE_TYPE
    pwz_message : LibC::LPWSTR
    hr_extended_info : HRESULT
  end
  struct PEER_APP_LAUNCH_INFO
    p_contact : PEER_CONTACT*
    p_endpoint : PEER_ENDPOINT*
    p_invitation : PEER_INVITATION*
  end
  struct PEER_APPLICATION_REGISTRATION_INFO
    application : PEER_APPLICATION
    pwz_application_to_launch : LibC::LPWSTR
    pwz_application_arguments : LibC::LPWSTR
    dw_publication_scope : UInt32
  end
  struct PEER_PRESENCE_INFO
    status : PEER_PRESENCE_STATUS
    pwz_descriptive_text : LibC::LPWSTR
  end
  struct PEER_COLLAB_EVENT_REGISTRATION
    event_type : PEER_COLLAB_EVENT_TYPE
    p_instance : Guid*
  end
  struct PEER_EVENT_WATCHLIST_CHANGED_DATA
    p_contact : PEER_CONTACT*
    change_type : PEER_CHANGE_TYPE
  end
  struct PEER_EVENT_PRESENCE_CHANGED_DATA
    p_contact : PEER_CONTACT*
    p_endpoint : PEER_ENDPOINT*
    change_type : PEER_CHANGE_TYPE
    p_presence_info : PEER_PRESENCE_INFO*
  end
  struct PEER_EVENT_APPLICATION_CHANGED_DATA
    p_contact : PEER_CONTACT*
    p_endpoint : PEER_ENDPOINT*
    change_type : PEER_CHANGE_TYPE
    p_application : PEER_APPLICATION*
  end
  struct PEER_EVENT_OBJECT_CHANGED_DATA
    p_contact : PEER_CONTACT*
    p_endpoint : PEER_ENDPOINT*
    change_type : PEER_CHANGE_TYPE
    p_object : PEER_OBJECT*
  end
  struct PEER_EVENT_ENDPOINT_CHANGED_DATA
    p_contact : PEER_CONTACT*
    p_endpoint : PEER_ENDPOINT*
  end
  struct PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA
    change_type : PEER_CHANGE_TYPE
    p_people_near_me : PEER_PEOPLE_NEAR_ME*
  end
  struct PEER_EVENT_REQUEST_STATUS_CHANGED_DATA
    p_endpoint : PEER_ENDPOINT*
    hr_change : HRESULT
  end
  struct PEER_COLLAB_EVENT_DATA
    event_type : PEER_COLLAB_EVENT_TYPE
    anonymous : PEER_COLLAB_EVENT_DATA_Anonymous_e__Union
  end
  struct PEER_PNRP_ENDPOINT_INFO
    pwz_peer_name : LibC::LPWSTR
    c_addresses : UInt32
    pp_addresses : SOCKADDR**
    pwz_comment : LibC::LPWSTR
    payload : PEER_DATA
  end
  struct PEER_PNRP_CLOUD_INFO
    pwz_cloud_name : LibC::LPWSTR
    dw_scope : PNRP_SCOPE
    dw_scope_id : UInt32
  end
  struct PEER_PNRP_REGISTRATION_INFO
    pwz_cloud_name : LibC::LPWSTR
    pwz_publishing_identity : LibC::LPWSTR
    c_addresses : UInt32
    pp_addresses : SOCKADDR**
    w_port : UInt16
    pwz_comment : LibC::LPWSTR
    payload : PEER_DATA
  end
  struct DRT_DATA
    cb : UInt32
    pb : UInt8*
  end
  struct DRT_REGISTRATION
    key : DRT_DATA
    app_data : DRT_DATA
  end
  struct DRT_SECURITY_PROVIDER
    pv_context : Void*
    attach : LibC::IntPtrT
    detach : LibC::IntPtrT
    register_key : LibC::IntPtrT
    unregister_key : LibC::IntPtrT
    validate_and_unpack_payload : LibC::IntPtrT
    secure_and_pack_payload : LibC::IntPtrT
    free_data : LibC::IntPtrT
    encrypt_data : LibC::IntPtrT
    decrypt_data : LibC::IntPtrT
    get_serialized_credential : LibC::IntPtrT
    validate_remote_credential : LibC::IntPtrT
    sign_data : LibC::IntPtrT
    verify_data : LibC::IntPtrT
  end
  struct DRT_BOOTSTRAP_PROVIDER
    pv_context : Void*
    attach : LibC::IntPtrT
    detach : LibC::IntPtrT
    init_resolve : LibC::IntPtrT
    issue_resolve : LibC::IntPtrT
    end_resolve : LibC::IntPtrT
    register : LibC::IntPtrT
    unregister : LibC::IntPtrT
  end
  struct DRT_SETTINGS
    dw_size : UInt32
    cb_key : UInt32
    b_protocol_major_version : UInt8
    b_protocol_minor_version : UInt8
    ul_max_routing_addresses : UInt32
    pwz_drt_instance_prefix : LibC::LPWSTR
    h_transport : Void*
    p_security_provider : DRT_SECURITY_PROVIDER*
    p_bootstrap_provider : DRT_BOOTSTRAP_PROVIDER*
    e_security_mode : DRT_SECURITY_MODE
  end
  struct DRT_SEARCH_INFO
    dw_size : UInt32
    f_iterative : LibC::BOOL
    f_allow_current_instance_match : LibC::BOOL
    f_any_match_in_range : LibC::BOOL
    c_max_endpoints : UInt32
    p_maximum_key : DRT_DATA*
    p_minimum_key : DRT_DATA*
  end
  struct DRT_ADDRESS
    socket_address : SOCKADDR_STORAGE
    flags : UInt32
    nearness : Int32
    latency : UInt32
  end
  struct DRT_ADDRESS_LIST
    address_count : UInt32
    address_list : DRT_ADDRESS[0]*
  end
  struct DRT_SEARCH_RESULT
    dw_size : UInt32
    type : DRT_MATCH_TYPE
    pv_context : Void*
    registration : DRT_REGISTRATION
  end
  struct DRT_EVENT_DATA
    type : DRT_EVENT_TYPE
    hr : HRESULT
    pv_context : Void*
    anonymous : DRT_EVENT_DATA_Anonymous_e__Union
  end
  struct DRT_EVENT_DATA_Anonymous_e__Union_statusChange_e__Struct
    status : DRT_STATUS
    bootstrap_addresses : DRT_EVENT_DATA_Anonymous_e__Union_statusChange_e__Struct_bootstrapAddresses_e__Struct
  end
  struct DRT_EVENT_DATA_Anonymous_e__Union_statusChange_e__Struct_bootstrapAddresses_e__Struct
    cnt_address : UInt32
    p_addresses : SOCKADDR_STORAGE*
  end
  struct DRT_EVENT_DATA_Anonymous_e__Union_leafsetKeyChange_e__Struct
    change : DRT_LEAFSET_KEY_CHANGE_TYPE
    local_key : DRT_DATA
    remote_key : DRT_DATA
  end
  struct DRT_EVENT_DATA_Anonymous_e__Union_registrationStateChange_e__Struct
    state : DRT_REGISTRATION_STATE
    local_key : DRT_DATA
  end
  struct PEERDIST_PUBLICATION_OPTIONS
    dw_version : UInt32
    dw_flags : UInt32
  end
  struct PEERDIST_CONTENT_TAG
    data : UInt8[16]*
  end
  struct PEERDIST_RETRIEVAL_OPTIONS
    cb_size : UInt32
    dw_content_info_min_version : UInt32
    dw_content_info_max_version : UInt32
    dw_reserved : UInt32
  end
  struct PEERDIST_STATUS_INFO
    cb_size : UInt32
    status : PEERDIST_STATUS
    dw_min_ver : PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE
    dw_max_ver : PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE
  end
  struct PEERDIST_CLIENT_BASIC_INFO
    f_flash_crowd : LibC::BOOL
  end


  # Params # wversionrequested : UInt16 [In],pversiondata : PEER_VERSION_DATA* [In]
  fun PeerGraphStartup(wversionrequested : UInt16, pversiondata : PEER_VERSION_DATA*) : HRESULT

  # Params # 
  fun PeerGraphShutdown : HRESULT

  # Params # pvdata : Void* [In]
  fun PeerGraphFreeData(pvdata : Void*)

  # Params # hpeerenum : Void* [In],pcount : UInt32* [In]
  fun PeerGraphGetItemCount(hpeerenum : Void*, pcount : UInt32*) : HRESULT

  # Params # hpeerenum : Void* [In],pcount : UInt32* [In],pppvitems : Void*** [In]
  fun PeerGraphGetNextItem(hpeerenum : Void*, pcount : UInt32*, pppvitems : Void***) : HRESULT

  # Params # hpeerenum : Void* [In]
  fun PeerGraphEndEnumeration(hpeerenum : Void*) : HRESULT

  # Params # pgraphproperties : PEER_GRAPH_PROPERTIES* [In],pwzdatabasename : LibC::LPWSTR [In],psecurityinterface : PEER_SECURITY_INTERFACE* [In],phgraph : Void** [In]
  fun PeerGraphCreate(pgraphproperties : PEER_GRAPH_PROPERTIES*, pwzdatabasename : LibC::LPWSTR, psecurityinterface : PEER_SECURITY_INTERFACE*, phgraph : Void**) : HRESULT

  # Params # pwzgraphid : LibC::LPWSTR [In],pwzpeerid : LibC::LPWSTR [In],pwzdatabasename : LibC::LPWSTR [In],psecurityinterface : PEER_SECURITY_INTERFACE* [In],crecordtypesyncprecedence : UInt32 [In],precordtypesyncprecedence : Guid* [In],phgraph : Void** [In]
  fun PeerGraphOpen(pwzgraphid : LibC::LPWSTR, pwzpeerid : LibC::LPWSTR, pwzdatabasename : LibC::LPWSTR, psecurityinterface : PEER_SECURITY_INTERFACE*, crecordtypesyncprecedence : UInt32, precordtypesyncprecedence : Guid*, phgraph : Void**) : HRESULT

  # Params # hgraph : Void* [In],dwscope : UInt32 [In],dwscopeid : UInt32 [In],wport : UInt16 [In]
  fun PeerGraphListen(hgraph : Void*, dwscope : UInt32, dwscopeid : UInt32, wport : UInt16) : HRESULT

  # Params # hgraph : Void* [In],pwzpeerid : LibC::LPWSTR [In],paddress : PEER_ADDRESS* [In],pullconnectionid : UInt64* [In]
  fun PeerGraphConnect(hgraph : Void*, pwzpeerid : LibC::LPWSTR, paddress : PEER_ADDRESS*, pullconnectionid : UInt64*) : HRESULT

  # Params # hgraph : Void* [In]
  fun PeerGraphClose(hgraph : Void*) : HRESULT

  # Params # pwzgraphid : LibC::LPWSTR [In],pwzpeerid : LibC::LPWSTR [In],pwzdatabasename : LibC::LPWSTR [In]
  fun PeerGraphDelete(pwzgraphid : LibC::LPWSTR, pwzpeerid : LibC::LPWSTR, pwzdatabasename : LibC::LPWSTR) : HRESULT

  # Params # hgraph : Void* [In],pdwstatus : UInt32* [In]
  fun PeerGraphGetStatus(hgraph : Void*, pdwstatus : UInt32*) : HRESULT

  # Params # hgraph : Void* [In],ppgraphproperties : PEER_GRAPH_PROPERTIES** [In]
  fun PeerGraphGetProperties(hgraph : Void*, ppgraphproperties : PEER_GRAPH_PROPERTIES**) : HRESULT

  # Params # hgraph : Void* [In],pgraphproperties : PEER_GRAPH_PROPERTIES* [In]
  fun PeerGraphSetProperties(hgraph : Void*, pgraphproperties : PEER_GRAPH_PROPERTIES*) : HRESULT

  # Params # hgraph : Void* [In],hevent : LibC::HANDLE [In],ceventregistrations : UInt32 [In],peventregistrations : PEER_GRAPH_EVENT_REGISTRATION* [In],phpeerevent : Void** [In]
  fun PeerGraphRegisterEvent(hgraph : Void*, hevent : LibC::HANDLE, ceventregistrations : UInt32, peventregistrations : PEER_GRAPH_EVENT_REGISTRATION*, phpeerevent : Void**) : HRESULT

  # Params # hpeerevent : Void* [In]
  fun PeerGraphUnregisterEvent(hpeerevent : Void*) : HRESULT

  # Params # hpeerevent : Void* [In],ppeventdata : PEER_GRAPH_EVENT_DATA** [In]
  fun PeerGraphGetEventData(hpeerevent : Void*, ppeventdata : PEER_GRAPH_EVENT_DATA**) : HRESULT

  # Params # hgraph : Void* [In],precordid : Guid* [In],pprecord : PEER_RECORD** [In]
  fun PeerGraphGetRecord(hgraph : Void*, precordid : Guid*, pprecord : PEER_RECORD**) : HRESULT

  # Params # hgraph : Void* [In],precord : PEER_RECORD* [In],precordid : Guid* [In]
  fun PeerGraphAddRecord(hgraph : Void*, precord : PEER_RECORD*, precordid : Guid*) : HRESULT

  # Params # hgraph : Void* [In],precord : PEER_RECORD* [In]
  fun PeerGraphUpdateRecord(hgraph : Void*, precord : PEER_RECORD*) : HRESULT

  # Params # hgraph : Void* [In],precordid : Guid* [In],flocal : LibC::BOOL [In]
  fun PeerGraphDeleteRecord(hgraph : Void*, precordid : Guid*, flocal : LibC::BOOL) : HRESULT

  # Params # hgraph : Void* [In],precordtype : Guid* [In],pwzpeerid : LibC::LPWSTR [In],phpeerenum : Void** [In]
  fun PeerGraphEnumRecords(hgraph : Void*, precordtype : Guid*, pwzpeerid : LibC::LPWSTR, phpeerenum : Void**) : HRESULT

  # Params # hgraph : Void* [In],pwzcriteria : LibC::LPWSTR [In],phpeerenum : Void** [In]
  fun PeerGraphSearchRecords(hgraph : Void*, pwzcriteria : LibC::LPWSTR, phpeerenum : Void**) : HRESULT

  # Params # hgraph : Void* [In],pwzfilepath : LibC::LPWSTR [In]
  fun PeerGraphExportDatabase(hgraph : Void*, pwzfilepath : LibC::LPWSTR) : HRESULT

  # Params # hgraph : Void* [In],pwzfilepath : LibC::LPWSTR [In]
  fun PeerGraphImportDatabase(hgraph : Void*, pwzfilepath : LibC::LPWSTR) : HRESULT

  # Params # hgraph : Void* [In],crecordids : UInt32 [In],precordids : Guid* [In]
  fun PeerGraphValidateDeferredRecords(hgraph : Void*, crecordids : UInt32, precordids : Guid*) : HRESULT

  # Params # hgraph : Void* [In],pwzpeerid : LibC::LPWSTR [In],paddress : PEER_ADDRESS* [In],pullconnectionid : UInt64* [In]
  fun PeerGraphOpenDirectConnection(hgraph : Void*, pwzpeerid : LibC::LPWSTR, paddress : PEER_ADDRESS*, pullconnectionid : UInt64*) : HRESULT

  # Params # hgraph : Void* [In],ullconnectionid : UInt64 [In],ptype : Guid* [In],cbdata : UInt32 [In],pvdata : Void* [In]
  fun PeerGraphSendData(hgraph : Void*, ullconnectionid : UInt64, ptype : Guid*, cbdata : UInt32, pvdata : Void*) : HRESULT

  # Params # hgraph : Void* [In],ullconnectionid : UInt64 [In]
  fun PeerGraphCloseDirectConnection(hgraph : Void*, ullconnectionid : UInt64) : HRESULT

  # Params # hgraph : Void* [In],dwflags : UInt32 [In],phpeerenum : Void** [In]
  fun PeerGraphEnumConnections(hgraph : Void*, dwflags : UInt32, phpeerenum : Void**) : HRESULT

  # Params # hgraph : Void* [In],pwzpeerid : LibC::LPWSTR [In],phpeerenum : Void** [In]
  fun PeerGraphEnumNodes(hgraph : Void*, pwzpeerid : LibC::LPWSTR, phpeerenum : Void**) : HRESULT

  # Params # hgraph : Void* [In],fpresent : LibC::BOOL [In]
  fun PeerGraphSetPresence(hgraph : Void*, fpresent : LibC::BOOL) : HRESULT

  # Params # hgraph : Void* [In],ullnodeid : UInt64 [In],ppnodeinfo : PEER_NODE_INFO** [In]
  fun PeerGraphGetNodeInfo(hgraph : Void*, ullnodeid : UInt64, ppnodeinfo : PEER_NODE_INFO**) : HRESULT

  # Params # hgraph : Void* [In],pwzattributes : LibC::LPWSTR [In]
  fun PeerGraphSetNodeAttributes(hgraph : Void*, pwzattributes : LibC::LPWSTR) : HRESULT

  # Params # hgraph : Void* [In],pftpeertime : FILETIME* [In],pftuniversaltime : FILETIME* [In]
  fun PeerGraphPeerTimeToUniversalTime(hgraph : Void*, pftpeertime : FILETIME*, pftuniversaltime : FILETIME*) : HRESULT

  # Params # hgraph : Void* [In],pftuniversaltime : FILETIME* [In],pftpeertime : FILETIME* [In]
  fun PeerGraphUniversalTimeToPeerTime(hgraph : Void*, pftuniversaltime : FILETIME*, pftpeertime : FILETIME*) : HRESULT

  # Params # pvdata : Void* [In]
  fun PeerFreeData(pvdata : Void*)

  # Params # hpeerenum : Void* [In],pcount : UInt32* [In]
  fun PeerGetItemCount(hpeerenum : Void*, pcount : UInt32*) : HRESULT

  # Params # hpeerenum : Void* [In],pcount : UInt32* [In],pppvitems : Void*** [In]
  fun PeerGetNextItem(hpeerenum : Void*, pcount : UInt32*, pppvitems : Void***) : HRESULT

  # Params # hpeerenum : Void* [In]
  fun PeerEndEnumeration(hpeerenum : Void*) : HRESULT

  # Params # wversionrequested : UInt16 [In],pversiondata : PEER_VERSION_DATA* [In]
  fun PeerGroupStartup(wversionrequested : UInt16, pversiondata : PEER_VERSION_DATA*) : HRESULT

  # Params # 
  fun PeerGroupShutdown : HRESULT

  # Params # pproperties : PEER_GROUP_PROPERTIES* [In],phgroup : Void** [In]
  fun PeerGroupCreate(pproperties : PEER_GROUP_PROPERTIES*, phgroup : Void**) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],pwzgrouppeername : LibC::LPWSTR [In],pwzcloud : LibC::LPWSTR [In],phgroup : Void** [In]
  fun PeerGroupOpen(pwzidentity : LibC::LPWSTR, pwzgrouppeername : LibC::LPWSTR, pwzcloud : LibC::LPWSTR, phgroup : Void**) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],pwzinvitation : LibC::LPWSTR [In],pwzcloud : LibC::LPWSTR [In],phgroup : Void** [In]
  fun PeerGroupJoin(pwzidentity : LibC::LPWSTR, pwzinvitation : LibC::LPWSTR, pwzcloud : LibC::LPWSTR, phgroup : Void**) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],pwzinvitation : LibC::LPWSTR [In],pwzpassword : LibC::LPWSTR [In],pwzcloud : LibC::LPWSTR [In],phgroup : Void** [In]
  fun PeerGroupPasswordJoin(pwzidentity : LibC::LPWSTR, pwzinvitation : LibC::LPWSTR, pwzpassword : LibC::LPWSTR, pwzcloud : LibC::LPWSTR, phgroup : Void**) : HRESULT

  # Params # hgroup : Void* [In]
  fun PeerGroupConnect(hgroup : Void*) : HRESULT

  # Params # hgroup : Void* [In],caddresses : UInt32 [In],paddresses : PEER_ADDRESS* [In]
  fun PeerGroupConnectByAddress(hgroup : Void*, caddresses : UInt32, paddresses : PEER_ADDRESS*) : HRESULT

  # Params # hgroup : Void* [In]
  fun PeerGroupClose(hgroup : Void*) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],pwzgrouppeername : LibC::LPWSTR [In]
  fun PeerGroupDelete(pwzidentity : LibC::LPWSTR, pwzgrouppeername : LibC::LPWSTR) : HRESULT

  # Params # hgroup : Void* [In],pwzidentityinfo : LibC::LPWSTR [In],pftexpiration : FILETIME* [In],croles : UInt32 [In],proles : Guid* [In],ppwzinvitation : LibC::LPWSTR* [In]
  fun PeerGroupCreateInvitation(hgroup : Void*, pwzidentityinfo : LibC::LPWSTR, pftexpiration : FILETIME*, croles : UInt32, proles : Guid*, ppwzinvitation : LibC::LPWSTR*) : HRESULT

  # Params # hgroup : Void* [In],ppwzinvitation : LibC::LPWSTR* [In]
  fun PeerGroupCreatePasswordInvitation(hgroup : Void*, ppwzinvitation : LibC::LPWSTR*) : HRESULT

  # Params # pwzinvitation : LibC::LPWSTR [In],ppinvitationinfo : PEER_INVITATION_INFO** [In]
  fun PeerGroupParseInvitation(pwzinvitation : LibC::LPWSTR, ppinvitationinfo : PEER_INVITATION_INFO**) : HRESULT

  # Params # hgroup : Void* [In],pdwstatus : UInt32* [In]
  fun PeerGroupGetStatus(hgroup : Void*, pdwstatus : UInt32*) : HRESULT

  # Params # hgroup : Void* [In],ppproperties : PEER_GROUP_PROPERTIES** [In]
  fun PeerGroupGetProperties(hgroup : Void*, ppproperties : PEER_GROUP_PROPERTIES**) : HRESULT

  # Params # hgroup : Void* [In],pproperties : PEER_GROUP_PROPERTIES* [In]
  fun PeerGroupSetProperties(hgroup : Void*, pproperties : PEER_GROUP_PROPERTIES*) : HRESULT

  # Params # hgroup : Void* [In],dwflags : UInt32 [In],pwzidentity : LibC::LPWSTR [In],phpeerenum : Void** [In]
  fun PeerGroupEnumMembers(hgroup : Void*, dwflags : UInt32, pwzidentity : LibC::LPWSTR, phpeerenum : Void**) : HRESULT

  # Params # hgroup : Void* [In],pwzidentity : LibC::LPWSTR [In],paddress : PEER_ADDRESS* [In],pullconnectionid : UInt64* [In]
  fun PeerGroupOpenDirectConnection(hgroup : Void*, pwzidentity : LibC::LPWSTR, paddress : PEER_ADDRESS*, pullconnectionid : UInt64*) : HRESULT

  # Params # hgroup : Void* [In],ullconnectionid : UInt64 [In]
  fun PeerGroupCloseDirectConnection(hgroup : Void*, ullconnectionid : UInt64) : HRESULT

  # Params # hgroup : Void* [In],dwflags : UInt32 [In],phpeerenum : Void** [In]
  fun PeerGroupEnumConnections(hgroup : Void*, dwflags : UInt32, phpeerenum : Void**) : HRESULT

  # Params # hgroup : Void* [In],ullconnectionid : UInt64 [In],ptype : Guid* [In],cbdata : UInt32 [In],pvdata : Void* [In]
  fun PeerGroupSendData(hgroup : Void*, ullconnectionid : UInt64, ptype : Guid*, cbdata : UInt32, pvdata : Void*) : HRESULT

  # Params # hgroup : Void* [In],hevent : LibC::HANDLE [In],ceventregistration : UInt32 [In],peventregistrations : PEER_GROUP_EVENT_REGISTRATION* [In],phpeerevent : Void** [In]
  fun PeerGroupRegisterEvent(hgroup : Void*, hevent : LibC::HANDLE, ceventregistration : UInt32, peventregistrations : PEER_GROUP_EVENT_REGISTRATION*, phpeerevent : Void**) : HRESULT

  # Params # hpeerevent : Void* [In]
  fun PeerGroupUnregisterEvent(hpeerevent : Void*) : HRESULT

  # Params # hpeerevent : Void* [In],ppeventdata : PEER_GROUP_EVENT_DATA** [In]
  fun PeerGroupGetEventData(hpeerevent : Void*, ppeventdata : PEER_GROUP_EVENT_DATA**) : HRESULT

  # Params # hgroup : Void* [In],precordid : Guid* [In],pprecord : PEER_RECORD** [In]
  fun PeerGroupGetRecord(hgroup : Void*, precordid : Guid*, pprecord : PEER_RECORD**) : HRESULT

  # Params # hgroup : Void* [In],precord : PEER_RECORD* [In],precordid : Guid* [In]
  fun PeerGroupAddRecord(hgroup : Void*, precord : PEER_RECORD*, precordid : Guid*) : HRESULT

  # Params # hgroup : Void* [In],precord : PEER_RECORD* [In]
  fun PeerGroupUpdateRecord(hgroup : Void*, precord : PEER_RECORD*) : HRESULT

  # Params # hgroup : Void* [In],precordid : Guid* [In]
  fun PeerGroupDeleteRecord(hgroup : Void*, precordid : Guid*) : HRESULT

  # Params # hgroup : Void* [In],precordtype : Guid* [In],phpeerenum : Void** [In]
  fun PeerGroupEnumRecords(hgroup : Void*, precordtype : Guid*, phpeerenum : Void**) : HRESULT

  # Params # hgroup : Void* [In],pwzcriteria : LibC::LPWSTR [In],phpeerenum : Void** [In]
  fun PeerGroupSearchRecords(hgroup : Void*, pwzcriteria : LibC::LPWSTR, phpeerenum : Void**) : HRESULT

  # Params # hgroup : Void* [In],pwzfilepath : LibC::LPWSTR [In]
  fun PeerGroupExportDatabase(hgroup : Void*, pwzfilepath : LibC::LPWSTR) : HRESULT

  # Params # hgroup : Void* [In],pwzfilepath : LibC::LPWSTR [In]
  fun PeerGroupImportDatabase(hgroup : Void*, pwzfilepath : LibC::LPWSTR) : HRESULT

  # Params # hgroup : Void* [In],pwzsubjectidentity : LibC::LPWSTR [In],pcredentialinfo : PEER_CREDENTIAL_INFO* [In],dwflags : UInt32 [In],ppwzinvitation : LibC::LPWSTR* [In]
  fun PeerGroupIssueCredentials(hgroup : Void*, pwzsubjectidentity : LibC::LPWSTR, pcredentialinfo : PEER_CREDENTIAL_INFO*, dwflags : UInt32, ppwzinvitation : LibC::LPWSTR*) : HRESULT

  # Params # hgroup : Void* [In],pwzpassword : LibC::LPWSTR [In],ppwzxml : LibC::LPWSTR* [In]
  fun PeerGroupExportConfig(hgroup : Void*, pwzpassword : LibC::LPWSTR, ppwzxml : LibC::LPWSTR*) : HRESULT

  # Params # pwzxml : LibC::LPWSTR [In],pwzpassword : LibC::LPWSTR [In],foverwrite : LibC::BOOL [In],ppwzidentity : LibC::LPWSTR* [In],ppwzgroup : LibC::LPWSTR* [In]
  fun PeerGroupImportConfig(pwzxml : LibC::LPWSTR, pwzpassword : LibC::LPWSTR, foverwrite : LibC::BOOL, ppwzidentity : LibC::LPWSTR*, ppwzgroup : LibC::LPWSTR*) : HRESULT

  # Params # hgroup : Void* [In],pftpeertime : FILETIME* [In],pftuniversaltime : FILETIME* [In]
  fun PeerGroupPeerTimeToUniversalTime(hgroup : Void*, pftpeertime : FILETIME*, pftuniversaltime : FILETIME*) : HRESULT

  # Params # hgroup : Void* [In],pftuniversaltime : FILETIME* [In],pftpeertime : FILETIME* [In]
  fun PeerGroupUniversalTimeToPeerTime(hgroup : Void*, pftuniversaltime : FILETIME*, pftpeertime : FILETIME*) : HRESULT

  # Params # hgroup : Void* [In],hpeereventhandle : Void* [In]
  fun PeerGroupResumePasswordAuthentication(hgroup : Void*, hpeereventhandle : Void*) : HRESULT

  # Params # pwzclassifier : LibC::LPWSTR [In],pwzfriendlyname : LibC::LPWSTR [In],hcryptprov : LibC::UINT_PTR [In],ppwzidentity : LibC::LPWSTR* [In]
  fun PeerIdentityCreate(pwzclassifier : LibC::LPWSTR, pwzfriendlyname : LibC::LPWSTR, hcryptprov : LibC::UINT_PTR, ppwzidentity : LibC::LPWSTR*) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],ppwzfriendlyname : LibC::LPWSTR* [In]
  fun PeerIdentityGetFriendlyName(pwzidentity : LibC::LPWSTR, ppwzfriendlyname : LibC::LPWSTR*) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],pwzfriendlyname : LibC::LPWSTR [In]
  fun PeerIdentitySetFriendlyName(pwzidentity : LibC::LPWSTR, pwzfriendlyname : LibC::LPWSTR) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],phcryptprov : LibC::UINT_PTR* [In]
  fun PeerIdentityGetCryptKey(pwzidentity : LibC::LPWSTR, phcryptprov : LibC::UINT_PTR*) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In]
  fun PeerIdentityDelete(pwzidentity : LibC::LPWSTR) : HRESULT

  # Params # phpeerenum : Void** [In]
  fun PeerEnumIdentities(phpeerenum : Void**) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],phpeerenum : Void** [In]
  fun PeerEnumGroups(pwzidentity : LibC::LPWSTR, phpeerenum : Void**) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],pwzclassifier : LibC::LPWSTR [In],ppwzpeername : LibC::LPWSTR* [In]
  fun PeerCreatePeerName(pwzidentity : LibC::LPWSTR, pwzclassifier : LibC::LPWSTR, ppwzpeername : LibC::LPWSTR*) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],ppwzidentityxml : LibC::LPWSTR* [In]
  fun PeerIdentityGetXML(pwzidentity : LibC::LPWSTR, ppwzidentityxml : LibC::LPWSTR*) : HRESULT

  # Params # pwzidentity : LibC::LPWSTR [In],pwzpassword : LibC::LPWSTR [In],ppwzexportxml : LibC::LPWSTR* [In]
  fun PeerIdentityExport(pwzidentity : LibC::LPWSTR, pwzpassword : LibC::LPWSTR, ppwzexportxml : LibC::LPWSTR*) : HRESULT

  # Params # pwzimportxml : LibC::LPWSTR [In],pwzpassword : LibC::LPWSTR [In],ppwzidentity : LibC::LPWSTR* [In]
  fun PeerIdentityImport(pwzimportxml : LibC::LPWSTR, pwzpassword : LibC::LPWSTR, ppwzidentity : LibC::LPWSTR*) : HRESULT

  # Params # ppwzpeername : LibC::LPWSTR* [In]
  fun PeerIdentityGetDefault(ppwzpeername : LibC::LPWSTR*) : HRESULT

  # Params # wversionrequested : UInt16 [In]
  fun PeerCollabStartup(wversionrequested : UInt16) : HRESULT

  # Params # 
  fun PeerCollabShutdown : HRESULT

  # Params # hwndparent : LibC::HANDLE [In],dwsigninoptions : UInt32 [In]
  fun PeerCollabSignin(hwndparent : LibC::HANDLE, dwsigninoptions : UInt32) : HRESULT

  # Params # dwsigninoptions : UInt32 [In]
  fun PeerCollabSignout(dwsigninoptions : UInt32) : HRESULT

  # Params # pdwsigninoptions : UInt32* [In]
  fun PeerCollabGetSigninOptions(pdwsigninoptions : UInt32*) : HRESULT

  # Params # pccontact : PEER_CONTACT* [In],pcendpoint : PEER_ENDPOINT* [In],pcinvitation : PEER_INVITATION* [In],hevent : LibC::HANDLE [In],phinvitation : LibC::HANDLE* [In]
  fun PeerCollabAsyncInviteContact(pccontact : PEER_CONTACT*, pcendpoint : PEER_ENDPOINT*, pcinvitation : PEER_INVITATION*, hevent : LibC::HANDLE, phinvitation : LibC::HANDLE*) : HRESULT

  # Params # hinvitation : LibC::HANDLE [In],ppinvitationresponse : PEER_INVITATION_RESPONSE** [In]
  fun PeerCollabGetInvitationResponse(hinvitation : LibC::HANDLE, ppinvitationresponse : PEER_INVITATION_RESPONSE**) : HRESULT

  # Params # hinvitation : LibC::HANDLE [In]
  fun PeerCollabCancelInvitation(hinvitation : LibC::HANDLE) : HRESULT

  # Params # hinvitation : LibC::HANDLE [In]
  fun PeerCollabCloseHandle(hinvitation : LibC::HANDLE) : HRESULT

  # Params # pccontact : PEER_CONTACT* [In],pcendpoint : PEER_ENDPOINT* [In],pcinvitation : PEER_INVITATION* [In],ppresponse : PEER_INVITATION_RESPONSE** [In]
  fun PeerCollabInviteContact(pccontact : PEER_CONTACT*, pcendpoint : PEER_ENDPOINT*, pcinvitation : PEER_INVITATION*, ppresponse : PEER_INVITATION_RESPONSE**) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In],pcinvitation : PEER_INVITATION* [In],hevent : LibC::HANDLE [In],phinvitation : LibC::HANDLE* [In]
  fun PeerCollabAsyncInviteEndpoint(pcendpoint : PEER_ENDPOINT*, pcinvitation : PEER_INVITATION*, hevent : LibC::HANDLE, phinvitation : LibC::HANDLE*) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In],pcinvitation : PEER_INVITATION* [In],ppresponse : PEER_INVITATION_RESPONSE** [In]
  fun PeerCollabInviteEndpoint(pcendpoint : PEER_ENDPOINT*, pcinvitation : PEER_INVITATION*, ppresponse : PEER_INVITATION_RESPONSE**) : HRESULT

  # Params # pplaunchinfo : PEER_APP_LAUNCH_INFO** [In]
  fun PeerCollabGetAppLaunchInfo(pplaunchinfo : PEER_APP_LAUNCH_INFO**) : HRESULT

  # Params # pcapplication : PEER_APPLICATION_REGISTRATION_INFO* [In],registrationtype : PEER_APPLICATION_REGISTRATION_TYPE [In]
  fun PeerCollabRegisterApplication(pcapplication : PEER_APPLICATION_REGISTRATION_INFO*, registrationtype : PEER_APPLICATION_REGISTRATION_TYPE) : HRESULT

  # Params # papplicationid : Guid* [In],registrationtype : PEER_APPLICATION_REGISTRATION_TYPE [In]
  fun PeerCollabUnregisterApplication(papplicationid : Guid*, registrationtype : PEER_APPLICATION_REGISTRATION_TYPE) : HRESULT

  # Params # papplicationid : Guid* [In],registrationtype : PEER_APPLICATION_REGISTRATION_TYPE [In],ppapplication : PEER_APPLICATION_REGISTRATION_INFO** [In]
  fun PeerCollabGetApplicationRegistrationInfo(papplicationid : Guid*, registrationtype : PEER_APPLICATION_REGISTRATION_TYPE, ppapplication : PEER_APPLICATION_REGISTRATION_INFO**) : HRESULT

  # Params # registrationtype : PEER_APPLICATION_REGISTRATION_TYPE [In],phpeerenum : Void** [In]
  fun PeerCollabEnumApplicationRegistrationInfo(registrationtype : PEER_APPLICATION_REGISTRATION_TYPE, phpeerenum : Void**) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In],pppresenceinfo : PEER_PRESENCE_INFO** [In]
  fun PeerCollabGetPresenceInfo(pcendpoint : PEER_ENDPOINT*, pppresenceinfo : PEER_PRESENCE_INFO**) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In],papplicationid : Guid* [In],phpeerenum : Void** [In]
  fun PeerCollabEnumApplications(pcendpoint : PEER_ENDPOINT*, papplicationid : Guid*, phpeerenum : Void**) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In],pobjectid : Guid* [In],phpeerenum : Void** [In]
  fun PeerCollabEnumObjects(pcendpoint : PEER_ENDPOINT*, pobjectid : Guid*, phpeerenum : Void**) : HRESULT

  # Params # pccontact : PEER_CONTACT* [In],phpeerenum : Void** [In]
  fun PeerCollabEnumEndpoints(pccontact : PEER_CONTACT*, phpeerenum : Void**) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In]
  fun PeerCollabRefreshEndpointData(pcendpoint : PEER_ENDPOINT*) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In]
  fun PeerCollabDeleteEndpointData(pcendpoint : PEER_ENDPOINT*) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In],ppwzcontactdata : LibC::LPWSTR* [In]
  fun PeerCollabQueryContactData(pcendpoint : PEER_ENDPOINT*, ppwzcontactdata : LibC::LPWSTR*) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In]
  fun PeerCollabSubscribeEndpointData(pcendpoint : PEER_ENDPOINT*) : HRESULT

  # Params # pcendpoint : PEER_ENDPOINT* [In]
  fun PeerCollabUnsubscribeEndpointData(pcendpoint : PEER_ENDPOINT*) : HRESULT

  # Params # pcpresenceinfo : PEER_PRESENCE_INFO* [In]
  fun PeerCollabSetPresenceInfo(pcpresenceinfo : PEER_PRESENCE_INFO*) : HRESULT

  # Params # ppwzendpointname : LibC::LPWSTR* [In]
  fun PeerCollabGetEndpointName(ppwzendpointname : LibC::LPWSTR*) : HRESULT

  # Params # pwzendpointname : LibC::LPWSTR [In]
  fun PeerCollabSetEndpointName(pwzendpointname : LibC::LPWSTR) : HRESULT

  # Params # pcobject : PEER_OBJECT* [In]
  fun PeerCollabSetObject(pcobject : PEER_OBJECT*) : HRESULT

  # Params # pobjectid : Guid* [In]
  fun PeerCollabDeleteObject(pobjectid : Guid*) : HRESULT

  # Params # hevent : LibC::HANDLE [In],ceventregistration : UInt32 [In],peventregistrations : PEER_COLLAB_EVENT_REGISTRATION* [In],phpeerevent : Void** [In]
  fun PeerCollabRegisterEvent(hevent : LibC::HANDLE, ceventregistration : UInt32, peventregistrations : PEER_COLLAB_EVENT_REGISTRATION*, phpeerevent : Void**) : HRESULT

  # Params # hpeerevent : Void* [In],ppeventdata : PEER_COLLAB_EVENT_DATA** [In]
  fun PeerCollabGetEventData(hpeerevent : Void*, ppeventdata : PEER_COLLAB_EVENT_DATA**) : HRESULT

  # Params # hpeerevent : Void* [In]
  fun PeerCollabUnregisterEvent(hpeerevent : Void*) : HRESULT

  # Params # phpeerenum : Void** [In]
  fun PeerCollabEnumPeopleNearMe(phpeerenum : Void**) : HRESULT

  # Params # pwzcontactdata : LibC::LPWSTR [In],ppcontact : PEER_CONTACT** [In]
  fun PeerCollabAddContact(pwzcontactdata : LibC::LPWSTR, ppcontact : PEER_CONTACT**) : HRESULT

  # Params # pwzpeername : LibC::LPWSTR [In]
  fun PeerCollabDeleteContact(pwzpeername : LibC::LPWSTR) : HRESULT

  # Params # pwzpeername : LibC::LPWSTR [In],ppcontact : PEER_CONTACT** [In]
  fun PeerCollabGetContact(pwzpeername : LibC::LPWSTR, ppcontact : PEER_CONTACT**) : HRESULT

  # Params # pcontact : PEER_CONTACT* [In]
  fun PeerCollabUpdateContact(pcontact : PEER_CONTACT*) : HRESULT

  # Params # phpeerenum : Void** [In]
  fun PeerCollabEnumContacts(phpeerenum : Void**) : HRESULT

  # Params # pwzpeername : LibC::LPWSTR [In],ppwzcontactdata : LibC::LPWSTR* [In]
  fun PeerCollabExportContact(pwzpeername : LibC::LPWSTR, ppwzcontactdata : LibC::LPWSTR*) : HRESULT

  # Params # pwzcontactdata : LibC::LPWSTR [In],ppcontact : PEER_CONTACT** [In]
  fun PeerCollabParseContact(pwzcontactdata : LibC::LPWSTR, ppcontact : PEER_CONTACT**) : HRESULT

  # Params # pwzpeername : LibC::LPWSTR [In],ppwzhostname : LibC::LPWSTR* [In]
  fun PeerNameToPeerHostName(pwzpeername : LibC::LPWSTR, ppwzhostname : LibC::LPWSTR*) : HRESULT

  # Params # pwzhostname : LibC::LPWSTR [In],ppwzpeername : LibC::LPWSTR* [In]
  fun PeerHostNameToPeerName(pwzhostname : LibC::LPWSTR, ppwzpeername : LibC::LPWSTR*) : HRESULT

  # Params # wversionrequested : UInt16 [In]
  fun PeerPnrpStartup(wversionrequested : UInt16) : HRESULT

  # Params # 
  fun PeerPnrpShutdown : HRESULT

  # Params # pcwzpeername : LibC::LPWSTR [In],pregistrationinfo : PEER_PNRP_REGISTRATION_INFO* [In],phregistration : Void** [In]
  fun PeerPnrpRegister(pcwzpeername : LibC::LPWSTR, pregistrationinfo : PEER_PNRP_REGISTRATION_INFO*, phregistration : Void**) : HRESULT

  # Params # hregistration : Void* [In],pregistrationinfo : PEER_PNRP_REGISTRATION_INFO* [In]
  fun PeerPnrpUpdateRegistration(hregistration : Void*, pregistrationinfo : PEER_PNRP_REGISTRATION_INFO*) : HRESULT

  # Params # hregistration : Void* [In]
  fun PeerPnrpUnregister(hregistration : Void*) : HRESULT

  # Params # pcwzpeername : LibC::LPWSTR [In],pcwzcloudname : LibC::LPWSTR [In],pcendpoints : UInt32* [In],ppendpoints : PEER_PNRP_ENDPOINT_INFO** [In]
  fun PeerPnrpResolve(pcwzpeername : LibC::LPWSTR, pcwzcloudname : LibC::LPWSTR, pcendpoints : UInt32*, ppendpoints : PEER_PNRP_ENDPOINT_INFO**) : HRESULT

  # Params # pcwzpeername : LibC::LPWSTR [In],pcwzcloudname : LibC::LPWSTR [In],cmaxendpoints : UInt32 [In],hevent : LibC::HANDLE [In],phresolve : Void** [In]
  fun PeerPnrpStartResolve(pcwzpeername : LibC::LPWSTR, pcwzcloudname : LibC::LPWSTR, cmaxendpoints : UInt32, hevent : LibC::HANDLE, phresolve : Void**) : HRESULT

  # Params # pcnumclouds : UInt32* [In],ppcloudinfo : PEER_PNRP_CLOUD_INFO** [In]
  fun PeerPnrpGetCloudInfo(pcnumclouds : UInt32*, ppcloudinfo : PEER_PNRP_CLOUD_INFO**) : HRESULT

  # Params # hresolve : Void* [In],ppendpoint : PEER_PNRP_ENDPOINT_INFO** [In]
  fun PeerPnrpGetEndpoint(hresolve : Void*, ppendpoint : PEER_PNRP_ENDPOINT_INFO**) : HRESULT

  # Params # hresolve : Void* [In]
  fun PeerPnrpEndResolve(hresolve : Void*) : HRESULT

  # Params # fpublish : LibC::BOOL [In],pwzpeername : LibC::LPWSTR [In],pwzcloudname : LibC::LPWSTR [In],pwzpublishingidentity : LibC::LPWSTR [In],ppresolver : DRT_BOOTSTRAP_PROVIDER** [In]
  fun DrtCreatePnrpBootstrapResolver(fpublish : LibC::BOOL, pwzpeername : LibC::LPWSTR, pwzcloudname : LibC::LPWSTR, pwzpublishingidentity : LibC::LPWSTR, ppresolver : DRT_BOOTSTRAP_PROVIDER**) : HRESULT

  # Params # presolver : DRT_BOOTSTRAP_PROVIDER* [In]
  fun DrtDeletePnrpBootstrapResolver(presolver : DRT_BOOTSTRAP_PROVIDER*)

  # Params # port : UInt16 [In],pwszaddress : LibC::LPWSTR [In],ppmodule : DRT_BOOTSTRAP_PROVIDER** [In]
  fun DrtCreateDnsBootstrapResolver(port : UInt16, pwszaddress : LibC::LPWSTR, ppmodule : DRT_BOOTSTRAP_PROVIDER**) : HRESULT

  # Params # presolver : DRT_BOOTSTRAP_PROVIDER* [In]
  fun DrtDeleteDnsBootstrapResolver(presolver : DRT_BOOTSTRAP_PROVIDER*)

  # Params # scope : DRT_SCOPE [In],dwscopeid : UInt32 [In],dwlocalitythreshold : UInt32 [In],pwport : UInt16* [In],phtransport : Void** [In]
  fun DrtCreateIpv6UdpTransport(scope : DRT_SCOPE, dwscopeid : UInt32, dwlocalitythreshold : UInt32, pwport : UInt16*, phtransport : Void**) : HRESULT

  # Params # htransport : Void* [In]
  fun DrtDeleteIpv6UdpTransport(htransport : Void*) : HRESULT

  # Params # prootcert : CERT_CONTEXT* [In],plocalcert : CERT_CONTEXT* [In],ppsecurityprovider : DRT_SECURITY_PROVIDER** [In]
  fun DrtCreateDerivedKeySecurityProvider(prootcert : CERT_CONTEXT*, plocalcert : CERT_CONTEXT*, ppsecurityprovider : DRT_SECURITY_PROVIDER**) : HRESULT

  # Params # plocalcert : CERT_CONTEXT* [In],pkey : DRT_DATA* [In]
  fun DrtCreateDerivedKey(plocalcert : CERT_CONTEXT*, pkey : DRT_DATA*) : HRESULT

  # Params # psecurityprovider : DRT_SECURITY_PROVIDER* [In]
  fun DrtDeleteDerivedKeySecurityProvider(psecurityprovider : DRT_SECURITY_PROVIDER*)

  # Params # ppsecurityprovider : DRT_SECURITY_PROVIDER** [In]
  fun DrtCreateNullSecurityProvider(ppsecurityprovider : DRT_SECURITY_PROVIDER**) : HRESULT

  # Params # psecurityprovider : DRT_SECURITY_PROVIDER* [In]
  fun DrtDeleteNullSecurityProvider(psecurityprovider : DRT_SECURITY_PROVIDER*)

  # Params # psettings : DRT_SETTINGS* [In],hevent : LibC::HANDLE [In],pvcontext : Void* [In],phdrt : Void** [In]
  fun DrtOpen(psettings : DRT_SETTINGS*, hevent : LibC::HANDLE, pvcontext : Void*, phdrt : Void**) : HRESULT

  # Params # hdrt : Void* [In]
  fun DrtClose(hdrt : Void*)

  # Params # hdrt : Void* [In],puleventdatalen : UInt32* [In]
  fun DrtGetEventDataSize(hdrt : Void*, puleventdatalen : UInt32*) : HRESULT

  # Params # hdrt : Void* [In],uleventdatalen : UInt32 [In],peventdata : DRT_EVENT_DATA* [In]
  fun DrtGetEventData(hdrt : Void*, uleventdatalen : UInt32, peventdata : DRT_EVENT_DATA*) : HRESULT

  # Params # hdrt : Void* [In],pregistration : DRT_REGISTRATION* [In],pvkeycontext : Void* [In],phkeyregistration : Void** [In]
  fun DrtRegisterKey(hdrt : Void*, pregistration : DRT_REGISTRATION*, pvkeycontext : Void*, phkeyregistration : Void**) : HRESULT

  # Params # hkeyregistration : Void* [In],pappdata : DRT_DATA* [In]
  fun DrtUpdateKey(hkeyregistration : Void*, pappdata : DRT_DATA*) : HRESULT

  # Params # hkeyregistration : Void* [In]
  fun DrtUnregisterKey(hkeyregistration : Void*)

  # Params # hdrt : Void* [In],pkey : DRT_DATA* [In],pinfo : DRT_SEARCH_INFO* [In],timeout : UInt32 [In],hevent : LibC::HANDLE [In],pvcontext : Void* [In],hsearchcontext : Void** [In]
  fun DrtStartSearch(hdrt : Void*, pkey : DRT_DATA*, pinfo : DRT_SEARCH_INFO*, timeout : UInt32, hevent : LibC::HANDLE, pvcontext : Void*, hsearchcontext : Void**) : HRESULT

  # Params # hsearchcontext : Void* [In]
  fun DrtContinueSearch(hsearchcontext : Void*) : HRESULT

  # Params # hsearchcontext : Void* [In],pulsearchresultsize : UInt32* [In]
  fun DrtGetSearchResultSize(hsearchcontext : Void*, pulsearchresultsize : UInt32*) : HRESULT

  # Params # hsearchcontext : Void* [In],ulsearchresultsize : UInt32 [In],psearchresult : DRT_SEARCH_RESULT* [In]
  fun DrtGetSearchResult(hsearchcontext : Void*, ulsearchresultsize : UInt32, psearchresult : DRT_SEARCH_RESULT*) : HRESULT

  # Params # hsearchcontext : Void* [In],pulsearchpathsize : UInt32* [In]
  fun DrtGetSearchPathSize(hsearchcontext : Void*, pulsearchpathsize : UInt32*) : HRESULT

  # Params # hsearchcontext : Void* [In],ulsearchpathsize : UInt32 [In],psearchpath : DRT_ADDRESS_LIST* [In]
  fun DrtGetSearchPath(hsearchcontext : Void*, ulsearchpathsize : UInt32, psearchpath : DRT_ADDRESS_LIST*) : HRESULT

  # Params # hsearchcontext : Void* [In]
  fun DrtEndSearch(hsearchcontext : Void*) : HRESULT

  # Params # hdrt : Void* [In],ulcbinstancenamesize : UInt32 [In],pwzdrtinstancename : LibC::LPWSTR [In]
  fun DrtGetInstanceName(hdrt : Void*, ulcbinstancenamesize : UInt32, pwzdrtinstancename : LibC::LPWSTR) : HRESULT

  # Params # hdrt : Void* [In],pulcbinstancenamesize : UInt32* [In]
  fun DrtGetInstanceNameSize(hdrt : Void*, pulcbinstancenamesize : UInt32*) : HRESULT

  # Params # dwversionrequested : UInt32 [In],phpeerdist : LibC::IntPtrT* [In],pdwsupportedversion : UInt32* [In]
  fun PeerDistStartup(dwversionrequested : UInt32, phpeerdist : LibC::IntPtrT*, pdwsupportedversion : UInt32*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In]
  fun PeerDistShutdown(hpeerdist : LibC::IntPtrT) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],ppeerdiststatus : PEERDIST_STATUS* [In]
  fun PeerDistGetStatus(hpeerdist : LibC::IntPtrT, ppeerdiststatus : PEERDIST_STATUS*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcompletionport : LibC::HANDLE [In],ulcompletionkey : LibC::UINT_PTR [In],lpoverlapped : OVERLAPPED* [In],ppeerdiststatus : PEERDIST_STATUS* [In]
  fun PeerDistRegisterForStatusChangeNotification(hpeerdist : LibC::IntPtrT, hcompletionport : LibC::HANDLE, ulcompletionkey : LibC::UINT_PTR, lpoverlapped : OVERLAPPED*, ppeerdiststatus : PEERDIST_STATUS*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In]
  fun PeerDistUnregisterForStatusChangeNotification(hpeerdist : LibC::IntPtrT) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],cbcontentidentifier : UInt32 [In],pcontentidentifier : UInt8* [In],cbcontentlength : UInt64 [In],ppublishoptions : PEERDIST_PUBLICATION_OPTIONS* [In],hcompletionport : LibC::HANDLE [In],ulcompletionkey : LibC::UINT_PTR [In],phstream : LibC::IntPtrT* [In]
  fun PeerDistServerPublishStream(hpeerdist : LibC::IntPtrT, cbcontentidentifier : UInt32, pcontentidentifier : UInt8*, cbcontentlength : UInt64, ppublishoptions : PEERDIST_PUBLICATION_OPTIONS*, hcompletionport : LibC::HANDLE, ulcompletionkey : LibC::UINT_PTR, phstream : LibC::IntPtrT*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hstream : LibC::IntPtrT [In],cbnumberofbytes : UInt32 [In],pbuffer : UInt8* [In],lpoverlapped : OVERLAPPED* [In]
  fun PeerDistServerPublishAddToStream(hpeerdist : LibC::IntPtrT, hstream : LibC::IntPtrT, cbnumberofbytes : UInt32, pbuffer : UInt8*, lpoverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hstream : LibC::IntPtrT [In],lpoverlapped : OVERLAPPED* [In]
  fun PeerDistServerPublishCompleteStream(hpeerdist : LibC::IntPtrT, hstream : LibC::IntPtrT, lpoverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hstream : LibC::IntPtrT [In]
  fun PeerDistServerCloseStreamHandle(hpeerdist : LibC::IntPtrT, hstream : LibC::IntPtrT) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],cbcontentidentifier : UInt32 [In],pcontentidentifier : UInt8* [In]
  fun PeerDistServerUnpublish(hpeerdist : LibC::IntPtrT, cbcontentidentifier : UInt32, pcontentidentifier : UInt8*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],cbcontentidentifier : UInt32 [In],pcontentidentifier : UInt8* [In],ullcontentoffset : UInt64 [In],cbcontentlength : UInt64 [In],hcompletionport : LibC::HANDLE [In],ulcompletionkey : LibC::UINT_PTR [In],phcontentinfo : LibC::IntPtrT* [In]
  fun PeerDistServerOpenContentInformation(hpeerdist : LibC::IntPtrT, cbcontentidentifier : UInt32, pcontentidentifier : UInt8*, ullcontentoffset : UInt64, cbcontentlength : UInt64, hcompletionport : LibC::HANDLE, ulcompletionkey : LibC::UINT_PTR, phcontentinfo : LibC::IntPtrT*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontentinfo : LibC::IntPtrT [In],cbmaxnumberofbytes : UInt32 [In],pbuffer : UInt8* [In],lpoverlapped : OVERLAPPED* [In]
  fun PeerDistServerRetrieveContentInformation(hpeerdist : LibC::IntPtrT, hcontentinfo : LibC::IntPtrT, cbmaxnumberofbytes : UInt32, pbuffer : UInt8*, lpoverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontentinfo : LibC::IntPtrT [In]
  fun PeerDistServerCloseContentInformation(hpeerdist : LibC::IntPtrT, hcontentinfo : LibC::IntPtrT) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],cbcontentidentifier : UInt32 [In],pcontentidentifier : UInt8* [In],poverlapped : OVERLAPPED* [In]
  fun PeerDistServerCancelAsyncOperation(hpeerdist : LibC::IntPtrT, cbcontentidentifier : UInt32, pcontentidentifier : UInt8*, poverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],pcontenttag : PEERDIST_CONTENT_TAG* [In],hcompletionport : LibC::HANDLE [In],ulcompletionkey : LibC::UINT_PTR [In],phcontenthandle : LibC::IntPtrT* [In]
  fun PeerDistClientOpenContent(hpeerdist : LibC::IntPtrT, pcontenttag : PEERDIST_CONTENT_TAG*, hcompletionport : LibC::HANDLE, ulcompletionkey : LibC::UINT_PTR, phcontenthandle : LibC::IntPtrT*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontenthandle : LibC::IntPtrT [In]
  fun PeerDistClientCloseContent(hpeerdist : LibC::IntPtrT, hcontenthandle : LibC::IntPtrT) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontenthandle : LibC::IntPtrT [In],cbnumberofbytes : UInt32 [In],pbuffer : UInt8* [In],lpoverlapped : OVERLAPPED* [In]
  fun PeerDistClientAddContentInformation(hpeerdist : LibC::IntPtrT, hcontenthandle : LibC::IntPtrT, cbnumberofbytes : UInt32, pbuffer : UInt8*, lpoverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontenthandle : LibC::IntPtrT [In],lpoverlapped : OVERLAPPED* [In]
  fun PeerDistClientCompleteContentInformation(hpeerdist : LibC::IntPtrT, hcontenthandle : LibC::IntPtrT, lpoverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontenthandle : LibC::IntPtrT [In],cbnumberofbytes : UInt32 [In],pbuffer : UInt8* [In],lpoverlapped : OVERLAPPED* [In]
  fun PeerDistClientAddData(hpeerdist : LibC::IntPtrT, hcontenthandle : LibC::IntPtrT, cbnumberofbytes : UInt32, pbuffer : UInt8*, lpoverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontenthandle : LibC::IntPtrT [In],cbmaxnumberofbytes : UInt32 [In],pbuffer : UInt8* [In],dwtimeoutinmilliseconds : UInt32 [In],lpoverlapped : OVERLAPPED* [In]
  fun PeerDistClientBlockRead(hpeerdist : LibC::IntPtrT, hcontenthandle : LibC::IntPtrT, cbmaxnumberofbytes : UInt32, pbuffer : UInt8*, dwtimeoutinmilliseconds : UInt32, lpoverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontenthandle : LibC::IntPtrT [In],cbmaxnumberofbytes : UInt32 [In],pbuffer : UInt8* [In],dwtimeoutinmilliseconds : UInt32 [In],lpoverlapped : OVERLAPPED* [In]
  fun PeerDistClientStreamRead(hpeerdist : LibC::IntPtrT, hcontenthandle : LibC::IntPtrT, cbmaxnumberofbytes : UInt32, pbuffer : UInt8*, dwtimeoutinmilliseconds : UInt32, lpoverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],pcontenttag : PEERDIST_CONTENT_TAG* [In],hcompletionport : LibC::HANDLE [In],ulcompletionkey : LibC::UINT_PTR [In],lpoverlapped : OVERLAPPED* [In]
  fun PeerDistClientFlushContent(hpeerdist : LibC::IntPtrT, pcontenttag : PEERDIST_CONTENT_TAG*, hcompletionport : LibC::HANDLE, ulcompletionkey : LibC::UINT_PTR, lpoverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontenthandle : LibC::IntPtrT [In],poverlapped : OVERLAPPED* [In]
  fun PeerDistClientCancelAsyncOperation(hpeerdist : LibC::IntPtrT, hcontenthandle : LibC::IntPtrT, poverlapped : OVERLAPPED*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],ppeerdiststatus : PEERDIST_STATUS_INFO* [In]
  fun PeerDistGetStatusEx(hpeerdist : LibC::IntPtrT, ppeerdiststatus : PEERDIST_STATUS_INFO*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcompletionport : LibC::HANDLE [In],ulcompletionkey : LibC::UINT_PTR [In],lpoverlapped : OVERLAPPED* [In],ppeerdiststatus : PEERDIST_STATUS_INFO* [In]
  fun PeerDistRegisterForStatusChangeNotificationEx(hpeerdist : LibC::IntPtrT, hcompletionport : LibC::HANDLE, ulcompletionkey : LibC::UINT_PTR, lpoverlapped : OVERLAPPED*, ppeerdiststatus : PEERDIST_STATUS_INFO*) : UInt32

  # Params # lpoverlapped : OVERLAPPED* [In],lpnumberofbytestransferred : UInt32* [In],bwait : LibC::BOOL [In]
  fun PeerDistGetOverlappedResult(lpoverlapped : OVERLAPPED*, lpnumberofbytestransferred : UInt32*, bwait : LibC::BOOL) : LibC::BOOL

  # Params # hpeerdist : LibC::IntPtrT [In],cbcontentidentifier : UInt32 [In],pcontentidentifier : UInt8* [In],ullcontentoffset : UInt64 [In],cbcontentlength : UInt64 [In],pretrievaloptions : PEERDIST_RETRIEVAL_OPTIONS* [In],hcompletionport : LibC::HANDLE [In],ulcompletionkey : LibC::UINT_PTR [In],phcontentinfo : LibC::IntPtrT* [In]
  fun PeerDistServerOpenContentInformationEx(hpeerdist : LibC::IntPtrT, cbcontentidentifier : UInt32, pcontentidentifier : UInt8*, ullcontentoffset : UInt64, cbcontentlength : UInt64, pretrievaloptions : PEERDIST_RETRIEVAL_OPTIONS*, hcompletionport : LibC::HANDLE, ulcompletionkey : LibC::UINT_PTR, phcontentinfo : LibC::IntPtrT*) : UInt32

  # Params # hpeerdist : LibC::IntPtrT [In],hcontenthandle : LibC::IntPtrT [In],peerdistclientinfoclass : PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS [In],dwbuffersize : UInt32 [In],lpinformation : Void* [In]
  fun PeerDistClientGetInformationByHandle(hpeerdist : LibC::IntPtrT, hcontenthandle : LibC::IntPtrT, peerdistclientinfoclass : PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS, dwbuffersize : UInt32, lpinformation : Void*) : UInt32
end
