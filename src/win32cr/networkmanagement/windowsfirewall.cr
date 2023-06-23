require "../system/com.cr"
require "../foundation.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  NETCON_MAX_NAME_LEN = 256_u32
  S_OBJECT_NO_LONGER_VALID = 2_i32
  NETISO_GEID_FOR_WDAG = 1_u32
  NETISO_GEID_FOR_NEUTRAL_AWARE = 2_u32
  CLSID_UPnPNAT = LibC::GUID.new(0xae1e00aa_u32, 0x3fd5_u16, 0x403c_u16, StaticArray[0x8a_u8, 0x27_u8, 0x2b_u8, 0xbd_u8, 0xc3_u8, 0xc_u8, 0xd0_u8, 0xe1_u8])
  CLSID_NetSharingManager = LibC::GUID.new(0x5c63c1ad_u32, 0x3956_u16, 0x4ff8_u16, StaticArray[0x84_u8, 0x86_u8, 0x40_u8, 0x3_u8, 0x47_u8, 0x58_u8, 0x31_u8, 0x5b_u8])
  CLSID_NetFwRule = LibC::GUID.new(0x2c5bc43e_u32, 0x3369_u16, 0x4c33_u16, StaticArray[0xab_u8, 0xc_u8, 0xbe_u8, 0x94_u8, 0x69_u8, 0x67_u8, 0x7a_u8, 0xf4_u8])
  CLSID_NetFwOpenPort = LibC::GUID.new(0xca545c6_u32, 0x37ad_u16, 0x4a6c_u16, StaticArray[0xbf_u8, 0x92_u8, 0x9f_u8, 0x76_u8, 0x10_u8, 0x6_u8, 0x7e_u8, 0xf5_u8])
  CLSID_NetFwAuthorizedApplication = LibC::GUID.new(0xec9846b3_u32, 0x2762_u16, 0x4a6b_u16, StaticArray[0xa2_u8, 0x14_u8, 0x6a_u8, 0xcb_u8, 0x60_u8, 0x34_u8, 0x62_u8, 0xd2_u8])
  CLSID_NetFwPolicy2 = LibC::GUID.new(0xe2b3c97f_u32, 0x6ae1_u16, 0x41ac_u16, StaticArray[0x81_u8, 0x7a_u8, 0xf6_u8, 0xf9_u8, 0x21_u8, 0x66_u8, 0xd7_u8, 0xdd_u8])
  CLSID_NetFwProduct = LibC::GUID.new(0x9d745ed8_u32, 0xc514_u16, 0x4d1d_u16, StaticArray[0xbf_u8, 0x42_u8, 0x75_u8, 0x1f_u8, 0xed_u8, 0x2d_u8, 0x5a_u8, 0xc7_u8])
  CLSID_NetFwProducts = LibC::GUID.new(0xcc19079b_u32, 0x8272_u16, 0x4d73_u16, StaticArray[0xbb_u8, 0x70_u8, 0xcd_u8, 0xb5_u8, 0x33_u8, 0x52_u8, 0x7b_u8, 0x61_u8])
  CLSID_NetFwMgr = LibC::GUID.new(0x304ce942_u32, 0x6e39_u16, 0x40d8_u16, StaticArray[0x94_u8, 0x3a_u8, 0xb9_u8, 0x13_u8, 0xc4_u8, 0xc_u8, 0x9c_u8, 0xd4_u8])

  alias PAC_CHANGES_CALLBACK_FN = Proc(Void*, INET_FIREWALL_AC_CHANGE*, Void)
  alias PNETISO_EDP_ID_CALLBACK_FN = Proc(Void*, LibC::LPWSTR, UInt32, Void)
  alias PFN_FWADDDYNAMICKEYWORDADDRESS0 = Proc(Tag_fw_dynamic_keyword_address0*, UInt32)
  alias PFN_FWDELETEDYNAMICKEYWORDADDRESS0 = Proc(Guid, UInt32)
  alias PFN_FWENUMDYNAMICKEYWORDADDRESSESBYTYPE0 = Proc(UInt32, Tag_fw_dynamic_keyword_address_data0**, UInt32)
  alias PFN_FWENUMDYNAMICKEYWORDADDRESSBYID0 = Proc(Guid, Tag_fw_dynamic_keyword_address_data0**, UInt32)
  alias PFN_FWFREEDYNAMICKEYWORDADDRESSDATA0 = Proc(Tag_fw_dynamic_keyword_address_data0*, UInt32)
  alias PFN_FWUPDATEDYNAMICKEYWORDADDRESS0 = Proc(Guid, LibC::LPWSTR, LibC::BOOL, UInt32)


  enum NETCON_CHARACTERISTIC_FLAGS : Int32
    NCCF_NONE = 0
    NCCF_ALL_USERS = 1
    NCCF_ALLOW_DUPLICATION = 2
    NCCF_ALLOW_REMOVAL = 4
    NCCF_ALLOW_RENAME = 8
    NCCF_INCOMING_ONLY = 32
    NCCF_OUTGOING_ONLY = 64
    NCCF_BRANDED = 128
    NCCF_SHARED = 256
    NCCF_BRIDGED = 512
    NCCF_FIREWALLED = 1024
    NCCF_DEFAULT = 2048
    NCCF_HOMENET_CAPABLE = 4096
    NCCF_SHARED_PRIVATE = 8192
    NCCF_QUARANTINED = 16384
    NCCF_RESERVED = 32768
    NCCF_HOSTED_NETWORK = 65536
    NCCF_VIRTUAL_STATION = 131072
    NCCF_WIFI_DIRECT = 262144
    NCCF_BLUETOOTH_MASK = 983040
    NCCF_LAN_MASK = 15728640
  end

  enum NETCON_STATUS : Int32
    NCS_DISCONNECTED = 0
    NCS_CONNECTING = 1
    NCS_CONNECTED = 2
    NCS_DISCONNECTING = 3
    NCS_HARDWARE_NOT_PRESENT = 4
    NCS_HARDWARE_DISABLED = 5
    NCS_HARDWARE_MALFUNCTION = 6
    NCS_MEDIA_DISCONNECTED = 7
    NCS_AUTHENTICATING = 8
    NCS_AUTHENTICATION_SUCCEEDED = 9
    NCS_AUTHENTICATION_FAILED = 10
    NCS_INVALID_ADDRESS = 11
    NCS_CREDENTIALS_REQUIRED = 12
    NCS_ACTION_REQUIRED = 13
    NCS_ACTION_REQUIRED_RETRY = 14
    NCS_CONNECT_FAILED = 15
  end

  enum NETCON_TYPE : Int32
    NCT_DIRECT_CONNECT = 0
    NCT_INBOUND = 1
    NCT_INTERNET = 2
    NCT_LAN = 3
    NCT_PHONE = 4
    NCT_TUNNEL = 5
    NCT_BRIDGE = 6
  end

  enum NETCON_MEDIATYPE : Int32
    NCM_NONE = 0
    NCM_DIRECT = 1
    NCM_ISDN = 2
    NCM_LAN = 3
    NCM_PHONE = 4
    NCM_TUNNEL = 5
    NCM_PPPOE = 6
    NCM_BRIDGE = 7
    NCM_SHAREDACCESSHOST_LAN = 8
    NCM_SHAREDACCESSHOST_RAS = 9
  end

  enum NETCONMGR_ENUM_FLAGS : Int32
    NCME_DEFAULT = 0
    NCME_HIDDEN = 1
  end

  enum NETCONUI_CONNECT_FLAGS : Int32
    NCUC_DEFAULT = 0
    NCUC_NO_UI = 1
    NCUC_ENABLE_DISABLE = 2
  end

  enum SHARINGCONNECTIONTYPE : Int32
    ICSSHARINGTYPE_PUBLIC = 0
    ICSSHARINGTYPE_PRIVATE = 1
  end

  enum SHARINGCONNECTION_ENUM_FLAGS : Int32
    ICSSC_DEFAULT = 0
    ICSSC_ENABLED = 1
  end

  enum ICS_TARGETTYPE : Int32
    ICSTT_NAME = 0
    ICSTT_IPADDRESS = 1
  end

  enum NET_FW_POLICY_TYPE : Int32
    NET_FW_POLICY_GROUP = 0
    NET_FW_POLICY_LOCAL = 1
    NET_FW_POLICY_EFFECTIVE = 2
    NET_FW_POLICY_TYPE_MAX = 3
  end

  enum NET_FW_PROFILE_TYPE : Int32
    NET_FW_PROFILE_DOMAIN = 0
    NET_FW_PROFILE_STANDARD = 1
    NET_FW_PROFILE_CURRENT = 2
    NET_FW_PROFILE_TYPE_MAX = 3
  end

  enum NET_FW_PROFILE_TYPE2 : Int32
    NET_FW_PROFILE2_DOMAIN = 1
    NET_FW_PROFILE2_PRIVATE = 2
    NET_FW_PROFILE2_PUBLIC = 4
    NET_FW_PROFILE2_ALL = 2147483647
  end

  enum NET_FW_IP_VERSION : Int32
    NET_FW_IP_VERSION_V4 = 0
    NET_FW_IP_VERSION_V6 = 1
    NET_FW_IP_VERSION_ANY = 2
    NET_FW_IP_VERSION_MAX = 3
  end

  enum NET_FW_SCOPE : Int32
    NET_FW_SCOPE_ALL = 0
    NET_FW_SCOPE_LOCAL_SUBNET = 1
    NET_FW_SCOPE_CUSTOM = 2
    NET_FW_SCOPE_MAX = 3
  end

  enum NET_FW_IP_PROTOCOL : Int32
    NET_FW_IP_PROTOCOL_TCP = 6
    NET_FW_IP_PROTOCOL_UDP = 17
    NET_FW_IP_PROTOCOL_ANY = 256
  end

  enum NET_FW_SERVICE_TYPE : Int32
    NET_FW_SERVICE_FILE_AND_PRINT = 0
    NET_FW_SERVICE_UPNP = 1
    NET_FW_SERVICE_REMOTE_DESKTOP = 2
    NET_FW_SERVICE_NONE = 3
    NET_FW_SERVICE_TYPE_MAX = 4
  end

  enum NET_FW_RULE_DIRECTION : Int32
    NET_FW_RULE_DIR_IN = 1
    NET_FW_RULE_DIR_OUT = 2
    NET_FW_RULE_DIR_MAX = 3
  end

  enum NET_FW_ACTION : Int32
    NET_FW_ACTION_BLOCK = 0
    NET_FW_ACTION_ALLOW = 1
    NET_FW_ACTION_MAX = 2
  end

  enum NET_FW_MODIFY_STATE : Int32
    NET_FW_MODIFY_STATE_OK = 0
    NET_FW_MODIFY_STATE_GP_OVERRIDE = 1
    NET_FW_MODIFY_STATE_INBOUND_BLOCKED = 2
  end

  enum NET_FW_RULE_CATEGORY : Int32
    NET_FW_RULE_CATEGORY_BOOT = 0
    NET_FW_RULE_CATEGORY_STEALTH = 1
    NET_FW_RULE_CATEGORY_FIREWALL = 2
    NET_FW_RULE_CATEGORY_CONSEC = 3
    NET_FW_RULE_CATEGORY_MAX = 4
  end

  enum NET_FW_EDGE_TRAVERSAL_TYPE : Int32
    NET_FW_EDGE_TRAVERSAL_TYPE_DENY = 0
    NET_FW_EDGE_TRAVERSAL_TYPE_ALLOW = 1
    NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_APP = 2
    NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_USER = 3
  end

  enum NET_FW_AUTHENTICATE_TYPE : Int32
    NET_FW_AUTHENTICATE_NONE = 0
    NET_FW_AUTHENTICATE_NO_ENCAPSULATION = 1
    NET_FW_AUTHENTICATE_WITH_INTEGRITY = 2
    NET_FW_AUTHENTICATE_AND_NEGOTIATE_ENCRYPTION = 3
    NET_FW_AUTHENTICATE_AND_ENCRYPT = 4
  end

  enum NETISO_FLAG : Int32
    NETISO_FLAG_FORCE_COMPUTE_BINARIES = 1
    NETISO_FLAG_MAX = 2
  end

  enum INET_FIREWALL_AC_CREATION_TYPE : Int32
    INET_FIREWALL_AC_NONE = 0
    INET_FIREWALL_AC_PACKAGE_ID_ONLY = 1
    INET_FIREWALL_AC_BINARY = 2
    INET_FIREWALL_AC_MAX = 4
  end

  enum INET_FIREWALL_AC_CHANGE_TYPE : Int32
    INET_FIREWALL_AC_CHANGE_INVALID = 0
    INET_FIREWALL_AC_CHANGE_CREATE = 1
    INET_FIREWALL_AC_CHANGE_DELETE = 2
    INET_FIREWALL_AC_CHANGE_MAX = 3
  end

  enum NETISO_ERROR_TYPE : Int32
    NETISO_ERROR_TYPE_NONE = 0
    NETISO_ERROR_TYPE_PRIVATE_NETWORK = 1
    NETISO_ERROR_TYPE_INTERNET_CLIENT = 2
    NETISO_ERROR_TYPE_INTERNET_CLIENT_SERVER = 3
    NETISO_ERROR_TYPE_MAX = 4
  end

  enum Tag_fw_dynamic_keyword_origin_type : Int32
    FW_DYNAMIC_KEYWORD_ORIGIN_INVALID = 0
    FW_DYNAMIC_KEYWORD_ORIGIN_LOCAL = 1
    FW_DYNAMIC_KEYWORD_ORIGIN_MDM = 2
  end

  enum Tag_fw_dynamic_keyword_address_flags : Int32
    FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE = 1
  end

  enum Tag_fw_dynamic_keyword_address_enum_flags : Int32
    FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_AUTO_RESOLVE = 1
    FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_NON_AUTO_RESOLVE = 2
    FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_ALL = 3
  end

  union INET_FIREWALL_AC_CHANGE_Anonymous_e__Union
    capabilities : INET_FIREWALL_AC_CAPABILITIES
    binaries : INET_FIREWALL_AC_BINARIES
  end

  struct NETCON_PROPERTIES
    guid_id : Guid
    pszw_name : LibC::LPWSTR
    pszw_device_name : LibC::LPWSTR
    status : NETCON_STATUS
    media_type : NETCON_MEDIATYPE
    dw_character : UInt32
    clsid_this_object : Guid
    clsid_ui_object : Guid
  end
  struct INET_FIREWALL_AC_CAPABILITIES
    count : UInt32
    capabilities : SID_AND_ATTRIBUTES*
  end
  struct INET_FIREWALL_AC_BINARIES
    count : UInt32
    binaries : LibC::LPWSTR*
  end
  struct INET_FIREWALL_AC_CHANGE
    change_type : INET_FIREWALL_AC_CHANGE_TYPE
    create_type : INET_FIREWALL_AC_CREATION_TYPE
    app_container_sid : SID*
    user_sid : SID*
    display_name : LibC::LPWSTR
    anonymous : INET_FIREWALL_AC_CHANGE_Anonymous_e__Union
  end
  struct INET_FIREWALL_APP_CONTAINER
    app_container_sid : SID*
    user_sid : SID*
    app_container_name : LibC::LPWSTR
    display_name : LibC::LPWSTR
    description : LibC::LPWSTR
    capabilities : INET_FIREWALL_AC_CAPABILITIES
    binaries : INET_FIREWALL_AC_BINARIES
    working_directory : LibC::LPWSTR
    package_full_name : LibC::LPWSTR
  end
  struct Tag_fw_dynamic_keyword_address0
    id : Guid
    keyword : LibC::LPWSTR
    flags : UInt32
    addresses : LibC::LPWSTR
  end
  struct Tag_fw_dynamic_keyword_address_data0
    dynamic_keyword_address : Tag_fw_dynamic_keyword_address0
    next : Tag_fw_dynamic_keyword_address_data0*
    schema_version : UInt16
    origin_type : Tag_fw_dynamic_keyword_origin_type
  end


  struct IUPnPNATVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_static_port_mapping_collection : UInt64
    get_dynamic_port_mapping_collection : UInt64
    get_nat_event_manager : UInt64
  end

  IUPnPNAT_GUID = "b171c812-cc76-485a-94d8-b6b3a2794e99"
  IID_IUPnPNAT = LibC::GUID.new(0xb171c812_u32, 0xcc76_u16, 0x485a_u16, StaticArray[0x94_u8, 0xd8_u8, 0xb6_u8, 0xb3_u8, 0xa2_u8, 0x79_u8, 0x4e_u8, 0x99_u8])
  struct IUPnPNAT
    lpVtbl : IUPnPNATVTbl*
  end

  struct INATEventManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    put_external_ip_address_callback : UInt64
    put_number_of_entries_callback : UInt64
  end

  INATEventManager_GUID = "624bd588-9060-4109-b0b0-1adbbcac32df"
  IID_INATEventManager = LibC::GUID.new(0x624bd588_u32, 0x9060_u16, 0x4109_u16, StaticArray[0xb0_u8, 0xb0_u8, 0x1a_u8, 0xdb_u8, 0xbc_u8, 0xac_u8, 0x32_u8, 0xdf_u8])
  struct INATEventManager
    lpVtbl : INATEventManagerVTbl*
  end

  struct INATExternalIPAddressCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    new_external_ip_address : UInt64
  end

  INATExternalIPAddressCallback_GUID = "9c416740-a34e-446f-ba06-abd04c3149ae"
  IID_INATExternalIPAddressCallback = LibC::GUID.new(0x9c416740_u32, 0xa34e_u16, 0x446f_u16, StaticArray[0xba_u8, 0x6_u8, 0xab_u8, 0xd0_u8, 0x4c_u8, 0x31_u8, 0x49_u8, 0xae_u8])
  struct INATExternalIPAddressCallback
    lpVtbl : INATExternalIPAddressCallbackVTbl*
  end

  struct INATNumberOfEntriesCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    new_number_of_entries : UInt64
  end

  INATNumberOfEntriesCallback_GUID = "c83a0a74-91ee-41b6-b67a-67e0f00bbd78"
  IID_INATNumberOfEntriesCallback = LibC::GUID.new(0xc83a0a74_u32, 0x91ee_u16, 0x41b6_u16, StaticArray[0xb6_u8, 0x7a_u8, 0x67_u8, 0xe0_u8, 0xf0_u8, 0xb_u8, 0xbd_u8, 0x78_u8])
  struct INATNumberOfEntriesCallback
    lpVtbl : INATNumberOfEntriesCallbackVTbl*
  end

  struct IDynamicPortMappingCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
    remove : UInt64
    add : UInt64
  end

  IDynamicPortMappingCollection_GUID = "b60de00f-156e-4e8d-9ec1-3a2342c10899"
  IID_IDynamicPortMappingCollection = LibC::GUID.new(0xb60de00f_u32, 0x156e_u16, 0x4e8d_u16, StaticArray[0x9e_u8, 0xc1_u8, 0x3a_u8, 0x23_u8, 0x42_u8, 0xc1_u8, 0x8_u8, 0x99_u8])
  struct IDynamicPortMappingCollection
    lpVtbl : IDynamicPortMappingCollectionVTbl*
  end

  struct IDynamicPortMappingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_external_ip_address : UInt64
    get_remote_host : UInt64
    get_external_port : UInt64
    get_protocol : UInt64
    get_internal_port : UInt64
    get_internal_client : UInt64
    get_enabled : UInt64
    get_description : UInt64
    get_lease_duration : UInt64
    renew_lease : UInt64
    edit_internal_client : UInt64
    enable : UInt64
    edit_description : UInt64
    edit_internal_port : UInt64
  end

  IDynamicPortMapping_GUID = "4fc80282-23b6-4378-9a27-cd8f17c9400c"
  IID_IDynamicPortMapping = LibC::GUID.new(0x4fc80282_u32, 0x23b6_u16, 0x4378_u16, StaticArray[0x9a_u8, 0x27_u8, 0xcd_u8, 0x8f_u8, 0x17_u8, 0xc9_u8, 0x40_u8, 0xc_u8])
  struct IDynamicPortMapping
    lpVtbl : IDynamicPortMappingVTbl*
  end

  struct IStaticPortMappingCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
    remove : UInt64
    add : UInt64
  end

  IStaticPortMappingCollection_GUID = "cd1f3e77-66d6-4664-82c7-36dbb641d0f1"
  IID_IStaticPortMappingCollection = LibC::GUID.new(0xcd1f3e77_u32, 0x66d6_u16, 0x4664_u16, StaticArray[0x82_u8, 0xc7_u8, 0x36_u8, 0xdb_u8, 0xb6_u8, 0x41_u8, 0xd0_u8, 0xf1_u8])
  struct IStaticPortMappingCollection
    lpVtbl : IStaticPortMappingCollectionVTbl*
  end

  struct IStaticPortMappingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_external_ip_address : UInt64
    get_external_port : UInt64
    get_internal_port : UInt64
    get_protocol : UInt64
    get_internal_client : UInt64
    get_enabled : UInt64
    get_description : UInt64
    edit_internal_client : UInt64
    enable : UInt64
    edit_description : UInt64
    edit_internal_port : UInt64
  end

  IStaticPortMapping_GUID = "6f10711f-729b-41e5-93b8-f21d0f818df1"
  IID_IStaticPortMapping = LibC::GUID.new(0x6f10711f_u32, 0x729b_u16, 0x41e5_u16, StaticArray[0x93_u8, 0xb8_u8, 0xf2_u8, 0x1d_u8, 0xf_u8, 0x81_u8, 0x8d_u8, 0xf1_u8])
  struct IStaticPortMapping
    lpVtbl : IStaticPortMappingVTbl*
  end

  struct IEnumNetConnectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumNetConnection_GUID = "c08956a0-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetConnection = LibC::GUID.new(0xc08956a0_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct IEnumNetConnection
    lpVtbl : IEnumNetConnectionVTbl*
  end

  struct INetConnectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    connect : UInt64
    disconnect : UInt64
    delete : UInt64
    duplicate : UInt64
    get_properties : UInt64
    get_ui_object_class_id : UInt64
    rename : UInt64
  end

  INetConnection_GUID = "c08956a1-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetConnection = LibC::GUID.new(0xc08956a1_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetConnection
    lpVtbl : INetConnectionVTbl*
  end

  struct INetConnectionManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enum_connections : UInt64
  end

  INetConnectionManager_GUID = "c08956a2-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetConnectionManager = LibC::GUID.new(0xc08956a2_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetConnectionManager
    lpVtbl : INetConnectionManagerVTbl*
  end

  struct INetConnectionConnectUiVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_connection : UInt64
    connect : UInt64
    disconnect : UInt64
  end

  INetConnectionConnectUi_GUID = "c08956a3-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetConnectionConnectUi = LibC::GUID.new(0xc08956a3_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetConnectionConnectUi
    lpVtbl : INetConnectionConnectUiVTbl*
  end

  struct IEnumNetSharingPortMappingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumNetSharingPortMapping_GUID = "c08956b0-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetSharingPortMapping = LibC::GUID.new(0xc08956b0_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct IEnumNetSharingPortMapping
    lpVtbl : IEnumNetSharingPortMappingVTbl*
  end

  struct INetSharingPortMappingPropsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_ip_protocol : UInt64
    get_external_port : UInt64
    get_internal_port : UInt64
    get_options : UInt64
    get_target_name : UInt64
    get_target_ip_address : UInt64
    get_enabled : UInt64
  end

  INetSharingPortMappingProps_GUID = "24b7e9b5-e38f-4685-851b-00892cf5f940"
  IID_INetSharingPortMappingProps = LibC::GUID.new(0x24b7e9b5_u32, 0xe38f_u16, 0x4685_u16, StaticArray[0x85_u8, 0x1b_u8, 0x0_u8, 0x89_u8, 0x2c_u8, 0xf5_u8, 0xf9_u8, 0x40_u8])
  struct INetSharingPortMappingProps
    lpVtbl : INetSharingPortMappingPropsVTbl*
  end

  struct INetSharingPortMappingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    disable : UInt64
    enable : UInt64
    get_properties : UInt64
    delete : UInt64
  end

  INetSharingPortMapping_GUID = "c08956b1-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetSharingPortMapping = LibC::GUID.new(0xc08956b1_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetSharingPortMapping
    lpVtbl : INetSharingPortMappingVTbl*
  end

  struct IEnumNetSharingEveryConnectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumNetSharingEveryConnection_GUID = "c08956b8-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetSharingEveryConnection = LibC::GUID.new(0xc08956b8_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct IEnumNetSharingEveryConnection
    lpVtbl : IEnumNetSharingEveryConnectionVTbl*
  end

  struct IEnumNetSharingPublicConnectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumNetSharingPublicConnection_GUID = "c08956b4-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetSharingPublicConnection = LibC::GUID.new(0xc08956b4_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct IEnumNetSharingPublicConnection
    lpVtbl : IEnumNetSharingPublicConnectionVTbl*
  end

  struct IEnumNetSharingPrivateConnectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumNetSharingPrivateConnection_GUID = "c08956b5-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetSharingPrivateConnection = LibC::GUID.new(0xc08956b5_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct IEnumNetSharingPrivateConnection
    lpVtbl : IEnumNetSharingPrivateConnectionVTbl*
  end

  struct INetSharingPortMappingCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  INetSharingPortMappingCollection_GUID = "02e4a2de-da20-4e34-89c8-ac22275a010b"
  IID_INetSharingPortMappingCollection = LibC::GUID.new(0x2e4a2de_u32, 0xda20_u16, 0x4e34_u16, StaticArray[0x89_u8, 0xc8_u8, 0xac_u8, 0x22_u8, 0x27_u8, 0x5a_u8, 0x1_u8, 0xb_u8])
  struct INetSharingPortMappingCollection
    lpVtbl : INetSharingPortMappingCollectionVTbl*
  end

  struct INetConnectionPropsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_guid : UInt64
    get_name : UInt64
    get_device_name : UInt64
    get_status : UInt64
    get_media_type : UInt64
    get_characteristics : UInt64
  end

  INetConnectionProps_GUID = "f4277c95-ce5b-463d-8167-5662d9bcaa72"
  IID_INetConnectionProps = LibC::GUID.new(0xf4277c95_u32, 0xce5b_u16, 0x463d_u16, StaticArray[0x81_u8, 0x67_u8, 0x56_u8, 0x62_u8, 0xd9_u8, 0xbc_u8, 0xaa_u8, 0x72_u8])
  struct INetConnectionProps
    lpVtbl : INetConnectionPropsVTbl*
  end

  struct INetSharingConfigurationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_sharing_enabled : UInt64
    get_sharing_connection_type : UInt64
    disable_sharing : UInt64
    enable_sharing : UInt64
    get_internet_firewall_enabled : UInt64
    disable_internet_firewall : UInt64
    enable_internet_firewall : UInt64
    get_enum_port_mappings : UInt64
    add_port_mapping : UInt64
    remove_port_mapping : UInt64
  end

  INetSharingConfiguration_GUID = "c08956b6-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetSharingConfiguration = LibC::GUID.new(0xc08956b6_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetSharingConfiguration
    lpVtbl : INetSharingConfigurationVTbl*
  end

  struct INetSharingEveryConnectionCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  INetSharingEveryConnectionCollection_GUID = "33c4643c-7811-46fa-a89a-768597bd7223"
  IID_INetSharingEveryConnectionCollection = LibC::GUID.new(0x33c4643c_u32, 0x7811_u16, 0x46fa_u16, StaticArray[0xa8_u8, 0x9a_u8, 0x76_u8, 0x85_u8, 0x97_u8, 0xbd_u8, 0x72_u8, 0x23_u8])
  struct INetSharingEveryConnectionCollection
    lpVtbl : INetSharingEveryConnectionCollectionVTbl*
  end

  struct INetSharingPublicConnectionCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  INetSharingPublicConnectionCollection_GUID = "7d7a6355-f372-4971-a149-bfc927be762a"
  IID_INetSharingPublicConnectionCollection = LibC::GUID.new(0x7d7a6355_u32, 0xf372_u16, 0x4971_u16, StaticArray[0xa1_u8, 0x49_u8, 0xbf_u8, 0xc9_u8, 0x27_u8, 0xbe_u8, 0x76_u8, 0x2a_u8])
  struct INetSharingPublicConnectionCollection
    lpVtbl : INetSharingPublicConnectionCollectionVTbl*
  end

  struct INetSharingPrivateConnectionCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  INetSharingPrivateConnectionCollection_GUID = "38ae69e0-4409-402a-a2cb-e965c727f840"
  IID_INetSharingPrivateConnectionCollection = LibC::GUID.new(0x38ae69e0_u32, 0x4409_u16, 0x402a_u16, StaticArray[0xa2_u8, 0xcb_u8, 0xe9_u8, 0x65_u8, 0xc7_u8, 0x27_u8, 0xf8_u8, 0x40_u8])
  struct INetSharingPrivateConnectionCollection
    lpVtbl : INetSharingPrivateConnectionCollectionVTbl*
  end

  struct INetSharingManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_sharing_installed : UInt64
    get_enum_public_connections : UInt64
    get_enum_private_connections : UInt64
    get_i_net_sharing_configuration_for_i_net_connection : UInt64
    get_enum_every_connection : UInt64
    get_net_connection_props : UInt64
  end

  INetSharingManager_GUID = "c08956b7-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetSharingManager = LibC::GUID.new(0xc08956b7_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetSharingManager
    lpVtbl : INetSharingManagerVTbl*
  end

  struct INetFwRemoteAdminSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_ip_version : UInt64
    put_ip_version : UInt64
    get_scope : UInt64
    put_scope : UInt64
    get_remote_addresses : UInt64
    put_remote_addresses : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
  end

  INetFwRemoteAdminSettings_GUID = "d4becddf-6f73-4a83-b832-9c66874cd20e"
  IID_INetFwRemoteAdminSettings = LibC::GUID.new(0xd4becddf_u32, 0x6f73_u16, 0x4a83_u16, StaticArray[0xb8_u8, 0x32_u8, 0x9c_u8, 0x66_u8, 0x87_u8, 0x4c_u8, 0xd2_u8, 0xe_u8])
  struct INetFwRemoteAdminSettings
    lpVtbl : INetFwRemoteAdminSettingsVTbl*
  end

  struct INetFwIcmpSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_allow_outbound_destination_unreachable : UInt64
    put_allow_outbound_destination_unreachable : UInt64
    get_allow_redirect : UInt64
    put_allow_redirect : UInt64
    get_allow_inbound_echo_request : UInt64
    put_allow_inbound_echo_request : UInt64
    get_allow_outbound_time_exceeded : UInt64
    put_allow_outbound_time_exceeded : UInt64
    get_allow_outbound_parameter_problem : UInt64
    put_allow_outbound_parameter_problem : UInt64
    get_allow_outbound_source_quench : UInt64
    put_allow_outbound_source_quench : UInt64
    get_allow_inbound_router_request : UInt64
    put_allow_inbound_router_request : UInt64
    get_allow_inbound_timestamp_request : UInt64
    put_allow_inbound_timestamp_request : UInt64
    get_allow_inbound_mask_request : UInt64
    put_allow_inbound_mask_request : UInt64
    get_allow_outbound_packet_too_big : UInt64
    put_allow_outbound_packet_too_big : UInt64
  end

  INetFwIcmpSettings_GUID = "a6207b2e-7cdd-426a-951e-5e1cbc5afead"
  IID_INetFwIcmpSettings = LibC::GUID.new(0xa6207b2e_u32, 0x7cdd_u16, 0x426a_u16, StaticArray[0x95_u8, 0x1e_u8, 0x5e_u8, 0x1c_u8, 0xbc_u8, 0x5a_u8, 0xfe_u8, 0xad_u8])
  struct INetFwIcmpSettings
    lpVtbl : INetFwIcmpSettingsVTbl*
  end

  struct INetFwOpenPortVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    put_name : UInt64
    get_ip_version : UInt64
    put_ip_version : UInt64
    get_protocol : UInt64
    put_protocol : UInt64
    get_port : UInt64
    put_port : UInt64
    get_scope : UInt64
    put_scope : UInt64
    get_remote_addresses : UInt64
    put_remote_addresses : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_built_in : UInt64
  end

  INetFwOpenPort_GUID = "e0483ba0-47ff-4d9c-a6d6-7741d0b195f7"
  IID_INetFwOpenPort = LibC::GUID.new(0xe0483ba0_u32, 0x47ff_u16, 0x4d9c_u16, StaticArray[0xa6_u8, 0xd6_u8, 0x77_u8, 0x41_u8, 0xd0_u8, 0xb1_u8, 0x95_u8, 0xf7_u8])
  struct INetFwOpenPort
    lpVtbl : INetFwOpenPortVTbl*
  end

  struct INetFwOpenPortsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    add : UInt64
    remove : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  INetFwOpenPorts_GUID = "c0e9d7fa-e07e-430a-b19a-090ce82d92e2"
  IID_INetFwOpenPorts = LibC::GUID.new(0xc0e9d7fa_u32, 0xe07e_u16, 0x430a_u16, StaticArray[0xb1_u8, 0x9a_u8, 0x9_u8, 0xc_u8, 0xe8_u8, 0x2d_u8, 0x92_u8, 0xe2_u8])
  struct INetFwOpenPorts
    lpVtbl : INetFwOpenPortsVTbl*
  end

  struct INetFwServiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_type : UInt64
    get_customized : UInt64
    get_ip_version : UInt64
    put_ip_version : UInt64
    get_scope : UInt64
    put_scope : UInt64
    get_remote_addresses : UInt64
    put_remote_addresses : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_globally_open_ports : UInt64
  end

  INetFwService_GUID = "79fd57c8-908e-4a36-9888-d5b3f0a444cf"
  IID_INetFwService = LibC::GUID.new(0x79fd57c8_u32, 0x908e_u16, 0x4a36_u16, StaticArray[0x98_u8, 0x88_u8, 0xd5_u8, 0xb3_u8, 0xf0_u8, 0xa4_u8, 0x44_u8, 0xcf_u8])
  struct INetFwService
    lpVtbl : INetFwServiceVTbl*
  end

  struct INetFwServicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  INetFwServices_GUID = "79649bb4-903e-421b-94c9-79848e79f6ee"
  IID_INetFwServices = LibC::GUID.new(0x79649bb4_u32, 0x903e_u16, 0x421b_u16, StaticArray[0x94_u8, 0xc9_u8, 0x79_u8, 0x84_u8, 0x8e_u8, 0x79_u8, 0xf6_u8, 0xee_u8])
  struct INetFwServices
    lpVtbl : INetFwServicesVTbl*
  end

  struct INetFwAuthorizedApplicationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    put_name : UInt64
    get_process_image_file_name : UInt64
    put_process_image_file_name : UInt64
    get_ip_version : UInt64
    put_ip_version : UInt64
    get_scope : UInt64
    put_scope : UInt64
    get_remote_addresses : UInt64
    put_remote_addresses : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
  end

  INetFwAuthorizedApplication_GUID = "b5e64ffa-c2c5-444e-a301-fb5e00018050"
  IID_INetFwAuthorizedApplication = LibC::GUID.new(0xb5e64ffa_u32, 0xc2c5_u16, 0x444e_u16, StaticArray[0xa3_u8, 0x1_u8, 0xfb_u8, 0x5e_u8, 0x0_u8, 0x1_u8, 0x80_u8, 0x50_u8])
  struct INetFwAuthorizedApplication
    lpVtbl : INetFwAuthorizedApplicationVTbl*
  end

  struct INetFwAuthorizedApplicationsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    add : UInt64
    remove : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  INetFwAuthorizedApplications_GUID = "644efd52-ccf9-486c-97a2-39f352570b30"
  IID_INetFwAuthorizedApplications = LibC::GUID.new(0x644efd52_u32, 0xccf9_u16, 0x486c_u16, StaticArray[0x97_u8, 0xa2_u8, 0x39_u8, 0xf3_u8, 0x52_u8, 0x57_u8, 0xb_u8, 0x30_u8])
  struct INetFwAuthorizedApplications
    lpVtbl : INetFwAuthorizedApplicationsVTbl*
  end

  struct INetFwRuleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    put_name : UInt64
    get_description : UInt64
    put_description : UInt64
    get_application_name : UInt64
    put_application_name : UInt64
    get_service_name : UInt64
    put_service_name : UInt64
    get_protocol : UInt64
    put_protocol : UInt64
    get_local_ports : UInt64
    put_local_ports : UInt64
    get_remote_ports : UInt64
    put_remote_ports : UInt64
    get_local_addresses : UInt64
    put_local_addresses : UInt64
    get_remote_addresses : UInt64
    put_remote_addresses : UInt64
    get_icmp_types_and_codes : UInt64
    put_icmp_types_and_codes : UInt64
    get_direction : UInt64
    put_direction : UInt64
    get_interfaces : UInt64
    put_interfaces : UInt64
    get_interface_types : UInt64
    put_interface_types : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_grouping : UInt64
    put_grouping : UInt64
    get_profiles : UInt64
    put_profiles : UInt64
    get_edge_traversal : UInt64
    put_edge_traversal : UInt64
    get_action : UInt64
    put_action : UInt64
  end

  INetFwRule_GUID = "af230d27-baba-4e42-aced-f524f22cfce2"
  IID_INetFwRule = LibC::GUID.new(0xaf230d27_u32, 0xbaba_u16, 0x4e42_u16, StaticArray[0xac_u8, 0xed_u8, 0xf5_u8, 0x24_u8, 0xf2_u8, 0x2c_u8, 0xfc_u8, 0xe2_u8])
  struct INetFwRule
    lpVtbl : INetFwRuleVTbl*
  end

  struct INetFwRule2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    put_name : UInt64
    get_description : UInt64
    put_description : UInt64
    get_application_name : UInt64
    put_application_name : UInt64
    get_service_name : UInt64
    put_service_name : UInt64
    get_protocol : UInt64
    put_protocol : UInt64
    get_local_ports : UInt64
    put_local_ports : UInt64
    get_remote_ports : UInt64
    put_remote_ports : UInt64
    get_local_addresses : UInt64
    put_local_addresses : UInt64
    get_remote_addresses : UInt64
    put_remote_addresses : UInt64
    get_icmp_types_and_codes : UInt64
    put_icmp_types_and_codes : UInt64
    get_direction : UInt64
    put_direction : UInt64
    get_interfaces : UInt64
    put_interfaces : UInt64
    get_interface_types : UInt64
    put_interface_types : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_grouping : UInt64
    put_grouping : UInt64
    get_profiles : UInt64
    put_profiles : UInt64
    get_edge_traversal : UInt64
    put_edge_traversal : UInt64
    get_action : UInt64
    put_action : UInt64
    get_edge_traversal_options : UInt64
    put_edge_traversal_options : UInt64
  end

  INetFwRule2_GUID = "9c27c8da-189b-4dde-89f7-8b39a316782c"
  IID_INetFwRule2 = LibC::GUID.new(0x9c27c8da_u32, 0x189b_u16, 0x4dde_u16, StaticArray[0x89_u8, 0xf7_u8, 0x8b_u8, 0x39_u8, 0xa3_u8, 0x16_u8, 0x78_u8, 0x2c_u8])
  struct INetFwRule2
    lpVtbl : INetFwRule2VTbl*
  end

  struct INetFwRule3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    put_name : UInt64
    get_description : UInt64
    put_description : UInt64
    get_application_name : UInt64
    put_application_name : UInt64
    get_service_name : UInt64
    put_service_name : UInt64
    get_protocol : UInt64
    put_protocol : UInt64
    get_local_ports : UInt64
    put_local_ports : UInt64
    get_remote_ports : UInt64
    put_remote_ports : UInt64
    get_local_addresses : UInt64
    put_local_addresses : UInt64
    get_remote_addresses : UInt64
    put_remote_addresses : UInt64
    get_icmp_types_and_codes : UInt64
    put_icmp_types_and_codes : UInt64
    get_direction : UInt64
    put_direction : UInt64
    get_interfaces : UInt64
    put_interfaces : UInt64
    get_interface_types : UInt64
    put_interface_types : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_grouping : UInt64
    put_grouping : UInt64
    get_profiles : UInt64
    put_profiles : UInt64
    get_edge_traversal : UInt64
    put_edge_traversal : UInt64
    get_action : UInt64
    put_action : UInt64
    get_edge_traversal_options : UInt64
    put_edge_traversal_options : UInt64
    get_local_app_package_id : UInt64
    put_local_app_package_id : UInt64
    get_local_user_owner : UInt64
    put_local_user_owner : UInt64
    get_local_user_authorized_list : UInt64
    put_local_user_authorized_list : UInt64
    get_remote_user_authorized_list : UInt64
    put_remote_user_authorized_list : UInt64
    get_remote_machine_authorized_list : UInt64
    put_remote_machine_authorized_list : UInt64
    get_secure_flags : UInt64
    put_secure_flags : UInt64
  end

  INetFwRule3_GUID = "b21563ff-d696-4222-ab46-4e89b73ab34a"
  IID_INetFwRule3 = LibC::GUID.new(0xb21563ff_u32, 0xd696_u16, 0x4222_u16, StaticArray[0xab_u8, 0x46_u8, 0x4e_u8, 0x89_u8, 0xb7_u8, 0x3a_u8, 0xb3_u8, 0x4a_u8])
  struct INetFwRule3
    lpVtbl : INetFwRule3VTbl*
  end

  struct INetFwRulesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    add : UInt64
    remove : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  INetFwRules_GUID = "9c4c6277-5027-441e-afae-ca1f542da009"
  IID_INetFwRules = LibC::GUID.new(0x9c4c6277_u32, 0x5027_u16, 0x441e_u16, StaticArray[0xaf_u8, 0xae_u8, 0xca_u8, 0x1f_u8, 0x54_u8, 0x2d_u8, 0xa0_u8, 0x9_u8])
  struct INetFwRules
    lpVtbl : INetFwRulesVTbl*
  end

  struct INetFwServiceRestrictionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    restrict_service : UInt64
    service_restricted : UInt64
    get_rules : UInt64
  end

  INetFwServiceRestriction_GUID = "8267bbe3-f890-491c-b7b6-2db1ef0e5d2b"
  IID_INetFwServiceRestriction = LibC::GUID.new(0x8267bbe3_u32, 0xf890_u16, 0x491c_u16, StaticArray[0xb7_u8, 0xb6_u8, 0x2d_u8, 0xb1_u8, 0xef_u8, 0xe_u8, 0x5d_u8, 0x2b_u8])
  struct INetFwServiceRestriction
    lpVtbl : INetFwServiceRestrictionVTbl*
  end

  struct INetFwProfileVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_firewall_enabled : UInt64
    put_firewall_enabled : UInt64
    get_exceptions_not_allowed : UInt64
    put_exceptions_not_allowed : UInt64
    get_notifications_disabled : UInt64
    put_notifications_disabled : UInt64
    get_unicast_responses_to_multicast_broadcast_disabled : UInt64
    put_unicast_responses_to_multicast_broadcast_disabled : UInt64
    get_remote_admin_settings : UInt64
    get_icmp_settings : UInt64
    get_globally_open_ports : UInt64
    get_services : UInt64
    get_authorized_applications : UInt64
  end

  INetFwProfile_GUID = "174a0dda-e9f9-449d-993b-21ab667ca456"
  IID_INetFwProfile = LibC::GUID.new(0x174a0dda_u32, 0xe9f9_u16, 0x449d_u16, StaticArray[0x99_u8, 0x3b_u8, 0x21_u8, 0xab_u8, 0x66_u8, 0x7c_u8, 0xa4_u8, 0x56_u8])
  struct INetFwProfile
    lpVtbl : INetFwProfileVTbl*
  end

  struct INetFwPolicyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_current_profile : UInt64
    get_profile_by_type : UInt64
  end

  INetFwPolicy_GUID = "d46d2478-9ac9-4008-9dc7-5563ce5536cc"
  IID_INetFwPolicy = LibC::GUID.new(0xd46d2478_u32, 0x9ac9_u16, 0x4008_u16, StaticArray[0x9d_u8, 0xc7_u8, 0x55_u8, 0x63_u8, 0xce_u8, 0x55_u8, 0x36_u8, 0xcc_u8])
  struct INetFwPolicy
    lpVtbl : INetFwPolicyVTbl*
  end

  struct INetFwPolicy2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_current_profile_types : UInt64
    get_firewall_enabled : UInt64
    put_firewall_enabled : UInt64
    get_excluded_interfaces : UInt64
    put_excluded_interfaces : UInt64
    get_block_all_inbound_traffic : UInt64
    put_block_all_inbound_traffic : UInt64
    get_notifications_disabled : UInt64
    put_notifications_disabled : UInt64
    get_unicast_responses_to_multicast_broadcast_disabled : UInt64
    put_unicast_responses_to_multicast_broadcast_disabled : UInt64
    get_rules : UInt64
    get_service_restriction : UInt64
    enable_rule_group : UInt64
    is_rule_group_enabled : UInt64
    restore_local_firewall_defaults : UInt64
    get_default_inbound_action : UInt64
    put_default_inbound_action : UInt64
    get_default_outbound_action : UInt64
    put_default_outbound_action : UInt64
    get_is_rule_group_currently_enabled : UInt64
    get_local_policy_modify_state : UInt64
  end

  INetFwPolicy2_GUID = "98325047-c671-4174-8d81-defcd3f03186"
  IID_INetFwPolicy2 = LibC::GUID.new(0x98325047_u32, 0xc671_u16, 0x4174_u16, StaticArray[0x8d_u8, 0x81_u8, 0xde_u8, 0xfc_u8, 0xd3_u8, 0xf0_u8, 0x31_u8, 0x86_u8])
  struct INetFwPolicy2
    lpVtbl : INetFwPolicy2VTbl*
  end

  struct INetFwMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_local_policy : UInt64
    get_current_profile_type : UInt64
    restore_defaults : UInt64
    is_port_allowed : UInt64
    is_icmp_type_allowed : UInt64
  end

  INetFwMgr_GUID = "f7898af5-cac4-4632-a2ec-da06e5111af2"
  IID_INetFwMgr = LibC::GUID.new(0xf7898af5_u32, 0xcac4_u16, 0x4632_u16, StaticArray[0xa2_u8, 0xec_u8, 0xda_u8, 0x6_u8, 0xe5_u8, 0x11_u8, 0x1a_u8, 0xf2_u8])
  struct INetFwMgr
    lpVtbl : INetFwMgrVTbl*
  end

  struct INetFwProductVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_rule_categories : UInt64
    put_rule_categories : UInt64
    get_display_name : UInt64
    put_display_name : UInt64
    get_path_to_signed_product_exe : UInt64
  end

  INetFwProduct_GUID = "71881699-18f4-458b-b892-3ffce5e07f75"
  IID_INetFwProduct = LibC::GUID.new(0x71881699_u32, 0x18f4_u16, 0x458b_u16, StaticArray[0xb8_u8, 0x92_u8, 0x3f_u8, 0xfc_u8, 0xe5_u8, 0xe0_u8, 0x7f_u8, 0x75_u8])
  struct INetFwProduct
    lpVtbl : INetFwProductVTbl*
  end

  struct INetFwProductsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    register : UInt64
    item : UInt64
    get__new_enum : UInt64
  end

  INetFwProducts_GUID = "39eb36e0-2097-40bd-8af2-63a13b525362"
  IID_INetFwProducts = LibC::GUID.new(0x39eb36e0_u32, 0x2097_u16, 0x40bd_u16, StaticArray[0x8a_u8, 0xf2_u8, 0x63_u8, 0xa1_u8, 0x3b_u8, 0x52_u8, 0x53_u8, 0x62_u8])
  struct INetFwProducts
    lpVtbl : INetFwProductsVTbl*
  end


  # Params # applicationcontainersid : PSID [In],packagefullname : LibC::LPWSTR [In],packagefolder : LibC::LPWSTR [In],displayname : LibC::LPWSTR [In],bbinariesfullycomputed : LibC::BOOL [In],binaries : LibC::LPWSTR* [In],binariescount : UInt32 [In]
  fun NetworkIsolationSetupAppContainerBinaries(applicationcontainersid : PSID, packagefullname : LibC::LPWSTR, packagefolder : LibC::LPWSTR, displayname : LibC::LPWSTR, bbinariesfullycomputed : LibC::BOOL, binaries : LibC::LPWSTR*, binariescount : UInt32) : HRESULT

  # Params # flags : UInt32 [In],callback : PAC_CHANGES_CALLBACK_FN [In],context : Void* [In],registrationobject : LibC::HANDLE* [In]
  fun NetworkIsolationRegisterForAppContainerChanges(flags : UInt32, callback : PAC_CHANGES_CALLBACK_FN, context : Void*, registrationobject : LibC::HANDLE*) : UInt32

  # Params # registrationobject : LibC::HANDLE [In]
  fun NetworkIsolationUnregisterForAppContainerChanges(registrationobject : LibC::HANDLE) : UInt32

  # Params # ppublicappcs : INET_FIREWALL_APP_CONTAINER* [In]
  fun NetworkIsolationFreeAppContainers(ppublicappcs : INET_FIREWALL_APP_CONTAINER*) : UInt32

  # Params # flags : UInt32 [In],pdwnumpublicappcs : UInt32* [In],pppublicappcs : INET_FIREWALL_APP_CONTAINER** [In]
  fun NetworkIsolationEnumAppContainers(flags : UInt32, pdwnumpublicappcs : UInt32*, pppublicappcs : INET_FIREWALL_APP_CONTAINER**) : UInt32

  # Params # pdwnumpublicappcs : UInt32* [In],appcontainersids : SID_AND_ATTRIBUTES** [In]
  fun NetworkIsolationGetAppContainerConfig(pdwnumpublicappcs : UInt32*, appcontainersids : SID_AND_ATTRIBUTES**) : UInt32

  # Params # dwnumpublicappcs : UInt32 [In],appcontainersids : SID_AND_ATTRIBUTES* [In]
  fun NetworkIsolationSetAppContainerConfig(dwnumpublicappcs : UInt32, appcontainersids : SID_AND_ATTRIBUTES*) : UInt32

  # Params # wszservername : LibC::LPWSTR [In],netisoerror : NETISO_ERROR_TYPE* [In]
  fun NetworkIsolationDiagnoseConnectFailureAndGetInfo(wszservername : LibC::LPWSTR, netisoerror : NETISO_ERROR_TYPE*) : UInt32
