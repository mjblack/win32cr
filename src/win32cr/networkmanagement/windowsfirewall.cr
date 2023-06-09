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

  IUPnPNAT_GUID = "b171c812-cc76-485a-94d8-b6b3a2794e99"
  IID_IUPnPNAT = LibC::GUID.new(0xb171c812_u32, 0xcc76_u16, 0x485a_u16, StaticArray[0x94_u8, 0xd8_u8, 0xb6_u8, 0xb3_u8, 0xa2_u8, 0x79_u8, 0x4e_u8, 0x99_u8])
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

  INATEventManager_GUID = "624bd588-9060-4109-b0b0-1adbbcac32df"
  IID_INATEventManager = LibC::GUID.new(0x624bd588_u32, 0x9060_u16, 0x4109_u16, StaticArray[0xb0_u8, 0xb0_u8, 0x1a_u8, 0xdb_u8, 0xbc_u8, 0xac_u8, 0x32_u8, 0xdf_u8])
  struct INATEventManager
    lpVtbl : INATEventManagerVTbl*
  end

  struct INATExternalIPAddressCallbackVTbl
    query_interface : Proc(INATExternalIPAddressCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(INATExternalIPAddressCallback*, UInt32)
    release : Proc(INATExternalIPAddressCallback*, UInt32)
    new_external_ip_address : Proc(INATExternalIPAddressCallback*, UInt8*, HRESULT)
  end

  INATExternalIPAddressCallback_GUID = "9c416740-a34e-446f-ba06-abd04c3149ae"
  IID_INATExternalIPAddressCallback = LibC::GUID.new(0x9c416740_u32, 0xa34e_u16, 0x446f_u16, StaticArray[0xba_u8, 0x6_u8, 0xab_u8, 0xd0_u8, 0x4c_u8, 0x31_u8, 0x49_u8, 0xae_u8])
  struct INATExternalIPAddressCallback
    lpVtbl : INATExternalIPAddressCallbackVTbl*
  end

  struct INATNumberOfEntriesCallbackVTbl
    query_interface : Proc(INATNumberOfEntriesCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(INATNumberOfEntriesCallback*, UInt32)
    release : Proc(INATNumberOfEntriesCallback*, UInt32)
    new_number_of_entries : Proc(INATNumberOfEntriesCallback*, Int32, HRESULT)
  end

  INATNumberOfEntriesCallback_GUID = "c83a0a74-91ee-41b6-b67a-67e0f00bbd78"
  IID_INATNumberOfEntriesCallback = LibC::GUID.new(0xc83a0a74_u32, 0x91ee_u16, 0x41b6_u16, StaticArray[0xb6_u8, 0x7a_u8, 0x67_u8, 0xe0_u8, 0xf0_u8, 0xb_u8, 0xbd_u8, 0x78_u8])
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
    get_item : Proc(IDynamicPortMappingCollection*, UInt8*, Int32, UInt8*, IDynamicPortMapping*, HRESULT)
    get_count : Proc(IDynamicPortMappingCollection*, Int32*, HRESULT)
    remove : Proc(IDynamicPortMappingCollection*, UInt8*, Int32, UInt8*, HRESULT)
    add : Proc(IDynamicPortMappingCollection*, UInt8*, Int32, UInt8*, Int32, UInt8*, Int16, UInt8*, Int32, IDynamicPortMapping*, HRESULT)
  end

  IDynamicPortMappingCollection_GUID = "b60de00f-156e-4e8d-9ec1-3a2342c10899"
  IID_IDynamicPortMappingCollection = LibC::GUID.new(0xb60de00f_u32, 0x156e_u16, 0x4e8d_u16, StaticArray[0x9e_u8, 0xc1_u8, 0x3a_u8, 0x23_u8, 0x42_u8, 0xc1_u8, 0x8_u8, 0x99_u8])
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
    get_external_ip_address : Proc(IDynamicPortMapping*, UInt8**, HRESULT)
    get_remote_host : Proc(IDynamicPortMapping*, UInt8**, HRESULT)
    get_external_port : Proc(IDynamicPortMapping*, Int32*, HRESULT)
    get_protocol : Proc(IDynamicPortMapping*, UInt8**, HRESULT)
    get_internal_port : Proc(IDynamicPortMapping*, Int32*, HRESULT)
    get_internal_client : Proc(IDynamicPortMapping*, UInt8**, HRESULT)
    get_enabled : Proc(IDynamicPortMapping*, Int16*, HRESULT)
    get_description : Proc(IDynamicPortMapping*, UInt8**, HRESULT)
    get_lease_duration : Proc(IDynamicPortMapping*, Int32*, HRESULT)
    renew_lease : Proc(IDynamicPortMapping*, Int32, Int32*, HRESULT)
    edit_internal_client : Proc(IDynamicPortMapping*, UInt8*, HRESULT)
    enable : Proc(IDynamicPortMapping*, Int16, HRESULT)
    edit_description : Proc(IDynamicPortMapping*, UInt8*, HRESULT)
    edit_internal_port : Proc(IDynamicPortMapping*, Int32, HRESULT)
  end

  IDynamicPortMapping_GUID = "4fc80282-23b6-4378-9a27-cd8f17c9400c"
  IID_IDynamicPortMapping = LibC::GUID.new(0x4fc80282_u32, 0x23b6_u16, 0x4378_u16, StaticArray[0x9a_u8, 0x27_u8, 0xcd_u8, 0x8f_u8, 0x17_u8, 0xc9_u8, 0x40_u8, 0xc_u8])
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
    get_item : Proc(IStaticPortMappingCollection*, Int32, UInt8*, IStaticPortMapping*, HRESULT)
    get_count : Proc(IStaticPortMappingCollection*, Int32*, HRESULT)
    remove : Proc(IStaticPortMappingCollection*, Int32, UInt8*, HRESULT)
    add : Proc(IStaticPortMappingCollection*, Int32, UInt8*, Int32, UInt8*, Int16, UInt8*, IStaticPortMapping*, HRESULT)
  end

  IStaticPortMappingCollection_GUID = "cd1f3e77-66d6-4664-82c7-36dbb641d0f1"
  IID_IStaticPortMappingCollection = LibC::GUID.new(0xcd1f3e77_u32, 0x66d6_u16, 0x4664_u16, StaticArray[0x82_u8, 0xc7_u8, 0x36_u8, 0xdb_u8, 0xb6_u8, 0x41_u8, 0xd0_u8, 0xf1_u8])
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
    get_external_ip_address : Proc(IStaticPortMapping*, UInt8**, HRESULT)
    get_external_port : Proc(IStaticPortMapping*, Int32*, HRESULT)
    get_internal_port : Proc(IStaticPortMapping*, Int32*, HRESULT)
    get_protocol : Proc(IStaticPortMapping*, UInt8**, HRESULT)
    get_internal_client : Proc(IStaticPortMapping*, UInt8**, HRESULT)
    get_enabled : Proc(IStaticPortMapping*, Int16*, HRESULT)
    get_description : Proc(IStaticPortMapping*, UInt8**, HRESULT)
    edit_internal_client : Proc(IStaticPortMapping*, UInt8*, HRESULT)
    enable : Proc(IStaticPortMapping*, Int16, HRESULT)
    edit_description : Proc(IStaticPortMapping*, UInt8*, HRESULT)
    edit_internal_port : Proc(IStaticPortMapping*, Int32, HRESULT)
  end

  IStaticPortMapping_GUID = "6f10711f-729b-41e5-93b8-f21d0f818df1"
  IID_IStaticPortMapping = LibC::GUID.new(0x6f10711f_u32, 0x729b_u16, 0x41e5_u16, StaticArray[0x93_u8, 0xb8_u8, 0xf2_u8, 0x1d_u8, 0xf_u8, 0x81_u8, 0x8d_u8, 0xf1_u8])
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

  IEnumNetConnection_GUID = "c08956a0-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetConnection = LibC::GUID.new(0xc08956a0_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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

  INetConnection_GUID = "c08956a1-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetConnection = LibC::GUID.new(0xc08956a1_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetConnection
    lpVtbl : INetConnectionVTbl*
  end

  struct INetConnectionManagerVTbl
    query_interface : Proc(INetConnectionManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetConnectionManager*, UInt32)
    release : Proc(INetConnectionManager*, UInt32)
    enum_connections : Proc(INetConnectionManager*, NETCONMGR_ENUM_FLAGS, IEnumNetConnection*, HRESULT)
  end

  INetConnectionManager_GUID = "c08956a2-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetConnectionManager = LibC::GUID.new(0xc08956a2_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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

  INetConnectionConnectUi_GUID = "c08956a3-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetConnectionConnectUi = LibC::GUID.new(0xc08956a3_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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

  IEnumNetSharingPortMapping_GUID = "c08956b0-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetSharingPortMapping = LibC::GUID.new(0xc08956b0_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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
    get_name : Proc(INetSharingPortMappingProps*, UInt8**, HRESULT)
    get_ip_protocol : Proc(INetSharingPortMappingProps*, UInt8*, HRESULT)
    get_external_port : Proc(INetSharingPortMappingProps*, Int32*, HRESULT)
    get_internal_port : Proc(INetSharingPortMappingProps*, Int32*, HRESULT)
    get_options : Proc(INetSharingPortMappingProps*, Int32*, HRESULT)
    get_target_name : Proc(INetSharingPortMappingProps*, UInt8**, HRESULT)
    get_target_ip_address : Proc(INetSharingPortMappingProps*, UInt8**, HRESULT)
    get_enabled : Proc(INetSharingPortMappingProps*, Int16*, HRESULT)
  end

  INetSharingPortMappingProps_GUID = "24b7e9b5-e38f-4685-851b-00892cf5f940"
  IID_INetSharingPortMappingProps = LibC::GUID.new(0x24b7e9b5_u32, 0xe38f_u16, 0x4685_u16, StaticArray[0x85_u8, 0x1b_u8, 0x0_u8, 0x89_u8, 0x2c_u8, 0xf5_u8, 0xf9_u8, 0x40_u8])
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

  INetSharingPortMapping_GUID = "c08956b1-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetSharingPortMapping = LibC::GUID.new(0xc08956b1_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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

  IEnumNetSharingEveryConnection_GUID = "c08956b8-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetSharingEveryConnection = LibC::GUID.new(0xc08956b8_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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

  IEnumNetSharingPublicConnection_GUID = "c08956b4-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetSharingPublicConnection = LibC::GUID.new(0xc08956b4_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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

  IEnumNetSharingPrivateConnection_GUID = "c08956b5-1cd3-11d1-b1c5-00805fc1270e"
  IID_IEnumNetSharingPrivateConnection = LibC::GUID.new(0xc08956b5_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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

  INetSharingPortMappingCollection_GUID = "02e4a2de-da20-4e34-89c8-ac22275a010b"
  IID_INetSharingPortMappingCollection = LibC::GUID.new(0x2e4a2de_u32, 0xda20_u16, 0x4e34_u16, StaticArray[0x89_u8, 0xc8_u8, 0xac_u8, 0x22_u8, 0x27_u8, 0x5a_u8, 0x1_u8, 0xb_u8])
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
    get_guid : Proc(INetConnectionProps*, UInt8**, HRESULT)
    get_name : Proc(INetConnectionProps*, UInt8**, HRESULT)
    get_device_name : Proc(INetConnectionProps*, UInt8**, HRESULT)
    get_status : Proc(INetConnectionProps*, NETCON_STATUS*, HRESULT)
    get_media_type : Proc(INetConnectionProps*, NETCON_MEDIATYPE*, HRESULT)
    get_characteristics : Proc(INetConnectionProps*, UInt32*, HRESULT)
  end

  INetConnectionProps_GUID = "f4277c95-ce5b-463d-8167-5662d9bcaa72"
  IID_INetConnectionProps = LibC::GUID.new(0xf4277c95_u32, 0xce5b_u16, 0x463d_u16, StaticArray[0x81_u8, 0x67_u8, 0x56_u8, 0x62_u8, 0xd9_u8, 0xbc_u8, 0xaa_u8, 0x72_u8])
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
    add_port_mapping : Proc(INetSharingConfiguration*, UInt8*, UInt8, UInt16, UInt16, UInt32, UInt8*, ICS_TARGETTYPE, INetSharingPortMapping*, HRESULT)
    remove_port_mapping : Proc(INetSharingConfiguration*, INetSharingPortMapping, HRESULT)
  end

  INetSharingConfiguration_GUID = "c08956b6-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetSharingConfiguration = LibC::GUID.new(0xc08956b6_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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

  INetSharingEveryConnectionCollection_GUID = "33c4643c-7811-46fa-a89a-768597bd7223"
  IID_INetSharingEveryConnectionCollection = LibC::GUID.new(0x33c4643c_u32, 0x7811_u16, 0x46fa_u16, StaticArray[0xa8_u8, 0x9a_u8, 0x76_u8, 0x85_u8, 0x97_u8, 0xbd_u8, 0x72_u8, 0x23_u8])
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

  INetSharingPublicConnectionCollection_GUID = "7d7a6355-f372-4971-a149-bfc927be762a"
  IID_INetSharingPublicConnectionCollection = LibC::GUID.new(0x7d7a6355_u32, 0xf372_u16, 0x4971_u16, StaticArray[0xa1_u8, 0x49_u8, 0xbf_u8, 0xc9_u8, 0x27_u8, 0xbe_u8, 0x76_u8, 0x2a_u8])
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

  INetSharingPrivateConnectionCollection_GUID = "38ae69e0-4409-402a-a2cb-e965c727f840"
  IID_INetSharingPrivateConnectionCollection = LibC::GUID.new(0x38ae69e0_u32, 0x4409_u16, 0x402a_u16, StaticArray[0xa2_u8, 0xcb_u8, 0xe9_u8, 0x65_u8, 0xc7_u8, 0x27_u8, 0xf8_u8, 0x40_u8])
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

  INetSharingManager_GUID = "c08956b7-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetSharingManager = LibC::GUID.new(0xc08956b7_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
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
    get_remote_addresses : Proc(INetFwRemoteAdminSettings*, UInt8**, HRESULT)
    put_remote_addresses : Proc(INetFwRemoteAdminSettings*, UInt8*, HRESULT)
    get_enabled : Proc(INetFwRemoteAdminSettings*, Int16*, HRESULT)
    put_enabled : Proc(INetFwRemoteAdminSettings*, Int16, HRESULT)
  end

  INetFwRemoteAdminSettings_GUID = "d4becddf-6f73-4a83-b832-9c66874cd20e"
  IID_INetFwRemoteAdminSettings = LibC::GUID.new(0xd4becddf_u32, 0x6f73_u16, 0x4a83_u16, StaticArray[0xb8_u8, 0x32_u8, 0x9c_u8, 0x66_u8, 0x87_u8, 0x4c_u8, 0xd2_u8, 0xe_u8])
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

  INetFwIcmpSettings_GUID = "a6207b2e-7cdd-426a-951e-5e1cbc5afead"
  IID_INetFwIcmpSettings = LibC::GUID.new(0xa6207b2e_u32, 0x7cdd_u16, 0x426a_u16, StaticArray[0x95_u8, 0x1e_u8, 0x5e_u8, 0x1c_u8, 0xbc_u8, 0x5a_u8, 0xfe_u8, 0xad_u8])
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
    get_name : Proc(INetFwOpenPort*, UInt8**, HRESULT)
    put_name : Proc(INetFwOpenPort*, UInt8*, HRESULT)
    get_ip_version : Proc(INetFwOpenPort*, NET_FW_IP_VERSION*, HRESULT)
    put_ip_version : Proc(INetFwOpenPort*, NET_FW_IP_VERSION, HRESULT)
    get_protocol : Proc(INetFwOpenPort*, NET_FW_IP_PROTOCOL*, HRESULT)
    put_protocol : Proc(INetFwOpenPort*, NET_FW_IP_PROTOCOL, HRESULT)
    get_port : Proc(INetFwOpenPort*, Int32*, HRESULT)
    put_port : Proc(INetFwOpenPort*, Int32, HRESULT)
    get_scope : Proc(INetFwOpenPort*, NET_FW_SCOPE*, HRESULT)
    put_scope : Proc(INetFwOpenPort*, NET_FW_SCOPE, HRESULT)
    get_remote_addresses : Proc(INetFwOpenPort*, UInt8**, HRESULT)
    put_remote_addresses : Proc(INetFwOpenPort*, UInt8*, HRESULT)
    get_enabled : Proc(INetFwOpenPort*, Int16*, HRESULT)
    put_enabled : Proc(INetFwOpenPort*, Int16, HRESULT)
    get_built_in : Proc(INetFwOpenPort*, Int16*, HRESULT)
  end

  INetFwOpenPort_GUID = "e0483ba0-47ff-4d9c-a6d6-7741d0b195f7"
  IID_INetFwOpenPort = LibC::GUID.new(0xe0483ba0_u32, 0x47ff_u16, 0x4d9c_u16, StaticArray[0xa6_u8, 0xd6_u8, 0x77_u8, 0x41_u8, 0xd0_u8, 0xb1_u8, 0x95_u8, 0xf7_u8])
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

  INetFwOpenPorts_GUID = "c0e9d7fa-e07e-430a-b19a-090ce82d92e2"
  IID_INetFwOpenPorts = LibC::GUID.new(0xc0e9d7fa_u32, 0xe07e_u16, 0x430a_u16, StaticArray[0xb1_u8, 0x9a_u8, 0x9_u8, 0xc_u8, 0xe8_u8, 0x2d_u8, 0x92_u8, 0xe2_u8])
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
    get_name : Proc(INetFwService*, UInt8**, HRESULT)
    get_type : Proc(INetFwService*, NET_FW_SERVICE_TYPE*, HRESULT)
    get_customized : Proc(INetFwService*, Int16*, HRESULT)
    get_ip_version : Proc(INetFwService*, NET_FW_IP_VERSION*, HRESULT)
    put_ip_version : Proc(INetFwService*, NET_FW_IP_VERSION, HRESULT)
    get_scope : Proc(INetFwService*, NET_FW_SCOPE*, HRESULT)
    put_scope : Proc(INetFwService*, NET_FW_SCOPE, HRESULT)
    get_remote_addresses : Proc(INetFwService*, UInt8**, HRESULT)
    put_remote_addresses : Proc(INetFwService*, UInt8*, HRESULT)
    get_enabled : Proc(INetFwService*, Int16*, HRESULT)
    put_enabled : Proc(INetFwService*, Int16, HRESULT)
    get_globally_open_ports : Proc(INetFwService*, INetFwOpenPorts*, HRESULT)
  end

  INetFwService_GUID = "79fd57c8-908e-4a36-9888-d5b3f0a444cf"
  IID_INetFwService = LibC::GUID.new(0x79fd57c8_u32, 0x908e_u16, 0x4a36_u16, StaticArray[0x98_u8, 0x88_u8, 0xd5_u8, 0xb3_u8, 0xf0_u8, 0xa4_u8, 0x44_u8, 0xcf_u8])
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

  INetFwServices_GUID = "79649bb4-903e-421b-94c9-79848e79f6ee"
  IID_INetFwServices = LibC::GUID.new(0x79649bb4_u32, 0x903e_u16, 0x421b_u16, StaticArray[0x94_u8, 0xc9_u8, 0x79_u8, 0x84_u8, 0x8e_u8, 0x79_u8, 0xf6_u8, 0xee_u8])
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
    get_name : Proc(INetFwAuthorizedApplication*, UInt8**, HRESULT)
    put_name : Proc(INetFwAuthorizedApplication*, UInt8*, HRESULT)
    get_process_image_file_name : Proc(INetFwAuthorizedApplication*, UInt8**, HRESULT)
    put_process_image_file_name : Proc(INetFwAuthorizedApplication*, UInt8*, HRESULT)
    get_ip_version : Proc(INetFwAuthorizedApplication*, NET_FW_IP_VERSION*, HRESULT)
    put_ip_version : Proc(INetFwAuthorizedApplication*, NET_FW_IP_VERSION, HRESULT)
    get_scope : Proc(INetFwAuthorizedApplication*, NET_FW_SCOPE*, HRESULT)
    put_scope : Proc(INetFwAuthorizedApplication*, NET_FW_SCOPE, HRESULT)
    get_remote_addresses : Proc(INetFwAuthorizedApplication*, UInt8**, HRESULT)
    put_remote_addresses : Proc(INetFwAuthorizedApplication*, UInt8*, HRESULT)
    get_enabled : Proc(INetFwAuthorizedApplication*, Int16*, HRESULT)
    put_enabled : Proc(INetFwAuthorizedApplication*, Int16, HRESULT)
  end

  INetFwAuthorizedApplication_GUID = "b5e64ffa-c2c5-444e-a301-fb5e00018050"
  IID_INetFwAuthorizedApplication = LibC::GUID.new(0xb5e64ffa_u32, 0xc2c5_u16, 0x444e_u16, StaticArray[0xa3_u8, 0x1_u8, 0xfb_u8, 0x5e_u8, 0x0_u8, 0x1_u8, 0x80_u8, 0x50_u8])
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
    remove : Proc(INetFwAuthorizedApplications*, UInt8*, HRESULT)
    item : Proc(INetFwAuthorizedApplications*, UInt8*, INetFwAuthorizedApplication*, HRESULT)
    get__new_enum : Proc(INetFwAuthorizedApplications*, IUnknown*, HRESULT)
  end

  INetFwAuthorizedApplications_GUID = "644efd52-ccf9-486c-97a2-39f352570b30"
  IID_INetFwAuthorizedApplications = LibC::GUID.new(0x644efd52_u32, 0xccf9_u16, 0x486c_u16, StaticArray[0x97_u8, 0xa2_u8, 0x39_u8, 0xf3_u8, 0x52_u8, 0x57_u8, 0xb_u8, 0x30_u8])
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
    get_name : Proc(INetFwRule*, UInt8**, HRESULT)
    put_name : Proc(INetFwRule*, UInt8*, HRESULT)
    get_description : Proc(INetFwRule*, UInt8**, HRESULT)
    put_description : Proc(INetFwRule*, UInt8*, HRESULT)
    get_application_name : Proc(INetFwRule*, UInt8**, HRESULT)
    put_application_name : Proc(INetFwRule*, UInt8*, HRESULT)
    get_service_name : Proc(INetFwRule*, UInt8**, HRESULT)
    put_service_name : Proc(INetFwRule*, UInt8*, HRESULT)
    get_protocol : Proc(INetFwRule*, Int32*, HRESULT)
    put_protocol : Proc(INetFwRule*, Int32, HRESULT)
    get_local_ports : Proc(INetFwRule*, UInt8**, HRESULT)
    put_local_ports : Proc(INetFwRule*, UInt8*, HRESULT)
    get_remote_ports : Proc(INetFwRule*, UInt8**, HRESULT)
    put_remote_ports : Proc(INetFwRule*, UInt8*, HRESULT)
    get_local_addresses : Proc(INetFwRule*, UInt8**, HRESULT)
    put_local_addresses : Proc(INetFwRule*, UInt8*, HRESULT)
    get_remote_addresses : Proc(INetFwRule*, UInt8**, HRESULT)
    put_remote_addresses : Proc(INetFwRule*, UInt8*, HRESULT)
    get_icmp_types_and_codes : Proc(INetFwRule*, UInt8**, HRESULT)
    put_icmp_types_and_codes : Proc(INetFwRule*, UInt8*, HRESULT)
    get_direction : Proc(INetFwRule*, NET_FW_RULE_DIRECTION*, HRESULT)
    put_direction : Proc(INetFwRule*, NET_FW_RULE_DIRECTION, HRESULT)
    get_interfaces : Proc(INetFwRule*, VARIANT*, HRESULT)
    put_interfaces : Proc(INetFwRule*, VARIANT, HRESULT)
    get_interface_types : Proc(INetFwRule*, UInt8**, HRESULT)
    put_interface_types : Proc(INetFwRule*, UInt8*, HRESULT)
    get_enabled : Proc(INetFwRule*, Int16*, HRESULT)
    put_enabled : Proc(INetFwRule*, Int16, HRESULT)
    get_grouping : Proc(INetFwRule*, UInt8**, HRESULT)
    put_grouping : Proc(INetFwRule*, UInt8*, HRESULT)
    get_profiles : Proc(INetFwRule*, Int32*, HRESULT)
    put_profiles : Proc(INetFwRule*, Int32, HRESULT)
    get_edge_traversal : Proc(INetFwRule*, Int16*, HRESULT)
    put_edge_traversal : Proc(INetFwRule*, Int16, HRESULT)
    get_action : Proc(INetFwRule*, NET_FW_ACTION*, HRESULT)
    put_action : Proc(INetFwRule*, NET_FW_ACTION, HRESULT)
  end

  INetFwRule_GUID = "af230d27-baba-4e42-aced-f524f22cfce2"
  IID_INetFwRule = LibC::GUID.new(0xaf230d27_u32, 0xbaba_u16, 0x4e42_u16, StaticArray[0xac_u8, 0xed_u8, 0xf5_u8, 0x24_u8, 0xf2_u8, 0x2c_u8, 0xfc_u8, 0xe2_u8])
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
    get_name : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_name : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_description : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_description : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_application_name : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_application_name : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_service_name : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_service_name : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_protocol : Proc(INetFwRule2*, Int32*, HRESULT)
    put_protocol : Proc(INetFwRule2*, Int32, HRESULT)
    get_local_ports : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_local_ports : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_remote_ports : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_remote_ports : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_local_addresses : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_local_addresses : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_remote_addresses : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_remote_addresses : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_icmp_types_and_codes : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_icmp_types_and_codes : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_direction : Proc(INetFwRule2*, NET_FW_RULE_DIRECTION*, HRESULT)
    put_direction : Proc(INetFwRule2*, NET_FW_RULE_DIRECTION, HRESULT)
    get_interfaces : Proc(INetFwRule2*, VARIANT*, HRESULT)
    put_interfaces : Proc(INetFwRule2*, VARIANT, HRESULT)
    get_interface_types : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_interface_types : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_enabled : Proc(INetFwRule2*, Int16*, HRESULT)
    put_enabled : Proc(INetFwRule2*, Int16, HRESULT)
    get_grouping : Proc(INetFwRule2*, UInt8**, HRESULT)
    put_grouping : Proc(INetFwRule2*, UInt8*, HRESULT)
    get_profiles : Proc(INetFwRule2*, Int32*, HRESULT)
    put_profiles : Proc(INetFwRule2*, Int32, HRESULT)
    get_edge_traversal : Proc(INetFwRule2*, Int16*, HRESULT)
    put_edge_traversal : Proc(INetFwRule2*, Int16, HRESULT)
    get_action : Proc(INetFwRule2*, NET_FW_ACTION*, HRESULT)
    put_action : Proc(INetFwRule2*, NET_FW_ACTION, HRESULT)
    get_edge_traversal_options : Proc(INetFwRule2*, Int32*, HRESULT)
    put_edge_traversal_options : Proc(INetFwRule2*, Int32, HRESULT)
  end

  INetFwRule2_GUID = "9c27c8da-189b-4dde-89f7-8b39a316782c"
  IID_INetFwRule2 = LibC::GUID.new(0x9c27c8da_u32, 0x189b_u16, 0x4dde_u16, StaticArray[0x89_u8, 0xf7_u8, 0x8b_u8, 0x39_u8, 0xa3_u8, 0x16_u8, 0x78_u8, 0x2c_u8])
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
    get_name : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_name : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_description : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_description : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_application_name : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_application_name : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_service_name : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_service_name : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_protocol : Proc(INetFwRule3*, Int32*, HRESULT)
    put_protocol : Proc(INetFwRule3*, Int32, HRESULT)
    get_local_ports : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_local_ports : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_remote_ports : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_remote_ports : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_local_addresses : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_local_addresses : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_remote_addresses : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_remote_addresses : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_icmp_types_and_codes : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_icmp_types_and_codes : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_direction : Proc(INetFwRule3*, NET_FW_RULE_DIRECTION*, HRESULT)
    put_direction : Proc(INetFwRule3*, NET_FW_RULE_DIRECTION, HRESULT)
    get_interfaces : Proc(INetFwRule3*, VARIANT*, HRESULT)
    put_interfaces : Proc(INetFwRule3*, VARIANT, HRESULT)
    get_interface_types : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_interface_types : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_enabled : Proc(INetFwRule3*, Int16*, HRESULT)
    put_enabled : Proc(INetFwRule3*, Int16, HRESULT)
    get_grouping : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_grouping : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_profiles : Proc(INetFwRule3*, Int32*, HRESULT)
    put_profiles : Proc(INetFwRule3*, Int32, HRESULT)
    get_edge_traversal : Proc(INetFwRule3*, Int16*, HRESULT)
    put_edge_traversal : Proc(INetFwRule3*, Int16, HRESULT)
    get_action : Proc(INetFwRule3*, NET_FW_ACTION*, HRESULT)
    put_action : Proc(INetFwRule3*, NET_FW_ACTION, HRESULT)
    get_edge_traversal_options : Proc(INetFwRule3*, Int32*, HRESULT)
    put_edge_traversal_options : Proc(INetFwRule3*, Int32, HRESULT)
    get_local_app_package_id : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_local_app_package_id : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_local_user_owner : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_local_user_owner : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_local_user_authorized_list : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_local_user_authorized_list : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_remote_user_authorized_list : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_remote_user_authorized_list : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_remote_machine_authorized_list : Proc(INetFwRule3*, UInt8**, HRESULT)
    put_remote_machine_authorized_list : Proc(INetFwRule3*, UInt8*, HRESULT)
    get_secure_flags : Proc(INetFwRule3*, Int32*, HRESULT)
    put_secure_flags : Proc(INetFwRule3*, Int32, HRESULT)
  end

  INetFwRule3_GUID = "b21563ff-d696-4222-ab46-4e89b73ab34a"
  IID_INetFwRule3 = LibC::GUID.new(0xb21563ff_u32, 0xd696_u16, 0x4222_u16, StaticArray[0xab_u8, 0x46_u8, 0x4e_u8, 0x89_u8, 0xb7_u8, 0x3a_u8, 0xb3_u8, 0x4a_u8])
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
    remove : Proc(INetFwRules*, UInt8*, HRESULT)
    item : Proc(INetFwRules*, UInt8*, INetFwRule*, HRESULT)
    get__new_enum : Proc(INetFwRules*, IUnknown*, HRESULT)
  end

  INetFwRules_GUID = "9c4c6277-5027-441e-afae-ca1f542da009"
  IID_INetFwRules = LibC::GUID.new(0x9c4c6277_u32, 0x5027_u16, 0x441e_u16, StaticArray[0xaf_u8, 0xae_u8, 0xca_u8, 0x1f_u8, 0x54_u8, 0x2d_u8, 0xa0_u8, 0x9_u8])
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
    restrict_service : Proc(INetFwServiceRestriction*, UInt8*, UInt8*, Int16, Int16, HRESULT)
    service_restricted : Proc(INetFwServiceRestriction*, UInt8*, UInt8*, Int16*, HRESULT)
    get_rules : Proc(INetFwServiceRestriction*, INetFwRules*, HRESULT)
  end

  INetFwServiceRestriction_GUID = "8267bbe3-f890-491c-b7b6-2db1ef0e5d2b"
  IID_INetFwServiceRestriction = LibC::GUID.new(0x8267bbe3_u32, 0xf890_u16, 0x491c_u16, StaticArray[0xb7_u8, 0xb6_u8, 0x2d_u8, 0xb1_u8, 0xef_u8, 0xe_u8, 0x5d_u8, 0x2b_u8])
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

  INetFwProfile_GUID = "174a0dda-e9f9-449d-993b-21ab667ca456"
  IID_INetFwProfile = LibC::GUID.new(0x174a0dda_u32, 0xe9f9_u16, 0x449d_u16, StaticArray[0x99_u8, 0x3b_u8, 0x21_u8, 0xab_u8, 0x66_u8, 0x7c_u8, 0xa4_u8, 0x56_u8])
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

  INetFwPolicy_GUID = "d46d2478-9ac9-4008-9dc7-5563ce5536cc"
  IID_INetFwPolicy = LibC::GUID.new(0xd46d2478_u32, 0x9ac9_u16, 0x4008_u16, StaticArray[0x9d_u8, 0xc7_u8, 0x55_u8, 0x63_u8, 0xce_u8, 0x55_u8, 0x36_u8, 0xcc_u8])
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
    enable_rule_group : Proc(INetFwPolicy2*, Int32, UInt8*, Int16, HRESULT)
    is_rule_group_enabled : Proc(INetFwPolicy2*, Int32, UInt8*, Int16*, HRESULT)
    restore_local_firewall_defaults : Proc(INetFwPolicy2*, HRESULT)
    get_default_inbound_action : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, NET_FW_ACTION*, HRESULT)
    put_default_inbound_action : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, NET_FW_ACTION, HRESULT)
    get_default_outbound_action : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, NET_FW_ACTION*, HRESULT)
    put_default_outbound_action : Proc(INetFwPolicy2*, NET_FW_PROFILE_TYPE2, NET_FW_ACTION, HRESULT)
    get_is_rule_group_currently_enabled : Proc(INetFwPolicy2*, UInt8*, Int16*, HRESULT)
    get_local_policy_modify_state : Proc(INetFwPolicy2*, NET_FW_MODIFY_STATE*, HRESULT)
  end

  INetFwPolicy2_GUID = "98325047-c671-4174-8d81-defcd3f03186"
  IID_INetFwPolicy2 = LibC::GUID.new(0x98325047_u32, 0xc671_u16, 0x4174_u16, StaticArray[0x8d_u8, 0x81_u8, 0xde_u8, 0xfc_u8, 0xd3_u8, 0xf0_u8, 0x31_u8, 0x86_u8])
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
    is_port_allowed : Proc(INetFwMgr*, UInt8*, NET_FW_IP_VERSION, Int32, UInt8*, NET_FW_IP_PROTOCOL, VARIANT*, VARIANT*, HRESULT)
    is_icmp_type_allowed : Proc(INetFwMgr*, NET_FW_IP_VERSION, UInt8*, UInt8, VARIANT*, VARIANT*, HRESULT)
  end

  INetFwMgr_GUID = "f7898af5-cac4-4632-a2ec-da06e5111af2"
  IID_INetFwMgr = LibC::GUID.new(0xf7898af5_u32, 0xcac4_u16, 0x4632_u16, StaticArray[0xa2_u8, 0xec_u8, 0xda_u8, 0x6_u8, 0xe5_u8, 0x11_u8, 0x1a_u8, 0xf2_u8])
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
    get_display_name : Proc(INetFwProduct*, UInt8**, HRESULT)
    put_display_name : Proc(INetFwProduct*, UInt8*, HRESULT)
    get_path_to_signed_product_exe : Proc(INetFwProduct*, UInt8**, HRESULT)
  end

  INetFwProduct_GUID = "71881699-18f4-458b-b892-3ffce5e07f75"
  IID_INetFwProduct = LibC::GUID.new(0x71881699_u32, 0x18f4_u16, 0x458b_u16, StaticArray[0xb8_u8, 0x92_u8, 0x3f_u8, 0xfc_u8, 0xe5_u8, 0xe0_u8, 0x7f_u8, 0x75_u8])
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
  def query_interface(this : IUPnPNAT*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPNAT*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPNAT*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IUPnPNAT*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IUPnPNAT*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IUPnPNAT*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IUPnPNAT*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_static_port_mapping_collection(this : IUPnPNAT*, ppspms : IStaticPortMappingCollection*) : HRESULT
    @lpVtbl.value.get_static_port_mapping_collection.call(this, ppspms)
  end
  def get_dynamic_port_mapping_collection(this : IUPnPNAT*, ppdpms : IDynamicPortMappingCollection*) : HRESULT
    @lpVtbl.value.get_dynamic_port_mapping_collection.call(this, ppdpms)
  end
  def get_nat_event_manager(this : IUPnPNAT*, ppnem : INATEventManager*) : HRESULT
    @lpVtbl.value.get_nat_event_manager.call(this, ppnem)
  end
end
struct LibWin32::INATEventManager
  def query_interface(this : INATEventManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INATEventManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INATEventManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INATEventManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INATEventManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INATEventManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INATEventManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def put_external_ip_address_callback(this : INATEventManager*, punk : IUnknown) : HRESULT
    @lpVtbl.value.put_external_ip_address_callback.call(this, punk)
  end
  def put_number_of_entries_callback(this : INATEventManager*, punk : IUnknown) : HRESULT
    @lpVtbl.value.put_number_of_entries_callback.call(this, punk)
  end
end
struct LibWin32::INATExternalIPAddressCallback
  def query_interface(this : INATExternalIPAddressCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INATExternalIPAddressCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INATExternalIPAddressCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def new_external_ip_address(this : INATExternalIPAddressCallback*, bstrnewexternalipaddress : UInt8*) : HRESULT
    @lpVtbl.value.new_external_ip_address.call(this, bstrnewexternalipaddress)
  end
end
struct LibWin32::INATNumberOfEntriesCallback
  def query_interface(this : INATNumberOfEntriesCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INATNumberOfEntriesCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INATNumberOfEntriesCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def new_number_of_entries(this : INATNumberOfEntriesCallback*, lnewnumberofentries : Int32) : HRESULT
    @lpVtbl.value.new_number_of_entries.call(this, lnewnumberofentries)
  end
end
struct LibWin32::IDynamicPortMappingCollection
  def query_interface(this : IDynamicPortMappingCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDynamicPortMappingCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDynamicPortMappingCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IDynamicPortMappingCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IDynamicPortMappingCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IDynamicPortMappingCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IDynamicPortMappingCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IDynamicPortMappingCollection*, pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
  def get_item(this : IDynamicPortMappingCollection*, bstrremotehost : UInt8*, lexternalport : Int32, bstrprotocol : UInt8*, ppdpm : IDynamicPortMapping*) : HRESULT
    @lpVtbl.value.get_item.call(this, bstrremotehost, lexternalport, bstrprotocol, ppdpm)
  end
  def get_count(this : IDynamicPortMappingCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def remove(this : IDynamicPortMappingCollection*, bstrremotehost : UInt8*, lexternalport : Int32, bstrprotocol : UInt8*) : HRESULT
    @lpVtbl.value.remove.call(this, bstrremotehost, lexternalport, bstrprotocol)
  end
  def add(this : IDynamicPortMappingCollection*, bstrremotehost : UInt8*, lexternalport : Int32, bstrprotocol : UInt8*, linternalport : Int32, bstrinternalclient : UInt8*, benabled : Int16, bstrdescription : UInt8*, lleaseduration : Int32, ppdpm : IDynamicPortMapping*) : HRESULT
    @lpVtbl.value.add.call(this, bstrremotehost, lexternalport, bstrprotocol, linternalport, bstrinternalclient, benabled, bstrdescription, lleaseduration, ppdpm)
  end
end
struct LibWin32::IDynamicPortMapping
  def query_interface(this : IDynamicPortMapping*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDynamicPortMapping*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDynamicPortMapping*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IDynamicPortMapping*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IDynamicPortMapping*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IDynamicPortMapping*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IDynamicPortMapping*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_external_ip_address(this : IDynamicPortMapping*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_external_ip_address.call(this, pval)
  end
  def get_remote_host(this : IDynamicPortMapping*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_host.call(this, pval)
  end
  def get_external_port(this : IDynamicPortMapping*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_external_port.call(this, pval)
  end
  def get_protocol(this : IDynamicPortMapping*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_protocol.call(this, pval)
  end
  def get_internal_port(this : IDynamicPortMapping*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_internal_port.call(this, pval)
  end
  def get_internal_client(this : IDynamicPortMapping*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_internal_client.call(this, pval)
  end
  def get_enabled(this : IDynamicPortMapping*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pval)
  end
  def get_description(this : IDynamicPortMapping*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pval)
  end
  def get_lease_duration(this : IDynamicPortMapping*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_lease_duration.call(this, pval)
  end
  def renew_lease(this : IDynamicPortMapping*, lleasedurationdesired : Int32, pleasedurationreturned : Int32*) : HRESULT
    @lpVtbl.value.renew_lease.call(this, lleasedurationdesired, pleasedurationreturned)
  end
  def edit_internal_client(this : IDynamicPortMapping*, bstrinternalclient : UInt8*) : HRESULT
    @lpVtbl.value.edit_internal_client.call(this, bstrinternalclient)
  end
  def enable(this : IDynamicPortMapping*, vb : Int16) : HRESULT
    @lpVtbl.value.enable.call(this, vb)
  end
  def edit_description(this : IDynamicPortMapping*, bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.edit_description.call(this, bstrdescription)
  end
  def edit_internal_port(this : IDynamicPortMapping*, linternalport : Int32) : HRESULT
    @lpVtbl.value.edit_internal_port.call(this, linternalport)
  end
end
struct LibWin32::IStaticPortMappingCollection
  def query_interface(this : IStaticPortMappingCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStaticPortMappingCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStaticPortMappingCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IStaticPortMappingCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IStaticPortMappingCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IStaticPortMappingCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IStaticPortMappingCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IStaticPortMappingCollection*, pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
  def get_item(this : IStaticPortMappingCollection*, lexternalport : Int32, bstrprotocol : UInt8*, ppspm : IStaticPortMapping*) : HRESULT
    @lpVtbl.value.get_item.call(this, lexternalport, bstrprotocol, ppspm)
  end
  def get_count(this : IStaticPortMappingCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def remove(this : IStaticPortMappingCollection*, lexternalport : Int32, bstrprotocol : UInt8*) : HRESULT
    @lpVtbl.value.remove.call(this, lexternalport, bstrprotocol)
  end
  def add(this : IStaticPortMappingCollection*, lexternalport : Int32, bstrprotocol : UInt8*, linternalport : Int32, bstrinternalclient : UInt8*, benabled : Int16, bstrdescription : UInt8*, ppspm : IStaticPortMapping*) : HRESULT
    @lpVtbl.value.add.call(this, lexternalport, bstrprotocol, linternalport, bstrinternalclient, benabled, bstrdescription, ppspm)
  end
end
struct LibWin32::IStaticPortMapping
  def query_interface(this : IStaticPortMapping*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStaticPortMapping*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStaticPortMapping*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IStaticPortMapping*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IStaticPortMapping*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IStaticPortMapping*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IStaticPortMapping*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_external_ip_address(this : IStaticPortMapping*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_external_ip_address.call(this, pval)
  end
  def get_external_port(this : IStaticPortMapping*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_external_port.call(this, pval)
  end
  def get_internal_port(this : IStaticPortMapping*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_internal_port.call(this, pval)
  end
  def get_protocol(this : IStaticPortMapping*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_protocol.call(this, pval)
  end
  def get_internal_client(this : IStaticPortMapping*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_internal_client.call(this, pval)
  end
  def get_enabled(this : IStaticPortMapping*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pval)
  end
  def get_description(this : IStaticPortMapping*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pval)
  end
  def edit_internal_client(this : IStaticPortMapping*, bstrinternalclient : UInt8*) : HRESULT
    @lpVtbl.value.edit_internal_client.call(this, bstrinternalclient)
  end
  def enable(this : IStaticPortMapping*, vb : Int16) : HRESULT
    @lpVtbl.value.enable.call(this, vb)
  end
  def edit_description(this : IStaticPortMapping*, bstrdescription : UInt8*) : HRESULT
    @lpVtbl.value.edit_description.call(this, bstrdescription)
  end
  def edit_internal_port(this : IStaticPortMapping*, linternalport : Int32) : HRESULT
    @lpVtbl.value.edit_internal_port.call(this, linternalport)
  end
end
struct LibWin32::IEnumNetConnection
  def query_interface(this : IEnumNetConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumNetConnection*, celt : UInt32, rgelt : INetConnection*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumNetConnection*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetConnection*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetConnection*, ppenum : IEnumNetConnection*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::INetConnection
  def query_interface(this : INetConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def connect(this : INetConnection*) : HRESULT
    @lpVtbl.value.connect.call(this)
  end
  def disconnect(this : INetConnection*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
  def delete(this : INetConnection*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def duplicate(this : INetConnection*, pszwduplicatename : LibC::LPWSTR, ppcon : INetConnection*) : HRESULT
    @lpVtbl.value.duplicate.call(this, pszwduplicatename, ppcon)
  end
  def get_properties(this : INetConnection*, ppprops : NETCON_PROPERTIES**) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppprops)
  end
  def get_ui_object_class_id(this : INetConnection*, pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_ui_object_class_id.call(this, pclsid)
  end
  def rename(this : INetConnection*, pszwnewname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.rename.call(this, pszwnewname)
  end
end
struct LibWin32::INetConnectionManager
  def query_interface(this : INetConnectionManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetConnectionManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetConnectionManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enum_connections(this : INetConnectionManager*, flags : NETCONMGR_ENUM_FLAGS, ppenum : IEnumNetConnection*) : HRESULT
    @lpVtbl.value.enum_connections.call(this, flags, ppenum)
  end
end
struct LibWin32::INetConnectionConnectUi
  def query_interface(this : INetConnectionConnectUi*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetConnectionConnectUi*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetConnectionConnectUi*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_connection(this : INetConnectionConnectUi*, pcon : INetConnection) : HRESULT
    @lpVtbl.value.set_connection.call(this, pcon)
  end
  def connect(this : INetConnectionConnectUi*, hwndparent : LibC::HANDLE, dwflags : UInt32) : HRESULT
    @lpVtbl.value.connect.call(this, hwndparent, dwflags)
  end
  def disconnect(this : INetConnectionConnectUi*, hwndparent : LibC::HANDLE, dwflags : UInt32) : HRESULT
    @lpVtbl.value.disconnect.call(this, hwndparent, dwflags)
  end
end
struct LibWin32::IEnumNetSharingPortMapping
  def query_interface(this : IEnumNetSharingPortMapping*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetSharingPortMapping*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetSharingPortMapping*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumNetSharingPortMapping*, celt : UInt32, rgvar : VARIANT*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgvar, pceltfetched)
  end
  def skip(this : IEnumNetSharingPortMapping*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetSharingPortMapping*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetSharingPortMapping*, ppenum : IEnumNetSharingPortMapping*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::INetSharingPortMappingProps
  def query_interface(this : INetSharingPortMappingProps*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetSharingPortMappingProps*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetSharingPortMappingProps*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetSharingPortMappingProps*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetSharingPortMappingProps*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetSharingPortMappingProps*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetSharingPortMappingProps*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : INetSharingPortMappingProps*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def get_ip_protocol(this : INetSharingPortMappingProps*, pucipprot : UInt8*) : HRESULT
    @lpVtbl.value.get_ip_protocol.call(this, pucipprot)
  end
  def get_external_port(this : INetSharingPortMappingProps*, pusport : Int32*) : HRESULT
    @lpVtbl.value.get_external_port.call(this, pusport)
  end
  def get_internal_port(this : INetSharingPortMappingProps*, pusport : Int32*) : HRESULT
    @lpVtbl.value.get_internal_port.call(this, pusport)
  end
  def get_options(this : INetSharingPortMappingProps*, pdwoptions : Int32*) : HRESULT
    @lpVtbl.value.get_options.call(this, pdwoptions)
  end
  def get_target_name(this : INetSharingPortMappingProps*, pbstrtargetname : UInt8**) : HRESULT
    @lpVtbl.value.get_target_name.call(this, pbstrtargetname)
  end
  def get_target_ip_address(this : INetSharingPortMappingProps*, pbstrtargetipaddress : UInt8**) : HRESULT
    @lpVtbl.value.get_target_ip_address.call(this, pbstrtargetipaddress)
  end
  def get_enabled(this : INetSharingPortMappingProps*, pbool : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pbool)
  end
end
struct LibWin32::INetSharingPortMapping
  def query_interface(this : INetSharingPortMapping*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetSharingPortMapping*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetSharingPortMapping*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetSharingPortMapping*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetSharingPortMapping*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetSharingPortMapping*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetSharingPortMapping*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def disable(this : INetSharingPortMapping*) : HRESULT
    @lpVtbl.value.disable.call(this)
  end
  def enable(this : INetSharingPortMapping*) : HRESULT
    @lpVtbl.value.enable.call(this)
  end
  def get_properties(this : INetSharingPortMapping*, ppnspmp : INetSharingPortMappingProps*) : HRESULT
    @lpVtbl.value.get_properties.call(this, ppnspmp)
  end
  def delete(this : INetSharingPortMapping*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
end
struct LibWin32::IEnumNetSharingEveryConnection
  def query_interface(this : IEnumNetSharingEveryConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetSharingEveryConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetSharingEveryConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumNetSharingEveryConnection*, celt : UInt32, rgvar : VARIANT*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgvar, pceltfetched)
  end
  def skip(this : IEnumNetSharingEveryConnection*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetSharingEveryConnection*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetSharingEveryConnection*, ppenum : IEnumNetSharingEveryConnection*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IEnumNetSharingPublicConnection
  def query_interface(this : IEnumNetSharingPublicConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetSharingPublicConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetSharingPublicConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumNetSharingPublicConnection*, celt : UInt32, rgvar : VARIANT*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgvar, pceltfetched)
  end
  def skip(this : IEnumNetSharingPublicConnection*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetSharingPublicConnection*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetSharingPublicConnection*, ppenum : IEnumNetSharingPublicConnection*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IEnumNetSharingPrivateConnection
  def query_interface(this : IEnumNetSharingPrivateConnection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetSharingPrivateConnection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetSharingPrivateConnection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumNetSharingPrivateConnection*, celt : UInt32, rgvar : VARIANT*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgvar, pceltfetched)
  end
  def skip(this : IEnumNetSharingPrivateConnection*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetSharingPrivateConnection*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetSharingPrivateConnection*, ppenum : IEnumNetSharingPrivateConnection*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::INetSharingPortMappingCollection
  def query_interface(this : INetSharingPortMappingCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetSharingPortMappingCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetSharingPortMappingCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetSharingPortMappingCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetSharingPortMappingCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetSharingPortMappingCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetSharingPortMappingCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : INetSharingPortMappingCollection*, pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
  def get_count(this : INetSharingPortMappingCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
end
struct LibWin32::INetConnectionProps
  def query_interface(this : INetConnectionProps*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetConnectionProps*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetConnectionProps*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetConnectionProps*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetConnectionProps*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetConnectionProps*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetConnectionProps*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_guid(this : INetConnectionProps*, pbstrguid : UInt8**) : HRESULT
    @lpVtbl.value.get_guid.call(this, pbstrguid)
  end
  def get_name(this : INetConnectionProps*, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pbstrname)
  end
  def get_device_name(this : INetConnectionProps*, pbstrdevicename : UInt8**) : HRESULT
    @lpVtbl.value.get_device_name.call(this, pbstrdevicename)
  end
  def get_status(this : INetConnectionProps*, pstatus : NETCON_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_media_type(this : INetConnectionProps*, pmediatype : NETCON_MEDIATYPE*) : HRESULT
    @lpVtbl.value.get_media_type.call(this, pmediatype)
  end
  def get_characteristics(this : INetConnectionProps*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_characteristics.call(this, pdwflags)
  end
end
struct LibWin32::INetSharingConfiguration
  def query_interface(this : INetSharingConfiguration*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetSharingConfiguration*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetSharingConfiguration*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetSharingConfiguration*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetSharingConfiguration*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetSharingConfiguration*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetSharingConfiguration*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_sharing_enabled(this : INetSharingConfiguration*, pbenabled : Int16*) : HRESULT
    @lpVtbl.value.get_sharing_enabled.call(this, pbenabled)
  end
  def get_sharing_connection_type(this : INetSharingConfiguration*, ptype : SHARINGCONNECTIONTYPE*) : HRESULT
    @lpVtbl.value.get_sharing_connection_type.call(this, ptype)
  end
  def disable_sharing(this : INetSharingConfiguration*) : HRESULT
    @lpVtbl.value.disable_sharing.call(this)
  end
  def enable_sharing(this : INetSharingConfiguration*, type : SHARINGCONNECTIONTYPE) : HRESULT
    @lpVtbl.value.enable_sharing.call(this, type)
  end
  def get_internet_firewall_enabled(this : INetSharingConfiguration*, pbenabled : Int16*) : HRESULT
    @lpVtbl.value.get_internet_firewall_enabled.call(this, pbenabled)
  end
  def disable_internet_firewall(this : INetSharingConfiguration*) : HRESULT
    @lpVtbl.value.disable_internet_firewall.call(this)
  end
  def enable_internet_firewall(this : INetSharingConfiguration*) : HRESULT
    @lpVtbl.value.enable_internet_firewall.call(this)
  end
  def get_enum_port_mappings(this : INetSharingConfiguration*, flags : SHARINGCONNECTION_ENUM_FLAGS, ppcoll : INetSharingPortMappingCollection*) : HRESULT
    @lpVtbl.value.get_enum_port_mappings.call(this, flags, ppcoll)
  end
  def add_port_mapping(this : INetSharingConfiguration*, bstrname : UInt8*, ucipprotocol : UInt8, usexternalport : UInt16, usinternalport : UInt16, dwoptions : UInt32, bstrtargetnameoripaddress : UInt8*, etargettype : ICS_TARGETTYPE, ppmapping : INetSharingPortMapping*) : HRESULT
    @lpVtbl.value.add_port_mapping.call(this, bstrname, ucipprotocol, usexternalport, usinternalport, dwoptions, bstrtargetnameoripaddress, etargettype, ppmapping)
  end
  def remove_port_mapping(this : INetSharingConfiguration*, pmapping : INetSharingPortMapping) : HRESULT
    @lpVtbl.value.remove_port_mapping.call(this, pmapping)
  end
end
struct LibWin32::INetSharingEveryConnectionCollection
  def query_interface(this : INetSharingEveryConnectionCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetSharingEveryConnectionCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetSharingEveryConnectionCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetSharingEveryConnectionCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetSharingEveryConnectionCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetSharingEveryConnectionCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetSharingEveryConnectionCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : INetSharingEveryConnectionCollection*, pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
  def get_count(this : INetSharingEveryConnectionCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
end
struct LibWin32::INetSharingPublicConnectionCollection
  def query_interface(this : INetSharingPublicConnectionCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetSharingPublicConnectionCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetSharingPublicConnectionCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetSharingPublicConnectionCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetSharingPublicConnectionCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetSharingPublicConnectionCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetSharingPublicConnectionCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : INetSharingPublicConnectionCollection*, pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
  def get_count(this : INetSharingPublicConnectionCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
end
struct LibWin32::INetSharingPrivateConnectionCollection
  def query_interface(this : INetSharingPrivateConnectionCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetSharingPrivateConnectionCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetSharingPrivateConnectionCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetSharingPrivateConnectionCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetSharingPrivateConnectionCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetSharingPrivateConnectionCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetSharingPrivateConnectionCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : INetSharingPrivateConnectionCollection*, pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
  def get_count(this : INetSharingPrivateConnectionCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
end
struct LibWin32::INetSharingManager
  def query_interface(this : INetSharingManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetSharingManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetSharingManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetSharingManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetSharingManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetSharingManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetSharingManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_sharing_installed(this : INetSharingManager*, pbinstalled : Int16*) : HRESULT
    @lpVtbl.value.get_sharing_installed.call(this, pbinstalled)
  end
  def get_enum_public_connections(this : INetSharingManager*, flags : SHARINGCONNECTION_ENUM_FLAGS, ppcoll : INetSharingPublicConnectionCollection*) : HRESULT
    @lpVtbl.value.get_enum_public_connections.call(this, flags, ppcoll)
  end
  def get_enum_private_connections(this : INetSharingManager*, flags : SHARINGCONNECTION_ENUM_FLAGS, ppcoll : INetSharingPrivateConnectionCollection*) : HRESULT
    @lpVtbl.value.get_enum_private_connections.call(this, flags, ppcoll)
  end
  def get_i_net_sharing_configuration_for_i_net_connection(this : INetSharingManager*, pnetconnection : INetConnection, ppnetsharingconfiguration : INetSharingConfiguration*) : HRESULT
    @lpVtbl.value.get_i_net_sharing_configuration_for_i_net_connection.call(this, pnetconnection, ppnetsharingconfiguration)
  end
  def get_enum_every_connection(this : INetSharingManager*, ppcoll : INetSharingEveryConnectionCollection*) : HRESULT
    @lpVtbl.value.get_enum_every_connection.call(this, ppcoll)
  end
  def get_net_connection_props(this : INetSharingManager*, pnetconnection : INetConnection, ppprops : INetConnectionProps*) : HRESULT
    @lpVtbl.value.get_net_connection_props.call(this, pnetconnection, ppprops)
  end
end
struct LibWin32::INetFwRemoteAdminSettings
  def query_interface(this : INetFwRemoteAdminSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwRemoteAdminSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwRemoteAdminSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwRemoteAdminSettings*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwRemoteAdminSettings*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwRemoteAdminSettings*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwRemoteAdminSettings*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_ip_version(this : INetFwRemoteAdminSettings*, ipversion : NET_FW_IP_VERSION*) : HRESULT
    @lpVtbl.value.get_ip_version.call(this, ipversion)
  end
  def put_ip_version(this : INetFwRemoteAdminSettings*, ipversion : NET_FW_IP_VERSION) : HRESULT
    @lpVtbl.value.put_ip_version.call(this, ipversion)
  end
  def get_scope(this : INetFwRemoteAdminSettings*, scope : NET_FW_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.call(this, scope)
  end
  def put_scope(this : INetFwRemoteAdminSettings*, scope : NET_FW_SCOPE) : HRESULT
    @lpVtbl.value.put_scope.call(this, scope)
  end
  def get_remote_addresses(this : INetFwRemoteAdminSettings*, remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.call(this, remoteaddrs)
  end
  def put_remote_addresses(this : INetFwRemoteAdminSettings*, remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.call(this, remoteaddrs)
  end
  def get_enabled(this : INetFwRemoteAdminSettings*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : INetFwRemoteAdminSettings*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
end
struct LibWin32::INetFwIcmpSettings
  def query_interface(this : INetFwIcmpSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwIcmpSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwIcmpSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwIcmpSettings*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwIcmpSettings*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwIcmpSettings*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwIcmpSettings*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_allow_outbound_destination_unreachable(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_destination_unreachable.call(this, allow)
  end
  def put_allow_outbound_destination_unreachable(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_destination_unreachable.call(this, allow)
  end
  def get_allow_redirect(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_redirect.call(this, allow)
  end
  def put_allow_redirect(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_redirect.call(this, allow)
  end
  def get_allow_inbound_echo_request(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_inbound_echo_request.call(this, allow)
  end
  def put_allow_inbound_echo_request(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_inbound_echo_request.call(this, allow)
  end
  def get_allow_outbound_time_exceeded(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_time_exceeded.call(this, allow)
  end
  def put_allow_outbound_time_exceeded(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_time_exceeded.call(this, allow)
  end
  def get_allow_outbound_parameter_problem(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_parameter_problem.call(this, allow)
  end
  def put_allow_outbound_parameter_problem(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_parameter_problem.call(this, allow)
  end
  def get_allow_outbound_source_quench(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_source_quench.call(this, allow)
  end
  def put_allow_outbound_source_quench(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_source_quench.call(this, allow)
  end
  def get_allow_inbound_router_request(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_inbound_router_request.call(this, allow)
  end
  def put_allow_inbound_router_request(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_inbound_router_request.call(this, allow)
  end
  def get_allow_inbound_timestamp_request(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_inbound_timestamp_request.call(this, allow)
  end
  def put_allow_inbound_timestamp_request(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_inbound_timestamp_request.call(this, allow)
  end
  def get_allow_inbound_mask_request(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_inbound_mask_request.call(this, allow)
  end
  def put_allow_inbound_mask_request(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_inbound_mask_request.call(this, allow)
  end
  def get_allow_outbound_packet_too_big(this : INetFwIcmpSettings*, allow : Int16*) : HRESULT
    @lpVtbl.value.get_allow_outbound_packet_too_big.call(this, allow)
  end
  def put_allow_outbound_packet_too_big(this : INetFwIcmpSettings*, allow : Int16) : HRESULT
    @lpVtbl.value.put_allow_outbound_packet_too_big.call(this, allow)
  end
end
struct LibWin32::INetFwOpenPort
  def query_interface(this : INetFwOpenPort*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwOpenPort*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwOpenPort*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwOpenPort*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwOpenPort*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwOpenPort*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwOpenPort*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : INetFwOpenPort*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : INetFwOpenPort*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_ip_version(this : INetFwOpenPort*, ipversion : NET_FW_IP_VERSION*) : HRESULT
    @lpVtbl.value.get_ip_version.call(this, ipversion)
  end
  def put_ip_version(this : INetFwOpenPort*, ipversion : NET_FW_IP_VERSION) : HRESULT
    @lpVtbl.value.put_ip_version.call(this, ipversion)
  end
  def get_protocol(this : INetFwOpenPort*, ipprotocol : NET_FW_IP_PROTOCOL*) : HRESULT
    @lpVtbl.value.get_protocol.call(this, ipprotocol)
  end
  def put_protocol(this : INetFwOpenPort*, ipprotocol : NET_FW_IP_PROTOCOL) : HRESULT
    @lpVtbl.value.put_protocol.call(this, ipprotocol)
  end
  def get_port(this : INetFwOpenPort*, portnumber : Int32*) : HRESULT
    @lpVtbl.value.get_port.call(this, portnumber)
  end
  def put_port(this : INetFwOpenPort*, portnumber : Int32) : HRESULT
    @lpVtbl.value.put_port.call(this, portnumber)
  end
  def get_scope(this : INetFwOpenPort*, scope : NET_FW_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.call(this, scope)
  end
  def put_scope(this : INetFwOpenPort*, scope : NET_FW_SCOPE) : HRESULT
    @lpVtbl.value.put_scope.call(this, scope)
  end
  def get_remote_addresses(this : INetFwOpenPort*, remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.call(this, remoteaddrs)
  end
  def put_remote_addresses(this : INetFwOpenPort*, remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.call(this, remoteaddrs)
  end
  def get_enabled(this : INetFwOpenPort*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : INetFwOpenPort*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_built_in(this : INetFwOpenPort*, builtin : Int16*) : HRESULT
    @lpVtbl.value.get_built_in.call(this, builtin)
  end
end
struct LibWin32::INetFwOpenPorts
  def query_interface(this : INetFwOpenPorts*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwOpenPorts*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwOpenPorts*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwOpenPorts*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwOpenPorts*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwOpenPorts*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwOpenPorts*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : INetFwOpenPorts*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def add(this : INetFwOpenPorts*, port : INetFwOpenPort) : HRESULT
    @lpVtbl.value.add.call(this, port)
  end
  def remove(this : INetFwOpenPorts*, portnumber : Int32, ipprotocol : NET_FW_IP_PROTOCOL) : HRESULT
    @lpVtbl.value.remove.call(this, portnumber, ipprotocol)
  end
  def item(this : INetFwOpenPorts*, portnumber : Int32, ipprotocol : NET_FW_IP_PROTOCOL, openport : INetFwOpenPort*) : HRESULT
    @lpVtbl.value.item.call(this, portnumber, ipprotocol, openport)
  end
  def get__new_enum(this : INetFwOpenPorts*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
end
struct LibWin32::INetFwService
  def query_interface(this : INetFwService*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwService*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwService*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwService*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwService*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwService*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwService*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : INetFwService*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_type(this : INetFwService*, type : NET_FW_SERVICE_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, type)
  end
  def get_customized(this : INetFwService*, customized : Int16*) : HRESULT
    @lpVtbl.value.get_customized.call(this, customized)
  end
  def get_ip_version(this : INetFwService*, ipversion : NET_FW_IP_VERSION*) : HRESULT
    @lpVtbl.value.get_ip_version.call(this, ipversion)
  end
  def put_ip_version(this : INetFwService*, ipversion : NET_FW_IP_VERSION) : HRESULT
    @lpVtbl.value.put_ip_version.call(this, ipversion)
  end
  def get_scope(this : INetFwService*, scope : NET_FW_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.call(this, scope)
  end
  def put_scope(this : INetFwService*, scope : NET_FW_SCOPE) : HRESULT
    @lpVtbl.value.put_scope.call(this, scope)
  end
  def get_remote_addresses(this : INetFwService*, remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.call(this, remoteaddrs)
  end
  def put_remote_addresses(this : INetFwService*, remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.call(this, remoteaddrs)
  end
  def get_enabled(this : INetFwService*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : INetFwService*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_globally_open_ports(this : INetFwService*, openports : INetFwOpenPorts*) : HRESULT
    @lpVtbl.value.get_globally_open_ports.call(this, openports)
  end
end
struct LibWin32::INetFwServices
  def query_interface(this : INetFwServices*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwServices*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwServices*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwServices*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwServices*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwServices*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwServices*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : INetFwServices*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def item(this : INetFwServices*, svctype : NET_FW_SERVICE_TYPE, service : INetFwService*) : HRESULT
    @lpVtbl.value.item.call(this, svctype, service)
  end
  def get__new_enum(this : INetFwServices*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
end
struct LibWin32::INetFwAuthorizedApplication
  def query_interface(this : INetFwAuthorizedApplication*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwAuthorizedApplication*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwAuthorizedApplication*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwAuthorizedApplication*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwAuthorizedApplication*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwAuthorizedApplication*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwAuthorizedApplication*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : INetFwAuthorizedApplication*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : INetFwAuthorizedApplication*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_process_image_file_name(this : INetFwAuthorizedApplication*, imagefilename : UInt8**) : HRESULT
    @lpVtbl.value.get_process_image_file_name.call(this, imagefilename)
  end
  def put_process_image_file_name(this : INetFwAuthorizedApplication*, imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.put_process_image_file_name.call(this, imagefilename)
  end
  def get_ip_version(this : INetFwAuthorizedApplication*, ipversion : NET_FW_IP_VERSION*) : HRESULT
    @lpVtbl.value.get_ip_version.call(this, ipversion)
  end
  def put_ip_version(this : INetFwAuthorizedApplication*, ipversion : NET_FW_IP_VERSION) : HRESULT
    @lpVtbl.value.put_ip_version.call(this, ipversion)
  end
  def get_scope(this : INetFwAuthorizedApplication*, scope : NET_FW_SCOPE*) : HRESULT
    @lpVtbl.value.get_scope.call(this, scope)
  end
  def put_scope(this : INetFwAuthorizedApplication*, scope : NET_FW_SCOPE) : HRESULT
    @lpVtbl.value.put_scope.call(this, scope)
  end
  def get_remote_addresses(this : INetFwAuthorizedApplication*, remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.call(this, remoteaddrs)
  end
  def put_remote_addresses(this : INetFwAuthorizedApplication*, remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.call(this, remoteaddrs)
  end
  def get_enabled(this : INetFwAuthorizedApplication*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : INetFwAuthorizedApplication*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
end
struct LibWin32::INetFwAuthorizedApplications
  def query_interface(this : INetFwAuthorizedApplications*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwAuthorizedApplications*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwAuthorizedApplications*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwAuthorizedApplications*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwAuthorizedApplications*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwAuthorizedApplications*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwAuthorizedApplications*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : INetFwAuthorizedApplications*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def add(this : INetFwAuthorizedApplications*, app : INetFwAuthorizedApplication) : HRESULT
    @lpVtbl.value.add.call(this, app)
  end
  def remove(this : INetFwAuthorizedApplications*, imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.remove.call(this, imagefilename)
  end
  def item(this : INetFwAuthorizedApplications*, imagefilename : UInt8*, app : INetFwAuthorizedApplication*) : HRESULT
    @lpVtbl.value.item.call(this, imagefilename, app)
  end
  def get__new_enum(this : INetFwAuthorizedApplications*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
end
struct LibWin32::INetFwRule
  def query_interface(this : INetFwRule*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwRule*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwRule*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwRule*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwRule*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwRule*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwRule*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : INetFwRule*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : INetFwRule*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_description(this : INetFwRule*, desc : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, desc)
  end
  def put_description(this : INetFwRule*, desc : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, desc)
  end
  def get_application_name(this : INetFwRule*, imagefilename : UInt8**) : HRESULT
    @lpVtbl.value.get_application_name.call(this, imagefilename)
  end
  def put_application_name(this : INetFwRule*, imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.put_application_name.call(this, imagefilename)
  end
  def get_service_name(this : INetFwRule*, servicename : UInt8**) : HRESULT
    @lpVtbl.value.get_service_name.call(this, servicename)
  end
  def put_service_name(this : INetFwRule*, servicename : UInt8*) : HRESULT
    @lpVtbl.value.put_service_name.call(this, servicename)
  end
  def get_protocol(this : INetFwRule*, protocol : Int32*) : HRESULT
    @lpVtbl.value.get_protocol.call(this, protocol)
  end
  def put_protocol(this : INetFwRule*, protocol : Int32) : HRESULT
    @lpVtbl.value.put_protocol.call(this, protocol)
  end
  def get_local_ports(this : INetFwRule*, portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_local_ports.call(this, portnumbers)
  end
  def put_local_ports(this : INetFwRule*, portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_local_ports.call(this, portnumbers)
  end
  def get_remote_ports(this : INetFwRule*, portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_ports.call(this, portnumbers)
  end
  def put_remote_ports(this : INetFwRule*, portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_ports.call(this, portnumbers)
  end
  def get_local_addresses(this : INetFwRule*, localaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_local_addresses.call(this, localaddrs)
  end
  def put_local_addresses(this : INetFwRule*, localaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_local_addresses.call(this, localaddrs)
  end
  def get_remote_addresses(this : INetFwRule*, remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.call(this, remoteaddrs)
  end
  def put_remote_addresses(this : INetFwRule*, remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.call(this, remoteaddrs)
  end
  def get_icmp_types_and_codes(this : INetFwRule*, icmptypesandcodes : UInt8**) : HRESULT
    @lpVtbl.value.get_icmp_types_and_codes.call(this, icmptypesandcodes)
  end
  def put_icmp_types_and_codes(this : INetFwRule*, icmptypesandcodes : UInt8*) : HRESULT
    @lpVtbl.value.put_icmp_types_and_codes.call(this, icmptypesandcodes)
  end
  def get_direction(this : INetFwRule*, dir : NET_FW_RULE_DIRECTION*) : HRESULT
    @lpVtbl.value.get_direction.call(this, dir)
  end
  def put_direction(this : INetFwRule*, dir : NET_FW_RULE_DIRECTION) : HRESULT
    @lpVtbl.value.put_direction.call(this, dir)
  end
  def get_interfaces(this : INetFwRule*, interfaces : VARIANT*) : HRESULT
    @lpVtbl.value.get_interfaces.call(this, interfaces)
  end
  def put_interfaces(this : INetFwRule*, interfaces : VARIANT) : HRESULT
    @lpVtbl.value.put_interfaces.call(this, interfaces)
  end
  def get_interface_types(this : INetFwRule*, interfacetypes : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_types.call(this, interfacetypes)
  end
  def put_interface_types(this : INetFwRule*, interfacetypes : UInt8*) : HRESULT
    @lpVtbl.value.put_interface_types.call(this, interfacetypes)
  end
  def get_enabled(this : INetFwRule*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : INetFwRule*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_grouping(this : INetFwRule*, context : UInt8**) : HRESULT
    @lpVtbl.value.get_grouping.call(this, context)
  end
  def put_grouping(this : INetFwRule*, context : UInt8*) : HRESULT
    @lpVtbl.value.put_grouping.call(this, context)
  end
  def get_profiles(this : INetFwRule*, profiletypesbitmask : Int32*) : HRESULT
    @lpVtbl.value.get_profiles.call(this, profiletypesbitmask)
  end
  def put_profiles(this : INetFwRule*, profiletypesbitmask : Int32) : HRESULT
    @lpVtbl.value.put_profiles.call(this, profiletypesbitmask)
  end
  def get_edge_traversal(this : INetFwRule*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_edge_traversal.call(this, enabled)
  end
  def put_edge_traversal(this : INetFwRule*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_edge_traversal.call(this, enabled)
  end
  def get_action(this : INetFwRule*, action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_action.call(this, action)
  end
  def put_action(this : INetFwRule*, action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_action.call(this, action)
  end
end
struct LibWin32::INetFwRule2
  def query_interface(this : INetFwRule2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwRule2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwRule2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwRule2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwRule2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwRule2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwRule2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : INetFwRule2*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : INetFwRule2*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_description(this : INetFwRule2*, desc : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, desc)
  end
  def put_description(this : INetFwRule2*, desc : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, desc)
  end
  def get_application_name(this : INetFwRule2*, imagefilename : UInt8**) : HRESULT
    @lpVtbl.value.get_application_name.call(this, imagefilename)
  end
  def put_application_name(this : INetFwRule2*, imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.put_application_name.call(this, imagefilename)
  end
  def get_service_name(this : INetFwRule2*, servicename : UInt8**) : HRESULT
    @lpVtbl.value.get_service_name.call(this, servicename)
  end
  def put_service_name(this : INetFwRule2*, servicename : UInt8*) : HRESULT
    @lpVtbl.value.put_service_name.call(this, servicename)
  end
  def get_protocol(this : INetFwRule2*, protocol : Int32*) : HRESULT
    @lpVtbl.value.get_protocol.call(this, protocol)
  end
  def put_protocol(this : INetFwRule2*, protocol : Int32) : HRESULT
    @lpVtbl.value.put_protocol.call(this, protocol)
  end
  def get_local_ports(this : INetFwRule2*, portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_local_ports.call(this, portnumbers)
  end
  def put_local_ports(this : INetFwRule2*, portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_local_ports.call(this, portnumbers)
  end
  def get_remote_ports(this : INetFwRule2*, portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_ports.call(this, portnumbers)
  end
  def put_remote_ports(this : INetFwRule2*, portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_ports.call(this, portnumbers)
  end
  def get_local_addresses(this : INetFwRule2*, localaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_local_addresses.call(this, localaddrs)
  end
  def put_local_addresses(this : INetFwRule2*, localaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_local_addresses.call(this, localaddrs)
  end
  def get_remote_addresses(this : INetFwRule2*, remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.call(this, remoteaddrs)
  end
  def put_remote_addresses(this : INetFwRule2*, remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.call(this, remoteaddrs)
  end
  def get_icmp_types_and_codes(this : INetFwRule2*, icmptypesandcodes : UInt8**) : HRESULT
    @lpVtbl.value.get_icmp_types_and_codes.call(this, icmptypesandcodes)
  end
  def put_icmp_types_and_codes(this : INetFwRule2*, icmptypesandcodes : UInt8*) : HRESULT
    @lpVtbl.value.put_icmp_types_and_codes.call(this, icmptypesandcodes)
  end
  def get_direction(this : INetFwRule2*, dir : NET_FW_RULE_DIRECTION*) : HRESULT
    @lpVtbl.value.get_direction.call(this, dir)
  end
  def put_direction(this : INetFwRule2*, dir : NET_FW_RULE_DIRECTION) : HRESULT
    @lpVtbl.value.put_direction.call(this, dir)
  end
  def get_interfaces(this : INetFwRule2*, interfaces : VARIANT*) : HRESULT
    @lpVtbl.value.get_interfaces.call(this, interfaces)
  end
  def put_interfaces(this : INetFwRule2*, interfaces : VARIANT) : HRESULT
    @lpVtbl.value.put_interfaces.call(this, interfaces)
  end
  def get_interface_types(this : INetFwRule2*, interfacetypes : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_types.call(this, interfacetypes)
  end
  def put_interface_types(this : INetFwRule2*, interfacetypes : UInt8*) : HRESULT
    @lpVtbl.value.put_interface_types.call(this, interfacetypes)
  end
  def get_enabled(this : INetFwRule2*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : INetFwRule2*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_grouping(this : INetFwRule2*, context : UInt8**) : HRESULT
    @lpVtbl.value.get_grouping.call(this, context)
  end
  def put_grouping(this : INetFwRule2*, context : UInt8*) : HRESULT
    @lpVtbl.value.put_grouping.call(this, context)
  end
  def get_profiles(this : INetFwRule2*, profiletypesbitmask : Int32*) : HRESULT
    @lpVtbl.value.get_profiles.call(this, profiletypesbitmask)
  end
  def put_profiles(this : INetFwRule2*, profiletypesbitmask : Int32) : HRESULT
    @lpVtbl.value.put_profiles.call(this, profiletypesbitmask)
  end
  def get_edge_traversal(this : INetFwRule2*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_edge_traversal.call(this, enabled)
  end
  def put_edge_traversal(this : INetFwRule2*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_edge_traversal.call(this, enabled)
  end
  def get_action(this : INetFwRule2*, action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_action.call(this, action)
  end
  def put_action(this : INetFwRule2*, action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_action.call(this, action)
  end
  def get_edge_traversal_options(this : INetFwRule2*, loptions : Int32*) : HRESULT
    @lpVtbl.value.get_edge_traversal_options.call(this, loptions)
  end
  def put_edge_traversal_options(this : INetFwRule2*, loptions : Int32) : HRESULT
    @lpVtbl.value.put_edge_traversal_options.call(this, loptions)
  end
end
struct LibWin32::INetFwRule3
  def query_interface(this : INetFwRule3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwRule3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwRule3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwRule3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwRule3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwRule3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwRule3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : INetFwRule3*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : INetFwRule3*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_description(this : INetFwRule3*, desc : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, desc)
  end
  def put_description(this : INetFwRule3*, desc : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, desc)
  end
  def get_application_name(this : INetFwRule3*, imagefilename : UInt8**) : HRESULT
    @lpVtbl.value.get_application_name.call(this, imagefilename)
  end
  def put_application_name(this : INetFwRule3*, imagefilename : UInt8*) : HRESULT
    @lpVtbl.value.put_application_name.call(this, imagefilename)
  end
  def get_service_name(this : INetFwRule3*, servicename : UInt8**) : HRESULT
    @lpVtbl.value.get_service_name.call(this, servicename)
  end
  def put_service_name(this : INetFwRule3*, servicename : UInt8*) : HRESULT
    @lpVtbl.value.put_service_name.call(this, servicename)
  end
  def get_protocol(this : INetFwRule3*, protocol : Int32*) : HRESULT
    @lpVtbl.value.get_protocol.call(this, protocol)
  end
  def put_protocol(this : INetFwRule3*, protocol : Int32) : HRESULT
    @lpVtbl.value.put_protocol.call(this, protocol)
  end
  def get_local_ports(this : INetFwRule3*, portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_local_ports.call(this, portnumbers)
  end
  def put_local_ports(this : INetFwRule3*, portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_local_ports.call(this, portnumbers)
  end
  def get_remote_ports(this : INetFwRule3*, portnumbers : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_ports.call(this, portnumbers)
  end
  def put_remote_ports(this : INetFwRule3*, portnumbers : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_ports.call(this, portnumbers)
  end
  def get_local_addresses(this : INetFwRule3*, localaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_local_addresses.call(this, localaddrs)
  end
  def put_local_addresses(this : INetFwRule3*, localaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_local_addresses.call(this, localaddrs)
  end
  def get_remote_addresses(this : INetFwRule3*, remoteaddrs : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_addresses.call(this, remoteaddrs)
  end
  def put_remote_addresses(this : INetFwRule3*, remoteaddrs : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_addresses.call(this, remoteaddrs)
  end
  def get_icmp_types_and_codes(this : INetFwRule3*, icmptypesandcodes : UInt8**) : HRESULT
    @lpVtbl.value.get_icmp_types_and_codes.call(this, icmptypesandcodes)
  end
  def put_icmp_types_and_codes(this : INetFwRule3*, icmptypesandcodes : UInt8*) : HRESULT
    @lpVtbl.value.put_icmp_types_and_codes.call(this, icmptypesandcodes)
  end
  def get_direction(this : INetFwRule3*, dir : NET_FW_RULE_DIRECTION*) : HRESULT
    @lpVtbl.value.get_direction.call(this, dir)
  end
  def put_direction(this : INetFwRule3*, dir : NET_FW_RULE_DIRECTION) : HRESULT
    @lpVtbl.value.put_direction.call(this, dir)
  end
  def get_interfaces(this : INetFwRule3*, interfaces : VARIANT*) : HRESULT
    @lpVtbl.value.get_interfaces.call(this, interfaces)
  end
  def put_interfaces(this : INetFwRule3*, interfaces : VARIANT) : HRESULT
    @lpVtbl.value.put_interfaces.call(this, interfaces)
  end
  def get_interface_types(this : INetFwRule3*, interfacetypes : UInt8**) : HRESULT
    @lpVtbl.value.get_interface_types.call(this, interfacetypes)
  end
  def put_interface_types(this : INetFwRule3*, interfacetypes : UInt8*) : HRESULT
    @lpVtbl.value.put_interface_types.call(this, interfacetypes)
  end
  def get_enabled(this : INetFwRule3*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : INetFwRule3*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_grouping(this : INetFwRule3*, context : UInt8**) : HRESULT
    @lpVtbl.value.get_grouping.call(this, context)
  end
  def put_grouping(this : INetFwRule3*, context : UInt8*) : HRESULT
    @lpVtbl.value.put_grouping.call(this, context)
  end
  def get_profiles(this : INetFwRule3*, profiletypesbitmask : Int32*) : HRESULT
    @lpVtbl.value.get_profiles.call(this, profiletypesbitmask)
  end
  def put_profiles(this : INetFwRule3*, profiletypesbitmask : Int32) : HRESULT
    @lpVtbl.value.put_profiles.call(this, profiletypesbitmask)
  end
  def get_edge_traversal(this : INetFwRule3*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_edge_traversal.call(this, enabled)
  end
  def put_edge_traversal(this : INetFwRule3*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_edge_traversal.call(this, enabled)
  end
  def get_action(this : INetFwRule3*, action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_action.call(this, action)
  end
  def put_action(this : INetFwRule3*, action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_action.call(this, action)
  end
  def get_edge_traversal_options(this : INetFwRule3*, loptions : Int32*) : HRESULT
    @lpVtbl.value.get_edge_traversal_options.call(this, loptions)
  end
  def put_edge_traversal_options(this : INetFwRule3*, loptions : Int32) : HRESULT
    @lpVtbl.value.put_edge_traversal_options.call(this, loptions)
  end
  def get_local_app_package_id(this : INetFwRule3*, wszpackageid : UInt8**) : HRESULT
    @lpVtbl.value.get_local_app_package_id.call(this, wszpackageid)
  end
  def put_local_app_package_id(this : INetFwRule3*, wszpackageid : UInt8*) : HRESULT
    @lpVtbl.value.put_local_app_package_id.call(this, wszpackageid)
  end
  def get_local_user_owner(this : INetFwRule3*, wszuserowner : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_owner.call(this, wszuserowner)
  end
  def put_local_user_owner(this : INetFwRule3*, wszuserowner : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_owner.call(this, wszuserowner)
  end
  def get_local_user_authorized_list(this : INetFwRule3*, wszuserauthlist : UInt8**) : HRESULT
    @lpVtbl.value.get_local_user_authorized_list.call(this, wszuserauthlist)
  end
  def put_local_user_authorized_list(this : INetFwRule3*, wszuserauthlist : UInt8*) : HRESULT
    @lpVtbl.value.put_local_user_authorized_list.call(this, wszuserauthlist)
  end
  def get_remote_user_authorized_list(this : INetFwRule3*, wszuserauthlist : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_user_authorized_list.call(this, wszuserauthlist)
  end
  def put_remote_user_authorized_list(this : INetFwRule3*, wszuserauthlist : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_user_authorized_list.call(this, wszuserauthlist)
  end
  def get_remote_machine_authorized_list(this : INetFwRule3*, wszuserauthlist : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_machine_authorized_list.call(this, wszuserauthlist)
  end
  def put_remote_machine_authorized_list(this : INetFwRule3*, wszuserauthlist : UInt8*) : HRESULT
    @lpVtbl.value.put_remote_machine_authorized_list.call(this, wszuserauthlist)
  end
  def get_secure_flags(this : INetFwRule3*, loptions : Int32*) : HRESULT
    @lpVtbl.value.get_secure_flags.call(this, loptions)
  end
  def put_secure_flags(this : INetFwRule3*, loptions : Int32) : HRESULT
    @lpVtbl.value.put_secure_flags.call(this, loptions)
  end
end
struct LibWin32::INetFwRules
  def query_interface(this : INetFwRules*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwRules*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwRules*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwRules*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwRules*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwRules*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwRules*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : INetFwRules*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def add(this : INetFwRules*, rule : INetFwRule) : HRESULT
    @lpVtbl.value.add.call(this, rule)
  end
  def remove(this : INetFwRules*, name : UInt8*) : HRESULT
    @lpVtbl.value.remove.call(this, name)
  end
  def item(this : INetFwRules*, name : UInt8*, rule : INetFwRule*) : HRESULT
    @lpVtbl.value.item.call(this, name, rule)
  end
  def get__new_enum(this : INetFwRules*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
end
struct LibWin32::INetFwServiceRestriction
  def query_interface(this : INetFwServiceRestriction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwServiceRestriction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwServiceRestriction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwServiceRestriction*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwServiceRestriction*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwServiceRestriction*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwServiceRestriction*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def restrict_service(this : INetFwServiceRestriction*, servicename : UInt8*, appname : UInt8*, restrictservice : Int16, servicesidrestricted : Int16) : HRESULT
    @lpVtbl.value.restrict_service.call(this, servicename, appname, restrictservice, servicesidrestricted)
  end
  def service_restricted(this : INetFwServiceRestriction*, servicename : UInt8*, appname : UInt8*, servicerestricted : Int16*) : HRESULT
    @lpVtbl.value.service_restricted.call(this, servicename, appname, servicerestricted)
  end
  def get_rules(this : INetFwServiceRestriction*, rules : INetFwRules*) : HRESULT
    @lpVtbl.value.get_rules.call(this, rules)
  end
end
struct LibWin32::INetFwProfile
  def query_interface(this : INetFwProfile*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwProfile*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwProfile*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwProfile*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwProfile*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwProfile*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwProfile*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : INetFwProfile*, type : NET_FW_PROFILE_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, type)
  end
  def get_firewall_enabled(this : INetFwProfile*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_firewall_enabled.call(this, enabled)
  end
  def put_firewall_enabled(this : INetFwProfile*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_firewall_enabled.call(this, enabled)
  end
  def get_exceptions_not_allowed(this : INetFwProfile*, notallowed : Int16*) : HRESULT
    @lpVtbl.value.get_exceptions_not_allowed.call(this, notallowed)
  end
  def put_exceptions_not_allowed(this : INetFwProfile*, notallowed : Int16) : HRESULT
    @lpVtbl.value.put_exceptions_not_allowed.call(this, notallowed)
  end
  def get_notifications_disabled(this : INetFwProfile*, disabled : Int16*) : HRESULT
    @lpVtbl.value.get_notifications_disabled.call(this, disabled)
  end
  def put_notifications_disabled(this : INetFwProfile*, disabled : Int16) : HRESULT
    @lpVtbl.value.put_notifications_disabled.call(this, disabled)
  end
  def get_unicast_responses_to_multicast_broadcast_disabled(this : INetFwProfile*, disabled : Int16*) : HRESULT
    @lpVtbl.value.get_unicast_responses_to_multicast_broadcast_disabled.call(this, disabled)
  end
  def put_unicast_responses_to_multicast_broadcast_disabled(this : INetFwProfile*, disabled : Int16) : HRESULT
    @lpVtbl.value.put_unicast_responses_to_multicast_broadcast_disabled.call(this, disabled)
  end
  def get_remote_admin_settings(this : INetFwProfile*, remoteadminsettings : INetFwRemoteAdminSettings*) : HRESULT
    @lpVtbl.value.get_remote_admin_settings.call(this, remoteadminsettings)
  end
  def get_icmp_settings(this : INetFwProfile*, icmpsettings : INetFwIcmpSettings*) : HRESULT
    @lpVtbl.value.get_icmp_settings.call(this, icmpsettings)
  end
  def get_globally_open_ports(this : INetFwProfile*, openports : INetFwOpenPorts*) : HRESULT
    @lpVtbl.value.get_globally_open_ports.call(this, openports)
  end
  def get_services(this : INetFwProfile*, services : INetFwServices*) : HRESULT
    @lpVtbl.value.get_services.call(this, services)
  end
  def get_authorized_applications(this : INetFwProfile*, apps : INetFwAuthorizedApplications*) : HRESULT
    @lpVtbl.value.get_authorized_applications.call(this, apps)
  end
end
struct LibWin32::INetFwPolicy
  def query_interface(this : INetFwPolicy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwPolicy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwPolicy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwPolicy*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwPolicy*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwPolicy*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwPolicy*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_current_profile(this : INetFwPolicy*, profile : INetFwProfile*) : HRESULT
    @lpVtbl.value.get_current_profile.call(this, profile)
  end
  def get_profile_by_type(this : INetFwPolicy*, profiletype : NET_FW_PROFILE_TYPE, profile : INetFwProfile*) : HRESULT
    @lpVtbl.value.get_profile_by_type.call(this, profiletype, profile)
  end
end
struct LibWin32::INetFwPolicy2
  def query_interface(this : INetFwPolicy2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwPolicy2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwPolicy2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwPolicy2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwPolicy2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwPolicy2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwPolicy2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_current_profile_types(this : INetFwPolicy2*, profiletypesbitmask : Int32*) : HRESULT
    @lpVtbl.value.get_current_profile_types.call(this, profiletypesbitmask)
  end
  def get_firewall_enabled(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_firewall_enabled.call(this, profiletype, enabled)
  end
  def put_firewall_enabled(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, enabled : Int16) : HRESULT
    @lpVtbl.value.put_firewall_enabled.call(this, profiletype, enabled)
  end
  def get_excluded_interfaces(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, interfaces : VARIANT*) : HRESULT
    @lpVtbl.value.get_excluded_interfaces.call(this, profiletype, interfaces)
  end
  def put_excluded_interfaces(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, interfaces : VARIANT) : HRESULT
    @lpVtbl.value.put_excluded_interfaces.call(this, profiletype, interfaces)
  end
  def get_block_all_inbound_traffic(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, block : Int16*) : HRESULT
    @lpVtbl.value.get_block_all_inbound_traffic.call(this, profiletype, block)
  end
  def put_block_all_inbound_traffic(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, block : Int16) : HRESULT
    @lpVtbl.value.put_block_all_inbound_traffic.call(this, profiletype, block)
  end
  def get_notifications_disabled(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, disabled : Int16*) : HRESULT
    @lpVtbl.value.get_notifications_disabled.call(this, profiletype, disabled)
  end
  def put_notifications_disabled(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, disabled : Int16) : HRESULT
    @lpVtbl.value.put_notifications_disabled.call(this, profiletype, disabled)
  end
  def get_unicast_responses_to_multicast_broadcast_disabled(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, disabled : Int16*) : HRESULT
    @lpVtbl.value.get_unicast_responses_to_multicast_broadcast_disabled.call(this, profiletype, disabled)
  end
  def put_unicast_responses_to_multicast_broadcast_disabled(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, disabled : Int16) : HRESULT
    @lpVtbl.value.put_unicast_responses_to_multicast_broadcast_disabled.call(this, profiletype, disabled)
  end
  def get_rules(this : INetFwPolicy2*, rules : INetFwRules*) : HRESULT
    @lpVtbl.value.get_rules.call(this, rules)
  end
  def get_service_restriction(this : INetFwPolicy2*, servicerestriction : INetFwServiceRestriction*) : HRESULT
    @lpVtbl.value.get_service_restriction.call(this, servicerestriction)
  end
  def enable_rule_group(this : INetFwPolicy2*, profiletypesbitmask : Int32, group : UInt8*, enable : Int16) : HRESULT
    @lpVtbl.value.enable_rule_group.call(this, profiletypesbitmask, group, enable)
  end
  def is_rule_group_enabled(this : INetFwPolicy2*, profiletypesbitmask : Int32, group : UInt8*, enabled : Int16*) : HRESULT
    @lpVtbl.value.is_rule_group_enabled.call(this, profiletypesbitmask, group, enabled)
  end
  def restore_local_firewall_defaults(this : INetFwPolicy2*) : HRESULT
    @lpVtbl.value.restore_local_firewall_defaults.call(this)
  end
  def get_default_inbound_action(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_default_inbound_action.call(this, profiletype, action)
  end
  def put_default_inbound_action(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_default_inbound_action.call(this, profiletype, action)
  end
  def get_default_outbound_action(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, action : NET_FW_ACTION*) : HRESULT
    @lpVtbl.value.get_default_outbound_action.call(this, profiletype, action)
  end
  def put_default_outbound_action(this : INetFwPolicy2*, profiletype : NET_FW_PROFILE_TYPE2, action : NET_FW_ACTION) : HRESULT
    @lpVtbl.value.put_default_outbound_action.call(this, profiletype, action)
  end
  def get_is_rule_group_currently_enabled(this : INetFwPolicy2*, group : UInt8*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_is_rule_group_currently_enabled.call(this, group, enabled)
  end
  def get_local_policy_modify_state(this : INetFwPolicy2*, modifystate : NET_FW_MODIFY_STATE*) : HRESULT
    @lpVtbl.value.get_local_policy_modify_state.call(this, modifystate)
  end
end
struct LibWin32::INetFwMgr
  def query_interface(this : INetFwMgr*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwMgr*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwMgr*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwMgr*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwMgr*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwMgr*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwMgr*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_local_policy(this : INetFwMgr*, localpolicy : INetFwPolicy*) : HRESULT
    @lpVtbl.value.get_local_policy.call(this, localpolicy)
  end
  def get_current_profile_type(this : INetFwMgr*, profiletype : NET_FW_PROFILE_TYPE*) : HRESULT
    @lpVtbl.value.get_current_profile_type.call(this, profiletype)
  end
  def restore_defaults(this : INetFwMgr*) : HRESULT
    @lpVtbl.value.restore_defaults.call(this)
  end
  def is_port_allowed(this : INetFwMgr*, imagefilename : UInt8*, ipversion : NET_FW_IP_VERSION, portnumber : Int32, localaddress : UInt8*, ipprotocol : NET_FW_IP_PROTOCOL, allowed : VARIANT*, restricted : VARIANT*) : HRESULT
    @lpVtbl.value.is_port_allowed.call(this, imagefilename, ipversion, portnumber, localaddress, ipprotocol, allowed, restricted)
  end
  def is_icmp_type_allowed(this : INetFwMgr*, ipversion : NET_FW_IP_VERSION, localaddress : UInt8*, type : UInt8, allowed : VARIANT*, restricted : VARIANT*) : HRESULT
    @lpVtbl.value.is_icmp_type_allowed.call(this, ipversion, localaddress, type, allowed, restricted)
  end
end
struct LibWin32::INetFwProduct
  def query_interface(this : INetFwProduct*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwProduct*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwProduct*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwProduct*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwProduct*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwProduct*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwProduct*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_rule_categories(this : INetFwProduct*, rulecategories : VARIANT*) : HRESULT
    @lpVtbl.value.get_rule_categories.call(this, rulecategories)
  end
  def put_rule_categories(this : INetFwProduct*, rulecategories : VARIANT) : HRESULT
    @lpVtbl.value.put_rule_categories.call(this, rulecategories)
  end
  def get_display_name(this : INetFwProduct*, displayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, displayname)
  end
  def put_display_name(this : INetFwProduct*, displayname : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.call(this, displayname)
  end
  def get_path_to_signed_product_exe(this : INetFwProduct*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_path_to_signed_product_exe.call(this, path)
  end
end
struct LibWin32::INetFwProducts
  def query_interface(this : INetFwProducts*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetFwProducts*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetFwProducts*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetFwProducts*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetFwProducts*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetFwProducts*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetFwProducts*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : INetFwProducts*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def register(this : INetFwProducts*, product : INetFwProduct, registration : IUnknown*) : HRESULT
    @lpVtbl.value.register.call(this, product, registration)
  end
  def item(this : INetFwProducts*, index : Int32, product : INetFwProduct*) : HRESULT
    @lpVtbl.value.item.call(this, index, product)
  end
  def get__new_enum(this : INetFwProducts*, newenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, newenum)
  end
end
