require "./../foundation.cr"

module Win32cr::NetworkManagement::NetShell
  alias PGET_RESOURCE_STRING_FN = Proc(UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32)

  alias PNS_CONTEXT_COMMIT_FN = Proc(UInt32, UInt32)

  alias PNS_CONTEXT_CONNECT_FN = Proc(Win32cr::Foundation::PWSTR, UInt32)

  alias PNS_CONTEXT_DUMP_FN = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Void*, UInt32)

  alias PNS_DLL_STOP_FN = Proc(UInt32, UInt32)

  alias PNS_HELPER_START_FN = Proc(LibC::GUID*, UInt32, UInt32)

  alias PNS_HELPER_STOP_FN = Proc(UInt32, UInt32)

  alias PFN_HANDLE_CMD = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, UInt32, UInt32, Void*, Win32cr::Foundation::BOOL*, UInt32)

  alias PNS_OSVERSIONCHECK = Proc(UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::BOOL)

  alias PNS_DLL_INIT_FN = Proc(UInt32, Void*, UInt32)

  NETSH_ERROR_BASE = 15000_u32
  ERROR_NO_ENTRIES = 15000_u32
  ERROR_INVALID_SYNTAX = 15001_u32
  ERROR_PROTOCOL_NOT_IN_TRANSPORT = 15002_u32
  ERROR_NO_CHANGE = 15003_u32
  ERROR_CMD_NOT_FOUND = 15004_u32
  ERROR_ENTRY_PT_NOT_FOUND = 15005_u32
  ERROR_DLL_LOAD_FAILED = 15006_u32
  ERROR_INIT_DISPLAY = 15007_u32
  ERROR_TAG_ALREADY_PRESENT = 15008_u32
  ERROR_INVALID_OPTION_TAG = 15009_u32
  ERROR_NO_TAG = 15010_u32
  ERROR_MISSING_OPTION = 15011_u32
  ERROR_TRANSPORT_NOT_PRESENT = 15012_u32
  ERROR_SHOW_USAGE = 15013_u32
  ERROR_INVALID_OPTION_VALUE = 15014_u32
  ERROR_OKAY = 15015_u32
  ERROR_CONTINUE_IN_PARENT_CONTEXT = 15016_u32
  ERROR_SUPPRESS_OUTPUT = 15017_u32
  ERROR_HELPER_ALREADY_REGISTERED = 15018_u32
  ERROR_CONTEXT_ALREADY_REGISTERED = 15019_u32
  ERROR_PARSING_FAILURE = 15020_u32
  NETSH_ERROR_END = 15019_u32
  NS_GET_EVENT_IDS_FN_NAME = "GetEventIds"
  MAX_NAME_LEN = 48_u32
  NETSH_VERSION_50 = 20480_u32
  NETSH_ARG_DELIMITER = "="
  NETSH_CMD_DELIMITER = " "
  NETSH_MAX_TOKEN_LENGTH = 64_u32
  NETSH_MAX_CMD_TOKEN_LENGTH = 128_u32
  DEFAULT_CONTEXT_PRIORITY = 100_u32
  GET_RESOURCE_STRING_FN_NAME = "GetResourceString"

  enum NS_CMD_FLAGS
    CMD_FLAG_PRIVATE = 1_i32
    CMD_FLAG_INTERACTIVE = 2_i32
    CMD_FLAG_LOCAL = 8_i32
    CMD_FLAG_ONLINE = 16_i32
    CMD_FLAG_HIDDEN = 32_i32
    CMD_FLAG_LIMIT_MASK = 65535_i32
    CMD_FLAG_PRIORITY = -2147483648_i32
  end
  enum NS_REQS
    NS_REQ_ZERO = 0_i32
    NS_REQ_PRESENT = 1_i32
    NS_REQ_ALLOW_MULTIPLE = 2_i32
    NS_REQ_ONE_OR_MORE = 3_i32
  end
  enum NS_EVENTS
    NS_EVENT_LOOP = 65536_i32
    NS_EVENT_LAST_N = 1_i32
    NS_EVENT_LAST_SECS = 2_i32
    NS_EVENT_FROM_N = 4_i32
    NS_EVENT_FROM_START = 8_i32
  end
  enum NS_MODE_CHANGE
    NETSH_COMMIT = 0_i32
    NETSH_UNCOMMIT = 1_i32
    NETSH_FLUSH = 2_i32
    NETSH_COMMIT_STATE = 3_i32
    NETSH_SAVE = 4_i32
  end

  @[Extern]
  struct TOKEN_VALUE
    property pwszToken : Win32cr::Foundation::PWSTR
    property dwValue : UInt32
    def initialize(@pwszToken : Win32cr::Foundation::PWSTR, @dwValue : UInt32)
    end
  end

  @[Extern]
  struct NS_HELPER_ATTRIBUTES
    property anonymous : Anonymous_e__Union_
    property guidHelper : LibC::GUID
    property pfnStart : Win32cr::NetworkManagement::NetShell::PNS_HELPER_START_FN
    property pfnStop : Win32cr::NetworkManagement::NetShell::PNS_HELPER_STOP_FN

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property _ull_align : UInt64

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property dwVersion : UInt32
    property dwReserved : UInt32
    def initialize(@dwVersion : UInt32, @dwReserved : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @_ull_align : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @guidHelper : LibC::GUID, @pfnStart : Win32cr::NetworkManagement::NetShell::PNS_HELPER_START_FN, @pfnStop : Win32cr::NetworkManagement::NetShell::PNS_HELPER_STOP_FN)
    end
  end

  @[Extern]
  struct CMD_ENTRY
    property pwszCmdToken : Win32cr::Foundation::PWSTR
    property pfnCmdHandler : Win32cr::NetworkManagement::NetShell::PFN_HANDLE_CMD
    property dwShortCmdHelpToken : UInt32
    property dwCmdHlpToken : UInt32
    property dwFlags : UInt32
    property pOsVersionCheck : Win32cr::NetworkManagement::NetShell::PNS_OSVERSIONCHECK
    def initialize(@pwszCmdToken : Win32cr::Foundation::PWSTR, @pfnCmdHandler : Win32cr::NetworkManagement::NetShell::PFN_HANDLE_CMD, @dwShortCmdHelpToken : UInt32, @dwCmdHlpToken : UInt32, @dwFlags : UInt32, @pOsVersionCheck : Win32cr::NetworkManagement::NetShell::PNS_OSVERSIONCHECK)
    end
  end

  @[Extern]
  struct CMD_GROUP_ENTRY
    property pwszCmdGroupToken : Win32cr::Foundation::PWSTR
    property dwShortCmdHelpToken : UInt32
    property ulCmdGroupSize : UInt32
    property dwFlags : UInt32
    property pCmdGroup : Win32cr::NetworkManagement::NetShell::CMD_ENTRY*
    property pOsVersionCheck : Win32cr::NetworkManagement::NetShell::PNS_OSVERSIONCHECK
    def initialize(@pwszCmdGroupToken : Win32cr::Foundation::PWSTR, @dwShortCmdHelpToken : UInt32, @ulCmdGroupSize : UInt32, @dwFlags : UInt32, @pCmdGroup : Win32cr::NetworkManagement::NetShell::CMD_ENTRY*, @pOsVersionCheck : Win32cr::NetworkManagement::NetShell::PNS_OSVERSIONCHECK)
    end
  end

  @[Extern]
  struct NS_CONTEXT_ATTRIBUTES
    property anonymous : Anonymous_e__Union_
    property pwszContext : Win32cr::Foundation::PWSTR
    property guidHelper : LibC::GUID
    property dwFlags : UInt32
    property ulPriority : UInt32
    property ulNumTopCmds : UInt32
    property pTopCmds : Win32cr::NetworkManagement::NetShell::CMD_ENTRY*
    property ulNumGroups : UInt32
    property pCmdGroups : Win32cr::NetworkManagement::NetShell::CMD_GROUP_ENTRY*
    property pfnCommitFn : Win32cr::NetworkManagement::NetShell::PNS_CONTEXT_COMMIT_FN
    property pfnDumpFn : Win32cr::NetworkManagement::NetShell::PNS_CONTEXT_DUMP_FN
    property pfnConnectFn : Win32cr::NetworkManagement::NetShell::PNS_CONTEXT_CONNECT_FN
    property pReserved : Void*
    property pfnOsVersionCheck : Win32cr::NetworkManagement::NetShell::PNS_OSVERSIONCHECK

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property _ull_align : UInt64

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property dwVersion : UInt32
    property dwReserved : UInt32
    def initialize(@dwVersion : UInt32, @dwReserved : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @_ull_align : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @pwszContext : Win32cr::Foundation::PWSTR, @guidHelper : LibC::GUID, @dwFlags : UInt32, @ulPriority : UInt32, @ulNumTopCmds : UInt32, @pTopCmds : Win32cr::NetworkManagement::NetShell::CMD_ENTRY*, @ulNumGroups : UInt32, @pCmdGroups : Win32cr::NetworkManagement::NetShell::CMD_GROUP_ENTRY*, @pfnCommitFn : Win32cr::NetworkManagement::NetShell::PNS_CONTEXT_COMMIT_FN, @pfnDumpFn : Win32cr::NetworkManagement::NetShell::PNS_CONTEXT_DUMP_FN, @pfnConnectFn : Win32cr::NetworkManagement::NetShell::PNS_CONTEXT_CONNECT_FN, @pReserved : Void*, @pfnOsVersionCheck : Win32cr::NetworkManagement::NetShell::PNS_OSVERSIONCHECK)
    end
  end

  @[Extern]
  struct TAG_TYPE
    property pwszTag : Win32cr::Foundation::PWSTR
    property dwRequired : UInt32
    property bPresent : Win32cr::Foundation::BOOL
    def initialize(@pwszTag : Win32cr::Foundation::PWSTR, @dwRequired : UInt32, @bPresent : Win32cr::Foundation::BOOL)
    end
  end

  @[Link("netsh")]
  lib C
    fun MatchEnumTag(hModule : Win32cr::Foundation::HANDLE, pwcArg : Win32cr::Foundation::PWSTR, dwNumArg : UInt32, pEnumTable : Win32cr::NetworkManagement::NetShell::TOKEN_VALUE*, pdwValue : UInt32*) : UInt32

    fun MatchToken(pwszUserToken : Win32cr::Foundation::PWSTR, pwszCmdToken : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun PreprocessCommand(hModule : Win32cr::Foundation::HANDLE, ppwcArguments : Win32cr::Foundation::PWSTR*, dwCurrentIndex : UInt32, dwArgCount : UInt32, pttTags : Win32cr::NetworkManagement::NetShell::TAG_TYPE*, dwTagCount : UInt32, dwMinArgs : UInt32, dwMaxArgs : UInt32, pdwTagType : UInt32*) : UInt32

    fun PrintError(hModule : Win32cr::Foundation::HANDLE, dwErrId : UInt32) : UInt32

    fun PrintMessageFromModule(hModule : Win32cr::Foundation::HANDLE, dwMsgId : UInt32) : UInt32

    fun PrintMessage(pwszFormat : Win32cr::Foundation::PWSTR) : UInt32

    fun RegisterContext(pChildContext : Win32cr::NetworkManagement::NetShell::NS_CONTEXT_ATTRIBUTES*) : UInt32

    fun RegisterHelper(pguidParentContext : LibC::GUID*, pfnRegisterSubContext : Win32cr::NetworkManagement::NetShell::NS_HELPER_ATTRIBUTES*) : UInt32

  end
end