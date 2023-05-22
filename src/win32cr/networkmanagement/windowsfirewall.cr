require "../system/com.cr"
require "../foundation.cr"
require "../security.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-net-isolation-l1-1-0.dll")]
lib LibWin32
  NETCON_MAX_NAME_LEN = 256_u32
  S_OBJECT_NO_LONGER_VALID = 2_i32
  NETISO_GEID_FOR_WDAG = 1_u32
  NETISO_GEID_FOR_NEUTRAL_AWARE = 2_u32
  UPnPNAT = LibC::GUID.new(0xae1e00aa_u32, 0x3fd5_u16, 0x403c_u16, StaticArray[0x8a_u8, 0x27_u8, 0x2b_u8, 0xbd_u8, 0xc3_u8, 0xc_u8, 0xd0_u8, 0xe1_u8])
  NetSharingManager = LibC::GUID.new(0x5c63c1ad_u32, 0x3956_u16, 0x4ff8_u16, StaticArray[0x84_u8, 0x86_u8, 0x40_u8, 0x3_u8, 0x47_u8, 0x58_u8, 0x31_u8, 0x5b_u8])
  NetFwRule = LibC::GUID.new(0x2c5bc43e_u32, 0x3369_u16, 0x4c33_u16, StaticArray[0xab_u8, 0xc_u8, 0xbe_u8, 0x94_u8, 0x69_u8, 0x67_u8, 0x7a_u8, 0xf4_u8])
  NetFwOpenPort = LibC::GUID.new(0xca545c6_u32, 0x37ad_u16, 0x4a6c_u16, StaticArray[0xbf_u8, 0x92_u8, 0x9f_u8, 0x76_u8, 0x10_u8, 0x6_u8, 0x7e_u8, 0xf5_u8])
  NetFwAuthorizedApplication = LibC::GUID.new(0xec9846b3_u32, 0x2762_u16, 0x4a6b_u16, StaticArray[0xa2_u8, 0x14_u8, 0x6a_u8, 0xcb_u8, 0x60_u8, 0x34_u8, 0x62_u8, 0xd2_u8])
  NetFwPolicy2 = LibC::GUID.new(0xe2b3c97f_u32, 0x6ae1_u16, 0x41ac_u16, StaticArray[0x81_u8, 0x7a_u8, 0xf6_u8, 0xf9_u8, 0x21_u8, 0x66_u8, 0xd7_u8, 0xdd_u8])
  NetFwProduct = LibC::GUID.new(0x9d745ed8_u32, 0xc514_u16, 0x4d1d_u16, StaticArray[0xbf_u8, 0x42_u8, 0x75_u8, 0x1f_u8, 0xed_u8, 0x2d_u8, 0x5a_u8, 0xc7_u8])
  NetFwProducts = LibC::GUID.new(0xcc19079b_u32, 0x8272_u16, 0x4d73_u16, StaticArray[0xbb_u8, 0x70_u8, 0xcd_u8, 0xb5_u8, 0x33_u8, 0x52_u8, 0x7b_u8, 0x61_u8])
  NetFwMgr = LibC::GUID.new(0x304ce942_u32, 0x6e39_u16, 0x40d8_u16, StaticArray[0x94_u8, 0x3a_u8, 0xb9_u8, 0x13_u8, 0xc4_u8, 0xc_u8, 0x9c_u8, 0xd4_u8])

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
    query_interface : Proc(IUPnPNAT*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPNAT*, UInt32)
    release : Proc(IUPnPNAT*, UInt32)
    get_type_info_count : Proc(IUPnPNAT*, UInt32*, HRESULT)
    get_type_info : Proc(IUPnPNAT*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUPnPNAT*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUPnPNAT*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_static_port_mapping_collection : Proc(IUPnPNAT*, IStaticPortMappingCollection*, HRESULT)
    get_dynamic_port_mapping_collection : Proc(IUPnPNAT*, IDynamicPortMappingCollection*, HRESULT)
    get_nat_event_manager : Proc(IUPnPNAT*, INATEventManager*, HRESULT)
  end

  struct IUPnPNAT
    lpVtbl : IUPnPNATVTbl*
  end

  struct INATEventManagerVTbl
    query_interface : Proc(INATEventManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(INATEventManager*, UInt32)
    release : Proc(INATEventManager*, UInt32)
    get_type_info_count : Proc(INATEventManager*, UInt32*, HRESULT)
    get_type_info : Proc(INATEventManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INATEventManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INATEventManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    put_external_ip_address_callback : Proc(INATEventManager*, IUnknown, HRESULT)
    put_number_of_entries_callback : Proc(INATEventManager*, IUnknown, HRESULT)
  end

  struct INATEventManager
    lpVtbl : INATEventManagerVTbl*
  end

  struct INATExternalIPAddressCallbackVTbl
    query_interface : Proc(INATExternalIPAddressCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(INATExternalIPAddressCallback*, UInt32)
    release : Proc(INATExternalIPAddressCallback*, UInt32)
    new_external_ip_address : Proc(INATExternalIPAddressCallback*, UInt8, HRESULT)
  end

  struct INATExternalIPAddressCallback
    lpVtbl : INATExternalIPAddressCallbackVTbl*
  end

  struct INATNumberOfEntriesCallbackVTbl
    query_interface : Proc(INATNumberOfEntriesCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(INATNumberOfEntriesCallback*, UInt32)
    release : Proc(INATNumberOfEntriesCallback*, UInt32)
    new_number_of_entries : Proc(INATNumberOfEntriesCallback*, Int32, HRESULT)
  end

  struct INATNumberOfEntriesCallback
    lpVtbl : INATNumberOfEntriesCallbackVTbl*
  end

  struct IDynamicPortMappingCollectionVTbl
    query_interface : Proc(IDynamicPortMappingCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDynamicPortMappingCollection*, UInt32)
    release : Proc(IDynamicPortMappingCollection*, UInt32)
    get_type_info_count : Proc(IDynamicPortMappingCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IDynamicPortMappingCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDynamicPortMappingCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDynamicPortMappingCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IDynamicPortMappingCollection*, IUnknown*, HRESULT)
    get_item : Proc(IDynamicPortMappingCollection*, UInt8, Int32, UInt8, IDynamicPortMapping*, HRESULT)
    get_count : Proc(IDynamicPortMappingCollection*, Int32*, HRESULT)
    remove : Proc(IDynamicPortMappingCollection*, UInt8, Int32, UInt8, HRESULT)
    add : Proc(IDynamicPortMappingCollection*, UInt8, Int32, UInt8, Int32, UInt8, Int16, UInt8, Int32, IDynamicPortMapping*, HRESULT)
  end

  struct IDynamicPortMappingCollection
    lpVtbl : IDynamicPortMappingCollectionVTbl*
  end

  struct IDynamicPortMappingVTbl
    query_interface : Proc(IDynamicPortMapping*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDynamicPortMapping*, UInt32)
    release : Proc(IDynamicPortMapping*, UInt32)
    get_type_info_count : Proc(IDynamicPortMapping*, UInt32*, HRESULT)
    get_type_info : Proc(IDynamicPortMapping*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDynamicPortMapping*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDynamicPortMapping*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_external_ip_address : Proc(IDynamicPortMapping*, UInt8*, HRESULT)
    get_remote_host : Proc(IDynamicPortMapping*, UInt8*, HRESULT)
    get_external_port : Proc(IDynamicPortMapping*, Int32*, HRESULT)
    get_protocol : Proc(IDynamicPortMapping*, UInt8*, HRESULT)
    get_internal_port : Proc(IDynamicPortMapping*, Int32*, HRESULT)
    get_internal_client : Proc(IDynamicPortMapping*, UInt8*, HRESULT)
    get_enabled : Proc(IDynamicPortMapping*, Int16*, HRESULT)
    get_description : Proc(IDynamicPortMapping*, UInt8*, HRESULT)
    get_lease_duration : Proc(IDynamicPortMapping*, Int32*, HRESULT)
    renew_lease : Proc(IDynamicPortMapping*, Int32, Int32*, HRESULT)
    edit_internal_client : Proc(IDynamicPortMapping*, UInt8, HRESULT)
    enable : Proc(IDynamicPortMapping*, Int16, HRESULT)
    edit_description : Proc(IDynamicPortMapping*, UInt8, HRESULT)
    edit_internal_port : Proc(IDynamicPortMapping*, Int32, HRESULT)
  end

  struct IDynamicPortMapping
    lpVtbl : IDynamicPortMappingVTbl*
  end

  struct IStaticPortMappingCollectionVTbl
    query_interface : Proc(IStaticPortMappingCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStaticPortMappingCollection*, UInt32)
    release : Proc(IStaticPortMappingCollection*, UInt32)
    get_type_info_count : Proc(IStaticPortMappingCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IStaticPortMappingCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IStaticPortMappingCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IStaticPortMappingCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IStaticPortMappingCollection*, IUnknown*, HRESULT)
    get_item : Proc(IStaticPortMappingCollection*, Int32, UInt8, IStaticPortMapping*, HRESULT)
    get_count : Proc(IStaticPortMappingCollection*, Int32*, HRESULT)
    remove : Proc(IStaticPortMappingCollection*, Int32, UInt8, HRESULT)
    add : Proc(IStaticPortMappingCollection*, Int32, UInt8, Int32, UInt8, Int16, UInt8, IStaticPortMapping*, HRESULT)
  end

  struct IStaticPortMappingCollection
    lpVtbl : IStaticPortMappingCollectionVTbl*
  end

  struct IStaticPortMappingVTbl
    query_interface : Proc(IStaticPortMapping*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStaticPortMapping*, UInt32)
    release : Proc(IStaticPortMapping*, UInt32)
    get_type_info_count : Proc(IStaticPortMapping*, UInt32*, HRESULT)
    get_type_info : Proc(IStaticPortMapping*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IStaticPortMapping*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IStaticPortMapping*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_external_ip_address : Proc(IStaticPortMapping*, UInt8*, HRESULT)
    get_external_port : Proc(IStaticPortMapping*, Int32*, HRESULT)
    get_internal_port : Proc(IStaticPortMapping*, Int32*, HRESULT)
    get_protocol : Proc(IStaticPortMapping*, UInt8*, HRESULT)
    get_internal_client : Proc(IStaticPortMapping*, UInt8*, HRESULT)
    get_enabled : Proc(IStaticPortMapping*, Int16*, HRESULT)
    get_description : Proc(IStaticPortMapping*, UInt8*, HRESULT)
    edit_internal_client : Proc(IStaticPortMapping*, UInt8, HRESULT)
    enable : Proc(IStaticPortMapping*, Int16, HRESULT)
    edit_description : Proc(IStaticPortMapping*, UInt8, HRESULT)
    edit_internal_port : Proc(IStaticPortMapping*, Int32, HRESULT)
  end

  struct IStaticPortMapping
    lpVtbl : IStaticPortMappingVTbl*
  end

  struct IEnumNetConnectionVTbl
    query_interface : Proc(IEnumNetConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetConnection*, UInt32)
    release : Proc(IEnumNetConnection*, UInt32)
    next : Proc(IEnumNetConnection*, UInt32, INetConnection*, UInt32*, HRESULT)
    skip : Proc(IEnumNetConnection*, UInt32, HRESULT)
    reset : Proc(IEnumNetConnection*, HRESULT)
    clone : Proc(IEnumNetConnection*, IEnumNetConnection*, HRESULT)
  end

  struct IEnumNetConnection
    lpVtbl : IEnumNetConnectionVTbl*
  end

  struct INetConnectionVTbl
    query_interface : Proc(INetConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetConnection*, UInt32)
    release : Proc(INetConnection*, UInt32)
    connect : Proc(INetConnection*, HRESULT)
    disconnect : Proc(INetConnection*, HRESULT)
    delete : Proc(INetConnection*, HRESULT)
    duplicate : Proc(INetConnection*, LibC::LPWSTR, INetConnection*, HRESULT)
    get_properties : Proc(INetConnection*, NETCON_PROPERTIES**, HRESULT)
    get_ui_object_class_id : Proc(INetConnection*, Guid*, HRESULT)
    rename : Proc(INetConnection*, LibC::LPWSTR, HRESULT)
  end

  struct INetConnection
    lpVtbl : INetConnectionVTbl*
  end

  struct INetConnectionManagerVTbl
    query_interface : Proc(INetConnectionManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetConnectionManager*, UInt32)
    release : Proc(INetConnectionManager*, UInt32)
    enum_connections : Proc(INetConnectionManager*, NETCONMGR_ENUM_FLAGS, IEnumNetConnection*, HRESULT)
  end

  struct INetConnectionManager
    lpVtbl : INetConnectionManagerVTbl*
  end

  struct INetConnectionConnectUiVTbl
    query_interface : Proc(INetConnectionConnectUi*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetConnectionConnectUi*, UInt32)
    release : Proc(INetConnectionConnectUi*, UInt32)
    set_connection : Proc(INetConnectionConnectUi*, INetConnection, HRESULT)
    connect : Proc(INetConnectionConnectUi*, LibC::HANDLE, UInt32, HRESULT)
    disconnect : Proc(INetConnectionConnectUi*, LibC::HANDLE, UInt32, HRESULT)
  end

  struct INetConnectionConnectUi
    lpVtbl : INetConnectionConnectUiVTbl*
  end

  struct IEnumNetSharingPortMappingVTbl
    query_interface : Proc(IEnumNetSharingPortMapping*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetSharingPortMapping*, UInt32)
    release : Proc(IEnumNetSharingPortMapping*, UInt32)
    next : Proc(IEnumNetSharingPortMapping*, UInt32, VARIANT*, UInt32*, HRESULT)
    skip : Proc(IEnumNetSharingPortMapping*, UInt32, HRESULT)
    reset : Proc(IEnumNetSharingPortMapping*, HRESULT)
    clone : Proc(IEnumNetSharingPortMapping*, IEnumNetSharingPortMapping*, HRESULT)
  end

  struct IEnumNetSharingPortMapping
    lpVtbl : IEnumNetSharingPortMappingVTbl*
  end

  struct INetSharingPortMappingPropsVTbl
    query_interface : Proc(INetSharingPortMappingProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetSharingPortMappingProps*, UInt32)
    release : Proc(INetSharingPortMappingProps*, UInt32)
    get_type_info_count : Proc(INetSharingPortMappingProps*, UInt32*, HRESULT)
    get_type_info : Proc(INetSharingPortMappingProps*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetSharingPortMappingProps*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetSharingPortMappingProps*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(INetSharingPortMappingProps*, UInt8*, HRESULT)
    get_ip_protocol : Proc(INetSharingPortMappingProps*, UInt8*, HRESULT)
    get_external_port : Proc(INetSharingPortMappingProps*, Int32*, HRESULT)
    get_internal_port : Proc(INetSharingPortMappingProps*, Int32*, HRESULT)
    get_options : Proc(INetSharingPortMappingProps*, Int32*, HRESULT)
    get_target_name : Proc(INetSharingPortMappingProps*, UInt8*, HRESULT)
    get_target_ip_address : Proc(INetSharingPortMappingProps*, UInt8*, HRESULT)
    get_enabled : Proc(INetSharingPortMappingProps*, Int16*, HRESULT)
  end

  struct INetSharingPortMappingProps
    lpVtbl : INetSharingPortMappingPropsVTbl*
  end

  struct INetSharingPortMappingVTbl
    query_interface : Proc(INetSharingPortMapping*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetSharingPortMapping*, UInt32)
    release : Proc(INetSharingPortMapping*, UInt32)
    get_type_info_count : Proc(INetSharingPortMapping*, UInt32*, HRESULT)
    get_type_info : Proc(INetSharingPortMapping*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetSharingPortMapping*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetSharingPortMapping*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    disable : Proc(INetSharingPortMapping*, HRESULT)
    enable : Proc(INetSharingPortMapping*, HRESULT)
    get_properties : Proc(INetSharingPortMapping*, INetSharingPortMappingProps*, HRESULT)
    delete : Proc(INetSharingPortMapping*, HRESULT)
  end

  struct INetSharingPortMapping
    lpVtbl : INetSharingPortMappingVTbl*
  end

  struct IEnumNetSharingEveryConnectionVTbl
    query_interface : Proc(IEnumNetSharingEveryConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetSharingEveryConnection*, UInt32)
    release : Proc(IEnumNetSharingEveryConnection*, UInt32)
    next : Proc(IEnumNetSharingEveryConnection*, UInt32, VARIANT*, UInt32*, HRESULT)
    skip : Proc(IEnumNetSharingEveryConnection*, UInt32, HRESULT)
    reset : Proc(IEnumNetSharingEveryConnection*, HRESULT)
    clone : Proc(IEnumNetSharingEveryConnection*, IEnumNetSharingEveryConnection*, HRESULT)
  end

  struct IEnumNetSharingEveryConnection
    lpVtbl : IEnumNetSharingEveryConnectionVTbl*
  end

  struct IEnumNetSharingPublicConnectionVTbl
    query_interface : Proc(IEnumNetSharingPublicConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetSharingPublicConnection*, UInt32)
    release : Proc(IEnumNetSharingPublicConnection*, UInt32)
    next : Proc(IEnumNetSharingPublicConnection*, UInt32, VARIANT*, UInt32*, HRESULT)
    skip : Proc(IEnumNetSharingPublicConnection*, UInt32, HRESULT)
    reset : Proc(IEnumNetSharingPublicConnection*, HRESULT)
    clone : Proc(IEnumNetSharingPublicConnection*, IEnumNetSharingPublicConnection*, HRESULT)
  end

  struct IEnumNetSharingPublicConnection
    lpVtbl : IEnumNetSharingPublicConnectionVTbl*
  end

  struct IEnumNetSharingPrivateConnectionVTbl
    query_interface : Proc(IEnumNetSharingPrivateConnection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetSharingPrivateConnection*, UInt32)
    release : Proc(IEnumNetSharingPrivateConnection*, UInt32)
    next : Proc(IEnumNetSharingPrivateConnection*, UInt32, VARIANT*, UInt32*, HRESULT)
    skip : Proc(IEnumNetSharingPrivateConnection*, UInt32, HRESULT)
    reset : Proc(IEnumNetSharingPrivateConnection*, HRESULT)
    clone : Proc(IEnumNetSharingPrivateConnection*, IEnumNetSharingPrivateConnection*, HRESULT)
  end

  struct IEnumNetSharingPrivateConnection
    lpVtbl : IEnumNetSharingPrivateConnectionVTbl*
  end

  struct INetSharingPortMappingCollectionVTbl
    query_interface : Proc(INetSharingPortMappingCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetSharingPortMappingCollection*, UInt32)
    release : Proc(INetSharingPortMappingCollection*, UInt32)
    get_type_info_count : Proc(INetSharingPortMappingCollection*, UInt32*, HRESULT)
    get_type_info : Proc(INetSharingPortMappingCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetSharingPortMappingCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetSharingPortMappingCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(INetSharingPortMappingCollection*, IUnknown*, HRESULT)
    get_count : Proc(INetSharingPortMappingCollection*, Int32*, HRESULT)
  end

  struct INetSharingPortMappingCollection
    lpVtbl : INetSharingPortMappingCollectionVTbl*
  end

  struct INetConnectionPropsVTbl
    query_interface : Proc(INetConnectionProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetConnectionProps*, UInt32)
    release : Proc(INetConnectionProps*, UInt32)
    get_type_info_count : Proc(INetConnectionProps*, UInt32*, HRESULT)
    get_type_info : Proc(INetConnectionProps*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetConnectionProps*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetConnectionProps*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_guid : Proc(INetConnectionProps*, UInt8*, HRESULT)
    get_name : Proc(INetConnectionProps*, UInt8*, HRESULT)
    get_device_name : Proc(INetConnectionProps*, UInt8*, HRESULT)
    get_status : Proc(INetConnectionProps*, NETCON_STATUS*, HRESULT)
    get_media_type : Proc(INetConnectionProps*, NETCON_MEDIATYPE*, HRESULT)
    get_characteristics : Proc(INetConnectionProps*, UInt32*, HRESULT)
  end

  struct INetConnectionProps
    lpVtbl : INetConnectionPropsVTbl*
  end

  struct INetSharingConfigurationVTbl
    query_interface : Proc(INetSharingConfiguration*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetSharingConfiguration*, UInt32)
    release : Proc(INetSharingConfiguration*, UInt32)
    get_type_info_count : Proc(INetSharingConfiguration*, UInt32*, HRESULT)
    get_type_info : Proc(INetSharingConfiguration*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetSharingConfiguration*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetSharingConfiguration*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_sharing_enabled : Proc(INetSharingConfiguration*, Int16*, HRESULT)
    get_sharing_connection_type : Proc(INetSharingConfiguration*, SHARINGCONNECTIONTYPE*, HRESULT)
    disable_sharing : Proc(INetSharingConfiguration*, HRESULT)
    enable_sharing : Proc(INetSharingConfiguration*, SHARINGCONNECTIONTYPE, HRESULT)
    get_internet_firewall_enabled : Proc(INetSharingConfiguration*, Int16*, HRESULT)
    disable_internet_firewall : Proc(INetSharingConfiguration*, HRESULT)
    enable_internet_firewall : Proc(INetSharingConfiguration*, HRESULT)
    get_enum_port_mappings : Proc(INetSharingConfiguration*, SHARINGCONNECTION_ENUM_FLAGS, INetSharingPortMappingCollection*, HRESULT)
    add_port_mapping : Proc(INetSharingConfiguration*, UInt8, UInt8, UInt16, UInt16, UInt32, UInt8, ICS_TARGETTYPE, INetSharingPortMapping*, HRESULT)
    remove_port_mapping : Proc(INetSharingConfiguration*, INetSharingPortMapping, HRESULT)
  end

  struct INetSharingConfiguration
    lpVtbl : INetSharingConfigurationVTbl*
  end

  struct INetSharingEveryConnectionCollectionVTbl
    query_interface : Proc(INetSharingEveryConnectionCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetSharingEveryConnectionCollection*, UInt32)
    release : Proc(INetSharingEveryConnectionCollection*, UInt32)
    get_type_info_count : Proc(INetSharingEveryConnectionCollection*, UInt32*, HRESULT)
    get_type_info : Proc(INetSharingEveryConnectionCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetSharingEveryConnectionCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetSharingEveryConnectionCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(INetSharingEveryConnectionCollection*, IUnknown*, HRESULT)
    get_count : Proc(INetSharingEveryConnectionCollection*, Int32*, HRESULT)
  end

  struct INetSharingEveryConnectionCollection
    lpVtbl : INetSharingEveryConnectionCollectionVTbl*
  end

  struct INetSharingPublicConnectionCollectionVTbl
    query_interface : Proc(INetSharingPublicConnectionCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetSharingPublicConnectionCollection*, UInt32)
    release : Proc(INetSharingPublicConnectionCollection*, UInt32)
    get_type_info_count : Proc(INetSharingPublicConnectionCollection*, UInt32*, HRESULT)
    get_type_info : Proc(INetSharingPublicConnectionCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetSharingPublicConnectionCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetSharingPublicConnectionCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(INetSharingPublicConnectionCollection*, IUnknown*, HRESULT)
    get_count : Proc(INetSharingPublicConnectionCollection*, Int32*, HRESULT)
  end

  struct INetSharingPublicConnectionCollection
    lpVtbl : INetSharingPublicConnectionCollectionVTbl*
  end

  struct INetSharingPrivateConnectionCollectionVTbl
    query_interface : Proc(INetSharingPrivateConnectionCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetSharingPrivateConnectionCollection*, UInt32)
    release : Proc(INetSharingPrivateConnectionCollection*, UInt32)
    get_type_info_count : Proc(INetSharingPrivateConnectionCollection*, UInt32*, HRESULT)
    get_type_info : Proc(INetSharingPrivateConnectionCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetSharingPrivateConnectionCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetSharingPrivateConnectionCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(INetSharingPrivateConnectionCollection*, IUnknown*, HRESULT)
    get_count : Proc(INetSharingPrivateConnectionCollection*, Int32*, HRESULT)
  end

  struct INetSharingPrivateConnectionCollection
    lpVtbl : INetSharingPrivateConnectionCollectionVTbl*
  end

  struct INetSharingManagerVTbl
    query_interface : Proc(INetSharingManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetSharingManager*, UInt32)
    release : Proc(INetSharingManager*, UInt32)
    get_type_info_count : Proc(INetSharingManager*, UInt32*, HRESULT)
    get_type_info : Proc(INetSharingManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetSharingManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetSharingManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_sharing_installed : Proc(INetSharingManager*, Int16*, HRESULT)
    get_enum_public_connections : Proc(INetSharingManager*, SHARINGCONNECTION_ENUM_FLAGS, INetSharingPublicConnectionCollection*, HRESULT)
    get_enum_private_connections : Proc(INetSharingManager*, SHARINGCONNECTION_ENUM_FLAGS, INetSharingPrivateConnectionCollection*, HRESULT)
    get_i_net_sharing_configuration_for_i_net_connection : Proc(INetSharingManager*, INetConnection, INetSharingConfiguration*, HRESULT)
    get_enum_every_connection : Proc(INetSharingManager*, INetSharingEveryConnectionCollection*, HRESULT)
    get_net_connection_props : Proc(INetSharingManager*, INetConnection, INetConnectionProps*, HRESULT)
  end

  struct INetSharingManager
    lpVtbl : INetSharingManagerVTbl*
  end

  struct INetFwRemoteAdminSettingsVTbl
    query_interface : Proc(INetFwRemoteAdminSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwRemoteAdminSettings*, UInt32)
    release : Proc(INetFwRemoteAdminSettings*, UInt32)
    get_type_info_count : Proc(INetFwRemoteAdminSettings*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwRemoteAdminSettings*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwRemoteAdminSettings*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwRemoteAdminSettings*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_ip_version : Proc(INetFwRemoteAdminSettings*, NET_FW_IP_VERSION*, HRESULT)
    put_ip_version : Proc(INetFwRemoteAdminSettings*, NET_FW_IP_VERSION, HRESULT)
    get_scope : Proc(INetFwRemoteAdminSettings*, NET_FW_SCOPE*, HRESULT)
    put_scope : Proc(INetFwRemoteAdminSettings*, NET_FW_SCOPE, HRESULT)
    get_remote_addresses : Proc(INetFwRemoteAdminSettings*, UInt8*, HRESULT)
    put_remote_addresses : Proc(INetFwRemoteAdminSettings*, UInt8, HRESULT)
    get_enabled : Proc(INetFwRemoteAdminSettings*, Int16*, HRESULT)
    put_enabled : Proc(INetFwRemoteAdminSettings*, Int16, HRESULT)
  end

  struct INetFwRemoteAdminSettings
    lpVtbl : INetFwRemoteAdminSettingsVTbl*
  end

  struct INetFwIcmpSettingsVTbl
    query_interface : Proc(INetFwIcmpSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwIcmpSettings*, UInt32)
    release : Proc(INetFwIcmpSettings*, UInt32)
    get_type_info_count : Proc(INetFwIcmpSettings*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwIcmpSettings*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwIcmpSettings*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwIcmpSettings*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_allow_outbound_destination_unreachable : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_outbound_destination_unreachable : Proc(INetFwIcmpSettings*, Int16, HRESULT)
    get_allow_redirect : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_redirect : Proc(INetFwIcmpSettings*, Int16, HRESULT)
    get_allow_inbound_echo_request : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_inbound_echo_request : Proc(INetFwIcmpSettings*, Int16, HRESULT)
    get_allow_outbound_time_exceeded : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_outbound_time_exceeded : Proc(INetFwIcmpSettings*, Int16, HRESULT)
    get_allow_outbound_parameter_problem : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_outbound_parameter_problem : Proc(INetFwIcmpSettings*, Int16, HRESULT)
    get_allow_outbound_source_quench : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_outbound_source_quench : Proc(INetFwIcmpSettings*, Int16, HRESULT)
    get_allow_inbound_router_request : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_inbound_router_request : Proc(INetFwIcmpSettings*, Int16, HRESULT)
    get_allow_inbound_timestamp_request : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_inbound_timestamp_request : Proc(INetFwIcmpSettings*, Int16, HRESULT)
    get_allow_inbound_mask_request : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_inbound_mask_request : Proc(INetFwIcmpSettings*, Int16, HRESULT)
    get_allow_outbound_packet_too_big : Proc(INetFwIcmpSettings*, Int16*, HRESULT)
    put_allow_outbound_packet_too_big : Proc(INetFwIcmpSettings*, Int16, HRESULT)
  end

  struct INetFwIcmpSettings
    lpVtbl : INetFwIcmpSettingsVTbl*
  end

  struct INetFwOpenPortVTbl
    query_interface : Proc(INetFwOpenPort*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwOpenPort*, UInt32)
    release : Proc(INetFwOpenPort*, UInt32)
    get_type_info_count : Proc(INetFwOpenPort*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwOpenPort*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwOpenPort*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwOpenPort*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(INetFwOpenPort*, UInt8*, HRESULT)
    put_name : Proc(INetFwOpenPort*, UInt8, HRESULT)
    get_ip_version : Proc(INetFwOpenPort*, NET_FW_IP_VERSION*, HRESULT)
    put_ip_version : Proc(INetFwOpenPort*, NET_FW_IP_VERSION, HRESULT)
    get_protocol : Proc(INetFwOpenPort*, NET_FW_IP_PROTOCOL*, HRESULT)
    put_protocol : Proc(INetFwOpenPort*, NET_FW_IP_PROTOCOL, HRESULT)
    get_port : Proc(INetFwOpenPort*, Int32*, HRESULT)
    put_port : Proc(INetFwOpenPort*, Int32, HRESULT)
    get_scope : Proc(INetFwOpenPort*, NET_FW_SCOPE*, HRESULT)
    put_scope : Proc(INetFwOpenPort*, NET_FW_SCOPE, HRESULT)
    get_remote_addresses : Proc(INetFwOpenPort*, UInt8*, HRESULT)
    put_remote_addresses : Proc(INetFwOpenPort*, UInt8, HRESULT)
    get_enabled : Proc(INetFwOpenPort*, Int16*, HRESULT)
    put_enabled : Proc(INetFwOpenPort*, Int16, HRESULT)
    get_built_in : Proc(INetFwOpenPort*, Int16*, HRESULT)
  end

  struct INetFwOpenPort
    lpVtbl : INetFwOpenPortVTbl*
  end

  struct INetFwOpenPortsVTbl
    query_interface : Proc(INetFwOpenPorts*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwOpenPorts*, UInt32)
    release : Proc(INetFwOpenPorts*, UInt32)
    get_type_info_count : Proc(INetFwOpenPorts*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwOpenPorts*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwOpenPorts*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwOpenPorts*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(INetFwOpenPorts*, Int32*, HRESULT)
    add : Proc(INetFwOpenPorts*, INetFwOpenPort, HRESULT)
    remove : Proc(INetFwOpenPorts*, Int32, NET_FW_IP_PROTOCOL, HRESULT)
    item : Proc(INetFwOpenPorts*, Int32, NET_FW_IP_PROTOCOL, INetFwOpenPort*, HRESULT)
    get__new_enum : Proc(INetFwOpenPorts*, IUnknown*, HRESULT)
  end

  struct INetFwOpenPorts
    lpVtbl : INetFwOpenPortsVTbl*
  end

  struct INetFwServiceVTbl
    query_interface : Proc(INetFwService*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwService*, UInt32)
    release : Proc(INetFwService*, UInt32)
    get_type_info_count : Proc(INetFwService*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwService*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwService*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwService*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(INetFwService*, UInt8*, HRESULT)
    get_type : Proc(INetFwService*, NET_FW_SERVICE_TYPE*, HRESULT)
    get_customized : Proc(INetFwService*, Int16*, HRESULT)
    get_ip_version : Proc(INetFwService*, NET_FW_IP_VERSION*, HRESULT)
    put_ip_version : Proc(INetFwService*, NET_FW_IP_VERSION, HRESULT)
    get_scope : Proc(INetFwService*, NET_FW_SCOPE*, HRESULT)
    put_scope : Proc(INetFwService*, NET_FW_SCOPE, HRESULT)
    get_remote_addresses : Proc(INetFwService*, UInt8*, HRESULT)
    put_remote_addresses : Proc(INetFwService*, UInt8, HRESULT)
    get_enabled : Proc(INetFwService*, Int16*, HRESULT)
    put_enabled : Proc(INetFwService*, Int16, HRESULT)
    get_globally_open_ports : Proc(INetFwService*, INetFwOpenPorts*, HRESULT)
  end

  struct INetFwService
    lpVtbl : INetFwServiceVTbl*
  end

  struct INetFwServicesVTbl
    query_interface : Proc(INetFwServices*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwServices*, UInt32)
    release : Proc(INetFwServices*, UInt32)
    get_type_info_count : Proc(INetFwServices*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwServices*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwServices*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwServices*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(INetFwServices*, Int32*, HRESULT)
    item : Proc(INetFwServices*, NET_FW_SERVICE_TYPE, INetFwService*, HRESULT)
    get__new_enum : Proc(INetFwServices*, IUnknown*, HRESULT)
  end

  struct INetFwServices
    lpVtbl : INetFwServicesVTbl*
  end

  struct INetFwAuthorizedApplicationVTbl
    query_interface : Proc(INetFwAuthorizedApplication*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwAuthorizedApplication*, UInt32)
    release : Proc(INetFwAuthorizedApplication*, UInt32)
    get_type_info_count : Proc(INetFwAuthorizedApplication*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwAuthorizedApplication*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwAuthorizedApplication*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwAuthorizedApplication*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(INetFwAuthorizedApplication*, UInt8*, HRESULT)
    put_name : Proc(INetFwAuthorizedApplication*, UInt8, HRESULT)
    get_process_image_file_name : Proc(INetFwAuthorizedApplication*, UInt8*, HRESULT)
    put_process_image_file_name : Proc(INetFwAuthorizedApplication*, UInt8, HRESULT)
    get_ip_version : Proc(INetFwAuthorizedApplication*, NET_FW_IP_VERSION*, HRESULT)
    put_ip_version : Proc(INetFwAuthorizedApplication*, NET_FW_IP_VERSION, HRESULT)
    get_scope : Proc(INetFwAuthorizedApplication*, NET_FW_SCOPE*, HRESULT)
    put_scope : Proc(INetFwAuthorizedApplication*, NET_FW_SCOPE, HRESULT)
    get_remote_addresses : Proc(INetFwAuthorizedApplication*, UInt8*, HRESULT)
    put_remote_addresses : Proc(INetFwAuthorizedApplication*, UInt8, HRESULT)
    get_enabled : Proc(INetFwAuthorizedApplication*, Int16*, HRESULT)
    put_enabled : Proc(INetFwAuthorizedApplication*, Int16, HRESULT)
  end

  struct INetFwAuthorizedApplication
    lpVtbl : INetFwAuthorizedApplicationVTbl*
  end

  struct INetFwAuthorizedApplicationsVTbl
    query_interface : Proc(INetFwAuthorizedApplications*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwAuthorizedApplications*, UInt32)
    release : Proc(INetFwAuthorizedApplications*, UInt32)
    get_type_info_count : Proc(INetFwAuthorizedApplications*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwAuthorizedApplications*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwAuthorizedApplications*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwAuthorizedApplications*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(INetFwAuthorizedApplications*, Int32*, HRESULT)
    add : Proc(INetFwAuthorizedApplications*, INetFwAuthorizedApplication, HRESULT)
    remove : Proc(INetFwAuthorizedApplications*, UInt8, HRESULT)
    item : Proc(INetFwAuthorizedApplications*, UInt8, INetFwAuthorizedApplication*, HRESULT)
    get__new_enum : Proc(INetFwAuthorizedApplications*, IUnknown*, HRESULT)
  end

  struct INetFwAuthorizedApplications
    lpVtbl : INetFwAuthorizedApplicationsVTbl*
  end

  struct INetFwRuleVTbl
    query_interface : Proc(INetFwRule*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwRule*, UInt32)
    release : Proc(INetFwRule*, UInt32)
    get_type_info_count : Proc(INetFwRule*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwRule*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwRule*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwRule*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(INetFwRule*, UInt8*, HRESULT)
    put_name : Proc(INetFwRule*, UInt8, HRESULT)
    get_description : Proc(INetFwRule*, UInt8*, HRESULT)
    put_description : Proc(INetFwRule*, UInt8, HRESULT)
    get_application_name : Proc(INetFwRule*, UInt8*, HRESULT)
    put_application_name : Proc(INetFwRule*, UInt8, HRESULT)
    get_service_name : Proc(INetFwRule*, UInt8*, HRESULT)
    put_service_name : Proc(INetFwRule*, UInt8, HRESULT)
    get_protocol : Proc(INetFwRule*, Int32*, HRESULT)
    put_protocol : Proc(INetFwRule*, Int32, HRESULT)
    get_local_ports : Proc(INetFwRule*, UInt8*, HRESULT)
    put_local_ports : Proc(INetFwRule*, UInt8, HRESULT)
    get_remote_ports : Proc(INetFwRule*, UInt8*, HRESULT)
    put_remote_ports : Proc(INetFwRule*, UInt8, HRESULT)
    get_local_addresses : Proc(INetFwRule*, UInt8*, HRESULT)
    put_local_addresses : Proc(INetFwRule*, UInt8, HRESULT)
    get_remote_addresses : Proc(INetFwRule*, UInt8*, HRESULT)
    put_remote_addresses : Proc(INetFwRule*, UInt8, HRESULT)
    get_icmp_types_and_codes : Proc(INetFwRule*, UInt8*, HRESULT)
    put_icmp_types_and_codes : Proc(INetFwRule*, UInt8, HRESULT)
    get_direction : Proc(INetFwRule*, NET_FW_RULE_DIRECTION*, HRESULT)
    put_direction : Proc(INetFwRule*, NET_FW_RULE_DIRECTION, HRESULT)
    get_interfaces : Proc(INetFwRule*, VARIANT*, HRESULT)
    put_interfaces : Proc(INetFwRule*, VARIANT, HRESULT)
    get_interface_types : Proc(INetFwRule*, UInt8*, HRESULT)
    put_interface_types : Proc(INetFwRule*, UInt8, HRESULT)
    get_enabled : Proc(INetFwRule*, Int16*, HRESULT)
    put_enabled : Proc(INetFwRule*, Int16, HRESULT)
    get_grouping : Proc(INetFwRule*, UInt8*, HRESULT)
    put_grouping : Proc(INetFwRule*, UInt8, HRESULT)
    get_profiles : Proc(INetFwRule*, Int32*, HRESULT)
    put_profiles : Proc(INetFwRule*, Int32, HRESULT)
    get_edge_traversal : Proc(INetFwRule*, Int16*, HRESULT)
    put_edge_traversal : Proc(INetFwRule*, Int16, HRESULT)
    get_action : Proc(INetFwRule*, NET_FW_ACTION*, HRESULT)
    put_action : Proc(INetFwRule*, NET_FW_ACTION, HRESULT)
  end

  struct INetFwRule
    lpVtbl : INetFwRuleVTbl*
  end

  struct INetFwRule2VTbl
    query_interface : Proc(INetFwRule2*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwRule2*, UInt32)
    release : Proc(INetFwRule2*, UInt32)
    get_type_info_count : Proc(INetFwRule2*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwRule2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwRule2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwRule2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_name : Proc(INetFwRule2*, UInt8, HRESULT)
    get_description : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_description : Proc(INetFwRule2*, UInt8, HRESULT)
    get_application_name : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_application_name : Proc(INetFwRule2*, UInt8, HRESULT)
    get_service_name : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_service_name : Proc(INetFwRule2*, UInt8, HRESULT)
    get_protocol : Proc(INetFwRule2*, Int32*, HRESULT)
    put_protocol : Proc(INetFwRule2*, Int32, HRESULT)
    get_local_ports : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_local_ports : Proc(INetFwRule2*, UInt8, HRESULT)
    get_remote_ports : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_remote_ports : Proc(INetFwRule2*, UInt8, HRESULT)
    get_local_addresses : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_local_addresses : Proc(INetFwRule2*, UInt8, HRESULT)
    get_remote_addresses : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_remote_addresses : Proc(INetFwRule2*, UInt8, HRESULT)
    get_icmp_types_and_codes : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_icmp_types_and_codes : Proc(INetFwRule2*, UInt8, HRESULT)
    get_direction : Proc(INetFwRule2*, NET_FW_RULE_DIRECTION*, HRESULT)
    put_direction : Proc(INetFwRule2*, NET_FW_RULE_DIRECTION, HRESULT)
    get_interfaces : Proc(INetFwRule2*, VARIANT*, HRESULT)
    put_interfaces : Proc(INetFwRule2*, VARIANT, HRESULT)
    get_interface_types : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_interface_types : Proc(INetFwRule2*, UInt8, HRESULT)
    get_enabled : Proc(INetFwRule2*, Int16*, HRESULT)
    put_enabled : Proc(INetFwRule2*, Int16, HRESULT)
    get_grouping : Proc(INetFwRule2*, UInt8*, HRESULT)
    put_grouping : Proc(INetFwRule2*, UInt8, HRESULT)
    get_profiles : Proc(INetFwRule2*, Int32*, HRESULT)
    put_profiles : Proc(INetFwRule2*, Int32, HRESULT)
    get_edge_traversal : Proc(INetFwRule2*, Int16*, HRESULT)
    put_edge_traversal : Proc(INetFwRule2*, Int16, HRESULT)
    get_action : Proc(INetFwRule2*, NET_FW_ACTION*, HRESULT)
    put_action : Proc(INetFwRule2*, NET_FW_ACTION, HRESULT)
    get_edge_traversal_options : Proc(INetFwRule2*, Int32*, HRESULT)
    put_edge_traversal_options : Proc(INetFwRule2*, Int32, HRESULT)
  end

  struct INetFwRule2
    lpVtbl : INetFwRule2VTbl*
  end

  struct INetFwRule3VTbl
    query_interface : Proc(INetFwRule3*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwRule3*, UInt32)
    release : Proc(INetFwRule3*, UInt32)
    get_type_info_count : Proc(INetFwRule3*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwRule3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwRule3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwRule3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_name : Proc(INetFwRule3*, UInt8, HRESULT)
    get_description : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_description : Proc(INetFwRule3*, UInt8, HRESULT)
    get_application_name : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_application_name : Proc(INetFwRule3*, UInt8, HRESULT)
    get_service_name : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_service_name : Proc(INetFwRule3*, UInt8, HRESULT)
    get_protocol : Proc(INetFwRule3*, Int32*, HRESULT)
    put_protocol : Proc(INetFwRule3*, Int32, HRESULT)
    get_local_ports : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_local_ports : Proc(INetFwRule3*, UInt8, HRESULT)
    get_remote_ports : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_remote_ports : Proc(INetFwRule3*, UInt8, HRESULT)
    get_local_addresses : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_local_addresses : Proc(INetFwRule3*, UInt8, HRESULT)
    get_remote_addresses : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_remote_addresses : Proc(INetFwRule3*, UInt8, HRESULT)
    get_icmp_types_and_codes : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_icmp_types_and_codes : Proc(INetFwRule3*, UInt8, HRESULT)
    get_direction : Proc(INetFwRule3*, NET_FW_RULE_DIRECTION*, HRESULT)
    put_direction : Proc(INetFwRule3*, NET_FW_RULE_DIRECTION, HRESULT)
    get_interfaces : Proc(INetFwRule3*, VARIANT*, HRESULT)
    put_interfaces : Proc(INetFwRule3*, VARIANT, HRESULT)
    get_interface_types : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_interface_types : Proc(INetFwRule3*, UInt8, HRESULT)
    get_enabled : Proc(INetFwRule3*, Int16*, HRESULT)
    put_enabled : Proc(INetFwRule3*, Int16, HRESULT)
    get_grouping : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_grouping : Proc(INetFwRule3*, UInt8, HRESULT)
    get_profiles : Proc(INetFwRule3*, Int32*, HRESULT)
    put_profiles : Proc(INetFwRule3*, Int32, HRESULT)
    get_edge_traversal : Proc(INetFwRule3*, Int16*, HRESULT)
    put_edge_traversal : Proc(INetFwRule3*, Int16, HRESULT)
    get_action : Proc(INetFwRule3*, NET_FW_ACTION*, HRESULT)
    put_action : Proc(INetFwRule3*, NET_FW_ACTION, HRESULT)
    get_edge_traversal_options : Proc(INetFwRule3*, Int32*, HRESULT)
    put_edge_traversal_options : Proc(INetFwRule3*, Int32, HRESULT)
    get_local_app_package_id : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_local_app_package_id : Proc(INetFwRule3*, UInt8, HRESULT)
    get_local_user_owner : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_local_user_owner : Proc(INetFwRule3*, UInt8, HRESULT)
    get_local_user_authorized_list : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_local_user_authorized_list : Proc(INetFwRule3*, UInt8, HRESULT)
    get_remote_user_authorized_list : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_remote_user_authorized_list : Proc(INetFwRule3*, UInt8, HRESULT)
    get_remote_machine_authorized_list : Proc(INetFwRule3*, UInt8*, HRESULT)
    put_remote_machine_authorized_list : Proc(INetFwRule3*, UInt8, HRESULT)
    get_secure_flags : Proc(INetFwRule3*, Int32*, HRESULT)
    put_secure_flags : Proc(INetFwRule3*, Int32, HRESULT)
  end

  struct INetFwRule3
    lpVtbl : INetFwRule3VTbl*
  end

  struct INetFwRulesVTbl
    query_interface : Proc(INetFwRules*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwRules*, UInt32)
    release : Proc(INetFwRules*, UInt32)
    get_type_info_count : Proc(INetFwRules*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwRules*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwRules*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwRules*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(INetFwRules*, Int32*, HRESULT)
    add : Proc(INetFwRules*, INetFwRule, HRESULT)
    remove : Proc(INetFwRules*, UInt8, HRESULT)
    item : Proc(INetFwRules*, UInt8, INetFwRule*, HRESULT)
    get__new_enum : Proc(INetFwRules*, IUnknown*, HRESULT)
  end

  struct INetFwRules
    lpVtbl : INetFwRulesVTbl*
  end

  struct INetFwServiceRestrictionVTbl
    query_interface : Proc(INetFwServiceRestriction*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwServiceRestriction*, UInt32)
    release : Proc(INetFwServiceRestriction*, UInt32)
    get_type_info_count : Proc(INetFwServiceRestriction*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwServiceRestriction*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwServiceRestriction*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwServiceRestriction*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    restrict_service : Proc(INetFwServiceRestriction*, UInt8, UInt8, Int16, Int16, HRESULT)
    service_restricted : Proc(INetFwServiceRestriction*, UInt8, UInt8, Int16*, HRESULT)
    get_rules : Proc(INetFwServiceRestriction*, INetFwRules*, HRESULT)
  end

  struct INetFwServiceRestriction
    lpVtbl : INetFwServiceRestrictionVTbl*
  end

  struct INetFwProfileVTbl
    query_interface : Proc(INetFwProfile*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwProfile*, UInt32)
    release : Proc(INetFwProfile*, UInt32)
    get_type_info_count : Proc(INetFwProfile*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwProfile*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwProfile*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwProfile*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(INetFwProfile*, NET_FW_PROFILE_TYPE*, HRESULT)
    get_firewall_enabled : Proc(INetFwProfile*, Int16*, HRESULT)
    put_firewall_enabled : Proc(INetFwProfile*, Int16, HRESULT)
    get_exceptions_not_allowed : Proc(INetFwProfile*, Int16*, HRESULT)
    put_exceptions_not_allowed : Proc(INetFwProfile*, Int16, HRESULT)
    get_notifications_disabled : Proc(INetFwProfile*, Int16*, HRESULT)
    put_notifications_disabled : Proc(INetFwProfile*, Int16, HRESULT)
    get_unicast_responses_to_multicast_broadcast_disabled : Proc(INetFwProfile*, Int16*, HRESULT)
    put_unicast_responses_to_multicast_broadcast_disabled : Proc(INetFwProfile*, Int16, HRESULT)
    get_remote_admin_settings : Proc(INetFwProfile*, INetFwRemoteAdminSettings*, HRESULT)
    get_icmp_settings : Proc(INetFwProfile*, INetFwIcmpSettings*, HRESULT)
    get_globally_open_ports : Proc(INetFwProfile*, INetFwOpenPorts*, HRESULT)
    get_services : Proc(INetFwProfile*, INetFwServices*, HRESULT)
    get_authorized_applications : Proc(INetFwProfile*, INetFwAuthorizedApplications*, HRESULT)
  end

  struct INetFwProfile
    lpVtbl : INetFwProfileVTbl*
  end

  struct INetFwPolicyVTbl
    query_interface : Proc(INetFwPolicy*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwPolicy*, UInt32)
    release : Proc(INetFwPolicy*, UInt32)
    get_type_info_count : Proc(INetFwPolicy*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwPolicy*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwPolicy*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwPolicy*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_current_profile : Proc(INetFwPolicy*, INetFwProfile*, HRESULT)
    get_profile_by_type : Proc(INetFwPolicy*, NET_FW_PROFILE_TYPE, INetFwProfile*, HRESULT)
  end

  struct INetFwPolicy
    lpVtbl : INetFwPolicyVTbl*
  end

  struct INetFwPolicy2VTbl
    query_interface : Proc(INetFwPolicy2*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwPolicy2*, UInt32)
    release : Proc(INetFwPolicy2*, UInt32)
    get_type_info_count : Proc(INetFwPolicy2*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwPolicy2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwPolicy2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwPolicy2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_current_profile_types : Proc(INetFwPolicy2*, Int32*, HRESULT)
    get_firewall_enabled : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, Int16*, HRESULT)
    put_firewall_enabled : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, Int16, HRESULT)
    get_excluded_interfaces : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, VARIANT*, HRESULT)
    put_excluded_interfaces : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, VARIANT, HRESULT)
    get_block_all_inbound_traffic : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, Int16*, HRESULT)
    put_block_all_inbound_traffic : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, Int16, HRESULT)
    get_notifications_disabled : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, Int16*, HRESULT)
    put_notifications_disabled : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, Int16, HRESULT)
    get_unicast_responses_to_multicast_broadcast_disabled : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, Int16*, HRESULT)
    put_unicast_responses_to_multicast_broadcast_disabled : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, Int16, HRESULT)
    get_rules : Proc(INetFwPolicy2*, INetFwRules*, HRESULT)
    get_service_restriction : Proc(INetFwPolicy2*, INetFwServiceRestriction*, HRESULT)
    enable_rule_group : Proc(INetFwPolicy2*, Int32, UInt8, Int16, HRESULT)
    is_rule_group_enabled : Proc(INetFwPolicy2*, Int32, UInt8, Int16*, HRESULT)
    restore_local_firewall_defaults : Proc(INetFwPolicy2*, HRESULT)
    get_default_inbound_action : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, NET_FW_ACTION*, HRESULT)
    put_default_inbound_action : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, NET_FW_ACTION, HRESULT)
    get_default_outbound_action : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, NET_FW_ACTION*, HRESULT)
    put_default_outbound_action : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, NET_FW_ACTION, HRESULT)
    get_is_rule_group_currently_enabled : Proc(INetFwPolicy2*, UInt8, Int16*, HRESULT)
    get_local_policy_modify_state : Proc(INetFwPolicy2*, NET_FW_MODIFY_STATE*, HRESULT)
  end

  struct INetFwPolicy2
    lpVtbl : INetFwPolicy2VTbl*
  end

  struct INetFwMgrVTbl
    query_interface : Proc(INetFwMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwMgr*, UInt32)
    release : Proc(INetFwMgr*, UInt32)
    get_type_info_count : Proc(INetFwMgr*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwMgr*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwMgr*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwMgr*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_local_policy : Proc(INetFwMgr*, INetFwPolicy*, HRESULT)
    get_current_profile_type : Proc(INetFwMgr*, NET_FW_PROFILE_TYPE*, HRESULT)
    restore_defaults : Proc(INetFwMgr*, HRESULT)
    is_port_allowed : Proc(INetFwMgr*, UInt8, NET_FW_IP_VERSION, Int32, UInt8, NET_FW_IP_PROTOCOL, VARIANT*, VARIANT*, HRESULT)
    is_icmp_type_allowed : Proc(INetFwMgr*, NET_FW_IP_VERSION, UInt8, UInt8, VARIANT*, VARIANT*, HRESULT)
  end

  struct INetFwMgr
    lpVtbl : INetFwMgrVTbl*
  end

  struct INetFwProductVTbl
    query_interface : Proc(INetFwProduct*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwProduct*, UInt32)
    release : Proc(INetFwProduct*, UInt32)
    get_type_info_count : Proc(INetFwProduct*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwProduct*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwProduct*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwProduct*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_rule_categories : Proc(INetFwProduct*, VARIANT*, HRESULT)
    put_rule_categories : Proc(INetFwProduct*, VARIANT, HRESULT)
    get_display_name : Proc(INetFwProduct*, UInt8*, HRESULT)
    put_display_name : Proc(INetFwProduct*, UInt8, HRESULT)
    get_path_to_signed_product_exe : Proc(INetFwProduct*, UInt8*, HRESULT)
  end

  struct INetFwProduct
    lpVtbl : INetFwProductVTbl*
  end

  struct INetFwProductsVTbl
    query_interface : Proc(INetFwProducts*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetFwProducts*, UInt32)
    release : Proc(INetFwProducts*, UInt32)
    get_type_info_count : Proc(INetFwProducts*, UInt32*, HRESULT)
    get_type_info : Proc(INetFwProducts*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetFwProducts*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetFwProducts*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(INetFwProducts*, Int32*, HRESULT)
    register : Proc(INetFwProducts*, INetFwProduct, IUnknown*, HRESULT)
    item : Proc(INetFwProducts*, Int32, INetFwProduct*, HRESULT)
    get__new_enum : Proc(INetFwProducts*, IUnknown*, HRESULT)
  end

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