end
struct LibWin32::IUPnPNAT
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_static_port_mapping_collection(ppspms : IStaticPortMappingCollection*) : HRESULT
    @lpVtbl.value.get_static_port_mapping_collection.unsafe_as(Proc(IStaticPortMappingCollection*, HRESULT)).call(ppspms)
  end
  def get_dynamic_port_mapping_collection(ppdpms : IDynamicPortMappingCollection*) : HRESULT
    @lpVtbl.value.get_dynamic_port_mapping_collection.unsafe_as(Proc(IDynamicPortMappingCollection*, HRESULT)).call(ppdpms)
  end
  def get_nat_event_manager(ppnem : INATEventManager*) : HRESULT
    @lpVtbl.value.get_nat_event_manager.unsafe_as(Proc(INATEventManager*, HRESULT)).call(ppnem)
  end
end
struct LibWin32::INATEventManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def put_external_ip_address_callback(punk : IUnknown) : HRESULT
    @lpVtbl.value.put_external_ip_address_callback.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def put_number_of_entries_callback(punk : IUnknown) : HRESULT
    @lpVtbl.value.put_number_of_entries_callback.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
end
struct LibWin32::INATExternalIPAddressCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def new_external_ip_address(bstrnewexternalipaddress : UInt8*) : HRESULT
    @lpVtbl.value.new_external_ip_address.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrnewexternalipaddress)
  end
