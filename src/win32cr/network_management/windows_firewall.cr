require "./../system/com.cr"
require "./../foundation.cr"
require "./../security.cr"

module Win32cr::NetworkManagement::WindowsFirewall
  extend self
  alias PAC_CHANGES_CALLBACK_FN = Proc(Void*, Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_CHANGE*, Void)

  alias PNETISO_EDP_ID_CALLBACK_FN = Proc(Void*, Win32cr::Foundation::PWSTR, UInt32, Void)

  alias PFN_FWADDDYNAMICKEYWORDADDRESS0 = Proc(Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_address0_*, UInt32)

  alias PFN_FWDELETEDYNAMICKEYWORDADDRESS0 = Proc(LibC::GUID, UInt32)

  alias PFN_FWENUMDYNAMICKEYWORDADDRESSESBYTYPE0 = Proc(UInt32, Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_address_data0_**, UInt32)

  alias PFN_FWENUMDYNAMICKEYWORDADDRESSBYID0 = Proc(LibC::GUID, Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_address_data0_**, UInt32)

  alias PFN_FWFREEDYNAMICKEYWORDADDRESSDATA0 = Proc(Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_address_data0_*, UInt32)

  alias PFN_FWUPDATEDYNAMICKEYWORDADDRESS0 = Proc(LibC::GUID, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt32)

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

  enum NETCON_CHARACTERISTIC_FLAGS
    NCCF_NONE = 0_i32
    NCCF_ALL_USERS = 1_i32
    NCCF_ALLOW_DUPLICATION = 2_i32
    NCCF_ALLOW_REMOVAL = 4_i32
    NCCF_ALLOW_RENAME = 8_i32
    NCCF_INCOMING_ONLY = 32_i32
    NCCF_OUTGOING_ONLY = 64_i32
    NCCF_BRANDED = 128_i32
    NCCF_SHARED = 256_i32
    NCCF_BRIDGED = 512_i32
    NCCF_FIREWALLED = 1024_i32
    NCCF_DEFAULT = 2048_i32
    NCCF_HOMENET_CAPABLE = 4096_i32
    NCCF_SHARED_PRIVATE = 8192_i32
    NCCF_QUARANTINED = 16384_i32
    NCCF_RESERVED = 32768_i32
    NCCF_HOSTED_NETWORK = 65536_i32
    NCCF_VIRTUAL_STATION = 131072_i32
    NCCF_WIFI_DIRECT = 262144_i32
    NCCF_BLUETOOTH_MASK = 983040_i32
    NCCF_LAN_MASK = 15728640_i32
  end
  enum NETCON_STATUS
    NCS_DISCONNECTED = 0_i32
    NCS_CONNECTING = 1_i32
    NCS_CONNECTED = 2_i32
    NCS_DISCONNECTING = 3_i32
    NCS_HARDWARE_NOT_PRESENT = 4_i32
    NCS_HARDWARE_DISABLED = 5_i32
    NCS_HARDWARE_MALFUNCTION = 6_i32
    NCS_MEDIA_DISCONNECTED = 7_i32
    NCS_AUTHENTICATING = 8_i32
    NCS_AUTHENTICATION_SUCCEEDED = 9_i32
    NCS_AUTHENTICATION_FAILED = 10_i32
    NCS_INVALID_ADDRESS = 11_i32
    NCS_CREDENTIALS_REQUIRED = 12_i32
    NCS_ACTION_REQUIRED = 13_i32
    NCS_ACTION_REQUIRED_RETRY = 14_i32
    NCS_CONNECT_FAILED = 15_i32
  end
  enum NETCON_TYPE
    NCT_DIRECT_CONNECT = 0_i32
    NCT_INBOUND = 1_i32
    NCT_INTERNET = 2_i32
    NCT_LAN = 3_i32
    NCT_PHONE = 4_i32
    NCT_TUNNEL = 5_i32
    NCT_BRIDGE = 6_i32
  end
  enum NETCON_MEDIATYPE
    NCM_NONE = 0_i32
    NCM_DIRECT = 1_i32
    NCM_ISDN = 2_i32
    NCM_LAN = 3_i32
    NCM_PHONE = 4_i32
    NCM_TUNNEL = 5_i32
    NCM_PPPOE = 6_i32
    NCM_BRIDGE = 7_i32
    NCM_SHAREDACCESSHOST_LAN = 8_i32
    NCM_SHAREDACCESSHOST_RAS = 9_i32
  end
  enum NETCONMGR_ENUM_FLAGS
    NCME_DEFAULT = 0_i32
    NCME_HIDDEN = 1_i32
  end
  enum NETCONUI_CONNECT_FLAGS
    NCUC_DEFAULT = 0_i32
    NCUC_NO_UI = 1_i32
    NCUC_ENABLE_DISABLE = 2_i32
  end
  enum SHARINGCONNECTIONTYPE
    ICSSHARINGTYPE_PUBLIC = 0_i32
    ICSSHARINGTYPE_PRIVATE = 1_i32
  end
  enum SHARINGCONNECTION_ENUM_FLAGS
    ICSSC_DEFAULT = 0_i32
    ICSSC_ENABLED = 1_i32
  end
  enum ICS_TARGETTYPE
    ICSTT_NAME = 0_i32
    ICSTT_IPADDRESS = 1_i32
  end
  enum NET_FW_POLICY_TYPE
    NET_FW_POLICY_GROUP = 0_i32
    NET_FW_POLICY_LOCAL = 1_i32
    NET_FW_POLICY_EFFECTIVE = 2_i32
    NET_FW_POLICY_TYPE_MAX = 3_i32
  end
  enum NET_FW_PROFILE_TYPE
    NET_FW_PROFILE_DOMAIN = 0_i32
    NET_FW_PROFILE_STANDARD = 1_i32
    NET_FW_PROFILE_CURRENT = 2_i32
    NET_FW_PROFILE_TYPE_MAX = 3_i32
  end
  enum NET_FW_PROFILE_TYPE2
    NET_FW_PROFILE2_DOMAIN = 1_i32
    NET_FW_PROFILE2_PRIVATE = 2_i32
    NET_FW_PROFILE2_PUBLIC = 4_i32
    NET_FW_PROFILE2_ALL = 2147483647_i32
  end
  enum NET_FW_IP_VERSION
    NET_FW_IP_VERSION_V4 = 0_i32
    NET_FW_IP_VERSION_V6 = 1_i32
    NET_FW_IP_VERSION_ANY = 2_i32
    NET_FW_IP_VERSION_MAX = 3_i32
  end
  enum NET_FW_SCOPE
    NET_FW_SCOPE_ALL = 0_i32
    NET_FW_SCOPE_LOCAL_SUBNET = 1_i32
    NET_FW_SCOPE_CUSTOM = 2_i32
    NET_FW_SCOPE_MAX = 3_i32
  end
  enum NET_FW_IP_PROTOCOL
    NET_FW_IP_PROTOCOL_TCP = 6_i32
    NET_FW_IP_PROTOCOL_UDP = 17_i32
    NET_FW_IP_PROTOCOL_ANY = 256_i32
  end
  enum NET_FW_SERVICE_TYPE
    NET_FW_SERVICE_FILE_AND_PRINT = 0_i32
    NET_FW_SERVICE_UPNP = 1_i32
    NET_FW_SERVICE_REMOTE_DESKTOP = 2_i32
    NET_FW_SERVICE_NONE = 3_i32
    NET_FW_SERVICE_TYPE_MAX = 4_i32
  end
  enum NET_FW_RULE_DIRECTION
    NET_FW_RULE_DIR_IN = 1_i32
    NET_FW_RULE_DIR_OUT = 2_i32
    NET_FW_RULE_DIR_MAX = 3_i32
  end
  enum NET_FW_ACTION
    NET_FW_ACTION_BLOCK = 0_i32
    NET_FW_ACTION_ALLOW = 1_i32
    NET_FW_ACTION_MAX = 2_i32
  end
  enum NET_FW_MODIFY_STATE
    NET_FW_MODIFY_STATE_OK = 0_i32
    NET_FW_MODIFY_STATE_GP_OVERRIDE = 1_i32
    NET_FW_MODIFY_STATE_INBOUND_BLOCKED = 2_i32
  end
  enum NET_FW_RULE_CATEGORY
    NET_FW_RULE_CATEGORY_BOOT = 0_i32
    NET_FW_RULE_CATEGORY_STEALTH = 1_i32
    NET_FW_RULE_CATEGORY_FIREWALL = 2_i32
    NET_FW_RULE_CATEGORY_CONSEC = 3_i32
    NET_FW_RULE_CATEGORY_MAX = 4_i32
  end
  enum NET_FW_EDGE_TRAVERSAL_TYPE
    NET_FW_EDGE_TRAVERSAL_TYPE_DENY = 0_i32
    NET_FW_EDGE_TRAVERSAL_TYPE_ALLOW = 1_i32
    NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_APP = 2_i32
    NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_USER = 3_i32
  end
  enum NET_FW_AUTHENTICATE_TYPE
    NET_FW_AUTHENTICATE_NONE = 0_i32
    NET_FW_AUTHENTICATE_NO_ENCAPSULATION = 1_i32
    NET_FW_AUTHENTICATE_WITH_INTEGRITY = 2_i32
    NET_FW_AUTHENTICATE_AND_NEGOTIATE_ENCRYPTION = 3_i32
    NET_FW_AUTHENTICATE_AND_ENCRYPT = 4_i32
  end
  enum NETISO_FLAG
    NETISO_FLAG_FORCE_COMPUTE_BINARIES = 1_i32
    NETISO_FLAG_MAX = 2_i32
  end
  enum INET_FIREWALL_AC_CREATION_TYPE
    INET_FIREWALL_AC_NONE = 0_i32
    INET_FIREWALL_AC_PACKAGE_ID_ONLY = 1_i32
    INET_FIREWALL_AC_BINARY = 2_i32
    INET_FIREWALL_AC_MAX = 4_i32
  end
  enum INET_FIREWALL_AC_CHANGE_TYPE
    INET_FIREWALL_AC_CHANGE_INVALID = 0_i32
    INET_FIREWALL_AC_CHANGE_CREATE = 1_i32
    INET_FIREWALL_AC_CHANGE_DELETE = 2_i32
    INET_FIREWALL_AC_CHANGE_MAX = 3_i32
  end
  enum NETISO_ERROR_TYPE
    NETISO_ERROR_TYPE_NONE = 0_i32
    NETISO_ERROR_TYPE_PRIVATE_NETWORK = 1_i32
    NETISO_ERROR_TYPE_INTERNET_CLIENT = 2_i32
    NETISO_ERROR_TYPE_INTERNET_CLIENT_SERVER = 3_i32
    NETISO_ERROR_TYPE_MAX = 4_i32
  end
  enum Tag_fw_dynamic_keyword_origin_type_
    FW_DYNAMIC_KEYWORD_ORIGIN_INVALID = 0_i32
    FW_DYNAMIC_KEYWORD_ORIGIN_LOCAL = 1_i32
    FW_DYNAMIC_KEYWORD_ORIGIN_MDM = 2_i32
  end
  enum Tag_fw_dynamic_keyword_address_flags_
    FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE = 1_i32
  end
  enum Tag_fw_dynamic_keyword_address_enum_flags_
    FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_AUTO_RESOLVE = 1_i32
    FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_NON_AUTO_RESOLVE = 2_i32
    FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_ALL = 3_i32
  end

  @[Extern]
  struct NETCON_PROPERTIES
    property guidId : LibC::GUID
    property pszwName : Win32cr::Foundation::PWSTR
    property pszwDeviceName : Win32cr::Foundation::PWSTR
    property status : Win32cr::NetworkManagement::WindowsFirewall::NETCON_STATUS
    property media_type : Win32cr::NetworkManagement::WindowsFirewall::NETCON_MEDIATYPE
    property dwCharacter : UInt32
    property clsidThisObject : LibC::GUID
    property clsidUiObject : LibC::GUID
    def initialize(@guidId : LibC::GUID, @pszwName : Win32cr::Foundation::PWSTR, @pszwDeviceName : Win32cr::Foundation::PWSTR, @status : Win32cr::NetworkManagement::WindowsFirewall::NETCON_STATUS, @media_type : Win32cr::NetworkManagement::WindowsFirewall::NETCON_MEDIATYPE, @dwCharacter : UInt32, @clsidThisObject : LibC::GUID, @clsidUiObject : LibC::GUID)
    end
  end

  @[Extern]
  struct INET_FIREWALL_AC_CAPABILITIES
    property count : UInt32
    property capabilities : Win32cr::Security::SID_AND_ATTRIBUTES*
    def initialize(@count : UInt32, @capabilities : Win32cr::Security::SID_AND_ATTRIBUTES*)
    end
  end

  @[Extern]
  struct INET_FIREWALL_AC_BINARIES
    property count : UInt32
    property binaries : Win32cr::Foundation::PWSTR*
    def initialize(@count : UInt32, @binaries : Win32cr::Foundation::PWSTR*)
    end
  end

  @[Extern]
  struct INET_FIREWALL_AC_CHANGE
    property changeType : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_CHANGE_TYPE
    property createType : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_CREATION_TYPE
    property appContainerSid : Win32cr::Security::SID*
    property userSid : Win32cr::Security::SID*
    property displayName : Win32cr::Foundation::PWSTR
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property capabilities : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_CAPABILITIES
    property binaries : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_BINARIES
    def initialize(@capabilities : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_CAPABILITIES, @binaries : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_BINARIES)
    end
    end

    def initialize(@changeType : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_CHANGE_TYPE, @createType : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_CREATION_TYPE, @appContainerSid : Win32cr::Security::SID*, @userSid : Win32cr::Security::SID*, @displayName : Win32cr::Foundation::PWSTR, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct INET_FIREWALL_APP_CONTAINER
    property appContainerSid : Win32cr::Security::SID*
    property userSid : Win32cr::Security::SID*
    property appContainerName : Win32cr::Foundation::PWSTR
    property displayName : Win32cr::Foundation::PWSTR
    property description : Win32cr::Foundation::PWSTR
    property capabilities : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_CAPABILITIES
    property binaries : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_BINARIES
    property workingDirectory : Win32cr::Foundation::PWSTR
    property packageFullName : Win32cr::Foundation::PWSTR
    def initialize(@appContainerSid : Win32cr::Security::SID*, @userSid : Win32cr::Security::SID*, @appContainerName : Win32cr::Foundation::PWSTR, @displayName : Win32cr::Foundation::PWSTR, @description : Win32cr::Foundation::PWSTR, @capabilities : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_CAPABILITIES, @binaries : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_AC_BINARIES, @workingDirectory : Win32cr::Foundation::PWSTR, @packageFullName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct Tag_fw_dynamic_keyword_address0_
    property id : LibC::GUID
    property keyword : Win32cr::Foundation::PWSTR
    property flags : UInt32
    property addresses : Win32cr::Foundation::PWSTR
    def initialize(@id : LibC::GUID, @keyword : Win32cr::Foundation::PWSTR, @flags : UInt32, @addresses : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct Tag_fw_dynamic_keyword_address_data0_
    property dynamicKeywordAddress : Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_address0_
    property next__ : Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_address_data0_*
    property schemaVersion : UInt16
    property originType : Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_origin_type_
    def initialize(@dynamicKeywordAddress : Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_address0_, @next__ : Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_address_data0_*, @schemaVersion : UInt16, @originType : Win32cr::NetworkManagement::WindowsFirewall::Tag_fw_dynamic_keyword_origin_type_)
    end
  end

  @[Extern]
  record IUPnPNATVtbl,
    query_interface : Proc(IUPnPNAT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPNAT*, UInt32),
    release : Proc(IUPnPNAT*, UInt32),
    get_type_info_count : Proc(IUPnPNAT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUPnPNAT*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUPnPNAT*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUPnPNAT*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_StaticPortMappingCollection : Proc(IUPnPNAT*, Void**, Win32cr::Foundation::HRESULT),
    get_DynamicPortMappingCollection : Proc(IUPnPNAT*, Void**, Win32cr::Foundation::HRESULT),
    get_NATEventManager : Proc(IUPnPNAT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPNAT, lpVtbl : IUPnPNATVtbl* do
    GUID = LibC::GUID.new(0xb171c812_u32, 0xcc76_u16, 0x485a_u16, StaticArray[0x94_u8, 0xd8_u8, 0xb6_u8, 0xb3_u8, 0xa2_u8, 0x79_u8, 0x4e_u8, 0x99_u8])
    def query_interface(this : IUPnPNAT*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPNAT*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPNAT*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUPnPNAT*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUPnPNAT*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUPnPNAT*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUPnPNAT*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_StaticPortMappingCollection(this : IUPnPNAT*, ppSPMs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StaticPortMappingCollection.call(this, ppSPMs)
    end
    def get_DynamicPortMappingCollection(this : IUPnPNAT*, ppDPMs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DynamicPortMappingCollection.call(this, ppDPMs)
    end
    def get_NATEventManager(this : IUPnPNAT*, ppNEM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NATEventManager.call(this, ppNEM)
    end

  end

  @[Extern]
  record INATEventManagerVtbl,
    query_interface : Proc(INATEventManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INATEventManager*, UInt32),
    release : Proc(INATEventManager*, UInt32),
    get_type_info_count : Proc(INATEventManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INATEventManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INATEventManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INATEventManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ExternalIPAddressCallback : Proc(INATEventManager*, Void*, Win32cr::Foundation::HRESULT),
    put_NumberOfEntriesCallback : Proc(INATEventManager*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INATEventManager, lpVtbl : INATEventManagerVtbl* do
    GUID = LibC::GUID.new(0x624bd588_u32, 0x9060_u16, 0x4109_u16, StaticArray[0xb0_u8, 0xb0_u8, 0x1a_u8, 0xdb_u8, 0xbc_u8, 0xac_u8, 0x32_u8, 0xdf_u8])
    def query_interface(this : INATEventManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INATEventManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INATEventManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INATEventManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INATEventManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INATEventManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INATEventManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def put_ExternalIPAddressCallback(this : INATEventManager*, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExternalIPAddressCallback.call(this, pUnk)
    end
    def put_NumberOfEntriesCallback(this : INATEventManager*, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NumberOfEntriesCallback.call(this, pUnk)
    end

  end

  @[Extern]
  record INATExternalIPAddressCallbackVtbl,
    query_interface : Proc(INATExternalIPAddressCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INATExternalIPAddressCallback*, UInt32),
    release : Proc(INATExternalIPAddressCallback*, UInt32),
    new_external_ip_address : Proc(INATExternalIPAddressCallback*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INATExternalIPAddressCallback, lpVtbl : INATExternalIPAddressCallbackVtbl* do
    GUID = LibC::GUID.new(0x9c416740_u32, 0xa34e_u16, 0x446f_u16, StaticArray[0xba_u8, 0x6_u8, 0xab_u8, 0xd0_u8, 0x4c_u8, 0x31_u8, 0x49_u8, 0xae_u8])
    def query_interface(this : INATExternalIPAddressCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INATExternalIPAddressCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INATExternalIPAddressCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def new_external_ip_address(this : INATExternalIPAddressCallback*, bstrNewExternalIPAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_external_ip_address.call(this, bstrNewExternalIPAddress)
    end

  end

  @[Extern]
  record INATNumberOfEntriesCallbackVtbl,
    query_interface : Proc(INATNumberOfEntriesCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INATNumberOfEntriesCallback*, UInt32),
    release : Proc(INATNumberOfEntriesCallback*, UInt32),
    new_number_of_entries : Proc(INATNumberOfEntriesCallback*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INATNumberOfEntriesCallback, lpVtbl : INATNumberOfEntriesCallbackVtbl* do
    GUID = LibC::GUID.new(0xc83a0a74_u32, 0x91ee_u16, 0x41b6_u16, StaticArray[0xb6_u8, 0x7a_u8, 0x67_u8, 0xe0_u8, 0xf0_u8, 0xb_u8, 0xbd_u8, 0x78_u8])
    def query_interface(this : INATNumberOfEntriesCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INATNumberOfEntriesCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INATNumberOfEntriesCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def new_number_of_entries(this : INATNumberOfEntriesCallback*, lNewNumberOfEntries : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_number_of_entries.call(this, lNewNumberOfEntries)
    end

  end

  @[Extern]
  record IDynamicPortMappingCollectionVtbl,
    query_interface : Proc(IDynamicPortMappingCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDynamicPortMappingCollection*, UInt32),
    release : Proc(IDynamicPortMappingCollection*, UInt32),
    get_type_info_count : Proc(IDynamicPortMappingCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDynamicPortMappingCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDynamicPortMappingCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDynamicPortMappingCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IDynamicPortMappingCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IDynamicPortMappingCollection*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IDynamicPortMappingCollection*, Int32*, Win32cr::Foundation::HRESULT),
    remove : Proc(IDynamicPortMappingCollection*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add : Proc(IDynamicPortMappingCollection*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDynamicPortMappingCollection, lpVtbl : IDynamicPortMappingCollectionVtbl* do
    GUID = LibC::GUID.new(0xb60de00f_u32, 0x156e_u16, 0x4e8d_u16, StaticArray[0x9e_u8, 0xc1_u8, 0x3a_u8, 0x23_u8, 0x42_u8, 0xc1_u8, 0x8_u8, 0x99_u8])
    def query_interface(this : IDynamicPortMappingCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDynamicPortMappingCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDynamicPortMappingCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDynamicPortMappingCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDynamicPortMappingCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDynamicPortMappingCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDynamicPortMappingCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IDynamicPortMappingCollection*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end
    def get_Item(this : IDynamicPortMappingCollection*, bstrRemoteHost : Win32cr::Foundation::BSTR, lExternalPort : Int32, bstrProtocol : Win32cr::Foundation::BSTR, ppDPM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, bstrRemoteHost, lExternalPort, bstrProtocol, ppDPM)
    end
    def get_Count(this : IDynamicPortMappingCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def remove(this : IDynamicPortMappingCollection*, bstrRemoteHost : Win32cr::Foundation::BSTR, lExternalPort : Int32, bstrProtocol : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, bstrRemoteHost, lExternalPort, bstrProtocol)
    end
    def add(this : IDynamicPortMappingCollection*, bstrRemoteHost : Win32cr::Foundation::BSTR, lExternalPort : Int32, bstrProtocol : Win32cr::Foundation::BSTR, lInternalPort : Int32, bstrInternalClient : Win32cr::Foundation::BSTR, bEnabled : Int16, bstrDescription : Win32cr::Foundation::BSTR, lLeaseDuration : Int32, ppDPM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, bstrRemoteHost, lExternalPort, bstrProtocol, lInternalPort, bstrInternalClient, bEnabled, bstrDescription, lLeaseDuration, ppDPM)
    end

  end

  @[Extern]
  record IDynamicPortMappingVtbl,
    query_interface : Proc(IDynamicPortMapping*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDynamicPortMapping*, UInt32),
    release : Proc(IDynamicPortMapping*, UInt32),
    get_type_info_count : Proc(IDynamicPortMapping*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDynamicPortMapping*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDynamicPortMapping*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDynamicPortMapping*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ExternalIPAddress : Proc(IDynamicPortMapping*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RemoteHost : Proc(IDynamicPortMapping*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ExternalPort : Proc(IDynamicPortMapping*, Int32*, Win32cr::Foundation::HRESULT),
    get_Protocol : Proc(IDynamicPortMapping*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_InternalPort : Proc(IDynamicPortMapping*, Int32*, Win32cr::Foundation::HRESULT),
    get_InternalClient : Proc(IDynamicPortMapping*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IDynamicPortMapping*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IDynamicPortMapping*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_LeaseDuration : Proc(IDynamicPortMapping*, Int32*, Win32cr::Foundation::HRESULT),
    renew_lease : Proc(IDynamicPortMapping*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    edit_internal_client : Proc(IDynamicPortMapping*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    enable : Proc(IDynamicPortMapping*, Int16, Win32cr::Foundation::HRESULT),
    edit_description : Proc(IDynamicPortMapping*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    edit_internal_port : Proc(IDynamicPortMapping*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDynamicPortMapping, lpVtbl : IDynamicPortMappingVtbl* do
    GUID = LibC::GUID.new(0x4fc80282_u32, 0x23b6_u16, 0x4378_u16, StaticArray[0x9a_u8, 0x27_u8, 0xcd_u8, 0x8f_u8, 0x17_u8, 0xc9_u8, 0x40_u8, 0xc_u8])
    def query_interface(this : IDynamicPortMapping*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDynamicPortMapping*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDynamicPortMapping*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDynamicPortMapping*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDynamicPortMapping*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDynamicPortMapping*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDynamicPortMapping*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ExternalIPAddress(this : IDynamicPortMapping*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExternalIPAddress.call(this, pVal)
    end
    def get_RemoteHost(this : IDynamicPortMapping*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteHost.call(this, pVal)
    end
    def get_ExternalPort(this : IDynamicPortMapping*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExternalPort.call(this, pVal)
    end
    def get_Protocol(this : IDynamicPortMapping*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Protocol.call(this, pVal)
    end
    def get_InternalPort(this : IDynamicPortMapping*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InternalPort.call(this, pVal)
    end
    def get_InternalClient(this : IDynamicPortMapping*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InternalClient.call(this, pVal)
    end
    def get_Enabled(this : IDynamicPortMapping*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pVal)
    end
    def get_Description(this : IDynamicPortMapping*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pVal)
    end
    def get_LeaseDuration(this : IDynamicPortMapping*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LeaseDuration.call(this, pVal)
    end
    def renew_lease(this : IDynamicPortMapping*, lLeaseDurationDesired : Int32, pLeaseDurationReturned : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.renew_lease.call(this, lLeaseDurationDesired, pLeaseDurationReturned)
    end
    def edit_internal_client(this : IDynamicPortMapping*, bstrInternalClient : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.edit_internal_client.call(this, bstrInternalClient)
    end
    def enable(this : IDynamicPortMapping*, vb : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this, vb)
    end
    def edit_description(this : IDynamicPortMapping*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.edit_description.call(this, bstrDescription)
    end
    def edit_internal_port(this : IDynamicPortMapping*, lInternalPort : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.edit_internal_port.call(this, lInternalPort)
    end

  end

  @[Extern]
  record IStaticPortMappingCollectionVtbl,
    query_interface : Proc(IStaticPortMappingCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStaticPortMappingCollection*, UInt32),
    release : Proc(IStaticPortMappingCollection*, UInt32),
    get_type_info_count : Proc(IStaticPortMappingCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IStaticPortMappingCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IStaticPortMappingCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IStaticPortMappingCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IStaticPortMappingCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IStaticPortMappingCollection*, Int32, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IStaticPortMappingCollection*, Int32*, Win32cr::Foundation::HRESULT),
    remove : Proc(IStaticPortMappingCollection*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add : Proc(IStaticPortMappingCollection*, Int32, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IStaticPortMappingCollection, lpVtbl : IStaticPortMappingCollectionVtbl* do
    GUID = LibC::GUID.new(0xcd1f3e77_u32, 0x66d6_u16, 0x4664_u16, StaticArray[0x82_u8, 0xc7_u8, 0x36_u8, 0xdb_u8, 0xb6_u8, 0x41_u8, 0xd0_u8, 0xf1_u8])
    def query_interface(this : IStaticPortMappingCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStaticPortMappingCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStaticPortMappingCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IStaticPortMappingCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IStaticPortMappingCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IStaticPortMappingCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IStaticPortMappingCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IStaticPortMappingCollection*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end
    def get_Item(this : IStaticPortMappingCollection*, lExternalPort : Int32, bstrProtocol : Win32cr::Foundation::BSTR, ppSPM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lExternalPort, bstrProtocol, ppSPM)
    end
    def get_Count(this : IStaticPortMappingCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def remove(this : IStaticPortMappingCollection*, lExternalPort : Int32, bstrProtocol : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, lExternalPort, bstrProtocol)
    end
    def add(this : IStaticPortMappingCollection*, lExternalPort : Int32, bstrProtocol : Win32cr::Foundation::BSTR, lInternalPort : Int32, bstrInternalClient : Win32cr::Foundation::BSTR, bEnabled : Int16, bstrDescription : Win32cr::Foundation::BSTR, ppSPM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, lExternalPort, bstrProtocol, lInternalPort, bstrInternalClient, bEnabled, bstrDescription, ppSPM)
    end

  end

  @[Extern]
  record IStaticPortMappingVtbl,
    query_interface : Proc(IStaticPortMapping*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStaticPortMapping*, UInt32),
    release : Proc(IStaticPortMapping*, UInt32),
    get_type_info_count : Proc(IStaticPortMapping*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IStaticPortMapping*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IStaticPortMapping*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IStaticPortMapping*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ExternalIPAddress : Proc(IStaticPortMapping*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ExternalPort : Proc(IStaticPortMapping*, Int32*, Win32cr::Foundation::HRESULT),
    get_InternalPort : Proc(IStaticPortMapping*, Int32*, Win32cr::Foundation::HRESULT),
    get_Protocol : Proc(IStaticPortMapping*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_InternalClient : Proc(IStaticPortMapping*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IStaticPortMapping*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IStaticPortMapping*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    edit_internal_client : Proc(IStaticPortMapping*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    enable : Proc(IStaticPortMapping*, Int16, Win32cr::Foundation::HRESULT),
    edit_description : Proc(IStaticPortMapping*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    edit_internal_port : Proc(IStaticPortMapping*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IStaticPortMapping, lpVtbl : IStaticPortMappingVtbl* do
    GUID = LibC::GUID.new(0x6f10711f_u32, 0x729b_u16, 0x41e5_u16, StaticArray[0x93_u8, 0xb8_u8, 0xf2_u8, 0x1d_u8, 0xf_u8, 0x81_u8, 0x8d_u8, 0xf1_u8])
    def query_interface(this : IStaticPortMapping*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStaticPortMapping*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStaticPortMapping*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IStaticPortMapping*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IStaticPortMapping*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IStaticPortMapping*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IStaticPortMapping*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ExternalIPAddress(this : IStaticPortMapping*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExternalIPAddress.call(this, pVal)
    end
    def get_ExternalPort(this : IStaticPortMapping*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExternalPort.call(this, pVal)
    end
    def get_InternalPort(this : IStaticPortMapping*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InternalPort.call(this, pVal)
    end
    def get_Protocol(this : IStaticPortMapping*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Protocol.call(this, pVal)
    end
    def get_InternalClient(this : IStaticPortMapping*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InternalClient.call(this, pVal)
    end
    def get_Enabled(this : IStaticPortMapping*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pVal)
    end
    def get_Description(this : IStaticPortMapping*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pVal)
    end
    def edit_internal_client(this : IStaticPortMapping*, bstrInternalClient : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.edit_internal_client.call(this, bstrInternalClient)
    end
    def enable(this : IStaticPortMapping*, vb : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this, vb)
    end
    def edit_description(this : IStaticPortMapping*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.edit_description.call(this, bstrDescription)
    end
    def edit_internal_port(this : IStaticPortMapping*, lInternalPort : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.edit_internal_port.call(this, lInternalPort)
    end

  end

  @[Extern]
  record IEnumNetConnectionVtbl,
    query_interface : Proc(IEnumNetConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumNetConnection*, UInt32),
    release : Proc(IEnumNetConnection*, UInt32),
    next__ : Proc(IEnumNetConnection*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumNetConnection*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumNetConnection*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumNetConnection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumNetConnection, lpVtbl : IEnumNetConnectionVtbl* do
    GUID = LibC::GUID.new(0xc08956a0_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : IEnumNetConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumNetConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumNetConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumNetConnection*, celt : UInt32, rgelt : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumNetConnection*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumNetConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumNetConnection*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record INetConnectionVtbl,
    query_interface : Proc(INetConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetConnection*, UInt32),
    release : Proc(INetConnection*, UInt32),
    connect : Proc(INetConnection*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(INetConnection*, Win32cr::Foundation::HRESULT),
    delete : Proc(INetConnection*, Win32cr::Foundation::HRESULT),
    duplicate : Proc(INetConnection*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_properties : Proc(INetConnection*, Win32cr::NetworkManagement::WindowsFirewall::NETCON_PROPERTIES**, Win32cr::Foundation::HRESULT),
    get_ui_object_class_id : Proc(INetConnection*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    rename : Proc(INetConnection*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetConnection, lpVtbl : INetConnectionVtbl* do
    GUID = LibC::GUID.new(0xc08956a1_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : INetConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connect(this : INetConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this)
    end
    def disconnect(this : INetConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def delete(this : INetConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def duplicate(this : INetConnection*, pszwDuplicateName : Win32cr::Foundation::PWSTR, ppCon : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate.call(this, pszwDuplicateName, ppCon)
    end
    def get_properties(this : INetConnection*, ppProps : Win32cr::NetworkManagement::WindowsFirewall::NETCON_PROPERTIES**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, ppProps)
    end
    def get_ui_object_class_id(this : INetConnection*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ui_object_class_id.call(this, pclsid)
    end
    def rename(this : INetConnection*, pszwNewName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename.call(this, pszwNewName)
    end

  end

  @[Extern]
  record INetConnectionManagerVtbl,
    query_interface : Proc(INetConnectionManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetConnectionManager*, UInt32),
    release : Proc(INetConnectionManager*, UInt32),
    enum_connections : Proc(INetConnectionManager*, Win32cr::NetworkManagement::WindowsFirewall::NETCONMGR_ENUM_FLAGS, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetConnectionManager, lpVtbl : INetConnectionManagerVtbl* do
    GUID = LibC::GUID.new(0xc08956a2_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : INetConnectionManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetConnectionManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetConnectionManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_connections(this : INetConnectionManager*, flags : Win32cr::NetworkManagement::WindowsFirewall::NETCONMGR_ENUM_FLAGS, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_connections.call(this, flags, ppEnum)
    end

  end

  @[Extern]
  record INetConnectionConnectUiVtbl,
    query_interface : Proc(INetConnectionConnectUi*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetConnectionConnectUi*, UInt32),
    release : Proc(INetConnectionConnectUi*, UInt32),
    set_connection : Proc(INetConnectionConnectUi*, Void*, Win32cr::Foundation::HRESULT),
    connect : Proc(INetConnectionConnectUi*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    disconnect : Proc(INetConnectionConnectUi*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetConnectionConnectUi, lpVtbl : INetConnectionConnectUiVtbl* do
    GUID = LibC::GUID.new(0xc08956a3_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : INetConnectionConnectUi*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetConnectionConnectUi*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetConnectionConnectUi*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_connection(this : INetConnectionConnectUi*, pCon : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_connection.call(this, pCon)
    end
    def connect(this : INetConnectionConnectUi*, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, hwndParent, dwFlags)
    end
    def disconnect(this : INetConnectionConnectUi*, hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this, hwndParent, dwFlags)
    end

  end

  @[Extern]
  record IEnumNetSharingPortMappingVtbl,
    query_interface : Proc(IEnumNetSharingPortMapping*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumNetSharingPortMapping*, UInt32),
    release : Proc(IEnumNetSharingPortMapping*, UInt32),
    next__ : Proc(IEnumNetSharingPortMapping*, UInt32, Win32cr::System::Com::VARIANT*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumNetSharingPortMapping*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumNetSharingPortMapping*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumNetSharingPortMapping*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumNetSharingPortMapping, lpVtbl : IEnumNetSharingPortMappingVtbl* do
    GUID = LibC::GUID.new(0xc08956b0_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : IEnumNetSharingPortMapping*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumNetSharingPortMapping*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumNetSharingPortMapping*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumNetSharingPortMapping*, celt : UInt32, rgVar : Win32cr::System::Com::VARIANT*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgVar, pceltFetched)
    end
    def skip(this : IEnumNetSharingPortMapping*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumNetSharingPortMapping*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumNetSharingPortMapping*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record INetSharingPortMappingPropsVtbl,
    query_interface : Proc(INetSharingPortMappingProps*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetSharingPortMappingProps*, UInt32),
    release : Proc(INetSharingPortMappingProps*, UInt32),
    get_type_info_count : Proc(INetSharingPortMappingProps*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetSharingPortMappingProps*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetSharingPortMappingProps*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetSharingPortMappingProps*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(INetSharingPortMappingProps*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IPProtocol : Proc(INetSharingPortMappingProps*, UInt8*, Win32cr::Foundation::HRESULT),
    get_ExternalPort : Proc(INetSharingPortMappingProps*, Int32*, Win32cr::Foundation::HRESULT),
    get_InternalPort : Proc(INetSharingPortMappingProps*, Int32*, Win32cr::Foundation::HRESULT),
    get_Options : Proc(INetSharingPortMappingProps*, Int32*, Win32cr::Foundation::HRESULT),
    get_TargetName : Proc(INetSharingPortMappingProps*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TargetIPAddress : Proc(INetSharingPortMappingProps*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(INetSharingPortMappingProps*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetSharingPortMappingProps, lpVtbl : INetSharingPortMappingPropsVtbl* do
    GUID = LibC::GUID.new(0x24b7e9b5_u32, 0xe38f_u16, 0x4685_u16, StaticArray[0x85_u8, 0x1b_u8, 0x0_u8, 0x89_u8, 0x2c_u8, 0xf5_u8, 0xf9_u8, 0x40_u8])
    def query_interface(this : INetSharingPortMappingProps*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetSharingPortMappingProps*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetSharingPortMappingProps*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetSharingPortMappingProps*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetSharingPortMappingProps*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetSharingPortMappingProps*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetSharingPortMappingProps*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : INetSharingPortMappingProps*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_IPProtocol(this : INetSharingPortMappingProps*, pucIPProt : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IPProtocol.call(this, pucIPProt)
    end
    def get_ExternalPort(this : INetSharingPortMappingProps*, pusPort : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExternalPort.call(this, pusPort)
    end
    def get_InternalPort(this : INetSharingPortMappingProps*, pusPort : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InternalPort.call(this, pusPort)
    end
    def get_Options(this : INetSharingPortMappingProps*, pdwOptions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Options.call(this, pdwOptions)
    end
    def get_TargetName(this : INetSharingPortMappingProps*, pbstrTargetName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetName.call(this, pbstrTargetName)
    end
    def get_TargetIPAddress(this : INetSharingPortMappingProps*, pbstrTargetIPAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetIPAddress.call(this, pbstrTargetIPAddress)
    end
    def get_Enabled(this : INetSharingPortMappingProps*, pbool : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pbool)
    end

  end

  @[Extern]
  record INetSharingPortMappingVtbl,
    query_interface : Proc(INetSharingPortMapping*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetSharingPortMapping*, UInt32),
    release : Proc(INetSharingPortMapping*, UInt32),
    get_type_info_count : Proc(INetSharingPortMapping*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetSharingPortMapping*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetSharingPortMapping*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetSharingPortMapping*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    disable : Proc(INetSharingPortMapping*, Win32cr::Foundation::HRESULT),
    enable : Proc(INetSharingPortMapping*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(INetSharingPortMapping*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(INetSharingPortMapping*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetSharingPortMapping, lpVtbl : INetSharingPortMappingVtbl* do
    GUID = LibC::GUID.new(0xc08956b1_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : INetSharingPortMapping*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetSharingPortMapping*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetSharingPortMapping*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetSharingPortMapping*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetSharingPortMapping*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetSharingPortMapping*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetSharingPortMapping*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def disable(this : INetSharingPortMapping*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable.call(this)
    end
    def enable(this : INetSharingPortMapping*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this)
    end
    def get_Properties(this : INetSharingPortMapping*, ppNSPMP : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppNSPMP)
    end
    def delete(this : INetSharingPortMapping*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end

  end

  @[Extern]
  record IEnumNetSharingEveryConnectionVtbl,
    query_interface : Proc(IEnumNetSharingEveryConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumNetSharingEveryConnection*, UInt32),
    release : Proc(IEnumNetSharingEveryConnection*, UInt32),
    next__ : Proc(IEnumNetSharingEveryConnection*, UInt32, Win32cr::System::Com::VARIANT*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumNetSharingEveryConnection*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumNetSharingEveryConnection*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumNetSharingEveryConnection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumNetSharingEveryConnection, lpVtbl : IEnumNetSharingEveryConnectionVtbl* do
    GUID = LibC::GUID.new(0xc08956b8_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : IEnumNetSharingEveryConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumNetSharingEveryConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumNetSharingEveryConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumNetSharingEveryConnection*, celt : UInt32, rgVar : Win32cr::System::Com::VARIANT*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgVar, pceltFetched)
    end
    def skip(this : IEnumNetSharingEveryConnection*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumNetSharingEveryConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumNetSharingEveryConnection*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IEnumNetSharingPublicConnectionVtbl,
    query_interface : Proc(IEnumNetSharingPublicConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumNetSharingPublicConnection*, UInt32),
    release : Proc(IEnumNetSharingPublicConnection*, UInt32),
    next__ : Proc(IEnumNetSharingPublicConnection*, UInt32, Win32cr::System::Com::VARIANT*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumNetSharingPublicConnection*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumNetSharingPublicConnection*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumNetSharingPublicConnection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumNetSharingPublicConnection, lpVtbl : IEnumNetSharingPublicConnectionVtbl* do
    GUID = LibC::GUID.new(0xc08956b4_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : IEnumNetSharingPublicConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumNetSharingPublicConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumNetSharingPublicConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumNetSharingPublicConnection*, celt : UInt32, rgVar : Win32cr::System::Com::VARIANT*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgVar, pceltFetched)
    end
    def skip(this : IEnumNetSharingPublicConnection*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumNetSharingPublicConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumNetSharingPublicConnection*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record IEnumNetSharingPrivateConnectionVtbl,
    query_interface : Proc(IEnumNetSharingPrivateConnection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumNetSharingPrivateConnection*, UInt32),
    release : Proc(IEnumNetSharingPrivateConnection*, UInt32),
    next__ : Proc(IEnumNetSharingPrivateConnection*, UInt32, Win32cr::System::Com::VARIANT*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumNetSharingPrivateConnection*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumNetSharingPrivateConnection*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumNetSharingPrivateConnection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumNetSharingPrivateConnection, lpVtbl : IEnumNetSharingPrivateConnectionVtbl* do
    GUID = LibC::GUID.new(0xc08956b5_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : IEnumNetSharingPrivateConnection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumNetSharingPrivateConnection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumNetSharingPrivateConnection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumNetSharingPrivateConnection*, celt : UInt32, rgVar : Win32cr::System::Com::VARIANT*, pCeltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgVar, pCeltFetched)
    end
    def skip(this : IEnumNetSharingPrivateConnection*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumNetSharingPrivateConnection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumNetSharingPrivateConnection*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record INetSharingPortMappingCollectionVtbl,
    query_interface : Proc(INetSharingPortMappingCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetSharingPortMappingCollection*, UInt32),
    release : Proc(INetSharingPortMappingCollection*, UInt32),
    get_type_info_count : Proc(INetSharingPortMappingCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetSharingPortMappingCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetSharingPortMappingCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetSharingPortMappingCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(INetSharingPortMappingCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(INetSharingPortMappingCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetSharingPortMappingCollection, lpVtbl : INetSharingPortMappingCollectionVtbl* do
    GUID = LibC::GUID.new(0x2e4a2de_u32, 0xda20_u16, 0x4e34_u16, StaticArray[0x89_u8, 0xc8_u8, 0xac_u8, 0x22_u8, 0x27_u8, 0x5a_u8, 0x1_u8, 0xb_u8])
    def query_interface(this : INetSharingPortMappingCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetSharingPortMappingCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetSharingPortMappingCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetSharingPortMappingCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetSharingPortMappingCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetSharingPortMappingCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetSharingPortMappingCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : INetSharingPortMappingCollection*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end
    def get_Count(this : INetSharingPortMappingCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end

  end

  @[Extern]
  record INetConnectionPropsVtbl,
    query_interface : Proc(INetConnectionProps*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetConnectionProps*, UInt32),
    release : Proc(INetConnectionProps*, UInt32),
    get_type_info_count : Proc(INetConnectionProps*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetConnectionProps*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetConnectionProps*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetConnectionProps*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Guid : Proc(INetConnectionProps*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(INetConnectionProps*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DeviceName : Proc(INetConnectionProps*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(INetConnectionProps*, Win32cr::NetworkManagement::WindowsFirewall::NETCON_STATUS*, Win32cr::Foundation::HRESULT),
    get_MediaType : Proc(INetConnectionProps*, Win32cr::NetworkManagement::WindowsFirewall::NETCON_MEDIATYPE*, Win32cr::Foundation::HRESULT),
    get_Characteristics : Proc(INetConnectionProps*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetConnectionProps, lpVtbl : INetConnectionPropsVtbl* do
    GUID = LibC::GUID.new(0xf4277c95_u32, 0xce5b_u16, 0x463d_u16, StaticArray[0x81_u8, 0x67_u8, 0x56_u8, 0x62_u8, 0xd9_u8, 0xbc_u8, 0xaa_u8, 0x72_u8])
    def query_interface(this : INetConnectionProps*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetConnectionProps*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetConnectionProps*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetConnectionProps*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetConnectionProps*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetConnectionProps*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetConnectionProps*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Guid(this : INetConnectionProps*, pbstrGuid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Guid.call(this, pbstrGuid)
    end
    def get_Name(this : INetConnectionProps*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_DeviceName(this : INetConnectionProps*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceName.call(this, pbstrDeviceName)
    end
    def get_Status(this : INetConnectionProps*, pStatus : Win32cr::NetworkManagement::WindowsFirewall::NETCON_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_MediaType(this : INetConnectionProps*, pMediaType : Win32cr::NetworkManagement::WindowsFirewall::NETCON_MEDIATYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MediaType.call(this, pMediaType)
    end
    def get_Characteristics(this : INetConnectionProps*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Characteristics.call(this, pdwFlags)
    end

  end

  @[Extern]
  record INetSharingConfigurationVtbl,
    query_interface : Proc(INetSharingConfiguration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetSharingConfiguration*, UInt32),
    release : Proc(INetSharingConfiguration*, UInt32),
    get_type_info_count : Proc(INetSharingConfiguration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetSharingConfiguration*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetSharingConfiguration*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetSharingConfiguration*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SharingEnabled : Proc(INetSharingConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    get_SharingConnectionType : Proc(INetSharingConfiguration*, Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTIONTYPE*, Win32cr::Foundation::HRESULT),
    disable_sharing : Proc(INetSharingConfiguration*, Win32cr::Foundation::HRESULT),
    enable_sharing : Proc(INetSharingConfiguration*, Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTIONTYPE, Win32cr::Foundation::HRESULT),
    get_InternetFirewallEnabled : Proc(INetSharingConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    disable_internet_firewall : Proc(INetSharingConfiguration*, Win32cr::Foundation::HRESULT),
    enable_internet_firewall : Proc(INetSharingConfiguration*, Win32cr::Foundation::HRESULT),
    get_EnumPortMappings : Proc(INetSharingConfiguration*, Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTION_ENUM_FLAGS, Void**, Win32cr::Foundation::HRESULT),
    add_port_mapping : Proc(INetSharingConfiguration*, Win32cr::Foundation::BSTR, UInt8, UInt16, UInt16, UInt32, Win32cr::Foundation::BSTR, Win32cr::NetworkManagement::WindowsFirewall::ICS_TARGETTYPE, Void**, Win32cr::Foundation::HRESULT),
    remove_port_mapping : Proc(INetSharingConfiguration*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetSharingConfiguration, lpVtbl : INetSharingConfigurationVtbl* do
    GUID = LibC::GUID.new(0xc08956b6_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : INetSharingConfiguration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetSharingConfiguration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetSharingConfiguration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetSharingConfiguration*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetSharingConfiguration*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetSharingConfiguration*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetSharingConfiguration*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_SharingEnabled(this : INetSharingConfiguration*, pbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SharingEnabled.call(this, pbEnabled)
    end
    def get_SharingConnectionType(this : INetSharingConfiguration*, pType : Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTIONTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SharingConnectionType.call(this, pType)
    end
    def disable_sharing(this : INetSharingConfiguration*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_sharing.call(this)
    end
    def enable_sharing(this : INetSharingConfiguration*, type__ : Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTIONTYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_sharing.call(this, type__)
    end
    def get_InternetFirewallEnabled(this : INetSharingConfiguration*, pbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InternetFirewallEnabled.call(this, pbEnabled)
    end
    def disable_internet_firewall(this : INetSharingConfiguration*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_internet_firewall.call(this)
    end
    def enable_internet_firewall(this : INetSharingConfiguration*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_internet_firewall.call(this)
    end
    def get_EnumPortMappings(this : INetSharingConfiguration*, flags : Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTION_ENUM_FLAGS, ppColl : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnumPortMappings.call(this, flags, ppColl)
    end
    def add_port_mapping(this : INetSharingConfiguration*, bstrName : Win32cr::Foundation::BSTR, ucIPProtocol : UInt8, usExternalPort : UInt16, usInternalPort : UInt16, dwOptions : UInt32, bstrTargetNameOrIPAddress : Win32cr::Foundation::BSTR, eTargetType : Win32cr::NetworkManagement::WindowsFirewall::ICS_TARGETTYPE, ppMapping : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_port_mapping.call(this, bstrName, ucIPProtocol, usExternalPort, usInternalPort, dwOptions, bstrTargetNameOrIPAddress, eTargetType, ppMapping)
    end
    def remove_port_mapping(this : INetSharingConfiguration*, pMapping : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_port_mapping.call(this, pMapping)
    end

  end

  @[Extern]
  record INetSharingEveryConnectionCollectionVtbl,
    query_interface : Proc(INetSharingEveryConnectionCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetSharingEveryConnectionCollection*, UInt32),
    release : Proc(INetSharingEveryConnectionCollection*, UInt32),
    get_type_info_count : Proc(INetSharingEveryConnectionCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetSharingEveryConnectionCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetSharingEveryConnectionCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetSharingEveryConnectionCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(INetSharingEveryConnectionCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(INetSharingEveryConnectionCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetSharingEveryConnectionCollection, lpVtbl : INetSharingEveryConnectionCollectionVtbl* do
    GUID = LibC::GUID.new(0x33c4643c_u32, 0x7811_u16, 0x46fa_u16, StaticArray[0xa8_u8, 0x9a_u8, 0x76_u8, 0x85_u8, 0x97_u8, 0xbd_u8, 0x72_u8, 0x23_u8])
    def query_interface(this : INetSharingEveryConnectionCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetSharingEveryConnectionCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetSharingEveryConnectionCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetSharingEveryConnectionCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetSharingEveryConnectionCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetSharingEveryConnectionCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetSharingEveryConnectionCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : INetSharingEveryConnectionCollection*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end
    def get_Count(this : INetSharingEveryConnectionCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end

  end

  @[Extern]
  record INetSharingPublicConnectionCollectionVtbl,
    query_interface : Proc(INetSharingPublicConnectionCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetSharingPublicConnectionCollection*, UInt32),
    release : Proc(INetSharingPublicConnectionCollection*, UInt32),
    get_type_info_count : Proc(INetSharingPublicConnectionCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetSharingPublicConnectionCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetSharingPublicConnectionCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetSharingPublicConnectionCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(INetSharingPublicConnectionCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(INetSharingPublicConnectionCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetSharingPublicConnectionCollection, lpVtbl : INetSharingPublicConnectionCollectionVtbl* do
    GUID = LibC::GUID.new(0x7d7a6355_u32, 0xf372_u16, 0x4971_u16, StaticArray[0xa1_u8, 0x49_u8, 0xbf_u8, 0xc9_u8, 0x27_u8, 0xbe_u8, 0x76_u8, 0x2a_u8])
    def query_interface(this : INetSharingPublicConnectionCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetSharingPublicConnectionCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetSharingPublicConnectionCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetSharingPublicConnectionCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetSharingPublicConnectionCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetSharingPublicConnectionCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetSharingPublicConnectionCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : INetSharingPublicConnectionCollection*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end
    def get_Count(this : INetSharingPublicConnectionCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end

  end

  @[Extern]
  record INetSharingPrivateConnectionCollectionVtbl,
    query_interface : Proc(INetSharingPrivateConnectionCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetSharingPrivateConnectionCollection*, UInt32),
    release : Proc(INetSharingPrivateConnectionCollection*, UInt32),
    get_type_info_count : Proc(INetSharingPrivateConnectionCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetSharingPrivateConnectionCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetSharingPrivateConnectionCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetSharingPrivateConnectionCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(INetSharingPrivateConnectionCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(INetSharingPrivateConnectionCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetSharingPrivateConnectionCollection, lpVtbl : INetSharingPrivateConnectionCollectionVtbl* do
    GUID = LibC::GUID.new(0x38ae69e0_u32, 0x4409_u16, 0x402a_u16, StaticArray[0xa2_u8, 0xcb_u8, 0xe9_u8, 0x65_u8, 0xc7_u8, 0x27_u8, 0xf8_u8, 0x40_u8])
    def query_interface(this : INetSharingPrivateConnectionCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetSharingPrivateConnectionCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetSharingPrivateConnectionCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetSharingPrivateConnectionCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetSharingPrivateConnectionCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetSharingPrivateConnectionCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetSharingPrivateConnectionCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : INetSharingPrivateConnectionCollection*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end
    def get_Count(this : INetSharingPrivateConnectionCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end

  end

  @[Extern]
  record INetSharingManagerVtbl,
    query_interface : Proc(INetSharingManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetSharingManager*, UInt32),
    release : Proc(INetSharingManager*, UInt32),
    get_type_info_count : Proc(INetSharingManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetSharingManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetSharingManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetSharingManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SharingInstalled : Proc(INetSharingManager*, Int16*, Win32cr::Foundation::HRESULT),
    get_EnumPublicConnections : Proc(INetSharingManager*, Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTION_ENUM_FLAGS, Void**, Win32cr::Foundation::HRESULT),
    get_EnumPrivateConnections : Proc(INetSharingManager*, Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTION_ENUM_FLAGS, Void**, Win32cr::Foundation::HRESULT),
    get_INetSharingConfigurationForINetConnection : Proc(INetSharingManager*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_EnumEveryConnection : Proc(INetSharingManager*, Void**, Win32cr::Foundation::HRESULT),
    get_NetConnectionProps : Proc(INetSharingManager*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetSharingManager, lpVtbl : INetSharingManagerVtbl* do
    GUID = LibC::GUID.new(0xc08956b7_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
    def query_interface(this : INetSharingManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetSharingManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetSharingManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetSharingManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetSharingManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetSharingManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetSharingManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_SharingInstalled(this : INetSharingManager*, pbInstalled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SharingInstalled.call(this, pbInstalled)
    end
    def get_EnumPublicConnections(this : INetSharingManager*, flags : Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTION_ENUM_FLAGS, ppColl : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnumPublicConnections.call(this, flags, ppColl)
    end
    def get_EnumPrivateConnections(this : INetSharingManager*, flags : Win32cr::NetworkManagement::WindowsFirewall::SHARINGCONNECTION_ENUM_FLAGS, ppColl : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnumPrivateConnections.call(this, flags, ppColl)
    end
    def get_INetSharingConfigurationForINetConnection(this : INetSharingManager*, pNetConnection : Void*, ppNetSharingConfiguration : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_INetSharingConfigurationForINetConnection.call(this, pNetConnection, ppNetSharingConfiguration)
    end
    def get_EnumEveryConnection(this : INetSharingManager*, ppColl : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnumEveryConnection.call(this, ppColl)
    end
    def get_NetConnectionProps(this : INetSharingManager*, pNetConnection : Void*, ppProps : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetConnectionProps.call(this, pNetConnection, ppProps)
    end

  end

  @[Extern]
  record INetFwRemoteAdminSettingsVtbl,
    query_interface : Proc(INetFwRemoteAdminSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwRemoteAdminSettings*, UInt32),
    release : Proc(INetFwRemoteAdminSettings*, UInt32),
    get_type_info_count : Proc(INetFwRemoteAdminSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwRemoteAdminSettings*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwRemoteAdminSettings*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwRemoteAdminSettings*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_IpVersion : Proc(INetFwRemoteAdminSettings*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION*, Win32cr::Foundation::HRESULT),
    put_IpVersion : Proc(INetFwRemoteAdminSettings*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION, Win32cr::Foundation::HRESULT),
    get_Scope : Proc(INetFwRemoteAdminSettings*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE*, Win32cr::Foundation::HRESULT),
    put_Scope : Proc(INetFwRemoteAdminSettings*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE, Win32cr::Foundation::HRESULT),
    get_RemoteAddresses : Proc(INetFwRemoteAdminSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemoteAddresses : Proc(INetFwRemoteAdminSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(INetFwRemoteAdminSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(INetFwRemoteAdminSettings*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwRemoteAdminSettings, lpVtbl : INetFwRemoteAdminSettingsVtbl* do
    GUID = LibC::GUID.new(0xd4becddf_u32, 0x6f73_u16, 0x4a83_u16, StaticArray[0xb8_u8, 0x32_u8, 0x9c_u8, 0x66_u8, 0x87_u8, 0x4c_u8, 0xd2_u8, 0xe_u8])
    def query_interface(this : INetFwRemoteAdminSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwRemoteAdminSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwRemoteAdminSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwRemoteAdminSettings*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwRemoteAdminSettings*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwRemoteAdminSettings*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwRemoteAdminSettings*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_IpVersion(this : INetFwRemoteAdminSettings*, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IpVersion.call(this, ipVersion)
    end
    def put_IpVersion(this : INetFwRemoteAdminSettings*, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IpVersion.call(this, ipVersion)
    end
    def get_Scope(this : INetFwRemoteAdminSettings*, scope : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Scope.call(this, scope)
    end
    def put_Scope(this : INetFwRemoteAdminSettings*, scope : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Scope.call(this, scope)
    end
    def get_RemoteAddresses(this : INetFwRemoteAdminSettings*, remoteAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteAddresses.call(this, remoteAddrs)
    end
    def put_RemoteAddresses(this : INetFwRemoteAdminSettings*, remoteAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteAddresses.call(this, remoteAddrs)
    end
    def get_Enabled(this : INetFwRemoteAdminSettings*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : INetFwRemoteAdminSettings*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end

  end

  @[Extern]
  record INetFwIcmpSettingsVtbl,
    query_interface : Proc(INetFwIcmpSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwIcmpSettings*, UInt32),
    release : Proc(INetFwIcmpSettings*, UInt32),
    get_type_info_count : Proc(INetFwIcmpSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwIcmpSettings*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwIcmpSettings*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwIcmpSettings*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AllowOutboundDestinationUnreachable : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowOutboundDestinationUnreachable : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowRedirect : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowRedirect : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowInboundEchoRequest : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowInboundEchoRequest : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowOutboundTimeExceeded : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowOutboundTimeExceeded : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowOutboundParameterProblem : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowOutboundParameterProblem : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowOutboundSourceQuench : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowOutboundSourceQuench : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowInboundRouterRequest : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowInboundRouterRequest : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowInboundTimestampRequest : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowInboundTimestampRequest : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowInboundMaskRequest : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowInboundMaskRequest : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowOutboundPacketTooBig : Proc(INetFwIcmpSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowOutboundPacketTooBig : Proc(INetFwIcmpSettings*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwIcmpSettings, lpVtbl : INetFwIcmpSettingsVtbl* do
    GUID = LibC::GUID.new(0xa6207b2e_u32, 0x7cdd_u16, 0x426a_u16, StaticArray[0x95_u8, 0x1e_u8, 0x5e_u8, 0x1c_u8, 0xbc_u8, 0x5a_u8, 0xfe_u8, 0xad_u8])
    def query_interface(this : INetFwIcmpSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwIcmpSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwIcmpSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwIcmpSettings*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwIcmpSettings*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwIcmpSettings*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwIcmpSettings*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AllowOutboundDestinationUnreachable(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowOutboundDestinationUnreachable.call(this, allow)
    end
    def put_AllowOutboundDestinationUnreachable(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowOutboundDestinationUnreachable.call(this, allow)
    end
    def get_AllowRedirect(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowRedirect.call(this, allow)
    end
    def put_AllowRedirect(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowRedirect.call(this, allow)
    end
    def get_AllowInboundEchoRequest(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowInboundEchoRequest.call(this, allow)
    end
    def put_AllowInboundEchoRequest(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowInboundEchoRequest.call(this, allow)
    end
    def get_AllowOutboundTimeExceeded(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowOutboundTimeExceeded.call(this, allow)
    end
    def put_AllowOutboundTimeExceeded(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowOutboundTimeExceeded.call(this, allow)
    end
    def get_AllowOutboundParameterProblem(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowOutboundParameterProblem.call(this, allow)
    end
    def put_AllowOutboundParameterProblem(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowOutboundParameterProblem.call(this, allow)
    end
    def get_AllowOutboundSourceQuench(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowOutboundSourceQuench.call(this, allow)
    end
    def put_AllowOutboundSourceQuench(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowOutboundSourceQuench.call(this, allow)
    end
    def get_AllowInboundRouterRequest(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowInboundRouterRequest.call(this, allow)
    end
    def put_AllowInboundRouterRequest(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowInboundRouterRequest.call(this, allow)
    end
    def get_AllowInboundTimestampRequest(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowInboundTimestampRequest.call(this, allow)
    end
    def put_AllowInboundTimestampRequest(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowInboundTimestampRequest.call(this, allow)
    end
    def get_AllowInboundMaskRequest(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowInboundMaskRequest.call(this, allow)
    end
    def put_AllowInboundMaskRequest(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowInboundMaskRequest.call(this, allow)
    end
    def get_AllowOutboundPacketTooBig(this : INetFwIcmpSettings*, allow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowOutboundPacketTooBig.call(this, allow)
    end
    def put_AllowOutboundPacketTooBig(this : INetFwIcmpSettings*, allow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowOutboundPacketTooBig.call(this, allow)
    end

  end

  @[Extern]
  record INetFwOpenPortVtbl,
    query_interface : Proc(INetFwOpenPort*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwOpenPort*, UInt32),
    release : Proc(INetFwOpenPort*, UInt32),
    get_type_info_count : Proc(INetFwOpenPort*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwOpenPort*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwOpenPort*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwOpenPort*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(INetFwOpenPort*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(INetFwOpenPort*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IpVersion : Proc(INetFwOpenPort*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION*, Win32cr::Foundation::HRESULT),
    put_IpVersion : Proc(INetFwOpenPort*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION, Win32cr::Foundation::HRESULT),
    get_Protocol : Proc(INetFwOpenPort*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL*, Win32cr::Foundation::HRESULT),
    put_Protocol : Proc(INetFwOpenPort*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL, Win32cr::Foundation::HRESULT),
    get_Port : Proc(INetFwOpenPort*, Int32*, Win32cr::Foundation::HRESULT),
    put_Port : Proc(INetFwOpenPort*, Int32, Win32cr::Foundation::HRESULT),
    get_Scope : Proc(INetFwOpenPort*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE*, Win32cr::Foundation::HRESULT),
    put_Scope : Proc(INetFwOpenPort*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE, Win32cr::Foundation::HRESULT),
    get_RemoteAddresses : Proc(INetFwOpenPort*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemoteAddresses : Proc(INetFwOpenPort*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(INetFwOpenPort*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(INetFwOpenPort*, Int16, Win32cr::Foundation::HRESULT),
    get_BuiltIn : Proc(INetFwOpenPort*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwOpenPort, lpVtbl : INetFwOpenPortVtbl* do
    GUID = LibC::GUID.new(0xe0483ba0_u32, 0x47ff_u16, 0x4d9c_u16, StaticArray[0xa6_u8, 0xd6_u8, 0x77_u8, 0x41_u8, 0xd0_u8, 0xb1_u8, 0x95_u8, 0xf7_u8])
    def query_interface(this : INetFwOpenPort*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwOpenPort*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwOpenPort*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwOpenPort*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwOpenPort*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwOpenPort*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwOpenPort*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : INetFwOpenPort*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : INetFwOpenPort*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_IpVersion(this : INetFwOpenPort*, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IpVersion.call(this, ipVersion)
    end
    def put_IpVersion(this : INetFwOpenPort*, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IpVersion.call(this, ipVersion)
    end
    def get_Protocol(this : INetFwOpenPort*, ipProtocol : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Protocol.call(this, ipProtocol)
    end
    def put_Protocol(this : INetFwOpenPort*, ipProtocol : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Protocol.call(this, ipProtocol)
    end
    def get_Port(this : INetFwOpenPort*, portNumber : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Port.call(this, portNumber)
    end
    def put_Port(this : INetFwOpenPort*, portNumber : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Port.call(this, portNumber)
    end
    def get_Scope(this : INetFwOpenPort*, scope : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Scope.call(this, scope)
    end
    def put_Scope(this : INetFwOpenPort*, scope : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Scope.call(this, scope)
    end
    def get_RemoteAddresses(this : INetFwOpenPort*, remoteAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteAddresses.call(this, remoteAddrs)
    end
    def put_RemoteAddresses(this : INetFwOpenPort*, remoteAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteAddresses.call(this, remoteAddrs)
    end
    def get_Enabled(this : INetFwOpenPort*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : INetFwOpenPort*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_BuiltIn(this : INetFwOpenPort*, builtIn : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BuiltIn.call(this, builtIn)
    end

  end

  @[Extern]
  record INetFwOpenPortsVtbl,
    query_interface : Proc(INetFwOpenPorts*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwOpenPorts*, UInt32),
    release : Proc(INetFwOpenPorts*, UInt32),
    get_type_info_count : Proc(INetFwOpenPorts*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwOpenPorts*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwOpenPorts*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwOpenPorts*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(INetFwOpenPorts*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(INetFwOpenPorts*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(INetFwOpenPorts*, Int32, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL, Win32cr::Foundation::HRESULT),
    item : Proc(INetFwOpenPorts*, Int32, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(INetFwOpenPorts*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwOpenPorts, lpVtbl : INetFwOpenPortsVtbl* do
    GUID = LibC::GUID.new(0xc0e9d7fa_u32, 0xe07e_u16, 0x430a_u16, StaticArray[0xb1_u8, 0x9a_u8, 0x9_u8, 0xc_u8, 0xe8_u8, 0x2d_u8, 0x92_u8, 0xe2_u8])
    def query_interface(this : INetFwOpenPorts*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwOpenPorts*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwOpenPorts*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwOpenPorts*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwOpenPorts*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwOpenPorts*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwOpenPorts*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : INetFwOpenPorts*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def add(this : INetFwOpenPorts*, port : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, port)
    end
    def remove(this : INetFwOpenPorts*, portNumber : Int32, ipProtocol : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, portNumber, ipProtocol)
    end
    def item(this : INetFwOpenPorts*, portNumber : Int32, ipProtocol : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL, openPort : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, portNumber, ipProtocol, openPort)
    end
    def get__NewEnum(this : INetFwOpenPorts*, newEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, newEnum)
    end

  end

  @[Extern]
  record INetFwServiceVtbl,
    query_interface : Proc(INetFwService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwService*, UInt32),
    release : Proc(INetFwService*, UInt32),
    get_type_info_count : Proc(INetFwService*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwService*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwService*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwService*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(INetFwService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(INetFwService*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SERVICE_TYPE*, Win32cr::Foundation::HRESULT),
    get_Customized : Proc(INetFwService*, Int16*, Win32cr::Foundation::HRESULT),
    get_IpVersion : Proc(INetFwService*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION*, Win32cr::Foundation::HRESULT),
    put_IpVersion : Proc(INetFwService*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION, Win32cr::Foundation::HRESULT),
    get_Scope : Proc(INetFwService*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE*, Win32cr::Foundation::HRESULT),
    put_Scope : Proc(INetFwService*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE, Win32cr::Foundation::HRESULT),
    get_RemoteAddresses : Proc(INetFwService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemoteAddresses : Proc(INetFwService*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(INetFwService*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(INetFwService*, Int16, Win32cr::Foundation::HRESULT),
    get_GloballyOpenPorts : Proc(INetFwService*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwService, lpVtbl : INetFwServiceVtbl* do
    GUID = LibC::GUID.new(0x79fd57c8_u32, 0x908e_u16, 0x4a36_u16, StaticArray[0x98_u8, 0x88_u8, 0xd5_u8, 0xb3_u8, 0xf0_u8, 0xa4_u8, 0x44_u8, 0xcf_u8])
    def query_interface(this : INetFwService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwService*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwService*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwService*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwService*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : INetFwService*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Type(this : INetFwService*, type__ : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SERVICE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, type__)
    end
    def get_Customized(this : INetFwService*, customized : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Customized.call(this, customized)
    end
    def get_IpVersion(this : INetFwService*, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IpVersion.call(this, ipVersion)
    end
    def put_IpVersion(this : INetFwService*, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IpVersion.call(this, ipVersion)
    end
    def get_Scope(this : INetFwService*, scope : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Scope.call(this, scope)
    end
    def put_Scope(this : INetFwService*, scope : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Scope.call(this, scope)
    end
    def get_RemoteAddresses(this : INetFwService*, remoteAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteAddresses.call(this, remoteAddrs)
    end
    def put_RemoteAddresses(this : INetFwService*, remoteAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteAddresses.call(this, remoteAddrs)
    end
    def get_Enabled(this : INetFwService*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : INetFwService*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_GloballyOpenPorts(this : INetFwService*, openPorts : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GloballyOpenPorts.call(this, openPorts)
    end

  end

  @[Extern]
  record INetFwServicesVtbl,
    query_interface : Proc(INetFwServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwServices*, UInt32),
    release : Proc(INetFwServices*, UInt32),
    get_type_info_count : Proc(INetFwServices*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwServices*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwServices*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwServices*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(INetFwServices*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(INetFwServices*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SERVICE_TYPE, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(INetFwServices*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwServices, lpVtbl : INetFwServicesVtbl* do
    GUID = LibC::GUID.new(0x79649bb4_u32, 0x903e_u16, 0x421b_u16, StaticArray[0x94_u8, 0xc9_u8, 0x79_u8, 0x84_u8, 0x8e_u8, 0x79_u8, 0xf6_u8, 0xee_u8])
    def query_interface(this : INetFwServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwServices*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwServices*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwServices*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwServices*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : INetFwServices*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def item(this : INetFwServices*, svcType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SERVICE_TYPE, service : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, svcType, service)
    end
    def get__NewEnum(this : INetFwServices*, newEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, newEnum)
    end

  end

  @[Extern]
  record INetFwAuthorizedApplicationVtbl,
    query_interface : Proc(INetFwAuthorizedApplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwAuthorizedApplication*, UInt32),
    release : Proc(INetFwAuthorizedApplication*, UInt32),
    get_type_info_count : Proc(INetFwAuthorizedApplication*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwAuthorizedApplication*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwAuthorizedApplication*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwAuthorizedApplication*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(INetFwAuthorizedApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(INetFwAuthorizedApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ProcessImageFileName : Proc(INetFwAuthorizedApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ProcessImageFileName : Proc(INetFwAuthorizedApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IpVersion : Proc(INetFwAuthorizedApplication*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION*, Win32cr::Foundation::HRESULT),
    put_IpVersion : Proc(INetFwAuthorizedApplication*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION, Win32cr::Foundation::HRESULT),
    get_Scope : Proc(INetFwAuthorizedApplication*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE*, Win32cr::Foundation::HRESULT),
    put_Scope : Proc(INetFwAuthorizedApplication*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE, Win32cr::Foundation::HRESULT),
    get_RemoteAddresses : Proc(INetFwAuthorizedApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemoteAddresses : Proc(INetFwAuthorizedApplication*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(INetFwAuthorizedApplication*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(INetFwAuthorizedApplication*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwAuthorizedApplication, lpVtbl : INetFwAuthorizedApplicationVtbl* do
    GUID = LibC::GUID.new(0xb5e64ffa_u32, 0xc2c5_u16, 0x444e_u16, StaticArray[0xa3_u8, 0x1_u8, 0xfb_u8, 0x5e_u8, 0x0_u8, 0x1_u8, 0x80_u8, 0x50_u8])
    def query_interface(this : INetFwAuthorizedApplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwAuthorizedApplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwAuthorizedApplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwAuthorizedApplication*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwAuthorizedApplication*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwAuthorizedApplication*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwAuthorizedApplication*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : INetFwAuthorizedApplication*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : INetFwAuthorizedApplication*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_ProcessImageFileName(this : INetFwAuthorizedApplication*, imageFileName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProcessImageFileName.call(this, imageFileName)
    end
    def put_ProcessImageFileName(this : INetFwAuthorizedApplication*, imageFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ProcessImageFileName.call(this, imageFileName)
    end
    def get_IpVersion(this : INetFwAuthorizedApplication*, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IpVersion.call(this, ipVersion)
    end
    def put_IpVersion(this : INetFwAuthorizedApplication*, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IpVersion.call(this, ipVersion)
    end
    def get_Scope(this : INetFwAuthorizedApplication*, scope : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Scope.call(this, scope)
    end
    def put_Scope(this : INetFwAuthorizedApplication*, scope : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_SCOPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Scope.call(this, scope)
    end
    def get_RemoteAddresses(this : INetFwAuthorizedApplication*, remoteAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteAddresses.call(this, remoteAddrs)
    end
    def put_RemoteAddresses(this : INetFwAuthorizedApplication*, remoteAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteAddresses.call(this, remoteAddrs)
    end
    def get_Enabled(this : INetFwAuthorizedApplication*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : INetFwAuthorizedApplication*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end

  end

  @[Extern]
  record INetFwAuthorizedApplicationsVtbl,
    query_interface : Proc(INetFwAuthorizedApplications*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwAuthorizedApplications*, UInt32),
    release : Proc(INetFwAuthorizedApplications*, UInt32),
    get_type_info_count : Proc(INetFwAuthorizedApplications*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwAuthorizedApplications*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwAuthorizedApplications*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwAuthorizedApplications*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(INetFwAuthorizedApplications*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(INetFwAuthorizedApplications*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(INetFwAuthorizedApplications*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    item : Proc(INetFwAuthorizedApplications*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(INetFwAuthorizedApplications*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwAuthorizedApplications, lpVtbl : INetFwAuthorizedApplicationsVtbl* do
    GUID = LibC::GUID.new(0x644efd52_u32, 0xccf9_u16, 0x486c_u16, StaticArray[0x97_u8, 0xa2_u8, 0x39_u8, 0xf3_u8, 0x52_u8, 0x57_u8, 0xb_u8, 0x30_u8])
    def query_interface(this : INetFwAuthorizedApplications*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwAuthorizedApplications*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwAuthorizedApplications*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwAuthorizedApplications*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwAuthorizedApplications*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwAuthorizedApplications*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwAuthorizedApplications*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : INetFwAuthorizedApplications*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def add(this : INetFwAuthorizedApplications*, app : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, app)
    end
    def remove(this : INetFwAuthorizedApplications*, imageFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, imageFileName)
    end
    def item(this : INetFwAuthorizedApplications*, imageFileName : Win32cr::Foundation::BSTR, app : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, imageFileName, app)
    end
    def get__NewEnum(this : INetFwAuthorizedApplications*, newEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, newEnum)
    end

  end

  @[Extern]
  record INetFwRuleVtbl,
    query_interface : Proc(INetFwRule*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwRule*, UInt32),
    release : Proc(INetFwRule*, UInt32),
    get_type_info_count : Proc(INetFwRule*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwRule*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwRule*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwRule*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationName : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationName : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ServiceName : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceName : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Protocol : Proc(INetFwRule*, Int32*, Win32cr::Foundation::HRESULT),
    put_Protocol : Proc(INetFwRule*, Int32, Win32cr::Foundation::HRESULT),
    get_LocalPorts : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalPorts : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RemotePorts : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemotePorts : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LocalAddresses : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalAddresses : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RemoteAddresses : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemoteAddresses : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IcmpTypesAndCodes : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_IcmpTypesAndCodes : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Direction : Proc(INetFwRule*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION*, Win32cr::Foundation::HRESULT),
    put_Direction : Proc(INetFwRule*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION, Win32cr::Foundation::HRESULT),
    get_Interfaces : Proc(INetFwRule*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Interfaces : Proc(INetFwRule*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_InterfaceTypes : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_InterfaceTypes : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(INetFwRule*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(INetFwRule*, Int16, Win32cr::Foundation::HRESULT),
    get_Grouping : Proc(INetFwRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Grouping : Proc(INetFwRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Profiles : Proc(INetFwRule*, Int32*, Win32cr::Foundation::HRESULT),
    put_Profiles : Proc(INetFwRule*, Int32, Win32cr::Foundation::HRESULT),
    get_EdgeTraversal : Proc(INetFwRule*, Int16*, Win32cr::Foundation::HRESULT),
    put_EdgeTraversal : Proc(INetFwRule*, Int16, Win32cr::Foundation::HRESULT),
    get_Action : Proc(INetFwRule*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*, Win32cr::Foundation::HRESULT),
    put_Action : Proc(INetFwRule*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwRule, lpVtbl : INetFwRuleVtbl* do
    GUID = LibC::GUID.new(0xaf230d27_u32, 0xbaba_u16, 0x4e42_u16, StaticArray[0xac_u8, 0xed_u8, 0xf5_u8, 0x24_u8, 0xf2_u8, 0x2c_u8, 0xfc_u8, 0xe2_u8])
    def query_interface(this : INetFwRule*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwRule*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwRule*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwRule*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwRule*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwRule*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwRule*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : INetFwRule*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : INetFwRule*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Description(this : INetFwRule*, desc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, desc)
    end
    def put_Description(this : INetFwRule*, desc : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, desc)
    end
    def get_ApplicationName(this : INetFwRule*, imageFileName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationName.call(this, imageFileName)
    end
    def put_ApplicationName(this : INetFwRule*, imageFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationName.call(this, imageFileName)
    end
    def get_ServiceName(this : INetFwRule*, serviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceName.call(this, serviceName)
    end
    def put_ServiceName(this : INetFwRule*, serviceName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceName.call(this, serviceName)
    end
    def get_Protocol(this : INetFwRule*, protocol : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Protocol.call(this, protocol)
    end
    def put_Protocol(this : INetFwRule*, protocol : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Protocol.call(this, protocol)
    end
    def get_LocalPorts(this : INetFwRule*, portNumbers : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalPorts.call(this, portNumbers)
    end
    def put_LocalPorts(this : INetFwRule*, portNumbers : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalPorts.call(this, portNumbers)
    end
    def get_RemotePorts(this : INetFwRule*, portNumbers : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemotePorts.call(this, portNumbers)
    end
    def put_RemotePorts(this : INetFwRule*, portNumbers : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemotePorts.call(this, portNumbers)
    end
    def get_LocalAddresses(this : INetFwRule*, localAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalAddresses.call(this, localAddrs)
    end
    def put_LocalAddresses(this : INetFwRule*, localAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalAddresses.call(this, localAddrs)
    end
    def get_RemoteAddresses(this : INetFwRule*, remoteAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteAddresses.call(this, remoteAddrs)
    end
    def put_RemoteAddresses(this : INetFwRule*, remoteAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteAddresses.call(this, remoteAddrs)
    end
    def get_IcmpTypesAndCodes(this : INetFwRule*, icmpTypesAndCodes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IcmpTypesAndCodes.call(this, icmpTypesAndCodes)
    end
    def put_IcmpTypesAndCodes(this : INetFwRule*, icmpTypesAndCodes : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IcmpTypesAndCodes.call(this, icmpTypesAndCodes)
    end
    def get_Direction(this : INetFwRule*, dir : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Direction.call(this, dir)
    end
    def put_Direction(this : INetFwRule*, dir : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Direction.call(this, dir)
    end
    def get_Interfaces(this : INetFwRule*, interfaces : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Interfaces.call(this, interfaces)
    end
    def put_Interfaces(this : INetFwRule*, interfaces : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Interfaces.call(this, interfaces)
    end
    def get_InterfaceTypes(this : INetFwRule*, interfaceTypes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InterfaceTypes.call(this, interfaceTypes)
    end
    def put_InterfaceTypes(this : INetFwRule*, interfaceTypes : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InterfaceTypes.call(this, interfaceTypes)
    end
    def get_Enabled(this : INetFwRule*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : INetFwRule*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Grouping(this : INetFwRule*, context : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Grouping.call(this, context)
    end
    def put_Grouping(this : INetFwRule*, context : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Grouping.call(this, context)
    end
    def get_Profiles(this : INetFwRule*, profileTypesBitmask : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profiles.call(this, profileTypesBitmask)
    end
    def put_Profiles(this : INetFwRule*, profileTypesBitmask : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Profiles.call(this, profileTypesBitmask)
    end
    def get_EdgeTraversal(this : INetFwRule*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EdgeTraversal.call(this, enabled)
    end
    def put_EdgeTraversal(this : INetFwRule*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EdgeTraversal.call(this, enabled)
    end
    def get_Action(this : INetFwRule*, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Action.call(this, action)
    end
    def put_Action(this : INetFwRule*, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Action.call(this, action)
    end

  end

  @[Extern]
  record INetFwRule2Vtbl,
    query_interface : Proc(INetFwRule2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwRule2*, UInt32),
    release : Proc(INetFwRule2*, UInt32),
    get_type_info_count : Proc(INetFwRule2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwRule2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwRule2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwRule2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationName : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationName : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ServiceName : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceName : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Protocol : Proc(INetFwRule2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Protocol : Proc(INetFwRule2*, Int32, Win32cr::Foundation::HRESULT),
    get_LocalPorts : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalPorts : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RemotePorts : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemotePorts : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LocalAddresses : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalAddresses : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RemoteAddresses : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemoteAddresses : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IcmpTypesAndCodes : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_IcmpTypesAndCodes : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Direction : Proc(INetFwRule2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION*, Win32cr::Foundation::HRESULT),
    put_Direction : Proc(INetFwRule2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION, Win32cr::Foundation::HRESULT),
    get_Interfaces : Proc(INetFwRule2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Interfaces : Proc(INetFwRule2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_InterfaceTypes : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_InterfaceTypes : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(INetFwRule2*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(INetFwRule2*, Int16, Win32cr::Foundation::HRESULT),
    get_Grouping : Proc(INetFwRule2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Grouping : Proc(INetFwRule2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Profiles : Proc(INetFwRule2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Profiles : Proc(INetFwRule2*, Int32, Win32cr::Foundation::HRESULT),
    get_EdgeTraversal : Proc(INetFwRule2*, Int16*, Win32cr::Foundation::HRESULT),
    put_EdgeTraversal : Proc(INetFwRule2*, Int16, Win32cr::Foundation::HRESULT),
    get_Action : Proc(INetFwRule2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*, Win32cr::Foundation::HRESULT),
    put_Action : Proc(INetFwRule2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION, Win32cr::Foundation::HRESULT),
    get_EdgeTraversalOptions : Proc(INetFwRule2*, Int32*, Win32cr::Foundation::HRESULT),
    put_EdgeTraversalOptions : Proc(INetFwRule2*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwRule2, lpVtbl : INetFwRule2Vtbl* do
    GUID = LibC::GUID.new(0x9c27c8da_u32, 0x189b_u16, 0x4dde_u16, StaticArray[0x89_u8, 0xf7_u8, 0x8b_u8, 0x39_u8, 0xa3_u8, 0x16_u8, 0x78_u8, 0x2c_u8])
    def query_interface(this : INetFwRule2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwRule2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwRule2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwRule2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwRule2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwRule2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwRule2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : INetFwRule2*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : INetFwRule2*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Description(this : INetFwRule2*, desc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, desc)
    end
    def put_Description(this : INetFwRule2*, desc : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, desc)
    end
    def get_ApplicationName(this : INetFwRule2*, imageFileName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationName.call(this, imageFileName)
    end
    def put_ApplicationName(this : INetFwRule2*, imageFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationName.call(this, imageFileName)
    end
    def get_ServiceName(this : INetFwRule2*, serviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceName.call(this, serviceName)
    end
    def put_ServiceName(this : INetFwRule2*, serviceName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceName.call(this, serviceName)
    end
    def get_Protocol(this : INetFwRule2*, protocol : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Protocol.call(this, protocol)
    end
    def put_Protocol(this : INetFwRule2*, protocol : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Protocol.call(this, protocol)
    end
    def get_LocalPorts(this : INetFwRule2*, portNumbers : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalPorts.call(this, portNumbers)
    end
    def put_LocalPorts(this : INetFwRule2*, portNumbers : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalPorts.call(this, portNumbers)
    end
    def get_RemotePorts(this : INetFwRule2*, portNumbers : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemotePorts.call(this, portNumbers)
    end
    def put_RemotePorts(this : INetFwRule2*, portNumbers : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemotePorts.call(this, portNumbers)
    end
    def get_LocalAddresses(this : INetFwRule2*, localAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalAddresses.call(this, localAddrs)
    end
    def put_LocalAddresses(this : INetFwRule2*, localAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalAddresses.call(this, localAddrs)
    end
    def get_RemoteAddresses(this : INetFwRule2*, remoteAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteAddresses.call(this, remoteAddrs)
    end
    def put_RemoteAddresses(this : INetFwRule2*, remoteAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteAddresses.call(this, remoteAddrs)
    end
    def get_IcmpTypesAndCodes(this : INetFwRule2*, icmpTypesAndCodes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IcmpTypesAndCodes.call(this, icmpTypesAndCodes)
    end
    def put_IcmpTypesAndCodes(this : INetFwRule2*, icmpTypesAndCodes : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IcmpTypesAndCodes.call(this, icmpTypesAndCodes)
    end
    def get_Direction(this : INetFwRule2*, dir : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Direction.call(this, dir)
    end
    def put_Direction(this : INetFwRule2*, dir : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Direction.call(this, dir)
    end
    def get_Interfaces(this : INetFwRule2*, interfaces : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Interfaces.call(this, interfaces)
    end
    def put_Interfaces(this : INetFwRule2*, interfaces : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Interfaces.call(this, interfaces)
    end
    def get_InterfaceTypes(this : INetFwRule2*, interfaceTypes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InterfaceTypes.call(this, interfaceTypes)
    end
    def put_InterfaceTypes(this : INetFwRule2*, interfaceTypes : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InterfaceTypes.call(this, interfaceTypes)
    end
    def get_Enabled(this : INetFwRule2*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : INetFwRule2*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Grouping(this : INetFwRule2*, context : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Grouping.call(this, context)
    end
    def put_Grouping(this : INetFwRule2*, context : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Grouping.call(this, context)
    end
    def get_Profiles(this : INetFwRule2*, profileTypesBitmask : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profiles.call(this, profileTypesBitmask)
    end
    def put_Profiles(this : INetFwRule2*, profileTypesBitmask : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Profiles.call(this, profileTypesBitmask)
    end
    def get_EdgeTraversal(this : INetFwRule2*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EdgeTraversal.call(this, enabled)
    end
    def put_EdgeTraversal(this : INetFwRule2*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EdgeTraversal.call(this, enabled)
    end
    def get_Action(this : INetFwRule2*, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Action.call(this, action)
    end
    def put_Action(this : INetFwRule2*, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Action.call(this, action)
    end
    def get_EdgeTraversalOptions(this : INetFwRule2*, lOptions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EdgeTraversalOptions.call(this, lOptions)
    end
    def put_EdgeTraversalOptions(this : INetFwRule2*, lOptions : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EdgeTraversalOptions.call(this, lOptions)
    end

  end

  @[Extern]
  record INetFwRule3Vtbl,
    query_interface : Proc(INetFwRule3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwRule3*, UInt32),
    release : Proc(INetFwRule3*, UInt32),
    get_type_info_count : Proc(INetFwRule3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwRule3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwRule3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwRule3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ApplicationName : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ApplicationName : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ServiceName : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceName : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Protocol : Proc(INetFwRule3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Protocol : Proc(INetFwRule3*, Int32, Win32cr::Foundation::HRESULT),
    get_LocalPorts : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalPorts : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RemotePorts : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemotePorts : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LocalAddresses : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalAddresses : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RemoteAddresses : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemoteAddresses : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IcmpTypesAndCodes : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_IcmpTypesAndCodes : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Direction : Proc(INetFwRule3*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION*, Win32cr::Foundation::HRESULT),
    put_Direction : Proc(INetFwRule3*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION, Win32cr::Foundation::HRESULT),
    get_Interfaces : Proc(INetFwRule3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Interfaces : Proc(INetFwRule3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_InterfaceTypes : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_InterfaceTypes : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(INetFwRule3*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(INetFwRule3*, Int16, Win32cr::Foundation::HRESULT),
    get_Grouping : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Grouping : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Profiles : Proc(INetFwRule3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Profiles : Proc(INetFwRule3*, Int32, Win32cr::Foundation::HRESULT),
    get_EdgeTraversal : Proc(INetFwRule3*, Int16*, Win32cr::Foundation::HRESULT),
    put_EdgeTraversal : Proc(INetFwRule3*, Int16, Win32cr::Foundation::HRESULT),
    get_Action : Proc(INetFwRule3*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*, Win32cr::Foundation::HRESULT),
    put_Action : Proc(INetFwRule3*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION, Win32cr::Foundation::HRESULT),
    get_EdgeTraversalOptions : Proc(INetFwRule3*, Int32*, Win32cr::Foundation::HRESULT),
    put_EdgeTraversalOptions : Proc(INetFwRule3*, Int32, Win32cr::Foundation::HRESULT),
    get_LocalAppPackageId : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalAppPackageId : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LocalUserOwner : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalUserOwner : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LocalUserAuthorizedList : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LocalUserAuthorizedList : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RemoteUserAuthorizedList : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemoteUserAuthorizedList : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RemoteMachineAuthorizedList : Proc(INetFwRule3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RemoteMachineAuthorizedList : Proc(INetFwRule3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SecureFlags : Proc(INetFwRule3*, Int32*, Win32cr::Foundation::HRESULT),
    put_SecureFlags : Proc(INetFwRule3*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwRule3, lpVtbl : INetFwRule3Vtbl* do
    GUID = LibC::GUID.new(0xb21563ff_u32, 0xd696_u16, 0x4222_u16, StaticArray[0xab_u8, 0x46_u8, 0x4e_u8, 0x89_u8, 0xb7_u8, 0x3a_u8, 0xb3_u8, 0x4a_u8])
    def query_interface(this : INetFwRule3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwRule3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwRule3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwRule3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwRule3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwRule3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwRule3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : INetFwRule3*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : INetFwRule3*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Description(this : INetFwRule3*, desc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, desc)
    end
    def put_Description(this : INetFwRule3*, desc : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, desc)
    end
    def get_ApplicationName(this : INetFwRule3*, imageFileName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationName.call(this, imageFileName)
    end
    def put_ApplicationName(this : INetFwRule3*, imageFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ApplicationName.call(this, imageFileName)
    end
    def get_ServiceName(this : INetFwRule3*, serviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceName.call(this, serviceName)
    end
    def put_ServiceName(this : INetFwRule3*, serviceName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceName.call(this, serviceName)
    end
    def get_Protocol(this : INetFwRule3*, protocol : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Protocol.call(this, protocol)
    end
    def put_Protocol(this : INetFwRule3*, protocol : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Protocol.call(this, protocol)
    end
    def get_LocalPorts(this : INetFwRule3*, portNumbers : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalPorts.call(this, portNumbers)
    end
    def put_LocalPorts(this : INetFwRule3*, portNumbers : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalPorts.call(this, portNumbers)
    end
    def get_RemotePorts(this : INetFwRule3*, portNumbers : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemotePorts.call(this, portNumbers)
    end
    def put_RemotePorts(this : INetFwRule3*, portNumbers : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemotePorts.call(this, portNumbers)
    end
    def get_LocalAddresses(this : INetFwRule3*, localAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalAddresses.call(this, localAddrs)
    end
    def put_LocalAddresses(this : INetFwRule3*, localAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalAddresses.call(this, localAddrs)
    end
    def get_RemoteAddresses(this : INetFwRule3*, remoteAddrs : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteAddresses.call(this, remoteAddrs)
    end
    def put_RemoteAddresses(this : INetFwRule3*, remoteAddrs : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteAddresses.call(this, remoteAddrs)
    end
    def get_IcmpTypesAndCodes(this : INetFwRule3*, icmpTypesAndCodes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IcmpTypesAndCodes.call(this, icmpTypesAndCodes)
    end
    def put_IcmpTypesAndCodes(this : INetFwRule3*, icmpTypesAndCodes : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IcmpTypesAndCodes.call(this, icmpTypesAndCodes)
    end
    def get_Direction(this : INetFwRule3*, dir : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Direction.call(this, dir)
    end
    def put_Direction(this : INetFwRule3*, dir : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_RULE_DIRECTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Direction.call(this, dir)
    end
    def get_Interfaces(this : INetFwRule3*, interfaces : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Interfaces.call(this, interfaces)
    end
    def put_Interfaces(this : INetFwRule3*, interfaces : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Interfaces.call(this, interfaces)
    end
    def get_InterfaceTypes(this : INetFwRule3*, interfaceTypes : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InterfaceTypes.call(this, interfaceTypes)
    end
    def put_InterfaceTypes(this : INetFwRule3*, interfaceTypes : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InterfaceTypes.call(this, interfaceTypes)
    end
    def get_Enabled(this : INetFwRule3*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : INetFwRule3*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Grouping(this : INetFwRule3*, context : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Grouping.call(this, context)
    end
    def put_Grouping(this : INetFwRule3*, context : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Grouping.call(this, context)
    end
    def get_Profiles(this : INetFwRule3*, profileTypesBitmask : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Profiles.call(this, profileTypesBitmask)
    end
    def put_Profiles(this : INetFwRule3*, profileTypesBitmask : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Profiles.call(this, profileTypesBitmask)
    end
    def get_EdgeTraversal(this : INetFwRule3*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EdgeTraversal.call(this, enabled)
    end
    def put_EdgeTraversal(this : INetFwRule3*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EdgeTraversal.call(this, enabled)
    end
    def get_Action(this : INetFwRule3*, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Action.call(this, action)
    end
    def put_Action(this : INetFwRule3*, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Action.call(this, action)
    end
    def get_EdgeTraversalOptions(this : INetFwRule3*, lOptions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EdgeTraversalOptions.call(this, lOptions)
    end
    def put_EdgeTraversalOptions(this : INetFwRule3*, lOptions : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EdgeTraversalOptions.call(this, lOptions)
    end
    def get_LocalAppPackageId(this : INetFwRule3*, wszPackageId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalAppPackageId.call(this, wszPackageId)
    end
    def put_LocalAppPackageId(this : INetFwRule3*, wszPackageId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalAppPackageId.call(this, wszPackageId)
    end
    def get_LocalUserOwner(this : INetFwRule3*, wszUserOwner : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalUserOwner.call(this, wszUserOwner)
    end
    def put_LocalUserOwner(this : INetFwRule3*, wszUserOwner : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalUserOwner.call(this, wszUserOwner)
    end
    def get_LocalUserAuthorizedList(this : INetFwRule3*, wszUserAuthList : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalUserAuthorizedList.call(this, wszUserAuthList)
    end
    def put_LocalUserAuthorizedList(this : INetFwRule3*, wszUserAuthList : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LocalUserAuthorizedList.call(this, wszUserAuthList)
    end
    def get_RemoteUserAuthorizedList(this : INetFwRule3*, wszUserAuthList : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteUserAuthorizedList.call(this, wszUserAuthList)
    end
    def put_RemoteUserAuthorizedList(this : INetFwRule3*, wszUserAuthList : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteUserAuthorizedList.call(this, wszUserAuthList)
    end
    def get_RemoteMachineAuthorizedList(this : INetFwRule3*, wszUserAuthList : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteMachineAuthorizedList.call(this, wszUserAuthList)
    end
    def put_RemoteMachineAuthorizedList(this : INetFwRule3*, wszUserAuthList : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteMachineAuthorizedList.call(this, wszUserAuthList)
    end
    def get_SecureFlags(this : INetFwRule3*, lOptions : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecureFlags.call(this, lOptions)
    end
    def put_SecureFlags(this : INetFwRule3*, lOptions : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SecureFlags.call(this, lOptions)
    end

  end

  @[Extern]
  record INetFwRulesVtbl,
    query_interface : Proc(INetFwRules*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwRules*, UInt32),
    release : Proc(INetFwRules*, UInt32),
    get_type_info_count : Proc(INetFwRules*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwRules*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwRules*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwRules*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(INetFwRules*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(INetFwRules*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(INetFwRules*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    item : Proc(INetFwRules*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(INetFwRules*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwRules, lpVtbl : INetFwRulesVtbl* do
    GUID = LibC::GUID.new(0x9c4c6277_u32, 0x5027_u16, 0x441e_u16, StaticArray[0xaf_u8, 0xae_u8, 0xca_u8, 0x1f_u8, 0x54_u8, 0x2d_u8, 0xa0_u8, 0x9_u8])
    def query_interface(this : INetFwRules*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwRules*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwRules*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwRules*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwRules*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwRules*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwRules*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : INetFwRules*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def add(this : INetFwRules*, rule : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, rule)
    end
    def remove(this : INetFwRules*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, name)
    end
    def item(this : INetFwRules*, name : Win32cr::Foundation::BSTR, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, name, rule)
    end
    def get__NewEnum(this : INetFwRules*, newEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, newEnum)
    end

  end

  @[Extern]
  record INetFwServiceRestrictionVtbl,
    query_interface : Proc(INetFwServiceRestriction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwServiceRestriction*, UInt32),
    release : Proc(INetFwServiceRestriction*, UInt32),
    get_type_info_count : Proc(INetFwServiceRestriction*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwServiceRestriction*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwServiceRestriction*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwServiceRestriction*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    restrict_service : Proc(INetFwServiceRestriction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Int16, Win32cr::Foundation::HRESULT),
    service_restricted : Proc(INetFwServiceRestriction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    get_Rules : Proc(INetFwServiceRestriction*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwServiceRestriction, lpVtbl : INetFwServiceRestrictionVtbl* do
    GUID = LibC::GUID.new(0x8267bbe3_u32, 0xf890_u16, 0x491c_u16, StaticArray[0xb7_u8, 0xb6_u8, 0x2d_u8, 0xb1_u8, 0xef_u8, 0xe_u8, 0x5d_u8, 0x2b_u8])
    def query_interface(this : INetFwServiceRestriction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwServiceRestriction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwServiceRestriction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwServiceRestriction*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwServiceRestriction*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwServiceRestriction*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwServiceRestriction*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def restrict_service(this : INetFwServiceRestriction*, serviceName : Win32cr::Foundation::BSTR, appName : Win32cr::Foundation::BSTR, restrictService : Int16, serviceSidRestricted : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restrict_service.call(this, serviceName, appName, restrictService, serviceSidRestricted)
    end
    def service_restricted(this : INetFwServiceRestriction*, serviceName : Win32cr::Foundation::BSTR, appName : Win32cr::Foundation::BSTR, serviceRestricted : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.service_restricted.call(this, serviceName, appName, serviceRestricted)
    end
    def get_Rules(this : INetFwServiceRestriction*, rules : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Rules.call(this, rules)
    end

  end

  @[Extern]
  record INetFwProfileVtbl,
    query_interface : Proc(INetFwProfile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwProfile*, UInt32),
    release : Proc(INetFwProfile*, UInt32),
    get_type_info_count : Proc(INetFwProfile*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwProfile*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwProfile*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwProfile*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(INetFwProfile*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE*, Win32cr::Foundation::HRESULT),
    get_FirewallEnabled : Proc(INetFwProfile*, Int16*, Win32cr::Foundation::HRESULT),
    put_FirewallEnabled : Proc(INetFwProfile*, Int16, Win32cr::Foundation::HRESULT),
    get_ExceptionsNotAllowed : Proc(INetFwProfile*, Int16*, Win32cr::Foundation::HRESULT),
    put_ExceptionsNotAllowed : Proc(INetFwProfile*, Int16, Win32cr::Foundation::HRESULT),
    get_NotificationsDisabled : Proc(INetFwProfile*, Int16*, Win32cr::Foundation::HRESULT),
    put_NotificationsDisabled : Proc(INetFwProfile*, Int16, Win32cr::Foundation::HRESULT),
    get_UnicastResponsesToMulticastBroadcastDisabled : Proc(INetFwProfile*, Int16*, Win32cr::Foundation::HRESULT),
    put_UnicastResponsesToMulticastBroadcastDisabled : Proc(INetFwProfile*, Int16, Win32cr::Foundation::HRESULT),
    get_RemoteAdminSettings : Proc(INetFwProfile*, Void**, Win32cr::Foundation::HRESULT),
    get_IcmpSettings : Proc(INetFwProfile*, Void**, Win32cr::Foundation::HRESULT),
    get_GloballyOpenPorts : Proc(INetFwProfile*, Void**, Win32cr::Foundation::HRESULT),
    get_Services : Proc(INetFwProfile*, Void**, Win32cr::Foundation::HRESULT),
    get_AuthorizedApplications : Proc(INetFwProfile*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwProfile, lpVtbl : INetFwProfileVtbl* do
    GUID = LibC::GUID.new(0x174a0dda_u32, 0xe9f9_u16, 0x449d_u16, StaticArray[0x99_u8, 0x3b_u8, 0x21_u8, 0xab_u8, 0x66_u8, 0x7c_u8, 0xa4_u8, 0x56_u8])
    def query_interface(this : INetFwProfile*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwProfile*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwProfile*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwProfile*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwProfile*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwProfile*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwProfile*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : INetFwProfile*, type__ : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, type__)
    end
    def get_FirewallEnabled(this : INetFwProfile*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirewallEnabled.call(this, enabled)
    end
    def put_FirewallEnabled(this : INetFwProfile*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FirewallEnabled.call(this, enabled)
    end
    def get_ExceptionsNotAllowed(this : INetFwProfile*, notAllowed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExceptionsNotAllowed.call(this, notAllowed)
    end
    def put_ExceptionsNotAllowed(this : INetFwProfile*, notAllowed : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExceptionsNotAllowed.call(this, notAllowed)
    end
    def get_NotificationsDisabled(this : INetFwProfile*, disabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NotificationsDisabled.call(this, disabled)
    end
    def put_NotificationsDisabled(this : INetFwProfile*, disabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NotificationsDisabled.call(this, disabled)
    end
    def get_UnicastResponsesToMulticastBroadcastDisabled(this : INetFwProfile*, disabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UnicastResponsesToMulticastBroadcastDisabled.call(this, disabled)
    end
    def put_UnicastResponsesToMulticastBroadcastDisabled(this : INetFwProfile*, disabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UnicastResponsesToMulticastBroadcastDisabled.call(this, disabled)
    end
    def get_RemoteAdminSettings(this : INetFwProfile*, remoteAdminSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteAdminSettings.call(this, remoteAdminSettings)
    end
    def get_IcmpSettings(this : INetFwProfile*, icmpSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IcmpSettings.call(this, icmpSettings)
    end
    def get_GloballyOpenPorts(this : INetFwProfile*, openPorts : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GloballyOpenPorts.call(this, openPorts)
    end
    def get_Services(this : INetFwProfile*, services : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Services.call(this, services)
    end
    def get_AuthorizedApplications(this : INetFwProfile*, apps : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthorizedApplications.call(this, apps)
    end

  end

  @[Extern]
  record INetFwPolicyVtbl,
    query_interface : Proc(INetFwPolicy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwPolicy*, UInt32),
    release : Proc(INetFwPolicy*, UInt32),
    get_type_info_count : Proc(INetFwPolicy*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwPolicy*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwPolicy*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwPolicy*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CurrentProfile : Proc(INetFwPolicy*, Void**, Win32cr::Foundation::HRESULT),
    get_profile_by_type : Proc(INetFwPolicy*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwPolicy, lpVtbl : INetFwPolicyVtbl* do
    GUID = LibC::GUID.new(0xd46d2478_u32, 0x9ac9_u16, 0x4008_u16, StaticArray[0x9d_u8, 0xc7_u8, 0x55_u8, 0x63_u8, 0xce_u8, 0x55_u8, 0x36_u8, 0xcc_u8])
    def query_interface(this : INetFwPolicy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwPolicy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwPolicy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwPolicy*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwPolicy*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwPolicy*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwPolicy*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CurrentProfile(this : INetFwPolicy*, profile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProfile.call(this, profile)
    end
    def get_profile_by_type(this : INetFwPolicy*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE, profile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_profile_by_type.call(this, profileType, profile)
    end

  end

  @[Extern]
  record INetFwPolicy2Vtbl,
    query_interface : Proc(INetFwPolicy2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwPolicy2*, UInt32),
    release : Proc(INetFwPolicy2*, UInt32),
    get_type_info_count : Proc(INetFwPolicy2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwPolicy2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwPolicy2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwPolicy2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CurrentProfileTypes : Proc(INetFwPolicy2*, Int32*, Win32cr::Foundation::HRESULT),
    get_FirewallEnabled : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Int16*, Win32cr::Foundation::HRESULT),
    put_FirewallEnabled : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Int16, Win32cr::Foundation::HRESULT),
    get_ExcludedInterfaces : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_ExcludedInterfaces : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_BlockAllInboundTraffic : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Int16*, Win32cr::Foundation::HRESULT),
    put_BlockAllInboundTraffic : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Int16, Win32cr::Foundation::HRESULT),
    get_NotificationsDisabled : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Int16*, Win32cr::Foundation::HRESULT),
    put_NotificationsDisabled : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Int16, Win32cr::Foundation::HRESULT),
    get_UnicastResponsesToMulticastBroadcastDisabled : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Int16*, Win32cr::Foundation::HRESULT),
    put_UnicastResponsesToMulticastBroadcastDisabled : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Int16, Win32cr::Foundation::HRESULT),
    get_Rules : Proc(INetFwPolicy2*, Void**, Win32cr::Foundation::HRESULT),
    get_ServiceRestriction : Proc(INetFwPolicy2*, Void**, Win32cr::Foundation::HRESULT),
    enable_rule_group : Proc(INetFwPolicy2*, Int32, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    is_rule_group_enabled : Proc(INetFwPolicy2*, Int32, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    restore_local_firewall_defaults : Proc(INetFwPolicy2*, Win32cr::Foundation::HRESULT),
    get_DefaultInboundAction : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*, Win32cr::Foundation::HRESULT),
    put_DefaultInboundAction : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION, Win32cr::Foundation::HRESULT),
    get_DefaultOutboundAction : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*, Win32cr::Foundation::HRESULT),
    put_DefaultOutboundAction : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION, Win32cr::Foundation::HRESULT),
    get_IsRuleGroupCurrentlyEnabled : Proc(INetFwPolicy2*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    get_LocalPolicyModifyState : Proc(INetFwPolicy2*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_MODIFY_STATE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwPolicy2, lpVtbl : INetFwPolicy2Vtbl* do
    GUID = LibC::GUID.new(0x98325047_u32, 0xc671_u16, 0x4174_u16, StaticArray[0x8d_u8, 0x81_u8, 0xde_u8, 0xfc_u8, 0xd3_u8, 0xf0_u8, 0x31_u8, 0x86_u8])
    def query_interface(this : INetFwPolicy2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwPolicy2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwPolicy2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwPolicy2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwPolicy2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwPolicy2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwPolicy2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CurrentProfileTypes(this : INetFwPolicy2*, profileTypesBitmask : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProfileTypes.call(this, profileTypesBitmask)
    end
    def get_FirewallEnabled(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirewallEnabled.call(this, profileType, enabled)
    end
    def put_FirewallEnabled(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FirewallEnabled.call(this, profileType, enabled)
    end
    def get_ExcludedInterfaces(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, interfaces : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExcludedInterfaces.call(this, profileType, interfaces)
    end
    def put_ExcludedInterfaces(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, interfaces : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExcludedInterfaces.call(this, profileType, interfaces)
    end
    def get_BlockAllInboundTraffic(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, block : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BlockAllInboundTraffic.call(this, profileType, block)
    end
    def put_BlockAllInboundTraffic(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, block : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BlockAllInboundTraffic.call(this, profileType, block)
    end
    def get_NotificationsDisabled(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, disabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NotificationsDisabled.call(this, profileType, disabled)
    end
    def put_NotificationsDisabled(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, disabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NotificationsDisabled.call(this, profileType, disabled)
    end
    def get_UnicastResponsesToMulticastBroadcastDisabled(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, disabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UnicastResponsesToMulticastBroadcastDisabled.call(this, profileType, disabled)
    end
    def put_UnicastResponsesToMulticastBroadcastDisabled(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, disabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UnicastResponsesToMulticastBroadcastDisabled.call(this, profileType, disabled)
    end
    def get_Rules(this : INetFwPolicy2*, rules : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Rules.call(this, rules)
    end
    def get_ServiceRestriction(this : INetFwPolicy2*, service_restriction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceRestriction.call(this, service_restriction)
    end
    def enable_rule_group(this : INetFwPolicy2*, profileTypesBitmask : Int32, group : Win32cr::Foundation::BSTR, enable : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_rule_group.call(this, profileTypesBitmask, group, enable)
    end
    def is_rule_group_enabled(this : INetFwPolicy2*, profileTypesBitmask : Int32, group : Win32cr::Foundation::BSTR, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_rule_group_enabled.call(this, profileTypesBitmask, group, enabled)
    end
    def restore_local_firewall_defaults(this : INetFwPolicy2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_local_firewall_defaults.call(this)
    end
    def get_DefaultInboundAction(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultInboundAction.call(this, profileType, action)
    end
    def put_DefaultInboundAction(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DefaultInboundAction.call(this, profileType, action)
    end
    def get_DefaultOutboundAction(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultOutboundAction.call(this, profileType, action)
    end
    def put_DefaultOutboundAction(this : INetFwPolicy2*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE2, action : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_ACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DefaultOutboundAction.call(this, profileType, action)
    end
    def get_IsRuleGroupCurrentlyEnabled(this : INetFwPolicy2*, group : Win32cr::Foundation::BSTR, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsRuleGroupCurrentlyEnabled.call(this, group, enabled)
    end
    def get_LocalPolicyModifyState(this : INetFwPolicy2*, modifyState : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_MODIFY_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalPolicyModifyState.call(this, modifyState)
    end

  end

  @[Extern]
  record INetFwMgrVtbl,
    query_interface : Proc(INetFwMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwMgr*, UInt32),
    release : Proc(INetFwMgr*, UInt32),
    get_type_info_count : Proc(INetFwMgr*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwMgr*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwMgr*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwMgr*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_LocalPolicy : Proc(INetFwMgr*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProfileType : Proc(INetFwMgr*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE*, Win32cr::Foundation::HRESULT),
    restore_defaults : Proc(INetFwMgr*, Win32cr::Foundation::HRESULT),
    is_port_allowed : Proc(INetFwMgr*, Win32cr::Foundation::BSTR, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION, Int32, Win32cr::Foundation::BSTR, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    is_icmp_type_allowed : Proc(INetFwMgr*, Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION, Win32cr::Foundation::BSTR, UInt8, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwMgr, lpVtbl : INetFwMgrVtbl* do
    GUID = LibC::GUID.new(0xf7898af5_u32, 0xcac4_u16, 0x4632_u16, StaticArray[0xa2_u8, 0xec_u8, 0xda_u8, 0x6_u8, 0xe5_u8, 0x11_u8, 0x1a_u8, 0xf2_u8])
    def query_interface(this : INetFwMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwMgr*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwMgr*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwMgr*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwMgr*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_LocalPolicy(this : INetFwMgr*, localPolicy : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalPolicy.call(this, localPolicy)
    end
    def get_CurrentProfileType(this : INetFwMgr*, profileType : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_PROFILE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProfileType.call(this, profileType)
    end
    def restore_defaults(this : INetFwMgr*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_defaults.call(this)
    end
    def is_port_allowed(this : INetFwMgr*, imageFileName : Win32cr::Foundation::BSTR, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION, portNumber : Int32, localAddress : Win32cr::Foundation::BSTR, ipProtocol : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_PROTOCOL, allowed : Win32cr::System::Com::VARIANT*, restricted : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_port_allowed.call(this, imageFileName, ipVersion, portNumber, localAddress, ipProtocol, allowed, restricted)
    end
    def is_icmp_type_allowed(this : INetFwMgr*, ipVersion : Win32cr::NetworkManagement::WindowsFirewall::NET_FW_IP_VERSION, localAddress : Win32cr::Foundation::BSTR, type__ : UInt8, allowed : Win32cr::System::Com::VARIANT*, restricted : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_icmp_type_allowed.call(this, ipVersion, localAddress, type__, allowed, restricted)
    end

  end

  @[Extern]
  record INetFwProductVtbl,
    query_interface : Proc(INetFwProduct*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwProduct*, UInt32),
    release : Proc(INetFwProduct*, UInt32),
    get_type_info_count : Proc(INetFwProduct*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwProduct*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwProduct*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwProduct*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_RuleCategories : Proc(INetFwProduct*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_RuleCategories : Proc(INetFwProduct*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(INetFwProduct*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DisplayName : Proc(INetFwProduct*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PathToSignedProductExe : Proc(INetFwProduct*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwProduct, lpVtbl : INetFwProductVtbl* do
    GUID = LibC::GUID.new(0x71881699_u32, 0x18f4_u16, 0x458b_u16, StaticArray[0xb8_u8, 0x92_u8, 0x3f_u8, 0xfc_u8, 0xe5_u8, 0xe0_u8, 0x7f_u8, 0x75_u8])
    def query_interface(this : INetFwProduct*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwProduct*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwProduct*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwProduct*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwProduct*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwProduct*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwProduct*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_RuleCategories(this : INetFwProduct*, ruleCategories : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RuleCategories.call(this, ruleCategories)
    end
    def put_RuleCategories(this : INetFwProduct*, ruleCategories : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RuleCategories.call(this, ruleCategories)
    end
    def get_DisplayName(this : INetFwProduct*, displayName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, displayName)
    end
    def put_DisplayName(this : INetFwProduct*, displayName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayName.call(this, displayName)
    end
    def get_PathToSignedProductExe(this : INetFwProduct*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathToSignedProductExe.call(this, path)
    end

  end

  @[Extern]
  record INetFwProductsVtbl,
    query_interface : Proc(INetFwProducts*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetFwProducts*, UInt32),
    release : Proc(INetFwProducts*, UInt32),
    get_type_info_count : Proc(INetFwProducts*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetFwProducts*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetFwProducts*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetFwProducts*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(INetFwProducts*, Int32*, Win32cr::Foundation::HRESULT),
    register : Proc(INetFwProducts*, Void*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(INetFwProducts*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(INetFwProducts*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INetFwProducts, lpVtbl : INetFwProductsVtbl* do
    GUID = LibC::GUID.new(0x39eb36e0_u32, 0x2097_u16, 0x40bd_u16, StaticArray[0x8a_u8, 0xf2_u8, 0x63_u8, 0xa1_u8, 0x3b_u8, 0x52_u8, 0x53_u8, 0x62_u8])
    def query_interface(this : INetFwProducts*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetFwProducts*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetFwProducts*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetFwProducts*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetFwProducts*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetFwProducts*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetFwProducts*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : INetFwProducts*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def register(this : INetFwProducts*, product : Void*, registration : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this, product, registration)
    end
    def item(this : INetFwProducts*, index : Int32, product : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, product)
    end
    def get__NewEnum(this : INetFwProducts*, newEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, newEnum)
    end

  end

  def networkIsolationSetupAppContainerBinaries(applicationContainerSid : Win32cr::Foundation::PSID, packageFullName : Win32cr::Foundation::PWSTR, packageFolder : Win32cr::Foundation::PWSTR, displayName : Win32cr::Foundation::PWSTR, bBinariesFullyComputed : Win32cr::Foundation::BOOL, binaries : Win32cr::Foundation::PWSTR*, binariesCount : UInt32) : Win32cr::Foundation::HRESULT
    C.NetworkIsolationSetupAppContainerBinaries(applicationContainerSid, packageFullName, packageFolder, displayName, bBinariesFullyComputed, binaries, binariesCount)
  end

  def networkIsolationRegisterForAppContainerChanges(flags : UInt32, callback : Win32cr::NetworkManagement::WindowsFirewall::PAC_CHANGES_CALLBACK_FN, context : Void*, registrationObject : Win32cr::Foundation::HANDLE*) : UInt32
    C.NetworkIsolationRegisterForAppContainerChanges(flags, callback, context, registrationObject)
  end

  def networkIsolationUnregisterForAppContainerChanges(registrationObject : Win32cr::Foundation::HANDLE) : UInt32
    C.NetworkIsolationUnregisterForAppContainerChanges(registrationObject)
  end

  def networkIsolationFreeAppContainers(pPublicAppCs : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_APP_CONTAINER*) : UInt32
    C.NetworkIsolationFreeAppContainers(pPublicAppCs)
  end

  def networkIsolationEnumAppContainers(flags : UInt32, pdwNumPublicAppCs : UInt32*, ppPublicAppCs : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_APP_CONTAINER**) : UInt32
    C.NetworkIsolationEnumAppContainers(flags, pdwNumPublicAppCs, ppPublicAppCs)
  end

  def networkIsolationGetAppContainerConfig(pdwNumPublicAppCs : UInt32*, appContainerSids : Win32cr::Security::SID_AND_ATTRIBUTES**) : UInt32
    C.NetworkIsolationGetAppContainerConfig(pdwNumPublicAppCs, appContainerSids)
  end

  def networkIsolationSetAppContainerConfig(dwNumPublicAppCs : UInt32, appContainerSids : Win32cr::Security::SID_AND_ATTRIBUTES*) : UInt32
    C.NetworkIsolationSetAppContainerConfig(dwNumPublicAppCs, appContainerSids)
  end

  def networkIsolationDiagnoseConnectFailureAndGetInfo(wszServerName : Win32cr::Foundation::PWSTR, netIsoError : Win32cr::NetworkManagement::WindowsFirewall::NETISO_ERROR_TYPE*) : UInt32
    C.NetworkIsolationDiagnoseConnectFailureAndGetInfo(wszServerName, netIsoError)
  end

  lib C
    # :nodoc:
    fun NetworkIsolationSetupAppContainerBinaries(applicationContainerSid : Win32cr::Foundation::PSID, packageFullName : Win32cr::Foundation::PWSTR, packageFolder : Win32cr::Foundation::PWSTR, displayName : Win32cr::Foundation::PWSTR, bBinariesFullyComputed : Win32cr::Foundation::BOOL, binaries : Win32cr::Foundation::PWSTR*, binariesCount : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun NetworkIsolationRegisterForAppContainerChanges(flags : UInt32, callback : Win32cr::NetworkManagement::WindowsFirewall::PAC_CHANGES_CALLBACK_FN, context : Void*, registrationObject : Win32cr::Foundation::HANDLE*) : UInt32

    # :nodoc:
    fun NetworkIsolationUnregisterForAppContainerChanges(registrationObject : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun NetworkIsolationFreeAppContainers(pPublicAppCs : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_APP_CONTAINER*) : UInt32

    # :nodoc:
    fun NetworkIsolationEnumAppContainers(flags : UInt32, pdwNumPublicAppCs : UInt32*, ppPublicAppCs : Win32cr::NetworkManagement::WindowsFirewall::INET_FIREWALL_APP_CONTAINER**) : UInt32

    # :nodoc:
    fun NetworkIsolationGetAppContainerConfig(pdwNumPublicAppCs : UInt32*, appContainerSids : Win32cr::Security::SID_AND_ATTRIBUTES**) : UInt32

    # :nodoc:
    fun NetworkIsolationSetAppContainerConfig(dwNumPublicAppCs : UInt32, appContainerSids : Win32cr::Security::SID_AND_ATTRIBUTES*) : UInt32

    # :nodoc:
    fun NetworkIsolationDiagnoseConnectFailureAndGetInfo(wszServerName : Win32cr::Foundation::PWSTR, netIsoError : Win32cr::NetworkManagement::WindowsFirewall::NETISO_ERROR_TYPE*) : UInt32

  end
end