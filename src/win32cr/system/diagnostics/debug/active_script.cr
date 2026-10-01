require "./../../../foundation.cr"
require "./../../com.cr"
require "./../../variant.cr"
require "./../debug.cr"

module Win32cr::System::Diagnostics::Debug::ActiveScript
  extend self
  CATID_ActiveScriptAuthor = LibC::GUID.new(0xaee2a92_u32, 0xbcbb_u16, 0x11d0_u16, StaticArray[0x8c_u8, 0x72_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xb0_u8, 0x85_u8])
  APPBREAKFLAG_DEBUGGER_BLOCK = 1_u32
  APPBREAKFLAG_DEBUGGER_HALT = 2_u32
  APPBREAKFLAG_STEP = 65536_u32
  APPBREAKFLAG_NESTED = 131072_u32
  APPBREAKFLAG_STEPTYPE_SOURCE = 0_u32
  APPBREAKFLAG_STEPTYPE_BYTECODE = 1048576_u32
  APPBREAKFLAG_STEPTYPE_MACHINE = 2097152_u32
  APPBREAKFLAG_STEPTYPE_MASK = 15728640_u32
  APPBREAKFLAG_IN_BREAKPOINT = 2147483648_u32
  SOURCETEXT_ATTR_KEYWORD = 1_u32
  SOURCETEXT_ATTR_COMMENT = 2_u32
  SOURCETEXT_ATTR_NONSOURCE = 4_u32
  SOURCETEXT_ATTR_OPERATOR = 8_u32
  SOURCETEXT_ATTR_NUMBER = 16_u32
  SOURCETEXT_ATTR_STRING = 32_u32
  SOURCETEXT_ATTR_FUNCTION_START = 64_u32
  TEXT_DOC_ATTR_READONLY = 1_u32
  TEXT_DOC_ATTR_TYPE_PRIMARY = 2_u32
  TEXT_DOC_ATTR_TYPE_WORKER = 4_u32
  TEXT_DOC_ATTR_TYPE_SCRIPT = 8_u32
  DEBUG_TEXT_ISEXPRESSION = 1_u32
  DEBUG_TEXT_RETURNVALUE = 2_u32
  DEBUG_TEXT_NOSIDEEFFECTS = 4_u32
  DEBUG_TEXT_ALLOWBREAKPOINTS = 8_u32
  DEBUG_TEXT_ALLOWERRORREPORT = 16_u32
  DEBUG_TEXT_EVALUATETOCODECONTEXT = 32_u32
  DEBUG_TEXT_ISNONUSERCODE = 64_u32
  THREAD_STATE_RUNNING = 1_u32
  THREAD_STATE_SUSPENDED = 2_u32
  THREAD_BLOCKED = 4_u32
  THREAD_OUT_OF_CONTEXT = 8_u32
  CATID_ActiveScript = LibC::GUID.new(0xf0b7a1a1_u32, 0x9847_u16, 0x11cf_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])
  CATID_ActiveScriptParse = LibC::GUID.new(0xf0b7a1a2_u32, 0x9847_u16, 0x11cf_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])
  CATID_ActiveScriptEncode = LibC::GUID.new(0xf0b7a1a3_u32, 0x9847_u16, 0x11cf_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])
  OID_VBSSIP = LibC::GUID.new(0x1629f04e_u32, 0x2799_u16, 0x4db5_u16, StaticArray[0x8f_u8, 0xe5_u8, 0xac_u8, 0xe1_u8, 0xf_u8, 0x17_u8, 0xeb_u8, 0xab_u8])
  OID_JSSIP = LibC::GUID.new(0x6c9e010_u32, 0x38ce_u16, 0x11d4_u16, StaticArray[0xa2_u8, 0xa3_u8, 0x0_u8, 0x10_u8, 0x4b_u8, 0xd3_u8, 0x50_u8, 0x90_u8])
  OID_WSFSIP = LibC::GUID.new(0x1a610570_u32, 0x38ce_u16, 0x11d4_u16, StaticArray[0xa2_u8, 0xa3_u8, 0x0_u8, 0x10_u8, 0x4b_u8, 0xd3_u8, 0x50_u8, 0x90_u8])
  SCRIPTITEM_ISVISIBLE = 2_u32
  SCRIPTITEM_ISSOURCE = 4_u32
  SCRIPTITEM_GLOBALMEMBERS = 8_u32
  SCRIPTITEM_ISPERSISTENT = 64_u32
  SCRIPTITEM_CODEONLY = 512_u32
  SCRIPTITEM_NOCODE = 1024_u32
  SCRIPTTYPELIB_ISCONTROL = 16_u32
  SCRIPTTYPELIB_ISPERSISTENT = 64_u32
  SCRIPTTEXT_DELAYEXECUTION = 1_u32
  SCRIPTTEXT_ISVISIBLE = 2_u32
  SCRIPTTEXT_ISEXPRESSION = 32_u32
  SCRIPTTEXT_ISPERSISTENT = 64_u32
  SCRIPTTEXT_HOSTMANAGESSOURCE = 128_u32
  SCRIPTTEXT_ISXDOMAIN = 256_u32
  SCRIPTTEXT_ISNONUSERCODE = 512_u32
  SCRIPTPROC_ISEXPRESSION = 32_u32
  SCRIPTPROC_HOSTMANAGESSOURCE = 128_u32
  SCRIPTPROC_IMPLICIT_THIS = 256_u32
  SCRIPTPROC_IMPLICIT_PARENTS = 512_u32
  SCRIPTPROC_ISXDOMAIN = 1024_u32
  SCRIPTINFO_IUNKNOWN = 1_u32
  SCRIPTINFO_ITYPEINFO = 2_u32
  SCRIPTINTERRUPT_DEBUG = 1_u32
  SCRIPTINTERRUPT_RAISEEXCEPTION = 2_u32
  SCRIPTSTAT_STATEMENT_COUNT = 1_u32
  SCRIPTSTAT_INSTRUCTION_COUNT = 2_u32
  SCRIPTSTAT_INTSTRUCTION_TIME = 3_u32
  SCRIPTSTAT_TOTAL_TIME = 4_u32
  SCRIPT_ENCODE_SECTION = 1_u32
  SCRIPT_ENCODE_DEFAULT_LANGUAGE = 1_u32
  SCRIPT_ENCODE_NO_ASP_LANGUAGE = 2_u32
  SCRIPTPROP_NAME = 0_u32
  SCRIPTPROP_MAJORVERSION = 1_u32
  SCRIPTPROP_MINORVERSION = 2_u32
  SCRIPTPROP_BUILDNUMBER = 3_u32
  SCRIPTPROP_DELAYEDEVENTSINKING = 4096_u32
  SCRIPTPROP_CATCHEXCEPTION = 4097_u32
  SCRIPTPROP_CONVERSIONLCID = 4098_u32
  SCRIPTPROP_HOSTSTACKREQUIRED = 4099_u32
  SCRIPTPROP_SCRIPTSAREFULLYTRUSTED = 4100_u32
  SCRIPTPROP_DEBUGGER = 4352_u32
  SCRIPTPROP_JITDEBUG = 4353_u32
  SCRIPTPROP_GCCONTROLSOFTCLOSE = 8192_u32
  SCRIPTPROP_INTEGERMODE = 12288_u32
  SCRIPTPROP_STRINGCOMPAREINSTANCE = 12289_u32
  SCRIPTPROP_INVOKEVERSIONING = 16384_u32
  SCRIPTPROP_HACK_FIBERSUPPORT = 1879048192_u32
  SCRIPTPROP_HACK_TRIDENTEVENTSINK = 1879048193_u32
  SCRIPTPROP_ABBREVIATE_GLOBALNAME_RESOLUTION = 1879048194_u32
  SCRIPTPROP_HOSTKEEPALIVE = 1879048196_u32
  SCRIPT_E_RECORDED = -2040119292_i32
  SCRIPT_E_REPORTED = -2147352319_i32
  SCRIPT_E_PROPAGATE = -2147352318_i32
  FACILITY_JsDEBUG = 3527_u32
  E_JsDEBUG_MISMATCHED_RUNTIME = -1916338175_i32
  E_JsDEBUG_UNKNOWN_THREAD = -1916338174_i32
  E_JsDEBUG_OUTSIDE_OF_VM = -1916338172_i32
  E_JsDEBUG_INVALID_MEMORY_ADDRESS = -1916338171_i32
  E_JsDEBUG_SOURCE_LOCATION_NOT_FOUND = -1916338170_i32
  E_JsDEBUG_RUNTIME_NOT_IN_DEBUG_MODE = -1916338169_i32
  ACTIVPROF_E_PROFILER_PRESENT = -2147220992_i32
  ACTIVPROF_E_PROFILER_ABSENT = -2147220991_i32
  ACTIVPROF_E_UNABLE_TO_APPLY_ACTION = -2147220990_i32
  PROFILER_HEAP_OBJECT_NAME_ID_UNAVAILABLE = 4294967295_u32
  Fasapreferinternalhandler = 1_u32
  Fasasupportinternalhandler = 2_u32
  Fasacasesensitive = 4_u32
  SCRIPT_CMPL_NOLIST = 0_u32
  SCRIPT_CMPL_MEMBERLIST = 1_u32
  SCRIPT_CMPL_ENUMLIST = 2_u32
  SCRIPT_CMPL_PARAMTIP = 4_u32
  SCRIPT_CMPL_GLOBALLIST = 8_u32
  SCRIPT_CMPL_ENUM_TRIGGER = 1_u32
  SCRIPT_CMPL_MEMBER_TRIGGER = 2_u32
  SCRIPT_CMPL_PARAM_TRIGGER = 3_u32
  SCRIPT_CMPL_COMMIT = 4_u32
  GETATTRTYPE_NORMAL = 0_u32
  GETATTRTYPE_DEPSCAN = 1_u32
  GETATTRFLAG_THIS = 256_u32
  GETATTRFLAG_HUMANTEXT = 32768_u32
  SOURCETEXT_ATTR_HUMANTEXT = 32768_u32
  SOURCETEXT_ATTR_IDENTIFIER = 256_u32
  SOURCETEXT_ATTR_MEMBERLOOKUP = 512_u32
  SOURCETEXT_ATTR_THIS = 1024_u32

  CLSID_ProcessDebugManager = LibC::GUID.new(0x78a51822_u32, 0x51f4_u16, 0x11d0_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])

  CLSID_DebugHelper = LibC::GUID.new(0xbfcc060_u32, 0x8c1d_u16, 0x11d0_u16, StaticArray[0xac_u8, 0xcd_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0x27_u8, 0x5c_u8])

  CLSID_CDebugDocumentHelper = LibC::GUID.new(0x83b8bca6_u32, 0x687c_u16, 0x11d0_u16, StaticArray[0xa4_u8, 0x5_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0x27_u8, 0x5c_u8])

  CLSID_MachineDebugManager_RETAIL = LibC::GUID.new(0xc0a3666_u32, 0x30c9_u16, 0x11d0_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])

  CLSID_MachineDebugManager_DEBUG = LibC::GUID.new(0x49769cec_u32, 0x3a55_u16, 0x4bb0_u16, StaticArray[0xb6_u8, 0x97_u8, 0x88_u8, 0xfe_u8, 0xde_u8, 0x77_u8, 0xe8_u8, 0xea_u8])

  CLSID_DefaultDebugSessionProvider = LibC::GUID.new(0x834128a2_u32, 0x51f4_u16, 0x11d0_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])

  enum SCRIPTLANGUAGEVERSION
    SCRIPTLANGUAGEVERSION_DEFAULT = 0_i32
    SCRIPTLANGUAGEVERSION_5_7 = 1_i32
    SCRIPTLANGUAGEVERSION_5_8 = 2_i32
    SCRIPTLANGUAGEVERSION_MAX = 255_i32
  end
  enum SCRIPTSTATE
    SCRIPTSTATE_UNINITIALIZED = 0_i32
    SCRIPTSTATE_INITIALIZED = 5_i32
    SCRIPTSTATE_STARTED = 1_i32
    SCRIPTSTATE_CONNECTED = 2_i32
    SCRIPTSTATE_DISCONNECTED = 3_i32
    SCRIPTSTATE_CLOSED = 4_i32
  end
  enum SCRIPTTRACEINFO
    SCRIPTTRACEINFO_SCRIPTSTART = 0_i32
    SCRIPTTRACEINFO_SCRIPTEND = 1_i32
    SCRIPTTRACEINFO_COMCALLSTART = 2_i32
    SCRIPTTRACEINFO_COMCALLEND = 3_i32
    SCRIPTTRACEINFO_CREATEOBJSTART = 4_i32
    SCRIPTTRACEINFO_CREATEOBJEND = 5_i32
    SCRIPTTRACEINFO_GETOBJSTART = 6_i32
    SCRIPTTRACEINFO_GETOBJEND = 7_i32
  end
  enum SCRIPTTHREADSTATE
    SCRIPTTHREADSTATE_NOTINSCRIPT = 0_i32
    SCRIPTTHREADSTATE_RUNNING = 1_i32
  end
  enum SCRIPTGCTYPE
    SCRIPTGCTYPE_NORMAL = 0_i32
    SCRIPTGCTYPE_EXHAUSTIVE = 1_i32
  end
  enum SCRIPTUICITEM
    SCRIPTUICITEM_INPUTBOX = 1_i32
    SCRIPTUICITEM_MSGBOX = 2_i32
  end
  enum SCRIPTUICHANDLING
    SCRIPTUICHANDLING_ALLOW = 0_i32
    SCRIPTUICHANDLING_NOUIERROR = 1_i32
    SCRIPTUICHANDLING_NOUIDEFAULT = 2_i32
  end
  enum BREAKPOINT_STATE
    BREAKPOINT_DELETED = 0_i32
    BREAKPOINT_DISABLED = 1_i32
    BREAKPOINT_ENABLED = 2_i32
  end
  enum BREAKREASON
    BREAKREASON_STEP = 0_i32
    BREAKREASON_BREAKPOINT = 1_i32
    BREAKREASON_DEBUGGER_BLOCK = 2_i32
    BREAKREASON_HOST_INITIATED = 3_i32
    BREAKREASON_LANGUAGE_INITIATED = 4_i32
    BREAKREASON_DEBUGGER_HALT = 5_i32
    BREAKREASON_ERROR = 6_i32
    BREAKREASON_JIT = 7_i32
    BREAKREASON_MUTATION_BREAKPOINT = 8_i32
  end
  enum BREAKRESUMEACTION
    BREAKRESUMEACTION_ABORT = 0_i32
    BREAKRESUMEACTION_CONTINUE = 1_i32
    BREAKRESUMEACTION_STEP_INTO = 2_i32
    BREAKRESUMEACTION_STEP_OVER = 3_i32
    BREAKRESUMEACTION_STEP_OUT = 4_i32
    BREAKRESUMEACTION_IGNORE = 5_i32
    BREAKRESUMEACTION_STEP_DOCUMENT = 6_i32
  end
  enum ERRORRESUMEACTION
    ERRORRESUMEACTION_ReexecuteErrorStatement = 0_i32
    ERRORRESUMEACTION_AbortCallAndReturnErrorToCaller = 1_i32
    ERRORRESUMEACTION_SkipErrorStatement = 2_i32
  end
  enum DOCUMENTNAMETYPE
    DOCUMENTNAMETYPE_APPNODE = 0_i32
    DOCUMENTNAMETYPE_TITLE = 1_i32
    DOCUMENTNAMETYPE_FILE_TAIL = 2_i32
    DOCUMENTNAMETYPE_URL = 3_i32
    DOCUMENTNAMETYPE_UNIQUE_TITLE = 4_i32
    DOCUMENTNAMETYPE_SOURCE_MAP_URL = 5_i32
  end
  enum PROFILER_SCRIPT_TYPE
    PROFILER_SCRIPT_TYPE_USER = 0_i32
    PROFILER_SCRIPT_TYPE_DYNAMIC = 1_i32
    PROFILER_SCRIPT_TYPE_NATIVE = 2_i32
    PROFILER_SCRIPT_TYPE_DOM = 3_i32
  end
  @[Flags]
  enum PROFILER_EVENT_MASK
    PROFILER_EVENT_MASK_TRACE_SCRIPT_FUNCTION_CALL = 1_i32
    PROFILER_EVENT_MASK_TRACE_NATIVE_FUNCTION_CALL = 2_i32
    PROFILER_EVENT_MASK_TRACE_DOM_FUNCTION_CALL = 4_i32
    PROFILER_EVENT_MASK_TRACE_ALL = 3_i32
    PROFILER_EVENT_MASK_TRACE_ALL_WITH_DOM = 7_i32
  end
  @[Flags]
  enum PROFILER_HEAP_OBJECT_FLAGS
    PROFILER_HEAP_OBJECT_FLAGS_NEW_OBJECT = 1_i32
    PROFILER_HEAP_OBJECT_FLAGS_IS_ROOT = 2_i32
    PROFILER_HEAP_OBJECT_FLAGS_SITE_CLOSED = 4_i32
    PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL = 8_i32
    PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_UNKNOWN = 16_i32
    PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_DISPATCH = 32_i32
    PROFILER_HEAP_OBJECT_FLAGS_SIZE_APPROXIMATE = 64_i32
    PROFILER_HEAP_OBJECT_FLAGS_SIZE_UNAVAILABLE = 128_i32
    PROFILER_HEAP_OBJECT_FLAGS_NEW_STATE_UNAVAILABLE = 256_i32
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_INSTANCE = 512_i32
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_RUNTIMECLASS = 1024_i32
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_DELEGATE = 2048_i32
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_NAMESPACE = 4096_i32
  end
  enum PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_PROTOTYPE = 1_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_FUNCTION_NAME = 2_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_SCOPE_LIST = 3_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_INTERNAL_PROPERTY = 4_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_NAME_PROPERTIES = 5_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_INDEX_PROPERTIES = 6_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_ELEMENT_ATTRIBUTES_SIZE = 7_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_ELEMENT_TEXT_CHILDREN_SIZE = 8_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_RELATIONSHIPS = 9_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_WINRTEVENTS = 10_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_WEAKMAP_COLLECTION_LIST = 11_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_MAP_COLLECTION_LIST = 12_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_SET_COLLECTION_LIST = 13_i32
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_MAX_VALUE = 13_i32
  end
  @[Flags]
  enum PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_NONE = 0_i32
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_GET_ACCESSOR = 65536_i32
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_SET_ACCESSOR = 131072_i32
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_LET_VARIABLE = 262144_i32
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_CONST_VARIABLE = 524288_i32
  end
  @[Flags]
  enum PROFILER_HEAP_ENUM_FLAGS
    PROFILER_HEAP_ENUM_FLAGS_NONE = 0_i32
    PROFILER_HEAP_ENUM_FLAGS_STORE_RELATIONSHIP_FLAGS = 1_i32
    PROFILER_HEAP_ENUM_FLAGS_SUBSTRINGS = 2_i32
    PROFILER_HEAP_ENUM_FLAGS_RELATIONSHIP_SUBSTRINGS = 3_i32
  end
  enum PROFILER_RELATIONSHIP_INFO
    PROFILER_PROPERTY_TYPE_NUMBER = 1_i32
    PROFILER_PROPERTY_TYPE_STRING = 2_i32
    PROFILER_PROPERTY_TYPE_HEAP_OBJECT = 3_i32
    PROFILER_PROPERTY_TYPE_EXTERNAL_OBJECT = 4_i32
    PROFILER_PROPERTY_TYPE_BSTR = 5_i32
    PROFILER_PROPERTY_TYPE_SUBSTRING = 6_i32
  end
  enum PROFILER_HEAP_SUMMARY_VERSION
    PROFILER_HEAP_SUMMARY_VERSION_1 = 1_i32
  end
  enum APPLICATION_NODE_EVENT_FILTER
    FILTER_EXCLUDE_NOTHING = 0_i32
    FILTER_EXCLUDE_ANONYMOUS_CODE = 1_i32
    FILTER_EXCLUDE_EVAL_CODE = 2_i32
  end
  @[Flags]
  enum SCRIPT_DEBUGGER_OPTIONS
    SDO_NONE = 0_i32
    SDO_ENABLE_FIRST_CHANCE_EXCEPTIONS = 1_i32
    SDO_ENABLE_WEB_WORKER_SUPPORT = 2_i32
    SDO_ENABLE_NONUSER_CODE_SUPPORT = 4_i32
    SDO_ENABLE_LIBRARY_STACK_FRAME = 8_i32
  end
  enum SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND
    ETK_FIRST_CHANCE = 0_i32
    ETK_USER_UNHANDLED = 1_i32
    ETK_UNHANDLED = 2_i32
  end
  enum SCRIPT_INVOCATION_CONTEXT_TYPE
    SICT_Event = 0_i32
    SICT_SetTimeout = 1_i32
    SICT_SetInterval = 2_i32
    SICT_SetImmediate = 3_i32
    SICT_RequestAnimationFrame = 4_i32
    SICT_ToString = 5_i32
    SICT_MutationObserverCheckpoint = 6_i32
    SICT_WWAExecUnsafeLocalFunction = 7_i32
    SICT_WWAExecAtPriority = 8_i32
  end
  enum DEBUG_STACKFRAME_TYPE
    DST_SCRIPT_FRAME = 0_i32
    DST_INTERNAL_FRAME = 1_i32
    DST_INVOCATION_FRAME = 2_i32
  end
  enum DEBUG_EVENT_INFO_TYPE
    DEIT_GENERAL = 0_i32
    DEIT_ASMJS_IN_DEBUGGING = 1_i32
    DEIT_ASMJS_SUCCEEDED = 2_i32
    DEIT_ASMJS_FAILED = 3_i32
  end
  enum JS_PROPERTY_MEMBERS
    JS_PROPERTY_MEMBERS_ALL = 0_i32
    JS_PROPERTY_MEMBERS_ARGUMENTS = 1_i32
  end
  enum JS_PROPERTY_ATTRIBUTES
    JS_PROPERTY_ATTRIBUTE_NONE = 0_i32
    JS_PROPERTY_HAS_CHILDREN = 1_i32
    JS_PROPERTY_FAKE = 2_i32
    JS_PROPERTY_METHOD = 4_i32
    JS_PROPERTY_READONLY = 8_i32
    JS_PROPERTY_NATIVE_WINRT_POINTER = 16_i32
    JS_PROPERTY_FRAME_INTRYBLOCK = 32_i32
    JS_PROPERTY_FRAME_INCATCHBLOCK = 64_i32
    JS_PROPERTY_FRAME_INFINALLYBLOCK = 128_i32
  end
  enum JsDebugReadMemoryFlags
    None = 0_i32
    JsDebugAllowPartialRead = 1_i32
  end

  @[Extern]
  struct DebugStackFrameDescriptor
    property pdsf : Void*
    property dwMin : UInt32
    property dwLim : UInt32
    property fFinal : Win32cr::Foundation::BOOL
    property punkFinal : Void*
    def initialize(@pdsf : Void*, @dwMin : UInt32, @dwLim : UInt32, @fFinal : Win32cr::Foundation::BOOL, @punkFinal : Void*)
    end
  end

  @[Extern]
  struct DebugStackFrameDescriptor64
    property pdsf : Void*
    property dwMin : UInt64
    property dwLim : UInt64
    property fFinal : Win32cr::Foundation::BOOL
    property punkFinal : Void*
    def initialize(@pdsf : Void*, @dwMin : UInt64, @dwLim : UInt64, @fFinal : Win32cr::Foundation::BOOL, @punkFinal : Void*)
    end
  end

  @[Extern]
  struct PROFILER_HEAP_OBJECT_SCOPE_LIST
    property count : UInt32
    property scopes : LibC::UIntPtrT[1]
    def initialize(@count : UInt32, @scopes : LibC::UIntPtrT[1])
    end
  end

  @[Extern]
  struct PROFILER_PROPERTY_TYPE_SUBSTRING_INFO
    property length : UInt32
    property value : Win32cr::Foundation::PWSTR
    def initialize(@length : UInt32, @value : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PROFILER_HEAP_OBJECT_RELATIONSHIP
    property relationshipId : UInt32
    property relationshipInfo : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_RELATIONSHIP_INFO
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property numberValue : Float64
    property stringValue : Win32cr::Foundation::PWSTR
    property bstrValue : Win32cr::Foundation::BSTR
    property objectId : LibC::UIntPtrT
    property externalObjectAddress : Void*
    property subString : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_PROPERTY_TYPE_SUBSTRING_INFO*
    def initialize(@numberValue : Float64, @stringValue : Win32cr::Foundation::PWSTR, @bstrValue : Win32cr::Foundation::BSTR, @objectId : LibC::UIntPtrT, @externalObjectAddress : Void*, @subString : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_PROPERTY_TYPE_SUBSTRING_INFO*)
    end
    end

    def initialize(@relationshipId : UInt32, @relationshipInfo : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_RELATIONSHIP_INFO, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST
    property count : UInt32
    property elements : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP[1]
    def initialize(@count : UInt32, @elements : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP[1])
    end
  end

  @[Extern]
  struct PROFILER_HEAP_OBJECT_OPTIONAL_INFO
    property infoType : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property prototype : LibC::UIntPtrT
    property functionName : Win32cr::Foundation::PWSTR
    property elementAttributesSize : UInt32
    property elementTextChildrenSize : UInt32
    property scopeList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_SCOPE_LIST*
    property internalProperty : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP*
    property namePropertyList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*
    property indexPropertyList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*
    property relationshipList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*
    property eventList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*
    property weakMapCollectionList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*
    property mapCollectionList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*
    property setCollectionList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*
    def initialize(@prototype : LibC::UIntPtrT, @functionName : Win32cr::Foundation::PWSTR, @elementAttributesSize : UInt32, @elementTextChildrenSize : UInt32, @scopeList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_SCOPE_LIST*, @internalProperty : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP*, @namePropertyList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*, @indexPropertyList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*, @relationshipList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*, @eventList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*, @weakMapCollectionList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*, @mapCollectionList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*, @setCollectionList : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST*)
    end
    end

    def initialize(@infoType : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PROFILER_HEAP_OBJECT
    property size : UInt32
    property anonymous : Anonymous_e__Union_
    property typeNameId : UInt32
    property flags : UInt32
    property unused : UInt16
    property optionalInfoCount : UInt16

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property objectId : LibC::UIntPtrT
    property externalObjectAddress : Void*
    def initialize(@objectId : LibC::UIntPtrT, @externalObjectAddress : Void*)
    end
    end

    def initialize(@size : UInt32, @anonymous : Anonymous_e__Union_, @typeNameId : UInt32, @flags : UInt32, @unused : UInt16, @optionalInfoCount : UInt16)
    end
  end

  @[Extern]
  struct PROFILER_HEAP_SUMMARY
    property version : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_SUMMARY_VERSION
    property totalHeapSize : UInt32
    def initialize(@version : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_SUMMARY_VERSION, @totalHeapSize : UInt32)
    end
  end

  @[Extern]
  struct TEXT_DOCUMENT_ARRAY
    property dwCount : UInt32
    property members : Void**
    def initialize(@dwCount : UInt32, @members : Void**)
    end
  end

  @[Extern]
  struct JsDebugPropertyInfo
    property name : Win32cr::Foundation::BSTR
    property type__ : Win32cr::Foundation::BSTR
    property value : Win32cr::Foundation::BSTR
    property fullName : Win32cr::Foundation::BSTR
    property attr : Win32cr::System::Diagnostics::Debug::ActiveScript::JS_PROPERTY_ATTRIBUTES
    def initialize(@name : Win32cr::Foundation::BSTR, @type__ : Win32cr::Foundation::BSTR, @value : Win32cr::Foundation::BSTR, @fullName : Win32cr::Foundation::BSTR, @attr : Win32cr::System::Diagnostics::Debug::ActiveScript::JS_PROPERTY_ATTRIBUTES)
    end
  end

  @[Extern]
  struct JS_NATIVE_FRAME
    property instruction_offset : UInt64
    property return_offset : UInt64
    property frame_offset : UInt64
    property stack_offset : UInt64
    def initialize(@instruction_offset : UInt64, @return_offset : UInt64, @frame_offset : UInt64, @stack_offset : UInt64)
    end
  end

  @[Extern]

  record IActiveScriptSiteVtable,
    query_interface : Proc(IActiveScriptSite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptSite*, UInt32),
    release : Proc(IActiveScriptSite*, UInt32),
    get_lcid : Proc(IActiveScriptSite*, UInt32*, Win32cr::Foundation::HRESULT),
    get_item_info : Proc(IActiveScriptSite*, Win32cr::Foundation::PWSTR, UInt32, Void**, Void**, Win32cr::Foundation::HRESULT),
    get_doc_version_string : Proc(IActiveScriptSite*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    on_script_terminate : Proc(IActiveScriptSite*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT),
    on_state_change : Proc(IActiveScriptSite*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTSTATE, Win32cr::Foundation::HRESULT),
    on_script_error : Proc(IActiveScriptSite*, Void*, Win32cr::Foundation::HRESULT),
    on_enter_script : Proc(IActiveScriptSite*, Win32cr::Foundation::HRESULT),
    on_leave_script : Proc(IActiveScriptSite*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptSite, lpVtbl : IActiveScriptSiteVtable* do
    GUID = LibC::GUID.new(0xdb01a1e3_u32, 0xa42b_u16, 0x11cf_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])
    def query_interface(this : IActiveScriptSite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptSite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptSite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_lcid(this : IActiveScriptSite*, plcid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lcid.call(this, plcid)
    end
    def get_item_info(this : IActiveScriptSite*, pstrName : Win32cr::Foundation::PWSTR, dwReturnMask : UInt32, ppiunkItem : Void**, ppti : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_info.call(this, pstrName, dwReturnMask, ppiunkItem, ppti)
    end
    def get_doc_version_string(this : IActiveScriptSite*, pbstrVersion : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_doc_version_string.call(this, pbstrVersion)
    end
    def on_script_terminate(this : IActiveScriptSite*, pvarResult : Win32cr::System::Variant::VARIANT*, pexcepinfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_script_terminate.call(this, pvarResult, pexcepinfo)
    end
    def on_state_change(this : IActiveScriptSite*, ssScriptState : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTSTATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_state_change.call(this, ssScriptState)
    end
    def on_script_error(this : IActiveScriptSite*, pscripterror : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_script_error.call(this, pscripterror)
    end
    def on_enter_script(this : IActiveScriptSite*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_enter_script.call(this)
    end
    def on_leave_script(this : IActiveScriptSite*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_leave_script.call(this)
    end

  end

  @[Extern]

  record IActiveScriptErrorVtable,
    query_interface : Proc(IActiveScriptError*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptError*, UInt32),
    release : Proc(IActiveScriptError*, UInt32),
    get_exception_info : Proc(IActiveScriptError*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT),
    get_source_position : Proc(IActiveScriptError*, UInt32*, UInt32*, Int32*, Win32cr::Foundation::HRESULT),
    get_source_line_text : Proc(IActiveScriptError*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptError, lpVtbl : IActiveScriptErrorVtable* do
    GUID = LibC::GUID.new(0xeae1ba61_u32, 0xa4ed_u16, 0x11cf_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])
    def query_interface(this : IActiveScriptError*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptError*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptError*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_exception_info(this : IActiveScriptError*, pexcepinfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exception_info.call(this, pexcepinfo)
    end
    def get_source_position(this : IActiveScriptError*, pdwSourceContext : UInt32*, pulLineNumber : UInt32*, plCharacterPosition : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_position.call(this, pdwSourceContext, pulLineNumber, plCharacterPosition)
    end
    def get_source_line_text(this : IActiveScriptError*, pbstrSourceLine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_line_text.call(this, pbstrSourceLine)
    end

  end

  @[Extern]

  record IActiveScriptError64Vtable,
    query_interface : Proc(IActiveScriptError64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptError64*, UInt32),
    release : Proc(IActiveScriptError64*, UInt32),
    get_exception_info : Proc(IActiveScriptError64*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT),
    get_source_position : Proc(IActiveScriptError64*, UInt32*, UInt32*, Int32*, Win32cr::Foundation::HRESULT),
    get_source_line_text : Proc(IActiveScriptError64*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_source_position64 : Proc(IActiveScriptError64*, UInt64*, UInt32*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptError64, lpVtbl : IActiveScriptError64Vtable* do
    GUID = LibC::GUID.new(0xb21fb2a1_u32, 0x5b8f_u16, 0x4963_u16, StaticArray[0x8c_u8, 0x21_u8, 0x21_u8, 0x45_u8, 0xf_u8, 0x84_u8, 0xed_u8, 0x7f_u8])
    def query_interface(this : IActiveScriptError64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptError64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptError64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_exception_info(this : IActiveScriptError64*, pexcepinfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exception_info.call(this, pexcepinfo)
    end
    def get_source_position(this : IActiveScriptError64*, pdwSourceContext : UInt32*, pulLineNumber : UInt32*, plCharacterPosition : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_position.call(this, pdwSourceContext, pulLineNumber, plCharacterPosition)
    end
    def get_source_line_text(this : IActiveScriptError64*, pbstrSourceLine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_line_text.call(this, pbstrSourceLine)
    end
    def get_source_position64(this : IActiveScriptError64*, pdwSourceContext : UInt64*, pulLineNumber : UInt32*, plCharacterPosition : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_position64.call(this, pdwSourceContext, pulLineNumber, plCharacterPosition)
    end

  end

  @[Extern]

  record IActiveScriptSiteWindowVtable,
    query_interface : Proc(IActiveScriptSiteWindow*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptSiteWindow*, UInt32),
    release : Proc(IActiveScriptSiteWindow*, UInt32),
    get_window : Proc(IActiveScriptSiteWindow*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    enable_modeless : Proc(IActiveScriptSiteWindow*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptSiteWindow, lpVtbl : IActiveScriptSiteWindowVtable* do
    GUID = LibC::GUID.new(0xd10f6761_u32, 0x83e9_u16, 0x11cf_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])
    def query_interface(this : IActiveScriptSiteWindow*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptSiteWindow*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptSiteWindow*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_window(this : IActiveScriptSiteWindow*, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window.call(this, phwnd)
    end
    def enable_modeless(this : IActiveScriptSiteWindow*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_modeless.call(this, fEnable)
    end

  end

  @[Extern]

  record IActiveScriptSiteUIControlVtable,
    query_interface : Proc(IActiveScriptSiteUIControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptSiteUIControl*, UInt32),
    release : Proc(IActiveScriptSiteUIControl*, UInt32),
    get_ui_behavior : Proc(IActiveScriptSiteUIControl*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTUICITEM, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTUICHANDLING*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptSiteUIControl, lpVtbl : IActiveScriptSiteUIControlVtable* do
    GUID = LibC::GUID.new(0xaedae97e_u32, 0xd7ee_u16, 0x4796_u16, StaticArray[0xb9_u8, 0x60_u8, 0x7f_u8, 0x9_u8, 0x2a_u8, 0xe8_u8, 0x44_u8, 0xab_u8])
    def query_interface(this : IActiveScriptSiteUIControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptSiteUIControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptSiteUIControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ui_behavior(this : IActiveScriptSiteUIControl*, uic_item : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTUICITEM, pUicHandling : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTUICHANDLING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ui_behavior.call(this, uic_item, pUicHandling)
    end

  end

  @[Extern]

  record IActiveScriptSiteInterruptPollVtable,
    query_interface : Proc(IActiveScriptSiteInterruptPoll*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptSiteInterruptPoll*, UInt32),
    release : Proc(IActiveScriptSiteInterruptPoll*, UInt32),
    query_continue : Proc(IActiveScriptSiteInterruptPoll*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptSiteInterruptPoll, lpVtbl : IActiveScriptSiteInterruptPollVtable* do
    GUID = LibC::GUID.new(0x539698a0_u32, 0xcdca_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0xeb_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x47_u8, 0xa0_u8, 0x63_u8])
    def query_interface(this : IActiveScriptSiteInterruptPoll*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptSiteInterruptPoll*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptSiteInterruptPoll*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_continue(this : IActiveScriptSiteInterruptPoll*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_continue.call(this)
    end

  end

  @[Extern]

  record IActiveScriptVtable,
    query_interface : Proc(IActiveScript*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScript*, UInt32),
    release : Proc(IActiveScript*, UInt32),
    set_script_site : Proc(IActiveScript*, Void*, Win32cr::Foundation::HRESULT),
    get_script_site : Proc(IActiveScript*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_script_state : Proc(IActiveScript*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTSTATE, Win32cr::Foundation::HRESULT),
    get_script_state : Proc(IActiveScript*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTSTATE*, Win32cr::Foundation::HRESULT),
    close : Proc(IActiveScript*, Win32cr::Foundation::HRESULT),
    add_named_item : Proc(IActiveScript*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    add_type_lib : Proc(IActiveScript*, LibC::GUID*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_script_dispatch : Proc(IActiveScript*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_current_script_thread_id : Proc(IActiveScript*, UInt32*, Win32cr::Foundation::HRESULT),
    get_script_thread_id : Proc(IActiveScript*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_script_thread_state : Proc(IActiveScript*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTTHREADSTATE*, Win32cr::Foundation::HRESULT),
    interrupt_script_thread : Proc(IActiveScript*, UInt32, Win32cr::System::Com::EXCEPINFO*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IActiveScript*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScript, lpVtbl : IActiveScriptVtable* do
    GUID = LibC::GUID.new(0xbb1a2ae1_u32, 0xa4f9_u16, 0x11cf_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])
    def query_interface(this : IActiveScript*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScript*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScript*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_script_site(this : IActiveScript*, pass : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_script_site.call(this, pass)
    end
    def get_script_site(this : IActiveScript*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_site.call(this, riid, ppvObject)
    end
    def set_script_state(this : IActiveScript*, ss : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTSTATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_script_state.call(this, ss)
    end
    def get_script_state(this : IActiveScript*, pssState : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTSTATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_state.call(this, pssState)
    end
    def close(this : IActiveScript*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def add_named_item(this : IActiveScript*, pstrName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_named_item.call(this, pstrName, dwFlags)
    end
    def add_type_lib(this : IActiveScript*, rguidTypeLib : LibC::GUID*, dwMajor : UInt32, dwMinor : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_type_lib.call(this, rguidTypeLib, dwMajor, dwMinor, dwFlags)
    end
    def get_script_dispatch(this : IActiveScript*, pstrItemName : Win32cr::Foundation::PWSTR, ppdisp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_dispatch.call(this, pstrItemName, ppdisp)
    end
    def get_current_script_thread_id(this : IActiveScript*, pstidThread : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_script_thread_id.call(this, pstidThread)
    end
    def get_script_thread_id(this : IActiveScript*, dwWin32ThreadId : UInt32, pstidThread : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_thread_id.call(this, dwWin32ThreadId, pstidThread)
    end
    def get_script_thread_state(this : IActiveScript*, stidThread : UInt32, pstsState : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTTHREADSTATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_thread_state.call(this, stidThread, pstsState)
    end
    def interrupt_script_thread(this : IActiveScript*, stidThread : UInt32, pexcepinfo : Win32cr::System::Com::EXCEPINFO*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.interrupt_script_thread.call(this, stidThread, pexcepinfo, dwFlags)
    end
    def clone(this : IActiveScript*, ppscript : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppscript)
    end

  end

  @[Extern]

  record IActiveScriptParse32Vtable,
    query_interface : Proc(IActiveScriptParse32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptParse32*, UInt32),
    release : Proc(IActiveScriptParse32*, UInt32),
    init_new : Proc(IActiveScriptParse32*, Win32cr::Foundation::HRESULT),
    add_scriptlet : Proc(IActiveScriptParse32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, Win32cr::Foundation::BSTR*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT),
    parse_script_text : Proc(IActiveScriptParse32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptParse32, lpVtbl : IActiveScriptParse32Vtable* do
    GUID = LibC::GUID.new(0xbb1a2ae2_u32, 0xa4f9_u16, 0x11cf_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])
    def query_interface(this : IActiveScriptParse32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptParse32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptParse32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init_new(this : IActiveScriptParse32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_new.call(this)
    end
    def add_scriptlet(this : IActiveScriptParse32*, pstrDefaultName : Win32cr::Foundation::PWSTR, pstrCode : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, pstrSubItemName : Win32cr::Foundation::PWSTR, pstrEventName : Win32cr::Foundation::PWSTR, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt32, ulStartingLineNumber : UInt32, dwFlags : UInt32, pbstrName : Win32cr::Foundation::BSTR*, pexcepinfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_scriptlet.call(this, pstrDefaultName, pstrCode, pstrItemName, pstrSubItemName, pstrEventName, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, pbstrName, pexcepinfo)
    end
    def parse_script_text(this : IActiveScriptParse32*, pstrCode : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, punkContext : Void*, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt32, ulStartingLineNumber : UInt32, dwFlags : UInt32, pvarResult : Win32cr::System::Variant::VARIANT*, pexcepinfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_script_text.call(this, pstrCode, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, pvarResult, pexcepinfo)
    end

  end

  @[Extern]

  record IActiveScriptParse64Vtable,
    query_interface : Proc(IActiveScriptParse64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptParse64*, UInt32),
    release : Proc(IActiveScriptParse64*, UInt32),
    init_new : Proc(IActiveScriptParse64*, Win32cr::Foundation::HRESULT),
    add_scriptlet : Proc(IActiveScriptParse64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt64, UInt32, UInt32, Win32cr::Foundation::BSTR*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT),
    parse_script_text : Proc(IActiveScriptParse64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, UInt64, UInt32, UInt32, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptParse64, lpVtbl : IActiveScriptParse64Vtable* do
    GUID = LibC::GUID.new(0xc7ef7658_u32, 0xe1ee_u16, 0x480e_u16, StaticArray[0x97_u8, 0xea_u8, 0xd5_u8, 0x2c_u8, 0xb4_u8, 0xd7_u8, 0x6d_u8, 0x17_u8])
    def query_interface(this : IActiveScriptParse64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptParse64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptParse64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init_new(this : IActiveScriptParse64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_new.call(this)
    end
    def add_scriptlet(this : IActiveScriptParse64*, pstrDefaultName : Win32cr::Foundation::PWSTR, pstrCode : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, pstrSubItemName : Win32cr::Foundation::PWSTR, pstrEventName : Win32cr::Foundation::PWSTR, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt64, ulStartingLineNumber : UInt32, dwFlags : UInt32, pbstrName : Win32cr::Foundation::BSTR*, pexcepinfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_scriptlet.call(this, pstrDefaultName, pstrCode, pstrItemName, pstrSubItemName, pstrEventName, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, pbstrName, pexcepinfo)
    end
    def parse_script_text(this : IActiveScriptParse64*, pstrCode : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, punkContext : Void*, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt64, ulStartingLineNumber : UInt32, dwFlags : UInt32, pvarResult : Win32cr::System::Variant::VARIANT*, pexcepinfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_script_text.call(this, pstrCode, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, pvarResult, pexcepinfo)
    end

  end

  @[Extern]

  record IActiveScriptParseProcedureOld32Vtable,
    query_interface : Proc(IActiveScriptParseProcedureOld32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptParseProcedureOld32*, UInt32),
    release : Proc(IActiveScriptParseProcedureOld32*, UInt32),
    parse_procedure_text : Proc(IActiveScriptParseProcedureOld32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptParseProcedureOld32, lpVtbl : IActiveScriptParseProcedureOld32Vtable* do
    GUID = LibC::GUID.new(0x1cff0050_u32, 0x6fdd_u16, 0x11d0_u16, StaticArray[0x93_u8, 0x28_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0xca_u8, 0xa9_u8])
    def query_interface(this : IActiveScriptParseProcedureOld32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptParseProcedureOld32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptParseProcedureOld32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_procedure_text(this : IActiveScriptParseProcedureOld32*, pstrCode : Win32cr::Foundation::PWSTR, pstrFormalParams : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, punkContext : Void*, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt32, ulStartingLineNumber : UInt32, dwFlags : UInt32, ppdisp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_procedure_text.call(this, pstrCode, pstrFormalParams, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, ppdisp)
    end

  end

  @[Extern]

  record IActiveScriptParseProcedureOld64Vtable,
    query_interface : Proc(IActiveScriptParseProcedureOld64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptParseProcedureOld64*, UInt32),
    release : Proc(IActiveScriptParseProcedureOld64*, UInt32),
    parse_procedure_text : Proc(IActiveScriptParseProcedureOld64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, UInt64, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptParseProcedureOld64, lpVtbl : IActiveScriptParseProcedureOld64Vtable* do
    GUID = LibC::GUID.new(0x21f57128_u32, 0x8c9_u16, 0x4638_u16, StaticArray[0xba_u8, 0x12_u8, 0x22_u8, 0xd1_u8, 0x5d_u8, 0x88_u8, 0xdc_u8, 0x5c_u8])
    def query_interface(this : IActiveScriptParseProcedureOld64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptParseProcedureOld64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptParseProcedureOld64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_procedure_text(this : IActiveScriptParseProcedureOld64*, pstrCode : Win32cr::Foundation::PWSTR, pstrFormalParams : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, punkContext : Void*, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt64, ulStartingLineNumber : UInt32, dwFlags : UInt32, ppdisp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_procedure_text.call(this, pstrCode, pstrFormalParams, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, ppdisp)
    end

  end

  @[Extern]

  record IActiveScriptParseProcedure32Vtable,
    query_interface : Proc(IActiveScriptParseProcedure32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptParseProcedure32*, UInt32),
    release : Proc(IActiveScriptParseProcedure32*, UInt32),
    parse_procedure_text : Proc(IActiveScriptParseProcedure32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptParseProcedure32, lpVtbl : IActiveScriptParseProcedure32Vtable* do
    GUID = LibC::GUID.new(0xaa5b6a80_u32, 0xb834_u16, 0x11d0_u16, StaticArray[0x93_u8, 0x2f_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0xca_u8, 0xa9_u8])
    def query_interface(this : IActiveScriptParseProcedure32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptParseProcedure32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptParseProcedure32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_procedure_text(this : IActiveScriptParseProcedure32*, pstrCode : Win32cr::Foundation::PWSTR, pstrFormalParams : Win32cr::Foundation::PWSTR, pstrProcedureName : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, punkContext : Void*, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt32, ulStartingLineNumber : UInt32, dwFlags : UInt32, ppdisp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_procedure_text.call(this, pstrCode, pstrFormalParams, pstrProcedureName, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, ppdisp)
    end

  end

  @[Extern]

  record IActiveScriptParseProcedure64Vtable,
    query_interface : Proc(IActiveScriptParseProcedure64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptParseProcedure64*, UInt32),
    release : Proc(IActiveScriptParseProcedure64*, UInt32),
    parse_procedure_text : Proc(IActiveScriptParseProcedure64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, UInt64, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptParseProcedure64, lpVtbl : IActiveScriptParseProcedure64Vtable* do
    GUID = LibC::GUID.new(0xc64713b6_u32, 0xe029_u16, 0x4cc5_u16, StaticArray[0x92_u8, 0x0_u8, 0x43_u8, 0x8b_u8, 0x72_u8, 0x89_u8, 0xb_u8, 0x6a_u8])
    def query_interface(this : IActiveScriptParseProcedure64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptParseProcedure64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptParseProcedure64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_procedure_text(this : IActiveScriptParseProcedure64*, pstrCode : Win32cr::Foundation::PWSTR, pstrFormalParams : Win32cr::Foundation::PWSTR, pstrProcedureName : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, punkContext : Void*, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt64, ulStartingLineNumber : UInt32, dwFlags : UInt32, ppdisp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_procedure_text.call(this, pstrCode, pstrFormalParams, pstrProcedureName, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, ppdisp)
    end

  end

  @[Extern]

  record IActiveScriptParseProcedure2_32Vtable,
    query_interface : Proc(IActiveScriptParseProcedure2_32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptParseProcedure2_32*, UInt32),
    release : Proc(IActiveScriptParseProcedure2_32*, UInt32),
    parse_procedure_text : Proc(IActiveScriptParseProcedure2_32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptParseProcedure2_32, lpVtbl : IActiveScriptParseProcedure2_32Vtable* do
    GUID = LibC::GUID.new(0x71ee5b20_u32, 0xfb04_u16, 0x11d1_u16, StaticArray[0xb3_u8, 0xa8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x11_u8, 0xe8_u8, 0xb2_u8])
    def query_interface(this : IActiveScriptParseProcedure2_32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptParseProcedure2_32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptParseProcedure2_32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_procedure_text(this : IActiveScriptParseProcedure2_32*, pstrCode : Win32cr::Foundation::PWSTR, pstrFormalParams : Win32cr::Foundation::PWSTR, pstrProcedureName : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, punkContext : Void*, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt32, ulStartingLineNumber : UInt32, dwFlags : UInt32, ppdisp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_procedure_text.call(this, pstrCode, pstrFormalParams, pstrProcedureName, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, ppdisp)
    end

  end

  @[Extern]

  record IActiveScriptParseProcedure2_64Vtable,
    query_interface : Proc(IActiveScriptParseProcedure2_64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptParseProcedure2_64*, UInt32),
    release : Proc(IActiveScriptParseProcedure2_64*, UInt32),
    parse_procedure_text : Proc(IActiveScriptParseProcedure2_64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, UInt64, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptParseProcedure2_64, lpVtbl : IActiveScriptParseProcedure2_64Vtable* do
    GUID = LibC::GUID.new(0xfe7c4271_u32, 0x210c_u16, 0x448d_u16, StaticArray[0x9f_u8, 0x54_u8, 0x76_u8, 0xda_u8, 0xb7_u8, 0x4_u8, 0x7b_u8, 0x28_u8])
    def query_interface(this : IActiveScriptParseProcedure2_64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptParseProcedure2_64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptParseProcedure2_64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_procedure_text(this : IActiveScriptParseProcedure2_64*, pstrCode : Win32cr::Foundation::PWSTR, pstrFormalParams : Win32cr::Foundation::PWSTR, pstrProcedureName : Win32cr::Foundation::PWSTR, pstrItemName : Win32cr::Foundation::PWSTR, punkContext : Void*, pstrDelimiter : Win32cr::Foundation::PWSTR, dwSourceContextCookie : UInt64, ulStartingLineNumber : UInt32, dwFlags : UInt32, ppdisp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_procedure_text.call(this, pstrCode, pstrFormalParams, pstrProcedureName, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, ppdisp)
    end

  end

  @[Extern]

  record IActiveScriptEncodeVtable,
    query_interface : Proc(IActiveScriptEncode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptEncode*, UInt32),
    release : Proc(IActiveScriptEncode*, UInt32),
    encode_section : Proc(IActiveScriptEncode*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    decode_script : Proc(IActiveScriptEncode*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_encode_prog_id : Proc(IActiveScriptEncode*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptEncode, lpVtbl : IActiveScriptEncodeVtable* do
    GUID = LibC::GUID.new(0xbb1a2ae3_u32, 0xa4f9_u16, 0x11cf_u16, StaticArray[0x8f_u8, 0x20_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x2c_u8, 0xd0_u8, 0x64_u8])
    def query_interface(this : IActiveScriptEncode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptEncode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptEncode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def encode_section(this : IActiveScriptEncode*, pchIn : Win32cr::Foundation::PWSTR, cchIn : UInt32, pchOut : Win32cr::Foundation::PWSTR, cchOut : UInt32, pcchRet : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encode_section.call(this, pchIn, cchIn, pchOut, cchOut, pcchRet)
    end
    def decode_script(this : IActiveScriptEncode*, pchIn : Win32cr::Foundation::PWSTR, cchIn : UInt32, pchOut : Win32cr::Foundation::PWSTR, cchOut : UInt32, pcchRet : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.decode_script.call(this, pchIn, cchIn, pchOut, cchOut, pcchRet)
    end
    def get_encode_prog_id(this : IActiveScriptEncode*, pbstrOut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_encode_prog_id.call(this, pbstrOut)
    end

  end

  @[Extern]

  record IActiveScriptHostEncodeVtable,
    query_interface : Proc(IActiveScriptHostEncode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptHostEncode*, UInt32),
    release : Proc(IActiveScriptHostEncode*, UInt32),
    encode_script_host_file : Proc(IActiveScriptHostEncode*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, UInt32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptHostEncode, lpVtbl : IActiveScriptHostEncodeVtable* do
    GUID = LibC::GUID.new(0xbee9b76e_u32, 0xcfe3_u16, 0x11d1_u16, StaticArray[0xb7_u8, 0x47_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xb0_u8, 0x85_u8])
    def query_interface(this : IActiveScriptHostEncode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptHostEncode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptHostEncode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def encode_script_host_file(this : IActiveScriptHostEncode*, bstrInFile : Win32cr::Foundation::BSTR, pbstrOutFile : Win32cr::Foundation::BSTR*, cFlags : UInt32, bstrDefaultLang : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.encode_script_host_file.call(this, bstrInFile, pbstrOutFile, cFlags, bstrDefaultLang)
    end

  end

  @[Extern]

  record IBindEventHandlerVtable,
    query_interface : Proc(IBindEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBindEventHandler*, UInt32),
    release : Proc(IBindEventHandler*, UInt32),
    bind_handler : Proc(IBindEventHandler*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBindEventHandler, lpVtbl : IBindEventHandlerVtable* do
    GUID = LibC::GUID.new(0x63cdbcb0_u32, 0xc1b1_u16, 0x11d0_u16, StaticArray[0x93_u8, 0x36_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0xca_u8, 0xa9_u8])
    def query_interface(this : IBindEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBindEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBindEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def bind_handler(this : IBindEventHandler*, pstrEvent : Win32cr::Foundation::PWSTR, pdisp : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_handler.call(this, pstrEvent, pdisp)
    end

  end

  @[Extern]

  record IActiveScriptStatsVtable,
    query_interface : Proc(IActiveScriptStats*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptStats*, UInt32),
    release : Proc(IActiveScriptStats*, UInt32),
    get_stat : Proc(IActiveScriptStats*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_stat_ex : Proc(IActiveScriptStats*, LibC::GUID*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    reset_stats : Proc(IActiveScriptStats*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptStats, lpVtbl : IActiveScriptStatsVtable* do
    GUID = LibC::GUID.new(0xb8da6310_u32, 0xe19b_u16, 0x11d0_u16, StaticArray[0x93_u8, 0x3c_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0xca_u8, 0xa9_u8])
    def query_interface(this : IActiveScriptStats*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptStats*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptStats*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_stat(this : IActiveScriptStats*, stid : UInt32, pluHi : UInt32*, pluLo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stat.call(this, stid, pluHi, pluLo)
    end
    def get_stat_ex(this : IActiveScriptStats*, guid : LibC::GUID*, pluHi : UInt32*, pluLo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stat_ex.call(this, guid, pluHi, pluLo)
    end
    def reset_stats(this : IActiveScriptStats*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_stats.call(this)
    end

  end

  @[Extern]

  record IActiveScriptPropertyVtable,
    query_interface : Proc(IActiveScriptProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProperty*, UInt32),
    release : Proc(IActiveScriptProperty*, UInt32),
    get_property : Proc(IActiveScriptProperty*, UInt32, Win32cr::System::Variant::VARIANT*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IActiveScriptProperty*, UInt32, Win32cr::System::Variant::VARIANT*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProperty, lpVtbl : IActiveScriptPropertyVtable* do
    GUID = LibC::GUID.new(0x4954e0d0_u32, 0xfbc7_u16, 0x11d1_u16, StaticArray[0x84_u8, 0x10_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0xc3_u8, 0xfb_u8, 0xfc_u8])
    def query_interface(this : IActiveScriptProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property(this : IActiveScriptProperty*, dwProperty : UInt32, pvarIndex : Win32cr::System::Variant::VARIANT*, pvarValue : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, dwProperty, pvarIndex, pvarValue)
    end
    def set_property(this : IActiveScriptProperty*, dwProperty : UInt32, pvarIndex : Win32cr::System::Variant::VARIANT*, pvarValue : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, dwProperty, pvarIndex, pvarValue)
    end

  end

  @[Extern]

  record ITridentEventSinkVtable,
    query_interface : Proc(ITridentEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITridentEventSink*, UInt32),
    release : Proc(ITridentEventSink*, UInt32),
    fire_event : Proc(ITridentEventSink*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITridentEventSink, lpVtbl : ITridentEventSinkVtable* do
    GUID = LibC::GUID.new(0x1dc9ca50_u32, 0x6ef_u16, 0x11d2_u16, StaticArray[0x84_u8, 0x15_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0xc3_u8, 0xfb_u8, 0xfc_u8])
    def query_interface(this : ITridentEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITridentEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITridentEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def fire_event(this : ITridentEventSink*, pstrEvent : Win32cr::Foundation::PWSTR, pdp : Win32cr::System::Com::DISPPARAMS*, pvarRes : Win32cr::System::Variant::VARIANT*, pei : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_event.call(this, pstrEvent, pdp, pvarRes, pei)
    end

  end

  @[Extern]

  record IActiveScriptGarbageCollectorVtable,
    query_interface : Proc(IActiveScriptGarbageCollector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptGarbageCollector*, UInt32),
    release : Proc(IActiveScriptGarbageCollector*, UInt32),
    collect_garbage : Proc(IActiveScriptGarbageCollector*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTGCTYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptGarbageCollector, lpVtbl : IActiveScriptGarbageCollectorVtable* do
    GUID = LibC::GUID.new(0x6aa2c4a0_u32, 0x2b53_u16, 0x11d4_u16, StaticArray[0xa2_u8, 0xa0_u8, 0x0_u8, 0x10_u8, 0x4b_u8, 0xd3_u8, 0x50_u8, 0x90_u8])
    def query_interface(this : IActiveScriptGarbageCollector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptGarbageCollector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptGarbageCollector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def collect_garbage(this : IActiveScriptGarbageCollector*, scriptgctype : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTGCTYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect_garbage.call(this, scriptgctype)
    end

  end

  @[Extern]

  record IActiveScriptSIPInfoVtable,
    query_interface : Proc(IActiveScriptSIPInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptSIPInfo*, UInt32),
    release : Proc(IActiveScriptSIPInfo*, UInt32),
    get_sipoid : Proc(IActiveScriptSIPInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptSIPInfo, lpVtbl : IActiveScriptSIPInfoVtable* do
    GUID = LibC::GUID.new(0x764651d0_u32, 0x38de_u16, 0x11d4_u16, StaticArray[0xa2_u8, 0xa3_u8, 0x0_u8, 0x10_u8, 0x4b_u8, 0xd3_u8, 0x50_u8, 0x90_u8])
    def query_interface(this : IActiveScriptSIPInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptSIPInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptSIPInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sipoid(this : IActiveScriptSIPInfo*, poid_sip : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sipoid.call(this, poid_sip)
    end

  end

  @[Extern]

  record IActiveScriptSiteTraceInfoVtable,
    query_interface : Proc(IActiveScriptSiteTraceInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptSiteTraceInfo*, UInt32),
    release : Proc(IActiveScriptSiteTraceInfo*, UInt32),
    send_script_trace_info : Proc(IActiveScriptSiteTraceInfo*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTTRACEINFO, LibC::GUID, UInt32, Int32, Int32, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptSiteTraceInfo, lpVtbl : IActiveScriptSiteTraceInfoVtable* do
    GUID = LibC::GUID.new(0x4b7272ae_u32, 0x1955_u16, 0x4bfe_u16, StaticArray[0x98_u8, 0xb0_u8, 0x78_u8, 0x6_u8, 0x21_u8, 0x88_u8, 0x85_u8, 0x69_u8])
    def query_interface(this : IActiveScriptSiteTraceInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptSiteTraceInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptSiteTraceInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def send_script_trace_info(this : IActiveScriptSiteTraceInfo*, stiEventType : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPTTRACEINFO, guidContextID : LibC::GUID, dwScriptContextCookie : UInt32, lScriptStatementStart : Int32, lScriptStatementEnd : Int32, dwReserved : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_script_trace_info.call(this, stiEventType, guidContextID, dwScriptContextCookie, lScriptStatementStart, lScriptStatementEnd, dwReserved)
    end

  end

  @[Extern]

  record IActiveScriptTraceInfoVtable,
    query_interface : Proc(IActiveScriptTraceInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptTraceInfo*, UInt32),
    release : Proc(IActiveScriptTraceInfo*, UInt32),
    start_script_tracing : Proc(IActiveScriptTraceInfo*, Void*, LibC::GUID, Win32cr::Foundation::HRESULT),
    stop_script_tracing : Proc(IActiveScriptTraceInfo*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptTraceInfo, lpVtbl : IActiveScriptTraceInfoVtable* do
    GUID = LibC::GUID.new(0xc35456e7_u32, 0xbebf_u16, 0x4a1b_u16, StaticArray[0x86_u8, 0xa9_u8, 0x24_u8, 0xd5_u8, 0x6b_u8, 0xe8_u8, 0xb3_u8, 0x69_u8])
    def query_interface(this : IActiveScriptTraceInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptTraceInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptTraceInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_script_tracing(this : IActiveScriptTraceInfo*, pSiteTraceInfo : Void*, guidContextID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_script_tracing.call(this, pSiteTraceInfo, guidContextID)
    end
    def stop_script_tracing(this : IActiveScriptTraceInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_script_tracing.call(this)
    end

  end

  @[Extern]

  record IActiveScriptStringCompareVtable,
    query_interface : Proc(IActiveScriptStringCompare*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptStringCompare*, UInt32),
    release : Proc(IActiveScriptStringCompare*, UInt32),
    str_comp : Proc(IActiveScriptStringCompare*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptStringCompare, lpVtbl : IActiveScriptStringCompareVtable* do
    GUID = LibC::GUID.new(0x58562769_u32, 0xed52_u16, 0x42f7_u16, StaticArray[0x84_u8, 0x3_u8, 0x49_u8, 0x63_u8, 0x51_u8, 0x4e_u8, 0x1f_u8, 0x11_u8])
    def query_interface(this : IActiveScriptStringCompare*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptStringCompare*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptStringCompare*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def str_comp(this : IActiveScriptStringCompare*, bszStr1 : Win32cr::Foundation::BSTR, bszStr2 : Win32cr::Foundation::BSTR, iRet : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.str_comp.call(this, bszStr1, bszStr2, iRet)
    end

  end

  @[Extern]

  record IActiveScriptDebug32Vtable,
    query_interface : Proc(IActiveScriptDebug32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptDebug32*, UInt32),
    release : Proc(IActiveScriptDebug32*, UInt32),
    get_script_text_attributes : Proc(IActiveScriptDebug32*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_scriptlet_text_attributes : Proc(IActiveScriptDebug32*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    enum_code_contexts_of_position : Proc(IActiveScriptDebug32*, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptDebug32, lpVtbl : IActiveScriptDebug32Vtable* do
    GUID = LibC::GUID.new(0x51973c10_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IActiveScriptDebug32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptDebug32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptDebug32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_script_text_attributes(this : IActiveScriptDebug32*, pstrCode : Win32cr::Foundation::PWSTR, uNumCodeChars : UInt32, pstrDelimiter : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pattr : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_text_attributes.call(this, pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr)
    end
    def get_scriptlet_text_attributes(this : IActiveScriptDebug32*, pstrCode : Win32cr::Foundation::PWSTR, uNumCodeChars : UInt32, pstrDelimiter : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pattr : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scriptlet_text_attributes.call(this, pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr)
    end
    def enum_code_contexts_of_position(this : IActiveScriptDebug32*, dwSourceContext : UInt32, uCharacterOffset : UInt32, uNumChars : UInt32, ppescc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_code_contexts_of_position.call(this, dwSourceContext, uCharacterOffset, uNumChars, ppescc)
    end

  end

  @[Extern]

  record IActiveScriptDebug64Vtable,
    query_interface : Proc(IActiveScriptDebug64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptDebug64*, UInt32),
    release : Proc(IActiveScriptDebug64*, UInt32),
    get_script_text_attributes : Proc(IActiveScriptDebug64*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_scriptlet_text_attributes : Proc(IActiveScriptDebug64*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    enum_code_contexts_of_position : Proc(IActiveScriptDebug64*, UInt64, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptDebug64, lpVtbl : IActiveScriptDebug64Vtable* do
    GUID = LibC::GUID.new(0xbc437e23_u32, 0xf5b8_u16, 0x47f4_u16, StaticArray[0xbb_u8, 0x79_u8, 0x7d_u8, 0x1c_u8, 0xe5_u8, 0x48_u8, 0x3b_u8, 0x86_u8])
    def query_interface(this : IActiveScriptDebug64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptDebug64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptDebug64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_script_text_attributes(this : IActiveScriptDebug64*, pstrCode : Win32cr::Foundation::PWSTR, uNumCodeChars : UInt32, pstrDelimiter : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pattr : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_text_attributes.call(this, pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr)
    end
    def get_scriptlet_text_attributes(this : IActiveScriptDebug64*, pstrCode : Win32cr::Foundation::PWSTR, uNumCodeChars : UInt32, pstrDelimiter : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pattr : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scriptlet_text_attributes.call(this, pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr)
    end
    def enum_code_contexts_of_position(this : IActiveScriptDebug64*, dwSourceContext : UInt64, uCharacterOffset : UInt32, uNumChars : UInt32, ppescc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_code_contexts_of_position.call(this, dwSourceContext, uCharacterOffset, uNumChars, ppescc)
    end

  end

  @[Extern]

  record IActiveScriptSiteDebug32Vtable,
    query_interface : Proc(IActiveScriptSiteDebug32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptSiteDebug32*, UInt32),
    release : Proc(IActiveScriptSiteDebug32*, UInt32),
    get_document_context_from_position : Proc(IActiveScriptSiteDebug32*, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_application : Proc(IActiveScriptSiteDebug32*, Void**, Win32cr::Foundation::HRESULT),
    get_root_application_node : Proc(IActiveScriptSiteDebug32*, Void**, Win32cr::Foundation::HRESULT),
    on_script_error_debug : Proc(IActiveScriptSiteDebug32*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptSiteDebug32, lpVtbl : IActiveScriptSiteDebug32Vtable* do
    GUID = LibC::GUID.new(0x51973c11_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IActiveScriptSiteDebug32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptSiteDebug32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptSiteDebug32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_document_context_from_position(this : IActiveScriptSiteDebug32*, dwSourceContext : UInt32, uCharacterOffset : UInt32, uNumChars : UInt32, ppsc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_context_from_position.call(this, dwSourceContext, uCharacterOffset, uNumChars, ppsc)
    end
    def get_application(this : IActiveScriptSiteDebug32*, ppda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application.call(this, ppda)
    end
    def get_root_application_node(this : IActiveScriptSiteDebug32*, ppdanRoot : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_application_node.call(this, ppdanRoot)
    end
    def on_script_error_debug(this : IActiveScriptSiteDebug32*, pErrorDebug : Void*, pfEnterDebugger : Win32cr::Foundation::BOOL*, pfCallOnScriptErrorWhenContinuing : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_script_error_debug.call(this, pErrorDebug, pfEnterDebugger, pfCallOnScriptErrorWhenContinuing)
    end

  end

  @[Extern]

  record IActiveScriptSiteDebug64Vtable,
    query_interface : Proc(IActiveScriptSiteDebug64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptSiteDebug64*, UInt32),
    release : Proc(IActiveScriptSiteDebug64*, UInt32),
    get_document_context_from_position : Proc(IActiveScriptSiteDebug64*, UInt64, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_application : Proc(IActiveScriptSiteDebug64*, Void**, Win32cr::Foundation::HRESULT),
    get_root_application_node : Proc(IActiveScriptSiteDebug64*, Void**, Win32cr::Foundation::HRESULT),
    on_script_error_debug : Proc(IActiveScriptSiteDebug64*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptSiteDebug64, lpVtbl : IActiveScriptSiteDebug64Vtable* do
    GUID = LibC::GUID.new(0xd6b96b0a_u32, 0x7463_u16, 0x402c_u16, StaticArray[0x92_u8, 0xac_u8, 0x89_u8, 0x98_u8, 0x42_u8, 0x26_u8, 0x94_u8, 0x2f_u8])
    def query_interface(this : IActiveScriptSiteDebug64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptSiteDebug64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptSiteDebug64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_document_context_from_position(this : IActiveScriptSiteDebug64*, dwSourceContext : UInt64, uCharacterOffset : UInt32, uNumChars : UInt32, ppsc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_context_from_position.call(this, dwSourceContext, uCharacterOffset, uNumChars, ppsc)
    end
    def get_application(this : IActiveScriptSiteDebug64*, ppda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application.call(this, ppda)
    end
    def get_root_application_node(this : IActiveScriptSiteDebug64*, ppdanRoot : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_application_node.call(this, ppdanRoot)
    end
    def on_script_error_debug(this : IActiveScriptSiteDebug64*, pErrorDebug : Void*, pfEnterDebugger : Win32cr::Foundation::BOOL*, pfCallOnScriptErrorWhenContinuing : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_script_error_debug.call(this, pErrorDebug, pfEnterDebugger, pfCallOnScriptErrorWhenContinuing)
    end

  end

  @[Extern]

  record IActiveScriptSiteDebugExVtable,
    query_interface : Proc(IActiveScriptSiteDebugEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptSiteDebugEx*, UInt32),
    release : Proc(IActiveScriptSiteDebugEx*, UInt32),
    on_can_not_jit_script_error_debug : Proc(IActiveScriptSiteDebugEx*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptSiteDebugEx, lpVtbl : IActiveScriptSiteDebugExVtable* do
    GUID = LibC::GUID.new(0xbb722ccb_u32, 0x6ad2_u16, 0x41c6_u16, StaticArray[0xb7_u8, 0x80_u8, 0xaf_u8, 0x9c_u8, 0x3_u8, 0xee_u8, 0x69_u8, 0xf5_u8])
    def query_interface(this : IActiveScriptSiteDebugEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptSiteDebugEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptSiteDebugEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_can_not_jit_script_error_debug(this : IActiveScriptSiteDebugEx*, pErrorDebug : Void*, pfCallOnScriptErrorWhenContinuing : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_can_not_jit_script_error_debug.call(this, pErrorDebug, pfCallOnScriptErrorWhenContinuing)
    end

  end

  @[Extern]

  record IActiveScriptErrorDebugVtable,
    query_interface : Proc(IActiveScriptErrorDebug*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptErrorDebug*, UInt32),
    release : Proc(IActiveScriptErrorDebug*, UInt32),
    get_exception_info : Proc(IActiveScriptErrorDebug*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT),
    get_source_position : Proc(IActiveScriptErrorDebug*, UInt32*, UInt32*, Int32*, Win32cr::Foundation::HRESULT),
    get_source_line_text : Proc(IActiveScriptErrorDebug*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_document_context : Proc(IActiveScriptErrorDebug*, Void**, Win32cr::Foundation::HRESULT),
    get_stack_frame : Proc(IActiveScriptErrorDebug*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptErrorDebug, lpVtbl : IActiveScriptErrorDebugVtable* do
    GUID = LibC::GUID.new(0x51973c12_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IActiveScriptErrorDebug*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptErrorDebug*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptErrorDebug*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_exception_info(this : IActiveScriptErrorDebug*, pexcepinfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exception_info.call(this, pexcepinfo)
    end
    def get_source_position(this : IActiveScriptErrorDebug*, pdwSourceContext : UInt32*, pulLineNumber : UInt32*, plCharacterPosition : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_position.call(this, pdwSourceContext, pulLineNumber, plCharacterPosition)
    end
    def get_source_line_text(this : IActiveScriptErrorDebug*, pbstrSourceLine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_line_text.call(this, pbstrSourceLine)
    end
    def get_document_context(this : IActiveScriptErrorDebug*, ppssc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_context.call(this, ppssc)
    end
    def get_stack_frame(this : IActiveScriptErrorDebug*, ppdsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stack_frame.call(this, ppdsf)
    end

  end

  @[Extern]

  record IDebugCodeContextVtable,
    query_interface : Proc(IDebugCodeContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugCodeContext*, UInt32),
    release : Proc(IDebugCodeContext*, UInt32),
    get_document_context : Proc(IDebugCodeContext*, Void**, Win32cr::Foundation::HRESULT),
    set_break_point : Proc(IDebugCodeContext*, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKPOINT_STATE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugCodeContext, lpVtbl : IDebugCodeContextVtable* do
    GUID = LibC::GUID.new(0x51973c13_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugCodeContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugCodeContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugCodeContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_document_context(this : IDebugCodeContext*, ppsc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_context.call(this, ppsc)
    end
    def set_break_point(this : IDebugCodeContext*, bps : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKPOINT_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_break_point.call(this, bps)
    end

  end

  @[Extern]

  record IDebugExpressionVtable,
    query_interface : Proc(IDebugExpression*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugExpression*, UInt32),
    release : Proc(IDebugExpression*, UInt32),
    start : Proc(IDebugExpression*, Void*, Win32cr::Foundation::HRESULT),
    abort : Proc(IDebugExpression*, Win32cr::Foundation::HRESULT),
    query_is_complete : Proc(IDebugExpression*, Win32cr::Foundation::HRESULT),
    get_result_as_string : Proc(IDebugExpression*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_result_as_debug_property : Proc(IDebugExpression*, Win32cr::Foundation::HRESULT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugExpression, lpVtbl : IDebugExpressionVtable* do
    GUID = LibC::GUID.new(0x51973c14_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugExpression*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugExpression*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugExpression*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : IDebugExpression*, pdecb : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, pdecb)
    end
    def abort(this : IDebugExpression*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def query_is_complete(this : IDebugExpression*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_is_complete.call(this)
    end
    def get_result_as_string(this : IDebugExpression*, phrResult : Win32cr::Foundation::HRESULT*, pbstrResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result_as_string.call(this, phrResult, pbstrResult)
    end
    def get_result_as_debug_property(this : IDebugExpression*, phrResult : Win32cr::Foundation::HRESULT*, ppdp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result_as_debug_property.call(this, phrResult, ppdp)
    end

  end

  @[Extern]

  record IDebugExpressionContextVtable,
    query_interface : Proc(IDebugExpressionContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugExpressionContext*, UInt32),
    release : Proc(IDebugExpressionContext*, UInt32),
    parse_language_text : Proc(IDebugExpressionContext*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_language_info : Proc(IDebugExpressionContext*, Win32cr::Foundation::BSTR*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugExpressionContext, lpVtbl : IDebugExpressionContextVtable* do
    GUID = LibC::GUID.new(0x51973c15_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugExpressionContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugExpressionContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugExpressionContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_language_text(this : IDebugExpressionContext*, pstrCode : Win32cr::Foundation::PWSTR, nRadix : UInt32, pstrDelimiter : Win32cr::Foundation::PWSTR, dwFlags : UInt32, ppe : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_language_text.call(this, pstrCode, nRadix, pstrDelimiter, dwFlags, ppe)
    end
    def get_language_info(this : IDebugExpressionContext*, pbstrLanguageName : Win32cr::Foundation::BSTR*, pLanguageID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_info.call(this, pbstrLanguageName, pLanguageID)
    end

  end

  @[Extern]

  record IDebugExpressionCallBackVtable,
    query_interface : Proc(IDebugExpressionCallBack*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugExpressionCallBack*, UInt32),
    release : Proc(IDebugExpressionCallBack*, UInt32),
    onComplete : Proc(IDebugExpressionCallBack*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugExpressionCallBack, lpVtbl : IDebugExpressionCallBackVtable* do
    GUID = LibC::GUID.new(0x51973c16_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugExpressionCallBack*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugExpressionCallBack*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugExpressionCallBack*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def onComplete(this : IDebugExpressionCallBack*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onComplete.call(this)
    end

  end

  @[Extern]

  record IDebugStackFrameVtable,
    query_interface : Proc(IDebugStackFrame*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugStackFrame*, UInt32),
    release : Proc(IDebugStackFrame*, UInt32),
    get_code_context : Proc(IDebugStackFrame*, Void**, Win32cr::Foundation::HRESULT),
    get_description_string : Proc(IDebugStackFrame*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_language_string : Proc(IDebugStackFrame*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_thread : Proc(IDebugStackFrame*, Void**, Win32cr::Foundation::HRESULT),
    get_debug_property : Proc(IDebugStackFrame*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugStackFrame, lpVtbl : IDebugStackFrameVtable* do
    GUID = LibC::GUID.new(0x51973c17_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugStackFrame*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugStackFrame*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugStackFrame*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_code_context(this : IDebugStackFrame*, ppcc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_context.call(this, ppcc)
    end
    def get_description_string(this : IDebugStackFrame*, fLong : Win32cr::Foundation::BOOL, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description_string.call(this, fLong, pbstrDescription)
    end
    def get_language_string(this : IDebugStackFrame*, fLong : Win32cr::Foundation::BOOL, pbstrLanguage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_string.call(this, fLong, pbstrLanguage)
    end
    def get_thread(this : IDebugStackFrame*, ppat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread.call(this, ppat)
    end
    def get_debug_property(this : IDebugStackFrame*, ppDebugProp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_debug_property.call(this, ppDebugProp)
    end

  end

  @[Extern]

  record IDebugStackFrameSnifferVtable,
    query_interface : Proc(IDebugStackFrameSniffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugStackFrameSniffer*, UInt32),
    release : Proc(IDebugStackFrameSniffer*, UInt32),
    enum_stack_frames : Proc(IDebugStackFrameSniffer*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugStackFrameSniffer, lpVtbl : IDebugStackFrameSnifferVtable* do
    GUID = LibC::GUID.new(0x51973c18_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugStackFrameSniffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugStackFrameSniffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugStackFrameSniffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_stack_frames(this : IDebugStackFrameSniffer*, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_stack_frames.call(this, ppedsf)
    end

  end

  @[Extern]

  record IDebugStackFrameSnifferEx32Vtable,
    query_interface : Proc(IDebugStackFrameSnifferEx32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugStackFrameSnifferEx32*, UInt32),
    release : Proc(IDebugStackFrameSnifferEx32*, UInt32),
    enum_stack_frames : Proc(IDebugStackFrameSnifferEx32*, Void**, Win32cr::Foundation::HRESULT),
    enum_stack_frames_ex32 : Proc(IDebugStackFrameSnifferEx32*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugStackFrameSnifferEx32, lpVtbl : IDebugStackFrameSnifferEx32Vtable* do
    GUID = LibC::GUID.new(0x51973c19_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugStackFrameSnifferEx32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugStackFrameSnifferEx32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugStackFrameSnifferEx32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_stack_frames(this : IDebugStackFrameSnifferEx32*, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_stack_frames.call(this, ppedsf)
    end
    def enum_stack_frames_ex32(this : IDebugStackFrameSnifferEx32*, dwSpMin : UInt32, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_stack_frames_ex32.call(this, dwSpMin, ppedsf)
    end

  end

  @[Extern]

  record IDebugStackFrameSnifferEx64Vtable,
    query_interface : Proc(IDebugStackFrameSnifferEx64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugStackFrameSnifferEx64*, UInt32),
    release : Proc(IDebugStackFrameSnifferEx64*, UInt32),
    enum_stack_frames : Proc(IDebugStackFrameSnifferEx64*, Void**, Win32cr::Foundation::HRESULT),
    enum_stack_frames_ex64 : Proc(IDebugStackFrameSnifferEx64*, UInt64, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugStackFrameSnifferEx64, lpVtbl : IDebugStackFrameSnifferEx64Vtable* do
    GUID = LibC::GUID.new(0x8cd12af4_u32, 0x49c1_u16, 0x4d52_u16, StaticArray[0x8d_u8, 0x8a_u8, 0xc1_u8, 0x46_u8, 0xf4_u8, 0x75_u8, 0x81_u8, 0xaa_u8])
    def query_interface(this : IDebugStackFrameSnifferEx64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugStackFrameSnifferEx64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugStackFrameSnifferEx64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_stack_frames(this : IDebugStackFrameSnifferEx64*, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_stack_frames.call(this, ppedsf)
    end
    def enum_stack_frames_ex64(this : IDebugStackFrameSnifferEx64*, dwSpMin : UInt64, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_stack_frames_ex64.call(this, dwSpMin, ppedsf)
    end

  end

  @[Extern]

  record IDebugSyncOperationVtable,
    query_interface : Proc(IDebugSyncOperation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugSyncOperation*, UInt32),
    release : Proc(IDebugSyncOperation*, UInt32),
    get_target_thread : Proc(IDebugSyncOperation*, Void**, Win32cr::Foundation::HRESULT),
    execute : Proc(IDebugSyncOperation*, Void**, Win32cr::Foundation::HRESULT),
    in_progress_abort : Proc(IDebugSyncOperation*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugSyncOperation, lpVtbl : IDebugSyncOperationVtable* do
    GUID = LibC::GUID.new(0x51973c1a_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugSyncOperation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugSyncOperation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugSyncOperation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_target_thread(this : IDebugSyncOperation*, ppatTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_thread.call(this, ppatTarget)
    end
    def execute(this : IDebugSyncOperation*, ppunkResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute.call(this, ppunkResult)
    end
    def in_progress_abort(this : IDebugSyncOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_progress_abort.call(this)
    end

  end

  @[Extern]

  record IDebugAsyncOperationVtable,
    query_interface : Proc(IDebugAsyncOperation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugAsyncOperation*, UInt32),
    release : Proc(IDebugAsyncOperation*, UInt32),
    get_sync_debug_operation : Proc(IDebugAsyncOperation*, Void**, Win32cr::Foundation::HRESULT),
    start : Proc(IDebugAsyncOperation*, Void*, Win32cr::Foundation::HRESULT),
    abort : Proc(IDebugAsyncOperation*, Win32cr::Foundation::HRESULT),
    query_is_complete : Proc(IDebugAsyncOperation*, Win32cr::Foundation::HRESULT),
    get_result : Proc(IDebugAsyncOperation*, Win32cr::Foundation::HRESULT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugAsyncOperation, lpVtbl : IDebugAsyncOperationVtable* do
    GUID = LibC::GUID.new(0x51973c1b_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugAsyncOperation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugAsyncOperation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugAsyncOperation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sync_debug_operation(this : IDebugAsyncOperation*, ppsdo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_debug_operation.call(this, ppsdo)
    end
    def start(this : IDebugAsyncOperation*, padocb : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, padocb)
    end
    def abort(this : IDebugAsyncOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def query_is_complete(this : IDebugAsyncOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_is_complete.call(this)
    end
    def get_result(this : IDebugAsyncOperation*, phrResult : Win32cr::Foundation::HRESULT*, ppunkResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result.call(this, phrResult, ppunkResult)
    end

  end

  @[Extern]

  record IDebugAsyncOperationCallBackVtable,
    query_interface : Proc(IDebugAsyncOperationCallBack*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugAsyncOperationCallBack*, UInt32),
    release : Proc(IDebugAsyncOperationCallBack*, UInt32),
    onComplete : Proc(IDebugAsyncOperationCallBack*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugAsyncOperationCallBack, lpVtbl : IDebugAsyncOperationCallBackVtable* do
    GUID = LibC::GUID.new(0x51973c1c_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugAsyncOperationCallBack*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugAsyncOperationCallBack*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugAsyncOperationCallBack*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def onComplete(this : IDebugAsyncOperationCallBack*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onComplete.call(this)
    end

  end

  @[Extern]

  record IEnumDebugCodeContextsVtable,
    query_interface : Proc(IEnumDebugCodeContexts*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumDebugCodeContexts*, UInt32),
    release : Proc(IEnumDebugCodeContexts*, UInt32),
    next__ : Proc(IEnumDebugCodeContexts*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumDebugCodeContexts*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumDebugCodeContexts*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumDebugCodeContexts*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumDebugCodeContexts, lpVtbl : IEnumDebugCodeContextsVtable* do
    GUID = LibC::GUID.new(0x51973c1d_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IEnumDebugCodeContexts*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumDebugCodeContexts*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumDebugCodeContexts*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumDebugCodeContexts*, celt : UInt32, pscc : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, pscc, pceltFetched)
    end
    def skip(this : IEnumDebugCodeContexts*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumDebugCodeContexts*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumDebugCodeContexts*, ppescc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppescc)
    end

  end

  @[Extern]

  record IEnumDebugStackFramesVtable,
    query_interface : Proc(IEnumDebugStackFrames*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumDebugStackFrames*, UInt32),
    release : Proc(IEnumDebugStackFrames*, UInt32),
    next__ : Proc(IEnumDebugStackFrames*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::DebugStackFrameDescriptor*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumDebugStackFrames*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumDebugStackFrames*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumDebugStackFrames*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumDebugStackFrames, lpVtbl : IEnumDebugStackFramesVtable* do
    GUID = LibC::GUID.new(0x51973c1e_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IEnumDebugStackFrames*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumDebugStackFrames*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumDebugStackFrames*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumDebugStackFrames*, celt : UInt32, prgdsfd : Win32cr::System::Diagnostics::Debug::ActiveScript::DebugStackFrameDescriptor*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, prgdsfd, pceltFetched)
    end
    def skip(this : IEnumDebugStackFrames*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumDebugStackFrames*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumDebugStackFrames*, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppedsf)
    end

  end

  @[Extern]

  record IEnumDebugStackFrames64Vtable,
    query_interface : Proc(IEnumDebugStackFrames64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumDebugStackFrames64*, UInt32),
    release : Proc(IEnumDebugStackFrames64*, UInt32),
    next__ : Proc(IEnumDebugStackFrames64*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::DebugStackFrameDescriptor*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumDebugStackFrames64*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumDebugStackFrames64*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumDebugStackFrames64*, Void**, Win32cr::Foundation::HRESULT),
    next64 : Proc(IEnumDebugStackFrames64*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::DebugStackFrameDescriptor64*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumDebugStackFrames64, lpVtbl : IEnumDebugStackFrames64Vtable* do
    GUID = LibC::GUID.new(0xdc38853_u32, 0xc1b0_u16, 0x4176_u16, StaticArray[0xa9_u8, 0x84_u8, 0xb2_u8, 0x98_u8, 0x36_u8, 0x10_u8, 0x27_u8, 0xaf_u8])
    def query_interface(this : IEnumDebugStackFrames64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumDebugStackFrames64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumDebugStackFrames64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumDebugStackFrames64*, celt : UInt32, prgdsfd : Win32cr::System::Diagnostics::Debug::ActiveScript::DebugStackFrameDescriptor*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, prgdsfd, pceltFetched)
    end
    def skip(this : IEnumDebugStackFrames64*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumDebugStackFrames64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumDebugStackFrames64*, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppedsf)
    end
    def next64(this : IEnumDebugStackFrames64*, celt : UInt32, prgdsfd : Win32cr::System::Diagnostics::Debug::ActiveScript::DebugStackFrameDescriptor64*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next64.call(this, celt, prgdsfd, pceltFetched)
    end

  end

  @[Extern]

  record IDebugDocumentInfoVtable,
    query_interface : Proc(IDebugDocumentInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentInfo*, UInt32),
    release : Proc(IDebugDocumentInfo*, UInt32),
    get_name : Proc(IDebugDocumentInfo*, Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_document_class_id : Proc(IDebugDocumentInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentInfo, lpVtbl : IDebugDocumentInfoVtable* do
    GUID = LibC::GUID.new(0x51973c1f_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocumentInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IDebugDocumentInfo*, dnt : Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, dnt, pbstrName)
    end
    def get_document_class_id(this : IDebugDocumentInfo*, pclsidDocument : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_class_id.call(this, pclsidDocument)
    end

  end

  @[Extern]

  record IDebugDocumentProviderVtable,
    query_interface : Proc(IDebugDocumentProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentProvider*, UInt32),
    release : Proc(IDebugDocumentProvider*, UInt32),
    get_name : Proc(IDebugDocumentProvider*, Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_document_class_id : Proc(IDebugDocumentProvider*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_document : Proc(IDebugDocumentProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentProvider, lpVtbl : IDebugDocumentProviderVtable* do
    GUID = LibC::GUID.new(0x51973c20_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocumentProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IDebugDocumentProvider*, dnt : Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, dnt, pbstrName)
    end
    def get_document_class_id(this : IDebugDocumentProvider*, pclsidDocument : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_class_id.call(this, pclsidDocument)
    end
    def get_document(this : IDebugDocumentProvider*, ppssd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document.call(this, ppssd)
    end

  end

  @[Extern]

  record IDebugDocumentVtable,
    query_interface : Proc(IDebugDocument*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocument*, UInt32),
    release : Proc(IDebugDocument*, UInt32),
    get_name : Proc(IDebugDocument*, Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_document_class_id : Proc(IDebugDocument*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocument, lpVtbl : IDebugDocumentVtable* do
    GUID = LibC::GUID.new(0x51973c21_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocument*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocument*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocument*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IDebugDocument*, dnt : Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, dnt, pbstrName)
    end
    def get_document_class_id(this : IDebugDocument*, pclsidDocument : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_class_id.call(this, pclsidDocument)
    end

  end

  @[Extern]

  record IDebugDocumentTextVtable,
    query_interface : Proc(IDebugDocumentText*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentText*, UInt32),
    release : Proc(IDebugDocumentText*, UInt32),
    get_name : Proc(IDebugDocumentText*, Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_document_class_id : Proc(IDebugDocumentText*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_document_attributes : Proc(IDebugDocumentText*, UInt32*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IDebugDocumentText*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_position_of_line : Proc(IDebugDocumentText*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_line_of_position : Proc(IDebugDocumentText*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_text : Proc(IDebugDocumentText*, UInt32, Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_position_of_context : Proc(IDebugDocumentText*, Void*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_context_of_position : Proc(IDebugDocumentText*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentText, lpVtbl : IDebugDocumentTextVtable* do
    GUID = LibC::GUID.new(0x51973c22_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocumentText*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentText*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentText*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IDebugDocumentText*, dnt : Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, dnt, pbstrName)
    end
    def get_document_class_id(this : IDebugDocumentText*, pclsidDocument : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_class_id.call(this, pclsidDocument)
    end
    def get_document_attributes(this : IDebugDocumentText*, ptextdocattr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_attributes.call(this, ptextdocattr)
    end
    def get_size(this : IDebugDocumentText*, pcNumLines : UInt32*, pcNumChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pcNumLines, pcNumChars)
    end
    def get_position_of_line(this : IDebugDocumentText*, cLineNumber : UInt32, pcCharacterPosition : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position_of_line.call(this, cLineNumber, pcCharacterPosition)
    end
    def get_line_of_position(this : IDebugDocumentText*, cCharacterPosition : UInt32, pcLineNumber : UInt32*, pcCharacterOffsetInLine : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line_of_position.call(this, cCharacterPosition, pcLineNumber, pcCharacterOffsetInLine)
    end
    def get_text(this : IDebugDocumentText*, cCharacterPosition : UInt32, pcharText : Win32cr::Foundation::PWSTR, pstaTextAttr : UInt16*, pcNumChars : UInt32*, cMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, cCharacterPosition, pcharText, pstaTextAttr, pcNumChars, cMaxChars)
    end
    def get_position_of_context(this : IDebugDocumentText*, psc : Void*, pcCharacterPosition : UInt32*, cNumChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position_of_context.call(this, psc, pcCharacterPosition, cNumChars)
    end
    def get_context_of_position(this : IDebugDocumentText*, cCharacterPosition : UInt32, cNumChars : UInt32, ppsc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_of_position.call(this, cCharacterPosition, cNumChars, ppsc)
    end

  end

  @[Extern]

  record IDebugDocumentTextEventsVtable,
    query_interface : Proc(IDebugDocumentTextEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentTextEvents*, UInt32),
    release : Proc(IDebugDocumentTextEvents*, UInt32),
    onDestroy : Proc(IDebugDocumentTextEvents*, Win32cr::Foundation::HRESULT),
    onInsertText : Proc(IDebugDocumentTextEvents*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    onRemoveText : Proc(IDebugDocumentTextEvents*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    onReplaceText : Proc(IDebugDocumentTextEvents*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    onUpdateTextAttributes : Proc(IDebugDocumentTextEvents*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    onUpdateDocumentAttributes : Proc(IDebugDocumentTextEvents*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentTextEvents, lpVtbl : IDebugDocumentTextEventsVtable* do
    GUID = LibC::GUID.new(0x51973c23_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocumentTextEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentTextEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentTextEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def onDestroy(this : IDebugDocumentTextEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onDestroy.call(this)
    end
    def onInsertText(this : IDebugDocumentTextEvents*, cCharacterPosition : UInt32, cNumToInsert : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onInsertText.call(this, cCharacterPosition, cNumToInsert)
    end
    def onRemoveText(this : IDebugDocumentTextEvents*, cCharacterPosition : UInt32, cNumToRemove : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onRemoveText.call(this, cCharacterPosition, cNumToRemove)
    end
    def onReplaceText(this : IDebugDocumentTextEvents*, cCharacterPosition : UInt32, cNumToReplace : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onReplaceText.call(this, cCharacterPosition, cNumToReplace)
    end
    def onUpdateTextAttributes(this : IDebugDocumentTextEvents*, cCharacterPosition : UInt32, cNumToUpdate : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onUpdateTextAttributes.call(this, cCharacterPosition, cNumToUpdate)
    end
    def onUpdateDocumentAttributes(this : IDebugDocumentTextEvents*, textdocattr : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onUpdateDocumentAttributes.call(this, textdocattr)
    end

  end

  @[Extern]

  record IDebugDocumentTextAuthorVtable,
    query_interface : Proc(IDebugDocumentTextAuthor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentTextAuthor*, UInt32),
    release : Proc(IDebugDocumentTextAuthor*, UInt32),
    get_name : Proc(IDebugDocumentTextAuthor*, Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_document_class_id : Proc(IDebugDocumentTextAuthor*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_document_attributes : Proc(IDebugDocumentTextAuthor*, UInt32*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IDebugDocumentTextAuthor*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_position_of_line : Proc(IDebugDocumentTextAuthor*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_line_of_position : Proc(IDebugDocumentTextAuthor*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_text : Proc(IDebugDocumentTextAuthor*, UInt32, Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_position_of_context : Proc(IDebugDocumentTextAuthor*, Void*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_context_of_position : Proc(IDebugDocumentTextAuthor*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    insert_text : Proc(IDebugDocumentTextAuthor*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    remove_text : Proc(IDebugDocumentTextAuthor*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    replace_text : Proc(IDebugDocumentTextAuthor*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentTextAuthor, lpVtbl : IDebugDocumentTextAuthorVtable* do
    GUID = LibC::GUID.new(0x51973c24_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocumentTextAuthor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentTextAuthor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentTextAuthor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IDebugDocumentTextAuthor*, dnt : Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, dnt, pbstrName)
    end
    def get_document_class_id(this : IDebugDocumentTextAuthor*, pclsidDocument : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_class_id.call(this, pclsidDocument)
    end
    def get_document_attributes(this : IDebugDocumentTextAuthor*, ptextdocattr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_attributes.call(this, ptextdocattr)
    end
    def get_size(this : IDebugDocumentTextAuthor*, pcNumLines : UInt32*, pcNumChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pcNumLines, pcNumChars)
    end
    def get_position_of_line(this : IDebugDocumentTextAuthor*, cLineNumber : UInt32, pcCharacterPosition : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position_of_line.call(this, cLineNumber, pcCharacterPosition)
    end
    def get_line_of_position(this : IDebugDocumentTextAuthor*, cCharacterPosition : UInt32, pcLineNumber : UInt32*, pcCharacterOffsetInLine : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_line_of_position.call(this, cCharacterPosition, pcLineNumber, pcCharacterOffsetInLine)
    end
    def get_text(this : IDebugDocumentTextAuthor*, cCharacterPosition : UInt32, pcharText : Win32cr::Foundation::PWSTR, pstaTextAttr : UInt16*, pcNumChars : UInt32*, cMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, cCharacterPosition, pcharText, pstaTextAttr, pcNumChars, cMaxChars)
    end
    def get_position_of_context(this : IDebugDocumentTextAuthor*, psc : Void*, pcCharacterPosition : UInt32*, cNumChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_position_of_context.call(this, psc, pcCharacterPosition, cNumChars)
    end
    def get_context_of_position(this : IDebugDocumentTextAuthor*, cCharacterPosition : UInt32, cNumChars : UInt32, ppsc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_of_position.call(this, cCharacterPosition, cNumChars, ppsc)
    end
    def insert_text(this : IDebugDocumentTextAuthor*, cCharacterPosition : UInt32, cNumToInsert : UInt32, pcharText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_text.call(this, cCharacterPosition, cNumToInsert, pcharText)
    end
    def remove_text(this : IDebugDocumentTextAuthor*, cCharacterPosition : UInt32, cNumToRemove : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_text.call(this, cCharacterPosition, cNumToRemove)
    end
    def replace_text(this : IDebugDocumentTextAuthor*, cCharacterPosition : UInt32, cNumToReplace : UInt32, pcharText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.replace_text.call(this, cCharacterPosition, cNumToReplace, pcharText)
    end

  end

  @[Extern]

  record IDebugDocumentTextExternalAuthorVtable,
    query_interface : Proc(IDebugDocumentTextExternalAuthor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentTextExternalAuthor*, UInt32),
    release : Proc(IDebugDocumentTextExternalAuthor*, UInt32),
    get_path_name : Proc(IDebugDocumentTextExternalAuthor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_file_name : Proc(IDebugDocumentTextExternalAuthor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    notify_changed : Proc(IDebugDocumentTextExternalAuthor*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentTextExternalAuthor, lpVtbl : IDebugDocumentTextExternalAuthorVtable* do
    GUID = LibC::GUID.new(0x51973c25_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocumentTextExternalAuthor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentTextExternalAuthor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentTextExternalAuthor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_path_name(this : IDebugDocumentTextExternalAuthor*, pbstrLongName : Win32cr::Foundation::BSTR*, pfIsOriginalFile : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path_name.call(this, pbstrLongName, pfIsOriginalFile)
    end
    def get_file_name(this : IDebugDocumentTextExternalAuthor*, pbstrShortName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_name.call(this, pbstrShortName)
    end
    def notify_changed(this : IDebugDocumentTextExternalAuthor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_changed.call(this)
    end

  end

  @[Extern]

  record IDebugDocumentHelper32Vtable,
    query_interface : Proc(IDebugDocumentHelper32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentHelper32*, UInt32),
    release : Proc(IDebugDocumentHelper32*, UInt32),
    init : Proc(IDebugDocumentHelper32*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    attach : Proc(IDebugDocumentHelper32*, Void*, Win32cr::Foundation::HRESULT),
    detach : Proc(IDebugDocumentHelper32*, Win32cr::Foundation::HRESULT),
    add_unicode_text : Proc(IDebugDocumentHelper32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_dbcs_text : Proc(IDebugDocumentHelper32*, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    set_debug_document_host : Proc(IDebugDocumentHelper32*, Void*, Win32cr::Foundation::HRESULT),
    add_deferred_text : Proc(IDebugDocumentHelper32*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    define_script_block : Proc(IDebugDocumentHelper32*, UInt32, UInt32, Void*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    set_default_text_attr : Proc(IDebugDocumentHelper32*, UInt16, Win32cr::Foundation::HRESULT),
    set_text_attributes : Proc(IDebugDocumentHelper32*, UInt32, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    set_long_name : Proc(IDebugDocumentHelper32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_short_name : Proc(IDebugDocumentHelper32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_document_attr : Proc(IDebugDocumentHelper32*, UInt32, Win32cr::Foundation::HRESULT),
    get_debug_application_node : Proc(IDebugDocumentHelper32*, Void**, Win32cr::Foundation::HRESULT),
    get_script_block_info : Proc(IDebugDocumentHelper32*, UInt32, Void**, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    create_debug_document_context : Proc(IDebugDocumentHelper32*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    bring_document_to_top : Proc(IDebugDocumentHelper32*, Win32cr::Foundation::HRESULT),
    bring_document_context_to_top : Proc(IDebugDocumentHelper32*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentHelper32, lpVtbl : IDebugDocumentHelper32Vtable* do
    GUID = LibC::GUID.new(0x51973c26_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocumentHelper32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentHelper32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentHelper32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : IDebugDocumentHelper32*, pda : Void*, pszShortName : Win32cr::Foundation::PWSTR, pszLongName : Win32cr::Foundation::PWSTR, docAttr : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, pda, pszShortName, pszLongName, docAttr)
    end
    def attach(this : IDebugDocumentHelper32*, pddhParent : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach.call(this, pddhParent)
    end
    def detach(this : IDebugDocumentHelper32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.detach.call(this)
    end
    def add_unicode_text(this : IDebugDocumentHelper32*, pszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_unicode_text.call(this, pszText)
    end
    def add_dbcs_text(this : IDebugDocumentHelper32*, pszText : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_dbcs_text.call(this, pszText)
    end
    def set_debug_document_host(this : IDebugDocumentHelper32*, pddh : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_debug_document_host.call(this, pddh)
    end
    def add_deferred_text(this : IDebugDocumentHelper32*, cChars : UInt32, dwTextStartCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_deferred_text.call(this, cChars, dwTextStartCookie)
    end
    def define_script_block(this : IDebugDocumentHelper32*, ulCharOffset : UInt32, cChars : UInt32, pas : Void*, fScriptlet : Win32cr::Foundation::BOOL, pdwSourceContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_script_block.call(this, ulCharOffset, cChars, pas, fScriptlet, pdwSourceContext)
    end
    def set_default_text_attr(this : IDebugDocumentHelper32*, staTextAttr : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_text_attr.call(this, staTextAttr)
    end
    def set_text_attributes(this : IDebugDocumentHelper32*, ulCharOffset : UInt32, cChars : UInt32, pstaTextAttr : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text_attributes.call(this, ulCharOffset, cChars, pstaTextAttr)
    end
    def set_long_name(this : IDebugDocumentHelper32*, pszLongName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_long_name.call(this, pszLongName)
    end
    def set_short_name(this : IDebugDocumentHelper32*, pszShortName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_short_name.call(this, pszShortName)
    end
    def set_document_attr(this : IDebugDocumentHelper32*, pszAttributes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_attr.call(this, pszAttributes)
    end
    def get_debug_application_node(this : IDebugDocumentHelper32*, ppdan : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_debug_application_node.call(this, ppdan)
    end
    def get_script_block_info(this : IDebugDocumentHelper32*, dwSourceContext : UInt32, ppasd : Void**, piCharPos : UInt32*, pcChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_block_info.call(this, dwSourceContext, ppasd, piCharPos, pcChars)
    end
    def create_debug_document_context(this : IDebugDocumentHelper32*, iCharPos : UInt32, cChars : UInt32, ppddc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_debug_document_context.call(this, iCharPos, cChars, ppddc)
    end
    def bring_document_to_top(this : IDebugDocumentHelper32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bring_document_to_top.call(this)
    end
    def bring_document_context_to_top(this : IDebugDocumentHelper32*, pddc : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bring_document_context_to_top.call(this, pddc)
    end

  end

  @[Extern]

  record IDebugDocumentHelper64Vtable,
    query_interface : Proc(IDebugDocumentHelper64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentHelper64*, UInt32),
    release : Proc(IDebugDocumentHelper64*, UInt32),
    init : Proc(IDebugDocumentHelper64*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    attach : Proc(IDebugDocumentHelper64*, Void*, Win32cr::Foundation::HRESULT),
    detach : Proc(IDebugDocumentHelper64*, Win32cr::Foundation::HRESULT),
    add_unicode_text : Proc(IDebugDocumentHelper64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_dbcs_text : Proc(IDebugDocumentHelper64*, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    set_debug_document_host : Proc(IDebugDocumentHelper64*, Void*, Win32cr::Foundation::HRESULT),
    add_deferred_text : Proc(IDebugDocumentHelper64*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    define_script_block : Proc(IDebugDocumentHelper64*, UInt32, UInt32, Void*, Win32cr::Foundation::BOOL, UInt64*, Win32cr::Foundation::HRESULT),
    set_default_text_attr : Proc(IDebugDocumentHelper64*, UInt16, Win32cr::Foundation::HRESULT),
    set_text_attributes : Proc(IDebugDocumentHelper64*, UInt32, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    set_long_name : Proc(IDebugDocumentHelper64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_short_name : Proc(IDebugDocumentHelper64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_document_attr : Proc(IDebugDocumentHelper64*, UInt32, Win32cr::Foundation::HRESULT),
    get_debug_application_node : Proc(IDebugDocumentHelper64*, Void**, Win32cr::Foundation::HRESULT),
    get_script_block_info : Proc(IDebugDocumentHelper64*, UInt64, Void**, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    create_debug_document_context : Proc(IDebugDocumentHelper64*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    bring_document_to_top : Proc(IDebugDocumentHelper64*, Win32cr::Foundation::HRESULT),
    bring_document_context_to_top : Proc(IDebugDocumentHelper64*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentHelper64, lpVtbl : IDebugDocumentHelper64Vtable* do
    GUID = LibC::GUID.new(0xc4c7363c_u32, 0x20fd_u16, 0x47f9_u16, StaticArray[0xbd_u8, 0x82_u8, 0x48_u8, 0x55_u8, 0xe0_u8, 0x15_u8, 0x8_u8, 0x71_u8])
    def query_interface(this : IDebugDocumentHelper64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentHelper64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentHelper64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : IDebugDocumentHelper64*, pda : Void*, pszShortName : Win32cr::Foundation::PWSTR, pszLongName : Win32cr::Foundation::PWSTR, docAttr : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this, pda, pszShortName, pszLongName, docAttr)
    end
    def attach(this : IDebugDocumentHelper64*, pddhParent : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach.call(this, pddhParent)
    end
    def detach(this : IDebugDocumentHelper64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.detach.call(this)
    end
    def add_unicode_text(this : IDebugDocumentHelper64*, pszText : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_unicode_text.call(this, pszText)
    end
    def add_dbcs_text(this : IDebugDocumentHelper64*, pszText : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_dbcs_text.call(this, pszText)
    end
    def set_debug_document_host(this : IDebugDocumentHelper64*, pddh : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_debug_document_host.call(this, pddh)
    end
    def add_deferred_text(this : IDebugDocumentHelper64*, cChars : UInt32, dwTextStartCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_deferred_text.call(this, cChars, dwTextStartCookie)
    end
    def define_script_block(this : IDebugDocumentHelper64*, ulCharOffset : UInt32, cChars : UInt32, pas : Void*, fScriptlet : Win32cr::Foundation::BOOL, pdwSourceContext : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_script_block.call(this, ulCharOffset, cChars, pas, fScriptlet, pdwSourceContext)
    end
    def set_default_text_attr(this : IDebugDocumentHelper64*, staTextAttr : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_text_attr.call(this, staTextAttr)
    end
    def set_text_attributes(this : IDebugDocumentHelper64*, ulCharOffset : UInt32, cChars : UInt32, pstaTextAttr : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text_attributes.call(this, ulCharOffset, cChars, pstaTextAttr)
    end
    def set_long_name(this : IDebugDocumentHelper64*, pszLongName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_long_name.call(this, pszLongName)
    end
    def set_short_name(this : IDebugDocumentHelper64*, pszShortName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_short_name.call(this, pszShortName)
    end
    def set_document_attr(this : IDebugDocumentHelper64*, pszAttributes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_attr.call(this, pszAttributes)
    end
    def get_debug_application_node(this : IDebugDocumentHelper64*, ppdan : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_debug_application_node.call(this, ppdan)
    end
    def get_script_block_info(this : IDebugDocumentHelper64*, dwSourceContext : UInt64, ppasd : Void**, piCharPos : UInt32*, pcChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_block_info.call(this, dwSourceContext, ppasd, piCharPos, pcChars)
    end
    def create_debug_document_context(this : IDebugDocumentHelper64*, iCharPos : UInt32, cChars : UInt32, ppddc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_debug_document_context.call(this, iCharPos, cChars, ppddc)
    end
    def bring_document_to_top(this : IDebugDocumentHelper64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bring_document_to_top.call(this)
    end
    def bring_document_context_to_top(this : IDebugDocumentHelper64*, pddc : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bring_document_context_to_top.call(this, pddc)
    end

  end

  @[Extern]

  record IDebugDocumentHostVtable,
    query_interface : Proc(IDebugDocumentHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentHost*, UInt32),
    release : Proc(IDebugDocumentHost*, UInt32),
    get_deferred_text : Proc(IDebugDocumentHost*, UInt32, Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_script_text_attributes : Proc(IDebugDocumentHost*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    on_create_document_context : Proc(IDebugDocumentHost*, Void**, Win32cr::Foundation::HRESULT),
    get_path_name : Proc(IDebugDocumentHost*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_file_name : Proc(IDebugDocumentHost*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    notify_changed : Proc(IDebugDocumentHost*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentHost, lpVtbl : IDebugDocumentHostVtable* do
    GUID = LibC::GUID.new(0x51973c27_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocumentHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_deferred_text(this : IDebugDocumentHost*, dwTextStartCookie : UInt32, pcharText : Win32cr::Foundation::PWSTR, pstaTextAttr : UInt16*, pcNumChars : UInt32*, cMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_deferred_text.call(this, dwTextStartCookie, pcharText, pstaTextAttr, pcNumChars, cMaxChars)
    end
    def get_script_text_attributes(this : IDebugDocumentHost*, pstrCode : Win32cr::Foundation::PWSTR, uNumCodeChars : UInt32, pstrDelimiter : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pattr : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_text_attributes.call(this, pstrCode, uNumCodeChars, pstrDelimiter, dwFlags, pattr)
    end
    def on_create_document_context(this : IDebugDocumentHost*, ppunkOuter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_create_document_context.call(this, ppunkOuter)
    end
    def get_path_name(this : IDebugDocumentHost*, pbstrLongName : Win32cr::Foundation::BSTR*, pfIsOriginalFile : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path_name.call(this, pbstrLongName, pfIsOriginalFile)
    end
    def get_file_name(this : IDebugDocumentHost*, pbstrShortName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_name.call(this, pbstrShortName)
    end
    def notify_changed(this : IDebugDocumentHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_changed.call(this)
    end

  end

  @[Extern]

  record IDebugDocumentContextVtable,
    query_interface : Proc(IDebugDocumentContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugDocumentContext*, UInt32),
    release : Proc(IDebugDocumentContext*, UInt32),
    get_document : Proc(IDebugDocumentContext*, Void**, Win32cr::Foundation::HRESULT),
    enum_code_contexts : Proc(IDebugDocumentContext*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugDocumentContext, lpVtbl : IDebugDocumentContextVtable* do
    GUID = LibC::GUID.new(0x51973c28_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugDocumentContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugDocumentContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugDocumentContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_document(this : IDebugDocumentContext*, ppsd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document.call(this, ppsd)
    end
    def enum_code_contexts(this : IDebugDocumentContext*, ppescc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_code_contexts.call(this, ppescc)
    end

  end

  @[Extern]

  record IDebugSessionProviderVtable,
    query_interface : Proc(IDebugSessionProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugSessionProvider*, UInt32),
    release : Proc(IDebugSessionProvider*, UInt32),
    start_debug_session : Proc(IDebugSessionProvider*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugSessionProvider, lpVtbl : IDebugSessionProviderVtable* do
    GUID = LibC::GUID.new(0x51973c29_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugSessionProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugSessionProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugSessionProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_debug_session(this : IDebugSessionProvider*, pda : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_debug_session.call(this, pda)
    end

  end

  @[Extern]

  record IApplicationDebuggerVtable,
    query_interface : Proc(IApplicationDebugger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IApplicationDebugger*, UInt32),
    release : Proc(IApplicationDebugger*, UInt32),
    query_alive : Proc(IApplicationDebugger*, Win32cr::Foundation::HRESULT),
    create_instance_at_debugger : Proc(IApplicationDebugger*, LibC::GUID*, Void*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    onDebugOutput : Proc(IApplicationDebugger*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    onHandleBreakPoint : Proc(IApplicationDebugger*, Void*, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKREASON, Void*, Win32cr::Foundation::HRESULT),
    onClose : Proc(IApplicationDebugger*, Win32cr::Foundation::HRESULT),
    onDebuggerEvent : Proc(IApplicationDebugger*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IApplicationDebugger, lpVtbl : IApplicationDebuggerVtable* do
    GUID = LibC::GUID.new(0x51973c2a_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IApplicationDebugger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IApplicationDebugger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IApplicationDebugger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_alive(this : IApplicationDebugger*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_alive.call(this)
    end
    def create_instance_at_debugger(this : IApplicationDebugger*, rclsid : LibC::GUID*, pUnkOuter : Void*, dwClsContext : UInt32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance_at_debugger.call(this, rclsid, pUnkOuter, dwClsContext, riid, ppvObject)
    end
    def onDebugOutput(this : IApplicationDebugger*, pstr : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onDebugOutput.call(this, pstr)
    end
    def onHandleBreakPoint(this : IApplicationDebugger*, prpt : Void*, br : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKREASON, pError : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onHandleBreakPoint.call(this, prpt, br, pError)
    end
    def onClose(this : IApplicationDebugger*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onClose.call(this)
    end
    def onDebuggerEvent(this : IApplicationDebugger*, riid : LibC::GUID*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onDebuggerEvent.call(this, riid, punk)
    end

  end

  @[Extern]

  record IApplicationDebuggerUIVtable,
    query_interface : Proc(IApplicationDebuggerUI*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IApplicationDebuggerUI*, UInt32),
    release : Proc(IApplicationDebuggerUI*, UInt32),
    bring_document_to_top : Proc(IApplicationDebuggerUI*, Void*, Win32cr::Foundation::HRESULT),
    bring_document_context_to_top : Proc(IApplicationDebuggerUI*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IApplicationDebuggerUI, lpVtbl : IApplicationDebuggerUIVtable* do
    GUID = LibC::GUID.new(0x51973c2b_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IApplicationDebuggerUI*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IApplicationDebuggerUI*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IApplicationDebuggerUI*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def bring_document_to_top(this : IApplicationDebuggerUI*, pddt : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bring_document_to_top.call(this, pddt)
    end
    def bring_document_context_to_top(this : IApplicationDebuggerUI*, pddc : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bring_document_context_to_top.call(this, pddc)
    end

  end

  @[Extern]

  record IMachineDebugManagerVtable,
    query_interface : Proc(IMachineDebugManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMachineDebugManager*, UInt32),
    release : Proc(IMachineDebugManager*, UInt32),
    add_application : Proc(IMachineDebugManager*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_application : Proc(IMachineDebugManager*, UInt32, Win32cr::Foundation::HRESULT),
    enum_applications : Proc(IMachineDebugManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMachineDebugManager, lpVtbl : IMachineDebugManagerVtable* do
    GUID = LibC::GUID.new(0x51973c2c_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IMachineDebugManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMachineDebugManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMachineDebugManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_application(this : IMachineDebugManager*, pda : Void*, pdwAppCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_application.call(this, pda, pdwAppCookie)
    end
    def remove_application(this : IMachineDebugManager*, dwAppCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_application.call(this, dwAppCookie)
    end
    def enum_applications(this : IMachineDebugManager*, ppeda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_applications.call(this, ppeda)
    end

  end

  @[Extern]

  record IMachineDebugManagerCookieVtable,
    query_interface : Proc(IMachineDebugManagerCookie*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMachineDebugManagerCookie*, UInt32),
    release : Proc(IMachineDebugManagerCookie*, UInt32),
    add_application : Proc(IMachineDebugManagerCookie*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    remove_application : Proc(IMachineDebugManagerCookie*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_applications : Proc(IMachineDebugManagerCookie*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMachineDebugManagerCookie, lpVtbl : IMachineDebugManagerCookieVtable* do
    GUID = LibC::GUID.new(0x51973c2d_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IMachineDebugManagerCookie*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMachineDebugManagerCookie*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMachineDebugManagerCookie*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_application(this : IMachineDebugManagerCookie*, pda : Void*, dwDebugAppCookie : UInt32, pdwAppCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_application.call(this, pda, dwDebugAppCookie, pdwAppCookie)
    end
    def remove_application(this : IMachineDebugManagerCookie*, dwDebugAppCookie : UInt32, dwAppCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_application.call(this, dwDebugAppCookie, dwAppCookie)
    end
    def enum_applications(this : IMachineDebugManagerCookie*, ppeda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_applications.call(this, ppeda)
    end

  end

  @[Extern]

  record IMachineDebugManagerEventsVtable,
    query_interface : Proc(IMachineDebugManagerEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMachineDebugManagerEvents*, UInt32),
    release : Proc(IMachineDebugManagerEvents*, UInt32),
    onAddApplication : Proc(IMachineDebugManagerEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    onRemoveApplication : Proc(IMachineDebugManagerEvents*, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMachineDebugManagerEvents, lpVtbl : IMachineDebugManagerEventsVtable* do
    GUID = LibC::GUID.new(0x51973c2e_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IMachineDebugManagerEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMachineDebugManagerEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMachineDebugManagerEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def onAddApplication(this : IMachineDebugManagerEvents*, pda : Void*, dwAppCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onAddApplication.call(this, pda, dwAppCookie)
    end
    def onRemoveApplication(this : IMachineDebugManagerEvents*, pda : Void*, dwAppCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onRemoveApplication.call(this, pda, dwAppCookie)
    end

  end

  @[Extern]

  record IProcessDebugManager32Vtable,
    query_interface : Proc(IProcessDebugManager32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProcessDebugManager32*, UInt32),
    release : Proc(IProcessDebugManager32*, UInt32),
    create_application : Proc(IProcessDebugManager32*, Void**, Win32cr::Foundation::HRESULT),
    get_default_application : Proc(IProcessDebugManager32*, Void**, Win32cr::Foundation::HRESULT),
    add_application : Proc(IProcessDebugManager32*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_application : Proc(IProcessDebugManager32*, UInt32, Win32cr::Foundation::HRESULT),
    create_debug_document_helper : Proc(IProcessDebugManager32*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProcessDebugManager32, lpVtbl : IProcessDebugManager32Vtable* do
    GUID = LibC::GUID.new(0x51973c2f_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IProcessDebugManager32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProcessDebugManager32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProcessDebugManager32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_application(this : IProcessDebugManager32*, ppda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application.call(this, ppda)
    end
    def get_default_application(this : IProcessDebugManager32*, ppda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_application.call(this, ppda)
    end
    def add_application(this : IProcessDebugManager32*, pda : Void*, pdwAppCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_application.call(this, pda, pdwAppCookie)
    end
    def remove_application(this : IProcessDebugManager32*, dwAppCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_application.call(this, dwAppCookie)
    end
    def create_debug_document_helper(this : IProcessDebugManager32*, punkOuter : Void*, pddh : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_debug_document_helper.call(this, punkOuter, pddh)
    end

  end

  @[Extern]

  record IProcessDebugManager64Vtable,
    query_interface : Proc(IProcessDebugManager64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProcessDebugManager64*, UInt32),
    release : Proc(IProcessDebugManager64*, UInt32),
    create_application : Proc(IProcessDebugManager64*, Void**, Win32cr::Foundation::HRESULT),
    get_default_application : Proc(IProcessDebugManager64*, Void**, Win32cr::Foundation::HRESULT),
    add_application : Proc(IProcessDebugManager64*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_application : Proc(IProcessDebugManager64*, UInt32, Win32cr::Foundation::HRESULT),
    create_debug_document_helper : Proc(IProcessDebugManager64*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProcessDebugManager64, lpVtbl : IProcessDebugManager64Vtable* do
    GUID = LibC::GUID.new(0x56b9fc1c_u32, 0x63a9_u16, 0x4cc1_u16, StaticArray[0xac_u8, 0x21_u8, 0x8_u8, 0x7d_u8, 0x69_u8, 0xa1_u8, 0x7f_u8, 0xab_u8])
    def query_interface(this : IProcessDebugManager64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProcessDebugManager64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProcessDebugManager64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_application(this : IProcessDebugManager64*, ppda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application.call(this, ppda)
    end
    def get_default_application(this : IProcessDebugManager64*, ppda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_application.call(this, ppda)
    end
    def add_application(this : IProcessDebugManager64*, pda : Void*, pdwAppCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_application.call(this, pda, pdwAppCookie)
    end
    def remove_application(this : IProcessDebugManager64*, dwAppCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_application.call(this, dwAppCookie)
    end
    def create_debug_document_helper(this : IProcessDebugManager64*, punkOuter : Void*, pddh : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_debug_document_helper.call(this, punkOuter, pddh)
    end

  end

  @[Extern]

  record IRemoteDebugApplicationVtable,
    query_interface : Proc(IRemoteDebugApplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDebugApplication*, UInt32),
    release : Proc(IRemoteDebugApplication*, UInt32),
    resume_from_break_point : Proc(IRemoteDebugApplication*, Void*, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION, Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION, Win32cr::Foundation::HRESULT),
    cause_break : Proc(IRemoteDebugApplication*, Win32cr::Foundation::HRESULT),
    connect_debugger : Proc(IRemoteDebugApplication*, Void*, Win32cr::Foundation::HRESULT),
    disconnect_debugger : Proc(IRemoteDebugApplication*, Win32cr::Foundation::HRESULT),
    get_debugger : Proc(IRemoteDebugApplication*, Void**, Win32cr::Foundation::HRESULT),
    create_instance_at_application : Proc(IRemoteDebugApplication*, LibC::GUID*, Void*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    query_alive : Proc(IRemoteDebugApplication*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(IRemoteDebugApplication*, Void**, Win32cr::Foundation::HRESULT),
    get_name : Proc(IRemoteDebugApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_root_node : Proc(IRemoteDebugApplication*, Void**, Win32cr::Foundation::HRESULT),
    enum_global_expression_contexts : Proc(IRemoteDebugApplication*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRemoteDebugApplication, lpVtbl : IRemoteDebugApplicationVtable* do
    GUID = LibC::GUID.new(0x51973c30_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IRemoteDebugApplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDebugApplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDebugApplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def resume_from_break_point(this : IRemoteDebugApplication*, prptFocus : Void*, bra : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION, era : Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_from_break_point.call(this, prptFocus, bra, era)
    end
    def cause_break(this : IRemoteDebugApplication*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cause_break.call(this)
    end
    def connect_debugger(this : IRemoteDebugApplication*, pad : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_debugger.call(this, pad)
    end
    def disconnect_debugger(this : IRemoteDebugApplication*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_debugger.call(this)
    end
    def get_debugger(this : IRemoteDebugApplication*, pad : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_debugger.call(this, pad)
    end
    def create_instance_at_application(this : IRemoteDebugApplication*, rclsid : LibC::GUID*, pUnkOuter : Void*, dwClsContext : UInt32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance_at_application.call(this, rclsid, pUnkOuter, dwClsContext, riid, ppvObject)
    end
    def query_alive(this : IRemoteDebugApplication*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_alive.call(this)
    end
    def enum_threads(this : IRemoteDebugApplication*, pperdat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, pperdat)
    end
    def get_name(this : IRemoteDebugApplication*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pbstrName)
    end
    def get_root_node(this : IRemoteDebugApplication*, ppdanRoot : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_node.call(this, ppdanRoot)
    end
    def enum_global_expression_contexts(this : IRemoteDebugApplication*, ppedec : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_global_expression_contexts.call(this, ppedec)
    end

  end

  @[Extern]

  record IDebugApplication32Vtable,
    query_interface : Proc(IDebugApplication32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplication32*, UInt32),
    release : Proc(IDebugApplication32*, UInt32),
    resume_from_break_point : Proc(IDebugApplication32*, Void*, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION, Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION, Win32cr::Foundation::HRESULT),
    cause_break : Proc(IDebugApplication32*, Win32cr::Foundation::HRESULT),
    connect_debugger : Proc(IDebugApplication32*, Void*, Win32cr::Foundation::HRESULT),
    disconnect_debugger : Proc(IDebugApplication32*, Win32cr::Foundation::HRESULT),
    get_debugger : Proc(IDebugApplication32*, Void**, Win32cr::Foundation::HRESULT),
    create_instance_at_application : Proc(IDebugApplication32*, LibC::GUID*, Void*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    query_alive : Proc(IDebugApplication32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(IDebugApplication32*, Void**, Win32cr::Foundation::HRESULT),
    get_name : Proc(IDebugApplication32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_root_node : Proc(IDebugApplication32*, Void**, Win32cr::Foundation::HRESULT),
    enum_global_expression_contexts : Proc(IDebugApplication32*, Void**, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDebugApplication32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    step_out_complete : Proc(IDebugApplication32*, Win32cr::Foundation::HRESULT),
    debug_output : Proc(IDebugApplication32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    start_debug_session : Proc(IDebugApplication32*, Win32cr::Foundation::HRESULT),
    handle_break_point : Proc(IDebugApplication32*, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKREASON, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION*, Win32cr::Foundation::HRESULT),
    close : Proc(IDebugApplication32*, Win32cr::Foundation::HRESULT),
    get_break_flags : Proc(IDebugApplication32*, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_current_thread : Proc(IDebugApplication32*, Void**, Win32cr::Foundation::HRESULT),
    create_async_debug_operation : Proc(IDebugApplication32*, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_stack_frame_sniffer : Proc(IDebugApplication32*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_stack_frame_sniffer : Proc(IDebugApplication32*, UInt32, Win32cr::Foundation::HRESULT),
    query_current_thread_is_debugger_thread : Proc(IDebugApplication32*, Win32cr::Foundation::HRESULT),
    synchronous_call_in_debugger_thread : Proc(IDebugApplication32*, Void*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    create_application_node : Proc(IDebugApplication32*, Void**, Win32cr::Foundation::HRESULT),
    fire_debugger_event : Proc(IDebugApplication32*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    handle_runtime_error : Proc(IDebugApplication32*, Void*, Void*, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION*, Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    f_can_jit_debug : Proc(IDebugApplication32*, Win32cr::Foundation::BOOL),
    f_is_auto_jit_debug_enabled : Proc(IDebugApplication32*, Win32cr::Foundation::BOOL),
    add_global_expression_context_provider : Proc(IDebugApplication32*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_global_expression_context_provider : Proc(IDebugApplication32*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplication32, lpVtbl : IDebugApplication32Vtable* do
    GUID = LibC::GUID.new(0x51973c32_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugApplication32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplication32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplication32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def resume_from_break_point(this : IDebugApplication32*, prptFocus : Void*, bra : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION, era : Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_from_break_point.call(this, prptFocus, bra, era)
    end
    def cause_break(this : IDebugApplication32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cause_break.call(this)
    end
    def connect_debugger(this : IDebugApplication32*, pad : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_debugger.call(this, pad)
    end
    def disconnect_debugger(this : IDebugApplication32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_debugger.call(this)
    end
    def get_debugger(this : IDebugApplication32*, pad : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_debugger.call(this, pad)
    end
    def create_instance_at_application(this : IDebugApplication32*, rclsid : LibC::GUID*, pUnkOuter : Void*, dwClsContext : UInt32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance_at_application.call(this, rclsid, pUnkOuter, dwClsContext, riid, ppvObject)
    end
    def query_alive(this : IDebugApplication32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_alive.call(this)
    end
    def enum_threads(this : IDebugApplication32*, pperdat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, pperdat)
    end
    def get_name(this : IDebugApplication32*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pbstrName)
    end
    def get_root_node(this : IDebugApplication32*, ppdanRoot : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_node.call(this, ppdanRoot)
    end
    def enum_global_expression_contexts(this : IDebugApplication32*, ppedec : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_global_expression_contexts.call(this, ppedec)
    end
    def set_name(this : IDebugApplication32*, pstrName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, pstrName)
    end
    def step_out_complete(this : IDebugApplication32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.step_out_complete.call(this)
    end
    def debug_output(this : IDebugApplication32*, pstr : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.debug_output.call(this, pstr)
    end
    def start_debug_session(this : IDebugApplication32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_debug_session.call(this)
    end
    def handle_break_point(this : IDebugApplication32*, br : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKREASON, pbra : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_break_point.call(this, br, pbra)
    end
    def close(this : IDebugApplication32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_break_flags(this : IDebugApplication32*, pabf : UInt32*, pprdatSteppingThread : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_break_flags.call(this, pabf, pprdatSteppingThread)
    end
    def get_current_thread(this : IDebugApplication32*, pat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread.call(this, pat)
    end
    def create_async_debug_operation(this : IDebugApplication32*, psdo : Void*, ppado : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_async_debug_operation.call(this, psdo, ppado)
    end
    def add_stack_frame_sniffer(this : IDebugApplication32*, pdsfs : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stack_frame_sniffer.call(this, pdsfs, pdwCookie)
    end
    def remove_stack_frame_sniffer(this : IDebugApplication32*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stack_frame_sniffer.call(this, dwCookie)
    end
    def query_current_thread_is_debugger_thread(this : IDebugApplication32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_current_thread_is_debugger_thread.call(this)
    end
    def synchronous_call_in_debugger_thread(this : IDebugApplication32*, pptc : Void*, dwParam1 : UInt32, dwParam2 : UInt32, dwParam3 : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronous_call_in_debugger_thread.call(this, pptc, dwParam1, dwParam2, dwParam3)
    end
    def create_application_node(this : IDebugApplication32*, ppdanNew : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_node.call(this, ppdanNew)
    end
    def fire_debugger_event(this : IDebugApplication32*, riid : LibC::GUID*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_debugger_event.call(this, riid, punk)
    end
    def handle_runtime_error(this : IDebugApplication32*, pErrorDebug : Void*, pScriptSite : Void*, pbra : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION*, perra : Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION*, pfCallOnScriptError : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_runtime_error.call(this, pErrorDebug, pScriptSite, pbra, perra, pfCallOnScriptError)
    end
    def f_can_jit_debug(this : IDebugApplication32*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.f_can_jit_debug.call(this)
    end
    def f_is_auto_jit_debug_enabled(this : IDebugApplication32*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.f_is_auto_jit_debug_enabled.call(this)
    end
    def add_global_expression_context_provider(this : IDebugApplication32*, pdsfs : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_global_expression_context_provider.call(this, pdsfs, pdwCookie)
    end
    def remove_global_expression_context_provider(this : IDebugApplication32*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_global_expression_context_provider.call(this, dwCookie)
    end

  end

  @[Extern]

  record IDebugApplication64Vtable,
    query_interface : Proc(IDebugApplication64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplication64*, UInt32),
    release : Proc(IDebugApplication64*, UInt32),
    resume_from_break_point : Proc(IDebugApplication64*, Void*, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION, Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION, Win32cr::Foundation::HRESULT),
    cause_break : Proc(IDebugApplication64*, Win32cr::Foundation::HRESULT),
    connect_debugger : Proc(IDebugApplication64*, Void*, Win32cr::Foundation::HRESULT),
    disconnect_debugger : Proc(IDebugApplication64*, Win32cr::Foundation::HRESULT),
    get_debugger : Proc(IDebugApplication64*, Void**, Win32cr::Foundation::HRESULT),
    create_instance_at_application : Proc(IDebugApplication64*, LibC::GUID*, Void*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    query_alive : Proc(IDebugApplication64*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(IDebugApplication64*, Void**, Win32cr::Foundation::HRESULT),
    get_name : Proc(IDebugApplication64*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_root_node : Proc(IDebugApplication64*, Void**, Win32cr::Foundation::HRESULT),
    enum_global_expression_contexts : Proc(IDebugApplication64*, Void**, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDebugApplication64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    step_out_complete : Proc(IDebugApplication64*, Win32cr::Foundation::HRESULT),
    debug_output : Proc(IDebugApplication64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    start_debug_session : Proc(IDebugApplication64*, Win32cr::Foundation::HRESULT),
    handle_break_point : Proc(IDebugApplication64*, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKREASON, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION*, Win32cr::Foundation::HRESULT),
    close : Proc(IDebugApplication64*, Win32cr::Foundation::HRESULT),
    get_break_flags : Proc(IDebugApplication64*, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_current_thread : Proc(IDebugApplication64*, Void**, Win32cr::Foundation::HRESULT),
    create_async_debug_operation : Proc(IDebugApplication64*, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_stack_frame_sniffer : Proc(IDebugApplication64*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_stack_frame_sniffer : Proc(IDebugApplication64*, UInt32, Win32cr::Foundation::HRESULT),
    query_current_thread_is_debugger_thread : Proc(IDebugApplication64*, Win32cr::Foundation::HRESULT),
    synchronous_call_in_debugger_thread : Proc(IDebugApplication64*, Void*, UInt64, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    create_application_node : Proc(IDebugApplication64*, Void**, Win32cr::Foundation::HRESULT),
    fire_debugger_event : Proc(IDebugApplication64*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    handle_runtime_error : Proc(IDebugApplication64*, Void*, Void*, Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION*, Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    f_can_jit_debug : Proc(IDebugApplication64*, Win32cr::Foundation::BOOL),
    f_is_auto_jit_debug_enabled : Proc(IDebugApplication64*, Win32cr::Foundation::BOOL),
    add_global_expression_context_provider : Proc(IDebugApplication64*, Void*, UInt64*, Win32cr::Foundation::HRESULT),
    remove_global_expression_context_provider : Proc(IDebugApplication64*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplication64, lpVtbl : IDebugApplication64Vtable* do
    GUID = LibC::GUID.new(0x4dedc754_u32, 0x4c7_u16, 0x4f10_u16, StaticArray[0x9e_u8, 0x60_u8, 0x16_u8, 0xa3_u8, 0x90_u8, 0xfe_u8, 0x6e_u8, 0x62_u8])
    def query_interface(this : IDebugApplication64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplication64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplication64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def resume_from_break_point(this : IDebugApplication64*, prptFocus : Void*, bra : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION, era : Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_from_break_point.call(this, prptFocus, bra, era)
    end
    def cause_break(this : IDebugApplication64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cause_break.call(this)
    end
    def connect_debugger(this : IDebugApplication64*, pad : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_debugger.call(this, pad)
    end
    def disconnect_debugger(this : IDebugApplication64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_debugger.call(this)
    end
    def get_debugger(this : IDebugApplication64*, pad : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_debugger.call(this, pad)
    end
    def create_instance_at_application(this : IDebugApplication64*, rclsid : LibC::GUID*, pUnkOuter : Void*, dwClsContext : UInt32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance_at_application.call(this, rclsid, pUnkOuter, dwClsContext, riid, ppvObject)
    end
    def query_alive(this : IDebugApplication64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_alive.call(this)
    end
    def enum_threads(this : IDebugApplication64*, pperdat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, pperdat)
    end
    def get_name(this : IDebugApplication64*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pbstrName)
    end
    def get_root_node(this : IDebugApplication64*, ppdanRoot : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_node.call(this, ppdanRoot)
    end
    def enum_global_expression_contexts(this : IDebugApplication64*, ppedec : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_global_expression_contexts.call(this, ppedec)
    end
    def set_name(this : IDebugApplication64*, pstrName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, pstrName)
    end
    def step_out_complete(this : IDebugApplication64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.step_out_complete.call(this)
    end
    def debug_output(this : IDebugApplication64*, pstr : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.debug_output.call(this, pstr)
    end
    def start_debug_session(this : IDebugApplication64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_debug_session.call(this)
    end
    def handle_break_point(this : IDebugApplication64*, br : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKREASON, pbra : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_break_point.call(this, br, pbra)
    end
    def close(this : IDebugApplication64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_break_flags(this : IDebugApplication64*, pabf : UInt32*, pprdatSteppingThread : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_break_flags.call(this, pabf, pprdatSteppingThread)
    end
    def get_current_thread(this : IDebugApplication64*, pat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread.call(this, pat)
    end
    def create_async_debug_operation(this : IDebugApplication64*, psdo : Void*, ppado : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_async_debug_operation.call(this, psdo, ppado)
    end
    def add_stack_frame_sniffer(this : IDebugApplication64*, pdsfs : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stack_frame_sniffer.call(this, pdsfs, pdwCookie)
    end
    def remove_stack_frame_sniffer(this : IDebugApplication64*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stack_frame_sniffer.call(this, dwCookie)
    end
    def query_current_thread_is_debugger_thread(this : IDebugApplication64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_current_thread_is_debugger_thread.call(this)
    end
    def synchronous_call_in_debugger_thread(this : IDebugApplication64*, pptc : Void*, dwParam1 : UInt64, dwParam2 : UInt64, dwParam3 : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronous_call_in_debugger_thread.call(this, pptc, dwParam1, dwParam2, dwParam3)
    end
    def create_application_node(this : IDebugApplication64*, ppdanNew : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_application_node.call(this, ppdanNew)
    end
    def fire_debugger_event(this : IDebugApplication64*, riid : LibC::GUID*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_debugger_event.call(this, riid, punk)
    end
    def handle_runtime_error(this : IDebugApplication64*, pErrorDebug : Void*, pScriptSite : Void*, pbra : Win32cr::System::Diagnostics::Debug::ActiveScript::BREAKRESUMEACTION*, perra : Win32cr::System::Diagnostics::Debug::ActiveScript::ERRORRESUMEACTION*, pfCallOnScriptError : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_runtime_error.call(this, pErrorDebug, pScriptSite, pbra, perra, pfCallOnScriptError)
    end
    def f_can_jit_debug(this : IDebugApplication64*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.f_can_jit_debug.call(this)
    end
    def f_is_auto_jit_debug_enabled(this : IDebugApplication64*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.f_is_auto_jit_debug_enabled.call(this)
    end
    def add_global_expression_context_provider(this : IDebugApplication64*, pdsfs : Void*, pdwCookie : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_global_expression_context_provider.call(this, pdsfs, pdwCookie)
    end
    def remove_global_expression_context_provider(this : IDebugApplication64*, dwCookie : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_global_expression_context_provider.call(this, dwCookie)
    end

  end

  @[Extern]

  record IRemoteDebugApplicationEventsVtable,
    query_interface : Proc(IRemoteDebugApplicationEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDebugApplicationEvents*, UInt32),
    release : Proc(IRemoteDebugApplicationEvents*, UInt32),
    on_connect_debugger : Proc(IRemoteDebugApplicationEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_disconnect_debugger : Proc(IRemoteDebugApplicationEvents*, Win32cr::Foundation::HRESULT),
    on_set_name : Proc(IRemoteDebugApplicationEvents*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    on_debug_output : Proc(IRemoteDebugApplicationEvents*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    on_close : Proc(IRemoteDebugApplicationEvents*, Win32cr::Foundation::HRESULT),
    on_enter_break_point : Proc(IRemoteDebugApplicationEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_leave_break_point : Proc(IRemoteDebugApplicationEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_create_thread : Proc(IRemoteDebugApplicationEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_destroy_thread : Proc(IRemoteDebugApplicationEvents*, Void*, Win32cr::Foundation::HRESULT),
    on_break_flag_change : Proc(IRemoteDebugApplicationEvents*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRemoteDebugApplicationEvents, lpVtbl : IRemoteDebugApplicationEventsVtable* do
    GUID = LibC::GUID.new(0x51973c33_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IRemoteDebugApplicationEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDebugApplicationEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDebugApplicationEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_connect_debugger(this : IRemoteDebugApplicationEvents*, pad : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_connect_debugger.call(this, pad)
    end
    def on_disconnect_debugger(this : IRemoteDebugApplicationEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_disconnect_debugger.call(this)
    end
    def on_set_name(this : IRemoteDebugApplicationEvents*, pstrName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_name.call(this, pstrName)
    end
    def on_debug_output(this : IRemoteDebugApplicationEvents*, pstr : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_debug_output.call(this, pstr)
    end
    def on_close(this : IRemoteDebugApplicationEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_close.call(this)
    end
    def on_enter_break_point(this : IRemoteDebugApplicationEvents*, prdat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_enter_break_point.call(this, prdat)
    end
    def on_leave_break_point(this : IRemoteDebugApplicationEvents*, prdat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_leave_break_point.call(this, prdat)
    end
    def on_create_thread(this : IRemoteDebugApplicationEvents*, prdat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_create_thread.call(this, prdat)
    end
    def on_destroy_thread(this : IRemoteDebugApplicationEvents*, prdat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_destroy_thread.call(this, prdat)
    end
    def on_break_flag_change(this : IRemoteDebugApplicationEvents*, abf : UInt32, prdatSteppingThread : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_break_flag_change.call(this, abf, prdatSteppingThread)
    end

  end

  @[Extern]

  record IDebugApplicationNodeVtable,
    query_interface : Proc(IDebugApplicationNode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplicationNode*, UInt32),
    release : Proc(IDebugApplicationNode*, UInt32),
    get_name : Proc(IDebugApplicationNode*, Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_document_class_id : Proc(IDebugApplicationNode*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_document : Proc(IDebugApplicationNode*, Void**, Win32cr::Foundation::HRESULT),
    enum_children : Proc(IDebugApplicationNode*, Void**, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDebugApplicationNode*, Void**, Win32cr::Foundation::HRESULT),
    set_document_provider : Proc(IDebugApplicationNode*, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IDebugApplicationNode*, Win32cr::Foundation::HRESULT),
    attach : Proc(IDebugApplicationNode*, Void*, Win32cr::Foundation::HRESULT),
    detach : Proc(IDebugApplicationNode*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplicationNode, lpVtbl : IDebugApplicationNodeVtable* do
    GUID = LibC::GUID.new(0x51973c34_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugApplicationNode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplicationNode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplicationNode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IDebugApplicationNode*, dnt : Win32cr::System::Diagnostics::Debug::ActiveScript::DOCUMENTNAMETYPE, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, dnt, pbstrName)
    end
    def get_document_class_id(this : IDebugApplicationNode*, pclsidDocument : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_class_id.call(this, pclsidDocument)
    end
    def get_document(this : IDebugApplicationNode*, ppssd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document.call(this, ppssd)
    end
    def enum_children(this : IDebugApplicationNode*, pperddp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_children.call(this, pperddp)
    end
    def get_parent(this : IDebugApplicationNode*, pprddp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, pprddp)
    end
    def set_document_provider(this : IDebugApplicationNode*, pddp : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_provider.call(this, pddp)
    end
    def close(this : IDebugApplicationNode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def attach(this : IDebugApplicationNode*, pdanParent : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach.call(this, pdanParent)
    end
    def detach(this : IDebugApplicationNode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.detach.call(this)
    end

  end

  @[Extern]

  record IDebugApplicationNodeEventsVtable,
    query_interface : Proc(IDebugApplicationNodeEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplicationNodeEvents*, UInt32),
    release : Proc(IDebugApplicationNodeEvents*, UInt32),
    onAddChild : Proc(IDebugApplicationNodeEvents*, Void*, Win32cr::Foundation::HRESULT),
    onRemoveChild : Proc(IDebugApplicationNodeEvents*, Void*, Win32cr::Foundation::HRESULT),
    onDetach : Proc(IDebugApplicationNodeEvents*, Win32cr::Foundation::HRESULT),
    onAttach : Proc(IDebugApplicationNodeEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplicationNodeEvents, lpVtbl : IDebugApplicationNodeEventsVtable* do
    GUID = LibC::GUID.new(0x51973c35_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugApplicationNodeEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplicationNodeEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplicationNodeEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def onAddChild(this : IDebugApplicationNodeEvents*, prddpChild : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onAddChild.call(this, prddpChild)
    end
    def onRemoveChild(this : IDebugApplicationNodeEvents*, prddpChild : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onRemoveChild.call(this, prddpChild)
    end
    def onDetach(this : IDebugApplicationNodeEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onDetach.call(this)
    end
    def onAttach(this : IDebugApplicationNodeEvents*, prddpParent : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.onAttach.call(this, prddpParent)
    end

  end

  @[Extern]

  record AsyncIDebugApplicationNodeEventsVtable,
    query_interface : Proc(AsyncIDebugApplicationNodeEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(AsyncIDebugApplicationNodeEvents*, UInt32),
    release : Proc(AsyncIDebugApplicationNodeEvents*, UInt32),
    begin_on_add_child : Proc(AsyncIDebugApplicationNodeEvents*, Void*, Win32cr::Foundation::HRESULT),
    finish_on_add_child : Proc(AsyncIDebugApplicationNodeEvents*, Win32cr::Foundation::HRESULT),
    begin_on_remove_child : Proc(AsyncIDebugApplicationNodeEvents*, Void*, Win32cr::Foundation::HRESULT),
    finish_on_remove_child : Proc(AsyncIDebugApplicationNodeEvents*, Win32cr::Foundation::HRESULT),
    begin_on_detach : Proc(AsyncIDebugApplicationNodeEvents*, Win32cr::Foundation::HRESULT),
    finish_on_detach : Proc(AsyncIDebugApplicationNodeEvents*, Win32cr::Foundation::HRESULT),
    begin_on_attach : Proc(AsyncIDebugApplicationNodeEvents*, Void*, Win32cr::Foundation::HRESULT),
    finish_on_attach : Proc(AsyncIDebugApplicationNodeEvents*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record AsyncIDebugApplicationNodeEvents, lpVtbl : AsyncIDebugApplicationNodeEventsVtable* do
    GUID = LibC::GUID.new(0xa2e3aa3b_u32, 0xaa8d_u16, 0x4ebf_u16, StaticArray[0x84_u8, 0xcd_u8, 0x64_u8, 0x8b_u8, 0x73_u8, 0x7b_u8, 0x8c_u8, 0x13_u8])
    def query_interface(this : AsyncIDebugApplicationNodeEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : AsyncIDebugApplicationNodeEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : AsyncIDebugApplicationNodeEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_on_add_child(this : AsyncIDebugApplicationNodeEvents*, prddpChild : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_on_add_child.call(this, prddpChild)
    end
    def finish_on_add_child(this : AsyncIDebugApplicationNodeEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_on_add_child.call(this)
    end
    def begin_on_remove_child(this : AsyncIDebugApplicationNodeEvents*, prddpChild : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_on_remove_child.call(this, prddpChild)
    end
    def finish_on_remove_child(this : AsyncIDebugApplicationNodeEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_on_remove_child.call(this)
    end
    def begin_on_detach(this : AsyncIDebugApplicationNodeEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_on_detach.call(this)
    end
    def finish_on_detach(this : AsyncIDebugApplicationNodeEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_on_detach.call(this)
    end
    def begin_on_attach(this : AsyncIDebugApplicationNodeEvents*, prddpParent : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_on_attach.call(this, prddpParent)
    end
    def finish_on_attach(this : AsyncIDebugApplicationNodeEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_on_attach.call(this)
    end

  end

  @[Extern]

  record IDebugThreadCall32Vtable,
    query_interface : Proc(IDebugThreadCall32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugThreadCall32*, UInt32),
    release : Proc(IDebugThreadCall32*, UInt32),
    thread_call_handler : Proc(IDebugThreadCall32*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugThreadCall32, lpVtbl : IDebugThreadCall32Vtable* do
    GUID = LibC::GUID.new(0x51973c36_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugThreadCall32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugThreadCall32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugThreadCall32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def thread_call_handler(this : IDebugThreadCall32*, dwParam1 : UInt32, dwParam2 : UInt32, dwParam3 : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_call_handler.call(this, dwParam1, dwParam2, dwParam3)
    end

  end

  @[Extern]

  record IDebugThreadCall64Vtable,
    query_interface : Proc(IDebugThreadCall64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugThreadCall64*, UInt32),
    release : Proc(IDebugThreadCall64*, UInt32),
    thread_call_handler : Proc(IDebugThreadCall64*, UInt64, UInt64, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugThreadCall64, lpVtbl : IDebugThreadCall64Vtable* do
    GUID = LibC::GUID.new(0xcb3fa335_u32, 0xe979_u16, 0x42fd_u16, StaticArray[0x9f_u8, 0xcf_u8, 0xa7_u8, 0x54_u8, 0x6a_u8, 0xf_u8, 0x39_u8, 0x5_u8])
    def query_interface(this : IDebugThreadCall64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugThreadCall64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugThreadCall64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def thread_call_handler(this : IDebugThreadCall64*, dwParam1 : UInt64, dwParam2 : UInt64, dwParam3 : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_call_handler.call(this, dwParam1, dwParam2, dwParam3)
    end

  end

  @[Extern]

  record IRemoteDebugApplicationThreadVtable,
    query_interface : Proc(IRemoteDebugApplicationThread*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDebugApplicationThread*, UInt32),
    release : Proc(IRemoteDebugApplicationThread*, UInt32),
    get_system_thread_id : Proc(IRemoteDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT),
    get_application : Proc(IRemoteDebugApplicationThread*, Void**, Win32cr::Foundation::HRESULT),
    enum_stack_frames : Proc(IRemoteDebugApplicationThread*, Void**, Win32cr::Foundation::HRESULT),
    get_description : Proc(IRemoteDebugApplicationThread*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_next_statement : Proc(IRemoteDebugApplicationThread*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_state : Proc(IRemoteDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend : Proc(IRemoteDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT),
    resume : Proc(IRemoteDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT),
    get_suspend_count : Proc(IRemoteDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRemoteDebugApplicationThread, lpVtbl : IRemoteDebugApplicationThreadVtable* do
    GUID = LibC::GUID.new(0x51973c37_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IRemoteDebugApplicationThread*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDebugApplicationThread*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDebugApplicationThread*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_system_thread_id(this : IRemoteDebugApplicationThread*, dwThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_system_thread_id.call(this, dwThreadId)
    end
    def get_application(this : IRemoteDebugApplicationThread*, pprda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application.call(this, pprda)
    end
    def enum_stack_frames(this : IRemoteDebugApplicationThread*, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_stack_frames.call(this, ppedsf)
    end
    def get_description(this : IRemoteDebugApplicationThread*, pbstrDescription : Win32cr::Foundation::BSTR*, pbstrState : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription, pbstrState)
    end
    def set_next_statement(this : IRemoteDebugApplicationThread*, pStackFrame : Void*, pCodeContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_next_statement.call(this, pStackFrame, pCodeContext)
    end
    def get_state(this : IRemoteDebugApplicationThread*, pState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pState)
    end
    def suspend(this : IRemoteDebugApplicationThread*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this, pdwCount)
    end
    def resume(this : IRemoteDebugApplicationThread*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this, pdwCount)
    end
    def get_suspend_count(this : IRemoteDebugApplicationThread*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_suspend_count.call(this, pdwCount)
    end

  end

  @[Extern]

  record IDebugApplicationThreadVtable,
    query_interface : Proc(IDebugApplicationThread*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplicationThread*, UInt32),
    release : Proc(IDebugApplicationThread*, UInt32),
    get_system_thread_id : Proc(IDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT),
    get_application : Proc(IDebugApplicationThread*, Void**, Win32cr::Foundation::HRESULT),
    enum_stack_frames : Proc(IDebugApplicationThread*, Void**, Win32cr::Foundation::HRESULT),
    get_description : Proc(IDebugApplicationThread*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_next_statement : Proc(IDebugApplicationThread*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_state : Proc(IDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend : Proc(IDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT),
    resume : Proc(IDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT),
    get_suspend_count : Proc(IDebugApplicationThread*, UInt32*, Win32cr::Foundation::HRESULT),
    synchronous_call_into_thread32 : Proc(IDebugApplicationThread*, Void*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    query_is_current_thread : Proc(IDebugApplicationThread*, Win32cr::Foundation::HRESULT),
    query_is_debugger_thread : Proc(IDebugApplicationThread*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IDebugApplicationThread*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_state_string : Proc(IDebugApplicationThread*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplicationThread, lpVtbl : IDebugApplicationThreadVtable* do
    GUID = LibC::GUID.new(0x51973c38_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugApplicationThread*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplicationThread*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplicationThread*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_system_thread_id(this : IDebugApplicationThread*, dwThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_system_thread_id.call(this, dwThreadId)
    end
    def get_application(this : IDebugApplicationThread*, pprda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application.call(this, pprda)
    end
    def enum_stack_frames(this : IDebugApplicationThread*, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_stack_frames.call(this, ppedsf)
    end
    def get_description(this : IDebugApplicationThread*, pbstrDescription : Win32cr::Foundation::BSTR*, pbstrState : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription, pbstrState)
    end
    def set_next_statement(this : IDebugApplicationThread*, pStackFrame : Void*, pCodeContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_next_statement.call(this, pStackFrame, pCodeContext)
    end
    def get_state(this : IDebugApplicationThread*, pState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pState)
    end
    def suspend(this : IDebugApplicationThread*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this, pdwCount)
    end
    def resume(this : IDebugApplicationThread*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this, pdwCount)
    end
    def get_suspend_count(this : IDebugApplicationThread*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_suspend_count.call(this, pdwCount)
    end
    def synchronous_call_into_thread32(this : IDebugApplicationThread*, pstcb : Void*, dwParam1 : UInt32, dwParam2 : UInt32, dwParam3 : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronous_call_into_thread32.call(this, pstcb, dwParam1, dwParam2, dwParam3)
    end
    def query_is_current_thread(this : IDebugApplicationThread*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_is_current_thread.call(this)
    end
    def query_is_debugger_thread(this : IDebugApplicationThread*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_is_debugger_thread.call(this)
    end
    def set_description(this : IDebugApplicationThread*, pstrDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, pstrDescription)
    end
    def set_state_string(this : IDebugApplicationThread*, pstrState : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state_string.call(this, pstrState)
    end

  end

  @[Extern]

  record IDebugApplicationThread64Vtable,
    query_interface : Proc(IDebugApplicationThread64*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplicationThread64*, UInt32),
    release : Proc(IDebugApplicationThread64*, UInt32),
    get_system_thread_id : Proc(IDebugApplicationThread64*, UInt32*, Win32cr::Foundation::HRESULT),
    get_application : Proc(IDebugApplicationThread64*, Void**, Win32cr::Foundation::HRESULT),
    enum_stack_frames : Proc(IDebugApplicationThread64*, Void**, Win32cr::Foundation::HRESULT),
    get_description : Proc(IDebugApplicationThread64*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_next_statement : Proc(IDebugApplicationThread64*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_state : Proc(IDebugApplicationThread64*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend : Proc(IDebugApplicationThread64*, UInt32*, Win32cr::Foundation::HRESULT),
    resume : Proc(IDebugApplicationThread64*, UInt32*, Win32cr::Foundation::HRESULT),
    get_suspend_count : Proc(IDebugApplicationThread64*, UInt32*, Win32cr::Foundation::HRESULT),
    synchronous_call_into_thread32 : Proc(IDebugApplicationThread64*, Void*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    query_is_current_thread : Proc(IDebugApplicationThread64*, Win32cr::Foundation::HRESULT),
    query_is_debugger_thread : Proc(IDebugApplicationThread64*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IDebugApplicationThread64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_state_string : Proc(IDebugApplicationThread64*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    synchronous_call_into_thread64 : Proc(IDebugApplicationThread64*, Void*, UInt64, UInt64, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplicationThread64, lpVtbl : IDebugApplicationThread64Vtable* do
    GUID = LibC::GUID.new(0x9dac5886_u32, 0xdbad_u16, 0x456d_u16, StaticArray[0x9d_u8, 0xee_u8, 0x5d_u8, 0xec_u8, 0x39_u8, 0xab_u8, 0x3d_u8, 0xda_u8])
    def query_interface(this : IDebugApplicationThread64*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplicationThread64*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplicationThread64*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_system_thread_id(this : IDebugApplicationThread64*, dwThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_system_thread_id.call(this, dwThreadId)
    end
    def get_application(this : IDebugApplicationThread64*, pprda : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application.call(this, pprda)
    end
    def enum_stack_frames(this : IDebugApplicationThread64*, ppedsf : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_stack_frames.call(this, ppedsf)
    end
    def get_description(this : IDebugApplicationThread64*, pbstrDescription : Win32cr::Foundation::BSTR*, pbstrState : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription, pbstrState)
    end
    def set_next_statement(this : IDebugApplicationThread64*, pStackFrame : Void*, pCodeContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_next_statement.call(this, pStackFrame, pCodeContext)
    end
    def get_state(this : IDebugApplicationThread64*, pState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pState)
    end
    def suspend(this : IDebugApplicationThread64*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend.call(this, pdwCount)
    end
    def resume(this : IDebugApplicationThread64*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this, pdwCount)
    end
    def get_suspend_count(this : IDebugApplicationThread64*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_suspend_count.call(this, pdwCount)
    end
    def synchronous_call_into_thread32(this : IDebugApplicationThread64*, pstcb : Void*, dwParam1 : UInt32, dwParam2 : UInt32, dwParam3 : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronous_call_into_thread32.call(this, pstcb, dwParam1, dwParam2, dwParam3)
    end
    def query_is_current_thread(this : IDebugApplicationThread64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_is_current_thread.call(this)
    end
    def query_is_debugger_thread(this : IDebugApplicationThread64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_is_debugger_thread.call(this)
    end
    def set_description(this : IDebugApplicationThread64*, pstrDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, pstrDescription)
    end
    def set_state_string(this : IDebugApplicationThread64*, pstrState : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state_string.call(this, pstrState)
    end
    def synchronous_call_into_thread64(this : IDebugApplicationThread64*, pstcb : Void*, dwParam1 : UInt64, dwParam2 : UInt64, dwParam3 : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronous_call_into_thread64.call(this, pstcb, dwParam1, dwParam2, dwParam3)
    end

  end

  @[Extern]

  record IDebugCookieVtable,
    query_interface : Proc(IDebugCookie*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugCookie*, UInt32),
    release : Proc(IDebugCookie*, UInt32),
    set_debug_cookie : Proc(IDebugCookie*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugCookie, lpVtbl : IDebugCookieVtable* do
    GUID = LibC::GUID.new(0x51973c39_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugCookie*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugCookie*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugCookie*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_debug_cookie(this : IDebugCookie*, dwDebugAppCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_debug_cookie.call(this, dwDebugAppCookie)
    end

  end

  @[Extern]

  record IEnumDebugApplicationNodesVtable,
    query_interface : Proc(IEnumDebugApplicationNodes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumDebugApplicationNodes*, UInt32),
    release : Proc(IEnumDebugApplicationNodes*, UInt32),
    next__ : Proc(IEnumDebugApplicationNodes*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumDebugApplicationNodes*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumDebugApplicationNodes*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumDebugApplicationNodes*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumDebugApplicationNodes, lpVtbl : IEnumDebugApplicationNodesVtable* do
    GUID = LibC::GUID.new(0x51973c3a_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IEnumDebugApplicationNodes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumDebugApplicationNodes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumDebugApplicationNodes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumDebugApplicationNodes*, celt : UInt32, pprddp : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, pprddp, pceltFetched)
    end
    def skip(this : IEnumDebugApplicationNodes*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumDebugApplicationNodes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumDebugApplicationNodes*, pperddp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, pperddp)
    end

  end

  @[Extern]

  record IEnumRemoteDebugApplicationsVtable,
    query_interface : Proc(IEnumRemoteDebugApplications*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumRemoteDebugApplications*, UInt32),
    release : Proc(IEnumRemoteDebugApplications*, UInt32),
    next__ : Proc(IEnumRemoteDebugApplications*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumRemoteDebugApplications*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumRemoteDebugApplications*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumRemoteDebugApplications*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumRemoteDebugApplications, lpVtbl : IEnumRemoteDebugApplicationsVtable* do
    GUID = LibC::GUID.new(0x51973c3b_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IEnumRemoteDebugApplications*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumRemoteDebugApplications*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumRemoteDebugApplications*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumRemoteDebugApplications*, celt : UInt32, ppda : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppda, pceltFetched)
    end
    def skip(this : IEnumRemoteDebugApplications*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumRemoteDebugApplications*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumRemoteDebugApplications*, ppessd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppessd)
    end

  end

  @[Extern]

  record IEnumRemoteDebugApplicationThreadsVtable,
    query_interface : Proc(IEnumRemoteDebugApplicationThreads*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumRemoteDebugApplicationThreads*, UInt32),
    release : Proc(IEnumRemoteDebugApplicationThreads*, UInt32),
    next__ : Proc(IEnumRemoteDebugApplicationThreads*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumRemoteDebugApplicationThreads*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumRemoteDebugApplicationThreads*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumRemoteDebugApplicationThreads*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumRemoteDebugApplicationThreads, lpVtbl : IEnumRemoteDebugApplicationThreadsVtable* do
    GUID = LibC::GUID.new(0x51973c3c_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IEnumRemoteDebugApplicationThreads*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumRemoteDebugApplicationThreads*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumRemoteDebugApplicationThreads*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumRemoteDebugApplicationThreads*, celt : UInt32, pprdat : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, pprdat, pceltFetched)
    end
    def skip(this : IEnumRemoteDebugApplicationThreads*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumRemoteDebugApplicationThreads*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumRemoteDebugApplicationThreads*, pperdat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, pperdat)
    end

  end

  @[Extern]

  record IDebugFormatterVtable,
    query_interface : Proc(IDebugFormatter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugFormatter*, UInt32),
    release : Proc(IDebugFormatter*, UInt32),
    get_string_for_variant : Proc(IDebugFormatter*, Win32cr::System::Variant::VARIANT*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_variant_for_string : Proc(IDebugFormatter*, Win32cr::Foundation::PWSTR, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    get_string_for_var_type : Proc(IDebugFormatter*, Win32cr::System::Variant::VARENUM, Win32cr::System::Com::TYPEDESC*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugFormatter, lpVtbl : IDebugFormatterVtable* do
    GUID = LibC::GUID.new(0x51973c05_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugFormatter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugFormatter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugFormatter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_string_for_variant(this : IDebugFormatter*, pvar : Win32cr::System::Variant::VARIANT*, nRadix : UInt32, pbstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_for_variant.call(this, pvar, nRadix, pbstrValue)
    end
    def get_variant_for_string(this : IDebugFormatter*, pwstrValue : Win32cr::Foundation::PWSTR, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_variant_for_string.call(this, pwstrValue, pvar)
    end
    def get_string_for_var_type(this : IDebugFormatter*, vt : Win32cr::System::Variant::VARENUM, ptdescArrayType : Win32cr::System::Com::TYPEDESC*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_for_var_type.call(this, vt, ptdescArrayType, pbstr)
    end

  end

  @[Extern]

  record ISimpleConnectionPointVtable,
    query_interface : Proc(ISimpleConnectionPoint*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISimpleConnectionPoint*, UInt32),
    release : Proc(ISimpleConnectionPoint*, UInt32),
    get_event_count : Proc(ISimpleConnectionPoint*, UInt32*, Win32cr::Foundation::HRESULT),
    describe_events : Proc(ISimpleConnectionPoint*, UInt32, UInt32, Int32*, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    advise : Proc(ISimpleConnectionPoint*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(ISimpleConnectionPoint*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISimpleConnectionPoint, lpVtbl : ISimpleConnectionPointVtable* do
    GUID = LibC::GUID.new(0x51973c3e_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : ISimpleConnectionPoint*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISimpleConnectionPoint*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISimpleConnectionPoint*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_event_count(this : ISimpleConnectionPoint*, pulCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_count.call(this, pulCount)
    end
    def describe_events(this : ISimpleConnectionPoint*, iEvent : UInt32, cEvents : UInt32, prgid : Int32*, prgbstr : Win32cr::Foundation::BSTR*, pcEventsFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.describe_events.call(this, iEvent, cEvents, prgid, prgbstr, pcEventsFetched)
    end
    def advise(this : ISimpleConnectionPoint*, pdisp : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, pdisp, pdwCookie)
    end
    def unadvise(this : ISimpleConnectionPoint*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, dwCookie)
    end

  end

  @[Extern]

  record IDebugHelperVtable,
    query_interface : Proc(IDebugHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugHelper*, UInt32),
    release : Proc(IDebugHelper*, UInt32),
    create_property_browser : Proc(IDebugHelper*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_property_browser_ex : Proc(IDebugHelper*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::PWSTR, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_simple_connection_point : Proc(IDebugHelper*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugHelper, lpVtbl : IDebugHelperVtable* do
    GUID = LibC::GUID.new(0x51973c3f_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IDebugHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_property_browser(this : IDebugHelper*, pvar : Win32cr::System::Variant::VARIANT*, bstrName : Win32cr::Foundation::PWSTR, pdat : Void*, ppdob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_browser.call(this, pvar, bstrName, pdat, ppdob)
    end
    def create_property_browser_ex(this : IDebugHelper*, pvar : Win32cr::System::Variant::VARIANT*, bstrName : Win32cr::Foundation::PWSTR, pdat : Void*, pdf : Void*, ppdob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_browser_ex.call(this, pvar, bstrName, pdat, pdf, ppdob)
    end
    def create_simple_connection_point(this : IDebugHelper*, pdisp : Void*, ppscp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_simple_connection_point.call(this, pdisp, ppscp)
    end

  end

  @[Extern]

  record IEnumDebugExpressionContextsVtable,
    query_interface : Proc(IEnumDebugExpressionContexts*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumDebugExpressionContexts*, UInt32),
    release : Proc(IEnumDebugExpressionContexts*, UInt32),
    next__ : Proc(IEnumDebugExpressionContexts*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumDebugExpressionContexts*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumDebugExpressionContexts*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumDebugExpressionContexts*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumDebugExpressionContexts, lpVtbl : IEnumDebugExpressionContextsVtable* do
    GUID = LibC::GUID.new(0x51973c40_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IEnumDebugExpressionContexts*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumDebugExpressionContexts*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumDebugExpressionContexts*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumDebugExpressionContexts*, celt : UInt32, ppdec : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppdec, pceltFetched)
    end
    def skip(this : IEnumDebugExpressionContexts*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumDebugExpressionContexts*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumDebugExpressionContexts*, ppedec : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppedec)
    end

  end

  @[Extern]

  record IProvideExpressionContextsVtable,
    query_interface : Proc(IProvideExpressionContexts*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProvideExpressionContexts*, UInt32),
    release : Proc(IProvideExpressionContexts*, UInt32),
    enum_expression_contexts : Proc(IProvideExpressionContexts*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProvideExpressionContexts, lpVtbl : IProvideExpressionContextsVtable* do
    GUID = LibC::GUID.new(0x51973c41_u32, 0xcb0c_u16, 0x11d0_u16, StaticArray[0xb5_u8, 0xc9_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0x4a_u8, 0xe_u8, 0x7a_u8])
    def query_interface(this : IProvideExpressionContexts*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProvideExpressionContexts*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProvideExpressionContexts*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_expression_contexts(this : IProvideExpressionContexts*, ppedec : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_expression_contexts.call(this, ppedec)
    end

  end

  @[Extern]

  record IActiveScriptProfilerControlVtable,
    query_interface : Proc(IActiveScriptProfilerControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProfilerControl*, UInt32),
    release : Proc(IActiveScriptProfilerControl*, UInt32),
    start_profiling : Proc(IActiveScriptProfilerControl*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_profiler_event_mask : Proc(IActiveScriptProfilerControl*, UInt32, Win32cr::Foundation::HRESULT),
    stop_profiling : Proc(IActiveScriptProfilerControl*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProfilerControl, lpVtbl : IActiveScriptProfilerControlVtable* do
    GUID = LibC::GUID.new(0x784b5ff0_u32, 0x69b0_u16, 0x47d1_u16, StaticArray[0xa7_u8, 0xdc_u8, 0x25_u8, 0x18_u8, 0xf4_u8, 0x23_u8, 0xe_u8, 0x90_u8])
    def query_interface(this : IActiveScriptProfilerControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProfilerControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProfilerControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_profiling(this : IActiveScriptProfilerControl*, clsidProfilerObject : LibC::GUID*, dwEventMask : UInt32, dwContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_profiling.call(this, clsidProfilerObject, dwEventMask, dwContext)
    end
    def set_profiler_event_mask(this : IActiveScriptProfilerControl*, dwEventMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_profiler_event_mask.call(this, dwEventMask)
    end
    def stop_profiling(this : IActiveScriptProfilerControl*, hrShutdownReason : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_profiling.call(this, hrShutdownReason)
    end

  end

  @[Extern]

  record IActiveScriptProfilerControl2Vtable,
    query_interface : Proc(IActiveScriptProfilerControl2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProfilerControl2*, UInt32),
    release : Proc(IActiveScriptProfilerControl2*, UInt32),
    start_profiling : Proc(IActiveScriptProfilerControl2*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_profiler_event_mask : Proc(IActiveScriptProfilerControl2*, UInt32, Win32cr::Foundation::HRESULT),
    stop_profiling : Proc(IActiveScriptProfilerControl2*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    complete_profiler_start : Proc(IActiveScriptProfilerControl2*, Win32cr::Foundation::HRESULT),
    prepare_profiler_stop : Proc(IActiveScriptProfilerControl2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProfilerControl2, lpVtbl : IActiveScriptProfilerControl2Vtable* do
    GUID = LibC::GUID.new(0x47810165_u32, 0x498f_u16, 0x40be_u16, StaticArray[0x94_u8, 0xf1_u8, 0x65_u8, 0x35_u8, 0x57_u8, 0xe9_u8, 0xe7_u8, 0xda_u8])
    def query_interface(this : IActiveScriptProfilerControl2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProfilerControl2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProfilerControl2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_profiling(this : IActiveScriptProfilerControl2*, clsidProfilerObject : LibC::GUID*, dwEventMask : UInt32, dwContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_profiling.call(this, clsidProfilerObject, dwEventMask, dwContext)
    end
    def set_profiler_event_mask(this : IActiveScriptProfilerControl2*, dwEventMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_profiler_event_mask.call(this, dwEventMask)
    end
    def stop_profiling(this : IActiveScriptProfilerControl2*, hrShutdownReason : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_profiling.call(this, hrShutdownReason)
    end
    def complete_profiler_start(this : IActiveScriptProfilerControl2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete_profiler_start.call(this)
    end
    def prepare_profiler_stop(this : IActiveScriptProfilerControl2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_profiler_stop.call(this)
    end

  end

  @[Extern]

  record IActiveScriptProfilerHeapEnumVtable,
    query_interface : Proc(IActiveScriptProfilerHeapEnum*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProfilerHeapEnum*, UInt32),
    release : Proc(IActiveScriptProfilerHeapEnum*, UInt32),
    next__ : Proc(IActiveScriptProfilerHeapEnum*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT**, UInt32*, Win32cr::Foundation::HRESULT),
    get_optional_info : Proc(IActiveScriptProfilerHeapEnum*, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_OPTIONAL_INFO*, Win32cr::Foundation::HRESULT),
    free_object_and_optional_info : Proc(IActiveScriptProfilerHeapEnum*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT**, Win32cr::Foundation::HRESULT),
    get_name_id_map : Proc(IActiveScriptProfilerHeapEnum*, Win32cr::Foundation::PWSTR***, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProfilerHeapEnum, lpVtbl : IActiveScriptProfilerHeapEnumVtable* do
    GUID = LibC::GUID.new(0x32e4694e_u32, 0xd37_u16, 0x419b_u16, StaticArray[0xb9_u8, 0x3d_u8, 0xfa_u8, 0x20_u8, 0xde_u8, 0xd6_u8, 0xe8_u8, 0xea_u8])
    def query_interface(this : IActiveScriptProfilerHeapEnum*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProfilerHeapEnum*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProfilerHeapEnum*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IActiveScriptProfilerHeapEnum*, celt : UInt32, heapObjects : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, heapObjects, pceltFetched)
    end
    def get_optional_info(this : IActiveScriptProfilerHeapEnum*, heapObject : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT*, celt : UInt32, optionalInfo : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT_OPTIONAL_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_optional_info.call(this, heapObject, celt, optionalInfo)
    end
    def free_object_and_optional_info(this : IActiveScriptProfilerHeapEnum*, celt : UInt32, heapObjects : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_OBJECT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_object_and_optional_info.call(this, celt, heapObjects)
    end
    def get_name_id_map(this : IActiveScriptProfilerHeapEnum*, pNameList : Win32cr::Foundation::PWSTR***, pcelt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name_id_map.call(this, pNameList, pcelt)
    end

  end

  @[Extern]

  record IActiveScriptProfilerControl3Vtable,
    query_interface : Proc(IActiveScriptProfilerControl3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProfilerControl3*, UInt32),
    release : Proc(IActiveScriptProfilerControl3*, UInt32),
    start_profiling : Proc(IActiveScriptProfilerControl3*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_profiler_event_mask : Proc(IActiveScriptProfilerControl3*, UInt32, Win32cr::Foundation::HRESULT),
    stop_profiling : Proc(IActiveScriptProfilerControl3*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    complete_profiler_start : Proc(IActiveScriptProfilerControl3*, Win32cr::Foundation::HRESULT),
    prepare_profiler_stop : Proc(IActiveScriptProfilerControl3*, Win32cr::Foundation::HRESULT),
    enum_heap : Proc(IActiveScriptProfilerControl3*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProfilerControl3, lpVtbl : IActiveScriptProfilerControl3Vtable* do
    GUID = LibC::GUID.new(0xb403015_u32, 0xf381_u16, 0x4023_u16, StaticArray[0xa5_u8, 0xd0_u8, 0x6f_u8, 0xed_u8, 0x7_u8, 0x6d_u8, 0xe7_u8, 0x16_u8])
    def query_interface(this : IActiveScriptProfilerControl3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProfilerControl3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProfilerControl3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_profiling(this : IActiveScriptProfilerControl3*, clsidProfilerObject : LibC::GUID*, dwEventMask : UInt32, dwContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_profiling.call(this, clsidProfilerObject, dwEventMask, dwContext)
    end
    def set_profiler_event_mask(this : IActiveScriptProfilerControl3*, dwEventMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_profiler_event_mask.call(this, dwEventMask)
    end
    def stop_profiling(this : IActiveScriptProfilerControl3*, hrShutdownReason : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_profiling.call(this, hrShutdownReason)
    end
    def complete_profiler_start(this : IActiveScriptProfilerControl3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete_profiler_start.call(this)
    end
    def prepare_profiler_stop(this : IActiveScriptProfilerControl3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_profiler_stop.call(this)
    end
    def enum_heap(this : IActiveScriptProfilerControl3*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_heap.call(this, ppEnum)
    end

  end

  @[Extern]

  record IActiveScriptProfilerControl4Vtable,
    query_interface : Proc(IActiveScriptProfilerControl4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProfilerControl4*, UInt32),
    release : Proc(IActiveScriptProfilerControl4*, UInt32),
    start_profiling : Proc(IActiveScriptProfilerControl4*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_profiler_event_mask : Proc(IActiveScriptProfilerControl4*, UInt32, Win32cr::Foundation::HRESULT),
    stop_profiling : Proc(IActiveScriptProfilerControl4*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    complete_profiler_start : Proc(IActiveScriptProfilerControl4*, Win32cr::Foundation::HRESULT),
    prepare_profiler_stop : Proc(IActiveScriptProfilerControl4*, Win32cr::Foundation::HRESULT),
    enum_heap : Proc(IActiveScriptProfilerControl4*, Void**, Win32cr::Foundation::HRESULT),
    summarize_heap : Proc(IActiveScriptProfilerControl4*, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_SUMMARY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProfilerControl4, lpVtbl : IActiveScriptProfilerControl4Vtable* do
    GUID = LibC::GUID.new(0x160f94fd_u32, 0x9dbc_u16, 0x40d4_u16, StaticArray[0x9e_u8, 0xac_u8, 0x2b_u8, 0x71_u8, 0xdb_u8, 0x31_u8, 0x32_u8, 0xf4_u8])
    def query_interface(this : IActiveScriptProfilerControl4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProfilerControl4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProfilerControl4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_profiling(this : IActiveScriptProfilerControl4*, clsidProfilerObject : LibC::GUID*, dwEventMask : UInt32, dwContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_profiling.call(this, clsidProfilerObject, dwEventMask, dwContext)
    end
    def set_profiler_event_mask(this : IActiveScriptProfilerControl4*, dwEventMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_profiler_event_mask.call(this, dwEventMask)
    end
    def stop_profiling(this : IActiveScriptProfilerControl4*, hrShutdownReason : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_profiling.call(this, hrShutdownReason)
    end
    def complete_profiler_start(this : IActiveScriptProfilerControl4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete_profiler_start.call(this)
    end
    def prepare_profiler_stop(this : IActiveScriptProfilerControl4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_profiler_stop.call(this)
    end
    def enum_heap(this : IActiveScriptProfilerControl4*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_heap.call(this, ppEnum)
    end
    def summarize_heap(this : IActiveScriptProfilerControl4*, heapSummary : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_SUMMARY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.summarize_heap.call(this, heapSummary)
    end

  end

  @[Extern]

  record IActiveScriptProfilerControl5Vtable,
    query_interface : Proc(IActiveScriptProfilerControl5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProfilerControl5*, UInt32),
    release : Proc(IActiveScriptProfilerControl5*, UInt32),
    start_profiling : Proc(IActiveScriptProfilerControl5*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_profiler_event_mask : Proc(IActiveScriptProfilerControl5*, UInt32, Win32cr::Foundation::HRESULT),
    stop_profiling : Proc(IActiveScriptProfilerControl5*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    complete_profiler_start : Proc(IActiveScriptProfilerControl5*, Win32cr::Foundation::HRESULT),
    prepare_profiler_stop : Proc(IActiveScriptProfilerControl5*, Win32cr::Foundation::HRESULT),
    enum_heap : Proc(IActiveScriptProfilerControl5*, Void**, Win32cr::Foundation::HRESULT),
    summarize_heap : Proc(IActiveScriptProfilerControl5*, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_SUMMARY*, Win32cr::Foundation::HRESULT),
    enum_heap2 : Proc(IActiveScriptProfilerControl5*, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_ENUM_FLAGS, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProfilerControl5, lpVtbl : IActiveScriptProfilerControl5Vtable* do
    GUID = LibC::GUID.new(0x1c01a2d1_u32, 0x8f0f_u16, 0x46a5_u16, StaticArray[0x97_u8, 0x20_u8, 0xd_u8, 0x7e_u8, 0xd2_u8, 0xc6_u8, 0x2f_u8, 0xa_u8])
    def query_interface(this : IActiveScriptProfilerControl5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProfilerControl5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProfilerControl5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_profiling(this : IActiveScriptProfilerControl5*, clsidProfilerObject : LibC::GUID*, dwEventMask : UInt32, dwContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_profiling.call(this, clsidProfilerObject, dwEventMask, dwContext)
    end
    def set_profiler_event_mask(this : IActiveScriptProfilerControl5*, dwEventMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_profiler_event_mask.call(this, dwEventMask)
    end
    def stop_profiling(this : IActiveScriptProfilerControl5*, hrShutdownReason : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_profiling.call(this, hrShutdownReason)
    end
    def complete_profiler_start(this : IActiveScriptProfilerControl5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete_profiler_start.call(this)
    end
    def prepare_profiler_stop(this : IActiveScriptProfilerControl5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_profiler_stop.call(this)
    end
    def enum_heap(this : IActiveScriptProfilerControl5*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_heap.call(this, ppEnum)
    end
    def summarize_heap(this : IActiveScriptProfilerControl5*, heapSummary : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_SUMMARY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.summarize_heap.call(this, heapSummary)
    end
    def enum_heap2(this : IActiveScriptProfilerControl5*, enumFlags : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_HEAP_ENUM_FLAGS, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_heap2.call(this, enumFlags, ppEnum)
    end

  end

  @[Extern]

  record IActiveScriptProfilerCallbackVtable,
    query_interface : Proc(IActiveScriptProfilerCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProfilerCallback*, UInt32),
    release : Proc(IActiveScriptProfilerCallback*, UInt32),
    initialize__ : Proc(IActiveScriptProfilerCallback*, UInt32, Win32cr::Foundation::HRESULT),
    shutdown : Proc(IActiveScriptProfilerCallback*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    script_compiled : Proc(IActiveScriptProfilerCallback*, Int32, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, Void*, Win32cr::Foundation::HRESULT),
    function_compiled : Proc(IActiveScriptProfilerCallback*, Int32, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    on_function_enter : Proc(IActiveScriptProfilerCallback*, Int32, Int32, Win32cr::Foundation::HRESULT),
    on_function_exit : Proc(IActiveScriptProfilerCallback*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProfilerCallback, lpVtbl : IActiveScriptProfilerCallbackVtable* do
    GUID = LibC::GUID.new(0x740eca23_u32, 0x7d9d_u16, 0x42e5_u16, StaticArray[0xba_u8, 0x9d_u8, 0xf8_u8, 0xb2_u8, 0x4b_u8, 0x1c_u8, 0x7a_u8, 0x9b_u8])
    def query_interface(this : IActiveScriptProfilerCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProfilerCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProfilerCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IActiveScriptProfilerCallback*, dwContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, dwContext)
    end
    def shutdown(this : IActiveScriptProfilerCallback*, hrReason : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this, hrReason)
    end
    def script_compiled(this : IActiveScriptProfilerCallback*, scriptId : Int32, type__ : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, pIDebugDocumentContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.script_compiled.call(this, scriptId, type__, pIDebugDocumentContext)
    end
    def function_compiled(this : IActiveScriptProfilerCallback*, functionId : Int32, scriptId : Int32, pwszFunctionName : Win32cr::Foundation::PWSTR, pwszFunctionNameHint : Win32cr::Foundation::PWSTR, pIDebugDocumentContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_compiled.call(this, functionId, scriptId, pwszFunctionName, pwszFunctionNameHint, pIDebugDocumentContext)
    end
    def on_function_enter(this : IActiveScriptProfilerCallback*, scriptId : Int32, functionId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_enter.call(this, scriptId, functionId)
    end
    def on_function_exit(this : IActiveScriptProfilerCallback*, scriptId : Int32, functionId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_exit.call(this, scriptId, functionId)
    end

  end

  @[Extern]

  record IActiveScriptProfilerCallback2Vtable,
    query_interface : Proc(IActiveScriptProfilerCallback2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProfilerCallback2*, UInt32),
    release : Proc(IActiveScriptProfilerCallback2*, UInt32),
    initialize__ : Proc(IActiveScriptProfilerCallback2*, UInt32, Win32cr::Foundation::HRESULT),
    shutdown : Proc(IActiveScriptProfilerCallback2*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    script_compiled : Proc(IActiveScriptProfilerCallback2*, Int32, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, Void*, Win32cr::Foundation::HRESULT),
    function_compiled : Proc(IActiveScriptProfilerCallback2*, Int32, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    on_function_enter : Proc(IActiveScriptProfilerCallback2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    on_function_exit : Proc(IActiveScriptProfilerCallback2*, Int32, Int32, Win32cr::Foundation::HRESULT),
    on_function_enter_by_name : Proc(IActiveScriptProfilerCallback2*, Win32cr::Foundation::PWSTR, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, Win32cr::Foundation::HRESULT),
    on_function_exit_by_name : Proc(IActiveScriptProfilerCallback2*, Win32cr::Foundation::PWSTR, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProfilerCallback2, lpVtbl : IActiveScriptProfilerCallback2Vtable* do
    GUID = LibC::GUID.new(0x31b7f8ad_u32, 0xa637_u16, 0x409c_u16, StaticArray[0xb2_u8, 0x2f_u8, 0x4_u8, 0x9_u8, 0x95_u8, 0xb6_u8, 0x10_u8, 0x3d_u8])
    def query_interface(this : IActiveScriptProfilerCallback2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProfilerCallback2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProfilerCallback2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IActiveScriptProfilerCallback2*, dwContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, dwContext)
    end
    def shutdown(this : IActiveScriptProfilerCallback2*, hrReason : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this, hrReason)
    end
    def script_compiled(this : IActiveScriptProfilerCallback2*, scriptId : Int32, type__ : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, pIDebugDocumentContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.script_compiled.call(this, scriptId, type__, pIDebugDocumentContext)
    end
    def function_compiled(this : IActiveScriptProfilerCallback2*, functionId : Int32, scriptId : Int32, pwszFunctionName : Win32cr::Foundation::PWSTR, pwszFunctionNameHint : Win32cr::Foundation::PWSTR, pIDebugDocumentContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_compiled.call(this, functionId, scriptId, pwszFunctionName, pwszFunctionNameHint, pIDebugDocumentContext)
    end
    def on_function_enter(this : IActiveScriptProfilerCallback2*, scriptId : Int32, functionId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_enter.call(this, scriptId, functionId)
    end
    def on_function_exit(this : IActiveScriptProfilerCallback2*, scriptId : Int32, functionId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_exit.call(this, scriptId, functionId)
    end
    def on_function_enter_by_name(this : IActiveScriptProfilerCallback2*, pwszFunctionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_enter_by_name.call(this, pwszFunctionName, type__)
    end
    def on_function_exit_by_name(this : IActiveScriptProfilerCallback2*, pwszFunctionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_exit_by_name.call(this, pwszFunctionName, type__)
    end

  end

  @[Extern]

  record IActiveScriptProfilerCallback3Vtable,
    query_interface : Proc(IActiveScriptProfilerCallback3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptProfilerCallback3*, UInt32),
    release : Proc(IActiveScriptProfilerCallback3*, UInt32),
    initialize__ : Proc(IActiveScriptProfilerCallback3*, UInt32, Win32cr::Foundation::HRESULT),
    shutdown : Proc(IActiveScriptProfilerCallback3*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    script_compiled : Proc(IActiveScriptProfilerCallback3*, Int32, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, Void*, Win32cr::Foundation::HRESULT),
    function_compiled : Proc(IActiveScriptProfilerCallback3*, Int32, Int32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    on_function_enter : Proc(IActiveScriptProfilerCallback3*, Int32, Int32, Win32cr::Foundation::HRESULT),
    on_function_exit : Proc(IActiveScriptProfilerCallback3*, Int32, Int32, Win32cr::Foundation::HRESULT),
    on_function_enter_by_name : Proc(IActiveScriptProfilerCallback3*, Win32cr::Foundation::PWSTR, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, Win32cr::Foundation::HRESULT),
    on_function_exit_by_name : Proc(IActiveScriptProfilerCallback3*, Win32cr::Foundation::PWSTR, Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, Win32cr::Foundation::HRESULT),
    set_web_worker_id : Proc(IActiveScriptProfilerCallback3*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptProfilerCallback3, lpVtbl : IActiveScriptProfilerCallback3Vtable* do
    GUID = LibC::GUID.new(0x6ac5ad25_u32, 0x2037_u16, 0x4687_u16, StaticArray[0x91_u8, 0xdf_u8, 0xb5_u8, 0x99_u8, 0x79_u8, 0xd9_u8, 0x3d_u8, 0x73_u8])
    def query_interface(this : IActiveScriptProfilerCallback3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptProfilerCallback3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptProfilerCallback3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IActiveScriptProfilerCallback3*, dwContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, dwContext)
    end
    def shutdown(this : IActiveScriptProfilerCallback3*, hrReason : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this, hrReason)
    end
    def script_compiled(this : IActiveScriptProfilerCallback3*, scriptId : Int32, type__ : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE, pIDebugDocumentContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.script_compiled.call(this, scriptId, type__, pIDebugDocumentContext)
    end
    def function_compiled(this : IActiveScriptProfilerCallback3*, functionId : Int32, scriptId : Int32, pwszFunctionName : Win32cr::Foundation::PWSTR, pwszFunctionNameHint : Win32cr::Foundation::PWSTR, pIDebugDocumentContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_compiled.call(this, functionId, scriptId, pwszFunctionName, pwszFunctionNameHint, pIDebugDocumentContext)
    end
    def on_function_enter(this : IActiveScriptProfilerCallback3*, scriptId : Int32, functionId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_enter.call(this, scriptId, functionId)
    end
    def on_function_exit(this : IActiveScriptProfilerCallback3*, scriptId : Int32, functionId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_exit.call(this, scriptId, functionId)
    end
    def on_function_enter_by_name(this : IActiveScriptProfilerCallback3*, pwszFunctionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_enter_by_name.call(this, pwszFunctionName, type__)
    end
    def on_function_exit_by_name(this : IActiveScriptProfilerCallback3*, pwszFunctionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::System::Diagnostics::Debug::ActiveScript::PROFILER_SCRIPT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_function_exit_by_name.call(this, pwszFunctionName, type__)
    end
    def set_web_worker_id(this : IActiveScriptProfilerCallback3*, webWorkerId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_web_worker_id.call(this, webWorkerId)
    end

  end

  @[Extern]

  record IScriptNodeVtable,
    query_interface : Proc(IScriptNode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScriptNode*, UInt32),
    release : Proc(IScriptNode*, UInt32),
    alive : Proc(IScriptNode*, Win32cr::Foundation::HRESULT),
    delete : Proc(IScriptNode*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IScriptNode*, Void**, Win32cr::Foundation::HRESULT),
    get_index_in_parent : Proc(IScriptNode*, UInt32*, Win32cr::Foundation::HRESULT),
    get_cookie : Proc(IScriptNode*, UInt32*, Win32cr::Foundation::HRESULT),
    get_number_of_children : Proc(IScriptNode*, UInt32*, Win32cr::Foundation::HRESULT),
    get_child : Proc(IScriptNode*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_language : Proc(IScriptNode*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_child_entry : Proc(IScriptNode*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_child_handler : Proc(IScriptNode*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IScriptNode, lpVtbl : IScriptNodeVtable* do
    GUID = LibC::GUID.new(0xaee2a94_u32, 0xbcbb_u16, 0x11d0_u16, StaticArray[0x8c_u8, 0x72_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xb0_u8, 0x85_u8])
    def query_interface(this : IScriptNode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScriptNode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScriptNode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def alive(this : IScriptNode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alive.call(this)
    end
    def delete(this : IScriptNode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_parent(this : IScriptNode*, ppsnParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, ppsnParent)
    end
    def get_index_in_parent(this : IScriptNode*, pisn : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index_in_parent.call(this, pisn)
    end
    def get_cookie(this : IScriptNode*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cookie.call(this, pdwCookie)
    end
    def get_number_of_children(this : IScriptNode*, pcsn : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_of_children.call(this, pcsn)
    end
    def get_child(this : IScriptNode*, isn : UInt32, ppsn : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_child.call(this, isn, ppsn)
    end
    def get_language(this : IScriptNode*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, pbstr)
    end
    def create_child_entry(this : IScriptNode*, isn : UInt32, dwCookie : UInt32, pszDelimiter : Win32cr::Foundation::PWSTR, ppse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_child_entry.call(this, isn, dwCookie, pszDelimiter, ppse)
    end
    def create_child_handler(this : IScriptNode*, pszDefaultName : Win32cr::Foundation::PWSTR, prgpszNames : Win32cr::Foundation::PWSTR*, cpszNames : UInt32, pszEvent : Win32cr::Foundation::PWSTR, pszDelimiter : Win32cr::Foundation::PWSTR, ptiSignature : Void*, iMethodSignature : UInt32, isn : UInt32, dwCookie : UInt32, ppse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_child_handler.call(this, pszDefaultName, prgpszNames, cpszNames, pszEvent, pszDelimiter, ptiSignature, iMethodSignature, isn, dwCookie, ppse)
    end

  end

  @[Extern]

  record IScriptEntryVtable,
    query_interface : Proc(IScriptEntry*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScriptEntry*, UInt32),
    release : Proc(IScriptEntry*, UInt32),
    alive : Proc(IScriptEntry*, Win32cr::Foundation::HRESULT),
    delete : Proc(IScriptEntry*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IScriptEntry*, Void**, Win32cr::Foundation::HRESULT),
    get_index_in_parent : Proc(IScriptEntry*, UInt32*, Win32cr::Foundation::HRESULT),
    get_cookie : Proc(IScriptEntry*, UInt32*, Win32cr::Foundation::HRESULT),
    get_number_of_children : Proc(IScriptEntry*, UInt32*, Win32cr::Foundation::HRESULT),
    get_child : Proc(IScriptEntry*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_language : Proc(IScriptEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_child_entry : Proc(IScriptEntry*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_child_handler : Proc(IScriptEntry*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_text : Proc(IScriptEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_text : Proc(IScriptEntry*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_body : Proc(IScriptEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_body : Proc(IScriptEntry*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_name : Proc(IScriptEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IScriptEntry*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_item_name : Proc(IScriptEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_item_name : Proc(IScriptEntry*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_signature : Proc(IScriptEntry*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    set_signature : Proc(IScriptEntry*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_range : Proc(IScriptEntry*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IScriptEntry, lpVtbl : IScriptEntryVtable* do
    GUID = LibC::GUID.new(0xaee2a95_u32, 0xbcbb_u16, 0x11d0_u16, StaticArray[0x8c_u8, 0x72_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xb0_u8, 0x85_u8])
    def query_interface(this : IScriptEntry*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScriptEntry*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScriptEntry*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def alive(this : IScriptEntry*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alive.call(this)
    end
    def delete(this : IScriptEntry*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_parent(this : IScriptEntry*, ppsnParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, ppsnParent)
    end
    def get_index_in_parent(this : IScriptEntry*, pisn : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index_in_parent.call(this, pisn)
    end
    def get_cookie(this : IScriptEntry*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cookie.call(this, pdwCookie)
    end
    def get_number_of_children(this : IScriptEntry*, pcsn : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_of_children.call(this, pcsn)
    end
    def get_child(this : IScriptEntry*, isn : UInt32, ppsn : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_child.call(this, isn, ppsn)
    end
    def get_language(this : IScriptEntry*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, pbstr)
    end
    def create_child_entry(this : IScriptEntry*, isn : UInt32, dwCookie : UInt32, pszDelimiter : Win32cr::Foundation::PWSTR, ppse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_child_entry.call(this, isn, dwCookie, pszDelimiter, ppse)
    end
    def create_child_handler(this : IScriptEntry*, pszDefaultName : Win32cr::Foundation::PWSTR, prgpszNames : Win32cr::Foundation::PWSTR*, cpszNames : UInt32, pszEvent : Win32cr::Foundation::PWSTR, pszDelimiter : Win32cr::Foundation::PWSTR, ptiSignature : Void*, iMethodSignature : UInt32, isn : UInt32, dwCookie : UInt32, ppse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_child_handler.call(this, pszDefaultName, prgpszNames, cpszNames, pszEvent, pszDelimiter, ptiSignature, iMethodSignature, isn, dwCookie, ppse)
    end
    def get_text(this : IScriptEntry*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, pbstr)
    end
    def set_text(this : IScriptEntry*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, psz)
    end
    def get_body(this : IScriptEntry*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_body.call(this, pbstr)
    end
    def set_body(this : IScriptEntry*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_body.call(this, psz)
    end
    def get_name(this : IScriptEntry*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pbstr)
    end
    def set_name(this : IScriptEntry*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, psz)
    end
    def get_item_name(this : IScriptEntry*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_name.call(this, pbstr)
    end
    def set_item_name(this : IScriptEntry*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_item_name.call(this, psz)
    end
    def get_signature(this : IScriptEntry*, ppti : Void**, piMethod : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature.call(this, ppti, piMethod)
    end
    def set_signature(this : IScriptEntry*, pti : Void*, iMethod : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature.call(this, pti, iMethod)
    end
    def get_range(this : IScriptEntry*, pichMin : UInt32*, pcch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range.call(this, pichMin, pcch)
    end

  end

  @[Extern]

  record IScriptScriptletVtable,
    query_interface : Proc(IScriptScriptlet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScriptScriptlet*, UInt32),
    release : Proc(IScriptScriptlet*, UInt32),
    alive : Proc(IScriptScriptlet*, Win32cr::Foundation::HRESULT),
    delete : Proc(IScriptScriptlet*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IScriptScriptlet*, Void**, Win32cr::Foundation::HRESULT),
    get_index_in_parent : Proc(IScriptScriptlet*, UInt32*, Win32cr::Foundation::HRESULT),
    get_cookie : Proc(IScriptScriptlet*, UInt32*, Win32cr::Foundation::HRESULT),
    get_number_of_children : Proc(IScriptScriptlet*, UInt32*, Win32cr::Foundation::HRESULT),
    get_child : Proc(IScriptScriptlet*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_language : Proc(IScriptScriptlet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_child_entry : Proc(IScriptScriptlet*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_child_handler : Proc(IScriptScriptlet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_text : Proc(IScriptScriptlet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_text : Proc(IScriptScriptlet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_body : Proc(IScriptScriptlet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_body : Proc(IScriptScriptlet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_name : Proc(IScriptScriptlet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IScriptScriptlet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_item_name : Proc(IScriptScriptlet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_item_name : Proc(IScriptScriptlet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_signature : Proc(IScriptScriptlet*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    set_signature : Proc(IScriptScriptlet*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_range : Proc(IScriptScriptlet*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_sub_item_name : Proc(IScriptScriptlet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_sub_item_name : Proc(IScriptScriptlet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_event_name : Proc(IScriptScriptlet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_event_name : Proc(IScriptScriptlet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_simple_event_name : Proc(IScriptScriptlet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_simple_event_name : Proc(IScriptScriptlet*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IScriptScriptlet, lpVtbl : IScriptScriptletVtable* do
    GUID = LibC::GUID.new(0xaee2a96_u32, 0xbcbb_u16, 0x11d0_u16, StaticArray[0x8c_u8, 0x72_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xb0_u8, 0x85_u8])
    def query_interface(this : IScriptScriptlet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScriptScriptlet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScriptScriptlet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def alive(this : IScriptScriptlet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alive.call(this)
    end
    def delete(this : IScriptScriptlet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_parent(this : IScriptScriptlet*, ppsnParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, ppsnParent)
    end
    def get_index_in_parent(this : IScriptScriptlet*, pisn : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index_in_parent.call(this, pisn)
    end
    def get_cookie(this : IScriptScriptlet*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cookie.call(this, pdwCookie)
    end
    def get_number_of_children(this : IScriptScriptlet*, pcsn : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_of_children.call(this, pcsn)
    end
    def get_child(this : IScriptScriptlet*, isn : UInt32, ppsn : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_child.call(this, isn, ppsn)
    end
    def get_language(this : IScriptScriptlet*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, pbstr)
    end
    def create_child_entry(this : IScriptScriptlet*, isn : UInt32, dwCookie : UInt32, pszDelimiter : Win32cr::Foundation::PWSTR, ppse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_child_entry.call(this, isn, dwCookie, pszDelimiter, ppse)
    end
    def create_child_handler(this : IScriptScriptlet*, pszDefaultName : Win32cr::Foundation::PWSTR, prgpszNames : Win32cr::Foundation::PWSTR*, cpszNames : UInt32, pszEvent : Win32cr::Foundation::PWSTR, pszDelimiter : Win32cr::Foundation::PWSTR, ptiSignature : Void*, iMethodSignature : UInt32, isn : UInt32, dwCookie : UInt32, ppse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_child_handler.call(this, pszDefaultName, prgpszNames, cpszNames, pszEvent, pszDelimiter, ptiSignature, iMethodSignature, isn, dwCookie, ppse)
    end
    def get_text(this : IScriptScriptlet*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, pbstr)
    end
    def set_text(this : IScriptScriptlet*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, psz)
    end
    def get_body(this : IScriptScriptlet*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_body.call(this, pbstr)
    end
    def set_body(this : IScriptScriptlet*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_body.call(this, psz)
    end
    def get_name(this : IScriptScriptlet*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pbstr)
    end
    def set_name(this : IScriptScriptlet*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, psz)
    end
    def get_item_name(this : IScriptScriptlet*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_name.call(this, pbstr)
    end
    def set_item_name(this : IScriptScriptlet*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_item_name.call(this, psz)
    end
    def get_signature(this : IScriptScriptlet*, ppti : Void**, piMethod : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature.call(this, ppti, piMethod)
    end
    def set_signature(this : IScriptScriptlet*, pti : Void*, iMethod : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signature.call(this, pti, iMethod)
    end
    def get_range(this : IScriptScriptlet*, pichMin : UInt32*, pcch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range.call(this, pichMin, pcch)
    end
    def get_sub_item_name(this : IScriptScriptlet*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sub_item_name.call(this, pbstr)
    end
    def set_sub_item_name(this : IScriptScriptlet*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sub_item_name.call(this, psz)
    end
    def get_event_name(this : IScriptScriptlet*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_name.call(this, pbstr)
    end
    def set_event_name(this : IScriptScriptlet*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_name.call(this, psz)
    end
    def get_simple_event_name(this : IScriptScriptlet*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_simple_event_name.call(this, pbstr)
    end
    def set_simple_event_name(this : IScriptScriptlet*, psz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_simple_event_name.call(this, psz)
    end

  end

  @[Extern]

  record IActiveScriptAuthorVtable,
    query_interface : Proc(IActiveScriptAuthor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptAuthor*, UInt32),
    release : Proc(IActiveScriptAuthor*, UInt32),
    add_named_item : Proc(IActiveScriptAuthor*, Win32cr::Foundation::PWSTR, UInt32, Void*, Win32cr::Foundation::HRESULT),
    add_scriptlet : Proc(IActiveScriptAuthor*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    parse_script_text : Proc(IActiveScriptAuthor*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_script_text_attributes : Proc(IActiveScriptAuthor*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_scriptlet_text_attributes : Proc(IActiveScriptAuthor*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_root : Proc(IActiveScriptAuthor*, Void**, Win32cr::Foundation::HRESULT),
    get_language_flags : Proc(IActiveScriptAuthor*, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_handler : Proc(IActiveScriptAuthor*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    remove_named_item : Proc(IActiveScriptAuthor*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_type_lib : Proc(IActiveScriptAuthor*, LibC::GUID*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    remove_type_lib : Proc(IActiveScriptAuthor*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_chars : Proc(IActiveScriptAuthor*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_info_from_context : Proc(IActiveScriptAuthor*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, UInt32*, UInt32*, UInt32*, Int32*, Int32*, Void**, Win32cr::Foundation::HRESULT),
    is_commit_char : Proc(IActiveScriptAuthor*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptAuthor, lpVtbl : IActiveScriptAuthorVtable* do
    GUID = LibC::GUID.new(0x9c109da0_u32, 0x7006_u16, 0x11d1_u16, StaticArray[0xb3_u8, 0x6c_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x11_u8, 0xe8_u8, 0xb2_u8])
    def query_interface(this : IActiveScriptAuthor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptAuthor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptAuthor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_named_item(this : IActiveScriptAuthor*, pszName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pdisp : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_named_item.call(this, pszName, dwFlags, pdisp)
    end
    def add_scriptlet(this : IActiveScriptAuthor*, pszDefaultName : Win32cr::Foundation::PWSTR, pszCode : Win32cr::Foundation::PWSTR, pszItemName : Win32cr::Foundation::PWSTR, pszSubItemName : Win32cr::Foundation::PWSTR, pszEventName : Win32cr::Foundation::PWSTR, pszDelimiter : Win32cr::Foundation::PWSTR, dwCookie : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_scriptlet.call(this, pszDefaultName, pszCode, pszItemName, pszSubItemName, pszEventName, pszDelimiter, dwCookie, dwFlags)
    end
    def parse_script_text(this : IActiveScriptAuthor*, pszCode : Win32cr::Foundation::PWSTR, pszItemName : Win32cr::Foundation::PWSTR, pszDelimiter : Win32cr::Foundation::PWSTR, dwCookie : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_script_text.call(this, pszCode, pszItemName, pszDelimiter, dwCookie, dwFlags)
    end
    def get_script_text_attributes(this : IActiveScriptAuthor*, pszCode : Win32cr::Foundation::PWSTR, cch : UInt32, pszDelimiter : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pattr : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_text_attributes.call(this, pszCode, cch, pszDelimiter, dwFlags, pattr)
    end
    def get_scriptlet_text_attributes(this : IActiveScriptAuthor*, pszCode : Win32cr::Foundation::PWSTR, cch : UInt32, pszDelimiter : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pattr : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scriptlet_text_attributes.call(this, pszCode, cch, pszDelimiter, dwFlags, pattr)
    end
    def get_root(this : IActiveScriptAuthor*, ppsp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root.call(this, ppsp)
    end
    def get_language_flags(this : IActiveScriptAuthor*, pgrfasa : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_flags.call(this, pgrfasa)
    end
    def get_event_handler(this : IActiveScriptAuthor*, pdisp : Void*, pszItem : Win32cr::Foundation::PWSTR, pszSubItem : Win32cr::Foundation::PWSTR, pszEvent : Win32cr::Foundation::PWSTR, ppse : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_handler.call(this, pdisp, pszItem, pszSubItem, pszEvent, ppse)
    end
    def remove_named_item(this : IActiveScriptAuthor*, pszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_named_item.call(this, pszName)
    end
    def add_type_lib(this : IActiveScriptAuthor*, rguidTypeLib : LibC::GUID*, dwMajor : UInt32, dwMinor : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_type_lib.call(this, rguidTypeLib, dwMajor, dwMinor, dwFlags)
    end
    def remove_type_lib(this : IActiveScriptAuthor*, rguidTypeLib : LibC::GUID*, dwMajor : UInt32, dwMinor : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_type_lib.call(this, rguidTypeLib, dwMajor, dwMinor)
    end
    def get_chars(this : IActiveScriptAuthor*, fRequestedList : UInt32, pbstrChars : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_chars.call(this, fRequestedList, pbstrChars)
    end
    def get_info_from_context(this : IActiveScriptAuthor*, pszCode : Win32cr::Foundation::PWSTR, cchCode : UInt32, ichCurrentPosition : UInt32, dwListTypesRequested : UInt32, pdwListTypesProvided : UInt32*, pichListAnchorPosition : UInt32*, pichFuncAnchorPosition : UInt32*, pmemid : Int32*, piCurrentParameter : Int32*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info_from_context.call(this, pszCode, cchCode, ichCurrentPosition, dwListTypesRequested, pdwListTypesProvided, pichListAnchorPosition, pichFuncAnchorPosition, pmemid, piCurrentParameter, ppunk)
    end
    def is_commit_char(this : IActiveScriptAuthor*, ch : UInt16, pfcommit : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_commit_char.call(this, ch, pfcommit)
    end

  end

  @[Extern]

  record IActiveScriptAuthorProcedureVtable,
    query_interface : Proc(IActiveScriptAuthorProcedure*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptAuthorProcedure*, UInt32),
    release : Proc(IActiveScriptAuthorProcedure*, UInt32),
    parse_procedure_text : Proc(IActiveScriptAuthorProcedure*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptAuthorProcedure, lpVtbl : IActiveScriptAuthorProcedureVtable* do
    GUID = LibC::GUID.new(0x7e2d4b70_u32, 0xbd9a_u16, 0x11d0_u16, StaticArray[0x93_u8, 0x36_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0xca_u8, 0xa9_u8])
    def query_interface(this : IActiveScriptAuthorProcedure*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptAuthorProcedure*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptAuthorProcedure*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_procedure_text(this : IActiveScriptAuthorProcedure*, pszCode : Win32cr::Foundation::PWSTR, pszFormalParams : Win32cr::Foundation::PWSTR, pszProcedureName : Win32cr::Foundation::PWSTR, pszItemName : Win32cr::Foundation::PWSTR, pszDelimiter : Win32cr::Foundation::PWSTR, dwCookie : UInt32, dwFlags : UInt32, pdispFor : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_procedure_text.call(this, pszCode, pszFormalParams, pszProcedureName, pszItemName, pszDelimiter, dwCookie, dwFlags, pdispFor)
    end

  end

  @[Extern]

  record IDebugApplicationNode100Vtable,
    query_interface : Proc(IDebugApplicationNode100*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplicationNode100*, UInt32),
    release : Proc(IDebugApplicationNode100*, UInt32),
    set_filter_for_event_sink : Proc(IDebugApplicationNode100*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::APPLICATION_NODE_EVENT_FILTER, Win32cr::Foundation::HRESULT),
    get_excluded_documents : Proc(IDebugApplicationNode100*, Win32cr::System::Diagnostics::Debug::ActiveScript::APPLICATION_NODE_EVENT_FILTER, Win32cr::System::Diagnostics::Debug::ActiveScript::TEXT_DOCUMENT_ARRAY*, Win32cr::Foundation::HRESULT),
    query_is_child_node : Proc(IDebugApplicationNode100*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplicationNode100, lpVtbl : IDebugApplicationNode100Vtable* do
    GUID = LibC::GUID.new(0x90a7734e_u32, 0x841b_u16, 0x4f77_u16, StaticArray[0x93_u8, 0x84_u8, 0xa2_u8, 0x89_u8, 0x1e_u8, 0x76_u8, 0xe7_u8, 0xe2_u8])
    def query_interface(this : IDebugApplicationNode100*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplicationNode100*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplicationNode100*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_filter_for_event_sink(this : IDebugApplicationNode100*, dwCookie : UInt32, filter : Win32cr::System::Diagnostics::Debug::ActiveScript::APPLICATION_NODE_EVENT_FILTER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_filter_for_event_sink.call(this, dwCookie, filter)
    end
    def get_excluded_documents(this : IDebugApplicationNode100*, filter : Win32cr::System::Diagnostics::Debug::ActiveScript::APPLICATION_NODE_EVENT_FILTER, pDocuments : Win32cr::System::Diagnostics::Debug::ActiveScript::TEXT_DOCUMENT_ARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_excluded_documents.call(this, filter, pDocuments)
    end
    def query_is_child_node(this : IDebugApplicationNode100*, pSearchKey : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_is_child_node.call(this, pSearchKey)
    end

  end

  @[Extern]

  record IWebAppDiagnosticsSetupVtable,
    query_interface : Proc(IWebAppDiagnosticsSetup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebAppDiagnosticsSetup*, UInt32),
    release : Proc(IWebAppDiagnosticsSetup*, UInt32),
    diagnostics_supported : Proc(IWebAppDiagnosticsSetup*, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT),
    create_object_with_site_at_web_app : Proc(IWebAppDiagnosticsSetup*, LibC::GUID*, UInt32, LibC::GUID*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebAppDiagnosticsSetup, lpVtbl : IWebAppDiagnosticsSetupVtable* do
    GUID = LibC::GUID.new(0x379bfbe1_u32, 0xc6c9_u16, 0x432a_u16, StaticArray[0x93_u8, 0xe1_u8, 0x6d_u8, 0x17_u8, 0x65_u8, 0x6c_u8, 0x53_u8, 0x8c_u8])
    def query_interface(this : IWebAppDiagnosticsSetup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebAppDiagnosticsSetup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebAppDiagnosticsSetup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def diagnostics_supported(this : IWebAppDiagnosticsSetup*, pRetVal : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.diagnostics_supported.call(this, pRetVal)
    end
    def create_object_with_site_at_web_app(this : IWebAppDiagnosticsSetup*, rclsid : LibC::GUID*, dwClsContext : UInt32, riid : LibC::GUID*, hPassToObject : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_object_with_site_at_web_app.call(this, rclsid, dwClsContext, riid, hPassToObject)
    end

  end

  @[Extern]

  record IRemoteDebugApplication110Vtable,
    query_interface : Proc(IRemoteDebugApplication110*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDebugApplication110*, UInt32),
    release : Proc(IRemoteDebugApplication110*, UInt32),
    set_debugger_options : Proc(IRemoteDebugApplication110*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS, Win32cr::Foundation::HRESULT),
    get_current_debugger_options : Proc(IRemoteDebugApplication110*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS*, Win32cr::Foundation::HRESULT),
    get_main_thread : Proc(IRemoteDebugApplication110*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRemoteDebugApplication110, lpVtbl : IRemoteDebugApplication110Vtable* do
    GUID = LibC::GUID.new(0xd5fe005b_u32, 0x2836_u16, 0x485e_u16, StaticArray[0xb1_u8, 0xf9_u8, 0x89_u8, 0xd9_u8, 0x1a_u8, 0xa2_u8, 0x4f_u8, 0xd4_u8])
    def query_interface(this : IRemoteDebugApplication110*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDebugApplication110*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDebugApplication110*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_debugger_options(this : IRemoteDebugApplication110*, mask : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS, value : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_debugger_options.call(this, mask, value)
    end
    def get_current_debugger_options(this : IRemoteDebugApplication110*, pCurrentOptions : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_debugger_options.call(this, pCurrentOptions)
    end
    def get_main_thread(this : IRemoteDebugApplication110*, ppThread : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_thread.call(this, ppThread)
    end

  end

  @[Extern]

  record IDebugApplication11032Vtable,
    query_interface : Proc(IDebugApplication11032*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplication11032*, UInt32),
    release : Proc(IDebugApplication11032*, UInt32),
    set_debugger_options : Proc(IDebugApplication11032*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS, Win32cr::Foundation::HRESULT),
    get_current_debugger_options : Proc(IDebugApplication11032*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS*, Win32cr::Foundation::HRESULT),
    get_main_thread : Proc(IDebugApplication11032*, Void**, Win32cr::Foundation::HRESULT),
    synchronous_call_in_main_thread : Proc(IDebugApplication11032*, Void*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    asynchronous_call_in_main_thread : Proc(IDebugApplication11032*, Void*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    callable_wait_for_handles : Proc(IDebugApplication11032*, UInt32, Win32cr::Foundation::HANDLE*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplication11032, lpVtbl : IDebugApplication11032Vtable* do
    GUID = LibC::GUID.new(0xbdb3b5de_u32, 0x89f2_u16, 0x4e11_u16, StaticArray[0x84_u8, 0xa5_u8, 0x97_u8, 0x44_u8, 0x5f_u8, 0x94_u8, 0x1c_u8, 0x7d_u8])
    def query_interface(this : IDebugApplication11032*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplication11032*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplication11032*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_debugger_options(this : IDebugApplication11032*, mask : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS, value : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_debugger_options.call(this, mask, value)
    end
    def get_current_debugger_options(this : IDebugApplication11032*, pCurrentOptions : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_debugger_options.call(this, pCurrentOptions)
    end
    def get_main_thread(this : IDebugApplication11032*, ppThread : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_thread.call(this, ppThread)
    end
    def synchronous_call_in_main_thread(this : IDebugApplication11032*, pptc : Void*, dwParam1 : LibC::UIntPtrT, dwParam2 : LibC::UIntPtrT, dwParam3 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronous_call_in_main_thread.call(this, pptc, dwParam1, dwParam2, dwParam3)
    end
    def asynchronous_call_in_main_thread(this : IDebugApplication11032*, pptc : Void*, dwParam1 : LibC::UIntPtrT, dwParam2 : LibC::UIntPtrT, dwParam3 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.asynchronous_call_in_main_thread.call(this, pptc, dwParam1, dwParam2, dwParam3)
    end
    def callable_wait_for_handles(this : IDebugApplication11032*, handleCount : UInt32, pHandles : Win32cr::Foundation::HANDLE*, pIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.callable_wait_for_handles.call(this, handleCount, pHandles, pIndex)
    end

  end

  @[Extern]

  record IDebugApplication11064Vtable,
    query_interface : Proc(IDebugApplication11064*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplication11064*, UInt32),
    release : Proc(IDebugApplication11064*, UInt32),
    set_debugger_options : Proc(IDebugApplication11064*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS, Win32cr::Foundation::HRESULT),
    get_current_debugger_options : Proc(IDebugApplication11064*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS*, Win32cr::Foundation::HRESULT),
    get_main_thread : Proc(IDebugApplication11064*, Void**, Win32cr::Foundation::HRESULT),
    synchronous_call_in_main_thread : Proc(IDebugApplication11064*, Void*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    asynchronous_call_in_main_thread : Proc(IDebugApplication11064*, Void*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    callable_wait_for_handles : Proc(IDebugApplication11064*, UInt32, Win32cr::Foundation::HANDLE*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplication11064, lpVtbl : IDebugApplication11064Vtable* do
    GUID = LibC::GUID.new(0x2039d958_u32, 0x4eeb_u16, 0x496a_u16, StaticArray[0x87_u8, 0xbb_u8, 0x2e_u8, 0x52_u8, 0x1_u8, 0xea_u8, 0xde_u8, 0xef_u8])
    def query_interface(this : IDebugApplication11064*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplication11064*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplication11064*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_debugger_options(this : IDebugApplication11064*, mask : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS, value : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_debugger_options.call(this, mask, value)
    end
    def get_current_debugger_options(this : IDebugApplication11064*, pCurrentOptions : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_DEBUGGER_OPTIONS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_debugger_options.call(this, pCurrentOptions)
    end
    def get_main_thread(this : IDebugApplication11064*, ppThread : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_thread.call(this, ppThread)
    end
    def synchronous_call_in_main_thread(this : IDebugApplication11064*, pptc : Void*, dwParam1 : LibC::UIntPtrT, dwParam2 : LibC::UIntPtrT, dwParam3 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronous_call_in_main_thread.call(this, pptc, dwParam1, dwParam2, dwParam3)
    end
    def asynchronous_call_in_main_thread(this : IDebugApplication11064*, pptc : Void*, dwParam1 : LibC::UIntPtrT, dwParam2 : LibC::UIntPtrT, dwParam3 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.asynchronous_call_in_main_thread.call(this, pptc, dwParam1, dwParam2, dwParam3)
    end
    def callable_wait_for_handles(this : IDebugApplication11064*, handleCount : UInt32, pHandles : Win32cr::Foundation::HANDLE*, pIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.callable_wait_for_handles.call(this, handleCount, pHandles, pIndex)
    end

  end

  @[Extern]

  record IWebAppDiagnosticsObjectInitializationVtable,
    query_interface : Proc(IWebAppDiagnosticsObjectInitialization*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebAppDiagnosticsObjectInitialization*, UInt32),
    release : Proc(IWebAppDiagnosticsObjectInitialization*, UInt32),
    initialize__ : Proc(IWebAppDiagnosticsObjectInitialization*, Win32cr::Foundation::HANDLE_PTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebAppDiagnosticsObjectInitialization, lpVtbl : IWebAppDiagnosticsObjectInitializationVtable* do
    GUID = LibC::GUID.new(0x16ff3a42_u32, 0xa5f5_u16, 0x432b_u16, StaticArray[0xb6_u8, 0x25_u8, 0x8e_u8, 0x8e_u8, 0x16_u8, 0xf5_u8, 0x7e_u8, 0x15_u8])
    def query_interface(this : IWebAppDiagnosticsObjectInitialization*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebAppDiagnosticsObjectInitialization*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebAppDiagnosticsObjectInitialization*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWebAppDiagnosticsObjectInitialization*, hPassedHandle : Win32cr::Foundation::HANDLE_PTR, pDebugApplication : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, hPassedHandle, pDebugApplication)
    end

  end

  @[Extern]

  record IActiveScriptWinRTErrorDebugVtable,
    query_interface : Proc(IActiveScriptWinRTErrorDebug*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptWinRTErrorDebug*, UInt32),
    release : Proc(IActiveScriptWinRTErrorDebug*, UInt32),
    get_exception_info : Proc(IActiveScriptWinRTErrorDebug*, Win32cr::System::Com::EXCEPINFO*, Win32cr::Foundation::HRESULT),
    get_source_position : Proc(IActiveScriptWinRTErrorDebug*, UInt32*, UInt32*, Int32*, Win32cr::Foundation::HRESULT),
    get_source_line_text : Proc(IActiveScriptWinRTErrorDebug*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restricted_error_string : Proc(IActiveScriptWinRTErrorDebug*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_restricted_error_reference : Proc(IActiveScriptWinRTErrorDebug*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_capability_sid : Proc(IActiveScriptWinRTErrorDebug*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptWinRTErrorDebug, lpVtbl : IActiveScriptWinRTErrorDebugVtable* do
    GUID = LibC::GUID.new(0x73a3f82a_u32, 0xfe9_u16, 0x4b33_u16, StaticArray[0xba_u8, 0x3b_u8, 0xfe_u8, 0x9_u8, 0x5f_u8, 0x69_u8, 0x7e_u8, 0xa_u8])
    def query_interface(this : IActiveScriptWinRTErrorDebug*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptWinRTErrorDebug*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptWinRTErrorDebug*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_exception_info(this : IActiveScriptWinRTErrorDebug*, pexcepinfo : Win32cr::System::Com::EXCEPINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exception_info.call(this, pexcepinfo)
    end
    def get_source_position(this : IActiveScriptWinRTErrorDebug*, pdwSourceContext : UInt32*, pulLineNumber : UInt32*, plCharacterPosition : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_position.call(this, pdwSourceContext, pulLineNumber, plCharacterPosition)
    end
    def get_source_line_text(this : IActiveScriptWinRTErrorDebug*, pbstrSourceLine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_line_text.call(this, pbstrSourceLine)
    end
    def get_restricted_error_string(this : IActiveScriptWinRTErrorDebug*, errorString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restricted_error_string.call(this, errorString)
    end
    def get_restricted_error_reference(this : IActiveScriptWinRTErrorDebug*, referenceString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restricted_error_reference.call(this, referenceString)
    end
    def get_capability_sid(this : IActiveScriptWinRTErrorDebug*, capabilitySid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capability_sid.call(this, capabilitySid)
    end

  end

  @[Extern]

  record IActiveScriptErrorDebug110Vtable,
    query_interface : Proc(IActiveScriptErrorDebug110*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveScriptErrorDebug110*, UInt32),
    release : Proc(IActiveScriptErrorDebug110*, UInt32),
    get_exception_thrown_kind : Proc(IActiveScriptErrorDebug110*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActiveScriptErrorDebug110, lpVtbl : IActiveScriptErrorDebug110Vtable* do
    GUID = LibC::GUID.new(0x516e42b6_u32, 0x89a8_u16, 0x4530_u16, StaticArray[0x93_u8, 0x7b_u8, 0x5f_u8, 0x7_u8, 0x8_u8, 0x43_u8, 0x14_u8, 0x42_u8])
    def query_interface(this : IActiveScriptErrorDebug110*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveScriptErrorDebug110*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveScriptErrorDebug110*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_exception_thrown_kind(this : IActiveScriptErrorDebug110*, pExceptionKind : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exception_thrown_kind.call(this, pExceptionKind)
    end

  end

  @[Extern]

  record IDebugApplicationThreadEvents110Vtable,
    query_interface : Proc(IDebugApplicationThreadEvents110*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplicationThreadEvents110*, UInt32),
    release : Proc(IDebugApplicationThreadEvents110*, UInt32),
    on_suspend_for_break_point : Proc(IDebugApplicationThreadEvents110*, Win32cr::Foundation::HRESULT),
    on_resume_from_break_point : Proc(IDebugApplicationThreadEvents110*, Win32cr::Foundation::HRESULT),
    on_thread_request_complete : Proc(IDebugApplicationThreadEvents110*, Win32cr::Foundation::HRESULT),
    on_begin_thread_request : Proc(IDebugApplicationThreadEvents110*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplicationThreadEvents110, lpVtbl : IDebugApplicationThreadEvents110Vtable* do
    GUID = LibC::GUID.new(0x84e5e468_u32, 0xd5da_u16, 0x48a8_u16, StaticArray[0x83_u8, 0xf4_u8, 0x40_u8, 0x36_u8, 0x64_u8, 0x29_u8, 0x0_u8, 0x7b_u8])
    def query_interface(this : IDebugApplicationThreadEvents110*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplicationThreadEvents110*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplicationThreadEvents110*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_suspend_for_break_point(this : IDebugApplicationThreadEvents110*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_suspend_for_break_point.call(this)
    end
    def on_resume_from_break_point(this : IDebugApplicationThreadEvents110*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_resume_from_break_point.call(this)
    end
    def on_thread_request_complete(this : IDebugApplicationThreadEvents110*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_request_complete.call(this)
    end
    def on_begin_thread_request(this : IDebugApplicationThreadEvents110*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_begin_thread_request.call(this)
    end

  end

  @[Extern]

  record IDebugApplicationThread11032Vtable,
    query_interface : Proc(IDebugApplicationThread11032*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplicationThread11032*, UInt32),
    release : Proc(IDebugApplicationThread11032*, UInt32),
    get_active_thread_request_count : Proc(IDebugApplicationThread11032*, UInt32*, Win32cr::Foundation::HRESULT),
    is_suspended_for_break_point : Proc(IDebugApplicationThread11032*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_thread_callable : Proc(IDebugApplicationThread11032*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    asynchronous_call_into_thread : Proc(IDebugApplicationThread11032*, Void*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplicationThread11032, lpVtbl : IDebugApplicationThread11032Vtable* do
    GUID = LibC::GUID.new(0x2194ac5c_u32, 0x6561_u16, 0x404a_u16, StaticArray[0xa2_u8, 0xe9_u8, 0xf5_u8, 0x7d_u8, 0x72_u8, 0xde_u8, 0x37_u8, 0x2_u8])
    def query_interface(this : IDebugApplicationThread11032*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplicationThread11032*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplicationThread11032*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_active_thread_request_count(this : IDebugApplicationThread11032*, puiThreadRequests : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_thread_request_count.call(this, puiThreadRequests)
    end
    def is_suspended_for_break_point(this : IDebugApplicationThread11032*, pfIsSuspended : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_suspended_for_break_point.call(this, pfIsSuspended)
    end
    def is_thread_callable(this : IDebugApplicationThread11032*, pfIsCallable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_thread_callable.call(this, pfIsCallable)
    end
    def asynchronous_call_into_thread(this : IDebugApplicationThread11032*, pptc : Void*, dwParam1 : LibC::UIntPtrT, dwParam2 : LibC::UIntPtrT, dwParam3 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.asynchronous_call_into_thread.call(this, pptc, dwParam1, dwParam2, dwParam3)
    end

  end

  @[Extern]

  record IDebugApplicationThread11064Vtable,
    query_interface : Proc(IDebugApplicationThread11064*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugApplicationThread11064*, UInt32),
    release : Proc(IDebugApplicationThread11064*, UInt32),
    get_active_thread_request_count : Proc(IDebugApplicationThread11064*, UInt32*, Win32cr::Foundation::HRESULT),
    is_suspended_for_break_point : Proc(IDebugApplicationThread11064*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_thread_callable : Proc(IDebugApplicationThread11064*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    asynchronous_call_into_thread : Proc(IDebugApplicationThread11064*, Void*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugApplicationThread11064, lpVtbl : IDebugApplicationThread11064Vtable* do
    GUID = LibC::GUID.new(0x420aa4cc_u32, 0xefd8_u16, 0x4dac_u16, StaticArray[0x98_u8, 0x3b_u8, 0x47_u8, 0x12_u8, 0x78_u8, 0x26_u8, 0x91_u8, 0x7d_u8])
    def query_interface(this : IDebugApplicationThread11064*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugApplicationThread11064*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugApplicationThread11064*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_active_thread_request_count(this : IDebugApplicationThread11064*, puiThreadRequests : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_thread_request_count.call(this, puiThreadRequests)
    end
    def is_suspended_for_break_point(this : IDebugApplicationThread11064*, pfIsSuspended : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_suspended_for_break_point.call(this, pfIsSuspended)
    end
    def is_thread_callable(this : IDebugApplicationThread11064*, pfIsCallable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_thread_callable.call(this, pfIsCallable)
    end
    def asynchronous_call_into_thread(this : IDebugApplicationThread11064*, pptc : Void*, dwParam1 : LibC::UIntPtrT, dwParam2 : LibC::UIntPtrT, dwParam3 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.asynchronous_call_into_thread.call(this, pptc, dwParam1, dwParam2, dwParam3)
    end

  end

  @[Extern]

  record IRemoteDebugCriticalErrorEvent110Vtable,
    query_interface : Proc(IRemoteDebugCriticalErrorEvent110*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDebugCriticalErrorEvent110*, UInt32),
    release : Proc(IRemoteDebugCriticalErrorEvent110*, UInt32),
    get_error_info : Proc(IRemoteDebugCriticalErrorEvent110*, Win32cr::Foundation::BSTR*, Int32*, Win32cr::Foundation::BSTR*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRemoteDebugCriticalErrorEvent110, lpVtbl : IRemoteDebugCriticalErrorEvent110Vtable* do
    GUID = LibC::GUID.new(0x2f69c611_u32, 0x6b14_u16, 0x47e8_u16, StaticArray[0x92_u8, 0x60_u8, 0x4b_u8, 0xb7_u8, 0xc5_u8, 0x2f_u8, 0x50_u8, 0x4b_u8])
    def query_interface(this : IRemoteDebugCriticalErrorEvent110*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDebugCriticalErrorEvent110*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDebugCriticalErrorEvent110*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_error_info(this : IRemoteDebugCriticalErrorEvent110*, pbstrSource : Win32cr::Foundation::BSTR*, pMessageId : Int32*, pbstrMessage : Win32cr::Foundation::BSTR*, ppLocation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_info.call(this, pbstrSource, pMessageId, pbstrMessage, ppLocation)
    end

  end

  @[Extern]

  record IScriptInvocationContextVtable,
    query_interface : Proc(IScriptInvocationContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScriptInvocationContext*, UInt32),
    release : Proc(IScriptInvocationContext*, UInt32),
    get_context_type : Proc(IScriptInvocationContext*, Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_INVOCATION_CONTEXT_TYPE*, Win32cr::Foundation::HRESULT),
    get_context_description : Proc(IScriptInvocationContext*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_context_object : Proc(IScriptInvocationContext*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IScriptInvocationContext, lpVtbl : IScriptInvocationContextVtable* do
    GUID = LibC::GUID.new(0x5d7741b7_u32, 0xaf7e_u16, 0x4a2a_u16, StaticArray[0x85_u8, 0xe5_u8, 0xc7_u8, 0x7f_u8, 0x4d_u8, 0x6_u8, 0x59_u8, 0xfb_u8])
    def query_interface(this : IScriptInvocationContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScriptInvocationContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScriptInvocationContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_context_type(this : IScriptInvocationContext*, pInvocationContextType : Win32cr::System::Diagnostics::Debug::ActiveScript::SCRIPT_INVOCATION_CONTEXT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_type.call(this, pInvocationContextType)
    end
    def get_context_description(this : IScriptInvocationContext*, pDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_description.call(this, pDescription)
    end
    def get_context_object(this : IScriptInvocationContext*, ppContextObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_object.call(this, ppContextObject)
    end

  end

  @[Extern]

  record IDebugStackFrame110Vtable,
    query_interface : Proc(IDebugStackFrame110*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebugStackFrame110*, UInt32),
    release : Proc(IDebugStackFrame110*, UInt32),
    get_code_context : Proc(IDebugStackFrame110*, Void**, Win32cr::Foundation::HRESULT),
    get_description_string : Proc(IDebugStackFrame110*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_language_string : Proc(IDebugStackFrame110*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_thread : Proc(IDebugStackFrame110*, Void**, Win32cr::Foundation::HRESULT),
    get_debug_property : Proc(IDebugStackFrame110*, Void**, Win32cr::Foundation::HRESULT),
    get_stack_frame_type : Proc(IDebugStackFrame110*, Win32cr::System::Diagnostics::Debug::ActiveScript::DEBUG_STACKFRAME_TYPE*, Win32cr::Foundation::HRESULT),
    get_script_invocation_context : Proc(IDebugStackFrame110*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebugStackFrame110, lpVtbl : IDebugStackFrame110Vtable* do
    GUID = LibC::GUID.new(0x4b509611_u32, 0xb6ea_u16, 0x4b24_u16, StaticArray[0xad_u8, 0xcb_u8, 0xd0_u8, 0xcc_u8, 0xfd_u8, 0x1a_u8, 0x7e_u8, 0x33_u8])
    def query_interface(this : IDebugStackFrame110*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebugStackFrame110*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebugStackFrame110*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_code_context(this : IDebugStackFrame110*, ppcc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_context.call(this, ppcc)
    end
    def get_description_string(this : IDebugStackFrame110*, fLong : Win32cr::Foundation::BOOL, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description_string.call(this, fLong, pbstrDescription)
    end
    def get_language_string(this : IDebugStackFrame110*, fLong : Win32cr::Foundation::BOOL, pbstrLanguage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_string.call(this, fLong, pbstrLanguage)
    end
    def get_thread(this : IDebugStackFrame110*, ppat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread.call(this, ppat)
    end
    def get_debug_property(this : IDebugStackFrame110*, ppDebugProp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_debug_property.call(this, ppDebugProp)
    end
    def get_stack_frame_type(this : IDebugStackFrame110*, pStackFrameKind : Win32cr::System::Diagnostics::Debug::ActiveScript::DEBUG_STACKFRAME_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stack_frame_type.call(this, pStackFrameKind)
    end
    def get_script_invocation_context(this : IDebugStackFrame110*, ppInvocationContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_invocation_context.call(this, ppInvocationContext)
    end

  end

  @[Extern]

  record IRemoteDebugInfoEvent110Vtable,
    query_interface : Proc(IRemoteDebugInfoEvent110*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteDebugInfoEvent110*, UInt32),
    release : Proc(IRemoteDebugInfoEvent110*, UInt32),
    get_event_info : Proc(IRemoteDebugInfoEvent110*, Win32cr::System::Diagnostics::Debug::ActiveScript::DEBUG_EVENT_INFO_TYPE*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRemoteDebugInfoEvent110, lpVtbl : IRemoteDebugInfoEvent110Vtable* do
    GUID = LibC::GUID.new(0x9ff56bb6_u32, 0xeb89_u16, 0x4c0f_u16, StaticArray[0x88_u8, 0x23_u8, 0xcc_u8, 0x2a_u8, 0x4c_u8, 0xb_u8, 0x7f_u8, 0x26_u8])
    def query_interface(this : IRemoteDebugInfoEvent110*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteDebugInfoEvent110*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteDebugInfoEvent110*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_event_info(this : IRemoteDebugInfoEvent110*, pMessageType : Win32cr::System::Diagnostics::Debug::ActiveScript::DEBUG_EVENT_INFO_TYPE*, pbstrMessage : Win32cr::Foundation::BSTR*, pbstrUrl : Win32cr::Foundation::BSTR*, ppLocation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_info.call(this, pMessageType, pbstrMessage, pbstrUrl, ppLocation)
    end

  end

  @[Extern]

  record IJsDebugVtable,
    query_interface : Proc(IJsDebug*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IJsDebug*, UInt32),
    release : Proc(IJsDebug*, UInt32),
    open_virtual_process : Proc(IJsDebug*, UInt32, UInt64, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IJsDebug, lpVtbl : IJsDebugVtable* do
    GUID = LibC::GUID.new(0xbe0e89da_u32, 0x2ac5_u16, 0x4c04_u16, StaticArray[0xac_u8, 0x5e_u8, 0x59_u8, 0x95_u8, 0x6a_u8, 0xae_u8, 0x36_u8, 0x13_u8])
    def query_interface(this : IJsDebug*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IJsDebug*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IJsDebug*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open_virtual_process(this : IJsDebug*, processId : UInt32, runtimeJsBaseAddress : UInt64, pDataTarget : Void*, ppProcess : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_virtual_process.call(this, processId, runtimeJsBaseAddress, pDataTarget, ppProcess)
    end

  end

  @[Extern]

  record IJsDebugProcessVtable,
    query_interface : Proc(IJsDebugProcess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IJsDebugProcess*, UInt32),
    release : Proc(IJsDebugProcess*, UInt32),
    create_stack_walker : Proc(IJsDebugProcess*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_break_point : Proc(IJsDebugProcess*, UInt64, UInt32, UInt32, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    perform_async_break : Proc(IJsDebugProcess*, UInt32, Win32cr::Foundation::HRESULT),
    get_external_step_address : Proc(IJsDebugProcess*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IJsDebugProcess, lpVtbl : IJsDebugProcessVtable* do
    GUID = LibC::GUID.new(0x3d587168_u32, 0x6a2d_u16, 0x4041_u16, StaticArray[0xbd_u8, 0x3b_u8, 0xd_u8, 0xe6_u8, 0x74_u8, 0x50_u8, 0x28_u8, 0x62_u8])
    def query_interface(this : IJsDebugProcess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IJsDebugProcess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IJsDebugProcess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_stack_walker(this : IJsDebugProcess*, threadId : UInt32, ppStackWalker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stack_walker.call(this, threadId, ppStackWalker)
    end
    def create_break_point(this : IJsDebugProcess*, documentId : UInt64, characterOffset : UInt32, characterCount : UInt32, isEnabled : Win32cr::Foundation::BOOL, ppDebugBreakPoint : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_break_point.call(this, documentId, characterOffset, characterCount, isEnabled, ppDebugBreakPoint)
    end
    def perform_async_break(this : IJsDebugProcess*, threadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.perform_async_break.call(this, threadId)
    end
    def get_external_step_address(this : IJsDebugProcess*, pCodeAddress : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_external_step_address.call(this, pCodeAddress)
    end

  end

  @[Extern]

  record IJsDebugStackWalkerVtable,
    query_interface : Proc(IJsDebugStackWalker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IJsDebugStackWalker*, UInt32),
    release : Proc(IJsDebugStackWalker*, UInt32),
    get_next : Proc(IJsDebugStackWalker*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IJsDebugStackWalker, lpVtbl : IJsDebugStackWalkerVtable* do
    GUID = LibC::GUID.new(0xdb24b094_u32, 0x73c4_u16, 0x456c_u16, StaticArray[0xa4_u8, 0xec_u8, 0xe9_u8, 0xe_u8, 0xa0_u8, 0xb_u8, 0xdf_u8, 0xe3_u8])
    def query_interface(this : IJsDebugStackWalker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IJsDebugStackWalker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IJsDebugStackWalker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_next(this : IJsDebugStackWalker*, ppFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next.call(this, ppFrame)
    end

  end

  @[Extern]

  record IJsDebugFrameVtable,
    query_interface : Proc(IJsDebugFrame*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IJsDebugFrame*, UInt32),
    release : Proc(IJsDebugFrame*, UInt32),
    get_stack_range : Proc(IJsDebugFrame*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IJsDebugFrame*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_document_position_with_id : Proc(IJsDebugFrame*, UInt64*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_document_position_with_name : Proc(IJsDebugFrame*, Win32cr::Foundation::BSTR*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_debug_property : Proc(IJsDebugFrame*, Void**, Win32cr::Foundation::HRESULT),
    get_return_address : Proc(IJsDebugFrame*, UInt64*, Win32cr::Foundation::HRESULT),
    evaluate : Proc(IJsDebugFrame*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IJsDebugFrame, lpVtbl : IJsDebugFrameVtable* do
    GUID = LibC::GUID.new(0xc9196637_u32, 0xab9d_u16, 0x44b2_u16, StaticArray[0xba_u8, 0xd2_u8, 0x13_u8, 0xb9_u8, 0x5b_u8, 0x3f_u8, 0x39_u8, 0xe_u8])
    def query_interface(this : IJsDebugFrame*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IJsDebugFrame*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IJsDebugFrame*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_stack_range(this : IJsDebugFrame*, pStart : UInt64*, pEnd : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stack_range.call(this, pStart, pEnd)
    end
    def get_name(this : IJsDebugFrame*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pName)
    end
    def get_document_position_with_id(this : IJsDebugFrame*, pDocumentId : UInt64*, pCharacterOffset : UInt32*, pStatementCharCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_position_with_id.call(this, pDocumentId, pCharacterOffset, pStatementCharCount)
    end
    def get_document_position_with_name(this : IJsDebugFrame*, pDocumentName : Win32cr::Foundation::BSTR*, pLine : UInt32*, pColumn : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_position_with_name.call(this, pDocumentName, pLine, pColumn)
    end
    def get_debug_property(this : IJsDebugFrame*, ppDebugProperty : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_debug_property.call(this, ppDebugProperty)
    end
    def get_return_address(this : IJsDebugFrame*, pReturnAddress : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_return_address.call(this, pReturnAddress)
    end
    def evaluate(this : IJsDebugFrame*, pExpressionText : Win32cr::Foundation::PWSTR, ppDebugProperty : Void**, pError : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.evaluate.call(this, pExpressionText, ppDebugProperty, pError)
    end

  end

  @[Extern]

  record IJsDebugPropertyVtable,
    query_interface : Proc(IJsDebugProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IJsDebugProperty*, UInt32),
    release : Proc(IJsDebugProperty*, UInt32),
    get_property_info : Proc(IJsDebugProperty*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::JsDebugPropertyInfo*, Win32cr::Foundation::HRESULT),
    get_members : Proc(IJsDebugProperty*, Win32cr::System::Diagnostics::Debug::ActiveScript::JS_PROPERTY_MEMBERS, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IJsDebugProperty, lpVtbl : IJsDebugPropertyVtable* do
    GUID = LibC::GUID.new(0xf8ffcf2b_u32, 0x3aa4_u16, 0x4320_u16, StaticArray[0x85_u8, 0xc3_u8, 0x52_u8, 0xa3_u8, 0x12_u8, 0xba_u8, 0x96_u8, 0x33_u8])
    def query_interface(this : IJsDebugProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IJsDebugProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IJsDebugProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_info(this : IJsDebugProperty*, nRadix : UInt32, pPropertyInfo : Win32cr::System::Diagnostics::Debug::ActiveScript::JsDebugPropertyInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_info.call(this, nRadix, pPropertyInfo)
    end
    def get_members(this : IJsDebugProperty*, members : Win32cr::System::Diagnostics::Debug::ActiveScript::JS_PROPERTY_MEMBERS, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_members.call(this, members, ppEnum)
    end

  end

  @[Extern]

  record IJsEnumDebugPropertyVtable,
    query_interface : Proc(IJsEnumDebugProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IJsEnumDebugProperty*, UInt32),
    release : Proc(IJsEnumDebugProperty*, UInt32),
    next__ : Proc(IJsEnumDebugProperty*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_count : Proc(IJsEnumDebugProperty*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IJsEnumDebugProperty, lpVtbl : IJsEnumDebugPropertyVtable* do
    GUID = LibC::GUID.new(0x4092432f_u32, 0x2f0f_u16, 0x4fe1_u16, StaticArray[0xb6_u8, 0x38_u8, 0x5b_u8, 0x74_u8, 0xa5_u8, 0x2c_u8, 0xdc_u8, 0xbe_u8])
    def query_interface(this : IJsEnumDebugProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IJsEnumDebugProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IJsEnumDebugProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IJsEnumDebugProperty*, count : UInt32, ppDebugProperty : Void**, pActualCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, count, ppDebugProperty, pActualCount)
    end
    def get_count(this : IJsEnumDebugProperty*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pCount)
    end

  end

  @[Extern]

  record IJsDebugBreakPointVtable,
    query_interface : Proc(IJsDebugBreakPoint*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IJsDebugBreakPoint*, UInt32),
    release : Proc(IJsDebugBreakPoint*, UInt32),
    is_enabled : Proc(IJsDebugBreakPoint*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    enable : Proc(IJsDebugBreakPoint*, Win32cr::Foundation::HRESULT),
    disable : Proc(IJsDebugBreakPoint*, Win32cr::Foundation::HRESULT),
    delete : Proc(IJsDebugBreakPoint*, Win32cr::Foundation::HRESULT),
    get_document_position : Proc(IJsDebugBreakPoint*, UInt64*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IJsDebugBreakPoint, lpVtbl : IJsDebugBreakPointVtable* do
    GUID = LibC::GUID.new(0xdf6773e3_u32, 0xed8d_u16, 0x488b_u16, StaticArray[0x8a_u8, 0x3e_u8, 0x58_u8, 0x12_u8, 0x57_u8, 0x7d_u8, 0x15_u8, 0x42_u8])
    def query_interface(this : IJsDebugBreakPoint*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IJsDebugBreakPoint*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IJsDebugBreakPoint*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_enabled(this : IJsDebugBreakPoint*, pIsEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_enabled.call(this, pIsEnabled)
    end
    def enable(this : IJsDebugBreakPoint*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this)
    end
    def disable(this : IJsDebugBreakPoint*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable.call(this)
    end
    def delete(this : IJsDebugBreakPoint*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_document_position(this : IJsDebugBreakPoint*, pDocumentId : UInt64*, pCharacterOffset : UInt32*, pStatementCharCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_position.call(this, pDocumentId, pCharacterOffset, pStatementCharCount)
    end

  end

  @[Extern]

  record IEnumJsStackFramesVtable,
    query_interface : Proc(IEnumJsStackFrames*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumJsStackFrames*, UInt32),
    release : Proc(IEnumJsStackFrames*, UInt32),
    next__ : Proc(IEnumJsStackFrames*, UInt32, Win32cr::System::Diagnostics::Debug::ActiveScript::JS_NATIVE_FRAME*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumJsStackFrames*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumJsStackFrames, lpVtbl : IEnumJsStackFramesVtable* do
    GUID = LibC::GUID.new(0x5e7da34b_u32, 0xfb51_u16, 0x4791_u16, StaticArray[0xab_u8, 0xe7_u8, 0xcb_u8, 0x5b_u8, 0xdf_u8, 0x41_u8, 0x97_u8, 0x55_u8])
    def query_interface(this : IEnumJsStackFrames*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumJsStackFrames*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumJsStackFrames*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumJsStackFrames*, cFrameCount : UInt32, pFrames : Win32cr::System::Diagnostics::Debug::ActiveScript::JS_NATIVE_FRAME*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cFrameCount, pFrames, pcFetched)
    end
    def reset(this : IEnumJsStackFrames*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]

  record IJsDebugDataTargetVtable,
    query_interface : Proc(IJsDebugDataTarget*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IJsDebugDataTarget*, UInt32),
    release : Proc(IJsDebugDataTarget*, UInt32),
    read_memory : Proc(IJsDebugDataTarget*, UInt64, Win32cr::System::Diagnostics::Debug::ActiveScript::JsDebugReadMemoryFlags, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write_memory : Proc(IJsDebugDataTarget*, UInt64, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    allocate_virtual_memory : Proc(IJsDebugDataTarget*, UInt64, UInt32, UInt32, UInt32, UInt64*, Win32cr::Foundation::HRESULT),
    free_virtual_memory : Proc(IJsDebugDataTarget*, UInt64, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_tls_value : Proc(IJsDebugDataTarget*, UInt32, UInt32, UInt64*, Win32cr::Foundation::HRESULT),
    read_bstr : Proc(IJsDebugDataTarget*, UInt64, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    read_null_terminated_string : Proc(IJsDebugDataTarget*, UInt64, UInt16, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_stack_frame_enumerator : Proc(IJsDebugDataTarget*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(IJsDebugDataTarget*, UInt32, UInt32, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IJsDebugDataTarget, lpVtbl : IJsDebugDataTargetVtable* do
    GUID = LibC::GUID.new(0x53b28977_u32, 0x53a1_u16, 0x48e5_u16, StaticArray[0x90_u8, 0x0_u8, 0x5d_u8, 0xd_u8, 0xfa_u8, 0x89_u8, 0x39_u8, 0x31_u8])
    def query_interface(this : IJsDebugDataTarget*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IJsDebugDataTarget*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IJsDebugDataTarget*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read_memory(this : IJsDebugDataTarget*, address : UInt64, flags : Win32cr::System::Diagnostics::Debug::ActiveScript::JsDebugReadMemoryFlags, pBuffer : UInt8*, size : UInt32, pBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_memory.call(this, address, flags, pBuffer, size, pBytesRead)
    end
    def write_memory(this : IJsDebugDataTarget*, address : UInt64, pMemory : UInt8*, size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_memory.call(this, address, pMemory, size)
    end
    def allocate_virtual_memory(this : IJsDebugDataTarget*, address : UInt64, size : UInt32, allocationType : UInt32, pageProtection : UInt32, pAllocatedAddress : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_virtual_memory.call(this, address, size, allocationType, pageProtection, pAllocatedAddress)
    end
    def free_virtual_memory(this : IJsDebugDataTarget*, address : UInt64, size : UInt32, freeType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_virtual_memory.call(this, address, size, freeType)
    end
    def get_tls_value(this : IJsDebugDataTarget*, threadId : UInt32, tlsIndex : UInt32, pValue : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tls_value.call(this, threadId, tlsIndex, pValue)
    end
    def read_bstr(this : IJsDebugDataTarget*, address : UInt64, pString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_bstr.call(this, address, pString)
    end
    def read_null_terminated_string(this : IJsDebugDataTarget*, address : UInt64, characterSize : UInt16, maxCharacters : UInt32, pString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_null_terminated_string.call(this, address, characterSize, maxCharacters, pString)
    end
    def create_stack_frame_enumerator(this : IJsDebugDataTarget*, threadId : UInt32, ppEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stack_frame_enumerator.call(this, threadId, ppEnumerator)
    end
    def get_thread_context(this : IJsDebugDataTarget*, threadId : UInt32, contextFlags : UInt32, contextSize : UInt32, pContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, contextFlags, contextSize, pContext)
    end

  end

end