end
struct LibWin32::INATNumberOfEntriesCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def new_number_of_entries(lnewnumberofentries : Int32) : HRESULT
    @lpVtbl.value.new_number_of_entries.unsafe_as(Proc(Int32, HRESULT)).call(lnewnumberofentries)
  end
end
struct LibWin32::IDynamicPortMappingCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def get_item(bstrremotehost : UInt8*, lexternalport : Int32, bstrprotocol : UInt8*, ppdpm : IDynamicPortMapping*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(UInt8*, Int32, UInt8*, IDynamicPortMapping*, HRESULT)).call(bstrremotehost, lexternalport, bstrprotocol, ppdpm)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def remove(bstrremotehost : UInt8*, lexternalport : Int32, bstrprotocol : UInt8*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(UInt8*, Int32, UInt8*, HRESULT)).call(bstrremotehost, lexternalport, bstrprotocol)
  end
  def add(bstrremotehost : UInt8*, lexternalport : Int32, bstrprotocol : UInt8*, linternalport : Int32, bstrinternalclient : UInt8*, benabled : Int16, bstrdescription : UInt8*, lleaseduration : Int32, ppdpm : IDynamicPortMapping*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, Int32, UInt8*, Int32, UInt8*, Int16, UInt8*, Int32, IDynamicPortMapping*, HRESULT)).call(bstrremotehost, lexternalport, bstrprotocol, linternalport, bstrinternalclient, benabled, bstrdescription, lleaseduration, ppdpm)
  end
