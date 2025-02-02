require "./../foundation.cr"
require "./../networking/win_sock.cr"
require "./../system/com.cr"
require "./../security/cryptography.cr"
require "./../system/io.cr"

module Win32cr::NetworkManagement::P2P
  extend self
  alias PFNPEER_VALIDATE_RECORD = Proc(Void*, Void*, Win32cr::NetworkManagement::P2P::PEER_RECORD*, Win32cr::NetworkManagement::P2P::PEER_RECORD_CHANGE_TYPE, Win32cr::Foundation::HRESULT)

  alias PFNPEER_SECURE_RECORD = Proc(Void*, Void*, Win32cr::NetworkManagement::P2P::PEER_RECORD*, Win32cr::NetworkManagement::P2P::PEER_RECORD_CHANGE_TYPE, Win32cr::NetworkManagement::P2P::PEER_DATA**, Win32cr::Foundation::HRESULT)

  alias PFNPEER_FREE_SECURITY_DATA = Proc(Void*, Void*, Win32cr::NetworkManagement::P2P::PEER_DATA*, Win32cr::Foundation::HRESULT)

  alias PFNPEER_ON_PASSWORD_AUTH_FAILED = Proc(Void*, Void*, Win32cr::Foundation::HRESULT)

  alias DRT_BOOTSTRAP_RESOLVE_CALLBACK = Proc(Win32cr::Foundation::HRESULT, Void*, Win32cr::Networking::WinSock::SOCKET_ADDRESS_LIST*, Win32cr::Foundation::BOOL, Void)

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
  struct PNRP_CLOUD_ID
    property address_family : Int32
    property scope : Win32cr::NetworkManagement::P2P::PNRP_SCOPE
    property scope_id : UInt32
    def initialize(@address_family : Int32, @scope : Win32cr::NetworkManagement::P2P::PNRP_SCOPE, @scope_id : UInt32)
    end
  end

  @[Extern]
  struct PNRPINFO_V1
    property dwSize : UInt32
    property lpwszIdentity : Win32cr::Foundation::PWSTR
    property nMaxResolve : UInt32
    property dwTimeout : UInt32
    property dwLifetime : UInt32
    property enResolveCriteria : Win32cr::NetworkManagement::P2P::PNRP_RESOLVE_CRITERIA
    property dwFlags : UInt32
    property saHint : Win32cr::Networking::WinSock::SOCKET_ADDRESS
    property enNameState : Win32cr::NetworkManagement::P2P::PNRP_REGISTERED_ID_STATE
    def initialize(@dwSize : UInt32, @lpwszIdentity : Win32cr::Foundation::PWSTR, @nMaxResolve : UInt32, @dwTimeout : UInt32, @dwLifetime : UInt32, @enResolveCriteria : Win32cr::NetworkManagement::P2P::PNRP_RESOLVE_CRITERIA, @dwFlags : UInt32, @saHint : Win32cr::Networking::WinSock::SOCKET_ADDRESS, @enNameState : Win32cr::NetworkManagement::P2P::PNRP_REGISTERED_ID_STATE)
    end
  end

  @[Extern]
  struct PNRPINFO_V2
    property dwSize : UInt32
    property lpwszIdentity : Win32cr::Foundation::PWSTR
    property nMaxResolve : UInt32
    property dwTimeout : UInt32
    property dwLifetime : UInt32
    property enResolveCriteria : Win32cr::NetworkManagement::P2P::PNRP_RESOLVE_CRITERIA
    property dwFlags : UInt32
    property saHint : Win32cr::Networking::WinSock::SOCKET_ADDRESS
    property enNameState : Win32cr::NetworkManagement::P2P::PNRP_REGISTERED_ID_STATE
    property enExtendedPayloadType : Win32cr::NetworkManagement::P2P::PNRP_EXTENDED_PAYLOAD_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property blobPayload : Win32cr::System::Com::BLOB
    property pwszPayload : Win32cr::Foundation::PWSTR
    def initialize(@blobPayload : Win32cr::System::Com::BLOB, @pwszPayload : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@dwSize : UInt32, @lpwszIdentity : Win32cr::Foundation::PWSTR, @nMaxResolve : UInt32, @dwTimeout : UInt32, @dwLifetime : UInt32, @enResolveCriteria : Win32cr::NetworkManagement::P2P::PNRP_RESOLVE_CRITERIA, @dwFlags : UInt32, @saHint : Win32cr::Networking::WinSock::SOCKET_ADDRESS, @enNameState : Win32cr::NetworkManagement::P2P::PNRP_REGISTERED_ID_STATE, @enExtendedPayloadType : Win32cr::NetworkManagement::P2P::PNRP_EXTENDED_PAYLOAD_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PNRPCLOUDINFO
    property dwSize : UInt32
    property cloud : Win32cr::NetworkManagement::P2P::PNRP_CLOUD_ID
    property enCloudState : Win32cr::NetworkManagement::P2P::PNRP_CLOUD_STATE
    property enCloudFlags : Win32cr::NetworkManagement::P2P::PNRP_CLOUD_FLAGS
    def initialize(@dwSize : UInt32, @cloud : Win32cr::NetworkManagement::P2P::PNRP_CLOUD_ID, @enCloudState : Win32cr::NetworkManagement::P2P::PNRP_CLOUD_STATE, @enCloudFlags : Win32cr::NetworkManagement::P2P::PNRP_CLOUD_FLAGS)
    end
  end

  @[Extern]
  struct PEER_VERSION_DATA
    property wVersion : UInt16
    property wHighestVersion : UInt16
    def initialize(@wVersion : UInt16, @wHighestVersion : UInt16)
    end
  end

  @[Extern]
  struct PEER_DATA
    property cbData : UInt32
    property pbData : UInt8*
    def initialize(@cbData : UInt32, @pbData : UInt8*)
    end
  end

  @[Extern]
  struct PEER_RECORD
    property dwSize : UInt32
    property type__ : LibC::GUID
    property id : LibC::GUID
    property dwVersion : UInt32
    property dwFlags : UInt32
    property pwzCreatorId : Win32cr::Foundation::PWSTR
    property pwzModifiedById : Win32cr::Foundation::PWSTR
    property pwzAttributes : Win32cr::Foundation::PWSTR
    property ftCreation : Win32cr::Foundation::FILETIME
    property ftExpiration : Win32cr::Foundation::FILETIME
    property ftLastModified : Win32cr::Foundation::FILETIME
    property securityData : Win32cr::NetworkManagement::P2P::PEER_DATA
    property data : Win32cr::NetworkManagement::P2P::PEER_DATA
    def initialize(@dwSize : UInt32, @type__ : LibC::GUID, @id : LibC::GUID, @dwVersion : UInt32, @dwFlags : UInt32, @pwzCreatorId : Win32cr::Foundation::PWSTR, @pwzModifiedById : Win32cr::Foundation::PWSTR, @pwzAttributes : Win32cr::Foundation::PWSTR, @ftCreation : Win32cr::Foundation::FILETIME, @ftExpiration : Win32cr::Foundation::FILETIME, @ftLastModified : Win32cr::Foundation::FILETIME, @securityData : Win32cr::NetworkManagement::P2P::PEER_DATA, @data : Win32cr::NetworkManagement::P2P::PEER_DATA)
    end
  end

  @[Extern]
  struct PEER_ADDRESS
    property dwSize : UInt32
    property sin6 : Win32cr::Networking::WinSock::SOCKADDR_IN6
    def initialize(@dwSize : UInt32, @sin6 : Win32cr::Networking::WinSock::SOCKADDR_IN6)
    end
  end

  @[Extern]
  struct PEER_CONNECTION_INFO
    property dwSize : UInt32
    property dwFlags : UInt32
    property ullConnectionId : UInt64
    property ullNodeId : UInt64
    property pwzPeerId : Win32cr::Foundation::PWSTR
    property address : Win32cr::NetworkManagement::P2P::PEER_ADDRESS
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @ullConnectionId : UInt64, @ullNodeId : UInt64, @pwzPeerId : Win32cr::Foundation::PWSTR, @address : Win32cr::NetworkManagement::P2P::PEER_ADDRESS)
    end
  end

  @[Extern]
  struct PEER_EVENT_INCOMING_DATA
    property dwSize : UInt32
    property ullConnectionId : UInt64
    property type__ : LibC::GUID
    property data : Win32cr::NetworkManagement::P2P::PEER_DATA
    def initialize(@dwSize : UInt32, @ullConnectionId : UInt64, @type__ : LibC::GUID, @data : Win32cr::NetworkManagement::P2P::PEER_DATA)
    end
  end

  @[Extern]
  struct PEER_EVENT_RECORD_CHANGE_DATA
    property dwSize : UInt32
    property changeType : Win32cr::NetworkManagement::P2P::PEER_RECORD_CHANGE_TYPE
    property recordId : LibC::GUID
    property recordType : LibC::GUID
    def initialize(@dwSize : UInt32, @changeType : Win32cr::NetworkManagement::P2P::PEER_RECORD_CHANGE_TYPE, @recordId : LibC::GUID, @recordType : LibC::GUID)
    end
  end

  @[Extern]
  struct PEER_EVENT_CONNECTION_CHANGE_DATA
    property dwSize : UInt32
    property status : Win32cr::NetworkManagement::P2P::PEER_CONNECTION_STATUS
    property ullConnectionId : UInt64
    property ullNodeId : UInt64
    property ullNextConnectionId : UInt64
    property hrConnectionFailedReason : Win32cr::Foundation::HRESULT
    def initialize(@dwSize : UInt32, @status : Win32cr::NetworkManagement::P2P::PEER_CONNECTION_STATUS, @ullConnectionId : UInt64, @ullNodeId : UInt64, @ullNextConnectionId : UInt64, @hrConnectionFailedReason : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct PEER_EVENT_SYNCHRONIZED_DATA
    property dwSize : UInt32
    property recordType : LibC::GUID
    def initialize(@dwSize : UInt32, @recordType : LibC::GUID)
    end
  end

  @[Extern]
  struct PEER_GRAPH_PROPERTIES
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwScope : UInt32
    property dwMaxRecordSize : UInt32
    property pwzGraphId : Win32cr::Foundation::PWSTR
    property pwzCreatorId : Win32cr::Foundation::PWSTR
    property pwzFriendlyName : Win32cr::Foundation::PWSTR
    property pwzComment : Win32cr::Foundation::PWSTR
    property ulPresenceLifetime : UInt32
    property cPresenceMax : UInt32
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwScope : UInt32, @dwMaxRecordSize : UInt32, @pwzGraphId : Win32cr::Foundation::PWSTR, @pwzCreatorId : Win32cr::Foundation::PWSTR, @pwzFriendlyName : Win32cr::Foundation::PWSTR, @pwzComment : Win32cr::Foundation::PWSTR, @ulPresenceLifetime : UInt32, @cPresenceMax : UInt32)
    end
  end

  @[Extern]
  struct PEER_NODE_INFO
    property dwSize : UInt32
    property ullNodeId : UInt64
    property pwzPeerId : Win32cr::Foundation::PWSTR
    property cAddresses : UInt32
    property pAddresses : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*
    property pwzAttributes : Win32cr::Foundation::PWSTR
    def initialize(@dwSize : UInt32, @ullNodeId : UInt64, @pwzPeerId : Win32cr::Foundation::PWSTR, @cAddresses : UInt32, @pAddresses : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, @pwzAttributes : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PEER_EVENT_NODE_CHANGE_DATA
    property dwSize : UInt32
    property changeType : Win32cr::NetworkManagement::P2P::PEER_NODE_CHANGE_TYPE
    property ullNodeId : UInt64
    property pwzPeerId : Win32cr::Foundation::PWSTR
    def initialize(@dwSize : UInt32, @changeType : Win32cr::NetworkManagement::P2P::PEER_NODE_CHANGE_TYPE, @ullNodeId : UInt64, @pwzPeerId : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PEER_GRAPH_EVENT_REGISTRATION
    property eventType : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_TYPE
    property pType : LibC::GUID*
    def initialize(@eventType : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_TYPE, @pType : LibC::GUID*)
    end
  end

  @[Extern]
  struct PEER_GRAPH_EVENT_DATA
    property eventType : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property dwStatus : Win32cr::NetworkManagement::P2P::PEER_GRAPH_STATUS_FLAGS
    property incomingData : Win32cr::NetworkManagement::P2P::PEER_EVENT_INCOMING_DATA
    property recordChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_RECORD_CHANGE_DATA
    property connectionChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_CONNECTION_CHANGE_DATA
    property nodeChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_NODE_CHANGE_DATA
    property synchronizedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_SYNCHRONIZED_DATA
    def initialize(@dwStatus : Win32cr::NetworkManagement::P2P::PEER_GRAPH_STATUS_FLAGS, @incomingData : Win32cr::NetworkManagement::P2P::PEER_EVENT_INCOMING_DATA, @recordChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_RECORD_CHANGE_DATA, @connectionChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_CONNECTION_CHANGE_DATA, @nodeChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_NODE_CHANGE_DATA, @synchronizedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_SYNCHRONIZED_DATA)
    end
    end

    def initialize(@eventType : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PEER_SECURITY_INTERFACE
    property dwSize : UInt32
    property pwzSspFilename : Win32cr::Foundation::PWSTR
    property pwzPackageName : Win32cr::Foundation::PWSTR
    property cbSecurityInfo : UInt32
    property pbSecurityInfo : UInt8*
    property pvContext : Void*
    property pfnValidateRecord : Win32cr::NetworkManagement::P2P::PFNPEER_VALIDATE_RECORD
    property pfnSecureRecord : Win32cr::NetworkManagement::P2P::PFNPEER_SECURE_RECORD
    property pfnFreeSecurityData : Win32cr::NetworkManagement::P2P::PFNPEER_FREE_SECURITY_DATA
    property pfnAuthFailed : Win32cr::NetworkManagement::P2P::PFNPEER_ON_PASSWORD_AUTH_FAILED
    def initialize(@dwSize : UInt32, @pwzSspFilename : Win32cr::Foundation::PWSTR, @pwzPackageName : Win32cr::Foundation::PWSTR, @cbSecurityInfo : UInt32, @pbSecurityInfo : UInt8*, @pvContext : Void*, @pfnValidateRecord : Win32cr::NetworkManagement::P2P::PFNPEER_VALIDATE_RECORD, @pfnSecureRecord : Win32cr::NetworkManagement::P2P::PFNPEER_SECURE_RECORD, @pfnFreeSecurityData : Win32cr::NetworkManagement::P2P::PFNPEER_FREE_SECURITY_DATA, @pfnAuthFailed : Win32cr::NetworkManagement::P2P::PFNPEER_ON_PASSWORD_AUTH_FAILED)
    end
  end

  @[Extern]
  struct PEER_CREDENTIAL_INFO
    property dwSize : UInt32
    property dwFlags : UInt32
    property pwzFriendlyName : Win32cr::Foundation::PWSTR
    property pPublicKey : Win32cr::Security::Cryptography::CERT_PUBLIC_KEY_INFO*
    property pwzIssuerPeerName : Win32cr::Foundation::PWSTR
    property pwzIssuerFriendlyName : Win32cr::Foundation::PWSTR
    property ftValidityStart : Win32cr::Foundation::FILETIME
    property ftValidityEnd : Win32cr::Foundation::FILETIME
    property cRoles : UInt32
    property pRoles : LibC::GUID*
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @pwzFriendlyName : Win32cr::Foundation::PWSTR, @pPublicKey : Win32cr::Security::Cryptography::CERT_PUBLIC_KEY_INFO*, @pwzIssuerPeerName : Win32cr::Foundation::PWSTR, @pwzIssuerFriendlyName : Win32cr::Foundation::PWSTR, @ftValidityStart : Win32cr::Foundation::FILETIME, @ftValidityEnd : Win32cr::Foundation::FILETIME, @cRoles : UInt32, @pRoles : LibC::GUID*)
    end
  end

  @[Extern]
  struct PEER_MEMBER
    property dwSize : UInt32
    property dwFlags : UInt32
    property pwzIdentity : Win32cr::Foundation::PWSTR
    property pwzAttributes : Win32cr::Foundation::PWSTR
    property ullNodeId : UInt64
    property cAddresses : UInt32
    property pAddresses : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*
    property pCredentialInfo : Win32cr::NetworkManagement::P2P::PEER_CREDENTIAL_INFO*
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @pwzIdentity : Win32cr::Foundation::PWSTR, @pwzAttributes : Win32cr::Foundation::PWSTR, @ullNodeId : UInt64, @cAddresses : UInt32, @pAddresses : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, @pCredentialInfo : Win32cr::NetworkManagement::P2P::PEER_CREDENTIAL_INFO*)
    end
  end

  @[Extern]
  struct PEER_INVITATION_INFO
    property dwSize : UInt32
    property dwFlags : UInt32
    property pwzCloudName : Win32cr::Foundation::PWSTR
    property dwScope : UInt32
    property dwCloudFlags : UInt32
    property pwzGroupPeerName : Win32cr::Foundation::PWSTR
    property pwzIssuerPeerName : Win32cr::Foundation::PWSTR
    property pwzSubjectPeerName : Win32cr::Foundation::PWSTR
    property pwzGroupFriendlyName : Win32cr::Foundation::PWSTR
    property pwzIssuerFriendlyName : Win32cr::Foundation::PWSTR
    property pwzSubjectFriendlyName : Win32cr::Foundation::PWSTR
    property ftValidityStart : Win32cr::Foundation::FILETIME
    property ftValidityEnd : Win32cr::Foundation::FILETIME
    property cRoles : UInt32
    property pRoles : LibC::GUID*
    property cClassifiers : UInt32
    property ppwzClassifiers : Win32cr::Foundation::PWSTR*
    property pSubjectPublicKey : Win32cr::Security::Cryptography::CERT_PUBLIC_KEY_INFO*
    property authScheme : Win32cr::NetworkManagement::P2P::PEER_GROUP_AUTHENTICATION_SCHEME
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @pwzCloudName : Win32cr::Foundation::PWSTR, @dwScope : UInt32, @dwCloudFlags : UInt32, @pwzGroupPeerName : Win32cr::Foundation::PWSTR, @pwzIssuerPeerName : Win32cr::Foundation::PWSTR, @pwzSubjectPeerName : Win32cr::Foundation::PWSTR, @pwzGroupFriendlyName : Win32cr::Foundation::PWSTR, @pwzIssuerFriendlyName : Win32cr::Foundation::PWSTR, @pwzSubjectFriendlyName : Win32cr::Foundation::PWSTR, @ftValidityStart : Win32cr::Foundation::FILETIME, @ftValidityEnd : Win32cr::Foundation::FILETIME, @cRoles : UInt32, @pRoles : LibC::GUID*, @cClassifiers : UInt32, @ppwzClassifiers : Win32cr::Foundation::PWSTR*, @pSubjectPublicKey : Win32cr::Security::Cryptography::CERT_PUBLIC_KEY_INFO*, @authScheme : Win32cr::NetworkManagement::P2P::PEER_GROUP_AUTHENTICATION_SCHEME)
    end
  end

  @[Extern]
  struct PEER_GROUP_PROPERTIES
    property dwSize : UInt32
    property dwFlags : UInt32
    property pwzCloud : Win32cr::Foundation::PWSTR
    property pwzClassifier : Win32cr::Foundation::PWSTR
    property pwzGroupPeerName : Win32cr::Foundation::PWSTR
    property pwzCreatorPeerName : Win32cr::Foundation::PWSTR
    property pwzFriendlyName : Win32cr::Foundation::PWSTR
    property pwzComment : Win32cr::Foundation::PWSTR
    property ulMemberDataLifetime : UInt32
    property ulPresenceLifetime : UInt32
    property dwAuthenticationSchemes : UInt32
    property pwzGroupPassword : Win32cr::Foundation::PWSTR
    property groupPasswordRole : LibC::GUID
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @pwzCloud : Win32cr::Foundation::PWSTR, @pwzClassifier : Win32cr::Foundation::PWSTR, @pwzGroupPeerName : Win32cr::Foundation::PWSTR, @pwzCreatorPeerName : Win32cr::Foundation::PWSTR, @pwzFriendlyName : Win32cr::Foundation::PWSTR, @pwzComment : Win32cr::Foundation::PWSTR, @ulMemberDataLifetime : UInt32, @ulPresenceLifetime : UInt32, @dwAuthenticationSchemes : UInt32, @pwzGroupPassword : Win32cr::Foundation::PWSTR, @groupPasswordRole : LibC::GUID)
    end
  end

  @[Extern]
  struct PEER_EVENT_MEMBER_CHANGE_DATA
    property dwSize : UInt32
    property changeType : Win32cr::NetworkManagement::P2P::PEER_MEMBER_CHANGE_TYPE
    property pwzIdentity : Win32cr::Foundation::PWSTR
    def initialize(@dwSize : UInt32, @changeType : Win32cr::NetworkManagement::P2P::PEER_MEMBER_CHANGE_TYPE, @pwzIdentity : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PEER_GROUP_EVENT_REGISTRATION
    property eventType : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_TYPE
    property pType : LibC::GUID*
    def initialize(@eventType : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_TYPE, @pType : LibC::GUID*)
    end
  end

  @[Extern]
  struct PEER_GROUP_EVENT_DATA
    property eventType : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property dwStatus : Win32cr::NetworkManagement::P2P::PEER_GROUP_STATUS
    property incomingData : Win32cr::NetworkManagement::P2P::PEER_EVENT_INCOMING_DATA
    property recordChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_RECORD_CHANGE_DATA
    property connectionChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_CONNECTION_CHANGE_DATA
    property memberChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_MEMBER_CHANGE_DATA
    property hrConnectionFailedReason : Win32cr::Foundation::HRESULT
    def initialize(@dwStatus : Win32cr::NetworkManagement::P2P::PEER_GROUP_STATUS, @incomingData : Win32cr::NetworkManagement::P2P::PEER_EVENT_INCOMING_DATA, @recordChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_RECORD_CHANGE_DATA, @connectionChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_CONNECTION_CHANGE_DATA, @memberChangeData : Win32cr::NetworkManagement::P2P::PEER_EVENT_MEMBER_CHANGE_DATA, @hrConnectionFailedReason : Win32cr::Foundation::HRESULT)
    end
    end

    def initialize(@eventType : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PEER_NAME_PAIR
    property dwSize : UInt32
    property pwzPeerName : Win32cr::Foundation::PWSTR
    property pwzFriendlyName : Win32cr::Foundation::PWSTR
    def initialize(@dwSize : UInt32, @pwzPeerName : Win32cr::Foundation::PWSTR, @pwzFriendlyName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PEER_APPLICATION
    property id : LibC::GUID
    property data : Win32cr::NetworkManagement::P2P::PEER_DATA
    property pwzDescription : Win32cr::Foundation::PWSTR
    def initialize(@id : LibC::GUID, @data : Win32cr::NetworkManagement::P2P::PEER_DATA, @pwzDescription : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PEER_OBJECT
    property id : LibC::GUID
    property data : Win32cr::NetworkManagement::P2P::PEER_DATA
    property dwPublicationScope : UInt32
    def initialize(@id : LibC::GUID, @data : Win32cr::NetworkManagement::P2P::PEER_DATA, @dwPublicationScope : UInt32)
    end
  end

  @[Extern]
  struct PEER_CONTACT
    property pwzPeerName : Win32cr::Foundation::PWSTR
    property pwzNickName : Win32cr::Foundation::PWSTR
    property pwzDisplayName : Win32cr::Foundation::PWSTR
    property pwzEmailAddress : Win32cr::Foundation::PWSTR
    property fWatch : Win32cr::Foundation::BOOL
    property watcher_permissions : Win32cr::NetworkManagement::P2P::PEER_WATCH_PERMISSION
    property credentials : Win32cr::NetworkManagement::P2P::PEER_DATA
    def initialize(@pwzPeerName : Win32cr::Foundation::PWSTR, @pwzNickName : Win32cr::Foundation::PWSTR, @pwzDisplayName : Win32cr::Foundation::PWSTR, @pwzEmailAddress : Win32cr::Foundation::PWSTR, @fWatch : Win32cr::Foundation::BOOL, @watcher_permissions : Win32cr::NetworkManagement::P2P::PEER_WATCH_PERMISSION, @credentials : Win32cr::NetworkManagement::P2P::PEER_DATA)
    end
  end

  @[Extern]
  struct PEER_ENDPOINT
    property address : Win32cr::NetworkManagement::P2P::PEER_ADDRESS
    property pwzEndpointName : Win32cr::Foundation::PWSTR
    def initialize(@address : Win32cr::NetworkManagement::P2P::PEER_ADDRESS, @pwzEndpointName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PEER_PEOPLE_NEAR_ME
    property pwzNickName : Win32cr::Foundation::PWSTR
    property endpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT
    property id : LibC::GUID
    def initialize(@pwzNickName : Win32cr::Foundation::PWSTR, @endpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT, @id : LibC::GUID)
    end
  end

  @[Extern]
  struct PEER_INVITATION
    property applicationId : LibC::GUID
    property applicationData : Win32cr::NetworkManagement::P2P::PEER_DATA
    property pwzMessage : Win32cr::Foundation::PWSTR
    def initialize(@applicationId : LibC::GUID, @applicationData : Win32cr::NetworkManagement::P2P::PEER_DATA, @pwzMessage : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PEER_INVITATION_RESPONSE
    property action : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE_TYPE
    property pwzMessage : Win32cr::Foundation::PWSTR
    property hrExtendedInfo : Win32cr::Foundation::HRESULT
    def initialize(@action : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE_TYPE, @pwzMessage : Win32cr::Foundation::PWSTR, @hrExtendedInfo : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct PEER_APP_LAUNCH_INFO
    property pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*
    property pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*
    property pInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*
    def initialize(@pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, @pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, @pInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*)
    end
  end

  @[Extern]
  struct PEER_APPLICATION_REGISTRATION_INFO
    property application : Win32cr::NetworkManagement::P2P::PEER_APPLICATION
    property pwzApplicationToLaunch : Win32cr::Foundation::PWSTR
    property pwzApplicationArguments : Win32cr::Foundation::PWSTR
    property dwPublicationScope : UInt32
    def initialize(@application : Win32cr::NetworkManagement::P2P::PEER_APPLICATION, @pwzApplicationToLaunch : Win32cr::Foundation::PWSTR, @pwzApplicationArguments : Win32cr::Foundation::PWSTR, @dwPublicationScope : UInt32)
    end
  end

  @[Extern]
  struct PEER_PRESENCE_INFO
    property status : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_STATUS
    property pwzDescriptiveText : Win32cr::Foundation::PWSTR
    def initialize(@status : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_STATUS, @pwzDescriptiveText : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PEER_COLLAB_EVENT_REGISTRATION
    property eventType : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_TYPE
    property pInstance : LibC::GUID*
    def initialize(@eventType : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_TYPE, @pInstance : LibC::GUID*)
    end
  end

  @[Extern]
  struct PEER_EVENT_WATCHLIST_CHANGED_DATA
    property pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*
    property changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE
    def initialize(@pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, @changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE)
    end
  end

  @[Extern]
  struct PEER_EVENT_PRESENCE_CHANGED_DATA
    property pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*
    property pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*
    property changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE
    property pPresenceInfo : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_INFO*
    def initialize(@pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, @pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, @changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE, @pPresenceInfo : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_INFO*)
    end
  end

  @[Extern]
  struct PEER_EVENT_APPLICATION_CHANGED_DATA
    property pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*
    property pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*
    property changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE
    property pApplication : Win32cr::NetworkManagement::P2P::PEER_APPLICATION*
    def initialize(@pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, @pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, @changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE, @pApplication : Win32cr::NetworkManagement::P2P::PEER_APPLICATION*)
    end
  end

  @[Extern]
  struct PEER_EVENT_OBJECT_CHANGED_DATA
    property pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*
    property pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*
    property changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE
    property pObject : Win32cr::NetworkManagement::P2P::PEER_OBJECT*
    def initialize(@pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, @pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, @changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE, @pObject : Win32cr::NetworkManagement::P2P::PEER_OBJECT*)
    end
  end

  @[Extern]
  struct PEER_EVENT_ENDPOINT_CHANGED_DATA
    property pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*
    property pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*
    def initialize(@pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, @pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*)
    end
  end

  @[Extern]
  struct PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA
    property changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE
    property pPeopleNearMe : Win32cr::NetworkManagement::P2P::PEER_PEOPLE_NEAR_ME*
    def initialize(@changeType : Win32cr::NetworkManagement::P2P::PEER_CHANGE_TYPE, @pPeopleNearMe : Win32cr::NetworkManagement::P2P::PEER_PEOPLE_NEAR_ME*)
    end
  end

  @[Extern]
  struct PEER_EVENT_REQUEST_STATUS_CHANGED_DATA
    property pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*
    property hrChange : Win32cr::Foundation::HRESULT
    def initialize(@pEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, @hrChange : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct PEER_COLLAB_EVENT_DATA
    property eventType : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property watchListChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_WATCHLIST_CHANGED_DATA
    property presenceChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_PRESENCE_CHANGED_DATA
    property applicationChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_APPLICATION_CHANGED_DATA
    property objectChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_OBJECT_CHANGED_DATA
    property endpointChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_ENDPOINT_CHANGED_DATA
    property peopleNearMeChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA
    property requestStatusChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_REQUEST_STATUS_CHANGED_DATA
    def initialize(@watchListChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_WATCHLIST_CHANGED_DATA, @presenceChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_PRESENCE_CHANGED_DATA, @applicationChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_APPLICATION_CHANGED_DATA, @objectChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_OBJECT_CHANGED_DATA, @endpointChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_ENDPOINT_CHANGED_DATA, @peopleNearMeChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA, @requestStatusChangedData : Win32cr::NetworkManagement::P2P::PEER_EVENT_REQUEST_STATUS_CHANGED_DATA)
    end
    end

    def initialize(@eventType : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PEER_PNRP_ENDPOINT_INFO
    property pwzPeerName : Win32cr::Foundation::PWSTR
    property cAddresses : UInt32
    property ppAddresses : Win32cr::Networking::WinSock::SOCKADDR**
    property pwzComment : Win32cr::Foundation::PWSTR
    property payload : Win32cr::NetworkManagement::P2P::PEER_DATA
    def initialize(@pwzPeerName : Win32cr::Foundation::PWSTR, @cAddresses : UInt32, @ppAddresses : Win32cr::Networking::WinSock::SOCKADDR**, @pwzComment : Win32cr::Foundation::PWSTR, @payload : Win32cr::NetworkManagement::P2P::PEER_DATA)
    end
  end

  @[Extern]
  struct PEER_PNRP_CLOUD_INFO
    property pwzCloudName : Win32cr::Foundation::PWSTR
    property dwScope : Win32cr::NetworkManagement::P2P::PNRP_SCOPE
    property dwScopeId : UInt32
    def initialize(@pwzCloudName : Win32cr::Foundation::PWSTR, @dwScope : Win32cr::NetworkManagement::P2P::PNRP_SCOPE, @dwScopeId : UInt32)
    end
  end

  @[Extern]
  struct PEER_PNRP_REGISTRATION_INFO
    property pwzCloudName : Win32cr::Foundation::PWSTR
    property pwzPublishingIdentity : Win32cr::Foundation::PWSTR
    property cAddresses : UInt32
    property ppAddresses : Win32cr::Networking::WinSock::SOCKADDR**
    property wPort : UInt16
    property pwzComment : Win32cr::Foundation::PWSTR
    property payload : Win32cr::NetworkManagement::P2P::PEER_DATA
    def initialize(@pwzCloudName : Win32cr::Foundation::PWSTR, @pwzPublishingIdentity : Win32cr::Foundation::PWSTR, @cAddresses : UInt32, @ppAddresses : Win32cr::Networking::WinSock::SOCKADDR**, @wPort : UInt16, @pwzComment : Win32cr::Foundation::PWSTR, @payload : Win32cr::NetworkManagement::P2P::PEER_DATA)
    end
  end

  @[Extern]
  struct DRT_DATA
    property cb : UInt32
    property pb : UInt8*
    def initialize(@cb : UInt32, @pb : UInt8*)
    end
  end

  @[Extern]
  struct DRT_REGISTRATION
    property key : Win32cr::NetworkManagement::P2P::DRT_DATA
    property appData : Win32cr::NetworkManagement::P2P::DRT_DATA
    def initialize(@key : Win32cr::NetworkManagement::P2P::DRT_DATA, @appData : Win32cr::NetworkManagement::P2P::DRT_DATA)
    end
  end

  @[Extern]
  struct DRT_SECURITY_PROVIDER
    property pvContext : Void*
    property attach : LibC::IntPtrT
    property detach : LibC::IntPtrT
    property register_key : LibC::IntPtrT
    property unregister_key : LibC::IntPtrT
    property validate_and_unpack_payload : LibC::IntPtrT
    property secure_and_pack_payload : LibC::IntPtrT
    property free_data : LibC::IntPtrT
    property encrypt_data : LibC::IntPtrT
    property decrypt_data : LibC::IntPtrT
    property get_serialized_credential : LibC::IntPtrT
    property validate_remote_credential : LibC::IntPtrT
    property sign_data : LibC::IntPtrT
    property verify_data : LibC::IntPtrT
    def initialize(@pvContext : Void*, @attach : LibC::IntPtrT, @detach : LibC::IntPtrT, @register_key : LibC::IntPtrT, @unregister_key : LibC::IntPtrT, @validate_and_unpack_payload : LibC::IntPtrT, @secure_and_pack_payload : LibC::IntPtrT, @free_data : LibC::IntPtrT, @encrypt_data : LibC::IntPtrT, @decrypt_data : LibC::IntPtrT, @get_serialized_credential : LibC::IntPtrT, @validate_remote_credential : LibC::IntPtrT, @sign_data : LibC::IntPtrT, @verify_data : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct DRT_BOOTSTRAP_PROVIDER
    property pvContext : Void*
    property attach : LibC::IntPtrT
    property detach : LibC::IntPtrT
    property init_resolve : LibC::IntPtrT
    property issue_resolve : LibC::IntPtrT
    property end_resolve : LibC::IntPtrT
    property register : LibC::IntPtrT
    property unregister : LibC::IntPtrT
    def initialize(@pvContext : Void*, @attach : LibC::IntPtrT, @detach : LibC::IntPtrT, @init_resolve : LibC::IntPtrT, @issue_resolve : LibC::IntPtrT, @end_resolve : LibC::IntPtrT, @register : LibC::IntPtrT, @unregister : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct DRT_SETTINGS
    property dwSize : UInt32
    property cbKey : UInt32
    property bProtocolMajorVersion : UInt8
    property bProtocolMinorVersion : UInt8
    property ulMaxRoutingAddresses : UInt32
    property pwzDrtInstancePrefix : Win32cr::Foundation::PWSTR
    property hTransport : Void*
    property pSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER*
    property pBootstrapProvider : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER*
    property eSecurityMode : Win32cr::NetworkManagement::P2P::DRT_SECURITY_MODE
    def initialize(@dwSize : UInt32, @cbKey : UInt32, @bProtocolMajorVersion : UInt8, @bProtocolMinorVersion : UInt8, @ulMaxRoutingAddresses : UInt32, @pwzDrtInstancePrefix : Win32cr::Foundation::PWSTR, @hTransport : Void*, @pSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER*, @pBootstrapProvider : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER*, @eSecurityMode : Win32cr::NetworkManagement::P2P::DRT_SECURITY_MODE)
    end
  end

  @[Extern]
  struct DRT_SEARCH_INFO
    property dwSize : UInt32
    property fIterative : Win32cr::Foundation::BOOL
    property fAllowCurrentInstanceMatch : Win32cr::Foundation::BOOL
    property fAnyMatchInRange : Win32cr::Foundation::BOOL
    property cMaxEndpoints : UInt32
    property pMaximumKey : Win32cr::NetworkManagement::P2P::DRT_DATA*
    property pMinimumKey : Win32cr::NetworkManagement::P2P::DRT_DATA*
    def initialize(@dwSize : UInt32, @fIterative : Win32cr::Foundation::BOOL, @fAllowCurrentInstanceMatch : Win32cr::Foundation::BOOL, @fAnyMatchInRange : Win32cr::Foundation::BOOL, @cMaxEndpoints : UInt32, @pMaximumKey : Win32cr::NetworkManagement::P2P::DRT_DATA*, @pMinimumKey : Win32cr::NetworkManagement::P2P::DRT_DATA*)
    end
  end

  @[Extern]
  struct DRT_ADDRESS
    property socketAddress : Win32cr::Networking::WinSock::SOCKADDR_STORAGE
    property flags : UInt32
    property nearness : Int32
    property latency : UInt32
    def initialize(@socketAddress : Win32cr::Networking::WinSock::SOCKADDR_STORAGE, @flags : UInt32, @nearness : Int32, @latency : UInt32)
    end
  end

  @[Extern]
  struct DRT_ADDRESS_LIST
    property address_count : UInt32
    property address_list : Win32cr::NetworkManagement::P2P::DRT_ADDRESS*
    def initialize(@address_count : UInt32, @address_list : Win32cr::NetworkManagement::P2P::DRT_ADDRESS*)
    end
  end

  @[Extern]
  struct DRT_SEARCH_RESULT
    property dwSize : UInt32
    property type__ : Win32cr::NetworkManagement::P2P::DRT_MATCH_TYPE
    property pvContext : Void*
    property registration : Win32cr::NetworkManagement::P2P::DRT_REGISTRATION
    def initialize(@dwSize : UInt32, @type__ : Win32cr::NetworkManagement::P2P::DRT_MATCH_TYPE, @pvContext : Void*, @registration : Win32cr::NetworkManagement::P2P::DRT_REGISTRATION)
    end
  end

  @[Extern]
  struct DRT_EVENT_DATA
    property type__ : Win32cr::NetworkManagement::P2P::DRT_EVENT_TYPE
    property hr : Win32cr::Foundation::HRESULT
    property pvContext : Void*
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property leafsetKeyChange : Leafsetkeychange_e__struct_
    property registrationStateChange : Registrationstatechange_e__struct_
    property statusChange : Statuschange_e__struct_

      # Nested Type Statuschange_e__struct_
      @[Extern]
      struct Statuschange_e__struct_
    property status : Win32cr::NetworkManagement::P2P::DRT_STATUS
    property bootstrapAddresses : Bootstrapaddresses_e__struct_

        # Nested Type Bootstrapaddresses_e__struct_
        @[Extern]
        struct Bootstrapaddresses_e__struct_
    property cntAddress : UInt32
    property pAddresses : Win32cr::Networking::WinSock::SOCKADDR_STORAGE*
    def initialize(@cntAddress : UInt32, @pAddresses : Win32cr::Networking::WinSock::SOCKADDR_STORAGE*)
    end
        end

    def initialize(@status : Win32cr::NetworkManagement::P2P::DRT_STATUS, @bootstrapAddresses : Bootstrapaddresses_e__struct_)
    end
      end


      # Nested Type Leafsetkeychange_e__struct_
      @[Extern]
      struct Leafsetkeychange_e__struct_
    property change : Win32cr::NetworkManagement::P2P::DRT_LEAFSET_KEY_CHANGE_TYPE
    property localKey : Win32cr::NetworkManagement::P2P::DRT_DATA
    property remoteKey : Win32cr::NetworkManagement::P2P::DRT_DATA
    def initialize(@change : Win32cr::NetworkManagement::P2P::DRT_LEAFSET_KEY_CHANGE_TYPE, @localKey : Win32cr::NetworkManagement::P2P::DRT_DATA, @remoteKey : Win32cr::NetworkManagement::P2P::DRT_DATA)
    end
      end


      # Nested Type Registrationstatechange_e__struct_
      @[Extern]
      struct Registrationstatechange_e__struct_
    property state : Win32cr::NetworkManagement::P2P::DRT_REGISTRATION_STATE
    property localKey : Win32cr::NetworkManagement::P2P::DRT_DATA
    def initialize(@state : Win32cr::NetworkManagement::P2P::DRT_REGISTRATION_STATE, @localKey : Win32cr::NetworkManagement::P2P::DRT_DATA)
    end
      end

    def initialize(@leafsetKeyChange : Leafsetkeychange_e__struct_, @registrationStateChange : Registrationstatechange_e__struct_, @statusChange : Statuschange_e__struct_)
    end
    end

    def initialize(@type__ : Win32cr::NetworkManagement::P2P::DRT_EVENT_TYPE, @hr : Win32cr::Foundation::HRESULT, @pvContext : Void*, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PEERDIST_PUBLICATION_OPTIONS
    property dwVersion : UInt32
    property dwFlags : UInt32
    def initialize(@dwVersion : UInt32, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct PEERDIST_CONTENT_TAG
    property data : UInt8[16]
    def initialize(@data : UInt8[16])
    end
  end

  @[Extern]
  struct PEERDIST_RETRIEVAL_OPTIONS
    property cbSize : UInt32
    property dwContentInfoMinVersion : UInt32
    property dwContentInfoMaxVersion : UInt32
    property dwReserved : UInt32
    def initialize(@cbSize : UInt32, @dwContentInfoMinVersion : UInt32, @dwContentInfoMaxVersion : UInt32, @dwReserved : UInt32)
    end
  end

  @[Extern]
  struct PEERDIST_STATUS_INFO
    property cbSize : UInt32
    property status : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS
    property dwMinVer : Win32cr::NetworkManagement::P2P::PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE
    property dwMaxVer : Win32cr::NetworkManagement::P2P::PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE
    def initialize(@cbSize : UInt32, @status : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS, @dwMinVer : Win32cr::NetworkManagement::P2P::PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE, @dwMaxVer : Win32cr::NetworkManagement::P2P::PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE)
    end
  end

  @[Extern]
  struct PEERDIST_CLIENT_BASIC_INFO
    property fFlashCrowd : Win32cr::Foundation::BOOL
    def initialize(@fFlashCrowd : Win32cr::Foundation::BOOL)
    end
  end

  def peerGraphStartup(wVersionRequested : UInt16, pVersionData : Win32cr::NetworkManagement::P2P::PEER_VERSION_DATA*) : Win32cr::Foundation::HRESULT
    C.PeerGraphStartup(wVersionRequested, pVersionData)
  end

  def peerGraphShutdown : Win32cr::Foundation::HRESULT
    C.PeerGraphShutdown
  end

  def peerGraphFreeData(pvData : Void*) : Void
    C.PeerGraphFreeData(pvData)
  end

  def peerGraphGetItemCount(hPeerEnum : Void*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
    C.PeerGraphGetItemCount(hPeerEnum, pCount)
  end

  def peerGraphGetNextItem(hPeerEnum : Void*, pCount : UInt32*, pppvItems : Void***) : Win32cr::Foundation::HRESULT
    C.PeerGraphGetNextItem(hPeerEnum, pCount, pppvItems)
  end

  def peerGraphEndEnumeration(hPeerEnum : Void*) : Win32cr::Foundation::HRESULT
    C.PeerGraphEndEnumeration(hPeerEnum)
  end

  def peerGraphCreate(pGraphProperties : Win32cr::NetworkManagement::P2P::PEER_GRAPH_PROPERTIES*, pwzDatabaseName : Win32cr::Foundation::PWSTR, pSecurityInterface : Win32cr::NetworkManagement::P2P::PEER_SECURITY_INTERFACE*, phGraph : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGraphCreate(pGraphProperties, pwzDatabaseName, pSecurityInterface, phGraph)
  end

  def peerGraphOpen(pwzGraphId : Win32cr::Foundation::PWSTR, pwzPeerId : Win32cr::Foundation::PWSTR, pwzDatabaseName : Win32cr::Foundation::PWSTR, pSecurityInterface : Win32cr::NetworkManagement::P2P::PEER_SECURITY_INTERFACE*, cRecordTypeSyncPrecedence : UInt32, pRecordTypeSyncPrecedence : LibC::GUID*, phGraph : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGraphOpen(pwzGraphId, pwzPeerId, pwzDatabaseName, pSecurityInterface, cRecordTypeSyncPrecedence, pRecordTypeSyncPrecedence, phGraph)
  end

  def peerGraphListen(hGraph : Void*, dwScope : UInt32, dwScopeId : UInt32, wPort : UInt16) : Win32cr::Foundation::HRESULT
    C.PeerGraphListen(hGraph, dwScope, dwScopeId, wPort)
  end

  def peerGraphConnect(hGraph : Void*, pwzPeerId : Win32cr::Foundation::PWSTR, pAddress : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, pullConnectionId : UInt64*) : Win32cr::Foundation::HRESULT
    C.PeerGraphConnect(hGraph, pwzPeerId, pAddress, pullConnectionId)
  end

  def peerGraphClose(hGraph : Void*) : Win32cr::Foundation::HRESULT
    C.PeerGraphClose(hGraph)
  end

  def peerGraphDelete(pwzGraphId : Win32cr::Foundation::PWSTR, pwzPeerId : Win32cr::Foundation::PWSTR, pwzDatabaseName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerGraphDelete(pwzGraphId, pwzPeerId, pwzDatabaseName)
  end

  def peerGraphGetStatus(hGraph : Void*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
    C.PeerGraphGetStatus(hGraph, pdwStatus)
  end

  def peerGraphGetProperties(hGraph : Void*, ppGraphProperties : Win32cr::NetworkManagement::P2P::PEER_GRAPH_PROPERTIES**) : Win32cr::Foundation::HRESULT
    C.PeerGraphGetProperties(hGraph, ppGraphProperties)
  end

  def peerGraphSetProperties(hGraph : Void*, pGraphProperties : Win32cr::NetworkManagement::P2P::PEER_GRAPH_PROPERTIES*) : Win32cr::Foundation::HRESULT
    C.PeerGraphSetProperties(hGraph, pGraphProperties)
  end

  def peerGraphRegisterEvent(hGraph : Void*, hEvent : Win32cr::Foundation::HANDLE, cEventRegistrations : UInt32, pEventRegistrations : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_REGISTRATION*, phPeerEvent : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGraphRegisterEvent(hGraph, hEvent, cEventRegistrations, pEventRegistrations, phPeerEvent)
  end

  def peerGraphUnregisterEvent(hPeerEvent : Void*) : Win32cr::Foundation::HRESULT
    C.PeerGraphUnregisterEvent(hPeerEvent)
  end

  def peerGraphGetEventData(hPeerEvent : Void*, ppEventData : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_DATA**) : Win32cr::Foundation::HRESULT
    C.PeerGraphGetEventData(hPeerEvent, ppEventData)
  end

  def peerGraphGetRecord(hGraph : Void*, pRecordId : LibC::GUID*, ppRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD**) : Win32cr::Foundation::HRESULT
    C.PeerGraphGetRecord(hGraph, pRecordId, ppRecord)
  end

  def peerGraphAddRecord(hGraph : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*, pRecordId : LibC::GUID*) : Win32cr::Foundation::HRESULT
    C.PeerGraphAddRecord(hGraph, pRecord, pRecordId)
  end

  def peerGraphUpdateRecord(hGraph : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*) : Win32cr::Foundation::HRESULT
    C.PeerGraphUpdateRecord(hGraph, pRecord)
  end

  def peerGraphDeleteRecord(hGraph : Void*, pRecordId : LibC::GUID*, fLocal : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.PeerGraphDeleteRecord(hGraph, pRecordId, fLocal)
  end

  def peerGraphEnumRecords(hGraph : Void*, pRecordType : LibC::GUID*, pwzPeerId : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGraphEnumRecords(hGraph, pRecordType, pwzPeerId, phPeerEnum)
  end

  def peerGraphSearchRecords(hGraph : Void*, pwzCriteria : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGraphSearchRecords(hGraph, pwzCriteria, phPeerEnum)
  end

  def peerGraphExportDatabase(hGraph : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerGraphExportDatabase(hGraph, pwzFilePath)
  end

  def peerGraphImportDatabase(hGraph : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerGraphImportDatabase(hGraph, pwzFilePath)
  end

  def peerGraphValidateDeferredRecords(hGraph : Void*, cRecordIds : UInt32, pRecordIds : LibC::GUID*) : Win32cr::Foundation::HRESULT
    C.PeerGraphValidateDeferredRecords(hGraph, cRecordIds, pRecordIds)
  end

  def peerGraphOpenDirectConnection(hGraph : Void*, pwzPeerId : Win32cr::Foundation::PWSTR, pAddress : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, pullConnectionId : UInt64*) : Win32cr::Foundation::HRESULT
    C.PeerGraphOpenDirectConnection(hGraph, pwzPeerId, pAddress, pullConnectionId)
  end

  def peerGraphSendData(hGraph : Void*, ullConnectionId : UInt64, pType : LibC::GUID*, cbData : UInt32, pvData : Void*) : Win32cr::Foundation::HRESULT
    C.PeerGraphSendData(hGraph, ullConnectionId, pType, cbData, pvData)
  end

  def peerGraphCloseDirectConnection(hGraph : Void*, ullConnectionId : UInt64) : Win32cr::Foundation::HRESULT
    C.PeerGraphCloseDirectConnection(hGraph, ullConnectionId)
  end

  def peerGraphEnumConnections(hGraph : Void*, dwFlags : UInt32, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGraphEnumConnections(hGraph, dwFlags, phPeerEnum)
  end

  def peerGraphEnumNodes(hGraph : Void*, pwzPeerId : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGraphEnumNodes(hGraph, pwzPeerId, phPeerEnum)
  end

  def peerGraphSetPresence(hGraph : Void*, fPresent : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.PeerGraphSetPresence(hGraph, fPresent)
  end

  def peerGraphGetNodeInfo(hGraph : Void*, ullNodeId : UInt64, ppNodeInfo : Win32cr::NetworkManagement::P2P::PEER_NODE_INFO**) : Win32cr::Foundation::HRESULT
    C.PeerGraphGetNodeInfo(hGraph, ullNodeId, ppNodeInfo)
  end

  def peerGraphSetNodeAttributes(hGraph : Void*, pwzAttributes : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerGraphSetNodeAttributes(hGraph, pwzAttributes)
  end

  def peerGraphPeerTimeToUniversalTime(hGraph : Void*, pftPeerTime : Win32cr::Foundation::FILETIME*, pftUniversalTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    C.PeerGraphPeerTimeToUniversalTime(hGraph, pftPeerTime, pftUniversalTime)
  end

  def peerGraphUniversalTimeToPeerTime(hGraph : Void*, pftUniversalTime : Win32cr::Foundation::FILETIME*, pftPeerTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    C.PeerGraphUniversalTimeToPeerTime(hGraph, pftUniversalTime, pftPeerTime)
  end

  def peerFreeData(pvData : Void*) : Void
    C.PeerFreeData(pvData)
  end

  def peerGetItemCount(hPeerEnum : Void*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
    C.PeerGetItemCount(hPeerEnum, pCount)
  end

  def peerGetNextItem(hPeerEnum : Void*, pCount : UInt32*, pppvItems : Void***) : Win32cr::Foundation::HRESULT
    C.PeerGetNextItem(hPeerEnum, pCount, pppvItems)
  end

  def peerEndEnumeration(hPeerEnum : Void*) : Win32cr::Foundation::HRESULT
    C.PeerEndEnumeration(hPeerEnum)
  end

  def peerGroupStartup(wVersionRequested : UInt16, pVersionData : Win32cr::NetworkManagement::P2P::PEER_VERSION_DATA*) : Win32cr::Foundation::HRESULT
    C.PeerGroupStartup(wVersionRequested, pVersionData)
  end

  def peerGroupShutdown : Win32cr::Foundation::HRESULT
    C.PeerGroupShutdown
  end

  def peerGroupCreate(pProperties : Win32cr::NetworkManagement::P2P::PEER_GROUP_PROPERTIES*, phGroup : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGroupCreate(pProperties, phGroup)
  end

  def peerGroupOpen(pwzIdentity : Win32cr::Foundation::PWSTR, pwzGroupPeerName : Win32cr::Foundation::PWSTR, pwzCloud : Win32cr::Foundation::PWSTR, phGroup : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGroupOpen(pwzIdentity, pwzGroupPeerName, pwzCloud, phGroup)
  end

  def peerGroupJoin(pwzIdentity : Win32cr::Foundation::PWSTR, pwzInvitation : Win32cr::Foundation::PWSTR, pwzCloud : Win32cr::Foundation::PWSTR, phGroup : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGroupJoin(pwzIdentity, pwzInvitation, pwzCloud, phGroup)
  end

  def peerGroupPasswordJoin(pwzIdentity : Win32cr::Foundation::PWSTR, pwzInvitation : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, pwzCloud : Win32cr::Foundation::PWSTR, phGroup : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGroupPasswordJoin(pwzIdentity, pwzInvitation, pwzPassword, pwzCloud, phGroup)
  end

  def peerGroupConnect(hGroup : Void*) : Win32cr::Foundation::HRESULT
    C.PeerGroupConnect(hGroup)
  end

  def peerGroupConnectByAddress(hGroup : Void*, cAddresses : UInt32, pAddresses : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*) : Win32cr::Foundation::HRESULT
    C.PeerGroupConnectByAddress(hGroup, cAddresses, pAddresses)
  end

  def peerGroupClose(hGroup : Void*) : Win32cr::Foundation::HRESULT
    C.PeerGroupClose(hGroup)
  end

  def peerGroupDelete(pwzIdentity : Win32cr::Foundation::PWSTR, pwzGroupPeerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerGroupDelete(pwzIdentity, pwzGroupPeerName)
  end

  def peerGroupCreateInvitation(hGroup : Void*, pwzIdentityInfo : Win32cr::Foundation::PWSTR, pftExpiration : Win32cr::Foundation::FILETIME*, cRoles : UInt32, pRoles : LibC::GUID*, ppwzInvitation : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerGroupCreateInvitation(hGroup, pwzIdentityInfo, pftExpiration, cRoles, pRoles, ppwzInvitation)
  end

  def peerGroupCreatePasswordInvitation(hGroup : Void*, ppwzInvitation : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerGroupCreatePasswordInvitation(hGroup, ppwzInvitation)
  end

  def peerGroupParseInvitation(pwzInvitation : Win32cr::Foundation::PWSTR, ppInvitationInfo : Win32cr::NetworkManagement::P2P::PEER_INVITATION_INFO**) : Win32cr::Foundation::HRESULT
    C.PeerGroupParseInvitation(pwzInvitation, ppInvitationInfo)
  end

  def peerGroupGetStatus(hGroup : Void*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
    C.PeerGroupGetStatus(hGroup, pdwStatus)
  end

  def peerGroupGetProperties(hGroup : Void*, ppProperties : Win32cr::NetworkManagement::P2P::PEER_GROUP_PROPERTIES**) : Win32cr::Foundation::HRESULT
    C.PeerGroupGetProperties(hGroup, ppProperties)
  end

  def peerGroupSetProperties(hGroup : Void*, pProperties : Win32cr::NetworkManagement::P2P::PEER_GROUP_PROPERTIES*) : Win32cr::Foundation::HRESULT
    C.PeerGroupSetProperties(hGroup, pProperties)
  end

  def peerGroupEnumMembers(hGroup : Void*, dwFlags : UInt32, pwzIdentity : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGroupEnumMembers(hGroup, dwFlags, pwzIdentity, phPeerEnum)
  end

  def peerGroupOpenDirectConnection(hGroup : Void*, pwzIdentity : Win32cr::Foundation::PWSTR, pAddress : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, pullConnectionId : UInt64*) : Win32cr::Foundation::HRESULT
    C.PeerGroupOpenDirectConnection(hGroup, pwzIdentity, pAddress, pullConnectionId)
  end

  def peerGroupCloseDirectConnection(hGroup : Void*, ullConnectionId : UInt64) : Win32cr::Foundation::HRESULT
    C.PeerGroupCloseDirectConnection(hGroup, ullConnectionId)
  end

  def peerGroupEnumConnections(hGroup : Void*, dwFlags : UInt32, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGroupEnumConnections(hGroup, dwFlags, phPeerEnum)
  end

  def peerGroupSendData(hGroup : Void*, ullConnectionId : UInt64, pType : LibC::GUID*, cbData : UInt32, pvData : Void*) : Win32cr::Foundation::HRESULT
    C.PeerGroupSendData(hGroup, ullConnectionId, pType, cbData, pvData)
  end

  def peerGroupRegisterEvent(hGroup : Void*, hEvent : Win32cr::Foundation::HANDLE, cEventRegistration : UInt32, pEventRegistrations : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_REGISTRATION*, phPeerEvent : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGroupRegisterEvent(hGroup, hEvent, cEventRegistration, pEventRegistrations, phPeerEvent)
  end

  def peerGroupUnregisterEvent(hPeerEvent : Void*) : Win32cr::Foundation::HRESULT
    C.PeerGroupUnregisterEvent(hPeerEvent)
  end

  def peerGroupGetEventData(hPeerEvent : Void*, ppEventData : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_DATA**) : Win32cr::Foundation::HRESULT
    C.PeerGroupGetEventData(hPeerEvent, ppEventData)
  end

  def peerGroupGetRecord(hGroup : Void*, pRecordId : LibC::GUID*, ppRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD**) : Win32cr::Foundation::HRESULT
    C.PeerGroupGetRecord(hGroup, pRecordId, ppRecord)
  end

  def peerGroupAddRecord(hGroup : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*, pRecordId : LibC::GUID*) : Win32cr::Foundation::HRESULT
    C.PeerGroupAddRecord(hGroup, pRecord, pRecordId)
  end

  def peerGroupUpdateRecord(hGroup : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*) : Win32cr::Foundation::HRESULT
    C.PeerGroupUpdateRecord(hGroup, pRecord)
  end

  def peerGroupDeleteRecord(hGroup : Void*, pRecordId : LibC::GUID*) : Win32cr::Foundation::HRESULT
    C.PeerGroupDeleteRecord(hGroup, pRecordId)
  end

  def peerGroupEnumRecords(hGroup : Void*, pRecordType : LibC::GUID*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGroupEnumRecords(hGroup, pRecordType, phPeerEnum)
  end

  def peerGroupSearchRecords(hGroup : Void*, pwzCriteria : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerGroupSearchRecords(hGroup, pwzCriteria, phPeerEnum)
  end

  def peerGroupExportDatabase(hGroup : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerGroupExportDatabase(hGroup, pwzFilePath)
  end

  def peerGroupImportDatabase(hGroup : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerGroupImportDatabase(hGroup, pwzFilePath)
  end

  def peerGroupIssueCredentials(hGroup : Void*, pwzSubjectIdentity : Win32cr::Foundation::PWSTR, pCredentialInfo : Win32cr::NetworkManagement::P2P::PEER_CREDENTIAL_INFO*, dwFlags : UInt32, ppwzInvitation : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerGroupIssueCredentials(hGroup, pwzSubjectIdentity, pCredentialInfo, dwFlags, ppwzInvitation)
  end

  def peerGroupExportConfig(hGroup : Void*, pwzPassword : Win32cr::Foundation::PWSTR, ppwzXML : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerGroupExportConfig(hGroup, pwzPassword, ppwzXML)
  end

  def peerGroupImportConfig(pwzXML : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, fOverwrite : Win32cr::Foundation::BOOL, ppwzIdentity : Win32cr::Foundation::PWSTR*, ppwzGroup : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerGroupImportConfig(pwzXML, pwzPassword, fOverwrite, ppwzIdentity, ppwzGroup)
  end

  def peerGroupPeerTimeToUniversalTime(hGroup : Void*, pftPeerTime : Win32cr::Foundation::FILETIME*, pftUniversalTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    C.PeerGroupPeerTimeToUniversalTime(hGroup, pftPeerTime, pftUniversalTime)
  end

  def peerGroupUniversalTimeToPeerTime(hGroup : Void*, pftUniversalTime : Win32cr::Foundation::FILETIME*, pftPeerTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    C.PeerGroupUniversalTimeToPeerTime(hGroup, pftUniversalTime, pftPeerTime)
  end

  def peerGroupResumePasswordAuthentication(hGroup : Void*, hPeerEventHandle : Void*) : Win32cr::Foundation::HRESULT
    C.PeerGroupResumePasswordAuthentication(hGroup, hPeerEventHandle)
  end

  def peerIdentityCreate(pwzClassifier : Win32cr::Foundation::PWSTR, pwzFriendlyName : Win32cr::Foundation::PWSTR, hCryptProv : LibC::UIntPtrT, ppwzIdentity : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerIdentityCreate(pwzClassifier, pwzFriendlyName, hCryptProv, ppwzIdentity)
  end

  def peerIdentityGetFriendlyName(pwzIdentity : Win32cr::Foundation::PWSTR, ppwzFriendlyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerIdentityGetFriendlyName(pwzIdentity, ppwzFriendlyName)
  end

  def peerIdentitySetFriendlyName(pwzIdentity : Win32cr::Foundation::PWSTR, pwzFriendlyName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerIdentitySetFriendlyName(pwzIdentity, pwzFriendlyName)
  end

  def peerIdentityGetCryptKey(pwzIdentity : Win32cr::Foundation::PWSTR, phCryptProv : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
    C.PeerIdentityGetCryptKey(pwzIdentity, phCryptProv)
  end

  def peerIdentityDelete(pwzIdentity : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerIdentityDelete(pwzIdentity)
  end

  def peerEnumIdentities(phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerEnumIdentities(phPeerEnum)
  end

  def peerEnumGroups(pwzIdentity : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerEnumGroups(pwzIdentity, phPeerEnum)
  end

  def peerCreatePeerName(pwzIdentity : Win32cr::Foundation::PWSTR, pwzClassifier : Win32cr::Foundation::PWSTR, ppwzPeerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerCreatePeerName(pwzIdentity, pwzClassifier, ppwzPeerName)
  end

  def peerIdentityGetXML(pwzIdentity : Win32cr::Foundation::PWSTR, ppwzIdentityXML : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerIdentityGetXML(pwzIdentity, ppwzIdentityXML)
  end

  def peerIdentityExport(pwzIdentity : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, ppwzExportXML : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerIdentityExport(pwzIdentity, pwzPassword, ppwzExportXML)
  end

  def peerIdentityImport(pwzImportXML : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, ppwzIdentity : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerIdentityImport(pwzImportXML, pwzPassword, ppwzIdentity)
  end

  def peerIdentityGetDefault(ppwzPeerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerIdentityGetDefault(ppwzPeerName)
  end

  def peerCollabStartup(wVersionRequested : UInt16) : Win32cr::Foundation::HRESULT
    C.PeerCollabStartup(wVersionRequested)
  end

  def peerCollabShutdown : Win32cr::Foundation::HRESULT
    C.PeerCollabShutdown
  end

  def peerCollabSignin(hwndParent : Win32cr::Foundation::HWND, dwSigninOptions : UInt32) : Win32cr::Foundation::HRESULT
    C.PeerCollabSignin(hwndParent, dwSigninOptions)
  end

  def peerCollabSignout(dwSigninOptions : UInt32) : Win32cr::Foundation::HRESULT
    C.PeerCollabSignout(dwSigninOptions)
  end

  def peerCollabGetSigninOptions(pdwSigninOptions : UInt32*) : Win32cr::Foundation::HRESULT
    C.PeerCollabGetSigninOptions(pdwSigninOptions)
  end

  def peerCollabAsyncInviteContact(pcContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, hEvent : Win32cr::Foundation::HANDLE, phInvitation : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    C.PeerCollabAsyncInviteContact(pcContact, pcEndpoint, pcInvitation, hEvent, phInvitation)
  end

  def peerCollabGetInvitationResponse(hInvitation : Win32cr::Foundation::HANDLE, ppInvitationResponse : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE**) : Win32cr::Foundation::HRESULT
    C.PeerCollabGetInvitationResponse(hInvitation, ppInvitationResponse)
  end

  def peerCollabCancelInvitation(hInvitation : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.PeerCollabCancelInvitation(hInvitation)
  end

  def peerCollabCloseHandle(hInvitation : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.PeerCollabCloseHandle(hInvitation)
  end

  def peerCollabInviteContact(pcContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, ppResponse : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE**) : Win32cr::Foundation::HRESULT
    C.PeerCollabInviteContact(pcContact, pcEndpoint, pcInvitation, ppResponse)
  end

  def peerCollabAsyncInviteEndpoint(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, hEvent : Win32cr::Foundation::HANDLE, phInvitation : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    C.PeerCollabAsyncInviteEndpoint(pcEndpoint, pcInvitation, hEvent, phInvitation)
  end

  def peerCollabInviteEndpoint(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, ppResponse : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE**) : Win32cr::Foundation::HRESULT
    C.PeerCollabInviteEndpoint(pcEndpoint, pcInvitation, ppResponse)
  end

  def peerCollabGetAppLaunchInfo(ppLaunchInfo : Win32cr::NetworkManagement::P2P::PEER_APP_LAUNCH_INFO**) : Win32cr::Foundation::HRESULT
    C.PeerCollabGetAppLaunchInfo(ppLaunchInfo)
  end

  def peerCollabRegisterApplication(pcApplication : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_INFO*, registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE) : Win32cr::Foundation::HRESULT
    C.PeerCollabRegisterApplication(pcApplication, registrationType)
  end

  def peerCollabUnregisterApplication(pApplicationId : LibC::GUID*, registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE) : Win32cr::Foundation::HRESULT
    C.PeerCollabUnregisterApplication(pApplicationId, registrationType)
  end

  def peerCollabGetApplicationRegistrationInfo(pApplicationId : LibC::GUID*, registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE, ppApplication : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_INFO**) : Win32cr::Foundation::HRESULT
    C.PeerCollabGetApplicationRegistrationInfo(pApplicationId, registrationType, ppApplication)
  end

  def peerCollabEnumApplicationRegistrationInfo(registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerCollabEnumApplicationRegistrationInfo(registrationType, phPeerEnum)
  end

  def peerCollabGetPresenceInfo(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, ppPresenceInfo : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_INFO**) : Win32cr::Foundation::HRESULT
    C.PeerCollabGetPresenceInfo(pcEndpoint, ppPresenceInfo)
  end

  def peerCollabEnumApplications(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pApplicationId : LibC::GUID*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerCollabEnumApplications(pcEndpoint, pApplicationId, phPeerEnum)
  end

  def peerCollabEnumObjects(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pObjectId : LibC::GUID*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerCollabEnumObjects(pcEndpoint, pObjectId, phPeerEnum)
  end

  def peerCollabEnumEndpoints(pcContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerCollabEnumEndpoints(pcContact, phPeerEnum)
  end

  def peerCollabRefreshEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT
    C.PeerCollabRefreshEndpointData(pcEndpoint)
  end

  def peerCollabDeleteEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT
    C.PeerCollabDeleteEndpointData(pcEndpoint)
  end

  def peerCollabQueryContactData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, ppwzContactData : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerCollabQueryContactData(pcEndpoint, ppwzContactData)
  end

  def peerCollabSubscribeEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT
    C.PeerCollabSubscribeEndpointData(pcEndpoint)
  end

  def peerCollabUnsubscribeEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT
    C.PeerCollabUnsubscribeEndpointData(pcEndpoint)
  end

  def peerCollabSetPresenceInfo(pcPresenceInfo : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_INFO*) : Win32cr::Foundation::HRESULT
    C.PeerCollabSetPresenceInfo(pcPresenceInfo)
  end

  def peerCollabGetEndpointName(ppwzEndpointName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerCollabGetEndpointName(ppwzEndpointName)
  end

  def peerCollabSetEndpointName(pwzEndpointName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerCollabSetEndpointName(pwzEndpointName)
  end

  def peerCollabSetObject(pcObject : Win32cr::NetworkManagement::P2P::PEER_OBJECT*) : Win32cr::Foundation::HRESULT
    C.PeerCollabSetObject(pcObject)
  end

  def peerCollabDeleteObject(pObjectId : LibC::GUID*) : Win32cr::Foundation::HRESULT
    C.PeerCollabDeleteObject(pObjectId)
  end

  def peerCollabRegisterEvent(hEvent : Win32cr::Foundation::HANDLE, cEventRegistration : UInt32, pEventRegistrations : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_REGISTRATION*, phPeerEvent : Void**) : Win32cr::Foundation::HRESULT
    C.PeerCollabRegisterEvent(hEvent, cEventRegistration, pEventRegistrations, phPeerEvent)
  end

  def peerCollabGetEventData(hPeerEvent : Void*, ppEventData : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_DATA**) : Win32cr::Foundation::HRESULT
    C.PeerCollabGetEventData(hPeerEvent, ppEventData)
  end

  def peerCollabUnregisterEvent(hPeerEvent : Void*) : Win32cr::Foundation::HRESULT
    C.PeerCollabUnregisterEvent(hPeerEvent)
  end

  def peerCollabEnumPeopleNearMe(phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerCollabEnumPeopleNearMe(phPeerEnum)
  end

  def peerCollabAddContact(pwzContactData : Win32cr::Foundation::PWSTR, ppContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT**) : Win32cr::Foundation::HRESULT
    C.PeerCollabAddContact(pwzContactData, ppContact)
  end

  def peerCollabDeleteContact(pwzPeerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.PeerCollabDeleteContact(pwzPeerName)
  end

  def peerCollabGetContact(pwzPeerName : Win32cr::Foundation::PWSTR, ppContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT**) : Win32cr::Foundation::HRESULT
    C.PeerCollabGetContact(pwzPeerName, ppContact)
  end

  def peerCollabUpdateContact(pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*) : Win32cr::Foundation::HRESULT
    C.PeerCollabUpdateContact(pContact)
  end

  def peerCollabEnumContacts(phPeerEnum : Void**) : Win32cr::Foundation::HRESULT
    C.PeerCollabEnumContacts(phPeerEnum)
  end

  def peerCollabExportContact(pwzPeerName : Win32cr::Foundation::PWSTR, ppwzContactData : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerCollabExportContact(pwzPeerName, ppwzContactData)
  end

  def peerCollabParseContact(pwzContactData : Win32cr::Foundation::PWSTR, ppContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT**) : Win32cr::Foundation::HRESULT
    C.PeerCollabParseContact(pwzContactData, ppContact)
  end

  def peerNameToPeerHostName(pwzPeerName : Win32cr::Foundation::PWSTR, ppwzHostName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerNameToPeerHostName(pwzPeerName, ppwzHostName)
  end

  def peerHostNameToPeerName(pwzHostName : Win32cr::Foundation::PWSTR, ppwzPeerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.PeerHostNameToPeerName(pwzHostName, ppwzPeerName)
  end

  def peerPnrpStartup(wVersionRequested : UInt16) : Win32cr::Foundation::HRESULT
    C.PeerPnrpStartup(wVersionRequested)
  end

  def peerPnrpShutdown : Win32cr::Foundation::HRESULT
    C.PeerPnrpShutdown
  end

  def peerPnrpRegister(pcwzPeerName : Win32cr::Foundation::PWSTR, pRegistrationInfo : Win32cr::NetworkManagement::P2P::PEER_PNRP_REGISTRATION_INFO*, phRegistration : Void**) : Win32cr::Foundation::HRESULT
    C.PeerPnrpRegister(pcwzPeerName, pRegistrationInfo, phRegistration)
  end

  def peerPnrpUpdateRegistration(hRegistration : Void*, pRegistrationInfo : Win32cr::NetworkManagement::P2P::PEER_PNRP_REGISTRATION_INFO*) : Win32cr::Foundation::HRESULT
    C.PeerPnrpUpdateRegistration(hRegistration, pRegistrationInfo)
  end

  def peerPnrpUnregister(hRegistration : Void*) : Win32cr::Foundation::HRESULT
    C.PeerPnrpUnregister(hRegistration)
  end

  def peerPnrpResolve(pcwzPeerName : Win32cr::Foundation::PWSTR, pcwzCloudName : Win32cr::Foundation::PWSTR, pcEndpoints : UInt32*, ppEndpoints : Win32cr::NetworkManagement::P2P::PEER_PNRP_ENDPOINT_INFO**) : Win32cr::Foundation::HRESULT
    C.PeerPnrpResolve(pcwzPeerName, pcwzCloudName, pcEndpoints, ppEndpoints)
  end

  def peerPnrpStartResolve(pcwzPeerName : Win32cr::Foundation::PWSTR, pcwzCloudName : Win32cr::Foundation::PWSTR, cMaxEndpoints : UInt32, hEvent : Win32cr::Foundation::HANDLE, phResolve : Void**) : Win32cr::Foundation::HRESULT
    C.PeerPnrpStartResolve(pcwzPeerName, pcwzCloudName, cMaxEndpoints, hEvent, phResolve)
  end

  def peerPnrpGetCloudInfo(pcNumClouds : UInt32*, ppCloudInfo : Win32cr::NetworkManagement::P2P::PEER_PNRP_CLOUD_INFO**) : Win32cr::Foundation::HRESULT
    C.PeerPnrpGetCloudInfo(pcNumClouds, ppCloudInfo)
  end

  def peerPnrpGetEndpoint(hResolve : Void*, ppEndpoint : Win32cr::NetworkManagement::P2P::PEER_PNRP_ENDPOINT_INFO**) : Win32cr::Foundation::HRESULT
    C.PeerPnrpGetEndpoint(hResolve, ppEndpoint)
  end

  def peerPnrpEndResolve(hResolve : Void*) : Win32cr::Foundation::HRESULT
    C.PeerPnrpEndResolve(hResolve)
  end

  def drtCreatePnrpBootstrapResolver(fPublish : Win32cr::Foundation::BOOL, pwzPeerName : Win32cr::Foundation::PWSTR, pwzCloudName : Win32cr::Foundation::PWSTR, pwzPublishingIdentity : Win32cr::Foundation::PWSTR, ppResolver : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER**) : Win32cr::Foundation::HRESULT
    C.DrtCreatePnrpBootstrapResolver(fPublish, pwzPeerName, pwzCloudName, pwzPublishingIdentity, ppResolver)
  end

  def drtDeletePnrpBootstrapResolver(pResolver : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER*) : Void
    C.DrtDeletePnrpBootstrapResolver(pResolver)
  end

  def drtCreateDnsBootstrapResolver(port : UInt16, pwszAddress : Win32cr::Foundation::PWSTR, ppModule : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER**) : Win32cr::Foundation::HRESULT
    C.DrtCreateDnsBootstrapResolver(port, pwszAddress, ppModule)
  end

  def drtDeleteDnsBootstrapResolver(pResolver : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER*) : Void
    C.DrtDeleteDnsBootstrapResolver(pResolver)
  end

  def drtCreateIpv6UdpTransport(scope : Win32cr::NetworkManagement::P2P::DRT_SCOPE, dwScopeId : UInt32, dwLocalityThreshold : UInt32, pwPort : UInt16*, phTransport : Void**) : Win32cr::Foundation::HRESULT
    C.DrtCreateIpv6UdpTransport(scope, dwScopeId, dwLocalityThreshold, pwPort, phTransport)
  end

  def drtDeleteIpv6UdpTransport(hTransport : Void*) : Win32cr::Foundation::HRESULT
    C.DrtDeleteIpv6UdpTransport(hTransport)
  end

  def drtCreateDerivedKeySecurityProvider(pRootCert : Win32cr::Security::Cryptography::CERT_CONTEXT*, pLocalCert : Win32cr::Security::Cryptography::CERT_CONTEXT*, ppSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER**) : Win32cr::Foundation::HRESULT
    C.DrtCreateDerivedKeySecurityProvider(pRootCert, pLocalCert, ppSecurityProvider)
  end

  def drtCreateDerivedKey(pLocalCert : Win32cr::Security::Cryptography::CERT_CONTEXT*, pKey : Win32cr::NetworkManagement::P2P::DRT_DATA*) : Win32cr::Foundation::HRESULT
    C.DrtCreateDerivedKey(pLocalCert, pKey)
  end

  def drtDeleteDerivedKeySecurityProvider(pSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER*) : Void
    C.DrtDeleteDerivedKeySecurityProvider(pSecurityProvider)
  end

  def drtCreateNullSecurityProvider(ppSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER**) : Win32cr::Foundation::HRESULT
    C.DrtCreateNullSecurityProvider(ppSecurityProvider)
  end

  def drtDeleteNullSecurityProvider(pSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER*) : Void
    C.DrtDeleteNullSecurityProvider(pSecurityProvider)
  end

  def drtOpen(pSettings : Win32cr::NetworkManagement::P2P::DRT_SETTINGS*, hEvent : Win32cr::Foundation::HANDLE, pvContext : Void*, phDrt : Void**) : Win32cr::Foundation::HRESULT
    C.DrtOpen(pSettings, hEvent, pvContext, phDrt)
  end

  def drtClose(hDrt : Void*) : Void
    C.DrtClose(hDrt)
  end

  def drtGetEventDataSize(hDrt : Void*, pulEventDataLen : UInt32*) : Win32cr::Foundation::HRESULT
    C.DrtGetEventDataSize(hDrt, pulEventDataLen)
  end

  def drtGetEventData(hDrt : Void*, ulEventDataLen : UInt32, pEventData : Win32cr::NetworkManagement::P2P::DRT_EVENT_DATA*) : Win32cr::Foundation::HRESULT
    C.DrtGetEventData(hDrt, ulEventDataLen, pEventData)
  end

  def drtRegisterKey(hDrt : Void*, pRegistration : Win32cr::NetworkManagement::P2P::DRT_REGISTRATION*, pvKeyContext : Void*, phKeyRegistration : Void**) : Win32cr::Foundation::HRESULT
    C.DrtRegisterKey(hDrt, pRegistration, pvKeyContext, phKeyRegistration)
  end

  def drtUpdateKey(hKeyRegistration : Void*, pAppData : Win32cr::NetworkManagement::P2P::DRT_DATA*) : Win32cr::Foundation::HRESULT
    C.DrtUpdateKey(hKeyRegistration, pAppData)
  end

  def drtUnregisterKey(hKeyRegistration : Void*) : Void
    C.DrtUnregisterKey(hKeyRegistration)
  end

  def drtStartSearch(hDrt : Void*, pKey : Win32cr::NetworkManagement::P2P::DRT_DATA*, pInfo : Win32cr::NetworkManagement::P2P::DRT_SEARCH_INFO*, timeout : UInt32, hEvent : Win32cr::Foundation::HANDLE, pvContext : Void*, hSearchContext : Void**) : Win32cr::Foundation::HRESULT
    C.DrtStartSearch(hDrt, pKey, pInfo, timeout, hEvent, pvContext, hSearchContext)
  end

  def drtContinueSearch(hSearchContext : Void*) : Win32cr::Foundation::HRESULT
    C.DrtContinueSearch(hSearchContext)
  end

  def drtGetSearchResultSize(hSearchContext : Void*, pulSearchResultSize : UInt32*) : Win32cr::Foundation::HRESULT
    C.DrtGetSearchResultSize(hSearchContext, pulSearchResultSize)
  end

  def drtGetSearchResult(hSearchContext : Void*, ulSearchResultSize : UInt32, pSearchResult : Win32cr::NetworkManagement::P2P::DRT_SEARCH_RESULT*) : Win32cr::Foundation::HRESULT
    C.DrtGetSearchResult(hSearchContext, ulSearchResultSize, pSearchResult)
  end

  def drtGetSearchPathSize(hSearchContext : Void*, pulSearchPathSize : UInt32*) : Win32cr::Foundation::HRESULT
    C.DrtGetSearchPathSize(hSearchContext, pulSearchPathSize)
  end

  def drtGetSearchPath(hSearchContext : Void*, ulSearchPathSize : UInt32, pSearchPath : Win32cr::NetworkManagement::P2P::DRT_ADDRESS_LIST*) : Win32cr::Foundation::HRESULT
    C.DrtGetSearchPath(hSearchContext, ulSearchPathSize, pSearchPath)
  end

  def drtEndSearch(hSearchContext : Void*) : Win32cr::Foundation::HRESULT
    C.DrtEndSearch(hSearchContext)
  end

  def drtGetInstanceName(hDrt : Void*, ulcbInstanceNameSize : UInt32, pwzDrtInstanceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DrtGetInstanceName(hDrt, ulcbInstanceNameSize, pwzDrtInstanceName)
  end

  def drtGetInstanceNameSize(hDrt : Void*, pulcbInstanceNameSize : UInt32*) : Win32cr::Foundation::HRESULT
    C.DrtGetInstanceNameSize(hDrt, pulcbInstanceNameSize)
  end

  def peerDistStartup(dwVersionRequested : UInt32, phPeerDist : LibC::IntPtrT*, pdwSupportedVersion : UInt32*) : UInt32
    C.PeerDistStartup(dwVersionRequested, phPeerDist, pdwSupportedVersion)
  end

  def peerDistShutdown(hPeerDist : LibC::IntPtrT) : UInt32
    C.PeerDistShutdown(hPeerDist)
  end

  def peerDistGetStatus(hPeerDist : LibC::IntPtrT, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS*) : UInt32
    C.PeerDistGetStatus(hPeerDist, pPeerDistStatus)
  end

  def peerDistRegisterForStatusChangeNotification(hPeerDist : LibC::IntPtrT, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS*) : UInt32
    C.PeerDistRegisterForStatusChangeNotification(hPeerDist, hCompletionPort, ulCompletionKey, lpOverlapped, pPeerDistStatus)
  end

  def peerDistUnregisterForStatusChangeNotification(hPeerDist : LibC::IntPtrT) : UInt32
    C.PeerDistUnregisterForStatusChangeNotification(hPeerDist)
  end

  def peerDistServerPublishStream(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, cbContentLength : UInt64, pPublishOptions : Win32cr::NetworkManagement::P2P::PEERDIST_PUBLICATION_OPTIONS*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phStream : LibC::IntPtrT*) : UInt32
    C.PeerDistServerPublishStream(hPeerDist, cbContentIdentifier, pContentIdentifier, cbContentLength, pPublishOptions, hCompletionPort, ulCompletionKey, phStream)
  end

  def peerDistServerPublishAddToStream(hPeerDist : LibC::IntPtrT, hStream : LibC::IntPtrT, cbNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistServerPublishAddToStream(hPeerDist, hStream, cbNumberOfBytes, pBuffer, lpOverlapped)
  end

  def peerDistServerPublishCompleteStream(hPeerDist : LibC::IntPtrT, hStream : LibC::IntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistServerPublishCompleteStream(hPeerDist, hStream, lpOverlapped)
  end

  def peerDistServerCloseStreamHandle(hPeerDist : LibC::IntPtrT, hStream : LibC::IntPtrT) : UInt32
    C.PeerDistServerCloseStreamHandle(hPeerDist, hStream)
  end

  def peerDistServerUnpublish(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*) : UInt32
    C.PeerDistServerUnpublish(hPeerDist, cbContentIdentifier, pContentIdentifier)
  end

  def peerDistServerOpenContentInformation(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, ullContentOffset : UInt64, cbContentLength : UInt64, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phContentInfo : LibC::IntPtrT*) : UInt32
    C.PeerDistServerOpenContentInformation(hPeerDist, cbContentIdentifier, pContentIdentifier, ullContentOffset, cbContentLength, hCompletionPort, ulCompletionKey, phContentInfo)
  end

  def peerDistServerRetrieveContentInformation(hPeerDist : LibC::IntPtrT, hContentInfo : LibC::IntPtrT, cbMaxNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistServerRetrieveContentInformation(hPeerDist, hContentInfo, cbMaxNumberOfBytes, pBuffer, lpOverlapped)
  end

  def peerDistServerCloseContentInformation(hPeerDist : LibC::IntPtrT, hContentInfo : LibC::IntPtrT) : UInt32
    C.PeerDistServerCloseContentInformation(hPeerDist, hContentInfo)
  end

  def peerDistServerCancelAsyncOperation(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistServerCancelAsyncOperation(hPeerDist, cbContentIdentifier, pContentIdentifier, pOverlapped)
  end

  def peerDistClientOpenContent(hPeerDist : LibC::IntPtrT, pContentTag : Win32cr::NetworkManagement::P2P::PEERDIST_CONTENT_TAG*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phContentHandle : LibC::IntPtrT*) : UInt32
    C.PeerDistClientOpenContent(hPeerDist, pContentTag, hCompletionPort, ulCompletionKey, phContentHandle)
  end

  def peerDistClientCloseContent(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT) : UInt32
    C.PeerDistClientCloseContent(hPeerDist, hContentHandle)
  end

  def peerDistClientAddContentInformation(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistClientAddContentInformation(hPeerDist, hContentHandle, cbNumberOfBytes, pBuffer, lpOverlapped)
  end

  def peerDistClientCompleteContentInformation(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistClientCompleteContentInformation(hPeerDist, hContentHandle, lpOverlapped)
  end

  def peerDistClientAddData(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistClientAddData(hPeerDist, hContentHandle, cbNumberOfBytes, pBuffer, lpOverlapped)
  end

  def peerDistClientBlockRead(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbMaxNumberOfBytes : UInt32, pBuffer : UInt8*, dwTimeoutInMilliseconds : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistClientBlockRead(hPeerDist, hContentHandle, cbMaxNumberOfBytes, pBuffer, dwTimeoutInMilliseconds, lpOverlapped)
  end

  def peerDistClientStreamRead(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbMaxNumberOfBytes : UInt32, pBuffer : UInt8*, dwTimeoutInMilliseconds : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistClientStreamRead(hPeerDist, hContentHandle, cbMaxNumberOfBytes, pBuffer, dwTimeoutInMilliseconds, lpOverlapped)
  end

  def peerDistClientFlushContent(hPeerDist : LibC::IntPtrT, pContentTag : Win32cr::NetworkManagement::P2P::PEERDIST_CONTENT_TAG*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistClientFlushContent(hPeerDist, pContentTag, hCompletionPort, ulCompletionKey, lpOverlapped)
  end

  def peerDistClientCancelAsyncOperation(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32
    C.PeerDistClientCancelAsyncOperation(hPeerDist, hContentHandle, pOverlapped)
  end

  def peerDistGetStatusEx(hPeerDist : LibC::IntPtrT, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS_INFO*) : UInt32
    C.PeerDistGetStatusEx(hPeerDist, pPeerDistStatus)
  end

  def peerDistRegisterForStatusChangeNotificationEx(hPeerDist : LibC::IntPtrT, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS_INFO*) : UInt32
    C.PeerDistRegisterForStatusChangeNotificationEx(hPeerDist, hCompletionPort, ulCompletionKey, lpOverlapped, pPeerDistStatus)
  end

  def peerDistGetOverlappedResult(lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.PeerDistGetOverlappedResult(lpOverlapped, lpNumberOfBytesTransferred, bWait)
  end

  def peerDistServerOpenContentInformationEx(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, ullContentOffset : UInt64, cbContentLength : UInt64, pRetrievalOptions : Win32cr::NetworkManagement::P2P::PEERDIST_RETRIEVAL_OPTIONS*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phContentInfo : LibC::IntPtrT*) : UInt32
    C.PeerDistServerOpenContentInformationEx(hPeerDist, cbContentIdentifier, pContentIdentifier, ullContentOffset, cbContentLength, pRetrievalOptions, hCompletionPort, ulCompletionKey, phContentInfo)
  end

  def peerDistClientGetInformationByHandle(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, peer_dist_client_info_class : Win32cr::NetworkManagement::P2P::PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS, dwBufferSize : UInt32, lpInformation : Void*) : UInt32
    C.PeerDistClientGetInformationByHandle(hPeerDist, hContentHandle, peer_dist_client_info_class, dwBufferSize, lpInformation)
  end

  @[Link("p2pgraph")]
  @[Link("p2p")]
  @[Link("drtprov")]
  @[Link("drttransport")]
  @[Link("drt")]
  @[Link("peerdist")]
  lib C
    # :nodoc:
    fun PeerGraphStartup(wVersionRequested : UInt16, pVersionData : Win32cr::NetworkManagement::P2P::PEER_VERSION_DATA*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphShutdown : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphFreeData(pvData : Void*) : Void

    # :nodoc:
    fun PeerGraphGetItemCount(hPeerEnum : Void*, pCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphGetNextItem(hPeerEnum : Void*, pCount : UInt32*, pppvItems : Void***) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphEndEnumeration(hPeerEnum : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphCreate(pGraphProperties : Win32cr::NetworkManagement::P2P::PEER_GRAPH_PROPERTIES*, pwzDatabaseName : Win32cr::Foundation::PWSTR, pSecurityInterface : Win32cr::NetworkManagement::P2P::PEER_SECURITY_INTERFACE*, phGraph : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphOpen(pwzGraphId : Win32cr::Foundation::PWSTR, pwzPeerId : Win32cr::Foundation::PWSTR, pwzDatabaseName : Win32cr::Foundation::PWSTR, pSecurityInterface : Win32cr::NetworkManagement::P2P::PEER_SECURITY_INTERFACE*, cRecordTypeSyncPrecedence : UInt32, pRecordTypeSyncPrecedence : LibC::GUID*, phGraph : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphListen(hGraph : Void*, dwScope : UInt32, dwScopeId : UInt32, wPort : UInt16) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphConnect(hGraph : Void*, pwzPeerId : Win32cr::Foundation::PWSTR, pAddress : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, pullConnectionId : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphClose(hGraph : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphDelete(pwzGraphId : Win32cr::Foundation::PWSTR, pwzPeerId : Win32cr::Foundation::PWSTR, pwzDatabaseName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphGetStatus(hGraph : Void*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphGetProperties(hGraph : Void*, ppGraphProperties : Win32cr::NetworkManagement::P2P::PEER_GRAPH_PROPERTIES**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphSetProperties(hGraph : Void*, pGraphProperties : Win32cr::NetworkManagement::P2P::PEER_GRAPH_PROPERTIES*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphRegisterEvent(hGraph : Void*, hEvent : Win32cr::Foundation::HANDLE, cEventRegistrations : UInt32, pEventRegistrations : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_REGISTRATION*, phPeerEvent : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphUnregisterEvent(hPeerEvent : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphGetEventData(hPeerEvent : Void*, ppEventData : Win32cr::NetworkManagement::P2P::PEER_GRAPH_EVENT_DATA**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphGetRecord(hGraph : Void*, pRecordId : LibC::GUID*, ppRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphAddRecord(hGraph : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*, pRecordId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphUpdateRecord(hGraph : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphDeleteRecord(hGraph : Void*, pRecordId : LibC::GUID*, fLocal : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphEnumRecords(hGraph : Void*, pRecordType : LibC::GUID*, pwzPeerId : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphSearchRecords(hGraph : Void*, pwzCriteria : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphExportDatabase(hGraph : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphImportDatabase(hGraph : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphValidateDeferredRecords(hGraph : Void*, cRecordIds : UInt32, pRecordIds : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphOpenDirectConnection(hGraph : Void*, pwzPeerId : Win32cr::Foundation::PWSTR, pAddress : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, pullConnectionId : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphSendData(hGraph : Void*, ullConnectionId : UInt64, pType : LibC::GUID*, cbData : UInt32, pvData : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphCloseDirectConnection(hGraph : Void*, ullConnectionId : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphEnumConnections(hGraph : Void*, dwFlags : UInt32, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphEnumNodes(hGraph : Void*, pwzPeerId : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphSetPresence(hGraph : Void*, fPresent : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphGetNodeInfo(hGraph : Void*, ullNodeId : UInt64, ppNodeInfo : Win32cr::NetworkManagement::P2P::PEER_NODE_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphSetNodeAttributes(hGraph : Void*, pwzAttributes : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphPeerTimeToUniversalTime(hGraph : Void*, pftPeerTime : Win32cr::Foundation::FILETIME*, pftUniversalTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGraphUniversalTimeToPeerTime(hGraph : Void*, pftUniversalTime : Win32cr::Foundation::FILETIME*, pftPeerTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerFreeData(pvData : Void*) : Void

    # :nodoc:
    fun PeerGetItemCount(hPeerEnum : Void*, pCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGetNextItem(hPeerEnum : Void*, pCount : UInt32*, pppvItems : Void***) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerEndEnumeration(hPeerEnum : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupStartup(wVersionRequested : UInt16, pVersionData : Win32cr::NetworkManagement::P2P::PEER_VERSION_DATA*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupShutdown : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupCreate(pProperties : Win32cr::NetworkManagement::P2P::PEER_GROUP_PROPERTIES*, phGroup : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupOpen(pwzIdentity : Win32cr::Foundation::PWSTR, pwzGroupPeerName : Win32cr::Foundation::PWSTR, pwzCloud : Win32cr::Foundation::PWSTR, phGroup : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupJoin(pwzIdentity : Win32cr::Foundation::PWSTR, pwzInvitation : Win32cr::Foundation::PWSTR, pwzCloud : Win32cr::Foundation::PWSTR, phGroup : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupPasswordJoin(pwzIdentity : Win32cr::Foundation::PWSTR, pwzInvitation : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, pwzCloud : Win32cr::Foundation::PWSTR, phGroup : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupConnect(hGroup : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupConnectByAddress(hGroup : Void*, cAddresses : UInt32, pAddresses : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupClose(hGroup : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupDelete(pwzIdentity : Win32cr::Foundation::PWSTR, pwzGroupPeerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupCreateInvitation(hGroup : Void*, pwzIdentityInfo : Win32cr::Foundation::PWSTR, pftExpiration : Win32cr::Foundation::FILETIME*, cRoles : UInt32, pRoles : LibC::GUID*, ppwzInvitation : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupCreatePasswordInvitation(hGroup : Void*, ppwzInvitation : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupParseInvitation(pwzInvitation : Win32cr::Foundation::PWSTR, ppInvitationInfo : Win32cr::NetworkManagement::P2P::PEER_INVITATION_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupGetStatus(hGroup : Void*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupGetProperties(hGroup : Void*, ppProperties : Win32cr::NetworkManagement::P2P::PEER_GROUP_PROPERTIES**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupSetProperties(hGroup : Void*, pProperties : Win32cr::NetworkManagement::P2P::PEER_GROUP_PROPERTIES*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupEnumMembers(hGroup : Void*, dwFlags : UInt32, pwzIdentity : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupOpenDirectConnection(hGroup : Void*, pwzIdentity : Win32cr::Foundation::PWSTR, pAddress : Win32cr::NetworkManagement::P2P::PEER_ADDRESS*, pullConnectionId : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupCloseDirectConnection(hGroup : Void*, ullConnectionId : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupEnumConnections(hGroup : Void*, dwFlags : UInt32, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupSendData(hGroup : Void*, ullConnectionId : UInt64, pType : LibC::GUID*, cbData : UInt32, pvData : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupRegisterEvent(hGroup : Void*, hEvent : Win32cr::Foundation::HANDLE, cEventRegistration : UInt32, pEventRegistrations : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_REGISTRATION*, phPeerEvent : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupUnregisterEvent(hPeerEvent : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupGetEventData(hPeerEvent : Void*, ppEventData : Win32cr::NetworkManagement::P2P::PEER_GROUP_EVENT_DATA**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupGetRecord(hGroup : Void*, pRecordId : LibC::GUID*, ppRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupAddRecord(hGroup : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*, pRecordId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupUpdateRecord(hGroup : Void*, pRecord : Win32cr::NetworkManagement::P2P::PEER_RECORD*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupDeleteRecord(hGroup : Void*, pRecordId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupEnumRecords(hGroup : Void*, pRecordType : LibC::GUID*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupSearchRecords(hGroup : Void*, pwzCriteria : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupExportDatabase(hGroup : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupImportDatabase(hGroup : Void*, pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupIssueCredentials(hGroup : Void*, pwzSubjectIdentity : Win32cr::Foundation::PWSTR, pCredentialInfo : Win32cr::NetworkManagement::P2P::PEER_CREDENTIAL_INFO*, dwFlags : UInt32, ppwzInvitation : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupExportConfig(hGroup : Void*, pwzPassword : Win32cr::Foundation::PWSTR, ppwzXML : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupImportConfig(pwzXML : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, fOverwrite : Win32cr::Foundation::BOOL, ppwzIdentity : Win32cr::Foundation::PWSTR*, ppwzGroup : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupPeerTimeToUniversalTime(hGroup : Void*, pftPeerTime : Win32cr::Foundation::FILETIME*, pftUniversalTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupUniversalTimeToPeerTime(hGroup : Void*, pftUniversalTime : Win32cr::Foundation::FILETIME*, pftPeerTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerGroupResumePasswordAuthentication(hGroup : Void*, hPeerEventHandle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerIdentityCreate(pwzClassifier : Win32cr::Foundation::PWSTR, pwzFriendlyName : Win32cr::Foundation::PWSTR, hCryptProv : LibC::UIntPtrT, ppwzIdentity : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerIdentityGetFriendlyName(pwzIdentity : Win32cr::Foundation::PWSTR, ppwzFriendlyName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerIdentitySetFriendlyName(pwzIdentity : Win32cr::Foundation::PWSTR, pwzFriendlyName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerIdentityGetCryptKey(pwzIdentity : Win32cr::Foundation::PWSTR, phCryptProv : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerIdentityDelete(pwzIdentity : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerEnumIdentities(phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerEnumGroups(pwzIdentity : Win32cr::Foundation::PWSTR, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCreatePeerName(pwzIdentity : Win32cr::Foundation::PWSTR, pwzClassifier : Win32cr::Foundation::PWSTR, ppwzPeerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerIdentityGetXML(pwzIdentity : Win32cr::Foundation::PWSTR, ppwzIdentityXML : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerIdentityExport(pwzIdentity : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, ppwzExportXML : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerIdentityImport(pwzImportXML : Win32cr::Foundation::PWSTR, pwzPassword : Win32cr::Foundation::PWSTR, ppwzIdentity : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerIdentityGetDefault(ppwzPeerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabStartup(wVersionRequested : UInt16) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabShutdown : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabSignin(hwndParent : Win32cr::Foundation::HWND, dwSigninOptions : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabSignout(dwSigninOptions : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabGetSigninOptions(pdwSigninOptions : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabAsyncInviteContact(pcContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, hEvent : Win32cr::Foundation::HANDLE, phInvitation : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabGetInvitationResponse(hInvitation : Win32cr::Foundation::HANDLE, ppInvitationResponse : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabCancelInvitation(hInvitation : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabCloseHandle(hInvitation : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabInviteContact(pcContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, ppResponse : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabAsyncInviteEndpoint(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, hEvent : Win32cr::Foundation::HANDLE, phInvitation : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabInviteEndpoint(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pcInvitation : Win32cr::NetworkManagement::P2P::PEER_INVITATION*, ppResponse : Win32cr::NetworkManagement::P2P::PEER_INVITATION_RESPONSE**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabGetAppLaunchInfo(ppLaunchInfo : Win32cr::NetworkManagement::P2P::PEER_APP_LAUNCH_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabRegisterApplication(pcApplication : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_INFO*, registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabUnregisterApplication(pApplicationId : LibC::GUID*, registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabGetApplicationRegistrationInfo(pApplicationId : LibC::GUID*, registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE, ppApplication : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabEnumApplicationRegistrationInfo(registrationType : Win32cr::NetworkManagement::P2P::PEER_APPLICATION_REGISTRATION_TYPE, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabGetPresenceInfo(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, ppPresenceInfo : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabEnumApplications(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pApplicationId : LibC::GUID*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabEnumObjects(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, pObjectId : LibC::GUID*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabEnumEndpoints(pcContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*, phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabRefreshEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabDeleteEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabQueryContactData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*, ppwzContactData : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabSubscribeEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabUnsubscribeEndpointData(pcEndpoint : Win32cr::NetworkManagement::P2P::PEER_ENDPOINT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabSetPresenceInfo(pcPresenceInfo : Win32cr::NetworkManagement::P2P::PEER_PRESENCE_INFO*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabGetEndpointName(ppwzEndpointName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabSetEndpointName(pwzEndpointName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabSetObject(pcObject : Win32cr::NetworkManagement::P2P::PEER_OBJECT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabDeleteObject(pObjectId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabRegisterEvent(hEvent : Win32cr::Foundation::HANDLE, cEventRegistration : UInt32, pEventRegistrations : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_REGISTRATION*, phPeerEvent : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabGetEventData(hPeerEvent : Void*, ppEventData : Win32cr::NetworkManagement::P2P::PEER_COLLAB_EVENT_DATA**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabUnregisterEvent(hPeerEvent : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabEnumPeopleNearMe(phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabAddContact(pwzContactData : Win32cr::Foundation::PWSTR, ppContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabDeleteContact(pwzPeerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabGetContact(pwzPeerName : Win32cr::Foundation::PWSTR, ppContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabUpdateContact(pContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabEnumContacts(phPeerEnum : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabExportContact(pwzPeerName : Win32cr::Foundation::PWSTR, ppwzContactData : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerCollabParseContact(pwzContactData : Win32cr::Foundation::PWSTR, ppContact : Win32cr::NetworkManagement::P2P::PEER_CONTACT**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerNameToPeerHostName(pwzPeerName : Win32cr::Foundation::PWSTR, ppwzHostName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerHostNameToPeerName(pwzHostName : Win32cr::Foundation::PWSTR, ppwzPeerName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpStartup(wVersionRequested : UInt16) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpShutdown : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpRegister(pcwzPeerName : Win32cr::Foundation::PWSTR, pRegistrationInfo : Win32cr::NetworkManagement::P2P::PEER_PNRP_REGISTRATION_INFO*, phRegistration : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpUpdateRegistration(hRegistration : Void*, pRegistrationInfo : Win32cr::NetworkManagement::P2P::PEER_PNRP_REGISTRATION_INFO*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpUnregister(hRegistration : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpResolve(pcwzPeerName : Win32cr::Foundation::PWSTR, pcwzCloudName : Win32cr::Foundation::PWSTR, pcEndpoints : UInt32*, ppEndpoints : Win32cr::NetworkManagement::P2P::PEER_PNRP_ENDPOINT_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpStartResolve(pcwzPeerName : Win32cr::Foundation::PWSTR, pcwzCloudName : Win32cr::Foundation::PWSTR, cMaxEndpoints : UInt32, hEvent : Win32cr::Foundation::HANDLE, phResolve : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpGetCloudInfo(pcNumClouds : UInt32*, ppCloudInfo : Win32cr::NetworkManagement::P2P::PEER_PNRP_CLOUD_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpGetEndpoint(hResolve : Void*, ppEndpoint : Win32cr::NetworkManagement::P2P::PEER_PNRP_ENDPOINT_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerPnrpEndResolve(hResolve : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtCreatePnrpBootstrapResolver(fPublish : Win32cr::Foundation::BOOL, pwzPeerName : Win32cr::Foundation::PWSTR, pwzCloudName : Win32cr::Foundation::PWSTR, pwzPublishingIdentity : Win32cr::Foundation::PWSTR, ppResolver : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtDeletePnrpBootstrapResolver(pResolver : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER*) : Void

    # :nodoc:
    fun DrtCreateDnsBootstrapResolver(port : UInt16, pwszAddress : Win32cr::Foundation::PWSTR, ppModule : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtDeleteDnsBootstrapResolver(pResolver : Win32cr::NetworkManagement::P2P::DRT_BOOTSTRAP_PROVIDER*) : Void

    # :nodoc:
    fun DrtCreateIpv6UdpTransport(scope : Win32cr::NetworkManagement::P2P::DRT_SCOPE, dwScopeId : UInt32, dwLocalityThreshold : UInt32, pwPort : UInt16*, phTransport : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtDeleteIpv6UdpTransport(hTransport : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtCreateDerivedKeySecurityProvider(pRootCert : Win32cr::Security::Cryptography::CERT_CONTEXT*, pLocalCert : Win32cr::Security::Cryptography::CERT_CONTEXT*, ppSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtCreateDerivedKey(pLocalCert : Win32cr::Security::Cryptography::CERT_CONTEXT*, pKey : Win32cr::NetworkManagement::P2P::DRT_DATA*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtDeleteDerivedKeySecurityProvider(pSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER*) : Void

    # :nodoc:
    fun DrtCreateNullSecurityProvider(ppSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtDeleteNullSecurityProvider(pSecurityProvider : Win32cr::NetworkManagement::P2P::DRT_SECURITY_PROVIDER*) : Void

    # :nodoc:
    fun DrtOpen(pSettings : Win32cr::NetworkManagement::P2P::DRT_SETTINGS*, hEvent : Win32cr::Foundation::HANDLE, pvContext : Void*, phDrt : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtClose(hDrt : Void*) : Void

    # :nodoc:
    fun DrtGetEventDataSize(hDrt : Void*, pulEventDataLen : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtGetEventData(hDrt : Void*, ulEventDataLen : UInt32, pEventData : Win32cr::NetworkManagement::P2P::DRT_EVENT_DATA*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtRegisterKey(hDrt : Void*, pRegistration : Win32cr::NetworkManagement::P2P::DRT_REGISTRATION*, pvKeyContext : Void*, phKeyRegistration : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtUpdateKey(hKeyRegistration : Void*, pAppData : Win32cr::NetworkManagement::P2P::DRT_DATA*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtUnregisterKey(hKeyRegistration : Void*) : Void

    # :nodoc:
    fun DrtStartSearch(hDrt : Void*, pKey : Win32cr::NetworkManagement::P2P::DRT_DATA*, pInfo : Win32cr::NetworkManagement::P2P::DRT_SEARCH_INFO*, timeout : UInt32, hEvent : Win32cr::Foundation::HANDLE, pvContext : Void*, hSearchContext : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtContinueSearch(hSearchContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtGetSearchResultSize(hSearchContext : Void*, pulSearchResultSize : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtGetSearchResult(hSearchContext : Void*, ulSearchResultSize : UInt32, pSearchResult : Win32cr::NetworkManagement::P2P::DRT_SEARCH_RESULT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtGetSearchPathSize(hSearchContext : Void*, pulSearchPathSize : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtGetSearchPath(hSearchContext : Void*, ulSearchPathSize : UInt32, pSearchPath : Win32cr::NetworkManagement::P2P::DRT_ADDRESS_LIST*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtEndSearch(hSearchContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtGetInstanceName(hDrt : Void*, ulcbInstanceNameSize : UInt32, pwzDrtInstanceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DrtGetInstanceNameSize(hDrt : Void*, pulcbInstanceNameSize : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PeerDistStartup(dwVersionRequested : UInt32, phPeerDist : LibC::IntPtrT*, pdwSupportedVersion : UInt32*) : UInt32

    # :nodoc:
    fun PeerDistShutdown(hPeerDist : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun PeerDistGetStatus(hPeerDist : LibC::IntPtrT, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS*) : UInt32

    # :nodoc:
    fun PeerDistRegisterForStatusChangeNotification(hPeerDist : LibC::IntPtrT, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS*) : UInt32

    # :nodoc:
    fun PeerDistUnregisterForStatusChangeNotification(hPeerDist : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun PeerDistServerPublishStream(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, cbContentLength : UInt64, pPublishOptions : Win32cr::NetworkManagement::P2P::PEERDIST_PUBLICATION_OPTIONS*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phStream : LibC::IntPtrT*) : UInt32

    # :nodoc:
    fun PeerDistServerPublishAddToStream(hPeerDist : LibC::IntPtrT, hStream : LibC::IntPtrT, cbNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistServerPublishCompleteStream(hPeerDist : LibC::IntPtrT, hStream : LibC::IntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistServerCloseStreamHandle(hPeerDist : LibC::IntPtrT, hStream : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun PeerDistServerUnpublish(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*) : UInt32

    # :nodoc:
    fun PeerDistServerOpenContentInformation(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, ullContentOffset : UInt64, cbContentLength : UInt64, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phContentInfo : LibC::IntPtrT*) : UInt32

    # :nodoc:
    fun PeerDistServerRetrieveContentInformation(hPeerDist : LibC::IntPtrT, hContentInfo : LibC::IntPtrT, cbMaxNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistServerCloseContentInformation(hPeerDist : LibC::IntPtrT, hContentInfo : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun PeerDistServerCancelAsyncOperation(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistClientOpenContent(hPeerDist : LibC::IntPtrT, pContentTag : Win32cr::NetworkManagement::P2P::PEERDIST_CONTENT_TAG*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phContentHandle : LibC::IntPtrT*) : UInt32

    # :nodoc:
    fun PeerDistClientCloseContent(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun PeerDistClientAddContentInformation(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistClientCompleteContentInformation(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistClientAddData(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbNumberOfBytes : UInt32, pBuffer : UInt8*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistClientBlockRead(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbMaxNumberOfBytes : UInt32, pBuffer : UInt8*, dwTimeoutInMilliseconds : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistClientStreamRead(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, cbMaxNumberOfBytes : UInt32, pBuffer : UInt8*, dwTimeoutInMilliseconds : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistClientFlushContent(hPeerDist : LibC::IntPtrT, pContentTag : Win32cr::NetworkManagement::P2P::PEERDIST_CONTENT_TAG*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistClientCancelAsyncOperation(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, pOverlapped : Win32cr::System::IO::OVERLAPPED*) : UInt32

    # :nodoc:
    fun PeerDistGetStatusEx(hPeerDist : LibC::IntPtrT, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS_INFO*) : UInt32

    # :nodoc:
    fun PeerDistRegisterForStatusChangeNotificationEx(hPeerDist : LibC::IntPtrT, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, pPeerDistStatus : Win32cr::NetworkManagement::P2P::PEERDIST_STATUS_INFO*) : UInt32

    # :nodoc:
    fun PeerDistGetOverlappedResult(lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PeerDistServerOpenContentInformationEx(hPeerDist : LibC::IntPtrT, cbContentIdentifier : UInt32, pContentIdentifier : UInt8*, ullContentOffset : UInt64, cbContentLength : UInt64, pRetrievalOptions : Win32cr::NetworkManagement::P2P::PEERDIST_RETRIEVAL_OPTIONS*, hCompletionPort : Win32cr::Foundation::HANDLE, ulCompletionKey : LibC::UIntPtrT, phContentInfo : LibC::IntPtrT*) : UInt32

    # :nodoc:
    fun PeerDistClientGetInformationByHandle(hPeerDist : LibC::IntPtrT, hContentHandle : LibC::IntPtrT, peer_dist_client_info_class : Win32cr::NetworkManagement::P2P::PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS, dwBufferSize : UInt32, lpInformation : Void*) : UInt32

  end
end