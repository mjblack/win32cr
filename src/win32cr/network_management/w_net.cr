require "./../foundation.cr"

module Win32cr::NetworkManagement::WNet
  alias NetEnumHandle = LibC::IntPtrT
  alias PF_NPAddConnection = Proc(Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32)*

  alias PF_NPAddConnection3 = Proc(Win32cr::Foundation::HWND, Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32)*

  alias PF_NPAddConnection4 = Proc(Win32cr::Foundation::HWND, Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Void*, UInt32, UInt32, UInt8*, UInt32, UInt32)*

  alias PF_NPCancelConnection = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt32)*

  alias PF_NPCancelConnection2 = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt32, UInt32)*

  alias PF_NPGetConnection = Proc(Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32)*

  alias PF_NPGetConnection3 = Proc(Win32cr::Foundation::PWSTR, UInt32, Void*, UInt32*, UInt32)*

  alias PF_NPGetUniversalName = Proc(Win32cr::Foundation::PWSTR, UInt32, Void*, UInt32*, UInt32)*

  alias PF_NPGetConnectionPerformance = Proc(Win32cr::Foundation::PWSTR, Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*, UInt32)*

  alias PF_NPOpenEnum = Proc(UInt32, UInt32, UInt32, Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Win32cr::Foundation::HANDLE*, UInt32)*

  alias PF_NPEnumResource = Proc(Win32cr::Foundation::HANDLE, UInt32*, Void*, UInt32*, UInt32)*

  alias PF_NPCloseEnum = Proc(Win32cr::Foundation::HANDLE, UInt32)*

  alias PF_NPGetCaps = Proc(UInt32, UInt32)*

  alias PF_NPGetUser = Proc(Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32)*

  alias PF_NPGetPersistentUseOptionsForConnection = Proc(Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8*, UInt32*, UInt32)*

  alias PF_NPDeviceMode = Proc(Win32cr::Foundation::HWND, UInt32)*

  alias PF_NPSearchDialog = Proc(Win32cr::Foundation::HWND, Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Void*, UInt32, UInt32*, UInt32)*

  alias PF_NPGetResourceParent = Proc(Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Void*, UInt32*, UInt32)*

  alias PF_NPGetResourceInformation = Proc(Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Void*, UInt32*, Win32cr::Foundation::PWSTR*, UInt32)*

  alias PF_NPFormatNetworkName = Proc(Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32, UInt32, UInt32)*

  alias PF_NPGetPropertyText = Proc(UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt16*, UInt32, UInt32, UInt32)*

  alias PF_NPPropertyDialog = Proc(Win32cr::Foundation::HWND, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32)*

  alias PF_NPGetDirectoryType = Proc(Win32cr::Foundation::PWSTR, Int32*, Win32cr::Foundation::BOOL, UInt32)*

  alias PF_NPDirectoryNotify = Proc(Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, UInt32, UInt32)*

  alias PF_NPLogonNotify = Proc(Win32cr::Foundation::LUID*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR*, UInt32)*

  alias PF_NPPasswordChangeNotify = Proc(Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Void*, UInt32, UInt32)*

  alias PF_AddConnectNotify = Proc(Win32cr::NetworkManagement::WNet::NOTIFYINFO*, Win32cr::NetworkManagement::WNet::NOTIFYADD*, UInt32)*

  alias PF_CancelConnectNotify = Proc(Win32cr::NetworkManagement::WNet::NOTIFYINFO*, Win32cr::NetworkManagement::WNet::NOTIFYCANCEL*, UInt32)*

  alias PF_NPFMXGetPermCaps = Proc(Win32cr::Foundation::PWSTR, UInt32)*

  alias PF_NPFMXEditPerm = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::HWND, UInt32, UInt32)*

  alias PF_NPFMXGetPermHelp = Proc(Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL, Void*, UInt32*, UInt32*, UInt32)*

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

  enum UNC_INFO_LEVEL : UInt32
    UNIVERSAL_NAME_INFO_LEVEL = 1_u32
    REMOTE_NAME_INFO_LEVEL = 2_u32
  end
  enum WNPERM_DLG : UInt32
    WNPERM_DLG_PERM = 0_u32
    WNPERM_DLG_AUDIT = 1_u32
    WNPERM_DLG_OWNER = 2_u32
  end
  @[Flags]
  enum WNET_OPEN_ENUM_USAGE : UInt32
    RESOURCEUSAGE_NONE = 0_u32
    RESOURCEUSAGE_CONNECTABLE = 1_u32
    RESOURCEUSAGE_CONTAINER = 2_u32
    RESOURCEUSAGE_ATTACHED = 16_u32
    RESOURCEUSAGE_ALL = 19_u32
  end
  @[Flags]
  enum NET_USE_CONNECT_FLAGS : UInt32
    CONNECT_INTERACTIVE = 8_u32
    CONNECT_PROMPT = 16_u32
    CONNECT_REDIRECT = 128_u32
    CONNECT_UPDATE_PROFILE = 1_u32
    CONNECT_COMMANDLINE = 2048_u32
    CONNECT_CMD_SAVECRED = 4096_u32
    CONNECT_TEMPORARY = 4_u32
    CONNECT_DEFERRED = 1024_u32
    CONNECT_UPDATE_RECENT = 2_u32
  end
  enum NP_PROPERTY_DIALOG_SELECTION : UInt32
    WNPS_FILE = 0_u32
    WNPS_DIR = 1_u32
    WNPS_MULT = 2_u32
  end
  enum NPDIRECTORY_NOTIFY_OPERATION : UInt32
    WNDN_MKDIR = 1_u32
    WNDN_RMDIR = 2_u32
    WNDN_MVDIR = 3_u32
  end
  @[Flags]
  enum NET_RESOURCE_TYPE : UInt32
    RESOURCETYPE_ANY = 0_u32
    RESOURCETYPE_DISK = 1_u32
    RESOURCETYPE_PRINT = 2_u32
  end
  enum NETWORK_NAME_FORMAT_FLAGS : UInt32
    WNFMT_MULTILINE = 1_u32
    WNFMT_ABBREVIATED = 2_u32
  end
  enum NET_RESOURCE_SCOPE : UInt32
    RESOURCE_CONNECTED = 1_u32
    RESOURCE_CONTEXT = 5_u32
    RESOURCE_GLOBALNET = 2_u32
    RESOURCE_REMEMBERED = 3_u32
  end
  @[Flags]
  enum NETINFOSTRUCT_CHARACTERISTICS : UInt32
    NETINFO_DLL16 = 1_u32
    NETINFO_DISKRED = 4_u32
    NETINFO_PRINTERRED = 8_u32
  end
  @[Flags]
  enum CONNECTDLGSTRUCT_FLAGS : UInt32
    CONNDLG_RO_PATH = 1_u32
    CONNDLG_CONN_POINT = 2_u32
    CONNDLG_USE_MRU = 4_u32
    CONNDLG_HIDE_BOX = 8_u32
    CONNDLG_PERSIST = 16_u32
    CONNDLG_NOT_PERSIST = 32_u32
  end
  @[Flags]
  enum DISCDLGSTRUCT_FLAGS : UInt32
    DISC_UPDATE_PROFILE = 1_u32
    DISC_NO_FORCE = 64_u32
  end

  @[Extern]
  record NETRESOURCEA,
    dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE,
    dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE,
    dwDisplayType : UInt32,
    dwUsage : UInt32,
    lpLocalName : Win32cr::Foundation::PSTR,
    lpRemoteName : Win32cr::Foundation::PSTR,
    lpComment : Win32cr::Foundation::PSTR,
    lpProvider : Win32cr::Foundation::PSTR

  @[Extern]
  record NETRESOURCEW,
    dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE,
    dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE,
    dwDisplayType : UInt32,
    dwUsage : UInt32,
    lpLocalName : Win32cr::Foundation::PWSTR,
    lpRemoteName : Win32cr::Foundation::PWSTR,
    lpComment : Win32cr::Foundation::PWSTR,
    lpProvider : Win32cr::Foundation::PWSTR

  @[Extern]
  record CONNECTDLGSTRUCTA,
    cbStructure : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    lpConnRes : Win32cr::NetworkManagement::WNet::NETRESOURCEA*,
    dwFlags : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCT_FLAGS,
    dwDevNum : UInt32

  @[Extern]
  record CONNECTDLGSTRUCTW,
    cbStructure : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    lpConnRes : Win32cr::NetworkManagement::WNet::NETRESOURCEW*,
    dwFlags : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCT_FLAGS,
    dwDevNum : UInt32

  @[Extern]
  record DISCDLGSTRUCTA,
    cbStructure : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    lpLocalName : Win32cr::Foundation::PSTR,
    lpRemoteName : Win32cr::Foundation::PSTR,
    dwFlags : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCT_FLAGS

  @[Extern]
  record DISCDLGSTRUCTW,
    cbStructure : UInt32,
    hwndOwner : Win32cr::Foundation::HWND,
    lpLocalName : Win32cr::Foundation::PWSTR,
    lpRemoteName : Win32cr::Foundation::PWSTR,
    dwFlags : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCT_FLAGS

  @[Extern]
  record UNIVERSAL_NAME_INFOA,
    lpUniversalName : Win32cr::Foundation::PSTR

  @[Extern]
  record UNIVERSAL_NAME_INFOW,
    lpUniversalName : Win32cr::Foundation::PWSTR

  @[Extern]
  record REMOTE_NAME_INFOA,
    lpUniversalName : Win32cr::Foundation::PSTR,
    lpConnectionName : Win32cr::Foundation::PSTR,
    lpRemainingPath : Win32cr::Foundation::PSTR

  @[Extern]
  record REMOTE_NAME_INFOW,
    lpUniversalName : Win32cr::Foundation::PWSTR,
    lpConnectionName : Win32cr::Foundation::PWSTR,
    lpRemainingPath : Win32cr::Foundation::PWSTR

  @[Extern]
  record NETINFOSTRUCT,
    cbStructure : UInt32,
    dwProviderVersion : UInt32,
    dwStatus : Win32cr::Foundation::WIN32_ERROR,
    dwCharacteristics : Win32cr::NetworkManagement::WNet::NETINFOSTRUCT_CHARACTERISTICS,
    dwHandle : LibC::UIntPtrT,
    wNetType : UInt16,
    dwPrinters : UInt32,
    dwDrives : UInt32

  @[Extern]
  record NETCONNECTINFOSTRUCT,
    cbStructure : UInt32,
    dwFlags : UInt32,
    dwSpeed : UInt32,
    dwDelay : UInt32,
    dwOptDataSize : UInt32

  @[Extern]
  record NOTIFYINFO,
    dwNotifyStatus : UInt32,
    dwOperationStatus : UInt32,
    lpContext : Void*

  @[Extern]
  record NOTIFYADD,
    hwndOwner : Win32cr::Foundation::HWND,
    net_resource : Win32cr::NetworkManagement::WNet::NETRESOURCEA,
    dwAddFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS

  @[Extern]
  record NOTIFYCANCEL,
    lpName : Win32cr::Foundation::PWSTR,
    lpProvider : Win32cr::Foundation::PWSTR,
    dwFlags : UInt32,
    fForce : Win32cr::Foundation::BOOL

  @[Link("mpr")]
  @[Link("davclnt")]
  @[Link("ntlanman")]
  lib C
    fun WNetAddConnectionA(lpRemoteName : Win32cr::Foundation::PSTR, lpPassword : Win32cr::Foundation::PSTR, lpLocalName : Win32cr::Foundation::PSTR) : UInt32

    fun WNetAddConnectionW(lpRemoteName : Win32cr::Foundation::PWSTR, lpPassword : Win32cr::Foundation::PWSTR, lpLocalName : Win32cr::Foundation::PWSTR) : UInt32

    fun WNetAddConnection2A(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpPassword : Win32cr::Foundation::PSTR, lpUserName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : UInt32

    fun WNetAddConnection2W(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : UInt32

    fun WNetAddConnection3A(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpPassword : Win32cr::Foundation::PSTR, lpUserName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : UInt32

    fun WNetAddConnection3W(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : UInt32

    fun WNetAddConnection4A(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32) : UInt32

    fun WNetAddConnection4W(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32) : UInt32

    fun WNetCancelConnectionA(lpName : Win32cr::Foundation::PSTR, fForce : Win32cr::Foundation::BOOL) : UInt32

    fun WNetCancelConnectionW(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL) : UInt32

    fun WNetCancelConnection2A(lpName : Win32cr::Foundation::PSTR, dwFlags : UInt32, fForce : Win32cr::Foundation::BOOL) : UInt32

    fun WNetCancelConnection2W(lpName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, fForce : Win32cr::Foundation::BOOL) : UInt32

    fun WNetGetConnectionA(lpLocalName : Win32cr::Foundation::PSTR, lpRemoteName : UInt8*, lpnLength : UInt32*) : UInt32

    fun WNetGetConnectionW(lpLocalName : Win32cr::Foundation::PWSTR, lpRemoteName : UInt16*, lpnLength : UInt32*) : UInt32

    fun WNetUseConnectionA(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpPassword : Win32cr::Foundation::PSTR, lpUserId : Win32cr::Foundation::PSTR, dwFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS, lpAccessName : UInt8*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32

    fun WNetUseConnectionW(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserId : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS, lpAccessName : UInt16*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32

    fun WNetUseConnection4A(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32, lpAccessName : UInt8*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32

    fun WNetUseConnection4W(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32, lpAccessName : UInt16*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32

    fun WNetConnectionDialog(hwnd : Win32cr::Foundation::HWND, dwType : UInt32) : UInt32

    fun WNetDisconnectDialog(hwnd : Win32cr::Foundation::HWND, dwType : UInt32) : UInt32

    fun WNetConnectionDialog1A(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCTA*) : UInt32

    fun WNetConnectionDialog1W(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCTW*) : UInt32

    fun WNetDisconnectDialog1A(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCTA*) : UInt32

    fun WNetDisconnectDialog1W(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCTW*) : UInt32

    fun WNetOpenEnumA(dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE, dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE, dwUsage : Win32cr::NetworkManagement::WNet::WNET_OPEN_ENUM_USAGE, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lphEnum : Win32cr::NetworkManagement::WNet::NetEnumHandle*) : UInt32

    fun WNetOpenEnumW(dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE, dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE, dwUsage : Win32cr::NetworkManagement::WNet::WNET_OPEN_ENUM_USAGE, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lphEnum : Win32cr::NetworkManagement::WNet::NetEnumHandle*) : UInt32

    fun WNetEnumResourceA(hEnum : Win32cr::Foundation::HANDLE, lpcCount : UInt32*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    fun WNetEnumResourceW(hEnum : Win32cr::Foundation::HANDLE, lpcCount : UInt32*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    fun WNetCloseEnum(hEnum : Win32cr::Foundation::HANDLE) : UInt32

    fun WNetGetResourceParentA(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpBuffer : Void*, lpcbBuffer : UInt32*) : UInt32

    fun WNetGetResourceParentW(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpcbBuffer : UInt32*) : UInt32

    fun WNetGetResourceInformationA(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpBuffer : Void*, lpcbBuffer : UInt32*, lplpSystem : Win32cr::Foundation::PSTR*) : UInt32

    fun WNetGetResourceInformationW(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpcbBuffer : UInt32*, lplpSystem : Win32cr::Foundation::PWSTR*) : UInt32

    fun WNetGetUniversalNameA(lpLocalPath : Win32cr::Foundation::PSTR, dwInfoLevel : Win32cr::NetworkManagement::WNet::UNC_INFO_LEVEL, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    fun WNetGetUniversalNameW(lpLocalPath : Win32cr::Foundation::PWSTR, dwInfoLevel : Win32cr::NetworkManagement::WNet::UNC_INFO_LEVEL, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    fun WNetGetUserA(lpName : Win32cr::Foundation::PSTR, lpUserName : UInt8*, lpnLength : UInt32*) : UInt32

    fun WNetGetUserW(lpName : Win32cr::Foundation::PWSTR, lpUserName : UInt16*, lpnLength : UInt32*) : UInt32

    fun WNetGetProviderNameA(dwNetType : UInt32, lpProviderName : UInt8*, lpBufferSize : UInt32*) : UInt32

    fun WNetGetProviderNameW(dwNetType : UInt32, lpProviderName : UInt16*, lpBufferSize : UInt32*) : UInt32

    fun WNetGetNetworkInformationA(lpProvider : Win32cr::Foundation::PSTR, lpNetInfoStruct : Win32cr::NetworkManagement::WNet::NETINFOSTRUCT*) : UInt32

    fun WNetGetNetworkInformationW(lpProvider : Win32cr::Foundation::PWSTR, lpNetInfoStruct : Win32cr::NetworkManagement::WNet::NETINFOSTRUCT*) : UInt32

    fun WNetGetLastErrorA(lpError : UInt32*, lpErrorBuf : UInt8*, nErrorBufSize : UInt32, lpNameBuf : UInt8*, nNameBufSize : UInt32) : UInt32

    fun WNetGetLastErrorW(lpError : UInt32*, lpErrorBuf : UInt16*, nErrorBufSize : UInt32, lpNameBuf : UInt16*, nNameBufSize : UInt32) : UInt32

    fun MultinetGetConnectionPerformanceA(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpNetConnectInfoStruct : Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*) : UInt32

    fun MultinetGetConnectionPerformanceW(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpNetConnectInfoStruct : Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*) : UInt32

    fun NPAddConnection(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR) : UInt32

    fun NPAddConnection3(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS) : UInt32

    fun NPAddConnection4(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32) : UInt32

    fun NPCancelConnection(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL) : UInt32

    fun NPCancelConnection2(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL, dwFlags : UInt32) : UInt32

    fun NPGetConnection(lpLocalName : Win32cr::Foundation::PWSTR, lpRemoteName : UInt16*, lpnBufferLen : UInt32*) : UInt32

    fun NPGetConnection3(lpLocalName : Win32cr::Foundation::PWSTR, dwLevel : UInt32, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    fun NPGetUniversalName(lpLocalPath : Win32cr::Foundation::PWSTR, dwInfoLevel : Win32cr::NetworkManagement::WNet::UNC_INFO_LEVEL, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    fun NPGetConnectionPerformance(lpRemoteName : Win32cr::Foundation::PWSTR, lpNetConnectInfo : Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*) : UInt32

    fun NPOpenEnum(dwScope : UInt32, dwType : UInt32, dwUsage : UInt32, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lphEnum : Win32cr::Foundation::HANDLE*) : UInt32

    fun NPEnumResource(hEnum : Win32cr::Foundation::HANDLE, lpcCount : UInt32*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    fun NPCloseEnum(hEnum : Win32cr::Foundation::HANDLE) : UInt32

    fun NPGetCaps(ndex : UInt32) : UInt32

    fun NPGetUser(lpName : Win32cr::Foundation::PWSTR, lpUserName : UInt16*, lpnBufferLen : UInt32*) : UInt32

    fun NPGetPersistentUseOptionsForConnection(lpRemotePath : Win32cr::Foundation::PWSTR, lpReadUseOptions : UInt8*, cbReadUseOptions : UInt32, lpWriteUseOptions : UInt8*, lpSizeWriteUseOptions : UInt32*) : UInt32

    fun NPGetResourceParent(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    fun NPGetResourceInformation(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpBufferSize : UInt32*, lplpSystem : Win32cr::Foundation::PWSTR*) : UInt32

    fun NPFormatNetworkName(lpRemoteName : Win32cr::Foundation::PWSTR, lpFormattedName : UInt16*, lpnLength : UInt32*, dwFlags : Win32cr::NetworkManagement::WNet::NETWORK_NAME_FORMAT_FLAGS, dwAveCharPerLine : UInt32) : UInt32

    fun WNetSetLastErrorA(err : UInt32, lpError : Win32cr::Foundation::PSTR, lpProviders : Win32cr::Foundation::PSTR) : Void

    fun WNetSetLastErrorW(err : UInt32, lpError : Win32cr::Foundation::PWSTR, lpProviders : Win32cr::Foundation::PWSTR) : Void

  end
end