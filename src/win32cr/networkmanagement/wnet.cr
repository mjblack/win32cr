require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:mpr.dll")]
@[Link(ldflags: "/DELAYLOAD:davclnt.dll")]
@[Link(ldflags: "/DELAYLOAD:ntlanman.dll")]
{% else %}
@[Link("mpr")]
@[Link("davclnt")]
@[Link("ntlanman")]
{% end %}
lib LibWin32
  alias NetEnumHandle = LibC::IntPtrT

  WNGETCON_CONNECTED = 0_u32
  WNGETCON_DISCONNECTED = 1_u32
  WNNC_SPEC_VERSION = 1_u32
  WNNC_SPEC_VERSION51 = 327681_u32
  WNNC_NET_TYPE = 2_u32
  WNNC_NET_NONE = 0_u32
  WNNC_DRIVER_VERSION = 3_u32
  WNNC_USER = 4_u32
  WNNC_USR_GETUSER = 1_u32
  WNNC_CONNECTION = 6_u32
  WNNC_CON_ADDCONNECTION = 1_u32
  WNNC_CON_CANCELCONNECTION = 2_u32
  WNNC_CON_GETCONNECTIONS = 4_u32
  WNNC_CON_ADDCONNECTION3 = 8_u32
  WNNC_CON_ADDCONNECTION4 = 16_u32
  WNNC_CON_CANCELCONNECTION2 = 32_u32
  WNNC_CON_GETPERFORMANCE = 64_u32
  WNNC_CON_DEFER = 128_u32
  WNNC_DIALOG = 8_u32
  WNNC_DLG_DEVICEMODE = 1_u32
  WNNC_DLG_PROPERTYDIALOG = 32_u32
  WNNC_DLG_SEARCHDIALOG = 64_u32
  WNNC_DLG_FORMATNETWORKNAME = 128_u32
  WNNC_DLG_PERMISSIONEDITOR = 256_u32
  WNNC_DLG_GETRESOURCEPARENT = 512_u32
  WNNC_DLG_GETRESOURCEINFORMATION = 2048_u32
  WNNC_ADMIN = 9_u32
  WNNC_ADM_GETDIRECTORYTYPE = 1_u32
  WNNC_ADM_DIRECTORYNOTIFY = 2_u32
  WNNC_ENUMERATION = 11_u32
  WNNC_ENUM_GLOBAL = 1_u32
  WNNC_ENUM_LOCAL = 2_u32
  WNNC_ENUM_CONTEXT = 4_u32
  WNNC_ENUM_SHAREABLE = 8_u32
  WNNC_START = 12_u32
  WNNC_WAIT_FOR_START = 1_u32
  WNNC_CONNECTION_FLAGS = 13_u32
  WNTYPE_DRIVE = 1_u32
  WNTYPE_FILE = 2_u32
  WNTYPE_PRINTER = 3_u32
  WNTYPE_COMM = 4_u32
  WNSRCH_REFRESH_FIRST_LEVEL = 1_u32
  WNDT_NORMAL = 0_u32
  WNDT_NETWORK = 1_u32
  WN_NETWORK_CLASS = 1_u32
  WN_CREDENTIAL_CLASS = 2_u32
  WN_PRIMARY_AUTHENT_CLASS = 4_u32
  WN_SERVICE_CLASS = 8_u32
  WN_VALID_LOGON_ACCOUNT = 1_u32
  WN_NT_PASSWORD_CHANGED = 2_u32
  NOTIFY_PRE = 1_u32
  NOTIFY_POST = 2_u32
  WNPERMC_PERM = 1_u32
  WNPERMC_AUDIT = 2_u32
  WNPERMC_OWNER = 4_u32
  RESOURCE_RECENT = 4_u32
  RESOURCETYPE_RESERVED = 8_u32
  RESOURCETYPE_UNKNOWN = 4294967295_u32
  RESOURCEUSAGE_NOLOCALDEVICE = 4_u32
  RESOURCEUSAGE_SIBLING = 8_u32
  RESOURCEUSAGE_RESERVED = 2147483648_u32
  RESOURCEDISPLAYTYPE_NETWORK = 6_u32
  RESOURCEDISPLAYTYPE_ROOT = 7_u32
  RESOURCEDISPLAYTYPE_SHAREADMIN = 8_u32
  RESOURCEDISPLAYTYPE_DIRECTORY = 9_u32
  RESOURCEDISPLAYTYPE_NDSCONTAINER = 11_u32
  NETPROPERTY_PERSISTENT = 1_u32
  CONNECT_NEED_DRIVE = 32_u32
  CONNECT_REFCOUNT = 64_u32
  CONNECT_LOCALDRIVE = 256_u32
  CONNECT_CURRENT_MEDIA = 512_u32
  CONNECT_RESERVED = 4278190080_u32
  CONNECT_CRED_RESET = 8192_u32
  CONNECT_REQUIRE_INTEGRITY = 16384_u32
  CONNECT_REQUIRE_PRIVACY = 32768_u32
  CONNECT_WRITE_THROUGH_SEMANTICS = 65536_u32
  CONNECT_GLOBAL_MAPPING = 262144_u32
  WNFMT_INENUM = 16_u32
  WNFMT_CONNECTION = 32_u32
  WNCON_FORNETCARD = 1_u32
  WNCON_NOTROUTED = 2_u32
  WNCON_SLOWLINK = 4_u32
  WNCON_DYNAMIC = 8_u32

  alias PF_NPAddConnection = Proc(NETRESOURCEW*, LibC::LPWSTR, LibC::LPWSTR, UInt32)
  alias PF_NPAddConnection3 = Proc(LibC::HANDLE, NETRESOURCEW*, LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt32)
  alias PF_NPAddConnection4 = Proc(LibC::HANDLE, NETRESOURCEW*, Void*, UInt32, UInt32, UInt8*, UInt32, UInt32)
  alias PF_NPCancelConnection = Proc(LibC::LPWSTR, LibC::BOOL, UInt32)
  alias PF_NPCancelConnection2 = Proc(LibC::LPWSTR, LibC::BOOL, UInt32, UInt32)
  alias PF_NPGetConnection = Proc(LibC::LPWSTR, Char*, UInt32*, UInt32)
  alias PF_NPGetConnection3 = Proc(LibC::LPWSTR, UInt32, Void*, UInt32*, UInt32)
  alias PF_NPGetUniversalName = Proc(LibC::LPWSTR, UInt32, Void*, UInt32*, UInt32)
  alias PF_NPGetConnectionPerformance = Proc(LibC::LPWSTR, NETCONNECTINFOSTRUCT*, UInt32)
  alias PF_NPOpenEnum = Proc(UInt32, UInt32, UInt32, NETRESOURCEW*, LibC::HANDLE*, UInt32)
  alias PF_NPEnumResource = Proc(LibC::HANDLE, UInt32*, Void*, UInt32*, UInt32)
  alias PF_NPCloseEnum = Proc(LibC::HANDLE, UInt32)
  alias PF_NPGetCaps = Proc(UInt32, UInt32)
  alias PF_NPGetUser = Proc(LibC::LPWSTR, Char*, UInt32*, UInt32)
  alias PF_NPGetPersistentUseOptionsForConnection = Proc(LibC::LPWSTR, UInt8*, UInt32, UInt8*, UInt32*, UInt32)
  alias PF_NPDeviceMode = Proc(LibC::HANDLE, UInt32)
  alias PF_NPSearchDialog = Proc(LibC::HANDLE, NETRESOURCEW*, Void*, UInt32, UInt32*, UInt32)
  alias PF_NPGetResourceParent = Proc(NETRESOURCEW*, Void*, UInt32*, UInt32)
  alias PF_NPGetResourceInformation = Proc(NETRESOURCEW*, Void*, UInt32*, LibC::LPWSTR*, UInt32)
  alias PF_NPFormatNetworkName = Proc(LibC::LPWSTR, Char*, UInt32*, UInt32, UInt32, UInt32)
  alias PF_NPGetPropertyText = Proc(UInt32, UInt32, LibC::LPWSTR, Char*, UInt32, UInt32, UInt32)
  alias PF_NPPropertyDialog = Proc(LibC::HANDLE, UInt32, UInt32, LibC::LPWSTR, UInt32, UInt32)
  alias PF_NPGetDirectoryType = Proc(LibC::LPWSTR, Int32*, LibC::BOOL, UInt32)
  alias PF_NPDirectoryNotify = Proc(LibC::HANDLE, LibC::LPWSTR, UInt32, UInt32)
  alias PF_NPLogonNotify = Proc(LUID*, LibC::LPWSTR, Void*, LibC::LPWSTR, Void*, LibC::LPWSTR, Void*, LibC::LPWSTR*, UInt32)
  alias PF_NPPasswordChangeNotify = Proc(LibC::LPWSTR, Void*, LibC::LPWSTR, Void*, LibC::LPWSTR, Void*, UInt32, UInt32)
  alias PF_AddConnectNotify = Proc(NOTIFYINFO*, NOTIFYADD*, UInt32)
  alias PF_CancelConnectNotify = Proc(NOTIFYINFO*, NOTIFYCANCEL*, UInt32)
  alias PF_NPFMXGetPermCaps = Proc(LibC::LPWSTR, UInt32)
  alias PF_NPFMXEditPerm = Proc(LibC::LPWSTR, LibC::HANDLE, UInt32, UInt32)
  alias PF_NPFMXGetPermHelp = Proc(LibC::LPWSTR, UInt32, LibC::BOOL, Void*, UInt32*, UInt32*, UInt32)


  enum UNC_INFO_LEVEL : UInt32
    UNIVERSAL_NAME_INFO_LEVEL = 1
    REMOTE_NAME_INFO_LEVEL = 2
  end

  enum WNPERM_DLG : UInt32
    WNPERM_DLG_PERM = 0
    WNPERM_DLG_AUDIT = 1
    WNPERM_DLG_OWNER = 2
  end

  enum WNET_OPEN_ENUM_USAGE : UInt32
    RESOURCEUSAGE_NONE = 0
    RESOURCEUSAGE_CONNECTABLE = 1
    RESOURCEUSAGE_CONTAINER = 2
    RESOURCEUSAGE_ATTACHED = 16
    RESOURCEUSAGE_ALL = 19
  end

  enum NET_USE_CONNECT_FLAGS : UInt32
    CONNECT_INTERACTIVE = 8
    CONNECT_PROMPT = 16
    CONNECT_REDIRECT = 128
    CONNECT_UPDATE_PROFILE = 1
    CONNECT_COMMANDLINE = 2048
    CONNECT_CMD_SAVECRED = 4096
    CONNECT_TEMPORARY = 4
    CONNECT_DEFERRED = 1024
    CONNECT_UPDATE_RECENT = 2
  end

  enum NP_PROPERTY_DIALOG_SELECTION : UInt32
    WNPS_FILE = 0
    WNPS_DIR = 1
    WNPS_MULT = 2
  end

  enum NPDIRECTORY_NOTIFY_OPERATION : UInt32
    WNDN_MKDIR = 1
    WNDN_RMDIR = 2
    WNDN_MVDIR = 3
  end

  enum NET_RESOURCE_TYPE : UInt32
    RESOURCETYPE_ANY = 0
    RESOURCETYPE_DISK = 1
    RESOURCETYPE_PRINT = 2
  end

  enum NETWORK_NAME_FORMAT_FLAGS : UInt32
    WNFMT_MULTILINE = 1
    WNFMT_ABBREVIATED = 2
  end

  enum NET_RESOURCE_SCOPE : UInt32
    RESOURCE_CONNECTED = 1
    RESOURCE_CONTEXT = 5
    RESOURCE_GLOBALNET = 2
    RESOURCE_REMEMBERED = 3
  end

  enum NETINFOSTRUCT_CHARACTERISTICS : UInt32
    NETINFO_DLL16 = 1
    NETINFO_DISKRED = 4
    NETINFO_PRINTERRED = 8
  end

  enum CONNECTDLGSTRUCT_FLAGS : UInt32
    CONNDLG_RO_PATH = 1
    CONNDLG_CONN_POINT = 2
    CONNDLG_USE_MRU = 4
    CONNDLG_HIDE_BOX = 8
    CONNDLG_PERSIST = 16
    CONNDLG_NOT_PERSIST = 32
  end

  enum DISCDLGSTRUCT_FLAGS : UInt32
    DISC_UPDATE_PROFILE = 1
    DISC_NO_FORCE = 64
  end

  struct NETRESOURCEA
    dw_scope : NET_RESOURCE_SCOPE
    dw_type : NET_RESOURCE_TYPE
    dw_display_type : UInt32
    dw_usage : UInt32
    lp_local_name : PSTR
    lp_remote_name : PSTR
    lp_comment : PSTR
    lp_provider : PSTR
  end
  struct NETRESOURCEW
    dw_scope : NET_RESOURCE_SCOPE
    dw_type : NET_RESOURCE_TYPE
    dw_display_type : UInt32
    dw_usage : UInt32
    lp_local_name : LibC::LPWSTR
    lp_remote_name : LibC::LPWSTR
    lp_comment : LibC::LPWSTR
    lp_provider : LibC::LPWSTR
  end
  struct CONNECTDLGSTRUCTA
    cb_structure : UInt32
    hwnd_owner : HANDLE
    lp_conn_res : NETRESOURCEA*
    dw_flags : CONNECTDLGSTRUCT_FLAGS
    dw_dev_num : UInt32
  end
  struct CONNECTDLGSTRUCTW
    cb_structure : UInt32
    hwnd_owner : HANDLE
    lp_conn_res : NETRESOURCEW*
    dw_flags : CONNECTDLGSTRUCT_FLAGS
    dw_dev_num : UInt32
  end
  struct DISCDLGSTRUCTA
    cb_structure : UInt32
    hwnd_owner : HANDLE
    lp_local_name : PSTR
    lp_remote_name : PSTR
    dw_flags : DISCDLGSTRUCT_FLAGS
  end
  struct DISCDLGSTRUCTW
    cb_structure : UInt32
    hwnd_owner : HANDLE
    lp_local_name : LibC::LPWSTR
    lp_remote_name : LibC::LPWSTR
    dw_flags : DISCDLGSTRUCT_FLAGS
  end
  struct UNIVERSAL_NAME_INFOA
    lp_universal_name : PSTR
  end
  struct UNIVERSAL_NAME_INFOW
    lp_universal_name : LibC::LPWSTR
  end
  struct REMOTE_NAME_INFOA
    lp_universal_name : PSTR
    lp_connection_name : PSTR
    lp_remaining_path : PSTR
  end
  struct REMOTE_NAME_INFOW
    lp_universal_name : LibC::LPWSTR
    lp_connection_name : LibC::LPWSTR
    lp_remaining_path : LibC::LPWSTR
  end
  struct NETINFOSTRUCT
    cb_structure : UInt32
    dw_provider_version : UInt32
    dw_status : WIN32_ERROR
    dw_characteristics : NETINFOSTRUCT_CHARACTERISTICS
    dw_handle : LibC::UINT_PTR
    w_net_type : UInt16
    dw_printers : UInt32
    dw_drives : UInt32
  end
  struct NETCONNECTINFOSTRUCT
    cb_structure : UInt32
    dw_flags : UInt32
    dw_speed : UInt32
    dw_delay : UInt32
    dw_opt_data_size : UInt32
  end
  struct NOTIFYINFO
    dw_notify_status : UInt32
    dw_operation_status : UInt32
    lp_context : Void*
  end
  struct NOTIFYADD
    hwnd_owner : HANDLE
    net_resource : NETRESOURCEA
    dw_add_flags : NET_USE_CONNECT_FLAGS
  end
  struct NOTIFYCANCEL
    lp_name : LibC::LPWSTR
    lp_provider : LibC::LPWSTR
    dw_flags : UInt32
    f_force : LibC::BOOL
  end


  # Params # lpremotename : PSTR [In],lppassword : PSTR [In],lplocalname : PSTR [In]
  fun WNetAddConnectionA(lpremotename : PSTR, lppassword : PSTR, lplocalname : PSTR) : UInt32

  # Params # lpremotename : LibC::LPWSTR [In],lppassword : LibC::LPWSTR [In],lplocalname : LibC::LPWSTR [In]
  fun WNetAddConnectionW(lpremotename : LibC::LPWSTR, lppassword : LibC::LPWSTR, lplocalname : LibC::LPWSTR) : UInt32

  # Params # lpnetresource : NETRESOURCEA* [In],lppassword : PSTR [In],lpusername : PSTR [In],dwflags : UInt32 [In]
  fun WNetAddConnection2A(lpnetresource : NETRESOURCEA*, lppassword : PSTR, lpusername : PSTR, dwflags : UInt32) : UInt32

  # Params # lpnetresource : NETRESOURCEW* [In],lppassword : LibC::LPWSTR [In],lpusername : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun WNetAddConnection2W(lpnetresource : NETRESOURCEW*, lppassword : LibC::LPWSTR, lpusername : LibC::LPWSTR, dwflags : UInt32) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEA* [In],lppassword : PSTR [In],lpusername : PSTR [In],dwflags : UInt32 [In]
  fun WNetAddConnection3A(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEA*, lppassword : PSTR, lpusername : PSTR, dwflags : UInt32) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEW* [In],lppassword : LibC::LPWSTR [In],lpusername : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun WNetAddConnection3W(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEW*, lppassword : LibC::LPWSTR, lpusername : LibC::LPWSTR, dwflags : UInt32) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEA* [In],pauthbuffer : Void* [In],cbauthbuffer : UInt32 [In],dwflags : UInt32 [In],lpuseoptions : UInt8* [In],cbuseoptions : UInt32 [In]
  fun WNetAddConnection4A(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEA*, pauthbuffer : Void*, cbauthbuffer : UInt32, dwflags : UInt32, lpuseoptions : UInt8*, cbuseoptions : UInt32) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEW* [In],pauthbuffer : Void* [In],cbauthbuffer : UInt32 [In],dwflags : UInt32 [In],lpuseoptions : UInt8* [In],cbuseoptions : UInt32 [In]
  fun WNetAddConnection4W(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEW*, pauthbuffer : Void*, cbauthbuffer : UInt32, dwflags : UInt32, lpuseoptions : UInt8*, cbuseoptions : UInt32) : UInt32

  # Params # lpname : PSTR [In],fforce : LibC::BOOL [In]
  fun WNetCancelConnectionA(lpname : PSTR, fforce : LibC::BOOL) : UInt32

  # Params # lpname : LibC::LPWSTR [In],fforce : LibC::BOOL [In]
  fun WNetCancelConnectionW(lpname : LibC::LPWSTR, fforce : LibC::BOOL) : UInt32

  # Params # lpname : PSTR [In],dwflags : UInt32 [In],fforce : LibC::BOOL [In]
  fun WNetCancelConnection2A(lpname : PSTR, dwflags : UInt32, fforce : LibC::BOOL) : UInt32

  # Params # lpname : LibC::LPWSTR [In],dwflags : UInt32 [In],fforce : LibC::BOOL [In]
  fun WNetCancelConnection2W(lpname : LibC::LPWSTR, dwflags : UInt32, fforce : LibC::BOOL) : UInt32

  # Params # lplocalname : PSTR [In],lpremotename : UInt8* [In],lpnlength : UInt32* [In]
  fun WNetGetConnectionA(lplocalname : PSTR, lpremotename : UInt8*, lpnlength : UInt32*) : UInt32

  # Params # lplocalname : LibC::LPWSTR [In],lpremotename : Char* [In],lpnlength : UInt32* [In]
  fun WNetGetConnectionW(lplocalname : LibC::LPWSTR, lpremotename : Char*, lpnlength : UInt32*) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEA* [In],lppassword : PSTR [In],lpuserid : PSTR [In],dwflags : NET_USE_CONNECT_FLAGS [In],lpaccessname : UInt8* [In],lpbuffersize : UInt32* [In],lpresult : UInt32* [In]
  fun WNetUseConnectionA(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEA*, lppassword : PSTR, lpuserid : PSTR, dwflags : NET_USE_CONNECT_FLAGS, lpaccessname : UInt8*, lpbuffersize : UInt32*, lpresult : UInt32*) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEW* [In],lppassword : LibC::LPWSTR [In],lpuserid : LibC::LPWSTR [In],dwflags : NET_USE_CONNECT_FLAGS [In],lpaccessname : Char* [In],lpbuffersize : UInt32* [In],lpresult : UInt32* [In]
  fun WNetUseConnectionW(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEW*, lppassword : LibC::LPWSTR, lpuserid : LibC::LPWSTR, dwflags : NET_USE_CONNECT_FLAGS, lpaccessname : Char*, lpbuffersize : UInt32*, lpresult : UInt32*) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEA* [In],pauthbuffer : Void* [In],cbauthbuffer : UInt32 [In],dwflags : UInt32 [In],lpuseoptions : UInt8* [In],cbuseoptions : UInt32 [In],lpaccessname : UInt8* [In],lpbuffersize : UInt32* [In],lpresult : UInt32* [In]
  fun WNetUseConnection4A(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEA*, pauthbuffer : Void*, cbauthbuffer : UInt32, dwflags : UInt32, lpuseoptions : UInt8*, cbuseoptions : UInt32, lpaccessname : UInt8*, lpbuffersize : UInt32*, lpresult : UInt32*) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEW* [In],pauthbuffer : Void* [In],cbauthbuffer : UInt32 [In],dwflags : UInt32 [In],lpuseoptions : UInt8* [In],cbuseoptions : UInt32 [In],lpaccessname : Char* [In],lpbuffersize : UInt32* [In],lpresult : UInt32* [In]
  fun WNetUseConnection4W(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEW*, pauthbuffer : Void*, cbauthbuffer : UInt32, dwflags : UInt32, lpuseoptions : UInt8*, cbuseoptions : UInt32, lpaccessname : Char*, lpbuffersize : UInt32*, lpresult : UInt32*) : UInt32

  # Params # hwnd : LibC::HANDLE [In],dwtype : UInt32 [In]
  fun WNetConnectionDialog(hwnd : LibC::HANDLE, dwtype : UInt32) : UInt32

  # Params # hwnd : LibC::HANDLE [In],dwtype : UInt32 [In]
  fun WNetDisconnectDialog(hwnd : LibC::HANDLE, dwtype : UInt32) : UInt32

  # Params # lpconndlgstruct : CONNECTDLGSTRUCTA* [In]
  fun WNetConnectionDialog1A(lpconndlgstruct : CONNECTDLGSTRUCTA*) : UInt32

  # Params # lpconndlgstruct : CONNECTDLGSTRUCTW* [In]
  fun WNetConnectionDialog1W(lpconndlgstruct : CONNECTDLGSTRUCTW*) : UInt32

  # Params # lpconndlgstruct : DISCDLGSTRUCTA* [In]
  fun WNetDisconnectDialog1A(lpconndlgstruct : DISCDLGSTRUCTA*) : UInt32

  # Params # lpconndlgstruct : DISCDLGSTRUCTW* [In]
  fun WNetDisconnectDialog1W(lpconndlgstruct : DISCDLGSTRUCTW*) : UInt32

  # Params # dwscope : NET_RESOURCE_SCOPE [In],dwtype : NET_RESOURCE_TYPE [In],dwusage : WNET_OPEN_ENUM_USAGE [In],lpnetresource : NETRESOURCEA* [In],lphenum : NetEnumHandle* [In]
  fun WNetOpenEnumA(dwscope : NET_RESOURCE_SCOPE, dwtype : NET_RESOURCE_TYPE, dwusage : WNET_OPEN_ENUM_USAGE, lpnetresource : NETRESOURCEA*, lphenum : NetEnumHandle*) : UInt32

  # Params # dwscope : NET_RESOURCE_SCOPE [In],dwtype : NET_RESOURCE_TYPE [In],dwusage : WNET_OPEN_ENUM_USAGE [In],lpnetresource : NETRESOURCEW* [In],lphenum : NetEnumHandle* [In]
  fun WNetOpenEnumW(dwscope : NET_RESOURCE_SCOPE, dwtype : NET_RESOURCE_TYPE, dwusage : WNET_OPEN_ENUM_USAGE, lpnetresource : NETRESOURCEW*, lphenum : NetEnumHandle*) : UInt32

  # Params # henum : LibC::HANDLE [In],lpccount : UInt32* [In],lpbuffer : Void* [In],lpbuffersize : UInt32* [In]
  fun WNetEnumResourceA(henum : LibC::HANDLE, lpccount : UInt32*, lpbuffer : Void*, lpbuffersize : UInt32*) : UInt32

  # Params # henum : LibC::HANDLE [In],lpccount : UInt32* [In],lpbuffer : Void* [In],lpbuffersize : UInt32* [In]
  fun WNetEnumResourceW(henum : LibC::HANDLE, lpccount : UInt32*, lpbuffer : Void*, lpbuffersize : UInt32*) : UInt32

  # Params # henum : LibC::HANDLE [In]
  fun WNetCloseEnum(henum : LibC::HANDLE) : UInt32

  # Params # lpnetresource : NETRESOURCEA* [In],lpbuffer : Void* [In],lpcbbuffer : UInt32* [In]
  fun WNetGetResourceParentA(lpnetresource : NETRESOURCEA*, lpbuffer : Void*, lpcbbuffer : UInt32*) : UInt32

  # Params # lpnetresource : NETRESOURCEW* [In],lpbuffer : Void* [In],lpcbbuffer : UInt32* [In]
  fun WNetGetResourceParentW(lpnetresource : NETRESOURCEW*, lpbuffer : Void*, lpcbbuffer : UInt32*) : UInt32

  # Params # lpnetresource : NETRESOURCEA* [In],lpbuffer : Void* [In],lpcbbuffer : UInt32* [In],lplpsystem : PSTR* [In]
  fun WNetGetResourceInformationA(lpnetresource : NETRESOURCEA*, lpbuffer : Void*, lpcbbuffer : UInt32*, lplpsystem : PSTR*) : UInt32

  # Params # lpnetresource : NETRESOURCEW* [In],lpbuffer : Void* [In],lpcbbuffer : UInt32* [In],lplpsystem : LibC::LPWSTR* [In]
  fun WNetGetResourceInformationW(lpnetresource : NETRESOURCEW*, lpbuffer : Void*, lpcbbuffer : UInt32*, lplpsystem : LibC::LPWSTR*) : UInt32

  # Params # lplocalpath : PSTR [In],dwinfolevel : UNC_INFO_LEVEL [In],lpbuffer : Void* [In],lpbuffersize : UInt32* [In]
  fun WNetGetUniversalNameA(lplocalpath : PSTR, dwinfolevel : UNC_INFO_LEVEL, lpbuffer : Void*, lpbuffersize : UInt32*) : UInt32

  # Params # lplocalpath : LibC::LPWSTR [In],dwinfolevel : UNC_INFO_LEVEL [In],lpbuffer : Void* [In],lpbuffersize : UInt32* [In]
  fun WNetGetUniversalNameW(lplocalpath : LibC::LPWSTR, dwinfolevel : UNC_INFO_LEVEL, lpbuffer : Void*, lpbuffersize : UInt32*) : UInt32

  # Params # lpname : PSTR [In],lpusername : UInt8* [In],lpnlength : UInt32* [In]
  fun WNetGetUserA(lpname : PSTR, lpusername : UInt8*, lpnlength : UInt32*) : UInt32

  # Params # lpname : LibC::LPWSTR [In],lpusername : Char* [In],lpnlength : UInt32* [In]
  fun WNetGetUserW(lpname : LibC::LPWSTR, lpusername : Char*, lpnlength : UInt32*) : UInt32

  # Params # dwnettype : UInt32 [In],lpprovidername : UInt8* [In],lpbuffersize : UInt32* [In]
  fun WNetGetProviderNameA(dwnettype : UInt32, lpprovidername : UInt8*, lpbuffersize : UInt32*) : UInt32

  # Params # dwnettype : UInt32 [In],lpprovidername : Char* [In],lpbuffersize : UInt32* [In]
  fun WNetGetProviderNameW(dwnettype : UInt32, lpprovidername : Char*, lpbuffersize : UInt32*) : UInt32

  # Params # lpprovider : PSTR [In],lpnetinfostruct : NETINFOSTRUCT* [In]
  fun WNetGetNetworkInformationA(lpprovider : PSTR, lpnetinfostruct : NETINFOSTRUCT*) : UInt32

  # Params # lpprovider : LibC::LPWSTR [In],lpnetinfostruct : NETINFOSTRUCT* [In]
  fun WNetGetNetworkInformationW(lpprovider : LibC::LPWSTR, lpnetinfostruct : NETINFOSTRUCT*) : UInt32

  # Params # lperror : UInt32* [In],lperrorbuf : UInt8* [In],nerrorbufsize : UInt32 [In],lpnamebuf : UInt8* [In],nnamebufsize : UInt32 [In]
  fun WNetGetLastErrorA(lperror : UInt32*, lperrorbuf : UInt8*, nerrorbufsize : UInt32, lpnamebuf : UInt8*, nnamebufsize : UInt32) : UInt32

  # Params # lperror : UInt32* [In],lperrorbuf : Char* [In],nerrorbufsize : UInt32 [In],lpnamebuf : Char* [In],nnamebufsize : UInt32 [In]
  fun WNetGetLastErrorW(lperror : UInt32*, lperrorbuf : Char*, nerrorbufsize : UInt32, lpnamebuf : Char*, nnamebufsize : UInt32) : UInt32

  # Params # lpnetresource : NETRESOURCEA* [In],lpnetconnectinfostruct : NETCONNECTINFOSTRUCT* [In]
  fun MultinetGetConnectionPerformanceA(lpnetresource : NETRESOURCEA*, lpnetconnectinfostruct : NETCONNECTINFOSTRUCT*) : UInt32

  # Params # lpnetresource : NETRESOURCEW* [In],lpnetconnectinfostruct : NETCONNECTINFOSTRUCT* [In]
  fun MultinetGetConnectionPerformanceW(lpnetresource : NETRESOURCEW*, lpnetconnectinfostruct : NETCONNECTINFOSTRUCT*) : UInt32

  # Params # lpnetresource : NETRESOURCEW* [In],lppassword : LibC::LPWSTR [In],lpusername : LibC::LPWSTR [In]
  fun NPAddConnection(lpnetresource : NETRESOURCEW*, lppassword : LibC::LPWSTR, lpusername : LibC::LPWSTR) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEW* [In],lppassword : LibC::LPWSTR [In],lpusername : LibC::LPWSTR [In],dwflags : NET_USE_CONNECT_FLAGS [In]
  fun NPAddConnection3(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEW*, lppassword : LibC::LPWSTR, lpusername : LibC::LPWSTR, dwflags : NET_USE_CONNECT_FLAGS) : UInt32

  # Params # hwndowner : LibC::HANDLE [In],lpnetresource : NETRESOURCEW* [In],lpauthbuffer : Void* [In],cbauthbuffer : UInt32 [In],dwflags : UInt32 [In],lpuseoptions : UInt8* [In],cbuseoptions : UInt32 [In]
  fun NPAddConnection4(hwndowner : LibC::HANDLE, lpnetresource : NETRESOURCEW*, lpauthbuffer : Void*, cbauthbuffer : UInt32, dwflags : UInt32, lpuseoptions : UInt8*, cbuseoptions : UInt32) : UInt32

  # Params # lpname : LibC::LPWSTR [In],fforce : LibC::BOOL [In]
  fun NPCancelConnection(lpname : LibC::LPWSTR, fforce : LibC::BOOL) : UInt32

  # Params # lpname : LibC::LPWSTR [In],fforce : LibC::BOOL [In],dwflags : UInt32 [In]
  fun NPCancelConnection2(lpname : LibC::LPWSTR, fforce : LibC::BOOL, dwflags : UInt32) : UInt32

  # Params # lplocalname : LibC::LPWSTR [In],lpremotename : Char* [In],lpnbufferlen : UInt32* [In]
  fun NPGetConnection(lplocalname : LibC::LPWSTR, lpremotename : Char*, lpnbufferlen : UInt32*) : UInt32

  # Params # lplocalname : LibC::LPWSTR [In],dwlevel : UInt32 [In],lpbuffer : Void* [In],lpbuffersize : UInt32* [In]
  fun NPGetConnection3(lplocalname : LibC::LPWSTR, dwlevel : UInt32, lpbuffer : Void*, lpbuffersize : UInt32*) : UInt32

  # Params # lplocalpath : LibC::LPWSTR [In],dwinfolevel : UNC_INFO_LEVEL [In],lpbuffer : Void* [In],lpbuffersize : UInt32* [In]
  fun NPGetUniversalName(lplocalpath : LibC::LPWSTR, dwinfolevel : UNC_INFO_LEVEL, lpbuffer : Void*, lpbuffersize : UInt32*) : UInt32

  # Params # lpremotename : LibC::LPWSTR [In],lpnetconnectinfo : NETCONNECTINFOSTRUCT* [In]
  fun NPGetConnectionPerformance(lpremotename : LibC::LPWSTR, lpnetconnectinfo : NETCONNECTINFOSTRUCT*) : UInt32

  # Params # dwscope : UInt32 [In],dwtype : UInt32 [In],dwusage : UInt32 [In],lpnetresource : NETRESOURCEW* [In],lphenum : LibC::HANDLE* [In]
  fun NPOpenEnum(dwscope : UInt32, dwtype : UInt32, dwusage : UInt32, lpnetresource : NETRESOURCEW*, lphenum : LibC::HANDLE*) : UInt32

  # Params # henum : LibC::HANDLE [In],lpccount : UInt32* [In],lpbuffer : Void* [In],lpbuffersize : UInt32* [In]
  fun NPEnumResource(henum : LibC::HANDLE, lpccount : UInt32*, lpbuffer : Void*, lpbuffersize : UInt32*) : UInt32

  # Params # henum : LibC::HANDLE [In]
  fun NPCloseEnum(henum : LibC::HANDLE) : UInt32

  # Params # ndex : UInt32 [In]
  fun NPGetCaps(ndex : UInt32) : UInt32

  # Params # lpname : LibC::LPWSTR [In],lpusername : Char* [In],lpnbufferlen : UInt32* [In]
  fun NPGetUser(lpname : LibC::LPWSTR, lpusername : Char*, lpnbufferlen : UInt32*) : UInt32

  # Params # lpremotepath : LibC::LPWSTR [In],lpreaduseoptions : UInt8* [In],cbreaduseoptions : UInt32 [In],lpwriteuseoptions : UInt8* [In],lpsizewriteuseoptions : UInt32* [In]
  fun NPGetPersistentUseOptionsForConnection(lpremotepath : LibC::LPWSTR, lpreaduseoptions : UInt8*, cbreaduseoptions : UInt32, lpwriteuseoptions : UInt8*, lpsizewriteuseoptions : UInt32*) : UInt32

  # Params # lpnetresource : NETRESOURCEW* [In],lpbuffer : Void* [In],lpbuffersize : UInt32* [In]
  fun NPGetResourceParent(lpnetresource : NETRESOURCEW*, lpbuffer : Void*, lpbuffersize : UInt32*) : UInt32

  # Params # lpnetresource : NETRESOURCEW* [In],lpbuffer : Void* [In],lpbuffersize : UInt32* [In],lplpsystem : LibC::LPWSTR* [In]
  fun NPGetResourceInformation(lpnetresource : NETRESOURCEW*, lpbuffer : Void*, lpbuffersize : UInt32*, lplpsystem : LibC::LPWSTR*) : UInt32

  # Params # lpremotename : LibC::LPWSTR [In],lpformattedname : Char* [In],lpnlength : UInt32* [In],dwflags : NETWORK_NAME_FORMAT_FLAGS [In],dwavecharperline : UInt32 [In]
  fun NPFormatNetworkName(lpremotename : LibC::LPWSTR, lpformattedname : Char*, lpnlength : UInt32*, dwflags : NETWORK_NAME_FORMAT_FLAGS, dwavecharperline : UInt32) : UInt32

  # Params # err : UInt32 [In],lperror : PSTR [In],lpproviders : PSTR [In]
  fun WNetSetLastErrorA(err : UInt32, lperror : PSTR, lpproviders : PSTR) : Void

  # Params # err : UInt32 [In],lperror : LibC::LPWSTR [In],lpproviders : LibC::LPWSTR [In]
  fun WNetSetLastErrorW(err : UInt32, lperror : LibC::LPWSTR, lpproviders : LibC::LPWSTR) : Void
end
