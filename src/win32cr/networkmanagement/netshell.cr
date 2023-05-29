require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:netsh.dll")]
lib LibWin32
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
  MAX_NAME_LEN = 48_u32
  NETSH_VERSION_50 = 20480_u32
  NETSH_MAX_TOKEN_LENGTH = 64_u32
  NETSH_MAX_CMD_TOKEN_LENGTH = 128_u32
  DEFAULT_CONTEXT_PRIORITY = 100_u32

  alias PGET_RESOURCE_STRING_FN = Proc(UInt32, LibC::LPWSTR, UInt32, UInt32)
  alias PNS_CONTEXT_COMMIT_FN = Proc(UInt32, UInt32)
  alias PNS_CONTEXT_CONNECT_FN = Proc(LibC::LPWSTR, UInt32)
  alias PNS_CONTEXT_DUMP_FN = Proc(LibC::LPWSTR, LibC::LPWSTR*, UInt32, Void*, UInt32)
  alias PNS_DLL_STOP_FN = Proc(UInt32, UInt32)
  alias PNS_HELPER_START_FN = Proc(Guid*, UInt32, UInt32)
  alias PNS_HELPER_STOP_FN = Proc(UInt32, UInt32)
  alias PFN_HANDLE_CMD = Proc(LibC::LPWSTR, LibC::LPWSTR*, UInt32, UInt32, UInt32, Void*, LibC::BOOL*, UInt32)
  alias PNS_OSVERSIONCHECK = Proc(UInt32, UInt32, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt32, LibC::BOOL)
  alias PNS_DLL_INIT_FN = Proc(UInt32, Void*, UInt32)


  enum NS_CMD_FLAGS : Int32
    CMD_FLAG_PRIVATE = 1
    CMD_FLAG_INTERACTIVE = 2
    CMD_FLAG_LOCAL = 8
    CMD_FLAG_ONLINE = 16
    CMD_FLAG_HIDDEN = 32
    CMD_FLAG_LIMIT_MASK = 65535
    CMD_FLAG_PRIORITY = -2147483648
  end

  enum NS_REQS : Int32
    NS_REQ_ZERO = 0
    NS_REQ_PRESENT = 1
    NS_REQ_ALLOW_MULTIPLE = 2
    NS_REQ_ONE_OR_MORE = 3
  end

  enum NS_EVENTS : Int32
    NS_EVENT_LOOP = 65536
    NS_EVENT_LAST_N = 1
    NS_EVENT_LAST_SECS = 2
    NS_EVENT_FROM_N = 4
    NS_EVENT_FROM_START = 8
  end

  enum NS_MODE_CHANGE : Int32
    NETSH_COMMIT = 0
    NETSH_UNCOMMIT = 1
    NETSH_FLUSH = 2
    NETSH_COMMIT_STATE = 3
    NETSH_SAVE = 4
  end

  union NS_HELPER_ATTRIBUTES_Anonymous_e__Union
    anonymous : NS_HELPER_ATTRIBUTES_Anonymous_e__Union_Anonymous_e__Struct
    _ull_align : UInt64
  end
  union NS_CONTEXT_ATTRIBUTES_Anonymous_e__Union
    anonymous : NS_CONTEXT_ATTRIBUTES_Anonymous_e__Union_Anonymous_e__Struct
    _ull_align : UInt64
  end

  struct TOKEN_VALUE
    pwsz_token : LibC::LPWSTR
    dw_value : UInt32
  end
  struct NS_HELPER_ATTRIBUTES
    anonymous : NS_HELPER_ATTRIBUTES_Anonymous_e__Union
    guid_helper : Guid
    pfn_start : PNS_HELPER_START_FN
    pfn_stop : PNS_HELPER_STOP_FN
  end
  struct NS_HELPER_ATTRIBUTES_Anonymous_e__Union_Anonymous_e__Struct
    dw_version : UInt32
    dw_reserved : UInt32
  end
  struct CMD_ENTRY
    pwsz_cmd_token : LibC::LPWSTR
    pfn_cmd_handler : PFN_HANDLE_CMD
    dw_short_cmd_help_token : UInt32
    dw_cmd_hlp_token : UInt32
    dw_flags : UInt32
    p_os_version_check : PNS_OSVERSIONCHECK
  end
  struct CMD_GROUP_ENTRY
    pwsz_cmd_group_token : LibC::LPWSTR
    dw_short_cmd_help_token : UInt32
    ul_cmd_group_size : UInt32
    dw_flags : UInt32
    p_cmd_group : CMD_ENTRY*
    p_os_version_check : PNS_OSVERSIONCHECK
  end
  struct NS_CONTEXT_ATTRIBUTES
    anonymous : NS_CONTEXT_ATTRIBUTES_Anonymous_e__Union
    pwsz_context : LibC::LPWSTR
    guid_helper : Guid
    dw_flags : UInt32
    ul_priority : UInt32
    ul_num_top_cmds : UInt32
    p_top_cmds : CMD_ENTRY*
    ul_num_groups : UInt32
    p_cmd_groups : CMD_GROUP_ENTRY*
    pfn_commit_fn : PNS_CONTEXT_COMMIT_FN
    pfn_dump_fn : PNS_CONTEXT_DUMP_FN
    pfn_connect_fn : PNS_CONTEXT_CONNECT_FN
    p_reserved : Void*
    pfn_os_version_check : PNS_OSVERSIONCHECK
  end
  struct NS_CONTEXT_ATTRIBUTES_Anonymous_e__Union_Anonymous_e__Struct
    dw_version : UInt32
    dw_reserved : UInt32
  end
  struct TAG_TYPE
    pwsz_tag : LibC::LPWSTR
    dw_required : UInt32
    b_present : LibC::BOOL
  end


  # Params # hmodule : LibC::HANDLE [In],pwcarg : LibC::LPWSTR [In],dwnumarg : UInt32 [In],penumtable : TOKEN_VALUE* [In],pdwvalue : UInt32* [In]
  fun MatchEnumTag(hmodule : LibC::HANDLE, pwcarg : LibC::LPWSTR, dwnumarg : UInt32, penumtable : TOKEN_VALUE*, pdwvalue : UInt32*) : UInt32

  # Params # pwszusertoken : LibC::LPWSTR [In],pwszcmdtoken : LibC::LPWSTR [In]
  fun MatchToken(pwszusertoken : LibC::LPWSTR, pwszcmdtoken : LibC::LPWSTR) : LibC::BOOL

  # Params # hmodule : LibC::HANDLE [In],ppwcarguments : LibC::LPWSTR* [In],dwcurrentindex : UInt32 [In],dwargcount : UInt32 [In],ptttags : TAG_TYPE* [In],dwtagcount : UInt32 [In],dwminargs : UInt32 [In],dwmaxargs : UInt32 [In],pdwtagtype : UInt32* [In]
  fun PreprocessCommand(hmodule : LibC::HANDLE, ppwcarguments : LibC::LPWSTR*, dwcurrentindex : UInt32, dwargcount : UInt32, ptttags : TAG_TYPE*, dwtagcount : UInt32, dwminargs : UInt32, dwmaxargs : UInt32, pdwtagtype : UInt32*) : UInt32

  # Params # hmodule : LibC::HANDLE [In],dwerrid : UInt32 [In]
  fun PrintError(hmodule : LibC::HANDLE, dwerrid : UInt32) : UInt32

  # Params # hmodule : LibC::HANDLE [In],dwmsgid : UInt32 [In]
  fun PrintMessageFromModule(hmodule : LibC::HANDLE, dwmsgid : UInt32) : UInt32

  # Params # pwszformat : LibC::LPWSTR [In]
  fun PrintMessage(pwszformat : LibC::LPWSTR) : UInt32

  # Params # pchildcontext : NS_CONTEXT_ATTRIBUTES* [In]
  fun RegisterContext(pchildcontext : NS_CONTEXT_ATTRIBUTES*) : UInt32

  # Params # pguidparentcontext : Guid* [In],pfnregistersubcontext : NS_HELPER_ATTRIBUTES* [In]
  fun RegisterHelper(pguidparentcontext : Guid*, pfnregistersubcontext : NS_HELPER_ATTRIBUTES*) : UInt32
end
