require "./../foundation.cr"

module Win32cr::NetworkManagement::WNet
  extend self
  alias NetEnumHandle = LibC::IntPtrT
  alias PF_NPAddConnection = Proc(Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32)

  alias PF_NPAddConnection3 = Proc(Win32cr::Foundation::HWND, Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32)

  alias PF_NPAddConnection4 = Proc(Win32cr::Foundation::HWND, Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Void*, UInt32, UInt32, UInt8*, UInt32, UInt32)

  alias PF_NPCancelConnection = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt32)

  alias PF_NPCancelConnection2 = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt32, UInt32)

  alias PF_NPGetConnection = Proc(Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32)

  alias PF_NPGetConnection3 = Proc(Win32cr::Foundation::PWSTR, UInt32, Void*, UInt32*, UInt32)

  alias PF_NPGetUniversalName = Proc(Win32cr::Foundation::PWSTR, UInt32, Void*, UInt32*, UInt32)

  alias PF_NPGetConnectionPerformance = Proc(Win32cr::Foundation::PWSTR, Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*, UInt32)

  alias PF_NPOpenEnum = Proc(UInt32, UInt32, UInt32, Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Win32cr::Foundation::HANDLE*, UInt32)

  alias PF_NPEnumResource = Proc(Win32cr::Foundation::HANDLE, UInt32*, Void*, UInt32*, UInt32)

  alias PF_NPCloseEnum = Proc(Win32cr::Foundation::HANDLE, UInt32)

  alias PF_NPGetCaps = Proc(UInt32, UInt32)

  alias PF_NPGetUser = Proc(Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32)

  alias PF_NPGetPersistentUseOptionsForConnection = Proc(Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8*, UInt32*, UInt32)

  alias PF_NPDeviceMode = Proc(Win32cr::Foundation::HWND, UInt32)

  alias PF_NPSearchDialog = Proc(Win32cr::Foundation::HWND, Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Void*, UInt32, UInt32*, UInt32)

  alias PF_NPGetResourceParent = Proc(Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Void*, UInt32*, UInt32)

  alias PF_NPGetResourceInformation = Proc(Win32cr::NetworkManagement::WNet::NETRESOURCEW*, Void*, UInt32*, Win32cr::Foundation::PWSTR*, UInt32)

  alias PF_NPFormatNetworkName = Proc(Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32, UInt32, UInt32)

  alias PF_NPGetPropertyText = Proc(UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt16*, UInt32, UInt32, UInt32)

  alias PF_NPPropertyDialog = Proc(Win32cr::Foundation::HWND, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32)

  alias PF_NPGetDirectoryType = Proc(Win32cr::Foundation::PWSTR, Int32*, Win32cr::Foundation::BOOL, UInt32)

  alias PF_NPDirectoryNotify = Proc(Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, UInt32, UInt32)

  alias PF_NPLogonNotify = Proc(Win32cr::Foundation::LUID*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR*, UInt32)

  alias PF_NPPasswordChangeNotify = Proc(Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Void*, UInt32, UInt32)

  alias PF_AddConnectNotify = Proc(Win32cr::NetworkManagement::WNet::NOTIFYINFO*, Win32cr::NetworkManagement::WNet::NOTIFYADD*, UInt32)

  alias PF_CancelConnectNotify = Proc(Win32cr::NetworkManagement::WNet::NOTIFYINFO*, Win32cr::NetworkManagement::WNet::NOTIFYCANCEL*, UInt32)

  alias PF_NPFMXGetPermCaps = Proc(Win32cr::Foundation::PWSTR, UInt32)

  alias PF_NPFMXEditPerm = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::HWND, UInt32, UInt32)

  alias PF_NPFMXGetPermHelp = Proc(Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL, Void*, UInt32*, UInt32*, UInt32)

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
  struct NETRESOURCEA
    property dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE
    property dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE
    property dwDisplayType : UInt32
    property dwUsage : UInt32
    property lpLocalName : Win32cr::Foundation::PSTR
    property lpRemoteName : Win32cr::Foundation::PSTR
    property lpComment : Win32cr::Foundation::PSTR
    property lpProvider : Win32cr::Foundation::PSTR
    def initialize(@dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE, @dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE, @dwDisplayType : UInt32, @dwUsage : UInt32, @lpLocalName : Win32cr::Foundation::PSTR, @lpRemoteName : Win32cr::Foundation::PSTR, @lpComment : Win32cr::Foundation::PSTR, @lpProvider : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct NETRESOURCEW
    property dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE
    property dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE
    property dwDisplayType : UInt32
    property dwUsage : UInt32
    property lpLocalName : Win32cr::Foundation::PWSTR
    property lpRemoteName : Win32cr::Foundation::PWSTR
    property lpComment : Win32cr::Foundation::PWSTR
    property lpProvider : Win32cr::Foundation::PWSTR
    def initialize(@dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE, @dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE, @dwDisplayType : UInt32, @dwUsage : UInt32, @lpLocalName : Win32cr::Foundation::PWSTR, @lpRemoteName : Win32cr::Foundation::PWSTR, @lpComment : Win32cr::Foundation::PWSTR, @lpProvider : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct CONNECTDLGSTRUCTA
    property cbStructure : UInt32
    property hwndOwner : Win32cr::Foundation::HWND
    property lpConnRes : Win32cr::NetworkManagement::WNet::NETRESOURCEA*
    property dwFlags : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCT_FLAGS
    property dwDevNum : UInt32
    def initialize(@cbStructure : UInt32, @hwndOwner : Win32cr::Foundation::HWND, @lpConnRes : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, @dwFlags : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCT_FLAGS, @dwDevNum : UInt32)
    end
  end

  @[Extern]
  struct CONNECTDLGSTRUCTW
    property cbStructure : UInt32
    property hwndOwner : Win32cr::Foundation::HWND
    property lpConnRes : Win32cr::NetworkManagement::WNet::NETRESOURCEW*
    property dwFlags : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCT_FLAGS
    property dwDevNum : UInt32
    def initialize(@cbStructure : UInt32, @hwndOwner : Win32cr::Foundation::HWND, @lpConnRes : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, @dwFlags : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCT_FLAGS, @dwDevNum : UInt32)
    end
  end

  @[Extern]
  struct DISCDLGSTRUCTA
    property cbStructure : UInt32
    property hwndOwner : Win32cr::Foundation::HWND
    property lpLocalName : Win32cr::Foundation::PSTR
    property lpRemoteName : Win32cr::Foundation::PSTR
    property dwFlags : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCT_FLAGS
    def initialize(@cbStructure : UInt32, @hwndOwner : Win32cr::Foundation::HWND, @lpLocalName : Win32cr::Foundation::PSTR, @lpRemoteName : Win32cr::Foundation::PSTR, @dwFlags : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCT_FLAGS)
    end
  end

  @[Extern]
  struct DISCDLGSTRUCTW
    property cbStructure : UInt32
    property hwndOwner : Win32cr::Foundation::HWND
    property lpLocalName : Win32cr::Foundation::PWSTR
    property lpRemoteName : Win32cr::Foundation::PWSTR
    property dwFlags : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCT_FLAGS
    def initialize(@cbStructure : UInt32, @hwndOwner : Win32cr::Foundation::HWND, @lpLocalName : Win32cr::Foundation::PWSTR, @lpRemoteName : Win32cr::Foundation::PWSTR, @dwFlags : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCT_FLAGS)
    end
  end

  @[Extern]
  struct UNIVERSAL_NAME_INFOA
    property lpUniversalName : Win32cr::Foundation::PSTR
    def initialize(@lpUniversalName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct UNIVERSAL_NAME_INFOW
    property lpUniversalName : Win32cr::Foundation::PWSTR
    def initialize(@lpUniversalName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct REMOTE_NAME_INFOA
    property lpUniversalName : Win32cr::Foundation::PSTR
    property lpConnectionName : Win32cr::Foundation::PSTR
    property lpRemainingPath : Win32cr::Foundation::PSTR
    def initialize(@lpUniversalName : Win32cr::Foundation::PSTR, @lpConnectionName : Win32cr::Foundation::PSTR, @lpRemainingPath : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct REMOTE_NAME_INFOW
    property lpUniversalName : Win32cr::Foundation::PWSTR
    property lpConnectionName : Win32cr::Foundation::PWSTR
    property lpRemainingPath : Win32cr::Foundation::PWSTR
    def initialize(@lpUniversalName : Win32cr::Foundation::PWSTR, @lpConnectionName : Win32cr::Foundation::PWSTR, @lpRemainingPath : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct NETINFOSTRUCT
    property cbStructure : UInt32
    property dwProviderVersion : UInt32
    property dwStatus : Win32cr::Foundation::WIN32_ERROR
    property dwCharacteristics : Win32cr::NetworkManagement::WNet::NETINFOSTRUCT_CHARACTERISTICS
    property dwHandle : LibC::UIntPtrT
    property wNetType : UInt16
    property dwPrinters : UInt32
    property dwDrives : UInt32
    def initialize(@cbStructure : UInt32, @dwProviderVersion : UInt32, @dwStatus : Win32cr::Foundation::WIN32_ERROR, @dwCharacteristics : Win32cr::NetworkManagement::WNet::NETINFOSTRUCT_CHARACTERISTICS, @dwHandle : LibC::UIntPtrT, @wNetType : UInt16, @dwPrinters : UInt32, @dwDrives : UInt32)
    end
  end

  @[Extern]
  struct NETCONNECTINFOSTRUCT
    property cbStructure : UInt32
    property dwFlags : UInt32
    property dwSpeed : UInt32
    property dwDelay : UInt32
    property dwOptDataSize : UInt32
    def initialize(@cbStructure : UInt32, @dwFlags : UInt32, @dwSpeed : UInt32, @dwDelay : UInt32, @dwOptDataSize : UInt32)
    end
  end

  @[Extern]
  struct NOTIFYINFO
    property dwNotifyStatus : UInt32
    property dwOperationStatus : UInt32
    property lpContext : Void*
    def initialize(@dwNotifyStatus : UInt32, @dwOperationStatus : UInt32, @lpContext : Void*)
    end
  end

  @[Extern]
  struct NOTIFYADD
    property hwndOwner : Win32cr::Foundation::HWND
    property net_resource : Win32cr::NetworkManagement::WNet::NETRESOURCEA
    property dwAddFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS
    def initialize(@hwndOwner : Win32cr::Foundation::HWND, @net_resource : Win32cr::NetworkManagement::WNet::NETRESOURCEA, @dwAddFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS)
    end
  end

  @[Extern]
  struct NOTIFYCANCEL
    property lpName : Win32cr::Foundation::PWSTR
    property lpProvider : Win32cr::Foundation::PWSTR
    property dwFlags : UInt32
    property fForce : Win32cr::Foundation::BOOL
    def initialize(@lpName : Win32cr::Foundation::PWSTR, @lpProvider : Win32cr::Foundation::PWSTR, @dwFlags : UInt32, @fForce : Win32cr::Foundation::BOOL)
    end
  end

  def wNetAddConnectionA(lpRemoteName : Win32cr::Foundation::PSTR, lpPassword : Win32cr::Foundation::PSTR, lpLocalName : Win32cr::Foundation::PSTR) : UInt32
    C.WNetAddConnectionA(lpRemoteName, lpPassword, lpLocalName)
  end

  def wNetAddConnectionW(lpRemoteName : Win32cr::Foundation::PWSTR, lpPassword : Win32cr::Foundation::PWSTR, lpLocalName : Win32cr::Foundation::PWSTR) : UInt32
    C.WNetAddConnectionW(lpRemoteName, lpPassword, lpLocalName)
  end

  def wNetAddConnection2A(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpPassword : Win32cr::Foundation::PSTR, lpUserName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : UInt32
    C.WNetAddConnection2A(lpNetResource, lpPassword, lpUserName, dwFlags)
  end

  def wNetAddConnection2W(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : UInt32
    C.WNetAddConnection2W(lpNetResource, lpPassword, lpUserName, dwFlags)
  end

  def wNetAddConnection3A(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpPassword : Win32cr::Foundation::PSTR, lpUserName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : UInt32
    C.WNetAddConnection3A(hwndOwner, lpNetResource, lpPassword, lpUserName, dwFlags)
  end

  def wNetAddConnection3W(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : UInt32
    C.WNetAddConnection3W(hwndOwner, lpNetResource, lpPassword, lpUserName, dwFlags)
  end

  def wNetAddConnection4A(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32) : UInt32
    C.WNetAddConnection4A(hwndOwner, lpNetResource, pAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions)
  end

  def wNetAddConnection4W(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32) : UInt32
    C.WNetAddConnection4W(hwndOwner, lpNetResource, pAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions)
  end

  def wNetCancelConnectionA(lpName : Win32cr::Foundation::PSTR, fForce : Win32cr::Foundation::BOOL) : UInt32
    C.WNetCancelConnectionA(lpName, fForce)
  end

  def wNetCancelConnectionW(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL) : UInt32
    C.WNetCancelConnectionW(lpName, fForce)
  end

  def wNetCancelConnection2A(lpName : Win32cr::Foundation::PSTR, dwFlags : UInt32, fForce : Win32cr::Foundation::BOOL) : UInt32
    C.WNetCancelConnection2A(lpName, dwFlags, fForce)
  end

  def wNetCancelConnection2W(lpName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, fForce : Win32cr::Foundation::BOOL) : UInt32
    C.WNetCancelConnection2W(lpName, dwFlags, fForce)
  end

  def wNetGetConnectionA(lpLocalName : Win32cr::Foundation::PSTR, lpRemoteName : UInt8*, lpnLength : UInt32*) : UInt32
    C.WNetGetConnectionA(lpLocalName, lpRemoteName, lpnLength)
  end

  def wNetGetConnectionW(lpLocalName : Win32cr::Foundation::PWSTR, lpRemoteName : UInt16*, lpnLength : UInt32*) : UInt32
    C.WNetGetConnectionW(lpLocalName, lpRemoteName, lpnLength)
  end

  def wNetUseConnectionA(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpPassword : Win32cr::Foundation::PSTR, lpUserId : Win32cr::Foundation::PSTR, dwFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS, lpAccessName : UInt8*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32
    C.WNetUseConnectionA(hwndOwner, lpNetResource, lpPassword, lpUserId, dwFlags, lpAccessName, lpBufferSize, lpResult)
  end

  def wNetUseConnectionW(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserId : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS, lpAccessName : UInt16*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32
    C.WNetUseConnectionW(hwndOwner, lpNetResource, lpPassword, lpUserId, dwFlags, lpAccessName, lpBufferSize, lpResult)
  end

  def wNetUseConnection4A(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32, lpAccessName : UInt8*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32
    C.WNetUseConnection4A(hwndOwner, lpNetResource, pAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions, lpAccessName, lpBufferSize, lpResult)
  end

  def wNetUseConnection4W(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32, lpAccessName : UInt16*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32
    C.WNetUseConnection4W(hwndOwner, lpNetResource, pAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions, lpAccessName, lpBufferSize, lpResult)
  end

  def wNetConnectionDialog(hwnd : Win32cr::Foundation::HWND, dwType : UInt32) : UInt32
    C.WNetConnectionDialog(hwnd, dwType)
  end

  def wNetDisconnectDialog(hwnd : Win32cr::Foundation::HWND, dwType : UInt32) : UInt32
    C.WNetDisconnectDialog(hwnd, dwType)
  end

  def wNetConnectionDialog1A(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCTA*) : UInt32
    C.WNetConnectionDialog1A(lpConnDlgStruct)
  end

  def wNetConnectionDialog1W(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCTW*) : UInt32
    C.WNetConnectionDialog1W(lpConnDlgStruct)
  end

  def wNetDisconnectDialog1A(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCTA*) : UInt32
    C.WNetDisconnectDialog1A(lpConnDlgStruct)
  end

  def wNetDisconnectDialog1W(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCTW*) : UInt32
    C.WNetDisconnectDialog1W(lpConnDlgStruct)
  end

  def wNetOpenEnumA(dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE, dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE, dwUsage : Win32cr::NetworkManagement::WNet::WNET_OPEN_ENUM_USAGE, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lphEnum : Win32cr::NetworkManagement::WNet::NetEnumHandle*) : UInt32
    C.WNetOpenEnumA(dwScope, dwType, dwUsage, lpNetResource, lphEnum)
  end

  def wNetOpenEnumW(dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE, dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE, dwUsage : Win32cr::NetworkManagement::WNet::WNET_OPEN_ENUM_USAGE, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lphEnum : Win32cr::NetworkManagement::WNet::NetEnumHandle*) : UInt32
    C.WNetOpenEnumW(dwScope, dwType, dwUsage, lpNetResource, lphEnum)
  end

  def wNetEnumResourceA(hEnum : Win32cr::Foundation::HANDLE, lpcCount : UInt32*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32
    C.WNetEnumResourceA(hEnum, lpcCount, lpBuffer, lpBufferSize)
  end

  def wNetEnumResourceW(hEnum : Win32cr::Foundation::HANDLE, lpcCount : UInt32*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32
    C.WNetEnumResourceW(hEnum, lpcCount, lpBuffer, lpBufferSize)
  end

  def wNetCloseEnum(hEnum : Win32cr::Foundation::HANDLE) : UInt32
    C.WNetCloseEnum(hEnum)
  end

  def wNetGetResourceParentA(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpBuffer : Void*, lpcbBuffer : UInt32*) : UInt32
    C.WNetGetResourceParentA(lpNetResource, lpBuffer, lpcbBuffer)
  end

  def wNetGetResourceParentW(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpcbBuffer : UInt32*) : UInt32
    C.WNetGetResourceParentW(lpNetResource, lpBuffer, lpcbBuffer)
  end

  def wNetGetResourceInformationA(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpBuffer : Void*, lpcbBuffer : UInt32*, lplpSystem : Win32cr::Foundation::PSTR*) : UInt32
    C.WNetGetResourceInformationA(lpNetResource, lpBuffer, lpcbBuffer, lplpSystem)
  end

  def wNetGetResourceInformationW(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpcbBuffer : UInt32*, lplpSystem : Win32cr::Foundation::PWSTR*) : UInt32
    C.WNetGetResourceInformationW(lpNetResource, lpBuffer, lpcbBuffer, lplpSystem)
  end

  def wNetGetUniversalNameA(lpLocalPath : Win32cr::Foundation::PSTR, dwInfoLevel : Win32cr::NetworkManagement::WNet::UNC_INFO_LEVEL, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32
    C.WNetGetUniversalNameA(lpLocalPath, dwInfoLevel, lpBuffer, lpBufferSize)
  end

  def wNetGetUniversalNameW(lpLocalPath : Win32cr::Foundation::PWSTR, dwInfoLevel : Win32cr::NetworkManagement::WNet::UNC_INFO_LEVEL, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32
    C.WNetGetUniversalNameW(lpLocalPath, dwInfoLevel, lpBuffer, lpBufferSize)
  end

  def wNetGetUserA(lpName : Win32cr::Foundation::PSTR, lpUserName : UInt8*, lpnLength : UInt32*) : UInt32
    C.WNetGetUserA(lpName, lpUserName, lpnLength)
  end

  def wNetGetUserW(lpName : Win32cr::Foundation::PWSTR, lpUserName : UInt16*, lpnLength : UInt32*) : UInt32
    C.WNetGetUserW(lpName, lpUserName, lpnLength)
  end

  def wNetGetProviderNameA(dwNetType : UInt32, lpProviderName : UInt8*, lpBufferSize : UInt32*) : UInt32
    C.WNetGetProviderNameA(dwNetType, lpProviderName, lpBufferSize)
  end

  def wNetGetProviderNameW(dwNetType : UInt32, lpProviderName : UInt16*, lpBufferSize : UInt32*) : UInt32
    C.WNetGetProviderNameW(dwNetType, lpProviderName, lpBufferSize)
  end

  def wNetGetNetworkInformationA(lpProvider : Win32cr::Foundation::PSTR, lpNetInfoStruct : Win32cr::NetworkManagement::WNet::NETINFOSTRUCT*) : UInt32
    C.WNetGetNetworkInformationA(lpProvider, lpNetInfoStruct)
  end

  def wNetGetNetworkInformationW(lpProvider : Win32cr::Foundation::PWSTR, lpNetInfoStruct : Win32cr::NetworkManagement::WNet::NETINFOSTRUCT*) : UInt32
    C.WNetGetNetworkInformationW(lpProvider, lpNetInfoStruct)
  end

  def wNetGetLastErrorA(lpError : UInt32*, lpErrorBuf : UInt8*, nErrorBufSize : UInt32, lpNameBuf : UInt8*, nNameBufSize : UInt32) : UInt32
    C.WNetGetLastErrorA(lpError, lpErrorBuf, nErrorBufSize, lpNameBuf, nNameBufSize)
  end

  def wNetGetLastErrorW(lpError : UInt32*, lpErrorBuf : UInt16*, nErrorBufSize : UInt32, lpNameBuf : UInt16*, nNameBufSize : UInt32) : UInt32
    C.WNetGetLastErrorW(lpError, lpErrorBuf, nErrorBufSize, lpNameBuf, nNameBufSize)
  end

  def multinetGetConnectionPerformanceA(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpNetConnectInfoStruct : Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*) : UInt32
    C.MultinetGetConnectionPerformanceA(lpNetResource, lpNetConnectInfoStruct)
  end

  def multinetGetConnectionPerformanceW(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpNetConnectInfoStruct : Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*) : UInt32
    C.MultinetGetConnectionPerformanceW(lpNetResource, lpNetConnectInfoStruct)
  end

  def nPAddConnection(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR) : UInt32
    C.NPAddConnection(lpNetResource, lpPassword, lpUserName)
  end

  def nPAddConnection3(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS) : UInt32
    C.NPAddConnection3(hwndOwner, lpNetResource, lpPassword, lpUserName, dwFlags)
  end

  def nPAddConnection4(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32) : UInt32
    C.NPAddConnection4(hwndOwner, lpNetResource, lpAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions)
  end

  def nPCancelConnection(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL) : UInt32
    C.NPCancelConnection(lpName, fForce)
  end

  def nPCancelConnection2(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL, dwFlags : UInt32) : UInt32
    C.NPCancelConnection2(lpName, fForce, dwFlags)
  end

  def nPGetConnection(lpLocalName : Win32cr::Foundation::PWSTR, lpRemoteName : UInt16*, lpnBufferLen : UInt32*) : UInt32
    C.NPGetConnection(lpLocalName, lpRemoteName, lpnBufferLen)
  end

  def nPGetConnection3(lpLocalName : Win32cr::Foundation::PWSTR, dwLevel : UInt32, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32
    C.NPGetConnection3(lpLocalName, dwLevel, lpBuffer, lpBufferSize)
  end

  def nPGetUniversalName(lpLocalPath : Win32cr::Foundation::PWSTR, dwInfoLevel : Win32cr::NetworkManagement::WNet::UNC_INFO_LEVEL, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32
    C.NPGetUniversalName(lpLocalPath, dwInfoLevel, lpBuffer, lpBufferSize)
  end

  def nPGetConnectionPerformance(lpRemoteName : Win32cr::Foundation::PWSTR, lpNetConnectInfo : Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*) : UInt32
    C.NPGetConnectionPerformance(lpRemoteName, lpNetConnectInfo)
  end

  def nPOpenEnum(dwScope : UInt32, dwType : UInt32, dwUsage : UInt32, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lphEnum : Win32cr::Foundation::HANDLE*) : UInt32
    C.NPOpenEnum(dwScope, dwType, dwUsage, lpNetResource, lphEnum)
  end

  def nPEnumResource(hEnum : Win32cr::Foundation::HANDLE, lpcCount : UInt32*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32
    C.NPEnumResource(hEnum, lpcCount, lpBuffer, lpBufferSize)
  end

  def nPCloseEnum(hEnum : Win32cr::Foundation::HANDLE) : UInt32
    C.NPCloseEnum(hEnum)
  end

  def nPGetCaps(ndex : UInt32) : UInt32
    C.NPGetCaps(ndex)
  end

  def nPGetUser(lpName : Win32cr::Foundation::PWSTR, lpUserName : UInt16*, lpnBufferLen : UInt32*) : UInt32
    C.NPGetUser(lpName, lpUserName, lpnBufferLen)
  end

  def nPGetPersistentUseOptionsForConnection(lpRemotePath : Win32cr::Foundation::PWSTR, lpReadUseOptions : UInt8*, cbReadUseOptions : UInt32, lpWriteUseOptions : UInt8*, lpSizeWriteUseOptions : UInt32*) : UInt32
    C.NPGetPersistentUseOptionsForConnection(lpRemotePath, lpReadUseOptions, cbReadUseOptions, lpWriteUseOptions, lpSizeWriteUseOptions)
  end

  def nPGetResourceParent(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32
    C.NPGetResourceParent(lpNetResource, lpBuffer, lpBufferSize)
  end

  def nPGetResourceInformation(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpBufferSize : UInt32*, lplpSystem : Win32cr::Foundation::PWSTR*) : UInt32
    C.NPGetResourceInformation(lpNetResource, lpBuffer, lpBufferSize, lplpSystem)
  end

  def nPFormatNetworkName(lpRemoteName : Win32cr::Foundation::PWSTR, lpFormattedName : UInt16*, lpnLength : UInt32*, dwFlags : Win32cr::NetworkManagement::WNet::NETWORK_NAME_FORMAT_FLAGS, dwAveCharPerLine : UInt32) : UInt32
    C.NPFormatNetworkName(lpRemoteName, lpFormattedName, lpnLength, dwFlags, dwAveCharPerLine)
  end

  def wNetSetLastErrorA(err : UInt32, lpError : Win32cr::Foundation::PSTR, lpProviders : Win32cr::Foundation::PSTR) : Void
    C.WNetSetLastErrorA(err, lpError, lpProviders)
  end

  def wNetSetLastErrorW(err : UInt32, lpError : Win32cr::Foundation::PWSTR, lpProviders : Win32cr::Foundation::PWSTR) : Void
    C.WNetSetLastErrorW(err, lpError, lpProviders)
  end

  @[Link("mpr")]
  @[Link("davclnt")]
  @[Link("ntlanman")]
  lib C
    # :nodoc:
    fun WNetAddConnectionA(lpRemoteName : Win32cr::Foundation::PSTR, lpPassword : Win32cr::Foundation::PSTR, lpLocalName : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun WNetAddConnectionW(lpRemoteName : Win32cr::Foundation::PWSTR, lpPassword : Win32cr::Foundation::PWSTR, lpLocalName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun WNetAddConnection2A(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpPassword : Win32cr::Foundation::PSTR, lpUserName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : UInt32

    # :nodoc:
    fun WNetAddConnection2W(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : UInt32

    # :nodoc:
    fun WNetAddConnection3A(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpPassword : Win32cr::Foundation::PSTR, lpUserName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : UInt32

    # :nodoc:
    fun WNetAddConnection3W(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : UInt32

    # :nodoc:
    fun WNetAddConnection4A(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32) : UInt32

    # :nodoc:
    fun WNetAddConnection4W(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32) : UInt32

    # :nodoc:
    fun WNetCancelConnectionA(lpName : Win32cr::Foundation::PSTR, fForce : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun WNetCancelConnectionW(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun WNetCancelConnection2A(lpName : Win32cr::Foundation::PSTR, dwFlags : UInt32, fForce : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun WNetCancelConnection2W(lpName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, fForce : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun WNetGetConnectionA(lpLocalName : Win32cr::Foundation::PSTR, lpRemoteName : UInt8*, lpnLength : UInt32*) : UInt32

    # :nodoc:
    fun WNetGetConnectionW(lpLocalName : Win32cr::Foundation::PWSTR, lpRemoteName : UInt16*, lpnLength : UInt32*) : UInt32

    # :nodoc:
    fun WNetUseConnectionA(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpPassword : Win32cr::Foundation::PSTR, lpUserId : Win32cr::Foundation::PSTR, dwFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS, lpAccessName : UInt8*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32

    # :nodoc:
    fun WNetUseConnectionW(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserId : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS, lpAccessName : UInt16*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32

    # :nodoc:
    fun WNetUseConnection4A(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32, lpAccessName : UInt8*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32

    # :nodoc:
    fun WNetUseConnection4W(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, pAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32, lpAccessName : UInt16*, lpBufferSize : UInt32*, lpResult : UInt32*) : UInt32

    # :nodoc:
    fun WNetConnectionDialog(hwnd : Win32cr::Foundation::HWND, dwType : UInt32) : UInt32

    # :nodoc:
    fun WNetDisconnectDialog(hwnd : Win32cr::Foundation::HWND, dwType : UInt32) : UInt32

    # :nodoc:
    fun WNetConnectionDialog1A(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCTA*) : UInt32

    # :nodoc:
    fun WNetConnectionDialog1W(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::CONNECTDLGSTRUCTW*) : UInt32

    # :nodoc:
    fun WNetDisconnectDialog1A(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCTA*) : UInt32

    # :nodoc:
    fun WNetDisconnectDialog1W(lpConnDlgStruct : Win32cr::NetworkManagement::WNet::DISCDLGSTRUCTW*) : UInt32

    # :nodoc:
    fun WNetOpenEnumA(dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE, dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE, dwUsage : Win32cr::NetworkManagement::WNet::WNET_OPEN_ENUM_USAGE, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lphEnum : Win32cr::NetworkManagement::WNet::NetEnumHandle*) : UInt32

    # :nodoc:
    fun WNetOpenEnumW(dwScope : Win32cr::NetworkManagement::WNet::NET_RESOURCE_SCOPE, dwType : Win32cr::NetworkManagement::WNet::NET_RESOURCE_TYPE, dwUsage : Win32cr::NetworkManagement::WNet::WNET_OPEN_ENUM_USAGE, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lphEnum : Win32cr::NetworkManagement::WNet::NetEnumHandle*) : UInt32

    # :nodoc:
    fun WNetEnumResourceA(hEnum : Win32cr::Foundation::HANDLE, lpcCount : UInt32*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun WNetEnumResourceW(hEnum : Win32cr::Foundation::HANDLE, lpcCount : UInt32*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun WNetCloseEnum(hEnum : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun WNetGetResourceParentA(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpBuffer : Void*, lpcbBuffer : UInt32*) : UInt32

    # :nodoc:
    fun WNetGetResourceParentW(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpcbBuffer : UInt32*) : UInt32

    # :nodoc:
    fun WNetGetResourceInformationA(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpBuffer : Void*, lpcbBuffer : UInt32*, lplpSystem : Win32cr::Foundation::PSTR*) : UInt32

    # :nodoc:
    fun WNetGetResourceInformationW(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpcbBuffer : UInt32*, lplpSystem : Win32cr::Foundation::PWSTR*) : UInt32

    # :nodoc:
    fun WNetGetUniversalNameA(lpLocalPath : Win32cr::Foundation::PSTR, dwInfoLevel : Win32cr::NetworkManagement::WNet::UNC_INFO_LEVEL, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun WNetGetUniversalNameW(lpLocalPath : Win32cr::Foundation::PWSTR, dwInfoLevel : Win32cr::NetworkManagement::WNet::UNC_INFO_LEVEL, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun WNetGetUserA(lpName : Win32cr::Foundation::PSTR, lpUserName : UInt8*, lpnLength : UInt32*) : UInt32

    # :nodoc:
    fun WNetGetUserW(lpName : Win32cr::Foundation::PWSTR, lpUserName : UInt16*, lpnLength : UInt32*) : UInt32

    # :nodoc:
    fun WNetGetProviderNameA(dwNetType : UInt32, lpProviderName : UInt8*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun WNetGetProviderNameW(dwNetType : UInt32, lpProviderName : UInt16*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun WNetGetNetworkInformationA(lpProvider : Win32cr::Foundation::PSTR, lpNetInfoStruct : Win32cr::NetworkManagement::WNet::NETINFOSTRUCT*) : UInt32

    # :nodoc:
    fun WNetGetNetworkInformationW(lpProvider : Win32cr::Foundation::PWSTR, lpNetInfoStruct : Win32cr::NetworkManagement::WNet::NETINFOSTRUCT*) : UInt32

    # :nodoc:
    fun WNetGetLastErrorA(lpError : UInt32*, lpErrorBuf : UInt8*, nErrorBufSize : UInt32, lpNameBuf : UInt8*, nNameBufSize : UInt32) : UInt32

    # :nodoc:
    fun WNetGetLastErrorW(lpError : UInt32*, lpErrorBuf : UInt16*, nErrorBufSize : UInt32, lpNameBuf : UInt16*, nNameBufSize : UInt32) : UInt32

    # :nodoc:
    fun MultinetGetConnectionPerformanceA(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEA*, lpNetConnectInfoStruct : Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*) : UInt32

    # :nodoc:
    fun MultinetGetConnectionPerformanceW(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpNetConnectInfoStruct : Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*) : UInt32

    # :nodoc:
    fun NPAddConnection(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun NPAddConnection3(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpPassword : Win32cr::Foundation::PWSTR, lpUserName : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::NetworkManagement::WNet::NET_USE_CONNECT_FLAGS) : UInt32

    # :nodoc:
    fun NPAddConnection4(hwndOwner : Win32cr::Foundation::HWND, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpAuthBuffer : Void*, cbAuthBuffer : UInt32, dwFlags : UInt32, lpUseOptions : UInt8*, cbUseOptions : UInt32) : UInt32

    # :nodoc:
    fun NPCancelConnection(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun NPCancelConnection2(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL, dwFlags : UInt32) : UInt32

    # :nodoc:
    fun NPGetConnection(lpLocalName : Win32cr::Foundation::PWSTR, lpRemoteName : UInt16*, lpnBufferLen : UInt32*) : UInt32

    # :nodoc:
    fun NPGetConnection3(lpLocalName : Win32cr::Foundation::PWSTR, dwLevel : UInt32, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun NPGetUniversalName(lpLocalPath : Win32cr::Foundation::PWSTR, dwInfoLevel : Win32cr::NetworkManagement::WNet::UNC_INFO_LEVEL, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun NPGetConnectionPerformance(lpRemoteName : Win32cr::Foundation::PWSTR, lpNetConnectInfo : Win32cr::NetworkManagement::WNet::NETCONNECTINFOSTRUCT*) : UInt32

    # :nodoc:
    fun NPOpenEnum(dwScope : UInt32, dwType : UInt32, dwUsage : UInt32, lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lphEnum : Win32cr::Foundation::HANDLE*) : UInt32

    # :nodoc:
    fun NPEnumResource(hEnum : Win32cr::Foundation::HANDLE, lpcCount : UInt32*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun NPCloseEnum(hEnum : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun NPGetCaps(ndex : UInt32) : UInt32

    # :nodoc:
    fun NPGetUser(lpName : Win32cr::Foundation::PWSTR, lpUserName : UInt16*, lpnBufferLen : UInt32*) : UInt32

    # :nodoc:
    fun NPGetPersistentUseOptionsForConnection(lpRemotePath : Win32cr::Foundation::PWSTR, lpReadUseOptions : UInt8*, cbReadUseOptions : UInt32, lpWriteUseOptions : UInt8*, lpSizeWriteUseOptions : UInt32*) : UInt32

    # :nodoc:
    fun NPGetResourceParent(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun NPGetResourceInformation(lpNetResource : Win32cr::NetworkManagement::WNet::NETRESOURCEW*, lpBuffer : Void*, lpBufferSize : UInt32*, lplpSystem : Win32cr::Foundation::PWSTR*) : UInt32

    # :nodoc:
    fun NPFormatNetworkName(lpRemoteName : Win32cr::Foundation::PWSTR, lpFormattedName : UInt16*, lpnLength : UInt32*, dwFlags : Win32cr::NetworkManagement::WNet::NETWORK_NAME_FORMAT_FLAGS, dwAveCharPerLine : UInt32) : UInt32

    # :nodoc:
    fun WNetSetLastErrorA(err : UInt32, lpError : Win32cr::Foundation::PSTR, lpProviders : Win32cr::Foundation::PSTR) : Void

    # :nodoc:
    fun WNetSetLastErrorW(err : UInt32, lpError : Win32cr::Foundation::PWSTR, lpProviders : Win32cr::Foundation::PWSTR) : Void

  end
end