end
struct LibWin32::IDynamicPortMapping
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_external_ip_address(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_external_ip_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_remote_host(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_host.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_external_port(pval : Int32*) : HRESULT
    @lpVtbl.value.get_external_port.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_protocol(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_protocol.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_internal_port(pval : Int32*) : HRESULT
    @lpVtbl.value.get_internal_port.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_internal_client(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_internal_client.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_enabled(pval : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def get_description(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_lease_duration(pval : Int32*) : HRESULT
    @lpVtbl.value.get_lease_duration.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def renew_lease(lleasedurationdesired : Int32, pleasedurationreturned : Int32*) : HRESULT
    @lpVtbl.value.renew_lease.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(lleasedurationdesired, pleasedurationreturned)
  end
  def edit_internal_client(bstrinternalclient : UInt8*) : HRESULT
    @lpVtbl.value.edit_internal_client.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrinternalclient)
  end
  def enable(vb : Int16) : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(Int16, HRESULT)).call(vb)
  end
  def edit_description(bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.edit_description.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdescription)
  end
  def edit_internal_port(linternalport : Int32) : HRESULT
    @lpVtbl.value.edit_internal_port.unsafe_as(Proc(Int32, HRESULT)).call(linternalport)
  end
end
struct LibWin32::IStaticPortMappingCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def get_item(lexternalport : Int32, bstrprotocol : UInt8*, ppspm : IStaticPortMapping*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, UInt8*, IStaticPortMapping*, HRESULT)).call(lexternalport, bstrprotocol, ppspm)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def remove(lexternalport : Int32, bstrprotocol : UInt8*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, UInt8*, HRESULT)).call(lexternalport, bstrprotocol)
  end
  def add(lexternalport : Int32, bstrprotocol : UInt8*, linternalport : Int32, bstrinternalclient : UInt8*, benabled : Int16, bstrdescription : UInt8*, ppspm : IStaticPortMapping*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(Int32, UInt8*, Int32, UInt8*, Int16, UInt8*, IStaticPortMapping*, HRESULT)).call(lexternalport, bstrprotocol, linternalport, bstrinternalclient, benabled, bstrdescription, ppspm)
  end
end
struct LibWin32::IStaticPortMapping
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_external_ip_address(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_external_ip_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_external_port(pval : Int32*) : HRESULT
    @lpVtbl.value.get_external_port.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_internal_port(pval : Int32*) : HRESULT
    @lpVtbl.value.get_internal_port.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_protocol(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_protocol.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_internal_client(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_internal_client.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_enabled(pval : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def get_description(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def edit_internal_client(bstrinternalclient : UInt8*) : HRESULT
    @lpVtbl.value.edit_internal_client.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrinternalclient)
  end
  def enable(vb : Int16) : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(Int16, HRESULT)).call(vb)
  end
  def edit_description(bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.edit_description.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdescription)
  end
  def edit_internal_port(linternalport : Int32) : HRESULT
    @lpVtbl.value.edit_internal_port.unsafe_as(Proc(Int32, HRESULT)).call(linternalport)
  end
end
struct LibWin32::IEnumNetConnection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : INetConnection*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, INetConnection*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumNetConnection*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumNetConnection*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::INetConnection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def connect : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(HRESULT)).call
  end
  def disconnect : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(HRESULT)).call
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def duplicate(pszwduplicatename : LibC::LPWSTR, ppcon : INetConnection*) : HRESULT
    @lpVtbl.value.duplicate.unsafe_as(Proc(LibC::LPWSTR, INetConnection*, HRESULT)).call(pszwduplicatename, ppcon)
  end
  def get_properties(ppprops : NETCON_PROPERTIES**) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(NETCON_PROPERTIES**, HRESULT)).call(ppprops)
  end
  def get_ui_object_class_id(pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_ui_object_class_id.unsafe_as(Proc(Guid*, HRESULT)).call(pclsid)
  end
  def rename(pszwnewname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.rename.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszwnewname)
  end
end
struct LibWin32::INetConnectionManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enum_connections(flags : NETCONMGR_ENUM_FLAGS, ppenum : IEnumNetConnection*) : HRESULT
    @lpVtbl.value.enum_connections.unsafe_as(Proc(NETCONMGR_ENUM_FLAGS, IEnumNetConnection*, HRESULT)).call(flags, ppenum)
  end
end
struct LibWin32::INetConnectionConnectUi
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_connection(pcon : INetConnection) : HRESULT
    @lpVtbl.value.set_connection.unsafe_as(Proc(INetConnection, HRESULT)).call(pcon)
  end
  def connect(hwndparent : LibC::HANDLE, dwflags : UInt32) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(LibC::HANDLE, UInt32, HRESULT)).call(hwndparent, dwflags)
  end
  def disconnect(hwndparent : LibC::HANDLE, dwflags : UInt32) : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(LibC::HANDLE, UInt32, HRESULT)).call(hwndparent, dwflags)
  end
end
struct LibWin32::IEnumNetSharingPortMapping
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgvar : VARIANT*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, VARIANT*, UInt32*, HRESULT)).call(celt, rgvar, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumNetSharingPortMapping*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumNetSharingPortMapping*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::INetSharingPortMappingProps
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_ip_protocol(pucipprot : UInt8*) : HRESULT
    @lpVtbl.value.get_ip_protocol.unsafe_as(Proc(UInt8*, HRESULT)).call(pucipprot)
  end
  def get_external_port(pusport : Int32*) : HRESULT
    @lpVtbl.value.get_external_port.unsafe_as(Proc(Int32*, HRESULT)).call(pusport)
  end
  def get_internal_port(pusport : Int32*) : HRESULT
    @lpVtbl.value.get_internal_port.unsafe_as(Proc(Int32*, HRESULT)).call(pusport)
  end
  def get_options(pdwoptions : Int32*) : HRESULT
    @lpVtbl.value.get_options.unsafe_as(Proc(Int32*, HRESULT)).call(pdwoptions)
  end
  def get_target_name(pbstrtargetname : UInt8**) : HRESULT
    @lpVtbl.value.get_target_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtargetname)
  end
  def get_target_ip_address(pbstrtargetipaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_target_ip_address.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtargetipaddress)
  end
  def get_enabled(pbool : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pbool)
  end
