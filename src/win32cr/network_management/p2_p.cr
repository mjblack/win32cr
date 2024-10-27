require "./../foundation.cr"
require "./../networking/win_sock.cr"
require "./../system/com.cr"
require "./../security/cryptography.cr"
require "./../system/io.cr"

module Win32cr::NetworkManagement::P2P
  alias PFNPEER_VALIDATE_RECORD = Proc(Void*, Void*, Win32cr::NetworkManagement::P2P::PEER_RECORD*, Win32cr::NetworkManagement::P2P::PEER_RECORD_CHANGE_TYPE, Win32cr::Foundation::HRESULT)*

  alias PFNPEER_SECURE_RECORD = Proc(Void*, Void*, Win32cr::NetworkManagement::P2P::PEER_RECORD*, Win32cr::NetworkManagement::P2P::PEER_RECORD_CHANGE_TYPE, Win32cr::NetworkManagement::P2P::PEER_DATA**, Win32cr::Foundation::HRESULT)*

  alias PFNPEER_FREE_SECURITY_DATA = Proc(Void*, Void*, Win32cr::NetworkManagement::P2P::PEER_DATA*, Win32cr::Foundation::HRESULT)*

  alias PFNPEER_ON_PASSWORD_AUTH_FAILED = Proc(Void*, Void*, Win32cr::Foundation::HRESULT)*

  alias DRT_BOOTSTRAP_RESOLVE_CALLBACK = Proc(Win32cr::Foundation::HRESULT, Void*, Win32cr::Networking::WinSock::SOCKET_ADDRESS_LIST*, Win32cr::Foundation::BOOL, Void)*

  NS_PNRPNAME = 38_u32
  NS_PNRPCLOUD = 39_u32
  PNRPINFO_HINT = 1_u32
  NS_PROVIDER_PNRPNAME = "03fe89cd-766d-4976-b9c1-bb9bc42c7b4d"
  NS_PROVIDER_PNRPCLOUD = "03fe89ce-766d-4976-b9c1-bb9bc42c7b4d"
  SVCID_PNRPCLOUD = "c2239ce6-00c0-4fbf-bad6-18139385a49a"
  SVCID_PNRPNAME_V1 = "c2239ce5-00c0-4fbf-bad6-18139385a49a"
  SVCID_PNRPNAME_V2 = "c2239ce7-00c0-4fbf-bad6-18139385a49a"
  PNRP_MAX_ENDPOINT_ADDRESSES = 10_u32
  WSZ_SCOPE_GLOBAL = "GLOBAL"
  WSZ_SCOPE_SITELOCAL = "SITELOCAL"
  WSZ_SCOPE_LINKLOCAL = "LINKLOCAL"
  PNRP_MAX_EXTENDED_PAYLOAD_BYTES = 4096_u32
  PEER_PNRP_ALL_LINK_CLOUDS = "PEER_PNRP_ALL_LINKS"
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

  enum PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE : UInt32
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_1 = 1_u32
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_2 = 2_u32
    PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION = 2_u32
  end
  enum PNRP_SCOPE
    PNRP_SCOPE_ANY = 0_i32
    PNRP_GLOBAL_SCOPE = 1_i32
    PNRP_SITE_LOCAL_SCOPE = 2_i32
    PNRP_LINK_LOCAL_SCOPE = 3_i32
  end
  enum PNRP_CLOUD_STATE
    PNRP_CLOUD_STATE_VIRTUAL = 0_i32
    PNRP_CLOUD_STATE_SYNCHRONISING = 1_i32
    PNRP_CLOUD_STATE_ACTIVE = 2_i32
    PNRP_CLOUD_STATE_DEAD = 3_i32
    PNRP_CLOUD_STATE_DISABLED = 4_i32
    PNRP_CLOUD_STATE_NO_NET = 5_i32
    PNRP_CLOUD_STATE_ALONE = 6_i32
  end
  enum PNRP_CLOUD_FLAGS
    PNRP_CLOUD_NO_FLAGS = 0_i32
    PNRP_CLOUD_NAME_LOCAL = 1_i32
    PNRP_CLOUD_RESOLVE_ONLY = 2_i32
    PNRP_CLOUD_FULL_PARTICIPANT = 4_i32
  end
  enum PNRP_REGISTERED_ID_STATE
    PNRP_REGISTERED_ID_STATE_OK = 1_i32
    PNRP_REGISTERED_ID_STATE_PROBLEM = 2_i32
  end
  enum PNRP_RESOLVE_CRITERIA
    PNRP_RESOLVE_CRITERIA_DEFAULT = 0_i32
    PNRP_RESOLVE_CRITERIA_REMOTE_PEER_NAME = 1_i32
    PNRP_RESOLVE_CRITERIA_NEAREST_REMOTE_PEER_NAME = 2_i32
    PNRP_RESOLVE_CRITERIA_NON_CURRENT_PROCESS_PEER_NAME = 3_i32
    PNRP_RESOLVE_CRITERIA_NEAREST_NON_CURRENT_PROCESS_PEER_NAME = 4_i32
    PNRP_RESOLVE_CRITERIA_ANY_PEER_NAME = 5_i32
    PNRP_RESOLVE_CRITERIA_NEAREST_PEER_NAME = 6_i32
  end
  enum PNRP_EXTENDED_PAYLOAD_TYPE
    PNRP_EXTENDED_PAYLOAD_TYPE_NONE = 0_i32
    PNRP_EXTENDED_PAYLOAD_TYPE_BINARY = 1_i32
    PNRP_EXTENDED_PAYLOAD_TYPE_STRING = 2_i32
  end
  enum PEER_RECORD_CHANGE_TYPE
    PEER_RECORD_ADDED = 1_i32
    PEER_RECORD_UPDATED = 2_i32
    PEER_RECORD_DELETED = 3_i32
    PEER_RECORD_EXPIRED = 4_i32
  end
  enum PEER_CONNECTION_STATUS
    PEER_CONNECTED = 1_i32
    PEER_DISCONNECTED = 2_i32
    PEER_CONNECTION_FAILED = 3_i32
  end
  enum PEER_CONNECTION_FLAGS
    PEER_CONNECTION_NEIGHBOR = 1_i32
    PEER_CONNECTION_DIRECT = 2_i32
  end
  enum PEER_RECORD_FLAGS
    PEER_RECORD_FLAG_AUTOREFRESH = 1_i32
    PEER_RECORD_FLAG_DELETED = 2_i32
  end
  enum PEER_GRAPH_EVENT_TYPE
    PEER_GRAPH_EVENT_STATUS_CHANGED = 1_i32
    PEER_GRAPH_EVENT_PROPERTY_CHANGED = 2_i32
    PEER_GRAPH_EVENT_RECORD_CHANGED = 3_i32
    PEER_GRAPH_EVENT_DIRECT_CONNECTION = 4_i32
    PEER_GRAPH_EVENT_NEIGHBOR_CONNECTION = 5_i32
    PEER_GRAPH_EVENT_INCOMING_DATA = 6_i32
    PEER_GRAPH_EVENT_CONNECTION_REQUIRED = 7_i32
    PEER_GRAPH_EVENT_NODE_CHANGED = 8_i32
    PEER_GRAPH_EVENT_SYNCHRONIZED = 9_i32
  end
  enum PEER_NODE_CHANGE_TYPE
    PEER_NODE_CHANGE_CONNECTED = 1_i32
    PEER_NODE_CHANGE_DISCONNECTED = 2_i32
    PEER_NODE_CHANGE_UPDATED = 3_i32
  end
  enum PEER_GRAPH_STATUS_FLAGS
    PEER_GRAPH_STATUS_LISTENING = 1_i32
    PEER_GRAPH_STATUS_HAS_CONNECTIONS = 2_i32
    PEER_GRAPH_STATUS_SYNCHRONIZED = 4_i32
  end
  enum PEER_GRAPH_PROPERTY_FLAGS
    PEER_GRAPH_PROPERTY_HEARTBEATS = 1_i32
    PEER_GRAPH_PROPERTY_DEFER_EXPIRATION = 2_i32
  end
  enum PEER_GRAPH_SCOPE
    PEER_GRAPH_SCOPE_ANY = 0_i32
    PEER_GRAPH_SCOPE_GLOBAL = 1_i32
    PEER_GRAPH_SCOPE_SITELOCAL = 2_i32
    PEER_GRAPH_SCOPE_LINKLOCAL = 3_i32
    PEER_GRAPH_SCOPE_LOOPBACK = 4_i32
  end
  enum PEER_GROUP_EVENT_TYPE
    PEER_GROUP_EVENT_STATUS_CHANGED = 1_i32
    PEER_GROUP_EVENT_PROPERTY_CHANGED = 2_i32
    PEER_GROUP_EVENT_RECORD_CHANGED = 3_i32
    PEER_GROUP_EVENT_DIRECT_CONNECTION = 4_i32
    PEER_GROUP_EVENT_NEIGHBOR_CONNECTION = 5_i32
    PEER_GROUP_EVENT_INCOMING_DATA = 6_i32
    PEER_GROUP_EVENT_MEMBER_CHANGED = 8_i32
    PEER_GROUP_EVENT_CONNECTION_FAILED = 10_i32
    PEER_GROUP_EVENT_AUTHENTICATION_FAILED = 11_i32
  end
  enum PEER_GROUP_STATUS
    PEER_GROUP_STATUS_LISTENING = 1_i32
    PEER_GROUP_STATUS_HAS_CONNECTIONS = 2_i32
  end
  enum PEER_GROUP_PROPERTY_FLAGS
    PEER_MEMBER_DATA_OPTIONAL = 1_i32
    PEER_DISABLE_PRESENCE = 2_i32
    PEER_DEFER_EXPIRATION = 4_i32
  end
  enum PEER_GROUP_AUTHENTICATION_SCHEME
    PEER_GROUP_GMC_AUTHENTICATION = 1_i32
    PEER_GROUP_PASSWORD_AUTHENTICATION = 2_i32
  end
  enum PEER_MEMBER_FLAGS
    PEER_MEMBER_PRESENT = 1_i32
  end
  enum PEER_MEMBER_CHANGE_TYPE
    PEER_MEMBER_CONNECTED = 1_i32
    PEER_MEMBER_DISCONNECTED = 2_i32
    PEER_MEMBER_UPDATED = 3_i32
    PEER_MEMBER_JOINED = 4_i32
    PEER_MEMBER_LEFT = 5_i32
  end
  enum PEER_GROUP_ISSUE_CREDENTIAL_FLAGS
    PEER_GROUP_STORE_CREDENTIALS = 1_i32
  end
  enum PEER_SIGNIN_FLAGS
    PEER_SIGNIN_NONE = 0_i32
    PEER_SIGNIN_NEAR_ME = 1_i32
    PEER_SIGNIN_INTERNET = 2_i32
    PEER_SIGNIN_ALL = 3_i32
  end
  enum PEER_WATCH_PERMISSION
    PEER_WATCH_BLOCKED = 0_i32
    PEER_WATCH_ALLOWED = 1_i32
  end
  enum PEER_PUBLICATION_SCOPE
    PEER_PUBLICATION_SCOPE_NONE = 0_i32
    PEER_PUBLICATION_SCOPE_NEAR_ME = 1_i32
    PEER_PUBLICATION_SCOPE_INTERNET = 2_i32
    PEER_PUBLICATION_SCOPE_ALL = 3_i32
  end
  enum PEER_INVITATION_RESPONSE_TYPE
    PEER_INVITATION_RESPONSE_DECLINED = 0_i32
    PEER_INVITATION_RESPONSE_ACCEPTED = 1_i32
    PEER_INVITATION_RESPONSE_EXPIRED = 2_i32
    PEER_INVITATION_RESPONSE_ERROR = 3_i32
  end
  enum PEER_APPLICATION_REGISTRATION_TYPE
    PEER_APPLICATION_CURRENT_USER = 0_i32
    PEER_APPLICATION_ALL_USERS = 1_i32
  end
  enum PEER_PRESENCE_STATUS
    PEER_PRESENCE_OFFLINE = 0_i32
    PEER_PRESENCE_OUT_TO_LUNCH = 1_i32
    PEER_PRESENCE_AWAY = 2_i32
    PEER_PRESENCE_BE_RIGHT_BACK = 3_i32
    PEER_PRESENCE_IDLE = 4_i32
    PEER_PRESENCE_BUSY = 5_i32
    PEER_PRESENCE_ON_THE_PHONE = 6_i32
    PEER_PRESENCE_ONLINE = 7_i32
  end
  enum PEER_CHANGE_TYPE
    PEER_CHANGE_ADDED = 0_i32
    PEER_CHANGE_DELETED = 1_i32
    PEER_CHANGE_UPDATED = 2_i32
  end
  enum PEER_COLLAB_EVENT_TYPE
    PEER_EVENT_WATCHLIST_CHANGED = 1_i32
    PEER_EVENT_ENDPOINT_CHANGED = 2_i32
    PEER_EVENT_ENDPOINT_PRESENCE_CHANGED = 3_i32
    PEER_EVENT_ENDPOINT_APPLICATION_CHANGED = 4_i32
    PEER_EVENT_ENDPOINT_OBJECT_CHANGED = 5_i32
    PEER_EVENT_MY_ENDPOINT_CHANGED = 6_i32
    PEER_EVENT_MY_PRESENCE_CHANGED = 7_i32
    PEER_EVENT_MY_APPLICATION_CHANGED = 8_i32
    PEER_EVENT_MY_OBJECT_CHANGED = 9_i32
    PEER_EVENT_PEOPLE_NEAR_ME_CHANGED = 10_i32
    PEER_EVENT_REQUEST_STATUS_CHANGED = 11_i32
  end
  enum DRT_SCOPE
    DRT_GLOBAL_SCOPE = 1_i32
    DRT_SITE_LOCAL_SCOPE = 2_i32
    DRT_LINK_LOCAL_SCOPE = 3_i32
  end
  enum DRT_STATUS
    DRT_ACTIVE = 0_i32
    DRT_ALONE = 1_i32
    DRT_NO_NETWORK = 10_i32
    DRT_FAULTED = 20_i32
  end
  enum DRT_MATCH_TYPE
    DRT_MATCH_EXACT = 0_i32
    DRT_MATCH_NEAR = 1_i32
    DRT_MATCH_INTERMEDIATE = 2_i32
  end
  enum DRT_LEAFSET_KEY_CHANGE_TYPE
    DRT_LEAFSET_KEY_ADDED = 0_i32
    DRT_LEAFSET_KEY_DELETED = 1_i32
  end
  enum DRT_EVENT_TYPE
    DRT_EVENT_STATUS_CHANGED = 0_i32
    DRT_EVENT_LEAFSET_KEY_CHANGED = 1_i32
    DRT_EVENT_REGISTRATION_STATE_CHANGED = 2_i32
  end
  enum DRT_SECURITY_MODE
    DRT_SECURE_RESOLVE = 0_i32
    DRT_SECURE_MEMBERSHIP = 1_i32
    DRT_SECURE_CONFIDENTIALPAYLOAD = 2_i32
  end
  enum DRT_REGISTRATION_STATE
    DRT_REGISTRATION_STATE_UNRESOLVEABLE = 1_i32
  end
  enum DRT_ADDRESS_FLAGS
    DRT_ADDRESS_FLAG_ACCEPTED = 1_i32
    DRT_ADDRESS_FLAG_REJECTED = 2_i32
    DRT_ADDRESS_FLAG_UNREACHABLE = 4_i32
    DRT_ADDRESS_FLAG_LOOP = 8_i32
    DRT_ADDRESS_FLAG_TOO_BUSY = 16_i32
    DRT_ADDRESS_FLAG_BAD_VALIDATE_ID = 32_i32
    DRT_ADDRESS_FLAG_SUSPECT_UNREGISTERED_ID = 64_i32
    DRT_ADDRESS_FLAG_INQUIRE = 128_i32
  end
  enum PEERDIST_STATUS
    PEERDIST_STATUS_DISABLED = 0_i32
    PEERDIST_STATUS_UNAVAILABLE = 1_i32
    PEERDIST_STATUS_AVAILABLE = 2_i32
  end
  enum PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS
    PeerDistClientBasicInfo = 0_i32
    MaximumPeerDistClientInfoByHandlesClass = 1_i32
  end

  @[Extern]
  record PNRP_CLOUD_ID,
    address_family : Int32,
    scope : Win32cr::NetworkManagement::P2P::PNRP_SCOPE,
    scope_id : UInt32

  @[Extern]
  record PNRPINFO_V1,
    dwSize : UInt32,
    lpwszIdentity : Win32cr::Foundation::PWSTR,
    nMaxResolve : UInt32,
    dwTimeout : UInt32,
    dwLifetime : UInt32,
    enResolveCriteria : Win32cr::NetworkManagement::P2P::PNRP_RESOLVE_CRITERIA,
    dwFlags : UInt32,
    saHint : Win32cr::Networking::WinSock::SOCKET_ADDRESS,
    enNameState : Win32cr::NetworkManagement::P2P::PNRP_REGISTERED_ID_STATE

  @[Extern]
  record PNRPINFO_V2,
    dwSize : UInt32,
    lpwszIdentity : Win32cr::Foundation::PWSTR,
    nMaxResolve : UInt32,
    dwTimeout : UInt32,
    dwLifetime : UInt32,
    enResolveCriteria : Win32cr::NetworkManagement::P2P::PNRP_RESOLVE_CRITERIA,
    dwFlags : UInt32,
    saHint : Win32cr::Networking::WinSock::SOCKET_ADDRESS,
    enNameState : Win32cr::NetworkManagement::P2P::PNRP_REGISTERED_ID_STATE,
    enExtendedPayloadType : Win32cr::NetworkManagement::P2P::PNRP_EXTENDED_PAYLOAD_TYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      blobPayload : Win32cr::System::Com::BLOB,
      pwszPayload : Win32cr::Foundation::PWSTR

  end

  @[Extern]
  record PNRPCLOUDINFO,
    dwSize : UInt32,
    cloud : Win32cr::NetworkManagement::P2P::PNRP_CLOUD_ID,
    enCloudState : Win32cr::NetworkManagement::P2P::PNRP_CLOUD_STATE,
    enCloudFlags : Win32cr::NetworkManagement::P2P::PNRP_CLOUD_FLAGS

  @[Extern]
  record PEER_VERSION_DATA,
    wVersion : UInt16,
    wHighestVersion : UInt16

  @[Extern]
  record PEER_DATA,
    cbData : UInt32,
    pbData : UInt8*

  @[Extern]
  record PEER_RECORD,
    dwSize : UInt32,
    type__ : LibC::GUID,
    id : LibC::GUID,
    dwVersion : UInt32,
    dwFlags : UInt32,
    pwzCreatorId : Win32cr::Foundation::PWSTR,
    pwzModifiedById : Win32cr::Foundation::PWSTR,
    pwzAttributes : Win32cr::Foundation::PWSTR,
    ftCreation : Win32cr::Foundation::FILETIME,
    ftExpiration : Win32cr::Foundation::FILETIME,
    ftLastModified : Win32cr::Foundation::FILETIME,
    securityData : Win32cr::NetworkManagement::P2P::PEER_DATA,
    data : Win32cr::NetworkManagement::P2P::PEER_DATA

  @[Extern]
  record PEER_ADDRESS,
    dwSize : UInt32,
    sin6 : Win32cr::Networking::WinSock::SOCKADDR_IN6

  @[Extern]
  record PEER_CONNECTION_INFO,
    dwSize : UInt32,
    dwFlags : UInt32,
    ullConnectionId : UInt64,
    ullNodeId : UInt64,
    pwzPeerId : Win32cr::Foundation::PWSTR,
    address : Win32cr::NetworkManagement::P2P::PEER_ADDRESS

  @[Extern]
  record PEER_EVENT_INCOMING_DATA,
    dwSize : UInt32,
    ullConnectionId : UInt64,
    type__ : LibC::GUID,
    data : Win32cr::NetworkManagement::P2P::PEER_DATA

  @[Extern]
  record PEER_EVENT_RECORD_CHANGE_DATA,
    dwSize : UInt32,
    changeType : Win32cr::NetworkManagement::P2P::PEER_RECORD_CHANGE_TYPE,
    recordId : LibC::GUID,
    recordType : LibC::GUID

  @[Extern]
  record PEER_EVENT_CONNECTION_CHANGE_DATA,
    dwSize : UInt32,
    status : Win32cr::NetworkManagement::P2P::PEER_CONNECTION_STATUS,
    ullConnectionId : UInt64,
    ullNodeId : UInt64,
    ullNextConnectionId : UInt64,
    hrConnectionFailedReason : Win32cr::Foundation::HRESULT

  @[Extern]
  record PEER_EVENT_SYNCHRONIZED_DATA,
    dwSize : UInt32,
    recordType : LibC::GUID

  @[Extern]
  record PEER_GRAPH_PROPERTIES,
    dwSize : UInt32,
    dwFlags : UInt32,
    dwScope : UInt32,
    dwMaxRecordSize : UInt32,
    pwzGraphId : Win32cr::Foundation::PWSTR,
    pwzCreatorId : Win32cr::Foundation::PWSTR,
    pwzFriendlyName : Win32cr::Foundation::PWSTR,
    pwzComment : Win32cr::Foundation::PWSTR,
    ulPresenceLifetime : UInt32,
    cPresenceMax : UInt32

  @[Extern]
  record PEER_NODE_INFO,
    dwSize : UInt32,
    ullNodeId : UInt64,
    pwzPeerId : Win32cr::Foundation::PWSTR,
    cAddresses : UInt32,
    pAddresses : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*,
    pwzAttributes : Win32cr::Foundation::PWSTR

  @[Extern]
  record PEER_EVENT_NODE_CHANGE_DATA,
    dwSize : UInt32,
    changeType : Win32cr::NetworkManagement::P2P::PEER_NODE_CHANGE_TYPE,
    ullNodeId : UInt64,
    pwzPeerId : Win32cr::Foundation::PWSTR

  @[Extern]
  record PEER_GRAPH_EVENT_REGISTRATION,
    eventType : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_TYPE,
    pType : LibC::GUID*

  @[Extern]
  record PEER_GRAPH_EVENT_DATA,
    eventType : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_TYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      dwStatus : Win32cr::NetworkManagement::P2P::PEER_GRAPH_STATUS_FLAGS,
      incomingData : Win32cr::NetworkManagement::P2P::PEER_EVENT_INCOMING_DATA,
      recordChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_RECORD_CHANGE_DATA,
      connectionChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_CONNECTION_CHANGE_DATA,
      nodeChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_NODE_CHANGE_DATA,
      synchronizedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_SYNCHRONIZED_DATA

  end

  @[Extern]
  record PEER_SECURITY_INTERFACE,
    dwSize : UInt32,
    pwzSspFilename : Win32cr::Foundation::PWSTR,
    pwzPackageName : Win32cr::Foundation::PWSTR,
    cbSecurityInfo : UInt32,
    pbSecurityInfo : UInt8*,
    pvContext : Void*,
    pfnValidateRecord : Win32cr::NetworkManagement::P2P::PFNPEER_VALIDATE_RECORD,
    pfnSecureRecord : Win32cr::NetworkManagement::P2P::PFNPEER_SECURE_RECORD,
    pfnFreeSecurityData : Win32cr::NetworkManagement::P2P::PFNPEER_FREE_SECURITY_DATA,
    pfnAuthFailed : Win32cr::NetworkManagement::P2P::PFNPEER_ON_PASSWORD_AUTH_FAILED

  @[Extern]
  record PEER_CREDENTIAL_INFO,
    dwSize : UInt32,
    dwFlags : UInt32,
    pwzFriendlyName : Win32cr::Foundation::PWSTR,
    pPublicKey : Win32cr::Security::Cryptography::CERT_PUBLIC_KEY_INFO*,
    pwzIssuerPeerName : Win32cr::Foundation::PWSTR,
    pwzIssuerFriendlyName : Win32cr::Foundation::PWSTR,
    ftValidityStart : Win32cr::Foundation::FILETIME,
    ftValidityEnd : Win32cr::Foundation::FILETIME,
    cRoles : UInt32,
    pRoles : LibC::GUID*

  @[Extern]
  record PEER_MEMBER,
    dwSize : UInt32,
    dwFlags : UInt32,
    pwzIdentity : Win32cr::Foundation::PWSTR,
    pwzAttributes : Win32cr::Foundation::PWSTR,
    ullNodeId : UInt64,
    cAddresses : UInt32,
    pAddresses : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*,
    pCredentialInfo : Win32cr::NetworkManagement::P2P::PEER_CREDENTIAL_INFO*

  @[Extern]
  record PEER_INVITATION_INFO,
    dwSize : UInt32,
    dwFlags : UInt32,
    pwzCloudName : Win32cr::Foundation::PWSTR,
    dwScope : UInt32,
    dwCloudFlags : UInt32,
    pwzGroupPeerName : Win32cr::Foundation::PWSTR,
    pwzIssuerPeerName : Win32cr::Foundation::PWSTR,
    pwzSubjectPeerName : Win32cr::Foundation::PWSTR,
    pwzGroupFriendlyName : Win32cr::Foundation::PWSTR,
    pwzIssuerFriendlyName : Win32cr::Foundation::PWSTR,
    pwzSubjectFriendlyName : Win32cr::Foundation::PWSTR,
    ftValidityStart : Win32cr::Foundation::FILETIME,
    ftValidityEnd : Win32cr::Foundation::FILETIME,
    cRoles : UInt32,
    pRoles : LibC::GUID*,
    cClassifiers : UInt32,
    ppwzClassifiers : Win32cr::Foundation::PWSTR*,
    pSubjectPublicKey : Win32cr::Security::Cryptography::CERT_PUBLIC_KEY_INFO*,
    authScheme : Win32cr::NetworkManagement::P2P::PEER_GROUP_AUTHENTICATION_SCHEME

  @[Extern]
  record PEER_GROUP_PROPERTIES,
    dwSize : UInt32,
    dwFlags : UInt32,
    pwzCloud : Win32cr::Foundation::PWSTR,
    pwzClassifier : Win32cr::Foundation::PWSTR,
    pwzGroupPeerName : Win32cr::Foundation::PWSTR,
    pwzCreatorPeerName : Win32cr::Foundation::PWSTR,
    pwzFriendlyName : Win32cr::Foundation::PWSTR,
    pwzComment : Win32cr::Foundation::PWSTR,
    ulMemberDataLifetime : UInt32,
    ulPresenceLifetime : UInt32,
    dwAuthenticationSchemes : UInt32,
    pwzGroupPassword : Win32cr::Foundation::PWSTR,
    groupPasswordRole : LibC::GUID

  @[Extern]
  record PEER_EVENT_MEMBER_CHANGE_DATA,
    dwSize : UInt32,
    changeType : Win32cr::NetworkManagement::P2P::PEER_MEMBER_CHANGE_TYPE,
    pwzIdentity : Win32cr::Foundation::PWSTR

  @[Extern]
  record PEER_GROUP_EVENT_REGISTRATION,
    eventType : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_TYPE,
    pType : LibC::GUID*

  @[Extern]
  record PEER_GROUP_EVENT_DATA,
    eventType : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_TYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      dwStatus : Win32cr::NetworkManagement::P2P::PEER_GROUP_STATUS,
      incomingData : Win32cr::NetworkManagement::P2P::PEER_EVENT_INCOMING_DATA,
      recordChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_RECORD_CHANGE_DATA,
      connectionChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_CONNECTION_CHANGE_DATA,
      memberChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_MEMBER_CHANGE_DATA,
      hrConnectionFailedReason : Win32cr::Foundation::HRESULT

  end

  @[Extern]
  record PEER_NAME_PAIR,
    dwSize : UInt32,
    pwzPeerName : Win32cr::Foundation::PWSTR,
    pwzFriendlyName : Win32cr::Foundation::PWSTR

  @[Extern]
  record PEER_APPLICATION,
    id : LibC::GUID,
    data : Win32cr::NetworkManagement::P2P::PEER_DATA,
    pwzDescription : Win32cr::Foundation::PWSTR

  @[Extern]
  record PEER_OBJECT,
    id : LibC::GUID,
    data : Win32cr::NetworkManagement::P2P::PEER_DATA,
    dwPublicationScope : UInt32

  @[Extern]
  record PEER_CONTACT,
    pwzPeerName : Win32cr::Foundation::PWSTR,
    pwzNickName : Win32cr::Foundation::PWSTR,
    pwzDisplayName : Win32cr::Foundation::PWSTR,
    pwzEmailAddress : Win32cr::Foundation::PWSTR,
    fWatch : Win32cr::Foundation::BOOL,
    watcher_permissions : Win32cr::NetworkManagement::P2P::PEER_WATCH_PERMISSION,
    credentials : Win32cr::NetworkManagement::P2P::PEER_DATA

  @[Extern]
  record PEER_ENDPOINT,
    address : Win32cr::NetworkManagement::P2P::PEER_ADDRESS,
    pwzEndpointName : Win32cr::Foundation::PWSTR

  @[Extern]
  record PEER_PEOPLE_NEAR_ME,
    pwzNickName : Win32cr::Foundation::PWSTR,
    endpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT,
    id : LibC::GUID

  @[Extern]
  record PEER_INVITATION,
    applicationId : LibC::GUID,
    applicationData : Win32cr::NetworkManagement::P2P::PEER_DATA,
    pwzMessage : Win32cr::Foundation::PWSTR

  @[Extern]
  record PEER_INVITATION_RESPONSE,
    action : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE_TYPE,
    pwzMessage : Win32cr::Foundation::PWSTR,
    hrExtendedInfo : Win32cr::Foundation::HRESULT

  @[Extern]
  record PEER_APP_LAUNCH_INFO,
    pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*,
    pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*,
    pInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*

  @[Extern]
  record PEER_APPLICATION_REGISTRATION_INFO,
    application : Win32cr::NetworkManagement::P2P::PEER_APPLICATION,
    pwzApplicationToLaunch : Win32cr::Foundation::PWSTR,
    pwzApplicationArguments : Win32cr::Foundation::PWSTR,
    dwPublicationScope : UInt32

  @[Extern]
  record PEER_PRESENCE_INFO,
    status : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_STATUS,
    pwzDescriptiveText : Win32cr::Foundation::PWSTR

  @[Extern]
  record PEER_COLLAB_EVENT_REGISTRATION,
    eventType : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_TYPE,
    pInstance : LibC::GUID*

  @[Extern]
  record PEER_EVENT_WATCHLIST_CHANGED_DATA,
    pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*,
    changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE

  @[Extern]
  record PEER_EVENT_PRESENCE_CHANGED_DATA,
    pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*,
    pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*,
    changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE,
    pPresenceInfo : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_INFO*

  @[Extern]
  record PEER_EVENT_APPLICATION_CHANGED_DATA,
    pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*,
    pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*,
    changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE,
    pApplication : Win32cr::NetworkManagement::P2P::PEER_APPLICATION*

  @[Extern]
  record PEER_EVENT_OBJECT_CHANGED_DATA,
    pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*,
    pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*,
    changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE,
    pObject : Win32cr::NetworkManagement::P2P::PEER_OBJECT*

  @[Extern]
  record PEER_EVENT_ENDPOINT_CHANGED_DATA,
    pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*,
    pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*

  @[Extern]
  record PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA,
    changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE,
    pPeopleNearMe : Win32cr::NetworkManagement::P2P::PEER_PEOPLE_NEAR_ME*

  @[Extern]
  record PEER_EVENT_REQUEST_STATUS_CHANGED_DATA,
    pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*,
    hrChange : Win32cr::Foundation::HRESULT

  @[Extern]
  record PEER_COLLAB_EVENT_DATA,
    eventType : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_TYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      watchListChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_WATCHLIST_CHANGED_DATA,
      presenceChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_PRESENCE_CHANGED_DATA,
      applicationChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_APPLICATION_CHANGED_DATA,
      objectChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_OBJECT_CHANGED_DATA,
      endpointChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_ENDPOINT_CHANGED_DATA,
      peopleNearMeChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA,
      requestStatusChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_REQUEST_STATUS_CHANGED_DATA

  end

  @[Extern]
  record PEER_PNRP_ENDPOINT_INFO,
    pwzPeerName : Win32cr::Foundation::PWSTR,
    cAddresses : UInt32,
    ppAddresses : Win32cr::Networking::WinSock::SOCKADDR**,
    pwzComment : Win32cr::Foundation::PWSTR,
    payload : Win32cr::NetworkManagement::P2P::PEER_DATA

  @[Extern]
  record PEER_PNRP_CLOUD_INFO,
    pwzCloudName : Win32cr::Foundation::PWSTR,
    dwScope : Win32cr::NetworkManagement::P2P::PNRP_SCOPE,
    dwScopeId : UInt32

  @[Extern]
  record PEER_PNRP_REGISTRATION_INFO,
    pwzCloudName : Win32cr::Foundation::PWSTR,
    pwzPublishingIdentity : Win32cr::Foundation::PWSTR,
    cAddresses : UInt32,
    ppAddresses : Win32cr::Networking::WinSock::SOCKADDR**,
    wPort : UInt16,
    pwzComment : Win32cr::Foundation::PWSTR,
    payload : Win32cr::NetworkManagement::P2P::PEER_DATA

  @[Extern]
  record DRT_DATA,
    cb : UInt32,
    pb : UInt8*

  @[Extern]
  record DRT_REGISTRATION,
    key : Win32cr::NetworkManagement::P2P::DRT_DATA,
    appData : Win32cr::NetworkManagement::P2P::DRT_DATA

  @[Extern]
  record DRT_SECURITY_PROVIDER,
    pvContext : Void*,
    attach : LibC::IntPtrT,
    detach : LibC::IntPtrT,
    register_key : LibC::IntPtrT,
    unregister_key : LibC::IntPtrT,
    validate_and_unpack_payload : LibC::IntPtrT,
    secure_and_pack_payload : LibC::IntPtrT,
    free_data : LibC::IntPtrT,
    encrypt_data : LibC::IntPtrT,
    decrypt_data : LibC::IntPtrT,
    get_serialized_credential : LibC::IntPtrT,
    validate_remote_credential : LibC::IntPtrT,
    sign_data : LibC::IntPtrT,
    verify_data : LibC::IntPtrT

  @[Extern]
  record DRT_BOOTSTRAP_PROVIDER,
    pvContext : Void*,
    attach : LibC::IntPtrT,
    detach : LibC::IntPtrT,
    init_resolve : LibC::IntPtrT,
    issue_resolve : LibC::IntPtrT,
    end_resolve : LibC::IntPtrT,
    register : LibC::IntPtrT,
    unregister : LibC::IntPtrT

  @[Extern]
  record DRT_SETTINGS,
    dwSize : UInt32,
    cbKey : UInt32,
    bProtocolMajorVersion : UInt8,
    bProtocolMinorVersion : UInt8,
    ulMaxRoutingAddresses : UInt32,
    pwzDrtInstancePrefix : Win32cr::Foundation::PWSTR,
    hTransport : Void*,
    pSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER*,
    pBootstrapProvider : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER*,
    eSecurityMode : Win32cr::NetworkManagement::P2P::DRT_SECURITY_MODE

  @[Extern]
  record DRT_SEARCH_INFO,
    dwSize : UInt32,
    fIterative : Win32cr::Foundation::BOOL,
    fAllowCurrentInstanceMatch : Win32cr::Foundation::BOOL,
    fAnyMatchInRange : Win32cr::Foundation::BOOL,
    cMaxEndpoints : UInt32,
    pMaximumKey : Win32cr::NetworkManagement::P2P::DRT_DATA*,
    pMinimumKey : Win32cr::NetworkManagement::P2P::DRT_DATA*

  @[Extern]
  record DRT_ADDRESS,
    socketAddress : Win32cr::Networking::WinSock::SOCKADDR_STORAGE,
    flags : UInt32,
    nearness : Int32,
    latency : UInt32

  @[Extern]
  record DRT_ADDRESS_LIST,
    address_count : UInt32,
    address_list : Win32cr::NetworkManagement::P2P::DRT_ADDRESS*

  @[Extern]
  record DRT_SEARCH_RESULT,
    dwSize : UInt32,
    type__ : Win32cr::NetworkManagement::P2P::DRT_MATCH_TYPE,
    pvContext : Void*,
    registration : Win32cr::NetworkManagement::P2P::DRT_REGISTRATION

  @[Extern]
  record DRT_EVENT_DATA,
    type__ : Win32cr::NetworkManagement::P2P::DRT_EVENT_TYPE,
    hr : Win32cr::Foundation::HRESULT,
    pvContext : Void*,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      leafsetKeyChange : Leafsetkeychange_e__struct,
      registrationStateChange : Registrationstatechange_e__struct,
      statusChange : Statuschange_e__struct do

      # Nested Type Statuschange_e__struct
      @[Extern]
      record Statuschange_e__struct,
        status : Win32cr::NetworkManagement::P2P::DRT_STATUS,
        bootstrapAddresses : Bootstrapaddresses_e__struct do

        # Nested Type Bootstrapaddresses_e__struct
        @[Extern]
        record Bootstrapaddresses_e__struct,
          cntAddress : UInt32,
          pAddresses : Win32cr::Networking::WinSock::SOCKADDR_STORAGE*

      end


      # Nested Type Leafsetkeychange_e__struct
      @[Extern]
      record Leafsetkeychange_e__struct,
        change : Win32cr::NetworkManagement::P2P::DRT_LEAFSET_KEY_CHANGE_TYPE,
        localKey : Win32cr::NetworkManagement::P2P::DRT_DATA,
        remoteKey : Win32cr::NetworkManagement::P2P::DRT_DATA


      # Nested Type Registrationstatechange_e__struct
      @[Extern]
      record Registrationstatechange_e__struct,
        state : Win32cr::NetworkManagement::P2P::DRT_REGISTRATION_STATE,
        localKey : Win32cr::NetworkManagement::P2P::DRT_DATA

    end

  end

  @[Extern]
  record PEERDIST_PUBLICATION_OPTIONS,
    dwVersion : UInt32,
    dwFlags : UInt32

  @[Extern]
  record PEERDIST_CONTENT_TAG,
    data : UInt8[16]

  @[Extern]
  record PEERDIST_RETRIEVAL_OPTIONS,
    cbSize : UInt32,
    dwContentInfoMinVersion : UInt32,
    dwContentInfoMaxVersion : UInt32,
    dwReserved : UInt32

  @[Extern]
  record PEERDIST_STATUS_INFO,
    cbSize : UInt32,
    status : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS,
    dwMinVer : Win32cr::NetworkManagement::P2P::PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE,
    dwMaxVer : Win32cr::NetworkManagement::P2P::PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE

  @[Extern]
  record PEERDIST_CLIENT_BASIC_INFO,
    fFlashCrowd : Win32cr::Foundation::BOOL

  @[Link("p2pgraph")]
  @[Link("p2p")]
  @[Link("drtprov")]
  @[Link("drttransport")]
  @[Link("drt")]
  @[Link("peerdist")]
  lib C
    fun PeerGraphStartup(wVersionRequested : UInt16, pVersionData : Win32cr::NetworkManagement::P2P::PEER_VERSION_DATA*) : Win32cr::Foundation::HRESULT

    fun PeerGraphShutdown : Win32cr::Foundation::HRESULT

    fun PeerGraphFreeData(pvData : Void*) : Void

    fun PeerGraphGetItemCount(hPeerEnum : Void*, pCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun PeerGraphGetNextItem(hPeerEnum : Void*, pCount : UInt32*, pppvItems : Void***) : Win32cr::Foundation::HRESULT

    fun PeerGraphEndEnumeration(hPeerEnum : Void*) : Win32cr::Foundation::HRESULT

    fun PeerGraphCreate(pGraphProperties : Win32cr::NetworkManagement::P2P::PEER_GRAPH_PROPERTIES*, pwzDatabaseName : Win32cr::Foundation::PWSTR, pSecurityInterface : Win32cr::NetworkManagement::P2P::PEER_SECURITY_INTERFACE*, phGraph : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGraphOpen(pwzGraphId : Win32cr::Foundation::PWSTR, pwzPeerId : Win32cr::Foundation::PWSTR, pwzDatabaseName : Win32cr::Foundation::PWSTR, pSecurityInterface : Win32cr::NetworkManagement::P2P::PEER_SECURITY_INTERFACE*, cRecordTypeSyncPrecedence : UInt32, pRecordTypeSyncPrecedence : LibC::GUID*, phGraph : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGraphListen(hGraph : Void*, dwScope : UInt32, dwScopeId : UInt32, wPort : UInt16) : Win32cr::Foundation::HRESULT

    fun PeerGraphConnect(hGraph : Void*, pwzPeerId : Win32cr::Foundation::PWSTR, pAddress : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, pullConnectionId : UInt64*) : Win32cr::Foundation::HRESULT

    fun PeerGraphClose(hGraph : Void*) : Win32cr::Foundation::HRESULT

    fun PeerGraphDelete(pwzGraphId : Win32cr::Foundation::PWSTR, pwzPeerId : Win32cr::Foundation::PWSTR, pwzDatabaseName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerGraphGetStatus(hGraph : Void*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT

    fun PeerGraphGetProperties(hGraph : Void*, ppGraphProperties : Win32cr::NetworkManagement::P2P::PEER_GRAPH_PROPERTIES**) : Win32cr::Foundation::HRESULT

    fun PeerGraphSetProperties(hGraph : Void*, pGraphProperties : Win32cr::NetworkManagement::P2P::PEER_GRAPH_PROPERTIES*) : Win32cr::Foundation::HRESULT

    fun PeerGraphRegisterEvent(hGraph : Void*, hEvent : Win32cr::Foundation::HANDLE, cEventRegistrations : UInt32, pEventRegistrations : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_REGISTRATION*, phPeerEvent : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGraphUnregisterEvent(hPeerEvent : Void*) : Win32cr::Foundation::HRESULT

    fun PeerGraphGetEventData(hPeerEvent : Void*, ppEventData : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_DATA**) : Win32cr::Foundation::HRESULT

    fun PeerGraphGetRecord(hGraph : Void*, pRecordId : LibC::GUID*, ppRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD**) : Win32cr::Foundation::HRESULT

    fun PeerGraphAddRecord(hGraph : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*, pRecordId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PeerGraphUpdateRecord(hGraph : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*) : Win32cr::Foundation::HRESULT

    fun PeerGraphDeleteRecord(hGraph : Void*, pRecordId : LibC::GUID*, fLocal : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun PeerGraphEnumRecords(hGraph : Void*, pRecordType : LibC::GUID*, pwzPeerId : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGraphSearchRecords(hGraph : Void*, pwzCriteria : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGraphExportDatabase(hGraph : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerGraphImportDatabase(hGraph : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerGraphValidateDeferredRecords(hGraph : Void*, cRecordIds : UInt32, pRecordIds : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PeerGraphOpenDirectConnection(hGraph : Void*, pwzPeerId : Win32cr::Foundation::PWSTR, pAddress : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, pullConnectionId : UInt64*) : Win32cr::Foundation::HRESULT

    fun PeerGraphSendData(hGraph : Void*, ullConnectionId : UInt64, pType : LibC::GUID*, cbData : UInt32, pvData : Void*) : Win32cr::Foundation::HRESULT

    fun PeerGraphCloseDirectConnection(hGraph : Void*, ullConnectionId : UInt64) : Win32cr::Foundation::HRESULT

    fun PeerGraphEnumConnections(hGraph : Void*, dwFlags : UInt32, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGraphEnumNodes(hGraph : Void*, pwzPeerId : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGraphSetPresence(hGraph : Void*, fPresent : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun PeerGraphGetNodeInfo(hGraph : Void*, ullNodeId : UInt64, ppNodeInfo : Win32cr::NetworkManagement::P2P::PEER_NODE_INFO**) : Win32cr::Foundation::HRESULT

    fun PeerGraphSetNodeAttributes(hGraph : Void*, pwzAttributes : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerGraphPeerTimeToUniversalTime(hGraph : Void*, pftPeerTime : Win32cr::Foundation::FILETIME*, pftUniversalTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun PeerGraphUniversalTimeToPeerTime(hGraph : Void*, pftUniversalTime : Win32cr::Foundation::FILETIME*, pftPeerTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun PeerFreeData(pvData : Void*) : Void

    fun PeerGetItemCount(hPeerEnum : Void*, pCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun PeerGetNextItem(hPeerEnum : Void*, pCount : UInt32*, pppvItems : Void***) : Win32cr::Foundation::HRESULT

    fun PeerEndEnumeration(hPeerEnum : Void*) : Win32cr::Foundation::HRESULT

    fun PeerGroupStartup(wVersionRequested : UInt16, pVersionData : Win32cr::NetworkManagement::P2P::PEER_VERSION_DATA*) : Win32cr::Foundation::HRESULT

    fun PeerGroupShutdown : Win32cr::Foundation::HRESULT

    fun PeerGroupCreate(pProperties : Win32cr::NetworkManagement::P2P::PEER_GROUP_PROPERTIES*, phGroup : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGroupOpen(pwzIdentity : Win32cr::Foundation::PWSTR, pwzGroupPeerName : Win32cr::Foundation::PWSTR, pwzCloud : Win32cr::Foundation::PWSTR, phGroup : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGroupJoin(pwzIdentity : Win32cr::Foundation::PWSTR, pwzInvitation : Win32cr::Foundation::PWSTR, pwzCloud : Win32cr::Foundation::PWSTR, phGroup : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGroupPasswordJoin(pwzIdentity : Win32cr::Foundation::PWSTR, pwzInvitation : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, pwzCloud : Win32cr::Foundation::PWSTR, phGroup : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGroupConnect(hGroup : Void*) : Win32cr::Foundation::HRESULT

    fun PeerGroupConnectByAddress(hGroup : Void*, cAddresses : UInt32, pAddresses : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*) : Win32cr::Foundation::HRESULT

    fun PeerGroupClose(hGroup : Void*) : Win32cr::Foundation::HRESULT

    fun PeerGroupDelete(pwzIdentity : Win32cr::Foundation::PWSTR, pwzGroupPeerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerGroupCreateInvitation(hGroup : Void*, pwzIdentityInfo : Win32cr::Foundation::PWSTR, pftExpiration : Win32cr::Foundation::FILETIME*, cRoles : UInt32, pRoles : LibC::GUID*, ppwzInvitation : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerGroupCreatePasswordInvitation(hGroup : Void*, ppwzInvitation : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerGroupParseInvitation(pwzInvitation : Win32cr::Foundation::PWSTR, ppInvitationInfo : Win32cr::NetworkManagement::P2P::PEER_INVITATION_INFO**) : Win32cr::Foundation::HRESULT

    fun PeerGroupGetStatus(hGroup : Void*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT

    fun PeerGroupGetProperties(hGroup : Void*, ppProperties : Win32cr::NetworkManagement::P2P::PEER_GROUP_PROPERTIES**) : Win32cr::Foundation::HRESULT

    fun PeerGroupSetProperties(hGroup : Void*, pProperties : Win32cr::NetworkManagement::P2P::PEER_GROUP_PROPERTIES*) : Win32cr::Foundation::HRESULT

    fun PeerGroupEnumMembers(hGroup : Void*, dwFlags : UInt32, pwzIdentity : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGroupOpenDirectConnection(hGroup : Void*, pwzIdentity : Win32cr::Foundation::PWSTR, pAddress : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, pullConnectionId : UInt64*) : Win32cr::Foundation::HRESULT

    fun PeerGroupCloseDirectConnection(hGroup : Void*, ullConnectionId : UInt64) : Win32cr::Foundation::HRESULT

    fun PeerGroupEnumConnections(hGroup : Void*, dwFlags : UInt32, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGroupSendData(hGroup : Void*, ullConnectionId : UInt64, pType : LibC::GUID*, cbData : UInt32, pvData : Void*) : Win32cr::Foundation::HRESULT

    fun PeerGroupRegisterEvent(hGroup : Void*, hEvent : Win32cr::Foundation::HANDLE, cEventRegistration : UInt32, pEventRegistrations : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_REGISTRATION*, phPeerEvent : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGroupUnregisterEvent(hPeerEvent : Void*) : Win32cr::Foundation::HRESULT

    fun PeerGroupGetEventData(hPeerEvent : Void*, ppEventData : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_DATA**) : Win32cr::Foundation::HRESULT

    fun PeerGroupGetRecord(hGroup : Void*, pRecordId : LibC::GUID*, ppRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD**) : Win32cr::Foundation::HRESULT

    fun PeerGroupAddRecord(hGroup : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*, pRecordId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PeerGroupUpdateRecord(hGroup : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*) : Win32cr::Foundation::HRESULT

    fun PeerGroupDeleteRecord(hGroup : Void*, pRecordId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PeerGroupEnumRecords(hGroup : Void*, pRecordType : LibC::GUID*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGroupSearchRecords(hGroup : Void*, pwzCriteria : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerGroupExportDatabase(hGroup : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerGroupImportDatabase(hGroup : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerGroupIssueCredentials(hGroup : Void*, pwzSubjectIdentity : Win32cr::Foundation::PWSTR, pCredentialInfo : Win32cr::NetworkManagement::P2P::PEER_CREDENTIAL_INFO*, dwFlags : UInt32, ppwzInvitation : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerGroupExportConfig(hGroup : Void*, pwzPassword : Win32cr::Foundation::PWSTR, ppwzXML : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerGroupImportConfig(pwzXML : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, fOverwrite : Win32cr::Foundation::BOOL, ppwzIdentity : Win32cr::Foundation::PWSTR*, ppwzGroup : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerGroupPeerTimeToUniversalTime(hGroup : Void*, pftPeerTime : Win32cr::Foundation::FILETIME*, pftUniversalTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun PeerGroupUniversalTimeToPeerTime(hGroup : Void*, pftUniversalTime : Win32cr::Foundation::FILETIME*, pftPeerTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun PeerGroupResumePasswordAuthentication(hGroup : Void*, hPeerEventHandle : Void*) : Win32cr::Foundation::HRESULT

    fun PeerIdentityCreate(pwzClassifier : Win32cr::Foundation::PWSTR, pwzFriendlyName : Win32cr::Foundation::PWSTR, hCryptProv : LibC::UIntPtrT, ppwzIdentity : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerIdentityGetFriendlyName(pwzIdentity : Win32cr::Foundation::PWSTR, ppwzFriendlyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerIdentitySetFriendlyName(pwzIdentity : Win32cr::Foundation::PWSTR, pwzFriendlyName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerIdentityGetCryptKey(pwzIdentity : Win32cr::Foundation::PWSTR, phCryptProv : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun PeerIdentityDelete(pwzIdentity : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerEnumIdentities(phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerEnumGroups(pwzIdentity : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerCreatePeerName(pwzIdentity : Win32cr::Foundation::PWSTR, pwzClassifier : Win32cr::Foundation::PWSTR, ppwzPeerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerIdentityGetXML(pwzIdentity : Win32cr::Foundation::PWSTR, ppwzIdentityXML : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerIdentityExport(pwzIdentity : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, ppwzExportXML : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerIdentityImport(pwzImportXML : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, ppwzIdentity : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerIdentityGetDefault(ppwzPeerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerCollabStartup(wVersionRequested : UInt16) : Win32cr::Foundation::HRESULT

    fun PeerCollabShutdown : Win32cr::Foundation::HRESULT

    fun PeerCollabSignin(hwndParent : Win32cr::Foundation::HWND, dwSigninOptions : UInt32) : Win32cr::Foundation::HRESULT

    fun PeerCollabSignout(dwSigninOptions : UInt32) : Win32cr::Foundation::HRESULT

    fun PeerCollabGetSigninOptions(pdwSigninOptions : UInt32*) : Win32cr::Foundation::HRESULT

    fun PeerCollabAsyncInviteContact(pcContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, hEvent : Win32cr::Foundation::HANDLE, phInvitation : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun PeerCollabGetInvitationResponse(hInvitation : Win32cr::Foundation::HANDLE, ppInvitationResponse : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE**) : Win32cr::Foundation::HRESULT

    fun PeerCollabCancelInvitation(hInvitation : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun PeerCollabCloseHandle(hInvitation : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun PeerCollabInviteContact(pcContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, ppResponse : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE**) : Win32cr::Foundation::HRESULT

    fun PeerCollabAsyncInviteEndpoint(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, hEvent : Win32cr::Foundation::HANDLE, phInvitation : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun PeerCollabInviteEndpoint(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, ppResponse : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE**) : Win32cr::Foundation::HRESULT

    fun PeerCollabGetAppLaunchInfo(ppLaunchInfo : Win32cr::NetworkManagement::P2P::PEER_APP_LAUNCH_INFO**) : Win32cr::Foundation::HRESULT

    fun PeerCollabRegisterApplication(pcApplication : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_INFO*, registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE) : Win32cr::Foundation::HRESULT

    fun PeerCollabUnregisterApplication(pApplicationId : LibC::GUID*, registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE) : Win32cr::Foundation::HRESULT

    fun PeerCollabGetApplicationRegistrationInfo(pApplicationId : LibC::GUID*, registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE, ppApplication : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_INFO**) : Win32cr::Foundation::HRESULT

    fun PeerCollabEnumApplicationRegistrationInfo(registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerCollabGetPresenceInfo(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, ppPresenceInfo : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_INFO**) : Win32cr::Foundation::HRESULT

    fun PeerCollabEnumApplications(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pApplicationId : LibC::GUID*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerCollabEnumObjects(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pObjectId : LibC::GUID*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerCollabEnumEndpoints(pcContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerCollabRefreshEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT

    fun PeerCollabDeleteEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT

    fun PeerCollabQueryContactData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, ppwzContactData : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerCollabSubscribeEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT

    fun PeerCollabUnsubscribeEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT

    fun PeerCollabSetPresenceInfo(pcPresenceInfo : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_INFO*) : Win32cr::Foundation::HRESULT

    fun PeerCollabGetEndpointName(ppwzEndpointName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerCollabSetEndpointName(pwzEndpointName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerCollabSetObject(pcObject : Win32cr::NetworkManagement::P2P::PEER_OBJECT*) : Win32cr::Foundation::HRESULT

    fun PeerCollabDeleteObject(pObjectId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PeerCollabRegisterEvent(hEvent : Win32cr::Foundation::HANDLE, cEventRegistration : UInt32, pEventRegistrations : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_REGISTRATION*, phPeerEvent : Void**) : Win32cr::Foundation::HRESULT

    fun PeerCollabGetEventData(hPeerEvent : Void*, ppEventData : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_DATA**) : Win32cr::Foundation::HRESULT

    fun PeerCollabUnregisterEvent(hPeerEvent : Void*) : Win32cr::Foundation::HRESULT

    fun PeerCollabEnumPeopleNearMe(phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerCollabAddContact(pwzContactData : Win32cr::Foundation::PWSTR, ppContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT**) : Win32cr::Foundation::HRESULT

    fun PeerCollabDeleteContact(pwzPeerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PeerCollabGetContact(pwzPeerName : Win32cr::Foundation::PWSTR, ppContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT**) : Win32cr::Foundation::HRESULT

    fun PeerCollabUpdateContact(pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*) : Win32cr::Foundation::HRESULT

    fun PeerCollabEnumContacts(phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    fun PeerCollabExportContact(pwzPeerName : Win32cr::Foundation::PWSTR, ppwzContactData : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerCollabParseContact(pwzContactData : Win32cr::Foundation::PWSTR, ppContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT**) : Win32cr::Foundation::HRESULT

    fun PeerNameToPeerHostName(pwzPeerName : Win32cr::Foundation::PWSTR, ppwzHostName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerHostNameToPeerName(pwzHostName : Win32cr::Foundation::PWSTR, ppwzPeerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PeerPnrpStartup(wVersionRequested : UInt16) : Win32cr::Foundation::HRESULT

    fun PeerPnrpShutdown : Win32cr::Foundation::HRESULT

    fun PeerPnrpRegister(pcwzPeerName : Win32cr::Foundation::PWSTR, pRegistrationInfo : Win32cr::NetworkManagement::P2P::PEER_PNRP_REGISTRATION_INFO*, phRegistration : Void**) : Win32cr::Foundation::HRESULT

    fun PeerPnrpUpdateRegistration(hRegistration : Void*, pRegistrationInfo : Win32cr::NetworkManagement::P2P::PEER_PNRP_REGISTRATION_INFO*) : Win32cr::Foundation::HRESULT

    fun PeerPnrpUnregister(hRegistration : Void*) : Win32cr::Foundation::HRESULT

    fun PeerPnrpResolve(pcwzPeerName : Win32cr::Foundation::PWSTR, pcwzCloudName : Win32cr::Foundation::PWSTR, pcEndpoints : UInt32*, ppEndpoints : Win32cr::NetworkManagement::P2P::PEER_PNRP_ENDPOINT_INFO**) : Win32cr::Foundation::HRESULT

    fun PeerPnrpStartResolve(pcwzPeerName : Win32cr::Foundation::PWSTR, pcwzCloudName : Win32cr::Foundation::PWSTR, cMaxEndpoints : UInt32, hEvent : Win32cr::Foundation::HANDLE, phResolve : Void**) : Win32cr::Foundation::HRESULT

    fun PeerPnrpGetCloudInfo(pcNumClouds : UInt32*, ppCloudInfo : Win32cr::NetworkManagement::P2P::PEER_PNRP_CLOUD_INFO**) : Win32cr::Foundation::HRESULT

    fun PeerPnrpGetEndpoint(hResolve : Void*, ppEndpoint : Win32cr::NetworkManagement::P2P::PEER_PNRP_ENDPOINT_INFO**) : Win32cr::Foundation::HRESULT

    fun PeerPnrpEndResolve(hResolve : Void*) : Win32cr::Foundation::HRESULT

    fun DrtCreatePnrpBootstrapResolver(fPublish : Win32cr::Foundation::BOOL, pwzPeerName : Win32cr::Foundation::PWSTR, pwzCloudName : Win32cr::Foundation::PWSTR, pwzPublishingIdentity : Win32cr::Foundation::PWSTR, ppResolver : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER**) : Win32cr::Foundation::HRESULT

    fun DrtDeletePnrpBootstrapResolver(pResolver : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER*) : Void

    fun DrtCreateDnsBootstrapResolver(port : UInt16, pwszAddress : Win32cr::Foundation::PWSTR, ppModule : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER**) : Win32cr::Foundation::HRESULT

    fun DrtDeleteDnsBootstrapResolver(pResolver : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER*) : Void

    fun DrtCreateIpv6UdpTransport(scope : Win32cr::NetworkManagement::P2P::DRT_SCOPE, dwScopeId : UInt32, dwLocalityThreshold : UInt32, pwPort : UInt16*, phTransport : Void**) : Win32cr::Foundation::HRESULT

    fun DrtDeleteIpv6UdpTransport(hTransport : Void*) : Win32cr::Foundation::HRESULT

    fun DrtCreateDerivedKeySecurityProvider(pRootCert : Win32cr::Security::Cryptography::CERT_CONTEXT*, pLocalCert : Win32cr::Security::Cryptography::CERT_CONTEXT*, ppSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER**) : Win32cr::Foundation::HRESULT

    fun DrtCreateDerivedKey(pLocalCert : Win32cr::Security::Cryptography::CERT_CONTEXT*, pKey : Win32cr::NetworkManagement::P2P::DRT_DATA*) : Win32cr::Foundation::HRESULT

    fun DrtDeleteDerivedKeySecurityProvider(pSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER*) : Void

    fun DrtCreateNullSecurityProvider(ppSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER**) : Win32cr::Foundation::HRESULT

    fun DrtDeleteNullSecurityProvider(pSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER*) : Void

    fun DrtOpen(pSettings : Win32cr::NetworkManagement::P2P::DRT_SETTINGS*, hEvent : Win32cr::Foundation::HANDLE, pvContext : Void*, phDrt : Void**) : Win32cr::Foundation::HRESULT

    fun DrtClose(hDrt : Void*) : Void

    fun DrtGetEventDataSize(hDrt : Void*, pulEventDataLen : UInt32*) : Win32cr::Foundation::HRESULT

    fun DrtGetEventData(hDrt : Void*, ulEventDataLen : UInt32, pEventData : Win32cr::NetworkManagement::P2P::DRT_EVENT_DATA*) : Win32cr::Foundation::HRESULT

    fun DrtRegisterKey(hDrt : Void*, pRegistration : Win32cr::NetworkManagement::P2P::DRT_REGISTRATION*, pvKeyContext : Void*, phKeyRegistration : Void**) : Win32cr::Foundation::HRESULT

    fun DrtUpdateKey(hKeyRegistration : Void*, pAppData : Win32cr::NetworkManagement::P2P::DRT_DATA*) : Win32cr::Foundation::HRESULT

    fun DrtUnregisterKey(hKeyRegistration : Void*) : Void

    fun DrtStartSearch(hDrt : Void*, pKey : Win32cr::NetworkManagement::P2P::DRT_DATA*, pInfo : Win32cr::NetworkManagement::P2P::DRT_SEARCH_INFO*, timeout : UInt32, hEvent : Win32cr::Foundation::HANDLE, pvContext : Void*, hSearchContext : Void**) : Win32cr::Foundation::HRESULT

    fun DrtContinueSearch(hSearchContext : Void*) : Win32cr::Foundation::HRESULT

    fun DrtGetSearchResultSize(hSearchContext : Void*, pulSearchResultSize : UInt32*) : Win32cr::Foundation::HRESULT

    fun DrtGetSearchResult(hSearchContext : Void*, ulSearchResultSize : UInt32, pSearchResult : Win32cr::NetworkManagement::P2P::DRT_SEARCH_RESULT*) : Win32cr::Foundation::HRESULT

    fun DrtGetSearchPathSize(hSearchContext : Void*, pulSearchPathSize : UInt32*) : Win32cr::Foundation::HRESULT

    fun DrtGetSearchPath(hSearchContext : Void*, ulSearchPathSize : UInt32, pSearchPath : Win32cr::NetworkManagement::P2P::DRT_ADDRESS_LIST*) : Win32cr::Foundation::HRESULT

    fun DrtEndSearch(hSearchContext : Void*) : Win32cr::Foundation::HRESULT

    fun DrtGetInstanceName(hDrt : Void*, ulcbInstanceNameSize : UInt32, pwzDrtInstanceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun DrtGetInstanceNameSize(hDrt : Void*, pulcbInstanceNameSize : UInt32*) : Win32cr::Foundation::HRESULT

    fun PeerDistStartup(dwVersionRequested : UInt32, phPeerDist : LibC::IntPtrT*, pdwSupportedVersion : UInt32*) : UInt32

    fun PeerDistShutdown(hPeerDist : LibC::IntPtrT) : UInt32

    fun PeerDistGetStatus(hPeerDist : LibC::IntPtrT, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS*) : UInt32

    fun PeerDistRegisterForStatusChangeNotification(hPeerDist : LibC::IntPtrT, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS*) : UInt32

    fun PeerDistUnregisterForStatusChangeNotification(hPeerDist : LibC::IntPtrT) : UInt32

    fun PeerDistServerPublishStream(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, cbContentLength : UInt64, pPublishOptions : Win32cr::NetworkManagement::P2P::PEERDIST_PUBLICATION_OPTIONS*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phStream : LibC::IntPtrT*) : UInt32

    fun PeerDistServerPublishAddToStream(hPeerDist : LibC::IntPtrT, hStream : LibC::IntPtrT, cbNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistServerPublishCompleteStream(hPeerDist : LibC::IntPtrT, hStream : LibC::IntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistServerCloseStreamHandle(hPeerDist : LibC::IntPtrT, hStream : LibC::IntPtrT) : UInt32

    fun PeerDistServerUnpublish(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*) : UInt32

    fun PeerDistServerOpenContentInformation(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, ullContentOffset : UInt64, cbContentLength : UInt64, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phContentInfo : LibC::IntPtrT*) : UInt32

    fun PeerDistServerRetrieveContentInformation(hPeerDist : LibC::IntPtrT, hContentInfo : LibC::IntPtrT, cbMaxNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistServerCloseContentInformation(hPeerDist : LibC::IntPtrT, hContentInfo : LibC::IntPtrT) : UInt32

    fun PeerDistServerCancelAsyncOperation(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistClientOpenContent(hPeerDist : LibC::IntPtrT, pContentTag : Win32cr::NetworkManagement::P2P::PEERDIST_CONTENT_TAG*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phContentHandle : LibC::IntPtrT*) : UInt32

    fun PeerDistClientCloseContent(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT) : UInt32

    fun PeerDistClientAddContentInformation(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistClientCompleteContentInformation(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistClientAddData(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistClientBlockRead(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbMaxNumberOfBytes : UInt32, pBuffer : UInt8*, dwTimeoutInMilliseconds : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistClientStreamRead(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbMaxNumberOfBytes : UInt32, pBuffer : UInt8*, dwTimeoutInMilliseconds : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistClientFlushContent(hPeerDist : LibC::IntPtrT, pContentTag : Win32cr::NetworkManagement::P2P::PEERDIST_CONTENT_TAG*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistClientCancelAsyncOperation(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    fun PeerDistGetStatusEx(hPeerDist : LibC::IntPtrT, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS_INFO*) : UInt32

    fun PeerDistRegisterForStatusChangeNotificationEx(hPeerDist : LibC::IntPtrT, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS_INFO*) : UInt32

    fun PeerDistGetOverlappedResult(lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun PeerDistServerOpenContentInformationEx(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, ullContentOffset : UInt64, cbContentLength : UInt64, pRetrievalOptions : Win32cr::NetworkManagement::P2P::PEERDIST_RETRIEVAL_OPTIONS*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phContentInfo : LibC::IntPtrT*) : UInt32

    fun PeerDistClientGetInformationByHandle(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, peer_dist_client_info_class : Win32cr::NetworkManagement::P2P::PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS, dwBufferSize : UInt32, lpInformation : Void*) : UInt32

  end
end