end
struct LibWin32::INetSharingPortMapping
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def disable : HRESULT
    @lpVtbl.value.disable.unsafe_as(Proc(HRESULT)).call
  end
  def enable : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(HRESULT)).call
  end
  def get_properties(ppnspmp : INetSharingPortMappingProps*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(INetSharingPortMappingProps*, HRESULT)).call(ppnspmp)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IEnumNetSharingEveryConnection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgvar : VARIANT*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, VARIANT*, UInt32*, HRESULT)).call(celt, rgvar, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumNetSharingEveryConnection*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumNetSharingEveryConnection*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumNetSharingPublicConnection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgvar : VARIANT*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, VARIANT*, UInt32*, HRESULT)).call(celt, rgvar, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumNetSharingPublicConnection*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumNetSharingPublicConnection*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumNetSharingPrivateConnection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgvar : VARIANT*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, VARIANT*, UInt32*, HRESULT)).call(celt, rgvar, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumNetSharingPrivateConnection*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumNetSharingPrivateConnection*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::INetSharingPortMappingCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
end
struct LibWin32::INetConnectionProps
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_guid(pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrguid)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_device_name(pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdevicename)
  end
  def get_status(pstatus : NETCON_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(NETCON_STATUS*, HRESULT)).call(pstatus)
  end
  def get_media_type(pmediatype : NETCON_MEDIATYPE*) : HRESULT
    @lpVtbl.value.get_media_type.unsafe_as(Proc(NETCON_MEDIATYPE*, HRESULT)).call(pmediatype)
  end
  def get_characteristics(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_characteristics.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
end
struct LibWin32::INetSharingConfiguration
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_sharing_enabled(pbenabled : Int16*) : HRESULT
    @lpVtbl.value.get_sharing_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pbenabled)
  end
  def get_sharing_connection_type(ptype : SHARINGCONNECTIONTYPE*) : HRESULT
    @lpVtbl.value.get_sharing_connection_type.unsafe_as(Proc(SHARINGCONNECTIONTYPE*, HRESULT)).call(ptype)
  end
  def disable_sharing : HRESULT
    @lpVtbl.value.disable_sharing.unsafe_as(Proc(HRESULT)).call
  end
  def enable_sharing(type : SHARINGCONNECTIONTYPE) : HRESULT
    @lpVtbl.value.enable_sharing.unsafe_as(Proc(SHARINGCONNECTIONTYPE, HRESULT)).call(type)
  end
  def get_internet_firewall_enabled(pbenabled : Int16*) : HRESULT
    @lpVtbl.value.get_internet_firewall_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pbenabled)
  end
  def disable_internet_firewall : HRESULT
    @lpVtbl.value.disable_internet_firewall.unsafe_as(Proc(HRESULT)).call
  end
  def enable_internet_firewall : HRESULT
    @lpVtbl.value.enable_internet_firewall.unsafe_as(Proc(HRESULT)).call
  end
  def get_enum_port_mappings(flags : SHARINGCONNECTION_ENUM_FLAGS, ppcoll : INetSharingPortMappingCollection*) : HRESULT
    @lpVtbl.value.get_enum_port_mappings.unsafe_as(Proc(SHARINGCONNECTION_ENUM_FLAGS, INetSharingPortMappingCollection*, HRESULT)).call(flags, ppcoll)
  end
  def add_port_mapping(bstrname : UInt8*, ucipprotocol : UInt8, usexternalport : UInt16, usinternalport : UInt16, dwoptions : UInt32, bstrtargetnameoripaddress : UInt8*, etargettype : ICS_TARGETTYPE, ppmapping : INetSharingPortMapping*) : HRESULT
    @lpVtbl.value.add_port_mapping.unsafe_as(Proc(UInt8*, UInt8, UInt16, UInt16, UInt32, UInt8*, ICS_TARGETTYPE, INetSharingPortMapping*, HRESULT)).call(bstrname, ucipprotocol, usexternalport, usinternalport, dwoptions, bstrtargetnameoripaddress, etargettype, ppmapping)
  end
  def remove_port_mapping(pmapping : INetSharingPortMapping) : HRESULT
    @lpVtbl.value.remove_port_mapping.unsafe_as(Proc(INetSharingPortMapping, HRESULT)).call(pmapping)
  end
end
struct LibWin32::INetSharingEveryConnectionCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
end
struct LibWin32::INetSharingPublicConnectionCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
end
struct LibWin32::INetSharingPrivateConnectionCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
end
struct LibWin32::INetSharingManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_sharing_installed(pbinstalled : Int16*) : HRESULT
    @lpVtbl.value.get_sharing_installed.unsafe_as(Proc(Int16*, HRESULT)).call(pbinstalled)
  end
  def get_enum_public_connections(flags : SHARINGCONNECTION_ENUM_FLAGS, ppcoll : INetSharingPublicConnectionCollection*) : HRESULT
    @lpVtbl.value.get_enum_public_connections.unsafe_as(Proc(SHARINGCONNECTION_ENUM_FLAGS, INetSharingPublicConnectionCollection*, HRESULT)).call(flags, ppcoll)
  end
  def get_enum_private_connections(flags : SHARINGCONNECTION_ENUM_FLAGS, ppcoll : INetSharingPrivateConnectionCollection*) : HRESULT
    @lpVtbl.value.get_enum_private_connections.unsafe_as(Proc(SHARINGCONNECTION_ENUM_FLAGS, INetSharingPrivateConnectionCollection*, HRESULT)).call(flags, ppcoll)
  end
  def get_i_net_sharing_configuration_for_i_net_connection(pnetconnection : INetConnection, ppnetsharingconfiguration : INetSharingConfiguration*) : HRESULT
    @lpVtbl.value.get_i_net_sharing_configuration_for_i_net_connection.unsafe_as(Proc(INetConnection, INetSharingConfiguration*, HRESULT)).call(pnetconnection, ppnetsharingconfiguration)
  end
  def get_enum_every_connection(ppcoll : INetSharingEveryConnectionCollection*) : HRESULT
    @lpVtbl.value.get_enum_every_connection.unsafe_as(Proc(INetSharingEveryConnectionCollection*, HRESULT)).call(ppcoll)
  end
  def get_net_connection_props(pnetconnection : INetConnection, ppprops : INetConnectionProps*) : HRESULT
    @lpVtbl.value.get_net_connection_props.unsafe_as(Proc(INetConnection, INetConnectionProps*, HRESULT)).call(pnetconnection, ppprops)
  end
end
struct LibWin32::INetFwRemoteAdminSettings
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_ip_version(ipversion : NET_FW_IP_VERSION*) : HRESULT
    @lpVtbl.value.get_ip_version.unsafe_as(Proc(NET_FW_IP_VERSION*, HRESULT)).call(ipversion)
  end
  def put_ip_version(ipversion : NET_FW_IP_VERSION) : HRESULT
    @lpVtbl.value.put_ip_version.unsafe_as(Proc(NET_FW_IP_VERSION, HRESULT)).call(ipversion)
  end
  def get_scope(scope : NET_FW_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.unsafe_as(Proc(NET_FW_SCOPE*, HRESULT)).call(scope)
  end
  def put_scope(scope : NET_FW_SCOPE) : HRESULT
    @lpVtbl.value.put_scope.unsafe_as(Proc(NET_FW_SCOPE, HRESULT)).call(scope)
  end
  def get_remote_addresses(remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(remoteaddrs)
  end
  def put_remote_addresses(remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(remoteaddrs)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
end
struct LibWin32::INetFwIcmpSettings
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_allow_outbound_destination_unreachable(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_destination_unreachable.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_outbound_destination_unreachable(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_destination_unreachable.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_redirect(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_redirect.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_redirect(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_redirect.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_inbound_echo_request(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_inbound_echo_request.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_inbound_echo_request(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_inbound_echo_request.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_outbound_time_exceeded(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_time_exceeded.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_outbound_time_exceeded(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_time_exceeded.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_outbound_parameter_problem(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_parameter_problem.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_outbound_parameter_problem(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_parameter_problem.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_outbound_source_quench(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_source_quench.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_outbound_source_quench(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_source_quench.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_inbound_router_request(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_inbound_router_request.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_inbound_router_request(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_inbound_router_request.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_inbound_timestamp_request(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_inbound_timestamp_request.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_inbound_timestamp_request(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_inbound_timestamp_request.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_inbound_mask_request(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_inbound_mask_request.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_inbound_mask_request(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_inbound_mask_request.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
  def get_allow_outbound_packet_too_big(allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_packet_too_big.unsafe_as(Proc(Int16*, HRESULT)).call(allow)
  end
  def put_allow_outbound_packet_too_big(allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_packet_too_big.unsafe_as(Proc(Int16, HRESULT)).call(allow)
  end
end
struct LibWin32::INetFwOpenPort
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_ip_version(ipversion : NET_FW_IP_VERSION*) : HRESULT
    @lpVtbl.value.get_ip_version.unsafe_as(Proc(NET_FW_IP_VERSION*, HRESULT)).call(ipversion)
  end
  def put_ip_version(ipversion : NET_FW_IP_VERSION) : HRESULT
    @lpVtbl.value.put_ip_version.unsafe_as(Proc(NET_FW_IP_VERSION, HRESULT)).call(ipversion)
  end
  def get_protocol(ipprotocol : NET_FW_IP_PROTOCOL*) : HRESULT
    @lpVtbl.value.get_protocol.unsafe_as(Proc(NET_FW_IP_PROTOCOL*, HRESULT)).call(ipprotocol)
  end
  def put_protocol(ipprotocol : NET_FW_IP_PROTOCOL) : HRESULT
    @lpVtbl.value.put_protocol.unsafe_as(Proc(NET_FW_IP_PROTOCOL, HRESULT)).call(ipprotocol)
  end
  def get_port(portnumber : Int32*) : HRESULT
    @lpVtbl.value.get_port.unsafe_as(Proc(Int32*, HRESULT)).call(portnumber)
  end
  def put_port(portnumber : Int32) : HRESULT
    @lpVtbl.value.put_port.unsafe_as(Proc(Int32, HRESULT)).call(portnumber)
  end
  def get_scope(scope : NET_FW_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.unsafe_as(Proc(NET_FW_SCOPE*, HRESULT)).call(scope)
  end
  def put_scope(scope : NET_FW_SCOPE) : HRESULT
    @lpVtbl.value.put_scope.unsafe_as(Proc(NET_FW_SCOPE, HRESULT)).call(scope)
  end
  def get_remote_addresses(remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(remoteaddrs)
  end
  def put_remote_addresses(remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(remoteaddrs)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_built_in(builtin : Int16*) : HRESULT
    @lpVtbl.value.get_built_in.unsafe_as(Proc(Int16*, HRESULT)).call(builtin)
  end
end
struct LibWin32::INetFwOpenPorts
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def add(port : INetFwOpenPort) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(INetFwOpenPort, HRESULT)).call(port)
  end
  def remove(portnumber : Int32, ipprotocol : NET_FW_IP_PROTOCOL) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, NET_FW_IP_PROTOCOL, HRESULT)).call(portnumber, ipprotocol)
  end
  def item(portnumber : Int32, ipprotocol : NET_FW_IP_PROTOCOL, openport : INetFwOpenPort*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, NET_FW_IP_PROTOCOL, INetFwOpenPort*, HRESULT)).call(portnumber, ipprotocol, openport)
  end
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
end
struct LibWin32::INetFwService
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_type(type : NET_FW_SERVICE_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(NET_FW_SERVICE_TYPE*, HRESULT)).call(type)
  end
  def get_customized(customized : Int16*) : HRESULT
    @lpVtbl.value.get_customized.unsafe_as(Proc(Int16*, HRESULT)).call(customized)
  end
  def get_ip_version(ipversion : NET_FW_IP_VERSION*) : HRESULT
    @lpVtbl.value.get_ip_version.unsafe_as(Proc(NET_FW_IP_VERSION*, HRESULT)).call(ipversion)
  end
  def put_ip_version(ipversion : NET_FW_IP_VERSION) : HRESULT
    @lpVtbl.value.put_ip_version.unsafe_as(Proc(NET_FW_IP_VERSION, HRESULT)).call(ipversion)
  end
  def get_scope(scope : NET_FW_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.unsafe_as(Proc(NET_FW_SCOPE*, HRESULT)).call(scope)
  end
  def put_scope(scope : NET_FW_SCOPE) : HRESULT
    @lpVtbl.value.put_scope.unsafe_as(Proc(NET_FW_SCOPE, HRESULT)).call(scope)
  end
  def get_remote_addresses(remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(remoteaddrs)
  end
  def put_remote_addresses(remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(remoteaddrs)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_globally_open_ports(openports : INetFwOpenPorts*) : HRESULT
    @lpVtbl.value.get_globally_open_ports.unsafe_as(Proc(INetFwOpenPorts*, HRESULT)).call(openports)
  end
end
struct LibWin32::INetFwServices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def item(svctype : NET_FW_SERVICE_TYPE, service : INetFwService*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(NET_FW_SERVICE_TYPE, INetFwService*, HRESULT)).call(svctype, service)
  end
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
end
struct LibWin32::INetFwAuthorizedApplication
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_process_image_file_name(imagefilename : UInt8**) : HRESULT
    @lpVtbl.value.get_process_image_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(imagefilename)
  end
  def put_process_image_file_name(imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.put_process_image_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(imagefilename)
  end
  def get_ip_version(ipversion : NET_FW_IP_VERSION*) : HRESULT
    @lpVtbl.value.get_ip_version.unsafe_as(Proc(NET_FW_IP_VERSION*, HRESULT)).call(ipversion)
  end
  def put_ip_version(ipversion : NET_FW_IP_VERSION) : HRESULT
    @lpVtbl.value.put_ip_version.unsafe_as(Proc(NET_FW_IP_VERSION, HRESULT)).call(ipversion)
  end
  def get_scope(scope : NET_FW_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.unsafe_as(Proc(NET_FW_SCOPE*, HRESULT)).call(scope)
  end
  def put_scope(scope : NET_FW_SCOPE) : HRESULT
    @lpVtbl.value.put_scope.unsafe_as(Proc(NET_FW_SCOPE, HRESULT)).call(scope)
  end
  def get_remote_addresses(remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(remoteaddrs)
  end
  def put_remote_addresses(remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(remoteaddrs)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
end
struct LibWin32::INetFwAuthorizedApplications
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def add(app : INetFwAuthorizedApplication) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(INetFwAuthorizedApplication, HRESULT)).call(app)
  end
  def remove(imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(UInt8*, HRESULT)).call(imagefilename)
  end
  def item(imagefilename : UInt8*, app : INetFwAuthorizedApplication*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(UInt8*, INetFwAuthorizedApplication*, HRESULT)).call(imagefilename, app)
  end
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
end
struct LibWin32::INetFwRule
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_description(desc : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(desc)
  end
  def put_description(desc : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(desc)
  end
  def get_application_name(imagefilename : UInt8**) : HRESULT
    @lpVtbl.value.get_application_name.unsafe_as(Proc(UInt8**, HRESULT)).call(imagefilename)
  end
  def put_application_name(imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.put_application_name.unsafe_as(Proc(UInt8*, HRESULT)).call(imagefilename)
  end
  def get_service_name(servicename : UInt8**) : HRESULT
    @lpVtbl.value.get_service_name.unsafe_as(Proc(UInt8**, HRESULT)).call(servicename)
  end
  def put_service_name(servicename : UInt8*) : HRESULT
    @lpVtbl.value.put_service_name.unsafe_as(Proc(UInt8*, HRESULT)).call(servicename)
  end
  def get_protocol(protocol : Int32*) : HRESULT
    @lpVtbl.value.get_protocol.unsafe_as(Proc(Int32*, HRESULT)).call(protocol)
  end
  def put_protocol(protocol : Int32) : HRESULT
    @lpVtbl.value.put_protocol.unsafe_as(Proc(Int32, HRESULT)).call(protocol)
  end
  def get_local_ports(portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_local_ports.unsafe_as(Proc(UInt8**, HRESULT)).call(portnumbers)
  end
  def put_local_ports(portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_local_ports.unsafe_as(Proc(UInt8*, HRESULT)).call(portnumbers)
  end
  def get_remote_ports(portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_ports.unsafe_as(Proc(UInt8**, HRESULT)).call(portnumbers)
  end
  def put_remote_ports(portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_ports.unsafe_as(Proc(UInt8*, HRESULT)).call(portnumbers)
  end
  def get_local_addresses(localaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_local_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(localaddrs)
  end
  def put_local_addresses(localaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_local_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(localaddrs)
  end
  def get_remote_addresses(remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(remoteaddrs)
  end
  def put_remote_addresses(remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(remoteaddrs)
  end
  def get_icmp_types_and_codes(icmptypesandcodes : UInt8**) : HRESULT
    @lpVtbl.value.get_icmp_types_and_codes.unsafe_as(Proc(UInt8**, HRESULT)).call(icmptypesandcodes)
  end
  def put_icmp_types_and_codes(icmptypesandcodes : UInt8*) : HRESULT
    @lpVtbl.value.put_icmp_types_and_codes.unsafe_as(Proc(UInt8*, HRESULT)).call(icmptypesandcodes)
  end
  def get_direction(dir : NET_FW_RULE_DIRECTION*) : HRESULT
    @lpVtbl.value.get_direction.unsafe_as(Proc(NET_FW_RULE_DIRECTION*, HRESULT)).call(dir)
  end
  def put_direction(dir : NET_FW_RULE_DIRECTION) : HRESULT
    @lpVtbl.value.put_direction.unsafe_as(Proc(NET_FW_RULE_DIRECTION, HRESULT)).call(dir)
  end
  def get_interfaces(interfaces : VARIANT*) : HRESULT
    @lpVtbl.value.get_interfaces.unsafe_as(Proc(VARIANT*, HRESULT)).call(interfaces)
  end
  def put_interfaces(interfaces : VARIANT) : HRESULT
    @lpVtbl.value.put_interfaces.unsafe_as(Proc(VARIANT, HRESULT)).call(interfaces)
  end
  def get_interface_types(interfacetypes : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_types.unsafe_as(Proc(UInt8**, HRESULT)).call(interfacetypes)
  end
  def put_interface_types(interfacetypes : UInt8*) : HRESULT
    @lpVtbl.value.put_interface_types.unsafe_as(Proc(UInt8*, HRESULT)).call(interfacetypes)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_grouping(context : UInt8**) : HRESULT
    @lpVtbl.value.get_grouping.unsafe_as(Proc(UInt8**, HRESULT)).call(context)
  end
  def put_grouping(context : UInt8*) : HRESULT
    @lpVtbl.value.put_grouping.unsafe_as(Proc(UInt8*, HRESULT)).call(context)
  end
  def get_profiles(profiletypesbitmask : Int32*) : HRESULT
    @lpVtbl.value.get_profiles.unsafe_as(Proc(Int32*, HRESULT)).call(profiletypesbitmask)
  end
  def put_profiles(profiletypesbitmask : Int32) : HRESULT
    @lpVtbl.value.put_profiles.unsafe_as(Proc(Int32, HRESULT)).call(profiletypesbitmask)
  end
  def get_edge_traversal(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_edge_traversal.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_edge_traversal(enabled : Int16) : HRESULT
    @lpVtbl.value.put_edge_traversal.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_action(action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_action.unsafe_as(Proc(NET_FW_ACTION*, HRESULT)).call(action)
  end
  def put_action(action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_action.unsafe_as(Proc(NET_FW_ACTION, HRESULT)).call(action)
  end
end
struct LibWin32::INetFwRule2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_description(desc : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(desc)
  end
  def put_description(desc : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(desc)
  end
  def get_application_name(imagefilename : UInt8**) : HRESULT
    @lpVtbl.value.get_application_name.unsafe_as(Proc(UInt8**, HRESULT)).call(imagefilename)
  end
  def put_application_name(imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.put_application_name.unsafe_as(Proc(UInt8*, HRESULT)).call(imagefilename)
  end
  def get_service_name(servicename : UInt8**) : HRESULT
    @lpVtbl.value.get_service_name.unsafe_as(Proc(UInt8**, HRESULT)).call(servicename)
  end
  def put_service_name(servicename : UInt8*) : HRESULT
    @lpVtbl.value.put_service_name.unsafe_as(Proc(UInt8*, HRESULT)).call(servicename)
  end
  def get_protocol(protocol : Int32*) : HRESULT
    @lpVtbl.value.get_protocol.unsafe_as(Proc(Int32*, HRESULT)).call(protocol)
  end
  def put_protocol(protocol : Int32) : HRESULT
    @lpVtbl.value.put_protocol.unsafe_as(Proc(Int32, HRESULT)).call(protocol)
  end
  def get_local_ports(portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_local_ports.unsafe_as(Proc(UInt8**, HRESULT)).call(portnumbers)
  end
  def put_local_ports(portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_local_ports.unsafe_as(Proc(UInt8*, HRESULT)).call(portnumbers)
  end
  def get_remote_ports(portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_ports.unsafe_as(Proc(UInt8**, HRESULT)).call(portnumbers)
  end
  def put_remote_ports(portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_ports.unsafe_as(Proc(UInt8*, HRESULT)).call(portnumbers)
  end
  def get_local_addresses(localaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_local_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(localaddrs)
  end
  def put_local_addresses(localaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_local_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(localaddrs)
  end
  def get_remote_addresses(remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(remoteaddrs)
  end
  def put_remote_addresses(remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(remoteaddrs)
  end
  def get_icmp_types_and_codes(icmptypesandcodes : UInt8**) : HRESULT
    @lpVtbl.value.get_icmp_types_and_codes.unsafe_as(Proc(UInt8**, HRESULT)).call(icmptypesandcodes)
  end
  def put_icmp_types_and_codes(icmptypesandcodes : UInt8*) : HRESULT
    @lpVtbl.value.put_icmp_types_and_codes.unsafe_as(Proc(UInt8*, HRESULT)).call(icmptypesandcodes)
  end
  def get_direction(dir : NET_FW_RULE_DIRECTION*) : HRESULT
    @lpVtbl.value.get_direction.unsafe_as(Proc(NET_FW_RULE_DIRECTION*, HRESULT)).call(dir)
  end
  def put_direction(dir : NET_FW_RULE_DIRECTION) : HRESULT
    @lpVtbl.value.put_direction.unsafe_as(Proc(NET_FW_RULE_DIRECTION, HRESULT)).call(dir)
  end
  def get_interfaces(interfaces : VARIANT*) : HRESULT
    @lpVtbl.value.get_interfaces.unsafe_as(Proc(VARIANT*, HRESULT)).call(interfaces)
  end
  def put_interfaces(interfaces : VARIANT) : HRESULT
    @lpVtbl.value.put_interfaces.unsafe_as(Proc(VARIANT, HRESULT)).call(interfaces)
  end
  def get_interface_types(interfacetypes : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_types.unsafe_as(Proc(UInt8**, HRESULT)).call(interfacetypes)
  end
  def put_interface_types(interfacetypes : UInt8*) : HRESULT
    @lpVtbl.value.put_interface_types.unsafe_as(Proc(UInt8*, HRESULT)).call(interfacetypes)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_grouping(context : UInt8**) : HRESULT
    @lpVtbl.value.get_grouping.unsafe_as(Proc(UInt8**, HRESULT)).call(context)
  end
  def put_grouping(context : UInt8*) : HRESULT
    @lpVtbl.value.put_grouping.unsafe_as(Proc(UInt8*, HRESULT)).call(context)
  end
  def get_profiles(profiletypesbitmask : Int32*) : HRESULT
    @lpVtbl.value.get_profiles.unsafe_as(Proc(Int32*, HRESULT)).call(profiletypesbitmask)
  end
  def put_profiles(profiletypesbitmask : Int32) : HRESULT
    @lpVtbl.value.put_profiles.unsafe_as(Proc(Int32, HRESULT)).call(profiletypesbitmask)
  end
  def get_edge_traversal(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_edge_traversal.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_edge_traversal(enabled : Int16) : HRESULT
    @lpVtbl.value.put_edge_traversal.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_action(action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_action.unsafe_as(Proc(NET_FW_ACTION*, HRESULT)).call(action)
  end
  def put_action(action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_action.unsafe_as(Proc(NET_FW_ACTION, HRESULT)).call(action)
  end
  def get_edge_traversal_options(loptions : Int32*) : HRESULT
    @lpVtbl.value.get_edge_traversal_options.unsafe_as(Proc(Int32*, HRESULT)).call(loptions)
  end
  def put_edge_traversal_options(loptions : Int32) : HRESULT
    @lpVtbl.value.put_edge_traversal_options.unsafe_as(Proc(Int32, HRESULT)).call(loptions)
  end
end
struct LibWin32::INetFwRule3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_description(desc : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(desc)
  end
  def put_description(desc : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(desc)
  end
  def get_application_name(imagefilename : UInt8**) : HRESULT
    @lpVtbl.value.get_application_name.unsafe_as(Proc(UInt8**, HRESULT)).call(imagefilename)
  end
  def put_application_name(imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.put_application_name.unsafe_as(Proc(UInt8*, HRESULT)).call(imagefilename)
  end
  def get_service_name(servicename : UInt8**) : HRESULT
    @lpVtbl.value.get_service_name.unsafe_as(Proc(UInt8**, HRESULT)).call(servicename)
  end
  def put_service_name(servicename : UInt8*) : HRESULT
    @lpVtbl.value.put_service_name.unsafe_as(Proc(UInt8*, HRESULT)).call(servicename)
  end
  def get_protocol(protocol : Int32*) : HRESULT
    @lpVtbl.value.get_protocol.unsafe_as(Proc(Int32*, HRESULT)).call(protocol)
  end
  def put_protocol(protocol : Int32) : HRESULT
    @lpVtbl.value.put_protocol.unsafe_as(Proc(Int32, HRESULT)).call(protocol)
  end
  def get_local_ports(portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_local_ports.unsafe_as(Proc(UInt8**, HRESULT)).call(portnumbers)
  end
  def put_local_ports(portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_local_ports.unsafe_as(Proc(UInt8*, HRESULT)).call(portnumbers)
  end
  def get_remote_ports(portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_ports.unsafe_as(Proc(UInt8**, HRESULT)).call(portnumbers)
  end
  def put_remote_ports(portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_ports.unsafe_as(Proc(UInt8*, HRESULT)).call(portnumbers)
  end
  def get_local_addresses(localaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_local_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(localaddrs)
  end
  def put_local_addresses(localaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_local_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(localaddrs)
  end
  def get_remote_addresses(remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.unsafe_as(Proc(UInt8**, HRESULT)).call(remoteaddrs)
  end
  def put_remote_addresses(remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.unsafe_as(Proc(UInt8*, HRESULT)).call(remoteaddrs)
  end
  def get_icmp_types_and_codes(icmptypesandcodes : UInt8**) : HRESULT
    @lpVtbl.value.get_icmp_types_and_codes.unsafe_as(Proc(UInt8**, HRESULT)).call(icmptypesandcodes)
  end
  def put_icmp_types_and_codes(icmptypesandcodes : UInt8*) : HRESULT
    @lpVtbl.value.put_icmp_types_and_codes.unsafe_as(Proc(UInt8*, HRESULT)).call(icmptypesandcodes)
  end
  def get_direction(dir : NET_FW_RULE_DIRECTION*) : HRESULT
    @lpVtbl.value.get_direction.unsafe_as(Proc(NET_FW_RULE_DIRECTION*, HRESULT)).call(dir)
  end
  def put_direction(dir : NET_FW_RULE_DIRECTION) : HRESULT
    @lpVtbl.value.put_direction.unsafe_as(Proc(NET_FW_RULE_DIRECTION, HRESULT)).call(dir)
  end
  def get_interfaces(interfaces : VARIANT*) : HRESULT
    @lpVtbl.value.get_interfaces.unsafe_as(Proc(VARIANT*, HRESULT)).call(interfaces)
  end
  def put_interfaces(interfaces : VARIANT) : HRESULT
    @lpVtbl.value.put_interfaces.unsafe_as(Proc(VARIANT, HRESULT)).call(interfaces)
  end
  def get_interface_types(interfacetypes : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_types.unsafe_as(Proc(UInt8**, HRESULT)).call(interfacetypes)
  end
  def put_interface_types(interfacetypes : UInt8*) : HRESULT
    @lpVtbl.value.put_interface_types.unsafe_as(Proc(UInt8*, HRESULT)).call(interfacetypes)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_grouping(context : UInt8**) : HRESULT
    @lpVtbl.value.get_grouping.unsafe_as(Proc(UInt8**, HRESULT)).call(context)
  end
  def put_grouping(context : UInt8*) : HRESULT
    @lpVtbl.value.put_grouping.unsafe_as(Proc(UInt8*, HRESULT)).call(context)
  end
  def get_profiles(profiletypesbitmask : Int32*) : HRESULT
    @lpVtbl.value.get_profiles.unsafe_as(Proc(Int32*, HRESULT)).call(profiletypesbitmask)
  end
  def put_profiles(profiletypesbitmask : Int32) : HRESULT
    @lpVtbl.value.put_profiles.unsafe_as(Proc(Int32, HRESULT)).call(profiletypesbitmask)
  end
  def get_edge_traversal(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_edge_traversal.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_edge_traversal(enabled : Int16) : HRESULT
    @lpVtbl.value.put_edge_traversal.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_action(action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_action.unsafe_as(Proc(NET_FW_ACTION*, HRESULT)).call(action)
  end
  def put_action(action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_action.unsafe_as(Proc(NET_FW_ACTION, HRESULT)).call(action)
  end
  def get_edge_traversal_options(loptions : Int32*) : HRESULT
    @lpVtbl.value.get_edge_traversal_options.unsafe_as(Proc(Int32*, HRESULT)).call(loptions)
  end
  def put_edge_traversal_options(loptions : Int32) : HRESULT
    @lpVtbl.value.put_edge_traversal_options.unsafe_as(Proc(Int32, HRESULT)).call(loptions)
  end
  def get_local_app_package_id(wszpackageid : UInt8**) : HRESULT
    @lpVtbl.value.get_local_app_package_id.unsafe_as(Proc(UInt8**, HRESULT)).call(wszpackageid)
  end
  def put_local_app_package_id(wszpackageid : UInt8*) : HRESULT
    @lpVtbl.value.put_local_app_package_id.unsafe_as(Proc(UInt8*, HRESULT)).call(wszpackageid)
  end
  def get_local_user_owner(wszuserowner : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_owner.unsafe_as(Proc(UInt8**, HRESULT)).call(wszuserowner)
  end
  def put_local_user_owner(wszuserowner : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_owner.unsafe_as(Proc(UInt8*, HRESULT)).call(wszuserowner)
  end
  def get_local_user_authorized_list(wszuserauthlist : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_authorized_list.unsafe_as(Proc(UInt8**, HRESULT)).call(wszuserauthlist)
  end
  def put_local_user_authorized_list(wszuserauthlist : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_authorized_list.unsafe_as(Proc(UInt8*, HRESULT)).call(wszuserauthlist)
  end
  def get_remote_user_authorized_list(wszuserauthlist : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_user_authorized_list.unsafe_as(Proc(UInt8**, HRESULT)).call(wszuserauthlist)
  end
  def put_remote_user_authorized_list(wszuserauthlist : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_user_authorized_list.unsafe_as(Proc(UInt8*, HRESULT)).call(wszuserauthlist)
  end
  def get_remote_machine_authorized_list(wszuserauthlist : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_machine_authorized_list.unsafe_as(Proc(UInt8**, HRESULT)).call(wszuserauthlist)
  end
  def put_remote_machine_authorized_list(wszuserauthlist : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_machine_authorized_list.unsafe_as(Proc(UInt8*, HRESULT)).call(wszuserauthlist)
  end
  def get_secure_flags(loptions : Int32*) : HRESULT
    @lpVtbl.value.get_secure_flags.unsafe_as(Proc(Int32*, HRESULT)).call(loptions)
  end
  def put_secure_flags(loptions : Int32) : HRESULT
    @lpVtbl.value.put_secure_flags.unsafe_as(Proc(Int32, HRESULT)).call(loptions)
  end
end
struct LibWin32::INetFwRules
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def add(rule : INetFwRule) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(INetFwRule, HRESULT)).call(rule)
  end
  def remove(name : UInt8*) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def item(name : UInt8*, rule : INetFwRule*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(UInt8*, INetFwRule*, HRESULT)).call(name, rule)
  end
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
end
struct LibWin32::INetFwServiceRestriction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def restrict_service(servicename : UInt8*, appname : UInt8*, restrictservice : Int16, servicesidrestricted : Int16) : HRESULT
    @lpVtbl.value.restrict_service.unsafe_as(Proc(UInt8*, UInt8*, Int16, Int16, HRESULT)).call(servicename, appname, restrictservice, servicesidrestricted)
  end
  def service_restricted(servicename : UInt8*, appname : UInt8*, servicerestricted : Int16*) : HRESULT
    @lpVtbl.value.service_restricted.unsafe_as(Proc(UInt8*, UInt8*, Int16*, HRESULT)).call(servicename, appname, servicerestricted)
  end
  def get_rules(rules : INetFwRules*) : HRESULT
    @lpVtbl.value.get_rules.unsafe_as(Proc(INetFwRules*, HRESULT)).call(rules)
  end
end
struct LibWin32::INetFwProfile
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(type : NET_FW_PROFILE_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(NET_FW_PROFILE_TYPE*, HRESULT)).call(type)
  end
  def get_firewall_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_firewall_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_firewall_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_firewall_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_exceptions_not_allowed(notallowed : Int16*) : HRESULT
    @lpVtbl.value.get_exceptions_not_allowed.unsafe_as(Proc(Int16*, HRESULT)).call(notallowed)
  end
  def put_exceptions_not_allowed(notallowed : Int16) : HRESULT
    @lpVtbl.value.put_exceptions_not_allowed.unsafe_as(Proc(Int16, HRESULT)).call(notallowed)
  end
  def get_notifications_disabled(disabled : Int16*) : HRESULT
    @lpVtbl.value.get_notifications_disabled.unsafe_as(Proc(Int16*, HRESULT)).call(disabled)
  end
  def put_notifications_disabled(disabled : Int16) : HRESULT
    @lpVtbl.value.put_notifications_disabled.unsafe_as(Proc(Int16, HRESULT)).call(disabled)
  end
  def get_unicast_responses_to_multicast_broadcast_disabled(disabled : Int16*) : HRESULT
    @lpVtbl.value.get_unicast_responses_to_multicast_broadcast_disabled.unsafe_as(Proc(Int16*, HRESULT)).call(disabled)
  end
  def put_unicast_responses_to_multicast_broadcast_disabled(disabled : Int16) : HRESULT
    @lpVtbl.value.put_unicast_responses_to_multicast_broadcast_disabled.unsafe_as(Proc(Int16, HRESULT)).call(disabled)
  end
  def get_remote_admin_settings(remoteadminsettings : INetFwRemoteAdminSettings*) : HRESULT
    @lpVtbl.value.get_remote_admin_settings.unsafe_as(Proc(INetFwRemoteAdminSettings*, HRESULT)).call(remoteadminsettings)
  end
  def get_icmp_settings(icmpsettings : INetFwIcmpSettings*) : HRESULT
    @lpVtbl.value.get_icmp_settings.unsafe_as(Proc(INetFwIcmpSettings*, HRESULT)).call(icmpsettings)
  end
  def get_globally_open_ports(openports : INetFwOpenPorts*) : HRESULT
    @lpVtbl.value.get_globally_open_ports.unsafe_as(Proc(INetFwOpenPorts*, HRESULT)).call(openports)
  end
  def get_services(services : INetFwServices*) : HRESULT
    @lpVtbl.value.get_services.unsafe_as(Proc(INetFwServices*, HRESULT)).call(services)
  end
  def get_authorized_applications(apps : INetFwAuthorizedApplications*) : HRESULT
    @lpVtbl.value.get_authorized_applications.unsafe_as(Proc(INetFwAuthorizedApplications*, HRESULT)).call(apps)
  end
end
struct LibWin32::INetFwPolicy
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_current_profile(profile : INetFwProfile*) : HRESULT
    @lpVtbl.value.get_current_profile.unsafe_as(Proc(INetFwProfile*, HRESULT)).call(profile)
  end
  def get_profile_by_type(profiletype : NET_FW_PROFILE_TYPE, profile : INetFwProfile*) : HRESULT
    @lpVtbl.value.get_profile_by_type.unsafe_as(Proc(NET_FW_PROFILE_TYPE, INetFwProfile*, HRESULT)).call(profiletype, profile)
  end
end
struct LibWin32::INetFwPolicy2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_current_profile_types(profiletypesbitmask : Int32*) : HRESULT
    @lpVtbl.value.get_current_profile_types.unsafe_as(Proc(Int32*, HRESULT)).call(profiletypesbitmask)
  end
  def get_firewall_enabled(profiletype : NET_FW_PROFILE_TYPE2, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_firewall_enabled.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, Int16*, HRESULT)).call(profiletype, enabled)
  end
  def put_firewall_enabled(profiletype : NET_FW_PROFILE_TYPE2, enabled : Int16) : HRESULT
    @lpVtbl.value.put_firewall_enabled.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, Int16, HRESULT)).call(profiletype, enabled)
  end
  def get_excluded_interfaces(profiletype : NET_FW_PROFILE_TYPE2, interfaces : VARIANT*) : HRESULT
    @lpVtbl.value.get_excluded_interfaces.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, VARIANT*, HRESULT)).call(profiletype, interfaces)
  end
  def put_excluded_interfaces(profiletype : NET_FW_PROFILE_TYPE2, interfaces : VARIANT) : HRESULT
    @lpVtbl.value.put_excluded_interfaces.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, VARIANT, HRESULT)).call(profiletype, interfaces)
  end
  def get_block_all_inbound_traffic(profiletype : NET_FW_PROFILE_TYPE2, block : Int16*) : HRESULT
    @lpVtbl.value.get_block_all_inbound_traffic.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, Int16*, HRESULT)).call(profiletype, block)
  end
  def put_block_all_inbound_traffic(profiletype : NET_FW_PROFILE_TYPE2, block : Int16) : HRESULT
    @lpVtbl.value.put_block_all_inbound_traffic.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, Int16, HRESULT)).call(profiletype, block)
  end
  def get_notifications_disabled(profiletype : NET_FW_PROFILE_TYPE2, disabled : Int16*) : HRESULT
    @lpVtbl.value.get_notifications_disabled.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, Int16*, HRESULT)).call(profiletype, disabled)
  end
  def put_notifications_disabled(profiletype : NET_FW_PROFILE_TYPE2, disabled : Int16) : HRESULT
    @lpVtbl.value.put_notifications_disabled.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, Int16, HRESULT)).call(profiletype, disabled)
  end
  def get_unicast_responses_to_multicast_broadcast_disabled(profiletype : NET_FW_PROFILE_TYPE2, disabled : Int16*) : HRESULT
    @lpVtbl.value.get_unicast_responses_to_multicast_broadcast_disabled.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, Int16*, HRESULT)).call(profiletype, disabled)
  end
  def put_unicast_responses_to_multicast_broadcast_disabled(profiletype : NET_FW_PROFILE_TYPE2, disabled : Int16) : HRESULT
    @lpVtbl.value.put_unicast_responses_to_multicast_broadcast_disabled.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, Int16, HRESULT)).call(profiletype, disabled)
  end
  def get_rules(rules : INetFwRules*) : HRESULT
    @lpVtbl.value.get_rules.unsafe_as(Proc(INetFwRules*, HRESULT)).call(rules)
  end
  def get_service_restriction(servicerestriction : INetFwServiceRestriction*) : HRESULT
    @lpVtbl.value.get_service_restriction.unsafe_as(Proc(INetFwServiceRestriction*, HRESULT)).call(servicerestriction)
  end
  def enable_rule_group(profiletypesbitmask : Int32, group : UInt8*, enable : Int16) : HRESULT
    @lpVtbl.value.enable_rule_group.unsafe_as(Proc(Int32, UInt8*, Int16, HRESULT)).call(profiletypesbitmask, group, enable)
  end
  def is_rule_group_enabled(profiletypesbitmask : Int32, group : UInt8*, enabled : Int16*) : HRESULT
    @lpVtbl.value.is_rule_group_enabled.unsafe_as(Proc(Int32, UInt8*, Int16*, HRESULT)).call(profiletypesbitmask, group, enabled)
  end
  def restore_local_firewall_defaults : HRESULT
    @lpVtbl.value.restore_local_firewall_defaults.unsafe_as(Proc(HRESULT)).call
  end
  def get_default_inbound_action(profiletype : NET_FW_PROFILE_TYPE2, action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_default_inbound_action.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, NET_FW_ACTION*, HRESULT)).call(profiletype, action)
  end
  def put_default_inbound_action(profiletype : NET_FW_PROFILE_TYPE2, action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_default_inbound_action.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, NET_FW_ACTION, HRESULT)).call(profiletype, action)
  end
  def get_default_outbound_action(profiletype : NET_FW_PROFILE_TYPE2, action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_default_outbound_action.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, NET_FW_ACTION*, HRESULT)).call(profiletype, action)
  end
  def put_default_outbound_action(profiletype : NET_FW_PROFILE_TYPE2, action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_default_outbound_action.unsafe_as(Proc(NET_FW_PROFILE_TYPE2, NET_FW_ACTION, HRESULT)).call(profiletype, action)
  end
  def get_is_rule_group_currently_enabled(group : UInt8*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_is_rule_group_currently_enabled.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(group, enabled)
  end
  def get_local_policy_modify_state(modifystate : NET_FW_MODIFY_STATE*) : HRESULT
    @lpVtbl.value.get_local_policy_modify_state.unsafe_as(Proc(NET_FW_MODIFY_STATE*, HRESULT)).call(modifystate)
  end
end
struct LibWin32::INetFwMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_local_policy(localpolicy : INetFwPolicy*) : HRESULT
    @lpVtbl.value.get_local_policy.unsafe_as(Proc(INetFwPolicy*, HRESULT)).call(localpolicy)
  end
  def get_current_profile_type(profiletype : NET_FW_PROFILE_TYPE*) : HRESULT
    @lpVtbl.value.get_current_profile_type.unsafe_as(Proc(NET_FW_PROFILE_TYPE*, HRESULT)).call(profiletype)
  end
  def restore_defaults : HRESULT
    @lpVtbl.value.restore_defaults.unsafe_as(Proc(HRESULT)).call
  end
  def is_port_allowed(imagefilename : UInt8*, ipversion : NET_FW_IP_VERSION, portnumber : Int32, localaddress : UInt8*, ipprotocol : NET_FW_IP_PROTOCOL, allowed : VARIANT*, restricted : VARIANT*) : HRESULT
    @lpVtbl.value.is_port_allowed.unsafe_as(Proc(UInt8*, NET_FW_IP_VERSION, Int32, UInt8*, NET_FW_IP_PROTOCOL, VARIANT*, VARIANT*, HRESULT)).call(imagefilename, ipversion, portnumber, localaddress, ipprotocol, allowed, restricted)
  end
  def is_icmp_type_allowed(ipversion : NET_FW_IP_VERSION, localaddress : UInt8*, type : UInt8, allowed : VARIANT*, restricted : VARIANT*) : HRESULT
    @lpVtbl.value.is_icmp_type_allowed.unsafe_as(Proc(NET_FW_IP_VERSION, UInt8*, UInt8, VARIANT*, VARIANT*, HRESULT)).call(ipversion, localaddress, type, allowed, restricted)
  end
end
struct LibWin32::INetFwProduct
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_rule_categories(rulecategories : VARIANT*) : HRESULT
    @lpVtbl.value.get_rule_categories.unsafe_as(Proc(VARIANT*, HRESULT)).call(rulecategories)
  end
  def put_rule_categories(rulecategories : VARIANT) : HRESULT
    @lpVtbl.value.put_rule_categories.unsafe_as(Proc(VARIANT, HRESULT)).call(rulecategories)
  end
  def get_display_name(displayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(displayname)
  end
  def put_display_name(displayname : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.unsafe_as(Proc(UInt8*, HRESULT)).call(displayname)
  end
  def get_path_to_signed_product_exe(path : UInt8**) : HRESULT
    @lpVtbl.value.get_path_to_signed_product_exe.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
end
struct LibWin32::INetFwProducts
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def register(product : INetFwProduct, registration : IUnknown*) : HRESULT
    @lpVtbl.value.register.unsafe_as(Proc(INetFwProduct, IUnknown*, HRESULT)).call(product, registration)
  end
  def item(index : Int32, product : INetFwProduct*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, INetFwProduct*, HRESULT)).call(index, product)
  end
  def get__new_enum(newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(newenum)
  end
end
